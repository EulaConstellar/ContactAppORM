require 'rspec'
require 'pry'
require 'byebug'
require 'pg'

def safe_require(file)
  require file
rescue LoadError
  # ignore
end

safe_require 'fish'
safe_require 'giant_tuna'
safe_require 'giant_salmon'
safe_require 'shark'
safe_require 'ocean'
safe_require 'submarine'
