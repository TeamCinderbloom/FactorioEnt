local entAsTree = table.deepcopy(data.raw["tree"]["dead-tree-desert"]);
entAsTree.name = "ent-tree";

local entEnemy = table.deepcopy(data.raw["unit"]["behemoth-biter"]);
entEnemy.name = "ent-enemy";

local entEggProjectile = table.deepcopy(data.raw["projectile"]["grenade"]);
entEggProjectile.name = "ent-egg-projectile";
entEggProjectile.action = 
{
  type = "direct",
  action_delivery = 
  {
    type = "instant",
    target_effects = 
    {
      {
        type = "create-entity",
        entity_name = "grenade-explosion"
      },
      {
        type = "create-entity",
        entity_name = "ent-tree"
      }
      
    }
  }   
}

local entEgg = table.deepcopy(data.raw["capsule"]["grenade"]);
entEgg.name = "ent-spawn-egg";
entEgg.capsule_action = 
{
  type = "throw",
  attack_parameters = 
  {
    type = "projectile",
    range = 20,
    cooldown = 10,
    ammo_category = "grenade",
    ammo_type =
    {
      target_type = "position",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "ent-egg-projectile",
          starting_speed = 0.3
        }
      }
    }
  }
}

local entEggRecipe = 
{
  type = "recipe",
  name = "ent-spawn-egg",
  localised_name = "Ent spawn egg",
  enabled = true,
  energy_required = 0.5,
  results = {{type = "item", name = "ent-spawn-egg", amount = 1}}
};

data:extend{entAsTree, entEnemy, entEgg, entEggProjectile, entEggRecipe};