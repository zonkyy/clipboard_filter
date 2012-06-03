# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/test_helper'
require 'parser'

describe_internally Parser, "は，" do
  before do
    @test_parser = Parser.new(File.dirname(__FILE__) + '/scripts/sample_script.rb')
  end

  describe Clipboard, "によって" do
    before do
      @str = unique_str
      system("echo -n #{@str} | xclip")
    end

    it "クリップボードの内容をインスタンス変数に格納できる" do
      @test_parser.read_clipboard
      str = @str
      @test_parser.instance_eval {
        @clip.should == str
      }
    end

    it "クリップボードに文字列を読み込ませることができる" do
      other_str = "other string"
      @test_parser.write_clipboard(other_str)
      @test_parser.read_clipboard.should_not == @str
      @test_parser.read_clipboard.should == other_str
    end
  end

  # it "外部スクリプトを呼び出せる" do
  #   str = unique_str
  #   @test_parser.instance_eval { @clip = str }
  #   @test_parser.parse.should == "!" + str + "?"
  # end

  it "クリップボードの内容をスクリプトで変換したものに書き換えることができる" do
    clip = unique_str
    system("echo -n #{clip} | xclip")
    @test_parser.convert
    `xclip -o`.chomp.should == "!" + clip + "?"
  end
end
