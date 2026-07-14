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

// ===== basic_if_statement =====
// [Start basic_if_statement]
let score: number = 85;

if (score >= 60) {
  console.info('通过');
}

let age: number = 25;
if (age >= 18) {
  console.info('成年人');
}

let enabled: boolean = true;
if (enabled) {
  startService();
}

function startService(): void {
  console.info('服务已启动');
}
// [End basic_if_statement]

// ===== if_else_if_chain =====
// [Start if_else_if_chain]
let chainScore: number = 85;

if (chainScore >= 90) {
  console.info('优秀');
} else if (chainScore >= 80) {
  console.info('良好');
} else if (chainScore >= 60) {
  console.info('及格');
} else {
  console.info('不及格');
}

let chainAge: number = 25;

if (chainAge < 13) {
  console.info('儿童');
} else if (chainAge < 18) {
  console.info('青少年');
} else if (chainAge < 60) {
  console.info('成年人');
} else {
  console.info('老年人');
}

// 多条件组合
let role: string = 'admin';
let hasPermission: boolean = true;

if (role === 'admin') {
  console.info('管理员权限');
} else if (role === 'user' && hasPermission) {
  console.info('用户权限');
} else {
  console.info('无权限');
}
// [End if_else_if_chain]

// ===== simple_condition_check =====
// [Start simple_condition_check]
let value: number = 10;

// 只检查条件，无需else
if (value > 0) {
  console.info('正数');
}

// else分支为空可省略
if (value < 0) {
  console.info('负数');
} else {
  // 空分支可以省略
}

// 简洁写法
if (value !== 0) {
  console.info('非零');
}
// [End simple_condition_check]

// ===== switch_basic_usage =====
// [Start switch_basic_usage]
let day: number = 3;

switch (day) {
  case 1:
    console.info('星期一');
    break;
  case 2:
    console.info('星期二');
    break;
  case 3:
    console.info('星期三');
    break;
  case 4:
    console.info('星期四');
    break;
  case 5:
    console.info('星期五');
    break;
  case 6:
    console.info('星期六');
    break;
  case 7:
    console.info('星期日');
    break;
  default:
    console.info('无效日期');
}

let status: string = 'active';

switch (status) {
  case 'active':
    console.info('激活状态');
    break;
  case 'inactive':
    console.info('未激活状态');
    break;
  case 'pending':
    console.info('待处理状态');
    break;
  default:
    console.info('未知状态');
}
// [End switch_basic_usage]

// ===== switch_case_fallthrough =====
// [Start switch_case_fallthrough]
let fallValue: number = 5;

// TypeScript不支持：case 1, 2, 3:
// 需要分开写

switch (fallValue) {
  case 1:
  case 2:
  case 3:
    console.info('小数值');
    break;
  case 4:
  case 5:
  case 6:
    console.info('中等数值');
    break;
  default:
    console.info('大数值');
}

let color: string = 'red';

switch (color) {
  case 'red':
  case 'yellow':
  case 'orange':
    console.info('暖色调');
    break;
  case 'blue':
  case 'green':
  case 'purple':
    console.info('冷色调');
    break;
  default:
    console.info('其他颜色');
}
// [End switch_case_fallthrough]

// ===== switch_vs_if_range =====
// [Start switch_vs_if_range]
let rangeScore: number = 85;

// 使用if实现范围匹配
if (rangeScore >= 90 && rangeScore <= 100) {
  console.info('A级');
} else if (rangeScore >= 80 && rangeScore < 90) {
  console.info('B级');
} else if (rangeScore >= 70 && rangeScore < 80) {
  console.info('C级');
} else if (rangeScore >= 60 && rangeScore < 70) {
  console.info('D级');
} else {
  console.info('F级');
}

// 使用switch映射
let grade: number = Math.floor(rangeScore / 10);

switch (grade) {
  case 10:
  case 9:
    console.info('A级');
    break;
  case 8:
    console.info('B级');
    break;
  case 7:
    console.info('C级');
    break;
  case 6:
    console.info('D级');
    break;
  default:
    console.info('F级');
}
// [End switch_vs_if_range]

// ===== switch_default_handling =====
// [Start switch_default_handling]
let command: string = 'unknown';

switch (command) {
  case 'start':
    console.info('启动');
    break;
  case 'stop':
    console.info('停止');
    break;
  case 'restart':
    console.info('重启');
    break;
  default:
    console.info('未知命令');
    handleUnknown(command);
}

function handleUnknown(cmd: string): void {
  console.info(`处理未知命令: ${cmd}`);
}
// [End switch_default_handling]

// ===== switch_break_fallthrough =====
// [Start switch_break_fallthrough]
let fallValue2: number = 1;

switch (fallValue2) {
  case 1:
    console.info('匹配 1');
    break;  // 必须有break，否则继续执行下一个case
  case 2:
    console.info('匹配 2');
    break;
  default:
    console.info('默认');
}

// 没有break会继续执行
switch (fallValue2) {
  case 1:
    console.info('一');
    // 没有break，继续执行case 2
  case 2:
    console.info('二');
    break;
  default:
    console.info('默认');
}
// 输出：一、二
// [End switch_break_fallthrough]

// ===== for_of_iteration =====
// [Start for_of_iteration]
// 遍历数组
let numbers: number[] = [1, 2, 3, 4, 5];
for (let num of numbers) {
  console.info(`${num}`);
}

// 遍历字符串
let text: string = 'Hello';
for (let char of text) {
  console.info(`${char}`);
}

// 遍历Set
let set: Set<number> = new Set<number>();
set.add(1);
set.add(2);
set.add(3);
for (let value of set) {
  console.info(`${value}`);
}

// 遍历Map
let map: Map<string, number> = new Map<string, number>();
map.set('a', 1);
map.set('b', 2);
map.set('c', 3);

for (let key of map.keys()) {
  let mapValue: number | undefined = map.get(key);
  if (mapValue !== undefined) {
    console.info(`键: ${key}, 值: ${mapValue}`);
  }
}

// 遍历Map的值
for (let value of map.values()) {
  console.info(`${value}`);
}

// 遍历Map的键
for (let key of map.keys()) {
  console.info(`${key}`);
}
// [End for_of_iteration]

// ===== for_of_key_value_pairs =====
// [Start for_of_key_value_pairs]
// TypeScript支持：for (let [key, value] of pairsMap)
// ArkTS需要单独提取

let pairsMap: Map<string, number> = new Map([
  ['a', 1],
  ['b', 2]
]);

for (let entry of pairsMap) {
  let key: string = entry[0];
  let value: number = entry[1];
  console.info(`${key}: ${value}`);
}

// 数组遍历（不需要解构）
let pairs: number[][] = [[1, 2], [3, 4], [5, 6]];
for (let pair of pairs) {
  let first: number = pair[0];
  let second: number = pair[1];
  console.info(`${first}, ${second}`);
}
// [End for_of_key_value_pairs]

// ===== traditional_for_loop =====
// [Start traditional_for_loop]
// 基本结构
for (let i: number = 0; i < 5; i++) {
  console.info(`${i}`);
}

// 初始化：let i = 0
// 条件：i < 5
// 增量：i++

// 倒序循环
for (let i: number = 5; i >= 0; i--) {
  console.info(`${i}`);
}

// 步长为2
for (let i: number = 0; i < 10; i += 2) {
  console.info(`${i}`);
}

// 遍历数组索引
let arr: number[] = [10, 20, 30, 40, 50];
for (let i: number = 0; i < arr.length; i++) {
  console.info(`索引 ${i}: ${arr[i] ?? 0}`);
}

// 多变量循环
for (let i: number = 0, j = 10; i < j; i++, j--) {
  console.info(`i=${i}, j=${j}`);
}
// [End traditional_for_loop]

// ===== iterate_range_numbers =====
// [Start iterate_range_numbers]
// 遍历指定范围
function range(start: number, end: number): number[] {
  let result: number[] = [];
  for (let i: number = start; i < end; i++) {
    result.push(i);
  }
  return result;
}

let numsNumbers: number[] = range(1, 10);
for (let num of numsNumbers) {
  console.info(`${num}`);
}

// 遍历范围内的奇数
for (let i: number = 1; i <= 20; i += 2) {
  console.info(`${i}`);
}

// 遍历范围内的偶数
for (let i: number = 2; i <= 20; i += 2) {
  console.info(`${i}`);
}
// [End iterate_range_numbers]

// ===== while_loop_basic =====
// [Start while_loop_basic]
// 基本结构
let count: number = 0;
while (count < 5) {
  console.info(`${count.toString()}`);
  count++;
}

// 条件为false时跳过循环体
let loopValue: number = 10;
while (loopValue < 5) {
  console.info(`${loopValue.toString()}`);  // 不执行
  loopValue++;
}

// 处理数据直到条件满足
let data: string | null = 'data';
while (data !== null) {
  console.info(`${data}`);
  data = getNextData();
}

function getNextData(): string | null {
  // 返回数据或null
  return null;
}

// 累加直到满足条件
let sum: number = 0;
let i: number = 1;
while (sum < 100) {
  sum += i;
  i++;
}
console.info(`累加到 ${sum}`);
// [End while_loop_basic]

// ===== do_while_loop =====
// [Start do_while_loop]
// 基本结构：至少执行一次
let loopCount: number = 0;
do {
  console.info(`${loopCount.toString()}`);
  loopCount++;
} while (loopCount < 5);

// 即使条件初始为false也执行一次
let loopValue2: number = 10;
do {
  console.info(`${loopValue2.toString()}`);  // 执行一次，输出10
  loopValue2++;
} while (loopValue2 < 5);

// 用户输入验证
let input: string = '';
do {
  input = getInput();
} while (input.length === 0);

function getInput(): string {
  return 'valid input';
}

// 重试逻辑
let success: boolean = false;
let attempts: number = 0;
do {
  success = tryConnect();
  attempts++;
} while (!success && attempts < 3);

function tryConnect(): boolean {
  return true;
}
// [End do_while_loop]

// ===== break_statement =====
// [Start break_statement]
// 跳出for循环
for (let i: number = 0; i < 10; i++) {
  if (i === 5) {
    break;  // 跳出循环
  }
  console.info(`${i.toString()}`);
}
// 输出：0, 1, 2, 3, 4

// 跳出while循环
let breakCount: number = 0;
while (breakCount < 10) {
  if (breakCount === 5) {
    break;
  }
  console.info(`${breakCount.toString()}`);
  breakCount++;
}

// 查找元素后跳出
let breakNumbers: number[] = [1, 2, 3, 4, 5];
for (let num of breakNumbers) {
  if (num === 3) {
    console.info('找到 3');
    break;
  }
}
// [End break_statement]

// ===== break_in_switch =====
// [Start break_in_switch]
let switchValue: number = 2;

switch (switchValue) {
  case 1:
    console.info('一');
    break;  // 跳出switch
  case 2:
    console.info('二');
    break;  // 必须有break
  case 3:
    console.info('三');
    break;
  default:
    console.info('默认');
}
// [End break_in_switch]

// ===== nested_loop_break =====
// [Start nested_loop_break]
// 带标签的break：跳出外层循环
outerLoop: for (let i: number = 0; i < 10; i++) {
  for (let j: number = 0; j < 10; j++) {
    if (i + j === 15) {
      console.info(`找到: i=${i}, j=${j}`);
      break outerLoop;
    }
  }
}
// [End nested_loop_break]

// ===== continue_statement =====
// [Start continue_statement]
// 跳过偶数
for (let i: number = 0; i < 10; i++) {
  if (i % 2 === 0) {
    continue;  // 跳过偶数
  }
  console.info(`${i.toString()}`);
}
// 输出：1, 3, 5, 7, 9

// 跳过特定值
let continueNumbers: number[] = [1, 2, 3, 4, 5];
for (let num of continueNumbers) {
  if (num === 3) {
    continue;  // 跳过3
  }
  console.info(`${num.toString()}`);
}
// 输出：1, 2, 4, 5

// 过滤无效数据
let continueData: (string | null)[] = ['valid', '', 'valid', null, 'valid'];
for (let item of continueData) {
  if (item === '' || item === null) {
    continue;  // 跳过空值
  }
  processItem(item);
}

function processItem(item: string): void {
  console.info(`处理: ${item}`);
}
// [End continue_statement]

// ===== nested_loop_continue =====
// [Start nested_loop_continue]
// 带标签的continue：跳过外层循环当前迭代
outerLoop: for (let i: number = 0; i < 5; i++) {
  for (let j: number = 0; j < 5; j++) {
    if (j === 2) {
      continue outerLoop;
    }
    console.info(`i=${i}, j=${j}`);
  }
}
// [End nested_loop_continue]

// ===== return_statement =====
// [Start return_statement]
// 基本返回
function add(a: number, b: number): number {
  return a + b;
}

let result: number = add(1, 2);

// 无返回值函数
function log(message: string): void {
  console.info(`${message}`);
  return;  // 可省略
}

// 条件返回
function classify(value: number): string {
  if (value > 0) {
    return 'positive';
  } else if (value < 0) {
    return 'negative';
  }
  return 'zero';
}

// 提前返回
function validate(input: string): boolean {
  if (input.length === 0) {
    return false;  // 提前返回
  }
  if (input.length > 100) {
    return false;
  }
  return true;
}

// 返回复杂类型
function getUser(id: number): User | null {
  if (id <= 0) {
    return null;
  }
  return { id: id, name: 'User' };
}

interface User {
  id: number;
  name: string;
}
// [End return_statement]

// ===== early_exit_pattern =====
// [Start early_exit_pattern]
// 参数验证后提前退出
function processData(data: string): void {
  if (data === null || data === undefined) {
    console.info('数据无效');
    return;  // 提前退出
  }
  
  // 正常处理
  console.info(`处理: ${data}`);
}

// 权限检查后提前退出
function accessResource(user: PatternUser): void {
  if (!user.hasPermission) {
    console.info('无权限');
    return;
  }
  
  // 有权限的处理
  loadResource();
}

function loadResource(): void {
  console.info('加载资源');
}

interface PatternUser {
  hasPermission: boolean;
}

// 错误处理后提前退出
function safeDivide(a: number, b: number): number | null {
  if (b === 0) {
    console.info('除数不能为零');
    return null;  // 提前退出，返回null
  }
  
  return a / b;
}

// 边界检查后提前退出
function getArrayElement(arr: number[], index: number): number | null {
  if (index < 0 || index >= arr.length) {
    return null;  // 提前退出
  }
  
  return arr[index];
}
// [End early_exit_pattern]

// ===== null_undefined_check =====
// [Start null_undefined_check]
// 处理可选参数
function greet(name: string | null): string {
  if (name === null) {
    return 'Hello, Guest';  // 提前退出
  }
  
  return `Hello, ${name}`;
}

// 处理可选链结果
function processConfig(config: Config | null): void {
  if (config === null) {
    console.info('配置不存在');
    return;
  }
  
  if (config.value === undefined) {
    console.info('配置值未定义');
    return;
  }
  
  console.info(`配置值: ${config.value}`);
}

interface Config {
  value: number | undefined;
}

// 多层空值检查
function deepProcess(data: Data | null): void {
  if (data === null) {
    return;
  }
  
  if (data.inner === null) {
    return;
  }
  
  if (data.inner.value === null) {
    return;
  }
  
  console.info(`${data.inner.value}`);
}

interface Data {
  inner: Inner | null;
}

interface Inner {
  value: string | null;
}
// [End null_undefined_check]

// ===== check_object_method_existence =====
// [Start check_object_method_existence]
// 检测全局对象
function checkEnvironment(): void {
  if (typeof console !== 'undefined') {
    console.info('console 可用');
  }
  
  if (typeof setTimeout !== 'undefined') {
    console.info('setTimeout 可用');
  }
}

class OptionalWorker {
  public methodName?: () => void;
}

// 检测方法存在
function safeCall(): void {
  let obj: OptionalWorker = new OptionalWorker();
  
  if (obj.methodName !== undefined) {
    obj.methodName();
  } else {
    console.info('方法不存在');
  }
}

// ArkTS中使用类型检查
interface Feature {
  newMethod?(): void;
}

function useFeature(feature: Feature): void {
  if (feature.newMethod !== undefined) {
    feature.newMethod();
  } else {
    console.info('使用旧方法');
    fallbackMethod();
  }
}

function fallbackMethod(): void {
  console.info('备用方法');
}
// [End check_object_method_existence]

// ===== version_feature_platform_check =====
// [Start version_feature_platform_check]
// 版本检查
function checkVersion(): void {
  const MIN_VERSION: number = 2;
  let currentVersion: number = getCurrentVersion();
  
  if (currentVersion < MIN_VERSION) {
    console.info('版本过低，使用兼容方案');
    useLegacyImplementation();
  } else {
    useNewImplementation();
  }
}

function getCurrentVersion(): number {
  return 3;
}

function useLegacyImplementation(): void {
  console.info('使用旧实现');
}

function useNewImplementation(): void {
  console.info('使用新实现');
}

// 功能开关
function processWithOptions(options: ProcessOptions): void {
  if (options.useNewFeature) {
    processNewWay();
  } else {
    processOldWay();
  }
}

interface ProcessOptions {
  useNewFeature: boolean;
}

function processNewWay(): void {
  console.info('新方式处理');
}

function processOldWay(): void {
  console.info('旧方式处理');
}

// 平台检测
function detectPlatform(): string {
  let platform: string = getPlatform();
  
  switch (platform) {
    case 'mobile':
      configureForMobile();
      break;
    case 'desktop':
      configureForDesktop();
      break;
    case 'web':
      configureForWeb();
      break;
    default:
      useDefaultConfig();
  }
  
  return platform;
}

function getPlatform(): string {
  return 'mobile';
}

function configureForMobile(): void {
  console.info('移动端配置');
}

function configureForDesktop(): void {
  console.info('桌面端配置');
}

function configureForWeb(): void {
  console.info('Web端配置');
}

function useDefaultConfig(): void {
  console.info('默认配置');
}
// [End version_feature_platform_check]

// ===== switch_vs_if_choice =====
// [Start switch_vs_if_choice]
// 少量离散值：使用switch
let choiceDay: number = 3;
switch (choiceDay) {
  case 1: case 2: case 3: case 4: case 5:
    console.info('工作日');
    break;
  case 6: case 7:
    console.info('周末');
    break;
}

// 范围或复杂条件：使用if
let choiceScore: number = 85;
if (choiceScore >= 90) {
  console.info('优秀');
} else if (choiceScore >= 60) {
  console.info('及格');
} else {
  console.info('不及格');
}
// [End switch_vs_if_choice]

// ===== loop_selection_guide =====
// [Start loop_selection_guide]
// 遍历元素：使用for...of
let guideArr: number[] = [1, 2, 3];
for (let value of guideArr) {
  console.info(value.toString());
}

// 需要索引：使用for
for (let i: number = 0; i < guideArr.length; i++) {
  console.info(`索引 ${i}: ${guideArr[i]}`);
}

// 条件控制：使用while
let guideCount: number = 0;
while (guideCount < 10) {
  guideCount++;
}

// 至少执行一次：使用do...while
let guideInput: string = '';
do {
  guideInput = getInput();
} while (guideInput.length === 0);
// [End loop_selection_guide]

// ===== early_exit_vs_nested =====
// [Start early_exit_vs_nested]
// 推荐：提前退出
function process(data: NestedData | null): number {
  if (data === null) {
    return 0;
  }
  
  if (!data.valid) {
    return -1;
  }
  
  return data.value;
}

// 反例：深层嵌套
function processNested(data: NestedData | null): number {
  if (data !== null) {
    if (data.valid) {
      return data.value;
    } else {
      return -1;
    }
  } else {
    return 0;
  }
}

interface NestedData {
  valid: boolean;
  value: number;
}
// [End early_exit_vs_nested]

// ===== clear_exit_condition =====
// [Start clear_exit_condition]
// 推荐：清晰的退出条件
for (let i: number = 0; i < 10; i++) {
  if (i === 5) {
    break;  // 找到目标后退出
  }
}

// 反例：复杂的跳转逻辑（即使使用大括号也难以理解）
for (let i: number = 0; i < 100; i++) {
  if (i % 3 === 0) {
    continue;
  }
  if (i % 5 === 0) {
    continue;
  }
  if (i === 42) {
    break;
  }
  // 复杂逻辑...
}
// [End clear_exit_condition]

// ===== flag_variable_nested_loop =====
// [Start flag_variable_nested_loop]
// 推荐：使用标志变量
let loopFound: boolean = false;
for (let i: number = 0; i < 10 && !loopFound; i++) {
  for (let j: number = 0; j < 10; j++) {
    if (checkCondition(i, j)) {
      loopFound = true;
      break;
    }
  }
}

function checkCondition(i: number, j: number): boolean {
  return i + j === 15;
}
// [End flag_variable_nested_loop]

// ===== switch_break_best_practice =====
// [Start switch_break_best_practice]
switch (value) {
  case 1:
    console.info('一');
    break;  // 必须有break
  case 2:
    console.info('二');
    break;
  default:
    console.info('默认');
    break;  // 建议也有break
}
// [End switch_break_best_practice]


// ===== switch_typeof_matching =====
// [Start switch_typeof_matching]
let stmValue: number | string | boolean = 'text';

switch (typeof stmValue) {
  case 'number':
    console.info(`数值: ${stmValue}`);
    break;
  case 'string':
    console.info(`字符串: ${stmValue}`);
    break;
  case 'boolean':
    console.info(`布尔值: ${stmValue}`);
    break;
  default:
    console.info('未知类型');
}
// [End switch_typeof_matching]

// ===== typeof_narrowing_if =====
// [Start typeof_narrowing_if]
let tniValue: number | string = 42;

if (typeof tniValue === 'number') {
  let num: number = tniValue;
  console.info(`数值: ${num * 2}`);
} else if (typeof tniValue === 'string') {
  let str: string = tniValue;
  console.info(`字符串长度: ${str.length}`);
}
// [End typeof_narrowing_if]

// ===== switch_enum_matching =====
// [Start switch_enum_matching]
enum ShapeKind {
  Circle,
  Rectangle,
  Triangle
}

interface ShapeInfo {
  kind: ShapeKind;
  radius: number;
  width: number;
  height: number;
  base: number;
}

let semShape: ShapeInfo = { kind: ShapeKind.Circle, radius: 5, width: 0, height: 0, base: 0 };

switch (semShape.kind) {
  case ShapeKind.Circle:
    console.info(`圆形面积: ${Math.PI * semShape.radius * semShape.radius}`);
    break;
  case ShapeKind.Rectangle:
    console.info(`矩形面积: ${semShape.width * semShape.height}`);
    break;
  case ShapeKind.Triangle:
    console.info(`三角形面积: ${0.5 * semShape.base * semShape.height}`);
    break;
}
// [End switch_enum_matching]
