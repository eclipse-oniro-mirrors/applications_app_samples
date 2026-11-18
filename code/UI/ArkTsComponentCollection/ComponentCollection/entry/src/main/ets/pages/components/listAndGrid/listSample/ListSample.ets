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
 * @file entry/src/main/ets/pages/components/listAndGrid/listSample/ListSample.ets
 * 文件职责：ListSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：backgroundStyle、listItemTextStyle、ListSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { ArgumentsSpaceControlPanel, ArgumentsInitIndexControlPanel,
  PropertiesListDirectionControlPanel,
  PropertiesStrokeWidthControlPanel,
  PropertiesLineColorControlPanel,
  PropertiesBarStateControlPanel,
  PropertiesScrollBarColorControlPanel,
  PropertiesScrollBarWidthControlPanel,
  PropertiesEdgeEffectControlPanel,
  PropertiesChainAnimationControlPanel,
  PropertiesMultiControlPanel,
  PropertiesLanesControlPanel,
  PropertiesAlignListItemControlPanel
} from './ListControlPanel';

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

/**
 * ListSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ListSample {
  // @State listDirection：组件内部状态
  @State listDirection: Axis = Axis.Vertical;

  // @State space：组件内部状态
  @State space: number = 10;

  // @State strokeWidth：组件内部状态
  @State strokeWidth: number = 0;

  // @State color：组件内部状态
  @State color: Resource = $r('app.color.background_blue');

  // @State barState：组件内部状态
  @State barState: BarState = BarState.Auto;

  // @State scrollBarWidth：组件内部状态
  @State scrollBarWidth: number = 0;

  // @State scrollBarColor：组件内部状态
  @State scrollBarColor: Color = Color.Blue;

  // @State initIndex：组件内部状态
  @State initIndex: number = AppStorage.get<number>('listSampleInitIndex') || 0;

  // @State edgeEffect：组件内部状态
  @State edgeEffect: EdgeEffect = EdgeEffect.Spring;

  // @State isChainAnimation：组件内部状态
  @State isChainAnimation: boolean = false;

  // @State multiSelectable：组件内部状态
  @State multiSelectable: boolean = false;

  // @State lanes：组件内部状态
  @State lanes: number = 1;

  // @State alignListItem：组件内部状态
  @State alignListItem: ListItemAlign = ListItemAlign.Center;
  private controller: Scroller = new Scroller();
  private numberArray: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  /**
   * listItemTextDynamicSize：执行 listItemTextDynamicSize 相关逻辑。
   */
  @Styles
  listItemTextDynamicSize(){
    .height(this.listDirection === Axis.Horizontal ? '80%' : '20%')
    .width(this.listDirection === Axis.Vertical ? '80%' : '20%')
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
      TitleBar({ title: $r('app.string.list_title') }).id('list_sample_title_bar_2')
        .flexGrow(0)

      // List
      // Column：垂直布局容器
      // 关键属性：内边距、backgroundStyle、高度、宽度、剩余空间放大
      Column() {
        // List：列表容器
        // 关键属性：alignListItem、高度、宽度、列表方向、滚动条、scrollBarColor
        List({ scroller: this.controller, initialIndex: this.initIndex, space: this.space }) {
          ForEach(this.numberArray, (item: number, index: number) => {
            // ListItem：列表项
            ListItem() {
              // Text：文本
              // 关键属性：listItemTextStyle、listItemTextDynamicSize
              Text(item + ``).id('list_sample_text_6')
                .listItemTextStyle()
                .listItemTextDynamicSize()
            }.id('list_sample_list_item_5')
          })
        }.id('list_sample_list_4')
        .alignListItem(this.alignListItem)
        .height('100%')
        .width('100%')
        .listDirection(this.listDirection)
        .scrollBar(this.barState)
        .scrollBarColor(this.scrollBarColor)
        .scrollBarWidth(this.scrollBarWidth)
        .edgeEffect(this.edgeEffect)
        .multiSelectable(this.multiSelectable)
        .chainAnimation(this.isChainAnimation)
        .lanes(this.lanes)
        .divider(
          {
            strokeWidth: this.strokeWidth,
            color: this.color
          }
        )
      }.id('list_sample_column_3')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .backgroundStyle()
      .height('32%')
      .width('100%')
      .flexGrow(0)

      // Column：垂直布局容器
      // 关键属性：高度、宽度、内边距、交叉轴对齐、主轴对齐、剩余空间放大
      Column() {
        // Text：文本
        Text() {
          // Span：行内文本片段
          // 关键属性：function toString() { [native code] }
          Span($r('app.string.current_initialIndex')).id('list_sample_span_9')
          // Span：行内文本片段
          Span(this.initIndex.toString()).id('list_sample_span_10')
        }.id('list_sample_text_8')

        // Text：文本
        // 关键属性：文本对齐、字体颜色
        Text($r('app.string.modify_initialIndex_tips')).id('list_sample_text_11')
          .textAlign(TextAlign.Start)
          .fontColor(Color.Gray)
      }.id('list_sample_column_7')
      .height('16%')
      .width('100%')
      .padding({left:12})
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Center)
      .flexGrow(0)

      // tab页签
        // Column：垂直布局容器
        // 关键属性：高度、宽度
        Column() {
          ///////
          // Tabs：页签容器
          // 关键属性：是否纵向、scrollable、barMode、背景色、内容变更回调、info
          // 交互：输入/提交回调
          Tabs({ barPosition: BarPosition.Start }) {
            // 子页签：WaterFlow控制
            // TabContent：页签内容
            // 关键属性：tabBar
            TabContent() {
              // Column：垂直布局容器
              // 关键属性：高度、tabBar
              Column() {
                // ArgumentsSpaceControlPanel：ArgumentsSpaceControlPanel 自定义组件
                // 关键属性：背景色、高度、外边距、内边距、圆角
                ArgumentsSpaceControlPanel({space: $space}).id('list_sample_arguments_space_control_panel_16')
                  .backgroundColor(Color.White)
                  .height(96)
                  .margin({bottom:12})
                  .padding({left:12,right:12, top:17, bottom:17})
                  .borderRadius(16)

                // ArgumentsInitIndexControlPanel：ArgumentsInitIndexControlPanel 自定义组件
                // 关键属性：背景色、圆角、内边距、外边距
                ArgumentsInitIndexControlPanel({initIndex: $initIndex})
                  .id('list_sample_arguments_init_index_control_panel_17')
                  .backgroundColor(Color.White)
                  .borderRadius(16)
                  .padding({left:12,right:12,top:12})
                  .margin({bottom:12})
              }.id('list_sample_column_15')
              .height('100%')
            }.id('list_sample_tab_content_14').tabBar(new SubTabBarStyle($r('app.string.list_introduction_arguments')))

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
                    // PropertiesListDirectionControlPanel：PropertiesListDirectionControlPanel 自定义组件
                    // 关键属性：背景色、圆角、内边距、外边距
                    PropertiesListDirectionControlPanel({listDirection: $listDirection})
                      .id('list_sample_properties_list_direction_control_panel_20')
                      .backgroundColor(Color.White)
                      .borderRadius(16)
                      .padding({left:12,right:12,top:12})
                      .margin({bottom:12})

                    // PropertiesStrokeWidthControlPanel：PropertiesStrokeWidthControlPanel 自定义组件
                    // 关键属性：背景色、圆角、内边距、外边距、高度
                    PropertiesStrokeWidthControlPanel({strokeWidth: $strokeWidth})
                      .id('list_sample_properties_stroke_width_control_panel_21')
                      .backgroundColor(Color.White)
                      .borderRadius(16)
                      .padding({left:12,right:12,top:12})
                      .margin({bottom:12})
                      .height(96)

                    // PropertiesLineColorControlPanel：PropertiesLineColorControlPanel 自定义组件
                    // 关键属性：背景色、圆角、内边距、外边距
                    PropertiesLineColorControlPanel({lineColor: $color})
                      .id('list_sample_properties_line_color_control_panel_22')
                      .backgroundColor(Color.White)
                      .borderRadius(16)
                      .padding({left:12,right:12,top:12})
                      .margin({bottom:12})

                    // PropertiesBarStateControlPanel：PropertiesBarStateControlPanel 自定义组件
                    // 关键属性：背景色、圆角、内边距、外边距
                    PropertiesBarStateControlPanel({barState: $barState})
                      .id('list_sample_properties_bar_state_control_panel_23')
                      .backgroundColor(Color.White)
                      .borderRadius(16)
                      .padding({left:12,right:12,top:12})
                      .margin({bottom:12})

                    // PropertiesScrollBarColorControlPanel：PropertiesScrollBarColorControlPanel 自定义组件
                    // 关键属性：背景色、圆角、内边距、外边距
                    PropertiesScrollBarColorControlPanel({scrollBarColor: $scrollBarColor})
                      .id('list_sample_properties_scroll_bar_color_control_panel_24')
                      .backgroundColor(Color.White)
                      .borderRadius(16)
                      .padding({left:12,right:12,top:12})
                      .margin({bottom:12})

                    // PropertiesScrollBarWidthControlPanel：PropertiesScrollBarWidthControlPanel 自定义组件
                    // 关键属性：背景色、圆角、内边距、外边距、高度
                    PropertiesScrollBarWidthControlPanel({scrollBarWidth: $scrollBarWidth})
                      .id('list_sample_properties_scroll_bar_width_control_panel_25')
                      .backgroundColor(Color.White)
                      .borderRadius(16)
                      .padding({left:12,right:12,top:12})
                      .margin({bottom:12})
                      .height(96)

                    // PropertiesEdgeEffectControlPanel：PropertiesEdgeEffectControlPanel 自定义组件
                    // 关键属性：背景色、圆角、内边距、外边距
                    PropertiesEdgeEffectControlPanel({edgeEffect: $edgeEffect})
                      .id('list_sample_properties_edge_effect_control_panel_26')
                      .backgroundColor(Color.White)
                      .borderRadius(16)
                      .padding({left:12,right:12,top:12})
                      .margin({bottom:12})

                    // PropertiesChainAnimationControlPanel：PropertiesChainAnimationControlPanel 自定义组件
                    // 关键属性：背景色、圆角、内边距、外边距
                    PropertiesChainAnimationControlPanel({isChainAnimation: $isChainAnimation})
                      .id('list_sample_properties_chain_animation_control_panel_27')
                      .backgroundColor(Color.White)
                      .borderRadius(16)
                      .padding({left:12,right:12,top:12})
                      .margin({bottom:12})

                    // PropertiesMultiControlPanel：PropertiesMultiControlPanel 自定义组件
                    // 关键属性：背景色、圆角、内边距、外边距
                    PropertiesMultiControlPanel({multiSelectable: $multiSelectable})
                      .id('list_sample_properties_multi_control_panel_28')
                      .backgroundColor(Color.White)
                      .borderRadius(16)
                      .padding({left:12,right:12,top:12})
                      .margin({bottom:12})

                    // PropertiesLanesControlPanel：PropertiesLanesControlPanel 自定义组件
                    // 关键属性：背景色、圆角、内边距、外边距
                    PropertiesLanesControlPanel({lanes: $lanes}).id('list_sample_properties_lanes_control_panel_29')
                      .backgroundColor(Color.White)
                      .borderRadius(16)
                      .padding({left:12,right:12,top:12})
                      .margin({bottom:12})

                    // PropertiesAlignListItemControlPanel：PropertiesAlignListItemControlPanel 自定义组件
                    // 关键属性：背景色、圆角、内边距、外边距
                    PropertiesAlignListItemControlPanel({alignListItem: $alignListItem})
                      .id('list_sample_properties_align_list_item_control_panel_30')
                      .backgroundColor(Color.White)
                      .borderRadius(16)
                      .padding({left:12,right:12,top:12})
                      .margin({bottom:12})
                  }.id('list_sample_column_19')
                  .width('100%')
                }
                .flexGrow(1)
                .flexBasis(100)
                .margin({ bottom: 10 })
                .background()
              .id('list_properties_scroll')
            }.id('list_sample_tab_content_18').tabBar(new SubTabBarStyle($r('app.string.list_introduction_properties')))
          }.id('list_sample_tabs_13')
          .vertical(false)
          .scrollable(true)
          .barMode(BarMode.Fixed)
          .backgroundColor(Color.Pink)
          .onChange((index: number) => {
            console.info(index.toString())
          })
          .width('100%')
          .backgroundColor(0xF1F3F5)
        }.id('list_sample_column_12')
        .height('40%')
        .width('100%')
      }.id('list_sample_flex_1')
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}