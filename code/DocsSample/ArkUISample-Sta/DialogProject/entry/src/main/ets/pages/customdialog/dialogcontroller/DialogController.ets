'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 * DialogController 示例（静态模式）
 * 
 * 本示例展示如何使用 promptAction.DialogController 控制自定义对话框：
 * 1. 使用 ComponentContent 创建对话框内容
 * 2. 使用 CustomBuilder 构建对话框 UI
 * 3. 通过 DialogController 打开和关闭对话框
 * 4. 获取对话框状态信息
 * 5. 使用 dialogId 关闭对话框
 * 
 * 注意：此文件使用静态模式（'use static'），提供更强的类型检查
 */

// [Start dialog_example_controller]

import {
  Column,
  ColumnOptions,
  Text,
  Button,
  NavDestination,
  Entry,
  Component,
  FlexAlign,
  CustomDialog,
  CustomDialogController,
  ComponentContent,
  wrapBuilder,
  Builder
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement';
import promptAction from '@ohos.promptAction';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: int = 0x0000;

// [Start dialog_params]
/**
 * Params - 对话框参数类
 * 用于传递对话框的文本内容和控制器对象
 */
class Params {
  public text: string = '';
  public dialogController: promptAction.CommonController = new promptAction.DialogController();

  constructor(text: string, dialogController: promptAction.CommonController) {
    this.text = text;
    this.dialogController = dialogController;
  }
}

// [End dialog_params]

// [Start dialog_my_component]
/**
 * MyComponent - 内部组件
 * 演示如何在组件内部通过内置方法关闭对话框
 */
@Component
struct MyComponent {
  build(): void {
    Column({ space: 5 } as ColumnOptions) {
      Button('Close Dialog(Built-in Controller)')
        .onClick(() => {
          let dialogController: promptAction.DialogController | undefined = this.getDialogController();
          if (dialogController !== undefined) {
            dialogController!.close();
          }
        })
    }
  }
}

// [End dialog_my_component]

// [Start build_text]
/**
 * buildText - 构建对话框文本内容
 * @param params - 对话框参数对象，包含文本和控制器
 * 使用 @Builder 装饰器，可被 ComponentContent 调用
 */
@Builder
function buildText(params: Params): void {
  Column({ space: 5 } as ColumnOptions) {
    Text(params.text)
      .fontSize(30)
    if (params.dialogController !== undefined) {
      Button('Close Dialog(External Controller)')
        .onClick(() => {
          params.dialogController!.close();
        })
    }
    MyComponent()
  }
  .width(300)
  .height(200)
  .backgroundColor('#FFF0F0F0')
}

// [End build_text]

// [Start custom_dialog_example]
/**
 * CustomDialogExample - 自定义对话框组件
 * 演示如何使用 @CustomDialog 装饰器创建自定义对话框
 * 支持内置控制器关闭对话框
 */
@CustomDialog
@Component
struct CustomDialogExample {
  controller?: CustomDialogController;

  build(): void {
    Column({ space: 5 } as ColumnOptions) {
      Text('I am content')
        .fontSize(30)
      Button('Close Dialog(Built-in Controller)')
        .onClick(() => {
          let dialogController: promptAction.DialogController | undefined = this.getDialogController();
          if (dialogController !== undefined) {
            dialogController!.close();
          }
        })
    }
    .height(200)
    .backgroundColor('#FFF0F0F0')
  }
}

// [End custom_dialog_example]

/**
 * DialogController - 主页面组件
 * 演示多种对话框控制方式
 */
@Entry
@Component
export struct DialogController {
  @State dialogState: promptAction.CommonState = promptAction.CommonState.fromValue(0);
  private message: string = 'dialog';
  private baseDialogOptions: promptAction.BaseDialogOptions = {
    isModal: false,
    autoCancel: false,
    offset: {
      dx: 0,
      dy: 50
    }
  };
  private dialogOptions: promptAction.DialogOptions = {
    isModal: false,
    autoCancel: false,
    offset: {
      dx: 0,
      dy: 50
    }
  } as promptAction.DialogOptions;

  // [Start dialog_component]
  /**
   * customDialogComponent - 自定义对话框内容构建器
   * @param dialogController - 对话框控制器，用于外部关闭对话框
   */
  @Builder
  customDialogComponent(dialogController: promptAction.DialogController): void {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.message)
        .fontSize(30)
      if (dialogController !== undefined) {
        Button('Close Dialog(External Controller)')
          .onClick(() => {
            dialogController!.close();
          })
      }
    }
    .height(200)
    .padding(5)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor('#FFF0F0F0')
  }

  // [End dialog_component]

  // [Start dialog_component_id]
  /**
   * customDialogComponentWithId - 带 dialogId 的对话框内容构建器
   * @param dialogId - 对话框唯一标识符
   * @param dialogController - 对话框控制器
   * 演示两种关闭方式：通过 dialogId 或通过 controller
   */
  @Builder
  customDialogComponentWithId(dialogId: int, dialogController: promptAction.DialogController): void {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.message)
        .fontSize(30)
      if (dialogId !== undefined) {
        Button('Close Dialog(DialogID)')
          .onClick(() => {
            this.getUIContext().getPromptAction().closeCustomDialog(dialogId);
          })
      }
      if (dialogController !== undefined) {
        Button('Close Dialog(External Controller)')
          .onClick(() => {
            dialogController!.close();
          })
      }
    }
    .height(200)
    .padding(5)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor('#FFF0F0F0')
  }

  // [End dialog_component_id]

  // [Start dialog_component_get_state]
  /**
   * customDialogComponentGetState - 可获取状态的对话框内容构建器
   * @param dialogController - 对话框控制器
   * 演示如何获取对话框当前状态（打开/关闭/正在关闭）
   */
  @Builder
  customDialogComponentGetState(dialogController: promptAction.DialogController): void {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.message)
        .fontSize(30)
      if (dialogController !== undefined) {
        Button('Check Status:' + this.dialogState)
          .onClick(() => {
            this.dialogState = dialogController!.getState();
          })
        Button('Close Dialog(External Controller)')
          .onClick(() => {
            dialogController!.close();
          })
      }
    }
    .height(200)
    .padding(5)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor('#FFF0F0F0')
  }

  // [End dialog_component_get_state]

  build(): void {
    NavDestination() {
      Column({ space: 5 } as ColumnOptions) {
        // 方式1: 使用 ComponentContent 创建对话框
        Button('OpenCustomDialogWithController')
          .onClick(() => {
            // [Start content_node]
            let dialogController: promptAction.CommonController = new promptAction.DialogController();
            let contentNode: ComponentContent<Params> =
              new ComponentContent<Params>(this.getUIContext(), wrapBuilder(buildText),
                new Params(this.message, dialogController));
            this.getUIContext().getPromptAction().openCustomDialogWithController(
              contentNode, dialogController, this.baseDialogOptions).catch((err) => {
              hilog.error(DOMAIN, 'dialogController',
                'openCustomDialogWithController error: %{public}s', err);
            });
            // [End content_node]
          })
        // 方式2: 使用 presentCustomDialog + CustomBuilder
        Button('PresentCustomDialog+CustomBuilder')
          .onClick(() => {
            // [Start dialog_controller_component]
            let dialogController: promptAction.CommonController = new promptAction.DialogController();
            this.getUIContext().getPromptAction().presentCustomDialog(() => {
              this.customDialogComponent(dialogController);
            }, dialogController, this.dialogOptions).catch((err) => {
              hilog.error(DOMAIN, 'dialogController', 'presentCustomDialog error: %{public}s', err);
            });
            // [End dialog_controller_component]
          })
        // 方式3: 使用 presentCustomDialog + CustomBuilder 带参数
        Button('PresentCustomDialog+CustomBuilderWithId')
          .onClick(() => {
            // [Start dialog_controller_id]
            let dialogController: promptAction.CommonController = new promptAction.DialogController();
            this.getUIContext().getPromptAction().presentCustomDialog((dialogId: int) => {
              this.customDialogComponentWithId(dialogId, dialogController);
            }, dialogController, this.dialogOptions).catch((err) => {
              hilog.error(DOMAIN, 'dialogController', 'presentCustomDialog error: %{public}s', err);
            });
            // [End dialog_controller_id]
          })
        // 方式4: 获取对话框状态
        Button('PresentCustomDialog+CustomBuilderGetState')
          .onClick(() => {
            let dialogController: promptAction.CommonController = new promptAction.DialogController();
            this.getUIContext().getPromptAction().presentCustomDialog(() => {
              this.customDialogComponentGetState(dialogController);
            }, dialogController, this.dialogOptions).catch((err) => {
              hilog.error(DOMAIN, 'dialogController', 'presentCustomDialog error: %{public}s', err);
            });
          })
        // 方式5: 使用传统的 CustomDialogController
        Button('CustomDialogController')
          .onClick(() => {
            // [Start custom_dialog_example_click]
            let customDialogController: CustomDialogController = new CustomDialogController({
              builder: CustomDialogExample(),
              offset: {
                dx: 0,
                dy: 50
              }
            });
            customDialogController.open();
            // [End custom_dialog_example_click]
          })
      }.width('100%')
    }
  }
}

// [End dialog_example_controller]