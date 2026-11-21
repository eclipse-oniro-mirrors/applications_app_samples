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
  zoomRound,
  zoomLabel,
} from '../model/ResolutionLogic';

/** ZoomRoundLabelTest logic checks (46 cases). */
export default function zoomRoundLabelTest(): void {
  describe('ZoomRoundLabelTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0001
     * @tc.name      Resolution_ZoomRoundLabel_0001
     * @tc.desc      zoomRound+zoomLabel(-1) -> "-1x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ZoomRoundLabel_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0001 begin`);
      logInfo("zoomLabel(zoomRound(-1))");
      const actual: string = zoomLabel(zoomRound(-1));
      logInfo('actual=' + String(actual) + ', expected=' + "-1x");
      expect(actual).assertEqual("-1x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomRoundLabel_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0002
     * @tc.name      Resolution_ZoomRoundLabel_0002
     * @tc.desc      zoomRound+zoomLabel(-0.863) -> "-0.86x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0002 begin`);
      logInfo("zoomLabel(zoomRound(-0.863))");
      const actual: string = zoomLabel(zoomRound(-0.863));
      logInfo('actual=' + String(actual) + ', expected=' + "-0.86x");
      expect(actual).assertEqual("-0.86x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0003
     * @tc.name      Resolution_ZoomRoundLabel_0003
     * @tc.desc      zoomRound+zoomLabel(-0.726) -> "-0.73x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0003 begin`);
      logInfo("zoomLabel(zoomRound(-0.726))");
      const actual: string = zoomLabel(zoomRound(-0.726));
      logInfo('actual=' + String(actual) + ', expected=' + "-0.73x");
      expect(actual).assertEqual("-0.73x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0004
     * @tc.name      Resolution_ZoomRoundLabel_0004
     * @tc.desc      zoomRound+zoomLabel(-0.589) -> "-0.59x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0004 begin`);
      logInfo("zoomLabel(zoomRound(-0.589))");
      const actual: string = zoomLabel(zoomRound(-0.589));
      logInfo('actual=' + String(actual) + ', expected=' + "-0.59x");
      expect(actual).assertEqual("-0.59x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomRoundLabel_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0005
     * @tc.name      Resolution_ZoomRoundLabel_0005
     * @tc.desc      zoomRound+zoomLabel(-0.452) -> "-0.45x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0005 begin`);
      logInfo("zoomLabel(zoomRound(-0.452))");
      const actual: string = zoomLabel(zoomRound(-0.452));
      logInfo('actual=' + String(actual) + ', expected=' + "-0.45x");
      expect(actual).assertEqual("-0.45x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0006
     * @tc.name      Resolution_ZoomRoundLabel_0006
     * @tc.desc      zoomRound+zoomLabel(-0.315) -> "-0.32x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0006 begin`);
      logInfo("zoomLabel(zoomRound(-0.315))");
      const actual: string = zoomLabel(zoomRound(-0.315));
      logInfo('actual=' + String(actual) + ', expected=' + "-0.32x");
      expect(actual).assertEqual("-0.32x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0007
     * @tc.name      Resolution_ZoomRoundLabel_0007
     * @tc.desc      zoomRound+zoomLabel(-0.178) -> "-0.18x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0007 begin`);
      logInfo("zoomLabel(zoomRound(-0.178))");
      const actual: string = zoomLabel(zoomRound(-0.178));
      logInfo('actual=' + String(actual) + ', expected=' + "-0.18x");
      expect(actual).assertEqual("-0.18x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomRoundLabel_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0008
     * @tc.name      Resolution_ZoomRoundLabel_0008
     * @tc.desc      zoomRound+zoomLabel(-0.041) -> "-0.04x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0008 begin`);
      logInfo("zoomLabel(zoomRound(-0.041))");
      const actual: string = zoomLabel(zoomRound(-0.041));
      logInfo('actual=' + String(actual) + ', expected=' + "-0.04x");
      expect(actual).assertEqual("-0.04x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0009
     * @tc.name      Resolution_ZoomRoundLabel_0009
     * @tc.desc      zoomRound+zoomLabel(0.096) -> "0.1x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0009 begin`);
      logInfo("zoomLabel(zoomRound(0.096))");
      const actual: string = zoomLabel(zoomRound(0.096));
      logInfo('actual=' + String(actual) + ', expected=' + "0.1x");
      expect(actual).assertEqual("0.1x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0010
     * @tc.name      Resolution_ZoomRoundLabel_0010
     * @tc.desc      zoomRound+zoomLabel(0.233) -> "0.23x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0010 begin`);
      logInfo("zoomLabel(zoomRound(0.233))");
      const actual: string = zoomLabel(zoomRound(0.233));
      logInfo('actual=' + String(actual) + ', expected=' + "0.23x");
      expect(actual).assertEqual("0.23x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomRoundLabel_0010 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0011
     * @tc.name      Resolution_ZoomRoundLabel_0011
     * @tc.desc      zoomRound+zoomLabel(0.37) -> "0.37x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0011 begin`);
      logInfo("zoomLabel(zoomRound(0.37))");
      const actual: string = zoomLabel(zoomRound(0.37));
      logInfo('actual=' + String(actual) + ', expected=' + "0.37x");
      expect(actual).assertEqual("0.37x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0011 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0012
     * @tc.name      Resolution_ZoomRoundLabel_0012
     * @tc.desc      zoomRound+zoomLabel(0.507) -> "0.51x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ZoomRoundLabel_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0012 begin`);
      logInfo("zoomLabel(zoomRound(0.507))");
      const actual: string = zoomLabel(zoomRound(0.507));
      logInfo('actual=' + String(actual) + ', expected=' + "0.51x");
      expect(actual).assertEqual("0.51x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0012 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0013
     * @tc.name      Resolution_ZoomRoundLabel_0013
     * @tc.desc      zoomRound+zoomLabel(0.644) -> "0.64x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0013 begin`);
      logInfo("zoomLabel(zoomRound(0.644))");
      const actual: string = zoomLabel(zoomRound(0.644));
      logInfo('actual=' + String(actual) + ', expected=' + "0.64x");
      expect(actual).assertEqual("0.64x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomRoundLabel_0013 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0014
     * @tc.name      Resolution_ZoomRoundLabel_0014
     * @tc.desc      zoomRound+zoomLabel(0.781) -> "0.78x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0014 begin`);
      logInfo("zoomLabel(zoomRound(0.781))");
      const actual: string = zoomLabel(zoomRound(0.781));
      logInfo('actual=' + String(actual) + ', expected=' + "0.78x");
      expect(actual).assertEqual("0.78x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0014 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0015
     * @tc.name      Resolution_ZoomRoundLabel_0015
     * @tc.desc      zoomRound+zoomLabel(0.918) -> "0.92x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0015 begin`);
      logInfo("zoomLabel(zoomRound(0.918))");
      const actual: string = zoomLabel(zoomRound(0.918));
      logInfo('actual=' + String(actual) + ', expected=' + "0.92x");
      expect(actual).assertEqual("0.92x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0015 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0016
     * @tc.name      Resolution_ZoomRoundLabel_0016
     * @tc.desc      zoomRound+zoomLabel(1.055) -> "1.05x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0016 begin`);
      logInfo("zoomLabel(zoomRound(1.055))");
      const actual: string = zoomLabel(zoomRound(1.055));
      logInfo('actual=' + String(actual) + ', expected=' + "1.05x");
      expect(actual).assertEqual("1.05x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomRoundLabel_0016 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0017
     * @tc.name      Resolution_ZoomRoundLabel_0017
     * @tc.desc      zoomRound+zoomLabel(1.192) -> "1.19x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0017 begin`);
      logInfo("zoomLabel(zoomRound(1.192))");
      const actual: string = zoomLabel(zoomRound(1.192));
      logInfo('actual=' + String(actual) + ', expected=' + "1.19x");
      expect(actual).assertEqual("1.19x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0017 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0018
     * @tc.name      Resolution_ZoomRoundLabel_0018
     * @tc.desc      zoomRound+zoomLabel(1.329) -> "1.33x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Resolution_ZoomRoundLabel_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0018 begin`);
      logInfo("zoomLabel(zoomRound(1.329))");
      const actual: string = zoomLabel(zoomRound(1.329));
      logInfo('actual=' + String(actual) + ', expected=' + "1.33x");
      expect(actual).assertEqual("1.33x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0018 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0019
     * @tc.name      Resolution_ZoomRoundLabel_0019
     * @tc.desc      zoomRound+zoomLabel(1.466) -> "1.47x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0019 begin`);
      logInfo("zoomLabel(zoomRound(1.466))");
      const actual: string = zoomLabel(zoomRound(1.466));
      logInfo('actual=' + String(actual) + ', expected=' + "1.47x");
      expect(actual).assertEqual("1.47x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomRoundLabel_0019 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0020
     * @tc.name      Resolution_ZoomRoundLabel_0020
     * @tc.desc      zoomRound+zoomLabel(1.603) -> "1.6x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0020 begin`);
      logInfo("zoomLabel(zoomRound(1.603))");
      const actual: string = zoomLabel(zoomRound(1.603));
      logInfo('actual=' + String(actual) + ', expected=' + "1.6x");
      expect(actual).assertEqual("1.6x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0020 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0021
     * @tc.name      Resolution_ZoomRoundLabel_0021
     * @tc.desc      zoomRound+zoomLabel(1.74) -> "1.74x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0021 begin`);
      logInfo("zoomLabel(zoomRound(1.74))");
      const actual: string = zoomLabel(zoomRound(1.74));
      logInfo('actual=' + String(actual) + ', expected=' + "1.74x");
      expect(actual).assertEqual("1.74x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0021 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0022
     * @tc.name      Resolution_ZoomRoundLabel_0022
     * @tc.desc      zoomRound+zoomLabel(1.877) -> "1.88x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0022 begin`);
      logInfo("zoomLabel(zoomRound(1.877))");
      const actual: string = zoomLabel(zoomRound(1.877));
      logInfo('actual=' + String(actual) + ', expected=' + "1.88x");
      expect(actual).assertEqual("1.88x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomRoundLabel_0022 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0023
     * @tc.name      Resolution_ZoomRoundLabel_0023
     * @tc.desc      zoomRound+zoomLabel(2.014) -> "2.01x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_ZoomRoundLabel_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0023 begin`);
      logInfo("zoomLabel(zoomRound(2.014))");
      const actual: string = zoomLabel(zoomRound(2.014));
      logInfo('actual=' + String(actual) + ', expected=' + "2.01x");
      expect(actual).assertEqual("2.01x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0023 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0024
     * @tc.name      Resolution_ZoomRoundLabel_0024
     * @tc.desc      zoomRound+zoomLabel(2.151) -> "2.15x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0024 begin`);
      logInfo("zoomLabel(zoomRound(2.151))");
      const actual: string = zoomLabel(zoomRound(2.151));
      logInfo('actual=' + String(actual) + ', expected=' + "2.15x");
      expect(actual).assertEqual("2.15x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0024 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0025
     * @tc.name      Resolution_ZoomRoundLabel_0025
     * @tc.desc      zoomRound+zoomLabel(2.288) -> "2.29x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0025 begin`);
      logInfo("zoomLabel(zoomRound(2.288))");
      const actual: string = zoomLabel(zoomRound(2.288));
      logInfo('actual=' + String(actual) + ', expected=' + "2.29x");
      expect(actual).assertEqual("2.29x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomRoundLabel_0025 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0026
     * @tc.name      Resolution_ZoomRoundLabel_0026
     * @tc.desc      zoomRound+zoomLabel(2.425) -> "2.42x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0026 begin`);
      logInfo("zoomLabel(zoomRound(2.425))");
      const actual: string = zoomLabel(zoomRound(2.425));
      logInfo('actual=' + String(actual) + ', expected=' + "2.42x");
      expect(actual).assertEqual("2.42x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0026 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0027
     * @tc.name      Resolution_ZoomRoundLabel_0027
     * @tc.desc      zoomRound+zoomLabel(2.562) -> "2.56x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0027 begin`);
      logInfo("zoomLabel(zoomRound(2.562))");
      const actual: string = zoomLabel(zoomRound(2.562));
      logInfo('actual=' + String(actual) + ', expected=' + "2.56x");
      expect(actual).assertEqual("2.56x");
      logInfo(`${BUNDLE}ZoomRoundLabel_0027 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0028
     * @tc.name      Resolution_ZoomRoundLabel_0028
     * @tc.desc      zoomRound+zoomLabel(2.699) -> "2.7x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0028 begin`);
      logInfo("zoomLabel(zoomRound(2.699))");
      const actual: string = zoomLabel(zoomRound(2.699));
      logInfo('actual=' + String(actual) + ', expected=' + "2.7x");
      expect(actual).assertEqual("2.7x");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ZoomRoundLabel_0028 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_ZOOM_ROUND_LABEL_0029
     * @tc.name      Resolution_ZoomRoundLabel_0029
     * @tc.desc      zoomRound+zoomLabel(2.836) -> "2.84x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_ZoomRoundLabel_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ZoomRoundLabel_0029 begin`);
      logInfo("zoomLabel(zoomRound(2.836))");
