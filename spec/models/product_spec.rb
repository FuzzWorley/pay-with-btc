require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should belong_to(:store) }

  it { should validate_presence_of(:category) }
end
