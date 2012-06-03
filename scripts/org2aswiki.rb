# -*- coding: utf-8 -*-
# 見出し: 「*」 -> 「==」
# リスト: 「-」 -> 「*」
# 説明リスト: 「- A ::」 -> 「+ A」
# 列挙リスト: 「1.」 -> 「(1)」
# 表: 「|a|b|c|」 -> 「||a||b||c||」

HEADLINE_RE = /^(\*+)/
DEFLIST_RE = /^(\s*)-(.+)::/
UNORDERED_LIST_RE = /^(\s*)[-+]/
ORDERED_LIST_RE = /^(\s*)(\d)[.)]/
TABLE_RE = /^\s*\|/
TABLE_SEPARATER_RE = /^\s*\|[-+]+\|/

ARGF.each_line do |line|
  case line
  when HEADLINE_RE
    line.sub!(HEADLINE_RE) {"#{'=' * ($1.length + 1)}"}
  when DEFLIST_RE
    line.sub!(DEFLIST_RE) {"#{$1}+#{$2}\n"}
  when UNORDERED_LIST_RE then
    line.sub!(UNORDERED_LIST_RE, '\1*')
  when ORDERED_LIST_RE then
    line.sub!(ORDERED_LIST_RE, '\1(\2)')
  when TABLE_RE then
    if line =~ TABLE_SEPARATER_RE
      line.gsub!(/[|+]/, '||')
      line.gsub!(/-/, ' ')
    else
      line.gsub!(/\|/, '||')
    end
  end
  print line
end
