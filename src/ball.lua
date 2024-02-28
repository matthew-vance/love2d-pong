local Class = require("hump.class")

local Ball = Class({
	init = function(self, x, y, speed)
		self.x = x
		self.y = y
		self.speed_x = speed
		self.speed_y = speed
		self.size = 20
	end,
})

function Ball:draw()
	love.graphics.rectangle("fill", self.x - self.size / 2, self.y - self.size / 2, self.size, self.size)
end

function Ball:update(dt)
	self.x = self.x + self.speed_x * dt
	self.y = self.y + self.speed_y * dt

	if self.y <= 0 then
		self.y = 0
		self.speed_y = -self.speed_y
	end

	if self.y + self.size / 2 >= love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.size / 2
		self.speed_y = -self.speed_y
	end

	if self.x <= 0 then
		self.x = 0
		self.speed_x = -self.speed_x
	end

	if self.x + self.size / 2 >= love.graphics.getWidth() then
		self.x = love.graphics.getWidth() - self.size / 2
		self.speed_x = -self.speed_x
	end
end

function Ball:collides(paddle)
	local ball_left = self.x - self.size / 2
	local ball_right = self.x + self.size / 2
	local ball_top = self.y - self.size / 2
	local ball_bottom = self.y + self.size / 2

	local paddle_left = paddle.x
	local paddle_right = paddle.x + paddle.width
	local paddle_top = paddle.y
	local paddle_bottom = paddle.y + paddle.height

	return ball_right > paddle_left and ball_left < paddle_right and ball_bottom > paddle_top and ball_top < paddle_bottom
end

function Ball:reset()
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
end

return Ball
