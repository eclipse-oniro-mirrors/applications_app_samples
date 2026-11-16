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

export default function shakeLiveFormMaxConst02Test() {
  describe('ShakeLiveFormMaxConst02Test', () => {

    /**
     * @tc.name   testShakeMaxConst020001
     * @tc.number SUB_SHAKE_MAX_CONST_02_0001
     * @tc.desc   Max constants case 2-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 170).assertEqual(-17.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 170).assertEqual(204.0);
    })

    /**
     * @tc.name   testShakeMaxConst020002
     * @tc.number SUB_SHAKE_MAX_CONST_02_0002
     * @tc.desc   Max constants case 2-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 180).assertEqual(-18.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 180).assertEqual(216.0);
    })

    /**
     * @tc.name   testShakeMaxConst020003
     * @tc.number SUB_SHAKE_MAX_CONST_02_0003
     * @tc.desc   Max constants case 2-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 190).assertEqual(-19.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 190).assertEqual(228.0);
    })

    /**
     * @tc.name   testShakeMaxConst020004
     * @tc.number SUB_SHAKE_MAX_CONST_02_0004
     * @tc.desc   Max constants case 2-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 200).assertEqual(-20.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 200).assertEqual(240.0);
    })

    /**
     * @tc.name   testShakeMaxConst020005
     * @tc.number SUB_SHAKE_MAX_CONST_02_0005
     * @tc.desc   Max constants case 2-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 210).assertEqual(-21.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 210).assertEqual(252.0);
    })

    /**
     * @tc.name   testShakeMaxConst020006
     * @tc.number SUB_SHAKE_MAX_CONST_02_0006
     * @tc.desc   Max constants case 2-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 220).assertEqual(-22.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 220).assertEqual(264.0);
    })

    /**
     * @tc.name   testShakeMaxConst020007
     * @tc.number SUB_SHAKE_MAX_CONST_02_0007
     * @tc.desc   Max constants case 2-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 230).assertEqual(-23.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 230).assertEqual(276.0);
    })

    /**
     * @tc.name   testShakeMaxConst020008
     * @tc.number SUB_SHAKE_MAX_CONST_02_0008
     * @tc.desc   Max constants case 2-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 240).assertEqual(-24.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 240).assertEqual(288.0);
    })

    /**
     * @tc.name   testShakeMaxConst020009
     * @tc.number SUB_SHAKE_MAX_CONST_02_0009
     * @tc.desc   Max constants case 2-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 250).assertEqual(-25.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 250).assertEqual(300.0);
    })

    /**
     * @tc.name   testShakeMaxConst020010
     * @tc.number SUB_SHAKE_MAX_CONST_02_0010
     * @tc.desc   Max constants case 2-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 260).assertEqual(-26.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 260).assertEqual(312.0);
    })

    /**
     * @tc.name   testShakeMaxConst020011
     * @tc.number SUB_SHAKE_MAX_CONST_02_0011
     * @tc.desc   Max constants case 2-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 270).assertEqual(-27.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 270).assertEqual(324.0);
    })

    /**
     * @tc.name   testShakeMaxConst020012
     * @tc.number SUB_SHAKE_MAX_CONST_02_0012
     * @tc.desc   Max constants case 2-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 280).assertEqual(-28.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 280).assertEqual(336.0);
    })

    /**
     * @tc.name   testShakeMaxConst020013
     * @tc.number SUB_SHAKE_MAX_CONST_02_0013
     * @tc.desc   Max constants case 2-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 290).assertEqual(-29.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 290).assertEqual(348.0);
    })

    /**
     * @tc.name   testShakeMaxConst020014
     * @tc.number SUB_SHAKE_MAX_CONST_02_0014
     * @tc.desc   Max constants case 2-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 300).assertEqual(-30.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 300).assertEqual(360.0);
    })

    /**
     * @tc.name   testShakeMaxConst020015
     * @tc.number SUB_SHAKE_MAX_CONST_02_0015
     * @tc.desc   Max constants case 2-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 310).assertEqual(-31.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 310).assertEqual(372.0);
    })

    /**
     * @tc.name   testShakeMaxConst020016
     * @tc.number SUB_SHAKE_MAX_CONST_02_0016
     * @tc.desc   Max constants case 2-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 320).assertEqual(-32.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 320).assertEqual(384.0);
    })
  })
}
