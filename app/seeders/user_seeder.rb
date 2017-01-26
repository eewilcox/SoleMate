class UserSeeder
  USERS = [
    {
      first_name: "Alex",
      last_name: "Jarvis",
      username: "alex.jarvis",
      email: "alex.jarvis@solemate.com",
      password: "password"
    }, {
      first_name: "Camille",
      last_name: "Smith",
      username: "camille.smith",
      email: "camille.smith@solemate.com",
      password: "password"
    }, {
      first_name: "Alex",
      last_name: "Black",
      username: "ab",
      email: "ab@solemate.com",
      password: "password"
    }
  ]

  def self.seed!
    USERS.each do |user_params|
       user = User.new
       user.first_name = user_params[:first_name]
       user.last_name = user_params[:last_name]
       user.username = user_params[:username]
       user.email = user_params[:email]
       user.password = user_params[:password]
       user.save!
    end
  end
end
