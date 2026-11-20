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
 * @file entry/src/main/ets/pages/components/auxiliary/alphabetIndexerSample/AlphabetIndexerSample.ets
 * 文件职责：AlphabetIndexerSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：AlphabetIndexerSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import { getStringArrayData } from '../../../../data/ResourceDataHandle'
import { alphabetIndexerDataB, alphabetIndexerDataC, alphabetIndexerDataL, letterValue } from '../../ComponentData'
import Logger from '../../../../util/Logger'
import { IntroductionTitle } from '../../../../common/IntroductionTitle'

@Extend(Text) function leftTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
  .alignSelf(ItemAlign.Start)
  .margin({ left: 12, top: 12 })
}

@Extend(Column) function cardStyle() {
  .backgroundColor(Color.White)
  .borderRadius(24)
  .width('100%')
  .padding(15)
}

@Extend(Circle) function colorPicker(groupIndex: number, itemIndex: number, color: Color, callback: Function) {
  .fill(color)
  .height(20)
  .width(20)
  .onClick(() => {
    callback(groupIndex, itemIndex, color)
  })
}

/**
 * AlphabetIndexerSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct AlphabetIndexerSample {
  private arrayA: string[] = getStringArrayData([$r('app.string.alphabetindexer_an')])
  private arrayB: string[] = getStringArrayData(alphabetIndexerDataB)
  private arrayC: string[] = getStringArrayData(alphabetIndexerDataC)
  private arrayL: string[] = getStringArrayData(alphabetIndexerDataL)
  private value: string[] = letterValue
  private scroller: Scroller = new Scroller()
  private currentSelectIndex: number = 0
  private totalArray: string[][] = [this.arrayA, this.arrayB, this.arrayC, this.arrayL]
  private colorArray: Color[] = [0xFFFFFF, Color.Red, Color.Yellow, Color.Pink]
  // @State selectTextColor：组件内部状态
  @State selectTextColor: Color | number = 0xFFFFFF
  // @State popupColor：组件内部状态
  @State popupColor: Color | number = 0xFFFAF0
  // @State selectBackgroundColor：组件内部状态
  @State selectBackgroundColor: Color | number = 0xCCCCCC
  // @State popupBackgroundColor：组件内部状态
  @State popupBackgroundColor: Color | number = 0xD2B48C
  // @State needPopup：组件内部状态
  @State needPopup: boolean = true
  // @State selectTextIndex：组件内部状态
  @State selectTextIndex: number = -1
  // @State selectBackGroundIndex：组件内部状态
  @State selectBackGroundIndex: number = -1
  // @State popupIndex：组件内部状态
  @State popupIndex: number = -1
  // @State popupBackgroundIndex：组件内部状态
  @State popupBackgroundIndex: number = -1
  private circleClick = (groupIndex: number, itemIndex: number, color: Color) => {
    // 分支：switch (groupIndex) {
    switch (groupIndex) {
      // 分支：case 1:
      case 1:
        // 处理：this.selectTextColor = color
        this.selectTextColor = color
        // 处理：this.selectTextIndex = itemIndex
        this.selectTextIndex = itemIndex
        break
      // 分支：case 2:
      case 2:
        // 处理：this.selectBackgroundColor = color
        this.selectBackgroundColor = color
        // 处理：this.selectBackGroundIndex = itemIndex
        this.selectBackGroundIndex = itemIndex
        break
      // 分支：case 3:
      case 3:
        // 处理：this.popupColor = color
        this.popupColor = color
        // 处理：this.popupIndex = itemIndex
        this.popupIndex = itemIndex
        break
      // 分支：case 4:
      case 4:
        // 处理：this.popupBackgroundColor = color
        this.popupBackgroundColor = color
        // 处理：this.popupBackgroundIndex = itemIndex
        this.popupBackgroundIndex = itemIndex
        break
    }
  }
  private compare = (selectedIndex: number, itemIndex: number): number => {
    return selectedIndex == itemIndex ? 1 : 0.2
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.auxiliary_alphabetIndexer') }).id('alphabet_indexer_sample_title_bar_2')
      // Stack：层叠布局容器
      Stack({ alignContent: Alignment.Start }) {
        // Row：水平布局容器
        // 关键属性：内边距、宽度、高度
        Row() {
          // Blank：占位空白
          Blank().id('alphabet_indexer_sample_blank_5')
          // Column：垂直布局容器
          // 关键属性：宽度、高度、自身对齐
          Column() {
            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.alphabetindexer_list_display') })
              .id('alphabet_indexer_sample_introduction_title_7')
            // List：列表容器
            // 关键属性：宽度、高度、背景色、圆角
            List({ space: 20, initialIndex: 0, scroller: this.scroller }) {
              ForEach(this.arrayA.concat(this.arrayB).concat(this.arrayC).concat(this.arrayL), (item: string) => {
                // ListItem：列表项
                // 关键属性：editable、stringify
                ListItem() {
                  // Text：文本
                  // 关键属性：宽度、字号、文本对齐、editable
                  Text(item).id('alphabet_indexer_sample_text_10')
                    // width：设置宽度
                    .width('80%')
                    // fontSize：设置字号
                    .fontSize(30)
                    // textAlign：设置文本对齐方式
                    .textAlign(TextAlign.Center)
                // 结束当前组件块
                }.id('alphabet_indexer_sample_list_item_9').editable(true)
              // 结束当前组件块
              }, (item: string) => JSON.stringify(item))
            // 结束当前组件块
            }.id('alphabet_indexer_sample_list_8')
            // width：设置宽度
            .width('100%')
            // height：设置高度
            .height('50%')
            // backgroundColor：设置背景色
            .backgroundColor(Color.White)
            // borderRadius：设置圆角
            .borderRadius(24)

            // Blank：占位空白
            Blank().id('alphabet_indexer_sample_blank_11')
            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.alphabetindexer_color_select') })
              .id('alphabet_indexer_sample_introduction_title_12')
            // Column：垂直布局容器
            // 关键属性：cardStyle
            Column() {
              // Row：水平布局容器
              // 关键属性：宽度
              Row() {
                // Text：文本
                // 关键属性：leftTitleStyle、宽度
                Text($r('app.string.alphabetindexer_selectedcolor_selectedcolor')).id('alphabet_indexer_sample_text_15')
                  .leftTitleStyle()
                  // width：设置宽度
                  .width('50%')

                ForEach(this.colorArray, (item: Color, index: number) => {
                  // Circle：圆形
                  // 关键属性：colorPicker、圆角、边框宽度、透明度、compare
                  Circle({ width: 20, height: 20 }).id('alphabet_indexer_sample_circle_16')
                    .colorPicker(1, index, item, this.circleClick)
                    // borderRadius：设置圆角
                    .borderRadius(20)
                    // borderWidth：设置边框宽度
                    .borderWidth(1)
                    // opacity：设置透明度
                    .opacity(this.compare(this.selectTextIndex, index))
                  // Blank：占位空白
                  Blank().id('alphabet_indexer_sample_blank_17')
                // 结束当前组件块
                })
              // 结束当前组件块
              }.id('alphabet_indexer_sample_row_14').width('100%')

              // Row：水平布局容器
              // 关键属性：宽度
              Row() {
                // Text：文本
                // 关键属性：leftTitleStyle、宽度
                Text($r('app.string.alphabetindexer_selectedcolor_selectedbgcolor'))
                  .id('alphabet_indexer_sample_text_19')
                  .leftTitleStyle()
                  // width：设置宽度
                  .width('50%')

                ForEach(this.colorArray, (item: Color, index: number) => {
                  // Circle：圆形
                  // 关键属性：colorPicker、圆角、边框宽度、透明度、compare
                  Circle({ width: 20, height: 20 }).id('alphabet_indexer_sample_circle_20')
                    .colorPicker(2, index, item, this.circleClick)
                    // borderRadius：设置圆角
                    .borderRadius(20)
                    // borderWidth：设置边框宽度
                    .borderWidth(1)
                    .opacity(this.compare(this.selectBackGroundIndex, index))
                  // Blank：占位空白
                  Blank().id('alphabet_indexer_sample_blank_21')
                })
              }.id('alphabet_indexer_sample_row_18').width('100%')

              // Row：水平布局容器
              // 关键属性：宽度
              Row() {
                // Text：文本
                // 关键属性：leftTitleStyle、宽度
                Text($r('app.string.alphabetindexer_selectedcolor_popupcolor')).id('alphabet_indexer_sample_text_23')
                  .leftTitleStyle()
                  .width('50%')

                ForEach(this.colorArray, (item: Color, index) => {
                  // Circle：圆形
                  // 关键属性：colorPicker、圆角、边框宽度、透明度、compare
                  Circle({ width: 20, height: 20 }).id('alphabet_indexer_sample_circle_24')
                    .colorPicker(3, index, item, this.circleClick)
                    .borderRadius(20)
                    .borderWidth(1)
                    .opacity(this.compare(this.popupIndex, index))
                  // Blank：占位空白
                  Blank().id('alphabet_indexer_sample_blank_25')
                })
              }.id('alphabet_indexer_sample_row_22').width('100%')

              // Row：水平布局容器
              // 关键属性：宽度
              Row() {
                // Text：文本
                // 关键属性：leftTitleStyle、宽度
                Text($r('app.string.alphabetindexer_selectedcolor_popupbackground'))
                  .id('alphabet_indexer_sample_text_27')
                  .leftTitleStyle()
                  .width('50%')
                ForEach(this.colorArray, (item: Color, index) => {
                  // Circle：圆形
                  // 关键属性：colorPicker、圆角、边框宽度、透明度、compare
                  Circle({ width: 20, height: 20 }).id('alphabet_indexer_sample_circle_28')
                    .colorPicker(4, index, item, this.circleClick)
                    .borderRadius(20)
                    .borderWidth(1)
                    .opacity(this.compare(this.popupBackgroundIndex, index))
                  // Blank：占位空白
                  Blank().id('alphabet_indexer_sample_blank_29')
                })
              }.id('alphabet_indexer_sample_row_26').width('100%')

              // Row：水平布局容器
              // 关键属性：宽度、cardStyle
              Row() {
                // Text：文本
                // 关键属性：leftTitleStyle、宽度
                Text($r('app.string.alphabetindexer_selectedcolor_usingpopup')).id('alphabet_indexer_sample_text_31')
                  .leftTitleStyle()
                  .width('50%')
                // Blank：占位空白
                Blank().id('alphabet_indexer_sample_blank_32')
                // Toggle：开关
                // 关键属性：内容变更回调
                // 交互：输入/提交回调
                Toggle({ type: ToggleType.Switch, isOn: this.needPopup }).id('alphabet_indexer_sample_toggle_33')
                  .onChange((isOn) => {
                    this.needPopup = isOn
                  })
              }.id('alphabet_indexer_sample_row_30').width('100%')
            }.id('alphabet_indexer_sample_column_13').cardStyle()

          }.id('alphabet_indexer_sample_column_6').width('90%')
          .height('100%')
          .alignSelf(ItemAlign.Start)

          // Blank：占位空白
          Blank().id('alphabet_indexer_sample_blank_34')
          // AlphabetIndexer：字母索引条
          // 关键属性：selectedColor、popupColor、selectedBackgroundColor、popupBackground、usingPopup、selectedFont
          AlphabetIndexer({ arrayValue: this.value, selected: 0 })
            .selectedColor(this.selectTextColor) // 选中项文本颜色
            .popupColor(this.popupColor) // 弹出框文本颜色
            .selectedBackgroundColor(this.selectBackgroundColor) // 选中项背景颜色
            .popupBackground(this.popupBackgroundColor) // 弹出框背景颜色
            .usingPopup(this.needPopup) // 是否显示弹出框
            .selectedFont({ size: 16, weight: FontWeight.Bolder }) // 选中项字体样式
            .popupFont({ size: 30, weight: FontWeight.Bolder }) // 弹出框内容的字体样式
            .itemSize(28) // 每一项的尺寸大小
            .alignStyle(IndexerAlign.Right) // 弹出框在索引条左侧弹出
            .onSelect((index: number) => {
              Logger.info(`${this.value[index]} Selected!`);
              if (this.value[index] === 'A') {
                this.currentSelectIndex = 0;
                this.scroller.scrollToIndex(0);
                return this.arrayA; // 当选中A时，弹出框里面的提示文本列表显示A对应的列表arrayA，选中B、C、L时也同样
              } else if (this.value[index] === 'B') {
                this.currentSelectIndex = 1;
                this.scroller.scrollToIndex(this.arrayA.length);
                return this.arrayB;
              } else if (this.value[index] === 'C') {
                this.currentSelectIndex = 2;
                this.scroller.scrollToIndex(this.arrayA.length + this.arrayB.length);
                return this.arrayC;
              } else if (this.value[index] === 'L') {
                this.currentSelectIndex = 3;
                this.scroller.scrollToIndex(this.arrayA.length + this.arrayB.length + this.arrayC.length);
                return this.arrayL;
              } else {
                return []; // 选中其余子母项时，提示文本列表为空
              }
            })
            .id('test_alphabet')
            .onRequestPopupData((index: number) => {
              if (this.value[index] === 'A') {
                this.currentSelectIndex = 0
                this.scroller.scrollToIndex(0)
                return this.arrayA // 当选中A时，弹出框里面的提示文本列表显示A对应的列表arrayA，选中B、C、L时也同样
              } else if (this.value[index] === 'B') {
                this.currentSelectIndex = 1
                this.scroller.scrollToIndex(this.arrayA.length)
                return this.arrayB
              } else if (this.value[index] === 'C') {
                this.currentSelectIndex = 2
                this.scroller.scrollToIndex(this.arrayA.length + this.arrayB.length)
                return this.arrayC
              } else if (this.value[index] === 'L') {
                this.currentSelectIndex = 3
                this.scroller.scrollToIndex(this.arrayA.length + this.arrayB.length + this.arrayC.length)
                return this.arrayL
              } else {
                return [] // 选中其余子母项时，提示文本列表为空
              }
            })
            .onPopupSelect((index: number) => {
              let length = 0
              for (let i = 0; i < this.currentSelectIndex; i++) {
                length += this.totalArray[i].length
              }
              this.scroller.scrollToIndex(length + index)
            })
            .popupBackgroundBlurStyle(BlurStyle.NONE) // 设置提示弹窗的背景模糊材质
        }.id('alphabet_indexer_sample_row_4')
        .padding(10)
        .width('100%')
        .height('90%')
      }.id('alphabet_indexer_sample_stack_3')
    }.id('alphabet_indexer_sample_column_1')
    .height('100%')
    .backgroundColor($r('app.color.background_light_gray'))
  }
}
