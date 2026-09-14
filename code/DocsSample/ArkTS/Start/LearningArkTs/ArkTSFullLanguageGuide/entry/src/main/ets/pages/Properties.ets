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

// ===== property_definition_basics =====
// [Start property_definition_basics]
class Person {
  // 属性定义：存储数据
  public name: string;         // 姓名属性
  public age: number;          // 年龄属性
  public email?: string;       // 可选属性
  
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
  
  // 属性的作用：封装数据，提供访问接口
  getInfo(): string {
    return `${this.name}, ${this.age} years old`;
  }
}

let person: Person = new Person('Alice', 25);
console.info(`${person.name}`);  // 'Alice'
console.info(`${person.age.toString()}`);   // 25

// 属性用于存储状态
class Counter {
  public count: number = 0;  // 存储计数状态
  
  increment(): void {
    this.count++;  // 通过属性管理状态
  }
  
  getCount(): number {
    return this.count;
  }
}

let counter: Counter = new Counter();
counter.increment();
console.info(`${counter.getCount().toString()}`);  // 1
// [End property_definition_basics]

// ===== instance_vs_static_properties =====
// [Start instance_vs_static_properties]
class Configuration {
  // 实例属性：每个实例独立拥有
  public name: string;
  public value: number;
  
  // 静态属性：所有实例共享
  public static version: string = '1.0.0';
  public static instanceCount: number = 0;
  
  constructor(name: string, value: number) {
    this.name = name;
    this.value = value;
    Configuration.instanceCount++;
  }
  
  // 实例方法访问实例属性
  getInfo(): string {
    return `${this.name}: ${this.value}`;
  }
  
  // 静态方法访问静态属性
  static getVersion(): string {
    return Configuration.version;
  }
  
  static getInstanceCount(): number {
    return Configuration.instanceCount;
  }
}

let config1: Configuration = new Configuration('A', 10);
let config2: Configuration = new Configuration('B', 20);

// 实例属性独立
console.info(`${config1.name}`);  // 'A'
console.info(`${config2.name}`);  // 'B'

// 静态属性共享
console.info(`${Configuration.version}`);       // '1.0.0'
console.info(`${Configuration.instanceCount}`); // 2

// 实例通过this访问实例属性
// 静态通过类名访问静态属性
// [End instance_vs_static_properties]

// ===== property_initialization_methods =====
// [Start property_initialization_methods]
class User {
  // 声明时初始化
  public id: number = 0;
  public name: string = '';
  public active: boolean = true;
  
  // 构造函数中初始化
  constructor(id?: number, name?: string) {
    if (id !== undefined) {
      this.id = id;
    }
    if (name !== undefined) {
      this.name = name;
    }
  }
  
  // 延迟初始化
  public email: string | null = null;
  
  setEmail(email: string): void {
    this.email = email;  // 延迟赋值
  }
}

let user1: User = new User();
console.info(`${user1.id}`);    // 0
console.info(`${user1.name}`);  // ''

let user2: User = new User(1, 'Alice');
console.info(`${user2.id}`);    // 1
console.info(`${user2.name}`);  // 'Alice'

// 延迟初始化
user2.setEmail('alice@example.com');
console.info(`${user2.email}`);  // 'alice@example.com'
// [End property_initialization_methods]

// ===== getter_setter_usage =====
// [Start getter_setter_usage]
class Circle {
  private _radius: number = 0;
  
  // getter：获取计算值
  get radius(): number {
    return this._radius;
  }
  
  // setter：设置值并验证
  set radius(value: number) {
    if (value >= 0) {
      this._radius = value;
    }
  }
  
  // 计算属性：基于其他属性计算
  get area(): number {
    return Math.PI * this._radius * this._radius;
  }
  
  get diameter(): number {
    return this._radius * 2;
  }
  
  get circumference(): number {
    return 2 * Math.PI * this._radius;
  }
}

let circle: Circle = new Circle();

// 通过setter设置
circle.radius = 5;
console.info(`${circle.radius}`);      // 5

// 计算属性自动更新
console.info(`${circle.area}`);        // ~78.54
console.info(`${circle.diameter}`);    // 10
console.info(`${circle.circumference}`); // ~31.42

// setter有验证逻辑
circle.radius = -5;  // 无效，不设置
console.info(`${circle.radius}`);      // 5（保持原值）
// [End getter_setter_usage]

// ===== stored_vs_computed_properties =====
// [Start stored_vs_computed_properties]
class Temperature {
  // 存储属性：直接存储值
  public celsius: number = 0;
  
  // 计算属性：基于存储属性计算
  get fahrenheit(): number {
    return this.celsius * 9 / 5 + 32;
  }
  
  set fahrenheit(value: number) {
    this.celsius = (value - 32) * 5 / 9;
  }
  
  // 存储属性：需要存储空间
  // 计算属性：无需存储空间，动态计算
  
  // 存储属性：直接赋值
  // 计算属性：通过getter/setter
}

let temp: Temperature = new Temperature();

// 设置存储属性
temp.celsius = 25;
console.info(`${temp.celsius}`);      // 25
console.info(`${temp.fahrenheit}`);   // 77

// 设置计算属性，影响存储属性
temp.fahrenheit = 100;
console.info(`${temp.celsius}`);      // ~37.78
console.info(`${temp.fahrenheit}`);   // 100
// [End stored_vs_computed_properties]

// ===== computed_property_combination =====
// [Start computed_property_combination]
class ComboUser {
  public firstName: string = '';
  public lastName: string = '';
  
  // 计算属性：组合多个属性
  get fullName(): string {
    return `${this.firstName} ${this.lastName}`;
  }
  
  set fullName(value: string) {
    let parts: string[] = value.split(' ');
    this.firstName = parts[0] ?? '';
    this.lastName = parts[1] ?? '';
  }
}

let user: ComboUser = new ComboUser();
user.firstName = 'John';
user.lastName = 'Doe';

console.info(`${user.fullName}`);  // 'John Doe'

user.fullName = 'Jane Smith';
console.info(`${user.firstName}`);  // 'Jane'
console.info(`${user.lastName}`);   // 'Smith'

// 计算属性用于验证和转换
class Product {
  public price: number = 0;
  
  get formattedPrice(): string {
    return '$' + this.price.toFixed(2);
  }
  
  get priceInCents(): number {
    return Math.round(this.price * 100);
  }
}

let product: Product = new Product();
product.price = 19.99;

console.info(`${product.formattedPrice}`);  // '$19.99'
console.info(`${product.priceInCents}`);    // 1999
// [End computed_property_combination]

// ===== property_observer_simulation =====
// [Start property_observer_simulation]
// TypeScript/ArkTS无原生属性观察器
// 通过getter/setter模拟

class ObservableValue {
  private _value: number = 0;
  private _listeners: ((value: number) => void)[] = [];
  
  get value(): number {
    return this._value;
  }
  
  set value(newValue: number) {
    let oldValue: number = this._value;
    this._value = newValue;
    
    // 触发监听器
    if (oldValue !== newValue) {
      this.notifyListeners(newValue);
    }
  }
  
  // 添加监听器
  addListener(listener: (value: number) => void): void {
    this._listeners.push(listener);
  }
  
  // 移除监听器
  removeListener(listener: (value: number) => void): void {
    let index: number = this._listeners.indexOf(listener);
    if (index >= 0) {
      this._listeners.splice(index, 1);
    }
  }
  
  // 通知所有监听器
  private notifyListeners(value: number): void {
    for (let listener of this._listeners) {
      listener(value);
    }
  }
}

let observable: ObservableValue = new ObservableValue();

// 添加监听器
observable.addListener((value: number): void => {
  console.info(`Value changed to ${value}`);
});

// 设置值，触发监听器
observable.value = 10;  // 输出: Value changed to 10
observable.value = 20;  // 输出: Value changed to 20
observable.value = 20;  // 不输出（值相同）
// [End property_observer_simulation]

// ===== property_change_detection =====
// [Start property_change_detection]
class WatchedProperty {
  private _data: string = '';
  
  get data(): string {
    return this._data;
  }
  
  set data(value: string) {
    if (this._data !== value) {
      console.info(`Property changed from '${this._data}' to '${value}'`);
      this._data = value;
    }
  }
  
  // 手动触发变更检测
  checkChange(): void {
    console.info(`Current value: ${this._data}`);
  }
}

let watched: WatchedProperty = new WatchedProperty();
watched.data = 'Hello';  // 输出: Property changed from '' to 'Hello'
watched.data = 'Hello';  // 不输出（值相同）
watched.data = 'World';  // 输出: Property changed from 'Hello' to 'World'

// 批量更新时触发
class BatchUpdate {
  private _items: string[] = [];
  
  get items(): string[] {
    return [...this._items];  // 返回副本
  }
  
  set items(value: string[]) {
    let oldLength: number = this._items.length;
    this._items = [...value];
    
    if (oldLength !== this._items.length) {
      console.info(`Items count changed from ${oldLength} to ${this._items.length}`);
    }
  }
  
  addItem(item: string): void {
    this._items.push(item);
    console.info(`Added item: ${item}`);
  }
}
// [End property_change_detection]

// ===== manual_property_observation =====
// [Start manual_property_observation]
// 属性观察者：在set方法中比较新旧值并触发回调

class PropertyObserver {
  private propertyName: string;
  private callback: (oldValue: string | number | boolean, newValue: string | number | boolean) => void;
  
  constructor(
    propertyName: string,
    callback: (oldValue: string | number | boolean, newValue: string | number | boolean) => void
  ) {
    this.propertyName = propertyName;
    this.callback = callback;
  }
  
  notify(oldValue: string | number | boolean, newValue: string | number | boolean): void {
    if (oldValue !== newValue) {
      this.callback(oldValue, newValue);
    }
  }
}

class ObservedClass {
  private _value: number = 0;
  private observer: PropertyObserver;
  
  constructor() {
    this.observer = new PropertyObserver('value', 
      (oldValue: string | number | boolean, newValue: string | number | boolean): void => {
        console.info(`Value: ${oldValue} -> ${newValue}`);
      }
    );
  }
  
  get value(): number {
    return this._value;
  }
  
  set value(newValue: number) {
    let oldValue: number = this._value;
    this._value = newValue;
    this.observer.notify(oldValue, newValue);
  }
}

let observed: ObservedClass = new ObservedClass();
observed.value = 10;  // 输出: Value: 0 -> 10
observed.value = 20;  // 输出: Value: 10 -> 20
// [End manual_property_observation]

// ===== instance_static_comparison =====
// [Start instance_static_comparison]
class Comparison {
  // 实例属性
  public instanceValue: number = 0;
  
  // 静态属性
  public static staticValue: number = 0;
  
  // 实例方法
  getInstanceValue(): number {
    return this.instanceValue;  // 通过this
  }
  
  setInstanceValue(value: number): void {
    this.instanceValue = value;
  }
  
  // 静态方法
  static getStaticValue(): number {
    return Comparison.staticValue;  // 通过类名
  }
  
  static setStaticValue(value: number): void {
    Comparison.staticValue = value;
  }
  
  // 混合使用
  static compare(): string {
    return `Static: ${Comparison.staticValue}, Instance: N/A in static`;
  }
  
  getComparison(): string {
    return `Static: ${Comparison.staticValue}, Instance: ${this.instanceValue}`;
  }
}

let comp1: Comparison = new Comparison();
let comp2: Comparison = new Comparison();

// 实例属性独立
comp1.setInstanceValue(10);
comp2.setInstanceValue(20);

console.info(`${comp1.getInstanceValue()}`);   // 10
console.info(`${comp2.getInstanceValue()}`);   // 20

// 静态属性共享
Comparison.setStaticValue(100);
console.info(`${Comparison.getStaticValue()}`);  // 100

// 所有实例看到相同的静态属性
console.info(`${comp1.getComparison()}`);  // Static: 100, Instance: 10
console.info(`${comp2.getComparison()}`);  // Static: 100, Instance: 20
// [End instance_static_comparison]

// ===== application_state_management =====
// [Start application_state_management]
class ApplicationState {
  public static startTime: Date = new Date();
  public static userCount: number = 0;
  public static sessionActive: boolean = false;
  
  static initialize(): void {
    ApplicationState.startTime = new Date();
    ApplicationState.userCount = 0;
    ApplicationState.sessionActive = true;
    console.info(`Application initialized at ${ApplicationState.startTime.toString()}`);
  }
  
  static addUser(): void {
    ApplicationState.userCount++;
    console.info(`User count: ${ApplicationState.userCount}`);
  }
  
  static getElapsedTime(): number {
    let now: Date = new Date();
    return now.getTime() - ApplicationState.startTime.getTime();
  }
  
  static shutdown(): void {
    ApplicationState.sessionActive = false;
    console.info('Application shutdown');
  }
}

// 静态属性随类加载而初始化
console.info(`${ApplicationState.startTime}`);       // 初始化时间
console.info(`${ApplicationState.sessionActive}`);   // false

// 应用启动
ApplicationState.initialize();
ApplicationState.addUser();  // User count: 1
ApplicationState.addUser();  // User count: 2

console.info(`${ApplicationState.getElapsedTime()}`);  // 运行时间

// 静态属性全局共享
// 无论创建多少实例，静态属性只有一个副本
// [End application_state_management]

// ===== property_type_selection_guide =====
// [Start property_type_selection_guide]
// 存储属性：需要存储的数据
class GuideUser {
  public name: string;      // 存储姓名
  public email: string;     // 存储邮箱
  
  constructor(name: string, email: string) {
    this.name = name;
    this.email = email;
  }
}

// 计算属性：基于其他属性计算
class GuideProduct {
  public price: number = 0;     // 存储
  public quantity: number = 0;  // 存储
  
  get total(): number {  // 计算
    return this.price * this.quantity;
  }
}

// 静态属性：类级别共享数据
class Config {
  public static apiUrl: string = 'EXAMPLE_API_URL';
}
// [End property_type_selection_guide]

// ===== encapsulation_best_practice =====
// [Start encapsulation_best_practice]
class BankAccount {
  private balance: number = 0;
  
  // 公开接口而非属性
  deposit(amount: number): void {
    if (amount > 0) {
      this.balance += amount;
    }
  }
  
  withdraw(amount: number): boolean {
    if (amount > 0 && amount <= this.balance) {
      this.balance -= amount;
      return true;
    }
    return false;
  }
  
  getBalance(): number {
    return this.balance;
  }
}
// [End encapsulation_best_practice]

// [Start index_signature_map_alternative]
class IsConfigManager {
  private values: Map<string, string> = new Map<string, string>();

  set(key: string, value: string): void {
    this.values.set(key, value);
  }

  get(key: string): string | undefined {
    return this.values.get(key);
  }
}

let isConfig: IsConfigManager = new IsConfigManager();
isConfig.set('appName', 'MyApp');

let isAppName: string | undefined = isConfig.get('appName');
if (isAppName !== undefined) {
  console.info(`${isAppName}`);  // MyApp
}
// [End index_signature_map_alternative]

// [Start declare_field]
interface DclAnimal {
  dateOfBirth: Date;
}

interface DclDog extends DclAnimal {
  breed: string;
}

class DclAnimalHouse {
  public resident: DclAnimal;

  constructor(animal: DclAnimal) {
    this.resident = animal;
  }
}

class DclDogHouse extends DclAnimalHouse {
  // declare：不生成运行时代码，仅修正类型
  public declare resident: DclDog;

  constructor(dog: DclDog) {
    super(dog);
  }
}

let dclDog: DclDog = { dateOfBirth: new Date(), breed: 'Labrador' };
let dclHouse: DclDogHouse = new DclDogHouse(dclDog);
console.info(`${dclHouse.resident.breed}`);  // Labrador
// [End declare_field]


