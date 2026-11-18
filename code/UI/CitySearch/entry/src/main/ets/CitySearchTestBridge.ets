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

/**
 * @file entry/src/main/ets/CitySearchTestBridge.ets
 * 文件职责：CitySearchTestBridge 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：（无顶层声明）。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */


/**
 * 纯 re-export 桥接文件：供 ohosTest 源码集以 entry 模块内相对路径
 * 导入 citysearch HAR 的被测对象（ohosTest 源码集禁止跨模块相对路径 import）。
 * 本文件不包含任何业务逻辑。
 */
export { CitySearch, AlphabetListView } from 'citysearch';

export { AlphabetListItemType, AlphabetListItemView, HotListItemView, CITY_DATA, HOT_CITY } from 'citysearch';

export { CommonConstants, logger } from 'citysearch';
