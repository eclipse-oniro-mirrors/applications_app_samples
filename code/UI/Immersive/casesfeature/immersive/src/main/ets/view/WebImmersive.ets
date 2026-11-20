/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file casesfeature/immersive/src/main/ets/view/WebImmersive.ets
 * 文件职责：WebImmersive 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：WebImmersive。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { webview } from '@kit.ArkWeb';

/**
 * Web沉浸式适配
 * 1、设置Web绘制延伸至状态栏和导航条
 * 2、设置网页元素避让导航条
 */
/**
 * WebImmersive：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct WebImmersive {
  controller: webview.WebviewController = new webview.WebviewController();

  // @Consume navPathStack：消费祖先组件提供的状态
  @Consume navPathStack: NavPathStack;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    Column() {
      // Web：网页组件
      // 关键属性：宽度、布局权重、expandSafeArea
      // Web：网页组件
      // 关键属性：宽度、布局权重、expandSafeArea
      Web({ src: $rawfile('web_immersive.html'), controller: this.controller })
        .width('100%')
        .layoutWeight(1)// 设置Web绘制延伸到状态栏和导航条
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
        .id('immersiveWeb')
    }.id('web_immersive_column_1')
    .width('100%')
    .height('100%')
  }
}