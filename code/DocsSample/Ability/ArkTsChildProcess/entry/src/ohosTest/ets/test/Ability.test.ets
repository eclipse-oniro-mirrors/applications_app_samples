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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Driver, ON } from '@ohos.UiTest'

const TAG = '[Sample_arktschildprocess]';
const DOMAIN = 0xF811;
const BUNDLE = 'arktschildprocess_';
const TIME = 1000;

let driver: Driver | undefined = undefined;
let uiReady: boolean = false;

// Create the UiTest driver lazily. Calling Driver.create() while the suite is
// being registered (before the test ability is ready) can throw 17000001 and
// crash the whole test process, so defer it until it is actually needed.
function ensureDriver(): Driver {
  if (driver === undefined) {
    driver = Driver.create();
  }
  if (driver === undefined) {
    throw new Error('Driver.create failed');
  }
  return driver;
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbilityFunction_001 begin');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        await abilityDelegator.startAbility({
          bundleName: 'com.sample.arktschildprocess',
          abilityName: 'EntryAbility'
        });
      } catch (err) {
        hilog.info(DOMAIN, TAG, BUNDLE + 'startAbility: ' + err.message);
      }
      // getCurrentTopAbility is not available from the test process, so confirm
      // that EntryAbility is displayed by locating a component on its home page.
      try {
        let uiDriver = ensureDriver();
        await uiDriver.delayMs(TIME);
        let startButton = await uiDriver.findComponent(ON.text('StartArkChildProcessNoArg_Promise'));
        uiReady = startButton !== null;
      } catch (err) {
        uiReady = false;
        hilog.info(DOMAIN, TAG, BUNDLE + 'ui verify skipped: ' + err.message);
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'EntryAbility page ready: ' + uiReady);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbilityFunction_001 end');
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('assertContain', 0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      let a = 'abc';
      let b = 'b';
      // Defines a variety of assertion methods, which are used to declare expected boolean conditions.
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    })
    it('ArkTsChildProcess_startChildProcess_Promise_001', 0, async (done: () => void) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'startChildProcess_Promise_001 begin');
      if (!uiReady) {
        hilog.info(DOMAIN, TAG, BUNDLE + 'ui not ready, startChildProcess_Promise_001 failed');
        expect(uiReady).assertTrue();
        done();
        return;
      }
      try {
        const button = await ensureDriver().findComponent(ON.text('StartArkChildProcessNoArg_Promise'));
        await button.click();
        await ensureDriver().delayMs(TIME);
        hilog.info(DOMAIN, TAG, BUNDLE + 'startChildProcess_Promise_001 end');
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${BUNDLE} ${err}`);
        expect().assertFail();
        done();
      }
    })
    it('ArkTsChildProcess_startChildProcess_Callback_001', 0, async (done: () => void) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'startChildProcess_Callback_001 begin');
      if (!uiReady) {
        hilog.info(DOMAIN, TAG, BUNDLE + 'ui not ready, startChildProcess_Callback_001 failed');
        expect(uiReady).assertTrue();
        done();
        return;
      }
      try {
        const button = await ensureDriver().findComponent(ON.text('StartArkChildProcessNoArg_Callback'));
        await button.click();
        await ensureDriver().delayMs(TIME);
        hilog.info(DOMAIN, TAG, BUNDLE + 'startChildProcess_Callback_001 end');
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${BUNDLE} ${err}`);
        expect().assertFail();
        done();
      }
    })
    it('ArkTsChildProcess_startArkChildProcess_WithArg_001', 0, async (done: () => void) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'startArkChildProcess_WithArg_001 begin');
      if (!uiReady) {
        hilog.info(DOMAIN, TAG, BUNDLE + 'ui not ready, startArkChildProcess_WithArg_001 failed');
        expect(uiReady).assertTrue();
        done();
        return;
      }
      try {
        const button = await ensureDriver().findComponent(ON.text('StartArkChildProcessWithArg'));
        await button.click();
        await ensureDriver().delayMs(TIME);
        hilog.info(DOMAIN, TAG, BUNDLE + 'startArkChildProcess_WithArg_001 end');
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${BUNDLE} ${err}`);
        expect().assertFail();
        done();
      }
    })
  })
}
