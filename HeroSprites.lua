-- 勇士精灵生成模块
local HeroSprites = {}

-- 确保目录存在
local function ensureDirectoryExists()
    love.filesystem.createDirectory("assets/sprites/heroes")
end

-- 生成战士精灵
function HeroSprites.generateWarrior()
    local filename = "assets/sprites/heroes/warrior_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    if hasSprites then
        return
    end
    
    local sheetWidth, sheetHeight = 64, 48  -- 4x3帧，每帧16x16
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制战士空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 战士身体（强壮的身躯）
        love.graphics.setColor(0.7, 0.5, 0.3)  -- 棕色盔甲
        love.graphics.rectangle("fill", x + 4, y + 4, 8, 12)
        
        -- 头部
        love.graphics.setColor(0.9, 0.8, 0.7)  -- 肤色
        love.graphics.circle("fill", x + 8, y + 4, 3)
        
        -- 头盔
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.rectangle("fill", x + 5, y + 1, 6, 3)
        
        -- 剑
        love.graphics.setColor(0.8, 0.8, 0.8)  -- 银色剑
        love.graphics.rectangle("fill", x + 12, y + 6, 2, 8)
        love.graphics.rectangle("fill", x + 10, y + 6, 4, 2)
        
        -- 呼吸动画
        local breath = math.sin(i * math.pi / 2) * 0.5
        love.graphics.translate(0, breath)
    end
    
    -- 绘制战士移动动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 移动时的身体倾斜
        local lean = math.sin(i * math.pi / 2) * 0.5
        
        -- 战士身体
        love.graphics.setColor(0.7, 0.5, 0.3)
        love.graphics.push()
        love.graphics.translate(x + 8, y + 10)
        love.graphics.rotate(lean * 0.1)
        love.graphics.translate(-(x + 8), -(y + 10))
        love.graphics.rectangle("fill", x + 4, y + 4, 8, 12)
        love.graphics.pop()
        
        -- 头部
        love.graphics.setColor(0.9, 0.8, 0.7)
        love.graphics.circle("fill", x + 8, y + 4, 3)
        
        -- 头盔
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.rectangle("fill", x + 5, y + 1, 6, 3)
        
        -- 剑（移动时摆动）
        love.graphics.setColor(0.8, 0.8, 0.8)
        love.graphics.push()
        love.graphics.translate(x + 13, y + 10)
        love.graphics.rotate(lean * 0.3)
        love.graphics.translate(-(x + 13), -(y + 10))
        love.graphics.rectangle("fill", x + 12, y + 6, 2, 8)
        love.graphics.rectangle("fill", x + 10, y + 6, 4, 2)
        love.graphics.pop()
    end
    
    -- 绘制战士攻击动画帧（第三行）
    for i = 0, 3 do
        local x, y = i * 16, 32
        
        -- 攻击姿势（前倾）
        local attackLean = i * 0.5
        
        -- 战士身体
        love.graphics.setColor(0.7, 0.5, 0.3)
        love.graphics.push()
        love.graphics.translate(x + 8, y + 10)
        love.graphics.rotate(attackLean * 0.1)
        love.graphics.translate(-(x + 8), -(y + 10))
        love.graphics.rectangle("fill", x + 4, y + 4, 8, 12)
        love.graphics.pop()
        
        -- 头部
        love.graphics.setColor(0.9, 0.8, 0.7)
        love.graphics.circle("fill", x + 8, y + 4, 3)
        
        -- 头盔
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.rectangle("fill", x + 5, y + 1, 6, 3)
        
        -- 剑（攻击动作）
        love.graphics.setColor(0.8, 0.8, 0.8)
        love.graphics.push()
        love.graphics.translate(x + 13, y + 10)
        love.graphics.rotate(attackLean * 0.5)
        love.graphics.translate(-(x + 13), -(y + 10))
        love.graphics.rectangle("fill", x + 12, y + 6, 2, 8)
        love.graphics.rectangle("fill", x + 10, y + 6, 4, 2)
        love.graphics.pop()
        
        -- 攻击特效
        if i > 0 then
            love.graphics.setColor(1, 1, 0, 0.5)
            love.graphics.line(x + 14, y + 10, x + 14 + i * 2, y + 10 - i)
        end
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成盗贼精灵
function HeroSprites.generateRogue()
    local filename = "assets/sprites/heroes/rogue_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    if hasSprites then
        return
    end
    
    local sheetWidth, sheetHeight = 64, 48
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制盗贼空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 盗贼身体（敏捷的身躯）
        love.graphics.setColor(0.2, 0.2, 0.2)  -- 黑色皮甲
        love.graphics.rectangle("fill", x + 5, y + 4, 6, 12)
        
        -- 头部
        love.graphics.setColor(0.9, 0.8, 0.7)
        love.graphics.circle("fill", x + 8, y + 4, 2.5)
        
        -- 面罩
        love.graphics.setColor(0.1, 0.1, 0.1)
        love.graphics.rectangle("fill", x + 6, y + 2, 4, 2)
        
        -- 匕首
        love.graphics.setColor(0.7, 0.7, 0.7)
        love.graphics.rectangle("fill", x + 12, y + 6, 1, 4)
        love.graphics.rectangle("fill", x + 11, y + 6, 3, 1)
        
        -- 潜行效果
        local stealth = math.sin(i * math.pi / 2) * 0.2
        love.graphics.setColor(0, 0, 0, 0.1 + stealth)
        love.graphics.circle("fill", x + 8, y + 8, 6)
    end
    
    -- 绘制盗贼移动动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 快速移动姿势
        local speed = math.sin(i * math.pi / 2) * 0.8
        
        -- 盗贼身体
        love.graphics.setColor(0.2, 0.2, 0.2)
        love.graphics.push()
        love.graphics.translate(x + 8, y + 10)
        love.graphics.rotate(speed * 0.2)
        love.graphics.translate(-(x + 8), -(y + 10))
        love.graphics.rectangle("fill", x + 5, y + 4, 6, 12)
        love.graphics.pop()
        
        -- 头部
        love.graphics.setColor(0.9, 0.8, 0.7)
        love.graphics.circle("fill", x + 8, y + 4, 2.5)
        
        -- 面罩
        love.graphics.setColor(0.1, 0.1, 0.1)
        love.graphics.rectangle("fill", x + 6, y + 2, 4, 2)
        
        -- 匕首（快速移动时）
        love.graphics.setColor(0.7, 0.7, 0.7)
        love.graphics.push()
        love.graphics.translate(x + 12, y + 8)
        love.graphics.rotate(speed * 0.3)
        love.graphics.translate(-(x + 12), -(y + 8))
        love.graphics.rectangle("fill", x + 12, y + 6, 1, 4)
        love.graphics.rectangle("fill", x + 11, y + 6, 3, 1)
        love.graphics.pop()
        
        -- 残影效果
        love.graphics.setColor(0, 0, 0, 0.2)
        love.graphics.circle("fill", x + 8 - speed * 2, y + 8, 4)
    end
    
    -- 绘制盗贼攻击动画帧（第三行）
    for i = 0, 3 do
        local x, y = i * 16, 32
        
        -- 攻击姿势（快速刺击）
        local attack = i * 0.8
        
        -- 盗贼身体
        love.graphics.setColor(0.2, 0.2, 0.2)
        love.graphics.push()
        love.graphics.translate(x + 8, y + 10)
        love.graphics.rotate(attack * 0.1)
        love.graphics.translate(-(x + 8), -(y + 10))
        love.graphics.rectangle("fill", x + 5, y + 4, 6, 12)
        love.graphics.pop()
        
        -- 头部
        love.graphics.setColor(0.9, 0.8, 0.7)
        love.graphics.circle("fill", x + 8, y + 4, 2.5)
        
        -- 面罩
        love.graphics.setColor(0.1, 0.1, 0.1)
        love.graphics.rectangle("fill", x + 6, y + 2, 4, 2)
        
        -- 匕首（攻击动作）
        love.graphics.setColor(0.7, 0.7, 0.7)
        love.graphics.push()
        love.graphics.translate(x + 12, y + 8)
        love.graphics.rotate(attack * 0.5)
        love.graphics.translate(-(x + 12), -(y + 8))
        love.graphics.rectangle("fill", x + 12, y + 6, 1, 4)
        love.graphics.rectangle("fill", x + 11, y + 6, 3, 1)
        love.graphics.pop()
        
        -- 攻击特效
        if i > 0 then
            love.graphics.setColor(0.8, 0.8, 0.8, 0.5)
            love.graphics.line(x + 12, y + 8, x + 12 + i * 3, y + 8 - i)
        end
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成法师精灵
function HeroSprites.generateMage()
    local filename = "assets/sprites/heroes/mage_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    if hasSprites then
        return
    end
    
    local sheetWidth, sheetHeight = 64, 48
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制法师空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 法师长袍
        love.graphics.setColor(0.2, 0.2, 0.6)  -- 蓝色长袍
        love.graphics.rectangle("fill", x + 4, y + 4, 8, 12)
        
        -- 头部
        love.graphics.setColor(0.9, 0.8, 0.7)
        love.graphics.circle("fill", x + 8, y + 4, 3)
        
        -- 帽子
        love.graphics.setColor(0.1, 0.1, 0.3)
        love.graphics.rectangle("fill", x + 4, y + 1, 8, 3)
        
        -- 法杖
        love.graphics.setColor(0.8, 0.6, 0.4)  -- 木色法杖
        love.graphics.rectangle("fill", x + 12, y + 4, 2, 8)
        
        -- 魔法球
        love.graphics.setColor(0.4, 0.4, 1.0, 0.7)  -- 蓝色魔法球
        love.graphics.circle("fill", x + 13, y + 4, 2)
        
        -- 魔法光环
        local pulse = math.sin(i * math.pi / 2) * 0.2
        love.graphics.setColor(0.4, 0.4, 1.0, 0.3 + pulse)
        love.graphics.circle("fill", x + 13, y + 4, 3)
    end
    
    -- 绘制法师移动动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 飘动效果
        local float = math.sin(i * math.pi / 2) * 0.5
        
        -- 法师长袍
        love.graphics.setColor(0.2, 0.2, 0.6)
        love.graphics.rectangle("fill", x + 4, y + 4 + float, 8, 12)
        
        -- 头部
        love.graphics.setColor(0.9, 0.8, 0.7)
        love.graphics.circle("fill", x + 8, y + 4 + float, 3)
        
        -- 帽子
        love.graphics.setColor(0.1, 0.1, 0.3)
        love.graphics.rectangle("fill", x + 4, y + 1 + float, 8, 3)
        
        -- 法杖
        love.graphics.setColor(0.8, 0.6, 0.4)
        love.graphics.rectangle("fill", x + 12, y + 4 + float, 2, 8)
        
        -- 魔法球
        love.graphics.setColor(0.4, 0.4, 1.0, 0.7)
        love.graphics.circle("fill", x + 13, y + 4 + float, 2)
        
        -- 移动轨迹
        love.graphics.setColor(0.4, 0.4, 1.0, 0.2)
        love.graphics.circle("fill", x + 8 - float * 2, y + 8, 4)
    end
    
    -- 绘制法师攻击动画帧（第三行）
    for i = 0, 3 do
        local x, y = i * 16, 32
        
        -- 施法姿势
        local cast = i * 0.5
        
        -- 法师长袍
        love.graphics.setColor(0.2, 0.2, 0.6)
        love.graphics.push()
        love.graphics.translate(x + 8, y + 10)
        love.graphics.rotate(cast * 0.1)
        love.graphics.translate(-(x + 8), -(y + 10))
        love.graphics.rectangle("fill", x + 4, y + 4, 8, 12)
        love.graphics.pop()
        
        -- 头部
        love.graphics.setColor(0.9, 0.8, 0.7)
        love.graphics.circle("fill", x + 8, y + 4, 3)
        
        -- 帽子
        love.graphics.setColor(0.1, 0.1, 0.3)
        love.graphics.rectangle("fill", x + 4, y + 1, 8, 3)
        
        -- 法杖
        love.graphics.setColor(0.8, 0.6, 0.4)
        love.graphics.push()
        love.graphics.translate(x + 13, y + 8)
        love.graphics.rotate(cast * 0.3)
        love.graphics.translate(-(x + 13), -(y + 8))
        love.graphics.rectangle("fill", x + 12, y + 4, 2, 8)
        love.graphics.pop()
        
        -- 魔法球（施法时变大）
        love.graphics.setColor(0.4, 0.4, 1.0, 0.7)
        love.graphics.circle("fill", x + 13, y + 4, 2 + cast * 0.5)
        
        -- 魔法能量
        if i > 0 then
            love.graphics.setColor(0.4, 0.4, 1.0, 0.5)
            for j = 1, 3 do
                local angle = (j / 3) * math.pi * 2
                love.graphics.line(
                    x + 13, y + 4,
                    x + 13 + math.cos(angle) * (4 + cast),
                    y + 4 + math.sin(angle) * (4 + cast)
                )
            end
        end
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成猎人精灵
function HeroSprites.generateHunter()
    local filename = "assets/sprites/heroes/hunter_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    if hasSprites then
        return
    end
    
    local sheetWidth, sheetHeight = 64, 48
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制猎人空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 猎人身体（绿色皮甲）
        love.graphics.setColor(0.2, 0.4, 0.2)
        love.graphics.rectangle("fill", x + 4, y + 4, 8, 12)
        
        -- 头部
        love.graphics.setColor(0.9, 0.8, 0.7)
        love.graphics.circle("fill", x + 8, y + 4, 3)
        
        -- 帽子
        love.graphics.setColor(0.1, 0.3, 0.1)
        love.graphics.rectangle("fill", x + 5, y + 1, 6, 3)
        
        -- 弓
        love.graphics.setColor(0.6, 0.4, 0.2)  -- 木色弓
        love.graphics.arc("fill", x + 12, y + 8, 4, math.pi * 0.75, math.pi * 1.25)
        
        -- 箭
        love.graphics.setColor(0.8, 0.8, 0.8)  -- 银色箭
        love.graphics.rectangle("fill", x + 8, y + 8, 4, 1)
        
        -- 呼吸动画
        local breath = math.sin(i * math.pi / 2) * 0.3
        love.graphics.translate(0, breath)
    end
    
    -- 绘制猎人移动动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 移动姿势
        local move = math.sin(i * math.pi / 2) * 0.5
        
        -- 猎人身体
        love.graphics.setColor(0.2, 0.4, 0.2)
        love.graphics.push()
        love.graphics.translate(x + 8, y + 10)
        love.graphics.rotate(move * 0.1)
        love.graphics.translate(-(x + 8), -(y + 10))
        love.graphics.rectangle("fill", x + 4, y + 4, 8, 12)
        love.graphics.pop()
        
        -- 头部
        love.graphics.setColor(0.9, 0.8, 0.7)
        love.graphics.circle("fill", x + 8, y + 4, 3)
        
        -- 帽子
        love.graphics.setColor(0.1, 0.3, 0.1)
        love.graphics.rectangle("fill", x + 5, y + 1, 6, 3)
        
        -- 弓（移动时摆动）
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.push()
        love.graphics.translate(x + 12, y + 8)
        love.graphics.rotate(move * 0.2)
        love.graphics.translate(-(x + 12), -(y + 8))
        love.graphics.arc("fill", x + 12, y + 8, 4, math.pi * 0.75, math.pi * 1.25)
        love.graphics.pop()
        
        -- 箭
        love.graphics.setColor(0.8, 0.8, 0.8)
        love.graphics.rectangle("fill", x + 8, y + 8, 4, 1)
        
        -- 移动轨迹
        love.graphics.setColor(0.2, 0.4, 0.2, 0.2)
        love.graphics.circle("fill", x + 8 - move * 2, y + 8, 4)
    end
    
    -- 绘制猎人攻击动画帧（第三行）
    for i = 0, 3 do
        local x, y = i * 16, 32
        
        -- 射击姿势
        local shoot = i * 0.8
        
        -- 猎人身体
        love.graphics.setColor(0.2, 0.4, 0.2)
        love.graphics.push()
        love.graphics.translate(x + 8, y + 10)
        love.graphics.rotate(shoot * 0.1)
        love.graphics.translate(-(x + 8), -(y + 10))
        love.graphics.rectangle("fill", x + 4, y + 4, 8, 12)
        love.graphics.pop()
        
        -- 头部
        love.graphics.setColor(0.9, 0.8, 0.7)
        love.graphics.circle("fill", x + 8, y + 4, 3)
        
        -- 帽子
        love.graphics.setColor(0.1, 0.3, 0.1)
        love.graphics.rectangle("fill", x + 5, y + 1, 6, 3)
        
        -- 弓（拉弓动作）
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.push()
        love.graphics.translate(x + 12, y + 8)
        love.graphics.rotate(shoot * 0.3)
        love.graphics.translate(-(x + 12), -(y + 8))
        love.graphics.arc("fill", x + 12, y + 8, 4, math.pi * 0.75, math.pi * 1.25)
        love.graphics.pop()
        
        -- 箭（射击动作）
        love.graphics.setColor(0.8, 0.8, 0.8)
        love.graphics.rectangle("fill", x + 8 + shoot, y + 8, 4, 1)
        
        -- 射击特效
        if i > 0 then
            love.graphics.setColor(0.8, 0.8, 0.8, 0.5)
            love.graphics.line(x + 12, y + 8, x + 12 + shoot * 3, y + 8)
        end
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成所有勇士精灵
function HeroSprites.generateAll()
    -- 确保目录存在
    ensureDirectoryExists()
    
    -- 生成所有勇士精灵
    HeroSprites.generateWarrior()
    HeroSprites.generateRogue()
    HeroSprites.generateMage()
    HeroSprites.generateHunter()
end

return HeroSprites 