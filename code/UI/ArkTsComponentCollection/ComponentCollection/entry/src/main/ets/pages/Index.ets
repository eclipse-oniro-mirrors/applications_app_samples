/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { COLLECTION_CATEGORIES } from '../data/CollectionCategory'
import { FirstLevelCategory } from '../model/CategoricalDataType'
import { TabContentNavigation } from '../common/TabContentNavigation'

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  // @State tabsIndex：组件内部状态
  @State tabsIndex: number = 0

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Tabs：页签容器
    // 关键属性：barHeight、barWidth、是否纵向、背景色、内容变更回调
    // 交互：输入/提交回调
    Tabs({ barPosition: BarPosition.End }) {
      ForEach(COLLECTION_CATEGORIES, (item: FirstLevelCategory, index: number) => {
        // TabContent：页签内容
        // 关键属性：tabBar、TabBarBuilder
        TabContent() {
          // TabContentNavigation：TabContentNavigation 自定义组件
          TabContentNavigation({ categories: item.childNodes }).id('index_tab_content_navigation_3')
        }.id('index_tab_content_2')
        .tabBar(this.TabBarBuilder(index, item.selectedImage, item.unselectedImage, item.tabBarName))
      })
    }.id('index_tabs_1')
    .barHeight(56)
    .barWidth('100%')
    .vertical(false)
    .backgroundColor($r('app.color.background_shallow_grey'))
    .onChange((index: number) => {
      this.tabsIndex = index
    })
  }

  @Builder TabBarBuilder(index: number, selectedImage: Resource, unselectedImage: Resource, tabBarName: Resource) {
    // Column：垂直布局容器
    // 关键属性：宽度、内边距、交叉轴对齐
    Column() {
      // Image：图片
      // 关键属性：宽度、高度、外边距
      Image(this.tabsIndex === index ? selectedImage : unselectedImage).id('index_image_4')
        .width(24)
        .height(24)
        .margin({ bottom: 4 })

      // Text：文本
      // 关键属性：字号、字体、字体颜色
      Text(tabBarName).id('index_text_5')
        .fontSize(10)
        .fontFamily('HarmonyHeiTi-Medium')
        .fontColor(this.tabsIndex === index ? $r('app.color.tab_bar_select') : $r('app.color.tab_bar_unselect'))
    }
    .width('100%')
    .padding({ top: 6, bottom: 6 })
    .alignItems(HorizontalAlign.Center)
    .id(`tabBar${index}`)
  }
}