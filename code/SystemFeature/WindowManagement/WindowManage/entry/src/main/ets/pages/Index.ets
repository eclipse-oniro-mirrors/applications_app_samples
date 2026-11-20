/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
 * 主要声明：Index、standardButton。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  // @State isChangeWindow：组件内部状态
  @State isChangeWindow: boolean = false

  /**
   * onPageShow：页面进入前台时回调。
   */
  onPageShow() {
    this.isChangeWindow = false
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、主轴对齐、交叉轴对齐、背景色
    Column() {
      // Button：按钮
      // 关键属性：standardButton、外边距、点击事件回调、pushUrl
      // 交互：可点击交互
      Button($r("app.string.pages_text"))
        .standardButton(20, '80%')
        .margin({ top: 80 })
        .onClick(() => {
          router.pushUrl({
            url: "pages/Video"
          })
          this.isChangeWindow = true
        })
        .id('videoPageButton')
      // Button：按钮
      // 关键属性：standardButton、点击事件回调、pushUrl
      // 交互：可点击交互
      Button($r("app.string.get_properties_of_system_bar_page"))
        .standardButton(20, '80%')
        .onClick(() => {
          router.pushUrl({
            url: "system_bar/pages/GetPropertiesOfSystemBar"
          })
        })
        .id('systemBarPageButton')
      // Button：按钮
      // 关键属性：standardButton、点击事件回调、pushUrl
      // 交互：可点击交互
      Button($r("app.string.set_touchable_area_of_window_page"))
        .standardButton(20, '80%')
        .onClick(() => {
          router.pushUrl({
            url: "touchable/pages/SetTouchableAreas"
          })
        })
        .id('touchablePageButton')
    }.id('index_column_1')
    .width('100%')
    .height('100%')
    .justifyContent(this.isChangeWindow ? FlexAlign.Start : FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor($r('app.color.light_gray'))
  }
}

/**
 * standardButton：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Button)
function standardButton(fontSize: number, value: Length) {
  .fontSize(fontSize)
  .fontColor($r('app.color.dark_gray'))
  .backgroundColor($r('app.color.white'))
  .padding(15)
  .margin({ top: 20 })
  .width(value)
}