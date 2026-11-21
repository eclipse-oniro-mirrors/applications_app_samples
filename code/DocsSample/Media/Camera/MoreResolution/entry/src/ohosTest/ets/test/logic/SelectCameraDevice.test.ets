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
