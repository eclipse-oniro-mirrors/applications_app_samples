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

// [Start ts_static_storage_properties]
class Constants {
  // 静态存储属性
  public static readonly MAX_VALUE: number = 100;
  public static readonly MIN_VALUE: number = 0;
  public static DEFAULT_TIMEOUT: number = 5000;

  // 静态属性可修改
  public static counter: number = 0;

  static increment(): void {
    Constants.counter++;
  }
}

// 静态属性通过类名访问
console.info(`${Constants.MAX_VALUE}`);  // 100
console.info(`${Constants.MIN_VALUE}`);  // 0
console.info(`${Constants.DEFAULT_TIMEOUT}`);  // 5000

// 非只读静态属性可修改
Constants.increment();
console.info(`${Constants.counter}`);  // 1

// 实例无法访问静态属性
let constants: Constants = new Constants();
console.info(`${constants.MAX_VALUE}`);  // 编译错误
// [End ts_static_storage_properties]

// [Start ts_readonly_instance_properties]
class ImmutablePoint {
  // readonly只读属性
  public readonly x: number;
  public readonly y: number;

  constructor(x: number, y: number) {
    this.x = x;  // 构造函数中可赋值
    this.y = y;
  }

  // 只读属性不可修改
  move(dx: number, dy: number): void {
    this.x += dx;  // 编译错误
    this.y += dy;  // 编译错误
  }

  // 返回新实例而非修改
  translate(dx: number, dy: number): ImmutablePoint {
    return new ImmutablePoint(this.x + dx, this.y + dy);
  }
}

let point: ImmutablePoint = new ImmutablePoint(10, 20);
console.info(`${point.x}`);  // 10
console.info(`${point.y}`);  // 20

// 只读属性不可修改
point.x = 15;  // 编译错误

// 返回新实例
let newPoint: ImmutablePoint = point.translate(5, 5);
console.info(`${newPoint.x}`);  // 15
console.info(`${newPoint.y}`);  // 25

// 原实例不变
console.info(`${point.x}`);  // 10
// [End ts_readonly_instance_properties]

// [Start ts_static_readonly_constants]
// readonly与static结合
class AppConfig {
  public static readonly APP_NAME: string = 'MyApp';
  public static readonly VERSION: string = '1.0.0';
}

console.info(`${AppConfig.APP_NAME}`);   // 'MyApp'
console.info(`${AppConfig.VERSION}`);    // '1.0.0'

AppConfig.APP_NAME = 'NewApp';  // 编译错误
// [End ts_static_readonly_constants]

// [Start ts_property_access_modifiers]
class BankAccount {
  // public：公开访问
  public accountNumber: string;

  // private：私有访问
  private balance: number;

  // protected：受保护访问
  protected ownerName: string;

  // readonly + private
  private readonly createdAt: Date;

  constructor(accountNumber: string, ownerName: string) {
    this.accountNumber = accountNumber;
    this.ownerName = ownerName;
    this.balance = 0;
    this.createdAt = new Date();
  }

  // 公开方法访问私有属性
  getBalance(): number {
    return this.balance;
  }

  deposit(amount: number): void {
    if (amount > 0) {
      this.balance += amount;
    }
  }

  withdraw(amount: number): boolean {
    if (amount > 0 && this.balance >= amount) {
      this.balance -= amount;
      return true;
    }
    return false;
  }

  // protected方法
  protected setOwnerName(name: string): void {
    this.ownerName = name;
  }
}

let account: BankAccount = new BankAccount('ACC-001', 'Alice');

// public可访问
console.info(`${account.accountNumber}`);  // 'ACC-001'

// private不可访问
console.info(`${account.balance}`);  // 编译错误

// protected不可访问
console.info(`${account.ownerName}`);  // 编译错误

// 通过公开方法访问私有属性
account.deposit(100);
console.info(`${account.getBalance()}`);  // 100

// 子类访问protected属性
class PremiumAccount extends BankAccount {
  updateOwner(newOwner: string): void {
    this.setOwnerName(newOwner);  // 子类可访问protected方法
  }
}
// [End ts_property_access_modifiers]

// [Start ts_readonly_computed_properties]
class Rectangle {
  public width: number = 0;
  public height: number = 0;

  // 只读计算属性：仅有getter
  get area(): number {
    return this.width * this.height;
  }

  get perimeter(): number {
    return 2 * (this.width + this.height);
  }

  // 无setter，不可直接设置area
  // set area(value: number) { }  // 不提供
}

let rect: Rectangle = new Rectangle();
rect.width = 10;
rect.height = 20;

console.info(`${rect.area}`);       // 200
console.info(`${rect.perimeter}`);  // 60

// 不可设置计算属性
rect.area = 100;  // 编译错误

// 通过修改源属性影响计算属性
rect.width = 5;
console.info(`${rect.area}`);  // 100（自动更新）
// [End ts_readonly_computed_properties]

// [Start ts_static_constants_class]
class MathConstants {
  public static readonly PI: number = 3.14159;
  public static readonly E: number = 2.71828;
  public static readonly GOLDEN_RATIO: number = 1.61803;

  static calculateCircleArea(radius: number): number {
    return MathConstants.PI * radius * radius;
  }

  static calculateCircleCircumference(radius: number): number {
    return 2 * MathConstants.PI * radius;
  }
}

// 静态属性通过类名访问
console.info(`${MathConstants.PI}`);                      // 3.14159
console.info(`${MathConstants.E}`);                       // 2.71828
console.info(`${MathConstants.GOLDEN_RATIO}`);            // 1.61803

// 静态方法使用静态属性
let area: number = MathConstants.calculateCircleArea(5);
console.info(`${area}`);  // ~78.54

// 实例无法访问静态属性
let mathConstants: MathConstants = new MathConstants();
console.info(`${mathConstants.PI}`);  // 编译错误
// [End ts_static_constants_class]

// [Start ts_instance_property_independence]
class Student {
  public name: string;
  public age: number;
  public grade: string;

  constructor(name: string, age: number, grade: string) {
    this.name = name;
    this.age = age;
    this.grade = grade;
  }

  // 实例方法访问实例属性
  getInfo(): string {
    return `${this.name}, ${this.age} years old, grade ${this.grade}`;
  }

  // 实例方法修改实例属性
  setGrade(newGrade: string): void {
    this.grade = newGrade;
  }
}

let student1: Student = new Student('Alice', 15, 'A');
let student2: Student = new Student('Bob', 16, 'B');

// 实例属性通过实例访问
console.info(`${student1.name}`);   // 'Alice'
console.info(`${student2.name}`);   // 'Bob'

// 实例属性独立
student1.setGrade('A+');
console.info(`${student1.grade}`);  // 'A+'
console.info(`${student2.grade}`);  // 'B'（不受影响）

// 类名无法访问实例属性
console.info(`${Student.grade}`);  // 编译错误：实例属性无法通过类名访问
// [End ts_instance_property_independence]

// [Start ts_access_modifier_combination]
class SecureData {
  // public：完全公开
  public id: number;

  // private：仅类内部
  private secretKey: string;

  // protected：类及子类
  protected internalData: string;

  // readonly：只读
  public readonly createdAt: Date;

  // 组合修饰符
  private readonly immutableSecret: string;
  protected readonly protectedReadOnly: string;

  constructor(id: number, secret: string) {
    this.id = id;
    this.secretKey = secret;
    this.internalData = 'internal';
    this.createdAt = new Date();
    this.immutableSecret = secret;
    this.protectedReadOnly = 'protected';
  }

  // 公开访问私有属性的方法
  getSecretKey(): string {
    return this.secretKey;
  }

  // 验证后修改私有属性
  updateSecretKey(newKey: string, token: string): boolean {
    if (token === 'valid') {
      this.secretKey = newKey;
      return true;
    }
    return false;
  }

  // protected方法
  protected getInternalData(): string {
    return this.internalData;
  }
}

let secure: SecureData = new SecureData(1, 'secret123');

// public可访问
console.info(`${secure.id}`);         // 1

// private不可直接访问
console.info(`${secure.secretKey}`);  // 编译错误

// 通过公开方法访问
console.info(`${secure.getSecretKey()}`);  // 'secret123'

// protected不可直接访问
console.info(`${secure.internalData}`);  // 编译错误

// readonly可读不可写
console.info(`${secure.createdAt}`);
secure.createdAt = new Date();  // 编译错误

// 子类访问protected属性
class ExtendedSecure extends SecureData {
  getProtectedData(): string {
    return this.getInternalData();  // 可访问protected方法
  }

  getProtectedProperty(): string {
    return this.protectedReadOnly;  // 可访问protected属性
  }
}
// [End ts_access_modifier_combination]

// [Start ts_property_inheritance]
class Parent {
  public publicProp: string = 'public';
  protected protectedProp: string = 'protected';
  private privateProp: string = 'private';

  getPrivateProp(): string {
    return this.privateProp;
  }
}

class Child extends Parent {
  // 新增属性
  public childProp: string = 'child';

  // 继承public属性
  getPublicFromParent(): string {
    return this.publicProp;  // 可访问
  }

  // 继承protected属性
  getProtectedFromParent(): string {
    return this.protectedProp;  // 可访问
  }

  // 无法继承private属性
  getPrivateFromParent(): string {
    return this.privateProp;  // 编译错误
  }

  // 通过父类公开方法访问私有属性
  getParentPrivate(): string {
    return this.getPrivateProp();  // 可访问
  }

  // 重写父类属性（隐藏）
  public publicProp: string = 'child override';

  testOverride(): void {
    console.info(`${this.publicProp}`);  // 'child override'
  }
}

let child: Child = new Child();

console.info(`${child.publicProp}`);           // 'child override'
console.info(`${child.getProtectedFromParent()}`); // 'protected'（继承）
console.info(`${child.childProp}`);            // 'child'
console.info(`${child.getParentPrivate()}`);   // 'private'

// 属性继承总结：
// public：完全继承，可重写
// protected：继承，子类可访问
// private：不继承，子类不可直接访问
// [End ts_property_inheritance]

// [Start ts_immutable_config_object]
class ImmutableConfig {
  public readonly apiUrl: string;
  public readonly timeout: number;

  constructor(apiUrl: string, timeout: number) {
    this.apiUrl = apiUrl;
    this.timeout = timeout;
  }
}

let config: ImmutableConfig = new ImmutableConfig('EXAMPLE_API_URL', 5000);
console.info(`${config.apiUrl}`);  // 'EXAMPLE_API_URL'
config.apiUrl = 'new';  // 编译错误
// [End ts_immutable_config_object]

// ===== ts_index_signature_in_class =====
// [Start ts_index_signature_in_class]
class TsIsStringBooleanMap {
  [key: string]: boolean | ((s: string) => boolean);

  check(s: string): boolean {
    return (this[s] as boolean);
  }
}

let tsIsMap: TsIsStringBooleanMap = new TsIsStringBooleanMap();
tsIsMap['isActive'] = true;
tsIsMap['isDeleted'] = false;

console.info(`${tsIsMap['isActive']}`);   // true
console.info(`${tsIsMap['isDeleted']}`);  // false
// [End ts_index_signature_in_class]
