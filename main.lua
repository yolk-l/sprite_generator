local PixelSprites = require("PixelSprites")
local WeaponSprites = require("WeaponSprites")
local BuildingSprites = require("BuildingSprites")
local HeroSprites = require("HeroSprites")
local BulletSprites = require("BulletSprites")

function love.load()
    PixelSprites.generateSprites()
    WeaponSprites.generateAll()
    BuildingSprites.generateAll()
    HeroSprites.generateAll()
    BulletSprites.generateAll()
end

function love.update(dt)
end

function love.draw()
end