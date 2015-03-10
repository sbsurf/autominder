require 'rails_helper'

RSpec.describe Car, type: :model do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:year) }
  it { is_expected.to respond_to(:make_id) }
  it { is_expected.to respond_to(:model_id) }
end
