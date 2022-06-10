# Code Examples

## Server Script

```lua
-->>: PLACE THIS IN SERVERSCRIPTSERVICE

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProjectileCast = require(ReplicatedStorage.ProjectileCast)

ProjectileCast.Server.SetRemotes()

ProjectileCast.TargetSettings.SetTaggedTargets({"ExampleTarget1", "ExampleTarget2"}) -->>: Requires you to have your targets tagged.

-->>: I personally use this Tag Editor plugin: https://www.roblox.com/library/948084095/Tag-Editor
```

## Client Script

```lua

-->>: PLACE THIS IN STARTERPLAYER/STARTERPLAYERSCRIPTS

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
```
