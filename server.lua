local net = require("internet")
local component = require("component")

local lsc = component.proxy("a23389cb-2e68-4eab-a610-92cdc7b52808")

-- Check for LSC
if !lsc() then
    print("No LSC connected")
    return 0
end

-- start server

local con = net.open("localhost",6667)

if(con) then
    local TEU = lsc.getEUCapacityString()
    local SEU = lsc.getEUStored()
    local IEU = lsc.getEUInputAverage()
    local OEU = lsc.getEUOutputAverage()
    while(true) do
        con:write(TEU)
        con:write(SEU)
        con:write(IEU)
        con:write(OEU)
        os.sleep(1)
    end
end