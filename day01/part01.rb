puts File.read("./input.txt").split("\n").each_cons(2).count { |a, b| a.to_i < b.to_i }
