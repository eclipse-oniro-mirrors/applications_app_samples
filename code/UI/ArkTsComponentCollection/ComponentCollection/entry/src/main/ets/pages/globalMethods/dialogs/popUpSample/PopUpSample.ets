/*
* Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

/**
 * @file entry/src/main/ets/pages/globalMethods/dialogs/popUpSample/PopUpSample.ets
 * 文件职责：PopUpSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PopUpSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import { IntroductionTitle } from '../../../../common/IntroductionTitle'

// Popup宽度
const POPUPWIDTH: number = 50;
// slider滑块最大值
const MAXWIDTH: number = 200;
// Popup border-radius值
const POPUPRADIUS: number = 20;

@Extend(Button) function myButtonStyle() {
  .fontFamily('HarmonyHeiTi-Medium')
  .fontColor('#FFFFFF')
  .fontSize(16)
  .fontWeight(500)
  .height('5.1%')
  .backgroundColor('#007DFF')
  .borderRadius(20)
}

@Extend(Text) function textStyle() {
  .fontFamily('HarmonyHeiTi-Medium')
  .fontColor('#182431')
  .fontWeight(500)
  .borderRadius(24)
}

/**
 * PopUpSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct PopUpSample {
  // @State popupWidth：组件内部状态
  @State popupWidth: number = POPUPWIDTH;

  // @State handlePopup：组件内部状态
  @State handlePopup: boolean = false;

  // @State customPopup：组件内部状态
  @State customPopup: boolean = false;

  // @State customPopupTop：组件内部状态
  @State customPopupTop: boolean = false;

  // @State customPopupBottom：组件内部状态
  @State customPopupBottom: boolean = false;

  // @State customPopupRight：组件内部状态
  @State customPopupRight: boolean = false;

  // @State customPopupLeft：组件内部状态
  @State customPopupLeft: boolean = false;

  // @State customPopupTopRight：组件内部状态
  @State customPopupTopRight: boolean = false;

  // @State customPopupTopLeft：组件内部状态
  @State customPopupTopLeft: boolean = false;

  // @State customPopupBottomRight：组件内部状态
  @State customPopupBottomRight: boolean = false;

  // @State customPopupBottomLeft：组件内部状态
  @State customPopupBottomLeft: boolean = false;

  // @State customPopupRightTop：组件内部状态
  @State customPopupRightTop: boolean = false;

  // @State customPopupLeftTop：组件内部状态
  @State customPopupLeftTop: boolean = false;

  // @State customPopupRightBottom：组件内部状态
  @State customPopupRightBottom: boolean = false;

  // @State customPopupLeftBottom：组件内部状态
  @State customPopupLeftBottom: boolean = false;

  // @State popUpText：组件内部状态
  @State popUpText: string = 'AAAA';

  // @State vpText：组件内部状态
  @State vpText: string = 'vp';

  // @State topText：组件内部状态
  @State topText: string = 'Top';

  // @State bottomText：组件内部状态
  @State bottomText: string = 'Bottom';

  // @State rightText：组件内部状态
  @State rightText: string = 'Right';

  // @State leftText：组件内部状态
  @State leftText: string = 'Left';

  // @State topRightText：组件内部状态
  @State topRightText: string = 'TopRight';

  // @State topLeftText：组件内部状态
  @State topLeftText: string = 'TopLeft';

  // @State bottomRightText：组件内部状态
  @State bottomRightText: string = 'BottomRight';

  // @State bottomLeftText：组件内部状态
  @State bottomLeftText: string = 'BottomLeft';

  // @State rightTopText：组件内部状态
  @State rightTopText: string = 'RightTop';

  // @State leftTopText：组件内部状态
  @State leftTopText: string = 'LeftTop';

  // @State rightBottomText：组件内部状态
  @State rightBottomText: string = 'RightBottom';

  // @State leftBottomText：组件内部状态
  @State leftBottomText: string = 'LeftBottom';

  // popup构造器定义弹框内容
  @Builder popupBuilder() {
    // Text：文本
    // 关键属性：字体、字号、字体颜色、文本对齐、行高、字重
    Text(this.popUpText).id('pop_up_sample_text_1')
      // fontFamily：设置字体族
      .fontFamily('HarmonyHeiTi')
      // fontSize：设置字号
      .fontSize(14)
      // fontColor：设置字体颜色
      .fontColor('#FFFFFF')
      // textAlign：设置文本对齐方式
      .textAlign(TextAlign.Start)
      // lineHeight：设置行高
      .lineHeight(19)
      // fontWeight：设置字重
      .fontWeight(400)
      // margin：设置外边距
      .margin({left:16, right: 16, top: 12.5, bottom: 12.5})
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度
    Column() {
      // TitleBar：TitleBar 自定义组件
      // 关键属性：背景色
      TitleBar({ title: $r('app.string.global_popUp_menu') }).id('pop_up_sample_title_bar_3')
        // backgroundColor：设置背景色
        .backgroundColor('#F1F3F5')
      // Scroll：滚动容器
      // 关键属性：背景色、高度、内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：背景色、尺寸约束、宽度、高度
        Column() {
          // Column：垂直布局容器
          // 关键属性：背景色、圆角、宽度
          Column() {
            // Row：水平布局容器
            // 关键属性：宽度
            Row() {
              // Text：文本
              // 关键属性：textStyle、文本对齐、外边距、字号、行高
              Text($r('app.string.popUp_width')).id('pop_up_sample_text_8')
                // textStyle：套用文本样式
                .textStyle()
                // textAlign：设置文本对齐方式
                .textAlign(TextAlign.Start)
                // margin：设置外边距
                .margin({ left: 12, top: 12 })
                // fontSize：设置字号
                .fontSize(16)
                // lineHeight：设置行高
                .lineHeight(22)

              // Blank：占位空白
              Blank().id('pop_up_sample_blank_9')

              // Text：文本
              // 关键属性：textStyle、文本对齐、外边距、字号、行高
              Text(Math.trunc(this.popupWidth) + this.vpText).id('pop_up_sample_text_10')
                // textStyle：套用文本样式
                .textStyle()
                // textAlign：设置文本对齐方式
                .textAlign(TextAlign.End)
                // margin：设置外边距
                .margin({ right: 12, top: 12 })
                // fontSize：设置字号
                .fontSize(14)
                // lineHeight：设置行高
                .lineHeight(19)

            // 结束当前组件块
            }.id('pop_up_sample_row_7')
            // width：设置宽度
            .width('100%')

            // Slider：滑块
            // 关键属性：外边距、内容变更回调
            // 交互：输入/提交回调
            Slider({
              style: SliderStyle.OutSet,
              value: this.popupWidth,
              step: 1,
              min: 0,
              max: MAXWIDTH
            // 结束当前组件块
            })
              .id('popup_slider')
              // margin：设置外边距
              .margin({ left: 6, right: 6 })
              // onChange：绑定内容变更回调
              .onChange(value => {
                // 处理：this.popupWidth = value;
                this.popupWidth = value;
              // 结束当前组件块
              })
          // 结束当前组件块
          }.id('pop_up_sample_column_6')
          // backgroundColor：设置背景色
          .backgroundColor('#ffffff')
          // borderRadius：设置圆角
          .borderRadius(24)
          // width：设置宽度
          .width('100%')

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.placement') }).id('pop_up_sample_introduction_title_11')

          // Column：垂直布局容器
          // 关键属性：背景色、圆角
          Column() {
            // Row：水平布局容器
            // 关键属性：宽度、外边距
            Row() {
              // Button：按钮
              // 关键属性：宽度、myButtonStyle、外边距、bindPopup
              Button(this.topText)
                .id('popup_top')
                // width：设置宽度
                .width('41.7%')
                .myButtonStyle()
                // margin：设置外边距
                .margin({ left: 12 })
                // bindPopup：绑定气泡弹窗
                .bindPopup(this.customPopupTop, {
                  builder: this.popupBuilder,
                  popupColor: '#4D4D4D',
                  radius: POPUPRADIUS,
                  placement: Placement.Top,
                  width: this.popupWidth,
                  onStateChange: (e) => {
                    // 分支：if (!e.isVisible) {
                    if (!e.isVisible) {
                      // 处理：this.customPopupTop = false;
                      this.customPopupTop = false;
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                })
                // onClick：绑定点击事件回调
                .onClick(() => {
                  // 处理：this.customPopupTop = !this.customPopupTop;
                  this.customPopupTop = !this.customPopupTop;
                // 结束当前组件块
                })
              // Blank：占位空白
              Blank().id('pop_up_sample_blank_14')
              // Button：按钮
              // 关键属性：宽度、myButtonStyle、外边距、bindPopup
              Button(this.bottomText)
                .id('popup_bottom')
                // width：设置宽度
                .width('41.7%')
                .myButtonStyle()
                // margin：设置外边距
                .margin({ right: 12 })
                // bindPopup：绑定气泡弹窗
                .bindPopup(this.customPopupBottom, {
                  builder: this.popupBuilder,
                  popupColor: '#4D4D4D',
                  radius: POPUPRADIUS,
                  enableArrow: true,
                  shadow: ShadowStyle.OUTER_DEFAULT_XS,
                  placement: Placement.Bottom,
                  width: this.popupWidth,
                  onStateChange: (e) => {
                    // 分支：if (!e.isVisible) {
                    if (!e.isVisible) {
                      // 处理：this.customPopupBottom = false;
                      this.customPopupBottom = false;
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                })
                // onClick：绑定点击事件回调
                .onClick(() => {
                  // 处理：this.customPopupBottom = !this.customPopupBottom
                  this.customPopupBottom = !this.customPopupBottom;
                // 结束当前组件块
                })
            // 结束当前组件块
            }.id('pop_up_sample_row_13')
            // width：设置宽度
            .width('100%')
            // margin：设置外边距
            .margin({ left: 12, right: 12, top: 16, bottom: 12 })

            // Row：水平布局容器
            // 关键属性：宽度、外边距
            Row() {
              // Button：按钮
              // 关键属性：宽度、myButtonStyle、外边距、bindPopup
              Button(this.rightText)
                .id('popup_right')
                // width：设置宽度
                .width('41.7%')
                .myButtonStyle()
                // margin：设置外边距
                .margin({ left: 12 })
                // bindPopup：绑定气泡弹窗
                .bindPopup(this.customPopupRight, {
                  builder: this.popupBuilder,
                  popupColor: '#4D4D4D',
                  radius: POPUPRADIUS,
                  enableArrow: true,
                  shadow: ShadowStyle.OUTER_DEFAULT_XS,
                  placement: Placement.Right,
                  width: this.popupWidth,
                  onStateChange: (e) => {
                    // 分支：if (!e.isVisible) {
                    if (!e.isVisible) {
                      // 处理：this.customPopupRight = false;
                      this.customPopupRight = false;
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                })
                // onClick：绑定点击事件回调
                .onClick(() => {
                  // 处理：this.customPopupRight = !this.customPopupRight;
                  this.customPopupRight = !this.customPopupRight;
                // 结束当前组件块
                })
              // Blank：占位空白
              Blank().id('pop_up_sample_blank_16')
              // Button：按钮
              // 关键属性：宽度、myButtonStyle、外边距、bindPopup
              Button(this.leftText)
                .id('popup_left')
                // width：设置宽度
                .width('41.7%')
                .myButtonStyle()
                // margin：设置外边距
                .margin({ right: 12 })
                // bindPopup：绑定气泡弹窗
                .bindPopup(this.customPopupLeft, {
                  builder: this.popupBuilder,
                  popupColor: '#4D4D4D',
                  radius: POPUPRADIUS,
                  enableArrow: true,
                  shadow: ShadowStyle.OUTER_DEFAULT_XS,
                  placement: Placement.Left,
                  width: this.popupWidth,
                  onStateChange: (e) => {
                    // 分支：if (!e.isVisible) {
                    if (!e.isVisible) {
                      // 处理：this.customPopupLeft = false;
                      this.customPopupLeft = false;
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                })
                // onClick：绑定点击事件回调
                .onClick(() => {
                  // 处理：this.customPopupLeft = !this.customPopupLeft;
                  this.customPopupLeft = !this.customPopupLeft;
                // 结束当前组件块
                })
            // 结束当前组件块
            }.id('pop_up_sample_row_15')
            // width：设置宽度
            .width('100%')
            // margin：设置外边距
            .margin({ left: 12, right: 12, bottom: 12 })

            // Row：水平布局容器
            // 关键属性：宽度、外边距
            Row() {
              // Button：按钮
              // 关键属性：宽度、myButtonStyle、外边距、bindPopup
              Button(this.topRightText)
                .id('popup_topRight')
                // width：设置宽度
                .width('41.7%')
                .myButtonStyle()
                // margin：设置外边距
                .margin({ left: 12 })
                // bindPopup：绑定气泡弹窗
                .bindPopup(this.customPopupTopRight, {
                  builder: this.popupBuilder,
                  popupColor: '#4D4D4D',
                  radius: POPUPRADIUS,
                  enableArrow: true,
                  shadow: ShadowStyle.OUTER_DEFAULT_XS,
                  placement: Placement.TopRight,
                  width: this.popupWidth,
                  onStateChange: (e) => {
                    // 分支：if (!e.isVisible) {
                    if (!e.isVisible) {
                      // 处理：this.customPopupTopRight = false;
                      this.customPopupTopRight = false;
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                })
                // onClick：绑定点击事件回调
                .onClick(() => {
                  // 处理：this.customPopupTopRight = !this.customPopupTopR
                  this.customPopupTopRight = !this.customPopupTopRight;
                // 结束当前组件块
                })
              // Blank：占位空白
              Blank().id('pop_up_sample_blank_18')
              // Button：按钮
              // 关键属性：宽度、myButtonStyle、外边距、bindPopup
              Button(this.topLeftText)
                .id('popup_topLeft')
                // width：设置宽度
                .width('41.7%')
                .myButtonStyle()
                // margin：设置外边距
                .margin({ right: 12 })
                // bindPopup：绑定气泡弹窗
                .bindPopup(this.customPopupTopLeft, {
                  builder: this.popupBuilder,
                  popupColor: '#4D4D4D',
                  radius: POPUPRADIUS,
                  enableArrow: true,
                  shadow: ShadowStyle.OUTER_DEFAULT_XS,
                  placement: Placement.TopLeft,
                  width: this.popupWidth,
                  onStateChange: (e) => {
                    // 分支：if (!e.isVisible) {
                    if (!e.isVisible) {
                      // 处理：this.customPopupTopLeft = false;
                      this.customPopupTopLeft = false;
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  }
                })
                .onClick(() => {
                  this.customPopupTopLeft = !this.customPopupTopLeft;
                })
            }.id('pop_up_sample_row_17')
            .width('100%')
            .margin({ left: 12, right: 12, bottom: 12 })

            // Row：水平布局容器
            // 关键属性：宽度、外边距
            Row() {
              // Button：按钮
              // 关键属性：宽度、myButtonStyle、外边距、bindPopup
              Button(this.bottomRightText)
                .id('popup_bottomRight')
                .width('41.7%')
                .myButtonStyle()
                .margin({ left: 12 })
                .bindPopup(this.customPopupBottomRight, {
                  builder: this.popupBuilder,
                  popupColor: '#4D4D4D',
                  radius: POPUPRADIUS,
                  enableArrow: true,
                  shadow: ShadowStyle.OUTER_DEFAULT_XS,
                  placement: Placement.BottomRight,
                  width: this.popupWidth,
                  onStateChange: (e) => {
                    if (!e.isVisible) {
                      this.customPopupBottomRight = false;
                    }
                  }
                })
                .onClick(() => {
                  this.customPopupBottomRight = !this.customPopupBottomRight;
                })
              // Blank：占位空白
              Blank().id('pop_up_sample_blank_20')
              // Button：按钮
              // 关键属性：宽度、myButtonStyle、外边距、bindPopup
              Button(this.bottomLeftText)
                .id('popup_bottomLeft')
                .width('41.7%')
                .myButtonStyle()
                .margin({ right: 12 })
                .bindPopup(this.customPopupBottomLeft, {
                  builder: this.popupBuilder,
                  popupColor: '#4D4D4D',
                  radius: POPUPRADIUS,
                  enableArrow: true,
                  shadow: ShadowStyle.OUTER_DEFAULT_XS,
                  placement: Placement.BottomLeft,
                  width: this.popupWidth,
                  onStateChange: (e) => {
                    if (!e.isVisible) {
                      this.customPopupBottomLeft = false;
                    }
                  }
                })
                .onClick(() => {
                  this.customPopupBottomLeft = !this.customPopupBottomLeft;
                })
            }.id('pop_up_sample_row_19')
            .width('100%')
            .margin({ left: 12, right: 12, bottom: 12 })

            // Row：水平布局容器
            // 关键属性：宽度、外边距
            Row() {
              // Button：按钮
              // 关键属性：宽度、myButtonStyle、外边距、bindPopup
              Button(this.rightTopText)
                .id('popup_rightTop')
                .width('41.7%')
                .myButtonStyle()
                .margin({ left: 12 })
                .bindPopup(this.customPopupRightTop, {
                  builder: this.popupBuilder,
                  popupColor: '#4D4D4D',
                  radius: POPUPRADIUS,
                  enableArrow: true,
                  shadow: ShadowStyle.OUTER_DEFAULT_XS,
                  placement: Placement.RightTop,
                  width: this.popupWidth,
                  onStateChange: (e) => {
                    if (!e.isVisible) {
                      this.customPopupRightTop = false;
                    }
                  }
                })
                .onClick(() => {
                  this.customPopupRightTop = !this.customPopupRightTop;
                })

              // Blank：占位空白
              Blank().id('pop_up_sample_blank_22')
              // Button：按钮
              // 关键属性：宽度、myButtonStyle、外边距、bindPopup
              Button(this.leftTopText)
                .id('popup_leftTop')
                .width('41.7%')
                .myButtonStyle()
                .margin({ right: 12 })
                .bindPopup(this.customPopupLeftTop, {
                  builder: this.popupBuilder,
                  popupColor: '#4D4D4D',
                  radius: POPUPRADIUS,
                  enableArrow: true,
                  shadow: ShadowStyle.OUTER_DEFAULT_XS,
                  placement: Placement.LeftTop,
                  width: this.popupWidth,
                  onStateChange: (e) => {
                    if (!e.isVisible) {
                      this.customPopupLeftTop = false;
                    }
                  }
                })
                .onClick(() => {
                  this.customPopupLeftTop = !this.customPopupLeftTop;
                })
            }.id('pop_up_sample_row_21')
            .width('100%')
            .margin({ left: 12, right: 12, bottom: 12 })

            // Row：水平布局容器
            // 关键属性：宽度、外边距
            Row() {
              // Button：按钮
              // 关键属性：宽度、myButtonStyle、外边距、bindPopup
              Button(this.rightBottomText)
                .id('popup_rightBottom')
                .width('41.7%')
                .myButtonStyle()
                .margin({ left: 12 })
                .bindPopup(this.customPopupRightBottom, {
                  builder: this.popupBuilder,
                  popupColor: '#4D4D4D',
                  radius: POPUPRADIUS,
                  enableArrow: true,
                  shadow: ShadowStyle.OUTER_DEFAULT_XS,
                  placement: Placement.RightBottom,
                  width: this.popupWidth,
                  onStateChange: (e) => {
                    if (!e.isVisible) {
                      this.customPopupRightBottom = false;
                    }
                  }
                })
                .onClick(() => {
                  this.customPopupRightBottom = !this.customPopupRightBottom;
                })
              // Blank：占位空白
              Blank().id('pop_up_sample_blank_24')
              // Button：按钮
              // 关键属性：宽度、myButtonStyle、外边距、bindPopup
              Button(this.leftBottomText)
                .id('popup_leftBottom')
                .width('41.7%')
                .myButtonStyle()
                .margin({ right: 12 })
                .bindPopup(this.customPopupLeftBottom, {
                  builder: this.popupBuilder,
                  popupColor: '#4D4D4D',
                  radius: POPUPRADIUS,
                  enableArrow: true,
                  shadow: ShadowStyle.OUTER_DEFAULT_XS,
                  placement: Placement.LeftBottom,
                  width: this.popupWidth,
                  onStateChange: (e) => {
                    if (!e.isVisible) {
                      this.customPopupLeftBottom = false;
                    }
                  }
                })
                .onClick(() => {
                  this.customPopupLeftBottom = !this.customPopupLeftBottom;
                })
            }.id('pop_up_sample_row_23')
            .width('100%')
            .margin({ left: 12, right: 12, bottom: 16 })

          }.id('pop_up_sample_column_12')
          .backgroundColor('#FFFFFF')
          .borderRadius(24)

          // Blank：占位空白
          Blank().id('pop_up_sample_blank_25')

          // Button：按钮
          // 关键属性：myButtonStyle、宽度、外边距、bindPopup
          Button($r('app.string.popUp_advanced_component'))
            .id('popup_advanced')
            .myButtonStyle()
            .width('86.7%')
            .margin({ left: 24, right: 24, bottom: 96 })
            .bindPopup(this.customPopup, {
              builder: this.popupBuilder,
              popupColor: '#4D4D4D',
              radius: POPUPRADIUS,
              enableArrow: true,
              shadow: ShadowStyle.OUTER_DEFAULT_XS,
              onStateChange: (e) => {
                if (!e.isVisible) {
                  this.customPopup = false;
                }
              }
            })
            .onClick(async () => {
              this.customPopup = !this.customPopup;
            })
        }.id('pop_up_sample_column_5')
        .backgroundColor('#f1f3f5')
        .constraintSize({ minHeight: '100%' }) // Let the minHeight of the component cover screen at least
        .width('100%')
        .height('100%')
      }.id('pop_up_sample_scroll_4')
      .backgroundColor('#f1f3f5')
      .height('100%')
      .padding({ left: 12, right: 12, bottom: 12, top: 12 })
    }.id('pop_up_sample_column_2')
    .width('100%')
  }
}