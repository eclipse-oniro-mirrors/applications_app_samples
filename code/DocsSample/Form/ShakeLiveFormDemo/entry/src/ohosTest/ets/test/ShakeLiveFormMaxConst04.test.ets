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

export default function shakeLiveFormMaxConst04Test() {
  describe('ShakeLiveFormMaxConst04Test', () => {

    /**
     * @tc.name   testShakeMaxConst040001
     * @tc.number SUB_SHAKE_MAX_CONST_04_0001
     * @tc.desc   Max constants case 4-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 490).assertEqual(-49.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 490).assertEqual(588.0);
    })

    /**
     * @tc.name   testShakeMaxConst040002
     * @tc.number SUB_SHAKE_MAX_CONST_04_0002
     * @tc.desc   Max constants case 4-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 500).assertEqual(-50.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 500).assertEqual(600.0);
    })

    /**
     * @tc.name   testShakeMaxConst040003
     * @tc.number SUB_SHAKE_MAX_CONST_04_0003
     * @tc.desc   Max constants case 4-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 510).assertEqual(-51.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 510).assertEqual(612.0);
    })

    /**
     * @tc.name   testShakeMaxConst040004
     * @tc.number SUB_SHAKE_MAX_CONST_04_0004
     * @tc.desc   Max constants case 4-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 520).assertEqual(-52.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 520).assertEqual(624.0);
    })

    /**
     * @tc.name   testShakeMaxConst040005
     * @tc.number SUB_SHAKE_MAX_CONST_04_0005
     * @tc.desc   Max constants case 4-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 530).assertEqual(-53.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 530).assertEqual(636.0);
    })

    /**
     * @tc.name   testShakeMaxConst040006
     * @tc.number SUB_SHAKE_MAX_CONST_04_0006
     * @tc.desc   Max constants case 4-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 540).assertEqual(-54.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 540).assertEqual(648.0);
    })

    /**
     * @tc.name   testShakeMaxConst040007
     * @tc.number SUB_SHAKE_MAX_CONST_04_0007
     * @tc.desc   Max constants case 4-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 550).assertEqual(-55.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 550).assertEqual(660.0);
    })

    /**
     * @tc.name   testShakeMaxConst040008
     * @tc.number SUB_SHAKE_MAX_CONST_04_0008
     * @tc.desc   Max constants case 4-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 560).assertEqual(-56.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 560).assertEqual(672.0);
    })

    /**
     * @tc.name   testShakeMaxConst040009
     * @tc.number SUB_SHAKE_MAX_CONST_04_0009
     * @tc.desc   Max constants case 4-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 570).assertEqual(-57.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 570).assertEqual(684.0);
    })

    /**
     * @tc.name   testShakeMaxConst040010
     * @tc.number SUB_SHAKE_MAX_CONST_04_0010
     * @tc.desc   Max constants case 4-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 580).assertEqual(-58.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 580).assertEqual(696.0);
    })

    /**
     * @tc.name   testShakeMaxConst040011
     * @tc.number SUB_SHAKE_MAX_CONST_04_0011
     * @tc.desc   Max constants case 4-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 590).assertEqual(-59.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 590).assertEqual(708.0);
    })

    /**
     * @tc.name   testShakeMaxConst040012
     * @tc.number SUB_SHAKE_MAX_CONST_04_0012
     * @tc.desc   Max constants case 4-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 600).assertEqual(-60.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 600).assertEqual(720.0);
    })

    /**
     * @tc.name   testShakeMaxConst040013
     * @tc.number SUB_SHAKE_MAX_CONST_04_0013
     * @tc.desc   Max constants case 4-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 610).assertEqual(-61.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 610).assertEqual(732.0);
    })

    /**
     * @tc.name   testShakeMaxConst040014
     * @tc.number SUB_SHAKE_MAX_CONST_04_0014
     * @tc.desc   Max constants case 4-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 620).assertEqual(-62.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 620).assertEqual(744.0);
    })

    /**
     * @tc.name   testShakeMaxConst040015
     * @tc.number SUB_SHAKE_MAX_CONST_04_0015
     * @tc.desc   Max constants case 4-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 630).assertEqual(-63.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 630).assertEqual(756.0);
    })

    /**
     * @tc.name   testShakeMaxConst040016
     * @tc.number SUB_SHAKE_MAX_CONST_04_0016
     * @tc.desc   Max constants case 4-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 640).assertEqual(-64.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 640).assertEqual(768.0);
    })
  })
}
