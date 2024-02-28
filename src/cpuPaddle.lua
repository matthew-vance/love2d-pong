local Class = require("hump.class")
local Paddle = require("paddle")

local CpuPaddle = Class({ __includes = Paddle })

function CpuPaddle:update(dt, ball)
	local paddle_center = self.y + self.height / 2
	local is_ball_above = ball.y < paddle_center
	local is_ball_below = ball.y > paddle_center

	if is_ball_above then
		self.y = self.y - self.speed * dt
	end

	if is_ball_below then
		self.y = self.y + self.speed * dt
	end

	self:restrictToScreen(self)
end

return CpuPaddle
