-- 哥布林精灵生成模块
local GoblinSprite = {}

-- 生成哥布林精灵表
function GoblinSprite.generate()
    local filename = "assets/sprites/goblin_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵表已存在，则不再重新生成
    if hasSprites then
        return
    end
    local sheetWidth, sheetHeight = 64, 32  -- 4x2帧，每帧16x16
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制哥布林空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 身体
        love.graphics.setColor(0.5, 0.7, 0.3)
        love.graphics.rectangle("fill", x + 5, y + 7, 6, 7)
        
        -- 头
        love.graphics.setColor(0.5, 0.7, 0.3)
        love.graphics.circle("fill", x + 8, y + 5, 3)
        
        -- 耳朵
        love.graphics.setColor(0.5, 0.7, 0.3)
        love.graphics.polygon("fill", x + 5, y + 5, x + 3, y + 2, x + 4, y + 6)
        love.graphics.polygon("fill", x + 11, y + 5, x + 13, y + 2, x + 12, y + 6)
        
        -- 眼睛
        love.graphics.setColor(0.9, 0.1, 0.1)
        love.graphics.circle("fill", x + 7, y + 4, 0.8)
        love.graphics.circle("fill", x + 9, y + 4, 0.8)
        
        -- 轻微的呼吸动画
        if i % 2 == 0 then
            love.graphics.setColor(0.4, 0.6, 0.2)
            love.graphics.line(x + 6, y + 11, x + 10, y + 11)
        else
            love.graphics.setColor(0.4, 0.6, 0.2)
            love.graphics.line(x + 6, y + 10, x + 10, y + 10)
        end
        
        -- 手臂
        love.graphics.setColor(0.4, 0.6, 0.2)
        love.graphics.line(x + 5, y + 9, x + 3, y + 10 + i % 2)
        love.graphics.line(x + 11, y + 9, x + 13, y + 10 + i % 2)
        
        -- 腿部
        love.graphics.setColor(0.4, 0.6, 0.2)
        love.graphics.line(x + 6, y + 14, x + 5, y + 16)
        love.graphics.line(x + 10, y + 14, x + 11, y + 16)
    end
    
    -- 绘制哥布林移动动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 身体
        love.graphics.setColor(0.5, 0.7, 0.3)
        love.graphics.rectangle("fill", x + 5, y + 7, 6, 7)
        
        -- 头
        love.graphics.setColor(0.5, 0.7, 0.3)
        love.graphics.circle("fill", x + 8, y + 5, 3)
        
        -- 耳朵
        love.graphics.setColor(0.5, 0.7, 0.3)
        love.graphics.polygon("fill", x + 5, y + 5, x + 3, y + 2, x + 4, y + 6)
        love.graphics.polygon("fill", x + 11, y + 5, x + 13, y + 2, x + 12, y + 6)
        
        -- 眼睛
        love.graphics.setColor(0.9, 0.1, 0.1)
        love.graphics.circle("fill", x + 7, y + 4, 0.8)
        love.graphics.circle("fill", x + 9, y + 4, 0.8)
        
        -- 跑步动画的手臂和腿部
        local legOffset = {0, 1, 0, -1}
        
        -- 手臂
        love.graphics.setColor(0.4, 0.6, 0.2)
        love.graphics.line(x + 5, y + 9, x + 3, y + 10 + legOffset[i+1])
        love.graphics.line(x + 11, y + 9, x + 13, y + 10 - legOffset[i+1])
        
        -- 腿部
        love.graphics.setColor(0.4, 0.6, 0.2)
        love.graphics.line(x + 6, y + 14, x + 5, y + 16 + legOffset[i+1])
        love.graphics.line(x + 10, y + 14, x + 11, y + 16 - legOffset[i+1])
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
end

return GoblinSprite 