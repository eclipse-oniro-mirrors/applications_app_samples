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
 * @file entry/src/main/ets/pages/universal/properties/layoutConstraintSample/LayoutConstraintSample.ets
 * 文件职责：LayoutConstraintSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ContainerInfo、ChildInfo、LayoutExample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data/ResourceDataHandle';

@Extend(Row) function rowStyle() {
  .padding(8)
  .borderRadius(24)
  .width('100%')
  .backgroundColor(Color.White)
  .margin({ left: 12, right: 12 })
}

/**
 * ContainerInfo：类定义，承载本文件对应的逻辑与数据。
 */
class ContainerInfo {
  label: string = '';
  size: string = '';
}

/**
 * ChildInfo：类定义，承载本文件对应的逻辑与数据。
 */
class ChildInfo {
  text: string = '';
  priority: number = 0;
}

/**
 * LayoutExample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct LayoutExample {
  // 显示容器大小
  private container: ContainerInfo[] = [
    { label: getStringData($r('app.string.layout_constrain_big_container')), size: '100%' },
    { label: getStringData($r('app.string.layout_constrain_middle_container')), size: '50%' },
    { label: getStringData($r('app.string.layout_constrain_small_container')), size: '30%' }
  ];
  private children: ChildInfo[] = [
    { text: getStringData($r('app.string.layout_constrain_children_one')), priority: 2 },
    { text: getStringData($r('app.string.layout_constrain_children_two')), priority: 1 },
    { text: getStringData($r('app.string.layout_constrain_children_three')), priority: 3 },
    { text: getStringData($r('app.string.layout_constrain_children_four')), priority: 1 },
    { text: getStringData($r('app.string.layout_constrain_children_five')), priority: 2 }
  ];
  private childrenOne: string[] = [getStringData($r('app.string.layout_constrain_one')), getStringData($r('app.string.layout_constrain_two'))];

  // @State currentIndex：组件内部状态
  @State currentIndex: number = 0;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.layout_constrain') }).id('layout_constraint_sample_title_bar_2')
      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({ introduction: $r('app.string.layout_constrain_aspectRatio') })
        .id('layout_constraint_sample_introduction_title_3')
      // Row：水平布局容器
      // 关键属性：rowStyle
      Row() {
        // Row：水平布局容器
        // 关键属性：尺寸、背景色、裁剪
        Row({ space: 5 }) {
          ForEach(this.childrenOne, (item: string) => {
            // 组件宽度 = 组件高度*1.5 = 90
            // Text：文本
            // 关键属性：背景色、字号、aspectRatio、高度
            Text(item).id('layout_constraint_sample_text_6')
              .backgroundColor(0xbbb2cb)
              .fontSize(20)
              .aspectRatio(1.5)
              .height(60)
            // 组件高度 = 组件宽度/1.5 = 60/1.5 = 40
            // Text：文本
            // 关键属性：背景色、字号、aspectRatio、宽度
            Text(item).id('layout_constraint_sample_text_7')
              .backgroundColor(0xbbb2cb)
              .fontSize(20)
              .aspectRatio(1.5)
              .width(60)
          }, (item: string) => item)
        }.id('layout_constraint_sample_row_5')
        .size({ width: '100%', height: 100 })
        .backgroundColor(0xd2cab3)
        .clip(true)
      }.id('layout_constraint_sample_row_4')
      .rowStyle()

      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({ introduction: $r('app.string.layout_constrain_displayPriority') })
        .id('layout_constraint_sample_introduction_title_8')
      // Row：水平布局容器
      // 关键属性：rowStyle
      Row() {
        // Column：垂直布局容器
        // 关键属性：交叉轴对齐
        Column() {
          // 切换父级容器大小
          // Button：按钮
          // 关键属性：背景色、点击事件回调
          // 交互：可点击交互
          Button(this.container[this.currentIndex].label).backgroundColor(0x317aff)
            .onClick(() => {
              this.currentIndex = (this.currentIndex + 1) % this.container.length;
            })
            .margin({ bottom: 5 })
            .id('layout_btn')
          // 通过变量设置Flex父容器宽度
          // Flex：弹性布局容器
          // 关键属性：宽度、背景色
          Flex({ justifyContent: FlexAlign.SpaceBetween }) {
            ForEach(this.children, (item: ChildInfo) => {
              // 使用displayPriority给子组件绑定显示优先级
              // Text：文本
              // 关键属性：宽度、高度、字号、文本对齐、背景色、displayPriority
              Text(item.text).id('layout_constraint_sample_text_12')
                .width(50)
                .height(60)
                .fontSize(12)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xbbb2cb)
                .displayPriority(item.priority)
            }, (item: ChildInfo) => item.text)
          }.id('layout_constraint_sample_flex_11')
          .width(this.container[this.currentIndex].size)
          .backgroundColor(0xd2cab3)
        }.id('layout_constraint_sample_column_10')
        .alignItems(HorizontalAlign.Center)
      }.id('layout_constraint_sample_row_9')
      .rowStyle()
    }.id('layout_constraint_sample_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}