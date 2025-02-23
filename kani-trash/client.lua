local createTargets = function()
    for index,data in pairs(Config.Trashes) do
        local id = "kani-trash:"..index
        exports.ox_target:addBoxZone({
            name = id,
            coords = data.coords,
            size = data.size,
            rotation = data.rotation,
            options = {
                {
                    label = "Otwórz Kosz",
                    icon = "fa-solid fa-trash",
                    distance = 2.0,
                    groups = data.groups,
                    onSelect = function()
                        exports.ox_inventory:openInventory("stash", { id = id })
                    end
                },
                {
                    label = "Wyczyść Kosz",
                    icon = "fa-solid fa-trash",
                    distance = 2.0,
                    groups = data.groups,
                    onSelect = function()
                        TriggerServerEvent("kani-trash:clearInventory", id)
                    end
                }
            }
        })        
    end
end

CreateThread(function()
    createTargets()
end)