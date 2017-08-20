import { Food } from './food';

export class Order {

  constructor (
    public id: number,
    public orderAt: string,
    public offerAt: string,
    public total: number,
    public foods: Food[]
  ) { }

  static buildFromApiResponse (obj: any) : Order {
    return new Order(
      obj.id,
      obj.order_at,
      obj.offer_at,
      obj.total,
      obj.foods.map((food) => Food.buildFromApiResponse(food))
    )
  }

  toObject () : any {
    return {
      id: this.id,
      order_at: this.orderAt,
      offer_at: this.offerAt,
      total: this.total,
      foods: this.foods.map((food) => food.toObject())
    }
  }
}
