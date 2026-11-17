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
 * Edge suite of the preferences facade in the shared library.
 * The cases probe the fallback rules of the typed getters, the boundary
 * values of numbers and strings, unusual but legal key shapes and the
 * overwrite and cleanup behaviour at the edges of the key value store.
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
 * Registers every preferences edge case of the sample.
 * Every case owns its unique key namespace prefixed with edge. so no case
 * depends on the writes of another case or of the other suites.
 */
export default function preferencesUtilsEdgeTest() {
  describe('PreferencesUtilsEdgeTest', () => {
    // Suite tag keeps the setup logs searchable without touching case tags.
    const SUITE_TAG: string = 'PreferencesUtilsEdgeTest';

    beforeAll(async (): Promise<void> => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', SUITE_TAG + ' start');
      // The top ability while the suite runs is the test ability itself.
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      // The context property of the ability is the UIAbilityContext the facade requires.
      abilityContext = ability.context;
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', SUITE_TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_0100
     * @tc.name      testPrefEdge0001
     * @tc.desc      Verify getString on a missing key degrades to an empty
     *               string default without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      // This key is never written by any case of this suite.
      const missingKey: string = 'edge.missing.string.empty.0100';
      expect(PreferencesUtils.hasKey(context, missingKey)).assertFalse();
      // The empty default is handed back unchanged for the missing key.
      expect(PreferencesUtils.getString(context, missingKey, '')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_0200
     * @tc.name      testPrefEdge0002
     * @tc.desc      Verify getString on a missing key returns a multi word
     *               default with spaces and punctuation unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const missingKey: string = 'edge.missing.string.words.0200';
      const fallback: string = 'not stored anywhere, really';
      expect(PreferencesUtils.hasKey(context, missingKey)).assertFalse();
      // The caller default passes through the getter untouched.
      expect(PreferencesUtils.getString(context, missingKey, fallback)).assertEqual(fallback);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_0300
     * @tc.name      testPrefEdge0003
     * @tc.desc      Verify getNumber on missing keys returns each provided
     *               default including zero, a negative value and a large value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      // Three distinct missing keys receive three distinct defaults.
      expect(PreferencesUtils.getNumber(context, 'edge.missing.num.zero.0300', 0)).assertEqual(0);
      expect(PreferencesUtils.getNumber(context, 'edge.missing.num.negative.0300', -1)).assertEqual(-1);
      expect(PreferencesUtils.getNumber(context, 'edge.missing.num.large.0300', 1234567890123))
        .assertEqual(1234567890123);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_0400
     * @tc.name      testPrefEdge0004
     * @tc.desc      Verify getBoolean on missing keys returns each provided
     *               default in both the true and the false direction.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      // The true default passes through for a missing key.
      expect(PreferencesUtils.getBoolean(context, 'edge.missing.bool.true.0400', true)).assertTrue();
      // The false default passes through for another missing key.
      expect(PreferencesUtils.getBoolean(context, 'edge.missing.bool.false.0400', false)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_0500
     * @tc.name      testPrefEdge0005
     * @tc.desc      Verify hasKey reports false for unusual but legal key
     *               shapes that were never written to the store.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      // A key with one leading space is a legal but unusual shape.
      expect(PreferencesUtils.hasKey(context, ' ')).assertFalse();
      // A key with inner spaces stays a legal key shape.
      expect(PreferencesUtils.hasKey(context, 'key with spaces')).assertFalse();
      // A multi byte unicode key was never written either.
      expect(PreferencesUtils.hasKey(context, '中文键名')).assertFalse();
      // A slash separated path like key stays absent.
      expect(PreferencesUtils.hasKey(context, 'edge/not/exist.0500')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_0600
     * @tc.name      testPrefEdge0006
     * @tc.desc      Verify a key containing only one space stores and reads a
     *               boolean value correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPrefEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPrefEdge0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const spaceKey: string = ' ';
      // The one character whitespace key accepts a write.
      expect(PreferencesUtils.putBoolean(context, spaceKey, true)).assertTrue();
      expect(PreferencesUtils.hasKey(context, spaceKey)).assertTrue();
      expect(PreferencesUtils.getBoolean(context, spaceKey, false)).assertTrue();
      // Clean the unusual key up so later runs start from the same state.
      expect(PreferencesUtils.deleteKey(context, spaceKey)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_0700
     * @tc.name      testPrefEdge0007
     * @tc.desc      Verify a multi byte unicode key stores and reads a string
     *               value with the exact original characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPrefEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPrefEdge0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const unicodeKey: string = 'edge.键.0700';
      const unicodeValue: string = '值包含中文与 emoji 📷';
      // The unicode pair round trips unchanged.
      expect(PreferencesUtils.putString(context, unicodeKey, unicodeValue)).assertTrue();
      expect(PreferencesUtils.getString(context, unicodeKey, '')).assertEqual(unicodeValue);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_0800
     * @tc.name      testPrefEdge0008
     * @tc.desc      Verify keys with dots and slashes store and read number
     *               values independently of each other.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPrefEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPrefEdge0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const dottedKey: string = 'edge.dotted.key.0800';
      const slashedKey: string = 'edge/slashed/key.0800';
      // Both key shapes store their own number.
      expect(PreferencesUtils.putNumber(context, dottedKey, 7)).assertTrue();
      expect(PreferencesUtils.putNumber(context, slashedKey, 9)).assertTrue();
      // Each key keeps its own value without cross talk.
      expect(PreferencesUtils.getNumber(context, dottedKey, 0)).assertEqual(7);
      expect(PreferencesUtils.getNumber(context, slashedKey, 0)).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_0900
     * @tc.name      testPrefEdge0009
     * @tc.desc      Verify a 300 character key stores and reads a string
     *               value and reports itself through hasKey.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPrefEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPrefEdge0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      // Build one long key by plain concatenation.
      let longKey: string = 'edge.long.';
      for (let index: number = 0; index < 29; index++) {
        longKey = longKey + '0123456789';
      }
      expect(longKey.length).assertEqual(300);
      // The long key stores and reads its value without truncation.
      expect(PreferencesUtils.putString(context, longKey, 'long key value')).assertTrue();
      expect(PreferencesUtils.hasKey(context, longKey)).assertTrue();
      expect(PreferencesUtils.getString(context, longKey, '')).assertEqual('long key value');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_1000
     * @tc.name      testPrefEdge0010
     * @tc.desc      Verify a five kilobyte string value round trips with the
     *               exact original length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPrefEdge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPrefEdge0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'edge.value.big.1000';
      // Build a 5000 character payload out of repeating chunks.
      let bigValue: string = '';
      for (let index: number = 0; index < 500; index++) {
        bigValue = bigValue + '0123456789';
      }
      expect(bigValue.length).assertEqual(5000);
      // The big payload survives the store round trip.
      expect(PreferencesUtils.putString(context, key, bigValue)).assertTrue();
      const stored: string = PreferencesUtils.getString(context, key, '');
      expect(stored.length).assertEqual(5000);
      expect(stored).assertEqual(bigValue);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_1100
     * @tc.name      testPrefEdge0011
     * @tc.desc      Verify an explicitly stored false boolean reads back as
     *               false and is not confused with a missing key default.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'edge.bool.explicitfalse.1100';
      // The stored false value is a real entry, not a fallback.
      expect(PreferencesUtils.putBoolean(context, key, false)).assertTrue();
      expect(PreferencesUtils.hasKey(context, key)).assertTrue();
      // Even a true default cannot mask the stored false value.
      expect(PreferencesUtils.getBoolean(context, key, true)).assertFalse();
      // Overwriting flips the stored value to true.
      expect(PreferencesUtils.putBoolean(context, key, true)).assertTrue();
      expect(PreferencesUtils.getBoolean(context, key, false)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_1200
     * @tc.name      testPrefEdge0012
     * @tc.desc      Verify large round number boundaries one million and one
     *               billion round trip through the number pair exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'edge.num.round.1200';
      // The one million boundary stays exact.
      expect(PreferencesUtils.putNumber(context, key, 1000000)).assertTrue();
      expect(PreferencesUtils.getNumber(context, key, 0)).assertEqual(1000000);
      // The one billion boundary stays exact on the same key.
      expect(PreferencesUtils.putNumber(context, key, 1000000000)).assertTrue();
      expect(PreferencesUtils.getNumber(context, key, 0)).assertEqual(1000000000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_1300
     * @tc.name      testPrefEdge0013
     * @tc.desc      Verify a negative integer and a negative fraction round
     *               trip through the number pair without sign or precision loss.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'edge.num.negative.1300';
      // The negative integer stays exact.
      expect(PreferencesUtils.putNumber(context, key, -1)).assertTrue();
      expect(PreferencesUtils.getNumber(context, key, 0)).assertEqual(-1);
      // The negative fraction keeps its decimal digits.
      expect(PreferencesUtils.putNumber(context, key, -0.5)).assertTrue();
      expect(PreferencesUtils.getNumber(context, key, 0)).assertEqual(-0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_1400
     * @tc.name      testPrefEdge0014
     * @tc.desc      Verify a key overwritten from string to number and back to
     *               string always exposes the newest stored type and value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'edge.overwrite.chain.1400';
      // Generation one stores a string.
      expect(PreferencesUtils.putString(context, key, 'first')).assertTrue();
      expect(PreferencesUtils.getString(context, key, '')).assertEqual('first');
      // Generation two replaces the value with a number.
      expect(PreferencesUtils.putNumber(context, key, 42)).assertTrue();
      expect(PreferencesUtils.getNumber(context, key, 0)).assertEqual(42);
      // The string read degrades to the caller default for the number entry.
      expect(PreferencesUtils.getString(context, key, 'gone')).assertEqual('gone');
      // Generation three replaces the value with a string again.
      expect(PreferencesUtils.putString(context, key, 'third')).assertTrue();
      expect(PreferencesUtils.getString(context, key, '')).assertEqual('third');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_1500
     * @tc.name      testPrefEdge0015
     * @tc.desc      Verify a key overwritten from number to boolean exposes
     *               the boolean entry to getBoolean while getNumber degrades.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'edge.overwrite.tobool.1500';
      // Generation one stores a number.
      expect(PreferencesUtils.putNumber(context, key, 100)).assertTrue();
      expect(PreferencesUtils.getNumber(context, key, 0)).assertEqual(100);
      // Generation two replaces the value with a boolean.
      expect(PreferencesUtils.putBoolean(context, key, true)).assertTrue();
      expect(PreferencesUtils.getBoolean(context, key, false)).assertTrue();
      // The numeric read sees a boolean and falls back to the internal zero.
      expect(PreferencesUtils.getNumber(context, key, 55)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_1600
     * @tc.name      testPrefEdge0016
     * @tc.desc      Verify deleting the same key twice succeeds and leaves
     *               the key absent for hasKey and the typed getters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'edge.delete.twice.1600';
      // Store one entry and remove it once.
      expect(PreferencesUtils.putString(context, key, 'temporary')).assertTrue();
      expect(PreferencesUtils.deleteKey(context, key)).assertTrue();
      expect(PreferencesUtils.hasKey(context, key)).assertFalse();
      // The second removal also reports success because the key stays absent.
      expect(PreferencesUtils.deleteKey(context, key)).assertTrue();
      expect(PreferencesUtils.hasKey(context, key)).assertFalse();
      // The typed read keeps returning the caller default after both deletes.
      expect(PreferencesUtils.getString(context, key, 'after delete')).assertEqual('after delete');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_1700
     * @tc.name      testPrefEdge0017
     * @tc.desc      Verify clear wipes five previously written keys of every
     *               type in one call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPrefEdge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPrefEdge0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      // Write five keys covering every supported value type.
      expect(PreferencesUtils.putString(context, 'edge.clear.s.1700', 'text')).assertTrue();
      expect(PreferencesUtils.putNumber(context, 'edge.clear.n1.1700', 1)).assertTrue();
      expect(PreferencesUtils.putNumber(context, 'edge.clear.n2.1700', 2.5)).assertTrue();
      expect(PreferencesUtils.putBoolean(context, 'edge.clear.b1.1700', true)).assertTrue();
      expect(PreferencesUtils.putBoolean(context, 'edge.clear.b2.1700', false)).assertTrue();
      // The wipe reports success and drops every key.
      expect(PreferencesUtils.clear(context)).assertTrue();
      expect(PreferencesUtils.hasKey(context, 'edge.clear.s.1700')).assertFalse();
      expect(PreferencesUtils.hasKey(context, 'edge.clear.n1.1700')).assertFalse();
      expect(PreferencesUtils.hasKey(context, 'edge.clear.n2.1700')).assertFalse();
      expect(PreferencesUtils.hasKey(context, 'edge.clear.b1.1700')).assertFalse();
      expect(PreferencesUtils.hasKey(context, 'edge.clear.b2.1700')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_1800
     * @tc.name      testPrefEdge0018
     * @tc.desc      Verify the store accepts fresh writes immediately after a
     *               clear and returns the new values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      // Wipe the store so the case starts from an empty state.
      expect(PreferencesUtils.clear(context)).assertTrue();
      const key: string = 'edge.afterclear.1800';
      // Fresh writes after the wipe behave like a fresh store.
      expect(PreferencesUtils.putString(context, key, 'reborn')).assertTrue();
      expect(PreferencesUtils.hasKey(context, key)).assertTrue();
      expect(PreferencesUtils.getString(context, key, '')).assertEqual('reborn');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_1900
     * @tc.name      testPrefEdge0019
     * @tc.desc      Verify getString on a key that stores a number degrades to
     *               an empty string default per the facade fallback rule.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'edge.mismatch.num2str.1900';
      // The key stores a number.
      expect(PreferencesUtils.putNumber(context, key, 123)).assertTrue();
      // The string read cannot trust the number and degrades to the default.
      expect(PreferencesUtils.getString(context, key, '')).assertEqual('');
      // A non empty default is returned unchanged as well.
      expect(PreferencesUtils.getString(context, key, 'fallback')).assertEqual('fallback');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_2000
     * @tc.name      testPrefEdge0020
     * @tc.desc      Verify getNumber on a key that stores a string returns the
     *               internal zero even when the caller default is a negative.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'edge.mismatch.str2num.2000';
      // The key stores a string.
      expect(PreferencesUtils.putString(context, key, 'not a number')).assertTrue();
      // The numeric read replaces the mismatch with the internal zero.
      expect(PreferencesUtils.getNumber(context, key, -42)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_2100
     * @tc.name      testPrefEdge0021
     * @tc.desc      Verify getBoolean on a key that stores a number returns
     *               false in both default directions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'edge.mismatch.num2bool.2100';
      // The key stores a number.
      expect(PreferencesUtils.putNumber(context, key, 1)).assertTrue();
      // The boolean read replaces the mismatch with the internal false.
      expect(PreferencesUtils.getBoolean(context, key, false)).assertFalse();
      // Even an explicit true default cannot rescue the mismatched entry.
      expect(PreferencesUtils.getBoolean(context, key, true)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_2200
     * @tc.name      testPrefEdge0022
     * @tc.desc      Verify getString on a boolean keyed entry degrades to the
     *               default and the entry disappears after a delete.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'edge.mismatch.bool2str.2200';
      // The key stores a boolean.
      expect(PreferencesUtils.putBoolean(context, key, true)).assertTrue();
      // The string read degrades to the caller default.
      expect(PreferencesUtils.getString(context, key, 'no text here')).assertEqual('no text here');
      // After the delete the same default is returned for the missing key.
      expect(PreferencesUtils.deleteKey(context, key)).assertTrue();
      expect(PreferencesUtils.getString(context, key, 'no text here')).assertEqual('no text here');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_2300
     * @tc.name      testPrefEdge0023
     * @tc.desc      Verify six keys of mixed types store and read back in a
     *               shuffled read order without cross talk.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPrefEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPrefEdge0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      // Write two entries of every type under separate keys.
      expect(PreferencesUtils.putString(context, 'edge.mix.s1.2300', 'alpha')).assertTrue();
      expect(PreferencesUtils.putNumber(context, 'edge.mix.n1.2300', 10)).assertTrue();
      expect(PreferencesUtils.putBoolean(context, 'edge.mix.b1.2300', true)).assertTrue();
      expect(PreferencesUtils.putString(context, 'edge.mix.s2.2300', 'beta')).assertTrue();
      expect(PreferencesUtils.putBoolean(context, 'edge.mix.b2.2300', false)).assertTrue();
      expect(PreferencesUtils.putNumber(context, 'edge.mix.n2.2300', 20.25)).assertTrue();
      // Read everything back in a shuffled order.
      expect(PreferencesUtils.getBoolean(context, 'edge.mix.b2.2300', true)).assertFalse();
      expect(PreferencesUtils.getNumber(context, 'edge.mix.n2.2300', 0)).assertEqual(20.25);
      expect(PreferencesUtils.getString(context, 'edge.mix.s1.2300', '')).assertEqual('alpha');
      expect(PreferencesUtils.getBoolean(context, 'edge.mix.b1.2300', false)).assertTrue();
      expect(PreferencesUtils.getString(context, 'edge.mix.s2.2300', '')).assertEqual('beta');
      expect(PreferencesUtils.getNumber(context, 'edge.mix.n1.2300', 0)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_PREFEDGE_2400
     * @tc.name      testPrefEdge0024
     * @tc.desc      Verify writing the same value three times to one key is
     *               idempotent and leaves one readable entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testPrefEdge0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(abilityContext === undefined).assertFalse();
      if (abilityContext === undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
        return;
      }
      const context: common.UIAbilityContext = abilityContext;
      const key: string = 'edge.idempotent.2400';
      const value: string = 'same value';
      // Three identical writes all report success.
      expect(PreferencesUtils.putString(context, key, value)).assertTrue();
      expect(PreferencesUtils.putString(context, key, value)).assertTrue();
      expect(PreferencesUtils.putString(context, key, value)).assertTrue();
      // The key still reads exactly one stable value.
      expect(PreferencesUtils.hasKey(context, key)).assertTrue();
      expect(PreferencesUtils.getString(context, key, '')).assertEqual(value);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
