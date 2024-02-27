_G.love = require("love")

local function draw_centered_text(text)
	local w_width, w_height = love.graphics.getDimensions()
	local font = love.graphics.getFont()
	local text_width = font:getWidth(text)
	local text_height = font:getHeight()
	love.graphics.print(text, w_width / 2, w_height / 2, 0, 1, 1, text_width / 2, text_height / 2)
end

local major, minor, revision, codename = love.getVersion()

function love.load() end

function love.update() end

function love.draw()
	draw_centered_text("LÖVE Version: " .. major .. "." .. minor .. "." .. revision .. " " .. codename)

	love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
end
