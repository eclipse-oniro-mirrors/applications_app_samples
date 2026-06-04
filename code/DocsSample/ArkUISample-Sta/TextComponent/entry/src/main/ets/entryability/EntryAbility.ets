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
import { BusinessError } from '@ohos.base';
import resourceToStringManager from '../common/resource';
// [Start cursor_avoid_part1]
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { KeyboardAvoidMode } from '@ohos.arkui.UIContext';
// [End cursor_avoid_part1]

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    resourceToStringManager.setContext(this.context);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  // [Start cursor_avoid_part2]
  // Used in UIAbility
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    try {
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag', 'loadContent entering');
        let keyboardAvoidMode = windowStage.getMainWindowSync().getUIContext().getKeyboardAvoidMode();
        windowStage.getMainWindowSync().getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.OFFSET_WITH_CARET);
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
  // [End cursor_avoid_part2]

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}