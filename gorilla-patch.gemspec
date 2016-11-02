Gem::Specification.new do |s|
	s.name          = 'gorilla-patch'
	s.version       = '0.1.0'
	s.date          = Date.today.to_s
	s.summary       = 'Monkey patch, Core extensions'
	s.description   = 'Refine Ruby Core classes.'
	s.authors       = ['Alexander Popov']
	s.email         = 'alex.wayfer@gmail.com'
	s.files = Dir[File.join('lib', '**', '{*,.*}')]
	s.homepage      = 'https://github.com/AlexWayfer/gorilla-patch'
	s.license       = 'MIT'
end
