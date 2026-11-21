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
  zoomClamp,
} from '../model/ResolutionLogic';

/** ZoomClampTest logic checks (13 cases). */
export default function zoomClampTest(): void {
  describe('ZoomClampTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_CLAMP_0001
     * @tc.name      Resolution_ZoomClamp_0001
     * @tc.desc      zoomClamp(1, 1, 6) -> 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ZoomClamp_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomClamp_0001 begin`);
      logInfo("zoomClamp(1, 1, 6)");
      const actual: number = zoomClamp(1, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_CLAMP_0002
     * @tc.name      Resolution_ZoomClamp_0002
     * @tc.desc      zoomClamp(6, 1, 6) -> 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomClamp_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0002 begin`);
      logInfo("zoomClamp(6, 1, 6)");
      const actual: number = zoomClamp(6, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ZoomClamp_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_CLAMP_0003
     * @tc.name      Resolution_ZoomClamp_0003
     * @tc.desc      zoomClamp(0, 1, 6) -> 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomClamp_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0003 begin`);
      logInfo("zoomClamp(0, 1, 6)");
      const actual: number = zoomClamp(0, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomClamp_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_CLAMP_0004
     * @tc.name      Resolution_ZoomClamp_0004
     * @tc.desc      zoomClamp(7, 1, 6) -> 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomClamp_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0004 begin`);
      logInfo("zoomClamp(7, 1, 6)");
      const actual: number = zoomClamp(7, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_CLAMP_0005
     * @tc.name      Resolution_ZoomClamp_0005
     * @tc.desc      zoomClamp(3.5, 1, 6) -> 3.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomClamp_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0005 begin`);
      logInfo("zoomClamp(3.5, 1, 6)");
      const actual: number = zoomClamp(3.5, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "3.5");
      expect(actual).assertEqual(3.5);
      logInfo(`${BUNDLE}ZoomClamp_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_CLAMP_0006
     * @tc.name      Resolution_ZoomClamp_0006
     * @tc.desc      zoomClamp(-2, 1, 6) -> 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomClamp_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0006 begin`);
      logInfo("zoomClamp(-2, 1, 6)");
      const actual: number = zoomClamp(-2, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ZoomClamp_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_CLAMP_0007
     * @tc.name      Resolution_ZoomClamp_0007
     * @tc.desc      zoomClamp(0.5, 0.25, 2.5) -> 0.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomClamp_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0007 begin`);
      logInfo("zoomClamp(0.5, 0.25, 2.5)");
      const actual: number = zoomClamp(0.5, 0.25, 2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5");
      expect(actual).assertEqual(0.5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_CLAMP_0008
     * @tc.name      Resolution_ZoomClamp_0008
     * @tc.desc      zoomClamp(2.5, 0.25, 2.5) -> 2.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomClamp_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0008 begin`);
      logInfo("zoomClamp(2.5, 0.25, 2.5)");
      const actual: number = zoomClamp(2.5, 0.25, 2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "2.5");
      expect(actual).assertEqual(2.5);
      logInfo(`${BUNDLE}ZoomClamp_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_CLAMP_0009
     * @tc.name      Resolution_ZoomClamp_0009
     * @tc.desc      zoomClamp(3, 0.25, 2.5) -> 2.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomClamp_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0009 begin`);
      logInfo("zoomClamp(3, 0.25, 2.5)");
      const actual: number = zoomClamp(3, 0.25, 2.5);
      logInfo('actual=' + String(actual) + ', expected=' + "2.5");
      expect(actual).assertEqual(2.5);
      logInfo(`${BUNDLE}ZoomClamp_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_CLAMP_0010
     * @tc.name      Resolution_ZoomClamp_0010
     * @tc.desc      zoomClamp(100, 1, 6) -> 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomClamp_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0010 begin`);
      logInfo("zoomClamp(100, 1, 6)");
      const actual: number = zoomClamp(100, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_CLAMP_0011
     * @tc.name      Resolution_ZoomClamp_0011
     * @tc.desc      zoomClamp(1, 6, 1) -> 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomClamp_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0011 begin`);
      logInfo("zoomClamp(1, 6, 1)");
      const actual: number = zoomClamp(1, 6, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "6");
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}ZoomClamp_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_CLAMP_0012
     * @tc.name      Resolution_ZoomClamp_0012
     * @tc.desc      zoomClamp(-100, -10, -1) -> -10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ZoomClamp_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomClamp_0012 begin`);
      logInfo("zoomClamp(-100, -10, -1)");
      const actual: number = zoomClamp(-100, -10, -1);
      logInfo('actual=' + String(actual) + ', expected=' + "-10");
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}ZoomClamp_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_CLAMP_0013
     * @tc.name      Resolution_ZoomClamp_0013
     * @tc.desc      zoomClamp(0.000001, 1, 6) -> 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomClamp_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomClamp_0013 begin`);
      logInfo("zoomClamp(0.000001, 1, 6)");
      const actual: number = zoomClamp(0.000001, 1, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}ZoomClamp_0013 end`);
    });
  });
}
