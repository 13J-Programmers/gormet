@soysource =  Menu.create(name: 'しょうゆバター', price: '250', stock: '100')
@plane = Menu.create(name: 'プレーン', price: '200', stock: '400')
@curry = Menu.create(name: 'カレー', price: '250', stock: '30')

Order.create(order_at: Time.zone.now, foods_attributes: [{menu_id: @soysource.id}])
Order.create(order_at: Time.zone.now, foods_attributes: [{menu_id: @soysource.id}, {menu_id: @plane.id}])