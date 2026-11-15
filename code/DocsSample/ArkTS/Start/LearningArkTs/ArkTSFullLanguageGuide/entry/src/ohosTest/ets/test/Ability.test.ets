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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_ABILITY]';

export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_ABILITY_testAbilitySmoke0001
     * @tc.name      testAbilitySmoke0001
     * @tc.desc      Smoke assertion for the test runner: string containment and identity
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilitySmoke0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilitySmoke0001 begin');
      const a: string = 'abc';
      const b: string = 'b';
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbilitySmoke0001 end');
    })

  })
}
