-- 石巨人精灵生成模块
local StoneGiantSprite = {}

-- 生成石巨人精灵表
function StoneGiantSprite.generate()
    local filename = "assets/sprites/stone_giant_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵表已存在，则不再重新生成
    if hasSprites then
        return
    end
    
    local sheetWidth, sheetHeight = 64, 48  -- 4x3帧，每帧16x16
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制石巨人空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 石巨人身体（灰色岩石）
        love.graphics.setColor(0.5, 0.5, 0.5, 1)
        love.graphics.rectangle("fill", x + 4, y + 5, 8, 9)
        
        -- 岩石纹理（深灰色）
        love.graphics.setColor(0.4, 0.4, 0.4, 1)
        love.graphics.line(x + 4, y + 7, x + 12, y + 7)
        love.graphics.line(x + 6, y + 5, x + 6, y + 14)
        love.graphics.line(x + 10, y + 5, x + 10, y + 14)
        
        -- 石巨人头部（浅灰色）
        love.graphics.setColor(0.55, 0.55, 0.55, 1)
        love.graphics.rectangle("fill", x + 5, y + 2, 6, 4)
        
        -- 轻微呼吸动画
        local breathOffset = math.sin(i * math.pi / 2) * 0.3
        
        -- 石巨人肩膀（块状）
        love.graphics.setColor(0.45, 0.45, 0.45, 1)
        love.graphics.rectangle("fill", x + 3, y + 5, 2, 2 + breathOffset)
        love.graphics.rectangle("fill", x + 11, y + 5, 2, 2 + breathOffset)
        
        -- 石巨人手臂
        love.graphics.setColor(0.5, 0.5, 0.5, 1)
        love.graphics.rectangle("fill", x + 2, y + 7 + breathOffset, 2, 4)
        love.graphics.rectangle("fill", x + 12, y + 7 + breathOffset, 2, 4)
        
        -- 石巨人腿部
        love.graphics.setColor(0.45, 0.45, 0.45, 1)
        love.graphics.rectangle("fill", x + 5, y + 14, 2, 2)
        love.graphics.rectangle("fill", x + 9, y + 14, 2, 2)
        
        -- 石巨人眼睛（闪亮的矿石）
        love.graphics.setColor(0.2, 0.8, 0, 1)
        love.graphics.rectangle("fill", x + 6, y + 3, 1, 1)
        love.graphics.rectangle("fill", x + 9, y + 3, 1, 1)
        
        -- 石纹裂痕（细节）
        love.graphics.setColor(0.3, 0.3, 0.3, 1)
        love.graphics.line(x + 8, y + 2, x + 8, y + 5 + i % 2)
        love.graphics.line(x + 4, y + 9 + (i % 2) * 2, x + 7, y + 9)
    end
    
    -- 绘制石巨人移动动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 石巨人身体（灰色岩石）
        love.graphics.setColor(0.5, 0.5, 0.5, 1)
        love.graphics.rectangle("fill", x + 4, y + 5, 8, 9)
        
        -- 岩石纹理（深灰色）
        love.graphics.setColor(0.4, 0.4, 0.4, 1)
        love.graphics.line(x + 4, y + 7, x + 12, y + 7)
        love.graphics.line(x + 6, y + 5, x + 6, y + 14)
        love.graphics.line(x + 10, y + 5, x + 10, y + 14)
        
        -- 石巨人头部（浅灰色）
        local headShake = (i % 2) * 0.5
        love.graphics.setColor(0.55, 0.55, 0.55, 1)
        love.graphics.rectangle("fill", x + 5 + headShake, y + 2, 6, 4)
        
        -- 石巨人肩膀（块状）
        love.graphics.setColor(0.45, 0.45, 0.45, 1)
        love.graphics.rectangle("fill", x + 3, y + 5, 2, 2)
        love.graphics.rectangle("fill", x + 11, y + 5, 2, 2)
        
        -- 石巨人手臂（行走动作）
        love.graphics.setColor(0.5, 0.5, 0.5, 1)
        
        -- 左右手臂交替摆动
        if i % 2 == 0 then
            -- 左手前摆
            love.graphics.rectangle("fill", x + 2, y + 6, 2, 4)
            -- 右手后摆
            love.graphics.rectangle("fill", x + 12, y + 8, 2, 4)
        else
            -- 左手后摆
            love.graphics.rectangle("fill", x + 2, y + 8, 2, 4)
            -- 右手前摆
            love.graphics.rectangle("fill", x + 12, y + 6, 2, 4)
        end
        
        -- 石巨人腿部（行走动作）
        love.graphics.setColor(0.45, 0.45, 0.45, 1)
        
        -- 左右腿交替抬起
        if i % 2 == 0 then
            -- 左腿前迈
            love.graphics.rectangle("fill", x + 5, y + 14, 2, 2)
            -- 右腿后蹬
            love.graphics.rectangle("fill", x + 9, y + 14, 2, 1)
        else
            -- 左腿后蹬
            love.graphics.rectangle("fill", x + 5, y + 14, 2, 1)
            -- 右腿前迈
            love.graphics.rectangle("fill", x + 9, y + 14, 2, 2)
        end
        
        -- 石巨人眼睛（闪亮的矿石）
        love.graphics.setColor(0.2, 0.8, 0, 1)
        love.graphics.rectangle("fill", x + 6 + headShake, y + 3, 1, 1)
        love.graphics.rectangle("fill", x + 9 + headShake, y + 3, 1, 1)
        
        -- 移动时的尘土效果
        if i % 2 == 0 then
            love.graphics.setColor(0.6, 0.6, 0.6, 0.5)
            love.graphics.circle("fill", x + 5, y + 15, 1)
            love.graphics.circle("fill", x + 10, y + 15, 1)
        end
    end
    
    -- 绘制石巨人攻击动画帧（第三行）
    for i = 0, 3 do
        local x, y = i * 16, 32
        
        -- 攻击姿势变化
        local attackPhase = i
        
        -- 石巨人身体（灰色岩石）- 攻击时身体前倾
        love.graphics.setColor(0.5, 0.5, 0.5, 1)
        if i < 2 then
            -- 准备阶段
            love.graphics.rectangle("fill", x + 4, y + 5, 8, 9)
        else
            -- 出拳阶段
            love.graphics.rectangle("fill", x + 5, y + 5, 8, 9)
        end
        
        -- 岩石纹理（深灰色）
        love.graphics.setColor(0.4, 0.4, 0.4, 1)
        if i < 2 then
            love.graphics.line(x + 4, y + 7, x + 12, y + 7)
            love.graphics.line(x + 6, y + 5, x + 6, y + 14)
            love.graphics.line(x + 10, y + 5, x + 10, y + 14)
        else
            love.graphics.line(x + 5, y + 7, x + 13, y + 7)
            love.graphics.line(x + 7, y + 5, x + 7, y + 14)
            love.graphics.line(x + 11, y + 5, x + 11, y + 14)
        end
        
        -- 石巨人头部（浅灰色）
        love.graphics.setColor(0.55, 0.55, 0.55, 1)
        if i < 2 then
            -- 准备阶段 - 头微微低下
            love.graphics.rectangle("fill", x + 5, y + 3, 6, 4)
        else
            -- 出拳阶段 - 头向前
            love.graphics.rectangle("fill", x + 6, y + 3, 6, 4)
        end
        
        -- 石巨人肩膀（块状）
        love.graphics.setColor(0.45, 0.45, 0.45, 1)
        if i < 2 then
            love.graphics.rectangle("fill", x + 3, y + 5, 2, 2)
            love.graphics.rectangle("fill", x + 11, y + 5, 2, 2)
        else
            love.graphics.rectangle("fill", x + 4, y + 5, 2, 2)
            love.graphics.rectangle("fill", x + 12, y + 5, 2, 2)
        end
        
        -- 石巨人攻击手臂（出拳）
        love.graphics.setColor(0.45, 0.45, 0.45, 1)
        
        -- 非攻击手
        if i < 2 then
            love.graphics.rectangle("fill", x + 2, y + 7, 2, 4)
        else
            love.graphics.rectangle("fill", x + 3, y + 7, 2, 4)
        end
        
        -- 攻击手（右手）
        if i == 0 then
            -- 蓄力阶段1
            love.graphics.rectangle("fill", x + 12, y + 7, 2, 4)
        elseif i == 1 then
            -- 蓄力阶段2 - 手臂后撤
            love.graphics.rectangle("fill", x + 12, y + 6, 3, 3)
        elseif i == 2 then
            -- 出拳阶段1
            love.graphics.rectangle("fill", x + 13, y + 6, 3, 3)
            
            -- 出拳效果
            love.graphics.setColor(0.6, 0.6, 0.6, 0.7)
            love.graphics.circle("fill", x + 14, y + 7, 1.5)
        else
            -- 出拳阶段2
            love.graphics.setColor(0.45, 0.45, 0.45, 1)
            love.graphics.rectangle("fill", x + 14, y + 6, 3, 3)
            
            -- 冲击效果
            love.graphics.setColor(0.6, 0.6, 0.6, 0.7)
            love.graphics.circle("fill", x + 15, y + 7, 2.5)
            
            -- 岩石碎片
            love.graphics.setColor(0.5, 0.5, 0.5, 0.8)
            for p = 1, 4 do
                local angle = p * math.pi / 2 + 0.3
                love.graphics.circle("fill", 
                    x + 15 + math.cos(angle) * 3,
                    y + 7 + math.sin(angle) * 3,
                    0.8)
            end
        end
        
        -- 石巨人腿部（攻击姿势）
        love.graphics.setColor(0.45, 0.45, 0.45, 1)
        
        -- 攻击时的稳定站姿
        if i < 2 then
            love.graphics.rectangle("fill", x + 5, y + 14, 2, 2)
            love.graphics.rectangle("fill", x + 9, y + 14, 2, 2)
        else
            -- 前腿支撑
            love.graphics.rectangle("fill", x + 6, y + 14, 2, 2)
            -- 后腿蹬地
            love.graphics.rectangle("fill", x + 10, y + 14, 2, 1.5)
        end
        
        -- 石巨人眼睛（攻击时发光）
        if i < 2 then
            -- 蓄力时眼睛变亮
            love.graphics.setColor(0.2 + i * 0.3, 0.8, 0 + i * 0.3, 1)
            love.graphics.rectangle("fill", x + 6, y + 4, 1, 1)
            love.graphics.rectangle("fill", x + 9, y + 4, 1, 1)
        else
            -- 攻击时眼睛发光
            love.graphics.setColor(0.8, 0.8, 0.2, 1)
            love.graphics.rectangle("fill", x + 7, y + 4, 1, 1)
            love.graphics.rectangle("fill", x + 10, y + 4, 1, 1)
            
            -- 眼睛光芒
            love.graphics.setColor(0.8, 0.8, 0.2, 0.5)
            love.graphics.rectangle("line", x + 6.5, y + 3.5, 2, 2)
            love.graphics.rectangle("line", x + 9.5, y + 3.5, 2, 2)
        end
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
end

return StoneGiantSprite 