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
import { hilog } from '@kit.PerformanceAnalysisKit';
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
    // ==================== store creation and string read/write (3 cases) ====================

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_0100
     * @tc.name: testPreferenceUtils0001
     * @tc.desc: Initialize a named preference store and confirm it starts empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPreferenceUtils0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0001', 'begin');
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.initialize(STORE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0001',
        '#1 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(0)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0001',
        '#2 assert ' + "expect(PreferenceUtils.keys(STORE_A).length).assertEqual(0)");
      expect(PreferenceUtils.keys(STORE_A).length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0001',
        '#3 assert ' + "expect(PreferenceUtils.has(MISSING_KEY, STORE_A)).assertFalse()");
      expect(PreferenceUtils.has(MISSING_KEY, STORE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0001',
        '#4 assert ' + "expect(PreferenceUtils.getString(MISSING_KEY, 'fallback', STORE_A)).assertEqual('fallback')");
      expect(PreferenceUtils.getString(MISSING_KEY, 'fallback', STORE_A)).assertEqual('fallback');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0001',
        '#5 assert ' + "expect(PreferenceUtils.getNumber(MISSING_KEY, 7, STORE_A)).assertEqual(7)");
      expect(PreferenceUtils.getNumber(MISSING_KEY, 7, STORE_A)).assertEqual(7);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0001',
        '#6 assert ' + "expect(PreferenceUtils.getBoolean(MISSING_KEY, true, STORE_A)).assertTrue()");
      expect(PreferenceUtils.getBoolean(MISSING_KEY, true, STORE_A)).assertTrue();

      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0002', 'begin');
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putString('device_name', 'BT-Speaker-Pro', STORE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0002',
        '#1 assert ' + "expect(PreferenceUtils.getString('device_name', '', STORE_A)).assertEqual('BT-Speaker-Pro')");
      expect(PreferenceUtils.getString('device_name', '', STORE_A)).assertEqual('BT-Speaker-Pro');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0002',
        '#2 assert ' + "expect(PreferenceUtils.has('device_name', STORE_A)).assertTrue()");
      expect(PreferenceUtils.has('device_name', STORE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0002',
        '#3 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(1)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);

      PreferenceUtils.putString('device_name', 'BT-Headset-Air', STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0002',
        '#4 assert ' + "expect(PreferenceUtils.getString('device_name', '', STORE_A)).assertEqual('BT-Headset-Air')");
      expect(PreferenceUtils.getString('device_name', '', STORE_A)).assertEqual('BT-Headset-Air');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0002',
        '#5 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(1)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);

      PreferenceUtils.putString('empty_value', '', STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0002',
        '#6 assert ' + "expect(PreferenceUtils.getString('empty_value', 'fallback', STORE_A)).assertEqual('')");
      expect(PreferenceUtils.getString('empty_value', 'fallback', STORE_A)).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0002',
        '#7 assert ' + "expect(PreferenceUtils.has('empty_value', STORE_A)).assertTrue()");
      expect(PreferenceUtils.has('empty_value', STORE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0002',
        '#8 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(2)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);

      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0003', 'begin');
      PreferenceUtils.clear(STORE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0003',
        '#1 assert ' +
        "expect(PreferenceUtils.getString(MISSING_KEY, 'default-text', STORE_A)).assertEqual('default-text')");
      expect(PreferenceUtils.getString(MISSING_KEY, 'default-text', STORE_A)).assertEqual('default-text');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0003',
        '#2 assert ' + "expect(PreferenceUtils.getString(MISSING_KEY, '', STORE_A)).assertEqual('')");
      expect(PreferenceUtils.getString(MISSING_KEY, '', STORE_A)).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0003',
        '#3 assert ' + "expect(PreferenceUtils.getString('other_missing', 'a-b-c', STORE_A)).assertEqual('a-b-c')");
      expect(PreferenceUtils.getString('other_missing', 'a-b-c', STORE_A)).assertEqual('a-b-c');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0003',
        '#4 assert ' + "expect(PreferenceUtils.has(MISSING_KEY, STORE_A)).assertFalse()");
      expect(PreferenceUtils.has(MISSING_KEY, STORE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0003',
        '#5 assert ' + "expect(PreferenceUtils.has('other_missing', STORE_A)).assertFalse()");
      expect(PreferenceUtils.has('other_missing', STORE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0003',
        '#6 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(0)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(0);

      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0003', 'end');
    });

    // ==================== number value and layout er read/write (4 cases) ====================

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_0400
     * @tc.name: testPreferenceUtils0004
     * @tc.desc: Store positive, negative, fractional and zero numeric preferences.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPreferenceUtils0004', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0004', 'begin');
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putNumber('volume', 65, STORE_A);
      PreferenceUtils.putNumber('offset', -12, STORE_A);
      PreferenceUtils.putNumber('ratio', 0.25, STORE_A);
      PreferenceUtils.putNumber('zero', 0, STORE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0004',
        '#1 assert ' + "expect(PreferenceUtils.getNumber('volume', 99, STORE_A)).assertEqual(65)");
      expect(PreferenceUtils.getNumber('volume', 99, STORE_A)).assertEqual(65);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0004',
        '#2 assert ' + "expect(PreferenceUtils.getNumber('offset', 99, STORE_A)).assertEqual(-12)");
      expect(PreferenceUtils.getNumber('offset', 99, STORE_A)).assertEqual(-12);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0004',
        '#3 assert ' + "expect(PreferenceUtils.getNumber('ratio', 99, STORE_A)).assertEqual(0.25)");
      expect(PreferenceUtils.getNumber('ratio', 99, STORE_A)).assertEqual(0.25);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0004',
        '#4 assert ' + "expect(PreferenceUtils.getNumber('zero', 99, STORE_A)).assertEqual(0)");
      expect(PreferenceUtils.getNumber('zero', 99, STORE_A)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0004',
        '#5 assert ' + "expect(PreferenceUtils.has('zero', STORE_A)).assertTrue()");
      expect(PreferenceUtils.has('zero', STORE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0004',
        '#6 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(4)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(4);

      PreferenceUtils.putNumber('volume', 30, STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0004',
        '#7 assert ' + "expect(PreferenceUtils.getNumber('volume', 99, STORE_A)).assertEqual(30)");
      expect(PreferenceUtils.getNumber('volume', 99, STORE_A)).assertEqual(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0004',
        '#8 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(4)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(4);

      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0005', 'begin');
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putString('numeric_text', '123', STORE_A);
      PreferenceUtils.putString('broken_text', '12abc', STORE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0005',
        '#1 assert ' + "expect(PreferenceUtils.getNumber('numeric_text', 0, STORE_A)).assertEqual(123)");
      expect(PreferenceUtils.getNumber('numeric_text', 0, STORE_A)).assertEqual(123);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0005',
        '#2 assert ' + "expect(PreferenceUtils.getNumber('broken_text', 0, STORE_A) === 0).assertFalse()");
      expect(PreferenceUtils.getNumber('broken_text', 0, STORE_A) === 0).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0005',
        '#3 assert ' + "expect(Number.isNaN(PreferenceUtils.getNumber('broken_text', 0, STORE_A))).assertTrue()");
      expect(Number.isNaN(PreferenceUtils.getNumber('broken_text', 0, STORE_A))).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0005',
        '#4 assert ' + "expect(PreferenceUtils.getString('broken_text', '', STORE_A)).assertEqual('12abc')");
      expect(PreferenceUtils.getString('broken_text', '', STORE_A)).assertEqual('12abc');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0005',
        '#5 assert ' + "expect(PreferenceUtils.has('broken_text', STORE_A)).assertTrue()");
      expect(PreferenceUtils.has('broken_text', STORE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0005',
        '#6 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(2)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);

      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0006', 'begin');
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putBoolean('auto_connect', true, STORE_A);
      PreferenceUtils.putBoolean('silent_mode', false, STORE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0006',
        '#1 assert ' + "expect(PreferenceUtils.getBoolean('auto_connect', false, STORE_A)).assertTrue()");
      expect(PreferenceUtils.getBoolean('auto_connect', false, STORE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0006',
        '#2 assert ' + "expect(PreferenceUtils.getBoolean('silent_mode', true, STORE_A)).assertFalse()");
      expect(PreferenceUtils.getBoolean('silent_mode', true, STORE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0006',
        '#3 assert ' + "expect(PreferenceUtils.has('silent_mode', STORE_A)).assertTrue()");
      expect(PreferenceUtils.has('silent_mode', STORE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0006',
        '#4 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(2)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);

      PreferenceUtils.putBoolean('auto_connect', false, STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0006',
        '#5 assert ' + "expect(PreferenceUtils.getBoolean('auto_connect', true, STORE_A)).assertFalse()");
      expect(PreferenceUtils.getBoolean('auto_connect', true, STORE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0006',
        '#6 assert ' + "expect(PreferenceUtils.getString('auto_connect', '', STORE_A)).assertEqual('false')");
      expect(PreferenceUtils.getString('auto_connect', '', STORE_A)).assertEqual('false');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0006',
        '#7 assert ' + "expect(PreferenceUtils.getNumber('auto_connect', 9, STORE_A)).assertEqual(0)");
      expect(PreferenceUtils.getNumber('auto_connect', 9, STORE_A)).assertEqual(0);

      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0007', 'begin');
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putNumber('count', 42, STORE_A);
      PreferenceUtils.putBoolean('enabled', true, STORE_A);
      PreferenceUtils.putNumber('off', 0, STORE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0007',
        '#1 assert ' + "expect(PreferenceUtils.getString('count', '', STORE_A)).assertEqual('42')");
      expect(PreferenceUtils.getString('count', '', STORE_A)).assertEqual('42');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0007',
        '#2 assert ' + "expect(PreferenceUtils.getString('enabled', '', STORE_A)).assertEqual('true')");
      expect(PreferenceUtils.getString('enabled', '', STORE_A)).assertEqual('true');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0007',
        '#3 assert ' + "expect(PreferenceUtils.getBoolean('count', false, STORE_A)).assertTrue()");
      expect(PreferenceUtils.getBoolean('count', false, STORE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0007',
        '#4 assert ' + "expect(PreferenceUtils.getBoolean('off', true, STORE_A)).assertFalse()");
      expect(PreferenceUtils.getBoolean('off', true, STORE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0007',
        '#5 assert ' + "expect(PreferenceUtils.getNumber('enabled', 0, STORE_A)).assertEqual(1)");
      expect(PreferenceUtils.getNumber('enabled', 0, STORE_A)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0007',
        '#6 assert ' + "expect(PreferenceUtils.getString('off', '', STORE_A)).assertEqual('0')");
      expect(PreferenceUtils.getString('off', '', STORE_A)).assertEqual('0');

      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0007', 'end');
    });

    // ==================== key lifecycle (3 cases) ====================

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_0800
     * @tc.name: testPreferenceUtils0008
     * @tc.desc: Remove an existing key and confirm removing an absent key changes nothing.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPreferenceUtils0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0008', 'begin');
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putString('keep', 'kept-value', STORE_A);
      PreferenceUtils.putString('drop', 'dropped-value', STORE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0008',
        '#1 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(2)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);
      PreferenceUtils.remove('drop', STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0008',
        '#2 assert ' + "expect(PreferenceUtils.has('drop', STORE_A)).assertFalse()");
      expect(PreferenceUtils.has('drop', STORE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0008',
        '#3 assert ' + "expect(PreferenceUtils.getString('drop', 'gone', STORE_A)).assertEqual('gone')");
      expect(PreferenceUtils.getString('drop', 'gone', STORE_A)).assertEqual('gone');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0008',
        '#4 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(1)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);

      PreferenceUtils.remove(MISSING_KEY, STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0008',
        '#5 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(1)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0008',
        '#6 assert ' + "expect(PreferenceUtils.getString('keep', '', STORE_A)).assertEqual('kept-value')");
      expect(PreferenceUtils.getString('keep', '', STORE_A)).assertEqual('kept-value');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0008',
        '#7 assert ' + "expect(PreferenceUtils.has('keep', STORE_A)).assertTrue()");
      expect(PreferenceUtils.has('keep', STORE_A)).assertTrue();

      PreferenceUtils.remove('keep', STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0008',
        '#8 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(0)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(0);

      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0009', 'begin');
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.putString('alpha', '1', STORE_A);
      PreferenceUtils.putString('beta', '2', STORE_A);
      PreferenceUtils.putString('gamma', '3', STORE_A);

      const listed: string[] = PreferenceUtils.keys(STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0009',
        '#1 ' + "listed.length" + ' = ' + JSON.stringify(listed.length));
      expect(listed.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0009',
        '#2 ' + "listed[0]" + ' = ' + JSON.stringify(listed[0]));
      expect(listed[0]).assertEqual('alpha');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0009',
        '#3 ' + "listed[1]" + ' = ' + JSON.stringify(listed[1]));
      expect(listed[1]).assertEqual('beta');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0009',
        '#4 ' + "listed[2]" + ' = ' + JSON.stringify(listed[2]));
      expect(listed[2]).assertEqual('gamma');

      listed.push('injected');
      listed[0] = 'mutated';
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0009',
        '#5 assert ' + "expect(PreferenceUtils.keys(STORE_A).length).assertEqual(3)");
      expect(PreferenceUtils.keys(STORE_A).length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0009',
        '#6 assert ' + "expect(PreferenceUtils.keys(STORE_A)[0]).assertEqual('alpha')");
      expect(PreferenceUtils.keys(STORE_A)[0]).assertEqual('alpha');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0009',
        '#7 assert ' + "expect(PreferenceUtils.has('injected', STORE_A)).assertFalse()");
      expect(PreferenceUtils.has('injected', STORE_A)).assertFalse();

      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0010', 'begin');
      PreferenceUtils.clear(STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0010',
        '#1 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(0)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(0);

      PreferenceUtils.putString('k1', 'v1', STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0010',
        '#2 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(1)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);
      PreferenceUtils.putNumber('k2', 2, STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0010',
        '#3 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(2)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);
      PreferenceUtils.putBoolean('k3', true, STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0010',
        '#4 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(3)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(3);
      PreferenceUtils.putString('k1', 'v1-again', STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0010',
        '#5 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(3)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(3);
      PreferenceUtils.remove('k2', STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0010',
        '#6 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(2)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0010',
        '#7 assert ' + "expect(PreferenceUtils.keys(STORE_A).length).assertEqual(2)");
      expect(PreferenceUtils.keys(STORE_A).length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0010',
        '#8 assert ' + "expect(PreferenceUtils.getString('k1', '', STORE_A)).assertEqual('v1-again')");
      expect(PreferenceUtils.getString('k1', '', STORE_A)).assertEqual('v1-again');

      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0010', 'end');
    });

    // ==================== multi store isolation (3 cases) ====================

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_1100
     * @tc.name: testPreferenceUtils0011
     * @tc.desc: Clear one store while a second store keeps all of its entries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPreferenceUtils0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0011', 'begin');
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.clear(STORE_B);
      PreferenceUtils.putString('shared_key', 'value-a', STORE_A);
      PreferenceUtils.putString('shared_key', 'value-b', STORE_B);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0011',
        '#1 assert ' + "expect(PreferenceUtils.getString('shared_key', '', STORE_A)).assertEqual('value-a')");
      expect(PreferenceUtils.getString('shared_key', '', STORE_A)).assertEqual('value-a');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0011',
        '#2 assert ' + "expect(PreferenceUtils.getString('shared_key', '', STORE_B)).assertEqual('value-b')");
      expect(PreferenceUtils.getString('shared_key', '', STORE_B)).assertEqual('value-b');

      PreferenceUtils.clear(STORE_A);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0011',
        '#3 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(0)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0011',
        '#4 assert ' + "expect(PreferenceUtils.has('shared_key', STORE_A)).assertFalse()");
      expect(PreferenceUtils.has('shared_key', STORE_A)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0011',
        '#5 assert ' + "expect(PreferenceUtils.size(STORE_B)).assertEqual(1)");
      expect(PreferenceUtils.size(STORE_B)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0011',
        '#6 assert ' + "expect(PreferenceUtils.getString('shared_key', '', STORE_B)).assertEqual('value-b')");
      expect(PreferenceUtils.getString('shared_key', '', STORE_B)).assertEqual('value-b');

      PreferenceUtils.clear(STORE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0011',
        '#7 assert ' + "expect(PreferenceUtils.size(STORE_B)).assertEqual(0)");
      expect(PreferenceUtils.size(STORE_B)).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0012', 'begin');
      const storeC: string = 'prefs_case_store_c';
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.clear(STORE_B);
      PreferenceUtils.clear(storeC);
      PreferenceUtils.putString('slot', 'a', STORE_A);
      PreferenceUtils.putNumber('slot', 1, STORE_B);
      PreferenceUtils.putBoolean('slot', true, storeC);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0012',
        '#1 assert ' + "expect(PreferenceUtils.getString('slot', '', STORE_A)).assertEqual('a')");
      expect(PreferenceUtils.getString('slot', '', STORE_A)).assertEqual('a');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0012',
        '#2 assert ' + "expect(PreferenceUtils.getNumber('slot', 0, STORE_B)).assertEqual(1)");
      expect(PreferenceUtils.getNumber('slot', 0, STORE_B)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0012',
        '#3 assert ' + "expect(PreferenceUtils.getBoolean('slot', false, storeC)).assertTrue()");
      expect(PreferenceUtils.getBoolean('slot', false, storeC)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0012',
        '#4 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(1)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0012',
        '#5 assert ' + "expect(PreferenceUtils.size(STORE_B)).assertEqual(1)");
      expect(PreferenceUtils.size(STORE_B)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0012',
        '#6 assert ' + "expect(PreferenceUtils.size(storeC)).assertEqual(1)");
      expect(PreferenceUtils.size(storeC)).assertEqual(1);

      PreferenceUtils.remove('slot', STORE_B);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0012',
        '#7 assert ' + "expect(PreferenceUtils.size(STORE_B)).assertEqual(0)");
      expect(PreferenceUtils.size(STORE_B)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0012',
        '#8 assert ' + "expect(PreferenceUtils.keys(STORE_A).length).assertEqual(1)");
      expect(PreferenceUtils.keys(STORE_A).length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0012',
        '#9 assert ' + "expect(PreferenceUtils.keys(storeC)[0]).assertEqual('slot')");
      expect(PreferenceUtils.keys(storeC)[0]).assertEqual('slot');

      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.clear(storeC);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0012', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0013', 'begin');
      const probeKey: string = 'prefs_case_default_probe';
      PreferenceUtils.initialize();
      const sizeBefore: number = PreferenceUtils.size();

      PreferenceUtils.putString(probeKey, 'default-store-value');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0013',
        '#1 assert ' + "expect(PreferenceUtils.getString(probeKey, '')).assertEqual('default-store-value')");
      expect(PreferenceUtils.getString(probeKey, '')).assertEqual('default-store-value');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0013',
        '#2 assert ' + "expect(PreferenceUtils.has(probeKey)).assertTrue()");
      expect(PreferenceUtils.has(probeKey)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0013',
        '#3 assert ' + "expect(PreferenceUtils.size()).assertEqual(sizeBefore + 1)");
      expect(PreferenceUtils.size()).assertEqual(sizeBefore + 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0013',
        '#4 assert ' + "expect(PreferenceUtils.keys().indexOf(probeKey)).assertLargerOrEqual(0)");
      expect(PreferenceUtils.keys().indexOf(probeKey)).assertLargerOrEqual(0);

      PreferenceUtils.remove(probeKey);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0013',
        '#5 assert ' + "expect(PreferenceUtils.has(probeKey)).assertFalse()");
      expect(PreferenceUtils.has(probeKey)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0013',
        '#6 assert ' + "expect(PreferenceUtils.size()).assertEqual(sizeBefore)");
      expect(PreferenceUtils.size()).assertEqual(sizeBefore);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0013',
        '#7 assert ' + "expect(PreferenceUtils.keys().indexOf(probeKey)).assertEqual(-1)");
      expect(PreferenceUtils.keys().indexOf(probeKey)).assertEqual(-1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0013', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0014', 'begin');
      PreferenceUtils.clear(STORE_A);
      PreferenceUtils.initialize(STORE_A);
      PreferenceUtils.putString('survivor', 'still-here', STORE_A);
      PreferenceUtils.initialize(STORE_A);
      PreferenceUtils.initialize(STORE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0014',
        '#1 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(1)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0014',
        '#2 assert ' + "expect(PreferenceUtils.getString('survivor', '', STORE_A)).assertEqual('still-here')");
      expect(PreferenceUtils.getString('survivor', '', STORE_A)).assertEqual('still-here');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0014',
        '#3 assert ' + "expect(PreferenceUtils.has('survivor', STORE_A)).assertTrue()");
      expect(PreferenceUtils.has('survivor', STORE_A)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0014',
        '#4 assert ' + "expect(PreferenceUtils.keys(STORE_A)[0]).assertEqual('survivor')");
      expect(PreferenceUtils.keys(STORE_A)[0]).assertEqual('survivor');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0014',
        '#5 assert ' + "expect(Number.isNaN(PreferenceUtils.getNumber('survivor', 0, STORE_A))).assertTrue()");
      expect(Number.isNaN(PreferenceUtils.getNumber('survivor', 0, STORE_A))).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0014',
        '#6 assert ' + "expect(PreferenceUtils.getString('absent', 'dflt', STORE_A)).assertEqual('dflt')");
      expect(PreferenceUtils.getString('absent', 'dflt', STORE_A)).assertEqual('dflt');

      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0014', 'end');
    });

    // ==================== change monitor listen (4 cases) ====================

    /*
     * @tc.number: SUB_PREFERENCE_UTILS_1500
     * @tc.name: testPreferenceUtils0015
     * @tc.desc: Notify the registered listener for every string, number and boolean write.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPreferenceUtils0015', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0015', 'begin');
      PreferenceUtils.clear(STORE_A);
      const listener: RecordingPreferenceListener = new RecordingPreferenceListener();
      PreferenceUtils.addListener(listener);

      PreferenceUtils.putString('n1', 'text', STORE_A);
      PreferenceUtils.putNumber('n2', 8, STORE_A);
      PreferenceUtils.putBoolean('n3', false, STORE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0015',
        '#1 ' + "listener.changedKeys.length" + ' = ' + JSON.stringify(listener.changedKeys.length));
      expect(listener.changedKeys.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0015',
        '#2 ' + "listener.changedKeys[0]" + ' = ' + JSON.stringify(listener.changedKeys[0]));
      expect(listener.changedKeys[0]).assertEqual('n1');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0015',
        '#3 ' + "listener.changedValues[0]" + ' = ' + JSON.stringify(listener.changedValues[0]));
      expect(listener.changedValues[0]).assertEqual('text');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0015',
        '#4 ' + "listener.changedKeys[1]" + ' = ' + JSON.stringify(listener.changedKeys[1]));
      expect(listener.changedKeys[1]).assertEqual('n2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0015',
        '#5 ' + "listener.changedValues[1]" + ' = ' + JSON.stringify(listener.changedValues[1]));
      expect(listener.changedValues[1]).assertEqual('8');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0015',
        '#6 ' + "listener.changedKeys[2]" + ' = ' + JSON.stringify(listener.changedKeys[2]));
      expect(listener.changedKeys[2]).assertEqual('n3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0015',
        '#7 ' + "listener.changedValues[2]" + ' = ' + JSON.stringify(listener.changedValues[2]));
      expect(listener.changedValues[2]).assertEqual('false');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0015',
        '#8 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(3)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(3);

      PreferenceUtils.removeListener(listener);
      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0015', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0016', 'begin');
      PreferenceUtils.clear(STORE_A);
      const listener: RecordingPreferenceListener = new RecordingPreferenceListener();
      const stranger: RecordingPreferenceListener = new RecordingPreferenceListener();
      PreferenceUtils.addListener(listener);
      PreferenceUtils.putString('first', 'v1', STORE_A);
      PreferenceUtils.removeListener(listener);
      PreferenceUtils.putString('second', 'v2', STORE_A);
      PreferenceUtils.removeListener(stranger);
      PreferenceUtils.removeListener(listener);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0016',
        '#1 ' + "listener.changedKeys.length" + ' = ' + JSON.stringify(listener.changedKeys.length));
      expect(listener.changedKeys.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0016',
        '#2 ' + "listener.changedKeys[0]" + ' = ' + JSON.stringify(listener.changedKeys[0]));
      expect(listener.changedKeys[0]).assertEqual('first');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0016',
        '#3 ' + "stranger.changedKeys.length" + ' = ' + JSON.stringify(stranger.changedKeys.length));
      expect(stranger.changedKeys.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0016',
        '#4 assert ' + "expect(PreferenceUtils.getString('second', '', STORE_A)).assertEqual('v2')");
      expect(PreferenceUtils.getString('second', '', STORE_A)).assertEqual('v2');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0016',
        '#5 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(2)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0016',
        '#6 ' + "listener.changedValues[0]" + ' = ' + JSON.stringify(listener.changedValues[0]));
      expect(listener.changedValues[0]).assertEqual('v1');

      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0016', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0017', 'begin');
      PreferenceUtils.clear(STORE_A);
      const throwing: ThrowingPreferenceListener = new ThrowingPreferenceListener();
      const survivor: RecordingPreferenceListener = new RecordingPreferenceListener();
      PreferenceUtils.addListener(throwing);
      PreferenceUtils.addListener(survivor);

      PreferenceUtils.putString('robust', 'value', STORE_A);
      PreferenceUtils.putNumber('robust2', 5, STORE_A);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0017',
        '#1 ' + "survivor.changedKeys.length" + ' = ' + JSON.stringify(survivor.changedKeys.length));
      expect(survivor.changedKeys.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0017',
        '#2 ' + "survivor.changedKeys[0]" + ' = ' + JSON.stringify(survivor.changedKeys[0]));
      expect(survivor.changedKeys[0]).assertEqual('robust');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0017',
        '#3 ' + "survivor.changedValues[1]" + ' = ' + JSON.stringify(survivor.changedValues[1]));
      expect(survivor.changedValues[1]).assertEqual('5');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0017',
        '#4 assert ' + "expect(PreferenceUtils.getString('robust', '', STORE_A)).assertEqual('value')");
      expect(PreferenceUtils.getString('robust', '', STORE_A)).assertEqual('value');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0017',
        '#5 assert ' + "expect(PreferenceUtils.getNumber('robust2', 0, STORE_A)).assertEqual(5)");
      expect(PreferenceUtils.getNumber('robust2', 0, STORE_A)).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0017',
        '#6 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(2)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(2);

      PreferenceUtils.removeListener(throwing);
      PreferenceUtils.removeListener(survivor);
      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0017', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0018', 'begin');
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

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0018',
        '#1 ' + "afterWrite" + ' = ' + JSON.stringify(afterWrite));
      expect(afterWrite).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0018',
        '#2 ' + "listener.changedKeys.length" + ' = ' + JSON.stringify(listener.changedKeys.length));
      expect(listener.changedKeys.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0018',
        '#3 ' + "listener.changedKeys[0]" + ' = ' + JSON.stringify(listener.changedKeys[0]));
      expect(listener.changedKeys[0]).assertEqual('quiet');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0018',
        '#4 ' + "listener.changedValues.length" + ' = ' + JSON.stringify(listener.changedValues.length));
      expect(listener.changedValues.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0018',
        '#5 assert ' + "expect(PreferenceUtils.size(STORE_A)).assertEqual(0)");
      expect(PreferenceUtils.size(STORE_A)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPreferenceUtils0018',
        '#6 assert ' + "expect(PreferenceUtils.has('quiet', STORE_A)).assertFalse()");
      expect(PreferenceUtils.has('quiet', STORE_A)).assertFalse();

      PreferenceUtils.removeListener(listener);
      PreferenceUtils.clear(STORE_A);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPreferenceUtils0018', 'end');
    });
  });
}
