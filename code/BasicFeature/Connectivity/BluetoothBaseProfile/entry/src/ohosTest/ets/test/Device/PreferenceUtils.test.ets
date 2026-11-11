/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { PreferenceUtils } from 'library';

/**
 * Test suite for PreferenceUtils.
 * @since 26.0.0
 */
const STORE_A: string = 'prefs_case_store_a';
const STORE_B: string = 'prefs_case_store_b';
const MISSING_KEY: string = 'prefs_case_missing_key';

class RecordingPreferenceListener {
  public changedKeys: string[] = [];
  public changedValues: string[] = [];

  onChange(key: string, value: string | number | boolean): void {
    this.changedKeys.push(key);
    this.changedValues.push(String(value));
  }
}

class ThrowingPreferenceListener {
  onChange(key: string, value: string | number | boolean): void {
    throw new Error('preference listener failure ' + key + String(value));
  }
}

export default function preferenceUtilsTest(): void {
  describe('PreferenceUtilsTest', () => {
    // ==================== 存储创建与字符串读写（3 条） ====================

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_0100
     * @tc.name: testPreferenceUtils0001
     * @tc.desc: Initialize a named preference store and confirm it starts empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPreferenceUtils0001', 0, () => {
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.initialize(STORE_A);

      expect(PreferenceUtils.size(STORE_A)).assertEqual(0);
      expect(PreferenceUtils.keys(STORE_A).length).assertEqual(0);
      expect(PreferenceUtils.has(MISSING_KEY, STORE_A)).assertFalse();
      expect(PreferenceUtils.getString(MISSING_KEY, 'fallback', STORE_A)).assertEqual('fallback');
      expect(PreferenceUtils.getNumber(MISSING_KEY, 7, STORE_A)).assertEqual(7);
      expect(PreferenceUtils.getBoolean(MISSING_KEY, true, STORE_A)).assertTrue();

      PreferenceUtils.clear(STORE_A);
    });

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_0200
     * @tc.name: testPreferenceUtils0002
     * @tc.desc: Store, overwrite and read back string preferences including the empty string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPreferenceUtils0002', 0, () => {
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putString('device_name', 'BT-Speaker-Pro', STORE_A);

      expect(PreferenceUtils.getString('device_name', '', STORE_A)).assertEqual('BT-Speaker-Pro');
      expect(PreferenceUtils.has('device_name', STORE_A)).assertTrue();
      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);

      PreferenceUtils.putString('device_name', 'BT-Headset-Air', STORE_A);
      expect(PreferenceUtils.getString('device_name', '', STORE_A)).assertEqual('BT-Headset-Air');
      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);

      PreferenceUtils.putString('empty_value', '', STORE_A);
      expect(PreferenceUtils.getString('empty_value', 'fallback', STORE_A)).assertEqual('');
      expect(PreferenceUtils.has('empty_value', STORE_A)).assertTrue();
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);

      PreferenceUtils.clear(STORE_A);
    });

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_0300
     * @tc.name: testPreferenceUtils0003
     * @tc.desc: Fall back to the supplied default value when a string key was never stored.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPreferenceUtils0003', 0, () => {
      PreferenceUtils.clear(STORE_A);

      expect(PreferenceUtils.getString(MISSING_KEY, 'default-text', STORE_A)).assertEqual('default-text');
      expect(PreferenceUtils.getString(MISSING_KEY, '', STORE_A)).assertEqual('');
      expect(PreferenceUtils.getString('other_missing', 'a-b-c', STORE_A)).assertEqual('a-b-c');
      expect(PreferenceUtils.has(MISSING_KEY, STORE_A)).assertFalse();
      expect(PreferenceUtils.has('other_missing', STORE_A)).assertFalse();
      expect(PreferenceUtils.size(STORE_A)).assertEqual(0);

      PreferenceUtils.clear(STORE_A);
    });

    // ==================== 数值与布尔读写（4 条） ====================

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_0400
     * @tc.name: testPreferenceUtils0004
     * @tc.desc: Store positive, negative, fractional and zero numeric preferences.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPreferenceUtils0004', 0, () => {
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putNumber('volume', 65, STORE_A);
      PreferenceUtils.putNumber('offset', -12, STORE_A);
      PreferenceUtils.putNumber('ratio', 0.25, STORE_A);
      PreferenceUtils.putNumber('zero', 0, STORE_A);

      expect(PreferenceUtils.getNumber('volume', 99, STORE_A)).assertEqual(65);
      expect(PreferenceUtils.getNumber('offset', 99, STORE_A)).assertEqual(-12);
      expect(PreferenceUtils.getNumber('ratio', 99, STORE_A)).assertEqual(0.25);
      expect(PreferenceUtils.getNumber('zero', 99, STORE_A)).assertEqual(0);
      expect(PreferenceUtils.has('zero', STORE_A)).assertTrue();
      expect(PreferenceUtils.size(STORE_A)).assertEqual(4);

      PreferenceUtils.putNumber('volume', 30, STORE_A);
      expect(PreferenceUtils.getNumber('volume', 99, STORE_A)).assertEqual(30);
      expect(PreferenceUtils.size(STORE_A)).assertEqual(4);

      PreferenceUtils.clear(STORE_A);
    });

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_0500
     * @tc.name: testPreferenceUtils0005
     * @tc.desc: Convert a stored string back to a number and report non numeric text as NaN.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPreferenceUtils0005', 0, () => {
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putString('numeric_text', '123', STORE_A);
      PreferenceUtils.putString('broken_text', '12abc', STORE_A);

      expect(PreferenceUtils.getNumber('numeric_text', 0, STORE_A)).assertEqual(123);
      expect(PreferenceUtils.getNumber('broken_text', 0, STORE_A) === 0).assertFalse();
      expect(Number.isNaN(PreferenceUtils.getNumber('broken_text', 0, STORE_A))).assertTrue();
      expect(PreferenceUtils.getString('broken_text', '', STORE_A)).assertEqual('12abc');
      expect(PreferenceUtils.has('broken_text', STORE_A)).assertTrue();
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);

      PreferenceUtils.clear(STORE_A);
    });

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_0600
     * @tc.name: testPreferenceUtils0006
     * @tc.desc: Store boolean preferences in both states and read them with an explicit default.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPreferenceUtils0006', 0, () => {
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putBoolean('auto_connect', true, STORE_A);
      PreferenceUtils.putBoolean('silent_mode', false, STORE_A);

      expect(PreferenceUtils.getBoolean('auto_connect', false, STORE_A)).assertTrue();
      expect(PreferenceUtils.getBoolean('silent_mode', true, STORE_A)).assertFalse();
      expect(PreferenceUtils.has('silent_mode', STORE_A)).assertTrue();
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);

      PreferenceUtils.putBoolean('auto_connect', false, STORE_A);
      expect(PreferenceUtils.getBoolean('auto_connect', true, STORE_A)).assertFalse();
      expect(PreferenceUtils.getString('auto_connect', '', STORE_A)).assertEqual('false');
      expect(PreferenceUtils.getNumber('auto_connect', 9, STORE_A)).assertEqual(0);

      PreferenceUtils.clear(STORE_A);
    });

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_0700
     * @tc.name: testPreferenceUtils0007
     * @tc.desc: Read stored values through a mismatched accessor and observe the conversion rules.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPreferenceUtils0007', 0, () => {
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putNumber('count', 42, STORE_A);
      PreferenceUtils.putBoolean('enabled', true, STORE_A);
      PreferenceUtils.putNumber('off', 0, STORE_A);

      expect(PreferenceUtils.getString('count', '', STORE_A)).assertEqual('42');
      expect(PreferenceUtils.getString('enabled', '', STORE_A)).assertEqual('true');
      expect(PreferenceUtils.getBoolean('count', false, STORE_A)).assertTrue();
      expect(PreferenceUtils.getBoolean('off', true, STORE_A)).assertFalse();
      expect(PreferenceUtils.getNumber('enabled', 0, STORE_A)).assertEqual(1);
      expect(PreferenceUtils.getString('off', '', STORE_A)).assertEqual('0');

      PreferenceUtils.clear(STORE_A);
    });

    // ==================== 键生命周期（3 条） ====================

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_0800
     * @tc.name: testPreferenceUtils0008
     * @tc.desc: Remove an existing key and confirm removing an absent key changes nothing.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPreferenceUtils0008', 0, () => {
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putString('keep', 'kept-value', STORE_A);
      PreferenceUtils.putString('drop', 'dropped-value', STORE_A);

      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);
      PreferenceUtils.remove('drop', STORE_A);
      expect(PreferenceUtils.has('drop', STORE_A)).assertFalse();
      expect(PreferenceUtils.getString('drop', 'gone', STORE_A)).assertEqual('gone');
      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);

      PreferenceUtils.remove(MISSING_KEY, STORE_A);
      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);
      expect(PreferenceUtils.getString('keep', '', STORE_A)).assertEqual('kept-value');
      expect(PreferenceUtils.has('keep', STORE_A)).assertTrue();

      PreferenceUtils.remove('keep', STORE_A);
      expect(PreferenceUtils.size(STORE_A)).assertEqual(0);

      PreferenceUtils.clear(STORE_A);
    });

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_0900
     * @tc.name: testPreferenceUtils0009
     * @tc.desc: List stored keys in insertion order and confirm the returned array is a copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPreferenceUtils0009', 0, () => {
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putString('alpha', '1', STORE_A);
      PreferenceUtils.putString('beta', '2', STORE_A);
      PreferenceUtils.putString('gamma', '3', STORE_A);

      const listed: string[] = PreferenceUtils.keys(STORE_A);
      expect(listed.length).assertEqual(3);
      expect(listed[0]).assertEqual('alpha');
      expect(listed[1]).assertEqual('beta');
      expect(listed[2]).assertEqual('gamma');

      listed.push('injected');
      listed[0] = 'mutated';
      expect(PreferenceUtils.keys(STORE_A).length).assertEqual(3);
      expect(PreferenceUtils.keys(STORE_A)[0]).assertEqual('alpha');
      expect(PreferenceUtils.has('injected', STORE_A)).assertFalse();

      PreferenceUtils.clear(STORE_A);
    });

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_1000
     * @tc.name: testPreferenceUtils0010
     * @tc.desc: Track the store size while adding, overwriting and removing entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPreferenceUtils0010', 0, () => {
      PreferenceUtils.clear(STORE_A);
      expect(PreferenceUtils.size(STORE_A)).assertEqual(0);

      PreferenceUtils.putString('k1', 'v1', STORE_A);
      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);
      PreferenceUtils.putNumber('k2', 2, STORE_A);
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);
      PreferenceUtils.putBoolean('k3', true, STORE_A);
      expect(PreferenceUtils.size(STORE_A)).assertEqual(3);
      PreferenceUtils.putString('k1', 'v1-again', STORE_A);
      expect(PreferenceUtils.size(STORE_A)).assertEqual(3);
      PreferenceUtils.remove('k2', STORE_A);
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);
      expect(PreferenceUtils.keys(STORE_A).length).assertEqual(2);
      expect(PreferenceUtils.getString('k1', '', STORE_A)).assertEqual('v1-again');

      PreferenceUtils.clear(STORE_A);
    });

    // ==================== 多存储隔离（3 条） ====================

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_1100
     * @tc.name: testPreferenceUtils0011
     * @tc.desc: Clear one store while a second store keeps all of its entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPreferenceUtils0011', 0, () => {
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.clear(STORE_B);
      PreferenceUtils.putString('shared_key', 'value-a', STORE_A);
      PreferenceUtils.putString('shared_key', 'value-b', STORE_B);

      expect(PreferenceUtils.getString('shared_key', '', STORE_A)).assertEqual('value-a');
      expect(PreferenceUtils.getString('shared_key', '', STORE_B)).assertEqual('value-b');

      PreferenceUtils.clear(STORE_A);
      expect(PreferenceUtils.size(STORE_A)).assertEqual(0);
      expect(PreferenceUtils.has('shared_key', STORE_A)).assertFalse();
      expect(PreferenceUtils.size(STORE_B)).assertEqual(1);
      expect(PreferenceUtils.getString('shared_key', '', STORE_B)).assertEqual('value-b');

      PreferenceUtils.clear(STORE_B);
      expect(PreferenceUtils.size(STORE_B)).assertEqual(0);
    });

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_1200
     * @tc.name: testPreferenceUtils0012
     * @tc.desc: Keep three stores independent for writes, removals and key listings.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPreferenceUtils0012', 0, () => {
      const storeC: string = 'prefs_case_store_c';
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.clear(STORE_B);
      PreferenceUtils.clear(storeC);
      PreferenceUtils.putString('slot', 'a', STORE_A);
      PreferenceUtils.putNumber('slot', 1, STORE_B);
      PreferenceUtils.putBoolean('slot', true, storeC);

      expect(PreferenceUtils.getString('slot', '', STORE_A)).assertEqual('a');
      expect(PreferenceUtils.getNumber('slot', 0, STORE_B)).assertEqual(1);
      expect(PreferenceUtils.getBoolean('slot', false, storeC)).assertTrue();
      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);
      expect(PreferenceUtils.size(STORE_B)).assertEqual(1);
      expect(PreferenceUtils.size(storeC)).assertEqual(1);

      PreferenceUtils.remove('slot', STORE_B);
      expect(PreferenceUtils.size(STORE_B)).assertEqual(0);
      expect(PreferenceUtils.keys(STORE_A).length).assertEqual(1);
      expect(PreferenceUtils.keys(storeC)[0]).assertEqual('slot');

      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.clear(storeC);
    });

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_1300
     * @tc.name: testPreferenceUtils0013
     * @tc.desc: Use the default store through the single argument accessors and restore its size.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPreferenceUtils0013', 0, () => {
      const probeKey: string = 'prefs_case_default_probe';
      PreferenceUtils.initialize();
      const sizeBefore: number = PreferenceUtils.size();

      PreferenceUtils.putString(probeKey, 'default-store-value');
      expect(PreferenceUtils.getString(probeKey, '')).assertEqual('default-store-value');
      expect(PreferenceUtils.has(probeKey)).assertTrue();
      expect(PreferenceUtils.size()).assertEqual(sizeBefore + 1);
      expect(PreferenceUtils.keys().indexOf(probeKey)).assertLargerOrEqual(0);

      PreferenceUtils.remove(probeKey);
      expect(PreferenceUtils.has(probeKey)).assertFalse();
      expect(PreferenceUtils.size()).assertEqual(sizeBefore);
      expect(PreferenceUtils.keys().indexOf(probeKey)).assertEqual(-1);
    });

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_1400
     * @tc.name: testPreferenceUtils0014
     * @tc.desc: Repeat initialization of an existing store without discarding its content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPreferenceUtils0014', 0, () => {
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.initialize(STORE_A);
      PreferenceUtils.putString('survivor', 'still-here', STORE_A);
      PreferenceUtils.initialize(STORE_A);
      PreferenceUtils.initialize(STORE_A);

      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);
      expect(PreferenceUtils.getString('survivor', '', STORE_A)).assertEqual('still-here');
      expect(PreferenceUtils.has('survivor', STORE_A)).assertTrue();
      expect(PreferenceUtils.keys(STORE_A)[0]).assertEqual('survivor');
      expect(Number.isNaN(PreferenceUtils.getNumber('survivor', 0, STORE_A))).assertTrue();
      expect(PreferenceUtils.getString('absent', 'dflt', STORE_A)).assertEqual('dflt');

      PreferenceUtils.clear(STORE_A);
    });

    // ==================== 变更监听（4 条） ====================

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_1500
     * @tc.name: testPreferenceUtils0015
     * @tc.desc: Notify the registered listener for every string, number and boolean write.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPreferenceUtils0015', 0, () => {
      PreferenceUtils.clear(STORE_A);
      const listener: RecordingPreferenceListener = new RecordingPreferenceListener();
      PreferenceUtils.addListener(listener);

      PreferenceUtils.putString('n1', 'text', STORE_A);
      PreferenceUtils.putNumber('n2', 8, STORE_A);
      PreferenceUtils.putBoolean('n3', false, STORE_A);

      expect(listener.changedKeys.length).assertEqual(3);
      expect(listener.changedKeys[0]).assertEqual('n1');
      expect(listener.changedValues[0]).assertEqual('text');
      expect(listener.changedKeys[1]).assertEqual('n2');
      expect(listener.changedValues[1]).assertEqual('8');
      expect(listener.changedKeys[2]).assertEqual('n3');
      expect(listener.changedValues[2]).assertEqual('false');
      expect(PreferenceUtils.size(STORE_A)).assertEqual(3);

      PreferenceUtils.removeListener(listener);
      PreferenceUtils.clear(STORE_A);
    });

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_1600
     * @tc.name: testPreferenceUtils0016
     * @tc.desc: Stop notifications after removing the listener and ignore unknown listeners.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPreferenceUtils0016', 0, () => {
      PreferenceUtils.clear(STORE_A);
      const listener: RecordingPreferenceListener = new RecordingPreferenceListener();
      const stranger: RecordingPreferenceListener = new RecordingPreferenceListener();
      PreferenceUtils.addListener(listener);
      PreferenceUtils.putString('first', 'v1', STORE_A);
      PreferenceUtils.removeListener(listener);
      PreferenceUtils.putString('second', 'v2', STORE_A);
      PreferenceUtils.removeListener(stranger);
      PreferenceUtils.removeListener(listener);

      expect(listener.changedKeys.length).assertEqual(1);
      expect(listener.changedKeys[0]).assertEqual('first');
      expect(stranger.changedKeys.length).assertEqual(0);
      expect(PreferenceUtils.getString('second', '', STORE_A)).assertEqual('v2');
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);
      expect(listener.changedValues[0]).assertEqual('v1');

      PreferenceUtils.clear(STORE_A);
    });

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_1700
     * @tc.name: testPreferenceUtils0017
     * @tc.desc: Keep notifying the remaining listeners when one listener throws.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPreferenceUtils0017', 0, () => {
      PreferenceUtils.clear(STORE_A);
      const throwing: ThrowingPreferenceListener = new ThrowingPreferenceListener();
      const survivor: RecordingPreferenceListener = new RecordingPreferenceListener();
      PreferenceUtils.addListener(throwing);
      PreferenceUtils.addListener(survivor);

      PreferenceUtils.putString('robust', 'value', STORE_A);
      PreferenceUtils.putNumber('robust2', 5, STORE_A);

      expect(survivor.changedKeys.length).assertEqual(2);
      expect(survivor.changedKeys[0]).assertEqual('robust');
      expect(survivor.changedValues[1]).assertEqual('5');
      expect(PreferenceUtils.getString('robust', '', STORE_A)).assertEqual('value');
      expect(PreferenceUtils.getNumber('robust2', 0, STORE_A)).assertEqual(5);
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);

      PreferenceUtils.removeListener(throwing);
      PreferenceUtils.removeListener(survivor);
      PreferenceUtils.clear(STORE_A);
    });

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_1800
     * @tc.name: testPreferenceUtils0018
     * @tc.desc: Emit no change notification for reads, removals and store clear operations.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPreferenceUtils0018', 0, () => {
      PreferenceUtils.clear(STORE_A);
      const listener: RecordingPreferenceListener = new RecordingPreferenceListener();
      PreferenceUtils.addListener(listener);
      PreferenceUtils.putString('quiet', 'value', STORE_A);
      const afterWrite: number = listener.changedKeys.length;

      PreferenceUtils.getString('quiet', '', STORE_A);
      PreferenceUtils.has('quiet', STORE_A);
      PreferenceUtils.keys(STORE_A);
      PreferenceUtils.size(STORE_A);
      PreferenceUtils.initialize(STORE_A);
      PreferenceUtils.remove('quiet', STORE_A);
      PreferenceUtils.clear(STORE_A);

      expect(afterWrite).assertEqual(1);
      expect(listener.changedKeys.length).assertEqual(1);
      expect(listener.changedKeys[0]).assertEqual('quiet');
      expect(listener.changedValues.length).assertEqual(1);
      expect(PreferenceUtils.size(STORE_A)).assertEqual(0);
      expect(PreferenceUtils.has('quiet', STORE_A)).assertFalse();

      PreferenceUtils.removeListener(listener);
      PreferenceUtils.clear(STORE_A);
    });
  });
}
