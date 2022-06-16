local TargetSettings = require(script.Parent.TargetSettings)
local Debris = game:GetService("Debris")
local Players = game:GetService("Players")
local Server = {}

function Server.SetRemotes()

	local MouseEvent = script.Parent.Assets:WaitForChild("Remotes"):WaitForChild("MouseEvent")
	local RenderEvent = script.Parent.Assets:WaitForChild("Remotes"):WaitForChild("RenderEvent")
	local DamageEvent = script.Parent.Assets:WaitForChild("Remotes"):WaitForChild("DamageEvent")

	MouseEvent.OnServerEvent:Connect(function(plr, projectileTable)
		local GunShot = projectileTable.Sound ~= nil and projectileTable.Sound:Clone() or script.Parent.Assets.Sound.GunShot:Clone()
		GunShot.Parent = plr.Character.Head
		GunShot:Play()
		Debris:AddItem(GunShot, 1)
		RenderEvent:FireAllClients(plr, projectileTable)
	end)

	DamageEvent.OnServerEvent:Connect(function(plr, hit, damage)
		if hit ~= nil and TargetSettings.CheckHumanoid(hit):FindFirstChild("Humanoid") and TargetSettings.GetTaggedTargets(hit) then
			TargetSettings.CheckHumanoid(hit):FindFirstChild("Humanoid"):TakeDamage(damage)
		end
	end)

end

return Server
