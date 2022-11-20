-- Empty table to store funtions and variable
Player = {}

-- Funtion to load variables
function Player:load()
    self.x = 50
    self.y = love.graphics.getHeight() / 2
    self.img =  love.graphics.newImage("asset/1.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 500
end

-- Function to keep updating the screen
function Player:update(dt)
    self:move(dt)
    self:checkBoundries()
end

-- Function to move PLayer
function Player:move(dt)
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
end

-- Function to check for top and bottom walls
function Player:checkBoundries()
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

-- Add ai on screen
function Player:draw()
    love.graphics.draw(self.img,  self.x, self.y)
end 