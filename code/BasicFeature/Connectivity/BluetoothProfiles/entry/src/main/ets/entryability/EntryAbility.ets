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
    if (!AppStorage.has(StorageKeys.APP_LOGS)) {
      AppStorage.setOrCreate<LogItem[]>(StorageKeys.APP_LOGS, []);
    }
    // 页面与纯逻辑层都通过 StringResource 取文案，资源管理器必须在第一个界面加载前绑定
    bindResourceManager(this.context.resourceManager);
    Logger.info('Ability', 'lifecycle',
      `onCreate launchReason=${launchParam.launchReason} ability=${want.abilityName}`);
  }

  onDestroy(): void {
    Logger.info('Ability', 'lifecycle', 'onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.info('Ability', 'lifecycle', 'onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        Logger.error('Ability', 'lifecycle', `load pages/Index failed: ${err.code} ${err.message}`);
        return;
      }
      Logger.info('Ability', 'lifecycle', 'pages/Index loaded');
    });

    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
      Logger.debug('Ability', 'config', 'color mode follows system');
    } catch (err) {
      Logger.error('Ability', 'config', `set color mode failed: ${JSON.stringify(err)}`);
    }
  }

  onWindowStageDestroy(): void {
    Logger.info('Ability', 'lifecycle', 'onWindowStageDestroy');
  }

  onForeground(): void {
    Logger.info('Ability', 'lifecycle', 'onForeground');
  }

  onBackground(): void {
    Logger.info('Ability', 'lifecycle', 'onBackground');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('Ability', 'lifecycle',
      `onNewWant launchReason=${launchParam.launchReason} ability=${want.abilityName}`);
  }

  onConfigurationUpdate(newConfig: Configuration): void {
    Logger.info('Ability', 'config',
      `onConfigurationUpdate direction=${newConfig.direction} colorMode=${newConfig.colorMode}`);
  }
}
