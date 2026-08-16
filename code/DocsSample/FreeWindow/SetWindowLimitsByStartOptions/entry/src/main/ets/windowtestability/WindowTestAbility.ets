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
// ets/windowtestability/WindowTestAbility.ets
// 新创建的UIAbility
import { window } from '@kit.ArkUI';
import { UIAbility } from '@kit.AbilityKit';

export default class WindowTestAbility extends UIAbility {
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        console.info(`Failed to load the content. Cause: ${JSON.stringify(err)}`);
        return;
      }
      console.info('Succeeded in loading the content.');
    });
  }
}
