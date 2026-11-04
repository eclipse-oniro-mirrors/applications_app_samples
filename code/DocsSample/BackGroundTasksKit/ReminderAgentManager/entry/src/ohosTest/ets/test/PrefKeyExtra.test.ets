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

const PREF_NAME: string = 'ReminderAgentManager';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const appContext = delegator.getAppContext();

export default function prefKeyExtraTest(): void {
  describe('ReminderPrefKeyExtraTest', () => {
    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_EXTRA_0100
     * @tc.name      testReminderPrefKeyExtra0001
     * @tc.desc      Verify preference key pattern 1 supports put, has and delete.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder.key.dot';
          await pref.put(key, 'value1');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value1');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder_key_underscore';
          await pref.put(key, 'value2');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value2');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder-key-dash';
          await pref.put(key, 'value3');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value3');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder:key:colon';
          await pref.put(key, 'value4');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value4');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder@key';
          await pref.put(key, 'value5');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value5');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder#key';
          await pref.put(key, 'value6');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value6');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder$key';
          await pref.put(key, 'value7');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value7');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder%key';
          await pref.put(key, 'value8');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value8');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder&key';
          await pref.put(key, 'value9');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value9');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder+key';
          await pref.put(key, 'value10');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value10');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder=key';
          await pref.put(key, 'value11');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value11');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder~key';
          await pref.put(key, 'value12');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value12');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder,key';
          await pref.put(key, 'value13');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value13');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder;key';
          await pref.put(key, 'value14');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value14');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder!key';
          await pref.put(key, 'value15');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value15');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder?key';
          await pref.put(key, 'value16');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value16');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder*key';
          await pref.put(key, 'value17');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value17');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder(key)';
          await pref.put(key, 'value18');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value18');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder[key]';
          await pref.put(key, 'value19');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value19');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'reminder{key}';
          await pref.put(key, 'value20');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('value20');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
          expect(await pref.has(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA1';
          const keyB: string = 'multiKeyB1';
          const keyC: string = 'multiKeyC1';
          await pref.put(keyA, 'alpha1');
          await pref.put(keyB, 'beta1');
          await pref.put(keyC, 'gamma1');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha1');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta1');
          await pref.delete(keyB);
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha1');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma1');
          expect(await pref.has(keyB)).assertFalse();
          await pref.delete(keyA);
          await pref.delete(keyC);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA2';
          const keyB: string = 'multiKeyB2';
          const keyC: string = 'multiKeyC2';
          await pref.put(keyA, 'alpha2');
          await pref.put(keyB, 'beta2');
          await pref.put(keyC, 'gamma2');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha2');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta2');
          await pref.delete(keyB);
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha2');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma2');
          expect(await pref.has(keyB)).assertFalse();
          await pref.delete(keyA);
          await pref.delete(keyC);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA3';
          const keyB: string = 'multiKeyB3';
          const keyC: string = 'multiKeyC3';
          await pref.put(keyA, 'alpha3');
          await pref.put(keyB, 'beta3');
          await pref.put(keyC, 'gamma3');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha3');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta3');
          await pref.delete(keyB);
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha3');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma3');
          expect(await pref.has(keyB)).assertFalse();
          await pref.delete(keyA);
          await pref.delete(keyC);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA4';
          const keyB: string = 'multiKeyB4';
          const keyC: string = 'multiKeyC4';
          await pref.put(keyA, 'alpha4');
          await pref.put(keyB, 'beta4');
          await pref.put(keyC, 'gamma4');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha4');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta4');
          await pref.delete(keyB);
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha4');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma4');
          expect(await pref.has(keyB)).assertFalse();
          await pref.delete(keyA);
          await pref.delete(keyC);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA5';
          const keyB: string = 'multiKeyB5';
          const keyC: string = 'multiKeyC5';
          await pref.put(keyA, 'alpha5');
          await pref.put(keyB, 'beta5');
          await pref.put(keyC, 'gamma5');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha5');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta5');
          await pref.delete(keyB);
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha5');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma5');
          expect(await pref.has(keyB)).assertFalse();
          await pref.delete(keyA);
          await pref.delete(keyC);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA6';
          const keyB: string = 'multiKeyB6';
          const keyC: string = 'multiKeyC6';
          await pref.put(keyA, 'alpha6');
          await pref.put(keyB, 'beta6');
          await pref.put(keyC, 'gamma6');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha6');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta6');
          await pref.delete(keyB);
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha6');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma6');
          expect(await pref.has(keyB)).assertFalse();
          await pref.delete(keyA);
          await pref.delete(keyC);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA7';
          const keyB: string = 'multiKeyB7';
          const keyC: string = 'multiKeyC7';
          await pref.put(keyA, 'alpha7');
          await pref.put(keyB, 'beta7');
          await pref.put(keyC, 'gamma7');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha7');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta7');
          await pref.delete(keyB);
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha7');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma7');
          expect(await pref.has(keyB)).assertFalse();
          await pref.delete(keyA);
          await pref.delete(keyC);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA8';
          const keyB: string = 'multiKeyB8';
          const keyC: string = 'multiKeyC8';
          await pref.put(keyA, 'alpha8');
          await pref.put(keyB, 'beta8');
          await pref.put(keyC, 'gamma8');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha8');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta8');
          await pref.delete(keyB);
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha8');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma8');
          expect(await pref.has(keyB)).assertFalse();
          await pref.delete(keyA);
          await pref.delete(keyC);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA9';
          const keyB: string = 'multiKeyB9';
          const keyC: string = 'multiKeyC9';
          await pref.put(keyA, 'alpha9');
          await pref.put(keyB, 'beta9');
          await pref.put(keyC, 'gamma9');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha9');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta9');
          await pref.delete(keyB);
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha9');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma9');
          expect(await pref.has(keyB)).assertFalse();
          await pref.delete(keyA);
          await pref.delete(keyC);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'multiKeyA10';
          const keyB: string = 'multiKeyB10';
          const keyC: string = 'multiKeyC10';
          await pref.put(keyA, 'alpha10');
          await pref.put(keyB, 'beta10');
          await pref.put(keyC, 'gamma10');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha10');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta10');
          await pref.delete(keyB);
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha10');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma10');
          expect(await pref.has(keyB)).assertFalse();
          await pref.delete(keyA);
          await pref.delete(keyC);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
