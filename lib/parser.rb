# -*- coding: utf-8 -*-
require 'stringio'
require 'clipboard'

# クリップボードの内容をスクリプトで変換する．
# スクリプトは入力を標準入力，出力を標準出力とする．
class Parser
  def initialize(script)
    @script = script
  end

  def convert
    read_clipboard
    write_clipboard(parse)
  end


  private
  def read_clipboard
    @clip = Clipboard.read
  end

  def write_clipboard(str)
    Clipboard.write(str)
  end

  def parse
    # ARGF で標準入力を使用するために ARGV を空にする
    argvtmp = []
    argvtmp.unshift(ARGV.shift) until ARGV.empty?
    $stdin = StringIO.new(@clip)
    parsed = String.new
    $stdout = StringIO.new(parsed)
    load(@script, true)
    ARGV.unshift(argvtmp.shift) until argvtmp.empty?
    $stdin = STDIN
    $stdout = STDOUT
    parsed
  end
end
