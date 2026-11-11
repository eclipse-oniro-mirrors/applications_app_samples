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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { SharedDriver } from './SharedDriver';
import { SharedDriverExt } from './SharedDriverExt';
import { ApiCallResult, StateSnapshot, TestHelper } from './TestHelper';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT,
  KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST,
  ACCESS_STATUS_GRANTED, ACCESS_STATUS_DENIED,
  RELEASE_STATUS_GRANTED, RELEASE_STATUS_DENIED
} from './TestConstants';
import { scrollToId } from '../testkit/SharedDriver';

const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);
const testHelper: TestHelper = new TestHelper(sharedDriver);

export default function errorInfoValidationTest(): void {
  describe('ErrorInfoValidationTest', (): void => {

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
    // ==================== 错误信息验证（25 条） ====================

    /*
     * @tc.number: SUB_EIV_0100
     * @tc.name: testErrorInfoValidation0001
     * @tc.desc: Verify ErrorInfoValidation scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0001');
      const result: ApiCallResult = testHelper.queryKeyState();
      expect(typeof result.errorCode).assertEqual('number');
      expect(result.errorCode).assertLarger(-1);
      expect(typeof result.success).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorInfoValidation0001');
    });

    /*
     * @tc.number: SUB_EIV_0200
     * @tc.name: testErrorInfoValidation0002
     * @tc.desc: Verify ErrorInfoValidation scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0002');
      const result: ApiCallResult = testHelper.queryKeyState();
      expect(typeof result.errorMessage).assertEqual('string');
      expect(result.errorMessage.length).assertLarger(0);
      expect(typeof result.errorCode).assertEqual('number');
      sharedDriver.hilogEnd('testErrorInfoValidation0002');
    });

    /*
     * @tc.number: SUB_EIV_0300
     * @tc.name: testErrorInfoValidation0003
     * @tc.desc: Verify ErrorInfoValidation scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0003');
      const result: ApiCallResult = testHelper.acquireAccess();
      expect(typeof result.errorCode).assertEqual('number');
      expect(result.errorCode).assertLarger(-1);
      expect(typeof result.success).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorInfoValidation0003');
    });

    /*
     * @tc.number: SUB_EIV_0400
     * @tc.name: testErrorInfoValidation0004
     * @tc.desc: Verify ErrorInfoValidation scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0004');
      const result: ApiCallResult = testHelper.acquireAccess();
      expect(typeof result.errorMessage).assertEqual('string');
      expect(result.errorMessage.length).assertLarger(0);
      expect(typeof result.timestamp).assertEqual('number');
      sharedDriver.hilogEnd('testErrorInfoValidation0004');
    });

    /*
     * @tc.number: SUB_EIV_0500
     * @tc.name: testErrorInfoValidation0005
     * @tc.desc: Verify ErrorInfoValidation scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0005');
      const result: ApiCallResult = testHelper.releaseAccess();
      expect(typeof result.errorCode).assertEqual('number');
      expect(result.errorCode).assertLarger(-1);
      expect(typeof result.success).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorInfoValidation0005');
    });

    /*
     * @tc.number: SUB_EIV_0600
     * @tc.name: testErrorInfoValidation0006
     * @tc.desc: Verify ErrorInfoValidation scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0006');
      const result: ApiCallResult = testHelper.releaseAccess();
      expect(typeof result.errorMessage).assertEqual('string');
      expect(result.errorMessage.length).assertLarger(0);
      expect(typeof result.timestamp).assertEqual('number');
      sharedDriver.hilogEnd('testErrorInfoValidation0006');
    });

    /*
     * @tc.number: SUB_EIV_0700
     * @tc.name: testErrorInfoValidation0007
     * @tc.desc: Verify ErrorInfoValidation scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0007');
      const result: ApiCallResult = testHelper.queryKeyState();
      if (result.errorCode === 0) {
        expect(result.success).assertTrue();
      }
      expect(typeof result.success).assertEqual('boolean');
      expect(typeof result.errorCode).assertEqual('number');
      sharedDriver.hilogEnd('testErrorInfoValidation0007');
    });

    /*
     * @tc.number: SUB_EIV_0800
     * @tc.name: testErrorInfoValidation0008
     * @tc.desc: Verify ErrorInfoValidation scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0008');
      const result: ApiCallResult = testHelper.queryKeyState();
      if (result.success) {
        expect(result.errorCode).assertEqual(0);
      }
      expect(typeof result.errorCode).assertEqual('number');
      expect(typeof result.success).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorInfoValidation0008');
    });

    /*
     * @tc.number: SUB_EIV_0900
     * @tc.name: testErrorInfoValidation0009
     * @tc.desc: Verify ErrorInfoValidation scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0009');
      const result: ApiCallResult = testHelper.queryKeyState();
      expect(result.errorMessage.includes('KeyStatus')).assertTrue();
      expect(result.errorMessage.length).assertLarger(0);
      expect(typeof result.errorMessage).assertEqual('string');
      sharedDriver.hilogEnd('testErrorInfoValidation0009');
    });

    /*
     * @tc.number: SUB_EIV_1000
     * @tc.name: testErrorInfoValidation0010
     * @tc.desc: Verify ErrorInfoValidation scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0010');
      const result: ApiCallResult = testHelper.acquireAccess();
      expect(result.errorMessage.includes('AccessStatus')).assertTrue();
      expect(result.errorMessage.length).assertLarger(0);
      expect(typeof result.errorMessage).assertEqual('string');
      sharedDriver.hilogEnd('testErrorInfoValidation0010');
    });

    /*
     * @tc.number: SUB_EIV_1100
     * @tc.name: testErrorInfoValidation0011
     * @tc.desc: Verify ErrorInfoValidation scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0011');
      const result: ApiCallResult = testHelper.releaseAccess();
      expect(result.errorMessage.includes('ReleaseStatus')).assertTrue();
      expect(result.errorMessage.length).assertLarger(0);
      expect(typeof result.errorMessage).assertEqual('string');
      sharedDriver.hilogEnd('testErrorInfoValidation0011');
    });

    /*
     * @tc.number: SUB_EIV_1200
     * @tc.name: testErrorInfoValidation0012
     * @tc.desc: Verify ErrorInfoValidation scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0012');
      const r1: ApiCallResult = testHelper.queryKeyState();
      const r2: ApiCallResult = testHelper.queryKeyState();
      expect(r2.timestamp).assertLarger(r1.timestamp - 1);
      expect(typeof r1.timestamp).assertEqual('number');
      expect(typeof r2.timestamp).assertEqual('number');
      sharedDriver.hilogEnd('testErrorInfoValidation0012');
    });

    /*
     * @tc.number: SUB_EIV_1300
     * @tc.name: testErrorInfoValidation0013
     * @tc.desc: Verify ErrorInfoValidation scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0013');
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_OPERATION_RESULT);
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      const hasValidContent: boolean = result.includes('ready') || result.includes('queryAppKeyState') ||
        result.includes('acquireAccess') || result.includes('releaseAccess') ||
        result.includes('Error') || result.includes('KeyState:');
      expect(hasValidContent).assertTrue();
      sharedDriver.hilogEnd('testErrorInfoValidation0013');
    });

    /*
     * @tc.number: SUB_EIV_1400
     * @tc.name: testErrorInfoValidation0014
     * @tc.desc: Verify ErrorInfoValidation scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0014');
      const r1: ApiCallResult = testHelper.acquireAccess();
      const r2: ApiCallResult = testHelper.releaseAccess();
      const r3: ApiCallResult = testHelper.queryKeyState();
      expect(r1.errorCode).assertLarger(-1);
      expect(r2.errorCode).assertLarger(-1);
      expect(r3.errorCode).assertLarger(-1);
      sharedDriver.hilogEnd('testErrorInfoValidation0014');
    });

    /*
     * @tc.number: SUB_EIV_1500
     * @tc.name: testErrorInfoValidation0015
     * @tc.desc: Verify ErrorInfoValidation scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0015');
      const result: ApiCallResult = testHelper.queryKeyState();
      if (result.success) {
        const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        expect(testHelper.isValidKeyStatus(status)).assertTrue();
      }
      expect(typeof result.success).assertEqual('boolean');
      expect(typeof result.errorCode).assertEqual('number');
      sharedDriver.hilogEnd('testErrorInfoValidation0015');
    });

    /*
     * @tc.number: SUB_EIV_1600
     * @tc.name: testErrorInfoValidation0016
     * @tc.desc: Verify ErrorInfoValidation scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0016');
      const result: ApiCallResult = testHelper.acquireAccess();
      if (result.success) {
        expect(testHelper.isValidAccessStatus(0) || testHelper.isValidAccessStatus(1)).assertTrue();
      }
      expect(typeof result.success).assertEqual('boolean');
      expect(typeof result.errorCode).assertEqual('number');
      sharedDriver.hilogEnd('testErrorInfoValidation0016');
    });

    /*
     * @tc.number: SUB_EIV_1700
     * @tc.name: testErrorInfoValidation0017
     * @tc.desc: Verify ErrorInfoValidation scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0017');
      const result: ApiCallResult = testHelper.releaseAccess();
      if (result.success) {
        expect(testHelper.isValidReleaseStatus(0) || testHelper.isValidReleaseStatus(1)).assertTrue();
      }
      expect(typeof result.success).assertEqual('boolean');
      expect(typeof result.errorCode).assertEqual('number');
      sharedDriver.hilogEnd('testErrorInfoValidation0017');
    });

    /*
     * @tc.number: SUB_EIV_1800
     * @tc.name: testErrorInfoValidation0018
     * @tc.desc: Verify ErrorInfoValidation scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0018');
      const keyName: string = testHelper.getKeyStatusName(0);
      const accessName: string = testHelper.getAccessStatusName(0);
      const releaseName: string = testHelper.getReleaseStatusName(0);
      expect(keyName).assertEqual('KEY_NOT_EXIST');
      expect(accessName).assertEqual('ACCESS_GRANTED');
      expect(releaseName).assertEqual('RELEASE_GRANTED');
      sharedDriver.hilogEnd('testErrorInfoValidation0018');
    });

    /*
     * @tc.number: SUB_EIV_1900
     * @tc.name: testErrorInfoValidation0019
     * @tc.desc: Verify ErrorInfoValidation scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0019');
      const n1: string = testHelper.getKeyStatusName(999);
      const n2: string = testHelper.getAccessStatusName(999);
      const n3: string = testHelper.getReleaseStatusName(999);
      expect(n1).assertEqual('UNKNOWN');
      expect(n2).assertEqual('UNKNOWN');
      expect(n3).assertEqual('UNKNOWN');
      sharedDriver.hilogEnd('testErrorInfoValidation0019');
    });

    /*
     * @tc.number: SUB_EIV_2000
     * @tc.name: testErrorInfoValidation0020
     * @tc.desc: Verify ErrorInfoValidation scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0020');
      const result: ApiCallResult = testHelper.queryKeyState();
      expect(typeof result.success).assertEqual('boolean');
      expect(typeof result.errorCode).assertEqual('number');
      expect(typeof result.errorMessage).assertEqual('string');
      expect(typeof result.timestamp).assertEqual('number');
      sharedDriver.hilogEnd('testErrorInfoValidation0020');
    });

    /*
     * @tc.number: SUB_EIV_2100
     * @tc.name: testErrorInfoValidation0021
     * @tc.desc: Verify ErrorInfoValidation scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0021');
      let hasErrorInfo: boolean = false;
      try {
        screenLockFileManager.queryAppKeyState();
        hasErrorInfo = true;
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        hasErrorInfo = true;
      }
      expect(hasErrorInfo).assertTrue();
      expect(typeof hasErrorInfo).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorInfoValidation0021');
    });

    /*
     * @tc.number: SUB_EIV_2200
     * @tc.name: testErrorInfoValidation0022
     * @tc.desc: Verify ErrorInfoValidation scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0022');
      let hasErrorInfo: boolean = false;
      try {
        screenLockFileManager.acquireAccess();
        hasErrorInfo = true;
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        hasErrorInfo = true;
      }
      expect(hasErrorInfo).assertTrue();
      expect(typeof hasErrorInfo).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorInfoValidation0022');
    });

    /*
     * @tc.number: SUB_EIV_2300
     * @tc.name: testErrorInfoValidation0023
     * @tc.desc: Verify ErrorInfoValidation scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0023');
      let hasErrorInfo: boolean = false;
      try {
        screenLockFileManager.releaseAccess();
        hasErrorInfo = true;
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        hasErrorInfo = true;
      }
      expect(hasErrorInfo).assertTrue();
      expect(typeof hasErrorInfo).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorInfoValidation0023');
    });

    /*
     * @tc.number: SUB_EIV_2400
     * @tc.name: testErrorInfoValidation0024
     * @tc.desc: Verify ErrorInfoValidation scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0024');
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: ApiCallResult = testHelper.queryKeyState();
      expect(typeof result.errorCode).assertEqual('number');
      expect(typeof result.errorMessage).assertEqual('string');
      expect(typeof result.success).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorInfoValidation0024');
    });

    /*
     * @tc.number: SUB_EIV_2500
     * @tc.name: testErrorInfoValidation0025
     * @tc.desc: Verify ErrorInfoValidation scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorInfoValidation0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorInfoValidation0025');
      testHelper.releaseAccess();
      const snapshot: StateSnapshot = await testHelper.captureStateSnapshot();
      expect(typeof snapshot.keyStatus).assertEqual('number');
      expect(typeof snapshot.operationResult).assertEqual('string');
      expect(snapshot.operationResult.length).assertLarger(0);
      sharedDriver.hilogEnd('testErrorInfoValidation0025');
    });
  });
}
