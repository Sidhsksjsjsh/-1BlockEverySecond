local library = loadstring(game:HttpGet("https://pastebin.com/raw/Uub92rmN"))()


local Window = library:AddWindow("Orin - Cheat",
    {
        main_color = Color3.fromRGB(0, 128, 0),
        min_size = Vector2.new(373, 433),
        toggle_key = Enum.KeyCode.RightShift,
    })
    
    local EggIndex = {}
    local workspace = game:GetService("Workspace")
    for _,IndexPet in pairs(workspace.Eggs:GetChildren()) do
          table.insert(EggIndex, IndexPet.Name)
    end
    
    function GetHighDataStats(NumberStats, statsname)
    if game.Players.LocalPlayer.leaderstats[statsname].Value > NumberStats then
       return true
    else
       return false
    end
    end
    
    function GetLowDataStats(Stats_4, statsstring)
    if game.Players.LocalPlayer.leaderstats[Stats_4].Value < statsstring then
       return true
    else
       return false
    end
    end
    
local T1 = Window:AddTab("Farm")
local T2 = Window:AddTab("Gems shop")
local T3 = Window:AddTab("Misc")
local T4 = Window:AddTab("Egg")
local T5 = Window:AddTab("Stats")

T5:AddLabel("Oops.. it seems that this tab is not accessible ☹️")

local TypicalItem = {
      EggGems = "GemEgg", -- 500
      Speed = "SpeedBoost", -- 1,000
      Blocks = "BlocksBoost", -- 600
      Luck = "LuckyBoost" -- 400
}

local DisplayCost = T2:AddConsole({
    ["y"] = 50,
    ["source"] = "",
})

function GetCostShop(ShopName)
if ShopName == "GemEgg" then
   if GetLowDataStats("Gems", 500) then
       game:GetService("ReplicatedStorage").Remotes.BuyGemShopItem:FireServer("GemEgg")
   else
       DisplayCost:Set("Not enough gems!")
   end
 end
 if ShopName == "SpeedBoost" then
   if GetLowDataStats("Gems", 1000) then
       game:GetService("ReplicatedStorage").Remotes.BuyGemShopItem:FireServer("SpeedBoost")
   else
       DisplayCost:Set("Not enough gems!")
   end
 end
 if ShopName == "BlocksBoost" then
   if GetLowDataStats("Gems", 600) then
       game:GetService("ReplicatedStorage").Remotes.BuyGemShopItem:FireServer("BlocksBoost")
   else
       DisplayCost:Set("Not enough gems!")
   end
 end
 if ShopName == "LuckyBoost" then
   if GetLowDataStats("Gems", 400) then
       game:GetService("ReplicatedStorage").Remotes.BuyGemShopItem:FireServer("LuckyBoost")
   else
       DisplayCost:Set("Not enough gems!")
   end
 end
 -- Function end
end

local Shop_A2 = T4:AddDropdown("Select Egg", function(Value)
       _G.EggSelected = Value
   end)

Shop_A2:Add(EggIndex)

T4:AddSwitch("auto hatch", function(Value)
        _G.EggHatch = Value
        
        while _G.EggHatch do
        if _G.EggHatch == false then break end
        wait(0)
        game:GetService("ReplicatedStorage").RemoteEvents.EggOpen:InvokeServer(_G.EggSelected,"Single")
        end
   end)

T1:AddSwitch("auto place block", function(Value)
        _G.Block = Value
        
        while _G.Block do
        if _G.Block == false then break end
        wait(0)
        game:GetService("ReplicatedStorage").Remotes.PlaceBlock:FireServer()
        end
   end)

T1:AddSwitch("Auto rebirth", function(Value)
        _G.Rebirth = Value
        
        while _G.Rebirth do
        if _G.Rebirth == false then break end
        wait(0)
        local args = {
    [1] = "RebirthShop"
}

game:GetService("ReplicatedStorage").Remotes.Rebirth:InvokeServer(unpack(args))
        end
   end)

T3:AddSwitch("auto equip best (PET)", function(Value)
        _G.BestPet = Value
        
        while _G.BestPet do
        if _G.BestPet == false then break end
        wait(0)
        local args = {
    [1] = "Equip Best"
}

game:GetService("ReplicatedStorage").RemoteEvents.PetActionRequest:InvokeServer(unpack(args))
        end
   end)

T3:AddSwitch("spam trade 😂", function(Value)
        _G.Trade = Value
        
        while _G.Trade do
        if _G.Trade == false then break end
        wait(0)
        for _,v in pairs(game.Players:GetPlayers()) do
        game:GetService("ReplicatedStorage").Remotes.TradeNotification:FireServer(v.Name)
        end
        end
   end)

T3:AddButton("Teleport", function()
       game:GetService("ReplicatedStorage").Remotes.TeleportHome:InvokeServer()
  end)

local Shop_A1 = T2:AddDropdown("Select Item / shop item", function(Value)
       _G.ItemSelected = Value
   end)

Shop_A1:Add("GemEgg")
Shop_A1:Add("SpeedBoost")
Shop_A1:Add("BlocksBoost")
Shop_A1:Add("LuckyBoost")

local TypicalItem = {
      EggGems = "GemEgg",
      Speed = "SpeedBoost",
      Blocks = "BlocksBoost",
      Luck = "LuckyBoost"
}

T2:AddSwitch("auto buy selected item", function(Value)
        _G.GItem = Value
        
        while _G.GItem do
        if _G.GItem == false then break end
        wait(0)
        GetCostShop(_G.ItemSelected)
        end
   end)

T2:AddSwitch("auto buy all", function(Value)
        _G.GAll = Value
        
        while _G.Block do
        if _G.GAll == false then break end
        wait(0)
        game:GetService("ReplicatedStorage").Remotes.BuyGemShopItem:FireServer("GemEgg")
game:GetService("ReplicatedStorage").Remotes.BuyGemShopItem:FireServer("LuckyBoost")
game:GetService("ReplicatedStorage").Remotes.BuyGemShopItem:FireServer("BlocksBoost")
game:GetService("ReplicatedStorage").Remotes.BuyGemShopItem:FireServer("SpeedBoost")
        end
   end)
