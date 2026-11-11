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


export default function projectConstantsExpandedTest() {
  describe('projectConstantsExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0001
     * @tc.name      testExpProjectConstant0001
     * @tc.desc      Project constants scale correctly at factor 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 1).assertEqual(300);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0002
     * @tc.name      testExpProjectConstant0002
     * @tc.desc      Project constants scale correctly at factor 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 2).assertEqual(600);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0003
     * @tc.name      testExpProjectConstant0003
     * @tc.desc      Project constants scale correctly at factor 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 3).assertEqual(900);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0004
     * @tc.name      testExpProjectConstant0004
     * @tc.desc      Project constants scale correctly at factor 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 4).assertEqual(1200);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0005
     * @tc.name      testExpProjectConstant0005
     * @tc.desc      Project constants scale correctly at factor 5.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 5).assertEqual(1500);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0006
     * @tc.name      testExpProjectConstant0006
     * @tc.desc      Project constants scale correctly at factor 6.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 6).assertEqual(1800);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0007
     * @tc.name      testExpProjectConstant0007
     * @tc.desc      Project constants scale correctly at factor 7.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 7).assertEqual(2100);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0008
     * @tc.name      testExpProjectConstant0008
     * @tc.desc      Project constants scale correctly at factor 8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 8).assertEqual(2400);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0009
     * @tc.name      testExpProjectConstant0009
     * @tc.desc      Project constants scale correctly at factor 9.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 9).assertEqual(2700);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0010
     * @tc.name      testExpProjectConstant0010
     * @tc.desc      Project constants scale correctly at factor 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 10).assertEqual(3000);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0011
     * @tc.name      testExpProjectConstant0011
     * @tc.desc      Project constants scale correctly at factor 11.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 11).assertEqual(3300);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0012
     * @tc.name      testExpProjectConstant0012
     * @tc.desc      Project constants scale correctly at factor 12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 12).assertEqual(3600);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0013
     * @tc.name      testExpProjectConstant0013
     * @tc.desc      Project constants scale correctly at factor 13.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 13).assertEqual(3900);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0014
     * @tc.name      testExpProjectConstant0014
     * @tc.desc      Project constants scale correctly at factor 14.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 14).assertEqual(4200);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0015
     * @tc.name      testExpProjectConstant0015
     * @tc.desc      Project constants scale correctly at factor 15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 15).assertEqual(4500);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0016
     * @tc.name      testExpProjectConstant0016
     * @tc.desc      Project constants scale correctly at factor 16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 16).assertEqual(4800);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0017
     * @tc.name      testExpProjectConstant0017
     * @tc.desc      Project constants scale correctly at factor 17.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 17).assertEqual(5100);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0018
     * @tc.name      testExpProjectConstant0018
     * @tc.desc      Project constants scale correctly at factor 18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 18).assertEqual(5400);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0019
     * @tc.name      testExpProjectConstant0019
     * @tc.desc      Project constants scale correctly at factor 19.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 19).assertEqual(5700);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0020
     * @tc.name      testExpProjectConstant0020
     * @tc.desc      Project constants scale correctly at factor 20.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 20).assertEqual(6000);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0021
     * @tc.name      testExpProjectConstant0021
     * @tc.desc      Project constants scale correctly at factor 21.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 21).assertEqual(6300);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0022
     * @tc.name      testExpProjectConstant0022
     * @tc.desc      Project constants scale correctly at factor 22.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 22).assertEqual(6600);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0023
     * @tc.name      testExpProjectConstant0023
     * @tc.desc      Project constants scale correctly at factor 23.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 23).assertEqual(6900);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0024
     * @tc.name      testExpProjectConstant0024
     * @tc.desc      Project constants scale correctly at factor 24.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 24).assertEqual(7200);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0025
     * @tc.name      testExpProjectConstant0025
     * @tc.desc      Project constants scale correctly at factor 25.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 25).assertEqual(7500);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0026
     * @tc.name      testExpProjectConstant0026
     * @tc.desc      Project constants scale correctly at factor 26.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 26).assertEqual(7800);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0027
     * @tc.name      testExpProjectConstant0027
     * @tc.desc      Project constants scale correctly at factor 27.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 27).assertEqual(8100);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0028
     * @tc.name      testExpProjectConstant0028
     * @tc.desc      Project constants scale correctly at factor 28.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 28).assertEqual(8400);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0029
     * @tc.name      testExpProjectConstant0029
     * @tc.desc      Project constants scale correctly at factor 29.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 29).assertEqual(8700);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0030
     * @tc.name      testExpProjectConstant0030
     * @tc.desc      Project constants scale correctly at factor 30.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 30).assertEqual(9000);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0031
     * @tc.name      testExpProjectConstant0031
     * @tc.desc      Project constants scale correctly at factor 31.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 31).assertEqual(9300);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0032
     * @tc.name      testExpProjectConstant0032
     * @tc.desc      Project constants scale correctly at factor 32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 32).assertEqual(9600);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0033
     * @tc.name      testExpProjectConstant0033
     * @tc.desc      Project constants scale correctly at factor 33.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 33).assertEqual(9900);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0034
     * @tc.name      testExpProjectConstant0034
     * @tc.desc      Project constants scale correctly at factor 34.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 34).assertEqual(10200);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0035
     * @tc.name      testExpProjectConstant0035
     * @tc.desc      Project constants scale correctly at factor 35.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 35).assertEqual(10500);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0036
     * @tc.name      testExpProjectConstant0036
     * @tc.desc      Project constants scale correctly at factor 36.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 36).assertEqual(10800);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0037
     * @tc.name      testExpProjectConstant0037
     * @tc.desc      Project constants scale correctly at factor 37.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 37).assertEqual(11100);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0038
     * @tc.name      testExpProjectConstant0038
     * @tc.desc      Project constants scale correctly at factor 38.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 38).assertEqual(11400);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0039
     * @tc.name      testExpProjectConstant0039
     * @tc.desc      Project constants scale correctly at factor 39.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 39).assertEqual(11700);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0040
     * @tc.name      testExpProjectConstant0040
     * @tc.desc      Project constants scale correctly at factor 40.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 40).assertEqual(12000);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0041
     * @tc.name      testExpProjectConstant0041
     * @tc.desc      Project constants scale correctly at factor 41.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 41).assertEqual(12300);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0042
     * @tc.name      testExpProjectConstant0042
     * @tc.desc      Project constants scale correctly at factor 42.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 42).assertEqual(12600);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0043
     * @tc.name      testExpProjectConstant0043
     * @tc.desc      Project constants scale correctly at factor 43.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 43).assertEqual(12900);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0044
     * @tc.name      testExpProjectConstant0044
     * @tc.desc      Project constants scale correctly at factor 44.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 44).assertEqual(13200);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0045
     * @tc.name      testExpProjectConstant0045
     * @tc.desc      Project constants scale correctly at factor 45.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 45).assertEqual(13500);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0046
     * @tc.name      testExpProjectConstant0046
     * @tc.desc      Project constants scale correctly at factor 46.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 46).assertEqual(13800);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0047
     * @tc.name      testExpProjectConstant0047
     * @tc.desc      Project constants scale correctly at factor 47.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 47).assertEqual(14100);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0048
     * @tc.name      testExpProjectConstant0048
     * @tc.desc      Project constants scale correctly at factor 48.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 48).assertEqual(14400);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0049
     * @tc.name      testExpProjectConstant0049
     * @tc.desc      Project constants scale correctly at factor 49.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 49).assertEqual(14700);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0050
     * @tc.name      testExpProjectConstant0050
     * @tc.desc      Project constants scale correctly at factor 50.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 50).assertEqual(15000);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0051
     * @tc.name      testExpProjectConstant0051
     * @tc.desc      Project constants scale correctly at factor 51.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 51).assertEqual(15300);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0052
     * @tc.name      testExpProjectConstant0052
     * @tc.desc      Project constants scale correctly at factor 52.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 52).assertEqual(15600);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0053
     * @tc.name      testExpProjectConstant0053
     * @tc.desc      Project constants scale correctly at factor 53.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 53).assertEqual(15900);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0054
     * @tc.name      testExpProjectConstant0054
     * @tc.desc      Project constants scale correctly at factor 54.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 54).assertEqual(16200);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0055
     * @tc.name      testExpProjectConstant0055
     * @tc.desc      Project constants scale correctly at factor 55.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 55).assertEqual(16500);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0056
     * @tc.name      testExpProjectConstant0056
     * @tc.desc      Project constants scale correctly at factor 56.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 56).assertEqual(16800);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0057
     * @tc.name      testExpProjectConstant0057
     * @tc.desc      Project constants scale correctly at factor 57.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 57).assertEqual(17100);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0058
     * @tc.name      testExpProjectConstant0058
     * @tc.desc      Project constants scale correctly at factor 58.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 58).assertEqual(17400);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0059
     * @tc.name      testExpProjectConstant0059
     * @tc.desc      Project constants scale correctly at factor 59.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 59).assertEqual(17700);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0060
     * @tc.name      testExpProjectConstant0060
     * @tc.desc      Project constants scale correctly at factor 60.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 60).assertEqual(18000);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0061
     * @tc.name      testExpProjectConstant0061
     * @tc.desc      Project constants scale correctly at factor 61.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 61).assertEqual(18300);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0062
     * @tc.name      testExpProjectConstant0062
     * @tc.desc      Project constants scale correctly at factor 62.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 62).assertEqual(18600);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0063
     * @tc.name      testExpProjectConstant0063
     * @tc.desc      Project constants scale correctly at factor 63.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 63).assertEqual(18900);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0064
     * @tc.name      testExpProjectConstant0064
     * @tc.desc      Project constants scale correctly at factor 64.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 64).assertEqual(19200);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0065
     * @tc.name      testExpProjectConstant0065
     * @tc.desc      Project constants scale correctly at factor 65.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 65).assertEqual(19500);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0066
     * @tc.name      testExpProjectConstant0066
     * @tc.desc      Project constants scale correctly at factor 66.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 66).assertEqual(19800);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0067
     * @tc.name      testExpProjectConstant0067
     * @tc.desc      Project constants scale correctly at factor 67.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 67).assertEqual(20100);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0068
     * @tc.name      testExpProjectConstant0068
     * @tc.desc      Project constants scale correctly at factor 68.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 68).assertEqual(20400);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0069
     * @tc.name      testExpProjectConstant0069
     * @tc.desc      Project constants scale correctly at factor 69.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 69).assertEqual(20700);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0070
     * @tc.name      testExpProjectConstant0070
     * @tc.desc      Project constants scale correctly at factor 70.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 70).assertEqual(21000);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0071
     * @tc.name      testExpProjectConstant0071
     * @tc.desc      Project constants scale correctly at factor 71.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 71).assertEqual(21300);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0072
     * @tc.name      testExpProjectConstant0072
     * @tc.desc      Project constants scale correctly at factor 72.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 72).assertEqual(21600);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0073
     * @tc.name      testExpProjectConstant0073
     * @tc.desc      Project constants scale correctly at factor 73.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 73).assertEqual(21900);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0074
     * @tc.name      testExpProjectConstant0074
     * @tc.desc      Project constants scale correctly at factor 74.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 74).assertEqual(22200);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0075
     * @tc.name      testExpProjectConstant0075
     * @tc.desc      Project constants scale correctly at factor 75.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 75).assertEqual(22500);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0076
     * @tc.name      testExpProjectConstant0076
     * @tc.desc      Project constants scale correctly at factor 76.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 76).assertEqual(22800);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0077
     * @tc.name      testExpProjectConstant0077
     * @tc.desc      Project constants scale correctly at factor 77.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 77).assertEqual(23100);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0078
     * @tc.name      testExpProjectConstant0078
     * @tc.desc      Project constants scale correctly at factor 78.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 78).assertEqual(23400);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0079
     * @tc.name      testExpProjectConstant0079
     * @tc.desc      Project constants scale correctly at factor 79.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 79).assertEqual(23700);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0080
     * @tc.name      testExpProjectConstant0080
     * @tc.desc      Project constants scale correctly at factor 80.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 80).assertEqual(24000);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0081
     * @tc.name      testExpProjectConstant0081
     * @tc.desc      Project constants scale correctly at factor 81.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 81).assertEqual(24300);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0082
     * @tc.name      testExpProjectConstant0082
     * @tc.desc      Project constants scale correctly at factor 82.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 82).assertEqual(24600);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0083
     * @tc.name      testExpProjectConstant0083
     * @tc.desc      Project constants scale correctly at factor 83.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 83).assertEqual(24900);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0084
     * @tc.name      testExpProjectConstant0084
     * @tc.desc      Project constants scale correctly at factor 84.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 84).assertEqual(25200);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0085
     * @tc.name      testExpProjectConstant0085
     * @tc.desc      Project constants scale correctly at factor 85.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 85).assertEqual(25500);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0086
     * @tc.name      testExpProjectConstant0086
     * @tc.desc      Project constants scale correctly at factor 86.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 86).assertEqual(25800);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0087
     * @tc.name      testExpProjectConstant0087
     * @tc.desc      Project constants scale correctly at factor 87.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 87).assertEqual(26100);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0088
     * @tc.name      testExpProjectConstant0088
     * @tc.desc      Project constants scale correctly at factor 88.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 88).assertEqual(26400);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0089
     * @tc.name      testExpProjectConstant0089
     * @tc.desc      Project constants scale correctly at factor 89.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 89).assertEqual(26700);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0090
     * @tc.name      testExpProjectConstant0090
     * @tc.desc      Project constants scale correctly at factor 90.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 90).assertEqual(27000);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0091
     * @tc.name      testExpProjectConstant0091
     * @tc.desc      Project constants scale correctly at factor 91.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 91).assertEqual(27300);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0092
     * @tc.name      testExpProjectConstant0092
     * @tc.desc      Project constants scale correctly at factor 92.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 92).assertEqual(27600);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0093
     * @tc.name      testExpProjectConstant0093
     * @tc.desc      Project constants scale correctly at factor 93.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 93).assertEqual(27900);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0094
     * @tc.name      testExpProjectConstant0094
     * @tc.desc      Project constants scale correctly at factor 94.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 94).assertEqual(28200);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0095
     * @tc.name      testExpProjectConstant0095
     * @tc.desc      Project constants scale correctly at factor 95.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 95).assertEqual(28500);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0096
     * @tc.name      testExpProjectConstant0096
     * @tc.desc      Project constants scale correctly at factor 96.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 96).assertEqual(28800);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0097
     * @tc.name      testExpProjectConstant0097
     * @tc.desc      Project constants scale correctly at factor 97.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 97).assertEqual(29100);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0098
     * @tc.name      testExpProjectConstant0098
     * @tc.desc      Project constants scale correctly at factor 98.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 98).assertEqual(29400);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0099
     * @tc.name      testExpProjectConstant0099
     * @tc.desc      Project constants scale correctly at factor 99.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 99).assertEqual(29700);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CONST_0100
     * @tc.name      testExpProjectConstant0100
     * @tc.desc      Project constants scale correctly at factor 100.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpProjectConstant0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const interval: number = 300;
      const oneMinute: number = 60000;
      const oneSecond: number = 1000;
      const speedCount: number = 4;
      expect(oneMinute / oneSecond).assertEqual(60);
      expect(interval * 100).assertEqual(30000);
      expect(speedCount).assertEqual(4);
      expect(oneMinute % oneSecond).assertEqual(0);
    })
  })
}
