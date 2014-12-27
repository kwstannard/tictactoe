class TTTApp
  def initialize(environment = :development)
    set_up_actions
    set_up_repositories(environment)
  end

  def route(action, *args)
    @actions.fetch(action.to_s).new(*args).execute
  end

  private

  def set_up_repositories(environment)
    case environment
    when :test
      Repository.register(:game, MemoryRepository::Game)
    end
  end

  def set_up_actions
    @actions = {}
    Dir["#{File.dirname(__FILE__)}/app/actions/*.rb"].each do |file|
      require file
      file_name = file.match(/(\w+)(?=\.rb)/)[0]
      klass = Module.const_get(file_name.split('_').map(&:capitalize).join)
      @actions.store(file_name, klass)
    end
  end

end
