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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PatternLock_Ability]';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
    });

    beforeEach(() => {
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number    SUB_PATTERN_ABILITY_0001
     * @tc.name      testAssertContain0001
     * @tc.desc      Verify hypium assertContain/assertEqual basic assertions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testAssertContain0001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAssertContain0001 begin');
      const text: string = 'abc';
      const part: string = 'b';
      expect(text).assertContain(part);
      expect(text).assertEqual(text);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAssertContain0001 end');
    });
  });
}