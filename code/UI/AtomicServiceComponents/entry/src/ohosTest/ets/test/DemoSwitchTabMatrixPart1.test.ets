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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { DEMO_ITEMS, filterDemos, canSwitchTab } from '../../../main/ets/model/DemoLogic';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function DemoSwitchTabMatrixPart1Test(): void {
  describe('DemoSwitchTabMatrixPart1', () => {

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_0100
     * @tc.name      testCanSwitchTab0001
     * @tc.desc      Verify canSwitchTab(-1, -1, true, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0001 begin');
      await delayTick();
      expect(canSwitchTab(-1, -1, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0001 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_0200
     * @tc.name      testCanSwitchTab0002
     * @tc.desc      Verify canSwitchTab(-1, -1, false, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0002 begin');
      await delayTick();
      expect(canSwitchTab(-1, -1, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0002 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_0300
     * @tc.name      testCanSwitchTab0003
     * @tc.desc      Verify canSwitchTab(-1, 0, true, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0003 begin');
      await delayTick();
      expect(canSwitchTab(-1, 0, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0003 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_0400
     * @tc.name      testCanSwitchTab0004
     * @tc.desc      Verify canSwitchTab(-1, 0, false, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0004 begin');
      await delayTick();
      expect(canSwitchTab(-1, 0, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0004 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_0500
     * @tc.name      testCanSwitchTab0005
     * @tc.desc      Verify canSwitchTab(-1, 1, true, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0005 begin');
      await delayTick();
      expect(canSwitchTab(-1, 1, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0005 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_0600
     * @tc.name      testCanSwitchTab0006
     * @tc.desc      Verify canSwitchTab(-1, 1, false, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0006 begin');
      await delayTick();
      expect(canSwitchTab(-1, 1, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0006 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_0700
     * @tc.name      testCanSwitchTab0007
     * @tc.desc      Verify canSwitchTab(-1, 3, true, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0007 begin');
      await delayTick();
      expect(canSwitchTab(-1, 3, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0007 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_0800
     * @tc.name      testCanSwitchTab0008
     * @tc.desc      Verify canSwitchTab(-1, 3, false, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0008 begin');
      await delayTick();
      expect(canSwitchTab(-1, 3, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0008 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_0900
     * @tc.name      testCanSwitchTab0009
     * @tc.desc      Verify canSwitchTab(0, -1, true, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0009 begin');
      await delayTick();
      expect(canSwitchTab(0, -1, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0009 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_1000
     * @tc.name      testCanSwitchTab0010
     * @tc.desc      Verify canSwitchTab(0, -1, false, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0010 begin');
      await delayTick();
      expect(canSwitchTab(0, -1, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0010 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_1100
     * @tc.name      testCanSwitchTab0011
     * @tc.desc      Verify canSwitchTab(0, 0, true, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0011 begin');
      await delayTick();
      expect(canSwitchTab(0, 0, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0011 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_1200
     * @tc.name      testCanSwitchTab0012
     * @tc.desc      Verify canSwitchTab(0, 0, false, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0012 begin');
      await delayTick();
      expect(canSwitchTab(0, 0, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0012 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_1300
     * @tc.name      testCanSwitchTab0013
     * @tc.desc      Verify canSwitchTab(0, 1, true, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0013 begin');
      await delayTick();
      expect(canSwitchTab(0, 1, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0013 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_1400
     * @tc.name      testCanSwitchTab0014
     * @tc.desc      Verify canSwitchTab(0, 1, false, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0014 begin');
      await delayTick();
      expect(canSwitchTab(0, 1, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0014 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_1500
     * @tc.name      testCanSwitchTab0015
     * @tc.desc      Verify canSwitchTab(0, 3, true, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0015 begin');
      await delayTick();
      expect(canSwitchTab(0, 3, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0015 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_1600
     * @tc.name      testCanSwitchTab0016
     * @tc.desc      Verify canSwitchTab(0, 3, false, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0016 begin');
      await delayTick();
      expect(canSwitchTab(0, 3, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0016 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_1700
     * @tc.name      testCanSwitchTab0017
     * @tc.desc      Verify canSwitchTab(2, -1, true, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0017 begin');
      await delayTick();
      expect(canSwitchTab(2, -1, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0017 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_1800
     * @tc.name      testCanSwitchTab0018
     * @tc.desc      Verify canSwitchTab(2, -1, false, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0018 begin');
      await delayTick();
      expect(canSwitchTab(2, -1, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0018 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_1900
     * @tc.name      testCanSwitchTab0019
     * @tc.desc      Verify canSwitchTab(2, 0, true, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0019 begin');
      await delayTick();
      expect(canSwitchTab(2, 0, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0019 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_2000
     * @tc.name      testCanSwitchTab0020
     * @tc.desc      Verify canSwitchTab(2, 0, false, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0020 begin');
      await delayTick();
      expect(canSwitchTab(2, 0, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0020 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_2100
     * @tc.name      testCanSwitchTab0021
     * @tc.desc      Verify canSwitchTab(2, 1, true, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0021 begin');
      await delayTick();
      expect(canSwitchTab(2, 1, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0021 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_2200
     * @tc.name      testCanSwitchTab0022
     * @tc.desc      Verify canSwitchTab(2, 1, false, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0022 begin');
      await delayTick();
      expect(canSwitchTab(2, 1, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0022 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_2300
     * @tc.name      testCanSwitchTab0023
     * @tc.desc      Verify canSwitchTab(2, 3, true, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0023 begin');
      await delayTick();
      expect(canSwitchTab(2, 3, true, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0023 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_2400
     * @tc.name      testCanSwitchTab0024
     * @tc.desc      Verify canSwitchTab(2, 3, false, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0024 begin');
      await delayTick();
      expect(canSwitchTab(2, 3, false, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0024 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_2500
     * @tc.name      testCanSwitchTab0025
     * @tc.desc      Verify canSwitchTab(-1, -1, true, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0025 begin');
      await delayTick();
      expect(canSwitchTab(-1, -1, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0025 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_2600
     * @tc.name      testCanSwitchTab0026
     * @tc.desc      Verify canSwitchTab(-1, -1, false, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0026 begin');
      await delayTick();
      expect(canSwitchTab(-1, -1, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0026 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_2700
     * @tc.name      testCanSwitchTab0027
     * @tc.desc      Verify canSwitchTab(-1, 0, true, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0027 begin');
      await delayTick();
      expect(canSwitchTab(-1, 0, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0027 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_2800
     * @tc.name      testCanSwitchTab0028
     * @tc.desc      Verify canSwitchTab(-1, 0, false, 1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0028 begin');
      await delayTick();
      expect(canSwitchTab(-1, 0, false, 1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0028 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_2900
     * @tc.name      testCanSwitchTab0029
     * @tc.desc      Verify canSwitchTab(-1, 1, true, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0029 begin');
      await delayTick();
      expect(canSwitchTab(-1, 1, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0029 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_3000
     * @tc.name      testCanSwitchTab0030
     * @tc.desc      Verify canSwitchTab(-1, 1, false, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0030 begin');
      await delayTick();
      expect(canSwitchTab(-1, 1, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0030 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_3100
     * @tc.name      testCanSwitchTab0031
     * @tc.desc      Verify canSwitchTab(-1, 3, true, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0031 begin');
      await delayTick();
      expect(canSwitchTab(-1, 3, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0031 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_3200
     * @tc.name      testCanSwitchTab0032
     * @tc.desc      Verify canSwitchTab(-1, 3, false, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0032 begin');
      await delayTick();
      expect(canSwitchTab(-1, 3, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0032 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_3300
     * @tc.name      testCanSwitchTab0033
     * @tc.desc      Verify canSwitchTab(0, -1, true, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0033 begin');
      await delayTick();
      expect(canSwitchTab(0, -1, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0033 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_3400
     * @tc.name      testCanSwitchTab0034
     * @tc.desc      Verify canSwitchTab(0, -1, false, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0034 begin');
      await delayTick();
      expect(canSwitchTab(0, -1, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0034 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_3500
     * @tc.name      testCanSwitchTab0035
     * @tc.desc      Verify canSwitchTab(0, 0, true, 1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0035 begin');
      await delayTick();
      expect(canSwitchTab(0, 0, true, 1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0035 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_3600
     * @tc.name      testCanSwitchTab0036
     * @tc.desc      Verify canSwitchTab(0, 0, false, 1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0036 begin');
      await delayTick();
      expect(canSwitchTab(0, 0, false, 1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0036 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_3700
     * @tc.name      testCanSwitchTab0037
     * @tc.desc      Verify canSwitchTab(0, 1, true, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0037 begin');
      await delayTick();
      expect(canSwitchTab(0, 1, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0037 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_3800
     * @tc.name      testCanSwitchTab0038
     * @tc.desc      Verify canSwitchTab(0, 1, false, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0038 begin');
      await delayTick();
      expect(canSwitchTab(0, 1, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0038 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_3900
     * @tc.name      testCanSwitchTab0039
     * @tc.desc      Verify canSwitchTab(0, 3, true, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0039 begin');
      await delayTick();
      expect(canSwitchTab(0, 3, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0039 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP1_4000
     * @tc.name      testCanSwitchTab0040
     * @tc.desc      Verify canSwitchTab(0, 3, false, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0040 begin');
      await delayTick();
      expect(canSwitchTab(0, 3, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0040 end');
    })

  })
}
