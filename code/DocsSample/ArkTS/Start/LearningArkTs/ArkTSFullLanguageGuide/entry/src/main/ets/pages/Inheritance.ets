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

export {}

// ===== basic_inheritance_example =====
// [Start basic_inheritance_example]
// 父类（基类）
class Animal {
  public name: string;
  
  constructor(name: string) {
    this.name = name;
  }
  
  speak(): void {
    console.info(`${this.name} makes a sound`);
  }
  
  move(): void {
    console.info(`${this.name} moves`);
  }
}

// 子类（派生类）继承父类
class Dog extends Animal {
  public breed: string;
  
  constructor(name: string, breed: string) {
    super(name);  // 调用父类构造函数
    this.breed = breed;
  }
  
  // 继承父类方法，可以重写
  speak(): void {
    console.info(`${this.name} barks`);
  }
  
  // 新增方法
  fetch(): void {
    console.info(`${this.name} fetches the ball`);
  }
}

let dog: Dog = new Dog('Max', 'Labrador');
dog.speak();   // 'Max barks'（重写方法）
dog.move();    // 'Max moves'（继承方法）
dog.fetch();   // 'Max fetches the ball'（新增方法）
// [End basic_inheritance_example]

// ===== base_and_derived_class =====
// [Start base_and_derived_class]
// 基类（Base Class）：被继承的类
class Vehicle {
  public brand: string;
  
  constructor(brand: string) {
    this.brand = brand;
  }
  
  start(): void {
    console.info(`${this.brand} vehicle starting`);
  }
}

// 派生类（Derived Class）：继承基类的类
class Car extends Vehicle {
  public model: string;
  
  constructor(brand: string, model: string) {
    super(brand);
    this.model = model;
  }
  
  getInfo(): string {
    return `${this.brand} ${this.model}`;
  }
}

class Motorcycle extends Vehicle {
  public type: string;
  
  constructor(brand: string, type: string) {
    super(brand);
    this.type = type;
  }
  
  getInfo(): string {
    return `${this.brand} ${this.type} motorcycle`;
  }
}

let car: Car = new Car('Toyota', 'Camry');
let motorcycle: Motorcycle = new Motorcycle('Honda', 'sport');

console.info(`${car.getInfo()}`);        // 'Toyota Camry'
console.info(`${motorcycle.getInfo()}`); // 'Honda sport motorcycle'

// 基类和派生类关系：
// - 基类提供通用属性和方法
// - 派生类继承并特化基类
// - 派生类可以创建多个，形成继承树
// [End base_and_derived_class]

// ===== inheritance_code_reuse =====
// [Start inheritance_code_reuse]
// 不使用继承：重复代码
class DogWithoutInheritance {
  public name: string;
  public age: number;
  
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
  
  eat(): void {
    console.info(`${this.name} is eating`);
  }
  
  sleep(): void {
    console.info(`${this.name} is sleeping`);
  }
  
  bark(): void {
    console.info(`${this.name} is barking`);
  }
}

class CatWithoutInheritance {
  public name: string;
  public age: number;
  
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
  
  eat(): void {
    console.info(`${this.name} is eating`);  // 重复代码
  }
  
  sleep(): void {
    console.info(`${this.name} is sleeping`);  // 重复代码
  }
  
  meow(): void {
    console.info(`${this.name} is meowing`);
  }
}

// 使用继承：代码复用
class ReuseAnimal {
  public name: string;
  public age: number;
  
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
  
  // 公共方法：子类复用
  eat(): void {
    console.info(`${this.name} is eating`);
  }
  
  sleep(): void {
    console.info(`${this.name} is sleeping`);
  }
}

class ReuseDog extends ReuseAnimal {
  constructor(name: string, age: number) {
    super(name, age);
  }
  
  // 特有方法
  bark(): void {
    console.info(`${this.name} is barking`);
  }
}

class Cat extends ReuseAnimal {
  constructor(name: string, age: number) {
    super(name, age);
  }
  
  // 特有方法
  meow(): void {
    console.info(`${this.name} is meowing`);
  }
}

let reuseDog: ReuseDog = new ReuseDog('Max', 3);
let cat: Cat = new Cat('Whiskers', 2);

reuseDog.eat();    // 复用父类方法
reuseDog.sleep();  // 复用父类方法
reuseDog.bark();   // 子类特有方法

cat.eat();    // 复用父类方法
cat.sleep();  // 复用父类方法
cat.meow();   // 子类特有方法
// [End inheritance_code_reuse]

// ===== extends_keyword_usage =====
// [Start extends_keyword_usage]
// 基类定义
class Shape {
  public color: string;
  
  constructor(color: string) {
    this.color = color;
  }
  
  draw(): void {
    console.info(`Drawing a ${this.color} shape`);
  }
  
  getArea(): number {
    return 0;
  }
}

// 子类继承声明：使用extends关键字
class Circle extends Shape {
  public radius: number;
  
  constructor(color: string, radius: number) {
    super(color);  // 必须调用父类构造函数
    this.radius = radius;
  }
  
  // 重写父类方法
  draw(): void {
    console.info(`Drawing a ${this.color} circle with radius ${this.radius}`);
  }
  
  getArea(): number {
    return Math.PI * this.radius * this.radius;
  }
}

class Rectangle extends Shape {
  public width: number;
  public height: number;
  
  constructor(color: string, width: number, height: number) {
    super(color);
    this.width = width;
    this.height = height;
  }
  
  draw(): void {
    console.info(`Drawing a ${this.color} rectangle ${this.width}x${this.height}`);
  }
  
  getArea(): number {
    return this.width * this.height;
  }
}

let circle: Circle = new Circle('red', 5);
let rectangle: Rectangle = new Rectangle('blue', 10, 20);

circle.draw();
console.info(`${circle.getArea()}`);

rectangle.draw();
console.info(`${rectangle.getArea()}`);
// [End extends_keyword_usage]

// ===== parent_child_relation =====
// [Start parent_child_relation]
class Employee {
  // 父类属性
  public name: string;
  public id: number;
  
  constructor(name: string, id: number) {
    this.name = name;
    this.id = id;
  }
  
  // 父类方法
  work(): void {
    console.info(`${this.name} is working`);
  }
  
  getInfo(): string {
    return `Employee ${this.id}: ${this.name}`;
  }
}

class Manager extends Employee {
  // 子类新增属性
  public department: string;
  public teamSize: number;
  
  constructor(name: string, id: number, department: string, teamSize: number) {
    super(name, id);  // 关联父类构造函数
    this.department = department;
    this.teamSize = teamSize;
  }
  
  // 子类新增方法
  manage(): void {
    console.info(`${this.name} manages ${this.teamSize} people in ${this.department}`);
  }
  
  // 重写父类方法
  getInfo(): string {
    return `Manager ${this.id}: ${this.name}, ${this.department} department`;
  }
  
  // 调用父类方法
  getEmployeeInfo(): string {
    return super.getInfo();  // 通过super调用父类方法
  }
}

let manager: Manager = new Manager('Alice', 1, 'Engineering', 10);

// 关联父类属性和方法
console.info(`${manager.name}`);       // 'Alice'（继承父类属性）
console.info(`${manager.id}`);          // 1（继承父类属性）
manager.work();                    // 'Alice is working'（继承父类方法）
console.info(`${manager.getInfo()}`);   // 'Manager 1: Alice, Engineering department'（重写）
console.info(`${manager.getEmployeeInfo()}`);  // 'Employee 1: Alice'（父类方法）

// 子类特有属性和方法
console.info(`${manager.department}`);  // 'Engineering'
console.info(`${manager.teamSize}`);    // 10
manager.manage();                  // 'Alice manages 10 people in Engineering'
// [End parent_child_relation]

// ===== empty_child_class =====
// [Start empty_child_class]
class Base {
  public value: number = 10;
  
  getValue(): number {
    return this.value;
  }
  
  increment(): void {
    this.value++;
  }
}

// 空子类：无新增属性和方法
class EmptyChild extends Base {
  // 空子类继承所有父类功能
}

let empty: EmptyChild = new EmptyChild();

// 空子类完全继承父类
console.info(`${empty.getValue()}`);  // 10
empty.increment();
console.info(`${empty.getValue()}`);  // 11

// 空子类使用场景：
// 1. 类型标记：区分不同类别
class User {
  public name: string;
  constructor(name: string) {
    this.name = name;
  }
}

class RegularUser extends User {}
class PremiumUser extends User {}

let regular: RegularUser = new RegularUser('Bob');
let premium: PremiumUser = new PremiumUser('Alice');

// 通过类型区分用户类别
function getServiceLevel(user: User): string {
  if (user instanceof PremiumUser) {
    return 'Premium service';
  }
  return 'Regular service';
}

console.info(`${getServiceLevel(regular)}`);   // 'Regular service'
console.info(`${getServiceLevel(premium)}`);   // 'Premium service'

// 2. 未来扩展预留
class FutureFeature extends Base {
  // 预留子类，未来可添加功能
}
// [End empty_child_class]

// ===== multi_level_inheritance =====
// [Start multi_level_inheritance]
// 继承层级：多层继承
class GrandParent {
  methodGrandParent(): void {
    console.info('GrandParent method');
  }
}

class MultiLevelParent extends GrandParent {
  methodParent(): void {
    console.info('MultiLevelParent method');
  }
  
  methodGrandParent(): void {
    console.info('MultiLevelParent overrides GrandParent');
    super.methodGrandParent();  // 调用父类方法
  }
}

class MultiLevelChild extends MultiLevelParent {
  methodChild(): void {
    console.info('MultiLevelChild method');
  }
  
  methodParent(): void {
    console.info('MultiLevelChild overrides MultiLevelParent');
    super.methodParent();  // 调用父类方法
  }
}

let multiLevelChild: MultiLevelChild = new MultiLevelChild();

multiLevelChild.methodChild();           // 'MultiLevelChild method'
multiLevelChild.methodParent();          // 'MultiLevelChild overrides MultiLevelParent', 'MultiLevelParent method'
multiLevelChild.methodGrandParent();     // 'MultiLevelParent overrides GrandParent', 'GrandParent method'

// 继承链查找：从子类到父类
// MultiLevelChild.methodChild() -> MultiLevelChild自身
// MultiLevelChild.methodParent() -> MultiLevelChild重写 -> MultiLevelParent方法
// MultiLevelChild.methodGrandParent() -> MultiLevelParent重写 -> GrandParent方法

// 继承层级限制：避免过深继承
// 推荐：不超过3层继承
// 反例：继承层级过深，增加复杂度
// [End multi_level_inheritance]

// ===== static_member_inheritance =====
// [Start static_member_inheritance]
class MemberBase {
  // 静态属性
  public static staticValue: number = 100;
  
  // 静态方法
  public static staticMethod(): void {
    console.info('Static method');
  }
  
  public static getStaticValue(): number {
    return MemberBase.staticValue;
  }
}

class Derived extends MemberBase {
  // 继承静态方法
  callStaticMethod(): void {
    MemberBase.staticMethod();    // 通过父类名调用
    Derived.staticMethod(); // 通过子类名调用（继承）
  }
  
  // 继承静态属性
  getInheritedStaticValue(): number {
    return Derived.getStaticValue();  // 继承的静态方法
  }
  
  // 子类静态方法
  static childStaticMethod(): void {
    console.info('Child static method');
    Derived.staticMethod();  // 调用继承的静态方法
  }
}

// 静态方法通过类名调用
MemberBase.staticMethod();           // 'Static method'
Derived.staticMethod();        // 'Static method'（继承）
Derived.childStaticMethod();   // 'Child static method', 'Static method'

console.info(`${MemberBase.staticValue}`);       // 100
console.info(`${Derived.staticValue}`);    // 100（继承）

let derived: Derived = new Derived();
derived.callStaticMethod();           // 'Static method', 'Static method'
console.info(`${derived.getInheritedStaticValue()}`);  // 100

// 静态成员继承规则：
// 静态属性和方法通过类名访问
// 子类继承父类的静态成员
// 子类可以添加自己的静态成员
// [End static_member_inheritance]

// ===== method_override =====
// [Start method_override]
class Communicator {
  sendMessage(message: string): void {
    console.info(`Sending: ${message}`);
  }
  
  formatMessage(content: string): string {
    return content;
  }
}

class EmailCommunicator extends Communicator {
  // 重写父类方法：相同签名
  sendMessage(message: string): void {
    console.info(`Sending email: ${message}`);
  }
  
  // 重写并扩展
  formatMessage(content: string): string {
    let formatted: string = super.formatMessage(content);  // 调用父类方法
    return `[Email] ${formatted}`;
  }
  
  // 新增方法
  sendHtmlEmail(html: string): void {
    let formatted: string = this.formatMessage(html);
    this.sendMessage(formatted);
  }
}

let email: EmailCommunicator = new EmailCommunicator();

email.sendMessage('Hello');            // 'Sending email: Hello'
console.info(`${email.formatMessage('Test')}`); // '[Email] Test'
email.sendHtmlEmail('<p>Content</p>');
// [End method_override]

// ===== super_call_parent_method =====
// [Start super_call_parent_method]
class Worker {
  work(): void {
    console.info('Worker working');
  }
  
  rest(): void {
    console.info('Worker resting');
  }
  
  report(): string {
    return 'Worker report';
  }
}

class ParentManager extends Worker {
  // 重写并调用父类方法
  work(): void {
    super.work();  // 调用父类work方法
    console.info('ParentManager managing');
  }
  
  // 完全重写
  rest(): void {
    console.info('ParentManager taking break');
    // 不调用super.rest()
  }
  
  // 扩展父类返回值
  report(): string {
    let baseReport: string = super.report();
    return `${baseReport}, ParentManager report`;
  }
  
  // 组合调用
  fullDay(): void {
    super.work();
    this.work();
    super.rest();
    this.rest();
  }
}

let parentManager: ParentManager = new ParentManager();

parentManager.work();   // 'Worker working', 'ParentManager managing'
parentManager.rest();   // 'ParentManager taking break'
console.info(`${parentManager.report()}`);  // 'Worker report, ParentManager report'
parentManager.fullDay();

// super调用规则：
// super.methodName() 调用父类实例方法
// 必须在子类实例方法中使用
// 可以在重写方法的任何位置调用
// [End super_call_parent_method]

// ===== super_call_constructor =====
// [Start super_call_constructor]
class Person {
  public name: string;
  public age: number;
  
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
    console.info('Person constructor');
  }
}

class Student extends Person {
  public grade: string;
  
  constructor(name: string, age: number, grade: string) {
    super(name, age);  // 必须先调用父类构造函数
    this.grade = grade;
    console.info('Student constructor');
  }
}

let student: Student = new Student('Alice', 20, 'A');
// 输出：'Person constructor', 'Student constructor'

class CtorEmployee extends Person {
  public department: string;
  
  constructor(name: string, age: number, department: string) {
    super(name, age);  // 传递参数给父类构造函数
    this.department = department;
  }
  
  getInfo(): string {
    return `${this.name}, ${this.age}, ${this.department}`;
  }
}

let employee: CtorEmployee = new CtorEmployee('Bob', 30, 'Engineering');
console.info(`${employee.getInfo()}`);  // 'Bob, 30, Engineering'

// super() 调用规则：
// 子类构造函数必须调用super()
// super() 必须在子类构造函数第一行
// super() 传递参数给父类构造函数
// [End super_call_constructor]

// ===== auto_constructor_call =====
// [Start auto_constructor_call]
class SimpleParent {
  public value: number = 10;
  
  // 父类有构造函数
  constructor(value: number) {
    this.value = value;
  }
}

class SimpleChild extends SimpleParent {
  // 子类无构造函数：自动调用父类构造函数
  // 编译器自动生成：
  // constructor(value: number) {
  //   super(value);
  // }
  
  getInfo(): string {
    return `Value: ${this.value}`;
  }
}

let callChild: SimpleChild = new SimpleChild(20);
console.info(`${callChild.getInfo()}`);  // 'Value: 20'

class EmptyParent {
  public name: string = 'default';
}

class CallEmptyChild extends EmptyParent {
  // 父类无参数构造函数：子类无需显式调用super()
  // 编译器自动生成默认构造函数
  
  // 子类可添加自己的构造函数
  constructor(name: string) {
    super();
    this.name = name;
  }
}

let callEmpty: CallEmptyChild = new CallEmptyChild('custom');
console.info(`${callEmpty.name}`);  // 'custom'
// [End auto_constructor_call]

// ===== super_call_rules =====
// [Start super_call_rules]
class RequiredParent {
  public name: string;
  
  constructor(name: string) {
    this.name = name;
  }
}

class RequiredChild extends RequiredParent {
  public age: number;
  
  constructor(name: string, age: number) {
    // 必须调用super()，且必须在第一行
    super(name);
    this.age = age;
  }
}

let rulesChild: RequiredChild = new RequiredChild('Alice', 25);

class OptionalParent {
  public value: number = 0;
  
  // 默认参数构造函数
  constructor(value?: number) {
    if (value !== undefined) {
      this.value = value;
    }
  }
}

class OptionalChild extends OptionalParent {
  public extra: string;
  
  constructor(value?: number, extra?: string) {
    super(value);  // 传递可选参数
    this.extra = extra ?? 'default';
  }
}

let child1: OptionalChild = new OptionalChild();
let child2: OptionalChild = new OptionalChild(10);
let child3: OptionalChild = new OptionalChild(10, 'custom');
// [End super_call_rules]

// ===== constructor_parameter_passing =====
// [Start constructor_parameter_passing]
class MultiParamParent {
  public name: string;
  public age: number;
  public email: string;
  
  constructor(name: string, age: number, email: string) {
    this.name = name;
    this.age = age;
    this.email = email;
  }
}

class MultiParamChild extends MultiParamParent {
  public phone: string;
  
  constructor(name: string, age: number, email: string, phone: string) {
    super(name, age, email);  // 传递参数给父类构造函数
    this.phone = phone;
  }
}

let passChild: MultiParamChild = new MultiParamChild('Alice', 25, 'alice@example.com', '123-456');

// 参数传递方式：
class FlexibleParent {
  public config: Map<string, string>;
  
  constructor(config: Map<string, string>) {
    this.config = config;
  }
}

class FlexibleChild extends FlexibleParent {
  public name: string;
  
  constructor(name: string, config?: Map<string, string>) {
    // 处理可选参数
    let finalConfig: Map<string, string> = config ?? new Map();
    super(finalConfig);
    this.name = name;
  }
}

let passChild1: FlexibleChild = new FlexibleChild('Test');
let passChild2: FlexibleChild = new FlexibleChild('Test', new Map([['key', 'value']]));

// 默认参数传递
class DefaultValueParent {
  public value: number;
  
  constructor(value: number = 10) {
    this.value = value;
  }
}

class DefaultValueChild extends DefaultValueParent {
  public extra: number;
  
  constructor(value?: number, extra?: number) {
    super(value ?? 10);  // 传递默认值
    this.extra = extra ?? 0;
  }
}
// [End constructor_parameter_passing]

// ===== prototype_chain_inheritance =====
// [Start prototype_chain_inheritance]
class PrototypeBase {
  methodA(): void {
    console.info('Base methodA');
  }
  
  methodB(): void {
    console.info('Base methodB');
  }
}

class PrototypeChild extends PrototypeBase {
  methodC(): void {
    console.info('Child methodC');
  }
  
  methodA(): void {
    console.info('Child overrides methodA');
  }
}

let chainChild: PrototypeChild = new PrototypeChild();

// 原型链结构：
// chainChild -> PrototypeChild.prototype -> PrototypeBase.prototype -> Object.prototype

// 方法查找：
chainChild.methodA();  // PrototypeChild.prototype（重写）
chainChild.methodB();  // PrototypeBase.prototype（继承）
chainChild.methodC();  // PrototypeChild.prototype（自有）

// 原型链验证：
class ChainAnimal {
  public species: string = 'animal';
  
  speak(): void {
    console.info('ChainAnimal speaks');
  }
}

class ChainDog extends ChainAnimal {
  public breed: string = 'chainDog';
  
  speak(): void {
    console.info('ChainDog barks');
  }
}

let chainDog: ChainDog = new ChainDog();

// 原型链继承关系：
console.info(`${chainDog instanceof ChainDog}`);      // true
console.info(`${chainDog instanceof ChainAnimal}`);   // true
console.info(`${chainDog instanceof Object}`);   // true
// [End prototype_chain_inheritance]

// ===== prototype_chain_lookup =====
// [Start prototype_chain_lookup]
class ChainBase {
  public value: number = 10;
  
  baseMethod(): void {
    console.info('Base method');
  }
}

class ChainMiddle extends ChainBase {
  public middleValue: number = 20;
  
  middleMethod(): void {
    console.info('Middle method');
  }
  
  baseMethod(): void {
    console.info('Middle overrides base');
  }
}

class ChainTop extends ChainMiddle {
  public topValue: number = 30;
  
  topMethod(): void {
    console.info('Top method');
  }
  
  middleMethod(): void {
    console.info('Top overrides middle');
  }
}

let top: ChainTop = new ChainTop();

// 原型链查找：
console.info(`${top.topValue}`);      // 30（自身）
console.info(`${top.middleValue}`);   // 20（继承自ChainMiddle）
console.info(`${top.value}`);         // 10（继承自ChainBase）

top.topMethod();                 // 'Top method'（自身）
top.middleMethod();              // 'Top overrides middle'（重写）
top.baseMethod();                // 'Middle overrides base'（继承并重写）

// 查找顺序：
// 1. ChainTop自身 -> topMethod, topValue
// 2. ChainMiddle原型 -> middleMethod（重写），middleValue
// 3. ChainBase原型 -> baseMethod（重写），value
// 4. Object.prototype

// 方法覆盖验证：
class LookupGrandParent {
  method(): string {
    return 'LookupGrandParent';
  }
}

class LookupParent extends LookupGrandParent {
  method(): string {
    return 'LookupParent';
  }
}

class LookupChild extends LookupParent {
  method(): string {
    return 'LookupChild';
  }
  
  callGrandParent(): string {
    // 无法直接调用LookupGrandParent.method()
    // 反例：只能通过原型链手动查找
    return 'Direct call not supported';
  }
}
// [End prototype_chain_lookup]

// ===== inheritance_depth_limit =====
// [Start inheritance_depth_limit]
// 推荐层级：不超过3层

// 合理层级
class Level1 {
  baseMethod(): void {}
}

class Level2 extends Level1 {
  middleMethod(): void {}
}

class Level3 extends Level2 {
  topMethod(): void {}
}

let obj: Level3 = new Level3();
obj.baseMethod();    // 3层查找
obj.middleMethod();  // 2层查找
obj.topMethod();     // 1层查找

// 反例：过深层级
class Deep1 { method1(): void {} }
class Deep2 extends Deep1 { method2(): void {} }
class Deep3 extends Deep2 { method3(): void {} }
class Deep4 extends Deep3 { method4(): void {} }
class Deep5 extends Deep4 { method5(): void {} }
class Deep6 extends Deep5 { method6(): void {} }
class Deep7 extends Deep6 { method7(): void {} }

let deep: Deep7 = new Deep7();
deep.method1();  // 7层查找（性能影响）

// 性能影响：
// 1. 方法查找时间增加
// 2. 实例化开销增加
// 3. 内存占用增加

// 替代方案：组合优于继承
class Feature1 { feature1(): void {} }
class Feature2 { feature2(): void {} }
class CombinedFeatures {
  private f1: Feature1 = new Feature1();
  private f2: Feature2 = new Feature2();
  
  feature1(): void {
    this.f1.feature1();
  }
  
  feature2(): void {
    this.f2.feature2();
  }
}
// [End inheritance_depth_limit]

// ===== composition_over_inheritance =====
// [Start composition_over_inheritance]
// 继承方案（耦合度高）
class Engine {
  start(): void {
    console.info('Engine started');
  }
}

class ComposeCar extends Engine {
  drive(): void {
    this.start();  // 继承方法
    console.info('ComposeCar driving');
  }
}

// 组合方案（灵活度高）
class CarWithComposition {
  private engine: Engine;
  
  constructor(engine: Engine) {
    this.engine = engine;
  }
  
  drive(): void {
    this.engine.start();  // 组合对象
    console.info('ComposeCar driving');
  }
}

let engine: Engine = new Engine();
let composeCar: CarWithComposition = new CarWithComposition(engine);
composeCar.drive();
// [End composition_over_inheritance]

// ===== interface_alternative =====
// [Start interface_alternative]
interface IRepository<T> {
  save(data: T): void;
  load(id: number): T | null;
}

interface ICacheable {
  cache(): void;
  clearCache(): void;
}

// 使用接口而非继承
class UserRepository implements IRepository<AlternativeUser>, ICacheable {
  save(data: AlternativeUser): void {
    console.info('Saving user');
  }
  
  load(id: number): AlternativeUser | null {
    return null;
  }
  
  cache(): void {
    console.info('Caching');
  }
  
  clearCache(): void {
    console.info('Clearing cache');
  }
}

interface AlternativeUser {
  id: number;
  name: string;
}
// [End interface_alternative]

// ===== inheritance_usage_principle =====
// [Start inheritance_usage_principle]
// 不合理继承：仅为复用代码
class MathUtils {
  add(a: number, b: number): number {
    return a + b;
  }
}

class Calculator extends MathUtils {
  // Calculator并不是MathUtils的子类型
  // 仅为了复用add方法而继承
}

// 合理方案：组合或独立类
class CalculatorWithUtils {
  private math: MathUtils = new MathUtils();
  
  calculate(): number {
    return this.math.add(5, 3);
  }
}

// 或使用静态方法
class CalculatorStatic {
  static calculate(): number {
    return new MathUtils().add(5, 3);
  }
}

// 继承原则：子类应该是父类的特化类型
// IS-A关系：Child IS-A Parent
// HAS-A关系：使用组合
// [End inheritance_usage_principle]

// ===== polymorphism_concept =====
// [Start polymorphism_concept]
// 多态示例：不同子类对同一方法的不同实现
class ConceptShape {
  // 父类方法
  draw(): void {
    console.info('Drawing shape');
  }

  getArea(): number {
    return 0;
  }
}

class ConceptCircle extends ConceptShape {
  public radius: number;

  constructor(radius: number) {
    super();
    this.radius = radius;
  }

  // 重写方法：多态实现
  draw(): void {
    console.info(`Drawing circle with radius ${this.radius}`);
  }

  getArea(): number {
    return Math.PI * this.radius * this.radius;
  }
}

class ConceptRectangle extends ConceptShape {
  public width: number;
  public height: number;

  constructor(width: number, height: number) {
    super();
    this.width = width;
    this.height = height;
  }

  // 重写方法：多态实现
  draw(): void {
    console.info(`Drawing rectangle ${this.width}x${this.height}`);
  }

  getArea(): number {
    return this.width * this.height;
  }
}

// 多态：父类引用指向子类实例
let shapes: ConceptShape[] = [
  new ConceptCircle(5),
  new ConceptRectangle(10, 20),
  new ConceptCircle(3)
];

// 统一接口调用：表现出不同行为
for (let shape of shapes) {
  shape.draw();
  console.info(`Area: ${shape.getArea()}`);
}
// [End polymorphism_concept]

// [Start implements_clause]
interface InhComparable {
  compareTo(other: Object): number;
}

class InhProduct implements InhComparable {
  public price: number;

  constructor(price: number) {
    this.price = price;
  }

  compareTo(other: Object): number {
    if (other instanceof InhProduct) {
      return this.price - other.price;
    }
    return 0;
  }
}

class InhDiscountedProduct extends InhProduct implements InhComparable {
  public discount: number;

  constructor(price: number, discount: number) {
    super(price);
    this.discount = discount;
  }

  getFinalPrice(): number {
    return this.price * (1 - this.discount);
  }
}
// [End implements_clause]


// ===== class_inheritance_essence =====
// [Start class_inheritance_essence]
class ProtoAnimalClass {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }

  speak(): void {
    console.info(`${this.name} speaks`);
  }
}

class ProtoDogClass extends ProtoAnimalClass {
  public breed: string;

  constructor(name: string, breed: string) {
    super(name);
    this.breed = breed;
  }

  bark(): void {
    console.info(`${this.name} barks`);
  }
}

let protoDog: ProtoDogClass = new ProtoDogClass('Max', 'Labrador');
protoDog.speak();   // Max speaks
protoDog.bark();    // Max barks

// instanceof验证类继承的原型链关系
console.info(`${protoDog instanceof ProtoDogClass}`); // true
console.info(`${protoDog instanceof ProtoAnimalClass}`); // true
// [End class_inheritance_essence]

// ===== interface_multi_implementation =====
// [Start interface_multi_implementation]
// 多继承的替代方案：接口实现
interface IFeatureA {
  methodA(): void;
}

interface IFeatureB {
  methodB(): void;
}

class MultiFeature implements IFeatureA, IFeatureB {
  methodA(): void {
    console.info(`Feature A`);
  }

  methodB(): void {
    console.info(`Feature B`);
  }
}

let multi: MultiFeature = new MultiFeature();
multi.methodA();
multi.methodB();
// [End interface_multi_implementation]

// ===== static_method_call =====
// [Start static_method_call]
class StaticBase {
  public static baseValue: number = 10;

  static baseMethod(): void {
    console.info(`Base static method`);
  }

  static getValue(): number {
    return StaticBase.baseValue;
  }
}

class StaticChild extends StaticBase {
  public static childValue: number = 20;

  // 子类静态方法调用父类静态方法
  static combinedMethod(): void {
    StaticBase.baseMethod();   // 通过父类名调用
    StaticChild.baseMethod();  // 通过子类名调用（继承）
  }

  // 子类静态方法访问父类静态属性
  static getTotalValue(): number {
    return StaticBase.baseValue + StaticChild.childValue;
  }

  // 调用继承的静态方法
  static getInheritedValue(): number {
    return StaticChild.getValue();  // 继承的静态方法
  }

  // 静态方法中可通过super调用父类静态方法
  static callViaSuper(): void {
    super.baseMethod();  // 通过super调用父类静态方法
  }
}

StaticChild.combinedMethod();       // 'Base static method', 'Base static method'
console.info(`${StaticChild.getTotalValue()}`);       // 30
console.info(`${StaticChild.getInheritedValue()}`);   // 10
StaticChild.callViaSuper();         // 'Base static method'

// 静态方法调用规则：
// 通过类名调用静态成员
// 子类名可调用继承的静态成员
// 可通过super调用父类静态方法
// [End static_method_call]

// [Start extends_syntax]
class Parent {
  // 父类成员
}

class Child extends Parent {
  // 子类成员
}
// [End extends_syntax]
