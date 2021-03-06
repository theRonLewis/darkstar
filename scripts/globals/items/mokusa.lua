-----------------------------------------
-- ID: 18451
-- Item: Mokusa
-- Additional Effect: Wind Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 5;

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local dmg = math.random(4,19);
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        dmg = addBonusesAbility(player, ELE_WIND, target, dmg, params);
        dmg = dmg * applyResistanceAddEffect(player,target,ELE_WIND,0);
        dmg = adjustForTarget(target,dmg,ELE_WIND);
        dmg = finalMagicNonSpellAdjustments(player,target,ELE_WIND,dmg);

        local message = 163;
        if (dmg < 0) then
            message = 167;
        end

        return SUBEFFECT_WIND_DAMAGE,message,dmg;
    end
end;