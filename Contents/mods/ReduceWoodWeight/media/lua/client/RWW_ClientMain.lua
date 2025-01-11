if not ReduceWoodWeight then ReduceWoodWeight = {} end

local REDUCE_PERCENTAGE = { 0.25, 0.5, 0.75 };

local function updateWeightProperty(itemType, reducePercentage)
    local item = ScriptManager.instance:getItem(itemType);

    if item ~= nil then
        local originalWeight = item:getActualWeight();
        local weightToReduce = originalWeight * reducePercentage;
        item:DoParam("Weight = "..(originalWeight - weightToReduce));

        return weightToReduce;
    end
end

local function updateSpearWeightProperty(itemType, weightToReduce)
    local item = ScriptManager.instance:getItem(itemType);

    if item ~= nil then
        local originalWeight = item:getActualWeight();
        item:DoParam("Weight = "..(originalWeight - weightToReduce));
    end
end

local function onGameBoot()
    local reducePercentage = REDUCE_PERCENTAGE[SandboxVars.ReduceWoodWeight.ReducePercentage];

    updateWeightProperty("Base.LogStacks2", reducePercentage);
    updateWeightProperty("Base.Log", reducePercentage);
    updateWeightProperty("Base.LogStacks3", reducePercentage);
    updateWeightProperty("Base.LogStacks4", reducePercentage);
    updateWeightProperty("Base.Plank", reducePercentage);
    updateWeightProperty("Base.PlankNail", reducePercentage);
    local spearWeightToReduce = updateWeightProperty("Base.TreeBranch", reducePercentage);
    updateWeightProperty("Base.UnusableWood", reducePercentage);

    updateSpearWeightProperty("Base.SpearBreadKnife", spearWeightToReduce);
    updateSpearWeightProperty("Base.SpearButterKnife", spearWeightToReduce);
    updateSpearWeightProperty("Base.SpearCrafted", spearWeightToReduce);
    updateSpearWeightProperty("Base.SpearFork", spearWeightToReduce);
    updateSpearWeightProperty("Base.SpearHandFork", spearWeightToReduce);
    updateSpearWeightProperty("Base.SpearHuntingKnife", spearWeightToReduce);
    updateSpearWeightProperty("Base.SpearIcePick", spearWeightToReduce);
    updateSpearWeightProperty("Base.SpearKnife", spearWeightToReduce);
    updateSpearWeightProperty("Base.SpearLetterOpener", spearWeightToReduce);
    updateSpearWeightProperty("Base.SpearMachete", spearWeightToReduce);
    updateSpearWeightProperty("Base.SpearScalpel", spearWeightToReduce);
    updateSpearWeightProperty("Base.SpearScissors", spearWeightToReduce);
    updateSpearWeightProperty("Base.SpearScrewdriver", spearWeightToReduce);
    updateSpearWeightProperty("Base.SpearSpoon", spearWeightToReduce);
end

Events.OnGameBoot.Add(onGameBoot)
