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

// ===== basic_variable_assignment =====
// [Start basic_variable_assignment]
let value: number = 10;
let name: string = 'Alice';
let active: boolean = true;

// 重新赋值
value = 20;
name = 'Bob';
// [End basic_variable_assignment]

// ===== chain_vs_separate_assignment =====
// [Start chain_vs_separate_assignment]
let a: number;
let b: number;

// 反例：链式赋值
a = b = 10;

// 推荐：分开赋值
a = 10;
b = 10;
// [End chain_vs_separate_assignment]

// ===== object_property_and_reference_assignment =====
// [Start object_property_and_reference_assignment]
class Point {
  public x: number = 0;
  public y: number = 0;
}

let point: Point = new Point();
point.x = 10;       // 属性赋值
point.y = 20;

let another: Point = point;  // 引用赋值
another.x = 30;    // point.x也变为30
// [End object_property_and_reference_assignment]

// ===== addition_and_string_concatenation =====
// [Start addition_and_string_concatenation]
let addA: number = 10;
let addB: number = 5;

let sum: number = addA + addB;    // 15

// 字符串拼接
let greeting: string = 'Hello' + ' World';
let message: string = 'Count: ' + 10;
// [End addition_and_string_concatenation]

// ===== subtraction_and_negative_number =====
// [Start subtraction_and_negative_number]
let numberA: number = 10;
let numberB: number = 5;

let diff: number = numberA - numberB;   // 5
let negative: number = -10; // 负数表示
// [End subtraction_and_negative_number]

// ===== multiplication_operator =====
// [Start multiplication_operator]
let mulA: number = 10;
let mulB: number = 5;

let product: number = mulA * mulB;  // 50

// 面积计算
let width: number = 5;
let height: number = 10;
let area: number = width * height;  // 50
// [End multiplication_operator]

// ===== division_operator =====
// [Start division_operator]
let divA: number = 10;
let divB: number = 4;

let quotient: number = divA / divB;  // 2.5

// 整数除法
let intDivision: number = Math.floor(10 / 4);  // 2

// 除以零
let zeroDiv: number = 10 / 0;   // Infinity
let negZeroDiv: number = -10 / 0;  // -Infinity
let zeroByZero: number = 0 / 0;  // NaN
// [End division_operator]

// ===== modulo_operator =====
// [Start modulo_operator]
let modA: number = 10;
let modB: number = 3;

let remainder: number = modA % modB;  // 1

// 判断奇偶
let isEven: boolean = (modA % 2) === 0;
let isOdd: boolean = (modA % 2) !== 0;
// [End modulo_operator]

// ===== unary_negation_operator =====
// [Start unary_negation_operator]
let negA: number = 5;
let negNegative: number = -negA;  // -5

let negB: number = -10;
let positive: number = -negB;  // 10
// [End unary_negation_operator]

// ===== unary_plus_operator =====
// [Start unary_plus_operator]
let plusA: number = 5;
let plus: number = +plusA;  // 5

// 用于显式转换（推荐使用Number.parseInt）
let strNum: number = Number.parseInt('42', 10);
// [End unary_plus_operator]

// ===== exponentiation_operator =====
// [Start exponentiation_operator]
let base: number = 2;
let exponent: number = 3;

let power: number = base ** exponent;  // 8 (2^3)

let square: number = 5 ** 2;   // 25
let cube: number = 3 ** 3;     // 27
// [End exponentiation_operator]

// ===== compound_assignment_operators =====
// [Start compound_assignment_operators]
// 加法赋值
let total: number = 100;
total += 50;
console.info(`${total}`);  // 150

// 字符串拼接赋值
let compoundMessage: string = 'Hello';
compoundMessage += ' World';
console.info(`${compoundMessage}`);  // Hello World

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
let compoundValue: number = 17;
compoundValue %= 5;
console.info(`${compoundValue}`);  // 2

// 指数赋值
let compoundBase: number = 2;
compoundBase **= 4;
console.info(`${compoundBase}`);  // 16
// [End compound_assignment_operators]

// ===== strict_equality_operator =====
// [Start strict_equality_operator]
// 数值比较
let eqA: number = 5;
let eqB: number = 5;
console.info(`${eqA === eqB}`);     // true

// 不同值
let eqNum1: number = 5;
let eqNum2: number = 10;
console.info(`${eqNum1 === eqNum2}`); // false

// 对象比较引用
class EqPoint {
  public x: number;
  public y: number;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

let p1: EqPoint = new EqPoint(1, 2);
let p2: EqPoint = new EqPoint(1, 2);
console.info(`${p1 === p2}`);  // false（不同对象）
// [End strict_equality_operator]

// ===== strict_inequality_operator =====
// [Start strict_inequality_operator]
let neA: number = 5;
let neB: number = 3;
console.info(`${neA !== neB}`);     // true

let neNum1: number = 5;
let neNum2: number = 10;
console.info(`${neNum1 !== neNum2}`); // true
// [End strict_inequality_operator]

// ===== greater_than_operator =====
// [Start greater_than_operator]
let gtA: number = 10;
let gtB: number = 5;

console.info(`${gtA > gtB}`);   // true
console.info(`${gtB > gtA}`);   // false
console.info(`${gtA > gtA}`);   // false

// 字符串比较Unicode码点
console.info(`${'gtB' > 'gtA'}`);     // true
console.info(`${'abc' > 'abb'}`); // true
// [End greater_than_operator]

// ===== less_than_operator =====
// [Start less_than_operator]
let ltA: number = 10;
let ltB: number = 5;

console.info(`${ltA < ltB}`);   // false
console.info(`${ltB < ltA}`);   // true
console.info(`${ltA < ltA}`);   // false
// [End less_than_operator]

// ===== greater_than_or_equal_operator =====
// [Start greater_than_or_equal_operator]
let gteA: number = 10;
let gteB: number = 5;
let c: number = 10;

console.info(`${gteA >= gteB}`);  // true
console.info(`${gteA >= c}`);  // true
console.info(`${gteB >= gteA}`);  // false
// [End greater_than_or_equal_operator]

// ===== less_than_or_equal_operator =====
// [Start less_than_or_equal_operator]
let lteA: number = 10;
let lteB: number = 5;
let lteC: number = 10;

console.info(`${lteA <= lteB}`);  // false
console.info(`${lteA <= lteC}`);  // true
console.info(`${lteB <= lteA}`);  // true
// [End less_than_or_equal_operator]

// ===== tuple_comparison =====
// [Start tuple_comparison]
function compareTuples(a: number[], b: number[]): boolean {
  if (a.length !== b.length) {
    return false;
  }
  for (let i: number = 0; i < a.length; i++) {
    if (a[i] !== b[i]) {
      return false;
    }
  }
  return true;
}

let tuple1: number[] = [1, 2];
let tuple2: number[] = [1, 2];
console.info(`${compareTuples(tuple1, tuple2)}`);  // true
// [End tuple_comparison]

// ===== ternary_conditional_operator =====
// [Start ternary_conditional_operator]
let age: number = 20;
let status: string = age >= 18 ? 'adult' : 'minor';

let score: number = 85;
let result: string = score >= 60 ? 'pass' : 'fail';

// 嵌套三元运算符
let grade: string = 
  score >= 90 ? 'A' :
  score >= 80 ? 'B' :
  score >= 70 ? 'C' :
  score >= 60 ? 'D' : 'F';

// 函数返回
function getStatus(code: number): string {
  return code === 200 ? 'OK' : 'Error';
}

// 条件赋值
let isAdmin: boolean = true;
let role: string = isAdmin ? 'admin' : 'user';
// [End ternary_conditional_operator]

// ===== nullish_coalescing_operator =====
// [Start nullish_coalescing_operator]
let coalesceValue: string | null = null;
let coalesceResult: string = coalesceValue ?? 'default';
console.info(`${coalesceResult}`);  // "default"

let value2: string = 'hello';
let result2: string = value2 ?? 'default';  // "hello"

// 与 || 的区别
let count: number = 0;
let text: string = '';
let flag: boolean = false;

// || 替换falsy值
let withOr1: number = count || 10;     // 10（0是falsy）
let withOr2: string = text || 'default'; // 'default'

// ?? 只替换null/undefined
let withNullCoalesce1: number = count ?? 10;      // 0（保留0）
let withNullCoalesce2: string = text ?? 'default'; // ''（保留空字符串）

// 链式空值合并
let primary: string | null = null;
let secondary: string | null = null;
let fallback: string = 'default';

let result3: string = primary ?? secondary ?? fallback;
console.info(`${result3}`);  // "default"
// [End nullish_coalescing_operator]

// ===== closed_range_check =====
// [Start closed_range_check]
function inClosedRange(checkValue: number, min: number, max: number): boolean {
  return checkValue >= min && checkValue <= max;
}

let checkValue: number = 50;
let inRange: boolean = inClosedRange(checkValue, 10, 100);  // true
// [End closed_range_check]

// ===== half_open_range_check =====
// [Start half_open_range_check]
function inHalfOpenRange(checkValue2: number, min: number, max: number): boolean {
  return checkValue2 >= min && checkValue2 < max;
}

let checkValue2: number = 100;
let checkInRange: boolean = inHalfOpenRange(checkValue2, 10, 100);  // false
// [End half_open_range_check]

// ===== single_boundary_check =====
// [Start single_boundary_check]
function aboveMin(checkValue3: number, min: number): boolean {
  return checkValue3 >= min;
}

function belowMax(checkValue3: number, max: number): boolean {
  return checkValue3 <= max;
}

let checkValue3: number = 150;
let isAbove: boolean = aboveMin(checkValue3, 100);  // true
let isBelow: boolean = belowMax(checkValue3, 200);  // true
// [End single_boundary_check]

// ===== logical_not_operator =====
// [Start logical_not_operator]
let isA: boolean = true;
let isB: boolean = false;

console.info(`${!isA}`);  // false
console.info(`${!isB}`);  // true

// 双重否定转换为布尔值
let notValue: number = 5;
console.info(`${!!notValue}`);  // true（等同于Boolean(notValue)）
// [End logical_not_operator]

// ===== logical_and_operator =====
// [Start logical_and_operator]
let andA: boolean = true;
let andB: boolean = true;
let andC: boolean = false;

console.info(`${andA && andB}`);  // true
console.info(`${andA && andC}`);  // false

// 真值表
// true && true   → true
// true && false  → false
// false && true  → false
// false && false → false

// 条件检查
let andAge: number = 25;
let hasLicense: boolean = true;
let hasInsurance: boolean = true;

let canDrive: boolean = andAge >= 18 && hasLicense && hasInsurance;
// [End logical_and_operator]

// ===== logical_or_operator =====
// [Start logical_or_operator]
let orA: boolean = true;
let orB: boolean = false;
let orC: boolean = false;

console.info(`${orA || orB}`);  // true
console.info(`${orB || orC}`);  // false

// 真值表
// true || true   → true
// true || false  → true
// false || true  → true
// false || false → false

// 任一条件满足
let orRole: string = 'admin';
let hasPermission: boolean = true;

let canAccess: boolean = orRole === 'admin' || hasPermission;
// [End logical_or_operator]

// ===== boolean_logic_combination =====
// [Start boolean_logic_combination]
let boolLogAge: number = 25;
let boolLogHasLicense: boolean = true;
let isGuest: boolean = false;

// 必须满足所有条件
let boolLogCanDrive: boolean = boolLogAge >= 18 && boolLogHasLicense;

// 任一条件满足
let hasAccess: boolean = isGuest || boolLogHasLicense;

// 复合条件
let canRentCar: boolean = boolLogAge >= 21 && (boolLogHasLicense || isGuest);

// 排除条件
let userStatus: string = 'active';
let isInactive: boolean = !(userStatus === 'active');

// 德摩根定律应用
let invalid: boolean = !(boolLogHasLicense && boolLogAge >= 18);
// 等价于
let invalid2: boolean = !boolLogHasLicense || boolLogAge < 18;
// [End boolean_logic_combination]

// ===== short_circuit_evaluation =====
// [Start short_circuit_evaluation]
// && 短路：左边为false，右边不执行
function expensiveCheck(): boolean {
  console.info('执行复杂检查');
  return true;
}

let enabled: boolean = false;
let circuitResult: boolean = enabled && expensiveCheck();  // 不执行expensiveCheck

// || 短路：左边为true，右边不执行
function fallbackValue(): string {
  console.info('使用默认值');
  return 'default';
}

let circuitPrimary: string | null = 'circuitPrimary';
let circuitValue: string = circuitPrimary !== null ? circuitPrimary : fallbackValue();  // 不执行fallbackValue

// ?? 短路：左边不为null/undefined，右边不执行
function expensiveDefault(): string {
  console.info('执行昂贵默认值计算');
  return 'default';
}

let provided: string = 'text';
let circuitResult2: string = provided ?? expensiveDefault();  // 不执行expensiveDefault
// [End short_circuit_evaluation]

// ===== increment_decrement_operators =====
// [Start increment_decrement_operators]
let decrCount: number = 5;

// 前置递增：先增加，再使用
let preInc: number = ++decrCount;  // decrCount=6, preInc=6

// 后置递增：先使用，再增加
let postInc: number = decrCount++; // decrCount=7, postInc=6

// 前置递减
let preDec: number = --decrCount;  // decrCount=6, preDec=6

// 后置递减
let postDec: number = decrCount--; // decrCount=5, postDec=6
// [End increment_decrement_operators]

// ===== optional_chaining_operator =====
// [Start optional_chaining_operator]
class User {
  public profile: Profile | null = null;
}

class Profile {
  public nickname: string = '';
}

let user: User | null = new User();

// 安全访问属性链
let nickname: string | undefined = user?.profile?.nickname;
console.info(`${nickname}`);  // undefined

// 访问方法
class Service {
  public getData(): string {
    return 'data';
  }
}
function getService(): Service | null {
  return null;
}
let service: Service | null = getService();
let data: string | null | undefined = service?.getData();

// 访问数组元素
function getArr(): number[] | null {
  return null;
}
let arr: number[] | null = getArr();
let first: number | undefined = arr !== null ? arr[0] : undefined;

// 结合空值合并
let display: string = user?.profile?.nickname ?? 'Unknown';
// [End optional_chaining_operator]

// ===== strict_equality_preferred =====
// [Start strict_equality_preferred]
let eqValue: string | null = null;
let eqCount: number = 0;
// 推荐：使用严格相等
if (eqValue === null) { }
if (eqCount === 0) { }
// [End strict_equality_preferred]

// ===== strict_comparison_preferred =====
// [Start strict_comparison_preferred]
// 推荐：使用严格相等
if (value === null) { }
if (count === 0) { }
// [End strict_comparison_preferred]

// ===== parentheses_for_logical_precedence =====
// [Start parentheses_for_logical_precedence]
// 反例
let resultWithoutParens: boolean = !!a || !!b && !!c;

// 推荐
let resultWithParens: boolean = !!a || (!!b && !!c);
// [End parentheses_for_logical_precedence]

// ===== shorthand_operators_preferred =====
// [Start shorthand_operators_preferred]
// 推荐
total += value;
count++;

// 反例
total = total + value;
count = count + 1;
// [End shorthand_operators_preferred]

// ===== meaningful_boolean_names =====
// [Start meaningful_boolean_names]
// 推荐
let namesCanDrive: boolean = age >= 18 && hasLicense;

// 反例
let x: boolean = a >= 18 && !!b;
// [End meaningful_boolean_names]

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

// [Start nullish_coalescing_over_ternary]
let coalesceInput: string | null = 'hello';
// 三元运算符
let coalesceValue2: string = coalesceInput !== null ? coalesceInput : 'default';

// 推荐：空值合并
let coalesceValue22: string = coalesceInput ?? 'default';
// [End nullish_coalescing_over_ternary]

// [Start loose_equality_not_recommended]
let inputValue: string | null = null;
let itemCount: number = 0;
if (inputValue == null) { }
if (itemCount == 0) { }
// [End loose_equality_not_recommended]
