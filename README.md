# LÖVE Template

A template for creating games with [LÖVE](https://love2d.org/).

## Requirements

- [Make](https://www.gnu.org/software/make/)
- [Lua](https://www.lua.org/)
- [LÖVE](https://love2d.org/)
- [StyLua](https://github.com/JohnnyMorganz/StyLua)
- [LuaCheck](https://github.com/lunarmodules/luacheck)

## Project Structure

- `src/main.lua`: The entry point of the game.
- `src/conf.lua`: The configuration file for LÖVE. Is executed before `main.lua`.
- `src/lib/`: Contains third-party libraries.

## Usage

Simply run `make` to build the game and launch it.

See the `Makefile` for more commands.

## Resources

- [LÖVE wiki](https://love2d.org/wiki/Main_Page)
- [Awesome LÖVE](https://github.com/love2d-community/awesome-love2d)
- [Lua manual](https://lua.org/manual/5.4/manual.html)
- [Lua Cheet Sheet](https://devhints.io/lua)
