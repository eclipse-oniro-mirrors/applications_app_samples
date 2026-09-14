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

// [Start ts_no_destructuring_assignment]
// 不支持解构赋值
let [a, b] = [1, 2];

// 正确做法：单独赋值
let arr: number[] = [1, 2];
let aVal: number = arr[0];
let bVal: number = arr[1];
// [End ts_no_destructuring_assignment]

// [Start ts_no_destructuring_supported]
// 不支持
let point = { x: 1, y: 2 };
let arr: number[] = [1, 2];
let [a1, b1] = [1, 2];
let {x, y} = point;

// 正确：单独赋值
let a2: number = arr[0] ?? 0;
let b2: number = arr[1] ?? 0;
// [End ts_no_destructuring_supported]

// [Start ts_static_type_checking]
let num: number = 5;
num = 'text';  // 编译错误
// [End ts_static_type_checking]
