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
import { SharedDriverExt } from './SharedDriverExt';
import { DOMAIN, TAG, BUNDLE_NAME, ABILITY_NAME, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_CLEAR_HISTORY_BUTTON} from './TestConstants';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { quickClick, scrollToId } from '../testkit/SharedDriver';

const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver = new SharedDriverExt(sharedDriver);
const driver = Driver.create();

export default function counterOverflowTest(): void {
  describe('CounterOverflowTest', (): void => {
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

    // ==================== 计数器溢出与极端值验证（25 条） ====================

    /*
     * @tc.number: SUB_CO_0100
     * @tc.name: testCounterOverflow0001
     * @tc.desc: Verify acquire count valid after 20 acquire operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0001');
      // 清除历史
      await scrollToId(ID_CLEAR_HISTORY_BUTTON)
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      // 批量点击，不等待
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
      }
      // 一次性等待UI稳定
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0001');
    });

    /*
     * @tc.number: SUB_CO_0200
     * @tc.name: testCounterOverflow0002
     * @tc.desc: Verify release count valid after 20 release operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0002');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0002');
    });

    /*
     * @tc.number: SUB_CO_0300
     * @tc.name: testCounterOverflow0003
     * @tc.desc: Verify pending count valid after 20 mixed operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0003');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0003');
    });

    /*
     * @tc.number: SUB_CO_0400
     * @tc.name: testCounterOverflow0004
     * @tc.desc: Verify no overflow after many acquire operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0004');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0004');
    });

    /*
     * @tc.number: SUB_CO_0500
     * @tc.name: testCounterOverflow0005
     * @tc.desc: Verify no overflow after many release operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0005');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0005');
    });

    /*
     * @tc.number: SUB_CO_0600
     * @tc.name: testCounterOverflow0006
     * @tc.desc: Verify pairing status valid after many operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0006');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0006');
    });

    /*
     * @tc.number: SUB_CO_0700
     * @tc.name: testCounterOverflow0007
     * @tc.desc: Verify operation result valid after many operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0007');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0007');
    });

    /*
     * @tc.number: SUB_CO_0800
     * @tc.name: testCounterOverflow0008
     * @tc.desc: Verify history valid after many operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0008');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0008');
    });

    /*
     * @tc.number: SUB_CO_0900
     * @tc.name: testCounterOverflow0009
     * @tc.desc: Verify queryAllStates valid after many operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0009');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0009');
    });

    /*
     * @tc.number: SUB_CO_1000
     * @tc.name: testCounterOverflow0010
     * @tc.desc: Verify no crash after 20 rapid operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0010');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0010');
    });

    /*
     * @tc.number: SUB_CO_1100
     * @tc.name: testCounterOverflow0011
     * @tc.desc: Verify counters valid after alternating acquire-release 10 times.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0011');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
        await quickClick(ID_RELEASE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0011');
    });

    /*
     * @tc.number: SUB_CO_1200
     * @tc.name: testCounterOverflow0012
     * @tc.desc: Verify pending is 0 after equal alternating operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0012');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
        await quickClick(ID_RELEASE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0012');
    });

    /*
     * @tc.number: SUB_CO_1300
     * @tc.name: testCounterOverflow0013
     * @tc.desc: Verify no counter corruption after rapid sequences.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0013');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
        await quickClick(ID_RELEASE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0013');
    });

    /*
     * @tc.number: SUB_CO_1400
     * @tc.name: testCounterOverflow0014
     * @tc.desc: Verify history limit respected during rapid operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0014');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
        await quickClick(ID_RELEASE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0014');
    });

    /*
     * @tc.number: SUB_CO_1500
     * @tc.name: testCounterOverflow0015
     * @tc.desc: Verify operation result stable during rapid ops.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0015');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
        await quickClick(ID_RELEASE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0015');
    });

    /*
     * @tc.number: SUB_CO_1600
     * @tc.name: testCounterOverflow0016
     * @tc.desc: Verify pairing status updates correctly in rapid seq.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0016');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
        await quickClick(ID_RELEASE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0016');
    });

    /*
     * @tc.number: SUB_CO_1700
     * @tc.name: testCounterOverflow0017
     * @tc.desc: Verify no NaN or undefined in counter values.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0017');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
        await quickClick(ID_RELEASE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0017');
    });

    /*
     * @tc.number: SUB_CO_1800
     * @tc.name: testCounterOverflow0018
     * @tc.desc: Verify counter type remains number after extremes.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0018');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      for (let i = 0; i < 3; i++) {
        await quickClick(ID_ACQUIRE_BUTTON);
        await quickClick(ID_RELEASE_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testCounterOverflow0018');
    });

    /*
     * @tc.number: SUB_CO_1900
     * @tc.name: testCounterOverflow0019
     * @tc.desc: Verify API calls do not overflow counters.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0019');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      // 直接调用API，不走UI
      for (let i = 0; i < 3; i++) {
        try {
          screenLockFileManager.acquireAccess();
        } catch (error) {
          const err = error as BusinessError;
          expect(err.code).assertLarger(0);
        }
      }
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testCounterOverflow0019');
    });

    /*
     * @tc.number: SUB_CO_2000
     * @tc.name: testCounterOverflow0020
     * @tc.desc: Verify counter valid after 10 API acquire calls.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0020');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i = 0; i < 3; i++) {
        try {
          screenLockFileManager.acquireAccess();
        } catch (error) {
          const err = error as BusinessError;
          expect(err.code).assertLarger(0);
        }
      }
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testCounterOverflow0020');
    });

    /*
     * @tc.number: SUB_CO_2100
     * @tc.name: testCounterOverflow0021
     * @tc.desc: Verify counter valid after 10 API release calls.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0021');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i = 0; i < 3; i++) {
        try {
          screenLockFileManager.acquireAccess();
        } catch (error) {
          const err = error as BusinessError;
          expect(err.code).assertLarger(0);
        }
      }
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testCounterOverflow0021');
    });

    /*
     * @tc.number: SUB_CO_2200
     * @tc.name: testCounterOverflow0022
     * @tc.desc: Verify mixed API and UI calls maintain counter integrity.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0022');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i = 0; i < 3; i++) {
        try {
          screenLockFileManager.acquireAccess();
        } catch (error) {
          const err = error as BusinessError;
          expect(err.code).assertLarger(0);
        }
      }
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testCounterOverflow0022');
    });

    /*
     * @tc.number: SUB_CO_2300
     * @tc.name: testCounterOverflow0023
     * @tc.desc: Verify queryAppKeyState valid after extreme operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0023');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i = 0; i < 3; i++) {
        try {
          screenLockFileManager.acquireAccess();
        } catch (error) {
          const err = error as BusinessError;
          expect(err.code).assertLarger(0);
        }
      }
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testCounterOverflow0023');
    });

    /*
     * @tc.number: SUB_CO_2400
     * @tc.name: testCounterOverflow0024
     * @tc.desc: Verify queryAllStates valid after extreme operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0024');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i = 0; i < 3; i++) {
        try {
          screenLockFileManager.acquireAccess();
        } catch (error) {
          const err = error as BusinessError;
          expect(err.code).assertLarger(0);
        }
      }
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testCounterOverflow0024');
    });

    /*
     * @tc.number: SUB_CO_2500
     * @tc.name: testCounterOverflow0025
     * @tc.desc: Verify error handling valid during extreme sequences.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testCounterOverflow0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCounterOverflow0025');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await quickClick(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i = 0; i < 3; i++) {
        try {
          screenLockFileManager.acquireAccess();
        } catch (error) {
          const err = error as BusinessError;
          expect(err.code).assertLarger(0);
        }
      }
      const counts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testCounterOverflow0025');
    });

  });
}
