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
 * @file entry/src/main/ets/pages/universal/events/customEventSample/CustomScrollingEvent.ets
 * 文件职责：CustomScrollingEvent 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CustomScrollingEvent。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';
import { getStringData } from '../../../../data/ResourceDataHandle';
import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import ShowToast from '../../../../util/ShowToast';
import Logger from '../../../../util/Logger';

const TAG: string = 'CustomScrollingEvent';

/**
 * CustomScrollingEvent：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct CustomScrollingEvent {
  private scrollerForScroll: Scroller = new Scroller();
  private scrollerForList: Scroller = new Scroller();

  // @State files：组件内部状态
  @State files: string[] = [];

  // @State listPosition：组件内部状态
  @State listPosition: number = 0; // 0代表滚动到List顶部，1代表中间值，2代表滚动到List底部。

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    // 分支：for (let i = 1; i <= 30; i++) {
    for (let i = 1; i <= 30; i++) {
      // 处理：let file: string = "file" + i.toString();
      let file: string = "file" + i.toString();
      // 处理：this.files.push(file);
      this.files.push(file);
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // 标题
      // Column：垂直布局容器
      // 关键属性：高度、宽度、内边距
      Column() {
        // Row：水平布局容器
        // 关键属性：高度、宽度
        Row() {
          // Image：图片
          // 关键属性：宽度、高度、外边距、objectFit、点击事件回调、back
          // 交互：可点击交互
          Image($r('app.media.ic_back')).id('customScroll_backBtn')
            // width：设置宽度
            .width(24)
            // height：设置高度
            .height(24)
            // margin：设置外边距
            .margin({ left: 12 })
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
          // 关键属性：字号、布局权重、字重、外边距、align
          Text($r('app.string.custom_scrolling_event')).id('custom_scrolling_event_text_4')
            // fontSize：设置字号
            .fontSize(20)
            // layoutWeight：设置布局权重
            .layoutWeight(1)
            // fontWeight：设置字重
            .fontWeight(700)
            // margin：设置外边距
            .margin({ left: 16 })
            // align：设置对齐方式
            .align(Alignment.Start)
          // Blank：占位空白
          Blank().id('custom_scrolling_event_blank_5')
        // 结束当前组件块
        }.id('custom_scrolling_event_row_3')
        // height：设置高度
        .height(56)
        // width：设置宽度
        .width('100%')
      // 结束当前组件块
      }.id('custom_scrolling_event_column_2')
      // height：设置高度
      .height(56)
      // width：设置宽度
      .width('100%')
      // padding：设置内边距
      .padding({ left: 12, right: 12 })

      // Scroll：滚动容器
      // 关键属性：边缘效果、friction、滚动条、宽度、高度
      Scroll(this.scrollerForScroll) {
        // Column：垂直布局容器
        // 关键属性：外边距、onChildTouchTest、info
        Column() {
          // Column：垂直布局容器
          // 关键属性：高度、宽度、边框
          Column() {
            // Text：文本
            // 关键属性：字号、字重、字体、文本对齐、字体颜色、透明度
            Text($r('app.string.custom_scrolling_area'))
              .fontSize(36)
              .fontWeight(400)
              .fontFamily('HarmonyHeiTi')
              .textAlign(TextAlign.Start)
              .fontColor('#182431')
              .opacity(0.15)
              .margin({ top: 142 })
              .id('scrollText')
            // Image：图片
            // 关键属性：宽度、高度、外边距、objectFit
            Image($r('app.media.button'))
              .width(40)
              .height(40)
              .margin({ top: 78, bottom: 40 })
              .id('scrollBtn')
              .objectFit(ImageFit.Contain)
          }
          .height(332)
          .width('100%')
          .border({
            width: 1,
            color: '#55182431',
            radius: 24,
            style: BorderStyle.Solid
          })
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 16 })
          .backgroundColor('#F2F3F4')
          .id('ScrollArea')

          // 目录列表
          // List：列表容器
          // 关键属性：宽度、高度、列表方向、圆角、边缘效果、nestedScroll
          List({ space: 12, scroller: this.scrollerForList }) {
            ForEach(this.files, (file: string, index: number) => {
              // ListItem：列表项
              // 关键属性：宽度
              ListItem() {
                // Row：水平布局容器
                // 关键属性：宽度、高度、圆角、背景色、交叉轴对齐、内边距
                Row() {
                  // Text：文本
                  // 关键属性：字号、字重、字体、文本对齐
                  Text(file).id('custom_scrolling_event_text_8')
                    .fontSize(16)
                    .fontWeight(500)
                    .fontFamily('HarmonyHeiTi-Medium')
                    .textAlign(TextAlign.Start)
                }.id('custom_scrolling_event_row_7')
                .width('100%')
                .height(56)
                .borderRadius(24)
                .backgroundColor(0xFFFFFF)
                .alignItems(VerticalAlign.Center)
                .padding({ left: 12, right: 12 })
              }
              .id("ListItem" + index)
              .width('100%')
            })
          }
          .width('100%')
          .height('80%')
          .listDirection(Axis.Vertical) // 排列方向
          .borderRadius(24)
          .edgeEffect(EdgeEffect.None) // 边缘效果设置为Spring
          .nestedScroll({
            scrollForward: NestedScrollMode.PARENT_FIRST,
            scrollBackward: NestedScrollMode.SELF_FIRST
          })
          .onReachStart(() => {
            this.listPosition = 0
          })
          .onReachEnd(() => {
            this.listPosition = 2
          })
          .onScrollFrameBegin((offset: number) => {
            if ((this.listPosition == 0 && offset <= 0) || (this.listPosition == 2 && offset >= 0)) {
              this.scrollerForScroll.scrollBy(0, offset);
              return { offsetRemain: 0 };
            }
            this.listPosition = 1;
            return { offsetRemain: offset };
          })
          .id('fileList')
        }.id('custom_scrolling_event_column_6')
        .margin({ left: 12, right: 12 })
        .onChildTouchTest((touchinfo) => {
          Logger.info(TAG, `touchinfo array len: ${touchinfo.length}`);
          for (let info of touchinfo) {
            Logger.info(TAG, `touchinfo info.id: ${info.id}`);
            Logger.info(TAG, `touchinfo windowX: ${info.windowX}, windowY: ${info.windowY}`);
            Logger.info(TAG, `touchinfo parentX: ${info.parentX}, parentY: ${info.parentY}`);
            Logger.info(TAG, `touchinfo x: ${info.x}, y: ${info.y}`);
            Logger.info(TAG, `touchinfo rect.x: ${info.rect.x}, rect.y: ${info.rect.y}, rect.width: ${info.rect.width}, rect.height: ${info.rect.height}`);
            let compontWidth = info.rect.x + info.rect.width;
            let compontHeight = info.rect.y + info.rect.height;
            if (info.id == 'ScrollArea' &&
              info.x > 0 &&
              info.parentX < compontWidth &&
              info.parentX > info.rect.x &&
              info.y > 0 &&
              info.parentY < compontHeight &&
              info.parentY > info.rect.y) {
              Logger.info(TAG, `touchinfo touch point at scope of component: ${info.id}`);
              return { id: 'fileList', strategy: TouchTestStrategy.FORWARD };
            }
          }
          return { strategy: TouchTestStrategy.DEFAULT };
        })
      }
      .edgeEffect(EdgeEffect.Spring)
      .friction(0.6)
      .scrollBar(BarState.Off)
      .width('100%')
      .height(700)
      .id('GlobalScroll')
    }.id('custom_scrolling_event_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}