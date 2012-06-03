# -*- coding: utf-8 -*-
# スクリプトサンプル
# 標準入力で受け取った文字列の先頭に '!'，
# 末尾に '?' をつけた文字列を標準出力する

ARGF.each_line do |line|
  print "!" + line + "?"
end
