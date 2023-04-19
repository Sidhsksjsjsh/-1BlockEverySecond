local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local T1 = Window:MakeTab({
Name = "farm",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Gems shop",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Misc",
Icon = "rbxassetid://",
PremiumOnly = false
})

T1:AddToggle({
    Name = "Auto place block",
    Default = false,
    Callback = function(Value)
        _G.Block = Value
        
        while _G.Block do
        if _G.Block == false then break end
        wait(0)
        game:GetService("ReplicatedStorage").Remotes.PlaceBlock:FireServer()
        end
   end    
})

T1:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(Value)
        _G.Rebirth = Value
        
        while _G.Rebirth do
        if _G.Rebirth == false then break end
        wait(0)
        local args = {
    [1] = "RebirthShop"
}

game:GetService("ReplicatedStorage").Remotes.Rebirth:InvokeServer(unpack(args))
        end
   end    
})

T3:AddToggle({
    Name = "Auto equip best (pet)",
    Default = false,
    Callback = function(Value)
        _G.BestPet = Value
        
        while _G.BestPet do
        if _G.BestPet == false then break end
        wait(0)
        local args = {
    [1] = "Equip Best"
}

game:GetService("ReplicatedStorage").RemoteEvents.PetActionRequest:InvokeServer(unpack(args))
        end
   end    
})

T3:AddToggle({
    Name = "Spam trade 😂",
    Default = false,
    Callback = function(Value)
        _G.Trade = Value
        
        while _G.Trade do
        if _G.Trade == false then break end
        wait(0)
        for _,v in pairs(game.Players:GetPlayers()) do
        game:GetService("ReplicatedStorage").Remotes.TradeNotification:FireServer(v.Name)
        end
        end
   end    
})

T3:AddButton({
   Name = "Teleport to home",
   Callback = function()
       game:GetService("ReplicatedStorage").Remotes.TeleportHome:InvokeServer()
  end    
})

T2:AddDropdown({
   Name = "select item",
   Default = "1",
   Options = {"GemEgg", "SpeedBoost","BlocksBoost","LuckyBoost"},
   Callback = function(Value)
       _G.ItemSelected = Value
   end    
})

T2:AddToggle({
    Name = "Auto buy selected item",
    Default = false,
    Callback = function(Value)
        _G.GItem = Value
        
        while _G.GItem do
        if _G.GItem == false then break end
        wait(0)
        local args = {
    [1] = _G.ItemSelected
}

game:GetService("ReplicatedStorage").Remotes.BuyGemShopItem:FireServer(unpack(args))
        end
   end    
})

T2:AddToggle({
    Name = "Auto buy all",
    Default = false,
    Callback = function(Value)
        _G.GAll = Value
        
        while _G.Block do
        if _G.GAll == false then break end
        wait(0)
        game:GetService("ReplicatedStorage").Remotes.BuyGemShopItem:FireServer("GemEgg")
game:GetService("ReplicatedStorage").Remotes.BuyGemShopItem:FireServer("LuckyBoost")
game:GetService("ReplicatedStorage").Remotes.BuyGemShopItem:FireServer("BlocksBoost")
game:GetService("ReplicatedStorage").Remotes.BuyGemShopItem:FireServer("SpeedBoost")
        end
   end    
})
