/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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

import AbilityStage from '@ohos.app.ability.AbilityStage';
import hilog from '@ohos.hilog';

const DOMAIN: number = 0xF811;
const TAG: string = 'BrowserTestStage';

/**
 * Ability stage of the ohosTest module.
 *
 * The stage only reports its lifecycle, the suites are driven by the
 * OpenHarmonyTestRunner. Keeping the hook here makes it obvious in hilog
 * whether the failure happened before the test ability was created.
 */
export default class TestAbilityStage extends AbilityStage {
  onCreate() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbilityStage onCreate');
  }

  onDestroy() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbilityStage onDestroy');
  }

  onAcceptWant(want: Object) {
    hilog.info(DOMAIN, TAG, '%{public}s', `onAcceptWant: ${JSON.stringify(want)}`);
    return '';
  }

  onConfigurationUpdated(config: Object) {
    hilog.info(DOMAIN, TAG, '%{public}s', `onConfigurationUpdated: ${JSON.stringify(config)}`);
  }

  onMemoryLevel(level: number) {
    hilog.info(DOMAIN, TAG, '%{public}s', `onMemoryLevel: ${level}`);
  }
}
