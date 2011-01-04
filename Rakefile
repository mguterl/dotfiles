require 'pathname'

LINK_FILES = %w(ackrc bashrc bash_aliases bash_profile gemrc gitignore irbrc profile railsrc rvmrc)
INSERT_FILES = %w(gitconfig)
LINK_DIRECTORIES = %w(bin)

def stop_error(message)
  puts "ERROR: #{message}"
  exit(1)
end

def symlink(target, link)
  puts "Linking #{link} => #{target}"
  if File.exist?(link) && Pathname.new(link).realpath.to_s != target
    stop_error("File exists: #{link}")
  elsif !File.exist?(link)
    File.symlink(target, link)
    puts
  end
end

def home
  ENV['HOME']
end

def pwd
  File.dirname(__FILE__)
end

desc "Install all dotfiles"
task :install do
  LINK_FILES.each do |file|
    symlink("#{pwd}/#{file}", "#{home}/.#{file}")
  end

  LINK_DIRECTORIES.each do |dir|
    symlink("#{pwd}/#{dir}", "#{home}/#{dir}")
  end

  INSERT_FILES.each do |file|
    insert = File.read("#{pwd}/#{file}").strip
    lines = insert.split("\n")

    matcher = Regexp.new(Regexp.escape(lines.first) + '.*?' + Regexp.escape(lines.last), Regexp::MULTILINE)

    contents = File.read("#{home}/.#{file}")

    puts "Insert content into #{home}/.#{file}"
    output =
      if contents =~ matcher
        contents.sub(matcher, insert)
      else
        puts "WARNING: This is the first time editing #{home}/.#{file} automatically, you should verify the contents."
        insert + "\n" + contents
      end

    File.open("#{home}/.#{file}", 'w') do |f|
      f.write(output)
    end
  end
end
