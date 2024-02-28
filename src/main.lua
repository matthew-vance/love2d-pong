love.filesystem.setRequirePath("?.lua;?/init.lua;lib/?.lua;lib/?/init.lua")

_G.love = require("love")

local Ball = require("ball")
local CpuPaddle = require("cpuPaddle")
local Paddle = require("paddle")

local w_width, w_height = love.graphics.getDimensions()

local ball
local ball_speed = 560

local player
local cpu

local player_score = 0
local cpu_score = 0
local score_font = love.graphics.newFont("assets/retro-gaming.ttf", 48)
love.graphics.setFont(score_font)

function love.load()
	ball = Ball(w_width / 2, w_height / 2, ball_speed)
	player = Paddle(10, w_height / 2 - 60)
	cpu = CpuPaddle(w_width - 35, w_height / 2 - 60)
end

function love.update(dt)
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end

	ball:update(dt)
	player:update(dt)
	cpu:update(dt, ball)

	if ball:collides(player) then
		ball.speed_x = -ball.speed_x
		ball.x = player.x + player.width + ball.size / 2
	end

	if ball:collides(cpu) then
		ball.speed_x = -ball.speed_x
		ball.x = cpu.x - ball.size / 2
	end

	if ball.x <= 0 then
		cpu_score = cpu_score + 1
		ball:reset()
	end

	if ball.x + ball.size / 2 >= w_width then
		player_score = player_score + 1
		ball:reset()
	end
end

function love.draw()
	ball:draw()
	player:draw()
	cpu:draw()

	love.graphics.print(player_score, w_width / 2 - 96, 16)
	love.graphics.print(cpu_score, w_width / 2 + 48, 16)
end
