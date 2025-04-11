-- 幽灵精灵生成模块
local GhostSprite = {}

-- 生成幽灵精灵表
function GhostSprite.generate()
    local filename = "assets/sprites/ghost_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵表已存在，则不再重新生成
    if hasSprites then
        return
    end

    local sheetWidth, sheetHeight = 64, 48  -- 4x3帧，每帧16x16
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制幽灵空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 基础透明度（随呼吸变化）
        local alpha = 0.6 + 0.2 * math.sin(i * math.pi / 2)
        
        -- 幽灵身体（半透明白色）
        love.graphics.setColor(0.9, 0.95, 1.0, alpha)
        love.graphics.circle("fill", x + 8, y + 8, 5)
        
        -- 幽灵下摆（飘动的尾部）
        love.graphics.setColor(0.9, 0.95, 1.0, alpha * 0.8)
        local waveOffset = math.sin(i * math.pi / 2) * 0.5
        love.graphics.polygon("fill", 
            x + 3, y + 8, 
            x + 5 + waveOffset, y + 13, 
            x + 8, y + 11, 
            x + 11 - waveOffset, y + 13, 
            x + 13, y + 8)
        
        -- 幽灵眼睛（黑色眼洞）
        love.graphics.setColor(0, 0, 0.1, 0.8)
        love.graphics.circle("fill", x + 6, y + 7, 1.2)
        love.graphics.circle("fill", x + 10, y + 7, 1.2)
        
        -- 幽灵嘴巴（呜呜声）
        if i % 2 == 0 then
            love.graphics.setColor(0, 0, 0.1, 0.6)
            love.graphics.ellipse("fill", x + 8, y + 10, 1.5, 1)
        else
            love.graphics.setColor(0, 0, 0.1, 0.6)
            love.graphics.ellipse("fill", x + 8, y + 10, 1, 1.5)
        end
        
        -- 幽魂光环效果
        love.graphics.setColor(0.9, 0.95, 1.0, 0.1 + 0.05 * math.sin(i * math.pi))
        love.graphics.circle("fill", x + 8, y + 8, 6.5)
    end
    
    -- 绘制幽灵移动动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 飘动效果
        local floatY = math.sin(i * math.pi / 2) * 1.5
        local alpha = 0.6 + 0.1 * math.sin(i * math.pi / 2)
        
        -- 幽灵身体（飘动）
        love.graphics.setColor(0.9, 0.95, 1.0, alpha)
        love.graphics.circle("fill", x + 8, y + 8 + floatY, 5)
        
        -- 幽灵下摆（飘动的尾部）
        love.graphics.setColor(0.9, 0.95, 1.0, alpha * 0.8)
        local waveOffset = math.sin((i + 2) * math.pi / 2) * 1
        love.graphics.polygon("fill", 
            x + 3, y + 8 + floatY, 
            x + 5 + waveOffset, y + 13 + floatY, 
            x + 8, y + 11 + floatY, 
            x + 11 - waveOffset, y + 13 + floatY, 
            x + 13, y + 8 + floatY)
        
        -- 幽灵眼睛（移动时更大的眼睛）
        love.graphics.setColor(0, 0, 0.1, 0.8)
        love.graphics.circle("fill", x + 6, y + 7 + floatY, 1.2 + i % 2 * 0.3)
        love.graphics.circle("fill", x + 10, y + 7 + floatY, 1.2 + i % 2 * 0.3)
        
        -- 移动方向（朝向动画）
        local dirX = i % 2 == 0 and -0.5 or 0.5
        
        -- 幽灵嘴巴（飘动叫声）
        love.graphics.setColor(0, 0, 0.1, 0.7)
        love.graphics.ellipse("fill", x + 8 + dirX, y + 10 + floatY, 1.8, 1 + i % 2)
        
        -- 移动残影
        love.graphics.setColor(0.9, 0.95, 1.0, 0.1 + (3-i) * 0.02)
        love.graphics.circle("fill", x + 8 - dirX * 3, y + 8 + floatY - 1, 4)
        
        -- 幽魂光环效果
        love.graphics.setColor(0.9, 0.95, 1.0, 0.1 + 0.05 * math.sin(i * math.pi))
        love.graphics.circle("fill", x + 8, y + 8 + floatY, 6.5)
    end
    
    -- 绘制幽灵攻击动画帧（第三行）
    for i = 0, 3 do
        local x, y = i * 16, 32
        
        -- 攻击姿势（变形+扩大）
        local scaleFactor = 1 + i * 0.2
        local alpha = 0.7 + i * 0.1
        
        -- 幽灵身体（膨胀）
        love.graphics.setColor(0.9, 0.95, 1.0, alpha - 0.1 * i)
        love.graphics.circle("fill", x + 8, y + 8, 5 * scaleFactor)
        
        -- 幽灵下摆（攻击时收缩）
        love.graphics.setColor(0.9, 0.95, 1.0, (alpha - 0.2 * i) * 0.8)
        local attackWave = 1 - i * 0.2
        if attackWave < 0 then attackWave = 0 end
        
        love.graphics.polygon("fill", 
            x + 3, y + 8, 
            x + 5, y + 10 + attackWave, 
            x + 8, y + 9 + attackWave, 
            x + 11, y + 10 + attackWave, 
            x + 13, y + 8)
        
        -- 幽灵眼睛（攻击时变红）
        local redFactor = i * 0.3
        love.graphics.setColor(redFactor, 0, 0.1, 0.9)
        love.graphics.circle("fill", x + 6, y + 7, 1.5 + i * 0.2)
        love.graphics.circle("fill", x + 10, y + 7, 1.5 + i * 0.2)
        
        -- 幽灵嘴巴（尖叫）
        love.graphics.setColor(redFactor, 0, 0.1, 0.8)
        love.graphics.ellipse("fill", x + 8, y + 10, 2 + i * 0.5, 1 + i * 0.5)
        
        -- 攻击能量效果
        if i > 0 then
            love.graphics.setColor(0.9 + redFactor, 0.9, 1.0, 0.5 - i * 0.1)
            love.graphics.circle("line", x + 8, y + 8, 7 + i * 1.5)
            
            -- 能量光线
            local rayCount = i * 2
            for r = 1, rayCount do
                local angle = (r / rayCount) * math.pi * 2
                local rayLength = 2 + i * 1.5
                love.graphics.setColor(0.9, 0.9, 1.0, 0.4 - i * 0.1)
                love.graphics.line(
                    x + 8 + math.cos(angle) * 7, 
                    y + 8 + math.sin(angle) * 7,
                    x + 8 + math.cos(angle) * (7 + rayLength),
                    y + 8 + math.sin(angle) * (7 + rayLength)
                )
            end
        end
        
        -- 幽魂光环效果（攻击时更亮）
        love.graphics.setColor(0.9, 0.95, 1.0, 0.1 + 0.1 * i)
        love.graphics.circle("fill", x + 8, y + 8, 6.5 + i)
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
end

return GhostSprite 