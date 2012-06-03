class String
  def to_snake_case
    self.gsub(/\s/, '_').
      gsub(/([A-Z])([A-Z][a-z])/, '\1_\2').
      gsub(/([a-z\d])([A-Z])/, '\1_\2').
      tr("-", "_").
      downcase
  end
end

ARGF.each_line do |line|
  print line.to_snake_case
end
