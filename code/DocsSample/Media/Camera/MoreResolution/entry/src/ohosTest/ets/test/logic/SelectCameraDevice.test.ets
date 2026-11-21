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
  selectCameraDeviceIndex,
} from '../model/ResolutionLogic';

/** SelectCameraDeviceTest logic checks (46 cases). */
export default function selectCameraDeviceTest(): void {
  describe('SelectCameraDeviceTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0001
     * @tc.name      Resolution_SelectDevice_0001
     * @tc.desc      selectCameraDeviceIndex([1], 0) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SelectDevice_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SelectDevice_0001 begin`);
      logInfo("selectCameraDeviceIndex([1], 0)");
      const actual: number = selectCameraDeviceIndex([1], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0002
     * @tc.name      Resolution_SelectDevice_0002
     * @tc.desc      selectCameraDeviceIndex([1], 1) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0002 begin`);
      logInfo("selectCameraDeviceIndex([1], 1)");
      const actual: number = selectCameraDeviceIndex([1], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SelectDevice_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0003
     * @tc.name      Resolution_SelectDevice_0003
     * @tc.desc      selectCameraDeviceIndex([1], 2) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0003 begin`);
      logInfo("selectCameraDeviceIndex([1], 2)");
      const actual: number = selectCameraDeviceIndex([1], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0004
     * @tc.name      Resolution_SelectDevice_0004
     * @tc.desc      selectCameraDeviceIndex([1], 3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0004 begin`);
      logInfo("selectCameraDeviceIndex([1], 3)");
      const actual: number = selectCameraDeviceIndex([1], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0005
     * @tc.name      Resolution_SelectDevice_0005
     * @tc.desc      selectCameraDeviceIndex([2], 0) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0005 begin`);
      logInfo("selectCameraDeviceIndex([2], 0)");
      const actual: number = selectCameraDeviceIndex([2], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0006
     * @tc.name      Resolution_SelectDevice_0006
     * @tc.desc      selectCameraDeviceIndex([2], 1) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0006 begin`);
      logInfo("selectCameraDeviceIndex([2], 1)");
      const actual: number = selectCameraDeviceIndex([2], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0007
     * @tc.name      Resolution_SelectDevice_0007
     * @tc.desc      selectCameraDeviceIndex([2], 2) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0007 begin`);
      logInfo("selectCameraDeviceIndex([2], 2)");
      const actual: number = selectCameraDeviceIndex([2], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0008
     * @tc.name      Resolution_SelectDevice_0008
     * @tc.desc      selectCameraDeviceIndex([2], 3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0008 begin`);
      logInfo("selectCameraDeviceIndex([2], 3)");
      const actual: number = selectCameraDeviceIndex([2], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0009
     * @tc.name      Resolution_SelectDevice_0009
     * @tc.desc      selectCameraDeviceIndex([1,2], 0) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0009 begin`);
      logInfo("selectCameraDeviceIndex([1,2], 0)");
      const actual: number = selectCameraDeviceIndex([1,2], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0010
     * @tc.name      Resolution_SelectDevice_0010
     * @tc.desc      selectCameraDeviceIndex([1,2], 1) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0010 begin`);
      logInfo("selectCameraDeviceIndex([1,2], 1)");
      const actual: number = selectCameraDeviceIndex([1,2], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0011
     * @tc.name      Resolution_SelectDevice_0011
     * @tc.desc      selectCameraDeviceIndex([1,2], 2) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0011 begin`);
      logInfo("selectCameraDeviceIndex([1,2], 2)");
      const actual: number = selectCameraDeviceIndex([1,2], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SelectDevice_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0012
     * @tc.name      Resolution_SelectDevice_0012
     * @tc.desc      selectCameraDeviceIndex([1,2], 3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SelectDevice_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SelectDevice_0012 begin`);
      logInfo("selectCameraDeviceIndex([1,2], 3)");
      const actual: number = selectCameraDeviceIndex([1,2], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0013
     * @tc.name      Resolution_SelectDevice_0013
     * @tc.desc      selectCameraDeviceIndex([2,1], 0) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0013 begin`);
      logInfo("selectCameraDeviceIndex([2,1], 0)");
      const actual: number = selectCameraDeviceIndex([2,1], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0014
     * @tc.name      Resolution_SelectDevice_0014
     * @tc.desc      selectCameraDeviceIndex([2,1], 1) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0014 begin`);
      logInfo("selectCameraDeviceIndex([2,1], 1)");
      const actual: number = selectCameraDeviceIndex([2,1], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SelectDevice_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0015
     * @tc.name      Resolution_SelectDevice_0015
     * @tc.desc      selectCameraDeviceIndex([2,1], 2) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0015 begin`);
      logInfo("selectCameraDeviceIndex([2,1], 2)");
      const actual: number = selectCameraDeviceIndex([2,1], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SelectDevice_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0016
     * @tc.name      Resolution_SelectDevice_0016
     * @tc.desc      selectCameraDeviceIndex([2,1], 3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0016 begin`);
      logInfo("selectCameraDeviceIndex([2,1], 3)");
      const actual: number = selectCameraDeviceIndex([2,1], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0017
     * @tc.name      Resolution_SelectDevice_0017
     * @tc.desc      selectCameraDeviceIndex([0,1,2], 0) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0017 begin`);
      logInfo("selectCameraDeviceIndex([0,1,2], 0)");
      const actual: number = selectCameraDeviceIndex([0,1,2], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SelectDevice_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0018
     * @tc.name      Resolution_SelectDevice_0018
     * @tc.desc      selectCameraDeviceIndex([0,1,2], 1) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_SelectDevice_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SelectDevice_0018 begin`);
      logInfo("selectCameraDeviceIndex([0,1,2], 1)");
      const actual: number = selectCameraDeviceIndex([0,1,2], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SelectDevice_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0019
     * @tc.name      Resolution_SelectDevice_0019
     * @tc.desc      selectCameraDeviceIndex([0,1,2], 2) returns 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0019 begin`);
      logInfo("selectCameraDeviceIndex([0,1,2], 2)");
      const actual: number = selectCameraDeviceIndex([0,1,2], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0020
     * @tc.name      Resolution_SelectDevice_0020
     * @tc.desc      selectCameraDeviceIndex([0,1,2], 3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0020 begin`);
      logInfo("selectCameraDeviceIndex([0,1,2], 3)");
      const actual: number = selectCameraDeviceIndex([0,1,2], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0021
     * @tc.name      Resolution_SelectDevice_0021
     * @tc.desc      selectCameraDeviceIndex([], 0) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0021 begin`);
      logInfo("selectCameraDeviceIndex([], 0)");
      const actual: number = selectCameraDeviceIndex([], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0022
     * @tc.name      Resolution_SelectDevice_0022
     * @tc.desc      selectCameraDeviceIndex([], 1) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0022 begin`);
      logInfo("selectCameraDeviceIndex([], 1)");
      const actual: number = selectCameraDeviceIndex([], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0023
     * @tc.name      Resolution_SelectDevice_0023
     * @tc.desc      selectCameraDeviceIndex([], 2) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SelectDevice_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SelectDevice_0023 begin`);
      logInfo("selectCameraDeviceIndex([], 2)");
      const actual: number = selectCameraDeviceIndex([], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0024
     * @tc.name      Resolution_SelectDevice_0024
     * @tc.desc      selectCameraDeviceIndex([], 3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0024 begin`);
      logInfo("selectCameraDeviceIndex([], 3)");
      const actual: number = selectCameraDeviceIndex([], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0025
     * @tc.name      Resolution_SelectDevice_0025
     * @tc.desc      selectCameraDeviceIndex([0], 0) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0025 begin`);
      logInfo("selectCameraDeviceIndex([0], 0)");
      const actual: number = selectCameraDeviceIndex([0], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0026
     * @tc.name      Resolution_SelectDevice_0026
     * @tc.desc      selectCameraDeviceIndex([0], 1) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0026 begin`);
      logInfo("selectCameraDeviceIndex([0], 1)");
      const actual: number = selectCameraDeviceIndex([0], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0027
     * @tc.name      Resolution_SelectDevice_0027
     * @tc.desc      selectCameraDeviceIndex([0], 2) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0027 begin`);
      logInfo("selectCameraDeviceIndex([0], 2)");
      const actual: number = selectCameraDeviceIndex([0], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0028
     * @tc.name      Resolution_SelectDevice_0028
     * @tc.desc      selectCameraDeviceIndex([0], 3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0028 begin`);
      logInfo("selectCameraDeviceIndex([0], 3)");
      const actual: number = selectCameraDeviceIndex([0], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0029
     * @tc.name      Resolution_SelectDevice_0029
     * @tc.desc      selectCameraDeviceIndex([1,1], 0) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0029 begin`);
      logInfo("selectCameraDeviceIndex([1,1], 0)");
      const actual: number = selectCameraDeviceIndex([1,1], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0029 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0030
     * @tc.name      Resolution_SelectDevice_0030
     * @tc.desc      selectCameraDeviceIndex([1,1], 1) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0030 begin`);
      logInfo("selectCameraDeviceIndex([1,1], 1)");
      const actual: number = selectCameraDeviceIndex([1,1], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SelectDevice_0030 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0031
     * @tc.name      Resolution_SelectDevice_0031
     * @tc.desc      selectCameraDeviceIndex([1,1], 2) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0031 begin`);
      logInfo("selectCameraDeviceIndex([1,1], 2)");
      const actual: number = selectCameraDeviceIndex([1,1], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0031 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0032
     * @tc.name      Resolution_SelectDevice_0032
     * @tc.desc      selectCameraDeviceIndex([1,1], 3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0032 begin`);
      logInfo("selectCameraDeviceIndex([1,1], 3)");
      const actual: number = selectCameraDeviceIndex([1,1], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0032 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0033
     * @tc.name      Resolution_SelectDevice_0033
     * @tc.desc      selectCameraDeviceIndex([2,2], 0) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0033 begin`);
      logInfo("selectCameraDeviceIndex([2,2], 0)");
      const actual: number = selectCameraDeviceIndex([2,2], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0033 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0034
     * @tc.name      Resolution_SelectDevice_0034
     * @tc.desc      selectCameraDeviceIndex([2,2], 1) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SelectDevice_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SelectDevice_0034 begin`);
      logInfo("selectCameraDeviceIndex([2,2], 1)");
      const actual: number = selectCameraDeviceIndex([2,2], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0034 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0035
     * @tc.name      Resolution_SelectDevice_0035
     * @tc.desc      selectCameraDeviceIndex([2,2], 2) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_SelectDevice_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SelectDevice_0035 begin`);
      logInfo("selectCameraDeviceIndex([2,2], 2)");
      const actual: number = selectCameraDeviceIndex([2,2], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SelectDevice_0035 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0036
     * @tc.name      Resolution_SelectDevice_0036
     * @tc.desc      selectCameraDeviceIndex([2,2], 3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0036 begin`);
      logInfo("selectCameraDeviceIndex([2,2], 3)");
      const actual: number = selectCameraDeviceIndex([2,2], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0036 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0037
     * @tc.name      Resolution_SelectDevice_0037
     * @tc.desc      selectCameraDeviceIndex([0,2], 0) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0037 begin`);
      logInfo("selectCameraDeviceIndex([0,2], 0)");
      const actual: number = selectCameraDeviceIndex([0,2], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0037 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0038
     * @tc.name      Resolution_SelectDevice_0038
     * @tc.desc      selectCameraDeviceIndex([0,2], 1) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0038 begin`);
      logInfo("selectCameraDeviceIndex([0,2], 1)");
      const actual: number = selectCameraDeviceIndex([0,2], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0038 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0039
     * @tc.name      Resolution_SelectDevice_0039
     * @tc.desc      selectCameraDeviceIndex([0,2], 2) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0039 begin`);
      logInfo("selectCameraDeviceIndex([0,2], 2)");
      const actual: number = selectCameraDeviceIndex([0,2], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SelectDevice_0039 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0040
     * @tc.name      Resolution_SelectDevice_0040
     * @tc.desc      selectCameraDeviceIndex([0,2], 3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0040 begin`);
      logInfo("selectCameraDeviceIndex([0,2], 3)");
      const actual: number = selectCameraDeviceIndex([0,2], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0040 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0041
     * @tc.name      Resolution_SelectDevice_0041
     * @tc.desc      selectCameraDeviceIndex([0,1], 0) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0041 begin`);
      logInfo("selectCameraDeviceIndex([0,1], 0)");
      const actual: number = selectCameraDeviceIndex([0,1], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SelectDevice_0041 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0042
     * @tc.name      Resolution_SelectDevice_0042
     * @tc.desc      selectCameraDeviceIndex([0,1], 1) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0042 begin`);
      logInfo("selectCameraDeviceIndex([0,1], 1)");
      const actual: number = selectCameraDeviceIndex([0,1], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SelectDevice_0042 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0043
     * @tc.name      Resolution_SelectDevice_0043
     * @tc.desc      selectCameraDeviceIndex([0,1], 2) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0043 begin`);
      logInfo("selectCameraDeviceIndex([0,1], 2)");
      const actual: number = selectCameraDeviceIndex([0,1], 2);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0043 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0044
     * @tc.name      Resolution_SelectDevice_0044
     * @tc.desc      selectCameraDeviceIndex([0,1], 3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0044 begin`);
      logInfo("selectCameraDeviceIndex([0,1], 3)");
      const actual: number = selectCameraDeviceIndex([0,1], 3);
      logInfo('actual=' + String(actual) + ', expected=' + "-1");
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SelectDevice_0044 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0045
     * @tc.name      Resolution_SelectDevice_0045
     * @tc.desc      selectCameraDeviceIndex([1,0], 0) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SelectDevice_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SelectDevice_0045 begin`);
      logInfo("selectCameraDeviceIndex([1,0], 0)");
      const actual: number = selectCameraDeviceIndex([1,0], 0);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SelectDevice_0045 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SELECT_DEVICE_0046
     * @tc.name      Resolution_SelectDevice_0046
     * @tc.desc      selectCameraDeviceIndex([1,0], 1) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SelectDevice_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SelectDevice_0046 begin`);
      logInfo("selectCameraDeviceIndex([1,0], 1)");
      const actual: number = selectCameraDeviceIndex([1,0], 1);
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}SelectDevice_0046 end`);
    });
  });
}
