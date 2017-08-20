import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';

import { Order } from '../models/order';


@Injectable()
export class OrderService {

  constructor(private http: HttpClient) { }

  fetchOrders () : Observable<Order[]>{
    return this.http.get<Order[]>('http://localhost:3000/orders', { withCredentials: true })
  }

}
