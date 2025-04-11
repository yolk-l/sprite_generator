-- 小龙精灵生成模块
local DragonSprite = {}

-- 生成小龙精灵表
function DragonSprite.generate()
    local  filename = "assets/sprites/dragon_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵表已存在，则不再重新生成
    if hasSprites then
        return
    end

    local sheetWidth, sheetHeight = 64, 48  -- 4x3帧，每帧16x16
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制小龙空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 小龙身体（红色）
        love.graphics.setColor(0.8, 0.2, 0.2)
        local bodyHeight = 5 + math.sin(i * math.pi / 2) * 0.5
        love.graphics.ellipse("fill", x + 8, y + 10, 3, bodyHeight)
        
        -- 小龙头部（红色）
        love.graphics.setColor(0.8, 0.2, 0.2)
        love.graphics.circle("fill", x + 8, y + 6, 3)
        
        -- 龙角（两侧尖角）
        love.graphics.setColor(0.7, 0.7, 0.7)
        love.graphics.polygon("fill", x + 6, y + 4, x + 5, y + 2, x + 7, y + 4)
        love.graphics.polygon("fill", x + 10, y + 4, x + 11, y + 2, x + 9, y + 4)
        
        -- 龙眼（黄色）
        love.graphics.setColor(0.9, 0.8, 0.1)
        love.graphics.circle("fill", x + 7, y + 5, 0.7)
        love.graphics.circle("fill", x + 9, y + 5, 0.7)
        
        -- 龙瞳（黑色，竖直）
        love.graphics.setColor(0, 0, 0)
        love.graphics.ellipse("fill", x + 7, y + 5, 0.3, 0.5)
        love.graphics.ellipse("fill", x + 9, y + 5, 0.3, 0.5)
        
        -- 龙嘴（呼吸动画）
        if i % 2 == 0 then
            love.graphics.setColor(0.7, 0.1, 0.1)
            love.graphics.line(x + 7, y + 7, x + 9, y + 7)
        else
            love.graphics.setColor(0.9, 0.3, 0)
            love.graphics.polygon("fill", x + 7, y + 7, x + 8, y + 8, x + 9, y + 7)
        end
        
        -- 翅膀（展开状态）
        local wingAngle = math.sin(i * math.pi / 2) * 0.2
        
        -- 左翅膀
        love.graphics.setColor(0.8, 0.2, 0.2, 0.9)
        love.graphics.polygon("fill", 
            x + 5, y + 7, 
            x + 3, y + 5 - wingAngle, 
            x + 2, y + 7, 
            x + 3, y + 9 + wingAngle)
            
        -- 右翅膀
        love.graphics.polygon("fill", 
            x + 11, y + 7, 
            x + 13, y + 5 - wingAngle, 
            x + 14, y + 7, 
            x + 13, y + 9 + wingAngle)
        
        -- 翅膀纹理
        love.graphics.setColor(0.6, 0.1, 0.1)
        love.graphics.line(x + 5, y + 7, x + 3, y + 7)
        love.graphics.line(x + 11, y + 7, x + 13, y + 7)
        
        -- 尾巴（摆动）
        love.graphics.setColor(0.8, 0.2, 0.2)
        local tailWag = math.sin(i * math.pi / 2) * 2
        love.graphics.line(x + 8, y + 13, x + 8 + tailWag, y + 15)
        
        -- 尾巴尖（三角形）
        love.graphics.polygon("fill", 
            x + 8 + tailWag, y + 15, 
            x + 7 + tailWag, y + 16, 
            x + 9 + tailWag, y + 16)
    end
    
    -- 绘制小龙移动动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 飞行高度变化
        local flyHeight = math.sin(i * math.pi / 2) * 2
        
        -- 小龙身体（飞行姿态）
        love.graphics.setColor(0.8, 0.2, 0.2)
        love.graphics.ellipse("fill", x + 8, y + 10 - flyHeight, 3, 4)
        
        -- 小龙头部（向前倾）
        love.graphics.setColor(0.8, 0.2, 0.2)
        love.graphics.circle("fill", x + 9, y + 6 - flyHeight, 3)
        
        -- 龙角
        love.graphics.setColor(0.7, 0.7, 0.7)
        love.graphics.polygon("fill", x + 7, y + 4 - flyHeight, x + 6, y + 2 - flyHeight, x + 8, y + 4 - flyHeight)
        love.graphics.polygon("fill", x + 11, y + 4 - flyHeight, x + 12, y + 2 - flyHeight, x + 10, y + 4 - flyHeight)
        
        -- 龙眼（飞行时更亮）
        love.graphics.setColor(1.0, 0.9, 0.1)
        love.graphics.circle("fill", x + 8, y + 5 - flyHeight, 0.7)
        love.graphics.circle("fill", x + 10, y + 5 - flyHeight, 0.7)
        
        -- 龙瞳（黑色，飞行时缩小）
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", x + 8, y + 5 - flyHeight, 0.3)
        love.graphics.circle("fill", x + 10, y + 5 - flyHeight, 0.3)
        
        -- 龙嘴（飞行时张开）
        love.graphics.setColor(0.9, 0.3, 0)
        love.graphics.polygon("fill", x + 8, y + 7 - flyHeight, x + 9, y + 8 - flyHeight, x + 10, y + 7 - flyHeight)
        
        -- 翅膀（飞行动画）
        local wingPhase = i % 4
        local wingYOffset = 0
        
        if wingPhase == 0 then -- 上扬
            wingYOffset = -2
        elseif wingPhase == 1 then -- 中间向上
            wingYOffset = -1
        elseif wingPhase == 2 then -- 中间向下
            wingYOffset = 1
        else -- 下垂
            wingYOffset = 2
        end
        
        -- 左翅膀
        love.graphics.setColor(0.8, 0.2, 0.2, 0.9)
        love.graphics.polygon("fill", 
            x + 5, y + 7 - flyHeight, 
            x + 2, y + 5 - flyHeight + wingYOffset, 
            x + 1, y + 8 - flyHeight, 
            x + 2, y + 10 - flyHeight - wingYOffset)
            
        -- 右翅膀
        love.graphics.polygon("fill", 
            x + 11, y + 7 - flyHeight, 
            x + 14, y + 5 - flyHeight + wingYOffset, 
            x + 15, y + 8 - flyHeight, 
            x + 14, y + 10 - flyHeight - wingYOffset)
        
        -- 翅膀纹理
        love.graphics.setColor(0.6, 0.1, 0.1)
        love.graphics.line(x + 5, y + 7 - flyHeight, x + 2, y + 8 - flyHeight)
        love.graphics.line(x + 11, y + 7 - flyHeight, x + 14, y + 8 - flyHeight)
        
        -- 尾巴（飞行时直线型）
        love.graphics.setColor(0.8, 0.2, 0.2)
        love.graphics.line(x + 8, y + 13 - flyHeight, x + 7, y + 16 - flyHeight/2)
        
        -- 尾巴尖
        love.graphics.polygon("fill", 
            x + 7, y + 16 - flyHeight/2, 
            x + 6, y + 17 - flyHeight/2, 
            x + 8, y + 17 - flyHeight/2)
        
        -- 飞行时的气流效果
        if i % 2 == 0 then
            love.graphics.setColor(0.9, 0.9, 0.9, 0.3)
            for j = 1, 3 do
                love.graphics.circle("fill", x + 6 - j*2, y + 8 - flyHeight - j, 0.5)
                love.graphics.circle("fill", x + 10 + j*2, y + 8 - flyHeight - j, 0.5)
            end
        end
    end
    
    -- 绘制小龙攻击动画帧（第三行）
    for i = 0, 3 do
        local x, y = i * 16, 32
        
        -- 攻击姿势（头微低，身体后仰）
        
        -- 小龙身体（攻击姿态）
        love.graphics.setColor(0.8, 0.2, 0.2)
        love.graphics.ellipse("fill", x + 8, y + 10, 3, 4 + i*0.3)
        
        -- 小龙头部（攻击姿态，微低）
        love.graphics.setColor(0.8, 0.2, 0.2)
        love.graphics.circle("fill", x + 8, y + 7 + i*0.3, 3)
        
        -- 龙角（攻击时竖起）
        love.graphics.setColor(0.7, 0.7, 0.7)
        love.graphics.polygon("fill", x + 6, y + 5 + i*0.3, x + 5, y + 2 + i*0.2, x + 7, y + 5 + i*0.3)
        love.graphics.polygon("fill", x + 10, y + 5 + i*0.3, x + 11, y + 2 + i*0.2, x + 9, y + 5 + i*0.3)
        
        -- 龙眼（攻击时发红）
        love.graphics.setColor(1.0, 0.1 + i*0.1, 0.1)
        love.graphics.circle("fill", x + 7, y + 6 + i*0.3, 0.7)
        love.graphics.circle("fill", x + 9, y + 6 + i*0.3, 0.7)
        
        -- 龙瞳（攻击时竖直长）
        love.graphics.setColor(0, 0, 0)
        love.graphics.ellipse("fill", x + 7, y + 6 + i*0.3, 0.2, 0.5 + i*0.1)
        love.graphics.ellipse("fill", x + 9, y + 6 + i*0.3, 0.2, 0.5 + i*0.1)
        
        -- 龙嘴（张开，喷火）
        love.graphics.setColor(0.9, 0.3, 0)
        love.graphics.polygon("fill", x + 7, y + 8 + i*0.3, x + 8, y + 9 + i*0.3, x + 9, y + 8 + i*0.3)
        
        -- 喷火效果
        if i > 0 then
            -- 火焰核心
            love.graphics.setColor(1, 0.8, 0.2, 0.9)
            love.graphics.polygon("fill", 
                x + 8, y + 8 + i*0.3, 
                x + 8 + i*2, y + 6 + i*0.3 - i, 
                x + 8 + i*3, y + 8 + i*0.3, 
                x + 8 + i*2, y + 10 + i*0.3 + i)
                
            -- 外部火焰
            love.graphics.setColor(1, 0.5, 0, 0.7 - i*0.1)
            love.graphics.polygon("fill", 
                x + 8 + i*1.5, y + 7 + i*0.3 - i*0.5, 
                x + 8 + i*4, y + 5 + i*0.3 - i*1.5, 
                x + 8 + i*4, y + 8 + i*0.3, 
                x + 8 + i*4, y + 11 + i*0.3 + i*1.5,
                x + 8 + i*1.5, y + 9 + i*0.3 + i*0.5)
                
            -- 火花
            love.graphics.setColor(1, 0.8, 0, 0.5 - i*0.1)
            for s = 1, i*2 do
                local angle = math.random() * math.pi - math.pi/2
                local dist = 3 + i*2 + math.random() * i
                love.graphics.circle("fill", 
                    x + 8 + i*3 + math.cos(angle) * dist,
                    y + 8 + i*0.3 + math.sin(angle) * dist,
                    0.5 + math.random() * 0.5)
            end
        end
        
        -- 翅膀（攻击姿态，打开）
        
        -- 左翅膀
        love.graphics.setColor(0.8, 0.2, 0.2, 0.9)
        love.graphics.polygon("fill", 
            x + 5, y + 8, 
            x + 2, y + 5 - i, 
            x + 1, y + 8, 
            x + 2, y + 10 + i)
            
        -- 右翅膀
        love.graphics.polygon("fill", 
            x + 11, y + 8, 
            x + 14, y + 5 - i, 
            x + 15, y + 8, 
            x + 14, y + 10 + i)
        
        -- 翅膀纹理
        love.graphics.setColor(0.6, 0.1, 0.1)
        love.graphics.line(x + 5, y + 8, x + 2, y + 8)
        love.graphics.line(x + 11, y + 8, x + 14, y + 8)
        
        -- 尾巴（攻击时上翘）
        love.graphics.setColor(0.8, 0.2, 0.2)
        love.graphics.line(x + 8, y + 13, x + 10, y + 13 - i)
        
        -- 尾巴尖（攻击时尖锐）
        love.graphics.polygon("fill", 
            x + 10, y + 13 - i, 
            x + 9, y + 12 - i, 
            x + 11, y + 11 - i)
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
end

return DragonSprite 