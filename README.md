[![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/Ryanisawesome25.svg?style=social&label=Follow%20%40Ryanisawesome25)](https://twitter.com/Ryanisawesome25)

# Projectile Cast v0.4.1

\*_Note: (This module is currently in its early phase, so expect bugs and breaking changes.)_

**Projectile Cast** is a open-sourced module I developed for all your projectile needs! It uses OOP, Raycasting, and a physics algorithm to implement a very smooth projectile drop. The API also allows its projectiles to be highly customizable, and have interchangeable properties on the go.

## Installation

The installation process is very simple! All you have to do is grab the module and drop it into the Replicated Storage.

_Roblox Studio workflow_:

1. Get [Projectile Cast](https://www.roblox.com/library/9866876932/Projectile-Cast) from the Roblox library.
2. Add it into your project, and drop the module into the Replicated Storage.
3. **All done!**

## Getting Started

The basic usage of Projectile Cast is very simple because most of the tinkering is already done under the hood, so very little code is required to get started.

However, there is one thing that should be noted before we begin. This module relies on the `CollectionService` to set and get the Tags from targets. This means you will need to tag your targets for the module to work. You could manually do it, but I personally use this [Tag Editor plugin](https://www.roblox.com/library/948084095/Tag-Editor) which I **highly recommend.**

The most basic usage would look as such:

1. Create a Server Script in `ServerScriptService`

_(You can also use the ServerMain Script in the /Examples folder in v0.4.1 and above.)_

```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProjectileCast = require(ReplicatedStorage.ProjectileCast)

ProjectileCast.Server.SetRemotes() -->>: Initializes remotes needed for server-client communication

ProjectileCast.TargetSettings.SetTaggedTargets({"ExampleTarget1", "ExampleTarget2"}) -->>: Replace my ExampleTargets with your own tagged targets.
```

2. Create a local Script in `StarterPlayer\StarterPlayerScripts`

_(You can also use the ClientMain Localscript in the /Examples folder in v0.4.1 and above.)_

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

    -->>: Startpoint, and Endpoint is required for the .CastSingle({}) method to function.

end)
```

And that's it! The Projectile Cast should have instanced a bullet object from your characters head that flies towards your mouse position.

This pretty much concludes the basic functionality of Projectile Cast, but the fun doesn't end here! If you're interested, I have the API documentation with some code examples in `/docs` of thie repository.
