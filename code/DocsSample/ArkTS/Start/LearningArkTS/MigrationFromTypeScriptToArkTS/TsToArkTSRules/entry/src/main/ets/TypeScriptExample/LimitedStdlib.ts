/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// [Start limited_stdlib_ts]
interface Target {
  a: number;
  b: number;
}

interface Source {
  b: number;
  c: number;
}

const target: Target = { a: 1, b: 2 };
const source: Source = { b: 4, c: 5 };
// 使用Object.assign合并对象
const returnedTarget = Object.assign(target, source);
// [End limited_stdlib_ts]
