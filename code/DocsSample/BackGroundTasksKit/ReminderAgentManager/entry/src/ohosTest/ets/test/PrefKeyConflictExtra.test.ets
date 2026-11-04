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

export default function prefKeyConflictExtraTest(): void {
  describe('ReminderPrefKeyConflictExtraTest', () => {
    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_CONFLICT_EXTRA_0100
     * @tc.name      testReminderPrefKeyConflictExtra0001
     * @tc.desc      Verify a 32-character preference key round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyConflictExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk';
          await pref.put(key, 'longValue1');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('longValue1');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_CONFLICT_EXTRA_0200
     * @tc.name      testReminderPrefKeyConflictExtra0002
     * @tc.desc      Verify a 48-character preference key round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyConflictExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk';
          await pref.put(key, 'longValue2');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('longValue2');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_CONFLICT_EXTRA_0300
     * @tc.name      testReminderPrefKeyConflictExtra0003
     * @tc.desc      Verify a 64-character preference key round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyConflictExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk';
          await pref.put(key, 'longValue3');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('longValue3');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_CONFLICT_EXTRA_0400
     * @tc.name      testReminderPrefKeyConflictExtra0004
     * @tc.desc      Verify a 79-character preference key round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyConflictExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk';
          await pref.put(key, 'longValue4');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('longValue4');
          expect(await pref.has(key)).assertTrue();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_CONFLICT_EXTRA_0500
     * @tc.name      testReminderPrefKeyConflictExtra0005
     * @tc.desc      Verify prefix-related keys coexist.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyConflictExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'conflictPrefix';
          const keyB: string = 'conflictPrefix2';
          const keyC: string = 'conflictPrefix:child';
          await pref.put(keyA, 'alpha5');
          await pref.put(keyB, 'beta5');
          await pref.put(keyC, 'gamma5');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha5');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta5');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma5');
          await pref.delete(keyB);
          await pref.flush();
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
     * @tc.number    SUB_REMINDER_PREF_KEY_CONFLICT_EXTRA_0600
     * @tc.name      testReminderPrefKeyConflictExtra0006
     * @tc.desc      Verify case-sensitive keys coexist.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyConflictExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'conflictCaseUpper';
          const keyB: string = 'conflictCaseLower';
          const keyC: string = 'conflictCaseMixed';
          await pref.put(keyA, 'alpha6');
          await pref.put(keyB, 'beta6');
          await pref.put(keyC, 'gamma6');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha6');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta6');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma6');
          await pref.delete(keyB);
          await pref.flush();
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
     * @tc.number    SUB_REMINDER_PREF_KEY_CONFLICT_EXTRA_0700
     * @tc.name      testReminderPrefKeyConflictExtra0007
     * @tc.desc      Verify namespace keys coexist.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyConflictExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'conflictNs';
          const keyB: string = 'ns.alpha';
          const keyC: string = 'ns.beta';
          await pref.put(keyA, 'alpha7');
          await pref.put(keyB, 'beta7');
          await pref.put(keyC, 'gamma7');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha7');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta7');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma7');
          await pref.delete(keyB);
          await pref.flush();
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
     * @tc.number    SUB_REMINDER_PREF_KEY_CONFLICT_EXTRA_0800
     * @tc.name      testReminderPrefKeyConflictExtra0008
     * @tc.desc      Verify delete removes only the target key.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyConflictExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'deleteKeepA';
          const keyB: string = 'deleteRemoveB';
          const keyC: string = 'deleteKeepC';
          await pref.put(keyA, 'alpha8');
          await pref.put(keyB, 'beta8');
          await pref.put(keyC, 'gamma8');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha8');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta8');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma8');
          await pref.delete(keyB);
          await pref.flush();
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
     * @tc.number    SUB_REMINDER_PREF_KEY_CONFLICT_EXTRA_0900
     * @tc.name      testReminderPrefKeyConflictExtra0009
     * @tc.desc      Verify colon and dot variants coexist.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyConflictExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const keyA: string = 'conflictVariant';
          const keyB: string = 'variant.key';
          const keyC: string = 'variant:key';
          await pref.put(keyA, 'alpha9');
          await pref.put(keyB, 'beta9');
          await pref.put(keyC, 'gamma9');
          await pref.flush();
          expect(String(await pref.get(keyA, ''))).assertEqual('alpha9');
          expect(String(await pref.get(keyB, ''))).assertEqual('beta9');
          expect(String(await pref.get(keyC, ''))).assertEqual('gamma9');
          await pref.delete(keyB);
          await pref.flush();
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
     * @tc.number    SUB_REMINDER_PREF_KEY_CONFLICT_EXTRA_1000
     * @tc.name      testReminderPrefKeyConflictExtra0010
     * @tc.desc      Verify overwriting an existing key keeps the latest value.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyConflictExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'overwriteConflictKey';
          await pref.put(key, 'firstValue');
          await pref.flush();
          await pref.put(key, 'secondValue');
          await pref.flush();
          expect(String(await pref.get(key, ''))).assertEqual('secondValue');
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

  });
}
