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
import { bindResourceManager } from '../common/StringResource';
import { Logger } from '../utils/Logger';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // model 层返回的是资源名，必须先绑定 ResourceManager，页面上的状态与错误文案才能解析成中文
    bindResourceManager(this.context.resourceManager);
    if (!AppStorage.has(StorageKeys.APP_LOGS)) {
      AppStorage.setOrCreate<LogItem[]>(StorageKeys.APP_LOGS, []);
    }
    Logger.info('Ability', 'Lifecycle',
      `onCreate launchReason=${launchParam.launchReason} ability=${want.abilityName}`);
  }

  onDestroy(): void {
    Logger.info('Ability', 'Lifecycle', 'onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.info('Ability', 'Lifecycle', 'onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        Logger.error('Ability', 'Lifecycle', `load pages/Index failed: ${err.code} ${err.message}`);
        return;
      }
      Logger.info('Ability', 'Lifecycle', 'pages/Index loaded');
    });

    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
      Logger.debug('Ability', 'Config', 'color mode follows system');
    } catch (err) {
      Logger.error('Ability', 'Config', `set color mode failed: ${JSON.stringify(err)}`);
    }
  }

  onWindowStageDestroy(): void {
    Logger.info('Ability', 'Lifecycle', 'onWindowStageDestroy');
  }

  onForeground(): void {
    Logger.info('Ability', 'Lifecycle', 'onForeground');
  }

  onBackground(): void {
    Logger.info('Ability', 'Lifecycle', 'onBackground');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('Ability', 'Lifecycle',
      `onNewWant launchReason=${launchParam.launchReason} ability=${want.abilityName}`);
  }

  onConfigurationUpdate(newConfig: Configuration): void {
    Logger.info('Ability', 'Config',
      `onConfigurationUpdate direction=${newConfig.direction} colorMode=${newConfig.colorMode}`);
  }
}
