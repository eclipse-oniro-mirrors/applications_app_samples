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

// ===== variable_declaration =====
// [Start variable_declaration]
let count: number = 10;
let name: string = 'ArkTS';
let isActive: boolean = true;

// 可重新赋值
let message: string = 'Hello';
message = 'Hello, ArkTS';
// [End variable_declaration]

// ===== type_annotation =====
// [Start type_annotation]
// 基本类型标注
let age: number = 25;
let annotName: string = 'Alice';
let isValid: boolean = true;

// 引用类型标注
let annotNumbers: number[] = [1, 2, 3];
let names: string[] = ['A', 'B', 'C'];

// 联合类型
let id: number | string = 123;
id = 'ABC-123';
// [End type_annotation]

// ===== naming_conventions =====
// [Start naming_conventions]
let userName: string = 'Alice';
let itemCount: number = 10;

const MAX_RETRY_COUNT: number = 3;
const API_BASE_URL: string = 'EXAMPLE_API_URL';

class UserProfile { }
interface IRepository { }
// [End naming_conventions]

// ===== variable_output =====
// [Start variable_output]
let outputName: string = 'ArkTS';
const version: number = 1.0;

console.info(`${outputName}`);              // ArkTS
console.info(`${version.toString()}`);      // 1
console.info(`Name: ${outputName}`);   // Name: ArkTS
console.info(`Version: ${version}, Name: ${outputName}`);  // Version: 1, Name: ArkTS
console.warn(`Version: ${version}, Name: ${outputName}`);  // Version: 1, Name: ArkTS
console.error('Invalid input');        // Invalid input
// [End variable_output]

// ===== single_line_comment =====
// [Start single_line_comment]
let commentCount: number = 10;  // 单行注释
// [End single_line_comment]

// ===== multi_line_comment =====
// [Start multi_line_comment]
/*
 * 多行注释
 * 可以跨越多行
 */
function calculate(): number {
  return 100;
}
// [End multi_line_comment]

// ===== documentation_comment =====
// [Start documentation_comment]
/**
 * 计算两个数的和
 * @param a 第一个数
 * @param b 第二个数
 * @returns 两数之和
 */
function add(a: number, b: number): number {
  return a + b;
}
// [End documentation_comment]

// ===== semicolon_usage =====
// [Start semicolon_usage]
let x: number = 10;
let y: number = 20;

// 同一行多个语句需要分号
let a: number = 1; let b: number = 2;

// 语句块末尾的分号可选
function greet(): void {
  console.info('Hello');
}
// [End semicolon_usage]

// ===== type_annotation_examples =====
// [Start type_annotation_examples]
// 变量类型
let annotExAge: number = 0;

// 函数参数和返回值类型
function annotExGreet(name: string): string {
  return `Hello, ${name}`;
}

// 类属性类型
class User {
  public id: number = 0;
  public name: string = '';
}
// [End type_annotation_examples]

// ===== type_alias =====
// [Start type_alias]
type ID = number | string;
type Age = number;

let userId: ID = 123;
userId = 'ABC';
// [End type_alias]

// ===== interface_definition =====
// [Start interface_definition]
interface IfaceDefUser {
  id: number;
  name: string;
  email?: string;
}

let user: IfaceDefUser = { id: 1, name: 'Alice' };
// [End interface_definition]

// ===== number_type =====
// [Start number_type]
let integer: number = 42;
let float: number = 3.14;
let negative: number = -10;

// 科学计数法
let scientific: number = 1e5;  // 100000

// 特殊数值
let infinity: number = Infinity;
let nan: number = NaN;
// [End number_type]

// ===== number_literals =====
// [Start number_literals]
let decimal: number = 42;      // 十进制
let hex: number = 0xFF;        // 十六进制 (255)
let binary: number = 0b1010;   // 二进制 (10)
let octal: number = 0o755;     // 八进制 (493)
// [End number_literals]

// ===== boolean_type =====
// [Start boolean_type]
let boolTypeIsActive: boolean = true;
let isComplete: boolean = false;

// 比较产生布尔值
let boolTypeX: number = 10;
let boolTypeY: number = 5;
let greater: boolean = boolTypeX > boolTypeY;  // true
// [End boolean_type]

// ===== array_type =====
// [Start array_type]
// 数组声明
let arrTypeNumbers: number[] = [1, 2, 3];
let arrTypeNames: string[] = ['A', 'B', 'C'];

// 数组操作
arrTypeNumbers.push(4);
arrTypeNumbers.pop();
let first: number = arrTypeNumbers[0];
// [End array_type]

// ===== object_type =====
// [Start object_type]
class Point {
  public x: number = 0;
  public y: number = 0;
}

let point: Point = new Point();
point.x = 10;
point.y = 20;

// 使用接口定义对象结构
interface ObjTypeUser {
  id: number;
  name: string;
}

let objTypeUser: ObjTypeUser = { id: 1, name: 'Alice' };
// [End object_type]

// ===== enum_type =====
// [Start enum_type]
enum Direction {
  Up,
  Down,
  Left,
  Right
}

let dir: Direction = Direction.Up;

// 带值的枚举
enum Status {
  Pending = 'pending',
  Active = 'active',
  Completed = 'completed'
}

let status: Status = Status.Active;
// [End enum_type]

// ===== union_type =====
// [Start union_type]
let unionTypeId: number | string = 123;
unionTypeId = 'ABC-123';

let result: number | null = null;
result = 100;

// 多类型联合
let data: number | string | boolean = 1;
data = 'text';
data = true;
// [End union_type]

// ===== literal_union_type =====
// [Start literal_union_type]
type TaskState = 'pending' | 'running' | 'done';

let state: TaskState = 'pending';
state = 'running';
// [End literal_union_type]

// ===== enum_state_management =====
// [Start enum_state_management]
enum TaskStateEnum {
  Pending = 'pending',
  Running = 'running',
  Done = 'done'
}

let enumStateState: TaskStateEnum = TaskStateEnum.Pending;
// [End enum_state_management]

// ===== void_type =====
// [Start void_type]
function logMessage(message: string): void {
  console.info(`${message}`);
}

function doNothing(): void {
  // 无返回值
}
// [End void_type]

// ===== never_type =====
// [Start never_type]
function fail(message: string): never {
  throw new Error(message);
}

function assertNever(value: never): never {
  throw new Error(`Unexpected value: ${value}`);
}
// [End never_type]

// ===== bigint_type =====
// [Start bigint_type]
let bigValue: bigint = 999999999999999999999999999999999999n;
console.info(`${bigValue.toString()}`);

let nextValue: bigint = bigValue + 1n;
console.info(`${nextValue.toString()}`);
// [End bigint_type]

// ===== bigint_conversion =====
// [Start bigint_conversion]
let bigintCount: number = 10;
let preciseCount: bigint = BigInt(bigintCount);
let total: bigint = preciseCount + 20n;
// [End bigint_conversion]

// ===== null_undefined_types =====
// [Start null_undefined_types]
// null：有意的空值
let empty: null = null;
let nullUndefData: string | null = null;

// undefined：未定义值
let missing: undefined = undefined;
let optional: string | undefined = undefined;

// null与undefined区别
let nickname: string | null = null;     // 明确表示没有昵称
let title: string | undefined;          // 可能未提供
// [End null_undefined_types]

// ===== optional_property =====
// [Start optional_property]
interface OptPropUser {
  id: number;
  name: string;
  email?: string;  // 可选属性
}

let optPropUser: OptPropUser = { id: 1, name: 'Alice' };

// 检查可选值是否存在
if (optPropUser.email !== undefined) {
  console.info(`${optPropUser.email}`);
}
// [End optional_property]

// ===== null_handling =====
// [Start null_handling]
// 空值合并运算符
let nullHandleValue: string | null = null;
let display: string = nullHandleValue ?? 'default';

// 函数默认参数
function nullHandleGreet(name: string, title: string = 'User'): string {
  return `Hello, ${title} ${name}`;
}

nullHandleGreet('Alice');           // Hello, User Alice
nullHandleGreet('Alice', 'Dr.');    // Hello, Dr. Alice
// [End null_handling]

// ===== non_null_assertion =====
// [Start non_null_assertion]
let nonNullValue: string | null = 'text';

// 非空断言（确认值不为null）
let length: number = nonNullValue!.length;

// 类型守卫检查
if (nonNullValue !== null) {
  let len: number = nonNullValue.length;  // 安全访问
}
// [End non_null_assertion]

// ===== null_safety =====
// [Start null_safety]
interface NullableSub {
  sub?: string;
}

interface NullableObj {
  prop?: NullableSub;
}

let optionalValue: string | null = 'hello';

// 显式处理空值
if (optionalValue !== null) {
  console.info(`${optionalValue.length}`);
}

// 使用可选链
let obj: NullableObj = {};
let sub: string | undefined = obj?.prop?.sub;
// [End null_safety]

// ===== throwing_exceptions =====
// [Start throwing_exceptions]
function validateAge(age: number): void {
  if (age < 0) {
    throw new Error('年龄不能为负数');
  }
  if (age > 150) {
    throw new Error('年龄超出合理范围');
  }
}
// [End throwing_exceptions]

// ===== error_tuple_return =====
// [Start error_tuple_return]
// 返回错误信息元组
function divide(a: number, b: number): [number, Error | null] {
  if (b === 0) {
    return [0, new Error('除数不能为零')];
  }
  return [a / b, null];
}

let divideResult: [number, Error | null] = divide(10, 0);
let errTupleResult: number = divideResult[0];
let error: Error | null = divideResult[1];

if (error !== null) {
  console.info(`${error.message}`);
}
// [End error_tuple_return]

// ===== assertion_functions =====
// [Start assertion_functions]
function assert(condition: boolean, message: string = 'Assertion failed'): void {
  if (!condition) {
    throw new Error(message);
  }
}

function assertEqual<T>(actual: T, expected: T, message?: string): void {
  if (actual !== expected) {
    throw new Error(message ?? `Expected ${expected}, got ${actual}`);
  }
}

// 使用断言
let assertFuncValue: number = 10;
assert(assertFuncValue > 0, '值必须为正数');
assertEqual(assertFuncValue, 10);
// [End assertion_functions]

// ===== precondition_checks =====
// [Start precondition_checks]
function precondition(condition: boolean, message: string): void {
  if (!condition) {
    throw new Error(`Precondition failed: ${message}`);
  }
}

function calculateSquareRoot(value: number): number {
  precondition(value >= 0, '参数必须为非负数');
  return Math.sqrt(value);
}

function getElement(arr: number[], index: number): number {
  precondition(index >= 0, '索引不能为负数');
  precondition(index < arr.length, '索引超出数组范围');
  return arr[index];
}
// [End precondition_checks]

// ===== constant_definitions =====
// [Start constant_definitions]
const API_URL: string = 'EXAMPLE_API_URL';
const TIMEOUT_MS: number = 5000;
// [End constant_definitions]

// ===== function_and_class_definition =====
// [Start function_and_class_definition]
function process(value: number): number {
  return value * 2;
}

class FuncClassUser {
  public id: number = 0;
  public name: string = '';
}
// [End function_and_class_definition]

// ===== variable_naming_best_practices =====
// [Start variable_naming_best_practices]
let retryCount: number = 10;
let namingBestUserName: string = 'Alice';

// 避免
let namingBestX: number = 10;
let n: string = 'Alice';
// [End variable_naming_best_practices]

// ===== null_handling_best_practices =====
// [Start null_handling_best_practices]
function getValue(): string | null {
  return 'data';
}

function processValue(value: string): void {
  console.info(`Processing: ${value}`);
}

let nullBestValue: string | null = getValue();
if (nullBestValue !== null) {
  processValue(nullBestValue);
}

// 使用空值合并
let nullBestDisplay: string = nullBestValue ?? 'default';
// [End null_handling_best_practices]

// ===== type_guard =====
// [Start type_guard]
function typeGuardProcess(value: number | string): number {
  if (typeof value === 'number') {
    return value * 2;
  }
  return value.length;
}
// [End type_guard]

let globalLogUpdate: ((msg: string, isError: boolean) => void) | undefined;

function testVariableDeclaration(): void {
  let vdCount: number = 10;
  let vdName: string = 'ArkTS';
  let vdActive: boolean = true;
  let vdMessage: string = 'Hello';
  vdMessage = 'Hello, ArkTS';
  let logMsg = 'count: ' + vdCount + '\nname: ' + vdName + '\nisActive: ' + String(vdActive) + '\nmessage: ' + vdMessage;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

function testTypeAnnotation(): void {
  let taAge: number = 25;
  let taName: string = 'Alice';
  let taValid: boolean = true;
  let taNumbers: number[] = [1, 2, 3];
  let taId: number | string = 123;
  taId = 'ABC-123';
  let logMsg = 'age: ' + taAge + '\nname: ' + taName + '\nnumbers: ' + taNumbers.join(',') + '\nid: ' + taId;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

function testBigInt(): void {
  let biValue: bigint = 999999999999999999999999999999999999n;
  let biNext: bigint = biValue + 1n;
  let logMsg = 'bigValue: ' + biValue.toString() + '\nnextValue: ' + biNext.toString();
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

function testNullSafety(): void {
  let nsValue: string | null = 'hello';
  let nsLength: number = nsValue !== null ? nsValue.length : 0;
  let nsNullish: string | null = null;
  let nsDisplay: string = nsNullish ?? 'default';
  let logMsg = 'value: ' + String(nsValue) + '\nlength: ' + nsLength + '\ndisplay: ' + nsDisplay;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

@Entry
@Component
struct BasicsPage {
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
          Text($r('app.string.Test_Basics_VariableDeclaration')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testVariableDeclaration();
          this.currentState = $r('app.string.Test_Basics_VariableDeclaration_finish');
        })

        Column() {
          Text($r('app.string.Test_Basics_TypeAnnotation')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testTypeAnnotation();
          this.currentState = $r('app.string.Test_Basics_TypeAnnotation_finish');
        })

        Column() {
          Text($r('app.string.Test_Basics_BigInt')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testBigInt();
          this.currentState = $r('app.string.Test_Basics_BigInt_finish');
        })

        Column() {
          Text($r('app.string.Test_Basics_NullSafety')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testNullSafety();
          this.currentState = $r('app.string.Test_Basics_NullSafety_finish');
        })
      }
      .height('100%')
      .width('100%')
      .backgroundColor('#F1F3F5')
      .padding(16);
    }
  }
}


// ===== type_inference_variables =====
// [Start type_inference_variables]
let tiCount = 10;        // 推断为number
let tiMessage = 'hello'; // 推断为string
let tiItems = [1, 2, 3]; // 推断为number[]
// [End type_inference_variables]

// ===== type_inference_const_let =====
// [Start type_inference_const_let]
const tiPi = 3.14;   // 推断为3.14（字面量类型）
let tiRatio = 3.14;  // 推断为number（宽泛类型）
// [End type_inference_const_let]

// ===== type_inference_best_common =====
// [Start type_inference_best_common]
let tiMixed: (number | null)[] = [0, 1, null]; // 需显式标注为联合类型数组
let tiNames: string[] = ['Alice', 'Bob'];      // 推断为string[]
// [End type_inference_best_common]

// ===== type_inference_contextual =====
// [Start type_inference_contextual]
let tiCtxNames: string[] = ['Alice', 'Bob', 'Charlie'];
tiCtxNames.forEach((s) => {
  console.info(s.toUpperCase()); // s自动推断为string
});
// [End type_inference_contextual]

// ===== type_inference_control_flow =====
// [Start type_inference_control_flow]
let tiValue: string | number = 'hello';
if (typeof tiValue === 'string') {
  console.info(tiValue.toUpperCase()); // 此处value收窄为string
} else {
  console.info(`${tiValue}`);          // 此处value收窄为number
}
// [End type_inference_control_flow]

// ===== let_const_block_scope =====
// [Start let_const_block_scope]
function blockScope(): void {
  let bsA: number = 10;
  const bsB: number = 20;
  if (true) {
    let bsA: number = 30; // 内层作用域的独立变量，不影响外层
    console.info(`${bsA}`); // 30
    console.info(`${bsB}`); // 20，可访问外层
  }
  console.info(`${bsA}`); // 10
}
// [End let_const_block_scope]

// ===== nested_scope =====
// [Start nested_scope]
let nsOuter: string = 'outer';

function nestedScope(): void {
  let nsInner: number = 100;
  console.info(`${nsOuter}`); // 可访问外层

  if (true) {
    let nsInner: number = 200; // 遮蔽外层nsInner
    console.info(`${nsInner}`); // 200
  }
  console.info(`${nsInner}`); // 100
}
// [End nested_scope]

// ===== array_access_alternative =====
// [Start array_access_alternative]
let arrPair: number[] = [1, 2];
let arrFirst: number = arrPair[0];
let arrSecond: number = arrPair[1];
// [End array_access_alternative]

// ===== object_access_alternative =====
// [Start object_access_alternative]
interface DestrUserInfo {
  name: string;
  age: number;
}

let destrUser: DestrUserInfo = { name: 'Alice', age: 25 };
let destrUserName: string = destrUser.name;
let destrUserAge: number = destrUser.age;
// [End object_access_alternative]

// ===== param_destructuring_alternative =====
// [Start param_destructuring_alternative]
interface ParamUserInfo {
  name: string;
  age: number;
}

function greetUser(user: ParamUserInfo): void {
  console.info(`Hello, ${user.name}, age ${user.age}`);
}

greetUser({ name: 'Alice', age: 25 });
// [End param_destructuring_alternative]

// ===== spread_syntax_alternative =====
// [Start spread_syntax_alternative]
interface SpreadConfig {
  host: string;
  port: number;
}

// 数组展开，ArkTS支持
let spreadArr1: number[] = [1, 2, 3];
let spreadArr2: number[] = [...spreadArr1, 4, 5];

// 对象属性复制，使用逐个赋值
let spreadOriginal: SpreadConfig = { host: 'localhost', port: 8080 };
let spreadCopy: SpreadConfig = {
  host: spreadOriginal.host,
  port: 3000
};
console.info(`${spreadCopy.host}, ${spreadCopy.port}`); // localhost, 3000
// [End spread_syntax_alternative]

// ===== try_catch_basic =====
// [Start try_catch_basic]
function riskyOperation(): number {
  throw new Error('operation failed');
}

function parseJSON(data: string): Object {
  return JSON.parse(data);
}

let tcData: string = '{"name": "Alice"}';

try {
  let result: number = riskyOperation();
} catch (error) {
  console.info(`Error: ${error}`);
}

// 捕获特定错误
try {
  parseJSON(tcData);
} catch (error) {
  if (error instanceof SyntaxError) {
    console.info(`JSON 解析错误`);
  }
}
// [End try_catch_basic]
