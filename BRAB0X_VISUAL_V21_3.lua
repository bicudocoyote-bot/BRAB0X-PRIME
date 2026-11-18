-- BRAB0X PRIME | PACOTE VISUAL V21.3
-- Complemento visual para a V21.2; nao altera comandos existentes.
-- Para usar a arte EXATA da previa, publique BRAB0X_PRIME_UI_ATLAS.png
-- como imagem Roblox e informe o ID na variavel abaixo.

_G.BRAB0X_PRIME_UI_ATLAS = 134556330524125
local ATLAS_ID = tonumber(_G.BRAB0X_PRIME_UI_ATLAS) or 0
local Players = game:GetService("Players")
local player = Players.LocalPlayer
if not player then return end
local pg = player:WaitForChild("PlayerGui")
local gui = pg:FindFirstChild("BRAB0X_PRIME_V21_2_0")
if not gui then
    warn("[BRAB0X] Abra o BRAB0X PRIME V21.2 antes do complemento visual.")
    return
end

local function findLabel(value)
    for _,node in ipairs(gui:GetDescendants()) do
        if node:IsA("TextLabel") and node.Text == value then
            return node
        end
    end
    return nil
end

local function imagePart(parent,name,rx,ry,rw,rh,position,size)
    if not parent then return end
    local old = parent:FindFirstChild(name)
    if old then old:Destroy() end
    local im = Instance.new("ImageLabel")
    im.Name = name
    im.BackgroundTransparency = 1
    im.BorderSizePixel = 0
    im.Active = false
    im.ZIndex = 30
    im.Position = position
    im.Size = size
    im.ScaleType = Enum.ScaleType.Stretch
    im.ImageRectOffset = Vector2.new(rx,ry)
    im.ImageRectSize = Vector2.new(rw,rh)
    im.Image = ATLAS_ID > 0 and ("rbxassetid://" .. math.floor(ATLAS_ID)) or ""
    im.Visible = ATLAS_ID > 0
    im.Parent = parent
    return im
end

local bannerLabel = findLabel("CENTRAL DE CONTROLE  /  ACESSO PREMIUM")
local hero = bannerLabel and bannerLabel.Parent
local title = findLabel("BRAB0X  PRIME")
local header = title and title.Parent
local search
for _,node in ipairs(gui:GetDescendants()) do
    if node:IsA("TextBox") and node.PlaceholderText:find("Pesquisar ferramentas",1,true) then
        search = node
        break
    end
end
local sidebar = search and search.Parent

-- Melhorias nativas: nao precisam de imagem publicada.
if hero then
    hero.BackgroundColor3 = Color3.fromRGB(86,18,37)
    local gradient = hero:FindFirstChildOfClass("UIGradient")
    if gradient then
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,Color3.fromRGB(118,18,43)),
            ColorSequenceKeypoint.new(.48,Color3.fromRGB(43,17,30)),
            ColorSequenceKeypoint.new(1,Color3.fromRGB(24,23,32))
        })
    end
    imagePart(hero,"BRAB0X_ARTE_BANNER",0,0,680,180,
        UDim2.fromScale(0,0),UDim2.fromScale(1,1))
end
if sidebar then
    imagePart(sidebar,"BRAB0X_ARTE_LATERAL",692,0,220,91,
        UDim2.fromOffset(10,10),UDim2.new(1,-20,0,80))
end
if header then
    imagePart(header,"BRAB0X_ARTE_TOPO",0,196,500,74,
        UDim2.fromOffset(15,0),UDim2.fromOffset(455,68))
end

local cards = {
    {"SERVIDOR",0,280},
    {"JOGADORES",342,280},
    {"COMANDOS",0,372},
    {"JOGOS",342,372},
}
for _,info in ipairs(cards) do
    local label = findLabel(info[1])
    local card = label and label.Parent
    if card and card:IsA("TextButton") then
        card.BackgroundColor3 = Color3.fromRGB(88,28,42)
        local gradient = card:FindFirstChildOfClass("UIGradient")
        if gradient then
            gradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0,Color3.fromRGB(121,35,55)),
                ColorSequenceKeypoint.new(1,Color3.fromRGB(43,40,51))
            })
        end
        local stroke = card:FindFirstChildOfClass("UIStroke")
        if stroke then
            stroke.Color = Color3.fromRGB(255,64,90)
            stroke.Thickness = 1.8
            stroke.Transparency = .08
        end
        imagePart(card,"BRAB0X_ARTE_" .. info[1],info[2],info[3],330,78,
            UDim2.fromScale(0,0),UDim2.fromScale(1,1))
    end
end

if ATLAS_ID > 0 then
    print("[BRAB0X] Arte visual V21.3 aplicada. ID:",ATLAS_ID)
else
    print("[BRAB0X] V21.3 aplicada com acabamento nativo. Para imagem exata, publique o atlas e informe seu ID em _G.BRAB0X_PRIME_UI_ATLAS.")
end