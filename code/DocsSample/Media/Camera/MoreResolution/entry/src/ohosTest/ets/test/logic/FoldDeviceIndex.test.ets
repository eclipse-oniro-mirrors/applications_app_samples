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
  foldDeviceIndex,
} from '../model/ResolutionLogic';

/** FoldDeviceIndexTest logic checks (46 cases). */
export default function foldDeviceIndexTest(): void {
  describe('FoldDeviceIndexTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0001
     * @tc.name      Resolution_FoldIndex_0001
     * @tc.desc      foldDeviceIndex(0, 0, [1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FoldIndex_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldIndex_0001 begin`);
      logInfo("foldDeviceIndex(0, 0, [1])");
      const actual: number = foldDeviceIndex(0, 0, [1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0002
     * @tc.name      Resolution_FoldIndex_0002
     * @tc.desc      foldDeviceIndex(0, 1, [1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0002 begin`);
      logInfo("foldDeviceIndex(0, 1, [1])");
      const actual: number = foldDeviceIndex(0, 1, [1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0003
     * @tc.name      Resolution_FoldIndex_0003
     * @tc.desc      foldDeviceIndex(0, 2, [1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0003 begin`);
      logInfo("foldDeviceIndex(0, 2, [1])");
      const actual: number = foldDeviceIndex(0, 2, [1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0004
     * @tc.name      Resolution_FoldIndex_0004
     * @tc.desc      foldDeviceIndex(1, 0, [1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0004 begin`);
      logInfo("foldDeviceIndex(1, 0, [1])");
      const actual: number = foldDeviceIndex(1, 0, [1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0005
     * @tc.name      Resolution_FoldIndex_0005
     * @tc.desc      foldDeviceIndex(1, 1, [1]) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0005 begin`);
      logInfo("foldDeviceIndex(1, 1, [1])");
      const actual: number = foldDeviceIndex(1, 1, [1]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FoldIndex_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0006
     * @tc.name      Resolution_FoldIndex_0006
     * @tc.desc      foldDeviceIndex(1, 2, [1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0006 begin`);
      logInfo("foldDeviceIndex(1, 2, [1])");
      const actual: number = foldDeviceIndex(1, 2, [1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0007
     * @tc.name      Resolution_FoldIndex_0007
     * @tc.desc      foldDeviceIndex(2, 0, [1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0007 begin`);
      logInfo("foldDeviceIndex(2, 0, [1])");
      const actual: number = foldDeviceIndex(2, 0, [1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0008
     * @tc.name      Resolution_FoldIndex_0008
     * @tc.desc      foldDeviceIndex(2, 1, [1]) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0008 begin`);
      logInfo("foldDeviceIndex(2, 1, [1])");
      const actual: number = foldDeviceIndex(2, 1, [1]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FoldIndex_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0009
     * @tc.name      Resolution_FoldIndex_0009
     * @tc.desc      foldDeviceIndex(2, 2, [1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0009 begin`);
      logInfo("foldDeviceIndex(2, 2, [1])");
      const actual: number = foldDeviceIndex(2, 2, [1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0010
     * @tc.name      Resolution_FoldIndex_0010
     * @tc.desc      foldDeviceIndex(3, 0, [1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0010 begin`);
      logInfo("foldDeviceIndex(3, 0, [1])");
      const actual: number = foldDeviceIndex(3, 0, [1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0011
     * @tc.name      Resolution_FoldIndex_0011
     * @tc.desc      foldDeviceIndex(3, 1, [1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0011 begin`);
      logInfo("foldDeviceIndex(3, 1, [1])");
      const actual: number = foldDeviceIndex(3, 1, [1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0012
     * @tc.name      Resolution_FoldIndex_0012
     * @tc.desc      foldDeviceIndex(3, 2, [1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FoldIndex_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldIndex_0012 begin`);
      logInfo("foldDeviceIndex(3, 2, [1])");
      const actual: number = foldDeviceIndex(3, 2, [1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0013
     * @tc.name      Resolution_FoldIndex_0013
     * @tc.desc      foldDeviceIndex(0, 0, [2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0013 begin`);
      logInfo("foldDeviceIndex(0, 0, [2])");
      const actual: number = foldDeviceIndex(0, 0, [2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0014
     * @tc.name      Resolution_FoldIndex_0014
     * @tc.desc      foldDeviceIndex(0, 1, [2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0014 begin`);
      logInfo("foldDeviceIndex(0, 1, [2])");
      const actual: number = foldDeviceIndex(0, 1, [2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0015
     * @tc.name      Resolution_FoldIndex_0015
     * @tc.desc      foldDeviceIndex(0, 2, [2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0015 begin`);
      logInfo("foldDeviceIndex(0, 2, [2])");
      const actual: number = foldDeviceIndex(0, 2, [2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0016
     * @tc.name      Resolution_FoldIndex_0016
     * @tc.desc      foldDeviceIndex(1, 0, [2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0016 begin`);
      logInfo("foldDeviceIndex(1, 0, [2])");
      const actual: number = foldDeviceIndex(1, 0, [2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0017
     * @tc.name      Resolution_FoldIndex_0017
     * @tc.desc      foldDeviceIndex(1, 1, [2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0017 begin`);
      logInfo("foldDeviceIndex(1, 1, [2])");
      const actual: number = foldDeviceIndex(1, 1, [2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0018
     * @tc.name      Resolution_FoldIndex_0018
     * @tc.desc      foldDeviceIndex(1, 2, [2]) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_FoldIndex_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldIndex_0018 begin`);
      logInfo("foldDeviceIndex(1, 2, [2])");
      const actual: number = foldDeviceIndex(1, 2, [2]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FoldIndex_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0019
     * @tc.name      Resolution_FoldIndex_0019
     * @tc.desc      foldDeviceIndex(2, 0, [2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0019 begin`);
      logInfo("foldDeviceIndex(2, 0, [2])");
      const actual: number = foldDeviceIndex(2, 0, [2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0020
     * @tc.name      Resolution_FoldIndex_0020
     * @tc.desc      foldDeviceIndex(2, 1, [2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0020 begin`);
      logInfo("foldDeviceIndex(2, 1, [2])");
      const actual: number = foldDeviceIndex(2, 1, [2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0021
     * @tc.name      Resolution_FoldIndex_0021
     * @tc.desc      foldDeviceIndex(2, 2, [2]) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0021 begin`);
      logInfo("foldDeviceIndex(2, 2, [2])");
      const actual: number = foldDeviceIndex(2, 2, [2]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FoldIndex_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0022
     * @tc.name      Resolution_FoldIndex_0022
     * @tc.desc      foldDeviceIndex(3, 0, [2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0022 begin`);
      logInfo("foldDeviceIndex(3, 0, [2])");
      const actual: number = foldDeviceIndex(3, 0, [2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0023
     * @tc.name      Resolution_FoldIndex_0023
     * @tc.desc      foldDeviceIndex(3, 1, [2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FoldIndex_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldIndex_0023 begin`);
      logInfo("foldDeviceIndex(3, 1, [2])");
      const actual: number = foldDeviceIndex(3, 1, [2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0024
     * @tc.name      Resolution_FoldIndex_0024
     * @tc.desc      foldDeviceIndex(3, 2, [2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0024 begin`);
      logInfo("foldDeviceIndex(3, 2, [2])");
      const actual: number = foldDeviceIndex(3, 2, [2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0025
     * @tc.name      Resolution_FoldIndex_0025
     * @tc.desc      foldDeviceIndex(0, 0, [1,2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0025 begin`);
      logInfo("foldDeviceIndex(0, 0, [1,2])");
      const actual: number = foldDeviceIndex(0, 0, [1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0026
     * @tc.name      Resolution_FoldIndex_0026
     * @tc.desc      foldDeviceIndex(0, 1, [1,2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0026 begin`);
      logInfo("foldDeviceIndex(0, 1, [1,2])");
      const actual: number = foldDeviceIndex(0, 1, [1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0027
     * @tc.name      Resolution_FoldIndex_0027
     * @tc.desc      foldDeviceIndex(0, 2, [1,2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0027 begin`);
      logInfo("foldDeviceIndex(0, 2, [1,2])");
      const actual: number = foldDeviceIndex(0, 2, [1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0028
     * @tc.name      Resolution_FoldIndex_0028
     * @tc.desc      foldDeviceIndex(1, 0, [1,2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0028 begin`);
      logInfo("foldDeviceIndex(1, 0, [1,2])");
      const actual: number = foldDeviceIndex(1, 0, [1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0029
     * @tc.name      Resolution_FoldIndex_0029
     * @tc.desc      foldDeviceIndex(1, 1, [1,2]) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0029 begin`);
      logInfo("foldDeviceIndex(1, 1, [1,2])");
      const actual: number = foldDeviceIndex(1, 1, [1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FoldIndex_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0030
     * @tc.name      Resolution_FoldIndex_0030
     * @tc.desc      foldDeviceIndex(1, 2, [1,2]) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0030 begin`);
      logInfo("foldDeviceIndex(1, 2, [1,2])");
      const actual: number = foldDeviceIndex(1, 2, [1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FoldIndex_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0031
     * @tc.name      Resolution_FoldIndex_0031
     * @tc.desc      foldDeviceIndex(2, 0, [1,2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0031 begin`);
      logInfo("foldDeviceIndex(2, 0, [1,2])");
      const actual: number = foldDeviceIndex(2, 0, [1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0032
     * @tc.name      Resolution_FoldIndex_0032
     * @tc.desc      foldDeviceIndex(2, 1, [1,2]) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0032 begin`);
      logInfo("foldDeviceIndex(2, 1, [1,2])");
      const actual: number = foldDeviceIndex(2, 1, [1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FoldIndex_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0033
     * @tc.name      Resolution_FoldIndex_0033
     * @tc.desc      foldDeviceIndex(2, 2, [1,2]) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0033 begin`);
      logInfo("foldDeviceIndex(2, 2, [1,2])");
      const actual: number = foldDeviceIndex(2, 2, [1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FoldIndex_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0034
     * @tc.name      Resolution_FoldIndex_0034
     * @tc.desc      foldDeviceIndex(3, 0, [1,2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FoldIndex_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldIndex_0034 begin`);
      logInfo("foldDeviceIndex(3, 0, [1,2])");
      const actual: number = foldDeviceIndex(3, 0, [1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0035
     * @tc.name      Resolution_FoldIndex_0035
     * @tc.desc      foldDeviceIndex(3, 1, [1,2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_FoldIndex_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FoldIndex_0035 begin`);
      logInfo("foldDeviceIndex(3, 1, [1,2])");
      const actual: number = foldDeviceIndex(3, 1, [1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0036
     * @tc.name      Resolution_FoldIndex_0036
     * @tc.desc      foldDeviceIndex(3, 2, [1,2]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0036 begin`);
      logInfo("foldDeviceIndex(3, 2, [1,2])");
      const actual: number = foldDeviceIndex(3, 2, [1,2]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0037
     * @tc.name      Resolution_FoldIndex_0037
     * @tc.desc      foldDeviceIndex(0, 0, [2,1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0037 begin`);
      logInfo("foldDeviceIndex(0, 0, [2,1])");
      const actual: number = foldDeviceIndex(0, 0, [2,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0038
     * @tc.name      Resolution_FoldIndex_0038
     * @tc.desc      foldDeviceIndex(0, 1, [2,1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0038 begin`);
      logInfo("foldDeviceIndex(0, 1, [2,1])");
      const actual: number = foldDeviceIndex(0, 1, [2,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0039
     * @tc.name      Resolution_FoldIndex_0039
     * @tc.desc      foldDeviceIndex(0, 2, [2,1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0039 begin`);
      logInfo("foldDeviceIndex(0, 2, [2,1])");
      const actual: number = foldDeviceIndex(0, 2, [2,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FoldIndex_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0040
     * @tc.name      Resolution_FoldIndex_0040
     * @tc.desc      foldDeviceIndex(1, 0, [2,1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0040 begin`);
      logInfo("foldDeviceIndex(1, 0, [2,1])");
      const actual: number = foldDeviceIndex(1, 0, [2,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0041
     * @tc.name      Resolution_FoldIndex_0041
     * @tc.desc      foldDeviceIndex(1, 1, [2,1]) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0041 begin`);
      logInfo("foldDeviceIndex(1, 1, [2,1])");
      const actual: number = foldDeviceIndex(1, 1, [2,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FoldIndex_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0042
     * @tc.name      Resolution_FoldIndex_0042
     * @tc.desc      foldDeviceIndex(1, 2, [2,1]) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0042 begin`);
      logInfo("foldDeviceIndex(1, 2, [2,1])");
      const actual: number = foldDeviceIndex(1, 2, [2,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FoldIndex_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0043
     * @tc.name      Resolution_FoldIndex_0043
     * @tc.desc      foldDeviceIndex(2, 0, [2,1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0043 begin`);
      logInfo("foldDeviceIndex(2, 0, [2,1])");
      const actual: number = foldDeviceIndex(2, 0, [2,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0044
     * @tc.name      Resolution_FoldIndex_0044
     * @tc.desc      foldDeviceIndex(2, 1, [2,1]) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0044 begin`);
      logInfo("foldDeviceIndex(2, 1, [2,1])");
      const actual: number = foldDeviceIndex(2, 1, [2,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FoldIndex_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0045
     * @tc.name      Resolution_FoldIndex_0045
     * @tc.desc      foldDeviceIndex(2, 2, [2,1]) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_FoldIndex_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FoldIndex_0045 begin`);
      logInfo("foldDeviceIndex(2, 2, [2,1])");
      const actual: number = foldDeviceIndex(2, 2, [2,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FoldIndex_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_FOLD_INDEX_0046
     * @tc.name      Resolution_FoldIndex_0046
     * @tc.desc      foldDeviceIndex(3, 0, [2,1]) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_FoldIndex_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldIndex_0046 begin`);
      logInfo("foldDeviceIndex(3, 0, [2,1])");
      const actual: number = foldDeviceIndex(3, 0, [2,1]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}FoldIndex_0046 end`);
    });
  });
}
