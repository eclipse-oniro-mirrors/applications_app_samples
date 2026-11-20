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

export default function DemoSwitchTabMatrixPart2Test(): void {
  describe('DemoSwitchTabMatrixPart2', () => {

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_4100
     * @tc.name      testCanSwitchTab0041
     * @tc.desc      Verify canSwitchTab(2, -1, true, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0041 begin');
      await delayTick();
      expect(canSwitchTab(2, -1, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0041 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_4200
     * @tc.name      testCanSwitchTab0042
     * @tc.desc      Verify canSwitchTab(2, -1, false, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0042 begin');
      await delayTick();
      expect(canSwitchTab(2, -1, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0042 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_4300
     * @tc.name      testCanSwitchTab0043
     * @tc.desc      Verify canSwitchTab(2, 0, true, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0043 begin');
      await delayTick();
      expect(canSwitchTab(2, 0, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0043 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_4400
     * @tc.name      testCanSwitchTab0044
     * @tc.desc      Verify canSwitchTab(2, 0, false, 1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0044 begin');
      await delayTick();
      expect(canSwitchTab(2, 0, false, 1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0044 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_4500
     * @tc.name      testCanSwitchTab0045
     * @tc.desc      Verify canSwitchTab(2, 1, true, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0045 begin');
      await delayTick();
      expect(canSwitchTab(2, 1, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0045 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_4600
     * @tc.name      testCanSwitchTab0046
     * @tc.desc      Verify canSwitchTab(2, 1, false, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0046 begin');
      await delayTick();
      expect(canSwitchTab(2, 1, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0046 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_4700
     * @tc.name      testCanSwitchTab0047
     * @tc.desc      Verify canSwitchTab(2, 3, true, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0047 begin');
      await delayTick();
      expect(canSwitchTab(2, 3, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0047 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_4800
     * @tc.name      testCanSwitchTab0048
     * @tc.desc      Verify canSwitchTab(2, 3, false, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0048 begin');
      await delayTick();
      expect(canSwitchTab(2, 3, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0048 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_4900
     * @tc.name      testCanSwitchTab0049
     * @tc.desc      Verify canSwitchTab(-1, -1, true, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0049 begin');
      await delayTick();
      expect(canSwitchTab(-1, -1, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0049 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_5000
     * @tc.name      testCanSwitchTab0050
     * @tc.desc      Verify canSwitchTab(-1, -1, false, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0050 begin');
      await delayTick();
      expect(canSwitchTab(-1, -1, false, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0050 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_5100
     * @tc.name      testCanSwitchTab0051
     * @tc.desc      Verify canSwitchTab(-1, 0, true, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0051 begin');
      await delayTick();
      expect(canSwitchTab(-1, 0, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0051 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_5200
     * @tc.name      testCanSwitchTab0052
     * @tc.desc      Verify canSwitchTab(-1, 0, false, 3) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0052 begin');
      await delayTick();
      expect(canSwitchTab(-1, 0, false, 3)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0052 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_5300
     * @tc.name      testCanSwitchTab0053
     * @tc.desc      Verify canSwitchTab(-1, 1, true, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0053 begin');
      await delayTick();
      expect(canSwitchTab(-1, 1, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0053 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_5400
     * @tc.name      testCanSwitchTab0054
     * @tc.desc      Verify canSwitchTab(-1, 1, false, 3) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0054 begin');
      await delayTick();
      expect(canSwitchTab(-1, 1, false, 3)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0054 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_5500
     * @tc.name      testCanSwitchTab0055
     * @tc.desc      Verify canSwitchTab(-1, 3, true, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0055 begin');
      await delayTick();
      expect(canSwitchTab(-1, 3, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0055 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_5600
     * @tc.name      testCanSwitchTab0056
     * @tc.desc      Verify canSwitchTab(-1, 3, false, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0056 begin');
      await delayTick();
      expect(canSwitchTab(-1, 3, false, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0056 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_5700
     * @tc.name      testCanSwitchTab0057
     * @tc.desc      Verify canSwitchTab(0, -1, true, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0057 begin');
      await delayTick();
      expect(canSwitchTab(0, -1, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0057 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_5800
     * @tc.name      testCanSwitchTab0058
     * @tc.desc      Verify canSwitchTab(0, -1, false, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0058 begin');
      await delayTick();
      expect(canSwitchTab(0, -1, false, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0058 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_5900
     * @tc.name      testCanSwitchTab0059
     * @tc.desc      Verify canSwitchTab(0, 0, true, 3) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0059 begin');
      await delayTick();
      expect(canSwitchTab(0, 0, true, 3)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0059 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_6000
     * @tc.name      testCanSwitchTab0060
     * @tc.desc      Verify canSwitchTab(0, 0, false, 3) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0060 begin');
      await delayTick();
      expect(canSwitchTab(0, 0, false, 3)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0060 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_6100
     * @tc.name      testCanSwitchTab0061
     * @tc.desc      Verify canSwitchTab(0, 1, true, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0061 begin');
      await delayTick();
      expect(canSwitchTab(0, 1, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0061 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_6200
     * @tc.name      testCanSwitchTab0062
     * @tc.desc      Verify canSwitchTab(0, 1, false, 3) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0062 begin');
      await delayTick();
      expect(canSwitchTab(0, 1, false, 3)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0062 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_6300
     * @tc.name      testCanSwitchTab0063
     * @tc.desc      Verify canSwitchTab(0, 3, true, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0063 begin');
      await delayTick();
      expect(canSwitchTab(0, 3, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0063 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_6400
     * @tc.name      testCanSwitchTab0064
     * @tc.desc      Verify canSwitchTab(0, 3, false, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0064 begin');
      await delayTick();
      expect(canSwitchTab(0, 3, false, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0064 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_6500
     * @tc.name      testCanSwitchTab0065
     * @tc.desc      Verify canSwitchTab(2, -1, true, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0065 begin');
      await delayTick();
      expect(canSwitchTab(2, -1, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0065 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_6600
     * @tc.name      testCanSwitchTab0066
     * @tc.desc      Verify canSwitchTab(2, -1, false, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0066 begin');
      await delayTick();
      expect(canSwitchTab(2, -1, false, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0066 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_6700
     * @tc.name      testCanSwitchTab0067
     * @tc.desc      Verify canSwitchTab(2, 0, true, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0067 begin');
      await delayTick();
      expect(canSwitchTab(2, 0, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0067 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_6800
     * @tc.name      testCanSwitchTab0068
     * @tc.desc      Verify canSwitchTab(2, 0, false, 3) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0068 begin');
      await delayTick();
      expect(canSwitchTab(2, 0, false, 3)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0068 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_6900
     * @tc.name      testCanSwitchTab0069
     * @tc.desc      Verify canSwitchTab(2, 1, true, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0069 begin');
      await delayTick();
      expect(canSwitchTab(2, 1, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0069 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_7000
     * @tc.name      testCanSwitchTab0070
     * @tc.desc      Verify canSwitchTab(2, 1, false, 3) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0070 begin');
      await delayTick();
      expect(canSwitchTab(2, 1, false, 3)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0070 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_7100
     * @tc.name      testCanSwitchTab0071
     * @tc.desc      Verify canSwitchTab(2, 3, true, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0071 begin');
      await delayTick();
      expect(canSwitchTab(2, 3, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0071 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_7200
     * @tc.name      testCanSwitchTab0072
     * @tc.desc      Verify canSwitchTab(2, 3, false, 3) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSwitchTab0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0072 begin');
      await delayTick();
      expect(canSwitchTab(2, 3, false, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSwitchTab0072 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_7300
     * @tc.name      testFilterDemos0073
     * @tc.desc      Verify filter('', '') returns 9 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0073 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, '', '');
      expect(result.length).assertEqual(9);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('navigation,search,tabs,web,download,halfScreen,jump,sheet,prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0073 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_7400
     * @tc.name      testFilterDemos0074
     * @tc.desc      Verify filter('', 'atomic') returns 5 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0074 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'atomic', '');
      expect(result.length).assertEqual(5);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('navigation,search,tabs,web,halfScreen');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0074 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_7500
     * @tc.name      testFilterDemos0075
     * @tc.desc      Verify filter('', 'tabs') returns 1 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0075 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'tabs', '');
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('tabs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0075 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_7600
     * @tc.name      testFilterDemos0076
     * @tc.desc      Verify filter('', 'DOWNLOAD') returns 1 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0076 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'DOWNLOAD', '');
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('download');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0076 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_7700
     * @tc.name      testFilterDemos0077
     * @tc.desc      Verify filter('', ' ') returns 9 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0077 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, ' ', '');
      expect(result.length).assertEqual(9);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('navigation,search,tabs,web,download,halfScreen,jump,sheet,prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0077 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_7800
     * @tc.name      testFilterDemos0078
     * @tc.desc      Verify filter('', 'xyz') returns 0 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0078 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'xyz', '');
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0078 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_7900
     * @tc.name      testFilterDemos0079
     * @tc.desc      Verify filter('All', '') returns 9 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0079 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, '', 'All');
      expect(result.length).assertEqual(9);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('navigation,search,tabs,web,download,halfScreen,jump,sheet,prefs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0079 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DSWP2_8000
     * @tc.name      testFilterDemos0080
     * @tc.desc      Verify filter('All', 'atomic') returns 5 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterDemos0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0080 begin');
      await delayTick();
      const result = filterDemos(DEMO_ITEMS, 'atomic', 'All');
      expect(result.length).assertEqual(5);
      const keys: string = result.map((item) => item.key).join(',');
      expect(keys).assertEqual('navigation,search,tabs,web,halfScreen');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterDemos0080 end');
    })

  })
}
