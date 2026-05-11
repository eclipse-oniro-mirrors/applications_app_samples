'use static'

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