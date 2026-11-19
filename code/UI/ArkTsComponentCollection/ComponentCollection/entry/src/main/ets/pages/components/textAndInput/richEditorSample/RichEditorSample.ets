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
 * @file entry/src/main/ets/pages/components/textAndInput/richEditorSample/RichEditorSample.ets
 * 文件职责：RichEditorSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：RichEditorSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { Title } from './Title';

@Extend(Column) function cardStyle() {
  .backgroundColor(Color.White)
  .borderRadius(24)
  .width('100%')
  .padding(5)
}

/**
 * RichEditorSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct RichEditorSample {
  // @State setStyle：组件内部状态
  @State setStyle: Boolean = false;

  // @State setStyle1：组件内部状态
  @State setStyle1: Boolean = false;

  // @State setStyle2：组件内部状态
  @State setStyle2: Boolean = false;

  // @State setStyle3：组件内部状态
  @State setStyle3: Boolean = false;

  // @State setStyle4：组件内部状态
  @State setStyle4: Boolean = false;

  // @State setStyle5：组件内部状态
  @State setStyle5: Boolean = false;

  // @State setStyle6：组件内部状态
  @State setStyle6: Boolean = false;

  // @State styleDialog：组件内部状态
  @State styleDialog: Visibility = Visibility.None;

  // @State fontWeightSet：组件内部状态
  @State fontWeightSet: FontWeight = FontWeight.Normal;

  // @State fontStyleSet：组件内部状态
  @State fontStyleSet: FontStyle = FontStyle.Normal;

  // @State fontDecorationSet：组件内部状态
  @State fontDecorationSet: TextDecorationType = TextDecorationType.None;

  // @State fontAlignLeftSet：组件内部状态
  @State fontAlignLeftSet: TextAlign = TextAlign.Start;

  // @State fontAlignMiddleSet：组件内部状态
  @State fontAlignMiddleSet: TextAlign = TextAlign.Center;

  // @State fontAlignRightSet：组件内部状态
  @State fontAlignRightSet: TextAlign = TextAlign.End;

  // @State tipsValue：组件内部状态
  @State tipsValue: number = 32;
  private start: number = -1;
  private end: number = -1;
  private fontColors: string[] = ["#FA2A2D","#FFBF00","#41BA41","#00AAEE","#3F56EA","#8A2BE2","#000000"];

  controller: RichEditorController = new RichEditorController();

  /**
   * updateVisible：执行 updateVisible 相关逻辑。
   */
  updateVisible(){
    this.setStyle = !this.setStyle;
    // 分支：if(this.setStyle){
    if(this.setStyle){
      // 处理：this.styleDialog = Visibility.Visible;
      this.styleDialog = Visibility.Visible;
    }else{
      // 处理：this.styleDialog = Visibility.None;
      this.styleDialog = Visibility.None;
    }
  }

  /**
   * updateFontWeight：执行 updateFontWeight 相关逻辑。
   */
  updateFontWeight(){
    this.setStyle1 = !this.setStyle1;
    // 分支：if(this.setStyle1){
    if(this.setStyle1){
      // 处理：this.fontWeightSet = FontWeight.Bolder;
      this.fontWeightSet = FontWeight.Bolder;
    }else{
      // 处理：this.fontWeightSet = FontWeight.Normal;
      this.fontWeightSet = FontWeight.Normal;
    }
  }

  /**
   * updateFontStyle：执行 updateFontStyle 相关逻辑。
   */
  updateFontStyle(){
    this.setStyle2 = !this.setStyle2;
    // 分支：if(this.setStyle2){
    if(this.setStyle2){
      // 处理：this.fontStyleSet = FontStyle.Italic;
      this.fontStyleSet = FontStyle.Italic;
    }else{
      // 处理：this.fontStyleSet = FontStyle.Normal;
      this.fontStyleSet = FontStyle.Normal;
    }
  }

  /**
   * updateFontDecoration：执行 updateFontDecoration 相关逻辑。
   */
  updateFontDecoration(){
    this.setStyle3 = !this.setStyle3;
    // 分支：if(this.setStyle3){
    if(this.setStyle3){
      // 处理：this.fontDecorationSet = TextDecorationType.Unde
      this.fontDecorationSet = TextDecorationType.Underline;
    }else{
      // 处理：this.fontDecorationSet = TextDecorationType.None
      this.fontDecorationSet = TextDecorationType.None;
    }
  }

  /**
   * updateFontAlignLeft：执行 updateFontAlignLeft 相关逻辑。
   */
  updateFontAlignLeft(){
    this.setStyle4 = !this.setStyle4;
    // 分支：if(this.setStyle4){
    if(this.setStyle4){
      // 处理：this.fontAlignLeftSet = TextAlign.Start;
      this.fontAlignLeftSet = TextAlign.Start;
    }else{
      // 处理：this.fontAlignLeftSet = TextAlign.JUSTIFY;
      this.fontAlignLeftSet = TextAlign.JUSTIFY;
    }
  }

  /**
   * updateFontAlignMiddle：执行 updateFontAlignMiddle 相关逻辑。
   */
  updateFontAlignMiddle(){
    this.setStyle5 = !this.setStyle5;
    // 分支：if(this.setStyle5){
    if(this.setStyle5){
      // 处理：this.fontAlignMiddleSet = TextAlign.Center;
      this.fontAlignMiddleSet = TextAlign.Center;
    }else{
      // 处理：this.fontAlignMiddleSet = TextAlign.JUSTIFY;
      this.fontAlignMiddleSet = TextAlign.JUSTIFY;
    }
  }

  /**
   * updateFontAlignRight：执行 updateFontAlignRight 相关逻辑。
   */
  updateFontAlignRight(){
    this.setStyle6 = !this.setStyle6;
    // 分支：if(this.setStyle6){
    if(this.setStyle6){
      // 处理：this.fontAlignRightSet = TextAlign.End;
      this.fontAlignRightSet = TextAlign.End;
    }else{
      // 处理：this.fontAlignRightSet = TextAlign.JUSTIFY;
      this.fontAlignRightSet = TextAlign.JUSTIFY;
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.rich_editor_title') }).id('rich_editor_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：宽度、高度、背景色
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：交叉轴对齐、cardStyle、尺寸约束
        Column() {
          // Title：Title 自定义组件
          // 关键属性：高度
          Title({title:$r('app.string.rich_editor_title')}).id('rich_editor_sample_title_5')
            // height：设置高度
            .height("10%")
          // RichEditor：RichEditor 自定义组件
          // 关键属性：onReady、addTextSpan
          RichEditor({ controller: this.controller }).id('rich_editor_sample_rich_editor_6')
            .onReady(() => {
              // 处理：this.controller.addTextSpan("Hello World。\n" +
              this.controller.addTextSpan("Hello World。\n" +
                "Familiar images automatically give people a sense of calm and nostalgia. " +
                "Early web designers liked the elements of the 1980s, but today, the aesthetics of the 1990s.\n",
                {
                  style:
                  {
                    fontColor: Color.Black,
                    fontSize: 16
                  // 结束当前组件块
                  }
                // 结束当前组件块
                })
              // 处理：this.controller.addImageSpan($r("app.media.addPh
              this.controller.addImageSpan($r("app.media.addPhoto"),
                {
                  imageStyle:
                  {
                    size: ["100px", "54px"]
                  // 结束当前组件块
                  }
                // 结束当前组件块
                })
            // 结束当前组件块
            })
            // onSelect：绑定选择回调
            .onSelect((value: RichEditorSelection) => {
              // 处理：this.start = value.selection[0];
              this.start = value.selection[0];
              // 处理：this.end = value.selection[1];
              this.end = value.selection[1];
            // 结束当前组件块
            })
            // height：设置高度
            .height("50%")
            // width：设置宽度
            .width("100%")
          // Stack：层叠布局容器
          // 关键属性：高度
          Stack() {
            // Column：垂直布局容器
            // 关键属性：可见性、宽度、高度、外边距、层级、边框
            Column() {
              // Row：水平布局容器
              // 关键属性：高度、外边距
              Row({ space: 250 }) {
                // Text：文本
                // 关键属性：字号、内边距
                Text($r('app.string.rich_editor_style')).id('rich_editor_sample_text_10')
                  // fontSize：设置字号
                  .fontSize(14)
                  // padding：设置内边距
                  .padding({top:5})
                // Image：图片
                // 关键属性：宽度、高度、点击事件回调
                // 交互：可点击交互
                Image($r('app.media.ic_close')).id('rich_editor_sample_image_11')
                  // width：设置宽度
                  .width(25)
                  // height：设置高度
                  .height(25)
                  // onClick：绑定点击事件回调
                  .onClick(() => {
                    // 处理：this.styleDialog = Visibility.None
                    this.styleDialog = Visibility.None
                  // 结束当前组件块
                  })
              // 结束当前组件块
              }.id('rich_editor_sample_row_9').height(25)
              // margin：设置外边距
              .margin({bottom:10})

              // Row：水平布局容器
              // 关键属性：高度、外边距
              Row({ space: 38 }) {
                // Image：图片
                // 关键属性：宽度、高度、点击事件回调、updateFontWeight
                // 交互：可点击交互
                Image($r('app.media.ic_B_normal')).id('rich_editor_sample_image_13')
                  // width：设置宽度
                  .width(15)
                  // height：设置高度
                  .height(15)
                  // onClick：绑定点击事件回调
                  .onClick(() => {
                    // 处理：this.updateFontWeight()
                    this.updateFontWeight()
                    // 分支：if(this.end!=this.start){
                    if(this.end!=this.start){
                      // 处理：this.controller.updateSpanStyle({
                      this.controller.updateSpanStyle({
                        start: this.start,
                        end: this.end,
                        textStyle:
                        {
                          fontWeight: this.fontWeightSet
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      })
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  })
                // Image：图片
                // 关键属性：宽度、高度、点击事件回调、updateFontStyle
                // 交互：可点击交互
                Image($r('app.media.ic_I_normal')).id('rich_editor_sample_image_14')
                  // width：设置宽度
                  .width(15)
                  // height：设置高度
                  .height(15)
                  // onClick：绑定点击事件回调
                  .onClick(() => {
                    // 处理：this.updateFontStyle()
                    this.updateFontStyle()
                    if(this.end!=this.start) {
                      this.controller.updateSpanStyle({
                        start: this.start,
                        end: this.end,
                        textStyle:
                        {
                          fontStyle: this.fontStyleSet
                        }
                      })
                    }
                  })
                // Image：图片
                // 关键属性：宽度、高度、点击事件回调、updateFontDecoration
                // 交互：可点击交互
                Image($r('app.media.ic_U_normal')).id('rich_editor_sample_image_15')
                  .width(15)
                  .height(15)
                  .onClick(() => {
                    this.updateFontDecoration()
                    if(this.end!=this.start) {
                      this.controller.updateSpanStyle({
                        start: this.start,
                        end: this.end,
                        textStyle:
                        {
                          decoration: {
                            type: this.fontDecorationSet
                          }
                        }
                      })
                    }
                  })
                // Image：图片
                // 关键属性：宽度、高度、点击事件回调、updateFontAlignLeft
                // 交互：可点击交互
                Image($r('app.media.ic_left_normal')).id('rich_editor_sample_image_16')
                  .width(15)
                  .height(15)
                  .onClick(() => {
                    this.updateFontAlignLeft()
                    if(this.end!=this.start) {
                      this.controller.updateParagraphStyle({
                        start: this.start,
                        end: this.end,
                        style:
                        {
                          textAlign:this.fontAlignLeftSet
                        }
                      })
                    }
                  })
                // Image：图片
                // 关键属性：宽度、高度、点击事件回调、updateFontAlignMiddle
                // 交互：可点击交互
                Image($r('app.media.ic_middle_normal')).id('rich_editor_sample_image_17')
                  .width(15)
                  .height(15)
                  .onClick(() => {
                    this.updateFontAlignMiddle()
                    if(this.end!=this.start) {
                      this.controller.updateParagraphStyle({
                        start: this.start,
                        end: this.end,
                        style:
                        {
                          textAlign:this.fontAlignMiddleSet
                        }
                      })
                    }
                  })
                // Image：图片
                // 关键属性：宽度、高度、点击事件回调、updateFontAlignRight
                // 交互：可点击交互
                Image($r('app.media.ic_right_normal')).id('rich_editor_sample_image_18')
                  .width(15)
                  .height(15)
                  .onClick(() => {
                    this.updateFontAlignRight()
                    if(this.end!=this.start) {
                      this.controller.updateParagraphStyle({
                        start: this.start,
                        end: this.end,
                        style:
                        {
                          textAlign:this.fontAlignRightSet
                        }
                      })
                    }
                  })
              }.id('rich_editor_sample_row_12')
              .height(25)
              .margin({bottom:10})

              // Row：水平布局容器
              // 关键属性：高度、外边距
              Row({ space: 30 }) {
                ForEach(this.fontColors,(item: string) => {
                  // Circle：圆形
                  // 关键属性：fill、点击事件回调
                  // 交互：可点击交互
                  Circle({ width: 15, height: 15 }).id('rich_editor_sample_circle_20').fill(item)
                    .onClick(() => {
                      if(this.end!=this.start){
                        this.controller.updateSpanStyle({
                          start: this.start,
                          end: this.end,
                          textStyle:
                          {
                            fontColor: item
                          }
                        })
                      }
                    })
                })
              }.id('rich_editor_sample_row_19').height(25)
              .margin({bottom:10})

              // Row：水平布局容器
              // 关键属性：高度、外边距
              Row({ space: 30 }) {
                // Text：文本
                // 关键属性：宽度、高度、字号、字重、点击事件回调
                // 交互：可点击交互
                Text("Aa").id('rich_editor_sample_text_22')
                  .width(24)
                  .height(24)
                  .fontSize(11)
                  .fontWeight(400)
                  .onClick(() => {
                    this.tipsValue = this.tipsValue - 2
                    if(this.end!=this.start){
                      this.controller.updateSpanStyle({
                        start: this.start,
                        end: this.end,
                        textStyle:
                        {
                          fontSize: this.tipsValue/2
                        }
                      })
                    }
                  })
                // Slider：滑块
                // 关键属性：宽度、showTips、toFixed、内容变更回调
                // 交互：输入/提交回调
                Slider({ style: SliderStyle.InSet, value: this.tipsValue }).id('rich_editor_sample_slider_23')
                  .width(210)
                  .showTips(true, 'Size:' + this.tipsValue.toFixed())
                  .onChange(value => {
                    this.tipsValue = value
                    if(this.end!=this.start){
                      this.controller.updateSpanStyle({
                        start: this.start,
                        end: this.end,
                        textStyle:
                        {
                          fontSize: this.tipsValue/2
                        }
                      })
                    }
                  })
                // Text：文本
                // 关键属性：宽度、高度、字号、字重、点击事件回调
                // 交互：可点击交互
                Text("Aa").id('rich_editor_sample_text_24')
                  .width(24)
                  .height(24)
                  .fontSize(17)
                  .fontWeight(400)
                  .onClick(() => {
                    this.tipsValue = this.tipsValue + 2
                    if(this.end!=this.start){
                      this.controller.updateSpanStyle({
                        start: this.start,
                        end: this.end,
                        textStyle:
                        {
                          fontSize: this.tipsValue/2
                        }
                      })
                    }
                  })
              }.id('rich_editor_sample_row_21').height(25).margin({bottom:60})

            }.id('rich_editor_sample_column_8').visibility(this.styleDialog)
            .width("100%")
            .height("85%")
            .margin({bottom:"85%"})
            .zIndex(1)
            .border({
              radius: { topLeft: 15, topRight: 15 },
            })
            .backgroundColor($r('app.color.background_light_gray'))

            // Row：水平布局容器
            // 关键属性：内边距、主轴对齐、宽度、高度、层级
            Row({ space: 150 }) {
              // Image：图片
              // 关键属性：宽度、高度、点击事件回调、updateVisible
              // 交互：可点击交互
              Image($r('app.media.ic_textstyle_normal')).id('rich_editor_sample_image_26')
                .width(40)
                .height(40)
                .onClick(() => {
                  this.updateVisible()
                })
              // Image：图片
              // 关键属性：宽度、高度、点击事件回调、addImageSpan
              // 交互：可点击交互
              Image($r('app.media.ic_picture_normal')).id('rich_editor_sample_image_27')
                .width(35)
                .height(35)
                .onClick(() => {
                  this.controller.addImageSpan($r("app.media.addPhoto"),
                    {
                      imageStyle:
                      {
                        size: ["100px", "54px"]
                      }
                    })
                })
            }.id('rich_editor_sample_row_25')
            .padding({top:"50%"})
            .justifyContent(FlexAlign.Center)
            .width("100%")
            .height("15%")
            .zIndex(3)
          }.id('rich_editor_sample_stack_7').height("30%")
        }.id('rich_editor_sample_column_4')
        .alignItems(HorizontalAlign.Start)
        .cardStyle()
        .constraintSize({ minHeight: '100%' })
      }.id('rich_editor_sample_scroll_3')
      .width('95%')
      .height('80%')
      .backgroundColor($r('app.color.divider_block_color'))
    }.id('rich_editor_sample_column_1').height('100%')
    .width('100%')
    .backgroundColor($r('app.color.divider_block_color'))
    .padding({ left: 20, right: 20 })
  }
}
