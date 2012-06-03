ARGF.each_line do |line|
  line.gsub!(/\s/, '_')
  line.gsub!(/([A-Z])([A-Z][a-z])/, '\1_\2')
  line.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
  line.tr!("-", "_")
  print line
end
