# 像素精灵生成器

一个使用LÖVE框架的像素风格游戏精灵生成工具，可以动态创建游戏所需的各种角色和怪物精灵表。

## 特点

- 纯代码绘制，无需任何外部图像资源
- 自动生成多种角色的精灵表
- 每个精灵包含多种动画状态（空闲、移动、攻击等）
- 适用于像素风格游戏开发

## 可生成的精灵

目前支持生成以下精灵：

- **玩家角色**：基本的玩家角色
- **怪物**：
  - 史莱姆：基础敌人，有跳跃动画
  - 哥布林：敏捷的小型敌人
  - 骷髅：经典不死系敌人
  - 僵尸：缓慢移动的不死敌人
  - 狼人：强壮的狼形人型敌人
  - 女巫：使用魔法的飞行敌人
  - 幽灵：半透明的飘动敌人
  - 石巨人：强大的岩石构成敌人
  - 小龙：会飞行和喷火的敌人

## 使用方法

1. 将整个项目添加到你的LÖVE游戏项目中
2. 在游戏初始化时调用：

```lua
local PixelSprites = require("PixelSprites")
PixelSprites.generateSprites()
```

3. 所有精灵表将被生成到 `assets/sprites/` 目录下
4. 在游戏中载入并使用这些精灵表：

```lua
-- 加载精灵表
local spriteSheet = love.graphics.newImage("assets/sprites/dragon_sheet.png")

-- 创建精灵表的四边形（每帧16x16像素）
local frames = {}
local frameWidth, frameHeight = 16, 16
local sheetWidth, sheetHeight = spriteSheet:getDimensions()
local cols = sheetWidth / frameWidth
local rows = sheetHeight / frameHeight

for y = 0, rows-1 do
    for x = 0, cols-1 do
        table.insert(frames, love.graphics.newQuad(
            x * frameWidth, y * frameHeight,
            frameWidth, frameHeight,
            sheetWidth, sheetHeight
        ))
    end
end

-- 在游戏循环中绘制精灵动画
-- frame为当前动画帧索引，row为动画类型（0=空闲, 1=移动, 2=攻击）
function drawSprite(x, y, frame, row)
    local index = row * cols + frame + 1
    love.graphics.draw(spriteSheet, frames[index], x, y)
end
```

## 扩展

如果需要添加新的精灵类型：

1. 在 `sprites` 目录下创建新的Lua文件（例如 `NewMonsterSprite.lua`）
2. 参照现有模块的结构实现 `generate()` 函数
3. 在 `PixelSprites.lua` 中添加对新模块的引用和调用

## 许可证

MIT许可证 - 详见 LICENSE 文件

## 致谢

本项目使用 [LÖVE](https://love2d.org/) 游戏引擎开发。 
