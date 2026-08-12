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

import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import hilog from '@ohos.hilog';
import testNapi from 'libentry.so';
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@ohos.base';

// [Start register_init_scheme]
export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // 注册三方协议的配置。
    testNapi.registerCustomSchemes();
    // 初始化Web组件内核，该操作会初始化Browser进程以及创建BrowserContext。
    webview.WebviewController.initializeWebEngine();
    // 设置SchemeHandler。
    testNapi.setSchemeHandler();
  }

// [StartExclude register_init_scheme]
  onWindowStageCreate(windowStage: window.WindowStage): void {
  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onWindowStageCreate');
    try {
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag', 'loadContent entering');
        if (err && err.code) {
          hilog.info(0x0000, 'testTag', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag', 'loadContent ok');
      });
    } catch (e) {
      hilog.info(0x0000, 'testTag', 'loadContent catch error：-----------' + e.message);
    }
  }
}

// [EndExclude register_init_scheme]
};
// [End register_init_scheme]
