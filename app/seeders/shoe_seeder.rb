class ShoeSeeder
  SHOES = [
    {
      model: "T-Mac",
      brand: "Adidas",
      version: "2",
      description: "One of the first low-cut basketball sneakers to receive positive feedback from consumers.",
      price: 100,
      year: "2002",
      picture: "http://14042-presscdn-0-36.pagely.netdna-cdn.com/wp-content/uploads/2015/01/adidas-return-of-the-mac-fnl-03.jpg",
    }, {
      model: "Attitude",
      brand: "Adidas",
      version: "One and only",
      description: "A year after the Jordan 1 dropped, adidas tried its luck with the concept by putting Patrick Ewing in the Attitude.",
      price: 100,
      year: "1986",
      picture: "http://14042-presscdn-0-36.pagely.netdna-cdn.com/wp-content/uploads/2015/01/adidas-originals-attitude-hi-knicks-1-1.jpg",
    }, {
      model: "Answer",
      brand: "Reebok",
      version: "1",
      description: "The Answer is considered one of, if not the greatest, sneaker in Iverson’s extensive signature series.",
      price: 200,
      year: "1997",
      picture: "http://14042-presscdn-0-36.pagely.netdna-cdn.com/wp-content/uploads/2015/01/Reebok-Answer-I.png",
    }, {
      model: "Air Max LeBron",
      brand: "Nike",
      version: "VII",
      description: "LeBron James’ seventh signature sneaker, the Nike Air Max LeBron VII, was groundbreaking from a technological perspective, and it looked great.",
      price: 250,
      year: "2009",
      picture: "http://14042-presscdn-0-36.pagely.netdna-cdn.com/wp-content/uploads/2014/07/nike-lebron-7.jpg",
    }
  ]

  def self.seed!
    SHOES.each do |shoe_params|
      shoe = Shoe.new
      shoe.model = shoe_params[:model]
      shoe.brand = shoe_params[:brand]
      shoe.version = shoe_params[:version]
      shoe.description = shoe_params[:description]
      shoe.price = shoe_params[:price]
      shoe.year = shoe_params[:year]
      shoe.picture = shoe_params[:picture]
      shoe.user_id = 1
      shoe.save!
    end
  end
end
