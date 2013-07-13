require 'spec_helper'

describe NodeFriendship do

  before do
    @friend = NodeFriendship.new()
  end

  subject { @friend }

  it { should be_valid }

end
