class TTTApp
  def set_up(environment)
    set_up_actions
    set_up_repositories(environment)
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
      puts file
      require file
      file_name = file.match(/(\w+)(?=\.rb)/)[0]
      klass = Module.const_get(file_name.split('_').map(&:capitalize).join)
      @actions.store(file_name, klass)
    end
  end

  def method_missing(method, *args, &block)
    @actions.fetch(method.to_s).new(*args).execute
  end
end
