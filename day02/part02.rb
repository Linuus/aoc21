# frozen_string_literal: true

p = File.foreach("input.txt").map(&:split).each_with_object(Hash.new(0)) do |(dir, dist), hash|
  case dir
  when "up"
    hash["aim"] -= dist.to_i
  when "down"
    hash["aim"] += dist.to_i
  when "forward"
    hash["forward"] += dist.to_i
    hash["depth"] += hash["aim"] * dist.to_i
  end
end

puts p["depth"] * p["forward"]
