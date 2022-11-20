-- add all the lua modules
require("player")
require("ball")
require("ai")
require("background")

-- Funtion to load variables
function love.load()
    Player:load()
    Ball:load()
    AI:load()
    BG:load()

    Score = {player = 0, ai = 0}
    font = love.graphics.newFont(20)
end

-- Function to keep updating the screen
function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    AI:update(dt)
    BG:update(dt)
end

-- Funtion to get all the objects on screen
function love.draw()
    BG:draw()
    Player:draw()
    Ball:draw()
    AI:draw()
    drawScore()
end

-- Function to print score on screen
function drawScore()
    love.graphics.setFont(font)
    love.graphics.print("Player: "..Score.player, 50, 50)
    love.graphics.print("AI: "..Score.ai, love.graphics.getWidth() - 100, 50)
end

-- Function to check collision of ball with either player
function checkCollision(a, b)
    if a.x + a.width > b.x and a.x < b.x +  b.width and a.y + a.height > b.y and  a.y < b.y + b.height then
        return true
    else
        return false
    end
end