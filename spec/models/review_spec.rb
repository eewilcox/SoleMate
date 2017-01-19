require 'rails_helper'

RSpec.describe Review, type: :model do

  it { should have_valid(:rating).when('1', '4') }
  it { should_not have_valid(:rating).when(nil, '', '8') }

  it { should have_valid(:description).when('Smith', 'Anderson') }
  it { should have_valid(:description).when(nil, '') }

end
