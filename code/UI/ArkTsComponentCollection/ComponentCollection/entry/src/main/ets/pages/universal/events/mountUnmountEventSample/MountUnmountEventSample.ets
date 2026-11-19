/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/universal/events/mountUnmountEventSample/MountUnmountEventSample.ets
 * 文件职责：MountUnmountEventSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MountUnmountEventSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import ShowToast from '../../../../util/ShowToast';

@Extend(Button) function commonButtonStyle() {
  .margin(8)
  .fontSize(16)
  .layoutWeight(1)
}

@Extend(Row) function rowStyle() {
  .width('100%')
  .borderRadius(24)
  .margin({ top: 12 })
  .justifyContent(FlexAlign.SpaceAround)
}

/**
 * MountUnmountEventSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct MountUnmountEventSample {
  // @State isShow：组件内部状态
  @State isShow: boolean = false;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.general_mount') }).id('mount_unmount_event_sample_title_bar_2')
      // Row：水平布局容器
      // 关键属性：主轴对齐、圆角、背景色、高度、外边距、宽度
      Row() {
        if (this.isShow) {
          // Image：图片
          // 关键属性：高度、宽度、挂载出现回调、shortToast
          // 交互：生命周期回调
          Image($r('app.media.img_love')).id('mount_unmount_event_sample_image_4')
            .height(100)
            .width(100)
            .onAppear(() => {
              ShowToast.shortToast($r('app.string.general_mount_toast'));
            })
            .onDisAppear(() => {
              ShowToast.shortToast($r('app.string.general_unmount_toast'));
            })
        }
      }.id('mount_unmount_event_sample_row_3')
      .justifyContent(FlexAlign.Center)
      .borderRadius(24)
      .backgroundColor(Color.White)
      .height(150)
      .margin({ left: 12, right: 12 })
      .width('100%')

      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row({ space: 18 }) {
            // Button：按钮
            // 关键属性：commonButtonStyle、外边距、点击事件回调
            // 交互：可点击交互
            Button($r('app.string.general_mount_toast'))
              .commonButtonStyle()
              .margin({ left: 24 })
              .onClick(() => {
                this.isShow = true;
              })
              .id('mount')
            // Button：按钮
            // 关键属性：commonButtonStyle、外边距、点击事件回调
            // 交互：可点击交互
            Button($r('app.string.general_unmount_toast'))
              .commonButtonStyle()
              .margin({ right: 24 })
              .onClick(() => {
                this.isShow = false;
              })
              .id('unmount')
          }.id('mount_unmount_event_sample_row_7')
          .rowStyle()
        }.id('mount_unmount_event_sample_column_6')
        .constraintSize({ minHeight: '100%' })
      }.id('mount_unmount_event_sample_scroll_5')
    }.id('mount_unmount_event_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
