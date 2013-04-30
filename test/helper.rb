$:.unshift(File.expand_path("../lib", File.dirname(__FILE__)))

require "cutest"

if ENV["SCRIPTED"]
  require "ohm/scripted"
else
  require "ohm"
end

require "ohm/contrib"
require "override"

NOW = Time.utc(2010, 5, 12)

include Override

prepare do
  Ohm.flush
  override(Time, :now => NOW)
end

def assert_nothing_raised(*exceptions)
  begin
    yield
  rescue *exceptions
    flunk(caller[1])
  end
end
