require 'rails_helper'

RSpec.describe Shoe, type: :model do

  it { should have_valid(:model).when('Air Jordan', 'Kobe') }
  it { should_not have_valid(:model).when(nil, '') }

  it { should have_valid(:version).when('2000', '8') }
  it { should_not have_valid(:version).when(nil, '') }

  it { should have_valid(:brand).when('Nike', 'Reebok') }
  it { should_not have_valid(:brand).when(nil, '') }

  it { should have_valid(:picture).when('http://images.gearjunkie.com/uploads/2015/06/VazeePace.jpg', 'http://media03.toms.com/static/www/new/images/giving/gv-prod-sport-shoe.png') }
  it { should_not have_valid(:picture).when(nil, '') }

  it { should have_valid(:year).when('2000', '2015') }
  it { should_not have_valid(:year).when(nil, '', 99, "test", 11111) }

  it { should have_valid(:price).when('100', '150.00') }
  it { should_not have_valid(:price).when(nil, '', 0, 1.123) }

  it { should have_valid(:description).when('Great', 'Love it') }
  it { should_not have_valid(:description).when(nil, '') }

end
