/*
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
import { AbilityConstant, UIAbility, Want, abilityAccessCtrl } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.info('Tag_NoiseReduction: onCreate');
  }

  onDestroy(): void {
    console.info('Tag_NoiseReduction: onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    console.info('Tag_NoiseReduction: onWindowStageCreate');
    this.requestMicrophonePermission();
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        console.error('Tag_NoiseReduction: Failed to load content. ' + JSON.stringify(err));
        return;
      }
      console.info('Tag_NoiseReduction: Succeeded in loading content.');
    });
  }

  onWindowStageDestroy(): void {
    console.info('Tag_NoiseReduction: onWindowStageDestroy');
  }

  private requestMicrophonePermission(): void {
    const atManager = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionsFromUser(this.context, ['ohos.permission.MICROPHONE']).then((result) => {
      console.info('Tag_NoiseReduction: Permission request result: ' + JSON.stringify(result.authResults));
    }).catch((err: Error) => {
      console.error('Tag_NoiseReduction: Permission request failed: ' + err.message);
    });
  }
}
