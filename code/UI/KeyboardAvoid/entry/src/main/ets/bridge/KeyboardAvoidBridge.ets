/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

/**
 * @file entry/src/main/ets/bridge/KeyboardAvoidBridge.ets
 * 文件职责：KeyboardAvoidBridge 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：（无顶层声明）。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * ohosTest 专用桥接文件：仅做纯 re-export，无任何业务逻辑。
 * 用途：useNormalizedOHMUrl=true 下 ohosTest 源码集禁止跨模块相对路径 import，
 * 通过 {pkgName}/src/main/ets/... 深路径将 keyboardavoid HAR 内部类型
 * 转出口给 entry/src/ohosTest 测试代码（保持 HAR Index.ets 原导出面不变）。
 */
export { KeyboardDataSource } from 'keyboardavoid/src/main/ets/basicDataResource/BasicDataSource';
