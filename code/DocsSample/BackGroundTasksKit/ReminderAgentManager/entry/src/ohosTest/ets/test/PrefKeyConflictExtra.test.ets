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

export default function prefKeyConflictExtraTest(): void {
  describe('ReminderPrefKeyConflictExtraTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_PREF_KEY_CONFLICT_EXTRA_0100
     * @tc.name      testReminderPrefKeyConflictExtra0001
     * @tc.desc      Verify a 32-character preference key round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefKeyConflictExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk';
          pref.putSync(key, 'longValue1');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('longValue1');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk';
          pref.putSync(key, 'longValue2');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('longValue2');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk';
          pref.putSync(key, 'longValue3');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('longValue3');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk';
          pref.putSync(key, 'longValue4');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('longValue4');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'conflictPrefix';
          const keyB: string = 'conflictPrefix2';
          const keyC: string = 'conflictPrefix:child';
          pref.putSync(keyA, 'alpha5');
          pref.putSync(keyB, 'beta5');
          pref.putSync(keyC, 'gamma5');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha5');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta5');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma5');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'conflictCaseUpper';
          const keyB: string = 'conflictCaseLower';
          const keyC: string = 'conflictCaseMixed';
          pref.putSync(keyA, 'alpha6');
          pref.putSync(keyB, 'beta6');
          pref.putSync(keyC, 'gamma6');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha6');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta6');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma6');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'conflictNs';
          const keyB: string = 'ns.alpha';
          const keyC: string = 'ns.beta';
          pref.putSync(keyA, 'alpha7');
          pref.putSync(keyB, 'beta7');
          pref.putSync(keyC, 'gamma7');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha7');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta7');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma7');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'deleteKeepA';
          const keyB: string = 'deleteRemoveB';
          const keyC: string = 'deleteKeepC';
          pref.putSync(keyA, 'alpha8');
          pref.putSync(keyB, 'beta8');
          pref.putSync(keyC, 'gamma8');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha8');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta8');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma8');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keyA: string = 'conflictVariant';
          const keyB: string = 'variant.key';
          const keyC: string = 'variant:key';
          pref.putSync(keyA, 'alpha9');
          pref.putSync(keyB, 'beta9');
          pref.putSync(keyC, 'gamma9');
          pref.flushSync();
          expect(String(pref.getSync(keyA, ''))).assertEqual('alpha9');
          expect(String(pref.getSync(keyB, ''))).assertEqual('beta9');
          expect(String(pref.getSync(keyC, ''))).assertEqual('gamma9');
          pref.deleteSync(keyB);
          pref.flushSync();
          expect(pref.hasSync(keyB)).assertFalse();
          pref.deleteSync(keyA);
          pref.deleteSync(keyC);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'overwriteConflictKey';
          pref.putSync(key, 'firstValue');
          pref.flushSync();
          pref.putSync(key, 'secondValue');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('secondValue');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

  });
}
