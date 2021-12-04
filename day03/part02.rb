# frozen_string_literal: true

LINES = File.read("input.txt").split.map(&:chars)

def somemethod
  (0..11).reduce(LINES) do |lines, i|
    freq = lines.transpose[i].tally
    bit = yield(freq)
    lines = lines.select { |l| l[i] == bit }
    break lines if lines.length == 1
    lines
  end.join.to_i(2)
end

o = somemethod do |freq|
  freq["1"] >= freq["0"] ? "1" : "0"
end

co2 = somemethod do |freq|
  freq["0"] <= freq["1"] ? "0" : "1"
end

puts o * co2
