local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local http = game:GetService("HttpService")

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
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    Farm = Window:AddTab({ Title = "Farm", Icon = "" }),
    Webhook = Window:AddTab({ Title = "Webhook", Icon = "" })
}

Tabs.Main:AddButton({
    Title = "Kill Boss", 
    Description = "Automatically TP to balls to kill boss",
    Default = false,
    Callback = function(state)
        if state then
            while true do
                loadstring(game:HttpGet("https://raw.githubusercontent.com/UnboundedScripts/balltest/refs/heads/main/Functions/bosskill.lua"))()
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
        loadstring(game:HttpGet("https://raw.githubusercontent.com/UnboundedScripts/uscriptloader/refs/heads/main/Other/Instantrejoin.lua"))()
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

local function SendMessage(url, message)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = http:JSONEncode({content = message})
    })
    print("Sent")
end

local function SendMessageEMBED(url, embed)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = http:JSONEncode({
            embeds = {{
                title = embed.title,
                description = embed.description,
                color = embed.color,
                fields = embed.fields,
                footer = {text = embed.footer.text}
            }}
        })
    })
    print("The Webhook has been sent!")
end

-- Add an input field to change the webhook URL
local webhookUrl = ""
local Input = Tabs.Webhook:AddInput("Input", {
    Title = "Webhook URL",
    Description = "Enter your webhook URL",
    Default = webhookUrl,
    Placeholder = "Enter webhook URL here",
    Numeric = false, -- Only allows numbers
    Finished = true, -- Only calls callback when you press enter
    Callback = function(Value)
        webhookUrl = Value
        print("Webhook URL changed to:", webhookUrl)
    end
})

-- Add a button to the Webhook tab to send a test message
Tabs.Webhook:AddButton({
    Title = "Send Test Message",
    Description = "Sends a test message to the configured webhook",
    Callback = function()
        if webhookUrl ~= "" then
            SendMessageEMBED(webhookUrl, {
                title = "Test Message",
                description = "This is a test message from the Jim the Normal Ball Script!",
                color = 65280,
                fields = {},
                footer = {text = "Footer text"}
            })
        else
            print("Webhook URL is not set.")
        end
    end
})

local Toggle = Tab:AddToggle("Webhook", 
{
    Title = "Toggle", 
    Description = "Toggle description",
    Default = false,  -- Added comma here
    Callback = function(state)
        if state then
            print("Toggle On")
        else
            print("Toggle Off")
        end
    end 
})
