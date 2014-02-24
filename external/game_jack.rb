require_relative 'test_plug'

class GameJack
  def initialize(plug)
    @plug = Module.const_get "#{plug.to_s.capitalize}Plug"
  end
end
