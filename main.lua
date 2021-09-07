local animation = require('animation')

function love.load()  
    love.window.setTitle('Animations')
    love.window.setMode(480, 350, {})
    local idle = animation.new(love.graphics.newImage('assets/Idle (78x58).png'), 11, 5)
    local run = animation.new(love.graphics.newImage('assets/Run (78x58).png'), 8, 5)
    local action = animation.new(love.graphics.newImage('assets/Attack (78x58).png'), 3, 10)
    Animations = {idle = idle, run = run, action = action}
    CurrentAnimation = Animations.idle
    CurrentAnimation:play()
    NowPlaying = 'Idle'
end


function love.update(dt)
    CurrentAnimation:update()
    if love.keyboard.isDown('r') then
        CurrentAnimation = Animations.run
    elseif love.keyboard.isDown('i') then
        CurrentAnimation = Animations.idle
    elseif love.keyboard.isDown('a') then
        CurrentAnimation = Animations.action
    end
    if not CurrentAnimation.played then
        CurrentAnimation:play()
    end
end

function love.draw()
    local image = CurrentAnimation.spriteSheet
    local time = CurrentAnimation.currentTime
    local position = love.graphics.newQuad(time * 78, 0, 78, 58, image:getDimensions())
    love.graphics.draw(image, position, 50, 25)

    love.graphics.print('Press "R" to play run Animation', 50, 100)
    love.graphics.print('Press "I" to play Idle Animation', 50, 150)
    love.graphics.print('Press "A" to play Attack Animation', 50, 200)
    love.graphics.print('Now Plaing : ' .. NowPlaying, 50, 250)
end