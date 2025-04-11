-- 骷髅精灵生成模块
local SkeletonSprite = {}

-- 生成骷髅精灵表
function SkeletonSprite.generate()
    local filename = "assets/sprites/skeleton_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵表已存在，则不再重新生成
    if hasSprites then
        return
    end
    local sheetWidth, sheetHeight = 64, 48  -- 4x3帧，每帧16x16
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制骷髅空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 骷髅身体
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.rectangle("fill", x + 6, y + 7, 4, 6)
        
        -- 骷髅头
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.circle("fill", x + 8, y + 5, 3)
        
        -- 眼窝
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", x + 7, y + 4, 0.8)
        love.graphics.circle("fill", x + 9, y + 4, 0.8)
        
        -- 头骨纹路
        love.graphics.setColor(0.7, 0.7, 0.7)
        love.graphics.line(x + 8, y + 2, x + 8, y + 6)
        
        -- 轻微的晃动动画
        local sway = i % 2 == 0 and 0.5 or -0.5
        
        -- 手臂
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.line(x + 6, y + 9, x + 4, y + 11 + sway)
        love.graphics.line(x + 10, y + 9, x + 12, y + 11 + sway)
        
        -- 腿部
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.line(x + 7, y + 13, x + 6, y + 16)
        love.graphics.line(x + 9, y + 13, x + 10, y + 16)
    end
    
    -- 绘制骷髅移动动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 骷髅身体
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.rectangle("fill", x + 6, y + 7, 4, 6)
        
        -- 骷髅头
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.circle("fill", x + 8, y + 5, 3)
        
        -- 眼窝
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", x + 7, y + 4, 0.8)
        love.graphics.circle("fill", x + 9, y + 4, 0.8)
        
        -- 头骨纹路
        love.graphics.setColor(0.7, 0.7, 0.7)
        love.graphics.line(x + 8, y + 2, x + 8, y + 6)
        
        -- 行走动画
        local legOffset = {0, 1, 0, -1}
        
        -- 手臂
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.line(x + 6, y + 9, x + 4, y + 11 + legOffset[i+1])
        love.graphics.line(x + 10, y + 9, x + 12, y + 11 - legOffset[i+1])
        
        -- 腿部
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.line(x + 7, y + 13, x + 6, y + 16 + legOffset[i+1])
        love.graphics.line(x + 9, y + 13, x + 10, y + 16 - legOffset[i+1])
    end
    
    -- 绘制骷髅攻击动画帧（第三行）
    for i = 0, 3 do
        local x, y = i * 16, 32
        
        -- 骷髅身体
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.rectangle("fill", x + 6, y + 7, 4, 6)
        
        -- 骷髅头
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.circle("fill", x + 8, y + 5, 3)
        
        -- 眼窝（攻击时红光闪烁）
        love.graphics.setColor(0.8, 0, 0, 0.5 + i * 0.1)
        love.graphics.circle("fill", x + 7, y + 4, 0.8)
        love.graphics.circle("fill", x + 9, y + 4, 0.8)
        
        -- 头骨纹路
        love.graphics.setColor(0.7, 0.7, 0.7)
        love.graphics.line(x + 8, y + 2, x + 8, y + 6)
        
        -- 攻击动画（右手挥舞骨刀）
        local attackAngle = i * math.pi / 4
        local wx = math.cos(-attackAngle) * 4
        local wy = math.sin(-attackAngle) * 4
        
        -- 左手
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.line(x + 6, y + 9, x + 4, y + 11)
        
        -- 右手（持武器的手）
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.line(x + 10, y + 9, x + 12 + wx/2, y + 11 + wy/2)
        
        -- 骨刀
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.line(x + 12 + wx/2, y + 11 + wy/2, x + 12 + wx, y + 11 + wy)
        
        -- 腿部
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.line(x + 7, y + 13, x + 6, y + 16)
        love.graphics.line(x + 9, y + 13, x + 10, y + 16)
        
        -- 攻击效果
        if i > 0 then
            love.graphics.setColor(0.8, 0, 0, 0.7 - i * 0.2)
            love.graphics.arc("line", x + 12 + wx * 1.2, y + 11 + wy * 1.2, 3 + i, attackAngle - 0.5, attackAngle + 0.5)
        end
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
end

return SkeletonSprite 