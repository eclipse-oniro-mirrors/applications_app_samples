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
 * WITHOUT WARRANTIES OR CONDITIONS OF InputStyle KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import { AppStorage } from '@kit.ArkUI';

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onWindowStageCreate');
    // [Start input_case_input_store_windowStage]
    // 保存windowStage，供子窗创建使用
    AppStorage.setOrCreate('windowStage', windowStage);
    try {
      windowStage.loadContent('pages/PrivatePreview', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag', 'loadContent entering');
        if (err && err.code) {
          hilog.info(0x0000, 'testTag', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag', 'loadContent ok');
        // 保存主窗口id，供焦点切换使用
        let mainWindow: window.Window = windowStage.getMainWindowSync();
        AppStorage.setOrCreate('mainWindowId', mainWindow.getWindowProperties().id);
      });
    } catch (e) {
      hilog.info(0x0000, 'testTag', 'loadContent catch error：-----------' + e.message);
    }
    // [End input_case_input_store_windowStage]
  }
}
