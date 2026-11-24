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

import {
  Address,
  Cart,
  CartLine,
  Catalog,
  CityIndex,
  CityNode,
  Comment,
  Coupon,
  CouponBook,
  DetailModel,
  Goods,
  LiveRoom,
  Money
} from './ShopModel';

/**
 * Deterministic fixtures shared by every OrangeShopping suite. The catalogue
 * mirrors the sixteen entries rendered by the sample home page: eight unique
 * products repeated twice with the same identifiers as PRODUCT_DATA.
 */

export const CATEGORY_PHONE: string = 'phone';
export const CATEGORY_FOOD: string = 'food';
export const CATEGORY_WEAR: string = 'men_wear';
export const CATEGORY_SPORT: string = 'sport';
export const CATEGORY_APPLIANCE: string = 'appliances';

export const LABEL_NEW: string = 'new_product';
export const LABEL_HOT: string = 'hot_sale';
export const LABEL_LIVE: string = 'live_only';
export const LABEL_DISCOUNT: string = 'discount';

/**
 * Creates a catalogued good with predictable defaults. Tests only override the
 * fields that matter for the property under inspection.
 */
export function createGoods(id: number, title: string, priceCents: number,
  category: string = CATEGORY_PHONE, info: string = 'standard edition',
  labels: string = LABEL_NEW, stock: number = 99, sales: number = 0,
  rating: number = 5, liveRoomId: number = -1): Goods {
  return new Goods(id, title, info, labels, new Money(priceCents), category, stock, sales,
    rating, liveRoomId, id % 8);
}

export const PRODUCTS: Goods[] = [
  createGoods(0, 'Harmony Phone One', 499900, CATEGORY_PHONE, 'flagship phone', LABEL_NEW, 30, 1200, 5, 0),
  createGoods(1, 'Harmony Phone Two', 399900, CATEGORY_PHONE, 'lite phone', LABEL_HOT, 40, 980, 4, 1),
  createGoods(2, 'Smart Watch Pro', 129900, CATEGORY_SPORT, 'fitness watch', LABEL_NEW, 55, 760, 5, 2),
  createGoods(3, 'Sport Runner Shoes', 59900, CATEGORY_SPORT, 'running shoes', LABEL_DISCOUNT, 80, 1500, 4, -1),
  createGoods(4, 'Green Tea Pack', 8900, CATEGORY_FOOD, 'organic tea', LABEL_HOT, 200, 3200, 5, -1),
  createGoods(5, 'Kitchen Blender', 29900, CATEGORY_APPLIANCE, 'home appliance', LABEL_NEW, 25, 430, 4, 3),
  createGoods(6, 'Wireless Earbuds', 19900, CATEGORY_PHONE, 'noise cancelling', LABEL_HOT, 0, 2100, 5, -1),
  createGoods(7, 'Classic Shirt', 15900, CATEGORY_WEAR, 'cotton shirt', LABEL_DISCOUNT, 60, 640, 4, -1),
  createGoods(8, 'Harmony Phone One', 499900, CATEGORY_PHONE, 'flagship phone', LABEL_NEW, 30, 1200, 5, 0),
  createGoods(9, 'Harmony Phone Two', 399900, CATEGORY_PHONE, 'lite phone', LABEL_HOT, 40, 980, 4, 1),
  createGoods(10, 'Smart Watch Pro', 129900, CATEGORY_SPORT, 'fitness watch', LABEL_NEW, 55, 760, 5, 2),
  createGoods(11, 'Sport Runner Shoes', 59900, CATEGORY_SPORT, 'running shoes', LABEL_DISCOUNT, 80, 1500, 4, -1),
  createGoods(12, 'Green Tea Pack', 8900, CATEGORY_FOOD, 'organic tea', LABEL_HOT, 200, 3200, 5, -1),
  createGoods(13, 'Kitchen Blender', 29900, CATEGORY_APPLIANCE, 'home appliance', LABEL_NEW, 25, 430, 4, 3),
  createGoods(14, 'Wireless Earbuds', 19900, CATEGORY_PHONE, 'noise cancelling', LABEL_HOT, 0, 2100, 5, -1),
  createGoods(15, 'Classic Shirt', 15900, CATEGORY_WEAR, 'cotton shirt', LABEL_DISCOUNT, 60, 640, 4, -1)
];

export function defaultCatalog(): Catalog {
  return new Catalog(PRODUCTS);
}

/** Defaults to quantity 1 and selected true, the first-add shape. */
export function cartLine(goodsId: number, unitPriceCents: number, quantity: number = 1,
  selected: boolean = true): CartLine {
  return new CartLine(goodsId, unitPriceCents, quantity, selected);
}

/** Cart.fromLines copies each line, so fixtures never alias case state. */
export function cartWith(lines: CartLine[]): Cart {
  return Cart.fromLines(lines);
}

export const SMALL_CART: Cart = cartWith([
  cartLine(0, 499900, 1),
  cartLine(4, 8900, 2)
]);

export const MIXED_CART: Cart = cartWith([
  cartLine(0, 499900, 1, true),
  cartLine(2, 129900, 2, false),
  cartLine(4, 8900, 3, true),
  cartLine(6, 19900, 1, false)
]);

export const LARGE_CART: Cart = buildLargeCart();

/** Sixteen lines; quantity cycles 1..4 and every third line is unselected. */
function buildLargeCart(): Cart {
  let lines: CartLine[] = [];
  for (let index: number = 0; index < 16; index++) {
    let price: number = PRODUCTS[index].price.cents();
    let quantity: number = index % 4 + 1;
    lines.push(new CartLine(index, price, quantity, index % 3 !== 0));
  }
  return Cart.fromLines(lines);
}

export const COUPONS: Coupon[] = [
  new Coupon('C10', 'ten off one hundred', 10000, 1000),
  new Coupon('C20', 'twenty off three hundred', 30000, 2000),
  new Coupon('C50', 'fifty off one thousand', 100000, 5000),
  new Coupon('C0', 'no threshold', 0, 100)
];

/** 1000/2000/5000-cent coupons plus one with no threshold; see COUPONS. */
export function defaultCouponBook(): CouponBook {
  return new CouponBook(COUPONS);
}

export function emptyCouponBook(): CouponBook {
  return new CouponBook([]);
}

/** Forces selected=true so order totals always include the single line. */
export function orderLines(goodsId: number, priceCents: number, quantity: number): CartLine[] {
  return [new CartLine(goodsId, priceCents, quantity, true)];
}

export const COMMENTS: Comment[] = [
  new Comment('18800001765', 'matches the description and feels solid', 5),
  new Comment('13900001234', 'delivery was fast and packaging intact', 4),
  new Comment('15800005678', 'colour is slightly darker than expected', 3),
  new Comment('17700009012', 'works well for daily use', 5),
  new Comment('16600003456', 'good value for the price', 4),
  new Comment('12345678901', 'screen arrived scratched', 2),
  new Comment('18600007890', 'battery life is excellent', 5),
  new Comment('13500002222', 'size runs small', 3),
  new Comment('15000001111', 'would buy again', 5),
  new Comment('18900003333', 'not worth the price', 1)
];

export const DETAIL_IMAGES: string[] = [
  'swiper1', 'swiper2', 'swiper3', 'swiper4'
];

export const DETAIL_CHOICES: string[] = ['black', 'silver', 'blue'];

/** Takes an index into PRODUCTS, not a product id. */
export function detailFor(goodsId: number): DetailModel {
  let goods: Goods = PRODUCTS[goodsId];
  return new DetailModel(goods, DETAIL_IMAGES, COMMENTS, DETAIL_CHOICES);
}

export const CITY_ROOTS: CityNode[] = [
  new CityNode('A', [new CityNode('Anhui'), new CityNode('Anqing')]),
  new CityNode('B', [new CityNode('Beijing'), new CityNode('Baoding')]),
  new CityNode('C', [new CityNode('Chongqing'), new CityNode('Changsha')]),
  new CityNode('F', [new CityNode('Fujian'), new CityNode('Foshan')]),
  new CityNode('G', [new CityNode('Gansu'), new CityNode('Guangdong'), new CityNode('Guangxi')]),
  new CityNode('H', [new CityNode('Hainan'), new CityNode('Hebei'), new CityNode('Hubei')]),
  new CityNode('J', [new CityNode('Jilin'), new CityNode('Jiangsu'), new CityNode('Jiangxi')]),
  new CityNode('L', [new CityNode('Liaoning')]),
  new CityNode('N', [new CityNode('Neimenggu'), new CityNode('Ningxia')]),
  new CityNode('Q', [new CityNode('Qinghai')]),
  new CityNode('S', [new CityNode('Shandong'), new CityNode('Shanghai'), new CityNode('Sichuan')]),
  new CityNode('T', [new CityNode('Tianjin')]),
  new CityNode('X', [new CityNode('Xizang'), new CityNode('Xinjiang')]),
  new CityNode('Y', [new CityNode('Yunnan')]),
  new CityNode('Z', [new CityNode('Zhejiang'), new CityNode('Zhengzhou')])
];

export const HOT_CITIES: string[] = [
  'Beijing', 'Shanghai', 'Guangzhou', 'Shenzhen', 'Hangzhou', 'Nanjing',
  'Suzhou', 'Tianjin', 'Wuhan', 'Changsha', 'Chongqing', 'Chengdu'
];

export function defaultCityIndex(): CityIndex {
  return new CityIndex(CITY_ROOTS, HOT_CITIES);
}

export function createAddress(id: number, name: string, phone: string, province: string,
  city: string, district: string, detail: string, isDefault: boolean = false): Address {
  return new Address(id, name, phone, province, city, district, detail, isDefault);
}

export const ADDRESSES: Address[] = [
  createAddress(1, 'Alice', '18800001765', 'Anhui', 'Anqing', 'Downtown', '100 Main Road', true),
  createAddress(2, 'Bob', '13900001234', 'Beijing', 'Beijing', 'Chaoyang', '200 East Road', false),
  createAddress(3, 'Carol', '15800005678', 'Guangdong', 'Guangzhou', 'Tianhe', '300 South Road', false),
  createAddress(4, 'David', '17700009012', 'Zhejiang', 'Hangzhou', 'Xihu', '400 West Road', false)
];

export const LIVE_ROOMS: LiveRoom[] = [
  new LiveRoom(0, 'phone launch live', 'anchor-a', 520, 0, true),
  new LiveRoom(1, 'phone review live', 'anchor-b', 1200, 1, true),
  new LiveRoom(2, 'watch training live', 'anchor-c', 9800, 2, true),
  new LiveRoom(3, 'kitchen demo live', 'anchor-d', 15300, 5, false),
  new LiveRoom(4, 'shoe fitting live', 'anchor-e', 75, 3, true)
];

export const PHONE_SAMPLES: string[] = [
  '18800001765', '13900001234', '15800005678', '17700009012',
  '16600003456', '12345678901', '18600007890', '13500002222',
  '15000001111', '18900003333'
];

export const INVALID_PHONES: string[] = [
  '', '1', '1234567890', '123456789012', '28800001765', '1880000176a',
  '188 0000 1765', '+8618800001765', 'abcdefghijk', '00000000000'
];

export const SEARCH_KEYWORDS: string[] = [
  'phone', 'watch', 'tea', 'shirt', 'shoe', 'kitchen', 'earbud', 'blender'
];

export const EMPTY_KEYWORDS: string[] = ['', ' ', '   ', '\t', '\n'];

export const UNKNOWN_KEYWORDS: string[] = [
  'tablet', 'laptop', 'camera', 'drone', 'keyboard', 'monitor'
];

/** Lower floor(count/2) slice; the pair splits the catalogue in order. */
export function firstHalf(catalog: Catalog): Goods[] {
  let result: Goods[] = [];
  let half: number = Math.floor(catalog.count() / 2);
  for (let index: number = 0; index < half; index++) {
    result.push(catalog.all()[index]);
  }
  return result;
}

export function secondHalf(catalog: Catalog): Goods[] {
  let result: Goods[] = [];
  let half: number = Math.floor(catalog.count() / 2);
  for (let index: number = half; index < catalog.count(); index++) {
    result.push(catalog.all()[index]);
  }
  return result;
}
