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

// ===== class_basic_definition =====
// [Start class_basic_definition]
// 基本类定义
class Person {
  public name: string;
  public age: number;
  
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
  
  greet(): string {
    return `Hello, I'm ${this.name}`;
  }
}

// 创建实例
let person: Person = new Person('Alice', 25);
console.info(`${person.greet()}`);

// 空类
class EmptyClass {
}

let empty: EmptyClass = new EmptyClass();

// 类作为类型
function processPerson(person: Person): void {
  console.info(`${person.name}`);
}

processPerson(person);
// [End class_basic_definition]

// ===== class_properties_methods_constructor =====
// [Start class_properties_methods_constructor]
class User {
  // 属性
  public id: number;
  public name: string;
  public email: string;
  private password: string;
  
  // 构造函数
  constructor(id: number, name: string, email: string) {
    this.id = id;
    this.name = name;
    this.email = email;
    this.password = '';
  }
  
  // 方法
  getInfo(): string {
    return `User ${this.id}: ${this.name} (${this.email})`;
  }
  
  setPassword(password: string): void {
    this.password = password;
  }
  
  validate(): boolean {
    return this.id > 0 && this.name.length > 0;
  }
}

let user: User = new User(1, 'Alice', 'alice@example.com');
console.info(`${user.getInfo()}`);
// [End class_properties_methods_constructor]

// ===== static_properties =====
// [Start static_properties]
class Counter {
  // 实例属性
  public count: number = 0;
  
  // 静态属性
  public static totalInstances: number = 0;
  
  constructor() {
    Counter.totalInstances++;
  }
  
  increment(): void {
    this.count++;
  }
}

let counter1: Counter = new Counter();
let counter2: Counter = new Counter();

console.info(`${counter1.count.toString()}`);  // 0
console.info(`${Counter.totalInstances.toString()}`);  // 2

// 静态属性通过类名访问
console.info(`${Counter.totalInstances.toString()}`);

// 实例属性通过实例访问
counter1.increment();
console.info(`${counter1.count.toString()}`);  // 1
console.info(`${counter2.count.toString()}`);  // 0
// [End static_properties]

// ===== instance_methods =====
// [Start instance_methods]
class Calculator {
  public value: number = 0;
  
  // 实例方法
  add(n: number): void {
    this.value += n;
  }
  
  subtract(n: number): void {
    this.value -= n;
  }
  
  multiply(n: number): void {
    this.value *= n;
  }
  
  divide(n: number): void {
    if (n !== 0) {
      this.value /= n;
    }
  }
  
  getValue(): number {
    return this.value;
  }
  
  reset(): void {
    this.value = 0;
  }
}

let calc: Calculator = new Calculator();
calc.add(10);
calc.multiply(2);
console.info(`${calc.getValue().toString()}`);  // 20

// 方法链式调用（需返回this）
class Builder {
  private data: string = '';
  
  add(text: string): Builder {
    this.data += text;
    return this;
  }
  
  addLine(text: string): Builder {
    this.data += text + '\n';
    return this;
  }
  
  build(): string {
    return this.data;
  }
}

let result: string = new Builder()
  .add('Hello')
  .add(' ')
  .add('World')
  .build();
console.info(`${result}`);  // 'Hello World'
// [End instance_methods]

// ===== method_overloading =====
// [Start method_overloading]
class DataProcessor {
  // 方法重载签名
  process(data: string): string;
  process(data: number): number;
  process(data: string | number): string | number {
    if (typeof data === 'string') {
      return data.toUpperCase();
    }
    return data * 2;
  }
  
  // 多参数重载
  format(value: number): string;
  format(value: number, precision: number): string;
  format(value: number, precision?: number): string {
    if (precision !== undefined) {
      return value.toFixed(precision);
    }
    return value.toString();
  }
}

let processor: DataProcessor = new DataProcessor();

console.info(`${processor.process('hello')}`);  // 'HELLO'
console.info(`${processor.process(5)}`);        // 10

console.info(`${processor.format(3.14159)}`);       // '3.14159'
console.info(`${processor.format(3.14159, 2)}`);    // '3.14'
// [End method_overloading]

// ===== inheritance_basic =====
// [Start inheritance_basic]
class Animal {
  public name: string;
  
  constructor(name: string) {
    this.name = name;
  }
  
  speak(): string {
    return `${this.name} makes a sound`;
  }
}

class Dog extends Animal {
  public breed: string;
  
  constructor(name: string, breed: string) {
    super(name);  // 必须先调用父类构造函数
    this.breed = breed;
  }
  
  speak(): string {
    return `${this.name} barks`;
  }
}

let dog: Dog = new Dog('Max', 'Labrador');
console.info(dog.speak());  // 'Max barks'

class Vehicle {
  public brand: string;
  
  constructor(brand: string) {
    this.brand = brand;
  }
}

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

let car: Car = new Car('Toyota', 'Camry');
console.info(car.getInfo());  // 'Toyota Camry'
// [End inheritance_basic]

// ===== optional_properties =====
// [Start optional_properties]
class UserProfile {
  public name: string;
  public age?: number;          // 可选属性
  public email?: string;
  public bio?: string;
  
  constructor(name: string) {
    this.name = name;
    // 可选属性不必须初始化
  }
  
  setAge(age: number): void {
    this.age = age;
  }
  
  setEmail(email: string): void {
    this.email = email;
  }
  
  getAge(): number {
    return this.age ?? 0;
  }
  
  hasEmail(): boolean {
    return this.email !== undefined;
  }
}

let profile: UserProfile = new UserProfile('Alice');
profile.setAge(25);
console.info(`${profile.getAge()}`);  // 25

// 可选属性访问需要检查
if (profile.email !== undefined) {
  console.info(`${profile.email}`);
}

// 使用可选链
let bio: string | undefined = profile.bio;
console.info(`${bio}`);  // undefined
// [End optional_properties]

// ===== inheritance_chain =====
// [Start inheritance_chain]
class Shape {
  public color: string;
  
  constructor(color: string) {
    this.color = color;
  }
  
  draw(): void {
    console.info(`Drawing shape with color ${this.color}`);
  }
}

class ChainCircle extends Shape {
  public radius: number;
  
  constructor(color: string, radius: number) {
    super(color);
    this.radius = radius;
  }
  
  draw(): void {
    console.info(`Drawing chainCircle with radius ${this.radius}`);
  }
  
  getArea(): number {
    return Math.PI * this.radius * this.radius;
  }
}

let chainCircle: ChainCircle = new ChainCircle('red', 5);
chainCircle.draw();

class ChainRectangle extends Shape {
  public width: number;
  public height: number;
  
  constructor(color: string, width: number, height: number) {
    super(color);
    this.width = width;
    this.height = height;
  }
  
  draw(): void {
    console.info(`Drawing rectangle ${this.width}x${this.height}`);
  }
}

// 继承链
let chainRect: ChainRectangle = new ChainRectangle('blue', 10, 20);
chainRect.draw();
// [End inheritance_chain]

// ===== method_override =====
// [Start method_override]
class Base {
  method(): void {
    console.info('Base method');
  }
}

class Derived extends Base {
  // TypeScript使用override标记（可选）
  method(): void {
    console.info('Derived method');
  }
}

let derived: Derived = new Derived();
derived.method();  // 'Derived method'

// 重写带返回值的方法
class OverrideCalculator {
  calculate(a: number, b: number): number {
    return a + b;
  }
}

class AdvancedCalculator extends OverrideCalculator {
  calculate(a: number, b: number): number {
    return a * b;  // 改变计算逻辑
  }
}

let overrideCalc: OverrideCalculator = new AdvancedCalculator();
console.info(`${overrideCalc.calculate(3, 4)}`);  // 12

// 重写时保持签名一致
class Logger {
  log(message: string): void {
    console.info(`${message}`);
  }
}

class FileLogger extends Logger {
  log(message: string): void {  // 必须保持参数和返回类型一致
    // 写入文件
    console.info(`[File] ${message}`);
  }
}
// [End method_override]

// ===== super_keyword =====
// [Start super_keyword]
class Parent {
  greet(): string {
    return 'Hello from Parent';
  }
  
  process(): void {
    console.info('Parent processing');
  }
}

class Child extends Parent {
  greet(): string {
    return 'Hello from Child';
  }
  
  greetWithParent(): string {
    return `${super.greet()} and ${this.greet()}`;
  }
  
  process(): void {
    super.process();  // 调用父类方法
    console.info('Child processing');
  }
}

let child: Child = new Child();
console.info(`${child.greetWithParent()}`);  
// 'Hello from Parent and Hello from Child'

child.process();
// 输出：Parent processing, Child processing

// super在构造函数中
class KwBase {
  protected value: number;
  
  constructor(value: number) {
    this.value = value;
  }
}

class Extended extends KwBase {
  public multiplier: number;
  
  constructor(value: number, multiplier: number) {
    super(value);  // 必须先调用super
    this.multiplier = multiplier;
  }
  
  getCalculated(): number {
    return this.value * this.multiplier;
  }
}
// [End super_keyword]

// ===== object_reference_copy =====
// [Start object_reference_copy]
class CopyPerson {
  public name: string;
  public age: number;
  
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

let person1: CopyPerson = new CopyPerson('Alice', 25);
let person2: CopyPerson = person1;  // 引用赋值，指向同一对象

person2.name = 'Bob';
console.info(`${person1.name}`);  // 'Bob'（person1也被修改）

// 深拷贝需要手动实现
function copyPerson(source: CopyPerson): CopyPerson {
  return new CopyPerson(source.name, source.age);
}

let person3: CopyPerson = copyPerson(person1);
person3.name = 'Charlie';
console.info(`${person1.name}`);  // 'Bob'（不影响person1）
console.info(`${person3.name}`);  // 'Charlie'

// 实现拷贝方法
class CopyUser {
  public id: number;
  public name: string;
  
  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }
  
  copy(): CopyUser {
    return new CopyUser(this.id, this.name);
  }
}

let user1: CopyUser = new CopyUser(1, 'Alice');
let user2: CopyUser = user1.copy();
// [End object_reference_copy]

// ===== object_comparison =====
// [Start object_comparison]
class Point {
  public x: number;
  public y: number;
  
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

let p1: Point = new Point(1, 2);
let p2: Point = new Point(1, 2);
let p3: Point = p1;

// 引用比较
console.info(`${p1 === p2}`);  // false（不同对象）
console.info(`${p1 === p3}`);  // true（同一引用）

// 内容比较需自定义方法
class PointWithEquals {
  public x: number;
  public y: number;
  
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
  
  equals(other: PointWithEquals): boolean {
    return this.x === other.x && this.y === other.y;
  }
}

let pe1: PointWithEquals = new PointWithEquals(1, 2);
let pe2: PointWithEquals = new PointWithEquals(1, 2);

console.info(`${pe1 === pe2}`);      // false
console.info(`${pe1.equals(pe2)}`);  // true
// [End object_comparison]

// ===== class_vs_interface =====
// [Start class_vs_interface]
// 使用类：需要封装数据和行为的场景
class Order {
  public id: number;
  public items: string[];
  public total: number;
  
  constructor(id: number) {
    this.id = id;
    this.items = [];
    this.total = 0;
  }
  
  addItem(item: string, price: number): void {
    this.items.push(item);
    this.total += price;
  }
  
  removeItem(item: string, price: number): void {
    let index: number = this.items.indexOf(item);
    if (index >= 0) {
      this.items.splice(index, 1);
      this.total -= price;
    }
  }
  
  getTotal(): number {
    return this.total;
  }
}

// 使用接口：只需数据结构的场景
interface Product {
  id: number;
  name: string;
  price: number;
}

let product: Product = { id: 1, name: 'Item', price: 100 };

// 类vs对象字面量
// 类：可复用、有方法、可继承
// 对象字面量：简单数据、一次性使用
// [End class_vs_interface]

// ===== encapsulation_practice =====
// [Start encapsulation_practice]
// 封装内部状态，公开接口
class BankAccount {
  private balance: number = 0;
  private accountNumber: string;
  
  constructor(accountNumber: string) {
    this.accountNumber = accountNumber;
  }
  
  // 公开读取接口
  getBalance(): number {
    return this.balance;
  }
  
  getAccountNumber(): string {
    return this.accountNumber;
  }
  
  // 公开操作接口
  deposit(amount: number): boolean {
    if (amount > 0) {
      this.balance += amount;
      return true;
    }
    return false;
  }
  
  withdraw(amount: number): boolean {
    if (amount > 0 && this.balance >= amount) {
      this.balance -= amount;
      return true;
    }
    return false;
  }
}

let account: BankAccount = new BankAccount('ACC-001');
account.deposit(100);
account.withdraw(50);
console.info(`${account.getBalance()}`);  // 50

// 使用protected供子类使用
class BestLogger {
  protected logs: string[] = [];
  
  log(message: string): void {
    this.logs.push(message);
  }
  
  getLogs(): string[] {
    return [...this.logs];
  }
}

class AdvancedLogger extends BestLogger {
  logWithTimestamp(message: string): void {
    let timestamp: string = new Date().toISOString();
    this.logs.push(`${timestamp}: ${message}`);  // 可访问protected
  }
}

// 使用readonly保护不变数据
class Configuration {
  public readonly appName: string;
  public readonly maxConnections: number;
  
  constructor(appName: string, maxConnections: number) {
    this.appName = appName;
    this.maxConnections = maxConnections;
  }
}
// [End encapsulation_practice]

// ===== base_class_pattern =====
// [Start base_class_pattern]
class LoggedBase {
  private className: string;

  constructor(className: string) {
    this.className = className;
    console.info(`Creating ${className}`);
  }

  protected log(methodName: string): void {
    console.info(`Calling ${this.className}.${methodName}`);
  }
}

class UserService extends LoggedBase {
  constructor() {
    super('UserService');
  }

  getData(): string {
    this.log('getData');
    return 'data';
  }
}

let service: UserService = new UserService();
console.info(`${service.getData()}`);
// [End base_class_pattern]

// ===== observable_property =====
// [Start observable_property]
class ObservableCounter {
  private value: number = 0;

  get count(): number {
    return this.value;
  }

  set count(newValue: number) {
    if (this.value !== newValue) {
      this.value = newValue;
      console.info(`Counter changed to ${newValue}`);
    }
  }
}

let counter: ObservableCounter = new ObservableCounter();
counter.count = 1;
// [End observable_property]

// ===== single_responsibility_principle =====
// [Start single_responsibility_principle]
// 每个类只做一件事
class UserValidator {
  validate(user: PrincipleUser): boolean {
    return this.validateName(user.name) &&
           this.validateEmail(user.email);
  }
  
  private validateName(name: string): boolean {
    return name.length > 0;
  }
  
  private validateEmail(email: string): boolean {
    return email.includes('@');
  }
}

class UserRepository {
  save(user: PrincipleUser): void {
    // 保存到数据库
  }
  
  find(id: number): PrincipleUser | null {
    // 从数据库查找
    return null;
  }
}

class PrincipleUserService {
  private validator: UserValidator;
  private repository: UserRepository;
  
  constructor() {
    this.validator = new UserValidator();
    this.repository = new UserRepository();
  }
  
  createUser(name: string, email: string): PrincipleUser | null {
    let user: PrincipleUser = { name: name, email: email };
    if (this.validator.validate(user)) {
      this.repository.save(user);
      return user;
    }
    return null;
  }
}

interface PrincipleUser {
  name: string;
  email: string;
}
// [End single_responsibility_principle]

// ===== encapsulation_private_methods =====
// [Start encapsulation_private_methods]
// 公开必要接口，隐藏内部实现
class Cache {
  private data: Map<string, string> = new Map();
  private maxSize: number = 100;
  
  // 公开接口
  get(key: string): string | undefined {
    return this.data.get(key);
  }
  
  set(key: string, value: string): void {
    this.ensureCapacity();
    this.data.set(key, value);
  }
  
  clear(): void {
    this.data.clear();
  }
  
  size(): number {
    return this.data.size;
  }
  
  // 私有辅助方法
  private ensureCapacity(): void {
    if (this.data.size >= this.maxSize) {
      // 清理策略
      this.evictOldest();
    }
  }
  
  private evictOldest(): void {
    // 实现
  }
}
// [End encapsulation_private_methods]

// ===== immutable_objects =====
// [Start immutable_objects]
class ImmutablePoint {
  public readonly x: number;
  public readonly y: number;
  
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
  
  // 返回新实例而非修改
  translate(dx: number, dy: number): ImmutablePoint {
    return new ImmutablePoint(this.x + dx, this.y + dy);
  }
}

let point: ImmutablePoint = new ImmutablePoint(1, 2);
let newPoint: ImmutablePoint = point.translate(5, 3);
console.info(`${point.x}`);      // 1（不变）
console.info(`${newPoint.x}`);   // 6（新实例）
// [End immutable_objects]

// ===== composition_over_inheritance =====
// [Start composition_over_inheritance]
// 使用组合
class Engine {
  start(): void { console.info('Engine started'); }
  stop(): void { console.info('Engine stopped'); }
}

class Wheels {
  rotate(): void { console.info('Wheels rotating'); }
}

class ComposeCar {
  private engine: Engine;
  private wheels: Wheels;
  
  constructor() {
    this.engine = new Engine();
    this.wheels = new Wheels();
  }
  
  start(): void {
    this.engine.start();
    this.wheels.rotate();
  }
  
  stop(): void {
    this.engine.stop();
  }
}

let composeCar: ComposeCar = new ComposeCar();
composeCar.start();
// [End composition_over_inheritance]

// ===== inheritance_hierarchy =====
// [Start inheritance_hierarchy]
// 反例：深层继承链
class A {}
class B extends A {}
class C extends B {}
class D extends C {}

// 推荐：扁平结构
class BaseFeature {
  feature(): void {}
}

class CombinedFeature {
  private feature1: Feature1;
  private feature2: Feature2;
  
  constructor() {
    this.feature1 = new Feature1();
    this.feature2 = new Feature2();
  }
}

class Feature1 {
  execute(): void {}
}

class Feature2 {
  execute(): void {}
}
// [End inheritance_hierarchy]

// ===== implementing_interfaces =====
// [Start implementing_interfaces]
// 接口定义行为契约
interface Drawable {
  draw(): void;
}

interface Resizable {
  resize(width: number, height: number): void;
}

class ImplShape implements Drawable, Resizable {
  draw(): void {
    console.info('Drawing shape');
  }
  
  resize(width: number, height: number): void {
    console.info(`Resizing to ${width}x${height}`);
  }
}
// [End implementing_interfaces]

let globalLogUpdate: ((msg: string, isError: boolean) => void) | undefined;

function testClassDefinition(): void {
  let cdPerson: Person = new Person('Alice', 25);
  let cdGreet: string = cdPerson.greet();
  let logMsg = 'name: ' + cdPerson.name + '\nage: ' + cdPerson.age + '\ngreet: ' + cdGreet;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

function testStaticProperties(): void {
  let spCounter: Counter = new Counter();
  spCounter.increment();
  let spCount: number = spCounter.count;
  let spTotal: number = Counter.totalInstances;
  let logMsg = 'count: ' + spCount + '\ntotalInstances: ' + spTotal;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

function testGetterSetter(): void {
  let gsCircle: ChainCircle = new ChainCircle('red', 5);
  
  let gsRadius: number = gsCircle.radius;
  let logMsg = 'radius: ' + gsRadius;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

function testInheritance(): void {
  let ihDog: Dog = new Dog('Max', 'Labrador');
  let ihSpeak: string = ihDog.speak();
  let logMsg = 'name: ' + ihDog.name + '\nbreed: ' + ihDog.breed + '\nspeak: ' + ihSpeak;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

@Entry
@Component
struct ClassesPage {
  @State currentState: string | ResourceStr = $r('app.string.Uninitialized');
  @State logMessages: string | ResourceStr = $r('app.string.No_log_information_available');

  aboutToAppear(): void {
    globalLogUpdate = (msg, isError) => this.updateLogInfo(msg, isError);
  }

  updateLogInfo(msg: string, isError: boolean): void {
    const timestamp = new Date().toLocaleTimeString();
    const prefix = isError ? '[ERROR]' : '[INFO]';
    this.logMessages = `[${timestamp}] ${prefix} ${msg}`;
  }

  build() {
    Scroll() {
      Column() {
        Column() {
          Text($r('app.string.Realtime_status_information'))
            .fontSize(18)
            .fontWeight(600)
            .margin({ bottom: 12 })

          Column() {
            Text($r('app.string.Current_status'))
              .fontSize(14)
              .fontWeight(600)
              .margin({ bottom: 8 })
            Text(this.currentState)
              .fontSize(14)
              .fontColor('#007DFF')
              .width('100%')
              .padding(10)
              .backgroundColor('#F0F0F0')
              .borderRadius(8)
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 12 })

          Column() {
            Text($r('app.string.Log_information'))
              .fontSize(14)
              .fontWeight(600)
              .margin({ bottom: 8 })
            Scroll() {
              Text(this.logMessages)
                .fontSize(12)
                .fontColor('#52C41A')
                .width('100%')
                .padding(10)
                .backgroundColor('#F0F0F0')
                .borderRadius(8)
            }
            .width('100%')
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 10 })
        }
        .width('100%')
        .padding(18)
        .backgroundColor(Color.White)
        .borderRadius(8)
        .margin({ bottom: 16 })

        Column() {
          Text($r('app.string.Test_Classes_Definition')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testClassDefinition();
          this.currentState = $r('app.string.Test_Classes_Definition_finish');
        })

        Column() {
          Text($r('app.string.Test_Classes_StaticProperties')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testStaticProperties();
          this.currentState = $r('app.string.Test_Classes_StaticProperties_finish');
        })

        Column() {
          Text($r('app.string.Test_Classes_GetterSetter')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testGetterSetter();
          this.currentState = $r('app.string.Test_Classes_GetterSetter_finish');
        })

        Column() {
          Text($r('app.string.Test_Classes_Inheritance')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testInheritance();
          this.currentState = $r('app.string.Test_Classes_Inheritance_finish');
        })
      }
      .height('100%')
      .width('100%')
      .backgroundColor('#F1F3F5')
      .padding(16);
    }
  }
}

// [Start private_field_alternative]
class PrivateFieldDog {
  private barkAmount: number = 0;
  public personality: string = 'happy';

  bark(): void {
    this.barkAmount++;
  }

  getBarkCount(): number {
    return this.barkAmount;
  }
}

let pfDog: PrivateFieldDog = new PrivateFieldDog();
pfDog.bark();
pfDog.bark();
console.info(`${pfDog.getBarkCount().toString()}`);  // 2
// [End private_field_alternative]

// [Start runtime_this_issue]
class ThisExample {
  public name: string = 'MyClass';

  getName(): string {
    return this.name;
  }
}

let thisEx: ThisExample = new ThisExample();
console.info(`${thisEx.getName()}`);  // MyClass

// 赋值给变量后调用，this可能丢失
let thisG = thisEx.getName;
// [End runtime_this_issue]

// [Start arrow_function_this]
class ArrowThisHandler {
  private name: string = 'handler';

  public handle = (): void => {
    console.info(`${this.name}`);
  };
}

let arrowHandler: ArrowThisHandler = new ArrowThisHandler();
let arrowH = arrowHandler.handle;
arrowH();  // handler（this正确绑定）
// [End arrow_function_this]

// [Start ctor_signature_alternative]
class CtorPoint {
  public x: number;
  public y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

function moveCtorRight(point: CtorPoint): void {
  point.x += 5;
}

let ctorP: CtorPoint = new CtorPoint(3, 4);
moveCtorRight(ctorP);
console.info(`${ctorP.x.toString()}`);  // 8
// [End ctor_signature_alternative]

// [Start static_block]
class TsStaticConfig {
  private static count: number = 0;

  static {
    try {
      let data: string[] = ['a', 'b', 'c'];
      TsStaticConfig.count = data.length;
    } catch (e) {
      TsStaticConfig.count = 0;
    }
  }
}
// [End static_block]

// [Start static_block_alternative]
class StaticBlockConfig {
  private static count: number = 0;
  private static initialized: boolean = false;

  static initialize(): void {
    if (StaticBlockConfig.initialized) {
      return;
    }
    try {
      let data: string[] = ['a', 'b', 'c'];
      StaticBlockConfig.count = data.length;
      StaticBlockConfig.initialized = true;
    } catch (e) {
      StaticBlockConfig.count = 0;
      StaticBlockConfig.initialized = true;
    }
  }

  static getCount(): number {
    return StaticBlockConfig.count;
  }
}

StaticBlockConfig.initialize();
console.info(`${StaticBlockConfig.getCount().toString()}`);  // 3
// [End static_block_alternative]

// [Start prototype_inheritance]
// 类继承本质是原型继承
class ProtoBase {
  public value: number = 10;
  
  getValue(): number {
    return this.value;
  }
}

class ProtoDerived extends ProtoBase {
  public multiplier: number = 2;
  
  getCalculated(): number {
    return this.getValue() * this.multiplier;
  }
}

let protoDerived: ProtoDerived = new ProtoDerived();

console.info(`${protoDerived.value.toString()}`);         // 10（继承属性）
console.info(`${protoDerived.getValue().toString()}`);    // 10（继承方法）
console.info(`${protoDerived.getCalculated().toString()}`); // 20（自身方法）

// instanceof检查原型链
console.info(`${(protoDerived instanceof ProtoDerived).toString()}`);  // true
console.info(`${(protoDerived instanceof ProtoBase).toString()}`);     // true
console.info(`${(protoDerived instanceof Object).toString()}`);   // true
// [End prototype_inheritance]

// [Start prototype_chain]
class PcGrandParent {
  methodA(): void {
    console.info('GrandParent A');
  }
}

class PcParent extends PcGrandParent {
  methodB(): void {
    console.info('Parent B');
  }
}

class PcChild extends PcParent {
  methodC(): void {
    console.info('Child C');
  }
}

let pcChild: PcChild = new PcChild();

// 原型链查找
pcChild.methodA();  // GrandParent（继承）
pcChild.methodB();  // Parent（继承）
pcChild.methodC();  // Child（自身）

// 方法覆盖
class PcParent2 {
  method(): void {
    console.info('Parent method');
  }
}

class PcChild2 extends PcParent2 {
  method(): void {
    console.info('Child method');
    super.method();
  }
}

let pcChild2: PcChild2 = new PcChild2();
pcChild2.method();
// [End prototype_chain]




// ===== constructor_optional_params =====
// [Start constructor_optional_params]
class OptionalCtorPoint {
  public x: number;
  public y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }

  static create(x?: number, y?: number): OptionalCtorPoint {
    return new OptionalCtorPoint(x ?? 0, y ?? 0);
  }
}

let ctorPoint1: OptionalCtorPoint = new OptionalCtorPoint(10, 20);
let ctorPoint2: OptionalCtorPoint = OptionalCtorPoint.create();
let ctorPoint3: OptionalCtorPoint = OptionalCtorPoint.create(5);
// [End constructor_optional_params]

// ===== static_factory_methods =====
// [Start static_factory_methods]
class ColorValue {
  public red: number;
  public green: number;
  public blue: number;

  constructor(red: number, green: number, blue: number) {
    this.red = red;
    this.green = green;
    this.blue = blue;
  }

  static fromRGB(r: number, g: number, b: number): ColorValue {
    return new ColorValue(r, g, b);
  }

  static fromHex(hex: string): ColorValue {
    let r: number = Number.parseInt(hex.substring(1, 3), 16);
    let g: number = Number.parseInt(hex.substring(3, 5), 16);
    let b: number = Number.parseInt(hex.substring(5, 7), 16);
    return new ColorValue(r, g, b);
  }

  static fromName(name: string): ColorValue {
    switch (name) {
      case 'red':
        return new ColorValue(255, 0, 0);
      case 'green':
        return new ColorValue(0, 255, 0);
      case 'blue':
        return new ColorValue(0, 0, 255);
      default:
        return new ColorValue(0, 0, 0);
    }
  }
}

let cvColor1: ColorValue = ColorValue.fromRGB(255, 128, 0);
let cvColor2: ColorValue = ColorValue.fromHex('#FF8000');
let cvColor3: ColorValue = ColorValue.fromName('red');
// [End static_factory_methods]

// ===== interface_multi_implementation =====
// [Start interface_multi_implementation]
interface MultiIA {
  methodA(): void;
}

interface MultiIB {
  methodB(): void;
}

class MultiC implements MultiIA, MultiIB {
  methodA(): void {}
  methodB(): void {}
}
// [End interface_multi_implementation]

// ===== single_inheritance_combination =====
// [Start single_inheritance_combination]
class CombinedBase {
  aMethod(): void {
    console.info('A method');
  }

  bMethod(): void {
    console.info('B method');
  }
}

class SingleDerived extends CombinedBase {
  cMethod(): void {
    console.info('C method');
  }
}

let siObj: SingleDerived = new SingleDerived();
siObj.aMethod();
siObj.bMethod();
siObj.cMethod();
// [End single_inheritance_combination]

// ===== nested_type_grouping =====
// [Start nested_type_grouping]
class ProcessorResult {
  public success: boolean = false;
  public data: string = '';
  public error: string = '';

  isSuccess(): boolean {
    return this.success;
  }
}

class NestedDataProcessor {
  process(input: string): ProcessorResult {
    let result: ProcessorResult = new ProcessorResult();
    if (input.length > 0) {
      result.success = true;
      result.data = input.trim();
    } else {
      result.error = 'Empty input';
    }
    return result;
  }
}

let ntProcessor: NestedDataProcessor = new NestedDataProcessor();
let ntResult: ProcessorResult = ntProcessor.process('hello');
console.info(`${ntResult.isSuccess()}`); // true
// [End nested_type_grouping]

// ===== nested_type_external_instance =====
// [Start nested_type_external_instance]
class GroupSnapshot {
  private ownerValue: number;

  constructor(ownerValue: number) {
    this.ownerValue = ownerValue;
  }

  read(): number {
    return this.ownerValue;
  }
}

class CounterGroup {
  public value: number = 0;

  createSnapshot(): GroupSnapshot {
    return new GroupSnapshot(this.value);
  }
}

let neGroup: CounterGroup = new CounterGroup();
neGroup.value = 10;
let neSnapshot: GroupSnapshot = neGroup.createSnapshot();
console.info(`${neSnapshot.read()}`); // 10
// [End nested_type_external_instance]

// ===== class_decorator_usage =====
// [Start class_decorator_usage]
function logged(constructor: Function): void {
  console.info(`Class ${constructor.name} created`);
}

@logged
class DecoService {
  public name: string = 'default';
}

let decoService: DecoService = new DecoService();
// 控制台输出：Class DecoService created
// [End class_decorator_usage]

// ===== method_decorator_usage =====
// [Start method_decorator_usage]
function logMethod(target: Object, propertyKey: string, descriptor: PropertyDescriptor): void {
  console.info(`Method ${propertyKey} decorated`);
}

class DecoCalculator {
  @logMethod
  add(a: number, b: number): number {
    return a + b;
  }
}

let decoCalc: DecoCalculator = new DecoCalculator();
console.info(`${decoCalc.add(1, 2)}`); // 3
// [End method_decorator_usage]

// ===== accessor_decorator_usage =====
// [Start accessor_decorator_usage]
function logAccessor(target: Object, propertyKey: string, descriptor: PropertyDescriptor): void {
  console.info(`Accessor ${propertyKey} decorated`);
}

class DecoCounter {
  private _count: number = 0;

  @logAccessor
  get count(): number {
    return this._count;
  }

  set count(value: number) {
    this._count = value;
  }
}

let decoCounter: DecoCounter = new DecoCounter();
decoCounter.count = 5;
console.info(`${decoCounter.count}`); // 5
// [End accessor_decorator_usage]

// ===== property_decorator_usage =====
// [Start property_decorator_usage]
function logProperty(target: Object, propertyKey: string): void {
  console.info(`Property ${propertyKey} decorated`);
}

class DecoConfig {
  @logProperty
  public name: string = 'default';
}

let decoConfig: DecoConfig = new DecoConfig();
console.info(`${decoConfig.name}`); // default
// [End property_decorator_usage]

// ===== parameter_decorator_usage =====
// [Start parameter_decorator_usage]
function logParam(target: Object, propertyKey: string, parameterIndex: number): void {
  console.info(`Param ${parameterIndex} of ${propertyKey} decorated`);
}

class DecoProcessor {
  process(@logParam input: string): string {
    return input.toUpperCase();
  }
}

let decoProc: DecoProcessor = new DecoProcessor();
console.info(`${decoProc.process('hello')}`); // HELLO
// [End parameter_decorator_usage]

// ===== decorator_factory_usage =====
// [Start decorator_factory_usage]
function format(prefix: string): (constructor: Function) => void {
  return (constructor: Function): void => {
    console.info(`${prefix} ${constructor.name}`);
  };
}

@format('Created')
class DecoFactoryService {
  public id: number = 0;
}

let decoFactoryService: DecoFactoryService = new DecoFactoryService();
// 控制台输出：Created DecoFactoryService
// [End decorator_factory_usage]

// ===== this_parameter_usage =====
// [Start this_parameter_usage]
class ThisCounter {
  public count: number = 0;
  increment(this: ThisCounter): void {
    this.count++;
  }
}

let thisCounter: ThisCounter = new ThisCounter();
thisCounter.increment();
console.info(`${thisCounter.count}`); // 1
// [End this_parameter_usage]

// ===== explicit_property_declaration =====
// [Start explicit_property_declaration]
class ExplicitPoint {
  public x: number;
  public y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

let epPoint: ExplicitPoint = new ExplicitPoint(3, 4);
console.info(`${epPoint.x}, ${epPoint.y}`); // 3, 4
// [End explicit_property_declaration]

// ===== class_declaration_alternative =====
// [Start class_declaration_alternative]
class DeclaredClass<T> {
  public content: T;

  constructor(content: T) {
    this.content = content;
  }
}

let dcInstance: DeclaredClass<string> = new DeclaredClass('hello');
console.info(`${dcInstance.content}`); // hello
// [End class_declaration_alternative]

// ===== mixin_composition_alternative =====
// [Start mixin_composition_alternative]
interface MixinLoggable {
  log(message: string): void;
}

class MixinConsoleLogger implements MixinLoggable {
  log(message: string): void {
    console.info(`[LOG] ${message}`);
  }
}

class MixinService {
  public logger: MixinLoggable;

  constructor(logger: MixinLoggable) {
    this.logger = logger;
  }

  processData(data: string): void {
    this.logger.log(`Processing: ${data}`);
  }
}

let mixinService: MixinService = new MixinService(new MixinConsoleLogger());
mixinService.processData('test'); // [LOG] Processing: test
// [End mixin_composition_alternative]

// ===== mixin_interface_alternative =====
// [Start mixin_interface_alternative]
interface MixinDisposable {
  dispose(): void;
}

interface MixinSerializable {
  serialize(): string;
}

class MixinResource implements MixinDisposable, MixinSerializable {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }

  dispose(): void {
    console.info(`Disposing ${this.name}`);
  }

  serialize(): string {
    return JSON.stringify(this.name);
  }
}

let mixinResource: MixinResource = new MixinResource('config');
console.info(`${mixinResource.serialize()}`); // "config"
mixinResource.dispose(); // Disposing config
// [End mixin_interface_alternative]
