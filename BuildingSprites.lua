-- 建筑精灵生成模块
local BuildingSprites = {}

-- 确保目录存在
local function ensureDirectoryExists()
    love.filesystem.createDirectory("assets/sprites/buildings")
end

-- 生成默认建筑图像
function BuildingSprites.generateDefaultBuilding()
    local filename = "assets/sprites/buildings/default_building.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local width, height = 32, 32  -- 建筑为32x32像素
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制默认建筑
    -- 建筑主体
    love.graphics.setColor(0.7, 0.7, 0.7)  -- 灰色墙壁
    love.graphics.rectangle("fill", 4, 10, 24, 18)
    
    -- 屋顶
    love.graphics.setColor(0.5, 0.2, 0.2)  -- 红棕色屋顶
    love.graphics.polygon("fill", 
        2, 10,    -- 左下
        16, 2,    -- 顶部
        30, 10    -- 右下
    )
    
    -- 门
    love.graphics.setColor(0.6, 0.4, 0.2)  -- 棕色门
    love.graphics.rectangle("fill", 13, 20, 6, 8)
    
    -- 门把手
    love.graphics.setColor(0.8, 0.8, 0.1)  -- 金色门把手
    love.graphics.circle("fill", 17, 24, 1)
    
    -- 窗户
    love.graphics.setColor(0.8, 0.9, 1.0)  -- 浅蓝色窗户
    love.graphics.rectangle("fill", 7, 14, 5, 5)
    love.graphics.rectangle("fill", 20, 14, 5, 5)
    
    -- 窗框
    love.graphics.setColor(0.4, 0.3, 0.2)
    love.graphics.rectangle("line", 7, 14, 5, 5)
    love.graphics.rectangle("line", 20, 14, 5, 5)
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成史莱姆巢穴图像
function BuildingSprites.generateSlimeNest()
    local filename = "assets/sprites/buildings/slime_nest.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local width, height = 32, 32  -- 建筑为32x32像素
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制史莱姆巢穴
    -- 巢穴底部
    love.graphics.setColor(0.2, 0.6, 0.2)  -- 绿色底部
    love.graphics.ellipse("fill", 16, 26, 14, 6)
    
    -- 巢穴主体
    love.graphics.setColor(0.3, 0.7, 0.3)  -- 亮绿色主体
    love.graphics.ellipse("fill", 16, 18, 12, 10)
    
    -- 巢穴顶部
    love.graphics.setColor(0.4, 0.8, 0.4)  -- 更亮的绿色顶部
    love.graphics.ellipse("fill", 16, 12, 8, 6)
    
    -- 粘液效果
    love.graphics.setColor(0.5, 0.9, 0.5, 0.7)  -- 半透明绿色
    
    -- 随机粘液滴
    for i = 1, 6 do
        local x = 16 + math.cos(i) * 8
        local y = 18 + math.sin(i) * 5
        local size = math.random(2, 4)
        love.graphics.circle("fill", x, y, size)
    end
    
    -- 气泡效果
    love.graphics.setColor(0.6, 1.0, 0.6, 0.5)
    love.graphics.circle("fill", 12, 14, 2)
    love.graphics.circle("fill", 18, 16, 1.5)
    love.graphics.circle("fill", 14, 20, 2.5)
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成哥布林小屋图像
function BuildingSprites.generateGoblinHut()
    local filename = "assets/sprites/buildings/goblin_hut.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local width, height = 32, 32  -- 建筑为32x32像素
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制哥布林小屋
    -- 小屋底部
    love.graphics.setColor(0.5, 0.3, 0.1)  -- 棕色地基
    love.graphics.rectangle("fill", 4, 24, 24, 4)
    
    -- 小屋墙壁
    love.graphics.setColor(0.6, 0.4, 0.2)  -- 木墙
    love.graphics.rectangle("fill", 6, 10, 20, 14)
    
    -- 屋顶
    love.graphics.setColor(0.3, 0.5, 0.1)  -- 暗绿色草顶
    love.graphics.polygon("fill", 
        3, 10,    -- 左下
        16, 3,    -- 顶部
        29, 10    -- 右下
    )
    
    -- 门
    love.graphics.setColor(0.4, 0.2, 0.1)  -- 深棕色门
    love.graphics.rectangle("fill", 14, 16, 4, 8)
    
    -- 骨头装饰
    love.graphics.setColor(0.9, 0.9, 0.8)  -- 骨头颜色
    love.graphics.rectangle("fill", 8, 14, 2, 6)   -- 骨头1
    love.graphics.rectangle("fill", 22, 14, 2, 6)  -- 骨头2
    
    -- 窗户
    love.graphics.setColor(0.8, 0.7, 0.2)  -- 黄色窗户(火光)
    love.graphics.circle("fill", 16, 12, 2)
    
    -- 烟囱
    love.graphics.setColor(0.4, 0.3, 0.2)
    love.graphics.rectangle("fill", 22, 4, 3, 6)
    
    -- 烟雾
    love.graphics.setColor(0.7, 0.7, 0.7, 0.5)
    love.graphics.circle("fill", 23, 2, 2)
    love.graphics.circle("fill", 24, 1, 1.5)
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成骷髅墓地图像
function BuildingSprites.generateSkeletonGraveyard()
    local filename = "assets/sprites/buildings/skeleton_graveyard.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local width, height = 32, 32  -- 建筑为32x32像素
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制骷髅墓地
    -- 地面
    love.graphics.setColor(0.3, 0.3, 0.3)  -- 灰色地面
    love.graphics.rectangle("fill", 1, 24, 30, 6)
    
    -- 草丛
    love.graphics.setColor(0.2, 0.35, 0.1)  -- 墓地草丛
    for i = 1, 8 do
        local x = i * 3.5
        love.graphics.rectangle("fill", x, 22, 2, 2)
    end
    
    -- 主墓碑
    love.graphics.setColor(0.6, 0.6, 0.6)  -- 灰色石碑
    love.graphics.rectangle("fill", 13, 12, 6, 12)
    love.graphics.polygon("fill", 
        13, 12,  -- 左下
        16, 8,   -- 顶部
        19, 12   -- 右下
    )
    
    -- 小墓碑1
    love.graphics.setColor(0.55, 0.55, 0.55)
    love.graphics.rectangle("fill", 5, 16, 4, 8)
    love.graphics.polygon("fill", 
        5, 16, 
        7, 14, 
        9, 16
    )
    
    -- 小墓碑2
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.rectangle("fill", 22, 18, 4, 6)
    love.graphics.polygon("fill", 
        22, 18, 
        24, 16, 
        26, 18
    )
    
    -- 骷髅装饰
    love.graphics.setColor(0.9, 0.9, 0.8)  -- 骨头颜色
    
    -- 头骨
    love.graphics.circle("fill", 16, 18, 2)  -- 头骨主体
    
    -- 骨头交叉
    love.graphics.rotate(math.pi / 4)
    love.graphics.rectangle("fill", 20, -5, 6, 1)
    love.graphics.rectangle("fill", 22, -7, 1, 6)
    love.graphics.rotate(-math.pi / 4)
    
    -- 阴森氛围
    love.graphics.setColor(0.7, 0.7, 1.0, 0.2)  -- 淡蓝色雾气
    for i = 1, 3 do
        local x = 10 + i * 5
        local y = 15 + math.sin(i) * 3
        local size = 2 + i
        love.graphics.circle("fill", x, y, size)
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成僵尸墓园图像
function BuildingSprites.generateZombieGraveyard()
    local filename = "assets/sprites/buildings/zombie_graveyard.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local width, height = 32, 32  -- 建筑为32x32像素
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制僵尸墓园
    -- 地面
    love.graphics.setColor(0.25, 0.3, 0.2)  -- 暗绿色地面
    love.graphics.rectangle("fill", 1, 24, 30, 6)
    
    -- 土丘
    love.graphics.setColor(0.35, 0.25, 0.15)  -- 土色
    love.graphics.ellipse("fill", 9, 24, 5, 2)
    love.graphics.ellipse("fill", 22, 24, 4, 2)
    
    -- 中央墓碑
    love.graphics.setColor(0.4, 0.4, 0.4)  -- 灰色石碑
    love.graphics.rectangle("fill", 14, 14, 4, 10)
    love.graphics.polygon("fill", 
        14, 14,  -- 左下
        16, 10,  -- 顶部
        18, 14   -- 右下
    )
    
    -- 倾斜的墓碑
    love.graphics.setColor(0.45, 0.45, 0.45)
    love.graphics.push()
    love.graphics.translate(7, 18)
    love.graphics.rotate(math.pi / 12)
    love.graphics.rectangle("fill", -2, -6, 4, 6)
    love.graphics.polygon("fill", 
        -2, -6,  -- 左下
        0, -9,   -- 顶部
        2, -6    -- 右下
    )
    love.graphics.pop()
    
    -- 铁栅栏
    love.graphics.setColor(0.2, 0.2, 0.2)
    for i = 0, 3 do
        love.graphics.rectangle("fill", 4 + i * 8, 20, 1, 4)
    end
    love.graphics.rectangle("fill", 4, 20, 25, 1)
    
    -- 伸出的手
    love.graphics.setColor(0.5, 0.6, 0.5)  -- 僵尸绿色
    
    -- 手臂和手
    love.graphics.rectangle("fill", 10, 20, 2, 4)  -- 前臂
    love.graphics.rectangle("fill", 9, 20, 4, 1)   -- 手
    
    -- 绿色雾气
    love.graphics.setColor(0.3, 0.7, 0.3, 0.3)
    for i = 1, 4 do
        local x = 8 + i * 5
        local y = 18 - math.sin(i) * 3
        local size = 1.5 + i * 0.5
        love.graphics.circle("fill", x, y, size)
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成狼人巢穴图像
function BuildingSprites.generateWerewolfDen()
    local filename = "assets/sprites/buildings/werewolf_den.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local width, height = 32, 32  -- 建筑为32x32像素
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制狼人巢穴
    -- 洞穴主体
    love.graphics.setColor(0.3, 0.25, 0.2)  -- 深棕色洞穴
    love.graphics.arc("fill", 16, 20, 14, 0, math.pi)
    
    -- 洞穴内部
    love.graphics.setColor(0.1, 0.1, 0.1)  -- 黑色洞穴内部
    love.graphics.arc("fill", 16, 20, 10, 0, math.pi)
    
    -- 装饰石头
    love.graphics.setColor(0.5, 0.45, 0.4)  -- 灰棕色石头
    love.graphics.circle("fill", 8, 20, 3)
    love.graphics.circle("fill", 24, 20, 4)
    
    -- 爪痕
    love.graphics.setColor(0.35, 0.3, 0.25)
    
    -- 左侧爪痕
    love.graphics.push()
    love.graphics.translate(7, 14)
    love.graphics.rotate(math.pi / 6)
    for i = 0, 2 do
        love.graphics.rectangle("fill", i * 2, 0, 1, 5)
    end
    love.graphics.pop()
    
    -- 右侧爪痕
    love.graphics.push()
    love.graphics.translate(22, 15)
    love.graphics.rotate(-math.pi / 6)
    for i = 0, 2 do
        love.graphics.rectangle("fill", i * 2, 0, 1, 5)
    end
    love.graphics.pop()
    
    -- 骨头装饰
    love.graphics.setColor(0.85, 0.85, 0.8)  -- 骨头颜色
    love.graphics.rectangle("fill", 12, 17, 1, 6)  -- 骨头1
    love.graphics.rectangle("fill", 19, 17, 1, 6)  -- 骨头2
    
    -- 狼眼睛
    love.graphics.setColor(0.9, 0.6, 0.1)  -- 橙黄色眼睛
    love.graphics.circle("fill", 13, 16, 1)
    love.graphics.circle("fill", 19, 16, 1)
    
    -- 草丛
    love.graphics.setColor(0.2, 0.4, 0.15)  -- 草丛
    for i = 1, 6 do
        local x = 5 + i * 4
        local y = 23 + math.sin(i) * 2
        love.graphics.rectangle("fill", x, y, 2, 3)
    end
    
    -- 月光效果
    love.graphics.setColor(0.8, 0.8, 0.9, 0.2)  -- 淡蓝色光
    love.graphics.circle("fill", 16, 12, 8)
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成幽灵庄园图像
function BuildingSprites.generateGhostMansion()
    local filename = "assets/sprites/buildings/ghost_mansion.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local width, height = 32, 32  -- 建筑为32x32像素
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制幽灵庄园
    -- 主体建筑
    love.graphics.setColor(0.4, 0.4, 0.5)  -- 灰蓝色墙壁
    love.graphics.rectangle("fill", 4, 10, 24, 18)
    
    -- 左侧塔楼
    love.graphics.rectangle("fill", 4, 5, 6, 5)
    
    -- 右侧塔楼
    love.graphics.rectangle("fill", 22, 5, 6, 5)
    
    -- 左塔尖
    love.graphics.setColor(0.25, 0.25, 0.35)  -- 深灰蓝色
    love.graphics.polygon("fill", 
        4, 5,   -- 左下
        7, 2,   -- 顶部
        10, 5   -- 右下
    )
    
    -- 右塔尖
    love.graphics.polygon("fill", 
        22, 5,  -- 左下
        25, 2,  -- 顶部
        28, 5   -- 右下
    )
    
    -- 中央屋顶
    love.graphics.polygon("fill", 
        4, 10,   -- 左下
        16, 4,   -- 顶部
        28, 10   -- 右下
    )
    
    -- 门
    love.graphics.setColor(0.3, 0.3, 0.4)  -- 深色门
    love.graphics.rectangle("fill", 14, 20, 4, 8)
    love.graphics.arc("fill", 16, 20, 2, 0, math.pi)
    
    -- 窗户
    love.graphics.setColor(0.8, 0.9, 1.0, 0.7)  -- 发光的窗户
    
    -- 主体窗户
    love.graphics.rectangle("fill", 8, 14, 3, 5)
    love.graphics.rectangle("fill", 21, 14, 3, 5)
    
    -- 塔楼窗户
    love.graphics.rectangle("fill", 6, 6, 2, 3)
    love.graphics.rectangle("fill", 24, 6, 2, 3)
    
    -- 窗框
    love.graphics.setColor(0.25, 0.25, 0.35)
    love.graphics.rectangle("line", 8, 14, 3, 5)
    love.graphics.rectangle("line", 21, 14, 3, 5)
    love.graphics.rectangle("line", 6, 6, 2, 3)
    love.graphics.rectangle("line", 24, 6, 2, 3)
    
    -- 幽灵效果
    love.graphics.setColor(0.9, 0.9, 1.0, 0.5)  -- 半透明白色
    
    -- 幽灵1
    love.graphics.circle("fill", 8, 24, 2)
    love.graphics.polygon("fill", 
        6, 24,
        10, 24,
        10, 28,
        8, 26,
        6, 28
    )
    
    -- 幽灵2
    love.graphics.circle("fill", 22, 20, 1.5)
    love.graphics.polygon("fill", 
        20.5, 20,
        23.5, 20,
        23.5, 23,
        22, 21.5,
        20.5, 23
    )
    
    -- 阴森氛围
    love.graphics.setColor(0.6, 0.7, 0.9, 0.3)  -- 淡蓝色雾气
    for i = 1, 4 do
        local x = 4 + i * 6
        local y = 10 + math.sin(i) * 4
        local size = 2 + i * 0.5
        love.graphics.circle("fill", x, y, size)
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成巨人熔炉图像
function BuildingSprites.generateGiantFurnace()
    local filename = "assets/sprites/buildings/giant_furnace.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local width, height = 32, 32  -- 建筑为32x32像素
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制巨人熔炉
    -- 熔炉主体
    love.graphics.setColor(0.4, 0.3, 0.3)  -- 砖红色熔炉
    love.graphics.rectangle("fill", 6, 8, 20, 20)
    
    -- 熔炉顶部
    love.graphics.setColor(0.35, 0.25, 0.25)  -- 深砖红色顶部
    love.graphics.rectangle("fill", 4, 6, 24, 2)
    
    -- 烟囱
    love.graphics.setColor(0.3, 0.2, 0.2)  -- 深色烟囱
    love.graphics.rectangle("fill", 18, 2, 6, 4)
    
    -- 烟雾
    love.graphics.setColor(0.7, 0.7, 0.7, 0.6)  -- 灰色烟雾
    love.graphics.circle("fill", 21, 2, 3)
    love.graphics.circle("fill", 23, 0, 2)
    love.graphics.circle("fill", 19, 1, 2.5)
    
    -- 熔炉开口
    love.graphics.setColor(0.1, 0.1, 0.1)  -- 黑色开口
    love.graphics.rectangle("fill", 12, 18, 8, 10)
    
    -- 熔岩
    love.graphics.setColor(0.9, 0.3, 0.0)  -- 橙红色熔岩
    love.graphics.rectangle("fill", 12, 22, 8, 6)
    
    -- 熔岩纹理
    love.graphics.setColor(1.0, 0.6, 0.0)  -- 亮橙色纹理
    for i = 1, 4 do
        local x = 12 + i * 1.6
        local y = 22 + math.sin(i) * 2
        local width = math.random(1, 2)
        local height = math.random(1, 3)
        love.graphics.rectangle("fill", x, y, width, height)
    end
    
    -- 金属装饰
    love.graphics.setColor(0.6, 0.6, 0.6)  -- 金属色
    love.graphics.rectangle("fill", 10, 18, 12, 1)  -- 横条装饰
    love.graphics.rectangle("fill", 10, 18, 1, 10)  -- 左侧竖条
    love.graphics.rectangle("fill", 21, 18, 1, 10)  -- 右侧竖条
    
    -- 熔炉砖块纹理
    love.graphics.setColor(0.3, 0.2, 0.2)  -- 深色砖缝
    
    -- 横向砖缝
    for i = 0, 4 do
        love.graphics.line(6, 8 + i * 4, 26, 8 + i * 4)
    end
    
    -- 纵向砖缝
    for i = 0, 5 do
        love.graphics.line(6 + i * 4, 8, 6 + i * 4, 28)
    end
    
    -- 热气效果
    love.graphics.setColor(1.0, 0.8, 0.2, 0.3)  -- 半透明黄色
    for i = 1, 3 do
        local x = 12 + i * 2.5
        local size = 1 + i * 0.5
        love.graphics.circle("fill", x, 14, size)
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成女巫小屋图像
function BuildingSprites.generateWitchHut()
    local filename = "assets/sprites/buildings/witch_hut.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local width, height = 32, 32  -- 建筑为32x32像素
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制女巫小屋
    -- 小屋底部
    love.graphics.setColor(0.35, 0.25, 0.2)  -- 深木色底部
    love.graphics.rectangle("fill", 6, 18, 20, 10)
    
    -- 小屋上部
    love.graphics.setColor(0.4, 0.3, 0.25)  -- 木色上部
    love.graphics.rectangle("fill", 8, 12, 16, 6)
    
    -- 屋顶
    love.graphics.setColor(0.2, 0.1, 0.3)  -- 紫色屋顶
    love.graphics.polygon("fill", 
        6, 12,   -- 左下
        16, 4,   -- 顶部
        26, 12   -- 右下
    )
    
    -- 门
    love.graphics.setColor(0.3, 0.2, 0.25)  -- 深色门
    love.graphics.rectangle("fill", 14, 20, 4, 8)
    
    -- 门把手
    love.graphics.setColor(0.6, 0.5, 0.1)  -- 金色门把手
    love.graphics.circle("fill", 17, 24, 0.5)
    
    -- 窗户
    love.graphics.setColor(0.6, 0.4, 0.7)  -- 紫色窗户
    love.graphics.rectangle("fill", 10, 14, 4, 4)
    love.graphics.rectangle("fill", 18, 14, 4, 4)
    
    -- 窗框
    love.graphics.setColor(0.2, 0.1, 0.2)
    love.graphics.rectangle("line", 10, 14, 4, 4)
    love.graphics.rectangle("line", 18, 14, 4, 4)
    
    -- 窗户十字框
    love.graphics.line(12, 14, 12, 18)
    love.graphics.line(10, 16, 14, 16)
    love.graphics.line(20, 14, 20, 18)
    love.graphics.line(18, 16, 22, 16)
    
    -- 烟囱
    love.graphics.setColor(0.35, 0.25, 0.3)
    love.graphics.rectangle("fill", 20, 6, 3, 6)
    
    -- 魔法烟雾
    love.graphics.setColor(0.7, 0.3, 0.9, 0.6)  -- 紫色烟雾
    love.graphics.circle("fill", 21.5, 4, 2)
    love.graphics.circle("fill", 23, 3, 1.5)
    love.graphics.circle("fill", 20, 3, 1.8)
    
    -- 坩埚
    love.graphics.setColor(0.2, 0.2, 0.2)  -- 黑色坩埚
    love.graphics.ellipse("fill", 25, 26, 3, 2)  -- 底部
    love.graphics.rectangle("fill", 23, 22, 4, 4)  -- 主体
    
    -- 坩埚内容物
    love.graphics.setColor(0.3, 0.8, 0.2)  -- 绿色药水
    love.graphics.ellipse("fill", 25, 22, 2, 1)
    
    -- 药水泡沫
    love.graphics.setColor(0, 1, 0.5, 0.7)
    love.graphics.circle("fill", 24, 21, 0.7)
    love.graphics.circle("fill", 26, 21.5, 0.5)
    
    -- 木柴
    love.graphics.setColor(0.5, 0.3, 0.2)
    love.graphics.rectangle("fill", 22, 27, 6, 1)
    love.graphics.rectangle("fill", 24, 26, 2, 3)
    
    -- 装饰物：悬挂的草药
    love.graphics.setColor(0.3, 0.5, 0.3)
    for i = 1, 3 do
        local x = 7 + i * 3
        love.graphics.rectangle("fill", x, 12, 1, 3)
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成龙之洞窟图像
function BuildingSprites.generateDragonCave()
    local filename = "assets/sprites/buildings/dragon_cave.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local width, height = 32, 32  -- 建筑为32x32像素
    local canvas = love.graphics.newCanvas(width, height)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制龙之洞窟
    -- 山体
    love.graphics.setColor(0.5, 0.4, 0.35)  -- 山体颜色
    love.graphics.polygon("fill", 
        2, 28,    -- 左下
        10, 10,   -- 左峰
        16, 4,    -- 中峰
        22, 8,    -- 右峰
        30, 25,   -- 右下
        2, 28     -- 回到左下
    )
    
    -- 洞穴入口
    love.graphics.setColor(0.1, 0.05, 0.1)  -- 洞穴黑色
    love.graphics.arc("fill", 16, 24, 8, 0, math.pi)
    
    -- 洞穴内部纹理
    love.graphics.setColor(0.15, 0.1, 0.15)  -- 略深的黑色
    love.graphics.arc("fill", 16, 24, 6, 0, math.pi)
    
    -- 龙瞳（远处的龙眼睛）
    love.graphics.setColor(1.0, 0.2, 0.1)  -- 红色龙眼
    love.graphics.circle("fill", 14, 22, 1)
    love.graphics.circle("fill", 18, 22, 1)
    
    -- 岩石装饰
    love.graphics.setColor(0.4, 0.35, 0.3)  -- 深色岩石
    love.graphics.circle("fill", 7, 20, 2.5)
    love.graphics.circle("fill", 25, 22, 3)
    
    -- 钟乳石
    love.graphics.setColor(0.6, 0.55, 0.5)  -- 浅色钟乳石
    
    -- 不同长度的钟乳石
    love.graphics.polygon("fill", 
        12, 15,  -- 左上
        13, 19,  -- 尖端
        14, 15   -- 右上
    )
    
    love.graphics.polygon("fill", 
        16, 14,  -- 左上
        17, 20,  -- 尖端
        18, 14   -- 右上
    )
    
    love.graphics.polygon("fill", 
        19, 16,  -- 左上
        20, 18,  -- 尖端
        21, 16   -- 右上
    )
    
    -- 火焰/熔岩效果
    love.graphics.setColor(0.9, 0.3, 0.1, 0.8)  -- 红色火焰
    love.graphics.ellipse("fill", 16, 23, 5, 2)
    
    -- 火焰细节
    love.graphics.setColor(1.0, 0.6, 0.0, 0.7)  -- 橙色火焰
    for i = 1, 3 do
        local x = 14 + i
        local y = 22 - math.sin(i) * 1.5
        local sizeX = 1 + math.sin(i * 0.5) * 0.5
        local sizeY = 1 + math.cos(i * 0.5) * 0.5
        love.graphics.ellipse("fill", x, y, sizeX, sizeY)
    end
    
    -- 烟雾
    love.graphics.setColor(0.5, 0.5, 0.5, 0.4)  -- 半透明灰色
    love.graphics.circle("fill", 15, 14, 2)
    love.graphics.circle("fill", 17, 12, 1.5)
    love.graphics.circle("fill", 14, 13, 1)
    
    -- 山体纹理
    love.graphics.setColor(0.45, 0.35, 0.3)
    
    -- 随机山体纹理点
    for i = 1, 15 do
        local x = 5 + math.random(0, 22)
        local y = 10 + math.random(0, 16)
        local size = math.random(1, 2)
        
        -- 确保点在山体内部
        if x > 3 and x < 29 and y > 6 and y < 27 then
            love.graphics.circle("fill", x, y, size * 0.3)
        end
    end
    
    -- 宝藏（金币堆）暗示
    love.graphics.setColor(0.9, 0.8, 0.2)  -- 金色
    love.graphics.circle("fill", 20, 24, 0.6)
    love.graphics.circle("fill", 19, 25, 0.4)
    love.graphics.circle("fill", 21, 25, 0.5)
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
    
    return data
end

-- 生成所有建筑图像
function BuildingSprites.generateAll()
    -- 确保目录存在
    ensureDirectoryExists()
    
    -- 生成所有建筑图像
    BuildingSprites.generateDefaultBuilding()
    BuildingSprites.generateSlimeNest()
    BuildingSprites.generateGoblinHut()
    BuildingSprites.generateSkeletonGraveyard()
    BuildingSprites.generateZombieGraveyard()
    BuildingSprites.generateWerewolfDen()
    BuildingSprites.generateGhostMansion()
    BuildingSprites.generateGiantFurnace()
    BuildingSprites.generateWitchHut()
    BuildingSprites.generateDragonCave()
end

return BuildingSprites 