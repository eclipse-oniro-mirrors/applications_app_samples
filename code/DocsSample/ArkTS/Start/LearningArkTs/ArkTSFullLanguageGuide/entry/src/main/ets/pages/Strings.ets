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

// ===== string_literal_types =====
// [Start string_literal_types]
let single: string = 'Hello';
let double: string = 'World';
let template: string = `ArkTS`;
// [End string_literal_types]

// ===== multiline_string =====
// [Start multiline_string]
let multiLine: string = `Line 1
Line 2
Line 3`;

let paragraph: string = `这是一段
跨越多行的
文本内容`;
// [End multiline_string]

// ===== escape_characters =====
// [Start escape_characters]
let newline: string = 'Line1\nLine2';
let tab: string = 'Column1\tColumn2';
let quote: string = 'It\'s a test';
let backslash: string = 'Path: C:\\Users';
let mixed: string = 'Hello\n\tWorld';
// [End escape_characters]

// ===== template_string_escape =====
// [Start template_string_escape]
// 模板字符串保留换行和空格
let code: string = `
function hello() {
  console.info('Hello');
}
`;

// 转义反引号和 $
let escaped: string = `Price: \$100`;
let backtick: string = `Use \`backticks\``;
// [End template_string_escape]

// ===== string_reassignment =====
// [Start string_reassignment]
let message: string = 'Hello';
message = 'Hello, World';  // 重新赋值

let text: string = '';
text += 'Part 1';
text += ' Part 2';
// [End string_reassignment]

// ===== string_iteration =====
// [Start string_iteration]
let iterText: string = 'Hello';

// 使用for...of遍历字符
for (let char of iterText) {
  console.info(`${char}`);
}

// 使用for循环遍历
for (let i: number = 0; i < iterText.length; i++) {
  let char: string = iterText[i];
  console.info(`${char}`);
}

// 使用split转换为数组
let chars: string[] = iterText.split('');
for (let char of chars) {
  console.info(`${char}`);
}
// [End string_iteration]

// ===== character_access =====
// [Start character_access]
let accessText: string = 'Hello';

// 获取单个字符
let firstChar: string = accessText.charAt(0);   // 'H'
let secondChar: string = accessText.charAt(1);   // 'e'

// 字符编码
let accessCode: number = accessText.charCodeAt(0);     // 72（'H' 的Unicode）
let codePoint: number = accessText.codePointAt(0) ?? 0; // 72

// 从编码创建字符
let charFromCode: string = String.fromCharCode(72);  // 'H'
// [End character_access]

// ===== string_concatenation =====
// [Start string_concatenation]
let firstName: string = 'John';
let lastName: string = 'Doe';

// 使用 + 运算符
let fullName: string = firstName + ' ' + lastName;  // "John Doe"

// 使用concat方法
let combined: string = firstName.concat(' ', lastName);  // "John Doe"

// 使用join方法
let parts: string[] = [firstName, lastName];
let joined: string = parts.join(' ');  // "John Doe"
// [End string_concatenation]

// ===== string_append =====
// [Start string_append]
let appendText: string = 'Hello';
let char: string = '!';

let result: string = appendText + char;  // "Hello!"

// 多字符拼接
let appendChars: string[] = ['a', 'b', 'c'];
let combinedChars: string = appendChars.join('');  // "abc"
// [End string_append]

// ===== compound_assignment_concat =====
// [Start compound_assignment_concat]
let compoundMessage: string = '';

// 使用 += 赋值拼接
compoundMessage += 'Hello';
compoundMessage += ' ';
compoundMessage += 'World';
console.info(`${compoundMessage}`);  // "Hello World"

// 使用复合赋值
let compoundText: string = 'Part 1';
compoundText += ' Part 2';  // "Part 1 Part 2"
// [End compound_assignment_concat]

// ===== template_interpolation =====
// [Start template_interpolation]
let name: string = 'Alice';
let age: number = 25;

// 变量插值
let interpMessage: string = `Hello, ${name}`;
console.info(`${interpMessage}`);  // "Hello, Alice"

// 表达式插值
let info: string = `Name: ${name}, Age: ${age}`;
let nextAge: string = `Next year: ${age + 1}`;

// 对象属性插值
interface User {
  name: string;
  email: string;
}

let user: User = { name: 'Bob', email: 'bob@example.com' };
let profile: string = `User: ${user.name} (${user.email})`;
// [End template_interpolation]

// ===== unicode_representation =====
// [Start unicode_representation]
// Unicode字符表示
let unicode1: string = 'A';               // 直接字符
let unicode2: string = '\u0041';          // Unicode转义（'A'）
let unicode3: string = '\x41';            // ASCII转义（'A'）

// Unicode码点
let emoji: string = '\u{1F600}';          // 😀（emoji）
let chinese: string = '\u{4E2D}';         // 中

// 获取字符的Unicode码点
let unicodeReprCodePoint: number = 'A'.codePointAt(0) ?? 0;  // 65
let emojiCode: number = '😀'.codePointAt(0) ?? 0; // 128512

// 从码点创建字符
let fromCode: string = String.fromCodePoint(65);      // 'A'
let fromEmoji: string = String.fromCodePoint(128512); // '😀'
// [End unicode_representation]

// ===== unicode_codepoint_conversion =====
// [Start unicode_codepoint_conversion]
let unicodeText: string = 'Hello';

// 字符串转为Unicode码点数组
let codePoints: number[] = [];
for (let char of unicodeText) {
  codePoints.push(char.codePointAt(0) ?? 0);
}
console.info(`${codePoints.join(', ')}`);  // 72, 101, 108, 108, 111

// Unicode码点转为字符串
let reconstructed: string = '';
for (let code of codePoints) {
  reconstructed += String.fromCodePoint(code);
}
console.info(`${reconstructed}`);  // "Hello"

// Unicode转义形式
let unicodeEscaped: string = '';
for (let char of unicodeText) {
  let code: number = char.codePointAt(0) ?? 0;
  unicodeEscaped += `\\u${code.toString(16).padStart(4, '0')}`;
}
console.info(`${unicodeEscaped}`);  // "\u0048\u0065\u006c\u006c\u006f"
// [End unicode_codepoint_conversion]

// ===== string_length =====
// [Start string_length]
let lengthText: string = 'Hello';
let length: number = lengthText.length;  // 5

let empty: string = '';
let emptyLength: number = empty.length;  // 0

let space: string = '   ';
let spaceLength: number = space.length;  // 3

// 多行字符串长度包含换行符
let lengthMultiLine: string = `Line1
Line2`;
let multiLength: number = lengthMultiLine.length;  // 11（含 \n）
// [End string_length]

// ===== multibyte_length =====
// [Start multibyte_length]
// 普通ASCII字符
let ascii: string = 'Hello';
console.info(`${ascii.length.toString()}`);  // 5

// 中文字符（每个字符长度为1）
let multibyteChinese: string = '你好世界';
console.info(`${multibyteChinese.length.toString()}`);  // 4

// Emoji字符（部分multibyteEmoji长度可能为2）
let multibyteEmoji: string = '😀';
console.info(`${multibyteEmoji.length.toString()}`);  // 2（surrogate pair）

// 组合字符
let multibyteCombined: string = 'é';  // e + combining accent
console.info(`${multibyteCombined.length.toString()}`);  // 可能为2

// 正确统计字符数（使用迭代）
function countCharacters(text: string): number {
  let count: number = 0;
  for (let char of text) {
    count++;
  }
  return count;
}

console.info(`${countCharacters('😀').toString()}`);  // 1（正确统计）
// [End multibyte_length]

// ===== string_indexing =====
// [Start string_indexing]
let indexText: string = 'Hello World';

// 索引访问
let first: string = indexText[0];           // 'H'
let fifth: string = indexText[4];           // 'o'
let last: string = indexText[indexText.length - 1];  // 'd'

// charAt方法
let second: string = indexText.charAt(1);   // 'e'

// 越界访问
let outOfBounds: string | undefined = indexText[100];  // undefined
let outOfBounds2: string = indexText.charAt(100);      // ''（空字符串）
// [End string_indexing]

// ===== string_search =====
// [Start string_search]
let searchText: string = 'Hello World';

// 查找字符位置
let indexOfO: number = searchText.indexOf('o');      // 4
let indexOfWorld: number = searchText.indexOf('World'); // 6
let lastIndexOfO: number = searchText.lastIndexOf('o'); // 7

// 从指定位置开始查找
let indexOfO2: number = searchText.indexOf('o', 5);   // 7（从索引5开始）

// 查找不存在
let notFound: number = searchText.indexOf('xyz');    // -1

// 索引偏移计算
let nextIndex: number = indexOfO + 1;          // 5
let prevIndex: number = indexOfO - 1;          // 3
// [End string_search]

// ===== substring_extraction =====
// [Start substring_extraction]
let extractText: string = 'Hello World';

// substring方法
let sub1: string = extractText.substring(0, 5);    // "Hello"
let sub2: string = extractText.substring(6);       // "World"
let sub3: string = extractText.substring(6, 11);   // "World"

// slice方法
let slice1: string = extractText.slice(0, 5);      // "Hello"
let slice2: string = extractText.slice(-5);        // "World"（负索引）
let slice3: string = extractText.slice(6, -1);     // "Worl"

// substring vs slice
// substring自动调整参数顺序，负数视为0；slice不调整参数顺序，支持负索引
let subNeg: string = extractText.substring(-2, 3);  // "Hel"（-2被视为0）
let reversed: string = extractText.substring(5, 0);  // "Hello"（自动调整）
let reversedSlice: string = extractText.slice(5, 0);  // ""（不调整）
// [End substring_extraction]

// ===== substring_operations =====
// [Start substring_operations]
let original: string = 'Hello World';

// 子字符串是新字符串，独立存在
let sub: string = original.substring(0, 5);
sub = sub.toUpperCase();  // 修改子字符串不影响原字符串
console.info(`${original}`);  // "Hello World"

// 子字符串转数组
let substrParts: string[] = sub.split('');
console.info(`[${substrParts.join(', ')}]`);  // H, e, l, l, o

// 子字符串拼接
let newString: string = sub + ' ArkTS';  // "Hello ArkTS"

// 子字符串替换
let replaced: string = original.replace(sub, 'Hi');  // "Hi World"
// [End substring_operations]

// ===== string_comparison =====
// [Start string_comparison]
let str1: string = 'Hello';
let str2: string = 'Hello';
let str3: string = 'World';

// 严格相等比较
console.info(`${str1 === str2}`);  // true
console.info(`${str1 === str3}`);  // false
console.info(`${str1 !== str3}`);  // true

// 大小写敏感比较
let upper: string = 'HELLO';
console.info(`${str1 === upper}`);  // false（大小写不同）

// 忽略大小写比较
let equalIgnoreCase: boolean = 
  str1.toLowerCase() === upper.toLowerCase();  // true
// [End string_comparison]

// ===== starts_with_check =====
// [Start starts_with_check]
let startsWithText: string = 'Hello World';

// startsWith方法
let startsWithHello: boolean = startsWithText.startsWith('Hello');  // true
let startsWithWorld: boolean = startsWithText.startsWith('World');  // false

// 从指定位置开始检查
let startsWithWorld2: boolean = startsWithText.startsWith('World', 6);  // true

// 手动前缀检查
function hasPrefix(text: string, prefix: string): boolean {
  return text.indexOf(prefix) === 0;
}
// [End starts_with_check]

// ===== ends_with_check =====
// [Start ends_with_check]
let endsWithText: string = 'Hello World';

// endsWith方法
let endsWithWorld: boolean = endsWithText.endsWith('World');  // true
let endsWithHello: boolean = endsWithText.endsWith('Hello');  // false

// 检查指定长度内的后缀
let endsWithOrld: boolean = endsWithText.endsWith('orld', 11);  // true

// 手动后缀检查
function hasSuffix(text: string, suffix: string): boolean {
  let startPos: number = text.length - suffix.length;
  return startPos >= 0 && text.indexOf(suffix, startPos) === startPos;
}
// [End ends_with_check]

// ===== to_uppercase =====
// [Start to_uppercase]
let upperText: string = 'Hello World';

let upperUpper: string = upperText.toUpperCase();  // "HELLO WORLD"

// 部分大写
let firstUpper: string = upperText[0].toUpperCase() + upperText.substring(1);  // "Hello World"

// 每个单词首字母大写
function capitalizeWords(upperText: string): string {
  let words: string[] = upperText.split(' ');
  let capitalized: string[] = words.map((word: string): string => {
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  });
  return capitalized.join(' ');
}

let upperResult: string = capitalizeWords('hello world');  // "Hello World"
// [End to_uppercase]

// ===== to_lowercase =====
// [Start to_lowercase]
let lowerText: string = 'Hello World';

let lower: string = lowerText.toLowerCase();  // "hello world"

// 部分小写
let lowerMixed: string = lowerText[0] + lowerText.substring(1).toLowerCase();  // "Hello world"

// 判断是否为小写
function isLowerCase(lowerText: string): boolean {
  return lowerText === lowerText.toLowerCase();
}

console.info(`${isLowerCase('hello')}`);  // true
console.info(`${isLowerCase('Hello')}`);  // false
// [End to_lowercase]

// ===== string_search_methods =====
// [Start string_search_methods]
let searchText2: string = 'Hello World';

// indexOf：查找位置
let pos: number = searchText2.indexOf('World');      // 7
let lastPos: number = searchText2.lastIndexOf('o');  // 7

// includes：是否包含
let hasWorld: boolean = searchText2.includes('World'); // true

// startsWith：是否以指定字符串开头
let startsHello: boolean = searchText2.startsWith('Hello'); // true

// endsWith：是否以指定字符串结尾
let endsWorld: boolean = searchText2.endsWith('World'); // true
// [End string_search_methods]

// ===== string_slice_split =====
// [Start string_slice_split]
let sliceText: string = 'Hello World';

// slice：截取
let slice: string = sliceText.slice(0, 5);        // "Hello"

// substring：截取
let substring: string = sliceText.substring(7);    // "World"

// split：分割为数组
let split: string[] = sliceText.split(' ');
console.info(`[${split.join(', ')}]`);  // Hello, World
let splitAll: string[] = sliceText.split('');
console.info(`[${splitAll.join(', ')}]`);  // H, e, l, l, o,  , W, o, r, l, d
// [End string_slice_split]

// ===== string_common_methods =====
// [Start string_common_methods]
let commonMethodsText: string = 'Hello World';

// replace：替换
let commonMethodsReplaced: string = commonMethodsText.replace('World', 'ArkTS');  // "Hello ArkTS"

// replaceAll：替换所有（ES2021，ArkTS支持）
let multiple: string = 'aa bb aa';
let allReplaced: string = multiple.replaceAll('aa', 'xx');  // "xx bb xx"

// trim：去除首尾空格
let trimmed: string = '  Hello ArkTS  '.trim();  // "Hello ArkTS"

// trimStart：去除开头空格
let trimStart: string = '  Hello ArkTS  '.trimStart();  // "Hello ArkTS  "

// trimEnd：去除结尾空格
let trimEnd: string = '  Hello ArkTS  '.trimEnd();  // "  Hello ArkTS"

// padStart：左侧填充
let padded: string = '5'.padStart(3, '0');  // "005"

// padEnd：右侧填充
let paddedEnd: string = '5'.padEnd(3, '0'); // "500"

// repeat：重复
let repeated: string = 'ab'.repeat(3);      // "ababab"
// [End string_common_methods]

// ===== string_utility_methods =====
// [Start string_utility_methods]
let utilityText: string = 'Hello';

// charAt：获取指定位置字符
let utilityChar: string = utilityText.charAt(0);  // 'H'

// charCodeAt：获取字符编码
let utilityCode: number = utilityText.charCodeAt(0);  // 72

// concat：连接字符串
let concatenated: string = 'Hello'.concat(' ', 'World');  // "Hello World"

// localeCompare：本地化比较
let comparison: number = 'a'.localeCompare('b');  // -1（a < b）

// toString：转为字符串
let numStr: string = (42).toString();  // "42"
let boolStr: string = (true).toString();  // "true"

// valueOf：获取原始值
let value: string = 'test'.valueOf();  // "test"
// [End string_utility_methods]

// ===== string_regex =====
// [Start string_regex]
// match：匹配正则
let regexText: string = 'The quick brown fox';
let matches: RegExpMatchArray | null = regexText.match(/quick/);

// search：查找匹配位置
let regexPos: number = regexText.search(/brown/);  // 10

// replace：正则替换
let regexReplaced: string = regexText.replace(/fox/, 'cat');  // "The quick brown cat"

// split：正则分割
let regexParts: string[] = 'a1b2c3'.split(/\d/);
console.info(`[${regexParts.join(', ')}]`);  // a, b, c, 

// matchAll：全局匹配（ES2020，ArkTS支持）
let allMatches: IterableIterator<RegExpMatchArray> = regexText.matchAll(/\w+/g);
// [End string_regex]

// ===== prefer_template_string =====
// [Start prefer_template_string]
// 推荐：模板字符串
let templateInfo: string = `Name: ${name}, Age: ${age}`;

// 反例：字符串拼接
let info2: string = 'Name: ' + name + ', Age: ' + age;
// [End prefer_template_string]

// ===== strict_equality =====
// [Start strict_equality]
let eqStr1: string = 'hello';
let eqStr2: string = 'world';
// 推荐：使用严格相等避免类型转换问题
if (eqStr1 === eqStr2) { }
// [End strict_equality]

// ===== prefer_includes =====
// [Start prefer_includes]
// 推荐
if (text.includes('keyword')) { }

// 反例
if (text.indexOf('keyword') !== -1) { }
// [End prefer_includes]

// ===== constant_strings =====
// [Start constant_strings]
const ERROR_MESSAGE: string = 'Invalid input';
const SUCCESS_MESSAGE: string = 'Operation completed';
// [End constant_strings]

// ===== prefer_for_of_unicode =====
// [Start prefer_for_of_unicode]
// 推荐：正确处理Unicode
for (let char of text) {
  console.info(char);
}

// 反例：可能无法正确处理emoji
for (let i: number = 0; i < text.length; i++) {
  console.info(text[i]);
}
// [End prefer_for_of_unicode]

// [Start unicode_handling]
let unicodeEmoji: string = '🎉';
let unicodeCode: number | undefined = unicodeEmoji.codePointAt(0);
if (unicodeCode !== undefined) {
  console.info(`${unicodeCode.toString()}`);  // 129395
}

let unicodeChar: string = String.fromCodePoint(128516);
console.info(`${unicodeChar}`);  // 😄

// 按Unicode码点遍历（而非UTF-16编码单元）
let unicodeText2: string = 'a🎉b';
for (let uc of unicodeText2) {
  console.info(`${uc}`);  // 依次输出: a, 🎉, b
}
// [End unicode_handling]

// [Start string_pad_repeat]
// padStart：在开头填充
let prS1: string = '5'.padStart(3, '0');
console.info(`${prS1}`);  // 005

let prS2: string = 'hi'.padStart(5, '-');
console.info(`${prS2}`);  // ---hi

// padEnd：在末尾填充
let prS3: string = 'hi'.padEnd(5, '-');
console.info(`${prS3}`);  // hi---

// repeat：重复字符串
let prS4: string = 'ab'.repeat(3);
console.info(`${prS4}`);  // ababab
// [End string_pad_repeat]



// ===== at_method_alternative =====
// [Start at_method_alternative]
let atWord: string = 'hello';
console.info(`${atWord.charAt(0)}`);              // h
console.info(`${atWord.charAt(atWord.length - 1)}`);  // o
console.info(`${atWord.charAt(10)}`);             // （空字符串，越界）
// [End at_method_alternative]

// ===== template_literal_alternative =====
// [Start template_literal_alternative]
enum TltEventType {
  Click = 'click',
  Hover = 'hover',
  Focus = 'focus'
}

function tltHandleEvent(type: TltEventType, callback: () => void): void {
  console.info(`Handling ${type}`);
  callback();
}

tltHandleEvent(TltEventType.Click, (): void => {
  console.info('Clicked!');
});
// [End template_literal_alternative]
