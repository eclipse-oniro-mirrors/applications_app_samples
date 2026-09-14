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

// ===== operator_precedence =====
// [Start operator_precedence]
// 优先级从高到低示例
let result: number = 2 + 3 * 4;        // 14（先乘后加）
let boolA: boolean = true;
let boolB: boolean = false;
let boolC: boolean = true;
let result2: boolean = boolA || boolB && boolC;    // 先 && 后 ||
let textA: boolean = true;
let textB: string = 'yes';
let textC: string | null = null;
let textD: string = 'fallback';
let result3: string = textA ? textB : (textC ?? textD);  // 先 ?? 后 ?:

// 结合性：左结合（从左到右）
let value: number = 10 - 5 - 2;
console.info(`${value}`);  // 3

// 结合性：右结合（从右到左）
let textE: string = 'other';
let result4: string = textA ? textB : (boolC ? textD : textE);
console.info(`${result4}`);  // yes
// [End operator_precedence]

// ===== bitwise_and =====
// [Start bitwise_and]
let a: number = 5;   // 二进制0101
let b: number = 3;   // 二进制0011
let bitAndResult: number = a & b;  // 二进制0001，十进制1

// 使用场景：检查标志位
const READ: number = 0b001;
const WRITE: number = 0b010;
const EXECUTE: number = 0b100;

let permission: number = 0b110;  // 可写可执行

let canRead: boolean = (permission & READ) !== 0;
let canWrite: boolean = (permission & WRITE) !== 0;
let canExecute: boolean = (permission & EXECUTE) !== 0;

console.info(`读取: ${canRead}`);      // false
console.info(`写入: ${canWrite}`);     // true
console.info(`执行: ${canExecute}`);   // true

// 清除标志位
permission = permission & ~WRITE;  // 清除写入权限
// [End bitwise_and]

// ===== bitwise_or =====
// [Start bitwise_or]
let bitOrA: number = 5;   // 二进制: 0101
let bitOrB: number = 3;   // 二进制: 0011
let bitOrResult: number = bitOrA | bitOrB;  // 二进制: 0111 (十进制: 7)

// 使用场景：设置标志位
const BOLD: number = 0b001;
const ITALIC: number = 0b010;
const UNDERLINE: number = 0b100;

let style: number = 0;
style = style | BOLD | ITALIC;  // 设置加粗和斜体

// 组合多个标志
let fullStyle: number = BOLD | ITALIC | UNDERLINE;  // 0b111
// [End bitwise_or]

// ===== bitwise_xor =====
// [Start bitwise_xor]
let bitXorA: number = 5;   // 二进制: 0101
let bitXorB: number = 3;   // 二进制: 0011
let bitXorResult: number = bitXorA ^ bitXorB;  // 二进制: 0110 (十进制: 6)

// 使用场景：切换标志位
let bitXorFlags: number = 0b101;
bitXorFlags = bitXorFlags ^ 0b001;  // 切换第0位: 0b100
bitXorFlags = bitXorFlags ^ 0b001;  // 再次切换第0位: 0b101

// 简单加密
let data: number = 42;
let key: number = 123;
let encrypted: number = data ^ key;
let decrypted: number = encrypted ^ key;
console.info(`${decrypted === data}`);  // true
// [End bitwise_xor]

// ===== bitwise_not =====
// [Start bitwise_not]
let bitNotA: number = 5;   // 二进制: 0101
let bitNotResult: number = ~bitNotA;  // 二进制: ...11111010 (十进制: -6)

// 公式: ~x = -(x + 1)
console.info(`${~5}`);   // -6
console.info(`${~(-6)}`); // 5

// 使用场景：清除标志位
const FLAG: number = 0b010;
let bitNotValue: number = 0b111;
bitNotValue = bitNotValue & ~FLAG;  // 清除第1位: 0b101
// [End bitwise_not]

// ===== left_shift =====
// [Start left_shift]
let lshiftA: number = 5;   // 二进制: 0101
let lshiftResult: number = lshiftA << 2;  // 二进制: 010100 (十进制: 20)

// 左移n位相当于乘以2^n
console.info(`${5 << 1}`);  // 10 (5 * 2)
console.info(`${5 << 2}`);  // 20 (5 * 4)
console.info(`${5 << 3}`);  // 40 (5 * 8)

// 使用场景：快速乘法
let base: number = 10;
let doubled: number = base << 1;   // 20
let quadrupled: number = base << 2;  // 40
// [End left_shift]

// ===== right_shift =====
// [Start right_shift]
let rshiftA: number = 20;  // 二进制010100
let rshiftResult: number = rshiftA >> 2;  // 二进制0101，十进制5

// 右移n位相当于除以2^n（向下取整）
console.info(`${20 >> 1}`);  // 10
console.info(`${20 >> 2}`);  // 5
console.info(`${20 >> 3}`);  // 2

// 负数右移
let neg: number = -20;
console.info(`${neg >> 2}`);  // -5

// 使用场景：快速除法
let total: number = 100;
let half: number = total >> 1;  // 50
let quarter: number = total >> 2;  // 25
// [End right_shift]

// ===== unsigned_right_shift =====
// [Start unsigned_right_shift]
let rshiftA2: number = 20;  // 二进制: 010100
let rshiftResult2: number = rshiftA2 >>> 2;  // 二进制: 0101 (十进制: 5)

// 对正数与 >> 效果相同
console.info(`${20 >> 2}`);   // 5
console.info(`${20 >>> 2}`);  // 5

// 对负数的处理不同
let rshiftNeg: number = -20;  // 二进制: ...11101100
console.info(`${rshiftNeg >> 2}`);    // -5（保留符号位）
console.info(`${rshiftNeg >>> 2}`);   // 1073741819（符号位变成0）

// 使用场景：转换为无符号整数
function toUnsigned(value: number): number {
  return value >>> 0;
}
// [End unsigned_right_shift]

// ===== compound_assignment_basics =====
// [Start compound_assignment_basics]
let compoundA: number = 10;
compoundA += 5;
console.info(`${compoundA}`);  // 15
compoundA -= 3;
console.info(`${compoundA}`);  // 12
compoundA *= 2;
console.info(`${compoundA}`);  // 24
compoundA /= 4;
console.info(`${compoundA}`);  // 6
// [End compound_assignment_basics]

// ===== compound_assignment_bitwise =====
// [Start compound_assignment_bitwise]
let compoundFlags: number = 0b1010;

// 按位与赋值
compoundFlags &= 0b1100;  // compoundFlags = compoundFlags & 0b1100 = 0b1000

// 按位或赋值
compoundFlags |= 0b0011;  // compoundFlags = compoundFlags | 0b0011 = 0b1011

// 按位异或赋值
compoundFlags ^= 0b0001;  // compoundFlags = compoundFlags ^ 0b0001 = 0b1010

// 左移赋值
let compoundValue: number = 5;
compoundValue <<= 2;  // compoundValue = compoundValue << 2 = 20

// 右移赋值
compoundValue >>= 1;  // compoundValue = compoundValue >> 1 = 10

// 无符号右移赋值
compoundValue >>>= 1;  // compoundValue = compoundValue >>> 1 = 5
// [End compound_assignment_bitwise]

// ===== compound_assignment_arithmetic =====
// [Start compound_assignment_arithmetic]
// 加法赋值
let compoundTotal: number = 100;
compoundTotal += 50;
console.info(`${compoundTotal}`);  // 150

// 减法赋值
let balance: number = 1000;
balance -= 200;
console.info(`${balance}`);  // 800

// 乘法赋值
let price: number = 10;
price *= 2;
console.info(`${price}`);  // 20

// 除法赋值
let amount: number = 100;
amount /= 4;
console.info(`${amount}`);  // 25

// 取模赋值
let compoundValue2: number = 17;
compoundValue2 %= 5;
console.info(`${compoundValue2}`);  // 2

// 指数赋值
let compoundBase: number = 2;
compoundBase **= 4;
console.info(`${compoundBase}`);  // 16
// [End compound_assignment_arithmetic]

// ===== compound_assignment_precedence =====
// [Start compound_assignment_precedence]
// 复合赋值是右结合的
let capA: number = 10;
capA += 5;  // 先计算右侧表达式，再赋值

// 复合表达式
let capB: number = 5;
capA += capB * 2;  // a = a + (b * 2) = 15 + 10 = 25

// 反例：链式复合赋值
let capX: number = 10;
let capY: number = 20;
capX += capY += 5;  // 混淆，反例
// [End compound_assignment_precedence]

// ===== reference_comparison =====
// [Start reference_comparison]
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

// 引用比较：比较内存地址
console.info(`${p1 === p2}`);  // false（不同对象）
console.info(`${p1 === p3}`);  // true（同一引用）

// 值比较：需要自定义方法
function pointsEqual(p1: Point, p2: Point): boolean {
  return p1.x === p2.x && p1.y === p2.y;
}

console.info(`${pointsEqual(p1, p2)}`);  // true

// 数组比较
let arr1: number[] = [1, 2, 3];
let arr2: number[] = [1, 2, 3];
let arr3: number[] = arr1;

console.info(`${arr1 === arr2}`);  // false
console.info(`${arr1 === arr3}`);  // true
// [End reference_comparison]

// ===== type_guards =====
// [Start type_guards]
// typeof类型守卫
function process(value: number | string): string {
  if (typeof value === 'number') {
    return `Number: ${value}`;
  } else {
    return `String: ${value}`;
  }
}

// instanceof类型守卫
class Animal {
  public name: string = '';
}

class Dog extends Animal {
  public breed: string = '';
}

let pet: Animal = new Dog();

if (pet instanceof Dog) {
  console.info(`${pet.breed}`);  // 类型为Dog
}

// 判别字段类型守卫
interface Car {
  kind: 'car';
  drive(): void;
}

interface Boat {
  kind: 'boat';
  sail(): void;
}

function move(vehicle: Car | Boat): void {
  if (vehicle.kind === 'car') {
    vehicle.drive();
  } else {
    vehicle.sail();
  }
}

interface OperatorSquare {
  kind: 'square';
  size: number;
}

interface OperatorRectangle {
  kind: 'rectangle';
  width: number;
  height: number;
}

type OperatorShape = OperatorSquare | OperatorRectangle;

function area(shape: OperatorShape): number {
  switch (shape.kind) {
    case 'square':
      return shape.size * shape.size;
    case 'rectangle':
      return shape.width * shape.height;
  }
}
// [End type_guards]

// ===== logical_and_short_circuit =====
// [Start logical_and_short_circuit]
// && 短路：左侧为false时，右侧不执行
function expensiveOperation(): boolean {
  console.info('执行昂贵操作');
  return true;
}

let enabled: boolean = false;
let andResult: boolean = enabled && expensiveOperation();  // 不执行expensiveOperation

// 使用场景：条件执行
interface Profile {
  name: string;
}

interface User {
  profile?: Profile;
}

function getUserName(user: User | null): string {
  return user?.profile?.name ?? 'Unknown';
}

// 使用场景：前置条件检查
function processArray(arr: number[] | null): number {
  if (arr !== null && arr.length > 0) {
    return arr[0] ?? -1;
  }
  return -1;
}

// 使用场景：权限检查
function canAccess(user: User | null, requiredRole: string): boolean {
  return user !== null && user.profile !== undefined && user.profile.name !== '';
}
// [End logical_and_short_circuit]

// ===== logical_or_short_circuit =====
// [Start logical_or_short_circuit]
// || 短路：左侧为true时，右侧不执行
function getDefault(): string {
  console.info('获取默认值');
  return 'default';
}

let provided: string = 'provided';
let orValue: string = provided || getDefault();  // 不执行getDefault

// 使用场景：提供默认值（处理falsy值）
let count: number = 0;
let displayCount: number = count || 10;  // 10（注意：0是falsy）

// 使用场景：多条件检查
let hasPermission: boolean = true;
let isOwner: boolean = false;
let canEdit: boolean = hasPermission || isOwner;

// 使用场景：配置回退
interface Config {
  host?: string;
  port?: number;
}

function connect(config: Config): void {
  let host: string = config.host || 'localhost';
  let port: number = config.port || 3306;
  console.info(`Connecting to ${host}:${port}`);
}
// [End logical_or_short_circuit]

// ===== logical_not =====
// [Start logical_not]
// 逻辑非将值转换为布尔值后取反
let value1: number = 5;
let value2: string = '';
let value3: number = 0;
let value4: string | null = null;
let value5: string | undefined = undefined;

console.info(`${!value1}`);  // false
console.info(`${!value2}`);  // true
console.info(`${!value3}`);  // true
console.info(`${!value4}`);  // true
console.info(`${!value5}`);  // true

// 双重否定：转换为布尔值
console.info(`${!!value1}`);  // true
console.info(`${!!value2}`);  // false
console.info(`${!!value3}`);  // false

// 等价于Boolean()
console.info(`${Boolean(value1)}`);  // true

// 使用场景：条件判断
function processValue(value: string | null): void {
  if (!value) {
    console.info('值为空');
    return;
  }
  console.info(`处理值: ${value}`);
}
// [End logical_not]

// ===== logical_operator_precedence =====
// [Start logical_operator_precedence]
// && 优先级高于 ||
let logOpA: boolean = true;
let logOpB: boolean = false;
let c: boolean = false;

let logOpResult: boolean = logOpA || logOpB && c;  // 等价于: logOpA || (logOpB && c)
console.info(`${logOpResult}`);  // true

// 使用括号明确优先级
let logOpResult2: boolean = (logOpA || logOpB) && c;  // false

// 复杂逻辑表达式
let logOpHasPermission: boolean = true;
let isAuthenticated: boolean = false;
let isAdmin: boolean = true;

// 推荐：使用括号和换行提高可读性
let logOpCanAccess: boolean = 
  isAuthenticated && (
    logOpHasPermission || isAdmin
  );

// 德摩根定律应用
let isInverseA: boolean = !logOpA;
let isInverseB: boolean = !logOpB;

// !(logOpA && logOpB) === (!logOpA || !logOpB)
let expr1: boolean = !(logOpA && logOpB);
let expr2: boolean = !logOpA || !logOpB;
console.info(`${expr1 === expr2}`);  // true

// !(logOpA || logOpB) === (!logOpA && !logOpB)
let expr3: boolean = !(logOpA || logOpB);
let expr4: boolean = !logOpA && !logOpB;
console.info(`${expr3 === expr4}`);  // true
// [End logical_operator_precedence]

// ===== nested_ternary =====
// [Start nested_ternary]
let score: number = 85;

// 嵌套三元运算符
let grade: string = 
  score >= 90 ? 'A' :
  score >= 80 ? 'B' :
  score >= 70 ? 'C' :
  score >= 60 ? 'D' : 'F';

console.info(`成绩等级: ${grade}`);  // B

// 更复杂的嵌套
let age: number = 25;
let hasLicense: boolean = true;
let hasInsurance: boolean = false;

let canDrive: string = 
  age < 18 ? 'underage' :
  !hasLicense ? 'no license' :
  !hasInsurance ? 'no insurance' :
  'can drive';

// 反例：多层嵌套（影响可读性）
let status: string = 
  age < 13 ? 'child' :
  age < 20 ? 'teenager' :
  age < 30 ? 'young adult' :
  age < 50 ? 'adult' :
  age < 65 ? 'middle-aged' : 'senior';
// [End nested_ternary]

// ===== ternary_vs_if_else =====
// [Start ternary_vs_if_else]
// 三元运算符
let elseA: number = 10;
let elseB: number = 20;
let max: number = elseA > elseB ? elseA : elseB;

// 等价的if-else
let max2: number;
if (elseA > elseB) {
  max2 = elseA;
} else {
  max2 = elseB;
}

// 复杂条件
let elseScore: number = 75;
let elseGrade: string = elseScore >= 60 ? 'pass' : 'fail';

// 等价的if-else
let grade2: string;
if (elseScore >= 60) {
  grade2 = 'pass';
} else {
  grade2 = 'fail';
}

// 多分支选择
let elseValue: number = 85;
let category: string = 
  elseValue >= 90 ? 'excellent' :
  elseValue >= 70 ? 'good' :
  elseValue >= 50 ? 'average' : 'poor';

// 等价的if-else if-else
let category2: string;
if (elseValue >= 90) {
  category2 = 'excellent';
} else if (elseValue >= 70) {
  category2 = 'good';
} else if (elseValue >= 50) {
  category2 = 'average';
} else {
  category2 = 'poor';
}
// [End ternary_vs_if_else]

// ===== spread_operator_array =====
// [Start spread_operator_array]
// 展开数组元素
let spreadArr1: number[] = [1, 2, 3];
let spreadArr2: number[] = [4, 5, 6];

// 合并数组
let merged: number[] = [...spreadArr1, ...spreadArr2];
console.info(`${merged.join(', ')}`);  // 1, 2, 3, 4, 5, 6

// 在任意位置插入
let inserted: number[] = [0, ...spreadArr1, 4];
console.info(`${inserted.join(', ')}`);  // 0, 1, 2, 3, 4

// 复制数组
let spreadCopied: number[] = [...spreadArr1];
console.info(`${spreadCopied.join(', ')}`);  // 1, 2, 3

// 作为函数参数：被展开数组应传给剩余参数
function spreadSum(...values: number[]): number {
  let spreadTotal: number = 0;
  for (let value of values) {
    spreadTotal += value;
  }
  return spreadTotal;
}

let numbers: number[] = [1, 2, 3];
let spreadTotal: number = spreadSum(...numbers);  // 6

// 展开与数组方法结合
let spreadMax: number = Math.max(...spreadArr1);  // 3
let min: number = Math.min(...spreadArr2);  // 4
// [End spread_operator_array]

// ===== spread_operator_object =====
// [Start spread_operator_object]
interface Person {
  name: string;
  age: number;
  city?: string;
}

function copyPerson(source: Person): Person {
  return {
    name: source.name,
    age: source.age,
    city: source.city
  };
}

function mergePerson(defaults: Person, override: Person): Person {
  return {
    name: override.name.length > 0 ? override.name : defaults.name,
    age: override.age,
    city: override.city !== undefined ? override.city : defaults.city
  };
}

let person: Person = { name: 'Alice', age: 30 };
let spreadCopied2: Person = copyPerson(person);
console.info(`${spreadCopied2.name}`);
// [End spread_operator_object]

// ===== rest_parameters =====
// [Start rest_parameters]
// 函数参数中的剩余参数
function sumAll(...numbers: number[]): number {
  let total: number = 0;
  for (const num of numbers) {
    total += num;
  }
  return total;
}

console.info(`${sumAll(1, 2, 3, 4, 5)}`);  // 15

// 与固定参数结合
function greet(greeting: string, ...names: string[]): string {
  return `${greeting}, ${names.join(', ')}!`;
}

console.info(`${greet('Hello', 'Alice', 'Bob', 'Charlie')}`);  // Hello, Alice, Bob, Charlie!

// 数组解构中的剩余元素
let arr: number[] = [1, 2, 3, 4, 5];
// ArkTS不支持解构赋值，需要手动提取
let first: number = arr[0] ?? 0;
let rest: number[] = arr.slice(1);
console.info(`${first}`);  // 1
console.info(`${rest.join(', ')}`);   // 2, 3, 4, 5

// 函数参数收集
function restProcess(first: string, second: string, ...remaining: string[]): void {
  console.info(`First: ${first}`);
  console.info(`Second: ${second}`);
  console.info(`Remaining: ${remaining.join(', ')}`);
}

restProcess('a', 'b', 'c', 'd', 'e');
// First: a
// Second: b
// Remaining: c, d, e
// [End rest_parameters]

// ===== object_rest_properties =====
// [Start object_rest_properties]
interface RequestUser {
  id: number;
  name: string;
  email: string;
  age: number;
}

// 对象解构中的剩余属性
let user: RequestUser = {
  id: 1,
  name: 'Alice',
  email: 'alice@example.com',
  age: 30
};

// ArkTS不支持解构赋值，需要手动提取
let id: number = user.id;
let name: string = user.name;
interface UserRestInfo {
  email: string;
  age: number;
}

let objRestRest: UserRestInfo = {
  email: user.email,
  age: user.age
};

// 函数参数提取部分属性
interface RequestOptions {
  timeout?: number;
  retries?: number;
  logLevel?: string;
}

function request(url: string, options: RequestOptions): void {
  let timeout: number = options.timeout ?? 5000;
  let retries: number = options.retries ?? 3;
  let logLevel: string = options.logLevel ?? 'info';
  
  console.info(`Request to ${url} with timeout=${timeout}, retries=${retries}`);
}
// [End object_rest_properties]

// ===== shallow_vs_deep_copy =====
// [Start shallow_vs_deep_copy]
// 浅拷贝
interface NestedNumber {
  c: number;
}

interface NumberBox {
  a: number;
  b: NestedNumber;
}

function copyNumberBox(source: NumberBox): NumberBox {
  return {
    a: source.a,
    b: source.b
  };
}

let obj1: NumberBox = {
  a: 1,
  b: { c: 2 }
};

let obj2: NumberBox = copyNumberBox(obj1);
obj2.a = 10;
obj2.b.c = 20;

console.info(`${obj1.a}`);    // 1（基本类型，独立）
console.info(`${obj1.b.c}`);  // 20（引用类型，共享）

// 面向已声明类型实现深拷贝
function cloneNumberBox(source: NumberBox): NumberBox {
  return {
    a: source.a,
    b: {
      c: source.b.c
    }
  };
}

let obj3: NumberBox = {
  a: 1,
  b: { c: 2 }
};

let obj4: NumberBox = cloneNumberBox(obj3);
obj4.b.c = 20;
console.info(`${obj3.b.c}`);  // 2（独立，不受影响）
// [End shallow_vs_deep_copy]

// ===== simulated_operator_overloading =====
// [Start simulated_operator_overloading]
class Vector {
  public x: number = 0;
  public y: number = 0;

  constructor(x: number = 0, y: number = 0) {
    this.x = x;
    this.y = y;
  }

  // 模拟加法运算符
  add(other: Vector): Vector {
    return new Vector(this.x + other.x, this.y + other.y);
  }

  // 模拟减法运算符
  subtract(other: Vector): Vector {
    return new Vector(this.x - other.x, this.y - other.y);
  }

  // 模拟乘法运算符（标量乘法）
  multiply(scalar: number): Vector {
    return new Vector(this.x * scalar, this.y * scalar);
  }

  // 模拟点积运算符
  dot(other: Vector): number {
    return this.x * other.x + this.y * other.y;
  }

  // 模拟相等运算符
  equals(other: Vector): boolean {
    return this.x === other.x && this.y === other.y;
  }

  // 模拟比较运算符
  magnitude(): number {
    return Math.sqrt(this.x * this.x + this.y * this.y);
  }

  greaterThan(other: Vector): boolean {
    return this.magnitude() > other.magnitude();
  }

  toString(): string {
    return `Vector(${this.x}, ${this.y})`;
  }
}

// 使用模拟运算符
let v1: Vector = new Vector(1, 2);
let v2: Vector = new Vector(3, 4);

let simOpSum: Vector = v1.add(v2);
console.info(`${JSON.stringify(simOpSum)}`);  // {"x":4,"y":6}

let diff: Vector = v1.subtract(v2);
console.info(`${JSON.stringify(diff)}`);  // {"x":-2,"y":-2}

let scaled: Vector = v1.multiply(2);
console.info(`${JSON.stringify(scaled)}`);  // {"x":2,"y":4}

let dotProduct: number = v1.dot(v2);
console.info(`${dotProduct}`);  // 11

let simOpIsEqual: boolean = v1.equals(v2);
console.info(`${simOpIsEqual}`);  // false
// [End simulated_operator_overloading]

// ===== complex_number_operators =====
// [Start complex_number_operators]
class Complex {
  public real: number = 0;
  public imag: number = 0;

  constructor(real: number = 0, imag: number = 0) {
    this.real = real;
    this.imag = imag;
  }

  // 模拟加法
  add(other: Complex): Complex {
    return new Complex(
      this.real + other.real,
      this.imag + other.imag
    );
  }

  // 模拟减法
  subtract(other: Complex): Complex {
    return new Complex(
      this.real - other.real,
      this.imag - other.imag
    );
  }

  // 模拟乘法
  multiply(other: Complex): Complex {
    return new Complex(
      this.real * other.real - this.imag * other.imag,
      this.real * other.imag + this.imag * other.real
    );
  }

  // 模拟除法
  divide(other: Complex): Complex {
    let denominator: number = other.real * other.real + other.imag * other.imag;
    return new Complex(
      (this.real * other.real + this.imag * other.imag) / denominator,
      (this.imag * other.real - this.real * other.imag) / denominator
    );
  }

  // 模拟一元负号
  negate(): Complex {
    return new Complex(-this.real, -this.imag);
  }

  // 模拟相等
  equals(other: Complex): boolean {
    return this.real === other.real && this.imag === other.imag;
  }

  toString(): string {
    if (this.imag >= 0) {
      return `${this.real} + ${this.imag}i`;
    } else {
      return `${this.real} - ${-this.imag}i`;
    }
  }
}

let c1: Complex = new Complex(3, 2);
let c2: Complex = new Complex(1, 7);

let complexNumSum: Complex = c1.add(c2);
console.info(`${JSON.stringify(complexNumSum)}`);  // {"real":4,"imag":9}

let complexNumDiff: Complex = c1.subtract(c2);
console.info(`${JSON.stringify(complexNumDiff)}`);  // {"real":2,"imag":-5}

let product: Complex = c1.multiply(c2);
console.info(`${JSON.stringify(product)}`);  // {"real":-11,"imag":23}
// [End complex_number_operators]

// ===== operator_overloading_use_cases =====
// [Start operator_overloading_use_cases]
// 场景1：数学计算类（推荐）
class Matrix {
  private data: number[][] = [];
  private rows: number;
  private cols: number;

  constructor(rows: number, cols: number) {
    this.rows = rows;
    this.cols = cols;
    for (let i: number = 0; i < rows; i++) {
      let row: number[] = [];
      for (let j: number = 0; j < cols; j++) {
        row.push(0);
      }
      this.data.push(row);
    }
  }

  private getValue(row: number, col: number): number {
    let rowData: number[] | undefined = this.data[row];
    if (rowData === undefined) {
      return 0;
    }
    return rowData[col] ?? 0;
  }

  private setValue(row: number, col: number, value: number): void {
    let rowData: number[] | undefined = this.data[row];
    if (rowData !== undefined) {
      rowData[col] = value;
    }
  }

  add(other: Matrix): Matrix {
    let result: Matrix = new Matrix(this.rows, this.cols);
    for (let i: number = 0; i < this.rows; i++) {
      for (let j: number = 0; j < this.cols; j++) {
        result.setValue(i, j, this.getValue(i, j) + other.getValue(i, j));
      }
    }
    return result;
  }

  multiply(other: Matrix): Matrix {
    // 矩阵乘法实现
    let result: Matrix = new Matrix(this.rows, this.cols);
    // ... 实现细节
    return result;
  }
}

// 场景2：自定义类型比较（推荐）
class Money {
  private amount: number;
  private currency: string;

  constructor(amount: number, currency: string) {
    this.amount = amount;
    this.currency = currency;
  }

  add(other: Money): Money {
    if (this.currency !== other.currency) {
      throw new Error('Currency mismatch');
    }
    return new Money(this.amount + other.amount, this.currency);
  }

  equals(other: Money): boolean {
    return this.amount === other.amount && this.currency === other.currency;
  }

  lessThan(other: Money): boolean {
    if (this.currency !== other.currency) {
      throw new Error('Currency mismatch');
    }
    return this.amount < other.amount;
  }
}

// 场景3：链式调用（推荐）
class OperationStringBuilder {
  private parts: string[] = [];

  append(text: string): OperationStringBuilder {
    this.parts.push(text);
    return this;
  }

  toString(): string {
    return this.parts.join('');
  }
}

let operationResult: string = new OperationStringBuilder()
  .append('Hello')
  .append(' ')
  .append('World')
  .toString();

console.info(`${operationResult}`);

// 反例：复杂业务逻辑场景
// 对于复杂业务逻辑，建议使用明确的方法名而不是模拟运算符
// [End operator_overloading_use_cases]

// ===== operator_precedence_best_practices =====
// [Start operator_precedence_best_practices]
// 反例
let precBoolA: boolean = true;
let precBoolB: boolean = false;
let precBoolC: boolean = true;
let resultWithoutParens: boolean = precBoolA || precBoolB && precBoolC;
let numA: number = 2;
let numB: number = 3;
let numC: number = 4;
let valueWithoutParens: number = numA + numB * numC;

// 推荐
let resultWithParens: boolean = precBoolA || (precBoolB && precBoolC);
let valueWithParens: number = numA + (numB * numC);
// [End operator_precedence_best_practices]

// ===== equality_check_best_practices =====
// [Start equality_check_best_practices]
let inputValue: string | null = null;
let itemCount: number = 0;
// 推荐：使用严格相等避免类型转换问题
if (inputValue === null) { }
if (itemCount === 0) { }
// [End equality_check_best_practices]

// ===== complex_ternary_best_practices =====
// [Start complex_ternary_best_practices]
// 反例：复杂的三元嵌套
let complexTernaryGrade: string = 
  score >= 90 ? 'A' : 
  score >= 80 ? 'B' : 
  score >= 70 ? 'C' : 
  score >= 60 ? 'D' : 'F';

// 推荐：使用函数
function getGrade(score: number): string {
  if (score >= 90) {
    return 'A';
  }
  if (score >= 80) {
    return 'B';
  }
  if (score >= 70) {
    return 'C';
  }
  if (score >= 60) {
    return 'D';
  }
  return 'F';
}
// [End complex_ternary_best_practices]

// ===== spread_operator_best_practices =====
// [Start spread_operator_best_practices]
let original: number[] = [1, 2, 3];
let firstPart: number[] = [1, 2];
let secondPart: number[] = [3, 4];

// 推荐：复制数组
let spreadCopied3: number[] = [...original];

// 推荐：合并数组
let spreadMerged: number[] = [...firstPart, ...secondPart];

// 对象合并优先使用显式字段赋值或构造函数
// [End spread_operator_best_practices]

// ===== semantic_method_naming =====
// [Start semantic_method_naming]
// 推荐：使用语义化方法名
class SemanticVector {
  add(other: SemanticVector): SemanticVector {
    return this;
  }

  subtract(other: SemanticVector): SemanticVector {
    return this;
  }

  multiply(scalar: number): SemanticVector {
    return this;
  }

  dot(other: SemanticVector): number {
    return 0;
  }
}

// 反例：使用模糊的方法名
class AmbiguousVector {
  op(other: AmbiguousVector): AmbiguousVector {
    return this;
  }
}
// [End semantic_method_naming]

// [Start parentheses_for_precedence]
let precA: number = 5;
let precB: number = 3;
let precC: number = 10;
let precD: number = 2;
let precInput: string | null = 'hello';
// 使用括号明确优先级
let precResult: number = (precA + precB) * (precC - precD);
let valid: boolean = (precA > precB) && (precC < precD);
let precValue: string = (precInput ?? 'default') + ' suffix';
// [End parentheses_for_precedence]

// [Start operator_basics_and_advanced]
// 基础运算符
let opA: number = 10;
let opB: number = 5;
let hasName: boolean = true;
let hasAge: boolean = true;
interface ObjData {
  name: string;
}
let obj: ObjData = { name: 'test' };
let values: number[] = [1, 2, 3];
let sum: number = 10 + 5;
let isEqual: boolean = opA === opB;
let isValid: boolean = hasName && hasAge;

// 高级运算符
let flags: number = 0b1010 & 0b1100;
let extracted: string = obj?.name ?? 'unknown';
let copied: number[] = [...values];
// [End operator_basics_and_advanced]

// ===== short_circuit_best_practices =====
// [Start short_circuit_best_practices]
interface ActiveUser {
  isActive: boolean;
  name?: string;
}

let shortCircuitUser: ActiveUser | null = {
  isActive: true,
  name: 'Alice'
};

// 推荐：条件执行
if (shortCircuitUser !== null && shortCircuitUser.isActive) {
  // 处理活跃用户
}

// 推荐：提供默认值
let shortCircuitDisplayName: string = shortCircuitUser?.name ?? 'Unknown';

// 反例：过度复杂的短路表达式
let condition1: boolean = true;
let condition2: boolean = false;
let condition3: boolean = true;
let condition4: boolean = false;
let shortCircuitResult: boolean = condition1 && condition2 || condition3 && condition4;
// [End short_circuit_best_practices]

// [Start as_const_alternative]
interface AcRequestConfig {
  readonly url: string;
  readonly method: 'GET' | 'POST';
}

let acConfig: AcRequestConfig = {
  url: 'EXAMPLE_API_URL',
  method: 'GET'
};

console.info(`${acConfig.method}`);  // GET
// [End as_const_alternative]

// [Start as_const_enum_alternative]
// 使用枚举替代字符串字面量
enum AcHttpMethod {
  GET = 'GET',
  POST = 'POST'
}

let acMethod: AcHttpMethod = AcHttpMethod.GET;
console.info(`${acMethod}`);  // GET
// [End as_const_enum_alternative]

// [Start satisfies_alternative]
interface SaColorMap {
  red: string;
  green: string;
  blue: string;
}

let saRgb: SaColorMap = {
  red: '#FF0000',
  green: '#00FF00',
  blue: '#0000FF'
};

console.info(`${saRgb.red}`);   // #FF0000
console.info(`${saRgb.green}`); // #00FF00
console.info(`${saRgb.blue}`);  // #0000FF
// [End satisfies_alternative]

// ===== strict_equality_best_practices =====
// [Start strict_equality_best_practices]
let strictValue: number | null = 5;
if (strictValue == 5) { }
if (strictValue != null) { }

let equalityValue: number | null = 5;

// 推荐使用严格相等
if (equalityValue === 5) { }
if (equalityValue !== null) { }
// [End strict_equality_best_practices]

// ===== ternary_best_practices =====
// [Start ternary_best_practices]
let scoreA: number = 10;
let scoreB: number = 5;
let scoreC: number = 8;
let applicantAge: number = 20;
let hasDrivingLicense: boolean = true;

// 反例：过于复杂的嵌套
let maxScoreTernary: number = scoreA > scoreB
  ? (scoreA > scoreC ? scoreA : scoreC)
  : (scoreB > scoreC ? scoreB : scoreC);

// 推荐：使用if-else提高可读性
function getMaxScore(a: number, b: number, c: number): number {
  if (a > b && a > c) {
    return a;
  } else if (b > c) {
    return b;
  } else {
    return c;
  }
}

let maxScoreResult: number = getMaxScore(scoreA, scoreB, scoreC);

// 推荐：使用辅助函数
function convertScoreToGrade(score: number): string {
  if (score >= 90) {
    return 'A';
  }
  if (score >= 80) {
    return 'B';
  }
  if (score >= 70) {
    return 'C';
  }
  if (score >= 60) {
    return 'D';
  }
  return 'F';
}

// 推荐：格式化三元运算符
let licenseStatus: string =
  applicantAge >= 18 && hasDrivingLicense ? 'eligible' :
  applicantAge >= 18 ? 'no license' :
  'underage';

// 反例：一行过长
let compactLicenseStatus: string = applicantAge >= 18 && hasDrivingLicense
  ? 'eligible' : applicantAge >= 18 ? 'no license' : 'underage';
// [End ternary_best_practices]
