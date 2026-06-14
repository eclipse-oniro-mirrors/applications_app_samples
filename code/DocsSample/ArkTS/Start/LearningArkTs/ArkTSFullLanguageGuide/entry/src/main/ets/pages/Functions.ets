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

// ===== function_declaration_basic =====
// [Start function_declaration_basic]
// 基本函数声明
function add(a: number, b: number): number {
  return a + b;
}

// 函数调用
let result: number = add(1, 2);

// 无返回值函数
function logMessage(message: string): void {
  console.info(`${message}`);
}

logMessage('Hello, ArkTS');

// 简单计算函数
function multiply(x: number, y: number): number {
  return x * y;
}

let product: number = multiply(5, 3);  // 15

// 复杂逻辑函数
function calculateArea(width: number, height: number): number {
  let area: number = width * height;
  return area;
}

let area: number = calculateArea(10, 20);  // 200
// [End function_declaration_basic]

// ===== function_naming_conventions =====
// [Start function_naming_conventions]
// 函数名：动词或动词短语，camelCase
function calculateTotal() {}
function validateInput() {}
function processData() {}
function fetchUserInfo() {}

// 参数名：名词，camelCase，描述性
function greet(userName: string): string {
  return `Hello, ${userName}`;
}

function calculateDistance(startPoint: Point, endPoint: Point): number {
  return Math.sqrt(
    Math.pow(endPoint.x - startPoint.x, 2) +
    Math.pow(endPoint.y - startPoint.y, 2)
  );
}

interface Point {
  x: number;
  y: number;
}

// 避免无意义命名
// 反例：function f(a, b) {}
// 推荐：function calculateSum(firstValue: number, secondValue: number) {}
// [End function_naming_conventions]

// ===== function_invocation_methods =====
// [Start function_invocation_methods]
// 直接调用
function sayHello(): void {
  console.info('Hello');
}

sayHello();

// 带参数调用
function invokeGreet(name: string): void {
  console.info(`Hello, ${name}`);
}

invokeGreet('Alice');

// 带返回值调用
function invokeAdd(a: number, b: number): number {
  return a + b;
}

let sum: number = invokeAdd(1, 2);

// 链式调用
function double(x: number): number {
  return x * 2;
}

let invokeResult: number = double(double(5));  // 20

// 嵌套调用
function square(x: number): number {
  return x * x;
}

function sumOfSquares(a: number, b: number): number {
  return square(a) + square(b);
}

let squaresSum: number = sumOfSquares(3, 4);  // 25

// 条件调用
function invokeProcessData(data: string | null): void {
  if (data !== null) {
    processValidData(data);
  }
}

function processValidData(data: string): void {
  console.info(`${data}`);
}
// [End function_invocation_methods]

// ===== function_return_values =====
// [Start function_return_values]
// 单一返回值
function getMax(a: number, b: number): number {
  return a > b ? a : b;
}

let max: number = getMax(10, 20);

// 无返回值
function logInfo(info: string): void {
  console.info(`${info}`);
  // 无return或return;
}

// 提前返回
function validateAge(age: number): boolean {
  if (age < 0) {
    return false;
  }
  if (age > 150) {
    return false;
  }
  return true;
}

// 多路径返回
function classifyNumber(value: number): string {
  if (value > 0) {
    return 'positive';
  }
  if (value < 0) {
    return 'negative';
  }
  return 'zero';
}

// 返回对象
function createUser(id: number, name: string): User {
  return {
    id: id,
    name: name,
    active: true
  };
}

interface User {
  id: number;
  name: string;
  active: boolean;
}

let user: User = createUser(1, 'Alice');

// 返回数组
function createRange(start: number, end: number): number[] {
  let result: number[] = [];
  for (let i: number = start; i <= end; i++) {
    result.push(i);
  }
  return result;
}

let range: number[] = createRange(1, 5);
console.info(`${range.join(', ')}`);  // 1, 2, 3, 4, 5
// [End function_return_values]

// ===== optional_parameters =====
// [Start optional_parameters]
// 可选参数
function paramsGreet(name: string, title?: string): string {
  if (title !== undefined) {
    return `Hello, ${title} ${name}`;
  }
  return `Hello, ${name}`;
}

paramsGreet('Alice');           // "Hello, Alice"
paramsGreet('Alice', 'Dr.');    // "Hello, Dr. Alice"

// 可选参数必须在必需参数之后
function buildMessage(
  content: string,
  prefix?: string,
  suffix?: string
): string {
  let result: string = content;
  if (prefix !== undefined) {
    result = prefix + result;
  }
  if (suffix !== undefined) {
    result = result + suffix;
  }
  return result;
}

buildMessage('Hello');           // "Hello"
buildMessage('Hello', '[');      // "[Hello"
buildMessage('Hello', '[', ']'); // "[Hello]"

// 检查可选参数
function processConfig(config: Config): void {
  if (config.timeout !== undefined) {
    console.info(`超时: ${config.timeout}`);
  }
  if (config.retries !== undefined) {
    console.info(`重试次数: ${config.retries}`);
  }
}

interface Config {
  timeout?: number;
  retries?: number;
}
// [End optional_parameters]

// ===== default_parameters =====
// [Start default_parameters]
// 默认参数
function paramsGreet2(name: string, greeting: string = 'Hello'): string {
  return `${greeting}, ${name}`;
}

paramsGreet2('Alice');              // "Hello, Alice"
paramsGreet2('Alice', 'Hi');        // "Hi, Alice"

// 默认参数可以与可选参数混用
function createMessage(
  content: string,
  prefix: string = '[INFO]',
  suffix?: string
): string {
  let message: string = `${prefix} ${content}`;
  if (suffix !== undefined) {
    message = message + suffix;
  }
  return message;
}

createMessage('Hello');           // "[INFO] Hello"
createMessage('Hello', '[WARN]'); // "[WARN] Hello"
createMessage('Hello', '[WARN]', '!'); // "[WARN] Hello!"

// 默认值可以是表达式
function createTimer(
  interval: number = 1000,
  callback: () => void = () => {}
): Timer {
  return {
    interval: interval,
    callback: callback,
    start: () => {}
  };
}

interface Timer {
  interval: number;
  callback: () => void;
  start: () => void;
}

// 默认值使用其他参数
function calculatePrice(
  basePrice: number,
  taxRate: number = 0.1,
  discount: number = basePrice * 0.05
): number {
  return basePrice + basePrice * taxRate - discount;
}

calculatePrice(100);      // 100 + 10 - 5 = 105
calculatePrice(100, 0.2); // 100 + 20 - 5 = 115
// [End default_parameters]

// ===== rest_parameters =====
// [Start rest_parameters]
// 剩余参数
function restSum(...values: number[]): number {
  let total: number = 0;
  for (let value of values) {
    total += value;
  }
  return total;
}

restSum(1);           // 1
restSum(1, 2);        // 3
restSum(1, 2, 3);     // 6
restSum(1, 2, 3, 4);  // 10

// 剩余参数与普通参数结合
function greetAll(greeting: string, ...names: string[]): string {
  let result: string = '';
  for (let name of names) {
    result += `${greeting}, ${name}\n`;
  }
  return result;
}

greetAll('Hello', 'Alice', 'Bob', 'Charlie');

// 剩余参数必须是最后一个参数
function buildArray(first: number, ...rest: number[]): number[] {
  let result: number[] = [first];
  for (let value of rest) {
    result.push(value);
  }
  return result;
}

let single: number[] = buildArray(1);
console.info(`${single.join(', ')}`);  // 1
let multiple: number[] = buildArray(1, 2, 3, 4);
console.info(`${multiple.join(', ')}`);  // 1, 2, 3, 4

// 剩余参数类型
function concatenate(...strings: string[]): string {
  return strings.join('');
}

concatenate('a', 'b', 'c');  // "abc"

// 剩余参数用于转发
function logAll(...messages: string[]): void {
  for (let message of messages) {
    console.info(`${message}`);
  }
}
// [End rest_parameters]

// ===== parameter_destructuring_limitation =====
// [Start parameter_destructuring_limitation]
// TypeScript支持：function foo({x, y}: Point)
// ArkTS不支持，需要手动提取

interface PdPoint {
  x: number;
  y: number;
}

function processPoint(point: PdPoint): number {
  let x: number = point.x;
  let y: number = point.y;
  return x + y;
}

let pdPoint: PdPoint = { x: 10, y: 20 };
console.info(`${processPoint(pdPoint)}`); // 30

function processTuple(tuple: [number, string]): string {
  let id: number = tuple[0];
  let name: string = tuple[1];
  return `ID: ${id}, Name: ${name}`;
}

let tuple: [number, string] = [1, 'Alice'];
processTuple(tuple);

// 使用接口替代解构
interface Options {
  timeout: number;
  retries: number;
  verbose: boolean;
}

function configure(options: Options): void {
  let timeout: number = options.timeout;
  let retries: number = options.retries;
  let verbose: boolean = options.verbose;
  
  console.info(`Timeout: ${timeout}, Retries: ${retries}`);
}

configure({ timeout: 5000, retries: 3, verbose: true });
// [End parameter_destructuring_limitation]

// ===== void_type_functions =====
// [Start void_type_functions]
// void类型函数
function log(message: string): void {
  console.info(`${message}`);
}

function notify(message: string): void {
  alert(message);
}

function alert(message: string): void {
  console.info(`Alert: ${message}`);
}

// void函数可以提前返回
function process(data: string | null): void {
  if (data === null) {
    return;  // 提前退出
  }
  console.info(`${data}`);
}

// void函数可以省略return
function initialize(): void {
  let config: FunctionsConfig = loadConfig();
  setupEnvironment(config);
}

function loadConfig(): FunctionsConfig {
  return { debug: false };
}

function setupEnvironment(config: FunctionsConfig): void {
  console.info('Environment setup');
}

interface FunctionsConfig {
  debug: boolean;
}
// [End void_type_functions]

// ===== return_types =====
// [Start return_types]
// 返回基本类型
function typesAdd(a: number, b: number): number {
  return a + b;
}

function concat(a: string, b: string): string {
  return a + b;
}

function isPositive(value: number): boolean {
  return value > 0;
}

// 返回对象
function createConfig(): TypesConfig {
  return {
    apiUrl: 'EXAMPLE_API_URL',
    timeout: 5000,
    retries: 3
  };
}

interface TypesConfig {
  apiUrl: string;
  timeout: number;
  retries: number;
}

// 返回数组
function getNumbers(): number[] {
  return [1, 2, 3, 4, 5];
}

// 返回类实例
function typesCreateUser(id: number): TypesUser {
  let user: TypesUser = new TypesUser();
  user.id = id;
  user.name = 'TypesUser';
  return user;
}

class TypesUser {
  public id: number = 0;
  public name: string = '';
}
// [End return_types]

// ===== multiple_return_values =====
// [Start multiple_return_values]
// 使用数组承载多个返回值
function divideWithRemainder(a: number, b: number): number[] {
  let quotient: number = Math.floor(a / b);
  let remainder: number = a % b;
  return [quotient, remainder];
}

let valsResult: number[] = divideWithRemainder(10, 3);
let quotient: number = valsResult[0];  // 3
let remainder: number = valsResult[1]; // 1

// 使用元组类型
function minMax(arr: number[]): [number, number] {
  let min: number = arr[0];
  let max: number = arr[0];
  
  for (let value of arr) {
    if (value < min) {
      min = value;
    }
    if (value > max) {
      max = value;
    }
  }
  
  return [min, max];
}

let bounds: [number, number] = minMax([1, 5, 3, 9, 2]);
let minVal: number = bounds[0];  // 1
let maxVal: number = bounds[1];  // 9

// 返回结果和状态
function tryParseInt(str: string): [number, boolean] {
  let parsed: number = Number.parseInt(str, 10);
  let success: boolean = !Number.isNaN(parsed);
  return [parsed, success];
}

let parsed: [number, boolean] = tryParseInt('42');
let value: number = parsed[0];     // 42
let success: boolean = parsed[1];  // true

// 返回数据和错误
function fetchData(id: number): [Data | null, Error | null] {
  if (id <= 0) {
    return [null, new Error('Invalid ID')];
  }
  return [{ id: id, content: 'data' }, null];
}

interface Data {
  id: number;
  content: string;
}

let dataResult: [Data | null, Error | null] = fetchData(1);
let data: Data | null = dataResult[0];
let error: Error | null = dataResult[1];
// [End multiple_return_values]

// ===== optional_return_values =====
// [Start optional_return_values]
interface OrvUser {
  id: number;
  name: string;
  active: boolean;
}

// 返回可能为undefined
function findUser(id: number): OrvUser | undefined {
  if (id <= 0) {
    return undefined;
  }
  let users: OrvUser[] = [
    { id: 1, name: 'Alice', active: true },
    { id: 2, name: 'Bob', active: false }
  ];
  
  for (let valsUser of users) {
    if (valsUser.id === id) {
      return valsUser;
    }
  }
  return undefined;
}

let orvUser: OrvUser | undefined = findUser(1);
if (orvUser !== undefined) {
  console.info(`${orvUser.name}`);
} // Alice

// 查找函数
function findFirst(arr: number[], predicate: (n: number) => boolean): number | undefined {
  for (let value of arr) {
    if (predicate(value)) {
      return value;
    }
  }
  return undefined;
}

let first: number | undefined = findFirst([1, 2, 3, 4], (n: number): boolean => n > 2);
console.info(`${first}`); // 3

// 获取元素
function getElement(arr: string[], index: number): string | undefined {
  if (index < 0 || index >= arr.length) {
    return undefined;
  }
  return arr[index];
}

let element: string | undefined = getElement(['a', 'b', 'c'], 1);
console.info(`${element}`); // b

// 返回null或值
function getConfigValue(key: string): string | null {
  let config: Map<string, string> = new Map<string, string>();
  config.set('apiUrl', 'EXAMPLE_API_URL');
  config.set('timeout', '5000');
  
  let value: string | undefined = config.get(key);
  if (value !== undefined) {
    return value;
  }
  return null;
}
// [End optional_return_values]

// ===== functions_as_parameters =====
// [Start functions_as_parameters]
// 函数作为参数
type MathOperation = (a: number, b: number) => number;
function addNumbersOp(a: number, b: number): number {
  return a + b;
}
function subtractNumbers(a: number, b: number): number {
  return a - b;
}
function multiplyNumbersOp(a: number, b: number): number {
  return a * b;
}
function calculate(a: number, b: number, operation: MathOperation): number {
  return operation(a, b);
}

let paramsSum: number = calculate(10, 5, addNumbersOp);       // 15
let diff: number = calculate(10, 5, subtractNumbers); // 5
let prod: number = calculate(10, 5, multiplyNumbersOp); // 50
console.info(`${paramsSum}, ${diff}, ${prod}`); // 15, 5, 50

// 回调函数
function paramsProcessData(
  data: string[],
  processor: (item: string) => string
): string[] {
  let result: string[] = [];
  for (let item of data) {
    result.push(processor(item));
  }
  return result;
}

let processed: string[] = paramsProcessData(
  ['hello', 'world'],
  (s: string): string => s.toUpperCase()
);
console.info(`${processed[0]}, ${processed[1]}`); // HELLO, WORLD

// 条件判断函数
function filterNumbers(
  numbers: number[],
  predicate: (n: number) => boolean
): number[] {
  let result: number[] = [];
  for (let num of numbers) {
    if (predicate(num)) {
      result.push(num);
    }
  }
  return result;
}

let evens: number[] = filterNumbers([1, 2, 3, 4, 5, 6], (n: number): boolean => n % 2 === 0);
console.info(`${evens.join(', ')}`); // 2, 4, 6
// [End functions_as_parameters]

// ===== functions_returning_functions =====
// [Start functions_returning_functions]
type RetMathOperation = (a: number, b: number) => number;

// 返回函数
function getOperation(type: string): RetMathOperation {
  switch (type) {
    case 'add':
      return (a: number, b: number): number => a + b;
    case 'subtract':
      return (a: number, b: number): number => a - b;
    case 'multiply':
      return (a: number, b: number): number => a * b;
    default:
      return (a: number, b: number): number => 0;
  }
}

let frfOperation: RetMathOperation = getOperation('add');
let functionsResult: number = frfOperation(5, 3);
console.info(`${functionsResult}`); // 8

// 创建器函数
function createMultiplier(factor: number): (n: number) => number {
  return (n: number): number => n * factor;
}

let functionsDouble: (n: number) => number = createMultiplier(2);
let triple: (n: number) => number = createMultiplier(3);

console.info(`${functionsDouble(5)}`); // 10
console.info(`${triple(5)}`); // 15

// 创建比较器
function createComparator(ascending: boolean): (a: number, b: number) => number {
  if (ascending) {
    return (a: number, b: number): number => a - b;
  }
  return (a: number, b: number): number => b - a;
}

let ascComparator: (a: number, b: number) => number = createComparator(true);
let descComparator: (a: number, b: number) => number = createComparator(false);
// [End functions_returning_functions]

// ===== function_type_aliases =====
// [Start function_type_aliases]
// 使用类型别名
type Callback = (result: string) => void;
type Predicate = (value: number) => boolean;
type Transformer = (input: string) => string;
type Comparator = (a: number, b: number) => number;

// 简化复杂函数类型
type EventHandler = (event: Event) => void;

interface Event {
  type: string;
  data: string | number | boolean;
}

function addEventListener(handler: EventHandler): void {
  // 注册事件处理器
}

// 使用泛型函数类型
type Mapper<T, R> = (value: T) => R;
type Filter<T> = (value: T) => boolean;
type Reducer<T, R> = (acc: R, value: T) => R;

function mapArray<T, R>(arr: T[], mapper: Mapper<T, R>): R[] {
  let result: R[] = [];
  for (let item of arr) {
    result.push(mapper(item));
  }
  return result;
}

let doubled: number[] = mapArray([1, 2, 3], (n: number): number => n * 2);
// [End function_type_aliases]

// ===== local_function_expression =====
// [Start local_function_expression]
function expressionAddNum(a: number, b: number): void {
  let logToConsole: (message: string) => void = (message: string): void => {
    console.info(`${message}`);
  };

  let result: number = a + b;
  logToConsole('result is ' + result);
}
// [End local_function_expression]

// ===== multiple_local_functions =====
// [Start multiple_local_functions]
function functionsProcessData(data: string[]): string {
  let clean: (item: string) => string = (item: string): string => {
    return item.trim();
  };

  let format: (item: string) => string = (item: string): string => {
    return `[${item}]`;
  };

  let cleaned: string[] = data.map(clean);
  let formatted: string[] = cleaned.map(format);
  return formatted.join(', ');
}
// [End multiple_local_functions]

// ===== closure_counter =====
// [Start closure_counter]
function createCounter(): () => number {
  let count: number = 0;

  let increment: () => number = (): number => {
    count++;
    return count;
  };

  return increment;
}

let counter: () => number = createCounter();
console.info(`${counter()}`);  // 1
console.info(`${counter()}`);  // 2
console.info(`${counter()}`);  // 3
// [End closure_counter]

// ===== closure_multiplier =====
// [Start closure_multiplier]
function multiplierCreateMultiplier(factor: number): (value: number) => number {
  let multiply: (value: number) => number = (value: number): number => {
    return value * factor;
  };

  return multiply;
}

let multiplierDouble: (value: number) => number = multiplierCreateMultiplier(2);
console.info(`${multiplierDouble(5)}`);  // 10
// [End closure_multiplier]

// ===== arrow_function_syntax =====
// [Start arrow_function_syntax]
let arrowAdd: (a: number, b: number) => number = (a: number, b: number): number => {
  return a + b;
};

let subtract: (a: number, b: number) => number = (a: number, b: number): number => a - b;
let doubleValue: (value: number) => number = (value: number): number => value * 2;
let arrowGreet: () => string = (): string => 'Hello';
// [End arrow_function_syntax]

// ===== arrow_function_array_callback =====
// [Start arrow_function_array_callback]
let numbers: number[] = [1, 2, 3, 4, 5];
let callbackDoubled: number[] = numbers.map((value: number): number => {
  return value * 2;
});
// [End arrow_function_array_callback]

// ===== arrow_function_this_binding =====
// [Start arrow_function_this_binding]
class BindingTimer {
  private seconds: number = 0;

  start(): void {
    setInterval((): void => {
      this.seconds++;
      console.info(`${this.seconds.toString()}`);
    }, 1000);
  }
}

function setInterval(callback: () => void, ms: number): void {
  callback();
}
// [End arrow_function_this_binding]

// ===== function_overloading =====
// [Start function_overloading]
// 重载签名
function overloadGreet(name: string): string;
function overloadGreet(name: string, age: number): string;
function overloadGreet(name: string, age?: number): string {
  if (age !== undefined) {
    return `Hello, ${name} (${age} years old)`;
  }
  return `Hello, ${name}`;
}

overloadGreet('Alice');        // "Hello, Alice"
overloadGreet('Alice', 25);    // "Hello, Alice (25 years old)"

// 不同参数类型的重载
function overloadProcess(value: number): string;
function overloadProcess(value: string): number;
function overloadProcess(value: number | string): number | string {
  if (typeof value === 'number') {
    return `Number: ${value}`;
  }
  return value.length;
}

overloadProcess(42);     // "Number: 42"
overloadProcess('text'); // 4

// 多参数重载
function overloadCreatePoint(x: number): OverloadPoint;
function overloadCreatePoint(x: number, y: number): OverloadPoint;
function overloadCreatePoint(x: number, y?: number): OverloadPoint {
  return {
    x: x,
    y: y !== undefined ? y : 0
  };
}

interface OverloadPoint {
  x: number;
  y: number;
}

let point1: OverloadPoint = overloadCreatePoint(10);
console.info(`${JSON.stringify(point1)}`);  // {"x":10,"y":0}
let point2: OverloadPoint = overloadCreatePoint(10, 20);
console.info(`${JSON.stringify(point2)}`);  // {"x":10,"y":20}
// [End function_overloading]

// ===== overload_signatures =====
// [Start overload_signatures]
// 实现签名必须兼容所有重载签名
interface NumberValue {
  value: number;
}

interface StringValue {
  value: string;
}

type NumericOrTextValue = NumberValue | StringValue;

function sigGetValue(obj: NumberValue): number;
function sigGetValue(obj: StringValue): string;
function sigGetValue(obj: NumericOrTextValue): number | string {
  return obj.value;
}

// 重载顺序：更具体的类型先声明
function sigConvert(value: string): number;
function sigConvert(value: number): string;
function sigConvert(value: string | number): string | number {
  if (typeof value === 'string') {
    return Number.parseInt(value, 10);
  }
  return value.toString();
}

// 重载与联合类型
function sigFormat(input: string): string;
function sigFormat(input: number): string;
function sigFormat(input: string | number): string {
  if (typeof input === 'string') {
    return input.toUpperCase();
  }
  return input.toFixed(2);
}
// [End overload_signatures]

// ===== higher_order_functions =====
// [Start higher_order_functions]
// 接受函数作为参数
function applyOperation(
  a: number,
  b: number,
  operation: (x: number, y: number) => number
): number {
  return operation(a, b);
}

applyOperation(5, 3, (x, y) => x + y);  // 8
applyOperation(5, 3, (x, y) => x * y);  // 15

// 返回函数
function createGreeter(greeting: string): (name: string) => string {
  return (name: string): string => `${greeting}, ${name}`;
}

let functionsSayHello: (name: string) => string = createGreeter('Hello');
let sayHi: (name: string) => string = createGreeter('Hi');

functionsSayHello('Alice');  // "Hello, Alice"
sayHi('Bob');       // "Hi, Bob"

// 既接受又返回函数
function compose<T, U, V>(
  f: (x: U) => V,
  g: (x: T) => U
): (x: T) => V {
  return (x: T): V => f(g(x));
}

let functionsDouble2 = (n: number): number => n * 2;
let addOne = (n: number): number => n + 1;

let doubleThenAddOne = compose(addOne, functionsDouble2);
doubleThenAddOne(5);  // 11
// [End higher_order_functions]

// ===== array_higher_order_methods =====
// [Start array_higher_order_methods]
// map：映射每个元素
let orderNumbers: number[] = [1, 2, 3, 4, 5];

let orderDoubled: number[] = orderNumbers.map((n: number): number => n * 2);
console.info(`${orderDoubled.join(', ')}`);  // 2, 4, 6, 8, 10

let squared: number[] = orderNumbers.map((n: number): number => n * n);
console.info(`${squared.join(', ')}`);  // 1, 4, 9, 16, 25

let strings: string[] = orderNumbers.map((n: number): string => `Item ${n}`);
console.info(`${strings.join(', ')}`);  // Item 1, Item 2, Item 3, Item 4, Item 5

// filter：过滤元素
let orderEvens: number[] = orderNumbers.filter((n: number): boolean => n % 2 === 0);
console.info(`${orderEvens.join(', ')}`);  // 2, 4

let greaterThan3: number[] = orderNumbers.filter((n: number): boolean => n > 3);
console.info(`${greaterThan3.join(', ')}`);  // 4, 5

// reduce：归约数组
let orderSum: number = orderNumbers.reduce(
  (acc: number, n: number): number => acc + n,
  0
);
console.info(`${orderSum}`);  // 15

let orderProduct: number = orderNumbers.reduce(
  (acc: number, n: number): number => acc * n,
  1
);
console.info(`${orderProduct}`);  // 120

let orderMax: number = orderNumbers.reduce(
  (acc: number, n: number): number => acc > n ? acc : n,
  orderNumbers[0]
);
console.info(`${orderMax}`);  // 5

// 组合使用
let orderResult: number[] = orderNumbers
  .filter((n: number): boolean => n % 2 === 0)
  .map((n: number): number => n * 2);
console.info(`${orderResult.join(', ')}`);  // 4, 8
// [End array_higher_order_methods]

// ===== custom_array_methods =====
// [Start custom_array_methods]
// 自定义map
function customMap<T, R>(arr: T[], mapper: (item: T) => R): R[] {
  let result: R[] = [];
  for (let item of arr) {
    result.push(mapper(item));
  }
  return result;
}

// 自定义filter
function customFilter<T>(arr: T[], predicate: (item: T) => boolean): T[] {
  let result: T[] = [];
  for (let item of arr) {
    if (predicate(item)) {
      result.push(item);
    }
  }
  return result;
}

// 自定义reduce
function customReduce<T, R>(
  arr: T[],
  reducer: (acc: R, item: T) => R,
  initial: R
): R {
  let accumulator: R = initial;
  for (let item of arr) {
    accumulator = reducer(accumulator, item);
  }
  return accumulator;
}

// 自定义forEach
function customForEach<T>(arr: T[], consumer: (item: T) => void): void {
  for (let item of arr) {
    consumer(item);
  }
}

// 自定义find
function customFind<T>(arr: T[], predicate: (item: T) => boolean): T | undefined {
  for (let item of arr) {
    if (predicate(item)) {
      return item;
    }
  }
  return undefined;
}
// [End custom_array_methods]

// ===== naming_best_practices =====
// [Start naming_best_practices]
// 使用动词或动词短语
function namingFetchData() {}
function namingCalculateTotal() {}
function namingValidateInput() {}
function transformData() {}

// 避免无意义名称
// 反例：function f() {}
// 推荐：function processOrder() {}
// [End naming_best_practices]

// ===== single_responsibility_principle =====
// [Start single_responsibility_principle]
// 推荐：每个函数只做一件事
function calculateSubtotal(items: Item[]): number {
  let subtotal: number = 0;
  for (let item of items) {
    subtotal += item.price * item.quantity;
  }
  return subtotal;
}

function calculateTax(subtotal: number, rate: number): number {
  return subtotal * rate;
}

function principleCalculateTotal(subtotal: number, tax: number): number {
  return subtotal + tax;
}

interface Item {
  price: number;
  quantity: number;
}

// 反例：一个函数做多件事
function calculateEverything(items: Item[]): number {
  let subtotal: number = 0;
  for (let item of items) {
    subtotal += item.price * item.quantity;
  }
  let tax: number = subtotal * 0.1;
  return subtotal + tax;
}
// [End single_responsibility_principle]

// ===== parameter_count_best_practices =====
// [Start parameter_count_best_practices]
// 推荐：参数不超过3-4个
function cntCreateUser(name: string, email: string): CntUser {
  return { name: name, email: email };
}

// 多参数使用对象
interface UserConfig {
  name: string;
  email: string;
  age: number;
  role: string;
}

function createComplexUser(config: UserConfig): CntUser {
  return {
    name: config.name,
    email: config.email,
    age: config.age,
    role: config.role
  };
}

interface CntUser {
  name: string;
  email: string;
  age?: number;
  role?: string;
}
// [End parameter_count_best_practices]

// ===== arrow_function_best_practices =====
// [Start arrow_function_best_practices]
// 推荐：简单函数使用箭头函数
let arrowDouble: (n: number) => number = (n: number): number => n * 2;
let arrowIsPositive: (n: number) => boolean = (n: number): boolean => n > 0;

// 数组方法使用箭头函数
numbers.filter((n: number): boolean => n > 0);
numbers.map((n: number): number => n * 2);
// [End arrow_function_best_practices]

// ===== early_return_best_practices =====
// [Start early_return_best_practices]
// 推荐：提前返回
function retProcess(data: string | null): number {
  if (data === null) {
    return 0;
  }
  
  if (data.length === 0) {
    return 0;
  }
  
  return data.length;
}

// 反例：深层嵌套
function processNested(data: string | null): number {
  if (data !== null) {
    if (data.length > 0) {
      return data.length;
    } else {
      return 0;
    }
  } else {
    return 0;
  }
}
// [End early_return_best_practices]

let globalLogUpdate: ((msg: string, isError: boolean) => void) | undefined;

function testDeclaration(): void {
  let fdSum: number = add(1, 2);
  let fdProduct: number = multiply(5, 3);
  let logMsg = 'add(1, 2): ' + fdSum + '\nmultiply(5, 3): ' + fdProduct;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

function testOptionalParameters(): void {
  let opR1: string = paramsGreet('Alice');
  let opR2: string = paramsGreet('Alice', 'Dr.');
  let logMsg = 'greet(Alice): ' + opR1 + '\ngreet(Alice, Dr.): ' + opR2;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

function testDefaultParameters(): void {
  let dpR1: string = paramsGreet2('Alice');
  let dpR2: string = paramsGreet2('Alice', 'Hi');
  let logMsg = 'greet(Alice): ' + dpR1 + '\ngreet(Alice, Hi): ' + dpR2;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

function testClosure(): void {
  let clCounter: () => number = createCounter();
  let clC1: number = clCounter();
  let clC2: number = clCounter();
  let logMsg = 'counter(): ' + clC1 + '\ncounter(): ' + clC2;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

@Entry
@Component
struct FunctionsPage {
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
          Text($r('app.string.Test_Functions_Declaration')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testDeclaration();
          this.currentState = $r('app.string.Test_Functions_Declaration_finish');
        })

        Column() {
          Text($r('app.string.Test_Functions_OptionalParameters')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testOptionalParameters();
          this.currentState = $r('app.string.Test_Functions_OptionalParameters_finish');
        })

        Column() {
          Text($r('app.string.Test_Functions_DefaultParameters')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testDefaultParameters();
          this.currentState = $r('app.string.Test_Functions_DefaultParameters_finish');
        })

        Column() {
          Text($r('app.string.Test_Functions_Closure')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testClosure();
          this.currentState = $r('app.string.Test_Functions_Closure_finish');
        })
      }
      .height('100%')
      .width('100%')
      .backgroundColor('#F1F3F5')
      .padding(16);
    }
  }
}

// [Start call_signature_alternative]
interface CsDescribableFunction {
  description: string;
  call(someArg: number): boolean;
}

class CsMyFunc implements CsDescribableFunction {
  public description: string = 'default description';

  call(someArg: number): boolean {
    return someArg > 3;
  }
}

function csDoSomething(fn: CsDescribableFunction): void {
  console.info(`${fn.description + ' returned ' + fn.call(6)}`);
}

let csFn: CsMyFunc = new CsMyFunc();
csDoSomething(csFn);  // default description returned true
// [End call_signature_alternative]


// ===== construct_signature_alternative =====
// [Start construct_signature_alternative]
class CsaPoint {
  public x: number;
  public y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

interface CsaPointFactory {
  create(x: number, y: number): CsaPoint;
}

class CsaPointFactoryImpl implements CsaPointFactory {
  create(x: number, y: number): CsaPoint {
    return new CsaPoint(x, y);
  }
}

function createCsaPoint(factory: CsaPointFactory, x: number, y: number): CsaPoint {
  return factory.create(x, y);
}

let csaP: CsaPoint = createCsaPoint(new CsaPointFactoryImpl(), 3, 4);
console.info(`${csaP.x}, ${csaP.y}`); // 3, 4
// [End construct_signature_alternative]

// ===== parameters_formal_and_actual =====
// [Start parameters_formal_and_actual]
interface FormalPoint {
  x: number;
  y: number;
}

// 形参（形式参数）：函数定义时的参数
function addNumbers(a: number, b: number): number {
  return a + b;
}

// 实参（实际参数）：函数调用时传入的值
let paramsResult: number = addNumbers(1, 2);
console.info(`${paramsResult}`); // 3

// 参数数量必须匹配
// addNumbers(1);        // 编译错误：缺少参数
// addNumbers(1, 2, 3);  // 编译错误：参数过多

// 参数类型必须匹配
function greetUser(name: string): string {
  return `Hello, ${name}`;
}

let greeting: string = greetUser('Alice');
console.info(`${greeting}`); // Hello, Alice
// greetUser(123);  // 编译错误：类型不匹配

// 参数顺序必须匹配
function createPoint(x: number, y: number): FormalPoint {
  return { x: x, y: y };
}

let fpPoint: FormalPoint = createPoint(10, 20);
console.info(`${fpPoint.x}, ${fpPoint.y}`); // 10, 20
// [End parameters_formal_and_actual]

// ===== overload_type_constraints =====
// [Start overload_type_constraints]
interface OverloadData {
  id: number;
  type: string;
  name?: string;
}

// 重载签名必须类型兼容，实现签名统一处理所有情况
function getData(id: number): OverloadData;
function getData(name: string): OverloadData;
function getData(idOrName: number | string): OverloadData {
  if (typeof idOrName === 'number') {
    return { id: idOrName, type: 'numeric' };
  }
  return { id: 0, type: 'named', name: idOrName };
}

let otcData1: OverloadData = getData(1);
let otcData2: OverloadData = getData('test');
console.info(`${otcData1.id}, ${otcData2.type}`); // 1, named

// 返回类型不同的重载
function parseInput(input: string): number;
function parseInput(input: string, format: string): Date;
function parseInput(input: string, format?: string): number | Date {
  if (format !== undefined) {
    return new Date(input);
  }
  return Number.parseInt(input, 10);
}

let parsedNum: number = parseInput('42');
let parsedDate: Date = parseInput('2024-01-01', 'date');
console.info(`${parsedNum}`); // 42
// [End overload_type_constraints]

// ===== callback_no_optional_params =====
// [Start callback_no_optional_params]
// 回调参数全部为必选
type CbCallback = (value: string, index: number) => void;

let cbNames: string[] = ['Alice', 'Bob'];
cbNames.forEach((value: string, index: number) => {
  console.info(`${index}: ${value}`);
});

// 少参数的回调可赋给多参数类型
type UnaryCallback = (value: string) => void;
let cbSimple: CbCallback = (value: string): void => {
  console.info(`${value}`);
};
// [End callback_no_optional_params]

// ===== function_type_usage =====
// [Start function_type_usage]
// 不建议：使用Function类型
let ftFn: Function = (x: number): number => x * 2;
console.info(`${ftFn(10)}`); // 20

// 建议：使用具体函数类型
let ftSafeFn: (x: number) => number = (x: number): number => x * 2;
console.info(`${ftSafeFn(10)}`); // 20

// 需要接受任意函数时使用 () => void
function ftRunCallback(cb: () => void): void {
  cb();
}

ftRunCallback((): void => console.info('executed'));
// [End function_type_usage]

// ===== void_return_compatibility =====
// [Start void_return_compatibility]
type VcCallback = () => void;

// 返回number的函数可赋给void返回类型
let vcCb: VcCallback = (): number => {
  console.info('side effect');
  return 42;
};

vcCb(); // 打印side effect，返回值42被忽略
// [End void_return_compatibility]
