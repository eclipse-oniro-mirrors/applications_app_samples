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
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { PreferenceUtils } from 'library';
import type { PreferenceChangeListener } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * PreferenceUtils preference storage utility test suite.
 * Covers all public methods including construction/get/getWithDefault/set/remove/clear/has/keys/getAll/size/
 * getStoreName/listener management/destroy.
 */
export default function PreferenceUtilsTest(): void {
  describe('PreferenceUtilsTest', () => {

    // ========================================
    // Construction and basic get/set
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0100
     * @tc.name testDevicePreferenceUtils0001
     * @tc.desc Verify getStoreName returns the correct name after construction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0001 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      expect(prefs.getStoreName()).assertEqual('testStore');
      expect(prefs.size()).assertEqual(0);
      expect(prefs.keys().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0200
     * @tc.name testDevicePreferenceUtils0002
     * @tc.desc Verify get returns the correct value after set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0002 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('key1', 'value1');
      expect(prefs.get('key1')).assertEqual('value1');
      expect(prefs.has('key1')).assertTrue();
      expect(prefs.size()).assertEqual(1);
      prefs.set('key2', 'value2');
      expect(prefs.size()).assertEqual(2);
      expect(prefs.get('key2')).assertEqual('value2');
    });

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0300
     * @tc.name testDevicePreferenceUtils0003
     * @tc.desc Verify getting a nonexistent key returns null.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0003 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      expect(prefs.get('nonexistent')).assertNull();
      expect(prefs.has('nonexistent')).assertFalse();
      expect(prefs.size()).assertEqual(0);
    });

    // ========================================
    // getWithDefault
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0400
     * @tc.name testDevicePreferenceUtils0004
     * @tc.desc Verify an existing key returns its value while a missing key returns the default.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0004 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('existing', 'realValue');
      expect(prefs.getWithDefault('existing', 'default')).assertEqual('realValue');
      expect(prefs.getWithDefault('missing', 'default')).assertEqual('default');
      expect(prefs.getWithDefault('', 'fallback')).assertEqual('fallback');
    });

    // ========================================
    // remove
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0500
     * @tc.name testDevicePreferenceUtils0005
     * @tc.desc Verify the key no longer exists after remove.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0005 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('key1', 'value1');
      prefs.set('key2', 'value2');
      expect(prefs.size()).assertEqual(2);
      prefs.remove('key1');
      expect(prefs.has('key1')).assertFalse();
      expect(prefs.size()).assertEqual(1);
      prefs.remove('nonexistent');
      expect(prefs.size()).assertEqual(1);
    });

    // ========================================
    // clear
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0600
     * @tc.name testDevicePreferenceUtils0006
     * @tc.desc Verify all data is cleared after clear.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0006 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('a', '1');
      prefs.set('b', '2');
      prefs.set('c', '3');
      expect(prefs.size()).assertEqual(3);
      prefs.clear();
      expect(prefs.size()).assertEqual(0);
      expect(prefs.has('a')).assertFalse();
      expect(prefs.keys().length).assertEqual(0);
    });

    // ========================================
    // keys / getAll
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0700
     * @tc.name testDevicePreferenceUtils0007
     * @tc.desc Verify keys returns all keys and getAll returns a copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0007 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('x', '10');
      prefs.set('y', '20');
      const keys: string[] = prefs.keys();
      expect(keys.length).assertEqual(2);
      expect(keys.indexOf('x')).assertLarger(-1);
      expect(keys.indexOf('y')).assertLarger(-1);
      const all: Map<string, string> = prefs.getAll();
      expect(all.size).assertEqual(2);
      expect(all.get('x')).assertEqual('10');
      expect(all.get('y')).assertEqual('20');
    });

    // ========================================
    // Overwrite semantics
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0800
     * @tc.name testDevicePreferenceUtils0008
     * @tc.desc Verify repeated set on the same key overwrites the old value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0008 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('key', 'old');
      expect(prefs.get('key')).assertEqual('old');
      prefs.set('key', 'new');
      expect(prefs.get('key')).assertEqual('new');
      expect(prefs.size()).assertEqual(1);
    });

    // ========================================
    // Listener management
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0900
     * @tc.name testDevicePreferenceUtils0009
     * @tc.desc Verify set/remove trigger the onChanged callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0009 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      let lastKey: string = '';
      let lastOld: string | null = null;
      let lastNew: string | null = null;
      const listener: PreferenceChangeListener = {
        onChanged(key: string, oldValue: string | null, newValue: string | null): void {
          lastKey = key;
          lastOld = oldValue;
          lastNew = newValue;
        },
        onCleared(): void {}
      };
      prefs.addListener(listener);
      prefs.set('name', 'Alice');
      expect(lastKey).assertEqual('name');
      expect(lastOld).assertNull();
      expect(lastNew).assertEqual('Alice');
      prefs.set('name', 'Bob');
      expect(lastOld).assertEqual('Alice');
      expect(lastNew).assertEqual('Bob');
      prefs.remove('name');
      expect(lastOld).assertEqual('Bob');
      expect(lastNew).assertNull();
    });

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_1000
     * @tc.name testDevicePreferenceUtils0010
     * @tc.desc Verify clear triggers the onCleared callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0010 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      let cleared: boolean = false;
      const listener: PreferenceChangeListener = {
        onChanged(_key: string, _old: string | null, _new: string | null): void {},
        onCleared(): void {
          cleared = true;
        }
      };
      prefs.addListener(listener);
      prefs.set('a', '1');
      expect(cleared).assertFalse();
      expect(prefs.size()).assertEqual(1);
      prefs.clear();
      expect(cleared).assertTrue();
      expect(prefs.size()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_1100
     * @tc.name testDevicePreferenceUtils0011
     * @tc.desc Verify a removed listener no longer receives callbacks.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0011 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      let callCount: number = 0;
      const listener: PreferenceChangeListener = {
        onChanged(_key: string, _old: string | null, _new: string | null): void {
          callCount++;
        },
        onCleared(): void {}
      };
      prefs.addListener(listener);
      prefs.set('a', '1');
      expect(callCount).assertEqual(1);
      prefs.removeListener(listener);
      prefs.set('b', '2');
      expect(callCount).assertEqual(1);
      expect(prefs.size()).assertEqual(2);
      prefs.removeListener(listener);
    });

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_1200
     * @tc.name testDevicePreferenceUtils0012
     * @tc.desc Verify adding the same listener twice registers it only once.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDevicePreferenceUtils0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0012 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      let callCount: number = 0;
      const listener: PreferenceChangeListener = {
        onChanged(_key: string, _old: string | null, _new: string | null): void {
          callCount++;
        },
        onCleared(): void {}
      };
      prefs.addListener(listener);
      prefs.addListener(listener);
      prefs.set('a', '1');
      expect(callCount).assertEqual(1);
      expect(prefs.size()).assertEqual(1);
      prefs.removeListener(listener);
      prefs.set('b', '2');
      expect(callCount).assertEqual(1);
    });

    // ========================================
    // destroy
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_1300
     * @tc.name testDevicePreferenceUtils0013
     * @tc.desc Verify destroy clears data and get returns null afterwards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0013 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('key', 'value');
      expect(prefs.get('key')).assertEqual('value');
      prefs.destroy();
      expect(prefs.size()).assertEqual(0);
      expect(prefs.get('key')).assertNull();
      expect(prefs.has('key')).assertFalse();
    });
  });
}
