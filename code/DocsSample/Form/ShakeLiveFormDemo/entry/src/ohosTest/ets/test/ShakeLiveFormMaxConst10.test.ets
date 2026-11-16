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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Constants } from '../../../main/ets/common/Constants';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[ShakeLiveFormTest]';

export default function shakeLiveFormMaxConst10Test() {
  describe('ShakeLiveFormMaxConst10Test', () => {

    /**
     * @tc.name   testShakeMaxConstScaleRange
     * @tc.number SUB_SHAKE_MAX_CONST_10_0001
     * @tc.desc   Verify overflow ratios across the 1450-1600 width range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConstScaleRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxConstScaleRange begin');
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1);
      expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15);
      expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2);
      expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3);
      for (let width: number = 1450; width <= 1600; width += 10) {
        const left: number = -Constants.OVERFLOW_LEFT_RATIO * width;
        const scaledWidth: number = Constants.OVERFLOW_WIDTH_RATIO * width;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'width=%{public}d left=%{public}f scaledWidth=%{public}f', width, left, scaledWidth);
        expect(Math.abs(left - (-width * 0.1)) < 0.000001).assertTrue();
        expect(Math.abs(scaledWidth - (width * 1.2)) < 0.000001).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxConstScaleRange end');
    })
  })
}
