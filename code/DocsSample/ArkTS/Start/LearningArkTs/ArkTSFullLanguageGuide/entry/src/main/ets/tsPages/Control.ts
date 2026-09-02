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

// [Start ts_for_in_loop]
// TypeScript对照写法（ArkTS不支持for...in）
// for...in遍历对象返回属性键名
let finObj: Record<string, number> = { 'a': 1, 'b': 2, 'c': 3 };
for (let key in finObj) {
  console.info(`${key}: ${finObj[key]}`); // a: 1, b: 2, c: 3
}

// for...in遍历数组返回字符串索引（"0"而非0）
let finArr: number[] = [10, 20, 30];
for (let index in finArr) {
  console.info(`${index}`); // "0", "1", "2"（字符串索引，非数值）
}
// [End ts_for_in_loop]
