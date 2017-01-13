Gem::Specification.new do |s|
	s.name          = 'gorilla-patch'
	s.version       = '2.0.0'
	s.date          = Date.today.to_s
	s.summary       = 'Refining core classes'
	s.description   = 'Refine Ruby Core classes with methods like Active Support.'
	s.authors       = ['Alexander Popov']
	s.email         = 'alex.wayfer@gmail.com'
	s.files = Dir[File.join('lib', '**', '{*,.*}')]
	s.homepage      = 'https://github.com/AlexWayfer/gorilla-patch'
	s.license       = 'MIT'

	s.add_development_dependency 'rspec', '~> 3'
	s.add_development_dependency 'rubocop', '~> 3'
end
