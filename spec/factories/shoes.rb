FactoryGirl.define do
  factory :shoe do
    model 'Kobe'
    version '2'
    brand 'Adidas'
    picture 'https://adictscorner.files.wordpress.com/2015/08/1395633122281.jpg'
    year '2004'
    price 175
    description 'This is not my favorite shoe.'
    user
  end
end
