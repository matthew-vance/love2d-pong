local Class = require("hump.class")

local Paddle = Class({
	init = function(self, x, y)
		self.x = x
		self.y = y
		self.width = 20
		self.height = 100
		self.speed = 400
	end,
})

function Paddle:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Paddle:update(dt)
	if love.keyboard.isDown("w") then
		self.y = self.y - self.speed * dt
	end

	if love.keyboard.isDown("s") then
		self.y = self.y + self.speed * dt
	end

	self.restrictToScreen(self)
end

function Paddle:restrictToScreen()
	if self.y < 0 then
		self.y = 0
	end

	if self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.height
	end
end
return Paddle
