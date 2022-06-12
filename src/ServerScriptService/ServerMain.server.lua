local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProjectileCast = require(ReplicatedStorage.ProjectileCast)

ProjectileCast.Server.SetRemotes()

ProjectileCast.TargetSettings.SetTaggedTargets({"ExampleTarget1", "ExampleTarget2"})
