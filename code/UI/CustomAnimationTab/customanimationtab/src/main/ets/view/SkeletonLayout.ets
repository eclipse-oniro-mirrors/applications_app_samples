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
 * @file customanimationtab/src/main/ets/view/SkeletonLayout.ets
 * 文件职责：SkeletonLayout 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SkeletonLayout、actionArea、topicStyle、textArea。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * SkeletonLayout：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
@Reusable
export struct SkeletonLayout {
  isMine: boolean = false;

  /**
   * aboutToReuse：执行 aboutToReuse 相关逻辑。
   */
  aboutToReuse(params: Record<string, object>): void {
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：内边距、圆角、背景色、交叉轴对齐、主轴对齐、宽度
    Row() {
      // Column：垂直布局容器
      // 关键属性：布局权重、高度
      Column() {
        // Column：垂直布局容器
        // 关键属性：交叉轴对齐、布局权重
        Column({ space: 4 }) {
          // 标题
          textArea($r('app.float.custom_animation_tab_ske_card_title_height'))
          // 内容
          textArea($r('app.float.custom_animation_tab_ske_card_text_height'))
        }.id('skeleton_layout_column_3')
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        // 判断是否自己作品来适配不同骨架布局
        if (!this.isMine) {
          // Row：水平布局容器
          // 关键属性：内边距、高度、宽度、主轴对齐
          Row() {
            // 浏览量
            actionArea()
            // 点赞数
            actionArea()
            // 收藏量
            actionArea()
          }.id('skeleton_layout_row_4')
          .padding({ top: $r('app.float.custom_animation_tab_ske_md_padding_margin') })
          .height($r('app.float.custom_animation_tab_ske_row_height'))
          .width($r('app.string.custom_animation_tab_one_hundred_percent'))
          .justifyContent(FlexAlign.SpaceBetween)
        } else {
          // Row：水平布局容器
          // 关键属性：内边距、高度、宽度、主轴对齐
          Row({ space: 12 }) {
            // 摄影作品标签
            // Row：水平布局容器
            // 关键属性：宽度、topicStyle
            Row().id('skeleton_layout_row_6')
              .width($r('app.float.custom_animation_tab_ske_lg_topic_width'))
              .topicStyle()
            // 自然风光标签
            // Row：水平布局容器
            // 关键属性：宽度、topicStyle
            Row().id('skeleton_layout_row_7')
              .width($r('app.float.custom_animation_tab_ske_lg_topic_width'))
              .topicStyle()
          }.id('skeleton_layout_row_5')
          .padding({ top: $r('app.float.custom_animation_tab_ske_md_padding_margin') })
          .height($r('app.float.custom_animation_tab_ske_row_height'))
          .width($r('app.string.custom_animation_tab_one_hundred_percent'))
          .justifyContent(FlexAlign.Start)
        }
      }.id('skeleton_layout_column_2')
      .layoutWeight(1)
      .height($r('app.string.custom_animation_tab_one_hundred_percent'))

      // Row：水平布局容器
      // 关键属性：背景色、圆角、宽度、高度、外边距
      Row().id('skeleton_layout_row_8')
        .backgroundColor($r('app.color.custom_animation_tab_skeleton_color_light'))
        .borderRadius($r('app.float.custom_animation_tab_ske_small_border_radius'))
        .width($r('app.float.custom_animation_tab_ske_image_width'))
        .height($r('app.float.custom_animation_tab_ske_image_height'))
        .margin({ left: $r('app.float.custom_animation_tab_ske_md_padding_margin') })
    }.id('skeleton_layout_row_1')
    .padding($r('app.float.custom_animation_tab_ske_md_padding_margin'))
    .borderRadius($r('app.float.custom_animation_tab_ske_large_border_radius'))
    .backgroundColor(Color.White)
    .alignItems(VerticalAlign.Top)
    .justifyContent(FlexAlign.SpaceAround)
    .width($r('app.string.custom_animation_tab_one_hundred_percent'))
    .height($r('app.float.custom_animation_tab_ske_card_height'))
  }
}

/**
 * actionArea：函数定义，承载本文件对应的逻辑与数据。
 */
@Builder
function actionArea() {
  // Row：水平布局容器
  // 关键属性：宽度、高度、背景色
  /**
   * Row：执行 Row 相关逻辑。
   */
  Row().id('skeleton_layout_row_9')
    .width($r('app.float.custom_animation_tab_ske_action_area_width'))
    .height($r('app.float.custom_animation_tab_ske_action_area_height'))
    .backgroundColor($r('app.color.custom_animation_tab_skeleton_color_medium'))
}

/**
 * topicStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Styles
function topicStyle() {
  .height($r('app.float.custom_animation_tab_ske_topic_height'))
  .backgroundColor($r('app.color.custom_animation_tab_skeleton_color_medium'))
  .borderRadius($r('app.float.custom_animation_tab_ske_xs_border_radius'))
}

/**
 * textArea：函数定义，承载本文件对应的逻辑与数据。
 */
@Builder
function textArea(height: Length) {
  // Row：水平布局容器
  // 关键属性：宽度、高度、背景色
  /**
   * Row：执行 Row 相关逻辑。
   */
  Row().id('skeleton_layout_row_10')
    .width($r('app.string.custom_animation_tab_one_hundred_percent'))
    .height(height)
    .backgroundColor($r('app.color.custom_animation_tab_skeleton_color_medium'))
}