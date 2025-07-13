local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🔥 เมนูโกงของ-ชนัญญู 🔥",
   LoadingTitle = "กำลังโหลดเมนู...",
   LoadingSubtitle = "โดย ชนัญญู",
   ConfigurationSaving = {
      Enabled = false,
   },
   Discord = {
      Enabled = false,
   },
   KeySystem = false,
})

local MainTab = Window:CreateTab("คำสั่งหลัก", 4483362458)

MainTab:CreateToggle({
   Name = "โหมดอมตะ (GodMode)",
   CurrentValue = false,
   Callback = function(Value)
      local char = game.Players.LocalPlayer.Character
      if Value then
         char.Humanoid.Health = math.huge
      else
         char.Humanoid.Health = 100
      end
   end
})

MainTab:CreateToggle({
   Name = "บิน (Fly)",
   CurrentValue = false,
   Callback = function(Value)
      local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
      if Value then
         game:GetService("RunService").RenderStepped:Connect(function()
            if Value then
               hrp.Velocity = Vector3.new(0,50,0)
            end
         end)
      end
   end
})

MainTab:CreateToggle({
   Name = "วิ่งเร็ว (Speed)",
   CurrentValue = false,
   Callback = function(Value)
      local hum = game.Players.LocalPlayer.Character.Humanoid
      hum.WalkSpeed = Value and 100 or 16
   end
})

MainTab:CreateToggle({
   Name = "ทะลุสิ่งกีดขวาง (Noclip)",
   CurrentValue = false,
   Callback = function(Value)
      game:GetService("RunService").Stepped:Connect(function()
         if Value then
            for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
               if v:IsA("BasePart") then
                  v.CanCollide = false
               end
            end
         end
      end)
   end
})

local isInvisible = false
MainTab:CreateToggle({
   Name = "ล่องหน (Invisible)",
   CurrentValue = false,
   Callback = function(Value)
      isInvisible = Value
      for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
         if v:IsA("BasePart") or v:IsA("Decal") then
            v.Transparency = isInvisible and 1 or 0
         end
      end
   end
})

MainTab:CreateButton({
   Name = "ซ่อนชื่อ",
   Callback = function()
      local head = game.Players.LocalPlayer.Character:FindFirstChild("Head")
      if head then
         for _,v in pairs(head:GetChildren()) do
            if v:IsA("BillboardGui") then
               v.Enabled = false
            end
         end
      end
   end
})

MainTab:CreateButton({
   Name = "ทำให้ไอเท็มล่องหน",
   Callback = function()
      for _,tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
         if tool:IsA("Tool") then
            for _,v in pairs(tool:GetDescendants()) do
               if v:IsA("BasePart") then
                  v.Transparency = 1
               end
            end
         end
      end
   end
})

MainTab:CreateButton({
   Name = "กันตรวจจับ",
   Callback = function()
      for _,v in pairs(getgc(true)) do
         if type(v) == "function" and islclosure(v) and not is_synapse_function(v) then
            debug.setupvalue(v,1,nil)
         end
      end
   end
})

MainTab:CreateButton({
   Name = "ฆ่าทุกคน",
   Callback = function()
      for _,p in pairs(game.Players:GetPlayers()) do
         if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") then
            p.Character.Humanoid.Health = 0
         end
      end
   end
})

MainTab:CreateInput({
   Name = "ฆ่าเฉพาะชื่อ",
   PlaceholderText = "พิมพ์ชื่อที่นี่",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
      for _,p in pairs(game.Players:GetPlayers()) do
         if p.Name:lower():find(Text:lower()) then
            if p.Character and p.Character:FindFirstChild("Humanoid") then
               p.Character.Humanoid.Health = 0
            end
         end
      end
   end
})

MainTab:CreateButton({
   Name = "วาร์ปไป (0,50,0)",
   Callback = function()
      game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0,50,0))
   end
})
