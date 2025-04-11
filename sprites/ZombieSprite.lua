-- 僵尸精灵生成模块
local ZombieSprite = {}

-- 生成僵尸精灵表
function ZombieSprite.generate()
    local filename = "assets/sprites/zombie_sheet.png"
    local hasSprites = love.filesystem.getInfo(filename)
    
    -- 如果精灵表已存在，则不再重新生成
    if hasSprites then
        return
    end
    local sheetWidth, sheetHeight = 64, 48  -- 4x3帧，每帧16x16
    local canvas = love.graphics.newCanvas(sheetWidth, sheetHeight)
    
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    -- 绘制僵尸空闲动画帧（第一行）
    for i = 0, 3 do
        local x, y = i * 16, 0
        
        -- 僵尸身体
        love.graphics.setColor(0.5, 0.7, 0.5)  -- 灰绿色
        love.graphics.rectangle("fill", x + 6, y + 7, 4, 7)
        
        -- 僵尸头
        love.graphics.setColor(0.5, 0.7, 0.5)
        love.graphics.circle("fill", x + 8, y + 5, 3)
        
        -- 眼睛（一只眼睛是空的）
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.circle("fill", x + 7, y + 4, 0.8)
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", x + 7, y + 4, 0.4)
        
        -- 另一只眼睛（僵尸特点：空洞的眼睛）
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", x + 9, y + 4, 0.8)
        
        -- 伤口
        love.graphics.setColor(0.7, 0.2, 0.2)
        love.graphics.line(x + 6, y + 6, x + 7, y + 5)
        
        -- 嘴巴（僵尸特征）
        love.graphics.setColor(0.3, 0.1, 0.1)
        love.graphics.line(x + 7, y + 6, x + 9, y + 6)
        
        -- 晃动动画（僵尸特有的摇摆步态）
        local sway = math.sin(i * math.pi / 2) * 0.6
        
        -- 手臂（一直伸出）
        love.graphics.setColor(0.5, 0.7, 0.5)
        love.graphics.line(x + 6, y + 9, x + 4, y + 11 + sway)
        love.graphics.line(x + 10, y + 9, x + 12, y + 11 - sway)
        
        -- 腿部
        love.graphics.setColor(0.5, 0.7, 0.5)
        love.graphics.line(x + 7, y + 14, x + 6 + sway, y + 16)
        love.graphics.line(x + 9, y + 14, x + 10 - sway, y + 16)
    end
    
    -- 绘制僵尸移动动画帧（第二行）
    for i = 0, 3 do
        local x, y = i * 16, 16
        
        -- 身体（僵尸摇摆步态）
        local bodyTilt = math.sin(i * math.pi / 2) * 1
        love.graphics.setColor(0.5, 0.7, 0.5)
        love.graphics.rectangle("fill", x + 6 + bodyTilt * 0.3, y + 7, 4, 7)
        
        -- 头
        love.graphics.setColor(0.5, 0.7, 0.5)
        love.graphics.circle("fill", x + 8 + bodyTilt * 0.3, y + 5, 3)
        
        -- 眼睛（一只眼睛是空的）
        love.graphics.setColor(0.9, 0.9, 0.9)
        love.graphics.circle("fill", x + 7 + bodyTilt * 0.3, y + 4, 0.8)
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", x + 7 + bodyTilt * 0.3, y + 4, 0.4)
        
        -- 另一只眼睛（僵尸特点：空洞的眼睛）
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", x + 9 + bodyTilt * 0.3, y + 4, 0.8)
        
        -- 伤口
        love.graphics.setColor(0.7, 0.2, 0.2)
        love.graphics.line(x + 6 + bodyTilt * 0.3, y + 6, x + 7 + bodyTilt * 0.3, y + 5)
        
        -- 嘴巴
        love.graphics.setColor(0.3, 0.1, 0.1)
        love.graphics.line(x + 7 + bodyTilt * 0.3, y + 6, x + 9 + bodyTilt * 0.3, y + 6)
        
        -- 行走动画（僵尸特有的拖拉步态）
        local legOffset = {0, 1, 0, -1}
        
        -- 手臂（伸出，摇摆）
        love.graphics.setColor(0.5, 0.7, 0.5)
        love.graphics.line(x + 6 + bodyTilt * 0.3, y + 9, x + 3 + legOffset[i+1], y + 11)
        love.graphics.line(x + 10 + bodyTilt * 0.3, y + 9, x + 13 - legOffset[i+1], y + 11)
        
        -- 腿部（拖曳）
        love.graphics.setColor(0.5, 0.7, 0.5)
        love.graphics.line(x + 7 + bodyTilt * 0.3, y + 14, x + 6 + legOffset[i+1] * 0.5, y + 16)
        love.graphics.line(x + 9 + bodyTilt * 0.3, y + 14, x + 10 - legOffset[i+1] * 0.5, y + 16)
    end
    
    -- 绘制僵尸攻击动画帧（第三行）
    for i = 0, 3 do
        local x, y = i * 16, 32
        
        -- 身体（前倾）
        love.graphics.setColor(0.5, 0.7, 0.5)
        love.graphics.rectangle("fill", x + 6 + i * 0.3, y + 7, 4, 7)
        
        -- 头（随攻击动作前倾）
        love.graphics.setColor(0.5, 0.7, 0.5)
        love.graphics.circle("fill", x + 8 + i * 0.5, y + 5, 3)
        
        -- 眼睛（攻击时发红）
        love.graphics.setColor(0.9, 0.3, 0.3)
        love.graphics.circle("fill", x + 7 + i * 0.5, y + 4, 0.8)
        love.graphics.setColor(0.8, 0, 0)
        love.graphics.circle("fill", x + 7 + i * 0.5, y + 4, 0.4)
        
        -- 另一只眼睛
        love.graphics.setColor(0.8, 0, 0)
        love.graphics.circle("fill", x + 9 + i * 0.5, y + 4, 0.8)
        
        -- 嘴巴（攻击时张开）
        love.graphics.setColor(0.6, 0.1, 0.1)
        love.graphics.line(x + 7 + i * 0.5, y + 6 + i * 0.2, x + 9 + i * 0.5, y + 6 + i * 0.2)
        
        -- 攻击动画（张牙舞爪）
        local attackAngle = i * math.pi / 6
        local ax = math.cos(attackAngle) * 5
        local ay = math.sin(attackAngle) * 2
        
        -- 双手向前抓取动作
        love.graphics.setColor(0.5, 0.7, 0.5)
        love.graphics.line(x + 6 + i * 0.3, y + 9, x + 4 + ax, y + 10 + ay)
        love.graphics.line(x + 10 + i * 0.3, y + 9, x + 12 + ax, y + 10 + ay)
        
        -- 手指/爪子
        if i > 0 then
            love.graphics.setColor(0.3, 0.5, 0.3)
            -- 左手爪子
            love.graphics.line(x + 4 + ax, y + 10 + ay, x + 3 + ax, y + 9 + ay)
            love.graphics.line(x + 4 + ax, y + 10 + ay, x + 4 + ax, y + 8 + ay)
            love.graphics.line(x + 4 + ax, y + 10 + ay, x + 5 + ax, y + 9 + ay)
            -- 右手爪子
            love.graphics.line(x + 12 + ax, y + 10 + ay, x + 11 + ax, y + 9 + ay)
            love.graphics.line(x + 12 + ax, y + 10 + ay, x + 12 + ax, y + 8 + ay)
            love.graphics.line(x + 12 + ax, y + 10 + ay, x + 13 + ax, y + 9 + ay)
        end
        
        -- 腿部
        love.graphics.setColor(0.5, 0.7, 0.5)
        love.graphics.line(x + 7 + i * 0.3, y + 14, x + 6, y + 16)
        love.graphics.line(x + 9 + i * 0.3, y + 14, x + 10, y + 16)
    end
    
    love.graphics.setCanvas()
    
    -- 保存为文件
    local data = canvas:newImageData()
    data:encode("png", filename)
end

return ZombieSprite 

