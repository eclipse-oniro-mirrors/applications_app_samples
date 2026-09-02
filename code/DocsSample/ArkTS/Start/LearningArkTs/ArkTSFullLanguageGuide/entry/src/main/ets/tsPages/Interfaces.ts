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

export {};

// [Start ts_interface_property_types]
interface Product {
    // 必选属性
  id: number;
  name: string;
  price: number;

  // 可选属性（使用 ?）
  description?: string;
  stock?: number;

  // 只读属性（使用readonly）
  readonly createdAt: Date;
}

let product: Product = {
  id: 1,
  name: 'Laptop',
  price: 999,
  createdAt: new Date()
};

// 可以访问可选属性
if (product.description) {
    console.info(`${product.description}`);
}

// 只读属性不能修改
product.createdAt = new Date(); // 编译错误
// [End ts_interface_property_types]

// [Start ts_interface_inheritance_rules]
interface Base {
  method(): void;
}

interface Derived extends Base {
  // 可以添加新方法
  newMethod(): void;

  // 可以覆盖父接口的方法（保持相同签名）
  method(): void;

  // 不能修改方法的返回类型（编译错误）
  method(): string;
}

// 接口继承时的属性约束
interface Colorable {
  color: string;
}

interface Sized {
  size: number;
}

interface Shape extends Colorable, Sized {
  // 可以添加新属性
  area(): number;

  // 不能重新定义父接口的属性
  color: number; // 编译错误：类型不匹配
}
// [End ts_interface_inheritance_rules]

// ===== ts_index_signature =====
// [Start ts_index_signature]
// 数字索引签名
interface NumberArray {
  [index: number]: number;
  length: number;
}

let numArray: NumberArray = [1, 2, 3, 4, 5];
console.info(`${numArray[0]}`); // 1

// 字符串索引签名
interface StringDictionary {
  [key: string]: string | number;
  name: string; // 必须符合索引签名类型
  age: number;  // 必须符合索引签名类型
}

let person: StringDictionary = {
  name: 'Alice',
  age: 25,
  city: 'New York',  // 动态属性
  country: 'USA'     // 动态属性
};

console.info(`${person.city}`); // New York

// 同时使用两种索引签名
interface MixedDictionary {
  [key: string]: string | number;
  [index: number]: string;
  length: number;
}

let mixed: MixedDictionary = {
  length: 3,
  0: 'First',
  1: 'Second',
  2: 'Third',
  key1: 'Value1',
  key2: 'Value2'
};

console.info(`${mixed[1]}`);    // Second
console.info(`${mixed.key1}`);  // Value1
// [End ts_index_signature]


// ===== ts_interface_composition =====
// [Start ts_interface_composition]
interface Nameable {
  name: string;
}

interface Ageable {
  age: number;
}

interface Emailable {
  email: string;
}

// 使用交叉类型组合接口
type Person = Nameable & Ageable & Emailable;

let composePerson: Person = {
  name: 'Alice',
  age: 25,
  email: 'alice@example.com'
};

console.info(`${composePerson.name}`); // Alice

// 另一种方式：使用接口继承
interface Employee extends Nameable, Ageable, Emailable {
  department: string;
  salary: number;
}

let employee: Employee = {
  name: 'Bob',
  age: 30,
  email: 'bob@company.com',
  department: 'Engineering',
  salary: 50000
};

console.info(`${employee.name} works in ${employee.department}`);
// [End ts_interface_composition]

// ===== ts_interface_declaration_merging =====
// [Start ts_interface_declaration_merging]
// 原始接口
interface MergingWindow {
  title: string;
}

// 扩展接口（添加新属性）
interface MergingWindow {
  size: { width: number; height: number };
}

// 再次扩展
interface MergingWindow {
  isOpen: boolean;
  open(): void;
  close(): void;
}

let myWindow: MergingWindow = {
  title: 'My MergingWindow',
  size: { width: 800, height: 600 },
  isOpen: false,
  open: () => console.info(`Opening window`),
  close: () => console.info(`Closing window`)
};

console.info(`${myWindow.title}`);
console.info(`${myWindow.size.width}`);
myWindow.open();
// [End ts_interface_declaration_merging]

// ===== ts_extending_third_party_interface =====
// [Start ts_extending_third_party_interface]
// 假设这是第三方库定义的接口
interface PartyThirdPartyConfig {
  apiUrl: string;
  apiKey: string;
}

// 为第三方接口扩展自定义属性
interface PartyThirdPartyConfig {
  customTimeout?: number;
  customRetryCount?: number;
}

let config: PartyThirdPartyConfig = {
  apiUrl: 'EXAMPLE_API_URL',
  apiKey: 'secret-key',
  customTimeout: 5000,
  customRetryCount: 3
};

console.info(`${config.customTimeout}`); // 5000
// [End ts_extending_third_party_interface]

// ===== ts_module_interface_merging =====
// [Start ts_module_interface_merging]
// 基础模块定义的接口
interface MergingBaseEntity {
  id: number;
}

// 用户模块扩展接口
interface MergingBaseEntity {
  userId?: number;
  userName?: string;
}

// 产品模块扩展接口
interface MergingBaseEntity {
  productId?: number;
  productName?: string;
}

// 实体可以包含来自不同模块的属性
let entity: MergingBaseEntity = {
  id: 100,
  userId: 1,
  userName: 'Alice',
  productId: 50,
  productName: 'Laptop'
};

console.info(`${entity.userName}`);
console.info(`${entity.productName}`);
// [End ts_module_interface_merging]

// [Start ts_excess_property_error]
// TypeScript对照写法，演示多余属性检查的编译错误
interface TsSquareConfig {
  color?: string;
  width?: number;
}

function tsCreateSquare(config: TsSquareConfig): { color: string; area: number } {
  return {
    color: config.color || 'red',
    area: config.width ? config.width * config.width : 20
  };
}

let tsEpSquare2 = tsCreateSquare({ colour: 'red', width: 100 });
// 编译错误：'colour' does not exist in type 'TsSquareConfig'
// [End ts_excess_property_error]

// [Start ts_implements_optional_error]
// TypeScript对照写法，演示implements不创建可选属性
interface TsImplConfigA {
  x: number;
  y?: number;
}

class TsImplC implements TsImplConfigA {
  public x: number = 0;
}

let tsImplC: TsImplC = new TsImplC();
tsImplC.y = 10;  // 编译错误：Property 'y' does not exist on type 'TsImplC'
// [End ts_implements_optional_error]

// [Start type_vs_interface]
// type可描述联合类型和元组
type TvID = number | string;
type TvPair = [string, number];

// interface支持声明合并
interface TvWindow {
  title: string;
}
interface TvWindow {
  ts: string;
}
// 合并后TvWindow有title和ts两个属性

// interface支持扩展
interface TvAnimal {
  name: string;
}
interface TvDog extends TvAnimal {
  breed: string;
}

// type用交叉类型扩展
type TvAnimal2 = { name: string };
type TvDog2 = TvAnimal2 & { breed: string };
// [End type_vs_interface]

// ===== ts_intersection_type =====
// [Start ts_intersection_type]
// TypeScript交叉类型写法，ArkTS不支持
interface TsColorful {
  color: string;
}

interface TsCircle {
  radius: number;
}

type TsColorfulCircle = TsColorful & TsCircle;

let tsCc: TsColorfulCircle = { color: 'red', radius: 10 };
console.info(`${tsCc.color}, ${tsCc.radius}`); // red, 10
// [End ts_intersection_type]

// ===== ts_declaration_merging =====
// [Start ts_declaration_merging]
// TypeScript写法，ArkTS不支持接口声明合并
interface TsWindow {
  title: string;
}

interface TsWindow {
  count: number;
}

// 合并后 TsWindow 同时有 title 和 count
let tsWin: TsWindow = { title: 'Main', count: 3 };
console.info(`${tsWin.title}, ${tsWin.count}`); // Main, 3
// [End ts_declaration_merging]

// ===== ts_type_vs_interface =====
// [Start ts_type_vs_interface]
// type可描述联合类型和元组
type TvID = number | string;
type TvPair = [string, number];

// interface支持声明合并（ArkTS不支持，arkts-no-decl-merging）
interface TvWindow {
  title: string;
}
interface TvWindow {
  ts: string;
}

// interface支持扩展
interface TvAnimal {
  name: string;
}
interface TvDog extends TvAnimal {
  breed: string;
}

// type用交叉类型扩展（ArkTS不支持，arkts-no-intersection-types）
type TvAnimal2 = { name: string };
type TvDog2 = TvAnimal2 & { breed: string };
// [End ts_type_vs_interface]
