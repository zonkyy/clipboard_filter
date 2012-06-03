#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'optparse'
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'parser'

# クリップボードの文字列に対して ARGV のプログラムを実行
p = Parser.new(File::expand_path(ARGV[0]))
p.convert
