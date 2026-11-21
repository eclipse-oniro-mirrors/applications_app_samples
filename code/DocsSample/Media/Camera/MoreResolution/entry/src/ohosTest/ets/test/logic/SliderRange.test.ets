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
  updateSliderMin,
  updateSliderMax,
} from '../model/ResolutionLogic';

/** SliderRangeTest logic checks (10 cases). */
export default function sliderRangeTest(): void {
  describe('SliderRangeTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_RANGE_0001
     * @tc.name      Resolution_SliderRange_0001
     * @tc.desc      slider range [] -> min/max.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_SliderRange_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SliderRange_0001 begin`);
      logInfo("updateSliderMin([]) + ':' + updateSliderMax([])");
      const actual: string = updateSliderMin([]) + ':' + updateSliderMax([]);
      logInfo('actual=' + String(actual) + ', expected=' + "1:6");
      expect(actual).assertEqual("1:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderRange_0001 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_RANGE_0002
     * @tc.name      Resolution_SliderRange_0002
     * @tc.desc      slider range [1] -> min/max.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderRange_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderRange_0002 begin`);
      logInfo("updateSliderMin([1]) + ':' + updateSliderMax([1])");
      const actual: string = updateSliderMin([1]) + ':' + updateSliderMax([1]);
      logInfo('actual=' + String(actual) + ', expected=' + "1:6");
      expect(actual).assertEqual("1:6");
      logInfo(`${BUNDLE}SliderRange_0002 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_RANGE_0003
     * @tc.name      Resolution_SliderRange_0003
     * @tc.desc      slider range [1,3] -> min/max.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderRange_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderRange_0003 begin`);
      logInfo("updateSliderMin([1,3]) + ':' + updateSliderMax([1,3])");
      const actual: string = updateSliderMin([1,3]) + ':' + updateSliderMax([1,3]);
      logInfo('actual=' + String(actual) + ', expected=' + "1:3");
      expect(actual).assertEqual("1:3");
      logInfo(`${BUNDLE}SliderRange_0003 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_RANGE_0004
     * @tc.name      Resolution_SliderRange_0004
     * @tc.desc      slider range [1,6] -> min/max.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderRange_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderRange_0004 begin`);
      logInfo("updateSliderMin([1,6]) + ':' + updateSliderMax([1,6])");
      const actual: string = updateSliderMin([1,6]) + ':' + updateSliderMax([1,6]);
      logInfo('actual=' + String(actual) + ', expected=' + "1:6");
      expect(actual).assertEqual("1:6");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderRange_0004 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_RANGE_0005
     * @tc.name      Resolution_SliderRange_0005
     * @tc.desc      slider range [1,8] -> min/max.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderRange_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderRange_0005 begin`);
      logInfo("updateSliderMin([1,8]) + ':' + updateSliderMax([1,8])");
      const actual: string = updateSliderMin([1,8]) + ':' + updateSliderMax([1,8]);
      logInfo('actual=' + String(actual) + ', expected=' + "1:6");
      expect(actual).assertEqual("1:6");
      logInfo(`${BUNDLE}SliderRange_0005 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_RANGE_0006
     * @tc.name      Resolution_SliderRange_0006
     * @tc.desc      slider range [0.5,10] -> min/max.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderRange_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderRange_0006 begin`);
      logInfo("updateSliderMin([0.5,10]) + ':' + updateSliderMax([0.5,10])");
      const actual: string = updateSliderMin([0.5,10]) + ':' + updateSliderMax([0.5,10]);
      logInfo('actual=' + String(actual) + ', expected=' + "0.5:6");
      expect(actual).assertEqual("0.5:6");
      logInfo(`${BUNDLE}SliderRange_0006 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_RANGE_0007
     * @tc.name      Resolution_SliderRange_0007
     * @tc.desc      slider range [2,4] -> min/max.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderRange_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderRange_0007 begin`);
      logInfo("updateSliderMin([2,4]) + ':' + updateSliderMax([2,4])");
      const actual: string = updateSliderMin([2,4]) + ':' + updateSliderMax([2,4]);
      logInfo('actual=' + String(actual) + ', expected=' + "2:4");
      expect(actual).assertEqual("2:4");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderRange_0007 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_RANGE_0008
     * @tc.name      Resolution_SliderRange_0008
     * @tc.desc      slider range [1,6.5] -> min/max.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderRange_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderRange_0008 begin`);
      logInfo("updateSliderMin([1,6.5]) + ':' + updateSliderMax([1,6.5])");
      const actual: string = updateSliderMin([1,6.5]) + ':' + updateSliderMax([1,6.5]);
      logInfo('actual=' + String(actual) + ', expected=' + "1:6");
      expect(actual).assertEqual("1:6");
      logInfo(`${BUNDLE}SliderRange_0008 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_RANGE_0009
     * @tc.name      Resolution_SliderRange_0009
     * @tc.desc      slider range [-1,5] -> min/max.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderRange_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderRange_0009 begin`);
      logInfo("updateSliderMin([-1,5]) + ':' + updateSliderMax([-1,5])");
      const actual: string = updateSliderMin([-1,5]) + ':' + updateSliderMax([-1,5]);
      logInfo('actual=' + String(actual) + ', expected=' + "-1:5");
      expect(actual).assertEqual("-1:5");
      logInfo(`${BUNDLE}SliderRange_0009 end`);
    });

    /**
     * @tc.number    SUB_MORE_RESOLUTION_SLIDER_RANGE_0010
     * @tc.name      Resolution_SliderRange_0010
     * @tc.desc      slider range [1,-2] -> min/max.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Resolution_SliderRange_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SliderRange_0010 begin`);
      logInfo("updateSliderMin([1,-2]) + ':' + updateSliderMax([1,-2])");
      const actual: string = updateSliderMin([1,-2]) + ':' + updateSliderMax([1,-2]);
      logInfo('actual=' + String(actual) + ', expected=' + "1:-2");
      expect(actual).assertEqual("1:-2");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}SliderRange_0010 end`);
    });
  });
}
