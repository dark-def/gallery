require 'io/console'

desc 'Upload images from folder to server'
task :upload => :environment do
  parse_dir
end

def parse_dir
  Dir.chdir('pic_dir')
  target = Dir.new("#{Dir.pwd}")
  target.entries.each do |unit|

    if unit != '.' && unit != '..'

      if File.directory?(unit)

        category = Category.find_or_create_by_title(unit.to_s)
        folder = Dir.new(unit)

        folder.entries.each do |f|
          p Image.create(:title => f, :category_id => category.id, :image => File.open(File.join(target.path, unit, f)))
        end
      end

    end

  end
end