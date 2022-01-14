namespace :seed do
  task :stores_and_products => [ :environment ] do
    # raise "Don't run this in production!" if Rails.env.production?

    Store.create!(
      name: 'Casa Tortuga',
      currency: 1,
      phone: '+506-8357-9371',
      email: 'casatortuga@cr.com'
    )
    Product.create!(
      position: 0,
      category: 0,
      store_id: Store.first.id,
      variable_pricing: true,
      description: 'Find your inner peace at this adults-only secluded cabana area. Complimentary drinks and transportation to and from nearby hotels included in ticket price.',
      name: 'Private Cabana',
      featured: true,
      live: true
    )

    Store.create!(
      name: 'Beach Games',
      currency: 0,
      phone: '+506-5723-0019',
      email: 'beachgames@cr.com'
    )
    Product.create!(
      position: 1,
      amount: 135000,
      category: 1,
      store_id: Store.second.id,
      variable_pricing: false,
      description: 'Reserve this special area of a pristine beach to play a few games by the hour. Channel your inner Tom Cruise and re-enact your favorite scene from Top Gun!',
      name: 'Beach Volleyball',
      featured: true,
      live: true
    )

    Store.create!(
      name: 'Nature Vibes',
      currency: 2,
      phone: '+506-4437-8755',
      email: 'naturevibes@cr.com'
    )
    Product.create!(
      position: 2,
      amount: 89000,
      category: 2,
      store_id: Store.third.id,
      variable_pricing: false,
      description: 'Tour the Hacienda Baru wildlife reserve with a nature expert and take a picture with your favorite Toucan or Parrot! Lunch included in price!',
      name: 'Wildlife Experience',
      featured: true,
      live: true
    )

    Store.create!(
      name: 'Spa Maya',
      currency: 1,
      phone: '+506-8371-8342',
      email: 'spamaya@cr.com'
    )
    Product.create!(
      position: 3,
      amount: 65,
      category: 3,
      store_id: Store.fourth.id,
      variable_pricing: false,
      description: 'Melt your stress away with a relaxing outdoor massage in the rainforest. Sounds of the river and wildlife will soothe your soul as a certifed therpist heals your body.',
      name: 'Outdoor Massage',
      featured: true,
      live: true
    )

    Store.create!(
      name: 'Fuego',
      currency: 1,
      phone: '+506-1187-0573',
      email: 'fuego@cr.com'
    )
    Product.create!(
      position: 4,
      amount: 30,
      category: 4,
      store_id: Store.fifth.id,
      variable_pricing: false,
      description: 'Enjoy a delicious, cold flight of the finest craft brew Costa Rica has to offer! Located in the heart of Dominical.',
      name: 'Local Beer Flight',
      featured: true,
      live: true
    )
  end
end