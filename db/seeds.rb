# users
User.create(email: 'user1@jaga.jp', password: 'password')

# order
@soysource =  Menu.create(name: 'しょうゆバター', price: '250', stock: '100')
@plane = Menu.create(name: 'プレーン', price: '200', stock: '400')
@curry = Menu.create(name: 'カレー', price: '250', stock: '30')

Order.create(
  order_at: Time.zone.now,
  foods_attributes: [{ menu_id: @soysource.id, amount: 1, total: 250 }])
Order.create(
  order_at: Time.zone.now,
  foods_attributes:[
    { menu_id: @soysource.id, amount: 1, total: 250 },
    { menu_id: @plane.id, amount: 2, total: 400 }
  ])