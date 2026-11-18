/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { MathUtils } from '../../../main/ets/utils/MathUtils';

const TAG = '[Sample_PhotosMathUtilsTest]';
const DOMAIN = 0xF811;

export default function PhotosMathUtilsTest(): void {
  describe('PhotosMathUtilsTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_0100
     * @tc.name      testPhotosMathClamp0001
     * @tc.desc      Clamps values below, inside, and above a positive range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathClamp0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathClamp0001 begin');
      expect(MathUtils.clamp(-1, 0, 10)).assertEqual(0);
      expect(MathUtils.clamp(5, 0, 10)).assertEqual(5);
      expect(MathUtils.clamp(11, 0, 10)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathClamp0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_0200
     * @tc.name      testPhotosMathClampBoundary0002
     * @tc.desc      Covers exact min/max values and a zero-width range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathClampBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathClampBoundary0002 begin');
      expect(MathUtils.clamp(0, 0, 10)).assertEqual(0);
      expect(MathUtils.clamp(10, 0, 10)).assertEqual(10);
      expect(MathUtils.clamp(5, 5, 5)).assertEqual(5);
      expect(MathUtils.clamp(0, 0, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathClampBoundary0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_MATH_0300
     * @tc.name      testPhotosMathClampNegative0003
     * @tc.desc      Clamps values inside a negative range and preserves in-range values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosMathClampNegative0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathClampNegative0003 begin');
      expect(MathUtils.clamp(-100, -10, 10)).assertEqual(-10);
      expect(MathUtils.clamp(100, -10, 10)).assertEqual(10);
      expect(MathUtils.clamp(3, 3, 7)).assertEqual(3);
      expect(MathUtils.clamp(-3, -10, 10)).assertEqual(-3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPhotosMathClampNegative0003 end');
    })
  })
}
