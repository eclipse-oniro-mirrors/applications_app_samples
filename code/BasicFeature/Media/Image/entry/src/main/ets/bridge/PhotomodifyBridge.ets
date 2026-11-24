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
 * @file entry/src/main/ets/bridge/PhotomodifyBridge.ets
 * 文件职责：PhotomodifyBridge 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：（无顶层声明）。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */


/**
 * ohosTest 专用桥接文件：仅做纯 re-export，无任何业务逻辑。
 * 用途：useNormalizedOHMUrl=true 下 ohosTest 源码集禁止跨模块相对路径 import，
 * 通过 {pkgName}/src/main/ets/... 深路径将 photomodify HAR 内部纯逻辑类型
 * 转出口给 entry/src/ohosTest 测试代码（保持 photomodify Index.ets 原导出面不变）。
 * 注意：含 $r() 资源字面量的模块（AdjustModels/MaterialModels）不在桥接范围，
 * 其数据契约由 UI 层 PictureOptions 渲染断言覆盖。
 */
export {
  transformCoordinates, offsetOrigin, Point
} from '@ohos/photomodify/src/main/ets/components/util/CoordinatesUtil';

export { getContainSize, Size } from '@ohos/photomodify/src/main/ets/components/util/ImageUtil';

export {
  Tasks, CropTasks, ScaleTasks, ColorSpaceTasks, TaskData
} from '@ohos/photomodify/src/main/ets/components/model/AdjustData';

export { MaterialData, FontColorData, ImageData } from '@ohos/photomodify/src/main/ets/components/model/MaterialData';

export { default as ComputeFeature, NodeType } from '@ohos/photomodify/src/main/ets/components/feature/ComputeFeature';

export { default as PixelMapQueue } from '@ohos/photomodify/src/main/ets/components/feature/PixelMapQueue';
