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

import { AbilityConstant, Configuration, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { LogItem } from '../model/LogStore';
import { StorageKeys } from '../common/AppConstants';
import { Logger } from '../utils/Logger';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    if (!AppStorage.has(StorageKeys.APP_LOGS)) {
      AppStorage.setOrCreate<LogItem[]>(StorageKeys.APP_LOGS, []);
    }
    Logger.info('Ability', '生命周期',
      `onCreate launchReason=${launchParam.launchReason} ability=${want.abilityName}`);
  }

  onDestroy(): void {
    Logger.info('Ability', '生命周期', 'onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.info('Ability', '生命周期', 'onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        Logger.error('Ability', '生命周期', `加载 pages/Index 失败：${err.code} ${err.message}`);
        return;
      }
      Logger.info('Ability', '生命周期', 'pages/Index 加载完成');
    });

    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
      Logger.debug('Ability', '配置', '颜色模式跟随系统');
    } catch (err) {
      Logger.error('Ability', '配置', `设置颜色模式失败：${JSON.stringify(err)}`);
    }
  }

  onWindowStageDestroy(): void {
    Logger.info('Ability', '生命周期', 'onWindowStageDestroy');
  }

  onForeground(): void {
    Logger.info('Ability', '生命周期', 'onForeground');
  }

  onBackground(): void {
    Logger.info('Ability', '生命周期', 'onBackground');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('Ability', '生命周期',
      `onNewWant launchReason=${launchParam.launchReason} ability=${want.abilityName}`);
  }

  onConfigurationUpdate(newConfig: Configuration): void {
    Logger.info('Ability', '配置',
      `onConfigurationUpdate direction=${newConfig.direction} colorMode=${newConfig.colorMode}`);
  }
}
