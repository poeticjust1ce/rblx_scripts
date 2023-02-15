repeat task.wait() until game:IsLoaded()
-- config
getgenv().Config = {
    Webhook = "https://discord.com/api/webhooks/1075041501081518222/YQfYqa-0QcyElS-5-42fVUrW2txFY78DS8zLrbMxoPJ60OJZ_i994QyP-oAwLZ8yMpel",
    ServerHop = true,
    AutoTween = false,
    IgnoredFruits = {"Spike Fruit"} -- not working atm
}

-- functions

function Notify(fruits)

    local date = DateTime.now():FormatLocalTime("MMM/D/YY HH:mm", "en-US")
    local server = game.JobId

    syn.request({
        Url = getgenv().Config.Webhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            ["content"] = "**Yani Supremacy**",
            ["embeds"] = {{
                ["title"] = "**Fruit Notify v1**",
                ["color"] = tonumber(0x813bb3),
                ["fields"] = {
                    {
                        ["name"] = "『🔎』Found Fruits ↴",
                        ["value"] = "```arm\n"..table.concat(fruits, "\n").."\n```",
                        ["inline"] = true
          
                    },
                    {
                        ["name"] = "『🔗』Server Link ↴",
                        ["value"] = "**EXTENSION NEEDED**\n[Roblox URL Launcher](https://chrome.google.com/webstore/detail/roblox-url-launcher/lcefjaknjehbafdeacjbjnfpfldjdlcc?hl=en)\n\n"
                        .."**SERVER LINK**\n"
                        .."[JOIN GAME](https://www.roblox.com/home?placeId=7449423635&gameId="
                        ..server
                        ..")",
                        ["inline"] = true
              
                    },
                    {
                        ["name"] = "『📜』Join Script ↴",
                        ["value"] = "```lua\n"
                        .."game.ReplicatedStorage['__ServerBrowser']:InvokeServer('teleport','"
                        ..server
                        .."')"
                        .."\n```",
                        ["inline"] = false
              
                    },
                },
                ["footer"] = {["text"] = date}
            }}
        })
    })

end

function FindFruit() 

    local FruitTable = {}

    for _, v in pairs(game.Workspace:GetChildren()) do
        if v.Name:find("Fruit") and v:IsA("Tool") then
            table.insert(FruitTable, v.Name)
        end

        if v:IsA("Model") and v.Name == "Fruit" then
           local c = v:GetDescendants()
           table.insert("Spawned Fruit".."["..table.concat(c, "/").."]")
        end
    end

    if table.getn(FruitTable) ~= 0 then
        Notify(FruitTable)
    end

end

function FruitEspOn()

    for i, v in pairs(workspace:GetChildren()) do
        if v:IsA("Tool")  then
            if v.Fruit then
                local BillboardGui = Instance.new("BillboardGui")
                local TextLabel = Instance.new("TextLabel")
                BillboardGui.Parent = v.Fruit
                BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                BillboardGui.Active = true
                BillboardGui.AlwaysOnTop = true
                BillboardGui.LightInfluence = 1
                BillboardGui.Size = UDim2.new(0, 100, 0, 25)
                TextLabel.Parent = BillboardGui
                TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                TextLabel.BackgroundTransparency = 1
                TextLabel.BorderSizePixel = 0
                TextLabel.Size = UDim2.new(0, 100, 0, 25)
                TextLabel.Font = Enum.Font.SourceSans
                TextLabel.Text = v.Name
                TextLabel.TextColor3 = Color3.new(0.215686, 1, 0.145098)
            end
        end

        if v:IsA("Model") and v.Name == "Fruit " then
          if v.Fruit then
                local BillboardGui = Instance.new("BillboardGui")
                local TextLabel = Instance.new("TextLabel")
                BillboardGui.Parent = v
                BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                BillboardGui.Active = true
                BillboardGui.AlwaysOnTop = true
                BillboardGui.LightInfluence = 1
                BillboardGui.Size = UDim2.new(0, 100, 0, 25)
                TextLabel.Parent = BillboardGui
                TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                TextLabel.BackgroundTransparency = 1
                TextLabel.BorderSizePixel = 0
                TextLabel.Size = UDim2.new(0, 100, 0, 25)
                TextLabel.Font = Enum.Font.SourceSans
                TextLabel.Text = "Spawned Fruit"
                TextLabel.TextColor3 = Color3.new(1, 0.941176, 0.145098)
                TextLabel.TextScaled = true
                TextLabel.TextSize = 14
                TextLabel.TextWrapped = true
            end
        end
    end

end

function FruitEspOff()
    for i , v in pairs (workspace:GetDescendants()) do
        if string.find(v.Name, "BillboardGui") then
            v:Destroy()
        end
    end
end

function ServerHop()
    local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()
    module:Teleport(game.PlaceId)
end

function StoreFruit()
    local plr = game.Players.LocalPlayer
    local char = plr.Character
    local fruit = char:FindFirstChildOfClass("Tool") 
    and char:FindFirstChildOfClass("Tool").Name:find("Fruit")
    and char:FindFirstChildOfClass("Tool")
    or (
            function()
                for _, v in pairs(plr.Backpack:GetChildren()) do 
                    if v.Name:find("Fruit") then
                        return v
                    end
                end
            end
        )()

    -- fires store fruit event
    if fruit then 
        game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("StoreFruit", fruit:GetAttribute("OriginalName"), fruit)
        print(fruit, "Stored!")
        else print("No fruit to store")
    end
end

function TweenToFruit(bool)
    local t = game:GetService("TweenService")
    local plr = game.Players.LocalPlayer
    local char = plr.Character

    -- body vel
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1/0, 1/0, 1/0)
    bv.Velocity = Vector3.new()
    bv.Name = "bV"

    -- body angular vel
    local bav = Instance.new("AngularVelocity")
    bav.AngularVelocity = Vector3.new()
    bav.MaxTorque = Vector3.new(1/0, 1/0, 1/0)
    bav.Name = "bAV"

    while bool do
        task.wait()
        for _, v in pairs(game.Workspace:GetChildren()) do
            if v.Name:find("Fruit") and v:IsA("Tool") then
                while v.Parent ~= game.Workspace do
                    local anc1 = bv:Clone()
                    anc1.Parent = char.HumanoidRootPart
                    local anc2 = bav:Clone()
                    anc2.Parent = char.HumanoidRootPart
                    local p = t:Create(char.HumanoidRootPart, TweenInfo.new((plr:DistanceFromCharacter(v.Handle.Position)-100)/320, Enum.EasingStyle.Linear), {CFrame=v.Handle.CFrame + Vector3.new(0, v.Handle.Size.Y, 0)})
                    p:Play()
                    p.Completed:Wait()
                    char.HumanoidRootPart.CFrame = v.Handle.CFrame
                    anc1:Destroy()
                    anc2:Destroy()                
                    task.wait()
                end
                StoreFruit()
            end
        end
    end
end

function TestWebhook()
    syn.request({
        Url = getgenv().Config.Webhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            ["content"] = nil,
            ["embeds"] = {{
                ["title"] = "✅ **Webhook is working!**",
                ["color"] = tonumber(0x813bb3)
            }}
        })
    })
end

-- ui 

local l = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/bleklib/main/library.lua"))()

local w = l:Create({
    Name = "Yani Hub",
    StartupSound = {
        Toggle = false,
        SoundID = "rbxassetid://4019147318",
        TimePosition = 1
    }
})

local maintab = w:Tab('Main')

maintab:Toggle('Fruit ESP', function(v)
    if v then 
        FruitEspOn()
    else
        FruitEspOff()
    end
end)

maintab:Toggle('Tween to Fruit', function(v)
    if v then
        TweenToFruit(true)
    else   
        TweenToFruit(false) 
    end
end)

maintab:Button('Server Hop', function()
    ServerHop()
end)

maintab:Button('Test Webhook', function()
    TestWebhook()
end)

maintab:Button('Close GUI', function()
    w:Exit()
end)

-- main code

FindFruit()

if getgenv().Config.AutoTween then
    TweenToFruit(true)
    ServerHop()
end

if getgenv().Config.ServerHop then
    ServerHop()
end
