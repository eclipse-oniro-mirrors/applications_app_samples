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
 * @file entry/src/main/ets/pages/components/navigation/navigationSample/BindSheetSafeArea.ets
 * 文件职责：BindSheetSafeArea 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：BindSheetSafeArea。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * BindSheetSafeArea：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct BindSheetSafeArea {
  // @State isShow：组件内部状态
  @State isShow: boolean = true;

  @Builder myBuilder() {
    // Column：垂直布局容器
    // 关键属性：宽度
    Column() {
      // TextInput：单行输入框
      // 关键属性：绝对定位、输入类型、高度
      TextInput({ placeholder: 'Hint' }).id('bind_sheet_safe_area_text_input_2')
        .position({ x: 0, y: 200 })
        .type(InputType.Password)
        .height(40)
    }.id('bind_sheet_safe_area_column_1')
    .width('87%')
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：主轴对齐、宽度、高度
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.navigation_bindsheet_title') }).id('bind_sheet_safe_area_title_bar_4')
      // Button：按钮
      // 关键属性：点击事件回调
      // 交互：可点击交互
      Button("show bindSheet").id('bind_sheet_safe_area_button_5')
        .onClick(() => {
          this.isShow = true;
        })
        .fontSize(20)
        .margin(10)
        .visibility(Visibility.Hidden)
        .bindSheet($$this.isShow, this.myBuilder(), {
          detents: [SheetSize.MEDIUM],
          backgroundColor: Color.White,
          blurStyle: BlurStyle.Thick,
          showClose: true,
          title: { title: 'Title' },
          preferType: SheetType.CENTER,
          shouldDismiss: ((sheetDismiss: SheetDismiss) => {
            sheetDismiss.dismiss();
          })
        })
    }.id('bind_sheet_safe_area_column_3')
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}
