/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/navigation/navigationSample/NavigationRouter.ets
 * 文件职责：NavigationRouter 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Index。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { RouterModule } from 'RouterModule/src/main/ets/utils/RouterModule';

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  // @State hapARouter：组件内部状态
  @State hapARouter: NavPathStack = new NavPathStack();

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    import("@ohos/harA");
    import("@ohos/harB");
    if (!this.hapARouter) {
      this.hapARouter = new NavPathStack();
    }
    RouterModule.registRouter('HapA_Router', this.hapARouter);
  }

  /**
   * routerMap：执行 routerMap 相关逻辑。
   */
  @Builder
  routerMap(routerName: string, param: Object) {
    RouterModule.getBuilder(routerName).builder(param);
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // Navigation：导航容器
      // 关键属性：navDestination、高度、hideTitleBar
      Navigation(this.hapARouter) {
        // TitleBar：TitleBar 自定义组件
        TitleBar({ title: $r('app.string.navigation_router_title') }).id('navigation_router_title_bar_3')
        // Column：垂直布局容器
        // 关键属性：高度、主轴对齐
        Column() {
          // Button：按钮
          // 关键属性：点击事件回调、push
          // 交互：可点击交互
          Button() {
            // Text：文本
            // 关键属性：字号、字体颜色
            Text($r('app.string.navigation_router_har1')).id('navigation_router_text_5')
              .fontSize(16)
              .fontColor(Color.White)
          }
          .onClick(() => {
            RouterModule.push('HapA_Router', 'HarA_Builder');
          })
          .height(40)
          .width('88%')
          .backgroundColor('#007DFF')
          .borderRadius(20)
          .id('gotohar1')
        }.id('navigation_router_column_4')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }.id('navigation_router_navigation_2')
      .navDestination(this.routerMap)
      .height('100%')
      .hideTitleBar(true)
    }.id('navigation_router_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}