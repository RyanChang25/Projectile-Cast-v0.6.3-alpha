local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProjectileCast = require(ReplicatedStorage.ProjectileCast)
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Mouse = Player:GetMouse()

ProjectileCast.Client.Init()

Mouse.Button1Down:Connect(function(gameProcessed)
    if gameProcessed then return end
    ProjectileCast.Client.CastSingle({
        StartPoint = Character.Head, 
        EndPoint = Mouse.Hit.Position, 
        Damage = 10, 
        Velocity = 5, 
        Drop = 0.025})
end)