-- 狼人精灵生成模块
local WerewolfSprite = {}

-- 生成狼人精灵表
function WerewolfSprite.generate()
    local filename = "assets/sprites/werewolf_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵表已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local sheetWidth, sheetHeight = 64, 48  -- 4x3帧，每帧16x16
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制狼人空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 狼人身体（褐色）
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.rectangle("fill", x + 6, y + 7, 4, 6)
        
        -- 狼人头（略大，有吻部特征）
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.circle("fill", x + 8, y + 4, 3.2)
        
        -- 狼吻（突出的部分）
        love.graphics.setColor(0.5, 0.35, 0.2)
        love.graphics.polygon("fill", x + 8, y + 5, x + 6, y + 4, x + 8, y + 2)
        
        -- 耳朵（尖尖的）
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.polygon("fill", x + 6, y + 2, x + 5, y + 0, x + 7, y + 1)
        love.graphics.polygon("fill", x + 10, y + 2, x + 11, y + 0, x + 9, y + 1)
        
        -- 眼睛（黄色，狼的特征）
        love.graphics.setColor(0.9, 0.8, 0.2)
        love.graphics.circle("fill", x + 7, y + 3, 0.8)
        love.graphics.circle("fill", x + 9, y + 3, 0.8)
        
        -- 瞳孔
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", x + 7, y + 3, 0.4)
        love.graphics.circle("fill", x + 9, y + 3, 0.4)
        
        -- 呼吸动画
        local breath = math.sin(i * math.pi / 2) * 0.3
        
        -- 手臂（肌肉发达）
        love.graphics.setColor(0.5, 0.35, 0.2)
        love.graphics.line(x + 6, y + 9, x + 4, y + 10 + breath)
        love.graphics.line(x + 10, y + 9, x + 12, y + 10 + breath)
        
        -- 爪子
        love.graphics.setColor(0.3, 0.2, 0.1)
        -- 左爪
        love.graphics.line(x + 4, y + 10 + breath, x + 3, y + 9 + breath)
        love.graphics.line(x + 4, y + 10 + breath, x + 3.5, y + 11 + breath)
        love.graphics.line(x + 4, y + 10 + breath, x + 4.5, y + 11 + breath)
        -- 右爪
        love.graphics.line(x + 12, y + 10 + breath, x + 13, y + 9 + breath)
        love.graphics.line(x + 12, y + 10 + breath, x + 11.5, y + 11 + breath)
        love.graphics.line(x + 12, y + 10 + breath, x + 12.5, y + 11 + breath)
        
        -- 腿部（强壮）
        love.graphics.setColor(0.5, 0.35, 0.2)
        love.graphics.line(x + 7, y + 13, x + 6, y + 16)
        love.graphics.line(x + 9, y + 13, x + 10, y + 16)
        
        -- 尾巴
        love.graphics.setColor(0.5, 0.35, 0.2)
        love.graphics.line(x + 8, y + 13, x + 11, y + 12 + i % 2)
    end
    
    -- 绘制狼人移动动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 动态姿势（稍微前倾）
        local lean = 0.5
        
        -- 狼人身体
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.rectangle("fill", x + 6 + lean, y + 7, 4, 6)
        
        -- 狼人头
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.circle("fill", x + 8 + lean, y + 4, 3.2)
        
        -- 狼吻
        love.graphics.setColor(0.5, 0.35, 0.2)
        love.graphics.polygon("fill", x + 8 + lean, y + 5, x + 6 + lean, y + 4, x + 8 + lean, y + 2)
        
        -- 耳朵
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.polygon("fill", x + 6 + lean, y + 2, x + 5 + lean, y + 0, x + 7 + lean, y + 1)
        love.graphics.polygon("fill", x + 10 + lean, y + 2, x + 11 + lean, y + 0, x + 9 + lean, y + 1)
        
        -- 眼睛（跑步时更亮）
        love.graphics.setColor(1.0, 0.9, 0.3)
        love.graphics.circle("fill", x + 7 + lean, y + 3, 0.8)
        love.graphics.circle("fill", x + 9 + lean, y + 3, 0.8)
        
        -- 瞳孔
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", x + 7 + lean, y + 3, 0.4)
        love.graphics.circle("fill", x + 9 + lean, y + 3, 0.4)
        
        -- 跑步动画
        local legOffset = {2, 1, 0, 1}
        
        -- 手臂（跑步姿势）
        love.graphics.setColor(0.5, 0.35, 0.2)
        love.graphics.line(x + 6 + lean, y + 9, x + 4 + lean + legOffset[i+1], y + 9)
        love.graphics.line(x + 10 + lean, y + 9, x + 12 + lean - legOffset[i+1], y + 9)
        
        -- 爪子
        love.graphics.setColor(0.3, 0.2, 0.1)
        -- 左爪
        love.graphics.line(x + 4 + lean + legOffset[i+1], y + 9, x + 3 + lean + legOffset[i+1], y + 8)
        love.graphics.line(x + 4 + lean + legOffset[i+1], y + 9, x + 3 + lean + legOffset[i+1], y + 10)
        love.graphics.line(x + 4 + lean + legOffset[i+1], y + 9, x + 5 + lean + legOffset[i+1], y + 10)
        -- 右爪
        love.graphics.line(x + 12 + lean - legOffset[i+1], y + 9, x + 13 + lean - legOffset[i+1], y + 8)
        love.graphics.line(x + 12 + lean - legOffset[i+1], y + 9, x + 11 + lean - legOffset[i+1], y + 10)
        love.graphics.line(x + 12 + lean - legOffset[i+1], y + 9, x + 13 + lean - legOffset[i+1], y + 10)
        
        -- 腿部（强壮有力的跑步姿势）
        love.graphics.setColor(0.5, 0.35, 0.2)
        love.graphics.line(x + 7 + lean, y + 13, x + 5 + lean - legOffset[i+1], y + 15)
        love.graphics.line(x + 9 + lean, y + 13, x + 11 + lean + legOffset[i+1], y + 15)
        
        -- 尾巴（跑步时上扬）
        love.graphics.setColor(0.5, 0.35, 0.2)
        love.graphics.line(x + 8 + lean, y + 13, x + 11 + lean, y + 10 + i % 2)
    end
    
    -- 绘制狼人攻击动画帧（第三行）
    for i = 0, 3 do
        local x, y = i * 16, 32
        
        -- 身体（攻击姿势，稍微下蹲）
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.rectangle("fill", x + 6, y + 8 + i * 0.3, 4, 5)
        
        -- 头（略微低头攻击姿势）
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.circle("fill", x + 8, y + 5 + i * 0.3, 3.2)
        
        -- 狼吻（露出獠牙）
        love.graphics.setColor(0.5, 0.35, 0.2)
        love.graphics.polygon("fill", x + 8, y + 6 + i * 0.3, x + 6, y + 5 + i * 0.3, x + 8, y + 3 + i * 0.3)
        
        -- 獠牙
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.line(x + 7, y + 6 + i * 0.3, x + 7, y + 7 + i * 0.3)
        love.graphics.line(x + 9, y + 6 + i * 0.3, x + 9, y + 7 + i * 0.3)
        
        -- 耳朵（竖起）
        love.graphics.setColor(0.6, 0.4, 0.2)
        love.graphics.polygon("fill", x + 6, y + 3 + i * 0.3, x + 5, y + 0 + i * 0.3, x + 7, y + 2 + i * 0.3)
        love.graphics.polygon("fill", x + 10, y + 3 + i * 0.3, x + 11, y + 0 + i * 0.3, x + 9, y + 2 + i * 0.3)
        
        -- 眼睛（愤怒，发红）
        love.graphics.setColor(1.0, 0.2, 0.2)
        love.graphics.circle("fill", x + 7, y + 4 + i * 0.3, 0.8)
        love.graphics.circle("fill", x + 9, y + 4 + i * 0.3, 0.8)
        
        -- 瞳孔
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", x + 7, y + 4 + i * 0.3, 0.4)
        love.graphics.circle("fill", x + 9, y + 4 + i * 0.3, 0.4)
        
        -- 攻击动画（双爪前挥）
        local attackAngle = i * math.pi / 3
        local ax = math.cos(attackAngle - 0.5) * 4
        local ay = math.sin(attackAngle - 0.5) * 4
        
        -- 手臂（攻击姿势）
        love.graphics.setColor(0.5, 0.35, 0.2)
        love.graphics.line(x + 6, y + 10 + i * 0.3, x + 3 + ax, y + 8 + ay)
        love.graphics.line(x + 10, y + 10 + i * 0.3, x + 13 - ax, y + 8 - ay)
        
        -- 爪子（攻击状态，更明显）
        love.graphics.setColor(0.3, 0.2, 0.1)
        -- 左爪
        love.graphics.line(x + 3 + ax, y + 8 + ay, x + 2 + ax, y + 7 + ay)
        love.graphics.line(x + 3 + ax, y + 8 + ay, x + 2 + ax, y + 9 + ay)
        love.graphics.line(x + 3 + ax, y + 8 + ay, x + 4 + ax, y + 7 + ay)
        -- 右爪
        love.graphics.line(x + 13 - ax, y + 8 - ay, x + 14 - ax, y + 7 - ay)
        love.graphics.line(x + 13 - ax, y + 8 - ay, x + 12 - ax, y + 7 - ay)
        love.graphics.line(x + 13 - ax, y + 8 - ay, x + 14 - ax, y + 9 - ay)
        
        -- 腿部（下蹲攻击姿势）
        love.graphics.setColor(0.5, 0.35, 0.2)
        love.graphics.line(x + 7, y + 13 + i * 0.3, x + 5, y + 16)
        love.graphics.line(x + 9, y + 13 + i * 0.3, x + 11, y + 16)
        
        -- 尾巴（攻击时上扬）
        love.graphics.setColor(0.5, 0.35, 0.2)
        love.graphics.line(x + 8, y + 13 + i * 0.3, x + 12, y + 10)
        
        -- 攻击效果
        if i > 1 then
            love.graphics.setColor(0.8, 0.2, 0.2, 0.7 - i * 0.15)
            love.graphics.arc("line", x + 3 + ax * 1.3, y + 8 + ay * 1.3, 2 + i, attackAngle - 1, attackAngle)
            love.graphics.arc("line", x + 13 - ax * 1.3, y + 8 - ay * 1.3, 2 + i, -attackAngle, -attackAngle + 1)
        end
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
end

return WerewolfSprite 