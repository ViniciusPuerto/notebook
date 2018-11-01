namespace :utils do
  desc "Popular banco de dados"
  task seed: :environment do
        puts "Gerando contatos"
        10.times do |i|
          Contact.create!(
              name:Faker::Name.name ,
              email:Faker::Internet.email,
              kind: Kind.all.sample,
              rmk: LeroleroGenerator.paragraph([1,2,3].sample)
          )
        end
      Contact.all.each do |i| 
      puts "Gerando Endereços"
      Address.create!(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state,
        contact: i
      )
      end
    puts "Gerando numeros de telefone"
    Contact.all.each do |i|
      Random.rand(1..5).times do |j|
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: i,
        )
        end
      end

  end
end
