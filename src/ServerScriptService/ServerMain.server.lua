local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProjectileCast = require(ReplicatedStorage.ProjectileCast)

ProjectileCast.Server.SetRemotes()

ProjectileCast.TargetSettings.SetTaggedTargets({"Zombie", "Other Zombie"}) -->>: Requires you to have your targets tagged.
-->>: I personally use this Tag Editor plugin: https://www.roblox.com/library/948084095/Tag-Editor