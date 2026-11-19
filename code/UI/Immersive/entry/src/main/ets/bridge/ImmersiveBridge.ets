/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/bridge/ImmersiveBridge.ets
 * 文件职责：ImmersiveBridge 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：（无顶层声明）。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */


/**
 * Bridge for ohosTest logic suites.
 * Pure re-export of HAR-internal, non-exported classes via deep path.
 * No business logic here; only classes without $r() resource references.
 */
export { Constants } from 'immersive/src/main/ets/common/Constants';

export { ProductDataModel } from 'immersive/src/main/ets/model/GoodsModel';

export { CommentDataSource } from 'immersive/src/main/ets/model/CommentDataSource';
