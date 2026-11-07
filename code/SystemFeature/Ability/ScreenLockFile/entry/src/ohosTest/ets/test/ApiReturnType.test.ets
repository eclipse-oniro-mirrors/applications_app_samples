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
import { clickById, scrollToId, textOfId } from '../testkit/SharedDriver';
import { DOMAIN, TAG, BUNDLE_NAME, ABILITY_NAME} from './TestConstants';
import { abilityDelegatorRegistry } from '@kit.TestKit';
const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function apiReturnTypeTest(): void {
  describe('ApiReturnTypeTest', (): void => {

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
    // ==================== API 返回值类型验证（20 条） ====================

    /*
     * @tc.number: SUB_ART_0100
     * @tc.name: testApiReturnType0001
     * @tc.desc: Verify ApiReturnType scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiReturnType0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0001');
      const status = screenLockFileManager.queryAppKeyState();
      expect(typeof status).assertEqual('number');
      expect(status).assertLarger(-1);
      expect(status).assertLess(3);
      sharedDriver.hilogEnd('testApiReturnType0001');
    });

    /*
     * @tc.number: SUB_ART_0200
     * @tc.name: testApiReturnType0002
     * @tc.desc: Verify ApiReturnType scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiReturnType0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0002');
      try {
        const status = screenLockFileManager.acquireAccess();
        expect(typeof status).assertEqual('number');
        expect(status).assertLarger(-1);
        expect(status).assertLess(2);
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testApiReturnType0002');
    });

    /*
     * @tc.number: SUB_ART_0300
     * @tc.name: testApiReturnType0003
     * @tc.desc: Verify ApiReturnType scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiReturnType0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0003');
      try {
        const status = screenLockFileManager.releaseAccess();
        expect(typeof status).assertEqual('number');
        expect(status).assertLarger(-1);
        expect(status).assertLess(2);
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testApiReturnType0003');
    });

    /*
     * @tc.number: SUB_ART_0400
     * @tc.name: testApiReturnType0004
     * @tc.desc: Verify ApiReturnType scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiReturnType0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0004');
      const keyStatus = screenLockFileManager.KeyStatus;
      expect(typeof keyStatus).assertEqual('object');
      expect(typeof keyStatus.KEY_NOT_EXIST).assertEqual('number');
      expect(typeof keyStatus.KEY_RELEASED).assertEqual('number');
      sharedDriver.hilogEnd('testApiReturnType0004');
    });

    /*
     * @tc.number: SUB_ART_0500
     * @tc.name: testApiReturnType0005
     * @tc.desc: Verify ApiReturnType scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiReturnType0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0005');
      const accessStatus = screenLockFileManager.AccessStatus;
      expect(typeof accessStatus).assertEqual('object');
      expect(typeof accessStatus.ACCESS_GRANTED).assertEqual('number');
      expect(typeof accessStatus.ACCESS_DENIED).assertEqual('number');
      sharedDriver.hilogEnd('testApiReturnType0005');
    });

    /*
     * @tc.number: SUB_ART_0600
     * @tc.name: testApiReturnType0006
     * @tc.desc: Verify ApiReturnType scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiReturnType0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0006');
      const releaseStatus = screenLockFileManager.ReleaseStatus;
      expect(typeof releaseStatus).assertEqual('object');
      expect(typeof releaseStatus.RELEASE_GRANTED).assertEqual('number');
      expect(typeof releaseStatus.RELEASE_DENIED).assertEqual('number');
      sharedDriver.hilogEnd('testApiReturnType0006');
    });

    /*
     * @tc.number: SUB_ART_0700
     * @tc.name: testApiReturnType0007
     * @tc.desc: Verify ApiReturnType scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiReturnType0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0007');
      await clickById('queryKeyStateButton')
      await scrollToId('operationResult')
      const result = await textOfId('operationResult');
      expect(typeof result).assertEqual('string');
      expect(result.length).assertLarger(0);
      expect(result.includes('queryAppKeyState')).assertTrue();
      sharedDriver.hilogEnd('testApiReturnType0007');
    });

    /*
     * @tc.number: SUB_ART_0800
     * @tc.name: testApiReturnType0008
     * @tc.desc: Verify ApiReturnType scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiReturnType0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0008');
      await clickById('acquireAccessButton')
      await scrollToId('operationResult')
      const result = await textOfId('operationResult');
      expect(typeof result).assertEqual('string');
      expect(result.length).assertLarger(0);
      expect(result.includes('acquireAccess')).assertTrue();
      sharedDriver.hilogEnd('testApiReturnType0008');
    });

    /*
     * @tc.number: SUB_ART_0900
     * @tc.name: testApiReturnType0009
     * @tc.desc: Verify ApiReturnType scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiReturnType0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0009');
      await clickById('releaseAccessButton')
      await scrollToId('operationResult')
      const result = await textOfId('operationResult');
      expect(typeof result).assertEqual('string');
      expect(result.length).assertLarger(0);
      expect(result.includes('releaseAccess')).assertTrue();
      sharedDriver.hilogEnd('testApiReturnType0009');
    });

    /*
     * @tc.number: SUB_ART_1000
     * @tc.name: testApiReturnType0010
     * @tc.desc: Verify ApiReturnType scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiReturnType0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0010');
      await clickById('queryAllStatesButton')
      await scrollToId('operationResult')
      const result = await textOfId('operationResult');
      expect(typeof result).assertEqual('string');
      expect(result.length).assertLarger(0);
      expect(result.includes('KeyState')).assertTrue();
      sharedDriver.hilogEnd('testApiReturnType0010');
    });

    /*
     * @tc.number: SUB_ART_1100
     * @tc.name: testApiReturnType0011
     * @tc.desc: Verify ApiReturnType scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiReturnType0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0011');
      const text = await sharedDriver.getTextById('pairingStatus');
      expect(typeof text).assertEqual('string');
      expect(text.length).assertLarger(0);
      expect(text.includes('Acquire')).assertTrue();
      sharedDriver.hilogEnd('testApiReturnType0011');
    });

    /*
     * @tc.number: SUB_ART_1200
     * @tc.name: testApiReturnType0012
     * @tc.desc: Verify ApiReturnType scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiReturnType0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0012');
      const exists = await sharedDriver.existsId('operationResult');
      expect(typeof exists).assertEqual('boolean');
      expect(exists).assertTrue();
      expect(exists === true).assertTrue();
      sharedDriver.hilogEnd('testApiReturnType0012');
    });

    /*
     * @tc.number: SUB_ART_1300
     * @tc.name: testApiReturnType0013
     * @tc.desc: Verify ApiReturnType scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiReturnType0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0013');
      const exists = await sharedDriver.existsId('nonExistentComponent');
      expect(typeof exists).assertEqual('boolean');
      expect(exists).assertFalse();
      expect(exists === false).assertTrue();
      sharedDriver.hilogEnd('testApiReturnType0013');
    });

    /*
     * @tc.number: SUB_ART_1400
     * @tc.name: testApiReturnType0014
     * @tc.desc: Verify ApiReturnType scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiReturnType0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0014');
      const keyStatus = screenLockFileManager.queryAppKeyState();
      const isNumber = typeof keyStatus === 'number';
      expect(isNumber).assertTrue();
      expect(typeof isNumber).assertEqual('boolean');
      expect(keyStatus).assertLarger(-1);
      sharedDriver.hilogEnd('testApiReturnType0014');
    });

    /*
     * @tc.number: SUB_ART_1500
     * @tc.name: testApiReturnType0015
     * @tc.desc: Verify ApiReturnType scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiReturnType0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0015');
      const queryFn = screenLockFileManager.queryAppKeyState;
      expect(typeof queryFn).assertEqual('function');
      expect(typeof screenLockFileManager.acquireAccess).assertEqual('function');
      expect(typeof screenLockFileManager.releaseAccess).assertEqual('function');
      sharedDriver.hilogEnd('testApiReturnType0015');
    });

    /*
     * @tc.number: SUB_ART_1600
     * @tc.name: testApiReturnType0016
     * @tc.desc: Verify ApiReturnType scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiReturnType0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0016');
      const resultText = await sharedDriver.getTextById('operationResult');
      expect(typeof resultText).assertEqual('string');
      expect(resultText.length).assertLarger(0);
      expect(typeof resultText.length).assertEqual('number');
      sharedDriver.hilogEnd('testApiReturnType0016');
    });

    /*
     * @tc.number: SUB_ART_1700
     * @tc.name: testApiReturnType0017
     * @tc.desc: Verify ApiReturnType scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiReturnType0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0017');
      const keyStatus = screenLockFileManager.KeyStatus;
      const keys = Object.keys(keyStatus);
      expect(keys.length).assertLarger(0);
      expect(typeof keys[0]).assertEqual('string');
      expect(keys.length).assertEqual(3);
      sharedDriver.hilogEnd('testApiReturnType0017');
    });

    /*
     * @tc.number: SUB_ART_1800
     * @tc.name: testApiReturnType0018
     * @tc.desc: Verify ApiReturnType scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiReturnType0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0018');
      const accessStatus = screenLockFileManager.AccessStatus;
      const keys = Object.keys(accessStatus);
      expect(keys.length).assertLarger(0);
      expect(typeof keys[0]).assertEqual('string');
      expect(keys.length).assertEqual(2);
      sharedDriver.hilogEnd('testApiReturnType0018');
    });

    /*
     * @tc.number: SUB_ART_1900
     * @tc.name: testApiReturnType0019
     * @tc.desc: Verify ApiReturnType scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiReturnType0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0019');
      const releaseStatus = screenLockFileManager.ReleaseStatus;
      const keys = Object.keys(releaseStatus);
      expect(keys.length).assertLarger(0);
      expect(typeof keys[0]).assertEqual('string');
      expect(keys.length).assertEqual(2);
      sharedDriver.hilogEnd('testApiReturnType0019');
    });

    /*
     * @tc.number: SUB_ART_2000
     * @tc.name: testApiReturnType0020
     * @tc.desc: Verify ApiReturnType scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiReturnType0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiReturnType0020');
      const status = screenLockFileManager.queryAppKeyState();
      const enumType = screenLockFileManager.KeyStatus;
      expect(typeof status).assertEqual(typeof enumType.KEY_NOT_EXIST);
      expect(typeof status).assertEqual('number');
      expect(status).assertLarger(-1);
      sharedDriver.hilogEnd('testApiReturnType0020');
    });
  });
}
