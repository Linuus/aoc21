# frozen_string_literal: true

class Board
  attr_accessor(:rows)

  def initialize(rows)
    @rows = rows
  end

  def mark(number)
    self.rows = rows.map do |row|
      row.map { |e| e == number ? "X" : e }
    end
  end

  def won?
    rows.any? { |row| row.all? { |e| e == "X" } } ||
    columns.any? { |column| column.all? { |e| e == "X" } }
  end

  def sum
    rows.flatten.sum(&:to_i)
  end

  private

  def columns
    rows.transpose
  end
end

class Game
  attr_accessor(:numbers, :boards, :winners)

  def initialize
    @winners = []
    input = File.read("input.txt").split("\n\n")
    @numbers = input.first.split(",").map(&:to_i)
    @boards = input.slice(1..-1).map { |b| Board.new(b.split("\n").map { |r| r.split.map(&:to_i) }) }
  end

  def print_winning_scores
    numbers.each do |number|
      boards.each.with_index do |board, index|
        next if winners.include?(board)

        board.mark(number)
        if board.won?
          winners << board
          puts("Winner! Board #{index} won!")
          puts("Score: #{board.sum * number}")
        end
      end
    end
  end
end

Game.new.print_winning_scores
