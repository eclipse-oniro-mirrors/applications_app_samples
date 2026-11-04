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

export default function qualityStorageTest(): void {
  describe('ReminderQualityStorageTest', () => {
    /**
     * @tc.number    SUB_REMINDER_QUALITY_STORAGE_0100
     * @tc.name      testReminderQualityStorageString0001
     * @tc.desc      Verify a string preference value round-trips.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderQualityStorageString0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityString1';
          await pref.put(key, 'alpha');
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(String(await pref.get(key, ''))).assertEqual('alpha');
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityString2';
          await pref.put(key, 'beta');
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(String(await pref.get(key, ''))).assertEqual('beta');
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityString3';
          await pref.put(key, 'gamma');
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(String(await pref.get(key, ''))).assertEqual('gamma');
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityString4';
          await pref.put(key, 'delta');
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(String(await pref.get(key, ''))).assertEqual('delta');
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityString5';
          await pref.put(key, '中文值');
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(String(await pref.get(key, ''))).assertEqual('中文值');
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityString6';
          await pref.put(key, 'emoji⏰');
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(String(await pref.get(key, ''))).assertEqual('emoji⏰');
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityString7';
          await pref.put(key, 'special <>&"');
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(String(await pref.get(key, ''))).assertEqual('special <>&"');
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityString8';
          const longValue: string =
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaaaaaaaa';
          await pref.put(key, longValue);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(String(await pref.get(key, ''))).assertEqual(longValue);
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityNumber9';
          await pref.put(key, 0);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Number(await pref.get(key, 0))).assertEqual(0);
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityNumber10';
          await pref.put(key, 1);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Number(await pref.get(key, 0))).assertEqual(1);
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityNumber11';
          await pref.put(key, -1);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Number(await pref.get(key, 0))).assertEqual(-1);
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityNumber12';
          await pref.put(key, 42);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Number(await pref.get(key, 0))).assertEqual(42);
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityNumber13';
          await pref.put(key, 99);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Number(await pref.get(key, 0))).assertEqual(99);
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityNumber14';
          await pref.put(key, 100);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Number(await pref.get(key, 0))).assertEqual(100);
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityNumber15';
          await pref.put(key, 2026);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Number(await pref.get(key, 0))).assertEqual(2026);
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityNumber16';
          await pref.put(key, 9999);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Number(await pref.get(key, 0))).assertEqual(9999);
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityNumber17';
          await pref.put(key, 3.14);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Number(await pref.get(key, 0))).assertEqual(3.14);
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityNumber18';
          await pref.put(key, -2.5);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Number(await pref.get(key, 0))).assertEqual(-2.5);
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityBool19';
          await pref.put(key, true);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Boolean(await pref.get(key, false))).assertTrue();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityBool20';
          await pref.put(key, true);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Boolean(await pref.get(key, false))).assertTrue();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityBool21';
          await pref.put(key, true);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Boolean(await pref.get(key, false))).assertTrue();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityBool22';
          await pref.put(key, true);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Boolean(await pref.get(key, false))).assertTrue();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityBool23';
          await pref.put(key, true);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Boolean(await pref.get(key, false))).assertTrue();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityBool24';
          await pref.put(key, true);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Boolean(await pref.get(key, false))).assertTrue();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityBool25';
          await pref.put(key, false);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Boolean(await pref.get(key, false))).assertFalse();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityBool26';
          await pref.put(key, false);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Boolean(await pref.get(key, false))).assertFalse();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityBool27';
          await pref.put(key, false);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Boolean(await pref.get(key, false))).assertFalse();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityBool28';
          await pref.put(key, false);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Boolean(await pref.get(key, false))).assertFalse();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityBool29';
          await pref.put(key, false);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Boolean(await pref.get(key, false))).assertFalse();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityBool30';
          await pref.put(key, false);
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(Boolean(await pref.get(key, false))).assertFalse();
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityOverwrite31';
          await pref.put(key, 'first');
          await pref.put(key, 'second');
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(String(await pref.get(key, ''))).assertEqual('second');
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          const key: string = 'qualityOverwrite32';
          await pref.put(key, 'first');
          await pref.put(key, 'second');
          await pref.flush();
          expect(await pref.has(key)).assertTrue();
          expect(String(await pref.get(key, ''))).assertEqual('second');
          await pref.delete(key);
          await pref.flush();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          expect(await pref.has('qualityMissing33')).assertFalse();
          expect(String(await pref.get('qualityMissing33', 'fallback'))).assertEqual('fallback');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          expect(await pref.has('qualityMissing34')).assertFalse();
          expect(String(await pref.get('qualityMissing34', 'fallback'))).assertEqual('fallback');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          await pref.delete('qualityDelete35');
          await pref.flush();
          expect(await pref.has('qualityDelete35')).assertFalse();
          expect(String(await pref.get('qualityDelete35', 'fallback'))).assertEqual('fallback');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const context = appContext.createModuleContext('entry');
          const pref = await preferences.getPreferences(context, { name: PREF_NAME });
          await pref.delete('qualityDelete36');
          await pref.flush();
          expect(await pref.has('qualityDelete36')).assertFalse();
          expect(String(await pref.get('qualityDelete36', 'fallback'))).assertEqual('fallback');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });  });
}
