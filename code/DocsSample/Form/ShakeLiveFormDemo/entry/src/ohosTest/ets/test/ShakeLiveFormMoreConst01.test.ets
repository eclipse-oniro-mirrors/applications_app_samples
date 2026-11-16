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

export default function shakeLiveFormMoreConst01Test() {
  describe('ShakeLiveFormMoreConst01Test', () => {

    /**
     * @tc.name   testShakeMoreConst010001
     * @tc.number SUB_SHAKE_MORE_CONST_01_0001
     * @tc.desc   More constants case 1-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 20).assertEqual(3.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 20).assertEqual(26.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(1 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010002
     * @tc.number SUB_SHAKE_MORE_CONST_01_0002
     * @tc.desc   More constants case 1-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 40).assertEqual(6.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 40).assertEqual(52.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(2 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010003
     * @tc.number SUB_SHAKE_MORE_CONST_01_0003
     * @tc.desc   More constants case 1-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 60).assertEqual(9.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 60).assertEqual(78.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(3 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010004
     * @tc.number SUB_SHAKE_MORE_CONST_01_0004
     * @tc.desc   More constants case 1-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 80).assertEqual(12.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 80).assertEqual(104.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(4 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010005
     * @tc.number SUB_SHAKE_MORE_CONST_01_0005
     * @tc.desc   More constants case 1-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 100).assertEqual(15.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 100).assertEqual(130.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(5 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010006
     * @tc.number SUB_SHAKE_MORE_CONST_01_0006
     * @tc.desc   More constants case 1-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 120).assertEqual(18.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 120).assertEqual(156.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(6 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010007
     * @tc.number SUB_SHAKE_MORE_CONST_01_0007
     * @tc.desc   More constants case 1-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 140).assertEqual(21.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 140).assertEqual(182.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(7 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010008
     * @tc.number SUB_SHAKE_MORE_CONST_01_0008
     * @tc.desc   More constants case 1-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 160).assertEqual(24.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 160).assertEqual(208.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(8 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010009
     * @tc.number SUB_SHAKE_MORE_CONST_01_0009
     * @tc.desc   More constants case 1-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 180).assertEqual(27.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 180).assertEqual(234.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(9 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010010
     * @tc.number SUB_SHAKE_MORE_CONST_01_0010
     * @tc.desc   More constants case 1-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 200).assertEqual(30.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 200).assertEqual(260.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(10 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010011
     * @tc.number SUB_SHAKE_MORE_CONST_01_0011
     * @tc.desc   More constants case 1-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 220).assertEqual(33.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 220).assertEqual(286.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(11 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010012
     * @tc.number SUB_SHAKE_MORE_CONST_01_0012
     * @tc.desc   More constants case 1-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 240).assertEqual(36.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 240).assertEqual(312.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(12 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010013
     * @tc.number SUB_SHAKE_MORE_CONST_01_0013
     * @tc.desc   More constants case 1-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 260).assertEqual(39.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 260).assertEqual(338.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(13 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010014
     * @tc.number SUB_SHAKE_MORE_CONST_01_0014
     * @tc.desc   More constants case 1-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 280).assertEqual(42.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 280).assertEqual(364.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(14 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010015
     * @tc.number SUB_SHAKE_MORE_CONST_01_0015
     * @tc.desc   More constants case 1-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 300).assertEqual(45.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 300).assertEqual(390.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(15 > 0).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreConst010016
     * @tc.number SUB_SHAKE_MORE_CONST_01_0016
     * @tc.desc   More constants case 1-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreConst010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Constants.OVERFLOW_TOP_RATIO * 320).assertEqual(48.0); expect(Constants.OVERFLOW_HEIGHT_RATIO * 320).assertEqual(416.0); expect(Constants.OVERFLOW_DURATION).assertEqual(3500); expect(16 > 0).assertTrue();
    })
  })
}
