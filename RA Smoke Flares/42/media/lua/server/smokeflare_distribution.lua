---@diagnostic disable: undefined-global
-- Gun Stores
if getSandboxOptions():getOptionByName("SmokeFlare.EnableGunStoreSpawn"):getValue() then
    table.insert(ProceduralDistributions.list["GunStoreShelf"].items, "Base.SmokeFlare");
    table.insert(ProceduralDistributions.list["GunStoreShelf"].items,
        getSandboxOptions():getOptionByName("SmokeFlare.GunStoreSpawnChance"):getValue());
end

-- Zombies (police outfits only)
if getSandboxOptions():getOptionByName("SmokeFlare.EnableZombieSpawn"):getValue() then
    local chance = getSandboxOptions():getOptionByName("SmokeFlare.ZombieSpawnChance"):getValue();
    local policeOutfits = {
        "Outfit_Police", "Outfit_PoliceState", "Outfit_Detective",
        "Outfit_ArmyCamoDesert", "Outfit_ArmyCamoGreen", "Outfit_PrivateMilitia", "Outfit_Ranger",
    };

    for _, outfit in ipairs(policeOutfits) do
        if SuburbsDistributions["all"][outfit] then
            table.insert(SuburbsDistributions["all"][outfit].items, "Base.SmokeFlare");
            table.insert(SuburbsDistributions["all"][outfit].items, chance);
        end
    end
end
