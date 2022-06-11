local Debris = game:GetService("Debris")
local TargetSettings = require(script.Parent.TargetSettings)
local bulletIgnoreList = {}
local destroy = {}
local bullets = {}
local bulletParent
local Client = {}
Client.__index = Client

function Client.CastSingle(projectileTable)
	script.Parent.Assets:WaitForChild("Remotes"):WaitForChild("MouseEvent"):FireServer(projectileTable)
end

function Client.CastMultiple(projectileTable) 
	for i = -4, 4, (2) do -->>: We do this to spread the bullets apart by 2 studs
		local shotgunWrap = coroutine.wrap(function()	
			projectileTable.XOffset = i
			script.Parent.Assets:WaitForChild("Remotes"):WaitForChild("MouseEvent"):FireServer(projectileTable)
		end) ()
	end
end

function Client.newProj(plr, projectileTable) -->>: Create projectile object

	local origin = CFrame.new(projectileTable.StartPoint.Position + Vector3.new(0,(projectileTable.YOffset or 0),0) + 
		projectileTable.StartPoint.CFrame.lookVector * (projectileTable.ZOffset or -1), 
		projectileTable.EndPoint) * CFrame.Angles(0,math.rad(projectileTable.XOffset or 0),0) 

	local bulletComp = {}
	bulletComp.velocity = projectileTable.Velocity or 3
	bulletComp.drop = projectileTable.Drop or 0.005
	bulletComp.laps = 0
	bulletComp.oldposition = origin
	bulletComp.position = origin
	bulletComp.despawn = tick() + (projectileTable.Despawn or 3)
	bulletComp.character = plr.Character
	bulletComp.damage = projectileTable.Damage or 5
	bulletComp.hit = false
	bulletComp.emitDebris = projectileTable.EmitDebris or 3
	
	bulletComp.bullet = projectileTable.Bullet ~= nil and projectileTable.Bullet:Clone() or script.Parent.Assets.FX:WaitForChild("Bullet"):Clone()
	bulletComp.bullet.Parent = bulletParent
	
	bulletComp.decal = projectileTable.Decal or 4784881970
	bulletComp.ignoreList = bulletIgnoreList

	table.insert(bullets, bulletComp)

	return setmetatable(bulletComp, Client)
end

function Client:WeldBulletHole(newray, color, id)

	local hit, pos, normal = workspace:FindPartOnRayWithIgnoreList(newray, self.ignoreList)

	local bulletPart = Client.createBulletHole(id):Clone()
	bulletPart.CFrame = CFrame.new(pos, pos + normal)
	
	local particle = script.Parent.Assets.FX:WaitForChild("ImpactParticle"):Clone()
	particle.Parent = bulletPart
	particle.Color = ColorSequence.new(color)
	particle:Emit(self.emitDebris)
	
	local Weld = Instance.new("Weld")
	Weld.Part0 = hit
	Weld.Part1 = bulletPart
	Weld.C0 = hit.CFrame:Inverse()
	Weld.C1 = bulletPart.CFrame:Inverse()
	Weld.Parent = bulletPart
	
	bulletPart.Parent = bulletParent
	
	Debris:AddItem(bulletPart, 10)

end

function Client.createBulletHole(id)

	local bulletHole = Instance.new("Part")
	bulletHole.Size = Vector3.new(1, 1, 0.01)
	bulletHole.Anchored = false
	bulletHole.CanCollide = false
	bulletHole.Transparency = 1
	bulletHole.Name = "BulletHole"
	
	local bulletholedecal = Instance.new("Decal", bulletHole)
	bulletholedecal.Face = "Front"
	bulletholedecal.Texture = "http://www.roblox.com/asset/?id="..tostring(id)

	return bulletHole	
end

function Client.updateBullets(s)

	for i,v in pairs(destroy) do
		v:Destroy()
	end

	destroy = {}

	local remove = {}

	for i,bullet in pairs(Client.getProjTable()) do
	
		bullet.laps = bullet.laps + 1 -->>: How many times the bullet has been rendered
		bullet.position = bullet.position * CFrame.new(0, 0, -bullet.velocity*s) + Vector3.new(0, -bullet.drop*s * bullet.laps, 0)
		-->>: Sets next position as current position then move it forward by velocity amount multiplied by the ratioed delta time
		-->>: We then use vector 3 to lowered the bullet based on the drop property. We use laps so it iteratively moves down more over time.
		
		local bul = bullet.bullet
		local distance = (bullet.oldposition.p - bullet.position.p).magnitude
		-->>: Gets the old position to look at the new position so we can CFrame it to the right orientation
		bul.CFrame = CFrame.new(bullet.oldposition.p, bullet.position.p) * CFrame.new(0,0, -distance * 0.5)
		-->>: Moves it forward half the distance so its in the middle of where the ray will be so its in the right place
		-->>: Want the bullet to be in the middle of the ray since thats where the ray will be checking if it hit anything
		
		local newray = Ray.new(bullet.oldposition.p, (bullet.position.p - bullet.oldposition.p).unit * distance)
		-->>: Creates a ray pointing in direction of the old position to the new position with the distance already defined
		
		local hit = workspace:FindPartOnRayWithIgnoreList(newray, bulletIgnoreList)

		if hit and not bullet.hit then
			
			bullet.hit = true

			if TargetSettings.GetTaggedTargets(hit) then
				if game.Players.LocalPlayer.Character == bullet.character then	
					task.delay(0, function ()
						script.Parent.Assets:WaitForChild("Remotes"):WaitForChild("DamageEvent"):FireServer(hit, bullet.damage)
					end)
				end
				bullet:WeldBulletHole(newray, Color3.new(1, 0.203922, 0.203922), bullet.decal)
			else
				bullet:WeldBulletHole(newray, hit.Color, bullet.decal)
			end
	
			table.insert(destroy, bullet.bullet)
			table.insert(remove, i) --/tag bullet for removal

		else
			bullet.oldposition = bullet.position
			if tick() > bullet.despawn then
				table.insert(destroy, bullet.bullet) -- Tag bullet for destruction
				table.insert(remove, i) -- Remove bullet for destruction
			end	
		end

	end
	
	for i, iteration in pairs(remove) do -- Remove tagged bullets
		table.remove(Client.getProjTable(), iteration-i+1)
	end

end

function Client.getProjTable()
	return bullets
end

function Client.SetIgnoreList(list)
	bulletIgnoreList = list
end

function Client.SetBulletParent(parent)
	bulletParent = parent
	table.insert(bulletIgnoreList, parent)
end

function Client.Init()
	
	bulletParent = workspace.Camera

	script.Parent.Assets:WaitForChild("Remotes"):WaitForChild("RenderEvent").OnClientEvent:Connect(function(plr, projectileTable)
		Client.newProj(plr, projectileTable)
	end)
	
	game:GetService("RunService").RenderStepped:Connect(function(deltaT) 
		local ratio = 60 / (1/deltaT) -- Fixed time step for independent framerate
		Client.updateBullets(ratio)
	end)
	
end

return Client
