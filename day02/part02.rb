# frozen_string_literal: true

p = File.foreach("input.txt").map(&:split).each_with_object(Hash.new(0)) { |(dir, dist), hash| hash[dir] += dist.to_i }

puts (p["down"] - p["up"]) * p["forward"]
