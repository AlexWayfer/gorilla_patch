# frozen_string_literal: true

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
	t.verbose = false
end
task default: :spec

task :release, %i[version] do |_t, args|
	version = args[:version]

	raise ArgumentError, 'No version provided' unless version

	## Write new version to version file
	project_name = File.basename(__dir__)
	version_file = File.join(__dir__, 'lib', project_name, 'version.rb')
	File.write version_file, File.read(version_file).sub(/'.+'/, "'#{version}'")

	## Update CHANGELOG
	require 'date'
	changelog_file = File.join(__dir__, 'CHANGELOG.md')
	lines = File.readlines(changelog_file)
	File.write changelog_file, lines.insert(
		lines.index("## master (unreleased)\n") + 2,
		"## #{version} (#{Date.today})\n",
		"\n"
	).join

	raise 'test'

	## Commit version update
	sh "git add #{version_file}"
	sh "git commit -m 'Update version to #{version}'"

	## Tag commit
	sh "git tag -a v#{version} -m 'Version #{version}'"

	## Push commit
	sh 'git push'

	## Push tags
	sh 'git push --tags'

	## Build new gem file
	gemspec_file = Dir[File.join(__dir__, '*.gemspec')].first
	sh "gem build #{gemspec_file}"

	## Push new gem file
	gem_file = Dir[File.join(__dir__, "*-#{version}.gem")].first
	sh "gem push #{gem_file}"
end
