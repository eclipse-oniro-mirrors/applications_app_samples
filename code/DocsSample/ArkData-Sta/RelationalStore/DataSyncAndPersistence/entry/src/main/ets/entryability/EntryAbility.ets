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
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageCreate');
    this.checkPermissions();
    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
      if (err?.code) {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
        return;
      }
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
    });
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onBackground');
  }

  async checkAccessToken(permission: Permissions): Promise<abilityAccessCtrl.GrantStatus> {
    let atManager = abilityAccessCtrl.createAtManager();
    let grantStatus: abilityAccessCtrl.GrantStatus = abilityAccessCtrl.GrantStatus.PERMISSION_DENIED;
    // 获取应用程序的accessTokenID
    let tokenId = 0;
    try {
      let bundleInfo: bundleManager.BundleInfo =
        await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let appInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo as bundleManager.ApplicationInfo;
      tokenId = appInfo.accessTokenId as int;
    } catch (err) {
      console.error('testTag', 'Failed to get bundle info for self, cause %{public}s', JSON.stringify(err) ?? '');
    }
    // 校验应用是否被授予权限
    try {
      grantStatus = await atManager.checkAccessToken(tokenId, permission);
    } catch (err) {
      console.error('testTag', 'Failed to check access token, cause %{public}s', JSON.stringify(err) ?? '');
    }
    return grantStatus;
  }

  /* 权限校验入口 */
  async checkPermissions(): Promise<void> {
    const permissions: Array<Permissions> = ['ohos.permission.DISTRIBUTED_DATASYNC'];
    // 检查权限授予情况
    let grantStatus: abilityAccessCtrl.GrantStatus = await this.checkAccessToken(permissions[0]);

    if (grantStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
      // 已获得授权
      console.info('testTag', '%{public}s', 'Permission already granted.');
    } else {
      // 未获得授权，需向用户申请授权
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.requestPermissionsFromUser(this.context,
          ['ohos.permission.DISTRIBUTED_DATASYNC', 'ohos.permission.ACCESS_SERVICE_DM'], (err, data) => {
            console.info('testTag', 'data: %{public}s', JSON.stringify(data));
            console.info('testTag', 'data permissions: %{public}s', data!.permissions);
            console.info('testTag', 'data authResults: %{public}s', data!.authResults);
          });
      } catch (err) {
        console.error('testTag', 'catch err-> %{public}s', JSON.stringify(err) ?? '');
        return;
      }
    }
  }
}