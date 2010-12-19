require 'rubygems'
require 'pp'

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']

## Wirble configuration
begin
  require 'wirble'

  # Wirble colors
  colors = Wirble::Colorize.colors.merge({
                                           :object_class => :black,
                                           :class        => :dark_gray,
                                           :symbol       => :red,
                                           :symbol_prefix=> :blue,
                                         })

  Wirble::Colorize.colors = colors
  Wirble.init
  Wirble.colorize
rescue LoadError
  puts "wirble not loaded, `gem install wirble` to enable"
end

## Easy access to methods
class Object
  def local_methods
    (methods - Object.methods).sort
  end
end

## Helper for rails logging
def log_to(stream=$stdout)
  ActiveRecord::Base.logger = Logger.new(stream)
  ActiveRecord::Base.connection_pool.clear_reloadable_connections!
end

## Quick benchmark
def quick_bm(repetitions=100, &block)
  require 'benchmark'

  Benchmark.bmbm do |b|
    b.report {repetitions.times &block}
  end
  nil
end

## Even quicker benchmark
def bm
  start = Time.now
  result = yield
  delta = Time.now - start
  puts "Elapsed: #{delta} seconds"
  result
end

## Automatic indentation
IRB.conf[:AUTO_INDENT]=true

## Load the readline module.
IRB.conf[:USE_READLINE] = true

## Remove the annoying irb(main):001:0 and replace with >>
IRB.conf[:PROMPT_MODE]  = :SIMPLE

## Quiet mode
def set_echo_mode(is_echo)
  if IRB.CurrentContext && IRB.CurrentContext.respond_to?(:echo)
    IRB.CurrentContext.echo = is_echo
  else
    IRB.conf[:ECHO] = is_echo
  end
end

def quiet
  set_echo_mode(false)
end

def not_quiet
  set_echo_mode(true)
end

alias q quiet
alias nq not_quiet

## Clear the screen
def clear
  system 'clear'
  if ENV['RAILS_ENV']
    return "Rails environment: " + ENV['RAILS_ENV']
  else
    return "No rails environment - happy hacking!";
  end
end

## Method to pretty-print object methods
# Coded by sebastian delmont
# http://snippets.dzone.com/posts/show/2916
class Object
  ANSI_BOLD       = "\033[1m"
  ANSI_RESET      = "\033[0m"
  ANSI_LGRAY    = "\033[0;37m"
  ANSI_GRAY     = "\033[1;30m"

  # Print object's methods
  def pm(*options)
    methods = self.methods
    methods -= Object.methods unless options.include? :more
    filter = options.select {|opt| opt.kind_of? Regexp}.first
    methods = methods.select {|name| name =~ filter} if filter

    data = methods.sort.collect do |name|
      method = self.method(name)
      if method.arity == 0
        args = "()"
      elsif method.arity > 0
        n = method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")})"
      elsif method.arity < 0
        n = -method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")}, ...)"
      end
      klass = $1 if method.inspect =~ /Method: (.*?)#/
      [name, args, klass]
    end
    max_name = data.collect {|item| item[0].size}.max
    max_args = data.collect {|item| item[1].size}.max
    data.each do |item|
      print " #{ANSI_BOLD}#{item[0].to_s.rjust(max_name)}#{ANSI_RESET}"
      print "#{ANSI_GRAY}#{item[1].ljust(max_args)}#{ANSI_RESET}"
      print "   #{ANSI_LGRAY}#{item[2]}#{ANSI_RESET}\n"
    end
    data.size
  end
end
