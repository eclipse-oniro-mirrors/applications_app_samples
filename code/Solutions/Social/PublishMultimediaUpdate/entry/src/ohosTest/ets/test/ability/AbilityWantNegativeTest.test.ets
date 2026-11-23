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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import Want from '@ohos.app.ability.Want';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import Logger from '../Logger';
import { ABILITY_NAME, BUNDLE, BUNDLE_NAME, MODULE_NAME, PageText, TAG } from '../common/TestConstant';
import { createDriver, ensureAppVisible, launchApp, pageAlive, sleep, findByText } from '../common/UiFlowHelper';
import { Driver } from '@ohos.UiTest';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Failure behaviour of an explicit start request.
 * A wrong ability name or an unknown bundle must be reported as an error rather
 * than silently starting something else. The cases check the callback and the
 * promise forms, and confirm a valid request still works afterwards, so a
 * failed probe never leaves the sample in a broken state.
 */
function startRejects(want: Want): Promise<boolean> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  return new Promise<boolean>((resolve: (value: boolean) => void): void => {
    delegator.startAbility(want, (error: BusinessError): void => {
      const failed: boolean = error !== undefined && error !== null && error.code !== 0;
      resolve(failed);
    });
  });
}
export default function abilityWantNegativeTest() {
  describe('AbilityWantNegativeTest', () => {
    let driver: Driver;
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      driver = await createDriver();
      await launchApp();
      await sleep(500);
      await ensureAppVisible(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_WANT_0100
     * @tc.name WrongAbilityRejects001
     * @tc.desc Verify wrong ability rejects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WrongAbilityRejects_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'WrongAbilityRejects_001 begin');
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'NotDeclaredAbility'
      };
      const rejected: boolean = await startRejects(want);
      Logger.info(TAG, 'rejected=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'WrongAbilityRejects_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_WANT_0200
     * @tc.name EmptyAbilityRejects002
     * @tc.desc Verify empty ability rejects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyAbilityRejects_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'EmptyAbilityRejects_002 begin');
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: ''
      };
      const firstRun: boolean = await startRejects(want);
      const secondRun: boolean = await startRejects(want);
      expect(firstRun).assertTrue();
      expect(firstRun === secondRun).assertTrue();
      Logger.info(TAG, 'EmptyAbilityRejects_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_WANT_0300
     * @tc.name UnknownBundleRejects003
     * @tc.desc Verify unknown bundle rejects, as covered by the ability want negative test suite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnknownBundleRejects_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'UnknownBundleRejects_003 begin');
      const want: Want = {
        bundleName: 'com.samples.not.installed',
        abilityName: ABILITY_NAME
      };
      const rejected: boolean = await startRejects(want);
      Logger.info(TAG, 'rejected=' + JSON.stringify(rejected));
      expect(rejected).assertTrue();
      Logger.info(TAG, 'UnknownBundleRejects_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_WANT_0400
     * @tc.name InvalidRequestRepeatable004
     * @tc.desc Verify invalid request repeatable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InvalidRequestRepeatable_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'InvalidRequestRepeatable_004 begin');
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'NotDeclaredAbility'
      };
      const first: boolean = await startRejects(want);
      const second: boolean = await startRejects(want);
      const bothRejected: boolean = first && second;
      Logger.info(TAG, 'bothRejected=' + JSON.stringify(bothRejected));
      expect(bothRejected).assertTrue();
      Logger.info(TAG, 'InvalidRequestRepeatable_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_WANT_0500
     * @tc.name PromiseFormRejects005
     * @tc.desc Verify promise form rejects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PromiseFormRejects_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'PromiseFormRejects_005 begin');
      const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'NotDeclaredAbility'
      };
      let rejected: boolean = false;
      try {
        await delegator.startAbility(want);
      }
      catch (error) {
        rejected = true;
      }
      const check01: boolean = rejected;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'PromiseFormRejects_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_WANT_0600
     * @tc.name ValidStartAfterFailure006
     * @tc.desc Verify valid start after failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ValidStartAfterFailure_006', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ValidStartAfterFailure_006 begin');
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'NotDeclaredAbility'
      };
      await startRejects(want);
      const valid: Want = {
        bundleName: BUNDLE_NAME,
        moduleName: MODULE_NAME,
        abilityName: ABILITY_NAME
      };
      const rejected: boolean = await startRejects(valid);
      const started: boolean = rejected === false;
      Logger.info(TAG, 'started=' + JSON.stringify(started));
      expect(started).assertTrue();
      Logger.info(TAG, 'ValidStartAfterFailure_006 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_WANT_0700
     * @tc.name PageAliveAfterFailures007
     * @tc.desc Verify page alive after failures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PageAliveAfterFailures_007', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'PageAliveAfterFailures_007 begin');
      const want: Want = {
        bundleName: 'com.samples.not.installed',
        abilityName: ABILITY_NAME
      };
      await startRejects(want);
      await startRejects(want);
      await sleep(300);
      const alive: boolean = await pageAlive(driver);
      expect(alive).assertTrue();
      Logger.info(TAG, 'PageAliveAfterFailures_007 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_ABILITY_WANT_0800
     * @tc.name FeedStillRendered008
     * @tc.desc Verify feed still rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FeedStillRendered_008', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'FeedStillRendered_008 begin');
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'NotDeclaredAbility'
      };
      await startRejects(want);
      await sleep(300);
      const caption: boolean = await findByText(driver, PageText.FOLLOWING) !== null;
      expect(caption).assertTrue();
      Logger.info(TAG, 'FeedStillRendered_008 end');
      done();
    });
  });
}
