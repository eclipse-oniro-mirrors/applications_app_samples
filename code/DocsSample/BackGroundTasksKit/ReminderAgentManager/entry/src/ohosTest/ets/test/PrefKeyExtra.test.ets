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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { preferences } from '@kit.ArkData';
import { installCaseIsolation } from './TestRuntime';

const PREF_NAME: string = 'ReminderAgentManager';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const appContext = delegator.getAppContext();

export default function prefKeyExtraTest(): void {
  describe('ReminderPrefKeyExtraTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_0100
     * @tc.name      testReminderPrefKeyExtra0001
     * @tc.desc      Verify preference key pattern 1 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder.key.dot';
          pref.putSync(key, 'value1');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value1');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_0200
     * @tc.name      testReminderPrefKeyExtra0002
     * @tc.desc      Verify preference key pattern 2 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder_key_underscore';
          pref.putSync(key, 'value2');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value2');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_0300
     * @tc.name      testReminderPrefKeyExtra0003
     * @tc.desc      Verify preference key pattern 3 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder-key-dash';
          pref.putSync(key, 'value3');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value3');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_0400
     * @tc.name      testReminderPrefKeyExtra0004
     * @tc.desc      Verify preference key pattern 4 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder:key:colon';
          pref.putSync(key, 'value4');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value4');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_0500
     * @tc.name      testReminderPrefKeyExtra0005
     * @tc.desc      Verify preference key pattern 5 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder@key';
          pref.putSync(key, 'value5');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value5');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_0600
     * @tc.name      testReminderPrefKeyExtra0006
     * @tc.desc      Verify preference key pattern 6 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder#key';
          pref.putSync(key, 'value6');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value6');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_0700
     * @tc.name      testReminderPrefKeyExtra0007
     * @tc.desc      Verify preference key pattern 7 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder$key';
          pref.putSync(key, 'value7');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value7');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_0800
     * @tc.name      testReminderPrefKeyExtra0008
     * @tc.desc      Verify preference key pattern 8 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder%key';
          pref.putSync(key, 'value8');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value8');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_0900
     * @tc.name      testReminderPrefKeyExtra0009
     * @tc.desc      Verify preference key pattern 9 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder&key';
          pref.putSync(key, 'value9');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value9');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_1000
     * @tc.name      testReminderPrefKeyExtra0010
     * @tc.desc      Verify preference key pattern 10 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder+key';
          pref.putSync(key, 'value10');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value10');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_1100
     * @tc.name      testReminderPrefKeyExtra0011
     * @tc.desc      Verify preference key pattern 11 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder=key';
          pref.putSync(key, 'value11');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value11');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_1200
     * @tc.name      testReminderPrefKeyExtra0012
     * @tc.desc      Verify preference key pattern 12 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder~key';
          pref.putSync(key, 'value12');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value12');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_1300
     * @tc.name      testReminderPrefKeyExtra0013
     * @tc.desc      Verify preference key pattern 13 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder,key';
          pref.putSync(key, 'value13');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value13');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_1400
     * @tc.name      testReminderPrefKeyExtra0014
     * @tc.desc      Verify preference key pattern 14 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder;key';
          pref.putSync(key, 'value14');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value14');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_1500
     * @tc.name      testReminderPrefKeyExtra0015
     * @tc.desc      Verify preference key pattern 15 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder!key';
          pref.putSync(key, 'value15');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value15');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_1600
     * @tc.name      testReminderPrefKeyExtra0016
     * @tc.desc      Verify preference key pattern 16 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder?key';
          pref.putSync(key, 'value16');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value16');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_1700
     * @tc.name      testReminderPrefKeyExtra0017
     * @tc.desc      Verify preference key pattern 17 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder*key';
          pref.putSync(key, 'value17');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value17');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_1800
     * @tc.name      testReminderPrefKeyExtra0018
     * @tc.desc      Verify preference key pattern 18 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder(key)';
          pref.putSync(key, 'value18');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value18');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_1900
     * @tc.name      testReminderPrefKeyExtra0019
     * @tc.desc      Verify preference key pattern 19 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder[key]';
          pref.putSync(key, 'value19');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value19');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_2000
     * @tc.name      testReminderPrefKeyExtra0020
     * @tc.desc      Verify preference key pattern 20 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'reminder{key}';
          pref.putSync(key, 'value20');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('value20');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_2100
     * @tc.name      testReminderPrefKeyExtra0021
     * @tc.desc      Verify multi-key isolation scenario 1 keeps unrelated keys intact.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA1';
          const keyB: string = 'multiKeyB1';
          const keyC: string = 'multiKeyC1';
          pref.putSync(keyA, 'alpha1');
          pref.putSync(keyB, 'beta1');
          pref.putSync(keyC, 'gamma1');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha1');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta1');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha1');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma1');
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_2200
     * @tc.name      testReminderPrefKeyExtra0022
     * @tc.desc      Verify multi-key isolation scenario 2 keeps unrelated keys intact.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA2';
          const keyB: string = 'multiKeyB2';
          const keyC: string = 'multiKeyC2';
          pref.putSync(keyA, 'alpha2');
          pref.putSync(keyB, 'beta2');
          pref.putSync(keyC, 'gamma2');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha2');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta2');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha2');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma2');
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_2300
     * @tc.name      testReminderPrefKeyExtra0023
     * @tc.desc      Verify multi-key isolation scenario 3 keeps unrelated keys intact.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA3';
          const keyB: string = 'multiKeyB3';
          const keyC: string = 'multiKeyC3';
          pref.putSync(keyA, 'alpha3');
          pref.putSync(keyB, 'beta3');
          pref.putSync(keyC, 'gamma3');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha3');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta3');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha3');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma3');
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_2400
     * @tc.name      testReminderPrefKeyExtra0024
     * @tc.desc      Verify multi-key isolation scenario 4 keeps unrelated keys intact.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA4';
          const keyB: string = 'multiKeyB4';
          const keyC: string = 'multiKeyC4';
          pref.putSync(keyA, 'alpha4');
          pref.putSync(keyB, 'beta4');
          pref.putSync(keyC, 'gamma4');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha4');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta4');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha4');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma4');
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_2500
     * @tc.name      testReminderPrefKeyExtra0025
     * @tc.desc      Verify multi-key isolation scenario 5 keeps unrelated keys intact.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA5';
          const keyB: string = 'multiKeyB5';
          const keyC: string = 'multiKeyC5';
          pref.putSync(keyA, 'alpha5');
          pref.putSync(keyB, 'beta5');
          pref.putSync(keyC, 'gamma5');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha5');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta5');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha5');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma5');
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_2600
     * @tc.name      testReminderPrefKeyExtra0026
     * @tc.desc      Verify multi-key isolation scenario 6 keeps unrelated keys intact.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA6';
          const keyB: string = 'multiKeyB6';
          const keyC: string = 'multiKeyC6';
          pref.putSync(keyA, 'alpha6');
          pref.putSync(keyB, 'beta6');
          pref.putSync(keyC, 'gamma6');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha6');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta6');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha6');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma6');
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_2700
     * @tc.name      testReminderPrefKeyExtra0027
     * @tc.desc      Verify multi-key isolation scenario 7 keeps unrelated keys intact.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA7';
          const keyB: string = 'multiKeyB7';
          const keyC: string = 'multiKeyC7';
          pref.putSync(keyA, 'alpha7');
          pref.putSync(keyB, 'beta7');
          pref.putSync(keyC, 'gamma7');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha7');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta7');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha7');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma7');
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_2800
     * @tc.name      testReminderPrefKeyExtra0028
     * @tc.desc      Verify multi-key isolation scenario 8 keeps unrelated keys intact.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA8';
          const keyB: string = 'multiKeyB8';
          const keyC: string = 'multiKeyC8';
          pref.putSync(keyA, 'alpha8');
          pref.putSync(keyB, 'beta8');
          pref.putSync(keyC, 'gamma8');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha8');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta8');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha8');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma8');
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_2900
     * @tc.name      testReminderPrefKeyExtra0029
     * @tc.desc      Verify multi-key isolation scenario 9 keeps unrelated keys intact.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA9';
          const keyB: string = 'multiKeyB9';
          const keyC: string = 'multiKeyC9';
          pref.putSync(keyA, 'alpha9');
          pref.putSync(keyB, 'beta9');
          pref.putSync(keyC, 'gamma9');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha9');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta9');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha9');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma9');
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_3000
     * @tc.name      testReminderPrefKeyExtra0030
     * @tc.desc      Verify multi-key isolation scenario 10 keeps unrelated keys intact.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA10';
          const keyB: string = 'multiKeyB10';
          const keyC: string = 'multiKeyC10';
          pref.putSync(keyA, 'alpha10');
          pref.putSync(keyB, 'beta10');
          pref.putSync(keyC, 'gamma10');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha10');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta10');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha10');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma10');
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });

  });
}
