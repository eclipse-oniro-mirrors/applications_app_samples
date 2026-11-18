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
