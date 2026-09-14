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

// [Start ts_double_assertion]
// TypeScript允许双重断言，ArkTS禁止双重断言
let value: string = '123';
let unsafeNum: number = value as unknown as number;
// [End ts_double_assertion]

// [Start ts_typescript_angle_bracket_assertion_not_used]
// TypeScript对照写法，ArkTS不使用：
let value: Object = 'hello';
let length: number = (<string>value).length;
// [End ts_typescript_angle_bracket_assertion_not_used]

// [Start ts_reasonable_vs_unreasonable_assertion]
// 不合理：将string断言为number
let unreasonableStr: string = '123';
let unreasonableNum: number = unreasonableStr as number; // 编译错误

// 合理方式：先转换，再断言
let num: number = Number(unreasonableStr);

// 双重断言（TypeScript对照写法，ArkTS不使用）
let unreasonableValue: string = 'Hello';
let unreasonableUnsafeNum: number = unreasonableValue as unknown as number;
// [End ts_reasonable_vs_unreasonable_assertion]

// [Start ts_discriminated_union_instead_of_in_operator]
interface Bird {
  kind: 'bird';
  fly: () => void;
  layEggs: () => void;
}

interface Fish {
  kind: 'fish';
  swim: () => void;
  layEggs: () => void;
}

let birdOrFish: Bird | Fish = {
  kind: 'bird',
  fly: () => console.info(`Flying`),
  layEggs: () => console.info(`Laying eggs`)
};

// TypeScript对照写法，ArkTS不使用：
if ('fly' in birdOrFish) {
    birdOrFish.fly();
}

function move(animal: Bird | Fish): void {
  switch (animal.kind) {
    case 'bird':
      animal.fly();
      break;
    case 'fish':
      animal.swim();
      break;
  }

  // layEggs在两个接口中都存在
  animal.layEggs();
}

let bird: Bird = {
  kind: 'bird',
  fly: () => console.info(`Flying high`),
  layEggs: () => console.info(`Laying eggs in nest`)
};

let fish: Fish = {
  kind: 'fish',
  swim: () => console.info(`Swimming deep`),
  layEggs: () => console.info(`Laying eggs in water`)
};

move(bird); // Flying high, Laying eggs in nest
move(fish); // Swimming deep, Laying eggs in water
// [End ts_discriminated_union_instead_of_in_operator]

// [Start ts_upcast_subclass_to_parent]
class Animal {
  public name: string;
  
  constructor(name: string) {
    this.name = name;
  }
  
  public speak(): void {
    console.info(`${this.name} makes a sound`);
  }
}

class Dog extends Animal {
  public breed: string;
  
  constructor(name: string, breed: string) {
    super(name);
    this.breed = breed;
  }
  
  public bark(): void {
    console.info(`${this.name} barks: Woof! Woof!`);
  }
}

class Cat extends Animal {
  public color: string;
  
  constructor(name: string, color: string) {
    super(name);
    this.color = color;
  }
  
  public meow(): void {
    console.info(`${this.name} meows: Meow!`);
  }
}

// 向上转型：子类实例赋值给父类类型变量
let dog: Dog = new Dog('Buddy', 'Golden Retriever');
let animal: Animal = dog; // 隐式转换，类型安全

// 可以调用父类的方法
animal.speak(); // Buddy makes a sound

// 不能调用子类特有的方法
animal.bark(); // 编译错误
// [End ts_upcast_subclass_to_parent]

// [Start ts_upcast_to_interface]
interface IShape {
  getArea(): number;
  getPerimeter(): number;
}

class Rectangle implements IShape {
  private width: number;
  private height: number;
  
  constructor(width: number, height: number) {
    this.width = width;
    this.height = height;
  }
  
  public getArea(): number {
    return this.width * this.height;
  }
  
  public getPerimeter(): number {
    return 2 * (this.width + this.height);
  }
  
  // Rectangle特有的方法
  public getDiagonal(): number {
    return Math.sqrt(this.width ** 2 + this.height ** 2);
  }
}

class Circle implements IShape {
  private radius: number;
  
  constructor(radius: number) {
    this.radius = radius;
  }
  
  public getArea(): number {
    return Math.PI * this.radius ** 2;
  }
  
  public getPerimeter(): number {
    return 2 * Math.PI * this.radius;
  }
  
  // Circle特有的方法
  public getDiameter(): number {
    return 2 * this.radius;
  }
}

// 向上转型：实现类赋值给接口类型变量
let rectangle: Rectangle = new Rectangle(3, 4);
let shape: IShape = rectangle; // 隐式转换

console.info(`面积: ${shape.getArea()}`);         // 12
console.info(`周长: ${shape.getPerimeter()}`);    // 14

// 不能调用实现类特有的方法
shape.getDiagonal(); // 编译错误
// [End ts_upcast_to_interface]

// [Start ts_upcast_access_parent_members_only]
class Parent {
  public parentMethod(): void {
    console.info(`Parent method`);
  }
}

class Child extends Parent {
  public childMethod(): void {
    console.info(`Child method`);
  }
}

let child: Child = new Child();
let parent: Parent = child; // 向上转型

// 只能访问父类成员
parent.parentMethod(); // 正确
parent.childMethod(); // 编译错误

// 如果需要访问子类成员，需要进行向下转型（类型断言）
if (parent instanceof Child) {
  let childAgain: Child = parent as Child;
  childAgain.childMethod(); // 正确
}
// [End ts_upcast_access_parent_members_only]

// ===== ts_dom_element_type_assertion =====
// [Start ts_dom_element_type_assertion]
// 获取DOM元素（浏览器环境）
interface HTMLInputElement {
  value: string;
}

interface MockDocument {
  getElementById: (id: string) => HTMLInputElement;
}

let mockDoc: MockDocument = {
  getElementById: (id: string): HTMLInputElement => {
    let element: HTMLInputElement = { value: '' };
    return element;
  }
};
let inputElement = mockDoc.getElementById('username') as HTMLInputElement;
inputElement.value = 'Alice';

// 或者使用可选链
let element = mockDoc.getElementById('password') as HTMLInputElement | null;
if (element) {
  console.info(`${element.value}`);
}
// [End ts_dom_element_type_assertion]

// ===== ts_api_response_type_assertion =====
// [Start ts_api_response_type_assertion]
interface ApiResponse {
  code: number;
  message: string;
  data: UserData;
}

interface UserData {
  id: number;
  name: string;
}

function parseApiResponse(jsonStr: string): ApiResponse {
  return JSON.parse(jsonStr) as ApiResponse;
}

let jsonResponse = '{"code":200,"message":"success","data":{"id":1,"name":"Alice"}}';
let response: ApiResponse = parseApiResponse(jsonResponse);
console.info(`${response.message}`); // success
// [End ts_api_response_type_assertion]

// ===== ts_type_predicate =====
// [Start ts_type_predicate]
// TypeScript写法，ArkTS不支持is类型谓词
function isString(value: unknown): value is string {
  return typeof value === 'string';
}

let tsVal: unknown = 'hello';
if (isString(tsVal)) {
  console.info(`${tsVal.toUpperCase()}`); // HELLO
}
// [End ts_type_predicate]

// ===== ts_structural_typing =====
// [Start ts_structural_typing]
// TypeScript结构类型，ArkTS不支持
interface TsNamed {
  name: string;
}

class TsPerson {
  public name: string = '';
  public age: number = 0;
}

// TsPerson未声明implements TsNamed，但结构兼容，可直接赋值
let tsNamedItem: TsNamed = new TsPerson();
console.info(`${tsNamedItem.name}`);
// [End ts_structural_typing]

// ===== ts_class_compatibility =====
// [Start ts_class_compatibility]
// TypeScript类兼容性（结构比较），ArkTS不支持
class TsAnimalClass {
  public name: string = '';
}

class TsDeviceClass {
  public name: string = '';
}

// 结构相同即可互相赋值，无需继承关系
let tsA: TsAnimalClass = new TsDeviceClass();
console.info(`${tsA.name}`);
// [End ts_class_compatibility]

// ===== ts_type_conversion_purpose =====
// [Start ts_type_conversion_purpose]
function getTcpValue(): string | number {
  return 'Hello, ArkTS';
}

let tcpValue: string | number = getTcpValue();

// 不使用类型转换，无法访问字符串的方法
tcpValue.toUpperCase(); // 编译错误：string | number类型上不存在toUpperCase

// 使用类型守卫收窄后，可以访问字符串方法
if (typeof tcpValue === 'string') {
  let strLength: number = tcpValue.length;
  console.info(`${strLength}`); // 13
}
// [End ts_type_conversion_purpose]

// ===== ts_enum_compatibility =====
// [Start ts_enum_compatibility]
// 不同枚举之间互不兼容
enum EcColor { Red, Green, Blue }
enum EcStatus { Active, Inactive }

let ecC: EcColor = EcColor.Red;
let ecS: EcStatus = ecC; // 编译错误：不同枚举不兼容

let ecN: number = ecC; // 数值枚举可与number兼容
console.info(`${ecN}`); // 0
// [End ts_enum_compatibility]

// [Start ts_assertion_runtime_type]
let runtimeTypeValue: Object = 123;

// 类型断言不会将数字转换为字符串
let assertedString: string = runtimeTypeValue as string;

console.info(`${typeof assertedString}`); // "number"（运行时类型仍然是number）
assertedString.toUpperCase(); // 运行时错误：toUpperCase is not a function
// [End ts_assertion_runtime_type]
