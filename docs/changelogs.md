# Changelogs

## v0.6.3-alpha

- Fixed an `varargs` error in ProjectileCast.Client.lua.

- Updated OOP syntax to be inlined with industry standard practices.

- Added new index property `Color` in the `.CastSingle({})` method. Allows you to specify the color of the particles when hitting tagged targets.

## v0.5.2-alpha

- Fixed an Ray detection replicating issues.

- Added new method `Client.SetTargetFilter(targetFilter)` so specific targets will be ignored by the mouse when calculating Mouse.Hit and Mouse.Target

- Added new method `Client.VisualizeCasts(bool)` which allows you to visualize the ray casted (Will be performance heavy, so only turn on for debugging).

## v0.4.1-alpha

- Integrated into Roblox library for Roblox Studio workflow support.

## v0.4.0-alpha

- Added assets folder to hold FX, Remote Events, and Sounds for more convenient usage.

## v0.3.0-alpha

- Added new method to support multiple projectile casts.

- Added more customizable index properties for projectiles.

## v0.2.0-alpha

- Projectile Cast finally modularized and integrated as a stand alone module.

## v0.1.0-alpha

- Projectile Cast system was un-modularized, and was used with other game frameworks.
