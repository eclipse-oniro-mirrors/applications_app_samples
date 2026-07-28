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

// [Start call_executeaipagecommand_based_on_engine_version]
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';

interface AIPageCommand {
  method: string;
}

@Entry
@Component
struct ExecuteAIPageDemo {
  controller: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Button('executeAIPageCommand')
        .onClick(async () => {
          try {
            let commandObj: AIPageCommand = { method: 'getFullDom' };
            let command: string = JSON.stringify(commandObj);
            // 判断当前应用是否使用了M132遗留内核
            if (webview.WebviewController.getActiveWebEngineVersion() > webview.ArkWebEngineVersion.M132) {
                // 仅在M132版本之上的内核才可以调用executeAIPageCommand接口
                let result: string = await this.controller.executeAIPageCommand(command);
                console.info(`executeAIPageCommand result: ${result}`);
            }
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: 'about:blank', controller: this.controller })
    }
  }
}
// [End call_executeaipagecommand_based_on_engine_version]
