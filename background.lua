-- Empty table to store funtions and variables
BG = {}

-- Funtion to load variables
function BG:load()
    self.pla =  love.graphics.newImage("asset/planets.jpg")
    self.uni =  love.graphics.newImage("asset/universe.png")
    self.width = self.pla:getWidth()
    self.height = self.pla:getHeight()
    self.rotation = 0
end

-- Funtion to rotate img in BG
function BG:update(dt)
    self.rotation = self.rotation + 0.05 * dt
end

-- Funtion to add BG in screen
function BG:draw()
    love.graphics.draw(self.uni,  0, 0)
    love.graphics.draw(self.pla,  self.width / 2, self.height / 2, self.rotation, 1, 1, self.width / 2, self.height / 2)
end