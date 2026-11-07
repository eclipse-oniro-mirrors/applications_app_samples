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
import { DOMAIN, TAG, BUNDLE_NAME, ABILITY_NAME} from './TestConstants';
import { abilityDelegatorRegistry } from '@kit.TestKit';
const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function apiStatesTest(): void {
  describe('ApiStatesTest', (): void => {

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
    // ==================== API 状态机与枚举值验证（6 条） ====================

    /*
     * @tc.number: SUB_AS_0100
     * @tc.name: testApiStates0001
     * @tc.desc: Verify ApiStates scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testApiStates0001', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s begin', 'testApiStates0001');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const isValid = status === screenLockFileManager.KeyStatus.KEY_NOT_EXIST ||
        status === screenLockFileManager.KeyStatus.KEY_RELEASED ||
        status === screenLockFileManager.KeyStatus.KEY_EXIST;
      hilog.info(DOMAIN, TAG, '%{public}s expects a valid KeyStatus, actual: %{public}d',
        'testApiStates0001', status);
      expect(isValid).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s end', 'testApiStates0001');
    });

    /*
     * @tc.number: SUB_AS_0200
     * @tc.name: testApiStates0002
     * @tc.desc: Verify ApiStates scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiStates0002', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s begin', 'testApiStates0002');
      const status1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const status2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      hilog.info(DOMAIN, TAG, '%{public}s expects consistent results, status1: %{public}d, status2: %{public}d',
        'testApiStates0002', status1, status2);
      expect(status1).assertEqual(status2);
      hilog.info(DOMAIN, TAG, '%{public}s end', 'testApiStates0002');
    });

    /*
     * @tc.number: SUB_AS_0300
     * @tc.name: testApiStates0003
     * @tc.desc: Verify ApiStates scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testApiStates0003', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s begin', 'testApiStates0003');
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const isValid = status === screenLockFileManager.AccessStatus.ACCESS_GRANTED ||
          status === screenLockFileManager.AccessStatus.ACCESS_DENIED;
        hilog.info(DOMAIN, TAG, '%{public}s expects a valid AccessStatus, actual: %{public}d',
          'testApiStates0003', status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s caught BusinessError: code=%{public}d, message=%{public}s',
          'testApiStates0003', err.code, err.message);
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s end', 'testApiStates0003');
    });

    /*
     * @tc.number: SUB_AS_0400
     * @tc.name: testApiStates0004
     * @tc.desc: Verify ApiStates scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testApiStates0004', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s begin', 'testApiStates0004');
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const isValid = status === screenLockFileManager.ReleaseStatus.RELEASE_GRANTED ||
          status === screenLockFileManager.ReleaseStatus.RELEASE_DENIED;
        hilog.info(DOMAIN, TAG, '%{public}s expects a valid ReleaseStatus, actual: %{public}d',
          'testApiStates0004', status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s caught BusinessError: code=%{public}d, message=%{public}s',
          'testApiStates0004', err.code, err.message);
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s end', 'testApiStates0004');
    });

    /*
     * @tc.number: SUB_AS_0500
     * @tc.name: testApiStates0005
     * @tc.desc: Verify ApiStates scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testApiStates0005', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s begin', 'testApiStates0005');
      let acquireStatus: screenLockFileManager.AccessStatus = screenLockFileManager.AccessStatus.ACCESS_DENIED;
      try {
        acquireStatus = screenLockFileManager.acquireAccess();
        hilog.info(DOMAIN, TAG, '%{public}s acquireAccess returned: %{public}d',
          'testApiStates0005', acquireStatus);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s acquireAccess threw error: code=%{public}d, message=%{public}s',
          'testApiStates0005', err.code, err.message);
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        return;
      }
      if (acquireStatus === screenLockFileManager.AccessStatus.ACCESS_GRANTED) {
        try {
          const releaseStatus: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
          hilog.info(DOMAIN, TAG, '%{public}s releaseAccess returned: %{public}d',
            'testApiStates0005', releaseStatus);
          expect(releaseStatus === screenLockFileManager.ReleaseStatus.RELEASE_GRANTED).assertTrue();
        } catch (error) {
          const err = error as BusinessError;
          hilog.info(DOMAIN, TAG, '%{public}s releaseAccess threw error: code=%{public}d, message=%{public}s',
            'testApiStates0005', err.code, err.message);
          expect(err.code).assertLarger(0);
          expect(err.message.length).assertLarger(0);
        }
      } else {
        hilog.info(DOMAIN, TAG, '%{public}s acquire was denied, status: %{public}d',
          'testApiStates0005', acquireStatus);
        expect(acquireStatus).assertEqual(screenLockFileManager.AccessStatus.ACCESS_DENIED);
      }
      hilog.info(DOMAIN, TAG, '%{public}s end', 'testApiStates0005');
    });

    /*
     * @tc.number: SUB_AS_0600
     * @tc.name: testApiStates0006
     * @tc.desc: Verify ApiStates scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testApiStates0006', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s begin', 'testApiStates0006');
      const notExist: number = screenLockFileManager.KeyStatus.KEY_NOT_EXIST;
      const released: number = screenLockFileManager.KeyStatus.KEY_RELEASED;
      const exist: number = screenLockFileManager.KeyStatus.KEY_EXIST;
      hilog.info(DOMAIN, TAG, '%{public}s KEY_NOT_EXIST=%{public}d, KEY_RELEASED=%{public}d, KEY_EXIST=%{public}d',
        'testApiStates0006', notExist, released, exist);
      expect(notExist !== released).assertTrue();
      expect(released !== exist).assertTrue();
      expect(notExist !== exist).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s end', 'testApiStates0006');
    });
  });
}
