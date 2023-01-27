require "spec_helper"

RSpec.describe Youtrack::Client do
  describe 'initialize' do
    it "needs url and token" do
      expect { Youtrack::Client.new(base_url: "test", token: "test") }.not_to raise_error
    end
  end
end
