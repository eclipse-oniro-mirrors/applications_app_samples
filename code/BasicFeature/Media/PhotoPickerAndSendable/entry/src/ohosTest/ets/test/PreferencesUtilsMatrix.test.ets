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

/**
 * Matrix suite of the preferences facade in the shared library.
 * Every case drives the real key value store through the ability context so
 * the round trips, the overwrite rules and the typed fallback quirks of the
 * facade are pinned against the actual persistence layer.
 */

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common, UIAbility } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { PreferencesUtils } from 'photopickersendable';

/** Log domain shared with the test ability so the streams stay comparable. */
const DOMAIN: number = 0xF811;
// Delegator used once by beforeAll to capture the running ability context.
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
// Captured once by beforeAll and consumed by every context based case below.
let abilityContext: common.UIAbilityContext | undefined = undefined;

/**
 * Registers every preferences matrix case of the sample.
 * All cases are self contained: every key used below is written and read
 * inside the same case so the execution order never matters.
 */
export default function preferencesUtilsMatrixTest() {
  describe('PreferencesUtilsMatrixTest', () => {
    // Suite tag keeps the setup logs searchable without touching case tags.
    const SUITE_TAG: string = 'PreferencesUtilsMatrixTest';

    beforeAll(async (): Promise<void> => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', SUITE_TAG + ' start');
      // The top ability while the suite runs is the test ability itself.
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      // The context property of the ability is the UIAbilityContext the facade requires.
      abilityContext = ability.context;
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', SUITE_TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_0100
     * @tc.name      testPrefMat0001
     * @tc.desc      Verify a string value round trips through putString and
     *               getString and the key becomes visible to hasKey.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPrefMat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testPrefMat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // beforeAll must have captured the context for this suite.
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.basic.string.0001';
      const value: string = 'photo picker preferences';
      // Storing the text reports success.
      expect(PreferencesUtils.putString(context, key, value)).assertTrue();
      // The stored key is immediately visible to the probe.
      expect(PreferencesUtils.hasKey(context, key)).assertTrue();
      // Reading the key back returns the exact stored text.
      expect(PreferencesUtils.getString(context, key, 'missing')).assertEqual(value);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_0200
     * @tc.name      testPrefMat0002
     * @tc.desc      Verify a positive and a negative integer round trip through
     *               putNumber and getNumber with exact values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPrefMat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testPrefMat0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.basic.number.0002';
      // A plain positive integer survives the store round trip.
      expect(PreferencesUtils.putNumber(context, key, 42)).assertTrue();
      expect(PreferencesUtils.getNumber(context, key, -1)).assertEqual(42);
      // Overwriting the same key with a negative integer keeps the exact value.
      expect(PreferencesUtils.putNumber(context, key, -17)).assertTrue();
      expect(PreferencesUtils.getNumber(context, key, -1)).assertEqual(-17);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_0300
     * @tc.name      testPrefMat0003
     * @tc.desc      Verify a boolean true round trips and an overwrite with
     *               false is read back as false.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPrefMat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testPrefMat0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.basic.boolean.0003';
      // True survives the store round trip.
      expect(PreferencesUtils.putBoolean(context, key, true)).assertTrue();
      expect(PreferencesUtils.getBoolean(context, key, false)).assertTrue();
      // Overwriting with false is also persisted exactly.
      expect(PreferencesUtils.putBoolean(context, key, false)).assertTrue();
      expect(PreferencesUtils.getBoolean(context, key, true)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_0400
     * @tc.name      testPrefMat0004
     * @tc.desc      Verify three keys of different types coexist in the shared
     *               store without overwriting each other.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const stringKey: string = 'mat.multi.string.0004';
      const numberKey: string = 'mat.multi.number.0004';
      const booleanKey: string = 'mat.multi.boolean.0004';
      // Store one entry of every supported type.
      expect(PreferencesUtils.putString(context, stringKey, 'multi')).assertTrue();
      expect(PreferencesUtils.putNumber(context, numberKey, 1234)).assertTrue();
      expect(PreferencesUtils.putBoolean(context, booleanKey, true)).assertTrue();
      // Every key reports as present.
      expect(PreferencesUtils.hasKey(context, stringKey)).assertTrue();
      expect(PreferencesUtils.hasKey(context, numberKey)).assertTrue();
      expect(PreferencesUtils.hasKey(context, booleanKey)).assertTrue();
      // Each read returns the value of its own key.
      expect(PreferencesUtils.getString(context, stringKey, '')).assertEqual('multi');
      expect(PreferencesUtils.getNumber(context, numberKey, 0)).assertEqual(1234);
      expect(PreferencesUtils.getBoolean(context, booleanKey, false)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_0500
     * @tc.name      testPrefMat0005
     * @tc.desc      Verify overwriting a string key replaces the old value so
     *               only the newest text is readable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.overwrite.string.0005';
      // Seed the first generation of the value.
      expect(PreferencesUtils.putString(context, key, 'generation one')).assertTrue();
      expect(PreferencesUtils.getString(context, key, '')).assertEqual('generation one');
      // The overwrite hides the first generation completely.
      expect(PreferencesUtils.putString(context, key, 'generation two')).assertTrue();
      expect(PreferencesUtils.getString(context, key, '')).assertEqual('generation two');
      // A default value can never shadow a stored value of the same type.
      expect(PreferencesUtils.getString(context, key, 'generation one')).assertEqual('generation two');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_0600
     * @tc.name      testPrefMat0006
     * @tc.desc      Verify overwriting a number key with a fractional value
     *               keeps the exact double value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.overwrite.number.0006';
      // Seed an integer generation first.
      expect(PreferencesUtils.putNumber(context, key, 100)).assertTrue();
      expect(PreferencesUtils.getNumber(context, key, 0)).assertEqual(100);
      // The fractional overwrite keeps every bit of the double value.
      expect(PreferencesUtils.putNumber(context, key, 0.5)).assertTrue();
      expect(PreferencesUtils.getNumber(context, key, 1)).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_0700
     * @tc.name      testPrefMat0007
     * @tc.desc      Verify fractional numbers round trip with full precision
     *               for a pi like value and a scaled value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const piKey: string = 'mat.float.pi.0007';
      const scaleKey: string = 'mat.float.scale.0007';
      // A pi like fraction survives the round trip unchanged.
      expect(PreferencesUtils.putNumber(context, piKey, 3.14159)).assertTrue();
      expect(PreferencesUtils.getNumber(context, piKey, 0)).assertEqual(3.14159);
      // A scaled integer value stays exact as well.
      expect(PreferencesUtils.putNumber(context, scaleKey, 1500)).assertTrue();
      expect(PreferencesUtils.getNumber(context, scaleKey, 0)).assertEqual(1500);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_0800
     * @tc.name      testPrefMat0008
     * @tc.desc      Verify an empty string value is stored as a real string so
     *               the read returns the empty string instead of the default.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.empty.string.0008';
      // The empty string is a real stored value, not a missing key.
      expect(PreferencesUtils.putString(context, key, '')).assertTrue();
      expect(PreferencesUtils.hasKey(context, key)).assertTrue();
      // The typed read returns the stored empty string, not the fallback.
      expect(PreferencesUtils.getString(context, key, 'fallback')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_0900
     * @tc.name      testPrefMat0009
     * @tc.desc      Verify the largest safe integer round trips without any
     *               precision loss through the store.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.boundary.maxint.0009';
      const maxSafe: number = 9007199254740991;
      // The upper safe integer boundary must survive unchanged.
      expect(PreferencesUtils.putNumber(context, key, maxSafe)).assertTrue();
      expect(PreferencesUtils.getNumber(context, key, 0)).assertEqual(maxSafe);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_1000
     * @tc.name      testPrefMat0010
     * @tc.desc      Verify the negative largest safe integer round trips
     *               without any precision loss through the store.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.boundary.minint.0010';
      const minSafe: number = -9007199254740991;
      // The lower safe integer boundary must survive unchanged.
      expect(PreferencesUtils.putNumber(context, key, minSafe)).assertTrue();
      expect(PreferencesUtils.getNumber(context, key, 0)).assertEqual(minSafe);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_1100
     * @tc.name      testPrefMat0011
     * @tc.desc      Verify deleteKey removes a stored key, reports true again
     *               for the already missing key and reads fall back afterwards.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPrefMat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testPrefMat0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.delete.basic.0011';
      // Seed the key and confirm it is present.
      expect(PreferencesUtils.putString(context, key, 'doomed')).assertTrue();
      expect(PreferencesUtils.hasKey(context, key)).assertTrue();
      // The removal reports success and the probe turns negative.
      expect(PreferencesUtils.deleteKey(context, key)).assertTrue();
      expect(PreferencesUtils.hasKey(context, key)).assertFalse();
      // A second removal of the missing key still reports success.
      expect(PreferencesUtils.deleteKey(context, key)).assertTrue();
      // Reads after the removal fall back to the caller default.
      expect(PreferencesUtils.getString(context, key, 'gone')).assertEqual('gone');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_1200
     * @tc.name      testPrefMat0012
     * @tc.desc      Verify clear returns true and hides every key that was
     *               written before the reset.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPrefMat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testPrefMat0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const firstKey: string = 'mat.clear.first.0012';
      const secondKey: string = 'mat.clear.second.0012';
      // Seed two keys of different types before the reset.
      expect(PreferencesUtils.putString(context, firstKey, 'clear me')).assertTrue();
      expect(PreferencesUtils.putNumber(context, secondKey, 77)).assertTrue();
      expect(PreferencesUtils.hasKey(context, firstKey)).assertTrue();
      expect(PreferencesUtils.hasKey(context, secondKey)).assertTrue();
      // One reset call wipes both keys at once.
      expect(PreferencesUtils.clear(context)).assertTrue();
      expect(PreferencesUtils.hasKey(context, firstKey)).assertFalse();
      expect(PreferencesUtils.hasKey(context, secondKey)).assertFalse();
      // Reads after the reset fall back for every wiped key.
      expect(PreferencesUtils.getString(context, firstKey, 'reset')).assertEqual('reset');
      expect(PreferencesUtils.getNumber(context, secondKey, 5)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_1300
     * @tc.name      testPrefMat0013
     * @tc.desc      Verify getString on a never written key returns the caller
     *               default, also when the default is the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPrefMat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testPrefMat0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const missingKey: string = 'mat.missing.string.0013';
      // The key was never written by any case of this suite.
      expect(PreferencesUtils.hasKey(context, missingKey)).assertFalse();
      // The text default is returned untouched for a missing key.
      expect(PreferencesUtils.getString(context, missingKey, 'default text')).assertEqual('default text');
      // An empty default is returned as the empty string.
      expect(PreferencesUtils.getString(context, missingKey, '')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_1400
     * @tc.name      testPrefMat0014
     * @tc.desc      Verify getNumber on a never written key returns the caller
     *               default, not the internal zero fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPrefMat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testPrefMat0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const missingKey: string = 'mat.missing.number.0014';
      // The key was never written by any case of this suite.
      expect(PreferencesUtils.hasKey(context, missingKey)).assertFalse();
      // A missing key yields the caller default because getSync returns it.
      expect(PreferencesUtils.getNumber(context, missingKey, 7)).assertEqual(7);
      expect(PreferencesUtils.getNumber(context, missingKey, 1234567890123)).assertEqual(1234567890123);
      // The zero default is indistinguishable from the internal fallback.
      expect(PreferencesUtils.getNumber(context, missingKey, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_1500
     * @tc.name      testPrefMat0015
     * @tc.desc      Verify getBoolean on a never written key returns the
     *               caller default for both the true and the false case.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPrefMat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testPrefMat0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const missingKey: string = 'mat.missing.boolean.0015';
      // The key was never written by any case of this suite.
      expect(PreferencesUtils.hasKey(context, missingKey)).assertFalse();
      // Both default directions are passed through for a missing key.
      expect(PreferencesUtils.getBoolean(context, missingKey, true)).assertTrue();
      expect(PreferencesUtils.getBoolean(context, missingKey, false)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_1600
     * @tc.name      testPrefMat0016
     * @tc.desc      Verify getNumber on a key that stores a string returns the
     *               internal zero fallback instead of the caller default.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.mismatch.string.to.number.0016';
      // Store a text value under the key first.
      expect(PreferencesUtils.putString(context, key, 'not a number')).assertTrue();
      // The typed read sees a string and falls back to the internal zero.
      expect(PreferencesUtils.getNumber(context, key, 42)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_1700
     * @tc.name      testPrefMat0017
     * @tc.desc      Verify getString on a key that stores a number returns the
     *               caller default instead of the numeric text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.mismatch.number.to.string.0017';
      // Store a numeric value under the key first.
      expect(PreferencesUtils.putNumber(context, key, 123)).assertTrue();
      // The text read sees a number and hands back the caller default.
      expect(PreferencesUtils.getString(context, key, 'fallback')).assertEqual('fallback');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_1800
     * @tc.name      testPrefMat0018
     * @tc.desc      Verify getBoolean on a key that stores a string returns
     *               the internal false fallback even for a true default.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.mismatch.string.to.boolean.0018';
      // Store a text value under the key first.
      expect(PreferencesUtils.putString(context, key, 'true like text')).assertTrue();
      // The boolean read sees a string and falls back to the internal false.
      expect(PreferencesUtils.getBoolean(context, key, true)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_1900
     * @tc.name      testPrefMat0019
     * @tc.desc      Verify getNumber on a key that stores a boolean returns
     *               the internal zero fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.mismatch.boolean.to.number.0019';
      // Store a boolean value under the key first.
      expect(PreferencesUtils.putBoolean(context, key, true)).assertTrue();
      // The numeric read sees a boolean and falls back to the internal zero.
      expect(PreferencesUtils.getNumber(context, key, 9)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_2000
     * @tc.name      testPrefMat0020
     * @tc.desc      Verify getBoolean on a key that stores a number returns
     *               the internal false fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.mismatch.number.to.boolean.0020';
      // Store a numeric value under the key first.
      expect(PreferencesUtils.putNumber(context, key, 1)).assertTrue();
      // The boolean read sees a number and falls back to the internal false.
      expect(PreferencesUtils.getBoolean(context, key, true)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_2100
     * @tc.name      testPrefMat0021
     * @tc.desc      Verify a string with unicode text, separators and quotes
     *               round trips unchanged through the store.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.special.unicode.0021';
      const value: string = '中文 photo/文件: "quoted" value';
      // Every character class survives the store round trip.
      expect(PreferencesUtils.putString(context, key, value)).assertTrue();
      expect(PreferencesUtils.getString(context, key, '')).assertEqual(value);
      // The value length is preserved character by character.
      expect(PreferencesUtils.getString(context, key, '').length).assertEqual(value.length);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_2200
     * @tc.name      testPrefMat0022
     * @tc.desc      Verify a long string value built by repeated concatenation
     *               round trips with the exact expected length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.special.long.0022';
      // Build a 400 character value without template strings.
      let longValue: string = '';
      for (let index: number = 0; index < 200; index++) {
        longValue = longValue + 'ab';
      }
      expect(longValue.length).assertEqual(400);
      // The long value survives the store round trip completely.
      expect(PreferencesUtils.putString(context, key, longValue)).assertTrue();
      const stored: string = PreferencesUtils.getString(context, key, '');
      expect(stored).assertEqual(longValue);
      expect(stored.length).assertEqual(400);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_2300
     * @tc.name      testPrefMat0023
     * @tc.desc      Verify a key that switches its stored type from number to
     *               string is finally read back as the newest string value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.lifecycle.typechange.0023';
      // First generation stores a number.
      expect(PreferencesUtils.putNumber(context, key, 5)).assertTrue();
      expect(PreferencesUtils.getNumber(context, key, 0)).assertEqual(5);
      // The second generation replaces the type with a string.
      expect(PreferencesUtils.putString(context, key, 'text generation')).assertTrue();
      // The string read wins because the newest stored type is a string.
      expect(PreferencesUtils.getString(context, key, 'default')).assertEqual('text generation');
      // The numeric read now sees a string and falls back to the internal zero.
      expect(PreferencesUtils.getNumber(context, key, 99)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFMAT_2400
     * @tc.name      testPrefMat0024
     * @tc.desc      Verify the full lifecycle of one key from absent over
     *               stored to deleted back to stored again.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefMat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefMat0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'mat.lifecycle.cycle.0024';
      // Stage one: the key is absent.
      expect(PreferencesUtils.hasKey(context, key)).assertFalse();
      // Stage two: the key is stored and visible.
      expect(PreferencesUtils.putBoolean(context, key, true)).assertTrue();
      expect(PreferencesUtils.hasKey(context, key)).assertTrue();
      expect(PreferencesUtils.getBoolean(context, key, false)).assertTrue();
      // Stage three: the key is deleted and invisible again.
      expect(PreferencesUtils.deleteKey(context, key)).assertTrue();
      expect(PreferencesUtils.hasKey(context, key)).assertFalse();
      // Stage four: the key can be stored again with a new value.
      expect(PreferencesUtils.putBoolean(context, key, false)).assertTrue();
      expect(PreferencesUtils.hasKey(context, key)).assertTrue();
      expect(PreferencesUtils.getBoolean(context, key, true)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
