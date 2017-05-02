require 'rails_helper'

RSpec.describe Audio, type: :model do
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:length) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:date) }
end
