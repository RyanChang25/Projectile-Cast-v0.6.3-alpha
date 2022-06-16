# API Documentation

## **Client Side API**

## Properties

## Functions

### [Void](https://developer.roblox.com/en-us/articles/Nil) Client.CastSingle({(...)})

```lua
-- Example Code
ProjectileCast.Client.CastSingle({
StartPoint = Character.Head, -->>: StartPoint of bullet instance
EndPoint = Mouse.Hit.Position, -->>: EndPoint of bullet instance
Damage = 10, -->>: Damage of bullet (Default: 5)
Velocity = 5, -->>: Velocity of bullet (Default: 3)
Drop = 0.005, -->>: Bullet Drop (Default: 0.015)
Despawn = 3, -->>: Despawn of the bullet (Default: 3)
XOffset = 0, -->>: X Offset of the bullet from origin point (Default: 0)
YOffset = 0, -->>: Y Offset of the bullet from origin point (Default: 0)
ZOffset = 0, -->>: Z Offset of the bullet from origin point (Default: 0)
Decal = 2859765706, -->>: Decal of bullet hole (Default: 4784881970)
Bullet = game.ReplicatedStorage.Bullet:Clone() , -->>: Get specific bullet model if applicable. (Default: Bullet within module)
Sound = 168143115 -->>: Sound ID of gun shot. (Default: 168143115)
Color = Color3.fromRGB(0, 55, 55)})  -->>: Color of particles when hitting target. (Default: Color3.fromRGB(255, 55, 55))

-- You are not required to use all index properties of the table when using .CastSingle() method.
-- So use whichever index property that fits in your situation.

```

### [Void](https://developer.roblox.com/en-us/articles/Nil) Client.CastMultiple({(...)})

Property indexs are the same as the `.CastSingle({(...)})` method except multiple projectiles will be fired at once.

### [Void](https://developer.roblox.com/en-us/articles/Nil) Client.SetIgnoreList({[Instance](https://developer.roblox.com/en-us/api-reference/datatype/Instance) IgnoreInstance, (...)})

Sets a list of instances that the raycast from the projectile will ignore.

### [Void](https://developer.roblox.com/en-us/articles/Nil) Client.SetBulletParent([Instance](https://developer.roblox.com/en-us/api-reference/datatype/Instance) Parent)

Sets the parent of the projectile objects. Default will be `workspace.Camera`

### [Void](https://developer.roblox.com/en-us/articles/Nil) Client.VisualizeCasts([Boolean](https://developer.roblox.com/en-us/articles/Boolean) Bool)

```lua
-- Example Code
ProjectileCast.Client.VisualizeCasts(true)
```

Allows you to visualize the ray casted (Will be performance heavy, so only turn on for debugging). Default will be false.

### [Void](https://developer.roblox.com/en-us/articles/Nil) Client.SetTargetFilter(targetFilter)

```lua
-- Example Code
ProjectileCast.Client.SetTargetFilter(workspace.Camera)
```

Allows you to specify targets that will be ignored by the mouse when calculating Mouse.Hit and Mouse.Target.

## **Server Side API**

### Properties

### [Void](https://developer.roblox.com/en-us/articles/Nil) TargetSettings.SetTaggedTargets({})

```lua
-- Example Code
ProjectileCast.TargetSettings.SetTaggedTargets({"Zombie", "Fast Zombie", "Wizard Zombie", (...)})
```

This will set the tagged targets the projectile will deal damage to.
