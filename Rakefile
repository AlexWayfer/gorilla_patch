# frozen_string_literal: true

require 'date'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
	t.verbose = false
end
task default: :spec

TODAY = Date.today.to_s

def update_changelog(changelog_file, version)
	lines = File.readlines(changelog_file)
	existing_line = lines.find { |line| line.start_with? "## #{version} " }
	if existing_line
		return if (existing_date = existing_line.match(/\((.*)\)/)[1]) == TODAY

		raise "There is already #{version} version with date #{existing_date}"
	end

	File.write changelog_file, lines.insert(
		lines.index("## master (unreleased)\n") + 2,
		"## #{version} (#{TODAY})\n\n"
	).join
end

task :release, %i[version] do |_t, args|
	version = args[:version]

	raise ArgumentError, 'No version provided' unless version

	## Write new version to version file
	project_name = File.basename(__dir__)
	version_file = File.join(__dir__, 'lib', project_name, 'version.rb')
	File.write version_file, File.read(version_file).sub(/'.+'/, "'#{version}'")

	## Update CHANGELOG
	changelog_file = File.join(__dir__, 'CHANGELOG.md')
	update_changelog changelog_file, version

	## Checkout to a new git branch, required for protected `mastrer` with CI
	sh "git switch -c v#{version}"

	## Commit version update
	sh "git add #{version_file} #{changelog_file}"

	sh "git commit -m 'Update version to #{version}'"

	## Tag commit
	sh "git tag -a v#{version} -m 'Version #{version}'"

	## Build new gem file
	gemspec_file = Dir[File.join(__dir__, '*.gemspec')].first
	sh "gem build #{gemspec_file}"

	STDOUT.puts 'Please, validate files and commits before pushing.'
	STDIN.gets

	## Push commit
	sh 'git push'

	## Push tags
	sh 'git push --tags'

	## Push new gem file
	gem_file = Dir[File.join(__dir__, "*-#{version}.gem")].first
	sh "gem push #{gem_file}"
end
