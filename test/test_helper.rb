require "rack/test"
require "minitest/autorun"

# Always use local Rulers first
gem_dir = File.join(File.dirname(__FILE__), "..", "lib")
$LOAD_PATH.unshift File.expand_path(gem_dir)
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

require "rulers"
