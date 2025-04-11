-- 史莱姆精灵生成模块
local SlimeSprite = {}

-- 生成史莱姆精灵表
function SlimeSprite.generate()
    local filename = "assets/sprites/slime_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵表已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local sheetWidth, sheetHeight = 64, 32  -- 4x2帧，每帧16x16
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制史莱姆空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 设置颜色 (绿色史莱姆)
        love.graphics.setColor(0.4, 0.8, 0.3)
        
        -- 基础形状
        local height = 5 + math.sin(i * math.pi / 2) * 1.5
        love.graphics.ellipse("fill", x + 8, y + 11, 6, height)
        
        -- 边缘
        love.graphics.setColor(0.2, 0.5, 0.1)
        love.graphics.ellipse("line", x + 8, y + 11, 6, height)
        
        -- 眼睛
        love.graphics.setColor(1, 1, 1)
        love.graphics.circle("fill", x + 6, y + 9, 1.5)
        love.graphics.circle("fill", x + 10, y + 9, 1.5)
        
        -- 瞳孔
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", x + 6, y + 9, 0.7)
        love.graphics.circle("fill", x + 10, y + 9, 0.7)
    end
    
    -- 绘制史莱姆移动动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 设置颜色
        love.graphics.setColor(0.4, 0.8, 0.3)
        
        -- 跳跃动画
        local jumpHeight = {2, 4, 2, 0}  -- 跳跃高度
        local squash = {1.2, 0.8, 1.0, 1.2}  -- 挤压系数
        
        -- 基础形状
        love.graphics.ellipse("fill", x + 8, y + 11 - jumpHeight[i+1], 6 * squash[i+1], 5 / squash[i+1])
        
        -- 边缘
        love.graphics.setColor(0.2, 0.5, 0.1)
        love.graphics.ellipse("line", x + 8, y + 11 - jumpHeight[i+1], 6 * squash[i+1], 5 / squash[i+1])
        
        -- 眼睛
        love.graphics.setColor(1, 1, 1)
        love.graphics.circle("fill", x + 6, y + 9 - jumpHeight[i+1], 1.5)
        love.graphics.circle("fill", x + 10, y + 9 - jumpHeight[i+1], 1.5)
        
        -- 瞳孔
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", x + 6, y + 9 - jumpHeight[i+1], 0.7)
        love.graphics.circle("fill", x + 10, y + 9 - jumpHeight[i+1], 0.7)
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
end

return SlimeSprite 