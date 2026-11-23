'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * The shopping cart pages (ShoppingCart.ets / Details.ets) are ArkUI structs,
 * so the suite cannot instantiate them. The quantity, selection and total
 * bookkeeping of those pages is reproduced here as a pure state model and the
 * suites document this mirror at every use site.
 */
export class CartItem {
  public name: string;
  public price: double;
  public quantity: int;
  public selected: boolean;

  constructor(name: string, price: double, quantity: int, selected: boolean) {
    this.name = name;
    this.price = price;
    this.quantity = quantity;
    this.selected = selected;
  }

  public lineTotal(): double {
    return this.price * this.quantity;
  }
}

export const CART_CAPACITY: int = 20;
export const MIN_QUANTITY: int = 1;
export const MAX_QUANTITY: int = 99;
export const DEFAULT_PRICE: double = 19.9;
export const FULL_REDUCTION_THRESHOLD: double = 200;
export const FULL_REDUCTION_AMOUNT: double = 20;

export class CartModel {
  public items: CartItem[] = [];

  constructor(seedCount: int) {
    for (let index = 1; index <= seedCount; index++) {
      this.items.push(new CartItem('商品' + index.toString(), DEFAULT_PRICE, 1, true));
    }
  }

  public size(): int {
    return this.items.length;
  }

  public addItem(name: string, price: double): void {
    this.items.push(new CartItem(name, price, MIN_QUANTITY, true));
  }

  public removeItem(index: int): boolean {
    if (index < 0 || index >= this.items.length) {
      return false;
    }
    this.items.splice(index, 1);
    return true;
  }

  /** Quantity change clamps to the inclusive range maintained by the page. */
  public changeQuantity(index: int, delta: int): int {
    if (index < 0 || index >= this.items.length) {
      return -1;
    }
    const next: int = this.items[index].quantity + delta;
    if (next < MIN_QUANTITY) {
      this.items[index].quantity = MIN_QUANTITY;
    } else if (next > MAX_QUANTITY) {
      this.items[index].quantity = MAX_QUANTITY;
    } else {
      this.items[index].quantity = next;
    }
    return this.items[index].quantity;
  }

  public toggleSelected(index: int): boolean {
    if (index < 0 || index >= this.items.length) {
      return false;
    }
    this.items[index].selected = !this.items[index].selected;
    return this.items[index].selected;
  }

  public selectAll(selected: boolean): void {
    for (let index = 0; index < this.items.length; index++) {
      this.items[index].selected = selected;
    }
  }

  public selectedCount(): int {
    let total: int = 0;
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].selected) {
        total = total + 1;
      }
    }
    return total;
  }

  public allSelected(): boolean {
    return this.items.length > 0 && this.selectedCount() === this.items.length;
  }

  public subtotal(): double {
    let total: double = 0;
    for (let index = 0; index < this.items.length; index++) {
      total = total + this.items[index].lineTotal();
    }
    return total;
  }

  public selectedSubtotal(): double {
    let total: double = 0;
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].selected) {
        total = total + this.items[index].lineTotal();
      }
    }
    return total;
  }

  /** Full reduction rule displayed on the details page banner. */
  public payable(): double {
    const base: double = this.selectedSubtotal();
    if (base >= FULL_REDUCTION_THRESHOLD) {
      return base - FULL_REDUCTION_AMOUNT;
    }
    return base;
  }

  public totalUnits(): int {
    let total: int = 0;
    for (let index = 0; index < this.items.length; index++) {
      total = total + this.items[index].quantity;
    }
    return total;
  }

  public names(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.items.length; index++) {
      result.push(this.items[index].name);
    }
    return result;
  }
}

/** Bar placement used by the settlement button on both pages. */
export enum SettlementBar {
  CART = 0,
  DETAILS = 1,
}

export class BottomBarModel {
  public title: string;
  public barType: SettlementBar;
  public enabled: boolean;

  constructor(title: string, barType: SettlementBar) {
    this.title = title;
    this.barType = barType;
    this.enabled = true;
  }

  public disableWhenEmpty(model: CartModel): void {
    this.enabled = model.selectedCount() > 0;
  }
}

/** Price block rendered by the Details page product info section. */
export class ProductInfoModel {
  public price: double;
  public sold: int;
  public couponAvailable: boolean;

  constructor(price: double, sold: int, couponAvailable: boolean) {
    this.price = price;
    this.sold = sold;
    this.couponAvailable = couponAvailable;
  }

  public priceText(): string {
    return '¥' + this.price.toFixed(2);
  }

  public soldText(): string {
    return '已售' + this.sold.toString();
  }

  public discountLine(): string {
    if (this.couponAvailable) {
      return '满200减20';
    }
    return '';
  }
}
