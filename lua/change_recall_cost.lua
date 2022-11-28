<< 
local cost_choice = wml.variables["aww_recall_zero_cost"]

for _, unit in ipairs(wesnoth.units.find_on_recall {}) do
    if unit.level == 0 then
        if cost_choice == "cost_plus_one" then
            unit.recall_cost = (1 + unit.cost)
        end
        if cost_choice == "half" then
            unit.recall_cost = 10
        end
        if cost_choice == "free" then
            unit.recall_cost = 0
        end
    end
end
>>
