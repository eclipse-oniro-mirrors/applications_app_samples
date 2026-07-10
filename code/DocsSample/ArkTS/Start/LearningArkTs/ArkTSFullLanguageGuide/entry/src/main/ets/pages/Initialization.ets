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

// ===== basic_constructor_initialization =====
// [Start basic_constructor_initialization]
class Person {
  public name: string;
  public age: number;
  
  // 构造函数：初始化作用
  constructor(name: string, age: number) {
    this.name = name;  // 初始化name属性
    this.age = age;    // 初始化age属性
  }
  
  getInfo(): string {
    return `${this.name}, ${this.age} years old`;
  }
}

let person: Person = new Person('Alice', 25);
console.info(`${person.getInfo()}`);  // 'Alice, 25 years old'
// [End basic_constructor_initialization]

// ===== constructor_responsibilities =====
// [Start constructor_responsibilities]
class DatabaseConnection {
  private connection: string;
  private connected: boolean;
  private timeout: number;
  
  // 构造函数职责
  constructor(connectionString: string, timeout: number = 5000) {
    // 1. 属性初始化
    this.connection = connectionString;
    this.timeout = timeout;
    this.connected = false;
    
    // 2. 参数验证
    if (connectionString.length === 0) {
      throw new Error('Connection string cannot be empty');
    }
    
    // 3. 资源准备
    this.prepareConnection();
  }
  
  private prepareConnection(): void {
    console.info('Preparing connection resources');
  }
  
  connect(): void {
    this.connected = true;
    console.info(`Connected to ${this.connection}`);
  }
  
  disconnect(): void {
    this.connected = false;
    console.info('Disconnected');
  }
}

let db: DatabaseConnection = new DatabaseConnection('localhost:5432', 3000);
db.connect();
// [End constructor_responsibilities]

// ===== initialization_flow =====
// [Start initialization_flow]
class Order {
  public id: number;
  public items: string[];
  public total: number;
  public status: string;
  public createdAt: Date;
  
  constructor(id: number) {
    // 初始化流程：
    
    // 1. 属性初始化
    this.id = id;
    this.items = [];
    this.total = 0;
    this.status = 'pending';
    
    // 2. 计算初始值
    this.createdAt = new Date();
    
    // 3. 验证初始状态
    if (id <= 0) {
      throw new Error('Invalid order ID');
    }
    
    console.info(`Order ${this.id} created`);
  }
  
  addItem(item: string, price: number): void {
    this.items.push(item);
    this.total += price;
    this.status = 'processing';
  }
  
  complete(): void {
    this.status = 'completed';
    console.info(`Order ${this.id} completed with total ${this.total}`);
  }
}

// 创建流程：
// new Order(1) -> 构造函数调用 -> 属性初始化 -> 状态设置 -> 实例返回
let order: Order = new Order(1);
order.addItem('Item A', 100);
order.addItem('Item B', 200);
order.complete();
// [End initialization_flow]

// ===== default_constructor =====
// [Start default_constructor]
class SimpleClass {
  public value: number = 10;
  public name: string = 'default';
  
  // 无构造函数：编译器自动生成默认构造函数
  // constructor() {}  // 自动生成
}

let simple: SimpleClass = new SimpleClass();
console.info(`${simple.value.toString()}`);  // 10
console.info(`${simple.name}`);   // 'default'

class DefaultConstructor {
  public x: number = 0;
  public y: number = 0;
  
  // 显式无参构造函数
  constructor() {
    console.info('Default constructor called');
  }
  
  getValues(): string {
    return `${this.x}, ${this.y}`;
  }
}

let defaultObj: DefaultConstructor = new DefaultConstructor();
console.info(`${defaultObj.getValues()}`);  // '0, 0'

// 默认构造函数：
// 无参数
// 自动初始化属性为默认值
// 编译器自动生成（如果未定义）
// [End default_constructor]

// ===== custom_constructor_with_parameters =====
// [Start custom_constructor_with_parameters]
class Point {
  public x: number;
  public y: number;
  
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
  
  getCoordinates(): string {
    return `${this.x}, ${this.y}`;
  }
}

let point: Point = new Point(10, 20);
console.info(`${point.getCoordinates()}`);  // '10, 20'

class User {
  public id: number;
  public name: string;
  public email: string;
  
  constructor(id: number, name: string, email: string) {
    this.id = id;
    this.name = name;
    this.email = email;
  }
  
  validate(): boolean {
    return this.id > 0 && this.name.length > 0;
  }
}

let user: User = new User(1, 'Alice', 'alice@example.com');
console.info(`${user.validate()}`);  // true

// 自定义构造函数：
// 定义参数接收初始值
// 参数赋值给属性
// 可添加验证逻辑
// [End custom_constructor_with_parameters]

// ===== constructor_access_modifiers =====
// [Start constructor_access_modifiers]
class PublicConstructor {
  public value: number;
  
  // public构造函数（默认）
  public constructor(value: number) {
    this.value = value;
  }
}

let publicObj: PublicConstructor = new PublicConstructor(10);

class PrivateConstructor {
  private static instance: PrivateConstructor;
  
  // private构造函数：单例模式
  private constructor() {
    console.info('Private constructor');
  }
  
  static getInstance(): PrivateConstructor {
    if (PrivateConstructor.instance === undefined) {
      PrivateConstructor.instance = new PrivateConstructor();
    }
    return PrivateConstructor.instance;
  }
}

let singleton: PrivateConstructor = PrivateConstructor.getInstance();

class ProtectedConstructor {
  protected value: number;
  
  // protected构造函数：子类可访问
  protected constructor(value: number) {
    this.value = value;
  }
}

class ChildOfProtected extends ProtectedConstructor {
  public constructor(value: number) {
    super(value);  // 子类可调用protected构造函数
  }
}

let child: ChildOfProtected = new ChildOfProtected(20);
// [End constructor_access_modifiers]

// ===== instantiation_with_new_keyword =====
// [Start instantiation_with_new_keyword]
class Product {
  public id: number;
  public name: string;
  
  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }
}

// new关键字实例化
let product1: Product = new Product(1, 'Product A');
let product2: Product = new Product(2, 'Product B');

console.info(`${product1.name}`);  // 'Product A'
console.info(`${product2.name}`);  // 'Product B'

// 实例化过程：
// 1. new关键字创建对象
// 2. 调用构造函数
// 3. 返回新实例

class ComplexObject {
  public data: Map<string, string>;
  
  constructor() {
    this.data = new Map();
    this.data.set('key', 'value');
  }
  
  getData(): Map<string, string> {
    return this.data;
  }
}

let complex: ComplexObject = new ComplexObject();
console.info(`${complex.getData().get('key')}`);  // 'value'
// [End instantiation_with_new_keyword]

// ===== constructor_overloading =====
// [Start constructor_overloading]
class OverloadPoint {
  public x: number;
  public y: number;
  
  // 构造函数重载签名
  constructor();
  constructor(x: number);
  constructor(x: number, y: number);
  constructor(x?: number, y?: number) {
    this.x = x ?? 0;
    this.y = y ?? 0;
  }
}

let point1: OverloadPoint = new OverloadPoint();
let point2: OverloadPoint = new OverloadPoint(10);
let point3: OverloadPoint = new OverloadPoint(10, 20);

console.info(`${point1.x} ${point1.y}`);  // 0, 0
console.info(`${point2.x} ${point2.y}`);  // 10, 0
console.info(`${point3.x} ${point3.y}`);  // 10, 20

class Color {
  public red: number;
  public green: number;
  public blue: number;
  
  constructor(hex: string);
  constructor(r: number, g: number, b: number);
  constructor(rOrHex: number | string, g?: number, b?: number) {
    if (typeof rOrHex === 'string') {
      // 从十六进制解析
      this.red = Number.parseInt(rOrHex.substring(1, 3), 16);
      this.green = Number.parseInt(rOrHex.substring(3, 5), 16);
      this.blue = Number.parseInt(rOrHex.substring(5, 7), 16);
    } else {
      this.red = rOrHex;
      this.green = g ?? 0;
      this.blue = b ?? 0;
    }
  }
}

let color1: Color = new Color('#FF0000');
let color2: Color = new Color(255, 128, 0);
// [End constructor_overloading]

// ===== overload_call_selection =====
// [Start overload_call_selection]
class Size {
  public width: number;
  public height: number;
  
  constructor();
  constructor(size: number);
  constructor(width: number, height: number);
  constructor(width?: number, height?: number) {
    if (width === undefined) {
      this.width = 100;
      this.height = 100;
    } else if (height === undefined) {
      this.width = width;
      this.height = width;
    } else {
      this.width = width;
      this.height = height;
    }
  }
  
  getArea(): number {
    return this.width * this.height;
  }
}

let size1: Size = new Size();         // 100x100
let size2: Size = new Size(50);       // 50x50
let size3: Size = new Size(10, 20);   // 10x20

console.info(`${size1.getArea()}`);  // 10000
console.info(`${size2.getArea()}`);  // 2500
console.info(`${size3.getArea()}`);  // 200
// [End overload_call_selection]

// ===== static_factory_methods_alternative =====
// [Start static_factory_methods_alternative]
// 使用场景：多种初始化方式
class Configuration {
  public apiUrl: string;
  public timeout: number;
  public debug: boolean;
  
  constructor();
  constructor(apiUrl: string);
  constructor(apiUrl: string, timeout: number);
  constructor(apiUrl: string, timeout: number, debug: boolean);
  constructor(apiUrl?: string, timeout?: number, debug?: boolean) {
    this.apiUrl = apiUrl ?? 'EXAMPLE_API_URL';
    this.timeout = timeout ?? 5000;
    this.debug = debug ?? false;
  }
}

let config1: Configuration = new Configuration();
let config2: Configuration = new Configuration('EXAMPLE_API_URL');
let config3: Configuration = new Configuration('EXAMPLE_API_URL', 3000);
let config4: Configuration = new Configuration('EXAMPLE_API_URL', 3000, true);

// 使用静态工厂方法替代复杂重载
class ConfigFactory {
  public apiUrl: string;
  public timeout: number;
  
  private constructor(apiUrl: string, timeout: number) {
    this.apiUrl = apiUrl;
    this.timeout = timeout;
  }
  
  static createDefault(): ConfigFactory {
    return new ConfigFactory('EXAMPLE_API_URL', 5000);
  }
  
  static createWithUrl(apiUrl: string): ConfigFactory {
    return new ConfigFactory(apiUrl, 5000);
  }
  
  static createCustom(apiUrl: string, timeout: number): ConfigFactory {
    return new ConfigFactory(apiUrl, timeout);
  }
}

let defaultConfig: ConfigFactory = ConfigFactory.createDefault();
let urlConfig: ConfigFactory = ConfigFactory.createWithUrl('EXAMPLE_API_URL');
let customConfig: ConfigFactory = ConfigFactory.createCustom('EXAMPLE_API_URL', 3000);
// [End static_factory_methods_alternative]

// ===== inheriting_parent_constructor =====
// [Start inheriting_parent_constructor]
class Parent {
  public value: number;
  
  constructor(value: number) {
    this.value = value;
  }
}

class Child extends Parent {
  // 子类无构造函数：自动继承父类构造函数
  // 编译器生成：
  // constructor(value: number) {
  //   super(value);
  // }
  
  getValue(): number {
    return this.value;
  }
}

let ctorChild: Child = new Child(10);
console.info(`${ctorChild.getValue().toString()}`);  // 10

class EmptyParent {
  public name: string = 'parent';
  
  // 无参数构造函数
  constructor() {
    console.info('Parent constructor');
  }
}

class EmptyChild extends EmptyParent {
  // 自动调用父类无参构造函数
  public age: number = 20;
}

let emptyChild: EmptyChild = new EmptyChild();
// [End inheriting_parent_constructor]

// ===== passing_parameters_to_super =====
// [Start passing_parameters_to_super]
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
    super(name, age, email);  // 传递所有父类参数
    this.phone = phone;
  }
  
  getInfo(): string {
    return `${this.name}, ${this.age}, ${this.email}, ${this.phone}`;
  }
}

let superChild: MultiParamChild = new MultiParamChild('Alice', 25, 'alice@example.com', '123-456');

// 参数处理方式：
class FlexibleParent {
  public value: number;
  
  constructor(value: number = 10) {
    this.value = value;
  }
}

class FlexibleChild extends FlexibleParent {
  public extra: number;
  
  constructor(value?: number, extra?: number) {
    super(value ?? 10);  // 传递处理后的参数
    this.extra = extra ?? 0;
  }
}

// 参数转换传递
class TransformedParent {
  public id: number;
  
  constructor(id: number) {
    this.id = id;
  }
}

class TransformedChild extends TransformedParent {
  public name: string;
  
  constructor(idString: string, name: string) {
    let id: number = Number.parseInt(idString, 10);
    super(id);  // 转换后传递
    this.name = name;
  }
}
// [End passing_parameters_to_super]

// ===== declaration_time_initialization =====
// [Start declaration_time_initialization]
class DirectInitialization {
  // 声明时直接初始化
  public name: string = 'default';
  public age: number = 0;
  public active: boolean = true;
  
  // 数组初始化
  public items: string[] = [];
  
  // 对象初始化
  public config: Map<string, string> = new Map();
  
  // 联合类型初始化
  public value: number | string = 0;
  
  constructor() {
    // 属性已在声明时初始化
  }
}

let direct: DirectInitialization = new DirectInitialization();
console.info(`${direct.name}`);    // 'default'
console.info(`${direct.age}`);     // 0
console.info(`${direct.active}`); // true
// [End declaration_time_initialization]

// ===== constructor_body_initialization =====
// [Start constructor_body_initialization]
class ConstructorInitialization {
  public name: string;
  public age: number;
  public email: string;
  
  constructor(name: string, age: number, email: string) {
    // 构造函数内初始化
    this.name = name;
    this.age = age;
    this.email = email;
  }
  
  constructorDefault() {
    this.name = 'default';
    this.age = 0;
    this.email = '';
  }
}

let constructorInit: ConstructorInitialization = new ConstructorInitialization('Alice', 25, 'alice@example.com');

// 构造函数内初始化：
// 1. 接收外部参数
// 2. 动态计算初始值
// 3. 添加验证逻辑

class ValidatedInitialization {
  public value: number;
  
  constructor(value: number) {
    // 验证后初始化
    if (value < 0) {
      throw new Error('Value must be positive');
    }
    this.value = value;
  }
}

class CalculatedInitialization {
  public base: number;
  public calculated: number;
  
  constructor(base: number) {
    this.base = base;
    this.calculated = base * 2;  // 计算初始化
  }
}
// [End constructor_body_initialization]

// ===== optional_properties_initialization =====
// [Start optional_properties_initialization]
class OptionalProperties {
  public name: string;          // 必需属性
  public age?: number;          // 可选属性
  public email?: string;        // 可选属性
  public phone?: string;        // 可选属性
  
  constructor(name: string) {
    this.name = name;
    // 可选属性不需要初始化
  }
  
  setAge(age: number): void {
    this.age = age;  // 可选属性延迟初始化
  }
  
  getAge(): number {
    return this.age ?? 0;  // 处理未初始化情况
  }
  
  hasAge(): boolean {
    return this.age !== undefined;  // 检查是否初始化
  }
}

let optional: OptionalProperties = new OptionalProperties('Alice');
console.info(`${optional.hasAge()}`);  // false

optional.setAge(25);
console.info(`${optional.hasAge()}`);  // true
console.info(`${optional.getAge()}`);  // 25
// [End optional_properties_initialization]

// ===== static_factory_methods =====
// [Start static_factory_methods]
class FactoryUser {
  public id: number;
  public name: string;
  public email: string;
  public role: string;
  
  // 主构造函数
  constructor(id: number, name: string, email: string, role: string) {
    this.id = id;
    this.name = name;
    this.email = email;
    this.role = role;
  }
  
  // 静态工厂方法：封装常用构造场景
  static createGuest(): FactoryUser {
    return new FactoryUser(0, 'Guest', 'guest@example.com', 'guest');
  }
  
  static createAdmin(id: number, name: string, email: string): FactoryUser {
    return new FactoryUser(id, name, email, 'admin');
  }
  
  static createDefaultUser(name: string): FactoryUser {
    return new FactoryUser(1, name, `${name.toLowerCase()}@example.com`, 'user');
  }
}

let guest: FactoryUser = FactoryUser.createGuest();
let admin: FactoryUser = FactoryUser.createAdmin(1, 'Alice', 'alice@example.com');
let defaultUser: FactoryUser = FactoryUser.createDefaultUser('Bob');
// [End static_factory_methods]

// ===== private_constructor_with_factory =====
// [Start private_constructor_with_factory]
class FactoryConfiguration {
  public apiUrl: string;
  public timeout: number;
  public debug: boolean;
  
  private constructor(apiUrl: string, timeout: number, debug: boolean) {
    this.apiUrl = apiUrl;
    this.timeout = timeout;
    this.debug = debug;
  }
  
  // 静态工厂方法替代构造函数重载
  static createDefault(): FactoryConfiguration {
    return new FactoryConfiguration('EXAMPLE_API_URL', 5000, false);
  }
  
  static createWithUrl(apiUrl: string): FactoryConfiguration {
    // 调用默认配置，修改部分参数
    let factoryDefaultConfig: FactoryConfiguration = FactoryConfiguration.createDefault();
    return new FactoryConfiguration(apiUrl, factoryDefaultConfig.timeout, factoryDefaultConfig.debug);
  }
  
  static createDebug(): FactoryConfiguration {
    return new FactoryConfiguration('EXAMPLE_API_URL', 5000, true);
  }
  
  static copy(config: FactoryConfiguration): FactoryConfiguration {
    return new FactoryConfiguration(config.apiUrl, config.timeout, config.debug);
  }
}

let factoryDefaultConfig: FactoryConfiguration = FactoryConfiguration.createDefault();
let factoryUrlConfig: FactoryConfiguration = FactoryConfiguration.createWithUrl('EXAMPLE_API_URL');
let debugConfig: FactoryConfiguration = FactoryConfiguration.createDebug();
let copiedConfig: FactoryConfiguration = FactoryConfiguration.copy(factoryDefaultConfig);
// [End private_constructor_with_factory]

// ===== static_factory_use_cases =====
// [Start static_factory_use_cases]
class CasesPoint {
  public x: number;
  public y: number;
  
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
  
  // 静态工厂场景：
  
  // 1. 创建原点
  static origin(): CasesPoint {
    return new CasesPoint(0, 0);
  }
  
  // 2. 创建等值点
  static equal(value: number): CasesPoint {
    return new CasesPoint(value, value);
  }
  
  // 3. 从字符串解析
  static fromString(str: string): CasesPoint {
    let parts: string[] = str.split(',');
    return new CasesPoint(
      Number.parseInt(parts[0], 10),
      Number.parseInt(parts[1], 10)
    );
  }
  
  // 4. 从数组创建
  static fromArray(arr: number[]): CasesPoint {
    return new CasesPoint(arr[0], arr[1]);
  }
}

let origin: CasesPoint = CasesPoint.origin();
let equal: CasesPoint = CasesPoint.equal(10);
let fromStr: CasesPoint = CasesPoint.fromString('5,10');
let fromArr: CasesPoint = CasesPoint.fromArray([3, 4]);
// [End static_factory_use_cases]

// ===== static_properties_initialization =====
// [Start static_properties_initialization]
class StaticProperties {
  // 静态属性声明时初始化
  public static appName: string = 'MyApp';
  public static version: number = 1.0;
  public static maxConnections: number = 100;
  
  // 静态只读属性
  public static readonly PI: number = 3.14159;
  public static readonly MAX_VALUE: number = 1000;
  
  // 静态私有属性
  private static counter: number = 0;
  
  static getCounter(): number {
    return StaticProperties.counter;
  }
  
  static incrementCounter(): void {
    StaticProperties.counter++;
  }
}

console.info(`${StaticProperties.appName}`);       // 'MyApp'
console.info(`${StaticProperties.version}`);       // 1.0
console.info(`${StaticProperties.maxConnections}`); // 100
console.info(`${StaticProperties.PI}`);            // 3.14159
// [End static_properties_initialization]

// ===== static_initialization_function =====
// [Start static_initialization_function]
class StaticInitialization {
  public static config: Map<string, string>;
  public static initialized: boolean;
  
  // 静态初始化函数
  private static initialize(): void {
    StaticInitialization.config = new Map();
    StaticInitialization.config.set('apiUrl', 'EXAMPLE_API_URL');
    StaticInitialization.config.set('timeout', '5000');
    StaticInitialization.initialized = true;
    console.info('Static initialized');
  }
  
  // 确保静态初始化执行
  static getConfig(): Map<string, string> {
    if (!StaticInitialization.initialized) {
      StaticInitialization.initialize();
    }
    return StaticInitialization.config;
  }
}

let config: Map<string, string> = StaticInitialization.getConfig();
console.info(`${config.get('apiUrl')}`);  // EXAMPLE_API_URL

// 静态初始化时机：
// 类首次使用时执行
// 在任何实例创建前执行
// [End static_initialization_function]

// ===== global_config_static_initialization =====
// [Start global_config_static_initialization]
class GlobalConfig {
  private static initialized: boolean = false;
  private static settings: Map<string, string | number | boolean> = new Map();
  
  // 静态初始化：全局配置加载
  static ensureInitialized(): void {
    if (!GlobalConfig.initialized) {
      GlobalConfig.loadSettings();
      GlobalConfig.initialized = true;
    }
  }
  
  private static loadSettings(): void {
    // 模拟配置加载
    GlobalConfig.settings.set('apiUrl', 'EXAMPLE_API_URL');
    GlobalConfig.settings.set('timeout', 5000);
    GlobalConfig.settings.set('debug', false);
    GlobalConfig.settings.set('maxRetries', 3);
    console.info('Global configuration loaded');
  }
  
  // 全局配置访问
  static get(key: string): string | number | boolean | undefined {
    GlobalConfig.ensureInitialized();
    return GlobalConfig.settings.get(key);
  }
  
  static set(key: string, value: string | number | boolean): void {
    GlobalConfig.ensureInitialized();
    GlobalConfig.settings.set(key, value);
  }
  
  static reset(): void {
    GlobalConfig.settings.clear();
    GlobalConfig.initialized = false;
  }
}

// 使用全局配置
console.info(`${GlobalConfig.get('apiUrl')}`);      // 'EXAMPLE_API_URL'
console.info(`${GlobalConfig.get('timeout')}`);     // 5000
console.info(`${GlobalConfig.get('debug')}`);       // false

GlobalConfig.set('customKey', 'customValue');
console.info(`${GlobalConfig.get('customKey')}`);   // 'customValue'
// [End global_config_static_initialization]

// ===== required_properties_initialization =====
// [Start required_properties_initialization]
class StrictInitialization {
  // 必需属性：必须初始化
  public name: string = '';  // 编译警告：未初始化
  public age: number = 0;   // 编译警告：未初始化
  
  constructor() {
    // 未初始化name和age
    // TypeScript会提示警告
  }
  
  // 正确做法：初始化所有属性
  correctConstructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

class ProperInitialization {
  // 声明时初始化
  public name: string = '';
  public age: number = 0;
  
  constructor() {
    // 属性已初始化
  }
}

class OptionalInitialization {
  // 可选属性：可不初始化
  public name?: string;
  public age?: number;
  
  constructor() {
    // 可选属性允许未初始化
  }
  
  initialize(name: string, age: number): void {
    this.name = name;
    this.age = age;
  }
}
// [End required_properties_initialization]

// ===== safe_initialization_techniques =====
// [Start safe_initialization_techniques]
class SafeInitialization {
  public name: string;
  public age: number;
  public email?: string;
  
  constructor(name: string, age: number) {
    // 确保必需属性初始化
    this.name = name ?? 'default';
    this.age = age ?? 0;
    
    // 可选属性谨慎处理
    if (this.email === undefined) {
      console.info('Email not initialized');
    }
  }
  
  // 安全访问技巧
  getEmail(): string {
    return this.email ?? '';
  }
  
  hasEmail(): boolean {
    return this.email !== undefined && this.email.length > 0;
  }
  
  safeProcess(): void {
    // 检查后访问
    if (this.name !== undefined) {
      console.info(`${this.name}`);
    }
    
    // 使用空值合并
    let safeAge: number = this.age ?? 0;
    
    // 使用可选链（对象属性）
    let emailLength: number | undefined = this.email?.length;
  }
}
// [End safe_initialization_techniques]

// ===== best_practices_initialization =====
// [Start best_practices_initialization]
class BestPractice1 {
  // 推荐：声明时初始化
  public name: string = '';
  public age: number = 0;
  
  // 推荐：构造函数中初始化
  constructor(name?: string, age?: number) {
    if (name !== undefined) {
      this.name = name;
    }
    if (age !== undefined) {
      this.age = age;
    }
  }
  
  // 反例：未初始化必需属性
  // badName: string;  // 编译警告
}

class InitializationValidatedInitialization {
  public value: number;
  
  constructor(value: number) {
    // 推荐：验证后初始化
    if (value < 0) {
      this.value = 0;  // 默认值
    } else {
      this.value = value;
    }
  }
}
// [End best_practices_initialization]

// ===== optional_properties_safe_handling =====
// [Start optional_properties_safe_handling]
class UserProfile {
  // 必需属性
  public id: number;
  public name: string;
  
  // 可选属性：明确可能未初始化
  public nickname?: string;
  public avatar?: string;
  public bio?: string;
  
  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
    // 可选属性不初始化
  }
  
  // 安全处理可选属性
  getDisplayName(): string {
    return this.nickname ?? this.name;
  }
  
  getAvatarUrl(): string {
    return this.avatar ?? '/default-avatar.png';
  }
  
  hasBio(): boolean {
    return this.bio !== undefined && this.bio.length > 0;
  }
}
// [End optional_properties_safe_handling]

// ===== smart_constructor_pattern =====
// [Start smart_constructor_pattern]
class SmartConstructor {
  public value: number;
  public name: string;
  
  // 推荐：使用静态工厂方法
  private constructor(value: number, name: string) {
    this.value = value;
    this.name = name;
  }
  
  static createDefault(): SmartConstructor {
    return new SmartConstructor(0, 'default');
  }
  
  static createWithValue(value: number): SmartConstructor {
    return new SmartConstructor(value, `value-${value}`);
  }
  
  static createCustom(value: number, name: string): SmartConstructor {
    return new SmartConstructor(value, name);
  }
}

let patternDefaultObj: SmartConstructor = SmartConstructor.createDefault();
let valueObj: SmartConstructor = SmartConstructor.createWithValue(10);
let customObj: SmartConstructor = SmartConstructor.createCustom(20, 'custom');
// [End smart_constructor_pattern]


// [Start declare_field_init]
interface DfiAnimal {
  dateOfBirth: Date;
}

interface DfiDog extends DfiAnimal {
  breed: string;
}

class DfiAnimalHouse {
  public resident: DfiAnimal;

  constructor(animal: DfiAnimal) {
    this.resident = animal;
  }
}

class DfiDogHouse extends DfiAnimalHouse {
  public declare resident: DfiDog;

  constructor(dog: DfiDog) {
    super(dog);
  }
}

let dfiDog: DfiDog = { dateOfBirth: new Date(), breed: 'Labrador' };
let dfiHouse: DfiDogHouse = new DfiDogHouse(dfiDog);
console.info(`${dfiHouse.resident.breed}`);  // Labrador
// [End declare_field_init]

// [Start init_order]
class IoBase {
  public name: string = 'base';

  constructor() {
    console.info(`Base constructor: name = ${this.name}`);
  }
}

class IoDerived extends IoBase {
  public name: string = 'derived';

  constructor() {
    super();
    console.info(`Derived constructor: name = ${this.name}`);
  }
}

let ioD: IoDerived = new IoDerived();
// 输出：
// Base constructor: name = base（派生类字段尚未初始化）
// Derived constructor: name = derived
// [End init_order]

// ===== static_block_usage =====
// [Start static_block_usage]
class StaticBlockConfig {
  private static count: number = 0;

  static {
    try {
      let data: string[] = ['a', 'b', 'c'];
      StaticBlockConfig.count = data.length;
    } catch (e) {
      StaticBlockConfig.count = 0;
    }
  }

  static getCount(): number {
    return StaticBlockConfig.count;
  }
}

console.info(`${StaticBlockConfig.getCount()}`); // 3
// [End static_block_usage]

// ===== immutable_object_pattern =====
// [Start immutable_object_pattern]
class ImmutablePoint {
  public readonly x: number;
  public readonly y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
    // 构造后x, y不可修改
  }

  translate(dx: number, dy: number): ImmutablePoint {
    return new ImmutablePoint(this.x + dx, this.y + dy);
  }
}
// [End immutable_object_pattern]

// ===== optional_chaining_safe_access =====
// [Start optional_chaining_safe_access]
interface OptionalProfile {
  nickname?: string;
  avatar?: string;
}

class OptionalChainExample {
  public name?: string;
  public age?: number;
  public profile?: OptionalProfile;
  
  constructor() {
    // 可选属性可不初始化
  }
  
  // 使用可选链安全访问
  safeAccess(): void {
    // 可选链访问属性
    let nameLength: number | undefined = this.name?.length;
    
    // 可选链访问嵌套对象
    let nickname: string | undefined = this.profile?.nickname;
    let avatar: string | undefined = this.profile?.avatar;
    
    // 可选链 + 空值合并
    let displayName: string = this.name ?? 'Unknown';
    let displayNickname: string = this.profile?.nickname ?? 'Guest';
  }
  
  // 安全方法
  getProfileInfo(): string {
    if (this.profile !== undefined) {
      let nickname: string = this.profile.nickname ?? 'No nickname';
      let avatar: string = this.profile.avatar ?? 'No avatar';
      return `Nickname: ${nickname}, Avatar: ${avatar}`;
    }
    return 'No profile';
  }
  
  // 可选链检查
  checkInitialization(): void {
    if (this.name !== undefined) {
      console.info(`Name: ${this.name}`);
    }
    
    if (this.profile?.nickname !== undefined) {
      console.info(`Nickname: ${this.profile.nickname}`);
    }
  }
}
// [End optional_chaining_safe_access]
