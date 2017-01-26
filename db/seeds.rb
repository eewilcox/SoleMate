
if Rails.env.development? || Rails.env.production?
  UserSeeder.seed!
end

if Rails.env.development? || Rails.env.production?
  ShoeSeeder.seed!
end
