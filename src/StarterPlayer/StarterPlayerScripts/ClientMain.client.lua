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
    ProjectileCast.Client.CastSingle({StartPoint = Character.Head, EndPoint = Mouse.Hit.Position})
end)
