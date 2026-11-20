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
 * @file customanimationtab/src/main/ets/view/DyEffectPage.ets
 * 文件职责：DyEffectPage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：dyEffectBuilder、DyEffectPage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { SkeletonLayout } from './SkeletonLayout';
import LazyDataSource from './LazyDataSource';

/**
 * dyEffectBuilder：函数定义，承载本文件对应的逻辑与数据。
 */
@Builder
export function dyEffectBuilder() {
  // DyEffectPage：DyEffectPage 自定义组件
  /**
   * DyEffectPage：执行 DyEffectPage 相关逻辑。
   */
  DyEffectPage().id('dy_effect_page_dy_effect_page_1');
}

/**
 * DyEffectPage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
struct DyEffectPage {
  data: LazyDataSource<string> = new LazyDataSource<string>();

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.data.pushData(`${i}`);
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    Column() {
      // List：列表容器
      // 关键属性：缓存数量、宽度、高度
      List() {
        LazyForEach(this.data, (data: string) => {
          // ListItem：列表项
          ListItem() {
            // SkeletonLayout：SkeletonLayout 自定义组件
            SkeletonLayout({isMine: false}).id('dy_effect_page_skeleton_layout_4')
          }.id('dy_effect_page_list_item_3')
        })
      }.id('dy_effect_page_list_2')
      .cachedCount(1)
      .width($r('app.string.custom_animation_tab_one_hundred_percent'))
      .height($r('app.string.custom_animation_tab_one_hundred_percent'))
    }
    .width($r('app.string.custom_animation_tab_one_hundred_percent'))
    .height($r('app.string.custom_animation_tab_one_hundred_percent'))
    .id('dyEffectTabContent')
  }
}