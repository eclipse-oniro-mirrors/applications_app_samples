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
 * @file entry/src/main/ets/pages/universal/properties/interactionSample/InteractionSample.ets
 * 文件职责：InteractionSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MMenu、Interaction。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import pointer from '@ohos.multimodalInput.pointer';
import promptAction from '@ohos.prompt';
import prompt from '@ohos.prompt';
import window from '@ohos.window';
import { TitleBar } from '../../../../common/TitleBar';
import { getStringData } from '../../../../data//ResourceDataHandle';
import { placementsNameData, hitTestModeNameData, hoverEffectNameData, pointerStyleNameData, PointerStyleName } from '../../UniversialData';
import Logger from '../../../../util/Logger';
import measure from '@ohos.measure';

/**
 * MMenu：类定义，承载本文件对应的逻辑与数据。
 */
class MMenu {
  value: string = '';
  icon!: Resource;
  action:  () => void = (): void => {};
}

@Extend(Text) function leftTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
  .alignSelf(ItemAlign.Start)
  .margin({ left: 12, top: 12 })
}

@Extend(Text) function subTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
}

@Extend(Column) function cardStyle() {
  .backgroundColor(Color.White)
  .borderRadius(24)
  .width('100%')
  .padding(15)
}

@Extend(ListItem) function itemCardStyle() {
  .backgroundColor(Color.White)
  .borderRadius(12)
  .width('100%')
  .padding(10)
}

/**
 * Interaction：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Interaction {
  // @State isMask：组件内部状态
  @State isMask: boolean = false;

  // @State buttonIsDisabled：组件内部状态
  @State buttonIsDisabled: boolean = false;

  // @State listIsDisabled：组件内部状态
  @State listIsDisabled: boolean = false;

  // @State alertText：组件内部状态
  @State alertText: string = '';

  // @State handlePopup：组件内部状态
  @State handlePopup: boolean = false;

  // @State handleCustomPopup：组件内部状态
  @State handleCustomPopup: boolean = false;

  // @State mPlacementOnTop：组件内部状态
  @State mPlacementOnTop: boolean = false;

  // @State mArrowOffset：组件内部状态
  @State mArrowOffset: number = 0;

  // @State mPlacement：组件内部状态
  @State mPlacement: Placement = Placement.Top;

  // @State mHitTestMode：组件内部状态
  @State mHitTestMode: HitTestMode = HitTestMode.Default;

  // @State mBackgroundHandleClick：组件内部状态
  @State mBackgroundHandleClick: boolean = false;

  // @State mForgroundHandleClick：组件内部状态
  @State mForgroundHandleClick: boolean = false;

  // @State mForgroundChildHandleClick：组件内部状态
  @State mForgroundChildHandleClick: boolean = false;

  // @State mComponentDisabled：组件内部状态
  @State mComponentDisabled: boolean = false;

  // @State mComponentFocused：组件内部状态
  @State mComponentFocused: boolean = false;

  // @State mTabIndex：组件内部状态
  @State mTabIndex: number = 0;

  // @State mHoverEffect：组件内部状态
  @State mHoverEffect: HoverEffect = HoverEffect.None;

  // @State mPointerStyle：组件内部状态
  @State mPointerStyle: pointer.PointerStyle = pointer.PointerStyle.DEFAULT;
  private mTouchableTestResult: string = '';
  private mToastTimer: number | null = null;
  private mMenuLists: MMenu[] = [
    {
      value: getStringData($r('app.string.components_interaction_menuone')),
      icon: $r('app.media.ic_other'),
      action: () => {
      }
    },
    {
      value: getStringData($r('app.string.components_interaction_menutwo')),
      icon: $r('app.media.ic_other'),
      action: () => {
      }
    },
    {
      value: getStringData($r('app.string.components_interaction_menuthree')),
      icon: $r('app.media.ic_other'),
      action: () => {
      }
    },
    {
      value: getStringData($r('app.string.components_interaction_menufour')),
      icon: $r('app.media.ic_other'),
      action: () => {
      }
    }
  ];

  @Styles normalStyles() {
    .backgroundColor($r('app.color.normal_bg_color'))
    .borderRadius(10)
    .borderStyle(BorderStyle.Solid)
    .borderWidth(2)
    .borderColor($r('app.color.btn_border_color'))
  }

  @Styles focusedStyles() {
    .backgroundColor(Color.Red)
    .borderRadius(20)
    .borderStyle(BorderStyle.Dashed)
    .borderWidth(2)
    .borderColor($r('app.color.btn_border_color'))
  }

  @Styles pressedStyles() {
    .backgroundColor(Color.Green)
    .borderRadius(40)
    .opacity(0.8)
    .borderWidth(2)
    .borderColor($r('app.color.btn_border_color'))
  }

  @Styles disabledStyles() {
    .backgroundColor(Color.Gray)
    .borderRadius(10)
    .opacity(0.8)
    .borderWidth(2)
  }

  @Builder popupBuilder() {
    // Row：水平布局容器
    // 关键属性：宽度、高度、内边距
    Row({ space: 20 }) {
      // Image：图片
      // 关键属性：宽度、高度、字号、字体颜色
      Image($r("app.media.icon")).id('interaction_sample_image_2').width(24).height(24)
      // Text：文本
      // 关键属性：字号、字体颜色、宽度、高度、内边距
      Text('Content').id('interaction_sample_text_3').fontSize(20).fontColor(Color.White)
    }.id('interaction_sample_row_1').width(120).height(40).padding(10)
  }

  @Builder menuBuilder() {
    // Menu：菜单
    Menu() {
      // MenuItem：菜单项
      MenuItem({ startIcon: $r('app.media.ic_other'), content: $r('app.string.components_interaction_menuone') })
        .id('interaction_sample_menu_item_5')
      // MenuItemGroup：菜单分组
      MenuItemGroup({ header: $r('app.string.components_interaction_menutwo') }) {
        // MenuItem：菜单项
        MenuItem({
          startIcon: $r('app.media.ic_other'),
          content: $r('app.string.components_interaction_menuthree')
        }).id('interaction_sample_menu_item_7')
        // MenuItem：菜单项
        MenuItem({
          startIcon: $r('app.media.ic_other'),
          content: $r('app.string.components_interaction_menufour')
        }).id('interaction_sample_menu_item_8')
      }.id('interaction_sample_menu_item_group_6')
    }.id('interaction_sample_menu_4')
  }
  private context: Context = getContext(this)
  private placementsNameArray = placementsNameData
  private hitTestModeNameArray = hitTestModeNameData
  private hoverEffectNameArray = hoverEffectNameData
  private pointerStyleNameArray = pointerStyleNameData

  @Builder tabbarTitle(name: string | Resource, index: number) {
    // Column：垂直布局容器
    // 关键属性：外边距、尺寸约束、高度
    Column() {
      // Text：文本
      // 关键属性：字号、字体颜色、外边距
      Text(name).id('interaction_sample_text_10')
        .fontSize(22)
        .fontColor(this.mTabIndex === index ? $r('app.color.title_colorone') : $r('app.color.title_colortwo'))
        .margin({ bottom: 5 })

      if (this.mTabIndex === index) {
        // Row：水平布局容器
        // 关键属性：宽度、measureTextSize、背景色、高度
        Row().id('interaction_sample_row_11')
          .width(measure.measureTextSize({textContent:name}).width)
          .backgroundColor($r('app.color.title_colorone'))
          .height(2)
      }
    }.id('interaction_sample_column_9')
    .margin(8)
    .constraintSize({ minWidth: 32 })
    .height(56)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.components_interaction') }).id('interaction_sample_title_bar_13')
      // Tabs：页签容器
      // 关键属性：barOverlap、内容变更回调
      // 交互：输入/提交回调
      Tabs() {
        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、内边距、tabBar、tabbarTitle
          Column() {
            // Text：文本
            // 关键属性：leftTitleStyle
            Text($r('app.string.button_disabled')).id('interaction_sample_text_17')
              .leftTitleStyle()
            // Column：垂直布局容器
            // 关键属性：cardStyle
            Column() {
              // Button：按钮
              // 关键属性：是否可用、点击事件回调、showToast
              // 交互：可点击交互
              Button($r('app.string.button')).id('interaction_sample_button_19')
                .enabled(!this.buttonIsDisabled)
                .onClick(() => {
                  promptAction.showToast({
                    message: 'Button Clicked'
                  })
                })
              // Row：水平布局容器
              // 关键属性：cardStyle
              Row() {
                // Text：文本
                // 关键属性：字号
                Text($r('app.string.button_disabled')).id('interaction_sample_text_21')
                  .fontSize(15)
                // Checkbox：复选框
                // 关键属性：select、内容变更回调
                // 交互：输入/提交回调
                Checkbox()
                  .select(this.buttonIsDisabled)
                  .onChange((value: boolean) => {
                    this.buttonIsDisabled = value
                  }).id('test_checkbox1')
              }.id('interaction_sample_row_20')
            }.id('interaction_sample_column_18').cardStyle()

            // Text：文本
            // 关键属性：leftTitleStyle
            Text($r('app.string.list_disabled')).id('interaction_sample_text_22')
              .leftTitleStyle()
            // Column：垂直布局容器
            // 关键属性：宽度、cardStyle
            Column() {
              // List：列表容器
              // 关键属性：高度、宽度、背景色、是否可用、内边距
              List({ space: 5 }) {
                ForEach([1, 2, 3, 4, 5, 6, 7, 8], (item: string) => {
                  // ListItem：列表项
                  // 关键属性：宽度、itemCardStyle
                  ListItem() {
                    // Text：文本
                    // 关键属性：字号、宽度
                    Text(item + "").id('interaction_sample_text_26')
                      .fontSize(20)
                  }.id('interaction_sample_list_item_25').width('100%')
                  .itemCardStyle()
                })
              }.id('interaction_sample_list_24')
              .height(300)
              .width(200)
              .backgroundColor($r('app.color.background_grey'))
              .enabled(!this.listIsDisabled)
              .padding(12)

              // Row：水平布局容器
              // 关键属性：宽度
              Row() {
                // Text：文本
                // 关键属性：字号
                Text($r('app.string.interaction_disable_list')).id('interaction_sample_text_28')
                  .fontSize(15)
                // Checkbox：复选框
                // 关键属性：select、内容变更回调
                // 交互：输入/提交回调
                Checkbox()
                  .select(this.listIsDisabled)
                  .onChange((value: boolean) => {
                    this.listIsDisabled = value
                  }).id('test_checkbox2')
              }.id('interaction_sample_row_27')
            }.id('interaction_sample_column_23').width('100%')
            .cardStyle()
          }.id('interaction_sample_column_16').width('100%')
          .padding(12)
        }.id('interaction_sample_tab_content_15').tabBar(this.tabbarTitle($r('app.string.disabled'), 0))

        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle
        TabContent() {
          // Scroll：滚动容器
          // 关键属性：高度、tabBar、tabbarTitle
          Scroll() {
            // Column：垂直布局容器
            // 关键属性：宽度、内边距
            Column() {
              // Text：文本
              // 关键属性：leftTitleStyle
              Text($r('app.string.alert')).id('interaction_sample_text_32')
                .leftTitleStyle()
              // Column：垂直布局容器
              // 关键属性：cardStyle
              Column({ space: 12 }) {
                // Row：水平布局容器
                // 关键属性：宽度、内边距
                Row() {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.result')).id('interaction_sample_text_35')
                    .fontSize(14)
                  // Text：文本
                  // 关键属性：字号、宽度
                  Text(this.alertText).id('interaction_sample_text_36')
                    .fontSize(14)
                }.id('interaction_sample_row_34').width('100%')
                .padding(12)

                // Button：按钮
                // 关键属性：点击事件回调、show
                // 交互：可点击交互
                Button($r('app.string.interaction_show_one_alert'))
                  .onClick(() => {
                    AlertDialog.show(
                      {
                        title: 'Alert',
                        message: 'Show alert',
                        confirm: {
                          value: 'OK',
                          fontColor: Color.Red,
                          action: () => {
                            this.alertText = 'Get OK'
                          }
                        },
                        cancel: () => {
                          this.alertText = 'Get Cancel'
                        }
                      }
                    )
                  }).id('test_oneButton')
                // Button：按钮
                // 关键属性：点击事件回调、show
                // 交互：可点击交互
                Button($r('app.string.interaction_show_two_alert'))
                  .onClick(() => {
                    AlertDialog.show(
                      {
                        title: 'Alert',
                        message: "Show alert",
                        primaryButton: {
                          value: "OK",
                          fontColor: Color.Green,
                          backgroundColor: Color.White,
                          action: () => {
                            this.alertText = 'Get OK'
                          }
                        },
                        secondaryButton: {
                          value: 'Cancel',
                          fontColor: Color.Red,
                          action: () => {
                            this.alertText = 'Get Cancel Button'
                          }
                        },
                        cancel: () => {
                          this.alertText = 'Get Cancel'
                        }
                      }
                    )
                  }).id('test_twoButton')
              }.id('interaction_sample_column_33').cardStyle()

              // Text：文本
              // 关键属性：leftTitleStyle
              Text($r('app.string.popup')).id('interaction_sample_text_37')
                .leftTitleStyle()
              // Column：垂直布局容器
              // 关键属性：cardStyle
              Column() {
                // Row：水平布局容器
                // 关键属性：自身对齐
                Row() {
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.interaction_placementontop')).id('interaction_sample_text_40')
                    .fontSize(15)
                  // Checkbox：复选框
                  // 关键属性：select、内容变更回调
                  // 交互：输入/提交回调
                  Checkbox().id('interaction_sample_checkbox_41')
                    .select(this.mPlacementOnTop)
                    .onChange((value) => {
                      this.mPlacementOnTop = value
                    })
                  // Text：文本
                  // 关键属性：字号
                  Text($r('app.string.interaction_mask')).id('interaction_sample_text_42')
                    .fontSize(15)
                  // Checkbox：复选框
                  // 关键属性：select、内容变更回调
                  // 交互：输入/提交回调
                  Checkbox().id('interaction_sample_checkbox_43')
                    .select(this.isMask)
                    .onChange((value) => {
                      this.isMask = value
                    })
                }.id('interaction_sample_row_39').alignSelf(ItemAlign.Start)

                // Text：文本
                // 关键属性：字号、自身对齐
                Text($r('app.string.interaction_arrowoffset')).id('interaction_sample_text_44')
                  .fontSize(15)
                  .alignSelf(ItemAlign.Start)
                // Row：水平布局容器
                // 关键属性：宽度、内边距
                Row() {
                  // Text：文本
                  Text('0%').id('interaction_sample_text_46')
                  // Slider：滑块
                  // 关键属性：内容变更回调
                  // 交互：输入/提交回调
                  Slider({ value: this.mArrowOffset, min: 0, max: 100 }).id('interaction_sample_slider_47')
                    .onChange((value) => {
                      this.mArrowOffset = value
                    })
                    .showTips(true)
                    .layoutWeight(1)
                  // Text：文本
                  // 关键属性：宽度
                  Text('100%').id('interaction_sample_text_48')
                }.id('interaction_sample_row_45').width('100%')
                .padding({ left: 10, right: 10 })

                // Button：按钮
                // 关键属性：点击事件回调
                // 交互：可点击交互
                Button($r('app.string.interaction_showpopup'))
                  .onClick(() => {
                    this.handlePopup = true;
                  })
                  .bindPopup(this.handlePopup, {
                    message: "Display Popup Messages",
                    placementOnTop: this.mPlacementOnTop,
                    arrowOffset: this.mArrowOffset + '%',
                    primaryButton: {
                      value: 'OK',
                      action: () => {
                        this.handlePopup = false
                      }
                    },
                    secondaryButton: {
                      value: 'Cancel',
                      action: () => {
                        this.handlePopup = false
                      }
                    },
                    mask: this.isMask
                  }).id('test_popButton')
              }.id('interaction_sample_column_38').cardStyle()

              // Text：文本
              // 关键属性：leftTitleStyle
              Text($r('app.string.custom_popup')).id('interaction_sample_text_49')
                .leftTitleStyle()
              // Column：垂直布局容器
              // 关键属性：cardStyle、宽度
              Column() {
                // Flex：弹性布局容器
                // 关键属性：宽度
                Flex({ wrap: FlexWrap.Wrap }) {
                  ForEach(this.placementsNameArray, (item: string) => {
                    // Row：水平布局容器
                    // 关键属性：宽度
                    Row() {
                      // Radio：单选框
                      // 关键属性：勾选状态、内容变更回调
                      // 交互：输入/提交回调
                      Radio({ value: item, group: 'placement' }).id('interaction_sample_radio_53')
                        .checked(this.mPlacement === Placement[item])
                        .onChange((isChecked: boolean) => {
                          if (isChecked) {
                            this.mPlacement = Placement[item]
                          }
                        })
                      // Text：文本
                      // 关键属性：字号、宽度
                      Text(item).id('interaction_sample_text_54')
                        .fontSize(12)
                    }.id('interaction_sample_row_52').width('33%')
                  })
                }.id('interaction_sample_flex_51').width('100%')

                // Button：按钮
                // 关键属性：外边距、字号、点击事件回调
                // 交互：可点击交互
                Button($r('app.string.interaction_showcustompopup'))
                  .margin({ bottom: 60 })
                  .fontSize(10)
                  .onClick(() => {
                    this.handleCustomPopup = true;
                  })
                  .bindPopup(this.handleCustomPopup, {
                    builder: this.popupBuilder,
                    placement: this.mPlacement,
                    maskColor: '#11000000',
                    onStateChange: (e) => {
                      if (!e.isVisible) {
                        this.handleCustomPopup = false
                      }
                    }
                  }).id('test_customButton')
              }.id('interaction_sample_column_50').cardStyle()
            }.id('interaction_sample_column_31').width('100%')
            .padding({ left: 12, right: 12, bottom: 12 })
          }.id('interaction_sample_scroll_30')
          .height('80%')
        }.id('interaction_sample_tab_content_29').tabBar(this.tabbarTitle($r('app.string.popup_window'), 1))

        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、内边距、tabBar、tabbarTitle
          Column() {
            // Column：垂直布局容器
            // 关键属性：cardStyle
            Column() {
              // Stack：层叠布局容器
              // 关键属性：宽度、高度、cardStyle
              Stack() {
                // Column：垂直布局容器
                // 关键属性：偏移、宽度、高度、点击事件回调
                // 交互：可点击交互
                Column() {
                  // Text：文本
                  // 关键属性：字体颜色、字号
                  Text($r('app.string.components_interaction_clicktextone')).id('interaction_sample_text_60')
                    .fontColor(Color.White)
                    .fontSize(30)
                }.id('interaction_sample_column_59')
                .offset({ x: -20, y: -20 })
                .width(200)
                .height(200)
                .onClick(() => {
                  this.mBackgroundHandleClick = true
                  this.handleClickCallback()
                })
                .backgroundColor(Color.Green)
                .stateStyles({
                  pressed: this.pressedStyles,
                  normal: this.normalStyles
                })

                // Column：垂直布局容器
                // 关键属性：宽度、高度、偏移、触摸测试策略、背景色、stateStyles
                Column() {
                  // Text：文本
                  // 关键属性：字体颜色、字号
                  Text($r('app.string.components_interaction_clicktexttwo')).id('interaction_sample_text_62')
                    .fontColor(Color.White)
                    .fontSize(30)
                  // Button：按钮
                  // 关键属性：点击事件回调
                  // 交互：可点击交互
                  Button($r('app.string.components_interaction_clicktextthree'))
                    .onClick(() => {
                      this.mForgroundChildHandleClick = true
                      this.handleClickCallback()
                    }).id('test_forgroundChild')
                }.id('interaction_sample_column_61')
                .width(200)
                .height(200)
                .offset({ x: 20, y: 20 })
                .hitTestBehavior(this.mHitTestMode)
                .backgroundColor(Color.Green)
                .stateStyles({
                  pressed: this.pressedStyles,
                  normal: this.focusedStyles
                })
              }.id('interaction_sample_stack_58').width('100%')
              .height(300)
            }.id('interaction_sample_column_57').cardStyle()

            // Text：文本
            // 关键属性：subTitleStyle
            Text($r('app.string.touch_test_region')).id('interaction_sample_text_63')
              .subTitleStyle()
            // Text：文本
            // 关键属性：leftTitleStyle
            Text($r('app.string.components_interaction_hittestbehavior')).id('interaction_sample_text_64')
              .leftTitleStyle()
            // Column：垂直布局容器
            // 关键属性：cardStyle、宽度
            Column() {
              // Flex：弹性布局容器
              // 关键属性：宽度、cardStyle
              Flex({ wrap: FlexWrap.Wrap }) {
                ForEach(this.hitTestModeNameArray, (item: string) => {
                  // Row：水平布局容器
                  // 关键属性：宽度
                  Row() {
                    // Radio：单选框
                    // 关键属性：勾选状态、内容变更回调
                    // 交互：输入/提交回调
                    Radio({ value: item, group: 'hitTestBehavior' }).id('interaction_sample_radio_68')
                      .checked(this.mHitTestMode === HitTestMode[item])
                      .onChange((isChecked: boolean) => {
                        if (isChecked) {
                          this.mHitTestMode = HitTestMode[item]
                        }
                      })
                    // Text：文本
                    // 关键属性：字号、宽度
                    Text(item).id('interaction_sample_text_69')
                      .fontSize(15)
                  }.id('interaction_sample_row_67').width('50%')
                })
              }.id('interaction_sample_flex_66').width('100%')
            }.id('interaction_sample_column_65').cardStyle()
          }.id('interaction_sample_column_56').width('100%')
          .padding(12)
        }.id('interaction_sample_tab_content_55').tabBar(this.tabbarTitle($r('app.string.touch_test'), 2))

        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、内边距、tabBar、tabbarTitle
          Column() {
            // Text：文本
            // 关键属性：leftTitleStyle
            Text($r("app.string.touch_hit_test")).id('interaction_sample_text_72')
              .leftTitleStyle()
            // Column：垂直布局容器
            // 关键属性：cardStyle
            Column() {
              // Stack：层叠布局容器
              // 关键属性：宽度、高度、cardStyle
              Stack() {
                // Rect：矩形
                // 关键属性：绝对定位、fill、触摸测试策略
                Rect({ width: 50, height: 50 })
                  .position({ x: 0, y: 0 })
                  .fill(Color.Green)
                  .hitTestBehavior(HitTestMode.None)
                  .id('test_rect')
                // Rect：矩形
                // 关键属性：绝对定位、fill、触摸测试策略
                Rect({ width: 50, height: 50 }).id('interaction_sample_rect_75')
                  .position({ x: 250, y: 0 })
                  .fill(Color.Green)
                  .hitTestBehavior(HitTestMode.None)
                // Rect：矩形
                // 关键属性：绝对定位、fill、触摸测试策略
                Rect({ width: 50, height: 50 }).id('interaction_sample_rect_76')
                  .position({ x: 250, y: 250 })
                  .fill(Color.Green)
                  .hitTestBehavior(HitTestMode.None)
                // Rect：矩形
                // 关键属性：绝对定位、fill、触摸测试策略
                Rect({ width: 50, height: 50 }).id('interaction_sample_rect_77')
                  .position({ x: 0, y: 250 })
                  .fill(Color.Green)
                  .hitTestBehavior(HitTestMode.None)
                // Stack：层叠布局容器
                // 关键属性：宽度、高度、背景色、stateStyles
                Stack() {
                  // Text：文本
                  // 关键属性：字号、字体颜色
                  Text($r("app.string.response_region")).id('interaction_sample_text_79')
                    .fontSize(20)
                    .fontColor(Color.White)
                }.id('interaction_sample_stack_78')
                .width(200)
                .height(200)
                .backgroundColor(Color.Red)
                .stateStyles({
                  pressed: this.pressedStyles,
                  normal: this.normalStyles
                })
                .responseRegion([
                  { x: -50, y: -50, width: 50, height: 50 },
                  { x: 200, y: -50, width: 50, height: 50 },
                  { x: 200, y: 200, width: 50, height: 50 },
                  { x: -50, y: 200, width: 50, height: 50 },
                ])
              }.id('interaction_sample_stack_74').width(300)
              .height(300)
            }.id('interaction_sample_column_73').cardStyle()

            // Text：文本
            // 关键属性：subTitleStyle、宽度
            Text($r("app.string.touch_hit_subtitle")).id('interaction_sample_text_80')
              .subTitleStyle()
          }.id('interaction_sample_column_71').width('100%')
          .padding(12)
        }.id('interaction_sample_tab_content_70').tabBar(this.tabbarTitle($r('app.string.touch_region'), 3))

        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、内边距、tabBar、tabbarTitle
          Column({ space: 10 }) {
            // Column：垂直布局容器
            // 关键属性：cardStyle
            Column() {
              // Row：水平布局容器
              // 关键属性：宽度、高度、背景色、hoverEffect、cardStyle
              Row() {
                // Text：文本
                // 关键属性：字号、字体颜色
                Text($r('app.string.hover_region')).id('interaction_sample_text_85')
                  .fontSize(15)
                  .fontColor(Color.White)
              }.id('interaction_sample_row_84')
              .width(200)
              .height(200)
              .backgroundColor(Color.Gray)
              .hoverEffect(this.mHoverEffect)
            }.id('interaction_sample_column_83').cardStyle()

            // Column：垂直布局容器
            // 关键属性：宽度
            Column() {
              // Text：文本
              // 关键属性：leftTitleStyle
              Text($r('app.string.components_interaction_hovereffect')).id('interaction_sample_text_87')
                .leftTitleStyle()
              // Column：垂直布局容器
              // 关键属性：cardStyle
              Column() {
                // Flex：弹性布局容器
                // 关键属性：宽度、cardStyle
                Flex({ wrap: FlexWrap.Wrap }) {
                  ForEach(this.hoverEffectNameArray, (item: string) => {
                    // Row：水平布局容器
                    // 关键属性：宽度
                    Row() {
                      // Radio：单选框
                      // 关键属性：勾选状态、内容变更回调
                      // 交互：输入/提交回调
                      Radio({ value: item, group: 'hovereffect' }).id('interaction_sample_radio_91')
                        .checked(this.mHoverEffect === HoverEffect[item])
                        .onChange((isChecked: boolean) => {
                          if (isChecked) {
                            this.mHoverEffect = HoverEffect[item]
                          }
                        })
                      // Text：文本
                      // 关键属性：字号、宽度
                      Text(item).id('interaction_sample_text_92')
                        .fontSize(15)
                    }.id('interaction_sample_row_90').width('50%')
                  })
                }.id('interaction_sample_flex_89').width('100%')
              }.id('interaction_sample_column_88').cardStyle()
            }.id('interaction_sample_column_86')
          }.id('interaction_sample_column_82').width('100%')
          .padding(12)
        }.id('interaction_sample_tab_content_81').tabBar(this.tabbarTitle($r('app.string.hovereffect'), 4))

        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：高度、宽度、内边距、tabBar、tabbarTitle
          Column() {
            // Scroll：滚动容器
            // 关键属性：高度
            Scroll() {
              // Column：垂直布局容器
              Column() {
                // Text：文本
                // 关键属性：leftTitleStyle
                Text($r('app.string.bind_menu_customBuilder')).id('interaction_sample_text_97')
                  .leftTitleStyle()
                // Column：垂直布局容器
                // 关键属性：cardStyle、高度
                Column() {
                  // Text：文本
                  // 关键属性：leftTitleStyle
                  Text($r('app.string.click_on_any_action_below')).id('interaction_sample_text_99')
                    .leftTitleStyle()
                  // Row：水平布局容器
                  // 关键属性：宽度
                  Row() {
                    // Blank：占位空白
                    Blank().id('interaction_sample_blank_101')
                    ForEach([1, 2, 3, 4, 5], (item: number) => {
                      // Column：垂直布局容器
                      // 关键属性：bindMenu
                      Column() {
                        // Image：图片
                        // 关键属性：宽度、高度
                        Image($r('app.media.ic_other')).id('interaction_sample_image_102')
                          .width(30)
                          .height(30)
                        // Text：文本
                        // 关键属性：字号
                        Text($r('app.string.option')).id('interaction_sample_text_103')
                          .fontSize(15)
                      }
                      .id('menuBuilder' + item)
                      .bindMenu(this.menuBuilder)

                      // Blank：占位空白
                      Blank().id('interaction_sample_blank_104')
                    })
                  }.id('interaction_sample_row_100').width('100%')

                  // Blank：占位空白
                  // 关键属性：cardStyle、高度
                  Blank().id('interaction_sample_blank_105')
                }.id('interaction_sample_column_98').cardStyle().height(250)

                // Text：文本
                // 关键属性：leftTitleStyle
                Text($r('app.string.bind_menu_content')).id('interaction_sample_text_106')
                  .leftTitleStyle()
                // Column：垂直布局容器
                // 关键属性：cardStyle、高度
                Column() {
                  // Text：文本
                  // 关键属性：leftTitleStyle
                  Text($r('app.string.click_on_any_action_below')).id('interaction_sample_text_108')
                    .leftTitleStyle()
                  // Row：水平布局容器
                  // 关键属性：宽度
                  Row() {
                    // Blank：占位空白
                    Blank().id('interaction_sample_blank_110')
                    ForEach([1, 2, 3, 4, 5], (item: number) => {
                      // Column：垂直布局容器
                      // 关键属性：bindMenu
                      Column() {
                        // Image：图片
                        // 关键属性：宽度、高度
                        Image($r('app.media.ic_other')).id('interaction_sample_image_111')
                          .width(30)
                          .height(30)
                        // Text：文本
                        // 关键属性：字号
                        Text($r('app.string.option')).id('interaction_sample_text_112')
                          .fontSize(15)
                      }
                      .id('mMenuLists' + item)
                      .bindMenu(this.mMenuLists)

                      // Blank：占位空白
                      Blank().id('interaction_sample_blank_113')
                    })
                  }.id('interaction_sample_row_109').width('100%')

                  // Blank：占位空白
                  // 关键属性：cardStyle、高度
                  Blank().id('interaction_sample_blank_114')
                }.id('interaction_sample_column_107').cardStyle().height(250)

                // Text：文本
                // 关键属性：leftTitleStyle
                Text($r('app.string.bind_content_menu')).id('interaction_sample_text_115')
                  .leftTitleStyle()
                // Column：垂直布局容器
                // 关键属性：cardStyle、高度、外边距
                Column() {
                  // Text：文本
                  // 关键属性：leftTitleStyle
                  Text($r('app.string.long_press_any_action_below')).id('interaction_sample_text_117')
                    .leftTitleStyle()
                  // Row：水平布局容器
                  // 关键属性：宽度
                  Row() {
                    // Blank：占位空白
                    Blank().id('interaction_sample_blank_119')
                    ForEach([1, 2, 3, 4, 5], (item: number) => {
                      // Column：垂直布局容器
                      // 关键属性：bindContextMenu
                      Column() {
                        // Image：图片
                        // 关键属性：宽度、高度
                        Image($r('app.media.ic_other')).id('interaction_sample_image_120')
                          .width(30)
                          .height(30)
                        // Text：文本
                        // 关键属性：字号
                        Text($r('app.string.option')).id('interaction_sample_text_121')
                          .fontSize(15)
                      }
                      .id('contextMenu' + item)
                      .bindContextMenu(
                        this.menuBuilder,
                        ResponseType.LongPress,
                        {
                          offset: { x: 0, y: 0 }
                        }
                      )
                      // Blank：占位空白
                      Blank().id('interaction_sample_blank_122')
                    })
                  }.id('interaction_sample_row_118').width('100%')

                  // Blank：占位空白
                  // 关键属性：cardStyle、高度、外边距
                  Blank().id('interaction_sample_blank_123')
                }.id('interaction_sample_column_116').cardStyle().height(250).margin({ bottom: 70 })
              }.id('interaction_sample_column_96')
            }.id('interaction_sample_scroll_95')
          }.id('interaction_sample_column_94').height('100%')
          .width('100%')
          .padding(20)
        }.id('interaction_sample_tab_content_93').tabBar(this.tabbarTitle($r('app.string.menu'), 5))

        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle
        TabContent() {
          // Column：垂直布局容器
          // 关键属性：宽度、内边距、tabBar、tabbarTitle
          Column() {
            // Row：水平布局容器
            Row() {
              // Row：水平布局容器
              // 关键属性：是否可用、focusable、key、宽度、高度、stateStyles
              Row() {
                // Text：文本
                // 关键属性：字号、字体颜色
                Text($r('app.string.multistatus_region')).id('interaction_sample_text_128')
                  .fontSize(15)
                  .fontColor(Color.White)
              }.id('interaction_sample_row_127')
              .enabled(!this.mComponentDisabled)
              .focusable(this.mComponentFocused)
              .key('item')
              .width(200)
              .height(200)
              .stateStyles({
                normal: this.normalStyles,
                pressed: this.pressedStyles,
                focused: this.focusedStyles,
                disabled: this.disabledStyles,
              })
            }.id('interaction_sample_row_126')

            // Text：文本
            // 关键属性：leftTitleStyle
            Text($r('app.string.status_select')).id('interaction_sample_text_129')
              .leftTitleStyle()
            // Column：垂直布局容器
            // 关键属性：cardStyle、宽度
            Column() {
              // Row：水平布局容器
              // 关键属性：宽度、cardStyle
              Row() {
                // Text：文本
                // 关键属性：字号
                Text($r('app.string.interaction_disable')).id('interaction_sample_text_132')
                  .fontSize(15)
                // Blank：占位空白
                Blank().id('interaction_sample_blank_133')
                // Checkbox：复选框
                // 关键属性：select、内容变更回调
                // 交互：输入/提交回调
                Checkbox()
                  .select(this.mComponentDisabled)
                  .onChange((value: boolean) => {
                    this.mComponentDisabled = value
                  }).id('test_checkbox')
              }.id('interaction_sample_row_131').width(200)
            }.id('interaction_sample_column_130').cardStyle()
          }.id('interaction_sample_column_125').width('100%')
          .padding(12)
        }.id('interaction_sample_tab_content_124').tabBar(this.tabbarTitle($r('app.string.multiState'), 6))

        // TabContent：页签内容
        // 关键属性：tabBar、tabbarTitle
        TabContent() {
          // Scroll：滚动容器
          // 关键属性：tabBar、tabbarTitle
          Scroll() {
            // Column：垂直布局容器
            // 关键属性：宽度、内边距
            Column() {
              // Text：文本
              // 关键属性：leftTitleStyle
              Text($r('app.string.multi_short_key')).id('interaction_sample_text_137')
                .leftTitleStyle()
              // Column：垂直布局容器
              // 关键属性：cardStyle
              Column() {
                // Text：文本
                // 关键属性：leftTitleStyle
                Text($r('app.string.on_short_key')).id('interaction_sample_text_139')
                  .leftTitleStyle()
                // Button：按钮
                // 关键属性：点击事件回调、showToast
                // 交互：可点击交互
                Button($r('app.string.multi_short_key')).id('interaction_sample_button_140')
                  .onClick(() => {
                    prompt.showToast({
                      message: getStringData($r('app.string.short_key_pressed')),
                      duration: 1000,
                    });
                  })
                  .keyboardShortcut('a', [ModifierKey.CTRL])
              }.id('interaction_sample_column_138').cardStyle()

              // Text：文本
              // 关键属性：leftTitleStyle
              Text($r('app.string.set_mouse_style')).id('interaction_sample_text_141')
                .leftTitleStyle()
              // Column：垂直布局容器
              // 关键属性：cardStyle、宽度
              Column() {
                // Flex：弹性布局容器
                // 关键属性：宽度、cardStyle
                Flex({ wrap: FlexWrap.Wrap }) {
                  ForEach(this.pointerStyleNameArray, (item: PointerStyleName) => {
                    // Row：水平布局容器
                    // 关键属性：宽度
                    Row() {
                      // Radio：单选框
                      // 关键属性：勾选状态、内容变更回调
                      // 交互：输入/提交回调
                      Radio({ value: item.key, group: 'pointerStyle' })
                        .id(item.key)
                        .checked(this.mPointerStyle === item.value)
                        .onChange((isChecked: boolean) => {
                          if (isChecked) {
                            this.mPointerStyle = item.value;
                            try {
                              let promise = window.getLastWindow(this.context);
                              promise.then((win)=> {
                                let windowId = win.getWindowProperties().id;
                                Logger.info('Succeeded in obtaining the top window. Data: ' + JSON.stringify(win));
                                if (windowId < 0) {
                                  Logger.info(`Invalid windowId`);
                                  return;
                                }
                                try {
                                  pointer.setPointerStyle(windowId, this.mPointerStyle, error => {
                                    Logger.info(`Set pointer style success`);
                                  });
                                } catch (error) {
                                  Logger.info(`Set pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
                                }
                              }).catch((err: Error)=>{
                                Logger.error('Failed to obtain the top window. Cause: ' + JSON.stringify(err));
                              });
                            } catch (exception) {
                              Logger.error('Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
                            }
                          }
                        })
                      // Text：文本
                      // 关键属性：字号、宽度
                      Text(item.key).id('interaction_sample_text_145')
                        .fontSize(10)
                    }.id('interaction_sample_row_144').width('50%')
                  })
                }.id('interaction_sample_flex_143').width('100%')
              }.id('interaction_sample_column_142').cardStyle()
            }.id('interaction_sample_column_136').width('100%')
            .padding(12)
          }.id('interaction_sample_scroll_135')
        }.id('interaction_sample_tab_content_134').tabBar(this.tabbarTitle($r('app.string.multimode_input'), 7))
      }.id('interaction_sample_tabs_14')
      .barOverlap(true)
      .onChange((index) => {
        this.mTabIndex = index
      })
      .barOverlap(true)
      .barMode(BarMode.Scrollable)
    }.id('interaction_sample_column_12')
    .height('100%')
    .backgroundColor($r('app.color.background_light_gray'))
  }

  /**
   * handleClickCallback：执行 handleClickCallback 相关逻辑。
   */
  handleClickCallback() {
    this.mTouchableTestResult = ""
    if (!this.mToastTimer) {
      this.mToastTimer = setTimeout(() => {
        let result = ''
        if (this.mBackgroundHandleClick) {
          result += getStringData($r('app.string.components_interaction_backgroundresponse'))
        }
        if (this.mForgroundHandleClick) {
          result += getStringData($r('app.string.components_interaction_foregroundresponse'))
        }
        if (this.mForgroundChildHandleClick) {
          result += getStringData($r('app.string.components_interaction_contentresponse'))
        }
        this.mTouchableTestResult = result
        this.mBackgroundHandleClick = false
        this.mForgroundChildHandleClick = false
        this.mForgroundHandleClick = false
        prompt.showToast({
          message: this.mTouchableTestResult
        })
        this.mToastTimer = null;
      }, 40)
    }
  }
}