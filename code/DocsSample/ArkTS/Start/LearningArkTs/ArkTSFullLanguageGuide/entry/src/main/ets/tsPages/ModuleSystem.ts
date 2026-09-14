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

// [Start ts_type_import_export]
// TypeScript支持import type和export type，ArkTS按工具链支持情况使用
import type { User } from '../common/User';
export type { User };
// [End ts_type_import_export]

// [Start ts_avoid_commonjs]
// TypeScript/CommonJS对照写法，ArkTS不使用
const userModule = require('../common/User');
module.exports = { userModule };
// [End ts_avoid_commonjs]

// [Start ts_avoid_namespace]
// TypeScript对照写法，ArkTS普通业务代码不使用
namespace Validation {
  export function isName(value: string): boolean {
    return value.length > 0;
  }
}
// [End ts_avoid_namespace]

// [Start ts_path_alias_import]
// TypeScript/工程配置对照写法
import { describe } from '@ohos/hypium';
// [End ts_path_alias_import]

// [Start ts_require_syntax]
// TypeScript支持CommonJS require语法，ArkTS使用ES模块import
const Service = require('../common/Service');
Service.createProduct('Widget');
// [End ts_require_syntax]

// [Start ts_namespace_not_module]
// TypeScript namespace对照写法
namespace UserModule {
  export class UserService {}
}
// [End ts_namespace_not_module]

// ===== ts_export_equals_import_equals =====
// [Start ts_export_equals_import_equals]
// TypeScript/CommonJS对照写法，ArkTS不支持
class TsCalculator {
  add(a: number, b: number): number {
    return a + b;
  }
}

export = TsCalculator;
// 导入方（另一文件）：
// import Calculator = require('calculator');
// let calc = new Calculator();
// console.info(calc.add(1, 2)); // 3
// [End ts_export_equals_import_equals]

// ===== ts_triple_slash_directives =====
// [Start ts_triple_slash_directives]
// TypeScript声明文件写法，ArkTS不支持
/// <reference path="myModule.d.ts" />
/// <reference types="node" />
/// <reference lib="es2015" />

// 上述指令在.d.ts文件中声明文件间依赖关系
// ArkTS中模块依赖通过import/export建立
// [End ts_triple_slash_directives]

// ===== ts_namespace_alias =====
// [Start ts_namespace_alias]
// TypeScript对照写法，ArkTS不支持
namespace App {
  export namespace Config {
    export const version: string = '1.0';
  }
}

import ver = App.Config.version;
console.info(`${ver}`); // 1.0
// [End ts_namespace_alias]
