'use static'
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  TextAlign,
  ClickEvent,
  ForEach,
  Row,
  Color,
  FlexAlign,
  Margin,
  FontWeight,
  Divider,
  Builder,
  List
} from '@ohos.arkui.component';
import { State, Observed } from '@ohos.arkui.stateManagement';

// 商品类
@Observed
class Product {
  public name: string;
  public price: int;
  public category: string;
  public count: int;

  constructor(name: string, price: int, category: string, count: int) {
    this.name = name;
    this.price = price;
    this.category = category;
    this.count = count;
  }

  // 用户自定义静态函数
  static FromJSON(e: jsonx.JsonElement): Product {
    return new Product(e.getString('name'), e.getInteger('price'), e.getString('category'), e.getInteger('count'));
  }
}

// 购物车总览
@Observed
class ShoppingCart {
  public totalCount: int = 0;
  public totalPrice: int = 0;
}

@Entry
@Component
export struct JsonParseDemo {
  // 商品
  @State productA: Product = new Product('冰箱', 1999, '电器', 0);
  @State parseA: string = JSON.stringify(this.productA);
  @State productB: Product = new Product('羽绒服', 1000, '服装', 0);
  @State parseB: string = JSON.stringify(this.productB);

  @State shoppingCart: ShoppingCart = new ShoppingCart();

  // 计算总数和总价
  updateTotal() {
    this.shoppingCart.totalCount = this.productA.count + this.productB.count;
    this.shoppingCart.totalPrice = this.productA.count * this.productA.price +
      this.productB.count * this.productB.price;
  }

  build() {
    Column() {
      Text('购物车')
        .fontSize(24)
        .margin({ top: 15, bottom: 15 } as Margin)
      List() {
        Row() {
          Column() {
            Row() {
              Column() {
                Text(this.productA.name)
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                Text(`价格: ¥${this.productA.price}`)
                  .fontColor(Color.Gray)
                Text(`分类: ${this.productA.category}`)
                  .fontColor(Color.Gray)
              }
              .width('60%')
              Column() {
                Row() {
                  Button('+')
                    .onClick((e:ClickEvent) => {
                      this.productA.count += 1;
                      this.updateTotal();
                      this.parseA = JSON.stringify(this.productA);
                    })
                    .backgroundColor('#4a7dff')
                    .fontColor(Color.White)
                    .fontSize(20)
                  Text(String(this.productA.count))
                    .width(50)
                    .textAlign(TextAlign.Center)
                  Button('-')
                    .onClick((e:ClickEvent) => {
                      if (this.productA.count <= 0) {
                        return;
                      }
                      this.productA.count -= 1;
                      this.updateTotal();
                      this.parseA = JSON.stringify(this.productA);
                    })
                    .backgroundColor('#4a7dff')
                    .fontColor(Color.White)
                    .fontSize(20)
                }
              }
            }
            Divider()
              .margin({ top: 15 } as Margin)
            Row() {
              Text(`商品json数据：${this.parseA}`)
                .fontColor(Color.Gray)
                .width('100%')
                .margin({ top: 15 } as Margin)
            }
          }
        }
        .padding(15)
        .borderRadius(10)
        .backgroundColor(Color.White)
        .margin({ bottom: 10 } as Margin)
        .width('100%')
        .height(160)

        Row() {
          Column() {
            Row() {
              Column() {
                Text(this.productB.name)
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                Text(`价格: ¥${this.productB.price}`)
                  .fontColor(Color.Gray)
                Text(`分类: ${this.productB.category}`)
                  .fontColor(Color.Gray)
              }
              .width('60%')
              Column() {
                Row() {
                  Button('+')
                    .onClick((e:ClickEvent) => {
                      this.productB.count += 1;
                      this.updateTotal();
                      this.parseB = JSON.stringify(this.productB);
                    })
                    .backgroundColor('#4a7dff')
                    .fontColor(Color.White)
                    .fontSize(20)
                  Text(String(this.productB.count))
                    .width(50)
                    .textAlign(TextAlign.Center)
                  Button('-')
                    .onClick((e:ClickEvent) => {
                      if (this.productB.count <= 0) {
                        return;
                      }
                      this.productB.count -= 1;
                      this.updateTotal();
                      this.parseB = JSON.stringify(this.productB);
                    })
                    .backgroundColor('#4a7dff')
                    .fontColor(Color.White)
                    .fontSize(20)
                }
              }
            }
            Divider()
              .margin({ top: 15 } as Margin)
            Row() {
              Text(`商品json数据：${this.parseB}`)
                .fontColor(Color.Gray)
                .width('100%')
                .margin({ top: 15 } as Margin)
            }
          }
        }
        .padding(15)
        .borderRadius(10)
        .backgroundColor(Color.White)
        .margin({ bottom: 10 } as Margin)
        .width('100%')
        .height(160)

        Divider()
          .margin({ top: 20, bottom: 15 } as Margin)

        Text(`总件数：${this.shoppingCart.totalCount}，总价格：${this.shoppingCart.totalPrice}`)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)

        Button('恢复默认')
          .onClick((e:ClickEvent) => {
            this.productA = Product.FromJSON(JSON.parseJsonElement('{"name": "冰箱", "category": "电器", "price": 1999, "count": 0}'))!;
            this.parseA = JSON.stringify(this.productA);

            this.productB = Product.FromJSON(JSON.parseJsonElement('{"name": "羽绒服", "category": "服装", "price": 1000, "count": 0}'))!;
            this.parseB = JSON.stringify(this.productB);

            this.shoppingCart = JSON.parse<ShoppingCart>('{"totalCount": 0, "totalPrice": 0}', Type.from<ShoppingCart>())!;
          })
          .width('100%')
          .margin({ top: 20 } as Margin)
          .backgroundColor('#4a7dff')
          .fontColor(Color.White)
      }
    }
    .justifyContent(FlexAlign.Start)
    .padding(15)
    .height('100%')
  }
}