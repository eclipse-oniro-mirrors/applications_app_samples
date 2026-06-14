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

// [Start ts_string_constant]
const APP_NAME: string = 'MyApp';
const VERSION: string = '1.0.0';

APP_NAME = 'NewApp';  // 编译错误：不能重新赋值
// [End ts_string_constant]

// [Start ts_string_immutability]
let original: string = 'Hello';

// 方法返回新字符串
let modified: string = original.toUpperCase();
console.info(`${original}`);  // "Hello"（原字符串不变）
console.info(`${modified}`);  // "HELLO"

// 不能直接修改字符串内容
original[0] = 'J';  // 无效操作
// [End ts_string_immutability]

// [Start ts_template_expressions]
// 支持的表达式类型
let a: number = 10;
let b: number = 20;

let arithmetic: string = `${a + b}`;         // "30"
let comparison: string = `${a > b}`;         // "false"
let logical: string = `${a > 0 && b > 0}`;   // "true"
let functionCall: string = `${Math.max(a, b)}`; // "20"

// 支持三元运算符
let result: string = `${a > b ? 'greater' : 'less'}`;  // "less"

// 不支持复杂语句
let invalid: string = `${if (a > b) { 'yes' }}`;  // 编译错误

// 嵌套模板字符串
let outer: string = `Outer: ${`Inner: ${a}`}`;  // "Outer: Inner: 10"
// [End ts_template_expressions]

// [Start ts_string_at]
// TypeScript对照写法（ES2022），ArkTS中用charAt替代
let tsAtWord: string = 'hello';
console.info(`${tsAtWord.at(0)}`);   // 'h'
console.info(`${tsAtWord.at(-1)}`);  // 'o'（最后一个字符）
// [End ts_string_at]

// [Start ts_template_literal_type]
// TypeScript对照写法，ArkTS中不支持
type TltWorld = 'world';
type TltGreeting = `hello ${TltWorld}`;  // 'hello world'

// 联合展开
type TltLocale = `${'en' | 'ja'}_${'welcome' | 'bye'}`;
// 'en_welcome' | 'en_bye' | 'ja_welcome' | 'ja_bye'

// 内置字符串操作类型
type TltUpper = Uppercase<'hello'>;      // 'HELLO'
type TltLower = Lowercase<'HELLO'>;      // 'hello'
type TltCap = Capitalize<'hello'>;       // 'Hello'
type TltUncap = Uncapitalize<'Hello'>;   // 'hello'
// [End ts_template_literal_type]

// [Start at_method_alternative]
let atWord: string = 'hello';
console.info(`${atWord.charAt(0)}`);              // h
console.info(`${atWord.charAt(atWord.length - 1)}`);  // o
console.info(`${atWord.charAt(10)}`);             // empty
// [End at_method_alternative]
