## Getting Started

The basic usage of Projectile Cast is very simple because most of the tinkering is already done under the hood, so very little code is required to get started.

However, there is one thing that should be noted before we begin. This module relies on the `CollectionService` to set and get the Tags from targets. This means you will need to tag your targets for the module to work. You could manually do it, but I personally use this [Tag Editor plugin](https://www.roblox.com/library/948084095/Tag-Editor) which I **highly recommend.**

The most basic usage would look as such:

1. Create a Server Script in `ServerScriptService`

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProjectileCast = require(ReplicatedStorage.ProjectileCast)

ProjectileCast.Server.SetRemotes() -->>: Initializes remotes needed for server-client communication

ProjectileCast.TargetSettings.SetTaggedTargets({"ExampleTarget1", "ExampleTarget2"}) -->>: Replace my ExampleTargets with your own tagged targets.
```

2. Create a local Script in `StarterPlayer\StarterPlayerScripts`

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProjectileCast = require(ReplicatedStorage.ProjectileCast)
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Mouse = Player:GetMouse()

ProjectileCast.Client.Init()

ProjectileCast.Client.SetIgnoreList({Character, workspace.CurrentCamera})

Mouse.Button1Down:Connect(function(gameProcessed)
    if gameProcessed then return end
    ProjectileCast.Client.CastSingle({
        StartPoint = Character.Head, -->>: StartPoint of bullet instance
        EndPoint = Mouse.Hit.Position}) -->>: EndPoint of bullet instance

    -->>: Startpoint, and Endpoint is required for the .CastSingle() method to function.
end)
```

And that's it! The Projectile Cast should have instanced a bullet object from your characters head that flies towards your mouse position.

This pretty much concludes the basic functionality of Projectile Cast, but the fun doesn't end here! If you're interested, I have the API documentation with some code examples in `/docs` of thie repository.