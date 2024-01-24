local props = {}

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        for k,v in pairs(props) do
            DeleteObject(v)
        end
    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.Props) do
        props[#props + 1] = CreateObject(v.propnum, v.coords.x, v.coords.y, v.coords.z, v.network, v.MissionEntity)
        SetEntityHeading(props[#props], v.coords.w)
        FreezeEntityPosition(props[#props],v.freeze)
    end
end)
  
