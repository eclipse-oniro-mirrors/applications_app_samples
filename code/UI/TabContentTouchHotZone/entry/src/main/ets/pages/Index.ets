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
 * @file entry/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Index。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TabContentOverFlowComponent } from 'tabcontentoverflow';

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // RelativeContainer：相对布局容器
    // 关键属性：高度、宽度
    RelativeContainer() {
      /**
       * 功能描述：本示例介绍使用Flex组件实现图片在不同个数情况下的布局效果(默认布局和自定义布局)。
       * 参数介绍：无
       */
      // TabContentOverFlowComponent：TabContentOverFlowComponent 自定义组件
      TabContentOverFlowComponent().id('index_tab_content_over_flow_component_1')
    }
    .id('indexRoot')
    .height('100%')
    .width('100%')
  }
}