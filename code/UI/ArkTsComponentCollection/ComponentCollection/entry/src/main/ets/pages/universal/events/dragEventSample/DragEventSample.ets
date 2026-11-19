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
 * @file entry/src/main/ets/pages/universal/events/dragEventSample/DragEventSample.ets
 * 文件职责：DragEventSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：DragEventSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { FormComponentDrag } from './component/FormComponentDrag';
import { GridItemDrag } from './component/GridItemDrag';
import { HyperlinkDrag } from './component/HyperlinkDrag';
import { ImageDrag } from './component/ImageDrag';
import { ListItemDrag } from './component/ListItemDrag';
import  { MultiSelectDrag } from './component/MultiSelectDrag';
import { TextDrag } from './component/TextDrag';
import { VideoDrag } from './component/VideoDrag';
import Logger from '../../../../util/Logger';
import router from '@ohos.router';

const TAG = '[DragEventSample]';

@Extend(Row) function rowStyle() {
  .width('100%')
  .padding(16)
  .borderRadius(24)
  .backgroundColor(Color.White)
}

@Extend(Column) function columnStyle() {
  .width('100%')
  .padding(16)
  .borderRadius(24)
  .backgroundColor(Color.White)
}

/**
 * DragEventSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct DragEventSample {
  // 是否可接收
  // @State isAreaValid：组件内部状态
  @State isAreaValid: boolean = false
  // @State backgroundBlur：组件内部状态
  @State backgroundBlur: boolean = false
  // @State hideLeftIcon：组件内部状态
  @State hideLeftIcon: boolean = true
  // @State hideRightIcon：组件内部状态
  @State hideRightIcon: boolean = true
  // @State showOkBadge：组件内部状态
  @State showOkBadge: boolean = false
  // @State showCancelBadge：组件内部状态
  @State showCancelBadge: boolean = false
  // @State leftIconWidth：组件内部状态
  @State leftIconWidth: number = 64
  // @State rightIconWidth：组件内部状态
  @State rightIconWidth: number = 64

  // 自定义拖拽过程中显示的内容
  @Builder pixelMapBuilder() {
    // Stack：层叠布局容器
    Stack({ alignContent: Alignment.TopEnd }) {
      // Image：图片
      // 关键属性：宽度、aspectRatio、外边距
      Image($r('app.media.icon')).id('drag_event_sample_image_2')
        // width：设置宽度
        .width(64)
        .aspectRatio(1)
        // margin：设置外边距
        .margin(16)
      // 分支：if (this.isAreaValid) {
      if (this.isAreaValid) {
        // Image：图片
        // 关键属性：宽度、aspectRatio、fillColor
        Image($r('app.media.ic_ok')).id('drag_event_sample_image_3')
          // width：设置宽度
          .width(32)
          .aspectRatio(1)
          .fillColor(Color.Green)
      // 结束当前组件块
      } else {
        // Image：图片
        // 关键属性：宽度、aspectRatio、fillColor
        Image($r('app.media.ic_cancel')).id('drag_event_sample_image_4')
          // width：设置宽度
          .width(32)
          .aspectRatio(1)
          .fillColor(Color.Red)
      // 结束当前组件块
      }
    }.id('drag_event_sample_stack_1')
  }

  @Builder menuBuilder() {
    // Column：垂直布局容器
    // 关键属性：交叉轴对齐、主轴对齐、内边距、圆角
    Column() {
      // Text：文本
      // 关键属性：字号
      Text($r('app.string.drag_drop_action_tips')).id('drag_event_sample_text_6')
        // fontSize：设置字号
        .fontSize(16)
    }.id('drag_event_sample_column_5')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .padding(16)
    .borderRadius(12)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色
    Column() {
      // Column：垂直布局容器
      Column() {
        // Row：水平布局容器
        // 关键属性：高度、宽度
        Row() {
          // Image：图片
          // 关键属性：宽度、高度、外边距、objectFit、点击事件回调、back
          // 交互：可点击交互
          Image($r('app.media.ic_back')).id('drag_backBtn')
            // width：设置宽度
            .width(20)
            // height：设置高度
            .height(20)
            // margin：设置外边距
            .margin({ left: 26 })
            // objectFit：设置图片填充模式
            .objectFit(ImageFit.Contain)
            // onClick：绑定点击事件回调
            .onClick(() => {
              // 处理：router.back()
              router.back()
            // 结束当前组件块
            })
            .id('backBtn')
          // Text：文本
          // 关键属性：字号、布局权重、外边距、align
          Text($r('app.string.drag_drop_event')).id('drag_event_sample_text_10')
            // fontSize：设置字号
            .fontSize(20)
            // layoutWeight：设置布局权重
            .layoutWeight(1)
            // margin：设置外边距
            .margin({ left: 16 })
            // align：设置对齐方式
            .align(Alignment.Start)
          // Blank：占位空白
          Blank().id('drag_event_sample_blank_11')
        // 结束当前组件块
        }.id('drag_event_sample_row_9')
        // height：设置高度
        .height(56)
        // width：设置宽度
        .width('100%')
      // 结束当前组件块
      }.id('drag_event_sample_column_8')

      // Scroll：滚动容器
      // 关键属性：内边距
      Scroll() {
        // Column：垂直布局容器
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.drag_drop_action_tips') })
            .id('drag_event_sample_introduction_title_14')
          // Stack：层叠布局容器
          Stack() {
            // Row：水平布局容器
            // 关键属性：rowStyle
            Row() {
              // 左侧绿色可接收区域
              // Row：水平布局容器
              // 关键属性：宽度、高度、背景色、主轴对齐、onDragEnter
              Row() {
                // Stack：层叠布局容器
                Stack({ alignContent: Alignment.TopEnd }) {
                  // Image：图片
                  // 关键属性：宽度、aspectRatio、外边距、可见性、动画配置
                  Image($r('app.media.icon')).id('drag_event_sample_image_18')
                    .width(this.leftIconWidth)
                    .aspectRatio(1)
                    .margin(this.leftIconWidth / 4)
                    .visibility(this.hideLeftIcon ? Visibility.None : Visibility.Visible)
                    .animation({
                      onFinish: () => {
                        this.showOkBadge = false
                      }
                    })
                  if (this.showOkBadge) {
                    // Image：图片
                    // 关键属性：宽度、aspectRatio、fillColor、动画配置
                    Image($r('app.media.ic_ok')).id('drag_event_sample_image_19')
                      .width(this.leftIconWidth / 2)
                      .aspectRatio(1)
                      .fillColor(Color.Green)
                      .animation({})
                  }
                }.id('drag_event_sample_stack_17')
              }
              .id('leftArea')
              .width('45%')
              .height(200)
              .backgroundColor($r('app.color.background_green'))
              .justifyContent(FlexAlign.Center)
              .onDragEnter(() => {
                this.isAreaValid = true
                Logger.info(TAG, 'leftArea onDragEnter, isAreaValid: ' + this.isAreaValid)
              })
              .onDragMove(() => {
                this.isAreaValid = true
                Logger.info(TAG, 'leftArea onDragMove, isAreaValid: ' + this.isAreaValid)
              })
              .onDragLeave(() => {
                this.isAreaValid = false
                Logger.info(TAG, 'leftArea onDragLeave')
              })
              .onDrop((event: DragEvent) => {
                Logger.info(TAG, 'leftArea onDrop')
                event.useCustomDropAnimation = false
                this.hideLeftIcon = false
                this.showOkBadge = true
                this.leftIconWidth = 48
              })

              // Blank：占位空白
              Blank().id('drag_event_sample_blank_20')

              // 右侧红色不可接收区域
              // Row：水平布局容器
              // 关键属性：宽度、高度、背景色、主轴对齐、onDragEnter
              Row() {
                // Stack：层叠布局容器
                Stack({ alignContent: Alignment.TopEnd }) {
                  // Image：图片
                  // 关键属性：宽度、aspectRatio、外边距、可见性、动画配置
                  Image($r('app.media.icon')).id('drag_event_sample_image_22')
                    .width(this.rightIconWidth)
                    .aspectRatio(1)
                    .margin(this.rightIconWidth / 4)
                    .visibility(this.hideRightIcon ? Visibility.None : Visibility.Visible)
                    .animation({
                      onFinish: () => {
                        this.hideRightIcon = true
                        this.showCancelBadge = false
                        this.rightIconWidth = 64
                      }
                    })
                  if (this.showCancelBadge) {
                    // Image：图片
                    // 关键属性：宽度、aspectRatio、fillColor、动画配置
                    Image($r('app.media.ic_cancel')).id('drag_event_sample_image_23')
                      .width(this.rightIconWidth / 2)
                      .aspectRatio(1)
                      .fillColor('#FF0000')
                      .animation({})
                  }
                }.id('drag_event_sample_stack_21')
              }
              .id('rightArea')
              .width('45%')
              .height(200)
              .backgroundColor($r('app.color.background_pink'))
              .justifyContent(FlexAlign.Center)
              .onDragEnter(() => {
                this.isAreaValid = false
                Logger.info(TAG, 'rightArea onDragEnter, isAreaValid: ' + this.isAreaValid)
              })
              .onDragMove(() => {
                this.isAreaValid = false
                Logger.info(TAG, 'rightArea onDragMove, isAreaValid: ' + this.isAreaValid)
              })
              .onDragLeave(() => {
                this.isAreaValid = true
                Logger.info(TAG, 'rightArea onDragLeave')
              })
              .onDrop((event: DragEvent) => {
                Logger.info(TAG, 'rightArea onDrop')
                event.useCustomDropAnimation = false
                this.hideRightIcon = false
                this.showCancelBadge = true
                this.rightIconWidth = 72
              })
            }.id('drag_event_sample_row_16')
            .rowStyle()

            // 模糊层
            // Row：水平布局容器
            // 关键属性：宽度、内边距、圆角、背景模糊、点击事件回调
            // 交互：可点击交互
            Row() {
              // Blank：占位空白
              Blank().id('drag_event_sample_blank_25')

              // 中间拖拽图标
              // Column：垂直布局容器
              // 关键属性：宽度、高度、主轴对齐
              Column() {
                if (this.hideLeftIcon) {
                  // Row：水平布局容器
                  // 关键属性：bindContextMenu、menuBuilder、onDragStart、info
                  Row() {
                    // Image：图片
                    // 关键属性：宽度、aspectRatio、draggable
                    Image($r('app.media.icon'))
                      .id('icon')
                      .width(48)
                      .aspectRatio(1)
                      .draggable(false)
                  }.id('drag_event_sample_row_27')
                  .bindContextMenu(this.menuBuilder(), ResponseType.LongPress)
                  .onDragStart(() => {
                    Logger.info(TAG, 'onDragStart')
                    this.backgroundBlur = false
                    // 拖拽时关闭菜单
                    ContextMenu.close()
                    return this.pixelMapBuilder
                  })
                  .onTouch((event: TouchEvent) => {
                    Logger.info(TAG, 'onTouch')
                    if (event.type === TouchType.Down) {
                      this.backgroundBlur = true
                    }
                  })
                }
              }.id('drag_event_sample_column_26')
              .width('10%')
              .height(200)
              .justifyContent(FlexAlign.Center)

              // Blank：占位空白
              Blank().id('drag_event_sample_blank_28')
            }.id('drag_event_sample_row_24')
            .width('100%')
            .padding(16)
            .borderRadius(24)
            .backgroundBlurStyle(this.backgroundBlur ? BlurStyle.BACKGROUND_THIN : 0)
            .onClick(() => {
              this.backgroundBlur = false
            })
          }.id('drag_event_sample_stack_15')

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.component_drag_and_drop') })
            .id('drag_event_sample_introduction_title_29')
          // Column：垂直布局容器
          // 关键属性：columnStyle、外边距
          Column() {
            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.griditem') }).id('drag_event_sample_introduction_title_30')
            // GridItemDrag：GridItemDrag 自定义组件
            GridItemDrag().id('drag_event_sample_grid_item_drag_31')

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.multiselect') })
              .id('drag_event_sample_introduction_title_32')
            // MultiSelectDrag：MultiSelectDrag 自定义组件
            MultiSelectDrag().id('drag_event_sample_multi_select_drag_33')

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.listitem') }).id('drag_event_sample_introduction_title_34')
            // ListItemDrag：ListItemDrag 自定义组件
            ListItemDrag().id('drag_event_sample_list_item_drag_35')

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.hyperlink') })
              .id('drag_event_sample_introduction_title_36')
            // HyperlinkDrag：HyperlinkDrag 自定义组件
            HyperlinkDrag().id('drag_event_sample_hyperlink_drag_37')

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.text') }).id('drag_event_sample_introduction_title_38')
            // TextDrag：TextDrag 自定义组件
            TextDrag().id('drag_event_sample_text_drag_39')

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.image') }).id('drag_event_sample_introduction_title_40')
            // ImageDrag：ImageDrag 自定义组件
            ImageDrag().id('drag_event_sample_image_drag_41')

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.video') }).id('drag_event_sample_introduction_title_42')
            // VideoDrag：VideoDrag 自定义组件
            VideoDrag().id('drag_event_sample_video_drag_43')

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.formcomponent') })
              .id('drag_event_sample_introduction_title_44')
            // FormComponentDrag：FormComponentDrag 自定义组件
            FormComponentDrag().id('drag_event_sample_form_component_drag_45')
          }
          .id('column')
          .columnStyle()
          .margin({ bottom: 80 })
        }.id('drag_event_sample_column_13')
      }.id('drag_event_sample_scroll_12')
      .padding({ left: 12, right: 12 })
    }.id('drag_event_sample_column_7')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}