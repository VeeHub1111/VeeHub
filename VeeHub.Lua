local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Player = game.Players.LocalPlayer
local Window = OrionLib:MakeWindow({Name = "KeySystem", HidePremium = false, SaveConfig = true, IntroEnabled = false})

OrionLib:MakeNotification({
	Name = "Logged in!",
	Content = "you are Logged in as "..Player.Name.." ",
	Image = "rbxassetid://4483345998",
	Time = 5
})

_G.Key = "VeeHub-112244"
_G.KeyInput = "string"

function MakeScriptHub()
   loadstring(game:HttpGet(("https://raw.githubusercontent.com/VeeHub1111/VeeHub/main/VeeHub1.Lua")))
end

function CorrectKeyNotification()
   OrionLib:MakeNotification({
	   Name = "Correct Key!",
	   Content = "Correct Key!",
	I  mage = "rbxassetid://4483345998",
	   Time = 5
   })
end

function IncorrectKeyNotification()
   OrionLib:MakeNotification({
	   Name = "Incorrect Key!",
	   Content = "Incorrect Key!",
	I  mage = "rbxassetid://4483345998",
	   Time = 5
   })
end

local Tab = Window:MakeTab({
	Name = "KeySystem",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "Enter Key",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		_G.KeyInput = Value
        
	end	  
})

Tab:AddButton({
	Name = "Check!",
	Callback = function()
      	if _G.KeyInput == _G.Key then
        MakeScriptHub()
        CorrectKeyNotification()
        else
            CorrectKeyNotification()
        end
  	end    
})

Tab:AddButton({
	Name = "Get Key!",
	Callback = function()
      	MakeScriptHub()
  	end    
})
