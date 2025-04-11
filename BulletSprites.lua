-- 子弹精灵生成模块
local BulletSprites = {}

-- 确保目录存在
local function ensureDirectoryExists()
    love.filesystem.createDirectory("assets/sprites/bullets")
end

-- 生成普通子弹精灵
function BulletSprites.generateNormalBullet()
    local filename = "assets/sprites/bullets/normal_bullet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    if hasSprites then
        return
    end
    
    local width, height = 8, 8
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制子弹主体
    love.graphics.setColor(0.8, 0.8, 0.8)  -- 银色
    love.graphics.circle("fill", 4, 4, 2)
    
    -- 子弹尾部
    love.graphics.setColor(0.9, 0.9, 0.9)
    love.graphics.rectangle("fill", 2, 2, 2, 4)
    
    -- 子弹头部
    love.graphics.setColor(0.7, 0.7, 0.7)
    love.graphics.circle("fill", 6, 4, 1)
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成魔法子弹精灵
function BulletSprites.generateMagicBullet()
    local filename = "assets/sprites/bullets/magic_bullet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    if hasSprites then
        return
    end
    
    local width, height = 8, 8
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 魔法球核心
    love.graphics.setColor(0.4, 0.4, 1.0)  -- 蓝色
    love.graphics.circle("fill", 4, 4, 2)
    
    -- 魔法光环
    love.graphics.setColor(0.4, 0.4, 1.0, 0.5)
    love.graphics.circle("fill", 4, 4, 3)
    
    -- 魔法粒子
    love.graphics.setColor(0.6, 0.6, 1.0)
    for i = 1, 4 do
        local angle = (i / 4) * math.pi * 2
        local x = 4 + math.cos(angle) * 2
        local y = 4 + math.sin(angle) * 2
        love.graphics.circle("fill", x, y, 0.5)
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成弓箭精灵
function BulletSprites.generateArrow()
    local filename = "assets/sprites/bullets/arrow.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    if hasSprites then
        return
    end
    
    local width, height = 8, 8
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 箭杆
    love.graphics.setColor(0.6, 0.4, 0.2)  -- 木色
    love.graphics.rectangle("fill", 2, 3, 4, 2)
    
    -- 箭头
    love.graphics.setColor(0.8, 0.8, 0.8)  -- 银色
    love.graphics.polygon("fill", 
        6, 4,
        7, 3,
        7, 5
    )
    
    -- 箭尾
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.polygon("fill",
        2, 3,
        1, 2,
        1, 6,
        2, 5
    )
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成所有子弹精灵
function BulletSprites.generateAll()
    -- 确保目录存在
    ensureDirectoryExists()
    
    -- 生成所有子弹精灵
    BulletSprites.generateNormalBullet()
    BulletSprites.generateMagicBullet()
    BulletSprites.generateArrow()
end

return BulletSprites 