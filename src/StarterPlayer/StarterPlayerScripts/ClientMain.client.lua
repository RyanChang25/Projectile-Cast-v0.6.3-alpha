local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProjectileCast = require(ReplicatedStorage.ProjectileCast)
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Mouse = Player:GetMouse()

ProjectileCast.Client.Init()

ProjectileCast.Client.SetIgnoreList({Character, workspace.CurrentCamera})

ProjectileCast.Client.SetBulletParent(workspace.BulletFolder)

Mouse.Button1Down:Connect(function(gameProcessed)
    if gameProcessed then return end
    ProjectileCast.Client.CastSingle({StartPoint = Character.Head, EndPoint = Mouse.Hit.Position}) -->>: Startpoint, and Endpoint is required.

    -->>: Allows you to customize your projectiles further. If you're interested look at the table documentation below!
    -->>: {StartPoint, EndPoint, Damage, Velocity, Drop, Despawn, XOffset, YOffset, ZOffset, Decal, Bullet, Sound}
end)