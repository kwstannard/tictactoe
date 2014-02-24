require_relative '../../app/repositories/repository'
describe Repository do
  it "stores repos for later retrieval" do
    type = 'user'
    repo = 'user_repo'
    described_class.register(type, repo)
    described_class.for(type).should eq(repo)
  end
end
