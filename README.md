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

The basic usage of Projectile Cast is very simple. Since most of the tinkering is already done under the hood, so very little code is required to get started.

However, there are few things that is required before we begin. This module relies on the CollectionService to set and get the Tags from targets. You could tag your targets manually, but I personally use this [Tag Editor plugin](https://www.roblox.com/library/948084095/Tag-Editor) (Highly recommend).

The most basic usage would look as such:

1. Create a Server Script in `ServerScriptService`

```
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProjectileCast = require(ReplicatedStorage.ProjectileCast)

ProjectileCast.Server.SetRemotes() -->>: Initializes remotes needed for server-client communication

ProjectileCast.TargetSettings.SetTaggedTargets({"Zombie", "Other Zombie"}) -->>: Add your tagged targets here

```
