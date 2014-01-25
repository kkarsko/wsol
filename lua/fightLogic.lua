-- WE NEED A RANGE UNIT

Character = {}
    Character.dmg           = 15
    Character.attackRate    = 1400  -- delay between attacks, in ms
    Character.mvspeed       = 0     -- NEED A UNIT
    Character.dodge         = 0     -- chance of dodging, in % // needed?
    Character.accuracy      = 70    -- amount of divergence, in rads  (the angle of the cone) this is 3d stuff
    Character.health        = 0
    Character.range         = 0     -- NEED A UNIT
    Character.critChance    = 40     -- chance of crit, in %
    Character.critMultiplier= 150     -- amount of crit dmg, in % of normal dmg

Enemy = {}
    Enemy.armor         = 20
    Enemy.dodge         = 40
    Enemy.health        = 150

function Character:fight(enemy)
    math.randomseed(os.time())
    while enemy.health > 0 do
        self:attack(enemy)
        --sleep(self.attackRate)
    end
    io.write("He's dead, Jim!\n\n")
end

function Character:attack(enemy)
    local hitRand = math.random(1,100)
    if hitRand > enemy.dodge then -- we hit!
        local out
        local critRand = math.random(1,100)
        if critRand < self.critChance then -- it's a CRIT 
            out = self.dmg * (self.critMultiplier / 100)
            io.write("!")
        else                               -- it's not a crit
            out = self.dmg
        end
        local dmg = (out * (1 - (enemy.armor / 100)))
        enemy.health = enemy.health - dmg  -- teh damages
        io.write(dmg,"\n")
    else
        io.write("Dodge\n")
    end
end


james = Character
joe = Enemy

james:fight(joe)
