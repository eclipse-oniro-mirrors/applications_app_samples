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

// [Start ts_access_modifiers]
class BankAccount {
  // public：公开访问
  public accountNumber: string;
  
  // private：私有，仅类内部访问
  private balance: number;
  
  // protected：受保护，类及子类访问
  protected ownerName: string;
  
  constructor(accountNumber: string, ownerName: string) {
    this.accountNumber = accountNumber;
    this.ownerName = ownerName;
    this.balance = 0;
  }
  
  // 公开方法访问私有属性
  deposit(amount: number): void {
    if (amount > 0) {
      this.balance += amount;
    }
  }
  
  getBalance(): number {
    return this.balance;
  }
  
  // protected方法
  protected updateOwner(name: string): void {
    this.ownerName = name;
  }
}

let account: BankAccount = new BankAccount('123', 'Alice');

// public可访问
console.info(`${account.accountNumber}`);

// private不可访问
console.info(`${account.balance}`);  // 编译错误

// protected不可访问
console.info(`${account.ownerName}`);  // 编译错误

// 通过方法访问
account.deposit(100);
console.info(`${account.getBalance()}`);  // 100
// [End ts_access_modifiers]

// [Start ts_readonly_properties]
class Configuration {
  // readonly只读属性
  readonly appName: string = 'MyApp';
  readonly version: string;
  
  constructor(version: string) {
    this.version = version;  // 构造函数中可赋值
  }
}

let config: Configuration = new Configuration('1.0.0');

console.info(`${config.appName}`);  // 'MyApp'
console.info(`${config.version}`);   // '1.0.0'

// 只读属性不可修改
config.appName = 'NewApp';  // 编译错误
config.version = '2.0.0';  // 编译错误

// readonly与private结合
class Constants {
  private readonly MAX_VALUE: number = 100;
  private readonly MIN_VALUE: number = 0;
  
  getMax(): number {
    return this.MAX_VALUE;
  }
  
  getMin(): number {
    return this.MIN_VALUE;
  }
}
// [End ts_readonly_properties]

// [Start ts_static_methods]
class MathUtils {
  // 静态方法
  static add(a: number, b: number): number {
    return a + b;
  }
  
  static multiply(a: number, b: number): number {
    return a * b;
  }
  
  static max(a: number, b: number): number {
    return a > b ? a : b;
  }
  
  static min(a: number, b: number): number {
    return a < b ? a : b;
  }
}

// 静态方法通过类名调用
console.info(`${MathUtils.add(1, 2)}`);      // 3
console.info(`${MathUtils.multiply(3, 4)}`); // 12
console.info(`${MathUtils.max(5, 10)}`);     // 10

// 创建实例不影响静态方法
let utils: MathUtils = new MathUtils();
utils.add(1, 2);  // 编译错误：实例不能调用静态方法

// 静态方法无法访问实例属性
class StaticExample {
  public instanceValue: number = 10;
  public static staticValue: number = 20;
  
  static getStaticValue(): number {
    return StaticExample.staticValue;  // 可访问静态属性
  }
  
  static getInstanceValue(): number {
    return this.instanceValue;  // 编译错误：无法访问实例属性
  }
}
// [End ts_static_methods]

// [Start ts_single_inheritance_limitation]
// TypeScript/ArkTS只支持单继承
class A {
  methodA(): void {}
}

class B {
  methodB(): void {}
}

class CMulti extends A, B {}  // 编译错误：不支持多继承
// [End ts_single_inheritance_limitation]

// [Start ts_access_modifiers_summary]
class Example {
  // public：公开，任何地方可访问
  public publicProperty: string = 'public';
  
  // private：私有，仅类内部可访问
  private privateProperty: string = 'private';
  
  // protected：受保护，类及子类可访问
  protected protectedProperty: string = 'protected';
  
  // readonly：只读，初始化后不可修改
  readonly readonlyProperty: string = 'readonly';
  
  // 组合使用
  private readonly privateReadonly: string = 'private readonly';
  protected readonly protectedReadonly: string = 'protected readonly';
  
  public publicMethod(): void {
    // 可访问所有属性
    console.info(`${this.publicProperty}`);
    console.info(`${this.privateProperty}`);
    console.info(`${this.protectedProperty}`);
  }
  
  private privateMethod(): void {
    console.info(`Private method`);
  }
  
  protected protectedMethod(): void {
    console.info(`Protected method`);
  }
}

let example: Example = new Example();

// public可访问
console.info(`${example.publicProperty}`);
example.publicMethod();

// private不可访问
console.info(`${example.privateProperty}`);  // 编译错误
example.privateMethod();                // 编译错误

// protected不可访问
console.info(`${example.protectedProperty}`);  // 编译错误
example.protectedMethod();                // 编译错误

// readonly可读不可写
console.info(`${example.readonlyProperty}`);
example.readonlyProperty = 'new';  // 编译错误
// [End ts_access_modifiers_summary]

// [Start ts_access_modifiers_inheritance]
class Base {
  public publicValue: number = 1;
  private privateValue: number = 2;
  protected protectedValue: number = 3;
  
  testAccess(): void {
    // 类内部可访问所有
    console.info(`${this.publicValue}`);
    console.info(`${this.privateValue}`);
    console.info(`${this.protectedValue}`);
  }
}

class Derived extends Base {
  testDerivedAccess(): void {
    // 子类可访问public和protected
    console.info(`${this.publicValue}`);
    console.info(`${this.privateValue}`);  // 编译错误
    console.info(`${this.protectedValue}`);
  }
}

// 外部访问
let base: Base = new Base();
console.info(`${base.publicValue}`);  // 1（public可访问）
console.info(`${base.privateValue}`);   // 编译错误
console.info(`${base.protectedValue}`); // 编译错误

let derived: Derived = new Derived();
console.info(`${derived.publicValue}`);  // 1（public可访问）
// [End ts_access_modifiers_inheritance]

// [Start ts_private_fields]
// TypeScript对照写法，ArkTS中使用private修饰符替代
class TsDog {
  #barkAmount: number = 0;
  public personality: string = 'happy';

  bark(): void {
    this.#barkAmount++;
  }
}
// [End ts_private_fields]

// [Start ts_runtime_this_error]
// TypeScript对照写法，演示this丢失的运行时错误
class TsThisExample {
  public name: string = 'MyClass';

  getName(): string {
    return this.name;
  }
}

let tsThisEx: TsThisExample = new TsThisExample();
console.info(`${tsThisEx.getName()}`);  // MyClass

let tsThisG = tsThisEx.getName;
tsThisG();  // 运行时错误：Cannot read property 'name' of undefined
// [End ts_runtime_this_error]

// [Start ts_constructor_signature]
// TypeScript对照写法，ArkTS中直接使用类名
class TsCtorPoint {
  public x: number;
  public y: number;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}
type TsCtorPointInstance = InstanceType<typeof TsCtorPoint>;
// [End ts_constructor_signature]

// [Start ts_prototype_methods]
// TypeScript对照写法，ArkTS不支持prototype赋值
class ProtoVehicle {
  public brand: string;
  public speed: number = 0;

  constructor(brand: string) {
    this.brand = brand;
  }

  // 声明方法，实现由prototype提供
  getInfo(): string {
    return '';
  }
}

// TypeScript支持通过prototype赋值扩展方法，ArkTS不支持
ProtoVehicle.prototype.getInfo = function(): string {
  return `${this.brand} - ${this.speed}km/h`;
};

let protoVehicle: ProtoVehicle = new ProtoVehicle('Toyota');
protoVehicle.speed = 60;
console.info(`${protoVehicle.getInfo()}`); // Toyota - 60km/h
// [End ts_prototype_methods]

// [Start structural_subtype]
class RelPerson {
  public name: string = '';
  public age: number = 0;
}

class RelEmployee {
  public name: string = '';
  public age: number = 0;
  public salary: number = 0;
}

// Employee有Person的所有成员，是子类型
let relP: RelPerson = new RelEmployee();
console.info(`${relP.name}`);
// [End structural_subtype]

// ===== ts_this_type =====
// [Start ts_this_type]
// TypeScript写法，ArkTS不支持this作为返回类型
class TsStringBuilder {
  public parts: string[] = [];

  append(text: string): this {
    this.parts.push(text);
    return this;
  }

  toString(): string {
    return this.parts.join('');
  }
}

let tsSb: TsStringBuilder = new TsStringBuilder();
let tsResult: string = tsSb.append('Hello').append(', ').append('World').toString();
console.info(`${tsResult}`); // Hello, World
// [End ts_this_type]

// ===== ts_parameter_properties =====
// [Start ts_parameter_properties]
// TypeScript写法，ArkTS不支持构造函数参数属性
class TsPoint {
  constructor(public x: number, public y: number) {}
}

let tsPt: TsPoint = new TsPoint(3, 4);
console.info(`${tsPt.x}, ${tsPt.y}`); // 3, 4
// [End ts_parameter_properties]

// ===== ts_class_expression =====
// [Start ts_class_expression]
// TypeScript写法，ArkTS不支持类表达式
const someClass = class<T> {
  content: T;
  constructor(content: T) {
    this.content = content;
  }
};

let tsInstance = new someClass<string>('hello');
console.info(`${tsInstance.content}`); // hello
// [End ts_class_expression]

// ===== ts_mixins =====
// [Start ts_mixins]
// TypeScript写法，ArkTS不支持Mixin模式
class TsBaseWidget {
  public id: number = 0;
}

function Scoped(Base: typeof TsBaseWidget) {
  return class extends Base {
    public scope: string = 'local';
  };
}

let ScopedWidget = Scoped(TsBaseWidget);
let tsWidget = new ScopedWidget();
console.info(`${tsWidget.scope}`); // local
// [End ts_mixins]

// ===== ts_structural_typing =====
// [Start ts_structural_typing]
// TypeScript结构类型，ArkTS不支持
class TsRelPoint1 {
  public x: number = 0;
  public y: number = 0;
}

class TsRelPoint2 {
  public x: number = 0;
  public y: number = 0;
}

// 结构相同，可互相赋值（ArkTS不支持）
let tsRelP1: TsRelPoint1 = new TsRelPoint2();
let tsRelP2: TsRelPoint2 = new TsRelPoint1();
console.info(`${tsRelP1.x}`);
// [End ts_structural_typing]

// ===== ts_structural_subtype =====
// [Start ts_structural_subtype]
// TypeScript结构子类型，ArkTS不支持
class TsRelPerson {
  public name: string = '';
  public age: number = 0;
}

class TsRelEmployee {
  public name: string = '';
  public age: number = 0;
  public salary: number = 0;
}

// Employee有Person的所有成员，是子类型（ArkTS不支持）
let tsRelP: TsRelPerson = new TsRelEmployee();
console.info(`${tsRelP.name}`);
// [End ts_structural_subtype]
