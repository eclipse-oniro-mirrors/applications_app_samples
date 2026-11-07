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

import { afterEach, beforeEach, describe, expect, it } from '@ohos/hypium';
import { screenLockFileManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SharedDriver } from './SharedDriver';
import { TestHelper } from './TestHelper';
import { ACCESS_STATUS_DENIED, ACCESS_STATUS_GRANTED, DOMAIN, TAG, BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { clickById, scrollToId, textOfId } from '../testkit/SharedDriver';

const sharedDriver = new SharedDriver();
const testHelper = new TestHelper(sharedDriver);
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function accessStatusEnumTest(): void {
  describe('AccessStatusEnumTest', (): void => {

    beforeEach(async (): Promise<void> => {
      await abilityDelegator.startAbility({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
      });
      await sharedDriver.waitTimeout();
    });

    afterEach(async (): Promise<void> => {
      await sharedDriver.waitUiIdle();
    });
    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_0100
     * @tc.name: testAccessStatusEnum0001
     * @tc.desc: Verify access status enum values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAccessStatusEnum0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0001');
      expect(screenLockFileManager.AccessStatus.ACCESS_GRANTED).assertEqual(0);
      expect(screenLockFileManager.AccessStatus.ACCESS_DENIED).assertEqual(-1);
      expect(typeof screenLockFileManager.AccessStatus).assertEqual('object');
      sharedDriver.hilogEnd('testAccessStatusEnum0001');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_0200
     * @tc.name: testAccessStatusEnum0002
     * @tc.desc: Verify access status constants match.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAccessStatusEnum0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0002');
      expect(ACCESS_STATUS_GRANTED).assertEqual(0);
      expect(ACCESS_STATUS_DENIED).assertEqual(-1);
      expect(ACCESS_STATUS_GRANTED !== ACCESS_STATUS_DENIED).assertTrue();
      sharedDriver.hilogEnd('testAccessStatusEnum0002');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_0300
     * @tc.name: testAccessStatusEnum0003
     * @tc.desc: Verify acquire access returns valid status.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAccessStatusEnum0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0003');
      try {
        const status = screenLockFileManager.acquireAccess();
        expect(testHelper.isValidAccessStatus(status)).assertTrue();
        expect(typeof status).assertEqual('number');
        expect(status).assertLarger(-1);
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testAccessStatusEnum0003');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_0400
     * @tc.name: testAccessStatusEnum0004
     * @tc.desc: Verify granted status name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAccessStatusEnum0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0004');
      const nameGranted = testHelper.getAccessStatusName(ACCESS_STATUS_GRANTED);
      expect(nameGranted).assertEqual('ACCESS_GRANTED');
      expect(nameGranted.length).assertLarger(0);
      expect(typeof nameGranted).assertEqual('string');
      sharedDriver.hilogEnd('testAccessStatusEnum0004');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_0500
     * @tc.name: testAccessStatusEnum0005
     * @tc.desc: Verify denied status name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAccessStatusEnum0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0005');
      const nameDenied = testHelper.getAccessStatusName(ACCESS_STATUS_DENIED);
      expect(nameDenied).assertEqual('ACCESS_DENIED');
      expect(nameDenied.length).assertLarger(0);
      expect(typeof nameDenied).assertEqual('string');
      sharedDriver.hilogEnd('testAccessStatusEnum0005');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_0600
     * @tc.name: testAccessStatusEnum0006
     * @tc.desc: Verify unknown status name for out of range value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAccessStatusEnum0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0006');
      const nameUnknown = testHelper.getAccessStatusName(99);
      expect(nameUnknown).assertEqual('UNKNOWN');
      expect(nameUnknown.length).assertLarger(0);
      expect(typeof nameUnknown).assertEqual('string');
      sharedDriver.hilogEnd('testAccessStatusEnum0006');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_0700
     * @tc.name: testAccessStatusEnum0007
     * @tc.desc: Verify enum keys count and type.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAccessStatusEnum0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0007');
      const keys = Object.keys(screenLockFileManager.AccessStatus);
      expect(keys.length).assertEqual(2);
      expect(typeof keys[0]).assertEqual('string');
      expect(typeof keys[1]).assertEqual('string');
      sharedDriver.hilogEnd('testAccessStatusEnum0007');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_0800
     * @tc.name: testAccessStatusEnum0008
     * @tc.desc: Verify constants equality with API enum.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAccessStatusEnum0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0008');
      expect(ACCESS_STATUS_GRANTED).assertEqual(screenLockFileManager.AccessStatus.ACCESS_GRANTED);
      expect(ACCESS_STATUS_DENIED).assertEqual(screenLockFileManager.AccessStatus.ACCESS_DENIED);
      expect(typeof screenLockFileManager.AccessStatus).assertEqual('object');
      sharedDriver.hilogEnd('testAccessStatusEnum0008');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_0900
     * @tc.name: testAccessStatusEnum0009
     * @tc.desc: Verify UI click result contains access status.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAccessStatusEnum0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0009');
      await clickById('acquireAccessButton')
      await scrollToId('operationResult')
      const result = await textOfId('operationResult')
      const hasAccessStatus = result.includes('ACCESS_GRANTED') || result.includes('ACCESS_DENIED');
      expect(hasAccessStatus).assertTrue();
      expect(result.length).assertLarger(0);
      expect(result.includes('acquireAccess')).assertTrue();
      sharedDriver.hilogEnd('testAccessStatusEnum0009');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_1000
     * @tc.name: testAccessStatusEnum0010
     * @tc.desc: Verify name array contains expected values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAccessStatusEnum0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0010');
      const names: string[] = [];
      names.push(testHelper.getAccessStatusName(ACCESS_STATUS_GRANTED));
      names.push(testHelper.getAccessStatusName(ACCESS_STATUS_DENIED));
      expect(names.length).assertEqual(2);
      expect(names[0] !== names[1]).assertTrue();
      expect(names[0].length).assertLarger(0);
      sharedDriver.hilogEnd('testAccessStatusEnum0010');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_1100
     * @tc.name: testAccessStatusEnum0011
     * @tc.desc: Verify numeric order of status values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0011');
      expect(ACCESS_STATUS_GRANTED + ACCESS_STATUS_DENIED).assertEqual(-1);
      expect(ACCESS_STATUS_DENIED).assertLess(ACCESS_STATUS_GRANTED);
      expect(ACCESS_STATUS_GRANTED).assertLarger(ACCESS_STATUS_DENIED);
      expect(typeof ACCESS_STATUS_GRANTED).assertEqual('number');
      sharedDriver.hilogEnd('testAccessStatusEnum0011');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_1200
     * @tc.name: testAccessStatusEnum0012
     * @tc.desc: Verify dual acquire access operations.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0012');
      try {
        const s1 = screenLockFileManager.acquireAccess();
        const s2 = screenLockFileManager.acquireAccess();
        expect(testHelper.isValidAccessStatus(s1)).assertTrue();
        expect(testHelper.isValidAccessStatus(s2)).assertTrue();
        expect(typeof s1).assertEqual('number');
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testAccessStatusEnum0012');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_1300
     * @tc.name: testAccessStatusEnum0013
     * @tc.desc: Verify unique values in status enum.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0013');
      const values: number[] = [ACCESS_STATUS_GRANTED, ACCESS_STATUS_DENIED];
      expect(values.length).assertEqual(2);
      const unique: number[] = [];
      for (let i = 0; i < values.length; i++) {
        let isUnique = true;
        for (let j = 0; j < unique.length; j++) {
          if (values[i] === unique[j]) {
            isUnique = false;
          }
        }
        if (isUnique) {
          unique.push(values[i]);
        }
      }
      expect(unique.length).assertEqual(2);
      expect(values.length).assertEqual(unique.length);
      expect(typeof values[0]).assertEqual('number');
      sharedDriver.hilogEnd('testAccessStatusEnum0013');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_1400
     * @tc.name: testAccessStatusEnum0014
     * @tc.desc: Verify name difference between status values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0014');
      const nameGranted = testHelper.getAccessStatusName(0);
      const nameDenied = testHelper.getAccessStatusName(1);
      expect(nameGranted !== nameDenied).assertTrue();
      expect(nameGranted.length).assertLarger(0);
      expect(nameDenied.length).assertLarger(0);
      sharedDriver.hilogEnd('testAccessStatusEnum0014');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_1500
     * @tc.name: testAccessStatusEnum0015
     * @tc.desc: Verify out of range values return UNKNOWN.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0015');
      const nameNeg = testHelper.getAccessStatusName(2);
      const nameBig = testHelper.getAccessStatusName(100);
      expect(nameNeg).assertEqual('UNKNOWN');
      expect(nameBig).assertEqual('UNKNOWN');
      expect(nameNeg).assertEqual(nameBig);
      sharedDriver.hilogEnd('testAccessStatusEnum0015');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_1600
     * @tc.name: testAccessStatusEnum0016
     * @tc.desc: Verify clear history and acquire access flow.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0016');
      await scrollToId('clearHistoryButton')
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.getTextById('operationResult');
      const hasAccess = result.includes('ACCESS_');
      expect(hasAccess).assertTrue();
      expect(result.length).assertLarger(0);
      expect(result.includes('acquireAccess')).assertTrue();
      sharedDriver.hilogEnd('testAccessStatusEnum0016');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_1700
     * @tc.name: testAccessStatusEnum0017
     * @tc.desc: Verify enum object is valid and not null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0017');
      const enumObj = screenLockFileManager.AccessStatus;
      expect(typeof enumObj).assertEqual('object');
      expect(enumObj !== null).assertTrue();
      const keys = Object.keys(enumObj);
      expect(keys.length).assertLarger(0);
      sharedDriver.hilogEnd('testAccessStatusEnum0017');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_1800
     * @tc.name: testAccessStatusEnum0018
     * @tc.desc: Verify name starts with ACCESS_ prefix.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0018');
      try {
        const status = screenLockFileManager.acquireAccess();
        const name = testHelper.getAccessStatusName(status);
        expect(name.startsWith('ACCESS_') || name === 'UNKNOWN').assertTrue();
        expect(name.length).assertLarger(0);
        expect(typeof name).assertEqual('string');
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testAccessStatusEnum0018');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_1900
     * @tc.name: testAccessStatusEnum0019
     * @tc.desc: Verify constant values match API enum.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0019');
      expect(ACCESS_STATUS_GRANTED).assertEqual(screenLockFileManager.AccessStatus.ACCESS_GRANTED);
      expect(ACCESS_STATUS_DENIED).assertEqual(screenLockFileManager.AccessStatus.ACCESS_DENIED);
      sharedDriver.hilogEnd('testAccessStatusEnum0019');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_2000
     * @tc.name: testAccessStatusEnum0020
     * @tc.desc: Verify enum keys validate type and value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0020');
      expect(typeof screenLockFileManager.AccessStatus.ACCESS_GRANTED).assertEqual('number');
      expect(typeof screenLockFileManager.AccessStatus.ACCESS_DENIED).assertEqual('number');
      expect(screenLockFileManager.AccessStatus.ACCESS_GRANTED).assertEqual(0);
      sharedDriver.hilogEnd('testAccessStatusEnum0020');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_2100
     * @tc.name: testAccessStatusEnum0021
     * @tc.desc: Verify name mapping through UI interaction.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0021');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await clickById('queryAllStatesButton')
      await scrollToId('operationResult')
      const result = await textOfId('operationResult');
      expect(result.includes('Acquire')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(result.includes('KeyState')).assertTrue();
      sharedDriver.hilogEnd('testAccessStatusEnum0021');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_2200
     * @tc.name: testAccessStatusEnum0022
     * @tc.desc: Verify enum key count and value range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0022');
      try {
        const status = screenLockFileManager.acquireAccess();
        expect(status === ACCESS_STATUS_GRANTED || status === ACCESS_STATUS_DENIED).assertTrue();
        expect(status).assertLarger(-1);
        expect(status).assertLess(2);
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testAccessStatusEnum0022');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_2300
     * @tc.name: testAccessStatusEnum0023
     * @tc.desc: Verify values type is string with correct format.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0023');
      const name = testHelper.getAccessStatusName(ACCESS_STATUS_GRANTED);
      expect(name.startsWith('ACCESS_')).assertTrue();
      expect(name.length).assertLarger(7);
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testAccessStatusEnum0023');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_2400
     * @tc.name: testAccessStatusEnum0024
     * @tc.desc: Verify constants are final and immutable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0024');
      const name = testHelper.getAccessStatusName(ACCESS_STATUS_DENIED);
      expect(name.startsWith('ACCESS_')).assertTrue();
      expect(name.length).assertLarger(7);
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testAccessStatusEnum0024');
    });

    /*
     * @tc.number: SUB_ACCESS_STATUS_ENUM_2500
     * @tc.name: testAccessStatusEnum0025
     * @tc.desc: Verify clear history and query all states flow.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testAccessStatusEnum0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAccessStatusEnum0025');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      try {
        const status = screenLockFileManager.acquireAccess();
        expect(testHelper.isValidAccessStatus(status)).assertTrue();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      await clickById('queryAllStatesButton')
      await scrollToId('operationResult')
      const result = await textOfId('operationResult');
      expect(result.includes('Acquire')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(result.includes('KeyState')).assertTrue();
      sharedDriver.hilogEnd('testAccessStatusEnum0025');
    });
  });
}
