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
import hilog from '@ohos.hilog';
import TestRunner from '@ohos.application.testRunner';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@kit.BasicServicesKit';

export default class OpenHarmonyTestRunner implements TestRunner {
  private prepared: boolean = false;
  private started: boolean = false;

  onPrepare(): void {
    this.prepared = true;
    this.started = false;
    hilog.info(0x0000, 'MetadataRunner', 'Runner prepared');
  }

  onRun(): void {
    if (this.started) {
      hilog.warn(0x0000, 'MetadataRunner', 'Ignoring duplicate runner invocation');
      return;
    }
    this.started = true;
    if (!this.prepared) {
      hilog.warn(0x0000, 'MetadataRunner', 'Runner started without onPrepare');
    }
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    const want: Want = {
      bundleName: args.bundleName,
      abilityName: 'TestAbility'
    };
    hilog.info(0x0000, 'MetadataRunner', 'Launching test ability for %{public}s', args.bundleName);
    delegator.startAbility(want).then((): void => {
      hilog.info(0x0000, 'MetadataRunner', 'TestAbility launched');
    }).catch((error: BusinessError): void => {
      this.reportLaunchFailure(error);
    });
  }

  private reportLaunchFailure(error: BusinessError): void {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const message = 'TestAbility launch failed: ' + error.code;
    hilog.error(0x0000, 'MetadataRunner', '%{public}s', message);
    hilog.error(0x0000, 'MetadataRunner', 'Failure detail: %{public}s', error.message);
    delegator.finishTest(message, -1);
  }
}
