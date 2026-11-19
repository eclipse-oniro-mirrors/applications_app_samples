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

export default function DemoFilterGridMatrixCombinedPart4Test(): void {
  describe('DemoFlt4', () => {
    /**
     * @tc.number    SUB_ATOMIC_DFGP10_39000
     * @tc.name      testPopGrid0390
     * @tc.desc      Verify canPopNavStack(9) is true. Plus Verify canPopNavStack(100) is true.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPopGrid0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPopGrid0390 begin');
      await delayTick();
      expect(canPopNavStack(9)).assertEqual(true);
      {
      expect(canPopNavStack(100)).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPopGrid0390 end');
    })

  })
}
