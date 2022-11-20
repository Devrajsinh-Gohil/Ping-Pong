-- Empty table to store funtions and variable
AI = {}

-- Funtion to load variables
function AI:load()
    self.img =  love.graphics.newImage("asset/2.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.x = love.graphics.getWidth() - self.width - 50
    self.y = love.graphics.getHeight() / 2
    self.yVel = 0
    self.speed = 500
    self.timer = 0
    self.rate = 0.5
end

-- Function to keep updating the screen
function AI:update(dt)
    self:move(dt)
    self:checkBoundries()
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timer = 0
        self:aquireTarget()
    end
end

-- Function to move ai
function AI:move(dt)
    self.y = self.y + self.yVel * dt
end

-- Function to make decision by ai
function AI:aquireTarget()
    if Ball.y + Ball.height < self.y then
        self.yVel = -self.speed
    elseif Ball.y > self.height + self.y then
        self.yVel = self.speed
    else
        self.yVel = 0
    end
end

-- Function to check for top and bottom walls
function AI:checkBoundries()
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

-- Add ai on screeen
function AI:draw()
    love.graphics.draw(self.img,  self.x, self.y)
end