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
 * @file entry/src/main/ets/pages/universal/properties/effectsSample/EffectsSample.ets
 * 文件职责：EffectsSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：cardStyle、subTitleStyle、colorPicker、pressedStyle、leftTitleStyle、Effects。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { BackgroundBlurChangePanel, ShadowChangePanel } from './ChangePanel';

const OFFSET_MIN = -40;

const OFFSET_MAX = 40;

/**
 * cardStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Column)
function cardStyle() {
  .backgroundColor($r('app.color.white'))
  .borderRadius(24)
  .width('100%')
  .padding(15)
  .margin({ bottom: 12 })
}

/**
 * subTitleStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Text)
function subTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
}

/**
 * colorPicker：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Circle)
function colorPicker(color: Color | string, callback: () => void) {
  .fill(color)
  .height(20)
  .width(20)
  .onClick(() => {
    callback()
  })
}

/**
 * pressedStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Styles
function pressedStyle() {
  .opacity(0.7)
  .borderWidth(1)
  .borderRadius(20)
}

/**
 * leftTitleStyle：函数定义，承载本文件对应的逻辑与数据。
 */
@Extend(Text)
function leftTitleStyle() {
  .fontSize(18)
  .width('100%')
  .direction(Direction.Ltr)
  .margin({ left: 24, top: 8, bottom: 8 })
  .fontColor($r('app.color.font_color_shallow'))
}

/**
 * Effects：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Effects {
  // @State mTabIndex：组件内部状态
  @State mTabIndex: number = 0;

  // @State mBlur：组件内部状态
  @State mBlur: number = 1;

  // @State mBackgroundBlur：组件内部状态
  @State mBackgroundBlur: number = 1;

  // @State mShadowRadius：组件内部状态
  @State mShadowRadius: number = 0;

  // @State mShadowColor：组件内部状态
  @State mShadowColor: Color = Color.Red;

  // @State mShadowOffsetX：组件内部状态
  @State mShadowOffsetX: number = -40;

  // @State mShadowOffsetY：组件内部状态
  @State mShadowOffsetY: number = -40;

  // @State mGrayscale：组件内部状态
  @State mGrayscale: number = 0;

  // @State mBrighthness：组件内部状态
  @State mBrighthness: number = 1;

  // @State mSaturate：组件内部状态
  @State mSaturate: number = 1;

  // @State mConstrast：组件内部状态
  @State mConstrast: number = 1;

  // @State mInvert：组件内部状态
  @State mInvert: number = 0;

  // @State mColorBlend：组件内部状态
  @State mColorBlend: Color | string = '#00ffffff';

  // @State mSepia：组件内部状态
  @State mSepia: number = 0;

  // @State mHueRotate：组件内部状态
  @State mHueRotate: number = 0;

  // @State mSphericalEffect：组件内部状态
  @State mSphericalEffect: number = 0;

  // @State mPixelStretchBottomEffect：组件内部状态
  @State mPixelStretchBottomEffect: number = 0;

  // @State mColorMode：组件内部状态
  @State mColorMode: ThemeColorMode = ThemeColorMode.SYSTEM;

  // @State mAdaptiveColor：组件内部状态
  @State mAdaptiveColor: AdaptiveColor = AdaptiveColor.DEFAULT;

  // @State mShadowType：组件内部状态
  @State mShadowType: ShadowType = ShadowType.COLOR;

  // @State mLightUpEffect：组件内部状态
  @State mLightUpEffect: number = 1;

  /**
   * tabbarTitle：执行 tabbarTitle 相关逻辑。
   */
  @Builder
  tabbarTitle(name: Resource, index: number) {
    // Stack：层叠布局容器
    // 关键属性：宽度、高度
    Stack() {
      // Text：文本
      // 关键属性：字号、字体颜色
      Text(name).id('effects_sample_text_2')
        .fontSize(22)
        .fontColor(this.mTabIndex === index ? $r('app.color.title_colorone') : $r('app.color.title_colortwo'))

      if (this.mTabIndex === index) {
        // Row：水平布局容器
        // 关键属性：背景色、宽度、高度、绝对定位
        Row().id('effects_sample_row_3')
          .backgroundColor($r('app.color.title_colorone'))
          .width('100%')
          .height(2)
          .position({ y: 48 })
      }
    }.id('effects_sample_stack_1').width(48)
    .height(56)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色、内边距
    Column({ space: 10 }) {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.components_effects') }).id('effects_sample_title_bar_5')
      // Tabs：页签容器
      // 关键属性：内容变更回调
      // 交互：输入/提交回调
      Tabs() {
        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle
        TabContent() {
          // Scroll：滚动容器
          // 关键属性：tabBar、tabbarTitle
          Scroll() {
            // Column：垂直布局容器
            // 关键属性：外边距、尺寸约束
            Column() {
              // Text：文本
              // 关键属性：leftTitleStyle
              Text($r('app.string.blur_effects')).id('effects_sample_text_10')
                .leftTitleStyle()
              // Column：垂直布局容器
              // 关键属性：cardStyle
              Column({ space: 5 }) {
                // Row：水平布局容器
                // 关键属性：宽度
                Row() {
                  // Text：文本
                  // 关键属性：字号、高度、布局权重、背景色、blur、宽度
                  Text($r('app.string.components_display_content')).id('effects_sample_text_13')
                    .fontSize(20)
                    .height(60)
                    .layoutWeight(1)
                    .backgroundColor(0xF9CF93)
                    .blur(this.mBlur)
                }.id('effects_sample_row_12').width('100%')

                // Text：文本
                // 关键属性：外边距、字号、自身对齐
                Text($r('app.string.blur_radius_modify')).id('effects_sample_text_14')
                  .margin({ top: 12 })
                  .fontSize(15)
                  .alignSelf(ItemAlign.Start)
                // Row：水平布局容器
                // 关键属性：宽度、cardStyle
                Row({ space: 5 }) {
                  // Text：文本
                  Text('0').id('effects_sample_text_16')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mBlur, min: 0, max: 20 }).id('effects_sample_slider_17')
                    .onChange((value) => {
                      this.mBlur = value
                    })
                    .width('90%')
                  // Text：文本
                  // 关键属性：宽度
                  Text('20').id('effects_sample_text_18')
                }.id('effects_sample_row_15').width('100%')
              }.id('effects_sample_column_11').cardStyle()

              // Text：文本
              // 关键属性：leftTitleStyle
              Text($r('app.string.background_blur')).id('effects_sample_text_19')
                .leftTitleStyle()
              // Column：垂直布局容器
              // 关键属性：cardStyle、宽度
              Column() {
                // Stack：层叠布局容器
                // 关键属性：背景图、backgroundImageSize、backdropBlur、宽度、高度
                Stack() {
                  // Text：文本
                  // 关键属性：字号、字体颜色
                  Text($r('app.string.components_display_content')).id('effects_sample_text_22')
                    .fontSize(20)
                    .fontColor(Color.Black)
                }.id('effects_sample_stack_21')
                .backgroundImage($r('app.media.icon'))
                .backgroundImageSize({ width: '100%', height: '100%' })
                .backdropBlur(this.mBackgroundBlur)
                .width('80%')
                .height(200)

                // Text：文本
                // 关键属性：外边距、字号、自身对齐
                Text($r('app.string.blur_radius_modify')).id('effects_sample_text_23')
                  .margin({ top: 12 })
                  .fontSize(15)
                  .alignSelf(ItemAlign.Start)
                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 5 }) {
                  // Text：文本
                  Text('0').id('effects_sample_text_25')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mBackgroundBlur, min: 0, max: 20 }).id('effects_sample_slider_26')
                    .onChange((value) => {
                      this.mBackgroundBlur = value
                    })
                    .width('90%')
                  // Text：文本
                  // 关键属性：宽度
                  Text('20').id('effects_sample_text_27')
                }.id('effects_sample_row_24').width('100%')

              }.id('effects_sample_column_20').cardStyle().width('100%')

              // Text：文本
              // 关键属性：leftTitleStyle
              Text($r('app.string.background_blur_style')).id('effects_sample_text_28')
                .leftTitleStyle()
              // Column：垂直布局容器
              // 关键属性：cardStyle、宽度
              Column() {
                // Column：垂直布局容器
                // 关键属性：高度、宽度、背景图、backgroundImageSize、外边距
                Column() {
                  // Row：水平布局容器
                  // 关键属性：宽度、高度、背景模糊
                  Row() {
                    // Text：文本
                    Text("Thin Material").id('effects_sample_text_32')
                  }.id('effects_sample_row_31')
                  .width('50%')
                  .height('50%')
                  .backgroundBlurStyle(BlurStyle.Thin, {
                    colorMode: this.mColorMode,
                    adaptiveColor: this.mAdaptiveColor,
                    scale: 1.0
                  })
                  .position({ x: '15%', y: '30%' })
                }.id('effects_sample_column_30')
                .height(200)
                .width('100%')
                .backgroundImage($r('app.media.img_test_1'))
                .backgroundImageSize(ImageSize.Cover)
                .margin({ bottom: 12 })

                // Row：水平布局容器
                // 关键属性：宽度、cardStyle
                Row({ space: 5 }) {
                  // BackgroundBlurChangePanel：BackgroundBlurChangePanel 自定义组件
                  // 关键属性：宽度
                  BackgroundBlurChangePanel({
                    mColorMode: $mColorMode,
                    mAdaptiveColor: $mAdaptiveColor
                  }).id('effects_sample_background_blur_change_panel_34')
                }.id('effects_sample_row_33').width('100%')
              }.id('effects_sample_column_29').cardStyle().width('100%')
            }.id('effects_sample_column_9')
            .margin({ bottom: 80 })
            .constraintSize({ minHeight: '100%' })
          }.id('effects_sample_scroll_8')
        }.id('effects_sample_tab_content_7').tabBar(this.tabbarTitle($r('app.string.blur'), 0))

        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle
        TabContent() {
          // Scroll：滚动容器
          // 关键属性：tabBar、tabbarTitle
          Scroll() {
            // Column：垂直布局容器
            // 关键属性：尺寸约束
            Column() {
              // Text：文本
              // 关键属性：leftTitleStyle
              Text($r('app.string.shadow_effects')).id('effects_sample_text_38')
                .leftTitleStyle()
              // Column：垂直布局容器
              // 关键属性：宽度、cardStyle
              Column({ space: 5 }) {
                // Stack：层叠布局容器
                // 关键属性：宽度、高度、自身对齐、阴影
                Stack() {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.shadow_effects_content')).id('effects_sample_text_41')
                    .fontSize(20)
                }.id('effects_sample_stack_40')
                .width('100%')
                .height(60)
                .alignSelf(ItemAlign.Start)
                .shadow({
                  radius: this.mShadowRadius,
                  color: this.mShadowColor,
                  offsetX: this.mShadowOffsetX,
                  offsetY: this.mShadowOffsetY,
                  type: this.mShadowType
                })
                .backgroundColor(0xF9CF93)

                // Text：文本
                // 关键属性：外边距、字号、自身对齐
                Text($r('app.string.blur_radius_modify')).id('effects_sample_text_42')
                  .margin({ top: 12 })
                  .fontSize(15)
                  .alignSelf(ItemAlign.Start)
                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 5 }) {
                  // Text：文本
                  Text('0').id('effects_sample_text_44')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mShadowRadius, min: 0, max: 20 })
                    .id("test_blur_radius_slider")
                    .onChange((value) => {
                      this.mShadowRadius = value
                    })
                    .width('90%')
                  // Text：文本
                  // 关键属性：宽度
                  Text('20').id('effects_sample_text_45')
                }.id('effects_sample_row_43').width('100%')

                // Text：文本
                // 关键属性：外边距、字号、自身对齐
                Text($r('app.string.x_offset')).id('effects_sample_text_46')
                  .margin({ top: 12 })
                  .fontSize(15)
                  .alignSelf(ItemAlign.Start)
                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 5 }) {
                  // Text：文本
                  Text($r('app.string.offset_min')).id('effects_sample_text_48')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mShadowOffsetX, min: OFFSET_MIN, max: OFFSET_MAX })
                    .id('effects_sample_slider_49')
                    .onChange((value) => {
                      this.mShadowOffsetX = value
                    })
                    .width('80%')
                  // Text：文本
                  // 关键属性：宽度
                  Text($r('app.string.offset_max')).id('effects_sample_text_50')
                }.id('effects_sample_row_47').width('100%')

                // Text：文本
                // 关键属性：外边距、字号、自身对齐
                Text($r('app.string.y_offset')).id('effects_sample_text_51')
                  .margin({ top: 12 })
                  .fontSize(15)
                  .alignSelf(ItemAlign.Start)
                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 5 }) {
                  // Text：文本
                  Text($r('app.string.offset_min')).id('effects_sample_text_53')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mShadowOffsetY, min: OFFSET_MIN, max: OFFSET_MAX })
                    .id('effects_sample_slider_54')
                    .onChange((value) => {
                      this.mShadowOffsetY = value
                    })
                    .width('80%')
                  // Text：文本
                  // 关键属性：宽度
                  Text($r('app.string.offset_max')).id('effects_sample_text_55')
                }.id('effects_sample_row_52').width('100%')

                // Row：水平布局容器
                // 关键属性：宽度、cardStyle
                Row({ space: 5 }) {
                  // ShadowChangePanel：ShadowChangePanel 自定义组件
                  ShadowChangePanel({
                    mShadowType: $mShadowType
                  }).id('effects_sample_shadow_change_panel_57')
                }.id('effects_sample_row_56')
              }.id('effects_sample_column_39').width('100%').cardStyle()
              .width('100%')
            }.id('effects_sample_column_37')
            .constraintSize({ minHeight: '100%' })
          }.id('effects_sample_scroll_36')
        }.id('effects_sample_tab_content_35').tabBar(this.tabbarTitle($r('app.string.shadow'), 1))

        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle、内容变更回调
        // 交互：输入/提交回调
        TabContent() {
          // Scroll：滚动容器
          // 关键属性：tabBar、tabbarTitle
          Scroll() {
            // Column：垂直布局容器
            // 关键属性：外边距、尺寸约束
            Column() {
              // Column：垂直布局容器
              // 关键属性：cardStyle
              Column() {
                // Stack：层叠布局容器
                // 关键属性：宽度、高度、lightUpEffect、sphericalEffect、pixelStretchEffect
                Stack() {
                  // Image：图片
                  // 关键属性：objectFit、宽度、高度
                  Image($r('app.media.icon')).id('effects_sample_image_63')
                    .objectFit(ImageFit.Contain)
                    .width('100%')
                    .height('100%')
                }.id('effects_sample_stack_62')
                .width('100%')
                .height(120)
                .lightUpEffect(this.mLightUpEffect)
                .sphericalEffect(this.mSphericalEffect)
                .pixelStretchEffect({
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: this.mPixelStretchBottomEffect
                })
                .alignSelf(ItemAlign.Start)
                .grayscale(this.mGrayscale)
                .brightness(this.mBrighthness)
                .saturate(this.mSaturate)
                .contrast(this.mConstrast)
                .invert(this.mInvert)
                .colorBlend(this.mColorBlend)
                .sepia(this.mSepia)
                .hueRotate(this.mHueRotate)

              }.id('effects_sample_column_61').cardStyle()

              // Text：文本
              // 关键属性：subTitleStyle、外边距
              Text($r('app.string.effects_display')).id('effects_sample_text_64')
                .subTitleStyle()
                .margin({ bottom: 20 })

              // Column：垂直布局容器
              // 关键属性：cardStyle、宽度
              Column({ space: 10 }) {
                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 5 }) {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.grayscale_change')).id('effects_sample_text_67')
                    .fontSize(15)
                  // Blank：占位空白
                  Blank().id('effects_sample_blank_68')
                  // Text：文本
                  Text('0').id('effects_sample_text_69')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mGrayscale, min: 0, max: 1, step: 0.1 }).id('effects_sample_slider_70')
                    .onChange((value) => {
                      this.mGrayscale = value
                    })
                    .showTips(true)
                    .width('60%')
                  // Text：文本
                  // 关键属性：宽度
                  Text('1').id('effects_sample_text_71')
                }.id('effects_sample_row_66').width('100%')

                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 5 }) {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.brightness_change')).id('effects_sample_text_73')
                    .fontSize(15)
                  // Blank：占位空白
                  Blank().id('effects_sample_blank_74')
                  // Text：文本
                  Text('0').id('effects_sample_text_75')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mBrighthness, min: 0, max: 2, step: 0.1 }).id('effects_sample_slider_76')
                    .onChange((value) => {
                      this.mBrighthness = value
                    })
                    .showTips(true)
                    .width('60%')
                  // Text：文本
                  // 关键属性：宽度
                  Text('2').id('effects_sample_text_77')
                }.id('effects_sample_row_72').width('100%')

                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 5 }) {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.saturate_change')).id('effects_sample_text_79')
                    .fontSize(15)
                  // Blank：占位空白
                  Blank().id('effects_sample_blank_80')
                  // Text：文本
                  Text('0').id('effects_sample_text_81')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mSaturate, min: 0, max: 2, step: 0.1 }).id('effects_sample_slider_82')
                    .onChange((value) => {
                      this.mSaturate = value
                    })
                    .showTips(true)
                    .width('60%')
                  // Text：文本
                  // 关键属性：宽度
                  Text('2').id('effects_sample_text_83')
                }.id('effects_sample_row_78').width('100%')

                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 5 }) {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.constrast_change')).id('effects_sample_text_85')
                    .fontSize(15)
                  // Blank：占位空白
                  Blank().id('effects_sample_blank_86')
                  // Text：文本
                  Text('0').id('effects_sample_text_87')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mConstrast, min: 0, max: 2, step: 0.1 }).id('effects_sample_slider_88')
                    .onChange((value) => {
                      this.mConstrast = value
                    })
                    .showTips(true)
                    .width('60%')
                  // Text：文本
                  // 关键属性：宽度
                  Text('2').id('effects_sample_text_89')
                }.id('effects_sample_row_84').width('100%')

                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 5 }) {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.invert_change')).id('effects_sample_text_91')
                    .fontSize(15)
                  // Blank：占位空白
                  Blank().id('effects_sample_blank_92')
                  // Text：文本
                  Text('0').id('effects_sample_text_93')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mInvert, min: 0, max: 2, step: 0.1 }).id('effects_sample_slider_94')
                    .onChange((value) => {
                      this.mInvert = value
                    })
                    .showTips(true)
                    .width('60%')
                  // Text：文本
                  // 关键属性：宽度
                  Text('2').id('effects_sample_text_95')
                }.id('effects_sample_row_90').width('100%')

                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 5 }) {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.sepia_change')).id('effects_sample_text_97')
                    .fontSize(15)
                  // Blank：占位空白
                  Blank().id('effects_sample_blank_98')
                  // Text：文本
                  Text('0').id('effects_sample_text_99')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mSepia, min: 0, max: 2, step: 0.1 }).id('effects_sample_slider_100')
                    .onChange((value) => {
                      this.mSepia = value
                    })
                    .showTips(true)
                    .width('60%')
                  // Text：文本
                  // 关键属性：宽度
                  Text('2').id('effects_sample_text_101')
                }.id('effects_sample_row_96').width('100%')

                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 5 }) {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.light_up_effect_change')).id('effects_sample_text_103')
                    .fontSize(15)
                  // Blank：占位空白
                  Blank().id('effects_sample_blank_104')
                  // Text：文本
                  Text('0').id('effects_sample_text_105')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mLightUpEffect, min: 0, max: 1, step: 0.1 }).id('effects_sample_slider_106')
                    .onChange((value) => {
                      this.mLightUpEffect = value
                    })
                    .showTips(true)
                    .width('60%')
                  // Text：文本
                  // 关键属性：宽度
                  Text('1').id('effects_sample_text_107')
                }.id('effects_sample_row_102').width('100%')

                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 5 }) {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.spherical_effect_change')).id('effects_sample_text_109')
                    .fontSize(15)
                  // Blank：占位空白
                  Blank().id('effects_sample_blank_110')
                  // Text：文本
                  Text('0').id('effects_sample_text_111')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mSphericalEffect, min: 0, max: 1, step: 0.1 }).id('effects_sample_slider_112')
                    .onChange((value) => {
                      this.mSphericalEffect = value
                    })
                    .showTips(true)
                    .width('60%')
                  // Text：文本
                  // 关键属性：宽度
                  Text('1').id('effects_sample_text_113')
                }.id('effects_sample_row_108').width('100%')

                // Row：水平布局容器
                // 关键属性：宽度
                Row({ space: 5 }) {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.pixel_stretch_effect_change')).id('effects_sample_text_115')
                    .fontSize(15)
                  // Blank：占位空白
                  Blank().id('effects_sample_blank_116')
                  // Text：文本
                  Text('0').id('effects_sample_text_117')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mPixelStretchBottomEffect, min: 0, max: 100, step: 1 })
                    .id('effects_sample_slider_118')
                    .onChange((value) => {
                      animateTo({ duration: 2000 }, () => {
                        this.mPixelStretchBottomEffect = value
                      })
                    })
                    .showTips(true)
                    .width('60%')
                  // Text：文本
                  // 关键属性：宽度
                  Text('100').id('effects_sample_text_119')
                }.id('effects_sample_row_114').width('100%')

                // Row：水平布局容器
                // 关键属性：宽度、高度
                Row({ space: 5 }) {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.hueRotate_change')).id('effects_sample_text_121')
                    .fontSize(15)
                  // Blank：占位空白
                  Blank().id('effects_sample_blank_122')
                  // Text：文本
                  Text('-180').id('effects_sample_text_123')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mHueRotate, min: -180, max: 180 }).id('effects_sample_slider_124')
                    .onChange((value) => {
                      this.mHueRotate = value
                    })
                    .showTips(true)
                    .width('60%')
                  // Text：文本
                  // 关键属性：宽度
                  Text('180').id('effects_sample_text_125')
                }.id('effects_sample_row_120').width('100%')
                .height(30)

                // Row：水平布局容器
                // 关键属性：宽度、cardStyle
                Row({ space: 5 }) {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.color_blend_change')).id('effects_sample_text_127')
                    .fontSize(15)
                  // Blank：占位空白
                  Blank().id('effects_sample_blank_128')
                  // Row：水平布局容器
                  // 关键属性：宽度、高度
                  Row() {
                    // Blank：占位空白
                    Blank().id('effects_sample_blank_130')
                    ForEach([Color.Transparent, Color.Red, Color.Yellow, Color.Pink, Color.Orange, Color.Green, Color.Blue], (item: Color) => {
                      // Circle：圆形
                      // 关键属性：colorPicker
                      Circle({ width: 20, height: 20 }).id('effects_sample_circle_131')
                        .colorPicker(item, () => {
                          this.mColorBlend = item
                        })
                        .stateStyles({
                          pressed: pressedStyle,
                          normal: {
                            .borderRadius(20)
                            .borderWidth(1)
                          }
                        })
                      // Blank：占位空白
                      Blank().id('effects_sample_blank_132')
                    })
                  }.id('effects_sample_row_129').width('70%')
                  .height(30)
                }.id('effects_sample_row_126').width('100%')
              }.id('effects_sample_column_65').cardStyle()
              .width('100%')
            }.id('effects_sample_column_60')
            .margin({ bottom: 80 })
            .constraintSize({ minHeight: '100%' })
          }.id('effects_sample_scroll_59')
        }.id('effects_sample_tab_content_58').tabBar(this.tabbarTitle($r('app.string.effects'), 2))
      }.id('effects_sample_tabs_6').onChange((index) => {
        this.mTabIndex = index
      })
    }.id('effects_sample_column_4')
    .width('100%')
    .height('100%')
    .backgroundColor(0xefefef)
    .padding({ left: 15, right: 15 })
  }
}