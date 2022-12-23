local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")() -- funnedevmen here, Hi, credits to whoever made this lib cuz i def didnt make it lol i cant code

local win = lib:Window("Funne Football Script",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local tab = win:Tab("Mag")

local player = game.Players.LocalPlayer

local rs = game:GetService("RunService")


function magBall(ball)
   if ball and player.Character then
       firetouchinterest(player.Character["Left Arm"], ball, 0)
       firetouchinterest(player.Character["Right Arm"], ball, 0)
       task.wait()
       firetouchinterest(player.Character["Left Arm"], ball, 1)
       firetouchinterest(player.Character["Right Arm"], ball, 1)
   end
end

tab:Toggle("Legit Mag",nil, function (bool)
    shared.Mags = bool
    rs.Stepped:Connect(function()
    if shared.Mags and not game:GetService("ReplicatedStorage").Values.HomeQB.Value:match(player.Name) and not game:GetService("ReplicatedStorage").Values.AwayQB.Value:match(player.Name) then
       for i,v in pairs(workspace:GetChildren()) do
           if v.Name == "Football" and v:IsA("BasePart") then
               wait()
               local mag = (player.Character.Torso.Position - v.Position).Magnitude
               magBall(v)
               print('Legit Mag On :D')
           end
        end
    else
        wait()
        print('Legit Mag Off :(')
    end
    if shared.Mags and game:GetService("ReplicatedStorage").Values.HomeQB.Value:match(player.Name) or game:GetService("ReplicatedStorage").Values.AwayQB.Value:match(player.Name) then
        print('Magz Auto-Disabled as QB/Vot me QB me Dim lik Pro')
    end
end)
end)


tab:Bind("Bind",Enum.KeyCode.RightShift, Enum.KeyCode.RightControl , function()
print("Pressed!")
end)

local changeclr = win:Tab("Change UI Color")

changeclr:Colorpicker("Change UI Color",Color3.fromRGB(44, 120, 224), function(t)
lib:ChangePresetColor(Color3.fromRGB(t.R * 255,  t.G * 255, t.B * 255))
end)
