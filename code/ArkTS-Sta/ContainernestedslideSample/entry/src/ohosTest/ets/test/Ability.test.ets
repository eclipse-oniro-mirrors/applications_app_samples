'use static';

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
import bundleManager from '@ohos.bundle.bundleManager';
import { describe, it, expect, beforeAll } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { logSuite } from './Shared/Support.ets';
import { FIXED_TIME, isValidTime, parseTime, MODEL_FIELDS } from './Shared/SharedDriver.ets';

export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      logSuite('ActsAbilityTest', 'begin');
    });

    /**
     * @tc.name delegatorExposesRunningAbilityContext
     * @tc.desc The test delegator exposes a live application context with bundle metadata.
     * @tc.type Function
     * @tc.level Level0
     */
    it('delegatorExposesRunningAbilityContext', 0, () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      expect(delegator !== undefined).assertTrue();
      expect(delegator !== null).assertTrue();
      const context = delegator.getAppContext();
      expect(context !== undefined).assertTrue();
      expect(context.applicationInfo !== undefined).assertTrue();
    });

    /**
     * @tc.name testBundleReportsNonEmptyName
     * @tc.desc The test bundle name is non-empty, dotted and contains no whitespace.
     * @tc.type Function
     * @tc.level Level1
     */
    it('testBundleReportsNonEmptyName', 0, () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      const info = bundleManager.getBundleInfoForSelfSync(0);
      expect(info.name.length > 0).assertTrue();
      expect(info.name.indexOf('.')).assertLarger(-1);
      expect(info.name.indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.name applicationInfoVersionIsBounded
     * @tc.desc Version code stays in the documented non-negative range and a version name exists.
     * @tc.type Function
     * @tc.level Level1
     */
    it('applicationInfoVersionIsBounded', 0, () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      const info = bundleManager.getBundleInfoForSelfSync(0);
      expect(info.versionCode >= 0).assertTrue();
      expect(info.versionCode < 100000000).assertTrue();
      expect(info.versionName.length > 0).assertTrue();
    });

    /**
     * @tc.name installedTimeIsPlausibleEpochValue
     * @tc.desc Install time is a plausible epoch value not later than the current device time.
     * @tc.type Function
     * @tc.level Level2
     */
    it('installedTimeIsPlausibleEpochValue', 0, () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      const info = bundleManager.getBundleInfoForSelfSync(0);
      expect(info.installTime >= 0).assertTrue();
      expect(info.installTime <= Date.now()).assertTrue();
    });

    /**
     * @tc.name sharedTimestampOracleIsValidOnDevice
     * @tc.desc The shared fixed timestamp parses into 2024-11-01 23:00:00 on device.
     * @tc.type Function
     * @tc.level Level1
     */
    it('sharedTimestampOracleIsValidOnDevice', 0, () => {
      expect(isValidTime(FIXED_TIME)).assertTrue();
      const parts = parseTime(FIXED_TIME);
      expect(parts !== null).assertTrue();
      expect(FIXED_TIME.length).assertEqual(19);
      expect(parts === null ? 0 : parts.year).assertEqual(2024);
      expect(parts === null ? 0 : parts.month).assertEqual(11);
      expect(parts === null ? 0 : parts.hour).assertEqual(23);
    });

    /**
     * @tc.name modelFieldOracleSurvivesRuntimeLoad
     * @tc.desc The seven comment model fields keep their declared order after module load.
     * @tc.type Function
     * @tc.level Level1
     */
    it('modelFieldOracleSurvivesRuntimeLoad', 0, () => {
      expect(MODEL_FIELDS.length).assertEqual(7);
      expect(MODEL_FIELDS[0]).assertEqual('id');
      expect(MODEL_FIELDS[3]).assertEqual('replyId');
      expect(MODEL_FIELDS[6]).assertEqual('commentTime');
      expect(MODEL_FIELDS.indexOf('user')).assertEqual(2);
      expect(MODEL_FIELDS.indexOf('url')).assertEqual(1);
    });

    /**
     * @tc.name delegatorInstanceKeepsApplicationContextStable
     * @tc.desc Two delegator lookups return the same bundle, version and install time.
     * @tc.type Function
     * @tc.level Level2
     */
    it('delegatorInstanceKeepsApplicationContextStable', 0, () => {
      const first = bundleManager.getBundleInfoForSelfSync(0);
      const second = bundleManager.getBundleInfoForSelfSync(0);
      expect(first.name).assertEqual(second.name);
      expect(first.versionCode).assertEqual(second.versionCode);
      expect(first.installTime).assertEqual(second.installTime);
    });
  });
}
