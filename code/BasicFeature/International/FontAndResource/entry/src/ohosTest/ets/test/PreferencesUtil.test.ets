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

// Import the key-value storage helper under test from the library HAR package.
import { PreferencesUtil } from 'library';
import { application, common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';
// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// The preferences store name shared by every case of this suite.
const STORE_NAME: string = 'font_resource_test_store';
// A secondary store name used to prove the store argument really selects the target file.
const ALT_STORE_NAME: string = 'font_resource_test_store_alt';
// A representative string value written by the string cases.
const STRING_VALUE: string = 'SourceHanSans-Regular';
// A second representative string value used by the overwrite cases.
const STRING_VALUE_V2: string = 'HarmonyOS-Sans-Regular';
// A string value that carries CJK text and punctuation.
const STRING_VALUE_CJK: string = '示例字体（常规）';
// A representative number value written by the number cases.
const NUMBER_VALUE: number = 42;
// A negative number value used by the number boundary case.
const NUMBER_NEGATIVE: number = -7;
// A fractional number value used by the number boundary case.
const NUMBER_FRACTION: number = 3.14;
// A very large number value used by the number boundary case.
const NUMBER_LARGE: number = 9007199254740991;
// A representative boolean value written by the boolean cases.
const BOOLEAN_TRUE: boolean = true;
// The opposite boolean value written by the boolean cases.
const BOOLEAN_FALSE: boolean = false;
// The fallback string returned when a key is missing.
const FALLBACK_STRING: string = 'fallback-default';
// The fallback number returned when a key is missing.
const FALLBACK_NUMBER: number = -1;
// The fallback boolean returned when a key is missing.
const FALLBACK_BOOLEAN: boolean = false;
// The key prefix that keeps every case key unique inside the shared store.
const KEY_PREFIX: string = 'lt_pref_';
// The number of round trips performed by the repeated write case.
const REPEAT_ROUNDS: number = 6;
// The empty string used by the empty value case.
const EMPTY_TEXT: string = '';

// The app context holder; it is assigned in the suite setup before any case runs.
let suiteContext: common.Context | undefined = undefined;

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Renders a boolean as a stable lowercase token for log lines.
function boolText(value: boolean): string {
  // Return the lowercase literal so log lines stay comparable.
  return value ? 'true' : 'false';
}

// Builds a store key that is unique per case and per index.
function keyOf(caseName: string, index: number): string {
  // Compose the case scoped key so cases never overwrite each other.
  return KEY_PREFIX + caseName + '_' + index.toString();
}

// Registers every on-device logic test case of the key-value storage helpers.
export default function preferencesUtilTest() {
  // Group the cases under the "PreferencesUtilSuite" describe block.
  describe('PreferencesUtilSuite', () => {
    // Resolve the app context and wipe the test stores before the first case runs.
    beforeAll(() => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'PreferencesUtilSuite, begin');
      suiteContext = application.getApplicationContext();
      // Wipe both test stores so a previous run cannot influence this one.
      if (suiteContext !== undefined) {
        // Clear every key of the primary test store.
        PreferencesUtil.clear(suiteContext, STORE_NAME);
        // Clear every key of the secondary test store.
        PreferencesUtil.clear(suiteContext, ALT_STORE_NAME);
      }
      // Print the suite setup result so a missing context is visible immediately.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'PreferencesUtilSuite, context ready=' +
        (suiteContext !== undefined).toString());
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_0100
     * @tc.name      testPreferencesStoreReachable0001
     * @tc.desc      Verify the test context can open the named store so every later round trip case is meaningful.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPreferencesStoreReachable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesStoreReachable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Opening a store is only possible with a live context, which the suite setup resolves.
      expect(suiteContext !== undefined).assertTrue();
      // Narrow the optional context through a runtime check instead of a cast.
      if (suiteContext !== undefined) {
        const options: preferences.Options = { name: STORE_NAME };
        const store: preferences.Preferences = preferences.getPreferencesSync(suiteContext, options);
        // Ask whether a key that was never written is present.
        const present: boolean = store.hasSync(keyOf(TAG, 0));
        // Log the presence verdict of the unwritten key.
        logCase(TAG, 'unwritten key present=' + boolText(present));
        // An unwritten key is never reported as present.
        expect(present).assertFalse();
        // The context exposes a usable files directory that hosts the store file.
        expect(suiteContext.filesDir.length).assertLarger(0);
      }
      // The store name stays the documented literal used by this suite.
      expect(STORE_NAME).assertEqual('font_resource_test_store');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_0200
     * @tc.name      testPreferencesPutString0001
     * @tc.desc      Verify putString stores a string that getString reads back unchanged for a fresh key.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPreferencesPutString0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesPutString0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The key is unique to this case so it cannot collide with another suite.
      const key: string = keyOf(TAG, 1);
      // Write the string through the helper under test.
      if (suiteContext !== undefined) {
        // Store the representative string value under the case key.
        PreferencesUtil.putString(suiteContext, STORE_NAME, key, STRING_VALUE);
        // Read the value back with a fallback that must not be used.
        const readBack: string = PreferencesUtil.getString(suiteContext, STORE_NAME, key, FALLBACK_STRING);
        // Log the written and read values.
        logCase(TAG, 'key=' + key + ', readBack=' + readBack);
        // The value read back equals the value written.
        expect(readBack).assertEqual(STRING_VALUE);
        // The fallback was not used, so the value differs from it.
        expect(readBack === FALLBACK_STRING).assertFalse();
        // The read value is typed as a string.
        expect(typeof readBack).assertEqual('string');
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_0300
     * @tc.name      testPreferencesGetStringFallback0001
     * @tc.desc      Verify getString returns the caller fallback for a key that was never written.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPreferencesGetStringFallback0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesGetStringFallback0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The key is unique to this case and is never written.
      const key: string = keyOf(TAG, 1);
      // Remove the key defensively in case a previous run left it behind.
      if (suiteContext !== undefined) {
        // Remove the key so the fallback path is guaranteed to be taken.
        PreferencesUtil.remove(suiteContext, STORE_NAME, key);
        // Read the missing key with the documented fallback.
        const readBack: string = PreferencesUtil.getString(suiteContext, STORE_NAME, key, FALLBACK_STRING);
        // Log the fallback result.
        logCase(TAG, 'missing key readBack=' + readBack);
        // The helper returns the caller fallback for a missing key.
        expect(readBack).assertEqual(FALLBACK_STRING);
        // An empty fallback is returned verbatim as well.
        const emptyFallback: string = PreferencesUtil.getString(suiteContext, STORE_NAME, key, EMPTY_TEXT);
        // The empty fallback is returned unchanged.
        expect(emptyFallback).assertEqual(EMPTY_TEXT);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_0400
     * @tc.name      testPreferencesPutNumber0001
     * @tc.desc      Verify putNumber stores a number that getNumber reads back unchanged for a fresh key.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPreferencesPutNumber0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesPutNumber0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The key is unique to this case.
      const key: string = keyOf(TAG, 1);
      // Store the representative number under the case key.
      if (suiteContext !== undefined) {
        // Write the integer value through the helper under test.
        PreferencesUtil.putNumber(suiteContext, STORE_NAME, key, NUMBER_VALUE);
        // Read the value back with a fallback that must not be used.
        const readBack: number = PreferencesUtil.getNumber(suiteContext, STORE_NAME, key, FALLBACK_NUMBER);
        // Log the written and read numbers.
        logCase(TAG, 'key=' + key + ', readBack=' + readBack.toString());
        // The value read back equals the value written.
        expect(readBack).assertEqual(NUMBER_VALUE);
        // The read value is typed as a number.
        expect(typeof readBack).assertEqual('number');
        // The fallback was not used, so the value differs from it.
        expect(readBack === FALLBACK_NUMBER).assertFalse();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_0500
     * @tc.name      testPreferencesNumberBoundary0001
     * @tc.desc      Verify negative, fractional and very large numbers survive a store round trip unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPreferencesNumberBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesNumberBoundary0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The boundary table lists every numeric shape exercised by this case.
      const numberTable: number[] = [NUMBER_NEGATIVE, NUMBER_FRACTION, NUMBER_LARGE, 0];
      // Track how many numeric shapes survived the round trip.
      let survived: number = 0;
      // Walk the boundary table and round trip each value.
      if (suiteContext !== undefined) {
        // Loop over the numeric boundary table.
        for (let i: number = 0; i < numberTable.length; i++) {
          // Build a unique key for the current boundary value.
          const key: string = keyOf(TAG, i);
          // Write the boundary value of the current row.
          PreferencesUtil.putNumber(suiteContext, STORE_NAME, key, numberTable[i]);
          // Read the boundary value of the current row back.
          const readBack: number = PreferencesUtil.getNumber(suiteContext, STORE_NAME, key, FALLBACK_NUMBER);
          // Log the row outcome.
          logCase(TAG, 'row ' + i.toString() + ' written=' + numberTable[i].toString() +
            ' readBack=' + readBack.toString());
          // The value read back equals the value written for this row.
          expect(readBack).assertEqual(numberTable[i]);
          // Count the row that survived the round trip.
          survived = survived + 1;
        }
      }
      // Every boundary row must have survived the round trip.
      expect(survived).assertEqual(numberTable.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_0600
     * @tc.name      testPreferencesPutBoolean0001
     * @tc.desc      Verify putBoolean stores both boolean literals that getBoolean reads back unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPreferencesPutBoolean0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesPutBoolean0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The key of the true value row.
      const trueKey: string = keyOf(TAG, 1);
      // The key of the false value row.
      const falseKey: string = keyOf(TAG, 2);
      // Round trip both boolean literals.
      if (suiteContext !== undefined) {
        // Write the true literal under the first key.
        PreferencesUtil.putBoolean(suiteContext, STORE_NAME, trueKey, BOOLEAN_TRUE);
        // Write the false literal under the second key.
        PreferencesUtil.putBoolean(suiteContext, STORE_NAME, falseKey, BOOLEAN_FALSE);
        // Read the first value back.
        const trueRead: boolean = PreferencesUtil.getBoolean(suiteContext, STORE_NAME, trueKey, BOOLEAN_FALSE);
        // Read the second value back with the opposite fallback.
        const falseRead: boolean = PreferencesUtil.getBoolean(suiteContext, STORE_NAME, falseKey, BOOLEAN_TRUE);
        // Log both round trip outcomes.
        logCase(TAG, 'trueRead=' + boolText(trueRead) + ', falseRead=' + boolText(falseRead));
        // The true literal survives the round trip.
        expect(trueRead).assertTrue();
        // The false literal survives the round trip and ignores the true fallback.
        expect(falseRead).assertFalse();
        // Both read values are typed as booleans.
        expect(typeof trueRead).assertEqual('boolean');
        // The second read value is typed as a boolean as well.
        expect(typeof falseRead).assertEqual('boolean');
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_0700
     * @tc.name      testPreferencesGetBooleanFallback0001
     * @tc.desc      Verify getBoolean returns the caller fallback for a key that was never written.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPreferencesGetBooleanFallback0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesGetBooleanFallback0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The key is unique to this case and is never written.
      const key: string = keyOf(TAG, 1);
      // Query the missing key with both fallback literals.
      if (suiteContext !== undefined) {
        // Remove the key defensively so the fallback path is guaranteed.
        PreferencesUtil.remove(suiteContext, STORE_NAME, key);
        // Read the missing key with the true fallback.
        const trueFallback: boolean = PreferencesUtil.getBoolean(suiteContext, STORE_NAME, key, true);
        // Read the missing key with the false fallback.
        const falseFallback: boolean = PreferencesUtil.getBoolean(suiteContext, STORE_NAME, key, FALLBACK_BOOLEAN);
        // Log both fallback outcomes.
        logCase(TAG, 'trueFallback=' + boolText(trueFallback) + ', falseFallback=' + boolText(falseFallback));
        // The true fallback is returned for the missing key.
        expect(trueFallback).assertTrue();
        // The false fallback is returned for the missing key.
        expect(falseFallback).assertFalse();
        // Both fallback results are typed as booleans.
        expect(typeof trueFallback).assertEqual('boolean');
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_0800
     * @tc.name      testPreferencesHasAndRemove0001
     * @tc.desc      Verify has reports true after a write and false again after the key is removed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPreferencesHasAndRemove0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesHasAndRemove0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The key is unique to this case.
      const key: string = keyOf(TAG, 1);
      // Exercise the full write, has, remove, has sequence.
      if (suiteContext !== undefined) {
        // Write the key so has can observe it.
        PreferencesUtil.putString(suiteContext, STORE_NAME, key, STRING_VALUE);
        // has must report the freshly written key.
        const presentAfterWrite: boolean = PreferencesUtil.has(suiteContext, STORE_NAME, key);
        // Log the presence verdict after the write.
        logCase(TAG, 'has after write=' + boolText(presentAfterWrite));
        // The freshly written key must be present.
        expect(presentAfterWrite).assertTrue();
        // Remove the key from the store.
        PreferencesUtil.remove(suiteContext, STORE_NAME, key);
        // has must report the removed key as absent.
        const presentAfterRemove: boolean = PreferencesUtil.has(suiteContext, STORE_NAME, key);
        // Log the presence verdict after the removal.
        logCase(TAG, 'has after remove=' + boolText(presentAfterRemove));
        // The removed key must be absent.
        expect(presentAfterRemove).assertFalse();
        // Reading the removed key returns the caller fallback.
        expect(PreferencesUtil.getString(suiteContext, STORE_NAME, key, FALLBACK_STRING)).assertEqual(FALLBACK_STRING);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_0900
     * @tc.name      testPreferencesRemoveMissingKey0001
     * @tc.desc      Verify removing a key that was never written is a no-op instead of an error.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPreferencesRemoveMissingKey0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesRemoveMissingKey0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The key is unique to this case and is never written.
      const key: string = keyOf(TAG, 1);
      // Remove the missing key twice in a row.
      if (suiteContext !== undefined) {
        // First removal of the never written key.
        PreferencesUtil.remove(suiteContext, STORE_NAME, key);
        // Second removal of the same never written key.
        PreferencesUtil.remove(suiteContext, STORE_NAME, key);
        // The key stays absent after both removals.
        const present: boolean = PreferencesUtil.has(suiteContext, STORE_NAME, key);
        // Log the presence verdict after the double removal.
        logCase(TAG, 'has after double remove=' + boolText(present));
        // The never written key stays absent.
        expect(present).assertFalse();
        // A neighbouring written key is not affected by the removal.
        const neighbourKey: string = keyOf(TAG, 2);
        // Write the neighbouring key.
        PreferencesUtil.putString(suiteContext, STORE_NAME, neighbourKey, STRING_VALUE);
        // The neighbouring key survives the unrelated removal.
        expect(PreferencesUtil.has(suiteContext, STORE_NAME, neighbourKey)).assertTrue();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_1000
     * @tc.name      testPreferencesClear0001
     * @tc.desc      Verify clear wipes every key of the store while leaving the secondary store untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPreferencesClear0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesClear0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The primary key is written into the store that is about to be cleared.
      const primaryKey: string = keyOf(TAG, 1);
      // The secondary key is written into the store that must survive the clear.
      const secondaryKey: string = keyOf(TAG, 2);
      // Write into both stores, clear one of them and compare the presence verdicts.
      if (suiteContext !== undefined) {
        // Write the primary key into the primary store.
        PreferencesUtil.putString(suiteContext, STORE_NAME, primaryKey, STRING_VALUE);
        // Write the secondary key into the secondary store.
        PreferencesUtil.putString(suiteContext, ALT_STORE_NAME, secondaryKey, STRING_VALUE);
        // Clear every key of the primary store.
        PreferencesUtil.clear(suiteContext, STORE_NAME);
        // The primary store must be empty after the clear.
        const primaryPresent: boolean = PreferencesUtil.has(suiteContext, STORE_NAME, primaryKey);
        // The secondary store must keep its key after the primary clear.
        const secondaryPresent: boolean = PreferencesUtil.has(suiteContext, ALT_STORE_NAME, secondaryKey);
        // Log both presence verdicts.
        logCase(TAG, 'primary present=' + boolText(primaryPresent) + ', secondary present=' +
          boolText(secondaryPresent));
        // The cleared store must report the key as absent.
        expect(primaryPresent).assertFalse();
        // The untouched store must still report its key as present.
        expect(secondaryPresent).assertTrue();
        // Clean the secondary store so the suite leaves nothing behind.
        PreferencesUtil.clear(suiteContext, ALT_STORE_NAME);
      }
      // The two store names of this case stay distinct literals.
      expect(STORE_NAME === ALT_STORE_NAME).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_1100
     * @tc.name      testPreferencesStoreIsolation0001
     * @tc.desc      Verify one store name never leaks a key into another store name for the same key string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPreferencesStoreIsolation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesStoreIsolation0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Both stores receive the same key but different values.
      const sharedKey: string = keyOf(TAG, 1);
      // Write the two different values into the two stores.
      if (suiteContext !== undefined) {
        // Write the first value into the primary store.
        PreferencesUtil.putString(suiteContext, STORE_NAME, sharedKey, STRING_VALUE);
        // Write the second value into the secondary store under the same key.
        PreferencesUtil.putString(suiteContext, ALT_STORE_NAME, sharedKey, STRING_VALUE_V2);
        // Read the key back from the primary store.
        const primaryValue: string = PreferencesUtil.getString(suiteContext, STORE_NAME, sharedKey, FALLBACK_STRING);
        // Read the key back from the secondary store.
        const secondaryValue: string =
          PreferencesUtil.getString(suiteContext, ALT_STORE_NAME, sharedKey, FALLBACK_STRING);
        // Log both store values.
        logCase(TAG, 'primary=' + primaryValue + ', secondary=' + secondaryValue);
        // The primary store keeps its own value for the shared key.
        expect(primaryValue).assertEqual(STRING_VALUE);
        // The secondary store keeps its own value for the shared key.
        expect(secondaryValue).assertEqual(STRING_VALUE_V2);
        // The two stores never share a value for the same key string.
        expect(primaryValue === secondaryValue).assertFalse();
        // Clean the secondary store so the suite leaves nothing behind.
        PreferencesUtil.clear(suiteContext, ALT_STORE_NAME);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_1200
     * @tc.name      testPreferencesOverwrite0001
     * @tc.desc      Verify a second write replaces the previous value for the same key instead of appending.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPreferencesOverwrite0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesOverwrite0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The key receives two string writes in a row.
      const key: string = keyOf(TAG, 1);
      // Overwrite the value and compare the read back results.
      if (suiteContext !== undefined) {
        // Write the first string value.
        PreferencesUtil.putString(suiteContext, STORE_NAME, key, STRING_VALUE);
        // Read the first value back.
        const firstRead: string = PreferencesUtil.getString(suiteContext, STORE_NAME, key, FALLBACK_STRING);
        // Write the second string value under the same key.
        PreferencesUtil.putString(suiteContext, STORE_NAME, key, STRING_VALUE_V2);
        // Read the second value back.
        const secondRead: string = PreferencesUtil.getString(suiteContext, STORE_NAME, key, FALLBACK_STRING);
        // Log both read back values.
        logCase(TAG, 'first=' + firstRead + ', second=' + secondRead);
        // The first read returns the first value.
        expect(firstRead).assertEqual(STRING_VALUE);
        // The second read returns the second value, so the write replaced the first one.
        expect(secondRead).assertEqual(STRING_VALUE_V2);
        // The overwritten value is no longer readable from the store.
        expect(secondRead === STRING_VALUE).assertFalse();
        // A second overwrite changes the value again.
        PreferencesUtil.putString(suiteContext, STORE_NAME, key, STRING_VALUE);
        // The third read returns the latest value.
        expect(PreferencesUtil.getString(suiteContext, STORE_NAME, key, FALLBACK_STRING)).assertEqual(STRING_VALUE);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_1300
     * @tc.name      testPreferencesTypeMatrix0001
     * @tc.desc      Verify the string, number and boolean helpers stay independent for three distinct keys.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPreferencesTypeMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesTypeMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The type matrix lists the three storage shapes exercised by this suite.
      const typeNames: string[] = ['string', 'number', 'boolean'];
      // The type matrix lists one representative key per storage shape.
      const keys: string[] = [keyOf(TAG, 1), keyOf(TAG, 2), keyOf(TAG, 3)];
      // Write one value per storage shape.
      if (suiteContext !== undefined) {
        // Store the representative string value.
        PreferencesUtil.putString(suiteContext, STORE_NAME, keys[0], STRING_VALUE);
        // Store the representative number value.
        PreferencesUtil.putNumber(suiteContext, STORE_NAME, keys[1], NUMBER_VALUE);
        // Store the representative boolean value.
        PreferencesUtil.putBoolean(suiteContext, STORE_NAME, keys[2], BOOLEAN_TRUE);
        // Read the string row back.
        const readString: string = PreferencesUtil.getString(suiteContext, STORE_NAME, keys[0], FALLBACK_STRING);
        // Read the number row back.
        const readNumber: number = PreferencesUtil.getNumber(suiteContext, STORE_NAME, keys[1], FALLBACK_NUMBER);
        // Read the boolean row back.
        const readBoolean: boolean = PreferencesUtil.getBoolean(suiteContext, STORE_NAME, keys[2], BOOLEAN_FALSE);
        // The read values are collected so the runtime types can be compared against the matrix names.
        const readTypes: string[] = [typeof readString, typeof readNumber, typeof readBoolean];
        // Track how many rows matched the declared storage shape.
        let matchedRows: number = 0;
        // Walk the matrix comparing the declared and actual types.
        for (let i: number = 0; i < typeNames.length; i++) {
          // Log the row under comparison.
          logCase(TAG, typeNames[i] + ' declared=' + typeNames[i] + ' actual=' + readTypes[i]);
          // The runtime type must match the declared storage shape of the row.
          expect(readTypes[i]).assertEqual(typeNames[i]);
          // Count the row that matched.
          matchedRows = matchedRows + 1;
        }
        // Every matrix row must match its declared storage shape.
        expect(matchedRows).assertEqual(typeNames.length);
        // The string row keeps its value.
        expect(readString).assertEqual(STRING_VALUE);
        // The number row keeps its value.
        expect(readNumber).assertEqual(NUMBER_VALUE);
        // The boolean row keeps its value.
        expect(readBoolean).assertTrue();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_1400
     * @tc.name      testPreferencesRepeatedRoundTrip0001
     * @tc.desc      Verify repeated write and read cycles keep returning the latest value for one key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPreferencesRepeatedRoundTrip0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesRepeatedRoundTrip0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The key receives one write per round of this case.
      const key: string = keyOf(TAG, 1);
      // Track the rounds whose read back value matched the written one.
      let matchedRounds: number = 0;
      // Run the configured number of write and read cycles.
      if (suiteContext !== undefined) {
        // Loop over the configured round count.
        for (let i: number = 0; i < REPEAT_ROUNDS; i++) {
          // Compose the value of the current round.
          const roundValue: string = STRING_VALUE + '-' + i.toString();
          // Write the current round value.
          PreferencesUtil.putString(suiteContext, STORE_NAME, key, roundValue);
          // Read the current round value back.
          const readBack: string = PreferencesUtil.getString(suiteContext, STORE_NAME, key, FALLBACK_STRING);
          // Log the row outcome.
          logCase(TAG, 'round ' + i.toString() + ' value=' + roundValue + ' readBack=' + readBack);
          // The read back value must equal the written value of this round.
          expect(readBack).assertEqual(roundValue);
          // Count the round that matched.
          matchedRounds = matchedRounds + 1;
        }
      }
      // Every configured round must have matched.
      expect(matchedRounds).assertEqual(REPEAT_ROUNDS);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_1500
     * @tc.name      testPreferencesEmptyAndCjkString0001
     * @tc.desc      Verify empty and CJK strings survive a store round trip so localized labels persist correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPreferencesEmptyAndCjkString0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesEmptyAndCjkString0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The key of the empty string row.
      const emptyKey: string = keyOf(TAG, 1);
      // The key of the CJK string row.
      const cjkKey: string = keyOf(TAG, 2);
      // Round trip both string shapes.
      if (suiteContext !== undefined) {
        // Write the empty string.
        PreferencesUtil.putString(suiteContext, STORE_NAME, emptyKey, EMPTY_TEXT);
        // Read the empty string back with a non empty fallback.
        const emptyRead: string = PreferencesUtil.getString(suiteContext, STORE_NAME, emptyKey, FALLBACK_STRING);
        // Write the CJK string.
        PreferencesUtil.putString(suiteContext, STORE_NAME, cjkKey, STRING_VALUE_CJK);
        // Read the CJK string back.
        const cjkRead: string = PreferencesUtil.getString(suiteContext, STORE_NAME, cjkKey, FALLBACK_STRING);
        // Log both read back values and their lengths.
        logCase(TAG, 'empty length=' + emptyRead.length.toString() + ', cjk length=' + cjkRead.length.toString());
        // The stored empty string is returned instead of the fallback.
        expect(emptyRead).assertEqual(EMPTY_TEXT);
        // The empty string row differs from the fallback.
        expect(emptyRead === FALLBACK_STRING).assertFalse();
        // The CJK string survives the round trip unchanged.
        expect(cjkRead).assertEqual(STRING_VALUE_CJK);
        // The CJK string keeps its multi byte length.
        expect(cjkRead.length).assertEqual(STRING_VALUE_CJK.length);
        // The key remains present after storing an empty value.
        expect(PreferencesUtil.has(suiteContext, STORE_NAME, emptyKey)).assertTrue();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_1600
     * @tc.name      testPreferencesKeyIsolation0001
     * @tc.desc      Verify writing one key never changes the value stored under a different key of the same store.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPreferencesKeyIsolation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesKeyIsolation0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The key table holds four distinct keys of the same store.
      const keyTable: string[] = [keyOf(TAG, 1), keyOf(TAG, 2), keyOf(TAG, 3), keyOf(TAG, 4)];
      // Track how many keys kept their own value after all writes.
      let isolatedKeys: number = 0;
      // Write one distinct value per key first.
      if (suiteContext !== undefined) {
        // Loop over the key table writing a distinct value per key.
        for (let i: number = 0; i < keyTable.length; i++) {
          // Write the value that belongs to the current key.
          PreferencesUtil.putString(suiteContext, STORE_NAME, keyTable[i], STRING_VALUE + '-' + i.toString());
        }
        // Read every key back and compare it against the expected value of that key.
        for (let i: number = 0; i < keyTable.length; i++) {
          // Read the value of the current key.
          const readBack: string = PreferencesUtil.getString(suiteContext, STORE_NAME, keyTable[i], FALLBACK_STRING);
          // Compose the value that this key must hold.
          const expected: string = STRING_VALUE + '-' + i.toString();
          // Log the row outcome.
          logCase(TAG, 'key ' + i.toString() + ' readBack=' + readBack);
          // The value of the current key must be the value written for it.
          expect(readBack).assertEqual(expected);
          // Count the key that stayed isolated.
          isolatedKeys = isolatedKeys + 1;
        }
      }
      // Every key of the table must have stayed isolated.
      expect(isolatedKeys).assertEqual(keyTable.length);
      // The four keys of the table are distinct strings.
      expect(keyTable[0] === keyTable[1]).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_1700
     * @tc.name      testPreferencesClearThenReuse0001
     * @tc.desc      Verify the store accepts writes again after a clear so the reset action does not wedge storage.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPreferencesClearThenReuse0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesClearThenReuse0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The key is reused after the clear to prove the store stays writable.
      const key: string = keyOf(TAG, 1);
      // Clear the store, write again and verify the new value.
      if (suiteContext !== undefined) {
        // Write a first value before the clear.
        PreferencesUtil.putString(suiteContext, STORE_NAME, key, STRING_VALUE);
        // Wipe the whole store.
        PreferencesUtil.clear(suiteContext, STORE_NAME);
        // The wiped store must report the key as absent.
        expect(PreferencesUtil.has(suiteContext, STORE_NAME, key)).assertFalse();
        // Write a second value after the clear.
        PreferencesUtil.putString(suiteContext, STORE_NAME, key, STRING_VALUE_V2);
        // Read the second value back.
        const readBack: string = PreferencesUtil.getString(suiteContext, STORE_NAME, key, FALLBACK_STRING);
        // Log the value read after the reuse.
        logCase(TAG, 'read after reuse=' + readBack);
        // The store accepted the write after the clear.
        expect(readBack).assertEqual(STRING_VALUE_V2);
        // The key is present again after the reuse.
        expect(PreferencesUtil.has(suiteContext, STORE_NAME, key)).assertTrue();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_1800
     * @tc.name      testPreferencesStoreMatrix0001
     * @tc.desc      Verify a fixed key matrix round trips every storage shape inside a single sweep of the store.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPreferencesStoreMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesStoreMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The matrix label table lists the rows exercised by the sweep.
      const matrixLabels: string[] = ['string', 'number', 'boolean', 'emptyString', 'negativeNumber'];
      // The matrix keeps one unique key per row.
      const matrixKeys: string[] = [keyOf(TAG, 1), keyOf(TAG, 2), keyOf(TAG, 3), keyOf(TAG, 4), keyOf(TAG, 5)];
      // Track the rows that survived the sweep.
      let survivedRows: number = 0;
      // Run the sweep row by row.
      if (suiteContext !== undefined) {
        // Write every row of the matrix.
        PreferencesUtil.putString(suiteContext, STORE_NAME, matrixKeys[0], STRING_VALUE);
        // Write the number row of the matrix.
        PreferencesUtil.putNumber(suiteContext, STORE_NAME, matrixKeys[1], NUMBER_VALUE);
        // Write the boolean row of the matrix.
        PreferencesUtil.putBoolean(suiteContext, STORE_NAME, matrixKeys[2], BOOLEAN_TRUE);
        // Write the empty string row of the matrix.
        PreferencesUtil.putString(suiteContext, STORE_NAME, matrixKeys[3], EMPTY_TEXT);
        // Write the negative number row of the matrix.
        PreferencesUtil.putNumber(suiteContext, STORE_NAME, matrixKeys[4], NUMBER_NEGATIVE);
        // Verify the string row.
        expect(PreferencesUtil.getString(suiteContext, STORE_NAME, matrixKeys[0], FALLBACK_STRING))
          .assertEqual(STRING_VALUE);
        // Count the string row.
        survivedRows = survivedRows + 1;
        // Verify the number row.
        expect(PreferencesUtil.getNumber(suiteContext, STORE_NAME, matrixKeys[1], FALLBACK_NUMBER))
          .assertEqual(NUMBER_VALUE);
        // Count the number row.
        survivedRows = survivedRows + 1;
        // Verify the boolean row.
        expect(PreferencesUtil.getBoolean(suiteContext, STORE_NAME, matrixKeys[2], BOOLEAN_FALSE)).assertTrue();
        // Count the boolean row.
        survivedRows = survivedRows + 1;
        // Verify the empty string row.
        expect(PreferencesUtil.getString(suiteContext, STORE_NAME, matrixKeys[3], FALLBACK_STRING))
          .assertEqual(EMPTY_TEXT);
        // Count the empty string row.
        survivedRows = survivedRows + 1;
        // Verify the negative number row.
        expect(PreferencesUtil.getNumber(suiteContext, STORE_NAME, matrixKeys[4], FALLBACK_NUMBER))
          .assertEqual(NUMBER_NEGATIVE);
        // Count the negative number row.
        survivedRows = survivedRows + 1;
      }
      // Log the survived row count against the label table size.
      logCase(TAG, 'survived=' + survivedRows.toString() + '/' + matrixLabels.length.toString());
      // Every matrix row must have survived the sweep.
      expect(survivedRows).assertEqual(matrixLabels.length);
      // The label and key tables stay aligned so no row is mislabelled.
      expect(matrixLabels.length).assertEqual(matrixKeys.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PREF_1900
     * @tc.name      testPreferencesTypeThenRemove0001
     * @tc.desc      Verify removing one storage shape leaves the other shapes of the same store readable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testPreferencesTypeThenRemove0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testPreferencesTypeThenRemove0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The three keys hold one storage shape each.
      const stringKey: string = keyOf(TAG, 1);
      // The number key holds the numeric shape.
      const numberKey: string = keyOf(TAG, 2);
      // The boolean key holds the boolean shape.
      const booleanKey: string = keyOf(TAG, 3);
      // Write all three shapes, remove one and verify the survivors.
      if (suiteContext !== undefined) {
        // Write the string shape.
        PreferencesUtil.putString(suiteContext, STORE_NAME, stringKey, STRING_VALUE);
        // Write the number shape.
        PreferencesUtil.putNumber(suiteContext, STORE_NAME, numberKey, NUMBER_VALUE);
        // Write the boolean shape.
        PreferencesUtil.putBoolean(suiteContext, STORE_NAME, booleanKey, BOOLEAN_TRUE);
        // Remove only the number shape.
        PreferencesUtil.remove(suiteContext, STORE_NAME, numberKey);
        // The removed number shape must be absent.
        const numberPresent: boolean = PreferencesUtil.has(suiteContext, STORE_NAME, numberKey);
        // Log the presence verdicts of all three shapes.
        logCase(TAG, 'string=' + boolText(PreferencesUtil.has(suiteContext, STORE_NAME, stringKey)) +
          ', number=' + boolText(numberPresent) + ', boolean=' +
          boolText(PreferencesUtil.has(suiteContext, STORE_NAME, booleanKey)));
        // The removed number shape must be absent.
        expect(numberPresent).assertFalse();
        // The string shape survives the removal of another shape.
        expect(PreferencesUtil.getString(suiteContext, STORE_NAME, stringKey, FALLBACK_STRING))
          .assertEqual(STRING_VALUE);
        // The boolean shape survives the removal of another shape.
        expect(PreferencesUtil.getBoolean(suiteContext, STORE_NAME, booleanKey, BOOLEAN_FALSE)).assertTrue();
        // The removed number shape falls back to the caller default.
        expect(PreferencesUtil.getNumber(suiteContext, STORE_NAME, numberKey, FALLBACK_NUMBER))
          .assertEqual(FALLBACK_NUMBER);
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
