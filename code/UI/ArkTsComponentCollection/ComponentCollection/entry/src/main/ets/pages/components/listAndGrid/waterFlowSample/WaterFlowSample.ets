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
 * @file entry/src/main/ets/pages/components/listAndGrid/waterFlowSample/WaterFlowSample.ets
 * 文件职责：WaterFlowSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：backgroundStyle、listItemTextStyle、WaterFlowSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { WaterFlowScrollByControlPanel, WaterFlowScrollEdgeControlPanel, WaterFlowDataSource,
  WaterFlowPropertiesScrollBarControlPanel,
  WaterFlowPropertiesScrollBarColorControlPanel,
  WaterFlowPropertiesScrollBarWidthControlPanel,
  WaterFlowPropertiesEdgeEffectControlPanel,
} from './WaterFlowDataSource'

/**
 * backgroundStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Column)
function backgroundStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(16)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.SpaceAround)
}

/**
 * listItemTextStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Text)
function listItemTextStyle() {
  .fontSize(15)
  .borderRadius(8)
  .textAlign(TextAlign.Center)
  .backgroundColor($r('app.color.background_grey'))
}

@Extend(Column) function columnStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(16)
  .backgroundColor(Color.White)
  .justifyContent(FlexAlign.SpaceAround)
}

/**
 * WaterFlowSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct WaterFlowSample {
  // @State listDirection：组件内部状态
  @State listDirection: Axis = Axis.Vertical;

  // @State initIndex：组件内部状态
  @State initIndex: number = AppStorage.get<number>('listSampleInitIndex') || 0;

  // @State curScrollEvent：组件内部状态
  @State curScrollEvent: string = ""; // $r('app.string.current_event_value')
  // @State scrollState：组件内部状态
  @State scrollState: ScrollState = ScrollState.Idle
  // @State scrollOffset：组件内部状态
  @State scrollOffset: number = 10;

  // @State firstIndex：组件内部状态
  @State firstIndex: number = 0;

  // @State lastIndex：组件内部状态
  @State lastIndex: number = 0;

  // @State currentIndex：组件内部状态
  @State currentIndex: number = 0;

  // @State isChainAnimation：组件内部状态
  @State isChainAnimation: boolean = false;

  // @State multiSelectable：组件内部状态
  @State multiSelectable: boolean = false;

  // @State lanes：组件内部状态
  @State lanes: number = 1;

  // @State alignListItem：组件内部状态
  @State alignListItem: ListItemAlign = ListItemAlign.Center;

  // @State scrollBy：组件内部状态
  @State @Watch("onScrollByChange") scrollBy: number = 100;

  // @State scrollEdge：组件内部状态
  @State @Watch("onChange") scrollEdge: Edge = Edge.Top;

  // @State edgeEffect：组件内部状态
  @State edgeEffect: EdgeEffect = EdgeEffect.Spring;

  // @State scrollBarWidth：组件内部状态
  @State scrollBarWidth: number = 0;

  // @State scrollBarColor：组件内部状态
  @State scrollBarColor: Color = Color.Blue;

  // @State scrollBar：组件内部状态
  @State scrollBar: BarState = BarState.On;

  private itemHeightArray: number[] = [];

  scroller: Scroller = new Scroller();
  dataSource: WaterFlowDataSource = new WaterFlowDataSource();

  /**
   * onScrollByChange：执行 onScrollByChange 相关逻辑。
   */
  onScrollByChange() {
    this.scroller.scrollBy(0, this.scrollBy);
  }

  /**
   * onChange：执行 onChange 相关逻辑。
   */
  onChange(){
    this.scroller.scrollEdge(this.scrollEdge);
  }

    // 保存flow item宽/高
    getItemSizeArray() {
      for (let i = 0; i < 100; i++) {
       if (i % 4 == 0) {
         this.itemHeightArray.push(102);
       } else if (i % 4 == 1) {
         this.itemHeightArray.push(136);
       } else if (i % 4 == 2) {
         this.itemHeightArray.push(136);
       }  else if (i % 4 == 3) {
         this.itemHeightArray.push(102);
       }
      }
    }

    aboutToAppear() {
      this.getItemSizeArray();
    }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Flex：弹性布局容器
    // 关键属性：内边距、高度、宽度、背景色
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {
      // TitleBar：TitleBar 自定义组件
      // 关键属性：剩余空间放大
      TitleBar({ title: $r('app.string.water_flow_title') }).id('water_flow_sample_title_bar_2')
        .flexGrow(0)

      // Column：垂直布局容器
      // 关键属性：内边距、backgroundStyle、高度、宽度、剩余空间放大
      Column() {
        // WaterFlow：瀑布流容器
        // 关键属性：columnsTemplate、列间距、行间距、宽度、滚动条、scrollBarColor
        WaterFlow({scroller: this.scroller}) {
          LazyForEach(this.dataSource, (item: number) => {
        // FlowItem：瀑布流条目
        // 关键属性：宽度、背景色
        FlowItem() {
          // Column：垂直布局容器
          // 关键属性：高度、圆角
          Column() {
            // Image：图片
            // 关键属性：圆角、objectFit
            Image('resources/base/media/water_flow_'+ item % 4 + '.png').id('water_flow_sample_image_7')
              .borderRadius(16)
              .objectFit(ImageFit.Fill)
          }.id('water_flow_sample_column_6')
          .height('100%')
          .borderRadius(16)
          .height(this.itemHeightArray[item % 4])
        }.id('water_flow_sample_flow_item_5')
        .width('100%')
        .backgroundColor(Color.White)
      }, (item: string) => item)
    }.id('water_flow_sample_water_flow_4')
        .columnsTemplate("1fr 1fr")
        .columnsGap(12)
        .rowsGap(12)
        .width('100%')
        .scrollBar(this.scrollBar)
        .scrollBarColor(this.scrollBarColor)
        .scrollBarWidth(this.scrollBarWidth)
        .edgeEffect(this.edgeEffect)
        .onScroll((scrollOffset: number, scrollState: ScrollState) => {
          this.curScrollEvent = "onScroll";
          this.scrollOffset = scrollOffset;
          this.scrollState = scrollState;
        })
        .onScrollIndex((first: number, last: number) => {
          this.curScrollEvent = "onScrollIndex";
          this.firstIndex = first;
          this.lastIndex = last;
        })
        .onScrollStart(() => {
          this.curScrollEvent = "onScrollStart";
        })
        .onScrollStop(() => {
          this.curScrollEvent = "onScrollStop";
        })
      }.id('water_flow_sample_column_3')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .backgroundStyle()
      .height('45%')
      .width('100%')
      .flexGrow(0)

      // 状态栏
      // Column：垂直布局容器
      // 关键属性：高度、宽度、内边距、交叉轴对齐、主轴对齐、剩余空间放大
      Column() {
        // Text：文本
        Text() {
          // Span：行内文本片段
          Span($r('app.string.current_scroll_event')).id('water_flow_sample_span_10');
          // Span：行内文本片段
          Span(this.curScrollEvent).id('water_flow_sample_span_11');
        }.id('water_flow_sample_text_9')

        // Text：文本
        Text() {
          // Span：行内文本片段
          // 关键属性：function toString() { [native code] }
          Span($r('app.string.current_scroll_state')).id('water_flow_sample_span_13');
          // Span：行内文本片段
          Span(this.scrollState.toString()).id('water_flow_sample_span_14');
        }.id('water_flow_sample_text_12')

        // Text：文本
        Text() {
          // Span：行内文本片段
          // 关键属性：function toString() { [native code] }
          Span($r('app.string.current_scroll_distance')).id('water_flow_sample_span_16');
          // Span：行内文本片段
          Span(this.scrollOffset.toString()).id('water_flow_sample_span_17');
        }.id('water_flow_sample_text_15')

        // Text：文本
        Text() {
          // Span：行内文本片段
          // 关键属性：function toString() { [native code] }
          Span($r('app.string.current_scroll_index_first')).id('water_flow_sample_span_19');
          // Span：行内文本片段
          Span(this.firstIndex.toString()).id('water_flow_sample_span_20');
          // Span：行内文本片段
          // 关键属性：function toString() { [native code] }
          Span($r('app.string.current_scroll_index_last')).id('water_flow_sample_span_21');
          // Span：行内文本片段
          Span(this.lastIndex.toString()).id('water_flow_sample_span_22');
        }.id('water_flow_sample_text_18')
      }.id('water_flow_sample_column_8')
      .height('16%')
      .width('100%')
      .padding({left:12})
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Center)
      .flexGrow(0)

      // tab 页签
        // Column：垂直布局容器
        // 关键属性：高度、宽度
        Column() {
          // Tabs：页签容器
          // 关键属性：是否纵向、scrollable、barMode、内容变更回调、info、function toString() { [native code] }
          // 交互：输入/提交回调
          Tabs({ barPosition: BarPosition.Start }) {
            // 子页签：WaterFlow控制
            // TabContent：页签内容
            // 关键属性：tabBar
            TabContent() {
              // Column：垂直布局容器
              // 关键属性：宽度、高度、tabBar
              Column() {
                // WaterFlowScrollByControlPanel：WaterFlowScrollByControlPanel 自定义组件
                WaterFlowScrollByControlPanel({
                  scrollBy: $scrollBy
                }).id('water_flow_sample_water_flow_scroll_by_control_panel_27')
                // WaterFlowScrollEdgeControlPanel：WaterFlowScrollEdgeControlPanel 自定义组件
                WaterFlowScrollEdgeControlPanel({
                  scrollEdge: $scrollEdge
                }).id('water_flow_sample_water_flow_scroll_edge_control_panel_28')
              }.id('water_flow_sample_column_26')
              .width('100%')
              .height('100%')
            }.id('water_flow_sample_tab_content_25').tabBar(new SubTabBarStyle($r('app.string.water_flow_controller')))

            // 子页签：WaterFlow属性
            // TabContent：页签内容
            // 关键属性：tabBar
            TabContent() {
              // Scroll：滚动容器
              // 关键属性：剩余空间放大、基准尺寸、外边距、background、tabBar
              Scroll() {
              // Column：垂直布局容器
              // 关键属性：宽度
              Column() {
                // WaterFlowPropertiesScrollBarControlPanel：WaterFlowPropertiesScrollBarControlPanel 自定义组件
                // 关键属性：背景色、圆角、内边距、外边距
                WaterFlowPropertiesScrollBarControlPanel({scrollBar: $scrollBar})
                  .id('water_flow_sample_water_flow_properties_scroll_bar_control_panel_32')
                .backgroundColor(Color.White)
                .borderRadius(16)
                .padding({left:12,right:12,top:12})
                .margin({bottom:12})

                // WaterFlowPropertiesScrollBarColorControlPanel：WaterFlowPropertiesScrollBarColorControlPanel 自定义组件
                // 关键属性：背景色、圆角、内边距、外边距
                WaterFlowPropertiesScrollBarColorControlPanel({scrollBarColor: $scrollBarColor})
                  .id('water_flow_sample_water_flow_properties_scroll_bar_color_control_panel_33')
                .backgroundColor(Color.White)
                .borderRadius(16)
                .padding({left:12,right:12,top:12})
                .margin({bottom:12})

                // WaterFlowPropertiesScrollBarWidthControlPanel：WaterFlowPropertiesScrollBarWidthControlPanel 自定义组件
                // 关键属性：背景色、圆角、内边距、外边距
                WaterFlowPropertiesScrollBarWidthControlPanel({scrollBarWidth: $scrollBarWidth})
                  .id('water_flow_sample_water_flow_properties_scroll_bar_width_control_panel_34')
                  .backgroundColor(Color.White)
                  .borderRadius(16)
                  .padding({left:12,right:12,top:12})
                  .margin({bottom:12})

                // WaterFlowPropertiesEdgeEffectControlPanel：WaterFlowPropertiesEdgeEffectControlPanel 自定义组件
                // 关键属性：背景色、圆角、内边距、外边距
                WaterFlowPropertiesEdgeEffectControlPanel({edgeEffect: $edgeEffect})
                  .id('water_flow_sample_water_flow_properties_edge_effect_control_panel_35')
                  .backgroundColor(Color.White)
                  .borderRadius(16)
                  .padding({left:12,right:12,top:12})
                  .margin({bottom:12})
              }.id('water_flow_sample_column_31')
              .width('100%')
            }.id('water_flow_sample_scroll_30')
            .flexGrow(1)
            .flexBasis(100)
            .margin({ bottom: 10 })
            .background()
            }.id('water_flow_sample_tab_content_29').tabBar(new SubTabBarStyle($r('app.string.water_flow_properties')))

          }.id('water_flow_sample_tabs_24')
          .vertical(false)
          .scrollable(true)
          .barMode(BarMode.Fixed)
          .onChange((index: number) => {
            console.info(index.toString())
          })
          .width('100%')
          .backgroundColor(0xF1F3F5)

        }.id('water_flow_sample_column_23')
        .height('40%')
        .width('100%')
    }.id('water_flow_sample_flex_1')
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
