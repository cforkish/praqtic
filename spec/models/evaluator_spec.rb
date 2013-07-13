require 'spec_helper'

describe Evaluator do

  before do
    @eval = Evaluator.new()
  end

  subject { @eval }

  it { should be_valid }

end
