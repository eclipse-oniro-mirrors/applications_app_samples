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

// [Start open_custom_dialog_with_system_material]
import { BusinessError } from '@kit.BasicServicesKit';
import { uiMaterial } from '@kit.ArkUI';

@Entry
@Component
export struct OpenCustomDialogWithSystemMaterial {
  private customDialogComponentId: number = 0;

  @Builder
  customDialogComponent() {
    Column() {
      Text('打开了一个弹窗').fontSize(20)
      Row({ space: 10 }) {
        Button('取消').onClick(() => {
          try {
            this.getUIContext().getPromptAction().closeCustomDialog(this.customDialogComponentId)
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`closeCustomDialog error code is ${code}, message is ${message}`);
          }
        }).width(100).backgroundColor('#d5d5d5').fontColor('#707070')
        Button('确定').onClick(() => {
          try {
            this.getUIContext().getPromptAction().closeCustomDialog(this.customDialogComponentId)
          } catch (error) {
            let message = (error as BusinessError).message;
            let code = (error as BusinessError).code;
            console.error(`closeCustomDialog error code is ${code}, message is ${message}`);
          }
        }).width(100)
      }
    }.height(150).padding(20).justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    NavDestination() {
        Row() {
        Column({ space: 20 }) {
            // [Start open_custom_dialog_with_system_material_set_material]
            Button('Click Me')
            .fontSize(30)
            .onClick(() => {
                this.getUIContext()
                .getPromptAction()
                .openCustomDialog({
                    builder: () => {
                    this.customDialogComponent()
                    },
                    systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THICK }),
                    // [StartExclude open_custom_dialog_with_system_material_set_material1]
                    onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                    console.info('reason' + JSON.stringify(dismissDialogAction.reason));
                    console.info('dialog onWillDismiss');
                    if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                        dismissDialogAction.dismiss();
                    }
                    if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                        dismissDialogAction.dismiss();
                    }
                    }
                    // [EndExclude open_custom_dialog_with_system_material_set_material1]
                })
                // [StartExclude open_custom_dialog_with_system_material_set_material2]
                .then((dialogId: number) => {
                    this.customDialogComponentId = dialogId;
                })
                .catch((error: BusinessError) => {
                    console.error(`openCustomDialog error code is ${error.code}, message is ${error.message}`);
                })
                // [EndExclude open_custom_dialog_with_system_material_set_material2]
            })
            // [End open_custom_dialog_with_system_material_set_material]
        }
        .width('100%')
        }
        .height('100%')
    }
  }
}
// [End open_custom_dialog_with_system_material]