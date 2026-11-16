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

export default function shakeLiveFormMaxConst01Test() {
  describe('ShakeLiveFormMaxConst01Test', () => {

    /**
     * @tc.name   testShakeMaxConst010001
     * @tc.number SUB_SHAKE_MAX_CONST_01_0001
     * @tc.desc   Max constants case 1-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 10).assertEqual(-1.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 10).assertEqual(12.0);
    })

    /**
     * @tc.name   testShakeMaxConst010002
     * @tc.number SUB_SHAKE_MAX_CONST_01_0002
     * @tc.desc   Max constants case 1-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 20).assertEqual(-2.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 20).assertEqual(24.0);
    })

    /**
     * @tc.name   testShakeMaxConst010003
     * @tc.number SUB_SHAKE_MAX_CONST_01_0003
     * @tc.desc   Max constants case 1-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 30).assertEqual(-3.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 30).assertEqual(36.0);
    })

    /**
     * @tc.name   testShakeMaxConst010004
     * @tc.number SUB_SHAKE_MAX_CONST_01_0004
     * @tc.desc   Max constants case 1-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 40).assertEqual(-4.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 40).assertEqual(48.0);
    })

    /**
     * @tc.name   testShakeMaxConst010005
     * @tc.number SUB_SHAKE_MAX_CONST_01_0005
     * @tc.desc   Max constants case 1-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 50).assertEqual(-5.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 50).assertEqual(60.0);
    })

    /**
     * @tc.name   testShakeMaxConst010006
     * @tc.number SUB_SHAKE_MAX_CONST_01_0006
     * @tc.desc   Max constants case 1-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 60).assertEqual(-6.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 60).assertEqual(72.0);
    })

    /**
     * @tc.name   testShakeMaxConst010007
     * @tc.number SUB_SHAKE_MAX_CONST_01_0007
     * @tc.desc   Max constants case 1-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 70).assertEqual(-7.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 70).assertEqual(84.0);
    })

    /**
     * @tc.name   testShakeMaxConst010008
     * @tc.number SUB_SHAKE_MAX_CONST_01_0008
     * @tc.desc   Max constants case 1-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 80).assertEqual(-8.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 80).assertEqual(96.0);
    })

    /**
     * @tc.name   testShakeMaxConst010009
     * @tc.number SUB_SHAKE_MAX_CONST_01_0009
     * @tc.desc   Max constants case 1-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 90).assertEqual(-9.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 90).assertEqual(108.0);
    })

    /**
     * @tc.name   testShakeMaxConst010010
     * @tc.number SUB_SHAKE_MAX_CONST_01_0010
     * @tc.desc   Max constants case 1-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 100).assertEqual(-10.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 100).assertEqual(120.0);
    })

    /**
     * @tc.name   testShakeMaxConst010011
     * @tc.number SUB_SHAKE_MAX_CONST_01_0011
     * @tc.desc   Max constants case 1-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 110).assertEqual(-11.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 110).assertEqual(132.0);
    })

    /**
     * @tc.name   testShakeMaxConst010012
     * @tc.number SUB_SHAKE_MAX_CONST_01_0012
     * @tc.desc   Max constants case 1-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 120).assertEqual(-12.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 120).assertEqual(144.0);
    })

    /**
     * @tc.name   testShakeMaxConst010013
     * @tc.number SUB_SHAKE_MAX_CONST_01_0013
     * @tc.desc   Max constants case 1-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 130).assertEqual(-13.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 130).assertEqual(156.0);
    })

    /**
     * @tc.name   testShakeMaxConst010014
     * @tc.number SUB_SHAKE_MAX_CONST_01_0014
     * @tc.desc   Max constants case 1-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 140).assertEqual(-14.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 140).assertEqual(168.0);
    })

    /**
     * @tc.name   testShakeMaxConst010015
     * @tc.number SUB_SHAKE_MAX_CONST_01_0015
     * @tc.desc   Max constants case 1-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 150).assertEqual(-15.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 150).assertEqual(180.0);
    })

    /**
     * @tc.name   testShakeMaxConst010016
     * @tc.number SUB_SHAKE_MAX_CONST_01_0016
     * @tc.desc   Max constants case 1-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxConst010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1); expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15); expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2); expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3); expect(-Constants.OVERFLOW_LEFT_RATIO * 160).assertEqual(-16.0); expect(Constants.OVERFLOW_WIDTH_RATIO * 160).assertEqual(192.0);
    })
  })
}
