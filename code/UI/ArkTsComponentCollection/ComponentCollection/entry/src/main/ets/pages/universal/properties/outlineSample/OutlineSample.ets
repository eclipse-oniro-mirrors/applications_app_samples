/**
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
 * @file entry/src/main/ets/pages/universal/properties/outlineSample/OutlineSample.ets
 * 文件职责：OutlineSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：OutLineSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

@Extend(Text) function textStyle(widthValue: number) {
  .height(78)
  .width(widthValue)
}

@Extend(Text) function fontTextStyle() {
  .width(96)
  .height(22)
  .fontFamily('HarmonyHeiTi-Medium')
  .fontSize(16)
  .textAlign(TextAlign.Center)
  .lineHeight(22)
  .fontWeight(500)
}

@Extend(Text) function buttonTextStyle() {
  .height(18)
  .width(56)
  .textAlign(TextAlign.Center)
  .align(Alignment.Center)
  .fontFamily('HarmonyHeiTi-Medium')
  .fontSize(14)
  .fontWeight(500)
  .fontColor($r('app.color.font_blue'))
  .margin({ top : 9 , bottom : 9 , left : 8 , right : 8 })
}

@Extend(TextInput) function textInputStyle() {
  .fontFamily('HarmonyHeiTi')
  .fontSize(16)
  .fontColor($r('app.color.font_color_shallow'))
  .fontWeight(400)
  .margin({ top : 8 , bottom : 8 })
  .height(40)
  .width(432)
  .borderRadius(20)
  .backgroundColor($r('app.color.background_shallow_grey'))
  .type(InputType.Password)
}

@Extend(Column) function columnStyle(marginLeftValue: number , marginRightValue: number) {
  .height(36)
  .width(98)
  .borderRadius(18)
  .backgroundColor($r('app.color.background_shallow_grey'))
  .margin({ top : 24 , left : marginLeftValue , right : marginRightValue , bottom : 24 })
}

/**
 * OutLineSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct OutLineSample {
  private textInputController: TextInputController = new TextInputController();

  // @State isFocus1：组件内部状态
  @State isFocus1: boolean = false;

  // @State isFocus2：组件内部状态
  @State isFocus2: boolean = false;

  // @State mTextIsHover1：组件内部状态
  @State mTextIsHover1: boolean = false;

  // @State mTextIsHover2：组件内部状态
  @State mTextIsHover2: boolean = false;

  // @State mTextIsHover3：组件内部状态
  @State mTextIsHover3: boolean = false;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title : $r('app.string.prop_outline') }).id('outline_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // Column：垂直布局容器
          // 关键属性：高度、宽度、圆角、背景色、外边距
          Column() {
            // Row：水平布局容器
            // 关键属性：外边距、宽度、主轴对齐
            Row() {
              // Text：文本
              // 关键属性：textStyle、背景色、边框
              Text() {
              // 结束当前组件块
              }.id('outline_sample_text_7')
              // textStyle：套用文本样式
              .textStyle(78)
              // backgroundColor：设置背景色
              .backgroundColor($r('app.color.column_blue'))
              // border：设置边框
              .border({
                width : 4 ,
                radius : { bottomLeft : 20 , topRight : 20 , bottomRight : 10 , topLeft : 10 } ,
                color : $r('app.color.border_color') ,
                style : BorderStyle.Solid
              // 结束当前组件块
              })
              // outline：设置外轮廓
              .outline({
                width : 4 ,
                radius : 20 ,
                color : $r('app.color.outline_color') ,
                style : OutlineStyle.DASHED
              // 结束当前组件块
              })

              // Text：文本
              // 关键属性：textStyle、背景色、边框
              Text() {
              // 结束当前组件块
              }.id('outline_sample_text_8')
              // textStyle：套用文本样式
              .textStyle(78)
              // backgroundColor：设置背景色
              .backgroundColor($r('app.color.column_blue'))
              // border：设置边框
              .border({
                width : 4 ,
                radius : 20 ,
                color : $r('app.color.border_color') ,
                style : BorderStyle.Solid
              // 结束当前组件块
              })
              // outline：设置外轮廓
              .outline({
                width : 4 ,
                radius : 20 ,
                color : $r('app.color.outline_color') ,
                style : OutlineStyle.SOLID
              // 结束当前组件块
              })
            // 结束当前组件块
            }.id('outline_sample_row_6')
            // margin：设置外边距
            .margin({ top : 30 })
            // width：设置宽度
            .width('100%')
            // justifyContent：设置主轴对齐
            .justifyContent(FlexAlign.SpaceAround)

            // Row：水平布局容器
            // 关键属性：外边距、宽度、主轴对齐
            Row() {
              // Text：文本
              // 关键属性：fontTextStyle、字体颜色
              Text($r('app.string.outline_text')).id('outline_sample_text_10')
                .fontTextStyle()
                // fontColor：设置字体颜色
                .fontColor($r('app.color.font_color_black'))
              // Text：文本
              // 关键属性：fontTextStyle、字体颜色
              Text($r('app.string.outline_effect')).id('outline_sample_text_11')
                .fontTextStyle()
                // fontColor：设置字体颜色
                .fontColor($r('app.color.font_color_black'))
            // 结束当前组件块
            }.id('outline_sample_row_9')
            // margin：设置外边距
            .margin({ top : 10 , bottom : 10 })
            // width：设置宽度
            .width('100%')
            // justifyContent：设置主轴对齐
            .justifyContent(FlexAlign.SpaceAround)

            // Row：水平布局容器
            // 关键属性：外边距、宽度、主轴对齐
            Row() {
              // Text：文本
              // 关键属性：textStyle、背景色、边框
              Text() {
              // 结束当前组件块
              }.id('outline_sample_text_13')
              // textStyle：套用文本样式
              .textStyle(78)
              // backgroundColor：设置背景色
              .backgroundColor($r('app.color.column_blue'))
              // border：设置边框
              .border({
                width : 4 ,
                radius : 20 ,
                color : $r('app.color.border_color') ,
                style : BorderStyle.Solid
              // 结束当前组件块
              })
              // outline：设置外轮廓
              .outline({
                width : 4 ,
                radius : 40 ,
                color : $r('app.color.outline_color') ,
                style : OutlineStyle.SOLID
              // 结束当前组件块
              })

              // Text：文本
              // 关键属性：textStyle、背景色、边框
              Text() {
              // 结束当前组件块
              }.id('outline_sample_text_14')
              // textStyle：套用文本样式
              .textStyle(78)
              // backgroundColor：设置背景色
              .backgroundColor($r('app.color.column_blue'))
              // border：设置边框
              .border({
                width : 4 ,
                radius : 39 ,
                color : $r('app.color.border_color') ,
                style : BorderStyle.Solid
              // 结束当前组件块
              })
              // outline：设置外轮廓
              .outline({
                width : 4 ,
                radius : 39 ,
                color : $r('app.color.outline_color') ,
                style : OutlineStyle.SOLID
              // 结束当前组件块
              })
            // 结束当前组件块
            }.id('outline_sample_row_12')
            // margin：设置外边距
            .margin({ top : 30 })
            // width：设置宽度
            .width('100%')
            // justifyContent：设置主轴对齐
            .justifyContent(FlexAlign.SpaceAround)

            // Row：水平布局容器
            // 关键属性：外边距、宽度、主轴对齐
            Row() {
              // Text：文本
              // 关键属性：fontTextStyle、字体颜色
              Text($r('app.string.outline_effect')).id('outline_sample_text_16')
                .fontTextStyle()
                // fontColor：设置字体颜色
                .fontColor($r('app.color.font_color_black'))
              // Text：文本
              // 关键属性：fontTextStyle、字体颜色
              Text($r('app.string.outline_effect')).id('outline_sample_text_17')
                .fontTextStyle()
                // fontColor：设置字体颜色
                .fontColor($r('app.color.font_color_black'))
            // 结束当前组件块
            }.id('outline_sample_row_15')
            // margin：设置外边距
            .margin({ top : 10 , bottom : 10 })
            // width：设置宽度
            .width('100%')
            // justifyContent：设置主轴对齐
            .justifyContent(FlexAlign.SpaceAround)

            // Row：水平布局容器
            // 关键属性：外边距、宽度、主轴对齐
            Row() {
              // Text：文本
              // 关键属性：textStyle、背景色、边框
              Text() {
              // 结束当前组件块
              }.id('outline_sample_text_19')
              // textStyle：套用文本样式
              .textStyle(130)
              // backgroundColor：设置背景色
              .backgroundColor($r('app.color.column_blue'))
              // border：设置边框
              .border({
                width : 4 ,
                radius : 20 ,
                color : $r('app.color.border_color') ,
                style : BorderStyle.Solid
              // 结束当前组件块
              })
              // outline：设置外轮廓
              .outline({
                width : 4 ,
                radius : 0 ,
                color : $r('app.color.outline_color') ,
                style : OutlineStyle.SOLID
              // 结束当前组件块
              })

              // Text：文本
              // 关键属性：textStyle、背景色
              Text() {
              // 结束当前组件块
              }.id('outline_sample_text_20')
              // textStyle：套用文本样式
              .textStyle(130)
              // backgroundColor：设置背景色
              .backgroundColor(Color.White)
            // 结束当前组件块
            }.id('outline_sample_row_18')
            // margin：设置外边距
            .margin({ top : 30 })
            // width：设置宽度
            .width('100%')
            // justifyContent：设置主轴对齐
            .justifyContent(FlexAlign.SpaceAround)

            // Row：水平布局容器
            // 关键属性：外边距、宽度、主轴对齐
            Row() {
              // Text：文本
              // 关键属性：fontTextStyle、字体颜色
              Text($r('app.string.outline_effect')).id('outline_sample_text_22')
                .fontTextStyle()
                // fontColor：设置字体颜色
                .fontColor($r('app.color.font_color_black'))
              // Text：文本
              // 关键属性：fontTextStyle、字体颜色
              Text($r('app.string.outline_effect')).id('outline_sample_text_23')
                .fontTextStyle()
                // fontColor：设置字体颜色
                .fontColor(Color.White)
            // 结束当前组件块
            }.id('outline_sample_row_21')
            // margin：设置外边距
            .margin({ top : 10 })
            // width：设置宽度
            .width('100%')
            // justifyContent：设置主轴对齐
            .justifyContent(FlexAlign.SpaceAround)
          // 结束当前组件块
          }.id('outline_sample_column_5')
          // height：设置高度
          .height(456)
          // width：设置宽度
          .width(456)
          // borderRadius：设置圆角
          .borderRadius(24)
          // backgroundColor：设置背景色
          .backgroundColor(Color.White)
          // margin：设置外边距
          .margin({ top : 12 , left : 12 , right : 12 , bottom : 4 })

          // Column：垂直布局容器
          // 关键属性：高度、宽度、圆角、背景色、外边距
          Column() {
            // Column：垂直布局容器
            // 关键属性：高度、宽度、外边距
            Column() {
              // TextInput：单行输入框
              // 关键属性：textInputStyle、外轮廓
              TextInput({ placeholder : 'Hint' , controller : this.textInputController })
                .textInputStyle()
                // outline：设置外轮廓
                .outline(this.isFocus1 ?
                  {
                    width : 3 ,
                    radius : 20 ,
                    color : $r('app.color.border_color') ,
                    style : OutlineStyle.SOLID
                  // 结束当前组件块
                  } :
                  {
                    width : 0 ,
                    radius : 20
                  })
                .onFocus(() => {
                  this.isFocus1 = true;
                })
                .onBlur(() => {
                  this.isFocus1 = false;
                })
                .id('testInput1')
            }.id('outline_sample_column_25')
            .height(56)
            .width(432)
            .margin({ top : 4 })

            // Column：垂直布局容器
            // 关键属性：高度、宽度、外边距
            Column() {
              // TextInput：单行输入框
              // 关键属性：textInputStyle、外轮廓
              TextInput({ placeholder : 'Hint' , controller : this.textInputController })
                .textInputStyle()
                .outline(this.isFocus2 ?
                  {
                    width : 3 ,
                    radius : 20 ,
                    color : $r('app.color.border_color') ,
                    style : OutlineStyle.SOLID
                  } :
                  {
                    width : 0 ,
                    radius : 20
                  })
                .onFocus(() => {
                  this.isFocus2 = true;
                })
                .onBlur(() => {
                  this.isFocus2 = false;
                })
                .id('testInput2')
            }.id('outline_sample_column_26')
            .height(56)
            .width(432)
            .margin({ bottom : 4 })
          }.id('outline_sample_column_24')
          .height(120)
          .width(456)
          .borderRadius(24)
          .backgroundColor(Color.White)
          .margin({ top : 4 , left : 12 , right : 12 , bottom : 4 })

          // Row：水平布局容器
          // 关键属性：高度、宽度、圆角、背景色、外边距
          Row() {
            // Column：垂直布局容器
            // 关键属性：columnStyle、外轮廓
            Column() {
              // Text：文本
              // 关键属性：buttonTextStyle
              Text($r('app.string.outline_button')).id('outline_sample_text_28')
                .buttonTextStyle()
            }
            .columnStyle(48,16)
            .outline(this.mTextIsHover1 ?
              {
                width : 4 ,
                radius : 25 ,
                color : $r('app.color.border_color') ,
                style : OutlineStyle.SOLID
              } :
              {
                width : 0 ,
                radius : 25
              })
            .onHover((isHover) => {
              this.mTextIsHover1 = isHover;
            })
            .id('column1')

            // Column：垂直布局容器
            // 关键属性：columnStyle、外轮廓
            Column() {
              // Text：文本
              // 关键属性：buttonTextStyle
              Text($r('app.string.outline_button')).id('outline_sample_text_29')
                .buttonTextStyle()
            }
            .columnStyle(16,16)
            .outline(this.mTextIsHover2 ?
              {
                width : 4 ,
                radius : 25 ,
                color : $r('app.color.border_color') ,
                style : OutlineStyle.SOLID
              } :
              {
                width : 0 ,
                radius : 25
              })
            .onHover((isHover) => {
              this.mTextIsHover2 = isHover;
            })
            .id('column2')

            // Column：垂直布局容器
            // 关键属性：columnStyle、外轮廓
            Column() {
              // Text：文本
              // 关键属性：buttonTextStyle
              Text($r('app.string.outline_button')).id('outline_sample_text_30')
                .buttonTextStyle()
            }
            .columnStyle(16,48)
            .outline(this.mTextIsHover3 ?
              {
                width : 4 ,
                radius : 25 ,
                color : $r('app.color.border_color') ,
                style : OutlineStyle.SOLID
              } :
              {
                width : 0 ,
                radius : 25
              })
            .onHover((isHover) => {
              this.mTextIsHover3 = isHover;
            })
            .id('column3')
          }.id('outline_sample_row_27')
          .height(76)
          .width(456)
          .borderRadius(24)
          .backgroundColor(Color.White)
          .margin({ top : 4 , left : 12 , right : 12 })
        }.id('outline_sample_column_4')
        .constraintSize({ minHeight : '100%' }) // Let the minHeight of the component cover screen at least
      }.id('outline_sample_scroll_3')
    }.id('outline_sample_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}