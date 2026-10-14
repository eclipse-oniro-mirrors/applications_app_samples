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

// [Start custom_dialog_old_interface]
import { ComponentContent } from '@kit.ArkUI';
import { AbilityConstant, Configuration, EnvironmentCallback, ConfigurationConstant } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit';

class Params {
  text: string = "";
  colorMode: resourceManager.ColorMode = resourceManager.ColorMode.LIGHT

  constructor(text: string, colorMode: resourceManager.ColorMode) {
    this.text = text
    this.colorMode = colorMode
  }
}

@Builder
function BuilderDialog(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 36 })
  }.backgroundColor(params.colorMode == resourceManager.ColorMode.LIGHT ? "#D5D5D5" : "#004AAF")
}

@Entry
@Component
export struct CustomDialogOldInterface {
  @State message: string = "hello";
  contentNode: ComponentContent<Params> | null = null;
  callbackId: number | undefined = 0;

  aboutToAppear(): void {
    let environmentCallback: EnvironmentCallback = {
      onMemoryLevel: (level: AbilityConstant.MemoryLevel): void => {
      },
      onConfigurationUpdated: (config: Configuration): void => {
        console.info(`onConfigurationUpdated ${config}`);
        this.getUIContext().getHostContext()?.getApplicationContext().resourceManager.getConfiguration((err,
          config) => {
          // 调用ComponentContent的update更新colorMode信息
          this.contentNode?.update(new Params(this.message, config.colorMode))
          setTimeout(() => {
            // 调用ComponentContent的updateConfiguration，触发节点的全量更新
            this.contentNode?.updateConfiguration()
          })
        })
      }
    }
    // 注册监听系统环境变化监听器
    this.callbackId =
      this.getUIContext().getHostContext()?.getApplicationContext().on('environment', environmentCallback)
    // 设置应用深浅色跟随系统
    this.getUIContext()
      .getHostContext()?.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET)
  }

  aboutToDisappear() {
    // 解注册监听系统环境变化的回调
    this.getUIContext().getHostContext()?.getApplicationContext().off('environment', this.callbackId)
    this.contentNode?.dispose()
  }

  build() {
    NavDestination() {
      Row() {
        Column() {
          Button("click me")
            .onClick(() => {
              let uiContext = this.getUIContext();
              let promptAction = uiContext.getPromptAction();
              if (this.contentNode == null && uiContext.getHostContext() != undefined) {
                this.contentNode = new ComponentContent(uiContext, wrapBuilder(BuilderDialog), new Params(this.message,
                  uiContext.getHostContext()!!.getApplicationContext()
                    .resourceManager
                    .getConfigurationSync()
                    .colorMode))
              }
              if (this.contentNode == null) {
                return
              }
              promptAction.closeCustomDialog(this.contentNode)
              // 先关闭已存在的弹窗，再重新打开
              promptAction.openCustomDialog(this.contentNode).then(() => {
                console.info("succeeded")
              }).catch((error: BusinessError) => {
                console.error(`OpenCustomDialog args error code is ${error.code}, message is ${error.message}`);
              })
            })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
      .height('100%')
    }
  }
}
// [End custom_dialog_old_interface]