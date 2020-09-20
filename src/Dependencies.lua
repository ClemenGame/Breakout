--
-- libraries
--

Class = require 'lib/class'
Event = require 'lib/knife.event'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/Animation'
require 'src/constants'
require 'src/Entity'
require 'src/entity_defs'
require 'src/GameObject'
require 'src/game_objects'
require 'src/Hitbox'
require 'src/Player'
require 'src/StateMachine'
require 'src/Util'

require 'src/world/Doorway'
require 'src/world/Dungeon'
require 'src/world/Room'

require 'src/states/BaseState'

require 'src/states/entity/EntityIdleState'
require 'src/states/entity/EntityWalkState'

require 'src/states/entity/player/PlayerIdleState'
require 'src/states/entity/player/PlayerSwingSwordState'
require 'src/states/entity/player/PlayerWalkState'
-- 41
require 'src/states/entity/player/PlayerDamageState'
-- 8
require 'src/states/entity/player/PlayerLiftState'
require 'src/states/entity/player/PlayerThrowState'

require 'src/states/game/GameOverState'
require 'src/states/game/PlayState'
require 'src/states/game/StartState'

gTextures = {
	['tiles'] = love.graphics.newImage('graphics/tilesheet.png'),
	['background'] = love.graphics.newImage('graphics/background.png'),
	['character-walk'] = love.graphics.newImage('graphics/character_walk.png'),
	['character-swing-sword'] = love.graphics.newImage('graphics/character_swing_sword.png'),
	-- 9
	['character-lift'] = love.graphics.newImage('graphics/character_pot_lift.png'),
	-- 10
	['character-carry'] = love.graphics.newImage('graphics/character_pot_walk.png'),
	['hearts'] = love.graphics.newImage('graphics/hearts.png'),
	['switches'] = love.graphics.newImage('graphics/switches.png'),
	['entities'] = love.graphics.newImage('graphics/entities.png'),
	['particle'] = love.graphics.newImage('graphics/particle.png')
}

gFrames = {
	['tiles'] = GenerateQuads(gTextures['tiles'], 16, 16),
	['character-walk'] = GenerateQuads(gTextures['character-walk'], 16, 32),
	['character-swing-sword'] = GenerateQuads(gTextures['character-swing-sword'], 32, 32),
	['character-lift'] = GenerateQuads(gTextures['character-lift'], 16, 32),
	['character-carry'] = GenerateQuads(gTextures['character-carry'], 16, 32),
	['entities'] = GenerateQuads(gTextures['entities'], 16, 16),
	['hearts'] = GenerateQuads(gTextures['hearts'], 16, 16),
	['switches'] = GenerateQuads(gTextures['switches'], 16, 18)
}

gFonts = {
	['small'] = love.graphics.newFont('fonts/font.ttf', 8),
	['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
	['large'] = love.graphics.newFont('fonts/font.ttf', 32),
	['gothic-medium'] = love.graphics.newFont('fonts/GothicPixels.ttf', 16),
	['gothic-large'] = love.graphics.newFont('fonts/GothicPixels.ttf', 32),
	['zelda'] = love.graphics.newFont('fonts/zelda.otf', 64),
	['zelda-small'] = love.graphics.newFont('fonts/zelda.otf', 32)
}

gSounds = {
	['music'] = love.audio.newSource('sounds/music.mp3'),
	['sword'] = love.audio.newSource('sounds/sword.wav'),
	['hit-enemy'] = love.audio.newSource('sounds/hit_enemy.wav'),
	['hit-player'] = love.audio.newSource('sounds/hit_player.wav'),
	['door'] = love.audio.newSource('sounds/door.wav')
	--1
	['life-up'] = love.audio.newSource('sounds/life_up.wav')
}

-- 42
gRenderHitboxes = false
gShowGrid = false
gShowDebug = false