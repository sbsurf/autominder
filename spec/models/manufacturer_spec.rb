require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  it { is_expected.to respond_to(:name) }
end
