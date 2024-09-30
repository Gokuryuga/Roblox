-- Script para Dragon Ball Rage no Roblox
-- Este script mata automaticamente Goku, Saibamen, Tennenman e Jinkouman
-- e inclui uma opção para ativar ou desativar o script.

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20UI%20Library/Source.lua'))()

local Window = Library:CreateWindow('Hub Name', 'Game Name', 'Visual UI Library', 'rbxassetid://10618928818', false, 'VisualUIConfigs', 'Default')

local mobs = {"Goku", "Saibamen", "Tennenman", "Jinkouman"}
local scriptAtivo = true

-- Função para encontrar e atacar mobs
function atacarMobs()
    while scriptAtivo do
        for _, mobName in ipairs(mobs) do
            for _, mob in pairs(game.Workspace:GetChildren()) do
                if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") and mob.Name == mobName then
                    -- Teletransporta para o mob
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame
                    -- Adicione aqui o código para atacar o mob
                    -- Exemplo: mob.Humanoid:TakeDamage(100)
                    print("Atacando " .. mobName)
                    wait(0.5) -- Espera 0.5 segundos antes de procurar o próximo mob
                end
            end
        end
        wait(1) -- Espera 1 segundo antes de procurar novamente
    end
end

-- Função para ativar/desativar o script
function alternarScript(P)
    scriptAtivo = not scriptAtivo
    if scriptAtivo then
        print("Script ativado")
        atacarMobs(P)
    else
        print("Script desativado")
    end
end

-- Conectando a função de alternar a uma tecla (exemplo: tecla "P")
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.P then
        alternarScript(P)
    end
end)

-- Inicia o script
atacarMobs(P)
