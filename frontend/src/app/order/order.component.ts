import { Component, OnInit } from '@angular/core';

import { OrderService } from '../services/order.service';
import { Order } from '../models/order';

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.styl']
})
export class OrderComponent implements OnInit {

  constructor(private orderService: OrderService) { }

  public orders: Order[];

  ngOnInit() {
    this.orderService.fetchOrders().subscribe(res => {
      this.orders = res;
    })
  }

}
