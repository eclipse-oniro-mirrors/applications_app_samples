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

export default function qualityStorage2Test(): void {
  describe('ReminderQualityStorage2Test', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_0100
     * @tc.name      testReminderQualityStorage2String0001
     * @tc.desc      Verify string preference value 1 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String1';
          pref.putSync(key, 'quality-0');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-0');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_0200
     * @tc.name      testReminderQualityStorage2String0002
     * @tc.desc      Verify string preference value 2 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String2';
          pref.putSync(key, 'quality-1');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-1');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_0300
     * @tc.name      testReminderQualityStorage2String0003
     * @tc.desc      Verify string preference value 3 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String3';
          pref.putSync(key, 'quality-2');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-2');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_0400
     * @tc.name      testReminderQualityStorage2String0004
     * @tc.desc      Verify string preference value 4 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String4';
          pref.putSync(key, 'quality-3');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-3');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_0500
     * @tc.name      testReminderQualityStorage2String0005
     * @tc.desc      Verify string preference value 5 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String5';
          pref.putSync(key, 'quality-4');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-4');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_0600
     * @tc.name      testReminderQualityStorage2String0006
     * @tc.desc      Verify string preference value 6 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String6';
          pref.putSync(key, 'quality-5');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-5');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_0700
     * @tc.name      testReminderQualityStorage2String0007
     * @tc.desc      Verify string preference value 7 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String7';
          pref.putSync(key, 'quality-6');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-6');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_0800
     * @tc.name      testReminderQualityStorage2String0008
     * @tc.desc      Verify string preference value 8 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String8';
          pref.putSync(key, 'quality-7');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-7');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_0900
     * @tc.name      testReminderQualityStorage2String0009
     * @tc.desc      Verify string preference value 9 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String9';
          pref.putSync(key, 'quality-8');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-8');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_1000
     * @tc.name      testReminderQualityStorage2String0010
     * @tc.desc      Verify string preference value 10 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String10';
          pref.putSync(key, 'quality-9');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-9');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_1100
     * @tc.name      testReminderQualityStorage2String0011
     * @tc.desc      Verify string preference value 11 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String11';
          pref.putSync(key, 'quality-10');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-10');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_1200
     * @tc.name      testReminderQualityStorage2String0012
     * @tc.desc      Verify string preference value 12 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String12';
          pref.putSync(key, 'quality-11');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-11');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_1300
     * @tc.name      testReminderQualityStorage2String0013
     * @tc.desc      Verify string preference value 13 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String13';
          pref.putSync(key, 'quality-12');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-12');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_1400
     * @tc.name      testReminderQualityStorage2String0014
     * @tc.desc      Verify string preference value 14 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String14';
          pref.putSync(key, 'quality-13');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-13');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_1500
     * @tc.name      testReminderQualityStorage2String0015
     * @tc.desc      Verify string preference value 15 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2String0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2String15';
          pref.putSync(key, 'quality-14');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('quality-14');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_1600
     * @tc.name      testReminderQualityStorage2Number0016
     * @tc.desc      Verify numeric preference value 100 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number16';
          pref.putSync(key, 100);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(100);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_1700
     * @tc.name      testReminderQualityStorage2Number0017
     * @tc.desc      Verify numeric preference value 101 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number17';
          pref.putSync(key, 101);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(101);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_1800
     * @tc.name      testReminderQualityStorage2Number0018
     * @tc.desc      Verify numeric preference value 102 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number18';
          pref.putSync(key, 102);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(102);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_1900
     * @tc.name      testReminderQualityStorage2Number0019
     * @tc.desc      Verify numeric preference value 103 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number19';
          pref.putSync(key, 103);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(103);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_2000
     * @tc.name      testReminderQualityStorage2Number0020
     * @tc.desc      Verify numeric preference value 104 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number20';
          pref.putSync(key, 104);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(104);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_2100
     * @tc.name      testReminderQualityStorage2Number0021
     * @tc.desc      Verify numeric preference value 105 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number21';
          pref.putSync(key, 105);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(105);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_2200
     * @tc.name      testReminderQualityStorage2Number0022
     * @tc.desc      Verify numeric preference value 106 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number22';
          pref.putSync(key, 106);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(106);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_2300
     * @tc.name      testReminderQualityStorage2Number0023
     * @tc.desc      Verify numeric preference value 107 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number23';
          pref.putSync(key, 107);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(107);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_2400
     * @tc.name      testReminderQualityStorage2Number0024
     * @tc.desc      Verify numeric preference value 108 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number24';
          pref.putSync(key, 108);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(108);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_2500
     * @tc.name      testReminderQualityStorage2Number0025
     * @tc.desc      Verify numeric preference value 109 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number25';
          pref.putSync(key, 109);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(109);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_2600
     * @tc.name      testReminderQualityStorage2Number0026
     * @tc.desc      Verify numeric preference value 110 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number26';
          pref.putSync(key, 110);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(110);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_2700
     * @tc.name      testReminderQualityStorage2Number0027
     * @tc.desc      Verify numeric preference value 111 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number27';
          pref.putSync(key, 111);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(111);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_2800
     * @tc.name      testReminderQualityStorage2Number0028
     * @tc.desc      Verify numeric preference value 112 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number28';
          pref.putSync(key, 112);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(112);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_2900
     * @tc.name      testReminderQualityStorage2Number0029
     * @tc.desc      Verify numeric preference value 113 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number29';
          pref.putSync(key, 113);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(113);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_3000
     * @tc.name      testReminderQualityStorage2Number0030
     * @tc.desc      Verify numeric preference value 114 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Number0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Number30';
          pref.putSync(key, 114);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(114);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_3100
     * @tc.name      testReminderQualityStorage2Bool0031
     * @tc.desc      Verify boolean preference value 0 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool31';
          pref.putSync(key, true);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_3200
     * @tc.name      testReminderQualityStorage2Bool0032
     * @tc.desc      Verify boolean preference value 1 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool32';
          pref.putSync(key, false);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertFalse();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_3300
     * @tc.name      testReminderQualityStorage2Bool0033
     * @tc.desc      Verify boolean preference value 2 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool33';
          pref.putSync(key, true);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_3400
     * @tc.name      testReminderQualityStorage2Bool0034
     * @tc.desc      Verify boolean preference value 3 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool34';
          pref.putSync(key, false);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertFalse();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_3500
     * @tc.name      testReminderQualityStorage2Bool0035
     * @tc.desc      Verify boolean preference value 4 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool35';
          pref.putSync(key, true);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_3600
     * @tc.name      testReminderQualityStorage2Bool0036
     * @tc.desc      Verify boolean preference value 5 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool36';
          pref.putSync(key, false);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertFalse();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_3700
     * @tc.name      testReminderQualityStorage2Bool0037
     * @tc.desc      Verify boolean preference value 6 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool37';
          pref.putSync(key, true);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_3800
     * @tc.name      testReminderQualityStorage2Bool0038
     * @tc.desc      Verify boolean preference value 7 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool38';
          pref.putSync(key, false);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertFalse();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_3900
     * @tc.name      testReminderQualityStorage2Bool0039
     * @tc.desc      Verify boolean preference value 8 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool39';
          pref.putSync(key, true);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_4000
     * @tc.name      testReminderQualityStorage2Bool0040
     * @tc.desc      Verify boolean preference value 9 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool40';
          pref.putSync(key, false);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertFalse();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_4100
     * @tc.name      testReminderQualityStorage2Bool0041
     * @tc.desc      Verify boolean preference value 10 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool41';
          pref.putSync(key, true);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_4200
     * @tc.name      testReminderQualityStorage2Bool0042
     * @tc.desc      Verify boolean preference value 11 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool42';
          pref.putSync(key, false);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertFalse();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_4300
     * @tc.name      testReminderQualityStorage2Bool0043
     * @tc.desc      Verify boolean preference value 12 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool43';
          pref.putSync(key, true);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_4400
     * @tc.name      testReminderQualityStorage2Bool0044
     * @tc.desc      Verify boolean preference value 13 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool44';
          pref.putSync(key, false);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertFalse();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE2_4500
     * @tc.name      testReminderQualityStorage2Bool0045
     * @tc.desc      Verify boolean preference value 14 round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorage2Bool0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'quality2Bool45';
          pref.putSync(key, true);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Boolean(pref.getSync(key, false))).assertTrue();
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });  });
}
