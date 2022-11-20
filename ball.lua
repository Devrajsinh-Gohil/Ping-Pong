-- Empty table to store functions and variable
Ball = {}

-- Function to load variables
function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.img =  love.graphics.newImage("asset/ball.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 200
    self.xVel = -self.speed
    self.yVel = 0
end

-- Function to keep updating the screen
function Ball:update(dt)
    self:move(dt)
    self:collide()
end

-- Function to check collision of ball in different conditions
function Ball:collide()

    self:collidePlayer()
    self:collideAI()
    self:collideWall()
    self:score()
end

-- Funciton to check collision with Player bar
function Ball:collidePlayer()
    if checkCollision(self, Player) then
        self.xVel = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPosition = middleBall - middlePlayer
        self.yVel = collisionPosition * 5
    end
end

-- Funciton to check collision with AI bar
function Ball:collideAI()
    if checkCollision(self, AI) then
        self.xVel = -self.speed
        local middleBall = self.y + self.height / 2
        local middleAI = AI.y + AI.height / 2
        local collisionPosition = middleBall - middleAI
        self.yVel = collisionPosition * 5
    end
end

-- Funciton to check collision with Top/Bottom wall
function Ball:collideWall()
    if self.y < 0 then
        self.y = 0
        self.yVel = -self.yVel
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
    end
end

-- Funciton to count score
function Ball:score()
    if self.x < 0 then
        self:resetPosition(1)
        Score.ai = Score.ai + 1
    end

    if self.x + self.width > love.graphics.getWidth() then
        self.resetPosition(-1)
        Score.player = Score.player + 1
    end
end

-- Funciton to reset postion after one of the participant lost
function Ball:resetPosition(mod)
    self.x = love.graphics.getWidth() / 2 - self.width / 2
    self.y = love.graphics.getHeight() / 2 - self.height / 2
    self.yVel = 0
    self.xVel = self.speed * mod
end

-- Funciton to move the ball n the screen
function Ball:move(dt)
    self.x =  self.x + self.xVel * dt
    self.y =  self.y + self.yVel * dt
end

function Ball:draw()
    love.graphics.draw(self.img,  self.x, self.y)
end