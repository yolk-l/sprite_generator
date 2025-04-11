-- 女巫精灵生成模块
local WitchSprite = {}

-- 生成女巫精灵表
function WitchSprite.generate()
    local filename = "assets/sprites/witch_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵表已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local sheetWidth, sheetHeight = 64, 48  -- 4x3帧，每帧16x16
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制女巫空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 女巫身体（黑色长袍）
        love.graphics.setColor(0.2, 0.1, 0.3)
        love.graphics.rectangle("fill", x + 6, y + 7, 4, 7)
        
        -- 头（绿皮肤）
        love.graphics.setColor(0.4, 0.8, 0.4)
        love.graphics.circle("fill", x + 8, y + 5, 3)
        
        -- 尖尖的帽子
        love.graphics.setColor(0.2, 0.1, 0.3)
        love.graphics.polygon("fill", x + 5, y + 3, x + 8, y - 2, x + 11, y + 3)
        
        -- 帽子装饰
        love.graphics.setColor(0.8, 0.7, 0.1)
        love.graphics.line(x + 8, y, x + 9, y)
        
        -- 眼睛（闪烁的绿光）
        local glowFactor = 0.4 + 0.2 * math.sin(i * math.pi / 2)
        love.graphics.setColor(0.1, 0.8 * glowFactor, 0.1)
        love.graphics.circle("fill", x + 7, y + 4, 0.7)
        love.graphics.circle("fill", x + 9, y + 4, 0.7)
        
        -- 尖尖的鼻子和下巴
        love.graphics.setColor(0.3, 0.7, 0.3)
        love.graphics.line(x + 8, y + 5, x + 8, y + 6)
        love.graphics.line(x + 7, y + 7, x + 9, y + 7)
        
        -- 呼吸动画
        local breathOffset = 0.2 * math.sin(i * math.pi)
        
        -- 手臂（拿魔杖）
        love.graphics.setColor(0.2, 0.1, 0.3)
        love.graphics.line(x + 6, y + 9, x + 3, y + 9 + breathOffset)
        love.graphics.line(x + 10, y + 9, x + 12, y + 11 + breathOffset)
        
        -- 魔杖
        love.graphics.setColor(0.4, 0.2, 0.1)
        love.graphics.line(x + 3, y + 9 + breathOffset, x + 2, y + 6 + breathOffset)
        
        -- 魔杖顶端亮光
        love.graphics.setColor(0.8, 0.7, 0.1, 0.5 + glowFactor)
        love.graphics.circle("fill", x + 2, y + 6 + breathOffset, 1)
    end
    
    -- 绘制女巫移动动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 飘动的长袍（飞行）
        local floatOffset = 1 * math.sin(i * math.pi / 2)
        
        -- 女巫身体（黑色长袍，飘动）
        love.graphics.setColor(0.2, 0.1, 0.3)
        love.graphics.rectangle("fill", x + 6, y + 7 - floatOffset, 4, 7)
        
        -- 长袍尾部（飘动）
        love.graphics.setColor(0.2, 0.1, 0.3, 0.7)
        love.graphics.polygon("fill", 
            x + 5, y + 14 - floatOffset, 
            x + 7, y + 15 - floatOffset + i%2, 
            x + 9, y + 15 - floatOffset + (i+1)%2, 
            x + 11, y + 14 - floatOffset)
        
        -- 头（绿皮肤）
        love.graphics.setColor(0.4, 0.8, 0.4)
        love.graphics.circle("fill", x + 8, y + 5 - floatOffset, 3)
        
        -- 尖尖的帽子
        love.graphics.setColor(0.2, 0.1, 0.3)
        love.graphics.polygon("fill", x + 5, y + 3 - floatOffset, x + 8, y - 2 - floatOffset, x + 11, y + 3 - floatOffset)
        
        -- 帽子装饰
        love.graphics.setColor(0.8, 0.7, 0.1)
        love.graphics.line(x + 8, y - floatOffset, x + 9, y - floatOffset)
        
        -- 眼睛（闪烁的绿光）
        local glowFactor = 0.5 + 0.3 * math.sin(i * math.pi / 2)
        love.graphics.setColor(0.1, 0.8 * glowFactor, 0.1)
        love.graphics.circle("fill", x + 7, y + 4 - floatOffset, 0.7)
        love.graphics.circle("fill", x + 9, y + 4 - floatOffset, 0.7)
        
        -- 尖尖的鼻子和下巴
        love.graphics.setColor(0.3, 0.7, 0.3)
        love.graphics.line(x + 8, y + 5 - floatOffset, x + 8, y + 6 - floatOffset)
        love.graphics.line(x + 7, y + 7 - floatOffset, x + 9, y + 7 - floatOffset)
        
        -- 手臂（拿魔杖）
        love.graphics.setColor(0.2, 0.1, 0.3)
        love.graphics.line(x + 6, y + 9 - floatOffset, x + 3, y + 8 + i%2 - floatOffset)
        love.graphics.line(x + 10, y + 9 - floatOffset, x + 12, y + 10 - i%2 - floatOffset)
        
        -- 魔杖
        love.graphics.setColor(0.4, 0.2, 0.1)
        love.graphics.line(x + 3, y + 8 + i%2 - floatOffset, x + 2, y + 5 - floatOffset)
        
        -- 魔杖顶端亮光
        love.graphics.setColor(0.8, 0.7, 0.1, 0.6 + 0.3 * (i%2))
        love.graphics.circle("fill", x + 2, y + 5 - floatOffset, 1)
        
        -- 飞行闪烁效果
        if i % 2 == 0 then
            love.graphics.setColor(0.8, 0.7, 0.1, 0.3)
            love.graphics.line(x + 6, y + 14 - floatOffset, x + 5, y + 16 - floatOffset)
            love.graphics.line(x + 10, y + 14 - floatOffset, x + 11, y + 16 - floatOffset)
        end
    end
    
    -- 绘制女巫攻击动画帧（第三行）
    for i = 0, 3 do
        local x, y = i * 16, 32
        
        -- 攻击姿势（施法）
        
        -- 女巫身体（黑色长袍）
        love.graphics.setColor(0.2, 0.1, 0.3)
        love.graphics.rectangle("fill", x + 6, y + 7, 4, 7)
        
        -- 头（绿皮肤）
        love.graphics.setColor(0.4, 0.8, 0.4)
        love.graphics.circle("fill", x + 8, y + 5, 3)
        
        -- 尖尖的帽子
        love.graphics.setColor(0.2, 0.1, 0.3)
        love.graphics.polygon("fill", x + 5, y + 3, x + 8, y - 2, x + 11, y + 3)
        
        -- 帽子装饰（闪亮）
        local shine = i * 0.1
        love.graphics.setColor(0.8 + shine, 0.7 + shine, 0.1, 0.8)
        love.graphics.line(x + 8, y, x + 9, y)
        
        -- 眼睛（施法时发亮）
        love.graphics.setColor(0, 0.8 + i*0.1, 0, 0.7 + i*0.1)
        love.graphics.circle("fill", x + 7, y + 4, 0.8 + i*0.1)
        love.graphics.circle("fill", x + 9, y + 4, 0.8 + i*0.1)
        
        -- 嘴巴（施法时吟唱）
        love.graphics.setColor(0.3, 0.7, 0.3)
        love.graphics.circle("fill", x + 8, y + 6, 0.5 + 0.2 * i)
        
        -- 施法手姿势
        local spellAngle = i * math.pi / 6
        local sx = math.cos(spellAngle) * 5
        local sy = math.sin(spellAngle) * 2
        
        -- 手臂（施法姿势）
        love.graphics.setColor(0.2, 0.1, 0.3)
        love.graphics.line(x + 6, y + 9, x + 3 + sx/3, y + 9 + sy/3)
        
        -- 魔杖（举起施法）
        love.graphics.setColor(0.4, 0.2, 0.1)
        love.graphics.line(x + 3 + sx/3, y + 9 + sy/3, x + 1 + sx, y + 7 + sy)
        
        -- 魔杖顶端亮光（越来越亮）
        love.graphics.setColor(0.8, 0.7, 0.1, 0.6 + i*0.1)
        love.graphics.circle("fill", x + 1 + sx, y + 7 + sy, 1 + i*0.3)
        
        -- 另一只手（辅助施法）
        love.graphics.setColor(0.2, 0.1, 0.3)
        love.graphics.line(x + 10, y + 9, x + 11 + i, y + 8 - i)
        
        -- 法术效果（绿色光球）
        if i > 0 then
            love.graphics.setColor(0.1, 0.9, 0.1, 0.3 + i*0.2)
            love.graphics.circle("fill", x + 11 + i*1.5, y + 8 - i, 1 + i)
            love.graphics.setColor(0, 0.7, 0, 0.5)
            love.graphics.circle("line", x + 11 + i*1.5, y + 8 - i, 1.5 + i*1.2)
        end
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
end

return WitchSprite 