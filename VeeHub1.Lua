local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

OrionLib:MakeNotification({
	Name = "VeeHub",
	Content = "VeeHub",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Window = OrionLib:MakeWindow({Name = "VeeHub", HidePremium = false, SaveConfig = true, ConfigFolder = "Orion"})

local dungeonTab = Window:MakeTab({
	Name = "dungeon",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local dungeonSection = dungeonTab:AddSection({
	Name = "Raids"
})

dungeonSection:AddToggle({
	Name = "Kill Aura",
	Default = false,
	Callback = function(Value)
	    KillAura = Value
	    while KillAura do wait()
	        pcall(function()
	            for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if v.ClassName == "Model" and v.Humanoid.Health > 0 then
                        v.Humanoid.Health = Die
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                    end
                end
            end)
        end
	end
})

dungeonSection:AddToggle({
	Name = "Auto Start Raids",
	Default = false,
	Callback = function(Value)
        AutoStart = Value
        
        while AutoStart do wait()
            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
        end
        
	end
})
DUNLIST = { 
    "Flame", "Ice", "Quake", "Light", "Dark", "Spider", "Rumble", "Magma", "Buddha", "Sand"
    }

dungeonSection:AddDropdown({
	Name = "Select Raids",
    Options  = DUNLIST,
    Default = "",
    Callback = function(value)
        SelectDun = value
    end
})

dungeonSection:AddToggle({
	Name = "Auto Buy Raids",
	Default = false,
	Callback = function(Value)
        AutoBuyRaids = Value
        
        while AutoBuyRaids do wait()
            
            local args = {
                [1] = "RaidsNpc",
                [2] = "Select",
                [3] = tostring(SelectDun)
            }
            
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

        end
        
	end
})

local SettingsTab = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local SettingsSection = SettingsTab:AddSection({
	Name = "Settings"
})

SettingsSection:AddButton({
	Name = "Destroy UI",
	Callback = function()
        OrionLib:Destroy()
  	end    
})
