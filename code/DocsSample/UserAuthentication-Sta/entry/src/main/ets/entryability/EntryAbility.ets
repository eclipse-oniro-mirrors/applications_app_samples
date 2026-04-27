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

import { AbilityConstant, UIAbility, Want, Context } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window, AppStorage } from '@kit.ArkUI';
import Logger from '../common/Logger';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: int = Logger.getDomain();
const PREFIX: string = Logger.getPrefix();
const FORMAT: string = Logger.getFormat();

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, PREFIX, FORMAT, 'Ability onCreate');
  }

  async onDestroy(): Promise<void> {
    hilog.info(DOMAIN, PREFIX, FORMAT, 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, PREFIX, FORMAT, 'Ability onWindowStageCreate');
    AppStorage.setOrCreate<Context>('pageContext', this.context);
    windowStage.loadContent('pages/Index');
    windowStage.getMainWindowSync().getUIContext();
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, PREFIX, FORMAT, 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, PREFIX, FORMAT, 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, PREFIX, FORMAT, 'Ability onBackground');
  }
}
