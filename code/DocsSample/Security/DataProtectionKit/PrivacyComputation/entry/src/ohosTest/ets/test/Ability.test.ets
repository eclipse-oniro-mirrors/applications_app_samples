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

import { describe, beforeAll, it, expect } from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'PrivacyComputation';
const BUNDLE_NAME: string = 'com.samples.privacycomputation';
const SLEEP_MS: number = 2000;

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

// 24000017: The capability is not supported.
const ERR_CAPABILITY_NOT_SUPPORTED: string = '24000017';

async function checkFlowResult(driver: Driver, prefix: string): Promise<boolean> {
  let matched = await driver.findComponent(ON.textStartsWith(prefix + ' matched:'));
  if (matched != null) {
    return true;
  }
  let errorResult = await driver.findComponent(ON.textStartsWith(prefix + ' error:'));
  if (errorResult != null) {
    let text = await errorResult.getText();
    if (text.includes(ERR_CAPABILITY_NOT_SUPPORTED)) {
      hilog.info(0x0000, 'testTag', '%{public}s', `${BUNDLE} capability not supported (24000017), expected on unsupported devices`);
      return true;
    }
  }
  return false;
}

export default function abilityTest() {
  let driver: Driver = Driver.create();
  describe('ActsAbilityTest', () => {
    beforeAll(async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `${BUNDLE} beforeAll begin`);
      try {
        await abilityDelegator.startAbility({
          bundleName: BUNDLE_NAME,
          abilityName: "EntryAbility"
        });
      } catch (err) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${BUNDLE} beforeAll error: ${JSON.stringify(err)}`);
      }
      hilog.info(0x0000, 'testTag', '%{public}s', `${BUNDLE} beforeAll end`);
      done();
    })

    /*
     * @tc.number: PrivacyComputationPsi001
     * @tc.name: run psi flow
     * @tc.desc: run psi flow and check result, 24000017 is expected on unsupported devices
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('PrivacyComputationPsi001', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `${BUNDLE}_psi_001 begin`);
      await sleep(SLEEP_MS);
      let psiButton = await driver.findComponent(ON.text('PSI Flow'));
      await psiButton.click();
      await sleep(SLEEP_MS * 2);
      let passed = await checkFlowResult(driver, 'PSI');
      expect(passed).assertTrue();
      hilog.info(0x0000, 'testTag', '%{public}s', `${BUNDLE}_psi_001 end`);
      await sleep(SLEEP_MS);
      done();
    })

    /*
     * @tc.number: PrivacyComputationPir002
     * @tc.name: run pir flow
     * @tc.desc: run pir flow and check result, 24000017 is expected on unsupported devices
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('PrivacyComputationPir002', 0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `${BUNDLE}_pir_002 begin`);
      await sleep(SLEEP_MS);
      let pirButton = await driver.findComponent(ON.text('PIR Flow'));
      await pirButton.click();
      await sleep(SLEEP_MS * 2);
      let passed = await checkFlowResult(driver, 'PIR');
      expect(passed).assertTrue();
      hilog.info(0x0000, 'testTag', '%{public}s', `${BUNDLE}_pir_002 end`);
      await sleep(SLEEP_MS);
      done();
    })
  })
}
