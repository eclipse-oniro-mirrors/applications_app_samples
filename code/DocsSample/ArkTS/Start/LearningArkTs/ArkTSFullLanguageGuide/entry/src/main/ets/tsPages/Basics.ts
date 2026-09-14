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

export {};

// [Start ts_avoid_any_unknown]
// ArkTS中不使用：
let value: any;
let raw: unknown;

type InputValue = string | number | boolean;
let inputValue: InputValue = 'ok';
// [End ts_avoid_any_unknown]

// [Start ts_const_reassignment]
const MAX_SIZE: number = 100;
const APP_NAME: string = 'MyApp';

// 常量必须初始化
const value: number = 10;  // 正确

// 引用类型：引用不变，内容可修改
const numbers: number[] = [1, 2, 3];
numbers.push(4);           // 合法
numbers = [5, 6];          // 编译错误
// [End ts_const_reassignment]

// [Start ts_illegal_naming]
// 合法命名
let validName: number = 1;
let _private: number = 2;
let $special: number = 3;
let camelCase: number = 4;

// 非法命名
let 123start: number = 1;    // 数字开头
let my-var: number = 2;      // 包含连字符
let class: number = 3;       // 保留关键字
// [End ts_illegal_naming]

// [Start ts_type_mismatch]
let typeCheckAge: number = 25;
typeCheckAge = 'text';  // 编译错误：类型不匹配

function typeCheckAdd(a: number, b: number): number {
  return a + b;
}

typeCheckAdd(1, 2);      // 正确
typeCheckAdd(1, '2');    // 编译错误
// [End ts_type_mismatch]

// [Start ts_immutability_violation]
// const声明不可变常量
const MAX_VALUE: number = 100;
MAX_VALUE = 200;  // 编译错误

// readonly只读属性
interface Config {
  readonly apiKey: string;
}

let config: Config = { apiKey: 'key' };
config.apiKey = 'new';  // 编译错误

// 只读数组
let readonlyNumbers: ReadonlyArray<number> = [1, 2, 3];
readonlyNumbers[0] = 10;  // 编译错误
// [End ts_immutability_violation]

// ===== ts_symbol_type =====
// [Start ts_symbol_type]
// TypeScript支持symbol类型，ArkTS不支持Symbol() API
let sym1: symbol = Symbol('name');
let sym2: symbol = Symbol('name');
console.info(`${sym1 === sym2}`); // false，每个symbol唯一

let uniqueKey: symbol = Symbol('id');
let myMap: Map<symbol, string> = new Map();
myMap.set(uniqueKey, '123');
console.info(`${myMap.get(uniqueKey)}`); // 123
// [End ts_symbol_type]

// ===== ts_array_destructuring =====
// [Start ts_array_destructuring]
// TypeScript数组解构写法，ArkTS不支持
let pair: number[] = [1, 2];
let [first, second] = pair;
console.info(`${first}, ${second}`); // 1, 2
// [End ts_array_destructuring]

// ===== ts_object_destructuring =====
// [Start ts_object_destructuring]
// TypeScript对象解构写法，ArkTS不支持
interface TsUserInfo {
  name: string;
  age: number;
}

let tsUser: TsUserInfo = { name: 'Alice', age: 25 };
let { name: userName, age: userAge } = tsUser;
console.info(`${userName}, ${userAge}`); // Alice, 25
// [End ts_object_destructuring]

// ===== ts_var_declaration =====
// [Start ts_var_declaration]
// TypeScript支持var声明，ArkTS不支持
function tsVarScope(): void {
  var x: number = 10;
  if (true) {
    var x: number = 20; // 同一作用域，重复声明
  }
  console.info(`${x}`); // 20
}

tsVarScope();
// [End ts_var_declaration]

// ===== ts_param_destructuring =====
// [Start ts_param_destructuring]
// TypeScript写法，ArkTS不支持函数参数解构
interface GreetParam {
  name: string;
  age: number;
}

function greet({ name, age }: GreetParam): void {
  console.info(`Hello, ${name}, age ${age}`);
}

let greetParam: GreetParam = { name: 'Alice', age: 25 };
greet(greetParam);
// [End ts_param_destructuring]

// ===== ts_object_spread =====
// [Start ts_object_spread]
// TypeScript对象展开写法，ArkTS不支持
interface TsConfig {
  host: string;
  port: number;
}

let original: TsConfig = { host: 'localhost', port: 8080 };
let copy: TsConfig = { ...original, port: 3000 };
console.info(`${copy.host}, ${copy.port}`); // localhost, 3000
// [End ts_object_spread]
