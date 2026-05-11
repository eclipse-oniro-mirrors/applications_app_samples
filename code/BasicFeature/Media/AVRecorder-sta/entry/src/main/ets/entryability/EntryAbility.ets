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

import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base'
import Logger from '../utils/Logger';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from '@ohos.abilityAccessCtrl';

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('testTag', 'EntryAbility onCreate');
    this.requestPermissions();
  }

  requestPermissions(): void {
    const permissions: Permissions[] = [
      'ohos.permission.MEDIA_LOCATION',
      'ohos.permission.READ_MEDIA',
      'ohos.permission.WRITE_MEDIA',
      'ohos.permission.CAMERA',
      'ohos.permission.MICROPHONE'
    ];

    const atManager = abilityAccessCtrl.createAtManager();
    try {
      atManager.requestPermissionsFromUser(this.context, permissions)
        .then((data) => {
          Logger.info('testTag', 'requestPermissionsFromUser success, data: ' + JSON.stringify(data));
        })
        .catch((err: Error) => {
          Logger.error('testTag', 'requestPermissionsFromUser failed, errCode: ' + err.code + ', errMsg: ' + err.message);
        });
    } catch (err) {
      Logger.error('testTag', 'requestPermissionsFromUser catch error: ' + err);
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.info('testTag', 'EntryAbility onWindowStageCreate');
    try {
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        Logger.info('testTag', 'EntryAbility onWindowStageCreate, loadContent entering');
        if (err && err.code) {
          Logger.error('testTag', 'EntryAbility onWindowStageCreate, loadContent error: ' + err.message);
          return;
        }
        Logger.info('testTag', 'EntryAbility onWindowStageCreate, loadContent ok');
      });
    } catch (e) {
      Logger.error('testTag', 'EntryAbility onWindowStageCreate, loadContent catch error: ' + e.message);
    }
  }
}