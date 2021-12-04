# frozen_string_literal: true

g = File.read("input.txt").split.map(&:chars).transpose.map { |n| n.tally.max_by { |_, v| v }.first }.join.to_i(2)
puts g * (g ^ 0b111111111111)
