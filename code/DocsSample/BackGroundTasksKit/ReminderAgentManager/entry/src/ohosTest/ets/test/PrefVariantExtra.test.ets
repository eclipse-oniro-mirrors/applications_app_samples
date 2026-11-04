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

export default function prefVariantExtraTest(): void {
  describe('ReminderPrefVariantExtraTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_PREF_VARIANT_EXTRA_0100
     * @tc.name      testReminderPrefVariantExtra0001
     * @tc.desc      Verify An eighty character key round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefVariantExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk';
          pref.putSync(key, 'prefVariant1');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('prefVariant1');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_VARIANT_EXTRA_0200
     * @tc.name      testReminderPrefVariantExtra0002
     * @tc.desc      Verify A Chinese key round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefVariantExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = '提醒键';
          pref.putSync(key, 'prefVariant2');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('prefVariant2');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_VARIANT_EXTRA_0300
     * @tc.name      testReminderPrefVariantExtra0003
     * @tc.desc      Verify A key containing a slash round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefVariantExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'variant/slash/key';
          pref.putSync(key, 'prefVariant3');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('prefVariant3');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_VARIANT_EXTRA_0400
     * @tc.name      testReminderPrefVariantExtra0004
     * @tc.desc      Verify A key containing a backslash round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefVariantExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'variant\\backslash\\key';
          pref.putSync(key, 'prefVariant4');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('prefVariant4');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_VARIANT_EXTRA_0500
     * @tc.name      testReminderPrefVariantExtra0005
     * @tc.desc      Verify A key containing a pipe round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefVariantExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'variant|pipe|key';
          pref.putSync(key, 'prefVariant5');
          pref.flushSync();
          expect(String(pref.getSync(key, ''))).assertEqual('prefVariant5');
          expect(pref.hasSync(key)).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
          expect(pref.hasSync(key)).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_PREF_VARIANT_EXTRA_0600
     * @tc.name      testReminderPrefVariantExtra0006
     * @tc.desc      Verify ten distinct keys remain isolated in one preferences file.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderPrefVariantExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const keys: Array<string> = ['bulkKey0', 'bulkKey1', 'bulkKey2', 'bulkKey3', 'bulkKey4',
            'bulkKey5', 'bulkKey6', 'bulkKey7', 'bulkKey8', 'bulkKey9'];
          for (let index: number = 0; index < keys.length; index++) {
            pref.putSync(keys[index], 'bulkValue' + index);
          }
          pref.flushSync();
          expect(String(pref.getSync(keys[0], ''))).assertEqual('bulkValue0');
          expect(String(pref.getSync(keys[4], ''))).assertEqual('bulkValue4');
          expect(String(pref.getSync(keys[9], ''))).assertEqual('bulkValue9');
          for (let index: number = 0; index < keys.length; index++) {
            pref.deleteSync(keys[index]);
          }
          pref.flushSync();
          expect(pref.hasSync(keys[0])).assertFalse();
        } catch (err) {
          expect().assertFail();
        }
      });

  });
}
