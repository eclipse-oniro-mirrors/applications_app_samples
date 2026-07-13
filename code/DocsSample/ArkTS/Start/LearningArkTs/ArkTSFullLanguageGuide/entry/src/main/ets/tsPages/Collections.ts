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

// [Start ts_mutable_and_readonly_collections]
// 可变集合
let mutableArray: number[] = [1, 2, 3];
mutableArray.push(4);  // 可以添加

let mutableSet: Set<number> = new Set([1, 2]);
mutableSet.add(3);     // 可以添加

let mutableMap: Map<string, number> = new Map();
mutableMap.set('key', 10);  // 可以添加

// 只读集合（使用ReadonlyArray）
let readonlyArray: ReadonlyArray<number> = [1, 2, 3];
readonlyArray.push(4);  // 编译错误：不可修改
// [End ts_mutable_and_readonly_collections]

// [Start ts_readonly_tuple]
// TypeScript中的只读元组
let readonlyTuple: readonly [number, string] = [1, 'hello'];
readonlyTuple[0] = 2;  // 编译错误

// ArkTS中使用ReadonlyArray模拟
let readonlyPair: ReadonlyArray<number> = [1, 2];
readonlyPair[0] = 3;  // 编译错误
// [End ts_readonly_tuple]

// [Start ts_readonly_array_usage]
let readonlyArr: ReadonlyArray<number> = [1, 2, 3];

// 不可修改
readonlyArr.push(4);      // 编译错误
readonlyArr[0] = 10;      // 编译错误
readonlyArr.pop();        // 编译错误

// 可以读取
let first: number = readonlyArr[0];  // 1
let length: number = readonlyArr.length;  // 3

// 可以遍历
for (let value of readonlyArr) {
  console.info(`${value}`);
}

// 创建只读数组
let mutable: number[] = [1, 2, 3];
let readonly: ReadonlyArray<number> = mutable;  // 转为只读

// 类型别名
type ReadOnlyNumbers = ReadonlyArray<number>;
let nums: ReadOnlyNumbers = [1, 2, 3];
// [End ts_readonly_array_usage]

// [Start ts_destructuring_alternatives]
// 数组解构
let [a, b] = [1, 2];

// 正确做法：单独赋值
let arr: number[] = [1, 2];
let aVal: number = arr[0];
let bVal: number = arr[1];

// Map解构
let map: Map<string, number> = new Map([['key', 10]]);
let [mapKey, mapValue] = map.entries().next().value;

// 正确做法：单独赋值
let entry: [string, number] | undefined = Array.from(map.entries())[0];
if (entry !== undefined) {
  let entryKey: string = entry[0];
  let entryValue: number = entry[1];
}

// Set解构
let [setFirst, setSecond] = new Set([1, 2]);

// 正确做法：单独赋值
let set: Set<number> = new Set([1, 2]);
let values: number[] = Array.from(set);
let firstVal: number = values[0];
let secondVal: number = values[1];
// [End ts_destructuring_alternatives]

// [Start ts_map_safe_access]
let scores: Map<string, number> = new Map();
scores.set('Alice', 95);

// 反例：Map.get可能返回undefined
let aliceScore: number = scores.get('Alice');

// 推荐：先判断再使用
let aliceScoreSafe: number | undefined = scores.get('Alice');
if (aliceScoreSafe !== undefined) {
  console.info(`${aliceScoreSafe}`);
}
// [End ts_map_safe_access]

// [Start ts_map_entry_iteration]
let userScores: Map<string, number> = new Map([['Alice', 95], ['Bob', 88]]);

// TypeScript对照写法，ArkTS不使用解构：
for (let [name, score] of userScores) {
  console.info(`${name}: ${score}`);
}

// 推荐：显式读取entry
for (let entry of userScores.entries()) {
  let name: string = entry[0];
  let score: number = entry[1];
  console.info(`${name}: ${score}`);
}
// [End ts_map_entry_iteration]
