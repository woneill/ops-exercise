require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'foodcritic'
require 'kitchen'

# Style tests. Rubocop and Foodcritic
namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby)

  desc 'Run Chef style checks'
  Dir.chdir('cookbooks') do
    FoodCritic::Rake::LintTask.new(:chef) do |t|
      t.options = {
        fail_tags: ['any']
      }
    end
  end
end

desc 'Run all style checks'
task style: ['style:ruby', 'style:chef']

desc 'Run Test Kitchen'
task :integration do
  Dir.glob('cookbooks/*') do |cookbook|
    Dir.chdir(cookbook) do
      Kitchen.logger = Kitchen.default_file_logger
      Kitchen::Config.new.instances.each do |instance|
        instance.test(:always)
      end
    end
  end
end

# Default
task default: %w(style)

task full: %w(style integration)
