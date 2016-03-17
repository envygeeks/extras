Dir[File.join(File.expand_path(__dir__), "{*,**/*}.rb")].each do |f|
  require f
end
