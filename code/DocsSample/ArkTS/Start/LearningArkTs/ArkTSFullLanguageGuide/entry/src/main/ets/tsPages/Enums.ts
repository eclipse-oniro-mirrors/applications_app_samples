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

// [Start ts_string_and_numeric_enum]
// 字符串枚举
enum Status {
  Pending = 'pending',
  Active = 'active',
  Completed = 'completed',
  Failed = 'failed'
}

let status: Status = Status.Pending;
console.info(`${status}`);  // 'pending'

// 数值枚举（显式值）
enum Priority {
  Low = 1,
  Medium = 2,
  High = 3,
  Critical = 10
}

let priority: Priority = Priority.High;
console.info(`${priority.toString()}`);  // 3

// ArkTS不使用混合枚举：同一个枚举中的成员应保持同一原始值类型
enum Mixed {
  No = 0,
  Yes = 'YES'  // 编译错误：成员初始值类型不一致
}
// [End ts_string_and_numeric_enum]

// [Start ts_enum_member_types]
// 枚举成员是唯一类型
enum Direction {
  Up,
  Down,
  Left,
  Right
}

let up: Direction.Up = Direction.Up;  // Direction.Up类型
let down: Direction.Down = Direction.Down;

// 不同成员不能互换
up = down;  // 编译错误：类型不匹配

// 枚举值作为联合类型
type HorizontalDirection = Direction.Left | Direction.Right;
type VerticalDirection = Direction.Up | Direction.Down;

function moveHorizontal(dir: HorizontalDirection): void {
  console.info(`水平移动: ${dir}`);
}

moveHorizontal(Direction.Left);
moveHorizontal(Direction.Up);  // 编译错误：类型不匹配
// [End ts_enum_member_types]

// [Start ts_enum_as_type_usage]
// 枚举作为参数
function setTheme(theme: Theme): void {
  switch (theme) {
    case Theme.Light:
      console.info(`浅色主题`);
      break;
    case Theme.Dark:
      console.info(`深色主题`);
      break;
    case Theme.Auto:
      console.info(`自动主题`);
      break;
  }
}

enum Theme {
  Light,
  Dark,
  Auto
}

setTheme(Theme.Dark);
setTheme('dark');  // 编译错误：必须是Theme类型

// 枚举作为返回值
function getDefaultTheme(): Theme {
  return Theme.Auto;
}

let defaultTheme: Theme = getDefaultTheme();

// 枚举作为对象属性类型
interface UserSettings {
  theme: Theme;
  language: Language;
  fontSize: FontSize;
}

enum Language {
  English,
  Chinese,
  Japanese
}

enum FontSize {
  Small,
  Medium,
  Large
}

let settings: UserSettings = {
  theme: Theme.Light,
  language: Language.Chinese,
  fontSize: FontSize.Medium
};

// 枚举作为数组元素类型
let themes: Theme[] = [Theme.Light, Theme.Dark, Theme.Auto];
let languages: Language[] = [Language.English, Language.Chinese];
// [End ts_enum_as_type_usage]


// [Start ts_enum_member_type_error]
// TypeScript对照写法，演示枚举成员类型不兼容
enum TsShapeKind {
  Circle,
  Square
}

interface TsUeCircle {
  kind: TsShapeKind.Circle;
  radius: number;
}

let tsUeBad: TsUeCircle = { kind: TsShapeKind.Square, radius: 10 };
// 编译错误：Type 'TsShapeKind.Square' is not assignable to type 'TsShapeKind.Circle'
// [End ts_enum_member_type_error]

// [Start ts_enum_keyof_typeof]
// TypeScript对照写法，ArkTS中手动维护键数组
enum TsLogLevel {
  ERROR,
  WARN,
  INFO,
  DEBUG
}
type TsLogLevelStrings = keyof typeof TsLogLevel;
// 'ERROR' | 'WARN' | 'INFO' | 'DEBUG'
// [End ts_enum_keyof_typeof]

// [Start ts_object_vs_enum]
// TypeScript对照写法
const TsODirection = {
  Up: 0,
  Down: 1,
  Left: 2,
  Right: 3
} as const;

type TsDirection = typeof TsODirection[keyof typeof TsODirection];
// [End ts_object_vs_enum]

// ===== ts_heterogeneous_enum =====
// [Start ts_heterogeneous_enum]
// TypeScript异构枚举，ArkTS不支持
enum MixedResult {
  No = 0,
  Yes = 'YES'
}

console.info(`${MixedResult.No}`);   // 0
console.info(`${MixedResult.Yes}`);  // YES
// [End ts_heterogeneous_enum]

// ===== ts_computed_enum_member =====
// [Start ts_computed_enum_member]
// TypeScript计算成员写法
enum ComputedExample {
  Length = 'hello'.length, // 计算成员，值为5
  Next,                    // 编译错误：计算成员后不能有无初始化值成员
}
// [End ts_computed_enum_member]
