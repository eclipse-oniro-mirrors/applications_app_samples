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
 * @file entry/src/main/ets/pages/universal/properties/attributeModifierSample/AttributeModifierSample.ets
 * 文件职责：AttributeModifierSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MyButtonNormalModifier、MyButtonPressedModifier、MyListItemPressedModifier、MyButtonDisableModifier、
 *   MyRadioSelectModifier、MyButtonFocusModifier、MyCommonModifier、MyButtonInitUpdaterModifier、MyTextModifier、
 *   MyModifierImage、AttributeModifierSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import promptAction from '@ohos.prompt';
import { TitleBar } from '../../../../common/TitleBar';
import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { AttributeUpdater, CommonModifier } from '@ohos.arkui.modifier';

@Extend(Button) function MyButtonStyle() {
  .margin(8)
  .fontSize(16)
  .width('90%')
  .padding({ left: 12, right: 12, top: 8, bottom: 8 })
}

@Extend(Row) function rowStyle() {
  .padding(8)
  .borderRadius(24)
  .width('100%')
  .backgroundColor(Color.White)
  .margin({ left: 12, right: 12 })
}

@Extend(ListItem) function itemCardStyle() {
  .backgroundColor($r('app.color.background_grey'))
  .borderRadius(12)
  .width('100%')
  .padding(10)
}

/**
 * MyButtonNormalModifier：类定义，承载本文件对应的逻辑与数据。
 */
class MyButtonNormalModifier implements AttributeModifier<ButtonAttribute> {
  isBlue: boolean = false
  /**
   * applyNormalAttribute：执行 applyNormalAttribute 相关逻辑。
   */
  applyNormalAttribute(instance: ButtonAttribute): void {
    if (this.isBlue) {
      instance.backgroundColor(Color.Red);
    } else {
      instance.backgroundColor(Color.Blue);
    }
  }
}

/**
 * MyButtonPressedModifier：类定义，承载本文件对应的逻辑与数据。
 */
class MyButtonPressedModifier implements AttributeModifier<ButtonAttribute> {
  /**
   * applyNormalAttribute：执行 applyNormalAttribute 相关逻辑。
   */
  applyNormalAttribute(instance: ButtonAttribute): void {
      instance.backgroundColor(Color.Blue);
  }

  /**
   * applyPressedAttribute：执行 applyPressedAttribute 相关逻辑。
   */
  applyPressedAttribute(instance: ButtonAttribute): void {
      instance.backgroundColor(Color.Red);
  }
}

/**
 * MyListItemPressedModifier：类定义，承载本文件对应的逻辑与数据。
 */
class MyListItemPressedModifier implements AttributeModifier<ListItemAttribute> {
  /**
   * applyNormalAttribute：执行 applyNormalAttribute 相关逻辑。
   */
  applyNormalAttribute(instance: ListItemAttribute): void {
    instance.backgroundColor($r('app.color.background_grey'));
  }

  /**
   * applyPressedAttribute：执行 applyPressedAttribute 相关逻辑。
   */
  applyPressedAttribute(instance: ListItemAttribute): void {
    instance.backgroundColor(Color.Red);
  }
}

/**
 * MyButtonDisableModifier：类定义，承载本文件对应的逻辑与数据。
 */
class MyButtonDisableModifier implements AttributeModifier<ButtonAttribute> {
  /**
   * applyNormalAttribute：执行 applyNormalAttribute 相关逻辑。
   */
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.backgroundColor(Color.Blue);
  }

  /**
   * applyDisabledAttribute：执行 applyDisabledAttribute 相关逻辑。
   */
  applyDisabledAttribute(instance: ButtonAttribute): void {
    instance.backgroundColor(Color.Red);
  }
}

/**
 * MyRadioSelectModifier：类定义，承载本文件对应的逻辑与数据。
 */
class MyRadioSelectModifier implements AttributeModifier<RadioAttribute> {
  /**
   * applyNormalAttribute：执行 applyNormalAttribute 相关逻辑。
   */
  applyNormalAttribute(instance: RadioAttribute): void {
    instance.backgroundColor(Color.Blue);
  }

  /**
   * applySelectedAttribute：执行 applySelectedAttribute 相关逻辑。
   */
  applySelectedAttribute(instance: RadioAttribute): void {
    instance.radioStyle({
      checkedBackgroundColor: Color.Red
    })
  }
}

/**
 * MyButtonFocusModifier：类定义，承载本文件对应的逻辑与数据。
 */
class MyButtonFocusModifier implements AttributeModifier<ButtonAttribute> {
  /**
   * applyNormalAttribute：执行 applyNormalAttribute 相关逻辑。
   */
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.backgroundColor(Color.Blue);
  }

  /**
   * applyFocusedAttribute：执行 applyFocusedAttribute 相关逻辑。
   */
  applyFocusedAttribute(instance: ButtonAttribute): void {
    instance.backgroundColor(Color.Red);
  }
}

/**
 * MyCommonModifier：类定义，承载本文件对应的逻辑与数据。
 */
class MyCommonModifier extends CommonModifier {
  /**
   * applyNormalAttribute：执行 applyNormalAttribute 相关逻辑。
   */
  applyNormalAttribute(instance: CommonAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  /**
   * setFirstBorderStyle：执行 setFirstBorderStyle 相关逻辑。
   */
  public setFirstBorderStyle(): void {
    this.borderStyle(BorderStyle.Dotted);
    this.borderWidth(8);
  }

  /**
   * setSecondBorderStyle：执行 setSecondBorderStyle 相关逻辑。
   */
  public setSecondBorderStyle(): void {
    this.borderStyle(BorderStyle.Dashed);
    this.borderWidth(8);
  }
}

/**
 * MyButtonInitUpdaterModifier：类定义，承载本文件对应的逻辑与数据。
 */
class MyButtonInitUpdaterModifier extends AttributeUpdater<ButtonAttribute> {
  /**
   * initializeModifier：执行 initializeModifier 相关逻辑。
   */
  initializeModifier(instance: ButtonAttribute): void {
    instance.backgroundColor(Color.Blue)
      .width('100%');
  }
}

/**
 * MyTextModifier：类定义，承载本文件对应的逻辑与数据。
 */
class MyTextModifier extends AttributeUpdater<TextAttribute, TextInterface> {
  /**
   * initializeModifier：执行 initializeModifier 相关逻辑。
   */
  initializeModifier(instance: TextAttribute) {
  }
}

/**
 * MyModifierImage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
struct MyModifierImage {
  // @Link modifier：与父组件双向绑定的状态
  @Link modifier: CommonModifier;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Image：图片
    // 关键属性：attributeModifier
    Image($r("app.media.test_image"))
      .id('attribute_modifier_sample_image_1')
      .attributeModifier(this.modifier as MyCommonModifier);
  }
}

/**
 * AttributeModifierSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct AttributeModifierSample {
  // @State normalModifier：组件内部状态
  @State normalModifier: MyButtonNormalModifier = new MyButtonNormalModifier();

  // @State buttonPressModifier：组件内部状态
  @State buttonPressModifier: MyButtonPressedModifier = new MyButtonPressedModifier();

  // @State listItemPressModifier：组件内部状态
  @State listItemPressModifier: MyListItemPressedModifier = new MyListItemPressedModifier();

  // @State buttonIsDisabled：组件内部状态
  @State buttonIsDisabled: boolean = false;

  // @State disableModifier：组件内部状态
  @State disableModifier: MyButtonDisableModifier = new MyButtonDisableModifier();

  // @State selectValue：组件内部状态
  @State selectValue: boolean = false;

  // @State selectModifier：组件内部状态
  @State selectModifier: MyRadioSelectModifier = new MyRadioSelectModifier();

  // @State focusedModifier：组件内部状态
  @State focusedModifier: MyButtonFocusModifier = new MyButtonFocusModifier();

  // @State myModifier：组件内部状态
  @State myModifier: CommonModifier = new MyCommonModifier().width(100).height(100).margin(10);
  index: number = 0;
  initModifier: MyButtonInitUpdaterModifier = new MyButtonInitUpdaterModifier();
  textModifier: MyTextModifier = new MyTextModifier();

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.attribute_modifier') }).id('attribute_modifier_sample_title_bar_3')
      // Scroll：滚动容器
      Scroll() {
        // Row：水平布局容器
        // 关键属性：主轴对齐
        Row() {
          // Column：垂直布局容器
          Column() {
            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.select_to_see_status') })
              .id('attribute_modifier_sample_introduction_title_7')
            // Row：水平布局容器
            // 关键属性：主轴对齐、圆角、宽度、背景色、外边距、内边距
            Row({ space: 10 }) {
              // Radio：单选框
              // 关键属性：勾选状态、高度、宽度、边框宽度、圆角、attributeModifier
              // 交互：可点击交互
              Radio({ value: 'Radio1', group: 'radioGroup1' })
                .checked(this.selectValue)
                .height(40)
                .width(40)
                .borderWidth(0)
                .borderRadius(30)
                .id('radio1')
                .attributeModifier(this.selectModifier)
                .onClick(() => {
                  this.selectValue = !this.selectValue;
                })
            }.id('attribute_modifier_sample_row_8')
            .justifyContent(FlexAlign.Center)
            .borderRadius(24)
            .width('100%')
            .backgroundColor(Color.White)
            .margin({ left: 12, right: 12 })
            .padding({ left: 12 })

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.disable_to_see_status') })
              .id('attribute_modifier_sample_introduction_title_9')
            // Row：水平布局容器
            // 关键属性：主轴对齐、rowStyle、内边距
            Row({ space: 10 }) {
              // Text：文本
              // 关键属性：字号、外边距
              Text($r('app.string.button_disabled')).id('attribute_modifier_sample_text_11')
                .fontSize(18)
                .margin({ left: 12 })
              // Checkbox：复选框
              // 关键属性：select、内容变更回调
              // 交互：输入/提交回调
              Checkbox()
                .select(this.buttonIsDisabled)
                .id('checkbox1')
                .onChange((value: boolean) => {
                  this.buttonIsDisabled = value;
                })
              // Button：按钮
              // 关键属性：attributeModifier、是否可用、宽度、外边距、点击事件回调、showToast
              // 交互：可点击交互
              Button($r('app.string.component_id_disable_to_see_attributeModifier'))
                .attributeModifier(this.disableModifier)
                .enabled(!this.buttonIsDisabled)
                .id('disableButton')
                .width('65%')
                .margin({ right: 12, top: 8, bottom: 8 })
                .onClick(() => {
                  promptAction.showToast({
                    message: 'Button Clicked'
                  })
                })
            }.id('attribute_modifier_sample_row_10')
            .justifyContent(FlexAlign.SpaceBetween)
            .rowStyle()
            .padding({ left: 12, right: 12 })

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.click_to_see_status') })
              .id('attribute_modifier_sample_introduction_title_12')
            // Row：水平布局容器
            // 关键属性：主轴对齐、圆角、宽度、背景色、外边距
            Row({ space: 10 }) {
              // Button：按钮
              // 关键属性：MyButtonStyle、attributeModifier、点击事件回调
              // 交互：可点击交互
              Button($r('app.string.component_id_click_to_see_attributeModifier'))
                .MyButtonStyle()
                .id('clickButton')
                .attributeModifier(this.normalModifier)
                .onClick(() => {
                  this.normalModifier.isBlue = !this.normalModifier.isBlue;
                })
            }.id('attribute_modifier_sample_row_13')
            .justifyContent(FlexAlign.Center)
            .borderRadius(24)
            .width('100%')
            .backgroundColor(Color.White)
            .margin({ left: 12, right: 12 })

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.press_to_see_status') })
              .id('attribute_modifier_sample_introduction_title_14')
            // Column：垂直布局容器
            // 关键属性：主轴对齐、圆角、宽度、背景色、外边距
            Column({ space: 8 }) {
              // Button：按钮
              // 关键属性：MyButtonStyle、attributeModifier
              Button($r('app.string.component_id_press_to_see_attributeModifier'))
                .MyButtonStyle()
                .attributeModifier(this.buttonPressModifier)
                .id('longClickButton')

              // Row：水平布局容器
              Row() {
                // Text：文本
                // 关键属性：字号
                Text($r('app.string.component_id_press_list_to_see_attributeModifier'))
                  .id('attribute_modifier_sample_text_17')
                  .fontSize(18)
              }.id('attribute_modifier_sample_row_16')

              // List：列表容器
              // 关键属性：高度、宽度、背景色、内边距、圆角
              List({ space: 5 }) {
                ForEach([1, 2, 3, 4, 5, 6, 7, 8], (item: string) => {
                  // ListItem：列表项
                  // 关键属性：宽度、itemCardStyle、attributeModifier
                  ListItem() {
                    // Text：文本
                    // 关键属性：宽度、字号、文本对齐
                    Text(item + "").id('attribute_modifier_sample_text_19')
                      .width('100%')
                      .fontSize(18)
                      .textAlign(TextAlign.Center)
                  }
                  .id('ListItem' + item)
                  .width('100%')
                  .itemCardStyle()
                  .attributeModifier(this.listItemPressModifier)
                })
              }.id('attribute_modifier_sample_list_18')
              .height(150)
              .width('100%')
              .backgroundColor(Color.White)
              .padding({ left: 24, right: 24, bottom: 8, top: 8 })
              .borderRadius(24)
            }.id('attribute_modifier_sample_column_15')
            .justifyContent(FlexAlign.SpaceBetween)
            .borderRadius(24)
            .width('100%')
            .backgroundColor(Color.White)
            .margin({ left: 12, right: 12 })

            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.focus_control_tab_status') })
              .id('attribute_modifier_sample_introduction_title_20')
            // Row：水平布局容器
            // 关键属性：主轴对齐、rowStyle
            Row({ space: 20 }) {
              // Column：垂直布局容器
              // 关键属性：内边距、宽度、边框宽度、边框颜色、边框样式、外边距
              Column({ space: 5 }) {
                // Button：按钮
                // 关键属性：宽度、高度、字体颜色、attributeModifier、focusOnTouch
                Button($r('app.string.focus_control_group1'))
                  .id('focusButton1')
                  .width(195)
                  .height(40)
                  .fontColor(Color.White)
                  .attributeModifier(this.focusedModifier)
                  .focusOnTouch(true) // 该Button组件点击后可获焦
                // Row：水平布局容器
                Row({ space: 5 }) {
                  // Button：按钮
                  // 关键属性：宽度、高度、attributeModifier、字体颜色
                  Button()
                    .id('focusButton2')
                    .width(95)
                    .height(40)
                    .attributeModifier(this.focusedModifier)
                    .fontColor(Color.White)
                  // Button：按钮
                  // 关键属性：宽度、高度、attributeModifier、字体颜色、focusOnTouch
                  Button()
                    .id('focusButton3')
                    .width(95)
                    .height(40)
                    .attributeModifier(this.focusedModifier)
                    .fontColor(Color.White)
                    .focusOnTouch(true) // 该Button组件点击后可获焦
                }.id('attribute_modifier_sample_row_23')
              }.id('attribute_modifier_sample_column_22')
              .padding(5)
              .width('45%')
              .borderWidth(2)
              .borderColor(Color.Red)
              .borderStyle(BorderStyle.Dashed)
              .margin({ left: 12 })
              .tabIndex(1) // 该Column组件为按TAB键走焦的第一个获焦的组件

              // Column：垂直布局容器
              // 关键属性：内边距、外边距、宽度、边框宽度、边框颜色、边框样式
              Column({ space: 5 }) {
                // Button：按钮
                // 关键属性：宽度、高度、字体颜色
                Button($r('app.string.focus_control_group2')).id('attribute_modifier_sample_button_25')
                  .width(195)
                  .height(40)
                  .fontColor(Color.White)
                // Row：水平布局容器
                Row({ space: 5 }) {
                  // Button：按钮
                  // 关键属性：宽度、高度、字体颜色
                  Button().id('attribute_modifier_sample_button_27')
                    .width(95)
                    .height(40)
                    .fontColor(Color.White)
                  // Button：按钮
                  // 关键属性：宽度、高度、字体颜色、groupDefaultFocus
                  Button().id('attribute_modifier_sample_button_28')
                    .width(95)
                    .height(40)
                    .fontColor(Color.White)
                    .groupDefaultFocus(true) // 该Button组件上级Column组件获焦时获焦
                }.id('attribute_modifier_sample_row_26')
              }.id('attribute_modifier_sample_column_24')
              .padding(5)
              .margin({ right: 12 })
              .width('45%')
              .borderWidth(2)
              .borderColor(Color.Orange)
              .borderStyle(BorderStyle.Dashed)
              .tabIndex(2) // 该Column组件为按TAB键走焦的第二个获焦的组件
            }.id('attribute_modifier_sample_row_21')
            .justifyContent(FlexAlign.SpaceBetween)
            .rowStyle()

            // 组件属性动态设置，多个属性设置同时生效
            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.multiple_attribute_take_effect') })
              .id('attribute_modifier_sample_introduction_title_29')
            // Row：水平布局容器
            // 关键属性：主轴对齐
            Row({ space: 5 }) {
              // Column：垂直布局容器
              // 关键属性：宽度
              Column() {
                // 点击按钮查看图片边框变化
                // Button：按钮
                // 关键属性：MyButtonStyle、点击事件回调
                // 交互：可点击交互
                Button($r("app.string.click_to_see_image_border_change"))
                  .MyButtonStyle()
                  .id('clickButton2')
                  .onClick(() => {
                    this.index++;
                    if (this.index % 2 === 1) {
                      (this.myModifier as MyCommonModifier).setFirstBorderStyle();
                    } else {
                      (this.myModifier as MyCommonModifier).setSecondBorderStyle();
                    }
                  })
                // MyModifierImage：MyModifierImage 自定义组件
                MyModifierImage({ modifier: this.myModifier }).id('attribute_modifier_sample_my_modifier_image_32')
              }.id('attribute_modifier_sample_column_31')
              .width('100%')
            }.id('attribute_modifier_sample_row_30')
            .justifyContent(FlexAlign.Center)

            // 组件属性动态设置，非状态变量直接触发UI更新
            // IntroductionTitle：IntroductionTitle 自定义组件
            IntroductionTitle({ introduction: $r('app.string.dynamical_updates_ui_directly') })
              .id('attribute_modifier_sample_introduction_title_33')
            // Row：水平布局容器
            // 关键属性：主轴对齐、rowStyle、内边距
            Row({ space: 5 }) {
              // Column：垂直布局容器
              // 关键属性：宽度
              Column() {
                // 点击按钮，动态修改组件初始化设置的属性值
                // Button：按钮
                // 关键属性：MyButtonStyle、attributeModifier、点击事件回调
                // 交互：可点击交互
                Button($r("app.string.click_to_see_component_change"))
                  .MyButtonStyle()
                  .id('initButton')
                  .attributeModifier(this.initModifier)
                  .onClick(() => {
                    this.index++;
                    if (this.index % 2 === 1) {
                      this.initModifier.attribute?.backgroundColor(Color.Red).width('90%');
                    } else {
                      this.initModifier.attribute?.backgroundColor(Color.Pink).width('80%');
                    }
                  })
                // 点击更新Text组件构造入参"
                // Text：文本
                // 关键属性：attributeModifier、字体颜色、字号、边框、文本对齐、行高
                // 交互：可点击交互
                Text($r("app.string.click_to_see_text_component_change"))
                  .id('clickText')
                  .attributeModifier(this.textModifier)
                  .fontColor(Color.White)
                  .fontSize(14)
                  .border({ width: 1 })
                  .textAlign(TextAlign.Center)
                  .lineHeight(20)
                  .width(200)
                  .height(50)
                  .backgroundColor(Color.Blue)
                  .onClick(() => {
                    this.index++;
                    if (this.index % 2 === 1) {
                      this.textModifier.updateConstructorParams("Updated");
                    } else {
                      this.textModifier.updateConstructorParams("Initialize");
                    }
                  })
              }.id('attribute_modifier_sample_column_35')
              .width('100%')
            }.id('attribute_modifier_sample_row_34')
            .justifyContent(FlexAlign.Center)
            .rowStyle()
            .padding({ left: 12, right: 12, bottom: 100 })
          }.id('attribute_modifier_sample_column_6')
        }.id('attribute_modifier_sample_row_5')
        .justifyContent(FlexAlign.Center)
      }.id('attribute_modifier_sample_scroll_4')
    }.id('attribute_modifier_sample_column_2')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
