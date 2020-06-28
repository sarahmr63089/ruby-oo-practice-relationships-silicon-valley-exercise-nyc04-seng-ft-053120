require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Twitter", "Jack Dorsey", "twitter.com")
s2 = Startup.new("Facebook", "Mark", "facebook.com")
s3 = Startup.new("Reddit", "Satoshi", "reddit.com")

v1 = VentureCapitalist.new("Dan", 2_000_000_000)
v2 = VentureCapitalist.new("Warren Buffet", 100_000)
v3 = VentureCapitalist.new("Mark Cuban", 40_000_000_000)

f1 = FundingRound.new(s1, v1, "seed", 5000000)
f2 = FundingRound.new(s1, v2, "seed", 900)
f3 = FundingRound.new(s2, v2, "seed", 5000)
f4 = FundingRound.new(s1, v2, "seed", 1000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line