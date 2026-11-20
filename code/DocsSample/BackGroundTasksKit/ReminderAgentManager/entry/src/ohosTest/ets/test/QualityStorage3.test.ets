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
import { abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';
import { preferences } from '@kit.ArkData';
import { installCaseIsolation } from './TestRuntime';

const PREF_NAME: string = 'ReminderAgentManager';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const appContext = delegator.getAppContext();

export default function qualityStorage3Test(): void {
  describe('ReminderQualityStorage3Test', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_0100
     * @tc.name      testReminderQualityStorage30001
     * @tc.desc      Verify edge string preference value 1 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key1';
          pref.putSync(key, '');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_0200
     * @tc.name      testReminderQualityStorage30002
     * @tc.desc      Verify edge string preference value 2 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key2';
          pref.putSync(key, '0');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('0');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_0300
     * @tc.name      testReminderQualityStorage30003
     * @tc.desc      Verify edge string preference value 3 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key3';
          pref.putSync(key, 'false');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('false');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_0400
     * @tc.name      testReminderQualityStorage30004
     * @tc.desc      Verify edge string preference value 4 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key4';
          pref.putSync(key, 'null');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('null');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_0500
     * @tc.name      testReminderQualityStorage30005
     * @tc.desc      Verify edge string preference value 5 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key5';
          pref.putSync(key, 'undefined');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('undefined');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_0600
     * @tc.name      testReminderQualityStorage30006
     * @tc.desc      Verify edge string preference value 6 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key6';
          pref.putSync(key, '   ');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('   ');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_0700
     * @tc.name      testReminderQualityStorage30007
     * @tc.desc      Verify edge string preference value 7 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key7';
          pref.putSync(key, '中文测试');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('中文测试');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_0800
     * @tc.name      testReminderQualityStorage30008
     * @tc.desc      Verify edge string preference value 8 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key8';
          pref.putSync(key, 'emoji⏰');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('emoji⏰');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_0900
     * @tc.name      testReminderQualityStorage30009
     * @tc.desc      Verify edge string preference value 9 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key9';
          const longValue: string =
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
          pref.putSync(key, longValue);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual(longValue);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_1000
     * @tc.name      testReminderQualityStorage30010
     * @tc.desc      Verify edge string preference value 10 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key10';
          pref.putSync(key, 'special\\nline');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('special\\nline');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_1100
     * @tc.name      testReminderQualityStorage30011
     * @tc.desc      Verify edge string preference value 11 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key11';
          pref.putSync(key, 'alpha');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('alpha');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_1200
     * @tc.name      testReminderQualityStorage30012
     * @tc.desc      Verify edge string preference value 12 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key12';
          pref.putSync(key, 'beta');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('beta');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_1300
     * @tc.name      testReminderQualityStorage30013
     * @tc.desc      Verify edge string preference value 13 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key13';
          pref.putSync(key, 'gamma');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('gamma');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_1400
     * @tc.name      testReminderQualityStorage30014
     * @tc.desc      Verify edge string preference value 14 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key14';
          pref.putSync(key, 'delta');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('delta');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_1500
     * @tc.name      testReminderQualityStorage30015
     * @tc.desc      Verify edge string preference value 15 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key15';
          pref.putSync(key, 'epsilon');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('epsilon');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_1600
     * @tc.name      testReminderQualityStorage30016
     * @tc.desc      Verify edge string preference value 16 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key16';
          pref.putSync(key, 'zeta');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('zeta');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_1700
     * @tc.name      testReminderQualityStorage30017
     * @tc.desc      Verify edge string preference value 17 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key17';
          pref.putSync(key, 'eta');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('eta');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_1800
     * @tc.name      testReminderQualityStorage30018
     * @tc.desc      Verify edge string preference value 18 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key18';
          pref.putSync(key, 'theta');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('theta');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_1900
     * @tc.name      testReminderQualityStorage30019
     * @tc.desc      Verify edge string preference value 19 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key19';
          pref.putSync(key, 'iota');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('iota');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_2000
     * @tc.name      testReminderQualityStorage30020
     * @tc.desc      Verify edge string preference value 20 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key20';
          pref.putSync(key, 'kappa');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('kappa');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_2100
     * @tc.name      testReminderQualityStorage30021
     * @tc.desc      Verify edge string preference value 21 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key21';
          pref.putSync(key, '中文值');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('中文值');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_2200
     * @tc.name      testReminderQualityStorage30022
     * @tc.desc      Verify edge string preference value 22 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key22';
          pref.putSync(key, '日本語');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('日本語');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_2300
     * @tc.name      testReminderQualityStorage30023
     * @tc.desc      Verify edge string preference value 23 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key23';
          pref.putSync(key, '한국어');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('한국어');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_2400
     * @tc.name      testReminderQualityStorage30024
     * @tc.desc      Verify edge string preference value 24 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key24';
          pref.putSync(key, 'emoji⏰⏳');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('emoji⏰⏳');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_2500
     * @tc.name      testReminderQualityStorage30025
     * @tc.desc      Verify edge string preference value 25 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key25';
          pref.putSync(key, '<tag>');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('<tag>');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_2600
     * @tc.name      testReminderQualityStorage30026
     * @tc.desc      Verify edge string preference value 26 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key26';
          pref.putSync(key, 'quote"');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quote"');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_2700
     * @tc.name      testReminderQualityStorage30027
     * @tc.desc      Verify edge string preference value 27 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key27';
          pref.putSync(key, "single'");
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual("single'");
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_2800
     * @tc.name      testReminderQualityStorage30028
     * @tc.desc      Verify edge string preference value 28 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key28';
          pref.putSync(key, 'path/to/file');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('path/to/file');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_2900
     * @tc.name      testReminderQualityStorage30029
     * @tc.desc      Verify edge string preference value 29 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key29';
          pref.putSync(key, 'key=value');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('key=value');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE3_3000
     * @tc.name      testReminderQualityStorage30030
     * @tc.desc      Verify edge string preference value 30 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage30030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality3Key30';
          pref.putSync(key, 'trailing ');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('trailing ');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });  });
}
