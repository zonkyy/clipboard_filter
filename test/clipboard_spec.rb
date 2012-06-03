# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/test_helper'
require 'clipboard'

describe Clipboard, "は，" do
  def unique_str
    t = Time.now.usec.to_s
  end

  before do
    @str = unique_str
    system("echo #{@str} | xclip")
  end

  it "クリップボードの内容を取得できる" do
    Clipboard.read.should == @str
  end

  it "クリップボードに文字列を読み込ませることができる" do
    other_str = "other string"
    Clipboard.write(other_str)
    Clipboard.read.should_not == @str
    Clipboard.read.should == other_str
  end
end
