/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  foldFallbackPosition,
} from '../model/ResolutionLogic';

/** FoldFallbackTest logic checks (8 cases). */
export default function foldFallbackTest(): void {
  describe('FoldFallbackTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_FALLBACK_0001
     * @tc.name      Resolution_FoldFallback_0001
     * @tc.desc      foldFallbackPosition([]) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FoldFallback_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldFallback_0001 begin`);
      logInfo("foldFallbackPosition([])");
      const actual: number = foldFallbackPosition([]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldFallback_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_FALLBACK_0002
     * @tc.name      Resolution_FoldFallback_0002
     * @tc.desc      foldFallbackPosition([1]) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldFallback_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldFallback_0002 begin`);
      logInfo("foldFallbackPosition([1])");
      const actual: number = foldFallbackPosition([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FoldFallback_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_FALLBACK_0003
     * @tc.name      Resolution_FoldFallback_0003
     * @tc.desc      foldFallbackPosition([2]) returns 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldFallback_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldFallback_0003 begin`);
      logInfo("foldFallbackPosition([2])");
      const actual: number = foldFallbackPosition([2]);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FoldFallback_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_FALLBACK_0004
     * @tc.name      Resolution_FoldFallback_0004
     * @tc.desc      foldFallbackPosition([1,2]) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldFallback_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldFallback_0004 begin`);
      logInfo("foldFallbackPosition([1,2])");
      const actual: number = foldFallbackPosition([1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldFallback_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_FALLBACK_0005
     * @tc.name      Resolution_FoldFallback_0005
     * @tc.desc      foldFallbackPosition([2,1]) returns 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldFallback_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldFallback_0005 begin`);
      logInfo("foldFallbackPosition([2,1])");
      const actual: number = foldFallbackPosition([2,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FoldFallback_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_FALLBACK_0006
     * @tc.name      Resolution_FoldFallback_0006
     * @tc.desc      foldFallbackPosition([0,1,2]) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldFallback_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldFallback_0006 begin`);
      logInfo("foldFallbackPosition([0,1,2])");
      const actual: number = foldFallbackPosition([0,1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FoldFallback_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_FALLBACK_0007
     * @tc.name      Resolution_FoldFallback_0007
     * @tc.desc      foldFallbackPosition([0]) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldFallback_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldFallback_0007 begin`);
      logInfo("foldFallbackPosition([0])");
      const actual: number = foldFallbackPosition([0]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldFallback_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_FALLBACK_0008
     * @tc.name      Resolution_FoldFallback_0008
     * @tc.desc      foldFallbackPosition([2,0]) returns 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldFallback_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldFallback_0008 begin`);
      logInfo("foldFallbackPosition([2,0])");
      const actual: number = foldFallbackPosition([2,0]);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FoldFallback_0008 end`);
    });
  });
}
