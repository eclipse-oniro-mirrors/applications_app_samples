'use static'
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base'
// [Start soft_keyboard_entryability_static]	
import { KeyboardAvoidMode } from '@ohos.arkui.UIContext';
import { hilog } from '@kit.PerformanceAnalysisKit';

// [StartExclude soft_keyboard_entryability_static]
export default class Entry2Ability extends UIAbility {	
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {	
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }
  try {
  // [EndExclude soft_keyboard_entryability_static]
onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
    let keyboardAvoidMode = windowStage.getMainWindowSync().getUIContext().getKeyboardAvoidMode();
    // 设置虚拟键盘抬起时压缩页面大小为减去键盘的高度
    windowStage.getMainWindowSync().getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE);
    if (err && err.code) {
      hilog.error(0x0000, 'testTag', 'Failed to load the content. ');
      return;
    }
    hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. ');
  });
} catch (e) {
  hilog.info(0x0000, 'testTag', 'loadContent catch error：-----------' + e.message);
}

  // [End soft_keyboard_entryability_static]
  }
}