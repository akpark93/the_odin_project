root = File.expand_path("../", File.dirname(__FILE__))
require "#{root}/lib/mastermind.rb"


bob = Mastermind::Player.new({name:"Bob"})
game = Mastermind::Game.new(bob)
game.play