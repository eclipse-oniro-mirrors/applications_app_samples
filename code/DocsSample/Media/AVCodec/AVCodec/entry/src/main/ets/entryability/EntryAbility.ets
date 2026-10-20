/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { window } from '@kit.ArkUI'
import Logger from '../common/utils/Logger'
import player from 'libplayer.so'

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('Ability onCreate');
    globalThis.context = this.context;
  }

  onDestroy(): void {
    Logger.info('Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // 主窗口创建后初始化页面和窗口状态。
    Logger.info('Ability onWindowStageCreate');

    const windowClass: window.Window = windowStage.getMainWindowSync(); // 获取应用主窗口
    windowClass.setWindowKeepScreenOn(true);
    const loadMainPage = (): void => {
      windowStage.loadContent('pages/Index', (err, data) => {
        if (err.code) {
          Logger.error('Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
          return;
        }
        AppStorage.setOrCreate('context', windowClass.getUIContext());
        Logger.info('Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
      });
    };
    const systemBarProperties: window.SystemBarProperties = {
      statusBarColor: '#000000',
      navigationBarColor: '#000000',
      statusBarContentColor: '#FFFFFF',
      navigationBarContentColor: '#FFFFFF',
      isStatusBarLightIcon: false,
      isNavigationBarLightIcon: false
    };
    // 初始窗口保持非全屏，全屏由播放页控制。
    windowClass.setWindowLayoutFullScreen(false)
      .then(() => {
        Logger.info('Succeeded in setting the initial window layout.');
        // 先启用系统栏再设置颜色，避免启动时出现白色导航区域。
        return windowClass.setWindowSystemBarEnable(['status', 'navigation']);
      })
      .then(() => {
        return windowClass.setWindowSystemBarProperties(systemBarProperties);
      })
      .then(() => {
        // 窗口颜色就绪后再加载页面。
        loadMainPage();
      })
      .catch((err: BusinessError) => {
        Logger.error('Failed to set the initial window layout.', JSON.stringify(err) ?? '');
        // 布局设置失败时仍打开页面。
        loadMainPage();
      });
  }

  onWindowStageDestroy(): void {
    Logger.info('Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // 通知 Native 播放器进入前台。
    Logger.info('Ability onForeground');
    player.setAppBackground(false);
  }

  onBackground(): void {
    // 通知 Native 播放器进入后台。
    Logger.info('Ability onBackground');
    player.setAppBackground(true);
  }
}
