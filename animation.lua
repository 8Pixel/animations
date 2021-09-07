local animation = {}

function animation.new(spriteSheet, duration, frame)
    local anim = {
        spriteSheet = spriteSheet,
        duration = duration,
        frame = frame,
        currentTime = 1,
        currentFrame = 1,
        played = false
    }

    function anim.update(self)
        if self.played then
            if self.currentFrame >= self.frame then
                if self.currentTime < self.duration - 1 then
                    self.currentTime = self.currentTime + 1
                else
                    self.currentTime = 1
                end
                self.currentFrame = 1
            else
                self.currentFrame = self.currentFrame + 1
            end
        end
    end

    function anim.play(self)
        self.played = true
    end

    function anim.stop(self)
        self.currentTime = 1
        self.currentFrame = 1
        self.played = false
    end

    function anim.pause(self)
        self.played = false
    end

    return anim
end

return animation
