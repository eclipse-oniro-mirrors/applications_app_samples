/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/navigation/navRouterSample/NavRouterSample.ets
 * 文件职责：NavRouterSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：NavRouterSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import { getStringData } from '../../../../data/ResourceDataHandle'

/**
 * NavRouterSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct NavRouterSample {
  private arr: number[] = [1, 2, 3];

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.navRouter_title') }).id('nav_router_sample_title_bar_2')
      // Navigation：导航容器
      // 关键属性：mode
      Navigation() {

        // List：列表容器
        // 关键属性：宽度、外边距
        List({ space: 12 }) {
          ForEach(this.arr, (item: number) => {
            // ListItem：列表项
            // 关键属性：function toString() { [native code] }
            ListItem() {
              // NavRouter：NavRouter 自定义组件
              NavRouter() {
                // Text：文本
                // 关键属性：宽度、高度、背景色、圆角、字号、字重
                Text(getStringData($r('app.string.nav_router')) + item).id('nav_router_sample_text_6')
                  .width("100%")
                  .height(72)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(24)
                  .fontSize(16)
                  .fontWeight(500)
                  .textAlign(TextAlign.Center)
                // NavDestination：导航目的地
                // 关键属性：title
                NavDestination() {
                  // Text：文本
                  Text("NavDestinationContent" + item).id('nav_router_sample_text_8')
                }.id('nav_router_sample_nav_destination_7')
                .title("NavDestinationTitle" + item)
              }.id('nav_router_sample_nav_router_5')
            }
            .id('Navigation' + item)
          }, (item: number) => item.toString())
        }.id('nav_router_sample_list_4')
        .width("90%")
        .margin({ top: 12 })
      }.id('nav_router_sample_navigation_3')
      .mode(NavigationMode.Stack)
    }.id('nav_router_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}