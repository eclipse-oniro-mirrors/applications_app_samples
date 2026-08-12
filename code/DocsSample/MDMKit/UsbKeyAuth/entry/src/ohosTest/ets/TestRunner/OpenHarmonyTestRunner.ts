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

import { AbilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TestAbility } from '../testability/TestAbility';

const TAG = 'UsbKeyAuthTestRunner';
const DOMAIN = 0x0001;

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, 'OpenHarmonyTestRunner onPrepare');
  }

  onRun(): void {
    hilog.info(DOMAIN, TAG, 'OpenHarmonyTestRunner onRun');
    const abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const bundleName = abilityDelegator.getBundleName();
    const want: Want = {
      bundleName: bundleName,
      abilityName: 'TestAbility',
    };
    abilityDelegator.startAbility(want, (err) => {
      if (err) {
        hilog.error(DOMAIN, TAG, `startAbility failed: ${JSON.stringify(err)}`);
      }
    });
  }
}
