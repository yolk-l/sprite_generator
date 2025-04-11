-- 武器精灵生成模块
local WeaponSprites = {}

-- 生成木剑图像
function WeaponSprites.generateWoodenSword()
    local filename = "assets/sprites/wooden_sword.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local width, height = 16, 16  -- 每个武器为16x16像素
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制木剑
    -- 剑柄
    love.graphics.setColor(0.6, 0.4, 0.2)  -- 棕色木柄
    love.graphics.rectangle("fill", 7, 10, 2, 5)
    
    -- 护手
    love.graphics.setColor(0.5, 0.35, 0.15)  -- 深棕色
    love.graphics.rectangle("fill", 5, 9, 6, 1)
    
    -- 剑刃
    love.graphics.setColor(0.85, 0.8, 0.7)  -- 木质刀刃颜色
    love.graphics.polygon("fill", 
        7, 2,   -- 剑尖
        6, 9,   -- 左边缘
        10, 9,  -- 右边缘
        9, 2    -- 剑尖右边
    )
    
    -- 剑刃纹理
    love.graphics.setColor(0.7, 0.65, 0.55)
    love.graphics.line(8, 3, 8, 8)
    
    -- 边缘线条
    love.graphics.setColor(0.4, 0.3, 0.2)
    love.graphics.line(7, 2, 6, 9)
    love.graphics.line(9, 2, 10, 9)
    love.graphics.line(7, 2, 9, 2)
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成铁剑图像
function WeaponSprites.generateIronSword()
    local filename = "assets/sprites/iron_sword.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local width, height = 16, 16  -- 每个武器为16x16像素
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制铁剑
    -- 剑柄
    love.graphics.setColor(0.4, 0.3, 0.2)  -- 深棕色木柄
    love.graphics.rectangle("fill", 7, 10, 2, 5)
    
    -- 护手
    love.graphics.setColor(0.6, 0.6, 0.65)  -- 银色金属
    love.graphics.rectangle("fill", 5, 9, 6, 1)
    love.graphics.rectangle("fill", 4, 8, 8, 1)
    
    -- 剑刃
    love.graphics.setColor(0.8, 0.8, 0.85)  -- 银色金属刀刃
    love.graphics.polygon("fill", 
        7, 1,   -- 剑尖
        6, 8,   -- 左边缘
        10, 8,  -- 右边缘
        9, 1    -- 剑尖右边
    )
    
    -- 剑刃光泽
    love.graphics.setColor(0.9, 0.9, 0.95)
    love.graphics.line(8, 2, 8, 7)
    
    -- 边缘线条
    love.graphics.setColor(0.5, 0.5, 0.55)
    love.graphics.line(7, 1, 6, 8)
    love.graphics.line(9, 1, 10, 8)
    love.graphics.line(7, 1, 9, 1)
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成烈焰剑图像
function WeaponSprites.generateFlameSword()
    local filename = "assets/sprites/flame_sword.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local width, height = 16, 16  -- 每个武器为16x16像素
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制烈焰剑
    -- 剑柄
    love.graphics.setColor(0.35, 0.2, 0.15)  -- 深褐色木柄
    love.graphics.rectangle("fill", 7, 10, 2, 5)
    
    -- 护手
    love.graphics.setColor(0.8, 0.2, 0.1)  -- 深红色护手
    love.graphics.rectangle("fill", 5, 9, 6, 1)
    love.graphics.rectangle("fill", 4, 8, 8, 1)
    
    -- 剑刃
    love.graphics.setColor(0.95, 0.6, 0.2)  -- 橙黄色剑刃
    love.graphics.polygon("fill", 
        7, 1,   -- 剑尖
        6, 8,   -- 左边缘
        10, 8,  -- 右边缘
        9, 1    -- 剑尖右边
    )
    
    -- 火焰效果
    love.graphics.setColor(1, 0.3, 0.1, 0.8)  -- 红色火焰
    for i = 1, 5 do
        local flameX = 8 + math.cos(i) * 1.5
        local flameY = 4 + i * 0.8
        love.graphics.circle("fill", flameX, flameY, 2.5 - i * 0.3)
    end
    
    -- 火焰高光
    love.graphics.setColor(1, 0.9, 0.3, 0.7)  -- 黄色高光
    love.graphics.line(8, 1, 8, 7)
    
    -- 边缘线条
    love.graphics.setColor(0.8, 0.3, 0.1)
    love.graphics.line(7, 1, 6, 8)
    love.graphics.line(9, 1, 10, 8)
    love.graphics.line(7, 1, 9, 1)
    
    -- 火星效果
    love.graphics.setColor(1, 1, 0.5, 0.6)
    love.graphics.points(
        7, 3,
        9, 4,
        6, 5,
        8, 2
    )
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成所有武器图像
function WeaponSprites.generateAll()
    -- 创建sprites目录（如果不存在）
    love.filesystem.createDirectory("assets/sprites")
    
    -- 生成所有武器图像
    WeaponSprites.generateWoodenSword()
    WeaponSprites.generateIronSword()
    WeaponSprites.generateFlameSword()
end

return WeaponSprites 