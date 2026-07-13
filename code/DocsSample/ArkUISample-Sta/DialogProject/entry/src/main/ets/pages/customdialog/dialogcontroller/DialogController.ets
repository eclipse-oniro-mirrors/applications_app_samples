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
        Button('PresentCustomDialog+CustomBuilderGetState')
          .onClick(() => {
            let dialogController: promptAction.CommonController = new promptAction.DialogController();
            this.getUIContext().getPromptAction().presentCustomDialog(() => {
              this.customDialogComponentGetState(dialogController);
            }, dialogController, this.dialogOptions).catch((err) => {
              hilog.error(DOMAIN, 'dialogController', 'presentCustomDialog error: %{public}s', err);
            });
          })
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