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
import { DemoItem, DEMO_ITEMS, filterDemos, canSwitchTab, canPopNavStack } from '../../../main/ets/model/DemoLogic';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function DemoFilterGridMatrixCombinedPart2Test(): void {
  describe('DemoFlt2', () => {
    /**
     * @tc.number    SUB_ATOMIC_DFGP4_12400
     * @tc.name      testSwitchTabGrid0124
     * @tc.desc      Verify canSwitchTab(5, 0, false, 0) is false. Plus Verify canSwitchTab(5, 1, true, 0) is false. Plus Verify canSwitchTab(5, 1, false, 0) is false. Plus Verify canSwitchTab(5, 2, true, 0) is false. Plus Verify canSwitchTab(5, 2, false, 0) is false. Plus Verify canSwitchTab(5, 4, true, 0) is false. Plus Verify canSwitchTab(5, 4, false, 0) is false. Plus Verify canSwitchTab(5, 5, true, 0) is false. Plus Verify canSwitchTab(5, 5, false, 0) is false. Plus Verify canSwitchTab(-1, 2, true, 1) is false. Plus Verify canSwitchTab(-1, 2, false, 1) is false. Plus Verify canSwitchTab(-1, 4, true, 1) is false. Plus Verify canSwitchTab(-1, 4, false, 1) is false. Plus Verify canSwitchTab(-1, 5, true, 1) is false. Plus Verify canSwitchTab(-1, 5, false, 1) is false. Plus Verify canSwitchTab(0, 2, true, 1) is false. Plus Verify canSwitchTab(0, 2, false, 1) is false. Plus Verify canSwitchTab(0, 4, true, 1) is false. Plus Verify canSwitchTab(0, 4, false, 1) is false. Plus Verify canSwitchTab(0, 5, true, 1) is false. Plus Verify canSwitchTab(0, 5, false, 1) is false. Plus Verify canSwitchTab(1, -1, true, 1) is false. Plus Verify canSwitchTab(1, -1, false, 1) is false. Plus Verify canSwitchTab(1, 0, true, 1) is false. Plus Verify canSwitchTab(1, 0, false, 1) is true. Plus Verify canSwitchTab(1, 1, true, 1) is false. Plus Verify canSwitchTab(1, 1, false, 1) is false. Plus Verify canSwitchTab(1, 2, true, 1) is false. Plus Verify canSwitchTab(1, 2, false, 1) is false. Plus Verify canSwitchTab(1, 4, true, 1) is false. Plus Verify canSwitchTab(1, 4, false, 1) is false. Plus Verify canSwitchTab(1, 5, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0124 begin');
      await delayTick();
      expect(canSwitchTab(5, 0, false, 0)).assertEqual(false);
      {
      expect(canSwitchTab(5, 1, true, 0)).assertEqual(false);
      }
      {
      expect(canSwitchTab(5, 1, false, 0)).assertEqual(false);
      }
      {
      expect(canSwitchTab(5, 2, true, 0)).assertEqual(false);
      }
      {
      expect(canSwitchTab(5, 2, false, 0)).assertEqual(false);
      }
      {
      expect(canSwitchTab(5, 4, true, 0)).assertEqual(false);
      }
      {
      expect(canSwitchTab(5, 4, false, 0)).assertEqual(false);
      }
      {
      expect(canSwitchTab(5, 5, true, 0)).assertEqual(false);
      }
      {
      expect(canSwitchTab(5, 5, false, 0)).assertEqual(false);
      }
      {
      expect(canSwitchTab(-1, 2, true, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(-1, 2, false, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(-1, 4, true, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(-1, 4, false, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(-1, 5, true, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(-1, 5, false, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(0, 2, true, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(0, 2, false, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(0, 4, true, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(0, 4, false, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(0, 5, true, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(0, 5, false, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, -1, true, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, -1, false, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 0, true, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 0, false, 1)).assertEqual(true);
      }
      {
      expect(canSwitchTab(1, 1, true, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 1, false, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 2, true, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 2, false, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 4, true, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 4, false, 1)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 5, true, 1)).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0124 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP4_15600
     * @tc.name      testSwitchTabGrid0156
     * @tc.desc      Verify canSwitchTab(1, 5, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0156 begin');
      await delayTick();
      expect(canSwitchTab(1, 5, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0156 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP4_15700
     * @tc.name      testSwitchTabGrid0157
     * @tc.desc      Verify canSwitchTab(2, 2, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0157 begin');
      await delayTick();
      expect(canSwitchTab(2, 2, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0157 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP4_15800
     * @tc.name      testSwitchTabGrid0158
     * @tc.desc      Verify canSwitchTab(2, 2, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0158 begin');
      await delayTick();
      expect(canSwitchTab(2, 2, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0158 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP4_15900
     * @tc.name      testSwitchTabGrid0159
     * @tc.desc      Verify canSwitchTab(2, 4, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0159 begin');
      await delayTick();
      expect(canSwitchTab(2, 4, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0159 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP4_16000
     * @tc.name      testSwitchTabGrid0160
     * @tc.desc      Verify canSwitchTab(2, 4, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0160 begin');
      await delayTick();
      expect(canSwitchTab(2, 4, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0160 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_16100
     * @tc.name      testSwitchTabGrid0161
     * @tc.desc      Verify canSwitchTab(2, 5, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0161 begin');
      await delayTick();
      expect(canSwitchTab(2, 5, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0161 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_16200
     * @tc.name      testSwitchTabGrid0162
     * @tc.desc      Verify canSwitchTab(2, 5, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0162 begin');
      await delayTick();
      expect(canSwitchTab(2, 5, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0162 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_16300
     * @tc.name      testSwitchTabGrid0163
     * @tc.desc      Verify canSwitchTab(4, -1, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0163 begin');
      await delayTick();
      expect(canSwitchTab(4, -1, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0163 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_16400
     * @tc.name      testSwitchTabGrid0164
     * @tc.desc      Verify canSwitchTab(4, -1, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0164 begin');
      await delayTick();
      expect(canSwitchTab(4, -1, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0164 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_16500
     * @tc.name      testSwitchTabGrid0165
     * @tc.desc      Verify canSwitchTab(4, 0, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0165 begin');
      await delayTick();
      expect(canSwitchTab(4, 0, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0165 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_16600
     * @tc.name      testSwitchTabGrid0166
     * @tc.desc      Verify canSwitchTab(4, 0, false, 1) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0166 begin');
      await delayTick();
      expect(canSwitchTab(4, 0, false, 1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0166 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_16700
     * @tc.name      testSwitchTabGrid0167
     * @tc.desc      Verify canSwitchTab(4, 1, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0167 begin');
      await delayTick();
      expect(canSwitchTab(4, 1, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0167 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_16800
     * @tc.name      testSwitchTabGrid0168
     * @tc.desc      Verify canSwitchTab(4, 1, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0168 begin');
      await delayTick();
      expect(canSwitchTab(4, 1, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0168 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_16900
     * @tc.name      testSwitchTabGrid0169
     * @tc.desc      Verify canSwitchTab(4, 2, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0169 begin');
      await delayTick();
      expect(canSwitchTab(4, 2, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0169 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_17000
     * @tc.name      testSwitchTabGrid0170
     * @tc.desc      Verify canSwitchTab(4, 2, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0170 begin');
      await delayTick();
      expect(canSwitchTab(4, 2, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0170 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_17100
     * @tc.name      testSwitchTabGrid0171
     * @tc.desc      Verify canSwitchTab(4, 4, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0171 begin');
      await delayTick();
      expect(canSwitchTab(4, 4, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0171 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_17200
     * @tc.name      testSwitchTabGrid0172
     * @tc.desc      Verify canSwitchTab(4, 4, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0172 begin');
      await delayTick();
      expect(canSwitchTab(4, 4, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0172 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_17300
     * @tc.name      testSwitchTabGrid0173
     * @tc.desc      Verify canSwitchTab(4, 5, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0173 begin');
      await delayTick();
      expect(canSwitchTab(4, 5, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0173 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_17400
     * @tc.name      testSwitchTabGrid0174
     * @tc.desc      Verify canSwitchTab(4, 5, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0174 begin');
      await delayTick();
      expect(canSwitchTab(4, 5, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0174 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_17500
     * @tc.name      testSwitchTabGrid0175
     * @tc.desc      Verify canSwitchTab(5, -1, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0175 begin');
      await delayTick();
      expect(canSwitchTab(5, -1, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0175 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_17600
     * @tc.name      testSwitchTabGrid0176
     * @tc.desc      Verify canSwitchTab(5, -1, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0176 begin');
      await delayTick();
      expect(canSwitchTab(5, -1, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0176 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_17700
     * @tc.name      testSwitchTabGrid0177
     * @tc.desc      Verify canSwitchTab(5, 0, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0177 begin');
      await delayTick();
      expect(canSwitchTab(5, 0, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0177 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_17800
     * @tc.name      testSwitchTabGrid0178
     * @tc.desc      Verify canSwitchTab(5, 0, false, 1) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0178 begin');
      await delayTick();
      expect(canSwitchTab(5, 0, false, 1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0178 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_17900
     * @tc.name      testSwitchTabGrid0179
     * @tc.desc      Verify canSwitchTab(5, 1, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0179 begin');
      await delayTick();
      expect(canSwitchTab(5, 1, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0179 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_18000
     * @tc.name      testSwitchTabGrid0180
     * @tc.desc      Verify canSwitchTab(5, 1, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0180 begin');
      await delayTick();
      expect(canSwitchTab(5, 1, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0180 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_18100
     * @tc.name      testSwitchTabGrid0181
     * @tc.desc      Verify canSwitchTab(5, 2, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0181 begin');
      await delayTick();
      expect(canSwitchTab(5, 2, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0181 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_18200
     * @tc.name      testSwitchTabGrid0182
     * @tc.desc      Verify canSwitchTab(5, 2, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0182 begin');
      await delayTick();
      expect(canSwitchTab(5, 2, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0182 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_18300
     * @tc.name      testSwitchTabGrid0183
     * @tc.desc      Verify canSwitchTab(5, 4, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0183 begin');
      await delayTick();
      expect(canSwitchTab(5, 4, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0183 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_18400
     * @tc.name      testSwitchTabGrid0184
     * @tc.desc      Verify canSwitchTab(5, 4, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0184 begin');
      await delayTick();
      expect(canSwitchTab(5, 4, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0184 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_18500
     * @tc.name      testSwitchTabGrid0185
     * @tc.desc      Verify canSwitchTab(5, 5, true, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0185 begin');
      await delayTick();
      expect(canSwitchTab(5, 5, true, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0185 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_18600
     * @tc.name      testSwitchTabGrid0186
     * @tc.desc      Verify canSwitchTab(5, 5, false, 1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0186 begin');
      await delayTick();
      expect(canSwitchTab(5, 5, false, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0186 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_18700
     * @tc.name      testSwitchTabGrid0187
     * @tc.desc      Verify canSwitchTab(-1, -1, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0187 begin');
      await delayTick();
      expect(canSwitchTab(-1, -1, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0187 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_18800
     * @tc.name      testSwitchTabGrid0188
     * @tc.desc      Verify canSwitchTab(-1, -1, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0188 begin');
      await delayTick();
      expect(canSwitchTab(-1, -1, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0188 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_18900
     * @tc.name      testSwitchTabGrid0189
     * @tc.desc      Verify canSwitchTab(-1, 0, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0189 begin');
      await delayTick();
      expect(canSwitchTab(-1, 0, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0189 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_19000
     * @tc.name      testSwitchTabGrid0190
     * @tc.desc      Verify canSwitchTab(-1, 0, false, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0190 begin');
      await delayTick();
      expect(canSwitchTab(-1, 0, false, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0190 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_19100
     * @tc.name      testSwitchTabGrid0191
     * @tc.desc      Verify canSwitchTab(-1, 1, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0191 begin');
      await delayTick();
      expect(canSwitchTab(-1, 1, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0191 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_19200
     * @tc.name      testSwitchTabGrid0192
     * @tc.desc      Verify canSwitchTab(-1, 1, false, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0192 begin');
      await delayTick();
      expect(canSwitchTab(-1, 1, false, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0192 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_19300
     * @tc.name      testSwitchTabGrid0193
     * @tc.desc      Verify canSwitchTab(-1, 2, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0193 begin');
      await delayTick();
      expect(canSwitchTab(-1, 2, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0193 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_19400
     * @tc.name      testSwitchTabGrid0194
     * @tc.desc      Verify canSwitchTab(-1, 2, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0194 begin');
      await delayTick();
      expect(canSwitchTab(-1, 2, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0194 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_19500
     * @tc.name      testSwitchTabGrid0195
     * @tc.desc      Verify canSwitchTab(-1, 4, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0195 begin');
      await delayTick();
      expect(canSwitchTab(-1, 4, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0195 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_19600
     * @tc.name      testSwitchTabGrid0196
     * @tc.desc      Verify canSwitchTab(-1, 4, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0196 begin');
      await delayTick();
      expect(canSwitchTab(-1, 4, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0196 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_19700
     * @tc.name      testSwitchTabGrid0197
     * @tc.desc      Verify canSwitchTab(-1, 5, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0197 begin');
      await delayTick();
      expect(canSwitchTab(-1, 5, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0197 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_19800
     * @tc.name      testSwitchTabGrid0198
     * @tc.desc      Verify canSwitchTab(-1, 5, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0198 begin');
      await delayTick();
      expect(canSwitchTab(-1, 5, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0198 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_19900
     * @tc.name      testSwitchTabGrid0199
     * @tc.desc      Verify canSwitchTab(0, -1, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0199 begin');
      await delayTick();
      expect(canSwitchTab(0, -1, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0199 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP5_20000
     * @tc.name      testSwitchTabGrid0200
     * @tc.desc      Verify canSwitchTab(0, -1, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0200 begin');
      await delayTick();
      expect(canSwitchTab(0, -1, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0200 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_20100
     * @tc.name      testSwitchTabGrid0201
     * @tc.desc      Verify canSwitchTab(0, 0, true, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0201 begin');
      await delayTick();
      expect(canSwitchTab(0, 0, true, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0201 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_20200
     * @tc.name      testSwitchTabGrid0202
     * @tc.desc      Verify canSwitchTab(0, 0, false, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0202 begin');
      await delayTick();
      expect(canSwitchTab(0, 0, false, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0202 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_20300
     * @tc.name      testSwitchTabGrid0203
     * @tc.desc      Verify canSwitchTab(0, 1, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0203 begin');
      await delayTick();
      expect(canSwitchTab(0, 1, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0203 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_20400
     * @tc.name      testSwitchTabGrid0204
     * @tc.desc      Verify canSwitchTab(0, 1, false, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0204 begin');
      await delayTick();
      expect(canSwitchTab(0, 1, false, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0204 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_20500
     * @tc.name      testSwitchTabGrid0205
     * @tc.desc      Verify canSwitchTab(0, 2, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0205 begin');
      await delayTick();
      expect(canSwitchTab(0, 2, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0205 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_20600
     * @tc.name      testSwitchTabGrid0206
     * @tc.desc      Verify canSwitchTab(0, 2, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0206 begin');
      await delayTick();
      expect(canSwitchTab(0, 2, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0206 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_20700
     * @tc.name      testSwitchTabGrid0207
     * @tc.desc      Verify canSwitchTab(0, 4, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0207 begin');
      await delayTick();
      expect(canSwitchTab(0, 4, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0207 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_20800
     * @tc.name      testSwitchTabGrid0208
     * @tc.desc      Verify canSwitchTab(0, 4, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0208 begin');
      await delayTick();
      expect(canSwitchTab(0, 4, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0208 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_20900
     * @tc.name      testSwitchTabGrid0209
     * @tc.desc      Verify canSwitchTab(0, 5, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0209 begin');
      await delayTick();
      expect(canSwitchTab(0, 5, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0209 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_21000
     * @tc.name      testSwitchTabGrid0210
     * @tc.desc      Verify canSwitchTab(0, 5, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0210 begin');
      await delayTick();
      expect(canSwitchTab(0, 5, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0210 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_21100
     * @tc.name      testSwitchTabGrid0211
     * @tc.desc      Verify canSwitchTab(1, -1, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0211 begin');
      await delayTick();
      expect(canSwitchTab(1, -1, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0211 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_21200
     * @tc.name      testSwitchTabGrid0212
     * @tc.desc      Verify canSwitchTab(1, -1, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0212 begin');
      await delayTick();
      expect(canSwitchTab(1, -1, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0212 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_21300
     * @tc.name      testSwitchTabGrid0213
     * @tc.desc      Verify canSwitchTab(1, 0, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0213 begin');
      await delayTick();
      expect(canSwitchTab(1, 0, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0213 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_21400
     * @tc.name      testSwitchTabGrid0214
     * @tc.desc      Verify canSwitchTab(1, 0, false, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0214 begin');
      await delayTick();
      expect(canSwitchTab(1, 0, false, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0214 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_21500
     * @tc.name      testSwitchTabGrid0215
     * @tc.desc      Verify canSwitchTab(1, 1, true, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0215 begin');
      await delayTick();
      expect(canSwitchTab(1, 1, true, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0215 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_21600
     * @tc.name      testSwitchTabGrid0216
     * @tc.desc      Verify canSwitchTab(1, 1, false, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0216 begin');
      await delayTick();
      expect(canSwitchTab(1, 1, false, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0216 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_21700
     * @tc.name      testSwitchTabGrid0217
     * @tc.desc      Verify canSwitchTab(1, 2, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0217 begin');
      await delayTick();
      expect(canSwitchTab(1, 2, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0217 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_21800
     * @tc.name      testSwitchTabGrid0218
     * @tc.desc      Verify canSwitchTab(1, 2, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0218 begin');
      await delayTick();
      expect(canSwitchTab(1, 2, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0218 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_21900
     * @tc.name      testSwitchTabGrid0219
     * @tc.desc      Verify canSwitchTab(1, 4, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0219 begin');
      await delayTick();
      expect(canSwitchTab(1, 4, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0219 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_22000
     * @tc.name      testSwitchTabGrid0220
     * @tc.desc      Verify canSwitchTab(1, 4, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0220 begin');
      await delayTick();
      expect(canSwitchTab(1, 4, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0220 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_22100
     * @tc.name      testSwitchTabGrid0221
     * @tc.desc      Verify canSwitchTab(1, 5, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0221 begin');
      await delayTick();
      expect(canSwitchTab(1, 5, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0221 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_22200
     * @tc.name      testSwitchTabGrid0222
     * @tc.desc      Verify canSwitchTab(1, 5, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0222 begin');
      await delayTick();
      expect(canSwitchTab(1, 5, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0222 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_22300
     * @tc.name      testSwitchTabGrid0223
     * @tc.desc      Verify canSwitchTab(2, -1, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0223 begin');
      await delayTick();
      expect(canSwitchTab(2, -1, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0223 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_22400
     * @tc.name      testSwitchTabGrid0224
     * @tc.desc      Verify canSwitchTab(2, -1, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0224 begin');
      await delayTick();
      expect(canSwitchTab(2, -1, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0224 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_22500
     * @tc.name      testSwitchTabGrid0225
     * @tc.desc      Verify canSwitchTab(2, 0, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0225 begin');
      await delayTick();
      expect(canSwitchTab(2, 0, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0225 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_22600
     * @tc.name      testSwitchTabGrid0226
     * @tc.desc      Verify canSwitchTab(2, 0, false, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0226 begin');
      await delayTick();
      expect(canSwitchTab(2, 0, false, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0226 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_22700
     * @tc.name      testSwitchTabGrid0227
     * @tc.desc      Verify canSwitchTab(2, 1, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0227 begin');
      await delayTick();
      expect(canSwitchTab(2, 1, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0227 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_22800
     * @tc.name      testSwitchTabGrid0228
     * @tc.desc      Verify canSwitchTab(2, 1, false, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0228 begin');
      await delayTick();
      expect(canSwitchTab(2, 1, false, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0228 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_22900
     * @tc.name      testSwitchTabGrid0229
     * @tc.desc      Verify canSwitchTab(2, 2, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0229 begin');
      await delayTick();
      expect(canSwitchTab(2, 2, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0229 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_23000
     * @tc.name      testSwitchTabGrid0230
     * @tc.desc      Verify canSwitchTab(2, 2, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0230 begin');
      await delayTick();
      expect(canSwitchTab(2, 2, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0230 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_23100
     * @tc.name      testSwitchTabGrid0231
     * @tc.desc      Verify canSwitchTab(2, 4, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0231 begin');
      await delayTick();
      expect(canSwitchTab(2, 4, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0231 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_23200
     * @tc.name      testSwitchTabGrid0232
     * @tc.desc      Verify canSwitchTab(2, 4, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0232 begin');
      await delayTick();
      expect(canSwitchTab(2, 4, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0232 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_23300
     * @tc.name      testSwitchTabGrid0233
     * @tc.desc      Verify canSwitchTab(2, 5, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0233 begin');
      await delayTick();
      expect(canSwitchTab(2, 5, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0233 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_23400
     * @tc.name      testSwitchTabGrid0234
     * @tc.desc      Verify canSwitchTab(2, 5, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0234 begin');
      await delayTick();
      expect(canSwitchTab(2, 5, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0234 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_23500
     * @tc.name      testSwitchTabGrid0235
     * @tc.desc      Verify canSwitchTab(4, -1, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0235 begin');
      await delayTick();
      expect(canSwitchTab(4, -1, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0235 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_23600
     * @tc.name      testSwitchTabGrid0236
     * @tc.desc      Verify canSwitchTab(4, -1, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0236 begin');
      await delayTick();
      expect(canSwitchTab(4, -1, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0236 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_23700
     * @tc.name      testSwitchTabGrid0237
     * @tc.desc      Verify canSwitchTab(4, 0, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0237 begin');
      await delayTick();
      expect(canSwitchTab(4, 0, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0237 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_23800
     * @tc.name      testSwitchTabGrid0238
     * @tc.desc      Verify canSwitchTab(4, 0, false, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0238 begin');
      await delayTick();
      expect(canSwitchTab(4, 0, false, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0238 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_23900
     * @tc.name      testSwitchTabGrid0239
     * @tc.desc      Verify canSwitchTab(4, 1, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0239 begin');
      await delayTick();
      expect(canSwitchTab(4, 1, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0239 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP6_24000
     * @tc.name      testSwitchTabGrid0240
     * @tc.desc      Verify canSwitchTab(4, 1, false, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0240 begin');
      await delayTick();
      expect(canSwitchTab(4, 1, false, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0240 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_24100
     * @tc.name      testSwitchTabGrid0241
     * @tc.desc      Verify canSwitchTab(4, 2, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0241 begin');
      await delayTick();
      expect(canSwitchTab(4, 2, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0241 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_24200
     * @tc.name      testSwitchTabGrid0242
     * @tc.desc      Verify canSwitchTab(4, 2, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0242 begin');
      await delayTick();
      expect(canSwitchTab(4, 2, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0242 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_24300
     * @tc.name      testSwitchTabGrid0243
     * @tc.desc      Verify canSwitchTab(4, 4, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0243 begin');
      await delayTick();
      expect(canSwitchTab(4, 4, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0243 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_24400
     * @tc.name      testSwitchTabGrid0244
     * @tc.desc      Verify canSwitchTab(4, 4, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0244 begin');
      await delayTick();
      expect(canSwitchTab(4, 4, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0244 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_24500
     * @tc.name      testSwitchTabGrid0245
     * @tc.desc      Verify canSwitchTab(4, 5, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0245 begin');
      await delayTick();
      expect(canSwitchTab(4, 5, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0245 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_24600
     * @tc.name      testSwitchTabGrid0246
     * @tc.desc      Verify canSwitchTab(4, 5, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0246 begin');
      await delayTick();
      expect(canSwitchTab(4, 5, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0246 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_24700
     * @tc.name      testSwitchTabGrid0247
     * @tc.desc      Verify canSwitchTab(5, -1, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0247 begin');
      await delayTick();
      expect(canSwitchTab(5, -1, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0247 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_24800
     * @tc.name      testSwitchTabGrid0248
     * @tc.desc      Verify canSwitchTab(5, -1, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0248 begin');
      await delayTick();
      expect(canSwitchTab(5, -1, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0248 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_24900
     * @tc.name      testSwitchTabGrid0249
     * @tc.desc      Verify canSwitchTab(5, 0, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0249 begin');
      await delayTick();
      expect(canSwitchTab(5, 0, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0249 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_25000
     * @tc.name      testSwitchTabGrid0250
     * @tc.desc      Verify canSwitchTab(5, 0, false, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0250 begin');
      await delayTick();
      expect(canSwitchTab(5, 0, false, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0250 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_25100
     * @tc.name      testSwitchTabGrid0251
     * @tc.desc      Verify canSwitchTab(5, 1, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0251 begin');
      await delayTick();
      expect(canSwitchTab(5, 1, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0251 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_25200
     * @tc.name      testSwitchTabGrid0252
     * @tc.desc      Verify canSwitchTab(5, 1, false, 2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0252 begin');
      await delayTick();
      expect(canSwitchTab(5, 1, false, 2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0252 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_25300
     * @tc.name      testSwitchTabGrid0253
     * @tc.desc      Verify canSwitchTab(5, 2, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0253 begin');
      await delayTick();
      expect(canSwitchTab(5, 2, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0253 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_25400
     * @tc.name      testSwitchTabGrid0254
     * @tc.desc      Verify canSwitchTab(5, 2, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0254 begin');
      await delayTick();
      expect(canSwitchTab(5, 2, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0254 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_25500
     * @tc.name      testSwitchTabGrid0255
     * @tc.desc      Verify canSwitchTab(5, 4, true, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0255 begin');
      await delayTick();
      expect(canSwitchTab(5, 4, true, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0255 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_25600
     * @tc.name      testSwitchTabGrid0256
     * @tc.desc      Verify canSwitchTab(5, 4, false, 2) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0256 begin');
      await delayTick();
      expect(canSwitchTab(5, 4, false, 2)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0256 end');
    })

  })
}
