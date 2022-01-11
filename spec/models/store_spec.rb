require 'rails_helper'

RSpec.describe Store, type: :model do
  it { should have_many(:products).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:currency) }
end
