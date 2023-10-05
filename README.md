# Damage-System-Demo

Includes playable Demo

# Provides 3 components as Scenes. 
Drag these Components into your Player, Enemy, Weapons, etc Scenes as needed. Make local if you need to change the shape sizes.

`Hurtbox` - Takes Damage from DamageAreas and sends it to the HealthComponent. Is automatically put on HURTBOX_LAYER defined in Global. 

`DamageArea` - Interacts with Hurtboxes. Needs a Damage Resource. Put it on Weapons, Environmental Hazards etc. Uses HURTBOX_LAYER automatically as mask.

`HealthComponent` - Provides Hitpoints for your Entities. Does automatic basic damage calculations ( hitpoints-= damage) but can also be configured to let the parent do custom damage logic. Emits damage Signal for use in parent. Can be configured to ignore certain Damage Types via White/Blacklist.



# Provides 1 Resource.

`Damage` - Has some predefined Damage Types and a damage value.
