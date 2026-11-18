/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// ===== async_data_service =====
// [Start async_data_service]
import http from '@ohos.net.http';

// 辅助类：模拟并发限制器，实际项目中使用@kit.ArkTS提供的并发能力
class ConcurrencyLimiter {
  constructor(maxConcurrency: number) {}
  async run<T>(fn: () => Promise<T>): Promise<T> { return fn(); }
}

interface SvcUser {
  id: number;
  name: string;
  email: string;
}

interface Product {
  id: number;
  title: string;
  price: number;
}

interface Order {
  id: number;
  userId: number;
  productId: number;
  quantity: number;
}

interface AllData {
  users: SvcUser[];
  products: Product[];
  orders: Order[];
}

class SvcDataService {
  private baseUrl: string;
  private requestLimiter: ConcurrencyLimiter;
  
  constructor(baseUrl: string, maxConcurrency: number = 5) {
    this.baseUrl = baseUrl;
    this.requestLimiter = new ConcurrencyLimiter(maxConcurrency);
  }
  
  async fetchUsers(): Promise<SvcUser[]> {
    return this.requestLimiter.run(async (): Promise<SvcUser[]> => {
      let response = await http.createHttp().request(`${this.baseUrl}/users`);
      if (response.responseCode !== 200) {
        throw new Error(`HTTP ${response.responseCode}`);
      }
      return response.result as SvcUser[];
    });
  }

  async fetchProducts(): Promise<Product[]> {
    return this.requestLimiter.run(async (): Promise<Product[]> => {
      let response = await http.createHttp().request(`${this.baseUrl}/products`);
      if (response.responseCode !== 200) {
        throw new Error(`HTTP ${response.responseCode}`);
      }
      return response.result as Product[];
    });
  }

  async fetchOrders(): Promise<Order[]> {
    return this.requestLimiter.run(async (): Promise<Order[]> => {
      let response = await http.createHttp().request(`${this.baseUrl}/orders`);
      if (response.responseCode !== 200) {
        throw new Error(`HTTP ${response.responseCode}`);
      }
      return response.result as Order[];
    });
  }

  async fetchAllData(): Promise<AllData> {
    try {
      let results = await Promise.all([
        this.fetchUsers(),
        this.fetchProducts(),
        this.fetchOrders()
      ]);
      let users: SvcUser[] = results[0];
      let products: Product[] = results[1];
      let orders: Order[] = results[2];

      let allData: AllData = { users: users, products: products, orders: orders };
      return allData;
    } catch (error) {
      console.error('Failed to fetch all data:', (error as Error).message);
      throw new Error(`Failed to fetch all data: ${(error as Error).message}`);
    }
  }
  
  async processData(): Promise<void> {
    try {
      let data = await this.fetchAllData();
      
      console.info(`Users: ${data.users.length}`);
      console.info(`Products: ${data.products.length}`);
      console.info(`Orders: ${data.orders.length}`);
      
      // 计算总销售额
      let totalRevenue: number = 0;
      for (let order of data.orders) {
        let product = data.products.find((p: Product) => p.id === order.productId);
        if (product) {
          totalRevenue += product.price * order.quantity;
        }
      }

      console.info(`Total revenue: ${totalRevenue}`);
    } catch (error) {
      console.error('Data processing failed:', (error as Error).message);
    }
  }
}

// 使用示例
let dataService = new SvcDataService('EXAMPLE_API_URL', 3);

async function serviceMain(): Promise<void> {
  await dataService.processData();
}

serviceMain();
// [End async_data_service]
