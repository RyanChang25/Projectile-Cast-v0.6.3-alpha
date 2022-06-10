# Projectile Cast

\*_Note: (This module is currently in its early phase, so expect bugs.)_

`Projectile Cast` is a open-sourced module for all your projectile needs! It uses OOP, Raycasting, and a physics algorithm to implement a very smooth projectile drop. It is also highly customizable to your specific projecile needs, allowing you to change many factors of the projectile on the go.

## Installation

The installation process is very simple! All you have to do is grab the module and drop it into the Replicated Storage.

_Roblox Studio workflow_:

1. Get [Projectile Cast](https://www.roblox.com/library/9866876932/Projectile-Cast) from the Roblox library.
2. Add it into your project, and drop the module into the Replicated Storage.
3. **All done!**

## Basic Usage

The basic usage of Projectile Cast is very simple. Since most of the tinkering is already done under the hood, very little code is required to get started.

The most basic usage would look as such:

```
`Server Script in ServerScriptService`

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProjectileCast = require(ReplicatedStorage.ProjectileCast)

ProjectileCast.Server.SetRemotes() -->>: Initializes remotes needed for server-client communication

ProjectileCast.TargetSettings.SetTaggedTargets({"Zombie", "Other Zombie"}) -->>: Add your tagged targets here

-->>: I personally use this [Tag Editor plugin.](https://www.roblox.com/library/948084095/Tag-Editor)

```
