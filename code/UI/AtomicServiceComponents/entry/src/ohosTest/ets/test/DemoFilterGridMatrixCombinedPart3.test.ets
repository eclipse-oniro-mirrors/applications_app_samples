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

export default function DemoFilterGridMatrixCombinedPart3Test(): void {
  describe('DemoFlt3', () => {
    /**
     * @tc.number    SUB_ATOMIC_DFGP7_25700
     * @tc.name      testSwitchTabGrid0257
     * @tc.desc      Verify canSwitchTab(5, 5, true, 2) is false. Plus Verify canSwitchTab(5, 5, false, 2) is false. Plus Verify canSwitchTab(-1, 2, true, 3) is false. Plus Verify canSwitchTab(-1, 2, false, 3) is true. Plus Verify canSwitchTab(-1, 4, true, 3) is false. Plus Verify canSwitchTab(-1, 4, false, 3) is false. Plus Verify canSwitchTab(-1, 5, true, 3) is false. Plus Verify canSwitchTab(-1, 5, false, 3) is false. Plus Verify canSwitchTab(0, 2, true, 3) is false. Plus Verify canSwitchTab(0, 2, false, 3) is true. Plus Verify canSwitchTab(0, 4, true, 3) is false. Plus Verify canSwitchTab(0, 4, false, 3) is false. Plus Verify canSwitchTab(0, 5, true, 3) is false. Plus Verify canSwitchTab(0, 5, false, 3) is false. Plus Verify canSwitchTab(1, -1, true, 3) is false. Plus Verify canSwitchTab(1, -1, false, 3) is false. Plus Verify canSwitchTab(1, 0, true, 3) is false. Plus Verify canSwitchTab(1, 0, false, 3) is true. Plus Verify canSwitchTab(1, 1, true, 3) is true. Plus Verify canSwitchTab(1, 1, false, 3) is true. Plus Verify canSwitchTab(1, 2, true, 3) is false. Plus Verify canSwitchTab(1, 2, false, 3) is true. Plus Verify canSwitchTab(1, 4, true, 3) is false. Plus Verify canSwitchTab(1, 4, false, 3) is false. Plus Verify canSwitchTab(1, 5, true, 3) is false. Plus Verify canSwitchTab(1, 5, false, 3) is false. Plus Verify canSwitchTab(2, 2, true, 3) is true. Plus Verify canSwitchTab(2, 2, false, 3) is true. Plus Verify canSwitchTab(2, 4, true, 3) is false. Plus Verify canSwitchTab(2, 4, false, 3) is false. Plus Verify canSwitchTab(2, 5, true, 3) is false. Plus Verify canSwitchTab(2, 5, false, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0257 begin');
      await delayTick();
      expect(canSwitchTab(5, 5, true, 2)).assertEqual(false);
      {
      expect(canSwitchTab(5, 5, false, 2)).assertEqual(false);
      }
      {
      expect(canSwitchTab(-1, 2, true, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(-1, 2, false, 3)).assertEqual(true);
      }
      {
      expect(canSwitchTab(-1, 4, true, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(-1, 4, false, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(-1, 5, true, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(-1, 5, false, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(0, 2, true, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(0, 2, false, 3)).assertEqual(true);
      }
      {
      expect(canSwitchTab(0, 4, true, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(0, 4, false, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(0, 5, true, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(0, 5, false, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, -1, true, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, -1, false, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 0, true, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 0, false, 3)).assertEqual(true);
      }
      {
      expect(canSwitchTab(1, 1, true, 3)).assertEqual(true);
      }
      {
      expect(canSwitchTab(1, 1, false, 3)).assertEqual(true);
      }
      {
      expect(canSwitchTab(1, 2, true, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 2, false, 3)).assertEqual(true);
      }
      {
      expect(canSwitchTab(1, 4, true, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 4, false, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 5, true, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(1, 5, false, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(2, 2, true, 3)).assertEqual(true);
      }
      {
      expect(canSwitchTab(2, 2, false, 3)).assertEqual(true);
      }
      {
      expect(canSwitchTab(2, 4, true, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(2, 4, false, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(2, 5, true, 3)).assertEqual(false);
      }
      {
      expect(canSwitchTab(2, 5, false, 3)).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0257 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_28900
     * @tc.name      testSwitchTabGrid0289
     * @tc.desc      Verify canSwitchTab(4, -1, true, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0289 begin');
      await delayTick();
      expect(canSwitchTab(4, -1, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0289 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_29000
     * @tc.name      testSwitchTabGrid0290
     * @tc.desc      Verify canSwitchTab(4, -1, false, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0290 begin');
      await delayTick();
      expect(canSwitchTab(4, -1, false, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0290 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_29100
     * @tc.name      testSwitchTabGrid0291
     * @tc.desc      Verify canSwitchTab(4, 0, true, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0291 begin');
      await delayTick();
      expect(canSwitchTab(4, 0, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0291 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_29200
     * @tc.name      testSwitchTabGrid0292
     * @tc.desc      Verify canSwitchTab(4, 0, false, 3) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0292 begin');
      await delayTick();
      expect(canSwitchTab(4, 0, false, 3)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0292 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_29300
     * @tc.name      testSwitchTabGrid0293
     * @tc.desc      Verify canSwitchTab(4, 1, true, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0293 begin');
      await delayTick();
      expect(canSwitchTab(4, 1, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0293 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_29400
     * @tc.name      testSwitchTabGrid0294
     * @tc.desc      Verify canSwitchTab(4, 1, false, 3) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0294 begin');
      await delayTick();
      expect(canSwitchTab(4, 1, false, 3)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0294 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_29500
     * @tc.name      testSwitchTabGrid0295
     * @tc.desc      Verify canSwitchTab(4, 2, true, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0295 begin');
      await delayTick();
      expect(canSwitchTab(4, 2, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0295 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_29600
     * @tc.name      testSwitchTabGrid0296
     * @tc.desc      Verify canSwitchTab(4, 2, false, 3) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0296 begin');
      await delayTick();
      expect(canSwitchTab(4, 2, false, 3)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0296 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_29700
     * @tc.name      testSwitchTabGrid0297
     * @tc.desc      Verify canSwitchTab(4, 4, true, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0297 begin');
      await delayTick();
      expect(canSwitchTab(4, 4, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0297 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_29800
     * @tc.name      testSwitchTabGrid0298
     * @tc.desc      Verify canSwitchTab(4, 4, false, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0298 begin');
      await delayTick();
      expect(canSwitchTab(4, 4, false, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0298 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_29900
     * @tc.name      testSwitchTabGrid0299
     * @tc.desc      Verify canSwitchTab(4, 5, true, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0299 begin');
      await delayTick();
      expect(canSwitchTab(4, 5, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0299 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_30000
     * @tc.name      testSwitchTabGrid0300
     * @tc.desc      Verify canSwitchTab(4, 5, false, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0300 begin');
      await delayTick();
      expect(canSwitchTab(4, 5, false, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0300 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_30100
     * @tc.name      testSwitchTabGrid0301
     * @tc.desc      Verify canSwitchTab(5, -1, true, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0301 begin');
      await delayTick();
      expect(canSwitchTab(5, -1, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0301 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_30200
     * @tc.name      testSwitchTabGrid0302
     * @tc.desc      Verify canSwitchTab(5, -1, false, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0302 begin');
      await delayTick();
      expect(canSwitchTab(5, -1, false, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0302 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_30300
     * @tc.name      testSwitchTabGrid0303
     * @tc.desc      Verify canSwitchTab(5, 0, true, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0303 begin');
      await delayTick();
      expect(canSwitchTab(5, 0, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0303 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_30400
     * @tc.name      testSwitchTabGrid0304
     * @tc.desc      Verify canSwitchTab(5, 0, false, 3) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0304 begin');
      await delayTick();
      expect(canSwitchTab(5, 0, false, 3)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0304 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_30500
     * @tc.name      testSwitchTabGrid0305
     * @tc.desc      Verify canSwitchTab(5, 1, true, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0305 begin');
      await delayTick();
      expect(canSwitchTab(5, 1, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0305 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_30600
     * @tc.name      testSwitchTabGrid0306
     * @tc.desc      Verify canSwitchTab(5, 1, false, 3) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0306 begin');
      await delayTick();
      expect(canSwitchTab(5, 1, false, 3)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0306 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_30700
     * @tc.name      testSwitchTabGrid0307
     * @tc.desc      Verify canSwitchTab(5, 2, true, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0307 begin');
      await delayTick();
      expect(canSwitchTab(5, 2, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0307 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_30800
     * @tc.name      testSwitchTabGrid0308
     * @tc.desc      Verify canSwitchTab(5, 2, false, 3) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0308 begin');
      await delayTick();
      expect(canSwitchTab(5, 2, false, 3)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0308 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_30900
     * @tc.name      testSwitchTabGrid0309
     * @tc.desc      Verify canSwitchTab(5, 4, true, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0309 begin');
      await delayTick();
      expect(canSwitchTab(5, 4, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0309 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_31000
     * @tc.name      testSwitchTabGrid0310
     * @tc.desc      Verify canSwitchTab(5, 4, false, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0310 begin');
      await delayTick();
      expect(canSwitchTab(5, 4, false, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0310 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_31100
     * @tc.name      testSwitchTabGrid0311
     * @tc.desc      Verify canSwitchTab(5, 5, true, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0311 begin');
      await delayTick();
      expect(canSwitchTab(5, 5, true, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0311 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_31200
     * @tc.name      testSwitchTabGrid0312
     * @tc.desc      Verify canSwitchTab(5, 5, false, 3) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0312 begin');
      await delayTick();
      expect(canSwitchTab(5, 5, false, 3)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0312 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_31300
     * @tc.name      testSwitchTabGrid0313
     * @tc.desc      Verify canSwitchTab(-1, -1, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0313 begin');
      await delayTick();
      expect(canSwitchTab(-1, -1, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0313 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_31400
     * @tc.name      testSwitchTabGrid0314
     * @tc.desc      Verify canSwitchTab(-1, -1, false, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0314 begin');
      await delayTick();
      expect(canSwitchTab(-1, -1, false, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0314 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_31500
     * @tc.name      testSwitchTabGrid0315
     * @tc.desc      Verify canSwitchTab(-1, 0, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0315 begin');
      await delayTick();
      expect(canSwitchTab(-1, 0, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0315 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_31600
     * @tc.name      testSwitchTabGrid0316
     * @tc.desc      Verify canSwitchTab(-1, 0, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0316 begin');
      await delayTick();
      expect(canSwitchTab(-1, 0, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0316 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_31700
     * @tc.name      testSwitchTabGrid0317
     * @tc.desc      Verify canSwitchTab(-1, 1, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0317 begin');
      await delayTick();
      expect(canSwitchTab(-1, 1, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0317 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_31800
     * @tc.name      testSwitchTabGrid0318
     * @tc.desc      Verify canSwitchTab(-1, 1, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0318 begin');
      await delayTick();
      expect(canSwitchTab(-1, 1, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0318 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_31900
     * @tc.name      testSwitchTabGrid0319
     * @tc.desc      Verify canSwitchTab(-1, 2, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0319 begin');
      await delayTick();
      expect(canSwitchTab(-1, 2, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0319 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP8_32000
     * @tc.name      testSwitchTabGrid0320
     * @tc.desc      Verify canSwitchTab(-1, 2, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0320 begin');
      await delayTick();
      expect(canSwitchTab(-1, 2, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0320 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_32100
     * @tc.name      testSwitchTabGrid0321
     * @tc.desc      Verify canSwitchTab(-1, 4, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0321 begin');
      await delayTick();
      expect(canSwitchTab(-1, 4, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0321 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_32200
     * @tc.name      testSwitchTabGrid0322
     * @tc.desc      Verify canSwitchTab(-1, 4, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0322 begin');
      await delayTick();
      expect(canSwitchTab(-1, 4, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0322 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_32300
     * @tc.name      testSwitchTabGrid0323
     * @tc.desc      Verify canSwitchTab(-1, 5, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0323 begin');
      await delayTick();
      expect(canSwitchTab(-1, 5, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0323 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_32400
     * @tc.name      testSwitchTabGrid0324
     * @tc.desc      Verify canSwitchTab(-1, 5, false, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0324 begin');
      await delayTick();
      expect(canSwitchTab(-1, 5, false, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0324 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_32500
     * @tc.name      testSwitchTabGrid0325
     * @tc.desc      Verify canSwitchTab(0, -1, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0325 begin');
      await delayTick();
      expect(canSwitchTab(0, -1, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0325 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_32600
     * @tc.name      testSwitchTabGrid0326
     * @tc.desc      Verify canSwitchTab(0, -1, false, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0326 begin');
      await delayTick();
      expect(canSwitchTab(0, -1, false, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0326 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_32700
     * @tc.name      testSwitchTabGrid0327
     * @tc.desc      Verify canSwitchTab(0, 0, true, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0327 begin');
      await delayTick();
      expect(canSwitchTab(0, 0, true, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0327 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_32800
     * @tc.name      testSwitchTabGrid0328
     * @tc.desc      Verify canSwitchTab(0, 0, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0328 begin');
      await delayTick();
      expect(canSwitchTab(0, 0, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0328 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_32900
     * @tc.name      testSwitchTabGrid0329
     * @tc.desc      Verify canSwitchTab(0, 1, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0329 begin');
      await delayTick();
      expect(canSwitchTab(0, 1, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0329 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_33000
     * @tc.name      testSwitchTabGrid0330
     * @tc.desc      Verify canSwitchTab(0, 1, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0330 begin');
      await delayTick();
      expect(canSwitchTab(0, 1, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0330 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_33100
     * @tc.name      testSwitchTabGrid0331
     * @tc.desc      Verify canSwitchTab(0, 2, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0331 begin');
      await delayTick();
      expect(canSwitchTab(0, 2, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0331 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_33200
     * @tc.name      testSwitchTabGrid0332
     * @tc.desc      Verify canSwitchTab(0, 2, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0332 begin');
      await delayTick();
      expect(canSwitchTab(0, 2, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0332 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_33300
     * @tc.name      testSwitchTabGrid0333
     * @tc.desc      Verify canSwitchTab(0, 4, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0333 begin');
      await delayTick();
      expect(canSwitchTab(0, 4, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0333 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_33400
     * @tc.name      testSwitchTabGrid0334
     * @tc.desc      Verify canSwitchTab(0, 4, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0334 begin');
      await delayTick();
      expect(canSwitchTab(0, 4, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0334 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_33500
     * @tc.name      testSwitchTabGrid0335
     * @tc.desc      Verify canSwitchTab(0, 5, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0335 begin');
      await delayTick();
      expect(canSwitchTab(0, 5, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0335 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_33600
     * @tc.name      testSwitchTabGrid0336
     * @tc.desc      Verify canSwitchTab(0, 5, false, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0336 begin');
      await delayTick();
      expect(canSwitchTab(0, 5, false, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0336 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_33700
     * @tc.name      testSwitchTabGrid0337
     * @tc.desc      Verify canSwitchTab(1, -1, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0337 begin');
      await delayTick();
      expect(canSwitchTab(1, -1, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0337 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_33800
     * @tc.name      testSwitchTabGrid0338
     * @tc.desc      Verify canSwitchTab(1, -1, false, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0338 begin');
      await delayTick();
      expect(canSwitchTab(1, -1, false, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0338 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_33900
     * @tc.name      testSwitchTabGrid0339
     * @tc.desc      Verify canSwitchTab(1, 0, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0339 begin');
      await delayTick();
      expect(canSwitchTab(1, 0, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0339 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_34000
     * @tc.name      testSwitchTabGrid0340
     * @tc.desc      Verify canSwitchTab(1, 0, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0340 begin');
      await delayTick();
      expect(canSwitchTab(1, 0, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0340 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_34100
     * @tc.name      testSwitchTabGrid0341
     * @tc.desc      Verify canSwitchTab(1, 1, true, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0341 begin');
      await delayTick();
      expect(canSwitchTab(1, 1, true, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0341 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_34200
     * @tc.name      testSwitchTabGrid0342
     * @tc.desc      Verify canSwitchTab(1, 1, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0342 begin');
      await delayTick();
      expect(canSwitchTab(1, 1, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0342 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_34300
     * @tc.name      testSwitchTabGrid0343
     * @tc.desc      Verify canSwitchTab(1, 2, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0343 begin');
      await delayTick();
      expect(canSwitchTab(1, 2, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0343 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_34400
     * @tc.name      testSwitchTabGrid0344
     * @tc.desc      Verify canSwitchTab(1, 2, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0344 begin');
      await delayTick();
      expect(canSwitchTab(1, 2, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0344 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_34500
     * @tc.name      testSwitchTabGrid0345
     * @tc.desc      Verify canSwitchTab(1, 4, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0345 begin');
      await delayTick();
      expect(canSwitchTab(1, 4, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0345 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_34600
     * @tc.name      testSwitchTabGrid0346
     * @tc.desc      Verify canSwitchTab(1, 4, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0346 begin');
      await delayTick();
      expect(canSwitchTab(1, 4, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0346 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_34700
     * @tc.name      testSwitchTabGrid0347
     * @tc.desc      Verify canSwitchTab(1, 5, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0347 begin');
      await delayTick();
      expect(canSwitchTab(1, 5, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0347 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_34800
     * @tc.name      testSwitchTabGrid0348
     * @tc.desc      Verify canSwitchTab(1, 5, false, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0348 begin');
      await delayTick();
      expect(canSwitchTab(1, 5, false, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0348 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_34900
     * @tc.name      testSwitchTabGrid0349
     * @tc.desc      Verify canSwitchTab(2, -1, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0349 begin');
      await delayTick();
      expect(canSwitchTab(2, -1, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0349 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_35000
     * @tc.name      testSwitchTabGrid0350
     * @tc.desc      Verify canSwitchTab(2, -1, false, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0350 begin');
      await delayTick();
      expect(canSwitchTab(2, -1, false, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0350 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_35100
     * @tc.name      testSwitchTabGrid0351
     * @tc.desc      Verify canSwitchTab(2, 0, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0351 begin');
      await delayTick();
      expect(canSwitchTab(2, 0, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0351 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_35200
     * @tc.name      testSwitchTabGrid0352
     * @tc.desc      Verify canSwitchTab(2, 0, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0352 begin');
      await delayTick();
      expect(canSwitchTab(2, 0, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0352 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_35300
     * @tc.name      testSwitchTabGrid0353
     * @tc.desc      Verify canSwitchTab(2, 1, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0353 begin');
      await delayTick();
      expect(canSwitchTab(2, 1, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0353 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_35400
     * @tc.name      testSwitchTabGrid0354
     * @tc.desc      Verify canSwitchTab(2, 1, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0354 begin');
      await delayTick();
      expect(canSwitchTab(2, 1, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0354 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_35500
     * @tc.name      testSwitchTabGrid0355
     * @tc.desc      Verify canSwitchTab(2, 2, true, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0355 begin');
      await delayTick();
      expect(canSwitchTab(2, 2, true, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0355 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_35600
     * @tc.name      testSwitchTabGrid0356
     * @tc.desc      Verify canSwitchTab(2, 2, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0356 begin');
      await delayTick();
      expect(canSwitchTab(2, 2, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0356 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_35700
     * @tc.name      testSwitchTabGrid0357
     * @tc.desc      Verify canSwitchTab(2, 4, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0357 begin');
      await delayTick();
      expect(canSwitchTab(2, 4, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0357 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_35800
     * @tc.name      testSwitchTabGrid0358
     * @tc.desc      Verify canSwitchTab(2, 4, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0358 begin');
      await delayTick();
      expect(canSwitchTab(2, 4, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0358 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_35900
     * @tc.name      testSwitchTabGrid0359
     * @tc.desc      Verify canSwitchTab(2, 5, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0359 begin');
      await delayTick();
      expect(canSwitchTab(2, 5, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0359 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP9_36000
     * @tc.name      testSwitchTabGrid0360
     * @tc.desc      Verify canSwitchTab(2, 5, false, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0360 begin');
      await delayTick();
      expect(canSwitchTab(2, 5, false, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0360 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_36100
     * @tc.name      testSwitchTabGrid0361
     * @tc.desc      Verify canSwitchTab(4, -1, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0361 begin');
      await delayTick();
      expect(canSwitchTab(4, -1, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0361 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_36200
     * @tc.name      testSwitchTabGrid0362
     * @tc.desc      Verify canSwitchTab(4, -1, false, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0362 begin');
      await delayTick();
      expect(canSwitchTab(4, -1, false, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0362 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_36300
     * @tc.name      testSwitchTabGrid0363
     * @tc.desc      Verify canSwitchTab(4, 0, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0363 begin');
      await delayTick();
      expect(canSwitchTab(4, 0, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0363 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_36400
     * @tc.name      testSwitchTabGrid0364
     * @tc.desc      Verify canSwitchTab(4, 0, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0364 begin');
      await delayTick();
      expect(canSwitchTab(4, 0, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0364 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_36500
     * @tc.name      testSwitchTabGrid0365
     * @tc.desc      Verify canSwitchTab(4, 1, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0365 begin');
      await delayTick();
      expect(canSwitchTab(4, 1, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0365 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_36600
     * @tc.name      testSwitchTabGrid0366
     * @tc.desc      Verify canSwitchTab(4, 1, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0366 begin');
      await delayTick();
      expect(canSwitchTab(4, 1, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0366 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_36700
     * @tc.name      testSwitchTabGrid0367
     * @tc.desc      Verify canSwitchTab(4, 2, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0367 begin');
      await delayTick();
      expect(canSwitchTab(4, 2, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0367 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_36800
     * @tc.name      testSwitchTabGrid0368
     * @tc.desc      Verify canSwitchTab(4, 2, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0368 begin');
      await delayTick();
      expect(canSwitchTab(4, 2, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0368 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_36900
     * @tc.name      testSwitchTabGrid0369
     * @tc.desc      Verify canSwitchTab(4, 4, true, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0369 begin');
      await delayTick();
      expect(canSwitchTab(4, 4, true, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0369 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_37000
     * @tc.name      testSwitchTabGrid0370
     * @tc.desc      Verify canSwitchTab(4, 4, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0370 begin');
      await delayTick();
      expect(canSwitchTab(4, 4, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0370 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_37100
     * @tc.name      testSwitchTabGrid0371
     * @tc.desc      Verify canSwitchTab(4, 5, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0371 begin');
      await delayTick();
      expect(canSwitchTab(4, 5, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0371 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_37200
     * @tc.name      testSwitchTabGrid0372
     * @tc.desc      Verify canSwitchTab(4, 5, false, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0372 begin');
      await delayTick();
      expect(canSwitchTab(4, 5, false, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0372 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_37300
     * @tc.name      testSwitchTabGrid0373
     * @tc.desc      Verify canSwitchTab(5, -1, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0373 begin');
      await delayTick();
      expect(canSwitchTab(5, -1, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0373 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_37400
     * @tc.name      testSwitchTabGrid0374
     * @tc.desc      Verify canSwitchTab(5, -1, false, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0374 begin');
      await delayTick();
      expect(canSwitchTab(5, -1, false, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0374 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_37500
     * @tc.name      testSwitchTabGrid0375
     * @tc.desc      Verify canSwitchTab(5, 0, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0375 begin');
      await delayTick();
      expect(canSwitchTab(5, 0, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0375 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_37600
     * @tc.name      testSwitchTabGrid0376
     * @tc.desc      Verify canSwitchTab(5, 0, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0376 begin');
      await delayTick();
      expect(canSwitchTab(5, 0, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0376 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_37700
     * @tc.name      testSwitchTabGrid0377
     * @tc.desc      Verify canSwitchTab(5, 1, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0377 begin');
      await delayTick();
      expect(canSwitchTab(5, 1, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0377 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_37800
     * @tc.name      testSwitchTabGrid0378
     * @tc.desc      Verify canSwitchTab(5, 1, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0378 begin');
      await delayTick();
      expect(canSwitchTab(5, 1, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0378 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_37900
     * @tc.name      testSwitchTabGrid0379
     * @tc.desc      Verify canSwitchTab(5, 2, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0379 begin');
      await delayTick();
      expect(canSwitchTab(5, 2, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0379 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_38000
     * @tc.name      testSwitchTabGrid0380
     * @tc.desc      Verify canSwitchTab(5, 2, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0380 begin');
      await delayTick();
      expect(canSwitchTab(5, 2, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0380 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_38100
     * @tc.name      testSwitchTabGrid0381
     * @tc.desc      Verify canSwitchTab(5, 4, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0381 begin');
      await delayTick();
      expect(canSwitchTab(5, 4, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0381 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_38200
     * @tc.name      testSwitchTabGrid0382
     * @tc.desc      Verify canSwitchTab(5, 4, false, 5) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0382 begin');
      await delayTick();
      expect(canSwitchTab(5, 4, false, 5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0382 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_38300
     * @tc.name      testSwitchTabGrid0383
     * @tc.desc      Verify canSwitchTab(5, 5, true, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0383 begin');
      await delayTick();
      expect(canSwitchTab(5, 5, true, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0383 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_38400
     * @tc.name      testSwitchTabGrid0384
     * @tc.desc      Verify canSwitchTab(5, 5, false, 5) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchTabGrid0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0384 begin');
      await delayTick();
      expect(canSwitchTab(5, 5, false, 5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchTabGrid0384 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_38500
     * @tc.name      testPopGrid0385
     * @tc.desc      Verify canPopNavStack(-10) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPopGrid0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPopGrid0385 begin');
      await delayTick();
      expect(canPopNavStack(-10)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPopGrid0385 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_38600
     * @tc.name      testPopGrid0386
     * @tc.desc      Verify canPopNavStack(-1) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPopGrid0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPopGrid0386 begin');
      await delayTick();
      expect(canPopNavStack(-1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPopGrid0386 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_38700
     * @tc.name      testPopGrid0387
     * @tc.desc      Verify canPopNavStack(0) is false.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPopGrid0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPopGrid0387 begin');
      await delayTick();
      expect(canPopNavStack(0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPopGrid0387 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_38800
     * @tc.name      testPopGrid0388
     * @tc.desc      Verify canPopNavStack(1) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPopGrid0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPopGrid0388 begin');
      await delayTick();
      expect(canPopNavStack(1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPopGrid0388 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_38900
     * @tc.name      testPopGrid0389
     * @tc.desc      Verify canPopNavStack(2) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPopGrid0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPopGrid0389 begin');
      await delayTick();
      expect(canPopNavStack(2)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPopGrid0389 end');
    })

  })
}
