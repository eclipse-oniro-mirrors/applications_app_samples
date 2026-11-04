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

export default function qualityStorageTest(): void {
  describe('ReminderQualityStorageTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_0100
     * @tc.name      testReminderQualityStorageString0001
     * @tc.desc      Verify a string preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageString0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityString1';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_0200
     * @tc.name      testReminderQualityStorageString0002
     * @tc.desc      Verify a string preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageString0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityString2';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_0300
     * @tc.name      testReminderQualityStorageString0003
     * @tc.desc      Verify a string preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageString0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityString3';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_0400
     * @tc.name      testReminderQualityStorageString0004
     * @tc.desc      Verify a string preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageString0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityString4';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_0500
     * @tc.name      testReminderQualityStorageString0005
     * @tc.desc      Verify a string preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageString0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityString5';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_0600
     * @tc.name      testReminderQualityStorageString0006
     * @tc.desc      Verify a string preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageString0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityString6';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_0700
     * @tc.name      testReminderQualityStorageString0007
     * @tc.desc      Verify a string preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageString0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityString7';
          pref.putSync(key, 'special <>&"');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('special <>&"');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_0800
     * @tc.name      testReminderQualityStorageString0008
     * @tc.desc      Verify a string preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageString0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityString8';
          const longValue: string =
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaa';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_0900
     * @tc.name      testReminderQualityStorageNumber0009
     * @tc.desc      Verify a numeric preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageNumber0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityNumber9';
          pref.putSync(key, 0);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(0);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_1000
     * @tc.name      testReminderQualityStorageNumber0010
     * @tc.desc      Verify a numeric preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageNumber0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityNumber10';
          pref.putSync(key, 1);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(1);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_1100
     * @tc.name      testReminderQualityStorageNumber0011
     * @tc.desc      Verify a numeric preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageNumber0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityNumber11';
          pref.putSync(key, -1);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(-1);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_1200
     * @tc.name      testReminderQualityStorageNumber0012
     * @tc.desc      Verify a numeric preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageNumber0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityNumber12';
          pref.putSync(key, 42);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(42);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_1300
     * @tc.name      testReminderQualityStorageNumber0013
     * @tc.desc      Verify a numeric preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageNumber0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityNumber13';
          pref.putSync(key, 99);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(99);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_1400
     * @tc.name      testReminderQualityStorageNumber0014
     * @tc.desc      Verify a numeric preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageNumber0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityNumber14';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_1500
     * @tc.name      testReminderQualityStorageNumber0015
     * @tc.desc      Verify a numeric preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageNumber0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityNumber15';
          pref.putSync(key, 2026);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(2026);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_1600
     * @tc.name      testReminderQualityStorageNumber0016
     * @tc.desc      Verify a numeric preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageNumber0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityNumber16';
          pref.putSync(key, 9999);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(9999);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_1700
     * @tc.name      testReminderQualityStorageNumber0017
     * @tc.desc      Verify a numeric preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageNumber0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityNumber17';
          pref.putSync(key, 3.14);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(3.14);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_1800
     * @tc.name      testReminderQualityStorageNumber0018
     * @tc.desc      Verify a numeric preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageNumber0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityNumber18';
          pref.putSync(key, -2.5);
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(Number(pref.getSync(key, 0))).assertEqual(-2.5);
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_1900
     * @tc.name      testReminderQualityStorageBool0019
     * @tc.desc      Verify a boolean preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageBool0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityBool19';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_2000
     * @tc.name      testReminderQualityStorageBool0020
     * @tc.desc      Verify a boolean preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageBool0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityBool20';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_2100
     * @tc.name      testReminderQualityStorageBool0021
     * @tc.desc      Verify a boolean preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageBool0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityBool21';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_2200
     * @tc.name      testReminderQualityStorageBool0022
     * @tc.desc      Verify a boolean preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageBool0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityBool22';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_2300
     * @tc.name      testReminderQualityStorageBool0023
     * @tc.desc      Verify a boolean preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageBool0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityBool23';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_2400
     * @tc.name      testReminderQualityStorageBool0024
     * @tc.desc      Verify a boolean preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageBool0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityBool24';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_2500
     * @tc.name      testReminderQualityStorageBool0025
     * @tc.desc      Verify a boolean preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageBool0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityBool25';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_2600
     * @tc.name      testReminderQualityStorageBool0026
     * @tc.desc      Verify a boolean preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageBool0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityBool26';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_2700
     * @tc.name      testReminderQualityStorageBool0027
     * @tc.desc      Verify a boolean preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageBool0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityBool27';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_2800
     * @tc.name      testReminderQualityStorageBool0028
     * @tc.desc      Verify a boolean preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageBool0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityBool28';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_2900
     * @tc.name      testReminderQualityStorageBool0029
     * @tc.desc      Verify a boolean preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageBool0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityBool29';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_3000
     * @tc.name      testReminderQualityStorageBool0030
     * @tc.desc      Verify a boolean preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageBool0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityBool30';
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
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_3100
     * @tc.name      testReminderQualityStorageOverwrite0031
     * @tc.desc      Verify overwrite preference behavior.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageOverwrite0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityOverwrite31';
          pref.putSync(key, 'first');
          pref.putSync(key, 'second');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('second');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_3200
     * @tc.name      testReminderQualityStorageOverwrite0032
     * @tc.desc      Verify overwrite preference behavior.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageOverwrite0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          const key: string = 'qualityOverwrite32';
          pref.putSync(key, 'first');
          pref.putSync(key, 'second');
          pref.flushSync();
          expect(pref.hasSync(key)).assertTrue();
          expect(String(pref.getSync(key, ''))).assertEqual('second');
          pref.deleteSync(key);
          pref.flushSync();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_3300
     * @tc.name      testReminderQualityStorageMissing0033
     * @tc.desc      Verify missing preference behavior.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageMissing0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          expect(pref.hasSync('qualityMissing33')).assertFalse();
          expect(String(pref.getSync('qualityMissing33', 'fallback'))).assertEqual('fallback');
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_3400
     * @tc.name      testReminderQualityStorageMissing0034
     * @tc.desc      Verify missing preference behavior.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageMissing0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          expect(pref.hasSync('qualityMissing34')).assertFalse();
          expect(String(pref.getSync('qualityMissing34', 'fallback'))).assertEqual('fallback');
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_3500
     * @tc.name      testReminderQualityStorageDelete0035
     * @tc.desc      Verify delete preference behavior.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageDelete0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          pref.deleteSync('qualityDelete35');
          pref.flushSync();
          expect(pref.hasSync('qualityDelete35')).assertFalse();
          expect(String(pref.getSync('qualityDelete35', 'fallback'))).assertEqual('fallback');
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_3600
     * @tc.name      testReminderQualityStorageDelete0036
     * @tc.desc      Verify delete preference behavior.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageDelete0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = preferences.getPreferencesSync(context, { name: PREF_NAME });
          pref.deleteSync('qualityDelete36');
          pref.flushSync();
          expect(pref.hasSync('qualityDelete36')).assertFalse();
          expect(String(pref.getSync('qualityDelete36', 'fallback'))).assertEqual('fallback');
        } catch (err) {
          expect().assertFail();
        }
      });  });
}
