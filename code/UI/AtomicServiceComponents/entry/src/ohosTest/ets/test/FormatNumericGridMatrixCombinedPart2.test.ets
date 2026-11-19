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
import { formatDuration, formatBytes, formatPercent, progressBucket, pad2, truncateMiddle } from '../../../main/ets/utils/FormatUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function FormatNumericGridMatrixCombinedPart2Test(): void {
  describe('FmtNum2', () => {
    /**
     * @tc.number    SUB_ATOMIC_FNGP4_13500
     * @tc.name      testProgressGrid0135
     * @tc.desc      Verify progressBucket(1000) returns 4. Plus Verify pad2(-99) returns 0-99. Plus Verify pad2(-1) returns 0-1. Plus Verify pad2(0) returns 00. Plus Verify pad2(1) returns 01. Plus Verify pad2(9) returns 09. Plus Verify pad2(10) returns 10. Plus Verify pad2(11) returns 11. Plus Verify pad2(42) returns 42. Plus Verify pad2(99) returns 99. Plus Verify pad2(100) returns 100. Plus Verify pad2(101) returns 101. Plus Verify truncateMiddle('abcdef', 6) returns 'abcdef'. Plus Verify truncateMiddle('abcdef', 7) returns 'abcdef'. Plus Verify truncateMiddle('abcdef', 5) returns 'ab…ef'. Plus Verify truncateMiddle('abcdef', 4) returns 'ab…f'. Plus Verify truncateMiddle('abcdef', 3) returns 'abcdef'. Plus Verify truncateMiddle('abcdef', 2) returns 'abcdef'. Plus Verify truncateMiddle('abcdef', 1) returns 'abcdef'. Plus Verify truncateMiddle('abcdef', 0) returns 'abcdef'. Plus Verify truncateMiddle('abcdef', -1) returns 'abcdef'. Plus Verify truncateMiddle('openHarmony', 9) returns 'open…mony'. Plus Verify truncateMiddle('openHarmony', 8) returns 'open…ony'. Plus Verify truncateMiddle('0123456789', 7) returns '012…789'. Plus Verify truncateMiddle('', 5) returns ''. Plus Verify truncateMiddle('a', 5) returns 'a'. Plus Verify truncateMiddle('ab', 1) returns 'ab'. Plus Verify truncateMiddle('abcd', 2) returns 'abcd'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProgressGrid0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0135 begin');
      await delayTick();
      expect(progressBucket(1000)).assertEqual(4);
      {
      expect(pad2(-99)).assertEqual('0-99');
      }
      {
      expect(pad2(-1)).assertEqual('0-1');
      }
      {
      expect(pad2(0)).assertEqual('00');
      }
      {
      expect(pad2(1)).assertEqual('01');
      }
      {
      expect(pad2(9)).assertEqual('09');
      }
      {
      expect(pad2(10)).assertEqual('10');
      }
      {
      expect(pad2(11)).assertEqual('11');
      }
      {
      expect(pad2(42)).assertEqual('42');
      }
      {
      expect(pad2(99)).assertEqual('99');
      }
      {
      expect(pad2(100)).assertEqual('100');
      }
      {
      expect(pad2(101)).assertEqual('101');
      }
      {
      expect(truncateMiddle('abcdef', 6)).assertEqual('abcdef');
      }
      {
      expect(truncateMiddle('abcdef', 7)).assertEqual('abcdef');
      }
      {
      expect(truncateMiddle('abcdef', 5)).assertEqual('ab…ef');
      }
      {
      expect(truncateMiddle('abcdef', 4)).assertEqual('ab…f');
      }
      {
      expect(truncateMiddle('abcdef', 3)).assertEqual('abcdef');
      }
      {
      expect(truncateMiddle('abcdef', 2)).assertEqual('abcdef');
      }
      {
      expect(truncateMiddle('abcdef', 1)).assertEqual('abcdef');
      }
      {
      expect(truncateMiddle('abcdef', 0)).assertEqual('abcdef');
      }
      {
      expect(truncateMiddle('abcdef', -1)).assertEqual('abcdef');
      }
      {
      expect(truncateMiddle('openHarmony', 9)).assertEqual('open…mony');
      }
      {
      expect(truncateMiddle('openHarmony', 8)).assertEqual('open…ony');
      }
      {
      expect(truncateMiddle('0123456789', 7)).assertEqual('012…789');
      }
      {
      expect(truncateMiddle('', 5)).assertEqual('');
      }
      {
      expect(truncateMiddle('a', 5)).assertEqual('a');
      }
      {
      expect(truncateMiddle('ab', 1)).assertEqual('ab');
      }
      {
      expect(truncateMiddle('abcd', 2)).assertEqual('abcd');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProgressGrid0135 end');
    })

  })
}
