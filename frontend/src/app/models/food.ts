export class Food {

  constructor(
    public id: number,
    public amount: number,
    public menu: string
  ) { }

  public static buildFromApiResponse(obj: any) : Food {
    return new Food(obj.id, obj.amount, obj.menu);
  }

  public toObject() : any {
    return {
      id: this.id,
      amout: this.amount,
      menu: this.menu
    }
  }
}
