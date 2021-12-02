# frozen_string_literal: true

puts File.foreach("./input.txt").each_with_object(Hash.new(0)) { |l, hsh| dir, dist = l.chomp.split; hsh[dir] += dist.to_i }.then { |res| res["forward"] * (res["down"] - res["up"]) }
