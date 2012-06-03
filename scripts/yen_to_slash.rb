ARGF.each_line do |line|
  print line.gsub(/\\/, '/')
end
