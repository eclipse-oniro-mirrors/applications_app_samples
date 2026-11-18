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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/sideBarTransitionSample/SideBarTransitionSample.ets
 * 文件职责：SideBarTransitionSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SideBarTransitionSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { ChangePanel } from './ChangePanel'
import { TitleBar } from '../../../../common/TitleBar'

@Extend(Column) function columnStyle() {
  .padding(16)
  .borderRadius(24)
  .backgroundColor(Color.White)
  .margin({ top: 20, left: 20, right: 20, bottom: 20 })
}

/**
 * SideBarTransitionSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct SideBarTransitionSample {
  // @State arr：组件内部状态
  @State arr: number[] = [1, 2, 3]
  // @State current：组件内部状态
  @State current: number = 1
  // @State mShowSideBar：组件内部状态
  @State mShowSideBar: boolean = false
  // @State mSideBarContainerType：组件内部状态
  @State mSideBarContainerType: SideBarContainerType = SideBarContainerType.Embed

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：尺寸、主轴对齐、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.side_bar_effects_title') }).id('side_bar_transition_sample_title_bar_2')
      // SideBarContainer：侧边栏容器
      // 关键属性：showControlButton、showSideBar、sideBarWidth、minSideBarWidth、maxSideBarWidth
      SideBarContainer(this.mSideBarContainerType) {
        // Column：垂直布局容器
        // 关键属性：可见性、宽度、转场动画、透明度、主轴对齐、背景色
        Column() {
          ForEach(this.arr, (item: number, index: number) => {
            // Column：垂直布局容器
            // 关键属性：点击事件回调
            // 交互：可点击交互
            Column({ space: 5 }) {
              // Image：图片
              // 关键属性：宽度、高度
              Image($r('app.media.icon')).id('side_bar_transition_sample_image_6').width(64).height(64)
              // Text：文本
              // 关键属性：字号、字体颜色
              Text(item + '').id('side_bar_transition_sample_text_7')
                .fontSize(25)
                .fontColor(this.current === item ? $r('app.color.tab_bar_select') : $r('app.color.tab_bar_unselect'))
            }.id('side_bar_transition_sample_column_5')
            .onClick(() => {
              this.current = item
            })
          }, (item: number) => item.toString())
        }.id('side_bar_transition_sample_column_4')
        .visibility(this.mShowSideBar ? Visibility.Visible : Visibility.Hidden)
        .width('100%')
        .transition(TransitionEffect.opacity(0))
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor($r('app.color.contentArea_background_color'))

        // Column：垂直布局容器
        Column() {
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Button：按钮
            // 关键属性：点击事件回调
            // 交互：可点击交互
            Button(this.mShowSideBar ? $r('app.string.hide_side_bar') : $r('app.string.show_side_bar'))
              .onClick(() => {
                animateTo({ duration: 2000 }, () => {
                  this.mShowSideBar = !this.mShowSideBar
                })
              })
              .id('hide_or_show_sideBar')
              .margin({ bottom: 5 })
            // ChangePanel：ChangePanel 自定义组件
            ChangePanel({
              mSideBarContainerType: $mSideBarContainerType
            }).id('side_bar_transition_sample_change_panel_10')
          }.id('side_bar_transition_sample_column_9')
          .columnStyle()
        }.id('side_bar_transition_sample_column_8')
      }.id('side_bar_transition_sample_side_bar_container_3')
      .showControlButton(false)
      .showSideBar(this.mShowSideBar)
      .sideBarWidth(150)
      .minSideBarWidth(50)
      .maxSideBarWidth(300)
    }.id('side_bar_transition_sample_column_1')
    .size({ width: '100%', height: '100%' })
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
