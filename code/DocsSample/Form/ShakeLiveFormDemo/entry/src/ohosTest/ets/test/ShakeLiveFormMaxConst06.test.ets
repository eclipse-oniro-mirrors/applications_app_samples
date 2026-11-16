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
import { Constants } from '../../../main/ets/common/Constants';

export default function shakeLiveFormMaxConst06Test() {
  describe('ShakeLiveFormMaxConst06Test', () => {

    /**
     * @tc.name   testShakeMaxConst060001
     * @tc.number SUB_SHAKE_MAX_CONST_06_0001
     * @tc.desc   Max constants case 6-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 810).assertEqual(-81.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 810).assertEqual(972.0);
    })

    /**
     * @tc.name   testShakeMaxConst060002
     * @tc.number SUB_SHAKE_MAX_CONST_06_0002
     * @tc.desc   Max constants case 6-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 820).assertEqual(-82.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 820).assertEqual(984.0);
    })

    /**
     * @tc.name   testShakeMaxConst060003
     * @tc.number SUB_SHAKE_MAX_CONST_06_0003
     * @tc.desc   Max constants case 6-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 830).assertEqual(-83.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 830).assertEqual(996.0);
    })

    /**
     * @tc.name   testShakeMaxConst060004
     * @tc.number SUB_SHAKE_MAX_CONST_06_0004
     * @tc.desc   Max constants case 6-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 840).assertEqual(-84.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 840).assertEqual(1008.0);
    })

    /**
     * @tc.name   testShakeMaxConst060005
     * @tc.number SUB_SHAKE_MAX_CONST_06_0005
     * @tc.desc   Max constants case 6-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 850).assertEqual(-85.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 850).assertEqual(1020.0);
    })

    /**
     * @tc.name   testShakeMaxConst060006
     * @tc.number SUB_SHAKE_MAX_CONST_06_0006
     * @tc.desc   Max constants case 6-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 860).assertEqual(-86.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 860).assertEqual(1032.0);
    })

    /**
     * @tc.name   testShakeMaxConst060007
     * @tc.number SUB_SHAKE_MAX_CONST_06_0007
     * @tc.desc   Max constants case 6-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 870).assertEqual(-87.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 870).assertEqual(1044.0);
    })

    /**
     * @tc.name   testShakeMaxConst060008
     * @tc.number SUB_SHAKE_MAX_CONST_06_0008
     * @tc.desc   Max constants case 6-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 880).assertEqual(-88.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 880).assertEqual(1056.0);
    })

    /**
     * @tc.name   testShakeMaxConst060009
     * @tc.number SUB_SHAKE_MAX_CONST_06_0009
     * @tc.desc   Max constants case 6-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 890).assertEqual(-89.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 890).assertEqual(1068.0);
    })

    /**
     * @tc.name   testShakeMaxConst060010
     * @tc.number SUB_SHAKE_MAX_CONST_06_0010
     * @tc.desc   Max constants case 6-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 900).assertEqual(-90.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 900).assertEqual(1080.0);
    })

    /**
     * @tc.name   testShakeMaxConst060011
     * @tc.number SUB_SHAKE_MAX_CONST_06_0011
     * @tc.desc   Max constants case 6-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 910).assertEqual(-91.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 910).assertEqual(1092.0);
    })

    /**
     * @tc.name   testShakeMaxConst060012
     * @tc.number SUB_SHAKE_MAX_CONST_06_0012
     * @tc.desc   Max constants case 6-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 920).assertEqual(-92.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 920).assertEqual(1104.0);
    })

    /**
     * @tc.name   testShakeMaxConst060013
     * @tc.number SUB_SHAKE_MAX_CONST_06_0013
     * @tc.desc   Max constants case 6-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 930).assertEqual(-93.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 930).assertEqual(1116.0);
    })

    /**
     * @tc.name   testShakeMaxConst060014
     * @tc.number SUB_SHAKE_MAX_CONST_06_0014
     * @tc.desc   Max constants case 6-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 940).assertEqual(-94.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 940).assertEqual(1128.0);
    })

    /**
     * @tc.name   testShakeMaxConst060015
     * @tc.number SUB_SHAKE_MAX_CONST_06_0015
     * @tc.desc   Max constants case 6-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 950).assertEqual(-95.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 950).assertEqual(1140.0);
    })

    /**
     * @tc.name   testShakeMaxConst060016
     * @tc.number SUB_SHAKE_MAX_CONST_06_0016
     * @tc.desc   Max constants case 6-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 960).assertEqual(-96.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 960).assertEqual(1152.0);
    })
  })
}
