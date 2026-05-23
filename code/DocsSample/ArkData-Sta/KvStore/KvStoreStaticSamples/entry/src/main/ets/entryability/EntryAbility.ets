'use static'
/*
 * Copyright (c) 2025 - 2026 Huawei Device Co., Ltd.
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

import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import { window } from '@kit.ArkUI';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import accessControl from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Logger from '../common/Logger';
import common from "@ohos.app.ability.common";

let appId: string = 'com.example.kvstoresamples';

export default class EntryAbility extends UIAbility {
  async checkAccessToken(permission: Permissions): Promise<abilityAccessCtrl.GrantStatus> {
    try {
      let atManager = abilityAccessCtrl.createAtManager();
      let grantStatus: abilityAccessCtrl.GrantStatus;
      let bundleInfo: bundleManager.BundleInfo;
      bundleInfo = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let appInfo: bundleManager.ApplicationInfo | null = bundleInfo.appInfo;
      if (appInfo !== null) {
grantStatus = await atManager.checkAccessToken(appInfo.accessTokenId.toInt(), permission);
        Logger.info(`checkAccessToken success`);
        return grantStatus;
      }
      return abilityAccessCtrl.GrantStatus.PERMISSION_DENIED;
    } catch (e) {
      Logger.info(`checkAccessToken failed,code is ${e.code},message is ${e.message}`);
      return abilityAccessCtrl.GrantStatus.PERMISSION_DENIED;
    }
  }

  async checkPermissions(): Promise<void> {
    const permissions: Permissions[] = ['ohos.permission.DISTRIBUTED_DATASYNC'];
    let grantStatus: abilityAccessCtrl.GrantStatus = await this.checkAccessToken(permissions[0]);

    if (grantStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
      Logger.info('testTag', '%{public}s', 'Permission already granted.');
    } else {
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let result = await atManager.requestPermissionsFromUser(this.context, permissions);
        Logger.info(`data::${JSON.stringify(result)}`);
      } catch(err) {
        Logger.error(`Fail to restore data. Code:${err.code},message:${err.message}`);
        return;
      }
    }
  }

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (err) {
      hilog.error(0x0000, 'testTag', 'Failed to set colorMode. Cause: %{public}s', JSON.stringify(err));
    }
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    AppStorage.setOrCreate<common.UIAbilityContext>("abilityContext", this.context);
    this.checkPermissions();
  }

  async onDestroy(): Promise<void> {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  async requestPermissionsAsync(): Promise<void> {
    let permissions: Permissions[] = [ 'ohos.permission.DISTRIBUTED_DATASYNC' ];
    let needGrantPermission = false;
    let accessManger = accessControl.createAtManager();
    let atManager = abilityAccessCtrl.createAtManager();
    Logger.info('[JSDemo]: app permission get bundle info');
    const bundleInfo = await bundleManager.getBundleInfoForSelf(
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
    const appInfo: bundleManager.ApplicationInfo | null = bundleInfo.appInfo;
    if (appInfo === null) {
      Logger.info('[JSDemo]: app permission appInfo is null');
      return;
    }
    Logger.info(`[JSDemo]: app permission query permission accessTokenId=${appInfo.accessTokenId}`);
    for (const permission of permissions) {
      Logger.info(`[JSDemo]: app permission query grant status ${permission}`);
      try {
        let grantStatus = await atManager.checkAccessToken(appInfo!.accessTokenId.toInt(), permission);
        if (grantStatus === accessControl.GrantStatus.PERMISSION_DENIED) {
          needGrantPermission = true;
          break;
        }
      } catch (err) {
        Logger.error(`[JSDemo]: app permission query grant status error ${permission} ${JSON.stringify(err)}`);
        needGrantPermission = true;
        break;
      }
    }
    if (needGrantPermission) {
      Logger.info('[JSDemo]: app permission needGrantPermission');
      try {
        await atManager.requestPermissionsFromUser(this.context, permissions);
      } catch (err) {
        Logger.error(`[JSDemo]: app permission ${JSON.stringify(err)}`);
      }
    } else {
      Logger.info('[JSDemo]: app permission already granted');
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
      if (err !== null && err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
    this.requestPermissionsAsync();
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}