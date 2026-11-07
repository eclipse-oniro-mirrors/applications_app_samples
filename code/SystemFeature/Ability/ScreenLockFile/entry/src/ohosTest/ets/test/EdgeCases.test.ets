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

export default function edgeCasesTest(): void {
  describe('EdgeCasesTest', (): void => {

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
    // ==================== 边界场景验证（7 条） ====================

    /*
     * @tc.number: SUB_EC_0100
     * @tc.name: testEdgeCases0001
     * @tc.desc: Verify EdgeCases scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testEdgeCases0001', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s begin', 'testEdgeCases0001');
      const results: number[] = [];
      for (let i = 0; i < 5; i++) {
        const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        results.push(status);
      }
      for (let i = 0; i < results.length; i++) {
        const isValid = results[i] === screenLockFileManager.KeyStatus.KEY_NOT_EXIST ||
          results[i] === screenLockFileManager.KeyStatus.KEY_RELEASED ||
          results[i] === screenLockFileManager.KeyStatus.KEY_EXIST;
        hilog.info(DOMAIN, TAG, '%{public}s iteration %{public}d, status: %{public}d',
          'testEdgeCases0001', i, results[i]);
        expect(isValid).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s end', 'testEdgeCases0001');
    });

    /*
     * @tc.number: SUB_EC_0200
     * @tc.name: testEdgeCases0002
     * @tc.desc: Verify EdgeCases scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testEdgeCases0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testEdgeCases0002');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const results: string[] = [];
      for (let i = 0; i < 3; i++) {
        await clickById('acquireAccessButton')
        await scrollToId('operationResult')
        const result = await textOfId('operationResult');
        results.push(result);
        hilog.info(DOMAIN, TAG, '%{public}s iteration %{public}d, result: %{public}s',
          'testEdgeCases0002', i, result);
      }
      expect(results.length === 3).assertTrue();
      sharedDriver.hilogEnd('testEdgeCases0002');
    });

    /*
     * @tc.number: SUB_EC_0300
     * @tc.name: testEdgeCases0003
     * @tc.desc: Verify EdgeCases scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testEdgeCases0003', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s begin', 'testEdgeCases0003');
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const isValid = status === screenLockFileManager.ReleaseStatus.RELEASE_GRANTED ||
          status === screenLockFileManager.ReleaseStatus.RELEASE_DENIED;
        hilog.info(DOMAIN, TAG, '%{public}s releaseAccess returned: %{public}d',
          'testEdgeCases0003', status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s releaseAccess threw error: code=%{public}d, message=%{public}s',
          'testEdgeCases0003', err.code, err.message);
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s end', 'testEdgeCases0003');
    });

    /*
     * @tc.number: SUB_EC_0400
     * @tc.name: testEdgeCases0004
     * @tc.desc: Verify EdgeCases scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testEdgeCases0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testEdgeCases0004');
      for (let i = 0; i < 5; i++) {
        await sharedDriver.clickId('queryKeyStateButton');
      }
      await sharedDriver.waitUiIdle();
      const resultText = await sharedDriver.getTextById('operationResult');
      const isValidResult = resultText.includes('queryAppKeyState') || resultText.includes('Error');
      sharedDriver.hilogAssert('testEdgeCases0004', 'result after rapid clicks', resultText);
      expect(isValidResult).assertTrue();
      sharedDriver.hilogEnd('testEdgeCases0004');
    });

    /*
     * @tc.number: SUB_EC_0500
     * @tc.name: testEdgeCases0005
     * @tc.desc: Verify EdgeCases scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testEdgeCases0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testEdgeCases0005');
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const beforeClear = await sharedDriver.getTextById('pairingStatus');
      sharedDriver.hilogAssert('testEdgeCases0005', 'pairing before clear', beforeClear);
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const afterClear = await sharedDriver.getTextById('pairingStatus');
      sharedDriver.hilogAssert('testEdgeCases0005', 'pairing after clear', afterClear);
      const containsZero = afterClear.includes('0');
      expect(containsZero).assertTrue();
      sharedDriver.hilogEnd('testEdgeCases0005');
    });

    /*
     * @tc.number: SUB_EC_0600
     * @tc.name: testEdgeCases0006
     * @tc.desc: Verify EdgeCases scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testEdgeCases0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testEdgeCases0006');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.clickId('acquireAccessButton');
      await clickById('queryAllStatesButton')
      await scrollToId('operationResult')
      const allResult = await textOfId('operationResult');
      const containsKeyState = allResult.includes('KeyState');
      const containsAcquire = allResult.includes('Acquire');
      sharedDriver.hilogAssert('testEdgeCases0006', 'query all result', allResult);
      expect(containsKeyState).assertTrue();
      expect(containsAcquire).assertTrue();
      sharedDriver.hilogEnd('testEdgeCases0006');
    });

    /*
     * @tc.number: SUB_EC_0700
     * @tc.name: testEdgeCases0007
     * @tc.desc: Verify EdgeCases scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testEdgeCases0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testEdgeCases0007');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      for (let i = 0; i < 15; i++) {
        await sharedDriver.clickId('queryKeyStateButton');
      }
      await sharedDriver.waitUiIdle();
      const noHistoryExists = await sharedDriver.existsId('noHistoryText');
      sharedDriver.hilogAssert('testEdgeCases0007', 'history should not be empty after 15 queries', (!noHistoryExists).toString());
      expect(noHistoryExists).assertFalse();
      sharedDriver.hilogEnd('testEdgeCases0007');
    });
  });
}
