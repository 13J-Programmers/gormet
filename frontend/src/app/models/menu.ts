export class Menu {

  constructor (
    public id: number,
    public name: string,
    public price: number,
    public stock: number
  ) { }

  static buildFromApiResponse (obj: any) : Menu {
    return new Menu(
      obj.id, obj.name, obj.price, obj.stock
    )
  }

  toObject () : any {
    return {
      id: this.id,
      name: this.name,
      price: this.price,
      stock: this.stock,
    }
  }
}
