-- [[ SETTINGS ]] --
local serverhop = true
-- hook settings
local hs = game:GetService("HttpService")
local hook = "https://discord.com/api/webhooks/1072549955887177778/nHDYMofRK3R-wIUyN2eCgNwCS_CIhQ1PJSJjQ0o53M__RefPSyeiy-KvPX0MNSQ9aJfK"

-- fruits settings
local useList = false
local fruitList = {}

-- [[ END OF SETTINGS ]] --

-- [[ MAIN CODE ]] --
repeat
    task.wait()
until game.IsLoaded and (game.Players.LocalPlayer or game.Players.PlayerAdded:Wait()) and (game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait())

-- local vars
local plr = game.Players.LocalPlayer
local char = plr.Character
local b = plr.Backpack
local rem = game:GetService("ReplicatedStorage").Remotes["CommF_"]

-- tween vars
local t = game.TweenService

-- body vel
local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(1/0, 1/0, 1/0)
bv.Velocity = Vector3.new()
bv.Name = "bV"

-- body angular vel
local bav = Instance.new("BodyAngularVelocity")
bav.AngularVelocity = Vector3.new()
bav.MaxTorque = Vector3.new(1/0, 1/0, 1/0)
bav.Name = "bAV"

--[[ COOOOOOOOOOOODEEEEEEEEEEEEEEEEEEEEEE --]]

-- functions
function sendMessage(title, desc, color) -- must be hex
    syn.request({
        Url = hook,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = hs:JSONEncode({
            ['content'] = nil,
            ['embeds'] = {{
                ['title'] = title,
                ['description'] = tostring(desc),
                ['color'] = tonumber('0x'..color),
                ['footer'] = {['text'] = 'i love u yani'},
                ['thumbnail'] = {['url'] = selectImage(tostring(desc))}
            }}
        })
    })
end

function selectImage(fruit)
    if fruit == "Kilo Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/3/39/KiloNew.png"
    elseif fruit == "Spin Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/8/80/SpinNew.png"
    elseif fruit == "Chop Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/8/8e/ChopNew.png"
    elseif fruit == "Spring Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/3/3e/SpringNew.png"
    elseif fruit == "Bomb Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/f/fe/BombNew.png"
    elseif fruit == "Smoke Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/9/9a/SmokeNew.png"
    elseif fruit == "Spike Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/3/37/SpikeNew.png"
    elseif fruit == "Flame Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/c/c2/FlameNew.png"
    elseif fruit == "Bird: Falcon Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/a/a4/FalconNew.png"
    elseif fruit == "Ice Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/9/97/IceNew.png"
    elseif fruit == "Sand Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/4/43/SandNew.png"
    elseif fruit == "Dark Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/1/10/DarkNew.png"
    elseif fruit == "Revive Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/b/b0/ReviveNew.png"
    elseif fruit == "Diamond Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/d/dd/DiamondNew.png"
    elseif fruit == "Light Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/6/6c/LightNew.png"
    elseif fruit == "Love Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/6/65/LoveNew.png"
    elseif fruit == "Rubber Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/2/22/RubberNew.png"
    elseif fruit == "Barrier Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/8/8d/BarrierNew.png"
    elseif fruit == "Magma Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/7/74/MagmaNew.png"
    elseif fruit == "Quake Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/d/dc/QuakeNew.png"
    elseif fruit == "Human: Buddha Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/1/15/BuddhaNew.png"
    elseif fruit == "String Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/d/d0/StringNew.png"
    elseif fruit == "Bird: Phoenix Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/6/6f/PhoenixNew.png"
    elseif fruit == "Portal Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/e/e4/PortalFruit.png"
    elseif fruit == "Rumble Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/7/76/RumbleNew.png"
    elseif fruit == "Paw Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/3/37/PawNew.png"
    elseif fruit == "Blizzard Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/7/7b/BlizzardPhysical.png"
    elseif fruit == "Gravity Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/b/b4/GravityNew.png"
    elseif fruit == "Dough Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/a/a4/DoughNew.png"
    elseif fruit == "Shadow Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/3/3e/ShadowNew.png"
    elseif fruit == "Venom Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/4/48/VenomNew.png"
    elseif fruit == "Control Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/7/79/ControlNew.png"
    elseif fruit == "Spirit Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/9/97/Spirit.png"
    elseif fruit == "Dragon Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/0/0f/DragonNew.png"
    elseif fruit == "Leopard Fruit" then return "https://static.wikia.nocookie.net/roblox-blox-piece/images/9/95/Leopard_Logo.png"
    else return "https://pbs.twimg.com/media/FPWzXAAVcAMLMBA.jpg"
    end
end

function StoreFruit()
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

    if fruit then rem:InvokeServer("StoreFruit", fruit:GetAttribute("OriginalName"), fruit)
        print(fruit, "Stored!")
        sendMessage('You stored a fruit! ✅', fruit, '36ff6b')
        else print("No fruit to store")
    end
end

function FindFruit()
    local FruitsInServer = {}

    for _, v in pairs(game.Workspace:GetChildren()) do
        if v.Name:find("Fruit") and (v:IsA("Tool") or v:IsA("Model")) then
            print("Fruit Detected!")
            table.insert(FruitsInServer, tostring(v.Name))
        end
    end

    -- send message of fruits in server
    if table.getn(FruitsInServer) ~= 0 then
        sendMessage("Fruit(s) detected in server! 🕵️", table.concat(FruitsInServer, ', '),'ffeb33')
    end

    for _, v in pairs(game.Workspace:GetChildren()) do
        if v.Name:find("Fruit") and (v:IsA("Tool") or v:IsA("Model")) then

            -- tween to fruit
            repeat
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
            until v.Parent ~= game.Workspace

            -- store da fruit
            task.wait()
            StoreFruit()
        end
    end
end

function DetectFruit()
    for _, v in pairs(game.Workspace:GetChildren()) do
        if v.Name:find("Fruit") and (v:IsA("Tool") or v:IsA("Model")) then
            return true
        else return false
        end
    end
end

function SelectTeam()
    rem:InvokeServer("DressrosaQuestProgress")
    rem:InvokeServer("ZQuestProgress")
    rem:InvokeServer("ProQuestProgress")
    task.wait()
    rem:InvokeServer("SetTeam", "Marines")
end

-- Code Starts Here --
loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/DonateMe/main/OldBf"))()
FindFruit()

task.wait(2)

if serverhop == true or DetectFruit() == false then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/Amity/main/AutoServerHop.lua"))()
end
