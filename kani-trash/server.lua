local createStashes = function()
    for index,data in pairs(Config.Trashes) do
        exports.ox_inventory:RegisterStash("kani-trash:"..index, "Kosz", 50, 100000, false, nil, nil)    
    end
end

RegisterServerEvent("kani-trash:clearInventory")
AddEventHandler("kani-trash:clearInventory", function(id)
    exports.ox_inventory:ClearInventory(id, nil)
end)

CreateThread(function()
    createStashes()
end)