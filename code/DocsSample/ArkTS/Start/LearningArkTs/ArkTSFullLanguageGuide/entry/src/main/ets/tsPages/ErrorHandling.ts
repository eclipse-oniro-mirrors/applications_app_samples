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

// [Start ts_throw_non_error]
// TypeScript允许抛出任意类型，ArkTS只能抛出Error
throw 'Something went wrong';
// [End ts_throw_non_error]

// [Start ts_basic_error_types]
// 编译期类型错误：number没有toUpperCase方法
let num: number = 10;
num.toUpperCase();

// 编译期名称错误：变量未声明
console.info(`${undefinedVariable}`);

// 运行期范围错误：由业务校验主动抛出
function readAt(values: number[], index: number): number {
  if (index < 0 || index >= values.length) {
    throw new RangeError('数组索引超出范围');
  }
  return values[index] ?? 0;
}

let readAtValues: number[] = [1, 2, 3];
try {
  readAt(readAtValues, 3);
} catch (error) {
  console.error(`读取失败: ${(error as Error).message}`);
}
// [End ts_basic_error_types]

// [Start ts_nested_try_catch]
function nestedErrorHandling(): void {
  try {
    console.info(`外层 try`);

    try {
      console.info(`内层 try`);
      throw new Error('内层错误');
    } catch (innerError) {
      console.info(`内层 catch: ${(innerError as Error).message}`);
      // 决定是否向上层抛出错误
      throw innerError; // 将错误传递到外层
    }

    console.info(`外层 try 继续`);
  } catch (outerError) {
    console.info(`外层 catch: ${(outerError as Error).message}`);
  }
}

nestedErrorHandling();
// 输出:
// 外层try
// 内层try
// 内层catch: 内层错误
// 外层try继续
// [End ts_nested_try_catch]

// [Start ts_throw_best_practices]
// TypeScript对照写法，ArkTS中不要这样写：
function badExample1(): void {
  throw '这是一个字符串错误';
}

function badExample2(): void {
  throw 404;
}

function badExample3(): void {
  throw { code: 1001, message: '自定义错误对象' };
}

// 正确做法：始终抛出Error实例
function goodExample(): void {
  throw new Error('这是一个标准错误');
}

try {
  goodExample();
} catch (error) {
  if (error instanceof Error) {
    console.error(`Error 对象: ${error.message}`);
  } else {
    console.error('未知类型错误');
  }
}
// [End ts_throw_best_practices]




// [Start ts_assertion_functions]
// TypeScript对照写法，ArkTS中用if检查替代
function assert(value: unknown): asserts value {
  if (value === undefined || value === null) {
    throw new Error('Value must be defined');
  }
}

function assertString(val: unknown): asserts val is string {
  if (typeof val !== 'string') {
    throw new Error('Expected string');
  }
}
// [End ts_assertion_functions]
