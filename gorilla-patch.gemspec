Gem::Specification.new do |s|
	s.name			= 'gorilla-patch'
	s.version		= '0.0.3'
	s.date			= Date.today.to_s
	s.summary		= "Monkey patch, Core extensions"
	s.description	= "Refine Ruby Core classes."
	s.authors		= ["Alexander Popov"]
	s.email			= "alex.wayfer@gmail.com"
	s.files = [
		"lib/gorilla-patch.rb",
		"lib/gorilla-patch/array.rb",
		"lib/gorilla-patch/hash.rb",
		"lib/gorilla-patch/module.rb"
	]
	s.homepage		= "https://bitbucket.org/AlexWayfer/gorilla-patch"
	s.license		= "MIT"
end
