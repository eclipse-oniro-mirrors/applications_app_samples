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
 * @file entry/src/main/ets/pages/globalMethods/dialogs/actionSheetDialogSample/ActionSheetDialogSample.ets
 * 文件职责：ActionSheetDialogSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ListDialogSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import ShowToast from '../../../../util/ShowToast';
import { TitleBar } from '../../../../common/TitleBar';

@Extend(Row) function rowStyle() {
  .width('94%')
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
  .padding({ left: 12, right: 12, top: 8, bottom: 8 })
}

/**
 * ListDialogSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ListDialogSample {
  private mTextInputController: TextInputController = new TextInputController()

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.action_sheet_dialog') }).id('action_sheet_dialog_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：内边距、尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.alert_dialog_location') })
            .id('action_sheet_dialog_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_top')).id('sheet_topButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：ActionSheet.show(
                ActionSheet.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_top'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
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
                    sheets: [
                      {
                        title: $r('app.string.text_picker_text_apple'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_apple'))
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_banana'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_banana'))
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_peach'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_peach'))
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    ],
                    alignment: DialogAlignment.Top
                  // 结束当前组件块
                  }
                // 结束当前组件块
                );
              // 结束当前组件块
              })
              .id('sheet_topButton')
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_center')).id('sheet_centerButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：ActionSheet.show(
                ActionSheet.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_center'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_center'));
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'));
                    // 结束当前组件块
                    },
                    sheets: [
                      {
                        title: $r('app.string.text_picker_text_apple'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_apple'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_banana'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_banana'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_peach'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_peach'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    ],
                    alignment: DialogAlignment.Center
                  // 结束当前组件块
                  }
                // 结束当前组件块
                );
              // 结束当前组件块
              })
              .id('sheet_centerButton')
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_bottom')).id('sheet_bottomButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：ActionSheet.show(
                ActionSheet.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_bottom'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_bottom'));
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    sheets: [
                      {
                        title: $r('app.string.text_picker_text_apple'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_apple'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_banana'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_banana'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_peach'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_peach'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    ],
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'));
                    // 结束当前组件块
                    },
                    alignment: DialogAlignment.Bottom
                  // 结束当前组件块
                  }
                // 结束当前组件块
                );
              // 结束当前组件块
              })
              .id('sheet_bottomButton')
          // 结束当前组件块
          }.id('action_sheet_dialog_sample_row_6')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.alert_dialog_auto_cancel') })
            .id('action_sheet_dialog_sample_introduction_title_7')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_true')).id('sheet_trueButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：ActionSheet.show(
                ActionSheet.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_true'),
                    autoCancel: true,
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_true'));
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    sheets: [
                      {
                        title: $r('app.string.text_picker_text_apple'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_apple'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_banana'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_banana'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_peach'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_peach'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    ],
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'));
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                );
              // 结束当前组件块
              })
              .id('sheet_closeableButton')
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_false')).id('sheet_falseButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：ActionSheet.show(
                ActionSheet.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_false'),
                    autoCancel: false,
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_false'));
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    sheets: [
                      {
                        title: $r('app.string.text_picker_text_apple'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_apple'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_banana'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_banana'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_peach'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_peach'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    ],
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'));
                    // 结束当前组件块
                    }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                );
              // 结束当前组件块
              })
              .id('sheet_noCloseButton')
          // 结束当前组件块
          }.id('action_sheet_dialog_sample_row_8')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.alert_dialog_offset') })
            .id('action_sheet_dialog_sample_introduction_title_9')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_left')).id('sheet_leftButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：ActionSheet.show(
                ActionSheet.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_left'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_left'));
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'));
                    // 结束当前组件块
                    },
                    alignment: DialogAlignment.Center,
                    sheets: [
                      {
                        title: $r('app.string.text_picker_text_apple'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_apple'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_banana'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_banana'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_peach'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_peach'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    ],
                    offset: { dx: -20, dy: -150 }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                );
              // 结束当前组件块
              })
              .id('sheet_upperLeftButton')
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.alert_dialog_right')).id('sheet_rightButton')
              .commonButtonStyle()
              // onClick：绑定点击事件回调
              .onClick(() => {
                // 处理：ActionSheet.show(
                ActionSheet.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.alert_dialog_right'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      action: () => {
                        // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                        ShowToast.shortToast($r('app.string.alert_dialog_right'));
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    },
                    cancel: () => {
                      // 处理：ShowToast.shortToast($r('app.string.alert_dialog
                      ShowToast.shortToast($r('app.string.alert_dialog_cancel'));
                    // 结束当前组件块
                    },
                    sheets: [
                      {
                        title: $r('app.string.text_picker_text_apple'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_apple'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_banana'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_banana'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      },
                      {
                        title: $r('app.string.text_picker_text_peach'),
                        action: () => {
                          // 处理：ShowToast.shortToast($r('app.string.text_picker_
                          ShowToast.shortToast($r('app.string.text_picker_text_peach'));
                        // 结束当前组件块
                        }
                      // 结束当前组件块
                      }
                    // 结束当前组件块
                    ],
                    offset: { dx: 20, dy: -35 }
                  // 结束当前组件块
                  }
                // 结束当前组件块
                );
              // 结束当前组件块
              })
              .id('sheet_lowRightButton')
          // 结束当前组件块
          }.id('action_sheet_dialog_sample_row_10')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.action_sheet_click_sheets') })
            .id('action_sheet_dialog_sample_introduction_title_11')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Button：按钮
            // 关键属性：commonButtonStyle、点击事件回调、show
            // 交互：可点击交互
            Button($r('app.string.action_sheet_dialog_click_content'))
              .commonButtonStyle()
              .onClick(() => {
                ActionSheet.show(
                  {
                    title: $r('app.string.alert_dialog_prompt'),
                    message: $r('app.string.action_sheet_dialog_click_content'),
                    confirm: {
                      value: $r('app.string.alert_dialog_confirm'),
                      action: () => {
                        ShowToast.shortToast($r('app.string.action_sheet_dialog_click_content'));
                      }
                    },
                    alignment: DialogAlignment.Center,
                    sheets: [
                      {
                        title: $r('app.string.text_picker_text_apple'),
                        action: () => {
                          ShowToast.shortToast($r('app.string.text_picker_text_apple'));
                        }
                      },
                      {
                        title: $r('app.string.text_picker_text_banana'),
                        action: () => {
                          ShowToast.shortToast($r('app.string.text_picker_text_banana'));
                        }
                      },
                      {
                        title: $r('app.string.text_picker_text_peach'),
                        action: () => {
                          ShowToast.shortToast($r('app.string.text_picker_text_peach'));
                        }
                      }
                    ]
                  }
                );
              })
              .id('sheet_click_contentButton')
          }.id('action_sheet_dialog_sample_row_12')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.avoiding_input_method_testing') })
            .id('action_sheet_dialog_sample_introduction_title_13')
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
            }.id('action_sheet_dialog_sample_row_15').rowStyle()

            // Row：水平布局容器
            // 关键属性：rowStyle、columnStyle、外边距
            Row() {
              // Button：按钮
              // 关键属性：commonButtonStyle、点击事件回调、setTextSelection
              // 交互：可点击交互
              Button($r('app.string.alert_dialog_bottom'))
                .id('btn_test_input')
                .commonButtonStyle()
                .onClick(() => {
                  this.mTextInputController.setTextSelection(1, 2)
                  ActionSheet.show(
                    {
                      title: $r('app.string.alert_dialog_prompt'),
                      message: $r('app.string.alert_dialog_bottom'),
                      confirm: {
                        value: $r('app.string.alert_dialog_confirm'),
                        action: () => {
                          ShowToast.shortToast($r('app.string.alert_dialog_bottom'));
                        }
                      },
                      sheets: [
                        {
                          title: $r('app.string.text_picker_text_apple'),
                          action: () => {
                            ShowToast.shortToast($r('app.string.text_picker_text_apple'));
                          }
                        },
                        {
                          title: $r('app.string.text_picker_text_banana'),
                          action: () => {
                            ShowToast.shortToast($r('app.string.text_picker_text_banana'));
                          }
                        },
                        {
                          title: $r('app.string.text_picker_text_peach'),
                          action: () => {
                            ShowToast.shortToast($r('app.string.text_picker_text_peach'));
                          }
                        }
                      ],
                      cancel: () => {
                        ShowToast.shortToast($r('app.string.alert_dialog_cancel'));
                      },
                      alignment: DialogAlignment.Bottom
                    }
                  );
                })
                .id('sheet_bottomButton')
            }.id('action_sheet_dialog_sample_row_16').rowStyle()
          }.id('action_sheet_dialog_sample_column_14').columnStyle().margin({ bottom: 80 })
        }.id('action_sheet_dialog_sample_column_4')
        .padding(12)
        .constraintSize({ minHeight: '100%' })
      }.id('action_sheet_dialog_sample_scroll_3')
    }.id('action_sheet_dialog_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}