/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
export default class EntryAbility extends UIAbility {
  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/Index', (err) => {
      let windowClass = windowStage.getMainWindowSync();
      try {
        let windowLimits: window.WindowLimits = {
          maxWidth: 1500,
          maxHeight: 1000,
          minWidth: 600,
          minHeight: 500
        };
        let promise = windowClass.setWindowLimits(windowLimits);
        promise.then((data) => {
          console.info('Succeeded in changing the window limits. Cause:' + JSON.stringify(data));
        }).catch((err: BusinessError) => {
          console.error(`Failed to change the window limits. Cause code: ${err.code}, message: ${err.message}`);
        });
      } catch (exception) {
        console.error(`Failed to change the window limits. Cause code: ${exception.code}, message: ${exception.message}`);
      }
    });
  }
}
