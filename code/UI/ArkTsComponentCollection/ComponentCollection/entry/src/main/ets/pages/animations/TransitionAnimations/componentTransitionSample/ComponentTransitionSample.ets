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
 * @file ComponentTransitionSample.ets
 * 文件职责：ComponentTransitionSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ComponentTransitionSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

AppStorage.set('state',true);

/**
 * ComponentTransitionSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ComponentTransitionSample {
  // @StorageLink flag：与 AppStorage 双向绑定
  @StorageLink('state') flag: boolean = true;

  // @State show：组件内部状态
  @State show: Resource = $r('app.string.component_transition_hide');

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.component_transition') }).id('component_transition_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // Row：水平布局容器
          // 关键属性：主轴对齐、圆角、背景色、高度、宽度、外边距
          Row() {
            if (this.flag) {
              // Image的显示和消失配置为不同的过渡效果
              // 出现时从指定的x方向scale为0、y方向scale为1的状态变为默认的x、y方向scale都为1的状态
              // 消失时从默认的旋转角为0变为绕z轴顺时针旋转180°的状态
              // Image：图片
              // 关键属性：宽度、高度、外边距、转场动画
              Image($r('app.media.img_love')).id('component_transition_sample_image_6')
                .width(200)
                .height(200)
                .margin(50)
                .transition({ type: TransitionType.Insert, scale: { x: 0, y: 1.0 }, opacity: 0.7 })
                .transition({ type: TransitionType.Delete, rotate: { z: 1, angle: 180 }, opacity: 0.5 })
            }
          }.id('component_transition_sample_row_5')
          .justifyContent(FlexAlign.Center)
          .borderRadius(24)
          .backgroundColor(Color.White)
          .height(300)
          .width('100%')
          .margin({ left: 12, right: 12 })

          // Row：水平布局容器
          // 关键属性：主轴对齐、宽度
          Row() {
            // Button：按钮
            // 关键属性：宽度、外边距、点击事件回调
            // 交互：可点击交互
            Button(this.show).id('component_transition_sample_button_8')
              .width('90%')
              .margin({ top: 16 })
              .onClick(() => {
                // 点击Button控制Image的显示和消失
                if (this.flag) {
                  this.show = $r('app.string.component_transition_show');
                } else {
                  this.show = $r('app.string.component_transition_hide');
                }
                // 使用TransitionOptions指定transition时，必须配合animateTo才能产生动画
                animateTo({ duration: 1000 }, () => {
                  this.flag = !this.flag;
                })
              })
          }.id('component_transition_sample_row_7')
          .justifyContent(FlexAlign.Center)
          .width('100%')
        }.id('component_transition_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('component_transition_sample_scroll_3')
    }.id('component_transition_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}