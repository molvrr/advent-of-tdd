# frozen_string_literal: true
require 'byebug'

class DaySeven
  attr_accessor :tree, :pwd, :input, :top, :selected_folders

  def initialize(input)
    @input = input
    @tree = { '/' => { size: 0 } }
    @top = 0
    @pwd = []
    @selected_folders = []

    mktree
    calculate_size(tree['/'])

    @required_space = 30_000_000 - (70_000_000 - tree['/'][:size])
    select_folders(tree['/'])
  end

  def part_one
    top
  end

  def part_two
    selected_folders.min
  end

  private

  def mktree
    input.each do |cmd|
      cd = cmd.match(/cd ([\w\/.]+)/)
      file = cmd.match(/(\d+) (\w+)/)

      if cd
        if cd[1] == '..'
          pwd.pop
        elsif pwd.empty?
          pwd.push(cd[1])
          tree[cd[1]] = { size: 0 }
        else
          tree.dig(*pwd)[cd[1]] ||= { size: 0 }
          pwd.push(cd[1])
        end
      elsif file
        tree.dig(*pwd)[:size] += file[1].to_i
      end
    end

    tree
  end

  def calculate_size(dir)
    dir.each_value { |v| dir[:size] += calculate_size(v) if v.is_a?(Hash) }
    self.top += dir[:size] if dir[:size] <= 100_000
    dir[:size]
  end

  def select_folders(dir)
    dir.each_value do |v|
      @selected_folders.push(dir[:size]) if dir[:size] >= @required_space
      select_folders(v) if v.is_a?(Hash)
    end
  end
end
