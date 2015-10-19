module MasterMind

bob = Mastermind::Player.new({name:"Bob"})
game = Mastermind::Game.new(bob)
game.play