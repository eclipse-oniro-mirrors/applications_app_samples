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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { DOMAIN, TAG } from '../TestLog';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, 'Prepare UI tests');
  }

  async onRun(): Promise<void> {
    const args = abilityDelegatorRegistry.getArguments();
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    let command: string = `aa start -d 0 -a TestAbility -b ${args.bundleName}`;
    const user = args.parameters['-u'];
    if (user !== undefined) {
      command += ` -u ${user}`;
    }
    if (args.parameters['-D'] === 'true') {
      command += ' -D';
    }
    delegator.executeShellCommand(command, (error: BusinessError): void => {
      if (error?.code) {
        hilog.error(DOMAIN, TAG, 'Test ability launch failed, code=%{public}d', error.code);
      }
    });
  }
}
