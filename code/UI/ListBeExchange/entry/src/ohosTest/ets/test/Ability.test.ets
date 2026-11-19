/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_ABILITY_0801
     * @tc.name      testAbilityAssert0801
     * @tc.desc      Verify hypium assertion behavior on a fixed sample string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAbilityAssert0801', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testAbilityAssert0801 begin');
      const source: string = 'abc';
      const part: string = 'b';
      console.info(`assertContain source=${source}, expected=part`);
      expect(source).assertContain(part);
      console.info(`assertEqual typeof source=${typeof source}, expected='string'`);
      expect(typeof source).assertEqual('string');
      console.info(`assertEqual source.length=${source.length}, expected=3`);
      expect(source.length).assertEqual(3);
      hilog.info(0x0000, 'testTag', '%{public}s', 'testAbilityAssert0801 end');
    })
  })
}
