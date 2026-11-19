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
 * @file entry/src/main/ets/pages/globalMethods/dialogs/alertDialogSample/AlertDialogSample.ets
 * 文件职责：AlertDialogSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：WarningDialogSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import ShowToast from '../../../../util/ShowToast'
import { TitleBar } from '../../../../common/TitleBar'

@Extend(Row) function rowStyle() {
  .width('100%')
  .borderRadius(24)
  .margin({ top: 8, bottom: 8 })
  .justifyContent(FlexAlign.SpaceBetween)
}

@Extend(Column) function columnStyle() {
  .width('100%')
  .borderRadius(24)
  .margin({ top: 8, bottom: 8 })
  .justifyContent(FlexAlign.SpaceBetween)
  .backgroundColor(Color.White)
  .padding(15)
}

@Extend(Button) function commonButtonStyle() {
  .margin(8)
  .fontSize(16)
  .layoutWeight(1)
  .fontColor($r('app.color.background_blue'))
  .backgroundColor($r('app.color.pop_up_background'))
  .padding({ left: 12, right: 12, top: 8, bottom: 8 })
}

/**
 * WarningDialogSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct WarningDialogSample {
  private mTextInputController: TextInputController = new TextInputController()

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.alert_dialog') }).id('alert_dialog_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：内边距、尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.alert_dialog_type') })
            .id('alert_dialog_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_type_one')).id('alert_typeOneButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：AlertDialog.show(
                AlertDialog.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_type_one'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      backgroundColor: $r('app.color.background_grey'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_type_one'))
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'))
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                )
              // 结束当前组件块
              }).id('test_oneButton')
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_type_two')).id('alert_typeTwoButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：AlertDialog.show(
                AlertDialog.show(
                  {
                    title: $r('app.string.alert_dialog_warning'),
                    message: $r('app.string.alert_dialog_info'),
                    primaryButton: {
                      value: $r('app.string.alert_dialog_cancel'),
                      backgroundColor: $r('app.color.background_grey'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_type_two'))
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    secondaryButton: {
                      value: $r('app.string.alert_dialog_confirm'),
                      fontColor: Color.Red,
                      backgroundColor: $r('app.color.background_grey'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_type_two'))
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'))
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                )
              // 结束当前组件块
              }).id('test_twoButton')
          // 结束当前组件块
          }.id('alert_dialog_sample_row_6')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.alert_dialog_location') })
            .id('alert_dialog_sample_introduction_title_7')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_top')).id('alert_topButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：AlertDialog.show(
                AlertDialog.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_top'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      backgroundColor: $r('app.color.background_grey'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_top'))
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'))
                    // 结束当前组件块
                    },
                    alignment: DialogAlignment.Top
                  // 结束当前组件块
                  }
                // 结束当前组件块
                )
              // 结束当前组件块
              }).id('test_topButton')
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_center')).id('alert_centerButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：AlertDialog.show(
                AlertDialog.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_center'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      backgroundColor: $r('app.color.background_grey'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_center'))
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'))
                    // 结束当前组件块
                    },
                    alignment: DialogAlignment.Center
                  // 结束当前组件块
                  }
                // 结束当前组件块
                )
              // 结束当前组件块
              }).id('test_centerButton')
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_bottom')).id('alert_bottomButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：AlertDialog.show(
                AlertDialog.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_bottom'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      backgroundColor: $r('app.color.background_grey'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_bottom'))
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'))
                    // 结束当前组件块
                    },
                    alignment: DialogAlignment.Bottom
                  // 结束当前组件块
                  }
                // 结束当前组件块
                )
              // 结束当前组件块
              }).id('test_bottomButton')
          // 结束当前组件块
          }.id('alert_dialog_sample_row_8')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.alert_dialog_auto_cancel') })
            .id('alert_dialog_sample_introduction_title_9')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_true')).id('alert_trueButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：AlertDialog.show(
                AlertDialog.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_true'),
                    autoCancel: true,
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      backgroundColor: $r('app.color.background_grey'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_true'))
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'))
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                )
              // 结束当前组件块
              }).id('test_closeableButton')
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_false')).id('alert_falseButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：AlertDialog.show(
                AlertDialog.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_false'),
                    autoCancel: false,
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      backgroundColor: $r('app.color.background_grey'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_false'))
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'))
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                )
              // 结束当前组件块
              }).id('test_noCloseButton')
          // 结束当前组件块
          }.id('alert_dialog_sample_row_10')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.alert_dialog_offset') })
            .id('alert_dialog_sample_introduction_title_11')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_left')).id('alert_leftButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：AlertDialog.show(
                AlertDialog.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_left'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      backgroundColor: $r('app.color.background_grey'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_left'))
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'))
                    // 结束当前组件块
                    },
                    offset: { dx: -20, dy: -150 }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                )
              // 结束当前组件块
              }).id('test_upperLeftButton')
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_right')).id('alert_rightButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：AlertDialog.show(
                AlertDialog.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_right'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      backgroundColor: $r('app.color.background_grey'),
                      action: () => {
                        ShowToast.shortToast($r('app.string.alert_dialog_right'))
                      }
                    },
                    cancel: () => {
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'))
                    },
                    offset: { dx: 50, dy: -50 }
                  }
                )
              }).id('test_lowRightButton')
          }.id('alert_dialog_sample_row_12')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.alert_dialog_grid') })
            .id('alert_dialog_sample_introduction_title_13')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_grid_two'))
              .commonButtonStyle()
              .onClick(() => {
                AlertDialog.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_grid_two'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      backgroundColor: $r('app.color.background_grey'),
                      action: () => {
                        ShowToast.shortToast($r('app.string.alert_dialog_grid_two'))
                      }
                    },
                    cancel: () => {
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'))
                    },
                    gridCount: 2
                  }
                )
              }).id('test_2GridButton')
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_grid_three'))
              .commonButtonStyle()
              .onClick(() => {
                AlertDialog.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_grid_three'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      backgroundColor: $r('app.color.background_grey'),
                      action: () => {
                        ShowToast.shortToast($r('app.string.alert_dialog_grid_three'))
                      }
                    },
                    cancel: () => {
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'))
                    },
                    gridCount: 3
                  }
                )
              }).id('test_3GridButton')
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_grid_four'))
              .commonButtonStyle()
              .onClick(() => {
                AlertDialog.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_grid_four'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      backgroundColor: $r('app.color.background_grey'),
                      action: () => {
                        ShowToast.shortToast($r('app.string.alert_dialog_grid_four'))
                      }
                    },
                    cancel: () => {
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'))
                    },
                    gridCount: 4
                  }
                )
              }).id('test_4GridButton')
          }.id('alert_dialog_sample_row_14')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.avoiding_input_method_testing') })
            .id('alert_dialog_sample_introduction_title_15')
          // Column：垂直布局容器
          // 关键属性：columnStyle、外边距
          Column() {
            // Row：水平布局容器
            // 关键属性：rowStyle
            Row() {
              // TextInput：单行输入框
              // 关键属性：布局权重、高度、rowStyle
              TextInput({
                controller: this.mTextInputController,
                placeholder: $r('app.string.avoiding_input_method_testing')
              })
                .layoutWeight(1).height(50).id('test_input')
            }.id('alert_dialog_sample_row_17').rowStyle()

            // Row：水平布局容器
            // 关键属性：rowStyle、columnStyle、外边距
            Row() {
              // Button：按钮
              // 关键属性：commonButtonStyle、点击事件回调、setTextSelection
              // 交互：可点击交互
              Button($r('app.string.alert_dialog_bottom'))
                .commonButtonStyle()
                .onClick(() => {
                  this.mTextInputController.setTextSelection(1, 2)
                  AlertDialog.show(
                    {
                      title: $r('app.string.alert_dialog_prompt'),
                      message: $r('app.string.alert_dialog_bottom'),
                      confirm: {
                        value: $r('app.string.alert_dialog_confirm'),
                        backgroundColor: $r('app.color.background_grey'),
                        action: () => {
                          ShowToast.shortToast($r('app.string.alert_dialog_bottom'))
                        }
                      },
                      cancel: () => {
                        ShowToast.shortToast($r('app.string.alert_dialog_cancel'))
                      },
                      alignment: DialogAlignment.Bottom
                    }
                  )
                }).id('test_bottomButton')
            }.id('alert_dialog_sample_row_18').rowStyle()
          }.id('alert_dialog_sample_column_16').columnStyle().margin({ bottom: 80 })
        }.id('alert_dialog_sample_column_4')
        .padding(12)
        .constraintSize({ minHeight: '100%' })
      }.id('alert_dialog_sample_scroll_3')
    }.id('alert_dialog_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}