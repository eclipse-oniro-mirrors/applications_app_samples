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

import { describe, expect, it } from '@ohos/hypium';
import { screenLockFileManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SharedDriver } from './SharedDriver';
import { TestHelper } from './TestHelper';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, RELEASE_STATUS_GRANTED, RELEASE_STATUS_DENIED
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const testHelper: TestHelper = new TestHelper(sharedDriver);

export default function releaseStatusEnumTest(): void {
  describe('ReleaseStatusEnumTest', (): void => {

    // ==================== ReleaseStatus 枚举值验证（25 条） ====================

    /*
     * @tc.number: SUB_RSE_0100
     * @tc.name: testReleaseStatusEnum0001
     * @tc.desc: Verify ReleaseStatusEnum scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0001');
      expect(screenLockFileManager.ReleaseStatus.RELEASE_GRANTED).assertEqual(0);
      expect(screenLockFileManager.ReleaseStatus.RELEASE_DENIED).assertEqual(-1);
      expect(typeof screenLockFileManager.ReleaseStatus).assertEqual('object');
      sharedDriver.hilogEnd('testReleaseStatusEnum0001');
    });

    /*
     * @tc.number: SUB_RSE_0200
     * @tc.name: testReleaseStatusEnum0002
     * @tc.desc: Verify ReleaseStatusEnum scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0002');
      expect(RELEASE_STATUS_GRANTED).assertEqual(0);
      expect(RELEASE_STATUS_DENIED).assertEqual(1);
      expect(RELEASE_STATUS_GRANTED !== RELEASE_STATUS_DENIED).assertTrue();
      sharedDriver.hilogEnd('testReleaseStatusEnum0002');
    });

    /*
     * @tc.number: SUB_RSE_0300
     * @tc.name: testReleaseStatusEnum0003
     * @tc.desc: Verify ReleaseStatusEnum scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0003');
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        expect(testHelper.isValidReleaseStatus(status)).assertTrue();
        expect(typeof status).assertEqual('number');
        expect(status).assertLarger(-1);
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testReleaseStatusEnum0003');
    });

    /*
     * @tc.number: SUB_RSE_0400
     * @tc.name: testReleaseStatusEnum0004
     * @tc.desc: Verify ReleaseStatusEnum scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0004');
      const nameGranted: string = testHelper.getReleaseStatusName(RELEASE_STATUS_GRANTED);
      expect(nameGranted).assertEqual('RELEASE_GRANTED');
      expect(nameGranted.length).assertLarger(0);
      expect(typeof nameGranted).assertEqual('string');
      sharedDriver.hilogEnd('testReleaseStatusEnum0004');
    });

    /*
     * @tc.number: SUB_RSE_0500
     * @tc.name: testReleaseStatusEnum0005
     * @tc.desc: Verify ReleaseStatusEnum scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0005');
      const nameDenied: string = testHelper.getReleaseStatusName(RELEASE_STATUS_DENIED);
      expect(nameDenied).assertEqual('RELEASE_DENIED');
      expect(nameDenied.length).assertLarger(0);
      expect(typeof nameDenied).assertEqual('string');
      sharedDriver.hilogEnd('testReleaseStatusEnum0005');
    });

    /*
     * @tc.number: SUB_RSE_0600
     * @tc.name: testReleaseStatusEnum0006
     * @tc.desc: Verify ReleaseStatusEnum scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0006');
      const nameUnknown: string = testHelper.getReleaseStatusName(99);
      expect(nameUnknown).assertEqual('UNKNOWN');
      expect(nameUnknown.length).assertLarger(0);
      expect(typeof nameUnknown).assertEqual('string');
      sharedDriver.hilogEnd('testReleaseStatusEnum0006');
    });

    /*
     * @tc.number: SUB_RSE_0700
     * @tc.name: testReleaseStatusEnum0007
     * @tc.desc: Verify ReleaseStatusEnum scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0007');
      const keys: string[] = Object.keys(screenLockFileManager.ReleaseStatus);
      expect(keys.length).assertEqual(2);
      expect(typeof keys[0]).assertEqual('string');
      expect(typeof keys[1]).assertEqual('string');
      sharedDriver.hilogEnd('testReleaseStatusEnum0007');
    });

    /*
     * @tc.number: SUB_RSE_0800
     * @tc.name: testReleaseStatusEnum0008
     * @tc.desc: Verify ReleaseStatusEnum scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0008');
      expect(RELEASE_STATUS_GRANTED).assertEqual(screenLockFileManager.ReleaseStatus.RELEASE_GRANTED);
      expect(RELEASE_STATUS_DENIED).assertEqual(1);
      expect(typeof screenLockFileManager.ReleaseStatus).assertEqual('object');
      sharedDriver.hilogEnd('testReleaseStatusEnum0008');
    });

    /*
     * @tc.number: SUB_RSE_0900
     * @tc.name: testReleaseStatusEnum0009
     * @tc.desc: Verify ReleaseStatusEnum scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult('releaseAccessButton', 'operationResult');
      const hasReleaseStatus: boolean = result.includes('RELEASE_GRANTED') || result.includes('RELEASE_DENIED') ||
        result.includes('releaseAccess');
      expect(hasReleaseStatus).assertTrue();
      expect(result.length).assertLarger(0);
      expect(result.includes('releaseAccess') || result.includes('RELEASE_')).assertTrue();
      sharedDriver.hilogEnd('testReleaseStatusEnum0009');
    });

    /*
     * @tc.number: SUB_RSE_1000
     * @tc.name: testReleaseStatusEnum0010
     * @tc.desc: Verify ReleaseStatusEnum scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0010');
      const names: string[] = [];
      names.push(testHelper.getReleaseStatusName(RELEASE_STATUS_GRANTED));
      names.push(testHelper.getReleaseStatusName(RELEASE_STATUS_DENIED));
      expect(names.length).assertEqual(2);
      expect(names[0] !== names[1]).assertTrue();
      expect(names[0].length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseStatusEnum0010');
    });

    /*
     * @tc.number: SUB_RSE_1100
     * @tc.name: testReleaseStatusEnum0011
     * @tc.desc: Verify ReleaseStatusEnum scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0011');
      expect(RELEASE_STATUS_GRANTED + RELEASE_STATUS_DENIED).assertEqual(1);
      expect(RELEASE_STATUS_DENIED).assertLarger(RELEASE_STATUS_GRANTED);
      expect(RELEASE_STATUS_GRANTED).assertLess(RELEASE_STATUS_DENIED);
      expect(typeof RELEASE_STATUS_GRANTED).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseStatusEnum0011');
    });

    /*
     * @tc.number: SUB_RSE_1200
     * @tc.name: testReleaseStatusEnum0012
     * @tc.desc: Verify ReleaseStatusEnum scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0012');
      try {
        const s1: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const s2: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        expect(testHelper.isValidReleaseStatus(s1)).assertTrue();
        expect(testHelper.isValidReleaseStatus(s2)).assertTrue();
        expect(typeof s1).assertEqual('number');
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testReleaseStatusEnum0012');
    });

    /*
     * @tc.number: SUB_RSE_1300
     * @tc.name: testReleaseStatusEnum0013
     * @tc.desc: Verify ReleaseStatusEnum scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0013');
      const values: number[] = [RELEASE_STATUS_GRANTED, RELEASE_STATUS_DENIED];
      expect(values.length).assertEqual(2);
      const unique: number[] = [];
      for (let i: number = 0; i < values.length; i++) {
        let isUnique: boolean = true;
        for (let j: number = 0; j < unique.length; j++) {
          if (values[i] === unique[j]) { isUnique = false; }
        }
        if (isUnique) { unique.push(values[i]); }
      }
      expect(unique.length).assertEqual(2);
      expect(values.length).assertEqual(unique.length);
      expect(typeof values[0]).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseStatusEnum0013');
    });

    /*
     * @tc.number: SUB_RSE_1400
     * @tc.name: testReleaseStatusEnum0014
     * @tc.desc: Verify ReleaseStatusEnum scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0014');
      const nameGranted: string = testHelper.getReleaseStatusName(0);
      const nameDenied: string = testHelper.getReleaseStatusName(1);
      expect(nameGranted !== nameDenied).assertTrue();
      expect(nameGranted.length).assertLarger(0);
      expect(nameDenied.length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseStatusEnum0014');
    });

    /*
     * @tc.number: SUB_RSE_1500
     * @tc.name: testReleaseStatusEnum0015
     * @tc.desc: Verify ReleaseStatusEnum scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0015');
      const nameNeg: string = testHelper.getReleaseStatusName(-999);
      const nameBig: string = testHelper.getReleaseStatusName(100);
      expect(nameNeg).assertEqual('UNKNOWN');
      expect(nameBig).assertEqual('UNKNOWN');
      expect(nameNeg).assertEqual(nameBig);
      sharedDriver.hilogEnd('testReleaseStatusEnum0015');
    });

    /*
     * @tc.number: SUB_RSE_1600
     * @tc.name: testReleaseStatusEnum0016
     * @tc.desc: Verify ReleaseStatusEnum scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('releaseAccessButton');
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById('operationResult');
      const hasRelease: boolean = result.includes('RELEASE_') || result.includes('releaseAccess');
      expect(hasRelease).assertTrue();
      expect(result.length).assertLarger(0);
      expect(result.includes('releaseAccess') || result.includes('RELEASE_')).assertTrue();
      sharedDriver.hilogEnd('testReleaseStatusEnum0016');
    });

    /*
     * @tc.number: SUB_RSE_1700
     * @tc.name: testReleaseStatusEnum0017
     * @tc.desc: Verify ReleaseStatusEnum scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0017');
      const enumObj: Object = screenLockFileManager.ReleaseStatus;
      expect(typeof enumObj).assertEqual('object');
      expect(enumObj !== null).assertTrue();
      const keys: string[] = Object.keys(enumObj);
      expect(keys.length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseStatusEnum0017');
    });

    /*
     * @tc.number: SUB_RSE_1800
     * @tc.name: testReleaseStatusEnum0018
     * @tc.desc: Verify ReleaseStatusEnum scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0018');
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const name: string = testHelper.getReleaseStatusName(status);
        expect(name.startsWith('RELEASE_') || name === 'UNKNOWN').assertTrue();
        expect(name.length).assertLarger(0);
        expect(typeof name).assertEqual('string');
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testReleaseStatusEnum0018');
    });

    /*
     * @tc.number: SUB_RSE_1900
     * @tc.name: testReleaseStatusEnum0019
     * @tc.desc: Verify ReleaseStatusEnum scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0019');
      expect(RELEASE_STATUS_GRANTED).assertEqual(screenLockFileManager.ReleaseStatus.RELEASE_GRANTED);
      expect(RELEASE_STATUS_DENIED).assertEqual(1);
      expect(screenLockFileManager.ReleaseStatus.RELEASE_GRANTED as number !==
        screenLockFileManager.ReleaseStatus.RELEASE_DENIED as number).assertTrue();
      sharedDriver.hilogEnd('testReleaseStatusEnum0019');
    });

    /*
     * @tc.number: SUB_RSE_2000
     * @tc.name: testReleaseStatusEnum0020
     * @tc.desc: Verify ReleaseStatusEnum scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0020');
      const granted: number = screenLockFileManager.ReleaseStatus.RELEASE_GRANTED;
      const denied: number = screenLockFileManager.ReleaseStatus.RELEASE_DENIED;
      expect(granted).assertEqual(0);
      expect(denied).assertEqual(-1);
      expect(granted !== denied).assertTrue();
      sharedDriver.hilogEnd('testReleaseStatusEnum0020');
    });

    /*
     * @tc.number: SUB_RSE_2100
     * @tc.name: testReleaseStatusEnum0021
     * @tc.desc: Verify ReleaseStatusEnum scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0021');
      try {
        screenLockFileManager.acquireAccess();
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        expect(testHelper.isValidReleaseStatus(status)).assertTrue();
        expect(typeof status).assertEqual('number');
        expect(status).assertLarger(-1);
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testReleaseStatusEnum0021');
    });

    /*
     * @tc.number: SUB_RSE_2200
     * @tc.name: testReleaseStatusEnum0022
     * @tc.desc: Verify ReleaseStatusEnum scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0022');
      const name1: string = testHelper.getReleaseStatusName(RELEASE_STATUS_GRANTED);
      const name2: string = testHelper.getReleaseStatusName(RELEASE_STATUS_DENIED);
      expect(name1 !== name2).assertTrue();
      expect(name1).assertEqual('RELEASE_GRANTED');
      expect(name2).assertEqual('RELEASE_DENIED');
      sharedDriver.hilogEnd('testReleaseStatusEnum0022');
    });

    /*
     * @tc.number: SUB_RSE_2300
     * @tc.name: testReleaseStatusEnum0023
     * @tc.desc: Verify ReleaseStatusEnum scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0023');
      const enumKeys: string[] = Object.keys(screenLockFileManager.ReleaseStatus);
      expect(enumKeys.length).assertEqual(2);
      let hasGranted: boolean = false;
      let hasDenied: boolean = false;
      for (let i: number = 0; i < enumKeys.length; i++) {
        if (enumKeys[i].includes('GRANTED')) { hasGranted = true; }
        if (enumKeys[i].includes('DENIED')) { hasDenied = true; }
      }
      expect(hasGranted).assertTrue();
      expect(hasDenied).assertTrue();
      sharedDriver.hilogEnd('testReleaseStatusEnum0023');
    });

    /*
     * @tc.number: SUB_RSE_2400
     * @tc.name: testReleaseStatusEnum0024
     * @tc.desc: Verify ReleaseStatusEnum scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0024');
      const values: number[] = [RELEASE_STATUS_GRANTED, RELEASE_STATUS_DENIED];
      expect(values.length).assertEqual(2);
      for (let i: number = 0; i < values.length; i++) {
        expect(typeof values[i]).assertEqual('number');
        expect(values[i]).assertLarger(-2);
      }
      sharedDriver.hilogEnd('testReleaseStatusEnum0024');
    });

    /*
     * @tc.number: SUB_RSE_2500
     * @tc.name: testReleaseStatusEnum0025
     * @tc.desc: Verify ReleaseStatusEnum scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseStatusEnum0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseStatusEnum0025');
      expect(RELEASE_STATUS_GRANTED).assertEqual(screenLockFileManager.ReleaseStatus.RELEASE_GRANTED);
      expect(RELEASE_STATUS_DENIED).assertEqual(1);
      expect(typeof screenLockFileManager.ReleaseStatus).assertEqual('object');
      expect(screenLockFileManager.ReleaseStatus !== null).assertTrue();
      sharedDriver.hilogEnd('testReleaseStatusEnum0025');
    });
  });
}
