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
 * Self contained business model for the OrangeShopping test suite.
 *
 * The sample application keeps its catalogue, cart and order logic inside HAR
 * and HSP modules. Tests are not allowed to depend on those packaged modules,
 * so the same business rules are modelled here with plain ArkTS classes. Every
 * suite exercises this model and the UI driver, never the packaged bundles.
 *
 * All money values are integer cents. Floating point dollars are never used
 * for comparisons, which keeps totals deterministic across devices.
 */

const CENTS_PER_YUAN: number = 100;
const MAX_CART_QUANTITY: number = 99;
const DEFAULT_STOCK: number = 99;
const MAX_STARS: number = 5;
const MAX_DISCOUNT_PERCENT: number = 100;
const POINTS_PER_YUAN: number = 100;

/**
 * Lifecycle of an order. The numeric values are stable because they are used
 * as indices by the order centre filter tabs.
 */
export enum OrderState {
  OBLIGATION = 0,
  WAIT_DELIVERY = 1,
  WAIT_RECEIVE = 2,
  WAIT_EVALUATE = 3,
  REFUND = 4,
  COMPLETED = 5,
  CANCELLED = 6
}

/**
 * Immutable amount of money expressed in integer cents.
 */
export class Money {
  private readonly amountInCents: number;

  constructor(cents: number) {
    if (!Number.isFinite(cents)) {
      throw new Error('Money requires a finite cent value');
    }
    this.amountInCents = Math.round(cents);
  }

  public static ofYuan(yuan: number): Money {
    return new Money(Math.round(yuan * CENTS_PER_YUAN));
  }

  public static zero(): Money {
    return new Money(0);
  }

  public static sum(values: Money[]): Money {
    let total: number = 0;
    for (let index: number = 0; index < values.length; index++) {
      total += values[index].cents();
    }
    return new Money(total);
  }

  public cents(): number {
    return this.amountInCents;
  }

  public add(other: Money): Money {
    return new Money(this.amountInCents + other.cents());
  }

  public subtract(other: Money): Money {
    return new Money(this.amountInCents - other.cents());
  }

  public multiply(quantity: number): Money {
    if (quantity < 0) {
      throw new Error('Money cannot be multiplied by a negative quantity');
    }
    return new Money(this.amountInCents * quantity);
  }

  public percentage(percent: number): Money {
    if (percent < 0 || percent > MAX_DISCOUNT_PERCENT) {
      throw new Error('Percentage must be between 0 and 100');
    }
    return new Money(Math.round(this.amountInCents * percent / MAX_DISCOUNT_PERCENT));
  }

  public clampAtZero(): Money {
    if (this.amountInCents < 0) {
      return new Money(0);
    }
    return new Money(this.amountInCents);
  }

  public isZero(): boolean {
    return this.amountInCents === 0;
  }

  public isPositive(): boolean {
    return this.amountInCents > 0;
  }

  public isNegative(): boolean {
    return this.amountInCents < 0;
  }

  public equals(other: Money): boolean {
    return this.amountInCents === other.cents();
  }

  public compareTo(other: Money): number {
    if (this.amountInCents < other.cents()) {
      return -1;
    }
    if (this.amountInCents > other.cents()) {
      return 1;
    }
    return 0;
  }

  /**
   * Formats the amount as "¥12.05". The sign is placed before the currency
   * symbol so negative adjustments stay readable in the order summary.
   */
  public format(): string {
    let sign: string = '';
    let absolute: number = this.amountInCents;
    if (absolute < 0) {
      sign = '-';
      absolute = -absolute;
    }
    let yuan: number = Math.floor(absolute / CENTS_PER_YUAN);
    let cents: number = absolute % CENTS_PER_YUAN;
    let centsText: string = cents.toString();
    if (cents < 10) {
      centsText = '0' + centsText;
    }
    return sign + '¥' + yuan.toString() + '.' + centsText;
  }
}

/**
 * A catalogue entry. Field names mirror the products rendered by the sample
 * home page so tests read like the production data model.
 */
export class Goods {
  public id: number;
  public title: string;
  public info: string;
  public labels: string;
  public price: Money;
  public category: string;
  public stock: number;
  public sales: number;
  public rating: number;
  public liveRoomId: number;
  public imageIndex: number;

  constructor(id: number, title: string, info: string, labels: string, price: Money,
    category: string, stock: number = DEFAULT_STOCK, sales: number = 0,
    rating: number = 5, liveRoomId: number = -1, imageIndex: number = 0) {
    this.id = id;
    this.title = title;
    this.info = info;
    this.labels = labels;
    this.price = price;
    this.category = category;
    this.stock = stock;
    this.sales = sales;
    this.rating = rating;
    this.liveRoomId = liveRoomId;
    this.imageIndex = imageIndex;
  }

  public isInStock(): boolean {
    return this.stock > 0;
  }

  public hasLiveRoom(): boolean {
    return this.liveRoomId >= 0;
  }

  public matchesKeyword(keyword: string): boolean {
    let needle: string = keyword.trim().toLowerCase();
    if (needle.length === 0) {
      return false;
    }
    return this.searchText().indexOf(needle) >= 0;
  }

  public searchText(): string {
    return (this.title + ' ' + this.info + ' ' + this.labels + ' ' + this.category).toLowerCase();
  }

  public isExpensive(): boolean {
    return this.price.cents() >= 500000;
  }
}

/**
 * Ordered catalogue with lookup, filtering and sorting helpers.
 */
export class Catalog {
  private goods: Goods[];

  constructor(goods: Goods[]) {
    this.goods = [];
    for (let index: number = 0; index < goods.length; index++) {
      this.goods.push(goods[index]);
    }
  }

  public all(): Goods[] {
    let copy: Goods[] = [];
    for (let index: number = 0; index < this.goods.length; index++) {
      copy.push(this.goods[index]);
    }
    return copy;
  }

  public count(): number {
    return this.goods.length;
  }

  public isEmpty(): boolean {
    return this.goods.length === 0;
  }

  public byId(id: number): Goods | undefined {
    for (let index: number = 0; index < this.goods.length; index++) {
      if (this.goods[index].id === id) {
        return this.goods[index];
      }
    }
    return undefined;
  }

  public indexOf(id: number): number {
    for (let index: number = 0; index < this.goods.length; index++) {
      if (this.goods[index].id === id) {
        return index;
      }
    }
    return -1;
  }

  public ids(): number[] {
    let result: number[] = [];
    for (let index: number = 0; index < this.goods.length; index++) {
      result.push(this.goods[index].id);
    }
    return result;
  }

  public categories(): string[] {
    let result: string[] = [];
    for (let index: number = 0; index < this.goods.length; index++) {
      let category: string = this.goods[index].category;
      if (result.indexOf(category) < 0) {
        result.push(category);
      }
    }
    return result;
  }

  public byCategory(category: string): Goods[] {
    let result: Goods[] = [];
    for (let index: number = 0; index < this.goods.length; index++) {
      if (this.goods[index].category === category) {
        result.push(this.goods[index]);
      }
    }
    return result;
  }

  public inPriceRange(minCents: number, maxCents: number): Goods[] {
    let result: Goods[] = [];
    for (let index: number = 0; index < this.goods.length; index++) {
      let cents: number = this.goods[index].price.cents();
      if (cents >= minCents && cents <= maxCents) {
        result.push(this.goods[index]);
      }
    }
    return result;
  }

  public inStockOnly(): Goods[] {
    let result: Goods[] = [];
    for (let index: number = 0; index < this.goods.length; index++) {
      if (this.goods[index].isInStock()) {
        result.push(this.goods[index]);
      }
    }
    return result;
  }

  public sortedByPrice(ascending: boolean): Goods[] {
    let copy: Goods[] = this.all();
    for (let outer: number = 1; outer < copy.length; outer++) {
      let current: Goods = copy[outer];
      let inner: number = outer - 1;
      while (inner >= 0 && this.comesBefore(current, copy[inner], ascending)) {
        copy[inner + 1] = copy[inner];
        inner--;
      }
      copy[inner + 1] = current;
    }
    return copy;
  }

  private comesBefore(left: Goods, right: Goods, ascending: boolean): boolean {
    let delta: number = left.price.cents() - right.price.cents();
    if (delta === 0) {
      return left.id < right.id;
    }
    if (ascending) {
      return delta < 0;
    }
    return delta > 0;
  }

  public sortedBySales(): Goods[] {
    let copy: Goods[] = this.all();
    for (let outer: number = 1; outer < copy.length; outer++) {
      let current: Goods = copy[outer];
      let inner: number = outer - 1;
      while (inner >= 0) {
        let previous: Goods = copy[inner];
        let shouldShift: boolean = previous.sales < current.sales ||
          (previous.sales === current.sales && previous.id > current.id);
        if (!shouldShift) {
          break;
        }
        copy[inner + 1] = previous;
        inner--;
      }
      copy[inner + 1] = current;
    }
    return copy;
  }

  public topRated(minStars: number): Goods[] {
    let result: Goods[] = [];
    for (let index: number = 0; index < this.goods.length; index++) {
      if (this.goods[index].rating >= minStars) {
        result.push(this.goods[index]);
      }
    }
    return result;
  }

  public page(pageNumber: number, pageSize: number): Goods[] {
    if (pageSize <= 0 || pageNumber < 0) {
      return [];
    }
    let start: number = pageNumber * pageSize;
    let result: Goods[] = [];
    for (let index: number = start; index < start + pageSize && index < this.goods.length; index++) {
      result.push(this.goods[index]);
    }
    return result;
  }

  public pageCount(pageSize: number): number {
    if (pageSize <= 0) {
      return 0;
    }
    return Math.ceil(this.goods.length / pageSize);
  }

  public cheapest(): Goods | undefined {
    let sorted: Goods[] = this.sortedByPrice(true);
    if (sorted.length === 0) {
      return undefined;
    }
    return sorted[0];
  }

  public mostExpensive(): Goods | undefined {
    let sorted: Goods[] = this.sortedByPrice(false);
    if (sorted.length === 0) {
      return undefined;
    }
    return sorted[0];
  }
}

/**
 * One line of the shopping cart. The unit price is copied when the line is
 * created, mirroring how a cart freezes the price at add time.
 */
export class CartLine {
  public goodsId: number;
  public unitPriceCents: number;
  public quantity: number;
  public selected: boolean;

  constructor(goodsId: number, unitPriceCents: number, quantity: number = 1, selected: boolean = true) {
    this.goodsId = goodsId;
    this.unitPriceCents = unitPriceCents;
    this.quantity = quantity;
    this.selected = selected;
  }

  public lineTotal(): Money {
    return new Money(this.unitPriceCents * this.quantity);
  }

  public copy(): CartLine {
    return new CartLine(this.goodsId, this.unitPriceCents, this.quantity, this.selected);
  }
}

/**
 * Snapshot used by persistence and restoration suites.
 */
export class CartSnapshot {
  public lines: CartLine[];

  constructor(lines: CartLine[]) {
    this.lines = lines;
  }
}

/**
 * Shopping cart with selection, quantity clamping and coupon aware totals.
 */
export class Cart {
  private lines: CartLine[];

  constructor() {
    this.lines = [];
  }

  public static fromLines(lines: CartLine[]): Cart {
    let cart: Cart = new Cart();
    for (let index: number = 0; index < lines.length; index++) {
      cart.lines.push(lines[index].copy());
    }
    return cart;
  }

  public allLines(): CartLine[] {
    return this.lines;
  }

  public lineAt(index: number): CartLine | undefined {
    if (index < 0 || index >= this.lines.length) {
      return undefined;
    }
    return this.lines[index];
  }

  public indexOf(goodsId: number): number {
    for (let index: number = 0; index < this.lines.length; index++) {
      if (this.lines[index].goodsId === goodsId) {
        return index;
      }
    }
    return -1;
  }

  public contains(goodsId: number): boolean {
    return this.indexOf(goodsId) >= 0;
  }

  public distinctCount(): number {
    return this.lines.length;
  }

  public isEmpty(): boolean {
    return this.lines.length === 0;
  }

  /**
   * Adds goods to the cart. The quantity is clamped to the available stock;
   * a non positive request leaves the cart untouched and returns current count.
   */
  public add(goodsId: number, unitPriceCents: number, quantity: number = 1,
    stock: number = DEFAULT_STOCK): number {
    if (quantity <= 0 || stock <= 0) {
      let existing: number = this.indexOf(goodsId);
      return existing >= 0 ? this.lines[existing].quantity : 0;
    }
    let index: number = this.indexOf(goodsId);
    if (index < 0) {
      let initial: number = quantity > stock ? stock : quantity;
      if (initial > MAX_CART_QUANTITY) {
        initial = MAX_CART_QUANTITY;
      }
      this.lines.push(new CartLine(goodsId, unitPriceCents, initial, true));
      return initial;
    }
    return this.setQuantity(goodsId, this.lines[index].quantity + quantity, stock);
  }

  public setQuantity(goodsId: number, quantity: number, stock: number = DEFAULT_STOCK): number {
    let index: number = this.indexOf(goodsId);
    if (index < 0) {
      return 0;
    }
    if (quantity <= 0) {
      this.lines.splice(index, 1);
      return 0;
    }
    let clamped: number = quantity;
    if (clamped > stock) {
      clamped = stock;
    }
    if (clamped > MAX_CART_QUANTITY) {
      clamped = MAX_CART_QUANTITY;
    }
    this.lines[index].quantity = clamped;
    return clamped;
  }

  public increase(goodsId: number, delta: number = 1, stock: number = DEFAULT_STOCK): number {
    let index: number = this.indexOf(goodsId);
    if (index < 0) {
      return 0;
    }
    return this.setQuantity(goodsId, this.lines[index].quantity + delta, stock);
  }

  public decrease(goodsId: number, delta: number = 1, stock: number = DEFAULT_STOCK): number {
    let index: number = this.indexOf(goodsId);
    if (index < 0) {
      return 0;
    }
    return this.setQuantity(goodsId, this.lines[index].quantity - delta, stock);
  }

  public remove(goodsId: number): boolean {
    let index: number = this.indexOf(goodsId);
    if (index < 0) {
      return false;
    }
    this.lines.splice(index, 1);
    return true;
  }

  public clear(): void {
    this.lines = [];
  }

  public quantityOf(goodsId: number): number {
    let index: number = this.indexOf(goodsId);
    if (index < 0) {
      return 0;
    }
    return this.lines[index].quantity;
  }

  public totalQuantity(): number {
    let total: number = 0;
    for (let index: number = 0; index < this.lines.length; index++) {
      total += this.lines[index].quantity;
    }
    return total;
  }

  public selectedQuantity(): number {
    let total: number = 0;
    for (let index: number = 0; index < this.lines.length; index++) {
      if (this.lines[index].selected) {
        total += this.lines[index].quantity;
      }
    }
    return total;
  }

  public setSelected(goodsId: number, selected: boolean): boolean {
    let index: number = this.indexOf(goodsId);
    if (index < 0) {
      return false;
    }
    this.lines[index].selected = selected;
    return true;
  }

  public toggleSelected(goodsId: number): boolean {
    let index: number = this.indexOf(goodsId);
    if (index < 0) {
      return false;
    }
    this.lines[index].selected = !this.lines[index].selected;
    return true;
  }

  public setAllSelected(selected: boolean): void {
    for (let index: number = 0; index < this.lines.length; index++) {
      this.lines[index].selected = selected;
    }
  }

  public isAllSelected(): boolean {
    if (this.lines.length === 0) {
      return false;
    }
    for (let index: number = 0; index < this.lines.length; index++) {
      if (!this.lines[index].selected) {
        return false;
      }
    }
    return true;
  }

  public selectedLines(): CartLine[] {
    let result: CartLine[] = [];
    for (let index: number = 0; index < this.lines.length; index++) {
      if (this.lines[index].selected) {
        result.push(this.lines[index]);
      }
    }
    return result;
  }

  public subtotal(): Money {
    let total: number = 0;
    for (let index: number = 0; index < this.lines.length; index++) {
      if (this.lines[index].selected) {
        total += this.lines[index].lineTotal().cents();
      }
    }
    return new Money(total);
  }

  public allLinesSubtotal(): Money {
    let total: number = 0;
    for (let index: number = 0; index < this.lines.length; index++) {
      total += this.lines[index].lineTotal().cents();
    }
    return new Money(total);
  }

  public totalWithCoupon(book: CouponBook): Money {
    return book.bestDiscount(this.subtotal());
  }

  public payable(book: CouponBook): Money {
    return this.subtotal().subtract(this.totalWithCoupon(book)).clampAtZero();
  }

  public merge(other: Cart): void {
    let otherLines: CartLine[] = other.allLines();
    for (let index: number = 0; index < otherLines.length; index++) {
      let line: CartLine = otherLines[index];
      let existing: number = this.indexOf(line.goodsId);
      if (existing < 0) {
        this.lines.push(line.copy());
      } else {
        let merged: number = this.lines[existing].quantity + line.quantity;
        if (merged > MAX_CART_QUANTITY) {
          merged = MAX_CART_QUANTITY;
        }
        this.lines[existing].quantity = merged;
      }
    }
  }

  public snapshot(): CartSnapshot {
    let copies: CartLine[] = [];
    for (let index: number = 0; index < this.lines.length; index++) {
      copies.push(this.lines[index].copy());
    }
    return new CartSnapshot(copies);
  }

  public static restore(snapshot: CartSnapshot): Cart {
    return Cart.fromLines(snapshot.lines);
  }
}

/**
 * Coupon with a spending threshold and a fixed discount.
 */
export class Coupon {
  public id: string;
  public title: string;
  public thresholdCents: number;
  public discountCents: number;

  constructor(id: string, title: string, thresholdCents: number, discountCents: number) {
    this.id = id;
    this.title = title;
    this.thresholdCents = thresholdCents;
    this.discountCents = discountCents;
  }

  public isUsableFor(subtotalCents: number): boolean {
    return subtotalCents >= this.thresholdCents;
  }

  public apply(subtotal: Money): Money {
    let discounted: number = subtotal.cents() - this.discountCents;
    if (discounted < 0) {
      discounted = 0;
    }
    return new Money(discounted);
  }
}

/**
 * Collection of coupons that always picks the best usable discount.
 */
export class CouponBook {
  private coupons: Coupon[];

  constructor(coupons: Coupon[]) {
    this.coupons = [];
    for (let index: number = 0; index < coupons.length; index++) {
      this.coupons.push(coupons[index]);
    }
  }

  public all(): Coupon[] {
    return this.coupons;
  }

  public size(): number {
    return this.coupons.length;
  }

  public applicable(subtotal: Money): Coupon[] {
    let result: Coupon[] = [];
    for (let index: number = 0; index < this.coupons.length; index++) {
      if (this.coupons[index].isUsableFor(subtotal.cents())) {
        result.push(this.coupons[index]);
      }
    }
    return result;
  }

  public best(subtotal: Money): Coupon | undefined {
    let candidates: Coupon[] = this.applicable(subtotal);
    if (candidates.length === 0) {
      return undefined;
    }
    let best: Coupon = candidates[0];
    for (let index: number = 1; index < candidates.length; index++) {
      if (candidates[index].discountCents > best.discountCents) {
        best = candidates[index];
      }
    }
    return best;
  }

  public bestDiscount(subtotal: Money): Money {
    let coupon: Coupon | undefined = this.best(subtotal);
    if (coupon === undefined) {
      return Money.zero();
    }
    return new Money(coupon.discountCents);
  }

  public payable(subtotal: Money): Money {
    return subtotal.subtract(this.bestDiscount(subtotal)).clampAtZero();
  }
}

/**
 * Order with an explicit state machine. The transitions mirror the five order
 * tabs exposed by the user centre page.
 */
export class Order {
  public id: number;
  public lines: CartLine[];
  public state: OrderState;
  public createdAt: number;

  constructor(id: number, lines: CartLine[], state: OrderState = OrderState.OBLIGATION,
    createdAt: number = 0) {
    this.id = id;
    this.lines = [];
    for (let index: number = 0; index < lines.length; index++) {
      this.lines.push(lines[index].copy());
    }
    this.state = state;
    this.createdAt = createdAt;
  }

  public total(): Money {
    let total: number = 0;
    for (let index: number = 0; index < this.lines.length; index++) {
      total += this.lines[index].lineTotal().cents();
    }
    return new Money(total);
  }

  public quantity(): number {
    let total: number = 0;
    for (let index: number = 0; index < this.lines.length; index++) {
      total += this.lines[index].quantity;
    }
    return total;
  }

  public isFinal(): boolean {
    return this.state === OrderState.COMPLETED || this.state === OrderState.CANCELLED ||
      this.state === OrderState.REFUND;
  }

  public canCancel(): boolean {
    return this.state === OrderState.OBLIGATION || this.state === OrderState.WAIT_DELIVERY;
  }

  public canRefund(): boolean {
    return this.state === OrderState.WAIT_RECEIVE || this.state === OrderState.WAIT_EVALUATE;
  }

  public advance(): boolean {
    if (this.state === OrderState.OBLIGATION) {
      this.state = OrderState.WAIT_DELIVERY;
      return true;
    }
    if (this.state === OrderState.WAIT_DELIVERY) {
      this.state = OrderState.WAIT_RECEIVE;
      return true;
    }
    if (this.state === OrderState.WAIT_RECEIVE) {
      this.state = OrderState.WAIT_EVALUATE;
      return true;
    }
    if (this.state === OrderState.WAIT_EVALUATE) {
      this.state = OrderState.COMPLETED;
      return true;
    }
    return false;
  }

  public cancel(): boolean {
    if (!this.canCancel()) {
      return false;
    }
    this.state = OrderState.CANCELLED;
    return true;
  }

  public refund(): boolean {
    if (!this.canRefund()) {
      return false;
    }
    this.state = OrderState.REFUND;
    return true;
  }

  public stateLabel(): string {
    if (this.state === OrderState.OBLIGATION) {
      return 'obligation';
    }
    if (this.state === OrderState.WAIT_DELIVERY) {
      return 'wait_delivery';
    }
    if (this.state === OrderState.WAIT_RECEIVE) {
      return 'wait_receive';
    }
    if (this.state === OrderState.WAIT_EVALUATE) {
      return 'wait_evaluate';
    }
    if (this.state === OrderState.REFUND) {
      return 'refund';
    }
    if (this.state === OrderState.COMPLETED) {
      return 'completed';
    }
    return 'cancelled';
  }
}

/** Pre-zeroed tallies; total counts orders, it is not summed from the fields. */
export class OrderCounts {
  public obligation: number = 0;
  public waitDelivery: number = 0;
  public waitReceive: number = 0;
  public waitEvaluate: number = 0;
  public refund: number = 0;
  public completed: number = 0;
  public cancelled: number = 0;
  public total: number = 0;
}

/**
 * Collection of orders with state filters and business totals.
 */
export class OrderCenter {
  private orders: Order[];

  constructor(orders: Order[]) {
    this.orders = [];
    for (let index: number = 0; index < orders.length; index++) {
      this.orders.push(orders[index]);
    }
  }

  public all(): Order[] {
    return this.orders;
  }

  public size(): number {
    return this.orders.length;
  }

  public byState(state: OrderState): Order[] {
    let result: Order[] = [];
    for (let index: number = 0; index < this.orders.length; index++) {
      if (this.orders[index].state === state) {
        result.push(this.orders[index]);
      }
    }
    return result;
  }

  public counts(): OrderCounts {
    let counts: OrderCounts = new OrderCounts();
    counts.total = this.orders.length;
    for (let index: number = 0; index < this.orders.length; index++) {
      let state: OrderState = this.orders[index].state;
      if (state === OrderState.OBLIGATION) {
        counts.obligation++;
      } else if (state === OrderState.WAIT_DELIVERY) {
        counts.waitDelivery++;
      } else if (state === OrderState.WAIT_RECEIVE) {
        counts.waitReceive++;
      } else if (state === OrderState.WAIT_EVALUATE) {
        counts.waitEvaluate++;
      } else if (state === OrderState.REFUND) {
        counts.refund++;
      } else if (state === OrderState.COMPLETED) {
        counts.completed++;
      } else if (state === OrderState.CANCELLED) {
        counts.cancelled++;
      }
    }
    return counts;
  }

  public spent(): Money {
    let total: number = 0;
    for (let index: number = 0; index < this.orders.length; index++) {
      let order: Order = this.orders[index];
      if (order.state !== OrderState.CANCELLED && order.state !== OrderState.REFUND) {
        total += order.total().cents();
      }
    }
    return new Money(total);
  }

  public latest(): Order | undefined {
    if (this.orders.length === 0) {
      return undefined;
    }
    let latest: Order = this.orders[0];
    for (let index: number = 1; index < this.orders.length; index++) {
      if (this.orders[index].createdAt > latest.createdAt) {
        latest = this.orders[index];
      }
    }
    return latest;
  }

  public sortedByCreatedAt(descending: boolean): Order[] {
    let copy: Order[] = [];
    for (let index: number = 0; index < this.orders.length; index++) {
      copy.push(this.orders[index]);
    }
    for (let outer: number = 1; outer < copy.length; outer++) {
      let current: Order = copy[outer];
      let inner: number = outer - 1;
      while (inner >= 0) {
        let previous: Order = copy[inner];
        let shift: boolean = descending ? previous.createdAt < current.createdAt :
          previous.createdAt > current.createdAt;
        if (!shift) {
          break;
        }
        copy[inner + 1] = previous;
        inner--;
      }
      copy[inner + 1] = current;
    }
    return copy;
  }
}

/**
 * Keyword search over the catalogue. Multiple tokens are combined with a
 * logical AND and ranked by where the match occurred.
 */
export class SearchEngine {
  private catalog: Catalog;

  constructor(catalog: Catalog) {
    this.catalog = catalog;
  }

  public search(keyword: string): Goods[] {
    let normalized: string = keyword.trim().toLowerCase();
    if (normalized.length === 0) {
      return [];
    }
    let tokens: string[] = normalized.split(' ');
    let matches: Goods[] = [];
    let allGoods: Goods[] = this.catalog.all();
    for (let index: number = 0; index < allGoods.length; index++) {
      let goods: Goods = allGoods[index];
      let allTokensMatch: boolean = true;
      for (let tokenIndex: number = 0; tokenIndex < tokens.length; tokenIndex++) {
        if (tokens[tokenIndex].length > 0 && !goods.matchesKeyword(tokens[tokenIndex])) {
          allTokensMatch = false;
          break;
        }
      }
      if (allTokensMatch) {
        matches.push(goods);
      }
    }
    return this.rank(matches, tokens);
  }

  private rank(matches: Goods[], tokens: string[]): Goods[] {
    let copy: Goods[] = [];
    for (let index: number = 0; index < matches.length; index++) {
      copy.push(matches[index]);
    }
    for (let outer: number = 1; outer < copy.length; outer++) {
      let current: Goods = copy[outer];
      let inner: number = outer - 1;
      while (inner >= 0 && this.score(copy[inner], tokens) < this.score(current, tokens)) {
        copy[inner + 1] = copy[inner];
        inner--;
      }
      copy[inner + 1] = current;
    }
    return copy;
  }

  private score(goods: Goods, tokens: string[]): number {
    let score: number = 0;
    let title: string = goods.title.toLowerCase();
    let labels: string = goods.labels.toLowerCase();
    let info: string = goods.info.toLowerCase();
    for (let index: number = 0; index < tokens.length; index++) {
      let token: string = tokens[index];
      if (token.length === 0) {
        continue;
      }
      if (title.indexOf(token) >= 0) {
        score += 3;
      }
      if (labels.indexOf(token) >= 0) {
        score += 2;
      }
      if (info.indexOf(token) >= 0) {
        score += 1;
      }
    }
    return score;
  }

  public suggest(prefix: string, limit: number = 5): string[] {
    let normalized: string = prefix.trim().toLowerCase();
    if (normalized.length === 0 || limit <= 0) {
      return [];
    }
    let result: string[] = [];
    let allGoods: Goods[] = this.catalog.all();
    for (let index: number = 0; index < allGoods.length; index++) {
      let title: string = allGoods[index].title;
      if (title.toLowerCase().indexOf(normalized) >= 0 && result.indexOf(title) < 0) {
        result.push(title);
      }
    }
    for (let outer: number = 1; outer < result.length; outer++) {
      let current: string = result[outer];
      let inner: number = outer - 1;
      while (inner >= 0 && result[inner] > current) {
        result[inner + 1] = result[inner];
        inner--;
      }
      result[inner + 1] = current;
    }
    if (result.length > limit) {
      result.splice(limit, result.length - limit);
    }
    return result;
  }
}

/**
 * Category filter combining every dimension exposed by the home page.
 */
export class ProductFilter {
  public category: string;
  public minCents: number;
  public maxCents: number;
  public keyword: string;
  public inStockOnly: boolean;

  constructor(category: string = '', minCents: number = 0, maxCents: number = Number.MAX_SAFE_INTEGER,
    keyword: string = '', inStockOnly: boolean = false) {
    this.category = category;
    this.minCents = minCents;
    this.maxCents = maxCents;
    this.keyword = keyword;
    this.inStockOnly = inStockOnly;
  }

  public matches(goods: Goods): boolean {
    if (this.category.length > 0 && goods.category !== this.category) {
      return false;
    }
    if (goods.price.cents() < this.minCents || goods.price.cents() > this.maxCents) {
      return false;
    }
    if (this.inStockOnly && !goods.isInStock()) {
      return false;
    }
    if (this.keyword.trim().length > 0 && !goods.matchesKeyword(this.keyword)) {
      return false;
    }
    return true;
  }

  public apply(goods: Goods[]): Goods[] {
    let result: Goods[] = [];
    for (let index: number = 0; index < goods.length; index++) {
      if (this.matches(goods[index])) {
        result.push(goods[index]);
      }
    }
    return result;
  }
}

/**
 * Province/city tree used by the address selector.
 */
export class CityNode {
  public name: string;
  public children: CityNode[];

  constructor(name: string, children: CityNode[] = []) {
    this.name = name;
    this.children = children;
  }

  public isLeaf(): boolean {
    return this.children.length === 0;
  }

  public childNames(): string[] {
    let result: string[] = [];
    for (let index: number = 0; index < this.children.length; index++) {
      result.push(this.children[index].name);
    }
    return result;
  }
}

/** letters() comes from root names; a childless root still lists its letter. */
export class CityIndex {
  private roots: CityNode[];
  private hot: string[];

  constructor(roots: CityNode[], hot: string[]) {
    this.roots = roots;
    this.hot = hot;
  }

  public letters(): string[] {
    let result: string[] = [];
    for (let index: number = 0; index < this.roots.length; index++) {
      result.push(this.roots[index].name);
    }
    return result;
  }

  public rootOf(letter: string): CityNode | undefined {
    for (let index: number = 0; index < this.roots.length; index++) {
      if (this.roots[index].name === letter) {
        return this.roots[index];
      }
    }
    return undefined;
  }

  public citiesOf(letter: string): string[] {
    let root: CityNode | undefined = this.rootOf(letter);
    if (root === undefined) {
      return [];
    }
    return root.childNames();
  }

  public allCities(): string[] {
    let result: string[] = [];
    for (let index: number = 0; index < this.roots.length; index++) {
      let cities: string[] = this.roots[index].childNames();
      for (let cityIndex: number = 0; cityIndex < cities.length; cityIndex++) {
        result.push(cities[cityIndex]);
      }
    }
    return result;
  }

  public hotCities(): string[] {
    let copy: string[] = [];
    for (let index: number = 0; index < this.hot.length; index++) {
      copy.push(this.hot[index]);
    }
    return copy;
  }

  public isHot(city: string): boolean {
    return this.hot.indexOf(city) >= 0;
  }

  public findLetterOf(city: string): string {
    for (let index: number = 0; index < this.roots.length; index++) {
      if (this.roots[index].childNames().indexOf(city) >= 0) {
        return this.roots[index].name;
      }
    }
    return '';
  }

  public cityCount(): number {
    return this.allCities().length;
  }
}

/**
 * Delivery address and its validation rules.
 */
export class Address {
  public id: number;
  public name: string;
  public phone: string;
  public province: string;
  public city: string;
  public district: string;
  public detail: string;
  public isDefault: boolean;

  constructor(id: number, name: string, phone: string, province: string, city: string,
    district: string, detail: string, isDefault: boolean = false) {
    this.id = id;
    this.name = name;
    this.phone = phone;
    this.province = province;
    this.city = city;
    this.district = district;
    this.detail = detail;
    this.isDefault = isDefault;
  }

  public fullAddress(): string {
    return this.province + this.city + this.district + this.detail;
  }

  public copy(): Address {
    return new Address(this.id, this.name, this.phone, this.province, this.city,
      this.district, this.detail, this.isDefault);
  }
}

/** Keeps one default: the first insert, or the first survivor after a delete. */
export class AddressBook {
  private addresses: Address[];
  private nextId: number;

  constructor() {
    this.addresses = [];
    this.nextId = 1;
  }

  public all(): Address[] {
    return this.addresses;
  }

  public size(): number {
    return this.addresses.length;
  }

  public add(address: Address): number {
    let id: number = this.nextId;
    this.nextId++;
    let stored: Address = address.copy();
    stored.id = id;
    if (stored.isDefault) {
      this.clearDefault();
    }
    this.addresses.push(stored);
    if (this.addresses.length === 1) {
      stored.isDefault = true;
    }
    return id;
  }

  public update(id: number, address: Address): boolean {
    let index: number = this.indexOf(id);
    if (index < 0) {
      return false;
    }
    if (address.isDefault) {
      this.clearDefault();
    }
    let stored: Address = address.copy();
    stored.id = id;
    this.addresses[index] = stored;
    if (this.defaultAddress() === undefined) {
      stored.isDefault = true;
    }
    return true;
  }

  public remove(id: number): boolean {
    let index: number = this.indexOf(id);
    if (index < 0) {
      return false;
    }
    let wasDefault: boolean = this.addresses[index].isDefault;
    this.addresses.splice(index, 1);
    if (wasDefault && this.addresses.length > 0) {
      this.addresses[0].isDefault = true;
    }
    return true;
  }

  public indexOf(id: number): number {
    for (let index: number = 0; index < this.addresses.length; index++) {
      if (this.addresses[index].id === id) {
        return index;
      }
    }
    return -1;
  }

  public setDefault(id: number): boolean {
    let index: number = this.indexOf(id);
    if (index < 0) {
      return false;
    }
    this.clearDefault();
    this.addresses[index].isDefault = true;
    return true;
  }

  private clearDefault(): void {
    for (let index: number = 0; index < this.addresses.length; index++) {
      this.addresses[index].isDefault = false;
    }
  }

  public defaultAddress(): Address | undefined {
    for (let index: number = 0; index < this.addresses.length; index++) {
      if (this.addresses[index].isDefault) {
        return this.addresses[index];
      }
    }
    return undefined;
  }

  public validate(address: Address): string {
    if (address.name.trim().length === 0) {
      return 'NAME_EMPTY';
    }
    if (!AddressBook.isValidPhone(address.phone)) {
      return 'PHONE_INVALID';
    }
    if (address.province.length === 0 || address.city.length === 0) {
      return 'CITY_EMPTY';
    }
    if (address.detail.trim().length === 0) {
      return 'DETAIL_EMPTY';
    }
    return '';
  }

  public static isValidPhone(phone: string): boolean {
    if (phone.length !== 11) {
      return false;
    }
    if (phone.charAt(0) !== '1') {
      return false;
    }
    for (let index: number = 0; index < phone.length; index++) {
      let code: number = phone.charCodeAt(index);
      if (code < 48 || code > 57) {
        return false;
      }
    }
    return true;
  }
}

/**
 * One user comment rendered under the detail page gallery.
 */
export class Comment {
  public user: string;
  public text: string;
  public stars: number;

  constructor(user: string, text: string, stars: number = MAX_STARS) {
    this.user = user;
    this.text = text;
    this.stars = stars;
  }

  public isPositive(): boolean {
    return this.stars >= 4;
  }

  public maskedUser(): string {
    if (this.user.length <= 7) {
      return this.user;
    }
    return this.user.substring(0, 3) + '****' + this.user.substring(this.user.length - 4);
  }
}

/**
 * Detail page model: gallery, choices and comments.
 */
export class DetailModel {
  public goods: Goods;
  public images: string[];
  public comments: Comment[];
  public choices: string[];
  public selectedChoice: number;

  constructor(goods: Goods, images: string[], comments: Comment[], choices: string[]) {
    this.goods = goods;
    this.images = images;
    this.comments = comments;
    this.choices = choices;
    this.selectedChoice = choices.length > 0 ? 0 : -1;
  }

  public imageCount(): number {
    return this.images.length;
  }

  public commentCount(): number {
    return this.comments.length;
  }

  public positiveCount(): number {
    let count: number = 0;
    for (let index: number = 0; index < this.comments.length; index++) {
      if (this.comments[index].isPositive()) {
        count++;
      }
    }
    return count;
  }

  public positiveRate(): number {
    if (this.comments.length === 0) {
      return 0;
    }
    return Math.round(this.positiveCount() * 100 / this.comments.length);
  }

  public averageStars(): number {
    if (this.comments.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let index: number = 0; index < this.comments.length; index++) {
      total += this.comments[index].stars;
    }
    return Math.round(total * 10 / this.comments.length) / 10;
  }

  public selectChoice(index: number): boolean {
    if (index < 0 || index >= this.choices.length) {
      return false;
    }
    this.selectedChoice = index;
    return true;
  }

  public choiceName(): string {
    if (this.selectedChoice < 0 || this.selectedChoice >= this.choices.length) {
      return '';
    }
    return this.choices[this.selectedChoice];
  }
}

/**
 * Simple markdown-free valuation: an original price with a percentage off.
 */
export class Valuation {
  public original: Money;
  public discountPercent: number;

  constructor(original: Money, discountPercent: number) {
    this.original = original;
    this.discountPercent = discountPercent;
  }

  public finalPrice(): Money {
    let payablePercent: number = MAX_DISCOUNT_PERCENT - this.discountPercent;
    if (payablePercent < 0) {
      payablePercent = 0;
    }
    return this.original.percentage(payablePercent);
  }

  public saved(): Money {
    return this.original.subtract(this.finalPrice());
  }

  public isDiscounted(): boolean {
    return this.discountPercent > 0;
  }
}

/**
 * Live room card shown on the home page.
 */
export class LiveRoom {
  public id: number;
  public title: string;
  public anchor: string;
  public viewers: number;
  public goodsId: number;
  public live: boolean;

  constructor(id: number, title: string, anchor: string, viewers: number, goodsId: number,
    live: boolean = true) {
    this.id = id;
    this.title = title;
    this.anchor = anchor;
    this.viewers = viewers;
    this.goodsId = goodsId;
    this.live = live;
  }

  public viewersText(): string {
    if (this.viewers >= 10000) {
      let value: number = Math.floor(this.viewers / 1000) / 10;
      return value.toString() + 'w';
    }
    if (this.viewers >= 1000) {
      let value: number = Math.floor(this.viewers / 100) / 10;
      return value.toString() + 'k';
    }
    return this.viewers.toString();
  }
}

/** liveRooms() filters on live, but totalViewers() keeps ended rooms too. */
export class LiveCenter {
  private rooms: LiveRoom[];

  constructor(rooms: LiveRoom[]) {
    this.rooms = [];
    for (let index: number = 0; index < rooms.length; index++) {
      this.rooms.push(rooms[index]);
    }
  }

  public all(): LiveRoom[] {
    return this.rooms;
  }

  public liveRooms(): LiveRoom[] {
    let result: LiveRoom[] = [];
    for (let index: number = 0; index < this.rooms.length; index++) {
      if (this.rooms[index].live) {
        result.push(this.rooms[index]);
      }
    }
    return result;
  }

  public totalViewers(): number {
    let total: number = 0;
    for (let index: number = 0; index < this.rooms.length; index++) {
      total += this.rooms[index].viewers;
    }
    return total;
  }

  public byGoods(goodsId: number): LiveRoom | undefined {
    for (let index: number = 0; index < this.rooms.length; index++) {
      if (this.rooms[index].goodsId === goodsId) {
        return this.rooms[index];
      }
    }
    return undefined;
  }

  public mostWatched(): LiveRoom | undefined {
    if (this.rooms.length === 0) {
      return undefined;
    }
    let best: LiveRoom = this.rooms[0];
    for (let index: number = 1; index < this.rooms.length; index++) {
      if (this.rooms[index].viewers > best.viewers) {
        best = this.rooms[index];
      }
    }
    return best;
  }
}

/**
 * User centre account: loyalty points and the personal coupon wallet.
 */
export class UserAccount {
  public nickname: string;
  public points: number;
  public level: number;
  public coupons: Coupon[];

  constructor(nickname: string, points: number = 0, level: number = 1, coupons: Coupon[] = []) {
    this.nickname = nickname;
    this.points = points;
    this.level = level;
    this.coupons = coupons;
  }

  public pointsValue(): Money {
    return new Money(Math.floor(this.points / POINTS_PER_YUAN) * CENTS_PER_YUAN);
  }

  public addPoints(points: number): number {
    if (points <= 0) {
      return this.points;
    }
    this.points += points;
    return this.points;
  }

  public redeem(points: number): boolean {
    if (points <= 0 || points > this.points) {
      return false;
    }
    this.points -= points;
    return true;
  }

  public levelName(): string {
    if (this.level >= 5) {
      return 'diamond';
    }
    if (this.level >= 3) {
      return 'gold';
    }
    if (this.level >= 2) {
      return 'silver';
    }
    return 'bronze';
  }

  public couponCount(): number {
    return this.coupons.length;
  }
}

/**
 * Responsive breakpoint resolution used by the home navigation shell.
 */
export class BreakpointUtil {
  public static readonly SMALL: string = 'sm';
  public static readonly MEDIUM: string = 'md';
  public static readonly LARGE: string = 'lg';

  public static resolve(widthVp: number): string {
    if (widthVp < 520) {
      return BreakpointUtil.SMALL;
    }
    if (widthVp < 840) {
      return BreakpointUtil.MEDIUM;
    }
    return BreakpointUtil.LARGE;
  }

  public static columns(breakpoint: string): number {
    if (breakpoint === BreakpointUtil.SMALL) {
      return 1;
    }
    if (breakpoint === BreakpointUtil.MEDIUM) {
      return 2;
    }
    return 3;
  }

  public static swiperDisplay(breakpoint: string): number {
    return BreakpointUtil.columns(breakpoint);
  }

  public static isKnown(breakpoint: string): boolean {
    return breakpoint === BreakpointUtil.SMALL || breakpoint === BreakpointUtil.MEDIUM ||
      breakpoint === BreakpointUtil.LARGE;
  }
}

/**
 * Navigation url used by the Navigation component. Parsing is intentionally
 * strict: only known pages are accepted.
 */
export class ShopUrl {
  public page: string;
  public goodsId: number;
  public valid: boolean;

  constructor(page: string, goodsId: number = -1) {
    this.page = page;
    this.goodsId = goodsId;
    this.valid = ShopUrl.isKnownPage(page);
  }

  public static isKnownPage(page: string): boolean {
    let known: string[] = ['MainPage', 'NewProductPage', 'ShopCartPage', 'UserPage',
      'DetailPage', 'LivePage', 'QRCodeScanPage', 'SetPage'];
    return known.indexOf(page) >= 0;
  }

  public static parse(text: string): ShopUrl {
    if (text.length === 0) {
      return new ShopUrl('', -1);
    }
    let segments: string[] = text.split('?');
    let page: string = segments[0];
    let goodsId: number = -1;
    if (segments.length > 1) {
      let params: string[] = segments[1].split('&');
      for (let index: number = 0; index < params.length; index++) {
        let pair: string[] = params[index].split('=');
        if (pair.length === 2 && pair[0] === 'id') {
          let parsed: number = Number.parseInt(pair[1]);
          if (!Number.isNaN(parsed)) {
            goodsId = parsed;
          }
        }
      }
    }
    return new ShopUrl(page, goodsId);
  }

  public withGoods(goodsId: number): string {
    return this.page + '?id=' + goodsId.toString();
  }
}

/**
 * Generic page result used by catalogue pagination suites.
 */
export class PagedResult<T> {
  public items: T[];
  public page: number;
  public size: number;
  public total: number;

  constructor(items: T[], page: number, size: number, total: number) {
    this.items = items;
    this.page = page;
    this.size = size;
    this.total = total;
  }

  public hasNext(): boolean {
    return (this.page + 1) * this.size < this.total;
  }

  public hasPrevious(): boolean {
    return this.page > 0;
  }

  public count(): number {
    return this.items.length;
  }
}

/**
 * Small deterministic queue used by async and concurrency suites. Tests enqueue
 * work synchronously and drain it explicitly, so no timers are required.
 */
export class TaskQueue {
  private tasks: Array<() => Promise<number>>;
  private cursor: number;

  constructor() {
    this.tasks = [];
    this.cursor = 0;
  }

  public enqueue(task: () => Promise<number>): number {
    this.tasks.push(task);
    return this.tasks.length - this.cursor;
  }

  public pending(): number {
    return this.tasks.length - this.cursor;
  }

  public async drain(): Promise<number[]> {
    let results: number[] = [];
    while (this.cursor < this.tasks.length) {
      let task: () => Promise<number> = this.tasks[this.cursor];
      this.cursor++;
      results.push(await task());
    }
    return results;
  }
}

/**
 * Event identifiers mirrored from the emitter feature module.
 */
export class EmitterEvent {
  public static readonly DIALOG_EVENT_ID: number = 1;
  public static readonly ADD_EVENT_ID: number = 2;

  public static cartPayload(goodsId: number): string {
    return '{"id":' + goodsId.toString() + '}';
  }

  public static isCartEvent(eventId: number): boolean {
    return eventId === EmitterEvent.ADD_EVENT_ID;
  }

  public static isDialogEvent(eventId: number): boolean {
    return eventId === EmitterEvent.DIALOG_EVENT_ID;
  }
}
