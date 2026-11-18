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

// [Start ts_strict_equality]
// 严格相等 (===)：比较值和类型
let strictA: number = 5;
let strictB: string = '5';

console.info(`${strictA === 5}`);    // true
console.info(`${strictA === strictB}`);    // 编译错误：number和string类型不同
console.info(`${strictA === '5'}`);  // 编译错误：number和string类型不同

// 非严格相等 (==) 会进行类型转换后比较，不建议使用
console.info(`${strictA == strictB}`);  // true（隐式转换，不建议）

// 严格不等 (!==)
console.info(`${strictA !== strictB}`);    // 编译错误：number和string类型不同

// 反例：非严格不等 (!=)
console.info(`${strictA != strictB}`);  // TypeScript对照写法

// 推荐实践：始终使用严格相等
function compareValues(x: number | string, y: number | string): boolean {
  if (typeof x === typeof y) {
    return x === y;
  }
  return false;
}
// [End ts_strict_equality]

// [Start ts_ternary_operator_basics]
let age: number = 20;
let status: string = age >= 18 ? 'adult' : 'minor';

let score: number = 85;
let result: string = score >= 60 ? 'pass' : 'fail';

// 返回值类型必须一致
let value: number = 10;
let output: string = value > 5 ? 'greater' : 'less';  // 正确
let wrong: string = value > 5 ? 10 : 'less';  // 编译错误

// 函数调用
function getName(): string {
  return 'Alice';
}

function getDefaultName(): string {
  return 'Unknown';
}

let user: string | null = null;
let displayName: string = user !== null ? user : getDefaultName();
// [End ts_ternary_operator_basics]

// [Start ts_operator_overloading_not_supported]
// 不支持运算符重载
class Vector {
  public x: number = 0;
  public y: number = 0;

  constructor(x: number = 0, y: number = 0) {
    this.x = x;
    this.y = y;
  }

  // 不支持operator+（编译错误：TS不支持运算符重载）
  operator+(other: Vector): Vector {
    return new Vector(this.x + other.x, this.y + other.y);
  }
}
// [End ts_operator_overloading_not_supported]

// [Start ts_destructuring_not_supported]
interface Point {
  pointX: number;
  pointY: number;
}

let point: Point = { pointX: 10, pointY: 20 };

// 不支持
let [destA, destB] = [1, 2];
let {pointX, pointY} = point;

// 正确：单独赋值
let arr: number[] = [1, 2];
let destAVal: number = arr[0];
let destBVal: number = arr[1];

let destX: number = point.pointX;
let destY: number = point.pointY;
// [End ts_destructuring_not_supported]

// [Start ts_strict_equality_best_practices]
// 反例
let strictValue: number | null = 5;
if (strictValue == 5) { }
if (strictValue != null) { }

let equalityValue: number | null = 5;

// 推荐：使用严格相等
if (equalityValue === 5) { }
if (equalityValue !== null) { }
// [End ts_strict_equality_best_practices]

// [Start ts_type_safe_operations]
let num: number = 5;
num = 'text';  // 编译错误

// 运算符操作数类型必须兼容
let typeSafeA: number = 5;
let typeSafeB: string = '5';
let typeSafeResult: boolean = typeSafeA > typeSafeB;  // 编译错误
// [End ts_type_safe_operations]

// [Start ts_comparison_operators]
// 比较运算符返回布尔值
let cmpResult: boolean = 5 > 3;  // true

// 可用于条件表达式
let cmpA: number = 10;
let cmpB: number = 20;
let cmpMax: number = cmpA > cmpB ? cmpA : cmpB;

// 链式比较（需要分开写）
// 不支持：if (1 < x < 10)
// 正确写法：
let cmpX: number = 5;
if (1 < cmpX && cmpX < 10) {
  // x在 (1, 10) 区间
}

// 比较不同类型
let cmpNum: number = 5;
let str: string = '5';
cmpNum > str;  // 编译错误，类型不匹配
// [End ts_comparison_operators]

// [Start ts_as_const]
// TypeScript对照写法，ArkTS中用显式类型标注替代
const tsConfig = {
  url: 'EXAMPLE_API_URL',
  method: 'GET'
} as const;
// tsConfig.method 类型为 'GET'（字面量）

const tsArgs = [8, 5] as const;
// tsArgs 类型为 readonly [8, 5]（元组）
// [End ts_as_const]

// [Start ts_as_const_readonly_error]
// TypeScript对照写法，演示readonly赋值的编译错误
interface TsReadonlyConfig {
  readonly method: string;
}

let tsReadonlyConfig: TsReadonlyConfig = {
  method: 'GET'
};

tsReadonlyConfig.method = 'POST';  // 编译错误：Cannot assign to 'method' because it is a read-only property
// [End ts_as_const_readonly_error]

// [Start ts_satisfies]
// TypeScript对照写法（TS 4.9+），ArkTS中用显式类型替代
type StColors = 'red' | 'green' | 'blue';

const stRgb = {
  red: '#FF0000',
  green: '#00FF00',
  blue: '#0000FF'
} satisfies Record<StColors, string>;
// [End ts_satisfies]
