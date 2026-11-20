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
 * @file entry/src/main/ets/pages/components/informationPresentationAndDynamicEffects/scrollToSample/ScrollToSample.ets
 * 文件职责：ScrollToSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ScrollToSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

@Extend(Text) function fancyText() {
  .width('90%')
  .height(80)
  .backgroundColor($r('app.color.scroll_item_color'))
  .borderRadius(15)
  .fontSize(16)
  .textAlign(TextAlign.Center)
  .margin({ top: 10 })
}

@Extend(Text) function leftTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontWeight(FontWeight.Medium)
  .fontSize(20)
  .height(22)
  .letterSpacing('40%')
  .alignSelf(ItemAlign.Start)
  .margin({ left: 24, top: 12 })
}

@Extend(Text) function gridText() {
  .fontSize(16)
  .backgroundColor($r('app.color.scroll_grid_item_color'))
  .height(80)
  .textAlign(TextAlign.Center)
}

@Extend(Column) function itemColumn() {
  .height('40%')
  .backgroundColor($r('app.color.white'))
  .alignItems(HorizontalAlign.Start)
}

@Extend(Button) function sampleButton() {
  .height(40)
  .margin(12)
  .fontColor(Color.White)
  .fontSize(15)
}

/**
 * ScrollToSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ScrollToSample {
  private scroller: Scroller = new Scroller();
  private mScroller: Scroller = new Scroller();
  private listScroller: Scroller = new Scroller();
  private gridScroller: Scroller = new Scroller();
  private waterFlowScroller: Scroller = new Scroller();
  private scrollArr: Array<number> = new Array();

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    // 分支：for (let i = 0; i < 24; i++) {
    for (let i = 0; i < 24; i++) {
      // 处理：this.scrollArr.push(i)
      this.scrollArr.push(i)
    }
  }

  @Builder itemFoot() {
    // Column：垂直布局容器
    Column() {
      // Text：文本
      // 关键属性：字号、背景色、宽度、高度、align、外边距
      Text(`Footer`).id('scroll_to_sample_text_2')
        // fontSize：设置字号
        .fontSize(10)
        // backgroundColor：设置背景色
        .backgroundColor(Color.Red)
        // width：设置宽度
        .width(50)
        // height：设置高度
        .height(50)
        // align：设置对齐方式
        .align(Alignment.Center)
        // margin：设置外边距
        .margin({ top: 6 })
    }.id('scroll_to_sample_column_1')
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、内边距、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.scroll_To_effect') }).id('scroll_to_sample_title_bar_4');
      // Scroll：滚动容器
      // 关键属性：内边距、高度、背景色、scrollable
      Scroll(this.scroller) {
        // Column：垂直布局容器
        // 关键属性：背景色、宽度
        Column({ space: 10 }) {
          // Column：垂直布局容器
          // 关键属性：itemColumn、宽度、背景色
          Column() {
            // Text：文本
            // 关键属性：leftTitleStyle
            Text($r('app.string.scroller')).id('scroll_to_sample_text_8')
              .leftTitleStyle();
            // Button：按钮
            // 关键属性：sampleButton、自身对齐、点击事件回调、currentOffset
            // 交互：可点击交互
            Button($r('app.string.scroll_To_effect')).id('scrollTo_effectBtn1')
              .sampleButton()
              // alignSelf：设置自身对齐
              .alignSelf(ItemAlign.Center)
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 分支：if (this.mScroller.currentOffset().yOffset === 0) {
                if (this.mScroller.currentOffset().yOffset === 0) {
                  // 处理：this.mScroller.scrollTo({ xOffset: 0, yOffset: t
                  this.mScroller.scrollTo({ xOffset: 0, yOffset: this.mScroller.currentOffset().yOffset + 300,
                    animation: { duration: 800, curve: Curve.Linear }
                  // 结束当前组件块
                  },);
                // 结束当前组件块
                } else {
                  // 处理：this.mScroller.scrollTo({ xOffset: 0, yOffset: 0
                  this.mScroller.scrollTo({ xOffset: 0, yOffset: 0,
                    animation: { duration: 800, curve: Curve.Linear }
                  // 结束当前组件块
                  },);
                // 结束当前组件块
                }
              // 结束当前组件块
              }).id('scroll_to_effect_scroller');
            // Scroll：滚动容器
            // 关键属性：自身对齐、高度、宽度、圆角、背景色
            Scroll(this.mScroller) {
              // Column：垂直布局容器
              // 关键属性：内边距、宽度、自身对齐、背景色
              Column() {
                ForEach(this.scrollArr, (item: number) => {
                  // Text：文本
                  // 关键属性：fancyText、function toString() { [native code] }
                  Text(item.toString()).id('scroll_to_sample_text_11')
                    .fancyText();
                // 结束当前组件块
                }, (item: number) => item.toString());
              // 结束当前组件块
              }.id('scroll_to_sample_column_10')
              // padding：设置内边距
              .padding({ top: 6, bottom: 12 })
              // width：设置宽度
              .width('100%')
              // alignSelf：设置自身对齐
              .alignSelf(ItemAlign.Center)
              // backgroundColor：设置背景色
              .backgroundColor(Color.White);
            // 结束当前组件块
            }.id('scroll_to_sample_scroll_9')
            // alignSelf：设置自身对齐
            .alignSelf(ItemAlign.Center)
            // height：设置高度
            .height('70%')
            // width：设置宽度
            .width('92%')
            // borderRadius：设置圆角
            .borderRadius(24)
            // backgroundColor：设置背景色
            .backgroundColor(Color.White);

          // 结束当前组件块
          }.id('scroll_to_sample_column_7')
          .itemColumn()
          // width：设置宽度
          .width('100%')
          // backgroundColor：设置背景色
          .backgroundColor($r('app.color.background_shallow_grey'));

          // Column：垂直布局容器
          // 关键属性：itemColumn、宽度、背景色
          Column() {
            // Text：文本
            // 关键属性：leftTitleStyle
            Text($r('app.string.list')).id('scroll_to_sample_text_13')
              .leftTitleStyle();
            // Button：按钮
            // 关键属性：sampleButton、自身对齐、点击事件回调、currentOffset
            // 交互：可点击交互
            Button($r('app.string.scroll_To_effect')).id('scrollTo_effectBtn2')
              .sampleButton()
              // alignSelf：设置自身对齐
              .alignSelf(ItemAlign.Center)
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 分支：if (this.listScroller.currentOffset().yOffset === 0) {
                if (this.listScroller.currentOffset().yOffset === 0) {
                  // 处理：this.listScroller.scrollTo({ xOffset: 0, yOffset
                  this.listScroller.scrollTo({ xOffset: 0, yOffset: this.listScroller.currentOffset().yOffset + 300,
                    animation: { duration: 800, curve: Curve.Linear }
                  // 结束当前组件块
                  },);
                // 结束当前组件块
                } else {
                  this.listScroller.scrollTo({ xOffset: 0, yOffset: 0,
                    animation: { duration: 800, curve: Curve.Linear }
                  },);
                }
              }).id('scroll_to_effect_list');

            // List：列表容器
            // 关键属性：自身对齐、高度、宽度、圆角、背景色
            List({ scroller: this.listScroller }) {
              ForEach(this.scrollArr, (item: number) => {
                // ListItem：列表项
                // 关键属性：宽度、自身对齐、背景色、function toString() { [native code] }
                ListItem() {
                  // Text：文本
                  // 关键属性：fancyText
                  Text(item.toString()).id('scroll_to_sample_text_16')
                    .fancyText();
                }.id('scroll_to_sample_list_item_15')
                .width('100%')
                .alignSelf(ItemAlign.Center)
                .backgroundColor(Color.White);
              }, (item: number) => item.toString());

            }.id('scroll_to_sample_list_14')
            .alignSelf(ItemAlign.Center)
            .height('70%')
            .width('92%')
            .borderRadius(24)
            .backgroundColor(Color.White);

          }.id('scroll_to_sample_column_12')
          .itemColumn()
          .width('100%')
          .backgroundColor($r('app.color.background_shallow_grey'));

          // Column：垂直布局容器
          // 关键属性：itemColumn、宽度、背景色
          Column() {
            // Text：文本
            // 关键属性：leftTitleStyle
            Text($r('app.string.grid')).id('scroll_to_sample_text_18')
              .leftTitleStyle();
            // Button：按钮
            // 关键属性：sampleButton、自身对齐、点击事件回调、currentOffset
            // 交互：可点击交互
            Button($r('app.string.scroll_To_effect'))
              .sampleButton()
              .alignSelf(ItemAlign.Center)
              .onClick(() => {
                if (this.gridScroller.currentOffset().yOffset <= 0) {
                  this.gridScroller.scrollTo({ xOffset: 0, yOffset: this.gridScroller.currentOffset().yOffset + 500,
                    animation: { duration: 2000, curve: Curve.Linear }
                  },);
                } else {
                  this.gridScroller.scrollTo({ xOffset: 0, yOffset: 0,
                    animation: { duration: 2000, curve: Curve.Linear }
                  },);
                }
              }).id('scroll_to_effect_grid');
            // Grid：网格容器
            // 关键属性：自身对齐、columnsTemplate、列间距、行间距、高度、宽度
            Grid(this.gridScroller) {
              ForEach(this.scrollArr, (day: string) => {
                // GridItem：网格项
                GridItem() {
                  // Text：文本
                  // 关键属性：宽度、gridText
                  Text('world').id('scroll_to_sample_text_21')
                    .width('100%')
                    .gridText();
                }.id('scroll_to_sample_grid_item_20');
              }, (day: string) => day);
            }.id('scroll_to_sample_grid_19')
            .alignSelf(ItemAlign.Center)
            .columnsTemplate('1fr 1fr 1fr')
            .columnsGap(12)
            .rowsGap(12)
            .height('70%')
            .width('92%')
            .borderRadius(24)
            .padding({ left: 12, right: 12, top: 12, bottom: 12 })
            .backgroundColor(Color.White);

          }.id('scroll_to_sample_column_17')
          .itemColumn()
          .width('100%')
          .backgroundColor($r('app.color.background_shallow_grey'));

          // Column：垂直布局容器
          // 关键属性：itemColumn、宽度、背景色
          Column() {
            // Text：文本
            // 关键属性：leftTitleStyle
            Text($r('app.string.waterFlow')).id('scroll_to_sample_text_23')
              .leftTitleStyle();
            // Button：按钮
            // 关键属性：sampleButton、自身对齐、点击事件回调、currentOffset
            // 交互：可点击交互
            Button($r('app.string.scroll_To_effect'))
              .sampleButton()
              .alignSelf(ItemAlign.Center)
              .onClick(() => {
                if (this.waterFlowScroller.currentOffset().yOffset <= 0) {
                  this.waterFlowScroller.scrollTo({
                    xOffset: 0,
                    yOffset: this.waterFlowScroller.currentOffset().yOffset + 500,
                    animation: { duration: 2000, curve: Curve.Linear }
                  },);
                } else {
                  this.waterFlowScroller.scrollTo({
                    xOffset: 0,
                    yOffset: 0,
                    animation: { duration: 2000, curve: Curve.Linear }
                  },);
                }
              }).id('scroll_to_effect_waterflow');
            // WaterFlow：瀑布流容器
            // 关键属性：自身对齐、columnsTemplate、layoutDirection、列间距、行间距、高度
            WaterFlow({ footer: (): void => this.itemFoot(), scroller: this.waterFlowScroller }) {
              ForEach(this.scrollArr, (day: string) => {
                // FlowItem：瀑布流条目
                FlowItem() {
                  // Text：文本
                  // 关键属性：宽度、gridText
                  Text('hello').id('scroll_to_sample_text_26')
                    .width('30%')
                    .gridText();
                }.id('scroll_to_sample_flow_item_25');
              }, (day: string) => day);
            }.id('scroll_to_sample_water_flow_24')
            .alignSelf(ItemAlign.Center)
            .columnsTemplate('1fr 1fr 1fr')
            .layoutDirection(FlexDirection.Column)
            .columnsGap(12)
            .rowsGap(12)
            .height('70%')
            .width('92%')
            .borderRadius(24)
            .padding({ left: 12, right: 12, top: 12, bottom: 12})
            .backgroundColor(Color.White);
          }.id('scroll_to_sample_column_22')
          .itemColumn()
          .width('100%')
          .backgroundColor($r('app.color.background_shallow_grey'));
        }.id('scroll_to_sample_column_6')
        .backgroundColor($r('app.color.background_shallow_grey'))
        .width('100%');
      }.id('scroll_to_sample_scroll_5')
      .padding({left: 10, right: 10, bottom: 24})
      .height('90%')
      .backgroundColor($r('app.color.background_shallow_grey'))
      .scrollable(ScrollDirection.Vertical);
    }.id('scroll_to_sample_column_3')
    .width('100%')
    .padding({bottom: 12})
    .backgroundColor($r('app.color.background_shallow_grey'));
  }
}
