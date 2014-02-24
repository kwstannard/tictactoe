class Repository
  def self.register(type, repo)
    repositories.store(type, repo)
  end

  def self.for(type)
    repositories.fetch(type)
  end

  private

  def self.repositories
    @repositories ||= {}
  end
end
