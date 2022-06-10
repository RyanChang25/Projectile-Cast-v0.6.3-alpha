## API Documentation

### **Client Side API**

#### `ProjectileCast.Client.CastSingle({})`

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
Sound = 168143115}) -->>: Sound ID of gun shot. (Default: 168143115)

-- You are not required to use all index properties of the table when using .CastSingle() method.
-- Use whichever index property you see fit in your situation.
```

#### `ProjectileCast.Client.CastMultiple({})`

Property indexs are the same as the `.CastSingle({})` method except multiple projectiles will be fired at once.

#### `ProjectileCast.Client.SetIgnoreList({})`

```lua
-- Example Code
ProjectileCast.Client.SetIgnoreList({Character, workspace.Camera, workspace.IgnorePartFolder, (...)})
```

Sets a list of instances that the raycast from the projectile will ignore.

#### `ProjectileCast.Client.SetBulletParent()`

```lua
-- Example Code
ProjectileCast.Client.SetBulletParent(workspace.MyBulletFolder)
```

Sets the parent of the projectile objects. Default will be `workspace.Camera`

### **Server Side API**

#### `ProjectileCast.TargetSettings.SetTaggedTargets({})`

```lua
-- Example Code
ProjectileCast.TargetSettings.SetTaggedTargets({"Zombie", "Fast Zombie", "Wizard Zombie", (...)})
```

This will set the tagged targets the projectile will deal damage to.
