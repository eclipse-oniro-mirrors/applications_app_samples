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

// [Start onContinue]

import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog';
import { LocalStorage } from '@kit.ArkUI';
import Want from '@ohos.app.ability.Want';
import { wantConstant } from '@kit.AbilityKit';

class EntryAbility extends UIAbility {
  // [StartExclude onContinue]
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
    if (launchParam.launchReason === AbilityConstant.LaunchReason.CONTINUATION) {
      let storage = new LocalStorage();
      let continueInput = '';
      if (want.parameters !== undefined) {
        continueInput = JSON.stringify(want?.parameters);
        console.info(`continue input ${continueInput}`)
        hilog.info(0x0000, 'testTag EntryAbility', `continue input ${continueInput}`);
      }
      this.context.setMissionContinueState(AbilityConstant.ContinueState.ACTIVE);
      this.context.restoreWindowStage(storage);
    }
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', `EntryAbility onNewWant ${AbilityConstant.LaunchReason.CONTINUATION}`);
    if (launchParam.launchReason === AbilityConstant.LaunchReason.CONTINUATION) {
      let storage = new LocalStorage();
      let continueInput = '';
      if (want.parameters !== undefined) {
        continueInput = JSON.stringify(want?.parameters);
        hilog.info(0x0000, 'testTag EntryAbility', `continue input ${continueInput}`);
      }
      this.context.setMissionContinueState(AbilityConstant.ContinueState.ACTIVE);
      this.context.restoreWindowStage(storage);
    }
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onDestroy');
    return undefined;
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
      if (err?.code) {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
        return;
      }
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
    });
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onBackground');
  }
  // [EndExclude onContinue]

  onContinue(wantParam: Record<string, Object>):AbilityConstant.OnContinueResult {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onContinue');
    try {
      const continueInput = '迁移的数据';
      if (continueInput) {
        wantParam['data'] = continueInput;
      }
      wantParam[wantConstant.Params.SUPPORT_CONTINUE_PAGE_STACK_KEY] = false;
      wantParam[wantConstant.Params.SUPPORT_CONTINUE_SOURCE_EXIT_KEY] = false;
    } catch(err) {
      console.log('xxx,', 'testddo,err,' + JSON.stringify(err.code) +  JSON.stringify(err.message));
      hilog.info(0x0000, 'testTag EntryAbility', JSON.stringify(err));
    }
    return AbilityConstant.OnContinueResult.AGREE;
  }

  // [StartExclude onContinue]
  onWindowStageRestore(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageRestore');
    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
      if (err?.code) {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
        return;
      }
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
    });
  }
  // [EndExclude onContinue]
}
// [End onContinue]