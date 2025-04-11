-- 玩家精灵生成模块
local PlayerSprite = {}

-- 生成玩家精灵表
function PlayerSprite.generate()
    local filename = "assets/sprites/player_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵表已存在，则不再重新生成
    if hasSprites then
        return
    end
    local sheetWidth, sheetHeight = 64, 32  -- 4x2帧，每帧16x16
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制玩家空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 基础形状
        love.graphics.setColor(0.2, 0.6, 1.0)  -- 蓝色
        love.graphics.circle("fill", x + 8, y + 8, 6)
        
        -- 边缘
        love.graphics.setColor(0.1, 0.3, 0.5)
        love.graphics.circle("line", x + 8, y + 8, 6)
        
        -- 添加动画变化（脉动效果）
        local scale = 0.8 + 0.2 * math.sin(i * math.pi / 2)
        
        -- 武器
        love.graphics.setColor(0.8, 0.8, 0.8)
        love.graphics.line(x + 8, y + 8, x + 8 + 4 * scale, y + 8 - 4 * scale)
    end
    
    -- 绘制玩家攻击动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 基础形状
        love.graphics.setColor(0.2, 0.6, 1.0)  -- 蓝色
        love.graphics.circle("fill", x + 8, y + 8, 6)
        
        -- 边缘
        love.graphics.setColor(0.1, 0.3, 0.5)
        love.graphics.circle("line", x + 8, y + 8, 6)
        
        -- 添加攻击动画（武器挥舞）
        local angle = i * math.pi / 2
        local wx = math.cos(angle) * 8
        local wy = math.sin(angle) * 8
        
        -- 武器
        love.graphics.setColor(0.8, 0.8, 0.8)
        love.graphics.line(x + 8, y + 8, x + 8 + wx, y + 8 + wy)
        
        -- 攻击效果
        if i > 0 then
            love.graphics.setColor(1, 0.7, 0.2, 0.7 - i * 0.2)
            love.graphics.circle("line", x + 8 + wx * 1.2, y + 8 + wy * 1.2, 3 + i)
        end
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
end

return PlayerSprite 