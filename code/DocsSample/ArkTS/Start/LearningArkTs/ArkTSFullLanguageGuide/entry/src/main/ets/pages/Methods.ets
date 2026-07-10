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

// ===== method_definition_basic =====
// [Start method_definition_basic]
class Calculator {
  public value: number = 0;
  
  // 方法定义：执行操作
  add(n: number): void {
    this.value += n;
  }
  
  // 方法定义：计算结果
  getValue(): number {
    return this.value;
  }
  
  // 方法的作用：封装行为逻辑
  reset(): void {
    this.value = 0;
  }
}

let calc: Calculator = new Calculator();
calc.add(10);          // 执行操作
console.info(`${calc.getValue().toString()}`);  // 10，计算结果
calc.reset();           // 重置状态
console.info(`${calc.getValue().toString()}`);  // 0
// [End method_definition_basic]

// ===== standalone_function_vs_method =====
// [Start standalone_function_vs_method]
// 独立函数：不依附于类
function standaloneAdd(a: number, b: number): number {
  return a + b;
}

// 类方法：依附于类，可访问类内部状态
class Accumulator {
  private total: number = 0;
  
  // 方法：可访问私有状态
  add(n: number): void {
    this.total += n;
  }
  
  getTotal(): number {
    return this.total;
  }
  
  // 方法优势：封装和状态管理
  reset(): void {
    this.total = 0;
  }
}

// 差异对比
console.info(`${standaloneAdd(1, 2).toString()}`);  // 3，无状态

let acc: Accumulator = new Accumulator();
acc.add(10);
acc.add(20);
console.info(`${acc.getTotal().toString()}`);  // 30，有状态管理

// 方法可以访问私有数据，函数不能
// 独立函数无法访问acc.total（私有）
// [End standalone_function_vs_method]

// ===== instance_method_declaration =====
// [Start instance_method_declaration]
class Student {
  public name: string;
  public age: number;
  
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
  
  // 实例方法声明
  study(): void {
    console.info(`${this.name} is studying`);
  }
  
  // 带参数的实例方法
  studyFor(subject: string): void {
    console.info(`${this.name} is studying ${subject}`);
  }
  
  // 带返回值的实例方法
  getInfo(): string {
    return `${this.name}, ${this.age} years old`;
  }
  
  // 带默认参数的方法
  greet(greeting: string = 'Hello'): string {
    return `${greeting}, I'm ${this.name}`;
  }
}

let student: Student = new Student('Alice', 20);

// 调用实例方法
student.study();               // 'Alice is studying'
student.studyFor('Math');       // 'Alice is studying Math'
console.info(`${student.getInfo()}`); // 'Alice, 20 years old'
console.info(`${student.greet()}`);   // 'Hello, I'm Alice'
console.info(`${student.greet('Hi')}`); // 'Hi, I'm Alice'
// [End instance_method_declaration]

// ===== instance_method_on_separate_instances =====
// [Start instance_method_on_separate_instances]
class Logger {
  private logs: string[] = [];
  
  // 实例方法
  log(message: string): void {
    this.logs.push(message);
    console.info(`Logged: ${message}`);
  }
  
  // 实例方法
  getLogs(): string[] {
    return [...this.logs];
  }
  
  // 实例方法
  clear(): void {
    this.logs = [];
    console.info('Logs cleared');
  }
}

// 创建实例
let logger1: Logger = new Logger();
let logger2: Logger = new Logger();

// 每个实例独立调用方法
logger1.log('Error in module A');
logger1.log('Warning in module B');
logger2.log('Info from module C');

console.info(`${logger1.getLogs().join(', ')}`);  // Error in module A, Warning in module B
console.info(`${logger2.getLogs().join(', ')}`);  // Info from module C

// 方法作用于特定实例
logger1.clear();
console.info(`${logger1.getLogs().length}`);  // 0
console.info(`${logger2.getLogs().join(', ')}`);  // Info from module C
// [End instance_method_on_separate_instances]

// ===== static_properties_and_initialization =====
// [Start static_properties_and_initialization]
class Configuration {
  // 静态属性：类级别数据
  private static settings: Map<string, string> = new Map();
  
  // 静态初始化（类加载时执行）
  static {
    Configuration.settings.set('apiUrl', 'EXAMPLE_API_URL');
    Configuration.settings.set('timeout', '5000');
    console.info('Configuration initialized');
  }
  
  // 静态方法：无this，访问静态属性
  static get(key: string): string | undefined {
    return Configuration.settings.get(key);
  }
  
  static set(key: string, value: string): void {
    Configuration.settings.set(key, value);
  }
  
  static getAll(): Map<string, string> {
    return new Map(Configuration.settings);
  }
  
  // 静态方法在类生命周期内
  static reset(): void {
    Configuration.settings.clear();
    console.info('Configuration reset');
  }
}

// 类加载时静态初始化执行
console.info(`${Configuration.get('apiUrl')}`);     // EXAMPLE_API_URL
console.info(`${Configuration.get('timeout')}`);    // 5000

Configuration.set('debug', 'true');
console.info(`${Configuration.get('debug')}`);      // true

Configuration.reset();
console.info(`${Configuration.get('apiUrl')}`);     // undefined
// [End static_properties_and_initialization]

// ===== static_factory_singleton_utility =====
// [Start static_factory_singleton_utility]
// 1. 工厂方法
class User {
  private id: number;
  private name: string;

  private constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }
  
  // 静态工厂方法
  static create(id: number, name: string): User {
    return new User(id, name);
  }
  
  static createGuest(): User {
    return new User(0, 'Guest');
  }
  
  static createAdmin(id: number): User {
    return new User(id, 'Admin');
  }
  
  getInfo(): string {
    return `User ${this.id}: ${this.name}`;
  }
}

let admin: User = User.createAdmin(1);
let guest: User = User.createGuest();
console.info(`${admin.getInfo()}`);   // User 1: Admin
console.info(`${guest.getInfo()}`);   // User 0: Guest

// 2. 单例模式
class Singleton {
  private static instance: Singleton | undefined = undefined;
  
  private constructor() {}
  
  static getInstance(): Singleton {
    if (Singleton.instance === undefined) {
      Singleton.instance = new Singleton();
    }
    return Singleton.instance;
  }
  
  doSomething(): void {
    console.info('Singleton working');
  }
}

let s1: Singleton = Singleton.getInstance();
let s2: Singleton = Singleton.getInstance();
console.info(`${(s1 === s2).toString()}`);  // true，同一实例

// 3. 工具方法
class ArrayUtils {
  static isEmpty<T>(arr: T[]): boolean {
    return arr.length === 0;
  }
  
  static first<T>(arr: T[]): T | undefined {
    return arr[0];
  }
  
  static last<T>(arr: T[]): T | undefined {
    return arr[arr.length - 1];
  }
  
  static flatten<T>(arr: T[][]): T[] {
    let result: T[] = [];
    for (let sub of arr) {
      for (let item of sub) {
        result.push(item);
      }
    }
    return result;
  }
}
// [End static_factory_singleton_utility]

// ===== method_parameters_and_defaults =====
// [Start method_parameters_and_defaults]
class EmailSender {
  // 参数类型标注
  send(to: string, subject: string, body: string): void {
    console.info(`Sending to ${to}: ${subject}`);
  }
  
  // 默认参数值
  sendTemplate(to: string, template: string = 'default'): void {
    console.info(`Template ${template} to ${to}`);
  }
  
  // 多个默认参数
  sendWithOptions(
    to: string,
    subject: string = 'No Subject',
    priority: string = 'normal',
    cc: string | undefined = undefined
  ): void {
    console.info(`To: ${to}, Subject: ${subject}, Priority: ${priority}`);
    if (cc !== undefined) {
      console.info(`CC: ${cc}`);
    }
  }
}

let sender: EmailSender = new EmailSender();

sender.send('alice@example.com', 'Hello', 'Body content');
sender.sendTemplate('bob@example.com');           // default template
sender.sendTemplate('bob@example.com', 'custom');  // custom template

sender.sendWithOptions('test@example.com');  // 使用所有默认值
sender.sendWithOptions('test@example.com', 'Important');
sender.sendWithOptions('test@example.com', 'Important', 'high', 'admin@example.com');
// [End method_parameters_and_defaults]

// ===== rest_parameters =====
// [Start rest_parameters]
class NumberProcessor {
  // 剩余参数：收集多个参数
  sum(...values: number[]): number {
    let total: number = 0;
    for (let value of values) {
      total += value;
    }
    return total;
  }
  
  // 混合参数：普通参数 + 剩余参数
  process(base: number, ...modifiers: number[]): number {
    let result: number = base;
    for (let modifier of modifiers) {
      result += modifier;
    }
    return result;
  }
  
  // 剩余参数类型
  join(separator: string, ...parts: string[]): string {
    return parts.join(separator);
  }
}

let processor: NumberProcessor = new NumberProcessor();

console.info(`${processor.sum(1, 2, 3, 4).toString()}`);       // 10
console.info(`${processor.sum(10).toString()}`);              // 10
console.info(`${processor.sum().toString()}`);                // 0

console.info(`${processor.process(100, 10, 20).toString()}`);  // 130
console.info(`${processor.process(50).toString()}`);           // 50

console.info(`${processor.join('-', 'a', 'b', 'c')}`);  // 'a-b-c'
// [End rest_parameters]

// ===== object_parameters =====
// [Start object_parameters]
// TypeScript支持：function foo({x, y}: Point)
// ArkTS不支持，需要手动提取

class PointOperations {
  move(point: Point, dx: number, dy: number): Point {
    let x: number = point.x;  // 手动提取
    let y: number = point.y;
    return { x: x + dx, y: y + dy };
  }
  
  processOptions(options: Options): string {
    let timeout: number = options.timeout;
    let retries: number = options.retries;
    let verbose: boolean = options.verbose;
    
    return `Timeout: ${timeout}, Retries: ${retries}, Verbose: ${verbose}`;
  }
}

interface Point {
  x: number;
  y: number;
}

interface Options {
  timeout: number;
  retries: number;
  verbose: boolean;
}

let ops: PointOperations = new PointOperations();
let result: Point = ops.move({ x: 10, y: 20 }, 5, 3);
console.info(JSON.stringify(result));  // {"x":15,"y":23}

console.info(ops.processOptions({ timeout: 5000, retries: 3, verbose: true }));
// [End object_parameters]

// ===== optional_parameters =====
// [Start optional_parameters]
class DocumentGenerator {
  // 可选参数：使用 ? 修饰
  generate(title: string, author?: string): string {
    if (author !== undefined) {
      return `Title: ${title}, Author: ${author}`;
    }
    return `Title: ${title}`;
  }
  
  // 多个可选参数
  createReport(
    title: string,
    subtitle?: string,
    author?: string,
    date?: string
  ): string {
    let report: string = `Title: ${title}`;
    if (subtitle !== undefined) {
      report += `, Subtitle: ${subtitle}`;
    }
    if (author !== undefined) {
      report += `, Author: ${author}`;
    }
    if (date !== undefined) {
      report += `, Date: ${date}`;
    }
    return report;
  }
  
  // 可选参数必须在必需参数之后
  format(text: string, prefix?: string, suffix?: string): string {
    let result: string = text;
    if (prefix !== undefined) {
      result = prefix + result;
    }
    if (suffix !== undefined) {
      result = result + suffix;
    }
    return result;
  }
}

let generator: DocumentGenerator = new DocumentGenerator();

console.info(`${generator.generate('Report')}`);              // Title: Report
console.info(`${generator.generate('Report', 'Alice')}`);     // Title: Report, Author: Alice

console.info(`${generator.createReport('Annual Report')}`);  // Title: Annual Report
console.info(`${generator.createReport('Annual Report', '2023 Summary')}`);  // Title + Subtitle
console.info(`${generator.createReport('Annual Report', '2023 Summary', 'Bob', '2023-01-01')}`);

console.info(`${generator.format('Hello')}`);                // 'Hello'
console.info(`${generator.format('Hello', '[')}`);            // '[Hello'
console.info(`${generator.format('Hello', '[', ']')}`);       // '[Hello]'
// [End optional_parameters]

// ===== method_overload_signatures =====
// [Start method_overload_signatures]
class DataParser {
  // 重载签名
  parse(data: string): string[];
  parse(data: number): string;
  parse(data: string | number): string | string[] {
    if (typeof data === 'string') {
      return data.split(',');
    }
    return data.toString();
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
  
  // 不同返回类型重载
  convert(input: string): number;
  convert(input: number): string;
  convert(input: string | number): string | number {
    if (typeof input === 'string') {
      return Number.parseInt(input, 10);
    }
    return input.toString();
  }
}

let parser: DataParser = new DataParser();

console.info(`${parser.parse('a,b,c').join(', ')}`);     // a, b, c
console.info(`${parser.parse(123)}`);          // '123'

console.info(`${parser.format(3.14159)}`);      // '3.14159'
console.info(`${parser.format(3.14159, 2)}`);   // '3.14'

console.info(`${parser.convert('42').toString()}`);        // 42
console.info(`${parser.convert(100)}`);         // '100'
// [End method_overload_signatures]

// ===== method_overload_implementation =====
// [Start method_overload_implementation]
class ImplementationCalculator {
  // 重载签名：定义公共接口
  calculate(a: number, b: number): number;
  calculate(a: string, b: string): string;
  
  // 实现签名：必须兼容所有重载
  calculate(a: number | string, b: number | string): number | string {
    if (typeof a === 'number' && typeof b === 'number') {
      return a + b;
    }
    if (typeof a === 'string' && typeof b === 'string') {
      return a + b;
    }
    // 处理不匹配情况
    return 0;
  }
  
  // 参数数量不同的重载
  process(value: number): number;
  process(value: number, multiplier: number): number;
  
  process(value: number, multiplier?: number): number {
    if (multiplier !== undefined) {
      return value * multiplier;
    }
    return value;
  }
}

let implementationCalc: ImplementationCalculator = new ImplementationCalculator();

console.info(`${implementationCalc.calculate(5, 3)}`);       // 8
console.info(`${implementationCalc.calculate('a', 'b')}`);   // 'ab'

console.info(`${implementationCalc.process(10)}`);            // 10
console.info(`${implementationCalc.process(10, 2)}`);         // 20
// [End method_overload_implementation]

// ===== overload_rules =====
// [Start overload_rules]
class OverloadExample {
  // 重载必须类型兼容
  method(x: number): string;
  method(x: string): number;
  method(x: number | string): string | number {
    if (typeof x === 'number') {
      return `Number: ${x}`;
    }
    return x.length;
  }
  
  // 不能仅用可选参数区分重载
  // method(a: number): void;
  // method(a: number, b?: number): void;  // 冲突
  
  // 重载顺序：更具体的类型先声明
  handle(value: string): string;      // 更具体
  handle(value: number): number;      // 更具体
  handle(value: string | number): string | number {  // 实现签名
    if (typeof value === 'string') {
      return value.toUpperCase();
    }
    return value * 2;
  }
}

let example: OverloadExample = new OverloadExample();

console.info(`${example.method(10)}`);    // 'Number: 10'
console.info(`${example.method('test')}`); // 4

console.info(`${example.handle('hello')}`);  // 'HELLO'
console.info(`${example.handle(5)}`);        // 10
// [End overload_rules]

// ===== overload_alternatives =====
// [Start overload_alternatives]
class SafeConverter {
  // 使用静态方法替代重载（更清晰）
  static toNumberFromString(value: string): number | null {
    let result: number = Number.parseInt(value, 10);
    return Number.isNaN(result) ? null : result;
  }
  
  static toNumberFromNumber(value: number): number {
    return value;
  }
  
  // 或使用联合类型和类型守卫
  convert(value: string | number): number | null {
    if (typeof value === 'string') {
      let result: number = Number.parseInt(value, 10);
      return Number.isNaN(result) ? null : result;
    }
    return value;
  }
  
  // 为不同场景提供不同方法名
  fromString(str: string): number | null {
    let result: number = Number.parseInt(str, 10);
    return Number.isNaN(result) ? null : result;
  }
  
  fromNumber(num: number): number {
    return num;
  }
}

let converter: SafeConverter = new SafeConverter();

console.info(`${SafeConverter.toNumberFromString('123')}`);  // 123
console.info(`${SafeConverter.toNumberFromNumber(456)}`);    // 456

console.info(`${converter.convert('42')}`);        // 42
console.info(`${converter.convert(100)}`);         // 100

console.info(`${converter.fromString('abc')}`);    // null
console.info(`${converter.fromNumber(200)}`);      // 200
// [End overload_alternatives]

// ===== method_override =====
// [Start method_override]
class Animal {
  speak(): string {
    return 'Animal speaks';
  }
  
  move(): void {
    console.info('Animal moves');
  }
}

class Dog extends Animal {
  // 重写方法（TypeScript中override可选）
  speak(): string {
    return 'Dog barks';
  }
  
  // 重写并扩展父类方法
  move(): void {
    console.info('Dog runs');
  }
}

class Cat extends Animal {
  speak(): string {
    return 'Cat meows';
  }
  
  move(): void {
    console.info('Cat walks');
  }
}

let dog: Dog = new Dog();
let cat: Cat = new Cat();

console.info(`${dog.speak()}`);  // 'Dog barks'
console.info(`${cat.speak()}`);  // 'Cat meows'

dog.move();  // 'Dog runs'
cat.move();  // 'Cat walks'

// 父类引用指向子类实例
let animal: Animal = new Dog();
console.info(`${animal.speak()}`);  // 'Dog barks'（动态绑定）
// [End method_override]

// ===== super_keyword_usage =====
// [Start super_keyword_usage]
class Vehicle {
  start(): void {
    console.info('Vehicle starting...');
  }
  
  stop(): void {
    console.info('Vehicle stopped');
  }
  
  getInfo(): string {
    return 'Vehicle info';
  }
}

class Car extends Vehicle {
  start(): void {
    super.start();  // 调用父类方法
    console.info('Car engine started');
  }
  
  stop(): void {
    console.info('Car engine off');
    super.stop();  // 调用父类方法
  }
  
  getInfo(): string {
    return `${super.getInfo()}, Car model: Tesla`;  // 扩展父类返回值
  }
  
  // 额外方法
  accelerate(): void {
    console.info('Car accelerating');
  }
}

let car: Car = new Car();

car.start();  // Vehicle starting..., Car engine started
car.stop();   // Car engine off, Vehicle stopped
console.info(`${car.getInfo()}`);  // 'Vehicle info, Car model: Tesla'
// [End super_keyword_usage]

// ===== override_and_extend =====
// [Start override_and_extend]
class ExtendLogger {
  log(message: string): void {
    console.info(`[LOG] ${message}`);
  }
}

class DetailedLogger extends ExtendLogger {
  // 重写方法，改变行为
  log(message: string): void {
    console.info(`[DETAIL] ${message}`);
    console.info(`Timestamp: ${new Date().toISOString()}`);
  }
  
  // 保留父类方法并添加新行为
  logWithParent(message: string): void {
    super.log(message);  // 父类方法
    console.info(`Additional info for ${message}`);
  }
  
  // 新方法，不冲突
  logError(error: string): void {
    this.log(`ERROR: ${error}`);
  }
}

let detailed: DetailedLogger = new DetailedLogger();

detailed.log('test');           // [DETAIL] test, Timestamp: ...
detailed.logWithParent('test'); // [LOG] test, Additional info...
detailed.logError('failed');    // [DETAIL] ERROR: failed

// 父类引用
let logger: ExtendLogger = new DetailedLogger();
logger.log('test');  // [DETAIL] test（调用子类重写方法）
// [End override_and_extend]

// ===== arrow_function_methods =====
// [Start arrow_function_methods]
class Timer {
  private seconds: number = 0;
  
  // 普通方法：this可能丢失
  start(): void {
    setInterval(() => {
      this.tick();  // 箭头函数保持this
    }, 1000);
  }
  
  // 箭头函数方法：this永不丢失
  public tick = (): void => {
    this.seconds++;
    console.info(`${this.seconds}`);
  }
  
  // 箭头函数方法适合作为回调
  public getHandler = (): () => void => {
    return () => {
      console.info(`Timer at ${this.seconds}`);
    };
  }
  
  getSeconds(): number {
    return this.seconds;
  }
}

function setInterval(callback: () => void, ms: number): void {
  callback();
}

let timer: Timer = new Timer();
timer.start();       // 1
timer.tick();        // 2

let handler: () => void = timer.getHandler();
handler();           // 'Timer at 2'

// 箭头函数方法的限制
// 不能使用super
// 不能作为构造函数
// 没有arguments对象
// [End arrow_function_methods]

// ===== method_chaining =====
// [Start method_chaining]
class StringBuilder {
  private buffer: string = '';
  
  // 链式调用：返回this
  append(text: string): StringBuilder {
    this.buffer += text;
    return this;
  }
  
  prepend(text: string): StringBuilder {
    this.buffer = text + this.buffer;
    return this;
  }
  
  uppercase(): StringBuilder {
    this.buffer = this.buffer.toUpperCase();
    return this;
  }
  
  lowercase(): StringBuilder {
    this.buffer = this.buffer.toLowerCase();
    return this;
  }
  
  // 终结方法：返回结果
  build(): string {
    return this.buffer;
  }
  
  toString(): string {
    return this.buffer;
  }
}

// 链式调用
let chainResult: string = new StringBuilder()
  .append('hello')
  .append(' ')
  .append('world')
  .uppercase()
  .build();

console.info(`${chainResult}`);  // 'HELLO WORLD'

let result2: string = new StringBuilder()
  .prepend('Start: ')
  .append('End')
  .build();

console.info(`${result2}`);  // 'Start: End'
// [End method_chaining]


// ===== this_parameter_usage =====
// [Start this_parameter_usage]
class TpThisCounter {
  public count: number = 0;
  increment(this: TpThisCounter): void {
    this.count++;
  }
}

let tpThisCounter: TpThisCounter = new TpThisCounter();
tpThisCounter.increment();
console.info(`${tpThisCounter.count}`); // 1
// [End this_parameter_usage]

// ===== optional_chaining_methods =====
// [Start optional_chaining_methods]
class OptionalService {
  private available: boolean = true;
  
  process(): void {
    if (this.available) {
      console.info('Processing...');
    }
  }
  
  getData(): string | null {
    return this.available ? 'data' : null;
  }
}

function createOptionalService(available: boolean): OptionalService | null {
  return available ? new OptionalService() : null;
}

let service1: OptionalService | null = createOptionalService(true);
let service2: OptionalService | null = createOptionalService(false);

// 可选链调用方法
service1?.process();  // 'Processing...'
service2?.process();  // 不执行

// 可选链调用并获取返回值
let data1: string | null | undefined = service1?.getData();
console.info(`${data1}`);  // 'data'

let data2: string | null | undefined = service2?.getData();
console.info(`${data2}`);  // undefined

// 结合空值合并
let chainResult2: string = service1?.getData() ?? 'default';
console.info(`${chainResult2}`);  // 'data'

let chainResult22: string = service2?.getData() ?? 'default';
console.info(`${chainResult22}`);  // 'default'

// 可选链的链式调用
class Chain {
  public next?: Chain;
  
  execute(): void {
    console.info('Executed');
  }
}

let chain: Chain | null = new Chain();
chain?.next?.execute();  // 不执行（next未定义）
// [End optional_chaining_methods]

// ===== this_guard_alternative =====
// [Start this_guard_alternative]
class TgFileSystemObject {
  public path: string;

  constructor(path: string) {
    this.path = path;
  }
}

class TgFileRep extends TgFileSystemObject {
  public content: string = '';

  constructor(path: string) {
    super(path);
  }
}

class TgDirectory extends TgFileSystemObject {
  public children: TgFileSystemObject[] = [];

  constructor(path: string) {
    super(path);
  }
}

function tgProcess(fso: TgFileSystemObject): void {
  if (fso instanceof TgFileRep) {
    console.info(`File: ${fso.content}`);
  } else if (fso instanceof TgDirectory) {
    console.info(`Directory: ${fso.children.length} children`);
  }
}

let tgFile: TgFileRep = new TgFileRep('/readme.txt');
tgFile.content = 'Hello';
tgProcess(tgFile);  // File: Hello
// [End this_guard_alternative]

// ===== this_binding_and_arrow_function =====
// [Start this_binding_and_arrow_function]
class Counter {
  public count: number = 0;

  // 实例方法：this指向实例
  increment(): void {
    this.count++;
    console.info(`${this.count}`);
  }

  // 返回方法引用：可能丢失this
  getIncrementMethod(): () => void {
    return this.increment;  // 方法引用
  }

  // 使用箭头函数保持this
  getSafeIncrementMethod(): () => void {
    return () => {
      this.count++;  // 箭头函数保持this
      console.info(`${this.count}`);
    };
  }
}

let counter: Counter = new Counter();

// 正常调用：this正确
counter.increment();  // 1

// 方法引用调用：this可能丢失
let method: () => void = counter.getIncrementMethod();
method();  // 可能丢失this，取决于调用方式

// 安全方法引用：this保持
let safeMethod: () => void = counter.getSafeIncrementMethod();
safeMethod();  // 2，this正确

// 解决方案：绑定this
class Button {
  private onClickHandler: () => void;

  constructor() {
    // 箭头函数绑定this
    this.onClickHandler = () => {
      this.handleClick();
    };
  }

  private handleClick(): void {
    console.info(`Button clicked`);
  }

  getHandler(): () => void {
    return this.onClickHandler;
  }
}
// [End this_binding_and_arrow_function]

// ===== method_as_callback =====
// [Start method_as_callback]
class EventHandler {
  private name: string;

  constructor(name: string) {
    this.name = name;
  }

  // 普通方法：传递时this可能丢失
  handleClick(): void {
    console.info(`${this.name} clicked`);
  }

  // 箭头函数方法：this保持
  public handleSafeClick = (): void => {
    console.info(`${this.name} safe clicked`);
  }

  // 返回安全回调：用箭头函数包装实例方法
  getClickHandler(): () => void {
    return (): void => {
      this.handleClick();
    };
  }
}

// 模拟事件系统
function addEventListener(callbackHandler: () => void): void {
  callbackHandler();
}

let callbackHandler: EventHandler = new EventHandler('Button');

// 直接传递：this可能丢失
let callbackMethod: () => void = callbackHandler.handleClick;
callbackMethod();  // 可能丢失this

// 使用箭头函数方法
addEventListener(callbackHandler.handleSafeClick);  // 'Button safe clicked'

// 使用显式包装方法
addEventListener(callbackHandler.getClickHandler());  // 'Button clicked'
// [End method_as_callback]
