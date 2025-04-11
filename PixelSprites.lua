-- 像素精灵生成工具
local PixelSprites = {}

-- 导入各个精灵模块
local PlayerSprite = require("sprites.PlayerSprite")
local SlimeSprite = require("sprites.SlimeSprite")
local GoblinSprite = require("sprites.GoblinSprite")
local SkeletonSprite = require("sprites.SkeletonSprite")
local ZombieSprite = require("sprites.ZombieSprite")
local WerewolfSprite = require("sprites.WerewolfSprite")
local WitchSprite = require("sprites.WitchSprite")
local GhostSprite = require("sprites.GhostSprite")
local StoneGiantSprite = require("sprites.StoneGiantSprite")
local DragonSprite = require("sprites.DragonSprite")

-- 生成简单的像素精灵表
function PixelSprites.generateSprites()
    
    -- 创建sprites目录（如果不存在）
    love.filesystem.createDirectory("assets/sprites")
    
    -- 生成玩家精灵表
    PlayerSprite.generate()
    
    -- 生成怪物精灵表
    SlimeSprite.generate()
    GoblinSprite.generate()
    SkeletonSprite.generate()
    ZombieSprite.generate()
    WerewolfSprite.generate()
    WitchSprite.generate()
    GhostSprite.generate()
    StoneGiantSprite.generate()
    DragonSprite.generate()
end

return PixelSprites 