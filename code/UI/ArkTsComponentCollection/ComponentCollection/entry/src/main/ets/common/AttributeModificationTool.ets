/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/common/AttributeModificationTool.ets
 * 文件职责：AttributeModificationTool 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ResourceObjectType、CommonItemSlider、CommonItemTwoRowSlider、CommonItemSelect、CommonItemColorSelect、
 *   CommonItemColorSelectDef、CommonItemInput、CommonSwitcher、ImageItemSlider。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import common from '@ohos.app.ability.common'

const TOOL_WIDTH: SizeOptions = { width: 150, height: 38 }

/**
 * ResourceObjectType：类定义，承载本文件对应的逻辑与数据。
 */
class ResourceObjectType {
  value!: Resource;
}

/**
 * Slider in item style
 *
 * @param changeValue slide to change
 */
/**
 * CommonItemSlider：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct CommonItemSlider {
  // @Link changeValue：与父组件双向绑定的状态
  @Link changeValue: number;
  private min: number = 0;
  private max: number = 0;
  private name: ResourceStr = '';
  private step: number = 1;
  private testId: string = 'test_colorSelect';
  private vpTest: string = 'vp';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：宽度、高度、主轴对齐
    Row() {
      // Text：文本
      Text(this.name).id('attribute_modification_tool_text_1')
      // Slider：滑块
      // 关键属性：布局权重、内容变更回调
      // 交互：输入/提交回调
      Slider({
        value: this.changeValue,
        step: this.step,
        min: this.min,
        max: this.max })
        .id(this.testId)
        .layoutWeight(1)
        .onChange((value: number) => {
          this.changeValue = value
          console.log('Sample_ComponentCollection' + String(value))
        }).onClick((event: ClickEvent) => {
        let text = '  screenX:' + event.screenX + '  screenY:' + event.screenY
        console.log('Sample_ComponentCollection' + text)
      })
      // Text：文本
      Text(`${Math.trunc(this.changeValue)}` + this.vpTest).id('attribute_modification_tool_text_2')
    }
    .id(this.testId)
    .width('100%')
    .height(40)
    .justifyContent(FlexAlign.SpaceAround)
  }
}

/**
 *  New Slider style to two row
 *  Text Name at the top left of the slider
 *  ChangeValue at the top right of the slider
 * @param changeValue slide to change
 */
/**
 * CommonItemTwoRowSlider：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct CommonItemTwoRowSlider {
  // @Link changeValue：与父组件双向绑定的状态
  @Link changeValue: number;
  private min: number = 0;
  private max: number = 0;
  private name: ResourceStr = '';
  private step: number = 1;
  private testId: string = 'test_colorSelect';
  private vpTest: string = 'vp';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、主轴对齐
    Column() {
      // Row：水平布局容器
      // 关键属性：主轴对齐、外边距、宽度
      Row() {
        // Text：文本
        // 关键属性：字重、字体颜色、trunc
        Text(this.name).id('attribute_modification_tool_text_5')
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.font_color_black'))
        // Text：文本
        // 关键属性：字号、字体颜色
        Text(`${Math.trunc(this.changeValue)}` + this.vpTest).id('attribute_modification_tool_text_6')
          .fontSize(14)
          .fontColor($r('app.color.font_color_grey'))
      }.id('attribute_modification_tool_row_4')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: 4 })
      .width('100%')

      // Slider：滑块
      // 关键属性：宽度、内容变更回调
      // 交互：输入/提交回调
      Slider({
        value: this.changeValue,
        step: this.step,
        min: this.min,
        max: this.max })
        .id(this.testId)
        .width('100%')
        .onChange((value: number) => {
          this.changeValue = value
          console.log('Sample_ComponentCollection' + String(value))
        }).onClick((event: ClickEvent) => {
        let text = '  screenX:' + event.screenX + '  screenY:' + event.screenY
        console.log('Sample_ComponentCollection' + text)
      })
    }.id('attribute_modification_tool_column_3')
    .width('100%')
    .height(60)
    .justifyContent(FlexAlign.SpaceAround)
  }
}

/**
 * Select in item style, provide multiple choices based on menuList
 */
/**
 * CommonItemSelect：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct CommonItemSelect {
  private selects: ResourceStr[] = [];
  private callback: (index: number, value: string) => void = (index: number, value: string) => {};
  private selectOption: SelectOption[] = [];
  private name: ResourceStr = '';
  private testId: string = 'test_itemSelect';
  private selectIndex: number = 0;
  private fontSize: Font = { size: 15, weight: FontWeight.Medium };
  private isItemStyle: boolean = true;
  private text: string = "请选择";
  private menuAlignType: MenuAlignType = MenuAlignType.START;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    this.selects.forEach((selects, index) => {
      this.selectOption[index] = { value: selects }
    })
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：宽度、尺寸约束、内边距、圆角、背景色、主轴对齐
    Row() {
      // Text：文本
      // 关键属性：字重、字体颜色、最大行数、尺寸约束、外边距
      Text(this.name).id('attribute_modification_tool_text_8')
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.font_color_black'))
        .maxLines(2)
        .constraintSize({ maxWidth: '75%' })
        .margin({ left: this.isItemStyle ? 0 : 12, right: this.isItemStyle ? 0 : 12, top: 8, bottom: 8 })
      // Select：下拉选择器
      // 关键属性：当前值、背景色、圆角、选中状态、font、optionFont
      Select(this.selectOption)
        .id(this.testId)
        .value(this.text)
        .backgroundColor(Color.White)
        .borderRadius(19)
        .selected(this.selectIndex)
        .font(this.fontSize)
        .optionFont(this.fontSize)
        .menuAlign(this.menuAlignType)
        .onSelect((index, value) => {
          this.callback(index, value)
          this.selectIndex = index
        })
    }.id('attribute_modification_tool_row_7')
    .width('100%')
    .constraintSize({ minHeight: this.isItemStyle ? 48 : 70 })
    .padding({ left: this.isItemStyle ? 0 : 12, right: this.isItemStyle ? 0 : 12 })
    .borderRadius(this.isItemStyle ? 0 : 24)
    .backgroundColor(this.isItemStyle ? Color.Transparent : Color.White)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

/**
 * Select Color
 *
 * @param color change color
 */
/**
 * CommonItemColorSelect：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct CommonItemColorSelect {
  // @Link selectColor：与父组件双向绑定的状态
  @Link selectColor: Resource;

  // @State selectIndex：组件内部状态
  @State selectIndex: number = 0;
  private testId: string = 'test_colorSelect';
  private name!: Resource;
  private isItemStyle: boolean = true;
  private colorNames: Array<ResourceObjectType> = [{ value: $r('app.string.divider_color_blue') }, {
    value: $r('app.string.divider_color_green')
  }, { value: $r('app.string.divider_color_orange') }, { value: $r('app.string.divider_color_pink') }];

  /**
   * changeResourceToString：执行 changeResourceToString 相关逻辑。
   */
  changeResourceToString(resourceData: Resource) {
    let context = getContext(this) as common.UIAbilityContext
    return context.resourceManager.getStringSync(resourceData.id)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：外边距、圆角、尺寸、内边距、背景色
    Row() {
      // Text：文本
      // 关键属性：外边距
      Text(this.name).id('attribute_modification_tool_text_10')
        .margin({ left: this.isItemStyle ? 0 : 12, right: this.isItemStyle ? 0 : 12 })
      // Blank：占位空白
      Blank().id('attribute_modification_tool_blank_11')
      // Select：下拉选择器
      // 关键属性：当前值、changeResourceToString、圆角、font、optionFont、尺寸约束
      Select(this.colorNames)
        .value(this.changeResourceToString(this.colorNames[this.selectIndex].value))
        .borderRadius(19)
        .font({ size: 20 })
        .optionFont({ size: 20 })
        .constraintSize({ minWidth: 150 })
        .selected(this.selectIndex)
        .selectedOptionFont({ size: 20 })
        .backgroundColor($r('app.color.background_shallow_grey'))
        .padding({ left: 20, right: 20, top: 8, bottom: 8 })
        .onSelect((index) => {
          this.selectIndex = index
          switch (index) {
            case 0:
              this.selectColor = $r('app.color.background_blue')
              break
            case 1:
              this.selectColor = $r('app.color.background_green')
              break
            case 2:
              this.selectColor = $r('app.color.background_orange')
              break
            case 3:
              this.selectColor = $r('app.color.background_pink')
              break
            default:
              this.selectColor = $r('app.color.background_dark')
          }
        })
        .id(this.testId)
    }.id('attribute_modification_tool_row_9')
    .margin({ bottom: 6 })
    .borderRadius(this.isItemStyle ? 0 : 24)
    .size({ width: '100%', height: this.isItemStyle ? 42 : 70 })
    .padding({ left: this.isItemStyle ? 0 : 12, right: this.isItemStyle ? 0 : 12 })
    .backgroundColor(this.isItemStyle ? Color.Transparent : Color.White)
  }
}

/**
 * Select Color
 *
 * @param color change color
 */
/**
 * CommonItemColorSelectDef：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct CommonItemColorSelectDef {
  // @Link selectColor：与父组件双向绑定的状态
  @Link selectColor: Color;

  // @State selectIndex：组件内部状态
  @State selectIndex: number = 0;
  private testId: string = 'test_colorSelect_def';
  private name!: Resource;
  private isItemStyle: boolean = true;
  private colorNames: Array<ResourceObjectType> = [{ value: $r('app.string.divider_color_blue') }, {
    value: $r('app.string.divider_color_green')
  }, { value: $r('app.string.divider_color_orange') }, { value: $r('app.string.divider_color_pink') }];

  /**
   * changeResourceToString：执行 changeResourceToString 相关逻辑。
   */
  changeResourceToString(resourceData: Resource) {
    let context = getContext(this) as common.UIAbilityContext
    return context.resourceManager.getStringSync(resourceData.id)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：外边距、圆角、尺寸、内边距、背景色
    Row() {
      // Text：文本
      // 关键属性：外边距
      Text(this.name).id('attribute_modification_tool_text_13')
        .margin({ left: this.isItemStyle ? 0 : 12, right: this.isItemStyle ? 0 : 12 })
      // Blank：占位空白
      Blank().id('attribute_modification_tool_blank_14')
      // Select：下拉选择器
      // 关键属性：当前值、changeResourceToString、圆角、font、optionFont、尺寸约束
      Select(this.colorNames)
        .value(this.changeResourceToString(this.colorNames[this.selectIndex].value))
        .borderRadius(19)
        .font({ size: 20 })
        .optionFont({ size: 20 })
        .constraintSize({ minWidth: 150 })
        .selected(this.selectIndex)
        .selectedOptionFont({ size: 20 })
        .backgroundColor($r('app.color.background_shallow_grey'))
        .padding({ left: 20, right: 20, top: 8, bottom: 8 })
        .onSelect((index) => {
          console.log("selectColor index : " + index)
          this.selectIndex = index
          switch (index) {
            case 0:
              this.selectColor = Color.Blue
              break
            case 1:
              this.selectColor = Color.Green
              break
            case 2:
              this.selectColor = Color.Orange
              break
            case 3:
              this.selectColor = Color.Pink
              break
            default:
              this.selectColor = Color.Black
          }
        })
        .id(this.testId)
    }.id('attribute_modification_tool_row_12')
    .margin({ bottom: 6 })
    .borderRadius(this.isItemStyle ? 0 : 24)
    .size({ width: '100%', height: this.isItemStyle ? 42 : 70 })
    .padding({ left: this.isItemStyle ? 0 : 12, right: this.isItemStyle ? 0 : 12 })
    .backgroundColor(this.isItemStyle ? Color.Transparent : Color.White)
  }
}

/**
 * TextInput of change panel
 *
 * @param inputValue change inputValue
 */
/**
 * CommonItemInput：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct CommonItemInput {
  // @Link inputValue：与父组件双向绑定的状态
  @Link inputValue: string;
  private name!: Resource;
  private placeholder?: ResourceStr = '';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：尺寸、内边距、圆角、背景色、外边距
    Row() {
      // Text：文本
      // 关键属性：外边距
      Text(this.name).id('attribute_modification_tool_text_16')
        .margin({ left: 12, right: 12 })
      // Blank：占位空白
      Blank().id('attribute_modification_tool_blank_17')
      // TextInput：单行输入框
      // 关键属性：尺寸、内容变更回调
      // 交互：输入/提交回调
      TextInput({ placeholder: this.placeholder })
        .size(TOOL_WIDTH)
        .onChange(value => {
          this.inputValue = value
        }).id('test_input')
        .enableKeyboardOnFocus(false)
    }.id('attribute_modification_tool_row_15')
    .size({ width: '100%', height: 70 })
    .padding({ left: 12, right: 12 })
    .borderRadius(24)
    .backgroundColor($r('app.color.white'))
    .margin({ top: 12, bottom: 12 })
  }
}

/**
 * CommonSwitcher：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct CommonSwitcher {
  // @Link bool：与父组件双向绑定的状态
  @Link bool: boolean;
  private name: ResourceStr = '';
  private testId: string = '';
  private testID: string = '';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：宽度、尺寸约束、主轴对齐
    Row() {
      // Text：文本
      // 关键属性：字重、字体颜色、最大行数、尺寸约束、外边距
      Text(this.name).id('attribute_modification_tool_text_19')
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.font_color_black'))
        .maxLines(2)
        .constraintSize({ maxWidth: '85%' })
        .margin({ top: 8, bottom: 8 })
      // Toggle：开关
      // 关键属性：内容变更回调
      // 交互：输入/提交回调
      Toggle({ type: ToggleType.Switch, isOn: this.bool })
        .onChange((isOn) => {
          this.bool = isOn
        })
        .id(this.testId || this.testID)
    }.id('attribute_modification_tool_row_18')
    .width('100%')
    .constraintSize({ minHeight: 48 })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

/**
 * ImageItemSlider：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ImageItemSlider {
  // @Link changeValue：与父组件双向绑定的状态
  @Link changeValue: number;
  private min: number = 0;
  private max: number = 0;
  private name: ResourceStr = '';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：宽度、高度、主轴对齐
    Row() {
      // Text：文本
      Text(this.name).id('attribute_modification_tool_text_21')
      // Slider：滑块
      // 关键属性：布局权重、内容变更回调
      // 交互：输入/提交回调
      Slider({
        value: this.changeValue,
        step: 1,
        min: this.min,
        max: this.max }).id('attribute_modification_tool_slider_22')
        .layoutWeight(1)
        .onChange((value: number) => {
          this.changeValue = value
          console.log('Sample_ComponentCollection' + String(value))
        }).onClick((event: ClickEvent) => {
        let text = '  screenX:' + event.screenX + '  screenY:' + event.screenY
        console.log('Sample_ComponentCollection' + text)
      })
      // Text：文本
      Text(`${Math.trunc(this.changeValue)}`).id('attribute_modification_tool_text_23')
    }.id('attribute_modification_tool_row_20')
    .width('100%')
    .height(40)
    .justifyContent(FlexAlign.SpaceAround)
  }
}
