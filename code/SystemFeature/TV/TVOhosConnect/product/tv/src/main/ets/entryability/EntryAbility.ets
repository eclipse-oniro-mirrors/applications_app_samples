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

import type { AbilityConstant } from '@kit.AbilityKit';
import { abilityAccessCtrl } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIAbility } from '@kit.AbilityKit';
import type { Want } from '@kit.AbilityKit';
import type { window } from '@kit.ArkUI';
import { emitter } from '@kit.BasicServicesKit';
import { CommonConstants, DeviceUtils, EventConstants, Logger, NetManager } from '@ohos/common';
import { DeviceManagerFactory } from '@ohos/device_manager';
import { BusinessError } from '@kit.BasicServicesKit';
import { HMRouterMgr } from '@hadss/hmrouter';
import { display } from '@kit.ArkUI';
import { preferences } from '@kit.ArkData';

const TAG = 'EntryAbility';

/**
 * Lift cycle management of Ability.
 */
export default class EntryAbility extends UIAbility {
  // 路由表初始化任务：首页依赖它，加载页面前必须有结果（最多等 3 秒）
  private routerInit: Promise<void> = Promise.resolve();

  public onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    AppStorage.setOrCreate<boolean>('is4k', display.getDefaultDisplaySync().width > 3800);
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    try {
      atManager.requestPermissionsFromUser((this.context), ['ohos.permission.ACCESS_BLUETOOTH']).then((data) => {
        Logger.info(TAG, 'data: ' + JSON.stringify(data));
      }).catch((err: object) => {
        Logger.info(TAG, 'err: ' + JSON.stringify(err));
      });
    } catch (err) {
      Logger.info(TAG, 'catch err->' + JSON.stringify(err));
    }
    // 日志必须在 init 之前开启，否则初始化阶段的日志会丢失
    HMRouterMgr.openLog('DEBUG');
    this.routerInit = HMRouterMgr.init({
      context: this.context
    }).then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'HMRouter init success');
    }).catch((error: BusinessError) => {
      hilog.error(0x0000, 'testTag', 'HMRouter init failed: %{public}s', JSON.stringify(error) ?? '');
    });
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    DeviceManagerFactory.createDeviceManager();
    NetManager.getInstance().initNetConnection();
    DeviceUtils.getDeviceId().then((value) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'add getDeviceId ' + value);
    }).catch((error: BusinessError) => {
      hilog.error(0x0000, 'testTag', '%{public}s', 'add getDeviceId error ' + error?.message);
    });
  }

  public onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    DeviceManagerFactory.releaseDeviceManager();
    NetManager.getInstance().releaseNetConnection();
  }

  public async onWindowStageCreate(windowStage: window.WindowStage): Promise<void> {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    // 首页依赖 HMRouter 路由表，必须等初始化完成后再加载，否则 Navigation 会取不到 homePageUrl
    await this.waitRouterInit();
    let isPrivacyAllowed = false;
    try {
      isPrivacyAllowed = await this.getPrivacyAllowed();
    } catch (error) {
      Logger.error(TAG, 'Failed to read privacy preference');
    }
    windowStage.loadContent(isPrivacyAllowed ? 'pages/HomeIndex' : 'pages/LauncherPage', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      windowStage.getMainWindowSync().setWindowBackgroundColor('#F1F3F5');
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
    let window = windowStage.getMainWindowSync();
    this.updateBreakpoint(window.getWindowProperties().windowRect.width);
    window.on('windowSizeChange', (data) => {
      this.updateBreakpoint(data.width);
    });
  }

  /**
   * 等待路由表初始化完成，最多等 3 秒，避免初始化异常时首页一直不加载。
   */
  private async waitRouterInit(): Promise<void> {
    let timer: number = -1;
    let timeout: Promise<void> = new Promise<void>((resolve: () => void) => {
      timer = setTimeout(() => {
        resolve();
      }, 3000);
    });
    await Promise.race([this.routerInit, timeout]);
    if (timer !== -1) {
      clearTimeout(timer);
    }
  }

  public getPrivacyAllowed(): Promise<boolean> {
    return new Promise((resolve, reject) => {
      preferences.getPreferences(this.context, CommonConstants.PREFERENCES_FILE_NAME)
        .then((preferences: preferences.Preferences) => {
          return preferences.get(CommonConstants.PREFERENCES_KEY_PRIVACY, false);
        }).then((value: preferences.ValueType) => {
        if (value) {
          resolve(true);
        } else {
          resolve(false);
        }
      }).catch((error: BusinessError) => {
        Logger.error(TAG, 'getPrivacyAllowed fail error = ' + JSON.stringify(error));
        resolve(false);
      });
    });

  }

  private updateBreakpoint(width: number) {
    let windowWidthVp = width / (display.getDefaultDisplaySync().densityDPI / 160);
    let newBreakPoint: string = '';
    if (windowWidthVp < 400) {
      newBreakPoint = 'xs';
    } else if (windowWidthVp < 600) {
      newBreakPoint = 'sm';
    } else if (windowWidthVp < 800) {
      newBreakPoint = 'md';
    } else {
      newBreakPoint = 'lg';
    }
    AppStorage.setOrCreate('currentBreakpoint', newBreakPoint);
  }

  public onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  public onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');

    let innerEvent: emitter.InnerEvent = {
      eventId: EventConstants.ON_FOREGROUND_EVENT,
      priority: emitter.EventPriority.HIGH
    };
    emitter.emit(innerEvent);
  }

  public onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
};
