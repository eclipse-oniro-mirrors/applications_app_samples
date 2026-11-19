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

import { NavImmersive } from 'immersive';

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
    // Column：垂直布局容器
    // 关键属性：高度、宽度
    // Column：垂直布局容器
    // 关键属性：高度、宽度
    Column() {
      /**
       * 功能描述：开发应用沉浸式效果主要指通过调整状态栏、应用界面和导航条的显示效果来减少状态栏导航条等系统界面的突兀感，从而使用户获得最佳的UI
       * 体验。本案例分别针对Navigation、列表滑动、Web页、底部弹框等场景实现了沉浸式适配。
       * 参数介绍：无
       * README：https://gitee.com/harmonyos-cases/cases/blob/master/CommonAppDevelopment/feature/immersive/README.md
       */
      // NavImmersive：NavImmersive 自定义组件
      NavImmersive().id('index_nav_immersive_2')

    }.id('index_column_1')
    .height('100%')
    .width('100%')
  }
}