-- // Services
local CoreGui = game:GetService('CoreGui')

-- // Imports
local Tween = Import('UI/Functions/Tween.lua')
local LoggingHandler = Import('Logging/LoggingHandler.lua')

local DestroyUIHandler = {}

function DestroyUIHandler.DestroyUI()
    LoggingHandler.Log('Destroy UI Called')

    if CoreGui:FindFirstChild('VisualAnalyser') then
        local UI = CoreGui:FindFirstChild('VisualAnalyser')

        Tween(UI.Base, {Size = UDim2.new(0, 0, 0, 0)}, 0.25)
        task.wait(0.25)

        UI.Base:Destroy()
        LoggingHandler.Log('UI Destroyed')

        Visual.Loaded = false 
        LoggingHandler.Log('Unloaded Visual Analyser')
    end
end

return DestroyUIHandler.DestroyUI