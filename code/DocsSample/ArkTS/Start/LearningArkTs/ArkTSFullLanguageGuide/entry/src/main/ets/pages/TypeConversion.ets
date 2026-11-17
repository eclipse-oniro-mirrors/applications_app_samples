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

// ===== class_upcast_downcast_example =====
// [Start class_upcast_downcast_example]
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

// 向上转型（隐式）
let dog: Dog = new Dog('Buddy', 'Golden Retriever');
let animal: Animal = dog; // 自动转换

// 向下转型（显式，需要类型检查）
let pet: Animal = new Dog('Max', 'Labrador');
if (pet instanceof Dog) {
  let myDog: Dog = pet; // 类型安全
  myDog.bark();
}
// [End class_upcast_downcast_example]

// ===== type_assertion_vs_type_conversion =====
// [Start type_assertion_vs_type_conversion]
// 类型断言：仅编译时生效
let value1: Object = '123';
let assertedNum: number = value1 as number;
console.info(`${typeof assertedNum}`); // "string"（运行时类型未改变）

// 类型转换：运行时执行转换
let value2: string = '123';
let convertedNum: number = Number(value2);
console.info(`${typeof convertedNum}`); // "number"（运行时类型已改变）
// [End type_assertion_vs_type_conversion]

// ===== type_assertion_with_type_check =====
// [Start type_assertion_with_type_check]
function processValue(value: string | number | boolean): void {
  // 使用类型断言前，应进行类型检查
  if (typeof value === 'string') {
    let strValue: string = value as string; // 此时断言是安全的
    console.info(`${strValue.toUpperCase()}`);
  } else if (typeof value === 'number') {
    let numValue: number = value as number;
    console.info(`${numValue.toFixed(2)}`);
  }
}
// [End type_assertion_with_type_check]

// ===== type_narrowing_concept =====
// [Start type_narrowing_concept]
type StringOrNumber = string | number;

function narrowProcessValue(value: StringOrNumber): string {
  // typeof收窄：在分支内value被收窄为具体类型
  if (typeof value === 'string') {
    return value.toUpperCase();  // value: string
  } else {
    return value.toFixed(2);     // value: number
  }
}
// [End type_narrowing_concept]

// ===== typeof_type_guard =====
// [Start typeof_type_guard]
function typeGuardProcessValue(value: string | number | boolean): void {
  if (typeof value === 'string') {
    // 编译器知道value是string类型
    console.info(`字符串长度: ${value.length}`);
    console.info(`大写: ${value.toUpperCase()}`);
  } else if (typeof value === 'number') {
    // 编译器知道value是number类型
    console.info(`数值: ${value.toFixed(2)}`);
    console.info(`平方: ${value * value}`);
  } else if (typeof value === 'boolean') {
    // 编译器知道value是boolean类型
    console.info(`布尔值: ${value ? '真' : '假'}`);
  }
}

typeGuardProcessValue('Hello');  // 字符串长度: 5, 大写: HELLO
typeGuardProcessValue(42);       // 数值: 42.00, 平方: 1764
typeGuardProcessValue(true);     // 布尔值: 真
// [End typeof_type_guard]

// ===== instanceof_type_guard =====
// [Start instanceof_type_guard]
class TypeGuardDog {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }

  public bark(): void {
    console.info(`${this.name} barks: Woof!`);
  }
}

class Cat {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }

  public meow(): void {
    console.info(`${this.name} meows: Meow!`);
  }
}

function makeSound(pet: TypeGuardDog | Cat): void {
  console.info(`Pet name: ${pet.name}`);

  if (pet instanceof TypeGuardDog) {
    // 编译器知道pet是TypeGuardDog类型
    pet.bark();
  } else if (pet instanceof Cat) {
    // 编译器知道pet是Cat类型
    pet.meow();
  }
}

let myDog = new TypeGuardDog('Buddy');
let myCat = new Cat('Whiskers');

makeSound(myDog); // Pet name: Buddy, Buddy barks: Woof!
makeSound(myCat); // Pet name: Whiskers, Whiskers meows: Meow!
// [End instanceof_type_guard]

// ===== discriminated_union_vehicle_example =====
// [Start discriminated_union_vehicle_example]
interface Car {
  type: 'car';
  drive: () => void;
}

interface Boat {
  type: 'boat';
  sail: () => void;
}

interface Plane {
  type: 'plane';
  fly: () => void;
}

type Vehicle = Car | Boat | Plane;

function isCarKind(vehicle: Vehicle): boolean {
  return vehicle.type === 'car';
}

function isBoatKind(vehicle: Vehicle): boolean {
  return vehicle.type === 'boat';
}

function isPlaneKind(vehicle: Vehicle): boolean {
  return vehicle.type === 'plane';
}

function operateVehicle(vehicle: Vehicle): void {
  switch (vehicle.type) {
    case 'car':
      vehicle.drive();
      break;
    case 'boat':
      vehicle.sail();
      break;
    case 'plane':
      vehicle.fly();
      break;
  }
}

let car: Car = { type: 'car', drive: () => console.info('Driving on road') };
let boat: Boat = { type: 'boat', sail: () => console.info('Sailing on water') };
let plane: Plane = { type: 'plane', fly: () => console.info('Flying in sky') };

operateVehicle(car);   // Driving on road
operateVehicle(boat);  // Sailing on water
operateVehicle(plane); // Flying in sky

console.info(`${isCarKind(car)}`);
console.info(`${isBoatKind(boat)}`);
console.info(`${isPlaneKind(plane)}`);
// [End discriminated_union_vehicle_example]

// ===== discriminated_union_user_role =====
// [Start discriminated_union_user_role]
interface RegularUser {
  role: 'regular';
  id: number;
  name: string;
  email: string;
}

interface AdminUser {
  role: 'admin';
  id: number;
  name: string;
  email: string;
  adminLevel: number;
  permissions: string[];
}

type RoleUser = RegularUser | AdminUser;

function processUser(user: RoleUser): void {
  console.info(`RoleUser: ${user.name} (${user.email})`);

  switch (user.role) {
    case 'admin':
      console.info(`Admin Level: ${user.adminLevel}`);
      console.info(`Permissions: ${user.permissions.join(', ')}`);
      break;
    case 'regular':
      console.info('Regular user');
      break;
  }
}

let regularUser: RegularUser = {
  role: 'regular',
  id: 1,
  name: 'Alice',
  email: 'alice@example.com'
};

let adminUser: AdminUser = {
  role: 'admin',
  id: 2,
  name: 'Bob',
  email: 'bob@example.com',
  adminLevel: 5,
  permissions: ['read', 'write', 'delete']
};

processUser(regularUser);
// RoleUser: Alice (alice@example.com)
// Regular user

processUser(adminUser);
// RoleUser: Bob (bob@example.com)
// Admin Level: 5
// Permissions: read, write, delete
// [End discriminated_union_user_role]

// ===== upcast_automatic_implicit_safe =====
// [Start upcast_automatic_implicit_safe]
class SafeVehicle {
  public brand: string;
  
  constructor(brand: string) {
    this.brand = brand;
  }
  
  public move(): void {
    console.info(`${this.brand} vehicle is moving`);
  }
}

class SafeCar extends SafeVehicle {
  public model: string;
  
  constructor(brand: string, model: string) {
    super(brand);
    this.model = model;
  }
  
  public drive(): void {
    console.info(`${this.brand} ${this.model} is driving`);
  }
}

// 向上转型是自动的、隐式的
let safeCar: SafeCar = new SafeCar('Toyota', 'Camry');
let vehicle: SafeVehicle = safeCar; // 自动转换

// 向上转型是类型安全的
// 子类对象必定包含父类的所有成员
vehicle.move(); // Toyota vehicle is moving
console.info(`${vehicle.brand}`); // Toyota

// 函数参数的向上转型
function startVehicle(vehicle: SafeVehicle): void {
  vehicle.move();
}

let myCar: SafeCar = new SafeCar('Honda', 'Civic');
startVehicle(myCar); // 自动向上转型
// [End upcast_automatic_implicit_safe]

// ===== safe_downcast_with_type_guard =====
// [Start safe_downcast_with_type_guard]
interface CastShape {
  type: string;
  getArea(): number;
}

class CastRectangle implements CastShape {
  public type: string = 'rectangle';
  private width: number;
  private height: number;
  
  constructor(width: number, height: number) {
    this.width = width;
    this.height = height;
  }
  
  public getArea(): number {
    return this.width * this.height;
  }
  
  public getDiagonal(): number {
    return Math.sqrt(this.width ** 2 + this.height ** 2);
  }
}

class CastCircle implements CastShape {
  public type: string = 'circle';
  private radius: number;
  
  constructor(radius: number) {
    this.radius = radius;
  }
  
  public getArea(): number {
    return Math.PI * this.radius ** 2;
  }
  
  public getDiameter(): number {
    return 2 * this.radius;
  }
}

function processShape(shape: CastShape): void {
  console.info(`Shape type: ${shape.type}`);
  console.info(`Area: ${shape.getArea()}`);
  
  // 使用类型守卫进行安全的向下转型
  if (shape instanceof CastRectangle) {
    let rect: CastRectangle = shape;
    console.info(`Diagonal: ${rect.getDiagonal()}`);
  } else if (shape instanceof CastCircle) {
    let circle: CastCircle = shape;
    console.info(`Diameter: ${circle.getDiameter()}`);
  }
}

let rectangle: CastShape = new CastRectangle(3, 4);
let circle: CastShape = new CastCircle(5);

processShape(rectangle);
// Shape type: rectangle
// Area: 12
// Diagonal: 5

processShape(circle);
// Shape type: circle
// Area: 78.53981633974483
// Diameter: 10
// [End safe_downcast_with_type_guard]

// ===== safe_downcast_function =====
// [Start safe_downcast_function]
class Base {
  public baseMethod(): void {
    console.info('Base method');
  }
}

class Derived extends Base {
  public derivedMethod(): void {
    console.info('Derived method');
  }
}

function safeDowncast(obj: Base): void {
  // 使用instanceof检查，避免运行时错误
  if (obj instanceof Derived) {
    let derived: Derived = obj;
    derived.derivedMethod();
  } else {
    console.info('Downcast failed: object is not an instance of Derived');
  }
}

let base: Base = new Base();
let derived: Base = new Derived();

safeDowncast(base);    // Downcast failed
safeDowncast(derived); // Derived method
// [End safe_downcast_function]

// ===== typeof_type_guard_narrowing =====
// [Start typeof_type_guard_narrowing]
type StringOrNumberNarrow = string | number;

function typeGuardProcessValue2(value: StringOrNumberNarrow): void {
  // 使用typeof类型守卫缩小类型范围
  if (typeof value === 'string') {
    // 此时value的类型被收窄为string
    console.info(`String value: ${value}`);
    console.info(`Length: ${value.length}`);
    console.info(`Uppercase: ${value.toUpperCase()}`);
  } else {
    // 此时value的类型被收窄为number
    console.info(`Number value: ${value}`);
    console.info(`Fixed: ${value.toFixed(2)}`);
    console.info(`Square: ${value * value}`);
  }
}

typeGuardProcessValue2('Hello'); // String value: Hello, Length: 5, Uppercase: HELLO
typeGuardProcessValue2(42);      // Number value: 42, Fixed: 42.00, Square: 1764
// [End typeof_type_guard_narrowing]

// ===== discriminated_union_animal_speed =====
// [Start discriminated_union_animal_speed]
interface Bird {
  type: 'bird';
  flyingSpeed: number;
}

interface Horse {
  type: 'horse';
  runningSpeed: number;
}

type SpeedAnimal = Bird | Horse;

function getAnimalSpeed(animal: SpeedAnimal): number {
  switch (animal.type) {
    case 'bird':
      return animal.flyingSpeed;
    case 'horse':
      return animal.runningSpeed;
  }
  return 0;
}

// 使用可辨识联合（Discriminated Union）
function getAnimalSpeedV2(animal: SpeedAnimal): number {
  switch (animal.type) {
    case 'bird':
      return animal.flyingSpeed;
    case 'horse':
      return animal.runningSpeed;
  }
  return 0;
}

let bird: Bird = { type: 'bird', flyingSpeed: 100 };
let horse: Horse = { type: 'horse', runningSpeed: 50 };

console.info(`${getAnimalSpeed(bird)}`);   // 100
console.info(`${getAnimalSpeed(horse)}`);  // 50
console.info(`${getAnimalSpeedV2(bird)}`); // 100
console.info(`${getAnimalSpeedV2(horse)}`); // 50
// [End discriminated_union_animal_speed]

// ===== discriminated_union_shape_area =====
// [Start discriminated_union_shape_area]
interface SwitchCircle {
  kind: 'areaCircle';
  radius: number;
}

interface SwitchSquare {
  kind: 'square';
  sideLength: number;
}

interface SwitchRectangle {
  kind: 'areaRectangle';
  width: number;
  height: number;
}

type SwitchShape = SwitchCircle | SwitchSquare | SwitchRectangle;

function getArea(shape: SwitchShape): number {
  switch (shape.kind) {
    case 'areaCircle':
      // 编译器知道shape是Circle类型
      return Math.PI * shape.radius ** 2;
    case 'square':
      // 编译器知道shape是Square类型
      return shape.sideLength ** 2;
    case 'areaRectangle':
      // 编译器知道shape是Rectangle类型
      return shape.width * shape.height;
  }
  return 0;
}

let areaCircle: SwitchCircle = { kind: 'areaCircle', radius: 5 };
let square: SwitchSquare = { kind: 'square', sideLength: 4 };
let areaRectangle: SwitchRectangle = { kind: 'areaRectangle', width: 3, height: 6 };

console.info(`area：${getArea(areaCircle)}`);     // area：78.53981633974483
console.info(`area：${getArea(square)}`);     // area：16
console.info(`area：${getArea(areaRectangle)}`);  // area：18
// [End discriminated_union_shape_area]

// ===== union_type_api_response_handling =====
// [Start union_type_api_response_handling]
// 定义联合类型
type Result<T> = Success<T> | Failure;

interface Success<T> {
  status: 'success';
  data: T;
}

interface Failure {
  status: 'failure';
  error: string;
}

// 处理联合类型的函数
function handleResult<T>(result: Result<T>): void {
  switch (result.status) {
    case 'success':
      // 编译器知道result是Success<T> 类型
      console.info(`Success: ${result.data}`);
      break;
    case 'failure':
      // 编译器知道result是Failure类型
      console.error(`Error: ${result.error}`);
      break;
  }
}

// 另一个示例：处理API响应
interface UserData {
  id: number;
  name: string;
}
interface UnionTypeApiResponse {
  code: number;
  data?: UserData;
  message?: string;
}

function processApiResponse(response: UnionTypeApiResponse): void {
  if (response.code === 200) {
    // 使用类型守卫确保data存在
    if (response.data !== undefined) {
      console.info(`Data received: ${response.data.name}`);
    } else {
      console.info('Success but no data');
    }
  } else {
    // 使用空值合并处理可选的message
    const errorMsg = response.message ?? 'Unknown error';
    console.error(`Error ${response.code}: ${errorMsg}`);
  }
}

// 使用示例
let successResult: Result<string> = {
  status: 'success',
  data: 'Hello, ArkTS!'
};

let failureResult: Result<string> = {
  status: 'failure',
  error: 'Network error'
};

handleResult<string>(successResult); // Success: Hello, ArkTS!
handleResult<string>(failureResult); // Error: Network error

let apiSuccess: UnionTypeApiResponse = {
  code: 200,
  data: { id: 1, name: 'Alice' }
};

let apiError: UnionTypeApiResponse = {
  code: 404,
  message: 'Not found'
};

processApiResponse(apiSuccess); // Data received: { id: 1, name: 'Alice' }
processApiResponse(apiError);   // Error 404: Not found
// [End union_type_api_response_handling]

// ===== prefer_explicit_conversion_over_double_assertion =====
// [Start prefer_explicit_conversion_over_double_assertion]
// 推荐：显式转换代替双重断言
let assertValue: string = '123';
let safeNum: number = Number(assertValue);
// [End prefer_explicit_conversion_over_double_assertion]

// ===== discriminated_union_display_value =====
// [Start discriminated_union_display_value]
interface TextValue {
  kind: 'text';
  value: string;
}

interface NumberValue {
  kind: 'number';
  value: number;
}

type DisplayValue = TextValue | NumberValue;

function display(value: DisplayValue): void {
  switch (value.kind) {
    case 'text':
      console.info(value.value.toUpperCase());
      break;
    case 'number':
      console.info(value.value.toFixed(2));
      break;
  }
}
// [End discriminated_union_display_value]

// [Start prefer_discriminated_union_over_instanceof]
// 反例：使用类型检查
if (animal instanceof Dog) {
  // ...
}

// 推荐：使用可辨识联合
interface TypeAnimal {
  type: string;
  name: string;
}
let typeAnimal: TypeAnimal = { type: 'dog', name: 'Buddy' };
if (typeAnimal.type === 'dog') {
  // ...
}
// [End prefer_discriminated_union_over_instanceof]

// [Start exhaustiveness_check]
interface EcCircle {
  kind: 'circle';
  radius: number;
}

interface EcSquare {
  kind: 'square';
  sideLength: number;
}

type EcShape = EcCircle | EcSquare;

function getEcArea(shape: EcShape): number {
  switch (shape.kind) {
    case 'circle':
      return Math.PI * shape.radius * shape.radius;
    case 'square':
      return shape.sideLength * shape.sideLength;
    default:
      // 如果新增Triangle但忘记处理，这里会编译错误
      const _exhaustiveCheck: never = shape;
      return _exhaustiveCheck;
  }
}

let ecCircle: EcCircle = { kind: 'circle', radius: 5 };
let ecSquare: EcSquare = { kind: 'square', sideLength: 4 };

console.info(`${getEcArea(ecCircle).toString()}`);
console.info(`${getEcArea(ecSquare).toString()}`);
// [End exhaustiveness_check]

// [Start never_narrowing]
function processNvValue(value: string | number): void {
  if (typeof value === 'string') {
    console.info(`${value.toUpperCase()}`);
  } else if (typeof value === 'number') {
    console.info(`${value.toFixed(2)}`);
  } else {
    // value类型为never（所有可能已排除）
    const _check: never = value;
    console.info(`Unexpected: ${_check}`);
  }
}

processNvValue('hello');  // HELLO
processNvValue(42);       // 42.00
// [End never_narrowing]


// ===== truthiness_narrowing =====
// [Start truthiness_narrowing]
function processTruthyValue(value: string | null | undefined): void {
  if (value) {
    console.info(`${value.toUpperCase()}`);
  } else {
    console.info('空值');
  }
}

processTruthyValue('hello');
processTruthyValue(null);
// [End truthiness_narrowing]

// ===== equality_narrowing =====
// [Start equality_narrowing]
function compareNarrowing(value: string | number | null | undefined): void {
  if (value === 'hello') {
    console.info(`${value.toUpperCase()}`);
  } else if (value === null) {
    console.info('null');
  } else if (value === undefined) {
    console.info('undefined');
  } else {
    console.info(`${value}`);
  }
}

function checkNull(value: string | null | undefined): void {
  if (value == null) {
    console.info('空');
  } else {
    console.info(`${value.toUpperCase()}`);
  }
}
// [End equality_narrowing]

// ===== assignment_narrowing =====
// [Start assignment_narrowing]
let anAssignedValue: string | number = 'hello';
console.info(`${anAssignedValue.toUpperCase()}`); // 编译器知道此时为string
anAssignedValue = 42;
console.info(`${anAssignedValue}`); // 编译器知道此时为number
// [End assignment_narrowing]

// ===== control_flow_analysis =====
// [Start control_flow_analysis]
function flowAnalysis(value: string | number): void {
  if (typeof value === 'string') {
    console.info(`${value.length}`);
  } else {
    console.info(`${value}`);
  }
}
// [End control_flow_analysis]

// ===== type_inference_union =====
// [Start type_inference_union]
let tiuResult: string | number;
if (Math.random() > 0.5) {
  tiuResult = 'success';
} else {
  tiuResult = 0;
}
console.info(`${tiuResult}`); // string | number
// [End type_inference_union]

// ===== typeof_narrowing_process =====
// [Start typeof_narrowing_process]
function processWithTypeof(value: string | number): void {
  if (typeof value === 'string') {
    console.info(`${value.toUpperCase()}`);
  } else {
    console.info(`${value.toFixed(2)}`);
  }
}
// [End typeof_narrowing_process]

// ===== structural_typing_explicit =====
// [Start structural_typing_explicit]
interface StNamed {
  name: string;
}

class StPerson implements StNamed {
  public name: string;
  public age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

let stNamedItem: StNamed = new StPerson('Alice', 25);
console.info(`${stNamedItem.name}`); // Alice
// [End structural_typing_explicit]

// ===== union_type_guard_vs_assertion =====
// [Start union_type_guard_vs_assertion]
// 反例：使用宽泛类型后直接断言
let broadTypeValue: Object = 'Hello';
let broadTypeLength: number = (broadTypeValue as string).length; // 缺少运行时检查

// 推荐：使用明确联合类型 + 类型守卫
let unionTypeValue: string | number = 'Hello';

// 类型安全的转换
if (typeof unionTypeValue === 'string') {
  let unionTypeLength: number = unionTypeValue.length; // 编译器知道unionTypeValue是string类型
  console.info(`${unionTypeLength}`);
}
// [End union_type_guard_vs_assertion]


// ===== downcast_with_instanceof_check =====
// [Start downcast_with_instanceof_check]
class Animal2 {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }

  public speak(): void {
    console.info(`${this.name} makes a sound`);
  }
}

class Dog2 extends Animal2 {
  public breed: string;

  constructor(name: string, breed: string) {
    super(name);
    this.breed = breed;
  }

  public bark(): void {
    console.info(`${this.name} barks: Woof!`);
  }
}

class Cat2 extends Animal2 {
  public color: string;

  constructor(name: string, color: string) {
    super(name);
    this.color = color;
  }

  public meow(): void {
    console.info(`${this.name} meows: Meow!`);
  }
}

// 向下转型
let downcastAnimal: Animal2 = new Dog2('Buddy', 'Golden Retriever');

// 不安全的向下转型（可能导致运行时错误）
let downcastDog: Dog2 = downcastAnimal as Dog2; // 编译通过，但应该先检查类型

// 安全的向下转型：使用instanceof检查
if (downcastAnimal instanceof Dog2) {
  let dcDog: Dog2 = downcastAnimal; // 类型守卫后自动推断
  dcDog.bark();
}

// 错误示例：向下转型失败
let catAnimal: Animal2 = new Cat2('Whiskers', 'White');
if (catAnimal instanceof Dog2) {
  let dcCatDog: Dog2 = catAnimal;
  dcCatDog.bark();
} else {
  console.info(`This animal is not a dog`);
}
// [End downcast_with_instanceof_check]

// ===== optional_property_type_guard =====
// [Start optional_property_type_guard]
interface OptUser {
  id: number;
  name: string;
  email?: string; // 可选属性
}

function getUserEmail(user: OptUser): string {
  // 方式1：使用可选链和空值合并
  return user.email ?? '未设置邮箱';
}

function processUserEmail(user: OptUser): void {
  // 方式2：使用条件判断进行类型收窄
  if (user.email !== undefined) {
    // 此时user.email是string类型
    console.info(`Email: ${user.email}`);
    console.info(`Email length: ${user.email.length}`);
  } else {
    console.info(`Email not provided`);
  }
}

// 使用非空断言（!）- 确定值存在时使用
// 反例：如果email不存在会运行时错误
function getEmailLength(user: OptUser): number {
  return user.email!.length;
}

// 推荐：先检查再使用
function getEmailLength2(user: OptUser): number {
  if (user.email) {
    return user.email.length;
  }
  return 0;
}

let optUser1: OptUser = { id: 1, name: 'Alice', email: 'alice@example.com' };
let optUser2: OptUser = { id: 2, name: 'Bob' };

console.info(`${getUserEmail(optUser1)}`); // alice@example.com
console.info(`${getUserEmail(optUser2)}`); // 未设置邮箱

processUserEmail(optUser1);
processUserEmail(optUser2);
// [End optional_property_type_guard]

// ===== as_keyword_type_assertion =====
// [Start as_keyword_type_assertion]
let assertValueObj: Object = 'Hello, ArkTS';

// 使用as关键字进行类型断言
if (typeof assertValueObj === 'string') {
  let assertLength: number = (assertValueObj as string).length;
  console.info(`${assertLength}`); // 13
}

// 断言为联合类型
let mixedValue: Object = 42;
let numValue: number | string = mixedValue as number | string;

// 断言为自定义类型
interface AssertUser {
  id: number;
  name: string;
  email: string;
}

let userData: AssertUser = {
  id: 1,
  name: 'Alice',
  email: 'alice@example.com'
};

let assertUser: AssertUser = userData as AssertUser;
console.info(`${assertUser.name}`); // Alice
// [End as_keyword_type_assertion]

// ===== function_compatibility =====
// [Start function_compatibility]
// 少参数函数可赋给多参数函数类型
type FcGreeter = (name: string) => string;
let fcGreeter: FcGreeter = (name: string): string => `Hello, ${name}`;

type FcBinaryOp = (a: number, b: number) => number;
let fcUnary: FcBinaryOp = (a: number): number => a * 2; // 少一个参数，兼容赋值
// [End function_compatibility]

// [Start generic_type_compatibility]
interface Empty<T> {
  value: T;
}

let strContainer: Empty<string> = { value: 'hello' };
let numContainer: Empty<number> = { value: 42 };
// strContainer和numContainer不兼容，因为T参与了成员结构
// [End generic_type_compatibility]

// ===== builtin_primitive_types =====
// [Start builtin_primitive_types]
// number：整数与浮点数统一表示
let age: number = 25;
let price: number = 9.99;
let hex: number = 0xFF; // 十六进制字面量

// boolean：逻辑值
let enabled: boolean = true;

// string：字符串
let appName: string = 'ArkTS';
// [End builtin_primitive_types]

// ===== void_type_basic =====
// [Start void_type_basic]
function log(message: string): void {
  console.info(`${message}`);
}
// [End void_type_basic]

// ===== null_undefined_types_basic =====
// [Start null_undefined_types_basic]
// null：明确表示空值
let nickname: string | null = null;

// undefined：未定义值，可选属性的隐含类型为T | undefined
interface NullableUserProfile {
  name: string;
  email?: string;
}

let nullableUser: NullableUserProfile = { name: 'Alice' };
// [End null_undefined_types_basic]

// ===== literal_type_basic =====
// [Start literal_type_basic]
type TaskState = 'pending' | 'running' | 'done';

let state: TaskState = 'pending';
// state = 'finished'; // 编译错误：'finished'不是TaskState的成员
// [End literal_type_basic]

// ===== object_object_type =====
// [Start object_object_type]
interface Point {
  x: number;
  y: number;
}

// object：非原始类型
let point: Point = { x: 1, y: 2 };
let ref: object = point;

// Object：所有非空类型的根类型
let boxed: Object = 'hello';
let boxedObj: Object = point;

// Object类型的值访问具体成员前，需要先收窄
if (typeof boxed === 'string') {
  console.info(`${boxed.length}`); // 5
}
// [End object_object_type]

// ===== type_alias_basic =====
// [Start type_alias_basic]
// 为原始类型起别名，增强语义
type AccountId = number;
let accountId: AccountId = 1001;

// 为字面量联合类型起别名，约束取值范围
type SortOrder = 'asc' | 'desc';
let order: SortOrder = 'asc';

console.info(`${accountId}`);  // 1001
console.info(`${order}`);      // 'asc'
// [End type_alias_basic]

// ===== union_type_basic =====
// [Start union_type_basic]
type ID = string | number;

let userId: ID = 'A-001';
userId = 100; // 也可以是number

function printId(id: ID): void {
  if (typeof id === 'string') {
    console.info(`${id.toUpperCase()}`); // string特有成员
  } else {
    console.info(`${id.toFixed(0)}`);    // number特有成员
  }
}
// [End union_type_basic]

// ===== function_type_basic =====
// [Start function_type_basic]
type Comparator = (a: number, b: number) => number;

let ascending: Comparator = (a: number, b: number): number => {
  return a - b;
};

console.info(`${ascending(3, 1)}`); // 2
// [End function_type_basic]

// ===== enum_type_basic =====
// [Start enum_type_basic]
enum MyColor {
  Red,
  Green,
  Blue
}

let favorite: MyColor = MyColor.Blue;
// [End enum_type_basic]

// ===== interface_type_basic =====
// [Start interface_type_basic]
interface MyPosition {
  x: number;
  y: number;
}

let origin: MyPosition = { x: 0, y: 0 };
// [End interface_type_basic]

// ===== class_type_basic =====
// [Start class_type_basic]
class MyRectangle {
  public width: number;
  public height: number;

  constructor(width: number, height: number) {
    this.width = width;
    this.height = height;
  }

  public getArea(): number {
    return this.width * this.height;
  }
}

let rect: MyRectangle = new MyRectangle(3, 4);
console.info(`${rect.getArea()}`); // 12
// [End class_type_basic]

// ===== value_reference_assignment =====
// [Start value_reference_assignment]
// 值类型：赋值复制值，两个变量相互独立
let countA: number = 10;
let countB: number = countA;
countB = 20;
console.info(`${countA}`); // 10（不受countB影响）

// 引用类型：赋值复制引用，两个变量指向同一个对象
interface Score {
  value: number;
}

let scoreA: Score = { value: 90 };
let scoreB: Score = scoreA;
scoreB.value = 95;
console.info(`${scoreA.value}`); // 95（scoreA随之改变）
// [End value_reference_assignment]

// ===== value_reference_mutation =====
// [Start value_reference_mutation]
class Task {
  public status: string = 'pending';
}

// 引用类型作为参数：函数内修改原对象的状态
function start(task: Task): void {
  task.status = 'running';
}

let myTask: Task = new Task();
start(myTask);
console.info(`${myTask.status}`); // running（原对象被修改）

// 值类型作为参数：函数内只修改副本
function double(value: number): number {
  value = value * 2; // 仅修改副本
  return value;
}

let count: number = 10;
double(count);
console.info(`${count}`); // 10（不变）
// [End value_reference_mutation]

// ===== partial_required_types =====
// [Start partial_required_types]
interface UserProfile {
  id: number;
  name: string;
  email: string;
}

// Partial<T>：所有属性变为可选
let patch: Partial<UserProfile> = { name: 'Alice' };

interface PageQuery {
  keyword?: string;
  pageSize?: number;
}

// Required<T>：所有属性变为必选
let strictQuery: Required<PageQuery> = { keyword: 'arkts', pageSize: 20 };
// [End partial_required_types]

// ===== readonly_type_operator =====
// [Start readonly_type_operator]
interface AppConfig {
  appId: string;
  version: string;
}

let config: Readonly<AppConfig> = { appId: 'com.example.app', version: '1.0.0' };
// config.version = '1.0.1'; // 编译错误：属性为只读
// [End readonly_type_operator]

// ===== record_type_operator =====
// [Start record_type_operator]
interface CityInfo {
  country: string;
  population: number;
}

let cityMap: Record<string, CityInfo> = {
  'Beijing': { country: 'China', population: 21860000 }
};

let info: CityInfo | undefined = cityMap['Beijing']; // 索引访问结果包含undefined
// [End record_type_operator]

// ===== subtype_class_hierarchy =====
// [Start subtype_class_hierarchy]
class Creature {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }

  public speak(): void {
    console.info(`${this.name} makes a sound`);
  }
}

class Hound extends Creature {
  public breed: string;

  constructor(name: string, breed: string) {
    super(name);
    this.breed = breed;
  }

  public bark(): void {
    console.info(`${this.name} barks: Woof!`);
  }
}

// 向上转型：子类实例可隐式赋给父类类型变量
let hound: Hound = new Hound('Buddy', 'Golden Retriever');
let creature: Creature = hound;
creature.speak(); // 'Buddy makes a sound'
// creature.bark(); // 编译错误：父类类型变量不能访问子类特有成员

// 向下转型：需先确认实际类型
if (creature instanceof Hound) {
  let myHound: Hound = creature; // 守卫分支内自动收窄
  myHound.bark();            // 'Buddy barks: Woof!'
}
// [End subtype_class_hierarchy]

// ===== subtype_function_type =====
// [Start subtype_function_type]
class BaseType {}
class SubType extends BaseType {}

// 目标函数类型：(SubType) => BaseType
type Handler = (input: SubType) => BaseType;

// 参数为父类型（逆变）、返回值为子类型（协变），满足子类型规则
let handler: Handler = (input: BaseType): SubType => {
  return new SubType();
};

// 参数更少的函数可赋给参数更多的函数类型
type BinaryOp = (a: number, b: number) => number;
let doubleFn: BinaryOp = (a: number): number => a * 2;
// [End subtype_function_type]

// ===== subtype_union_type =====
// [Start subtype_union_type]
type Identifier = string | number;

// string和number都是Identifier的子类型
let id: Identifier = 'A-001';
id = 100;

let displayName: string = 'Alice';
id = displayName;    // OK：string是string | number的子类型
// displayName = id; // 编译错误：string | number不是string的子类型
// [End subtype_union_type]

// ===== as_type_assertion =====
// [Start as_type_assertion]
interface UserInfo {
  id: number;
  name: string;
}

let user: UserInfo = { id: 1, name: 'Alice' };

// 向上转型：子类型到超类型，隐式完成
let obj: Object = user;

// 向下转型：超类型到子类型，使用as断言
let restored: UserInfo = obj as UserInfo;
console.info(`${restored.name}`); // 'Alice'

// 断言为联合类型
let mixed: Object = 42;
let unionValue: number | string = mixed as number | string;
// [End as_type_assertion]

// ===== assertion_vs_conversion =====
// [Start assertion_vs_conversion]
let convValue: Object = '123';

// 类型断言：不改变值，仅按目标类型使用
let text: string = convValue as string; // 运行时值确实是string，断言成功
console.info(`${text.length}`);     // 3

// 数据转换：运行时真正转换数据类型
let num: number = Number('123');
console.info(`${num.toFixed(2)}`); // 123.00
// [End assertion_vs_conversion]
