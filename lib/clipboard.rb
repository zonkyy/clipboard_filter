# -*- coding: utf-8 -*-

# クリップボードの読み書きを行う．
# xclip が必要．
class Clipboard
  def self.read
    `xclip -o`.chomp
  end

  def self.write(string)
    system("echo -n '#{string}' | xclip")
  end
end
