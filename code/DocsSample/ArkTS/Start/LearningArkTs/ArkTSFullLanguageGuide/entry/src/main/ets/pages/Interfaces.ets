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

// ===== simple_interface_definition =====
// [Start simple_interface_definition]
// 定义一个简单的接口
interface User {
  id: number;
  name: string;
  email: string;
}

// 使用接口约束对象
let user: User = {
  id: 1,
  name: 'Alice',
  email: 'alice@example.com'
};

console.info(user.name); // Alice
// [End simple_interface_definition]

// ===== interface_as_protocol =====
// [Start interface_as_protocol]
// 接口定义协议
interface PaymentProtocol {
  // 必须实现的方法
  processPayment(amount: number): boolean;
  refundPayment(transactionId: string): boolean;
  
  // 必须包含的属性
  currency: string;
}

// 类实现接口协议
class CreditCardPayment implements PaymentProtocol {
  public currency: string = 'USD';
  
  public processPayment(amount: number): boolean {
    console.info('Processing credit card payment: $' + amount);
    return true;
  }
  
  public refundPayment(transactionId: string): boolean {
    console.info(`Refunding transaction: ${transactionId}`);
    return true;
  }
}

class PayPalPayment implements PaymentProtocol {
  public currency: string = 'EUR';
  
  public processPayment(amount: number): boolean {
    console.info(`Processing PayPal payment: €${amount}`);
    return true;
  }
  
  public refundPayment(transactionId: string): boolean {
    console.info(`Refunding PayPal transaction: ${transactionId}`);
    return true;
  }
}

// 使用接口类型
function makePayment(payment: PaymentProtocol, amount: number): void {
  if (payment.processPayment(amount)) {
    console.info('Payment successful');
  }
}

let creditCard = new CreditCardPayment();
let paypal = new PayPalPayment();

makePayment(creditCard, 100); // Processing credit card payment: $100
makePayment(paypal, 50);      // Processing PayPal payment: €50
// [End interface_as_protocol]

// ===== interface_segregation_principle =====
// [Start interface_segregation_principle]
// 好的设计：单一职责
interface Reader {
  read(): string;
}

interface Writer {
  write(data: string): void;
}

// 好的设计：接口隔离
interface ReadOnlyRepository<T> {
  findById(id: number): T | null;
  findAll(): T[];
}

interface WriteOnlyRepository<T> {
  save(entity: T): void;
  delete(id: number): void;
}

interface Repository<T> extends ReadOnlyRepository<T>, WriteOnlyRepository<T> {
  // 继承读写接口，提供完整功能
}

// 不好的设计：接口过于庞大（违反接口隔离原则）
interface BadRepository<T> {
  findById(id: number): T | null;
  findAll(): T[];
  save(entity: T): void;
  delete(id: number): void;
  batchInsert(entities: T[]): void;
  batchDelete(ids: number[]): void;
  // ... 更多方法
}
// [End interface_segregation_principle]

// ===== basic_interface_declaration =====
// [Start basic_interface_declaration]
// 基本接口声明
interface Point {
  x: number;
  y: number;
}

let point: Point = {
  x: 10,
  y: 20
};

console.info(`Point: (${point.x}, ${point.y})`);
// [End basic_interface_declaration]

// ===== interface_method_declaration =====
// [Start interface_method_declaration]
interface Calculator {
    // 方法声明（无参数）
  reset(): void;
  
  // 方法声明（带参数）
  add(a: number, b: number): number;
  subtract(a: number, b: number): number;
  
  // 可选方法
  logResult?(): void;
}

class BasicCalculator implements Calculator {
  private result: number = 0;
  
  public reset(): void {
    this.result = 0;
    console.info('Calculator reset');
  }
  
  public add(a: number, b: number): number {
    this.result = a + b;
    return this.result;
  }
  
  public subtract(a: number, b: number): number {
    this.result = a - b;
    return this.result;
  }
  
  // 可选方法可以不实现
  public logResult(): void {
    console.info(`Result: ${this.result}`);
  }
}

let calculator: BasicCalculator = new BasicCalculator();
let sum: number = calculator.add(10, 5);
console.info(`${sum}`); // 15
// [End interface_method_declaration]

// ===== class_implements_interface =====
// [Start class_implements_interface]
interface Logger {
  log(message: string): void;
  error(message: string): void;
  warn(message: string): void;
}

class ConsoleLogger implements Logger {
  public log(message: string): void {
    console.info(`[LOG] ${message}`);
  }
  
  public error(message: string): void {
    console.error(`[ERROR] ${message}`);
  }
  
  public warn(message: string): void {
    console.info(`[WARN] ${message}`);
  }
}

class FileLogger implements Logger {
  private fileName: string;
  
  constructor(fileName: string) {
    this.fileName = fileName;
  }
  
  public log(message: string): void {
    // 模拟写入文件
    console.info(`Writing to ${this.fileName}: [LOG] ${message}`);
  }
  
  public error(message: string): void {
    console.info(`Writing to ${this.fileName}: [ERROR] ${message}`);
  }
  
  public warn(message: string): void {
    console.info(`Writing to ${this.fileName}: [WARN] ${message}`);
  }
}

let consoleLogger = new ConsoleLogger();
let fileLogger = new FileLogger('app.log');

consoleLogger.log('Application started');
// [LOG] Application started

fileLogger.error('Connection failed');
// Writing to app.log: [ERROR] Connection failed
// [End class_implements_interface]

// ===== interface_multi_level_inheritance =====
// [Start interface_multi_level_inheritance]
interface Animal {
  name: string;
  age: number;
}

interface Pet extends Animal {
  owner: string;
}

interface Dog extends Pet {
  breed: string;
  bark(): void;
}

class DemoDog implements Dog {
  public name: string;
  public age: number;
  public owner: string;
  public breed: string;

  constructor(name: string, age: number, owner: string, breed: string) {
    this.name = name;
    this.age = age;
    this.owner = owner;
    this.breed = breed;
  }

  public bark(): void {
    console.info(`${this.name} barks: Woof! Woof!`);
  }
}

let myDog: Dog = new DemoDog('Buddy', 3, 'Alice', 'Golden Retriever');

myDog.bark(); // Buddy barks: Woof! Woof!
// [End interface_multi_level_inheritance]

// ===== interface_inheritance_object_literal =====
// [Start interface_inheritance_object_literal]
interface Vehicle {
  brand: string;
  year: number;
}

interface Car extends Vehicle {
  model: string;
  doors: number;
}

let myCar: Car = {
  brand: 'Toyota',
  year: 2020,
  model: 'Camry',
  doors: 4
};

console.info(`${myCar.brand} ${myCar.model} (${myCar.year})`);
// [End interface_inheritance_object_literal]

// ===== generic_interface =====
// [Start generic_interface]
// 泛型接口
interface Container<T> {
  value: T;
  getValue(): T;
  setValue(value: T): void;
}

class NumberContainer implements Container<number> {
  public value: number;
  
  constructor(initialValue: number) {
    this.value = initialValue;
  }
  
  public getValue(): number {
    return this.value;
  }
  
  public setValue(value: number): void {
    this.value = value;
  }
}

class StringContainer implements Container<string> {
  public value: string;
  
  constructor(initialValue: string) {
    this.value = initialValue;
  }
  
  public getValue(): string {
    return this.value;
  }
  
  public setValue(value: string): void {
    this.value = value;
  }
}

let numContainer = new NumberContainer(42);
let strContainer = new StringContainer('Hello');

console.info(`${numContainer.getValue().toString()}`); // 42
console.info(`${strContainer.getValue()}`); // Hello
// [End generic_interface]

// ===== generic_constraint_interface =====
// [Start generic_constraint_interface]
interface Lengthwise {
  length: number;
}

// 泛型约束：T必须具有length属性
interface LengthContainer<T extends Lengthwise> {
  value: T;
  getLength(): number;
}

class ArrayContainer<T extends Lengthwise> implements LengthContainer<T> {
  public value: T;
  
  constructor(value: T) {
    this.value = value;
  }
  
  public getLength(): number {
    return this.value.length;
  }
}

let stringContainer = new ArrayContainer('Hello, ArkTS!');
let arrayContainer = new ArrayContainer([1, 2, 3, 4, 5]);

console.info(`${stringContainer.getLength()}`); // 13
console.info(`${arrayContainer.getLength()}`);  // 5
// [End generic_constraint_interface]

// ===== generic_repository_interface =====
// [Start generic_repository_interface]
interface RepoRepository<T> {
  findById(id: number): T | null;
  findAll(): T[];
  save(entity: T): void;
  delete(id: number): void;
}

interface RepoUser {
  id: number;
  name: string;
  email: string;
}

class UserRepository implements RepoRepository<RepoUser> {
  private users: RepoUser[] = [];
  
  public findById(id: number): RepoUser | null {
    return this.users.find((user: RepoUser): boolean => user.id === id) ?? null;
  }
  
  public findAll(): RepoUser[] {
    return this.users;
  }
  
  public save(entity: RepoUser): void {
    let existingUser: RepoUser | null = this.findById(entity.id);
    if (existingUser !== null) {
      // 更新现有用户
      let index = this.users.indexOf(existingUser);
      this.users[index] = entity;
    } else {
      // 添加新用户
      this.users.push(entity);
    }
  }
  
  public delete(id: number): void {
    this.users = this.users.filter((user: RepoUser): boolean => user.id !== id);
  }
}

let userRepo = new UserRepository();

userRepo.save({ id: 1, name: 'Alice', email: 'alice@example.com' });
userRepo.save({ id: 2, name: 'Bob', email: 'bob@example.com' });

console.info(`${userRepo.findAll().length}`); // 2
console.info(`${userRepo.findById(1)?.name}`); // Alice

userRepo.delete(1);
console.info(`${userRepo.findAll().length}`); // 1
// [End generic_repository_interface]

// ===== generic_interface_use_cases =====
// [Start generic_interface_use_cases]
// 使用场景1: 通用数据结构
interface Collection<T> {
  add(item: T): void;
  remove(item: T): void;
  contains(item: T): boolean;
  size(): number;
}

// 使用场景2: 通用工具接口
interface Mapper<T, U> {
  map(input: T): U;
}

interface Filter<T> {
  filter(predicate: (item: T) => boolean): T[];
}

interface Reducer<T, U> {
  reduce(accumulator: (prev: U, current: T) => U, initial: U): U;
}

// 使用场景3: 通用回调接口
interface Callback<T> {
  onSuccess(result: T): void;
  onError(error: Error): void;
}

interface AsyncCallback<T> {
  onSuccess(result: T): Promise<void>;
  onError(error: Error): Promise<void>;
}
// [End generic_interface_use_cases]

// ===== optional_properties_methods =====
// [Start optional_properties_methods]
interface Configuration {
  // 必选属性
  apiUrl: string;
  
  // 可选属性（使用 ?）
  timeout?: number;
  retries?: number;
  debugMode?: boolean;
  
  // 可选方法
  logError?: (error: Error) => void;
  validateResponse?: (response: HttpResponse) => boolean;
}

interface HttpResponse {
  status: number;
  body: string;
}

let config1: Configuration = {
  apiUrl: 'EXAMPLE_API_URL'
};

let config2: Configuration = {
  apiUrl: 'EXAMPLE_API_URL',
  timeout: 5000,
  retries: 3,
  debugMode: true
};

// 使用可选成员
if (config2.timeout) {
  console.info(`Timeout: ${config2.timeout}ms`);
}

if (config2.logError) {
  config2.logError(new Error('Test error'));
}
// [End optional_properties_methods]

// ===== optional_members_implementation =====
// [Start optional_members_implementation]
interface Service {
  // 必选方法
  initialize(): void;
  shutdown(): void;
  
  // 可选方法
  preInitialize?(): void;
  postShutdown?(): void;
  
  // 必选属性
  name: string;
  
  // 可选属性
  version?: string;
  description?: string;
}

class BasicService implements Service {
  public name: string;
  
  constructor(name: string) {
    this.name = name;
  }
  
  public initialize(): void {
    console.info(`${this.name} initialized`);
  }
  
  public shutdown(): void {
    console.info(`${this.name} shutdown`);
  }
  
  // 可选方法可以不实现
}

class AdvancedService implements Service {
  public name: string;
  public version: string;
  public description: string;
  
  constructor(name: string, version: string, description: string) {
    this.name = name;
    this.version = version;
    this.description = description;
  }
  
  public initialize(): void {
    console.info(`${this.name} v${this.version} initialized`);
  }
  
  public shutdown(): void {
    console.info(`${this.name} shutdown`);
  }
  
  public preInitialize(): void {
    console.info(`${this.name} pre-initialization`);
  }
  
  public postShutdown(): void {
    console.info(`${this.name} post-shutdown cleanup`);
  }
}

let basicService = new BasicService('BasicService');
let advancedService = new AdvancedService('AdvancedService', '1.0', 'Advanced service with all features');

basicService.initialize();
advancedService.preInitialize();
advancedService.initialize();
advancedService.shutdown();
advancedService.postShutdown();
// [End optional_members_implementation]

// ===== using_optional_members =====
// [Start using_optional_members]
interface OptionalInterface {
  requiredMethod(): void;
  optionalMethod?(): void;
  requiredProperty: string;
  optionalProperty?: number;
}

function useOptionalInterface(obj: OptionalInterface): void {
  // 必选成员可以直接调用
  obj.requiredMethod();
  console.info(`${obj.requiredProperty}`);
  
  // 可选方法需要先检查是否存在
  if (obj.optionalMethod) {
    obj.optionalMethod();
  }
  
  // 可选属性需要先检查是否存在
  if (obj.optionalProperty !== undefined) {
    console.info(`${obj.optionalProperty}`);
  }
  
  // 使用可选链（?.）
  obj.optionalMethod?.();
  console.info(`${obj.optionalProperty?.toFixed(2)}`);
  
  // 使用空值合并（??）
  let value: number = obj.optionalProperty ?? 0;
  console.info(`${value}`);
}
// [End using_optional_members]

// ===== extending_interface_with_optionals =====
// [Start extending_interface_with_optionals]
// 基础接口（必选成员）
interface BaseInterface {
  requiredMethod(): void;
  requiredProperty: string;
}

// 扩展接口（包含可选成员）
interface ExtendedInterface extends BaseInterface {
    optionalMethod?(): void;
    optionalProperty?: number;
}

class BaseInterfaceImpl implements BaseInterface {
  public requiredProperty: string = 'Required value';

  public requiredMethod(): void {
    console.info('Required method');
  }
}

class ExtendedInterfaceImpl implements ExtendedInterface {
  public requiredProperty: string = 'Required value';
  public optionalProperty: number = 42;

  public requiredMethod(): void {
    console.info('Required method');
  }

  public optionalMethod(): void {
    console.info('Optional method');
  }
}

// 使用基础接口
let baseObj: BaseInterface = new BaseInterfaceImpl();

// 使用扩展接口（可以选择是否提供可选成员）
let extendedObj: ExtendedInterface = new ExtendedInterfaceImpl();

// 让扩展接口继承基础接口
function processObject(obj: BaseInterface): void {
  obj.requiredMethod();
  console.info(`${obj.requiredProperty}`);
  
  // 如果传入扩展接口对象，可以先转换为扩展接口再检查可选成员
  let extended: ExtendedInterface = obj as ExtendedInterface;
  if (extended.optionalMethod !== undefined) {
    extended.optionalMethod();
  }
}

processObject(baseObj);
processObject(extendedObj);
// [End extending_interface_with_optionals]

// ===== single_interface_implementation =====
// [Start single_interface_implementation]
interface Drawable {
  draw(): void;
}

class Circle implements Drawable {
  private radius: number;
  
  constructor(radius: number) {
    this.radius = radius;
  }
  
  public draw(): void {
    console.info(`Drawing a circle with radius ${this.radius}`);
  }
}

let circle = new Circle(5);
circle.draw(); // Drawing a circle with radius 5
// [End single_interface_implementation]

// ===== multiple_interface_implementation =====
// [Start multiple_interface_implementation]
interface Printable {
  print(): void;
}

interface Saveable {
  save(): void;
}

interface Loadable {
  load(): void;
}

class Document implements Printable, Saveable, Loadable {
  private title: string;
  private content: string;
  
  constructor(title: string, content: string) {
    this.title = title;
    this.content = content;
  }
  
  public print(): void {
    console.info(`Printing: ${this.title}`);
    console.info(`${this.content}`);
  }
  
  public save(): void {
    console.info(`Saving: ${this.title}`);
  }
  
  public load(): void {
    console.info(`Loading: ${this.title}`);
  }
}

let document = new Document('My Document', 'This is the content.');
document.print();
document.save();
document.load();
// [End multiple_interface_implementation]

// ===== class_inheritance_with_interface =====
// [Start class_inheritance_with_interface]
class BaseEntity {
  public id: number;
  public createdAt: Date;
  
  constructor(id: number) {
    this.id = id;
    this.createdAt = new Date();
  }
  
  public getInfo(): string {
    return `ID: ${this.id}, Created: ${this.createdAt}`;
  }
}

interface Named {
  name: string;
  getName(): string;
}

interface Active {
  active: boolean;
  activate(): void;
  deactivate(): void;
}

class InterfaceUser extends BaseEntity implements Named, Active {
  public name: string;
  public active: boolean;
  
  constructor(id: number, name: string) {
    super(id);
    this.name = name;
    this.active = false;
  }
  
  public getName(): string {
    return this.name;
  }
  
  public activate(): void {
    this.active = true;
    console.info(`${this.name} activated`);
  }
  
  public deactivate(): void {
    this.active = false;
    console.info(`${this.name} deactivated`);
  }
}

let interfaceUser = new InterfaceUser(1, 'Alice');
console.info(`${interfaceUser.getInfo()}`);  // ID: 1, Created: ...
console.info(`${interfaceUser.getName()}`);  // Alice
interfaceUser.activate();
interfaceUser.deactivate();
// [End class_inheritance_with_interface]

// ===== comparable_equatable_interface =====
// [Start comparable_equatable_interface]
interface EquatableComparable<T> {
  compareTo(other: T): number;
}

interface Equatable<T> {
  equals(other: T): boolean;
}

class NumericValue implements EquatableComparable<NumericValue>, Equatable<NumericValue> {
  public value: number;
  
  constructor(value: number) {
    this.value = value;
  }
  
  public compareTo(other: NumericValue): number {
    return this.value - other.value;
  }
  
  public equals(other: NumericValue): boolean {
    return this.value === other.value;
  }
}

let num1 = new NumericValue(10);
let num2 = new NumericValue(20);
let num3 = new NumericValue(10);

console.info(`${num1.compareTo(num2)}`); // -10
console.info(`${num1.equals(num2)}`);    // false
console.info(`${num1.equals(num3)}`);    // true

// 使用接口类型约束
function findMax<T extends EquatableComparable<T>>(items: T[]): T | null {
  if (items.length === 0) {
    return null;
  }
  
  let max: T = items[0] as T;
  for (let i = 1; i < items.length; i++) {
    let current: T = items[i] as T;
    if (current.compareTo(max) > 0) {
      max = current;
    }
  }
  return max;
}

let values: NumericValue[] = [new NumericValue(5), new NumericValue(15), new NumericValue(10)];
let maxValue = findMax(values);
console.info(`${maxValue ? maxValue.value : 0}`); // 15
// [End comparable_equatable_interface]

// ===== interface_object_literal_type =====
// [Start interface_object_literal_type]
interface LiteralPoint {
  x: number;
  y: number;
}

let literalPoint: LiteralPoint = { x: 10, y: 20 };

interface Color {
  red: number;
  green: number;
  blue: number;
}

let color: Color = { red: 255, green: 128, blue: 0 };

console.info(`LiteralPoint: (${literalPoint.x}, ${literalPoint.y})`);
console.info(`Color: RGB(${color.red}, ${color.green}, ${color.blue})`);
// [End interface_object_literal_type]

// ===== interface_function_types =====
// [Start interface_function_types]
interface TypesUser {
  id: number;
  name: string;
  email: string;
}

interface CreateUserRequest {
  name: string;
  email: string;
}

interface ApiResponse<T> {
  success: boolean;
  data?: T;
  error?: string;
}

// 接口作为参数类型
function createUser(request: CreateUserRequest): TypesUser {
  return {
    id: Math.floor(Math.random() * 1000),
    name: request.name,
    email: request.email
  };
}

// 接口作为返回值类型
function getUser(id: number): ApiResponse<TypesUser> {
  if (id > 0) {
    return {
      success: true,
      data: {
        id: id,
        name: 'Alice',
        email: 'alice@example.com'
      }
    };
  } else {
    return {
      success: false,
      error: 'Invalid user ID'
    };
  }
}

let newUser: TypesUser = createUser({ name: 'Bob', email: 'bob@example.com' });
console.info(`${newUser}`);

let response: ApiResponse<TypesUser> = getUser(1);
if (response.success && response.data !== undefined) {
    console.info(`${response.data.name}`);
}
// [End interface_function_types]

// ===== interface_polymorphism =====
// [Start interface_polymorphism]
interface PolyAnimal {
  name: string;
  speak(): void;
}

class PolyDog implements PolyAnimal {
  public name: string;
  
  constructor(name: string) {
    this.name = name;
  }
  
  public speak(): void {
    console.info(`${this.name} barks: Woof! Woof!`);
  }
}

class Cat implements PolyAnimal {
  public name: string;
  
  constructor(name: string) {
    this.name = name;
  }
  
  public speak(): void {
    console.info(`${this.name} meows: Meow!`);
  }
}

class Cow implements PolyAnimal {
  public name: string;
  
  constructor(name: string) {
    this.name = name;
  }
  
  public speak(): void {
    console.info(`${this.name} moos: Moo!`);
  }
}

// 使用接口类型实现多态
function makeAnimalSpeak(animal: PolyAnimal): void {
  animal.speak();
}

let dog = new PolyDog('Buddy');
let cat = new Cat('Whiskers');
let cow = new Cow('Daisy');

makeAnimalSpeak(dog); // Buddy barks: Woof! Woof!
makeAnimalSpeak(cat); // Whiskers meows: Meow!
makeAnimalSpeak(cow); // Daisy moos: Moo!

// 使用接口类型的数组
let animals: PolyAnimal[] = [dog, cat, cow];

animals.forEach(animal => {
    animal.speak();
});
// [End interface_polymorphism]

// ===== interface_type_casting =====
// [Start interface_type_casting]
interface CastingVehicle {
  brand: string;
  model: string;
}

class CastingCar implements CastingVehicle {
  public brand: string;
  public model: string;
  public doors: number;
  
  constructor(brand: string, model: string, doors: number) {
    this.brand = brand;
    this.model = model;
    this.doors = doors;
  }
  
  public drive(): void {
    console.info(`Driving ${this.brand} ${this.model}`);
  }
}

class Motorcycle implements CastingVehicle {
  public brand: string;
  public model: string;
  public type: string;
  
  constructor(brand: string, model: string, type: string) {
    this.brand = brand;
    this.model = model;
    this.type = type;
  }
  
  public ride(): void {
    console.info(`Riding ${this.brand} ${this.model} (${this.type})`);
  }
}

// 接口类型转换为具体类型（需要类型检查）
function processVehicle(vehicle: CastingVehicle): void {
  console.info(`${vehicle.brand} ${vehicle.model}`);
  
  // 使用instanceof检查类型
  if (vehicle instanceof CastingCar) {
    let car = vehicle as CastingCar;
    console.info(`Doors: ${car.doors}`);
    car.drive();
  } else if (vehicle instanceof Motorcycle) {
    let motorcycle = vehicle as Motorcycle;
    console.info(`Type: ${motorcycle.type}`);
    motorcycle.ride();
  }
}

let car: CastingCar = new CastingCar('Toyota', 'Camry', 4);
let motorcycle: Motorcycle = new Motorcycle('Harley-Davidson', 'Street 750', 'Cruiser');

processVehicle(car);
processVehicle(motorcycle);
// [End interface_type_casting]

// ===== interface_default_implementation =====
// [Start interface_default_implementation]
interface ImplementationLogger {
  log(message: string): void;
  error(message: string): void;
  warn(message: string): void;
}

// 提供默认实现的辅助类
class DefaultLogger implements ImplementationLogger {
  public log(message: string): void {
    console.info(`[LOG] ${message}`);
  }
  
  public error(message: string): void {
    console.error(`[ERROR] ${message}`);
  }
  
  public warn(message: string): void {
    console.info(`[WARN] ${message}`);
  }
}

// 自定义日志类可以继承默认实现
class CustomLogger extends DefaultLogger implements ImplementationLogger {
  private prefix: string;
  
  constructor(prefix: string) {
    super();
    this.prefix = prefix;
  }
  
  // 覆盖默认方法
  public log(message: string): void {
    console.info(`${this.prefix} [LOG] ${message}`);
  }
  
  // 其他方法使用默认实现
}

let customLogger = new CustomLogger('[MyApp]');
customLogger.log('Application started'); // [MyApp] [LOG] Application started
customLogger.error('Something went wrong'); // [ERROR] Something went wrong
// [End interface_default_implementation]

// ===== interface_naming_conventions =====
// [Start interface_naming_conventions]
// 推荐：使用PascalCase，可添加I前缀（可选）
interface ConventionsUserRepository { }
interface ILogger { }

// 反例：使用小写或下划线
interface user_repository { }
interface logger_interface { }
// [End interface_naming_conventions]

// ===== interface_single_responsibility =====
// [Start interface_single_responsibility]
// 推荐：单一职责
interface Readable { read(): string; }
interface Writable { write(data: string): void; }

// 反例：职责过多
interface DataProcessor {
  read(): string;
  write(data: string): void;
  validate(): boolean;
  transform(): string;
  // ...
}
// [End interface_single_responsibility]

// ===== optional_properties_best_practices =====
// [Start optional_properties_best_practices]
interface OptConfiguration {
  // 必选的核心配置
  apiUrl: string;
  
  // 可选的扩展配置
  timeout?: number;
  retries?: number;
}

// 使用时进行合理检查
function createConfig(config: OptConfiguration): void {
  let timeout = config.timeout ?? 5000; // 默认值
  let retries = config.retries ?? 3;    // 默认值
}
// [End optional_properties_best_practices]


// [Start excess_property_check]
interface SquareConfig {
  color?: string;
  width?: number;
}

interface EpSquareResult {
  color: string;
  area: number;
}

function createSquare(config: SquareConfig): EpSquareResult {
  return {
    color: config.color || 'red',
    area: config.width ? config.width * config.width : 20
  };
}

// 正确
let epSquare1 = createSquare({ color: 'blue', width: 100 });
// [End excess_property_check]

// [Start implements_cautions]
interface ImplCheckable {
  check(name: string): boolean;
}

class ImplNameChecker implements ImplCheckable {
  // 参数类型不会从接口自动推断，需显式标注
  check(s: string): boolean {
    return s.toLowerCase() === 'ok';
  }
}

interface ImplConfigA {
  x: number;
  y?: number;
}

class ImplC implements ImplConfigA {
  public x: number = 0;
  // y不是必须实现的，但实例上不存在y属性
}

let implC: ImplC = new ImplC();
console.info(`${implC.x.toString()}`);  // 0
// [End implements_cautions]



// ===== interface_multiple_inheritance =====
// [Start interface_multiple_inheritance]
interface MiSerializable {
  serialize(): string;
}

interface MiCloneable {
  clone(): Object;
}

interface MiComparable {
  compareTo(other: Object): number;
}

interface MiEntity extends MiSerializable, MiCloneable, MiComparable {
  id: number;
  createdAt: Date;
}

class MiUserEntity implements MiEntity {
  public id: number;
  public createdAt: Date;
  public name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
    this.createdAt = new Date();
  }

  public serialize(): string {
    return JSON.stringify({
      id: this.id,
      name: this.name,
      createdAt: this.createdAt
    });
  }

  public clone(): Object {
    let cloned: MiUserEntity = new MiUserEntity(this.id, this.name);
    cloned.createdAt = new Date(this.createdAt);
    return cloned;
  }

  public compareTo(other: Object): number {
    let otherUser: MiUserEntity = other as MiUserEntity;
    return this.id - otherUser.id;
  }
}

let miUser1: MiUserEntity = new MiUserEntity(1, 'Alice');
let miUser2: MiUserEntity = new MiUserEntity(2, 'Bob');

console.info(`${miUser1.serialize()}`);
console.info(`${miUser1.compareTo(miUser2)}`); // -1
let miCloned: Object = miUser1.clone();
let miClonedUser: MiUserEntity = miCloned as MiUserEntity;
console.info(`${miClonedUser.name}`); // Alice
// [End interface_multiple_inheritance]

// ===== bird_multiple_interface =====
// [Start bird_multiple_interface]
abstract class AcAnimal {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }

  abstract makeSound(): void;
}

interface AcCanFly {
  fly(): void;
}

interface AcCanSwim {
  swim(): void;
}

class AcBird extends AcAnimal implements AcCanFly, AcCanSwim {
  constructor(name: string) {
    super(name);
  }

  makeSound(): void {
    console.info(`${this.name} chirps`);
  }

  fly(): void {
    console.info(`${this.name} flies`);
  }

  swim(): void {
    console.info(`${this.name} swims`);
  }
}

let acBird: AcBird = new AcBird('Sparrow');
acBird.makeSound(); // Sparrow chirps
acBird.fly();       // Sparrow flies
acBird.swim();      // Sparrow swims
// [End bird_multiple_interface]

// ===== interface_extends_multiple =====
// [Start interface_extends_multiple]
interface IfColorful {
  color: string;
}

interface IfCircle {
  radius: number;
}

interface IfColorfulCircle extends IfColorful, IfCircle {
}

let ifCc: IfColorfulCircle = { color: 'red', radius: 10 };
console.info(`${ifCc.color}, ${ifCc.radius}`); // red, 10
// [End interface_extends_multiple]

// ===== interface_extends_base =====
// [Start interface_extends_base]
interface IfBaseWindow {
  title: string;
}

interface IfExtendedWindow extends IfBaseWindow {
  count: number;
}

let ifWin: IfExtendedWindow = { title: 'Main', count: 3 };
console.info(`${ifWin.title}, ${ifWin.count}`); // Main, 3
// [End interface_extends_base]

// ===== abstract_vs_interface_static =====
// [Start abstract_vs_interface_static]
abstract class AviAbstractClass {
  static staticMethod(): void { console.info('static'); }
  static { console.info('static initialization block'); }
}
// [End abstract_vs_interface_static]

// ===== abstract_vs_interface_method =====
// [Start abstract_vs_interface_method]
abstract class AimAbstractClass {
  func(): void { console.info('func'); }
}
// [End abstract_vs_interface_method]

// ===== abstract_vs_interface_constructor =====
// [Start abstract_vs_interface_constructor]
abstract class AvicAbstractClass {
  constructor() {}
}
// [End abstract_vs_interface_constructor]
