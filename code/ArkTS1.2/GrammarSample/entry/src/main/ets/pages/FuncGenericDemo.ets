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
  Component,ButtonType,
  Button,
  HorizontalAlign,
  TextAlign,
  ClickEvent,
  ForEach,
  Row,Color,
  FlexAlign,
  Margin,
  FontWeight,Divider,
  Builder,
  Scroll,
  Image,List
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { PromptAction, UIContext } from '@ohos.arkui.UIContext';
// 定义一个泛型商品类
class Product {
  public name: string;
  public price: number;
  public category: string;

  constructor(name: string, price: number, category: string) {
    this.name = name;
    this.price = price;
    this.category = category;
  }
}

// 定义一个泛型用户类
class User {
  public id: number;
  public name: string;
  public email: string;

  constructor(id: number, name: string, email: string) {
    this.id = id;
    this.name = name;
    this.email = email;
  }
}

// 购物车项类
class CartItem {
  public product: Product;
  public quantity: number;

  constructor(product: Product, quantity: number) {
    this.product = product;
    this.quantity = quantity;
  }
}

// 泛型遍历函数
@Builder
function forEachWithType<T>(arrayList: T[], closer: @Builder(item : T) => void) {
  Column() {
    ForEach(arrayList, (item: T) => {
      Row() {
        closer(item);
      }
      .margin({ bottom: 10 } as Margin)
    })
  }
}

@Entry
@Component
export struct FuncGenericDemo {
  @State currentTab: number = 0;
  @State cartItems: CartItem[] = new Array<CartItem>();
  uiContext: UIContext | undefined = undefined;

  aboutToAppear(): void {
    this.uiContext = this.getUIContext();
  }
  // 商品列表
  private products: Product[] = [
    new Product("智能手机", 3999, "电子产品"),
    new Product("笔记本电脑", 6999, "电子产品"),
    new Product("编程书籍", 49, "文化用品"),
    new Product("无线耳机", 899, "电子产品")
  ];

  // 用户列表
  private users: User[] = [
    new User(1, "张三", "zhangsan@example.com"),
    new User(2, "李四", "lisi@example.com"),
    new User(3, "李华", "lihua@example.com"),
    new User(4, "王梅", "wangmei@example.com")
  ];

  // 商品渲染构建器
  @Builder
  productBuilder(product: Product) {
    Row() {
      Column() {
        Text(product.name)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        Text(`价格: ¥${product.price}`)
          .fontColor(Color.Gray)
        Text(`分类: ${product.category}`)
          .fontColor(Color.Gray)
      }
      .width('60%')
      Column() {
        Button('加入购物车')
          .onClick((e:ClickEvent) => {
            this.addToCart(product);
          })
          .backgroundColor('#4a7dff')
          .fontColor(Color.White)
      }
    }
    .padding(15)
    .borderRadius(10)
    .backgroundColor(Color.White)
    .margin({ bottom: 10 } as Margin)
    .width('100%')
  }

  // 用户渲染构建器
  @Builder
  userBuilder(user: User) {
    Row() {
      Column() {
        Text(user.name)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)

        Text(user.email)
          .fontColor(Color.Gray)
      }
      .width('100%')
    }
    .padding(15)
    .borderRadius(10)
    .backgroundColor(Color.White)
    .margin({ bottom: 10 } as Margin)
    .width('100%')
  }

  // 购物车项渲染构建器
  @Builder
  cartItemBuilder(item: CartItem) {
    Row() {
      Column() {
        Text(item.product.name)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Text(`¥${item.product.price} × ${item.quantity}`)
          .fontColor(Color.Gray)
      }
      .width('60%')
      Text(`¥${item.product.price * item.quantity}`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ left: 10 } as Margin)
    }
    .padding(10)
    .borderRadius(8)
    .backgroundColor(Color.White)
    .margin({ bottom: 8 } as Margin)
    .width('100%')
  }

  // 添加到购物车
  addToCart(product: Product) {
    // 创建购物车项的深拷贝数组
    const newCartItems = [...this.cartItems];
    const existingIndex = newCartItems.findIndex(item => item.product.name === product.name);

    if (existingIndex >= 0) {
      // 创建新的购物车项对象而不是修改现有对象
      const existingItem = newCartItems[existingIndex.toInt()];
      newCartItems[existingIndex.toInt()] = new CartItem(
        existingItem.product,
        existingItem.quantity + 1
      );
    } else {
      // 添加新项
      newCartItems.push(new CartItem(product, 1));
    }

    // 赋值新数组以触发状态更新
    this.cartItems = newCartItems;
    // 弹窗提示
    let promptAction: PromptAction = this.uiContext!.getPromptAction();
    promptAction.showToast({
      message: `${product.name} 添加成功`,
      duration: 1000
    });
  }

  // 计算购物车总价
  getTotalPrice(): number {
    let total = 0;
    for (let i = 0; i < this.cartItems.length; i++) {
      total += this.cartItems[i].product.price * this.cartItems[i].quantity;
    }
    return total;
  }

  build() {
    Column() {
      // 顶部选项卡
      Row() {
        Button('商品列表')
          .onClick((e:ClickEvent) => { this.currentTab = 0 })
          .backgroundColor(this.currentTab === 0 ? '#4a7dff' : '#f0f0f0')
          .fontColor(this.currentTab === 0 ? Color.White : Color.Black)
          .margin({ right: 10 } as Margin)
        Button('用户列表')
          .onClick((e:ClickEvent) => { this.currentTab = 1 })
          .backgroundColor(this.currentTab === 1 ? '#4a7dff' : '#f0f0f0')
          .fontColor(this.currentTab === 1 ? Color.White : Color.Black)
          .margin({ right: 10 } as Margin)
        Button('购物车')
          .onClick((e:ClickEvent) => { this.currentTab = 2 })
          .backgroundColor(this.currentTab === 2 ? '#4a7dff' : '#f0f0f0')
          .fontColor(this.currentTab === 2 ? Color.White : Color.Black)
      }
      .padding(10)
      .width('100%')
      .justifyContent(FlexAlign.Center)

      // 内容区域
      Scroll() {
        switch (this.currentTab.toInt()) {
          case 0:
            Column() {
              Text('商品列表')
                .fontSize(24)
                .margin({ bottom: 15 } as Margin)
              List(){
                // 使用泛型函数渲染商品列表
                forEachWithType<Product>(this.products, this.productBuilder)
              }
            }
            .padding(15)
            .width('100%')
            .height('100%')
            break;
          case 1:
            Column() {
              Text('用户列表')
                .fontSize(24)
                .margin({ bottom: 15 } as Margin)

              // 使用泛型函数渲染用户列表
              forEachWithType<User>(this.users, this.userBuilder)
            }
            .padding(15)
            .width('100%')
            .height('100%')
            break;
          case 2:
            Column() {
              Text('购物车')
                .fontSize(24)
                .margin({ bottom: 15 } as Margin)

              if (this.cartItems.length > 0) {
                forEachWithType<CartItem>(this.cartItems, this.cartItemBuilder)

                Divider()
                  .margin({ top: 20, bottom: 15 } as Margin)

                Row() {
                  Text("总计:")
                    .fontSize(18)
                  Text(`¥${this.getTotalPrice()}`)
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .margin({ left: 10 } as Margin)
                }

                Button('结算')
                  .width('80%')
                  .margin({ top: 20 } as Margin)
                  .backgroundColor('#4a7dff')
                  .fontColor(Color.White)
              } else {
                Text("购物车为空")
                  .fontSize(18)
                  .fontColor(Color.Gray)
                  .margin({ top: 50 } as Margin)
              }
            }
            .padding(15)
            .width('100%')
            .height('100%')
            break;
          default:
            break;
        }
      }
      .width('100%')
      .height('80%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f0f0f0')
  }
}
