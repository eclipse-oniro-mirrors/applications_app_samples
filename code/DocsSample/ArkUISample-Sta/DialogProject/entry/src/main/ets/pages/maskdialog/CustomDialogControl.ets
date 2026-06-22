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

// [Start custom_dialog_control]
// xxx.ets
import {
  Entry,
  Component,
  Column,
  Text,
  Button,
  promptAction,
  NavDestination,
  Builder,
  TransitionEffect
} from '@kit.ArkUI';
import { ImmersiveMode, LevelMode } from '@ohos.promptAction';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
export struct CustomDialogControl {
  // [Start custom_dialog_control_immersive]
  @State immersiveMode: ImmersiveMode = ImmersiveMode.DEFAULT;
  // [StartExclude custom_dialog_control_immersive]

  // [Start custom_dialog_control_autoCancel]
  autoCancelOpt: promptAction.CustomDialogOptions = {
    builder: (): void => {
      this.myBuilder();
    },
    autoCancel: false,
  } as promptAction.CustomDialogOptions;
  // [StartExclude custom_dialog_control_autoCancel]

  // [Start custom_dialog_control_modal]
  modalOpt: promptAction.CustomDialogOptions = {
    builder: (): void => {
      this.myBuilder();
    },
    isModal: false,
  } as promptAction.CustomDialogOptions;
  // [StartExclude custom_dialog_control_modal]

  // [Start custom_dialog_control_mask]
  maskOpt: promptAction.CustomDialogOptions = {
    builder: (): void => {
      this.myBuilder();
    },
    maskRect: {
      x: 0,
      y: 10,
      width: '100%',
      height: '90%'
    },
    maskColor: '#33AA0000'
  } as promptAction.CustomDialogOptions;
  // [StartExclude custom_dialog_control_mask]

  // [Start custom_dialog_control_transition]
  transitionOpt: promptAction.CustomDialogOptions = {
    builder: (): void => {
      this.myBuilder();
    },
    transition: TransitionEffect.OPACITY.animation({ duration: 3000 })
  } as promptAction.CustomDialogOptions;
  // [StartExclude custom_dialog_control_transition]

  @Builder
  myBuilder(): void {
    Column() {
      Text('title').margin(10).fontSize(20)
      Button('button1').margin(10).fontSize(20)
      Button('button2').margin(10).fontSize(20)
    }.width('100%').height('50%')
  }

  // [EndExclude custom_dialog_control_transition]
  // [EndExclude custom_dialog_control_mask]
  // [EndExclude custom_dialog_control_modal]
  // [EndExclude custom_dialog_control_immersive]
  // [EndExclude custom_dialog_control_autoCancel]
  build(): void {
    NavDestination() {
      Column() {
        // [StartExclude custom_dialog_control_transition]
        // [StartExclude custom_dialog_control_mask]
        // [StartExclude custom_dialog_control_immersive]
        // [StartExclude custom_dialog_control_modal]
        Button('openCustomDialog autoCancel:false')
          .width('100%')
          .margin({ top: 10 })
          .onClick((): void => {
            this.getUIContext().getPromptAction().openCustomDialog(this.autoCancelOpt);
          })

        // [StartExclude custom_dialog_control_autoCancel]   
        // [EndExclude custom_dialog_control_modal]
        Button('openCustomDialog isModal:false')
          .width('100%')
          .margin({ top: 10 })
          .onClick((): void => {
            this.getUIContext().getPromptAction().openCustomDialog(this.modalOpt);
          })

        // [StartExclude custom_dialog_control_modal]
        // [EndExclude custom_dialog_control_mask]
        Button('openCustomDialog maskOpt')
          .width('100%')
          .margin({ top: 10 })
          .onClick((): void => {
            this.getUIContext().getPromptAction().openCustomDialog(this.maskOpt);
          })

        // [StartExclude custom_dialog_control_mask]
        // [EndExclude custom_dialog_control_transition]
        Button('openCustomDialog transition')
          .width('100%')
          .margin({ top: 10 })
          .onClick((): void => {
            this.getUIContext().getPromptAction().openCustomDialog(this.transitionOpt);
          })

        // [StartExclude custom_dialog_control_transition]
        // [EndExclude custom_dialog_control_immersive]
        Button('openCustomDialog immersiveMode')
          .width('100%')
          .margin({ top: 10 })
          .onClick((): void => {
            this.immersiveMode =
              this.immersiveMode == ImmersiveMode.DEFAULT ? ImmersiveMode.EXTEND : ImmersiveMode.DEFAULT;
            this.getUIContext().getPromptAction().openCustomDialog({
              builder: (): void => {
                this.myBuilder();
              },
              levelMode: LevelMode.EMBEDDED,
              immersiveMode: this.immersiveMode,
            })
          })

        // [StartExclude custom_dialog_control_immersive]
        // [Start custom_dialog_control_mask_transition]
        Button('openCustomDialog maskTransition')
          .width('100%')
          .margin({ top: 10 })
          .onClick((): void => {
            this.getUIContext().getPromptAction().openCustomDialog({
              builder: (): void => {
                this.myBuilder();
              },
              maskTransition: TransitionEffect.OPACITY.animation({ duration: 2000 })
                .combine(TransitionEffect.rotate({ z: 1, angle: 180 })),
            });
          })
        // [End custom_dialog_control_mask_transition]
        // [EndExclude custom_dialog_control_transition]
        // [EndExclude custom_dialog_control_mask]
        // [EndExclude custom_dialog_control_modal]
        // [EndExclude custom_dialog_control_autoCancel]
        // [EndExclude custom_dialog_control_immersive]
      }
      .width('100%')
      .height('100%')
    }
  }
  // [End custom_dialog_control_transition]
  // [End custom_dialog_control_mask]
  // [End custom_dialog_control_modal]
  // [End custom_dialog_control_autoCancel]
  // [End custom_dialog_control_immersive]
}
// [End custom_dialog_control]