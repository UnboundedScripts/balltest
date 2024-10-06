print("Jim the Normal Ball Script")

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Jim the normal ball 🐥" .. Fluent.Version,
    SubTitle = "by UnboundedScripts",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

-- Fluent provides Lucide Icons, they are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Toggle = Tabs.Main:AddToggle("MyToggle", 
{
    Title = "Kill Boss", 
    Description = "Automatically TP to balls to kill boss and kill them. ⚠ TOGGLE DOES NOT WORK ATM",
    Default = false,
    Callback = function(state)
	if state then
        while true do
        loadstring(game:HttpGet(""))()
	    print("🔪 🔛")
        end
	else
	    print("Toggle Off")
        end
    end 
})

Tabs.Main:AddButton({
    Title = "🔃 Rejoin Server",
    Description = "Will rejoin you back to here",
    Callback = function()
    loadstring(game:HttpGet(""))()
    end
})

Tabs.Main:AddButton({
    Title = "🏠 | Go to ball test home",
    Description = "Takes you back to starting point",
    Callback = function()
    local Teleport = game:GetService("TeleportService")
    local GameID = 15869837051
    local Players = game.Players.LocalPlayer
    Teleport:Teleport(GameID, Players)
    end
})