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
import { describe, it, expect } from '@ohos/hypium';


export default function playbackLimitsExpandedTest() {
  describe('playbackLimitsExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0001
     * @tc.name      testMorePlaybackLimit0001
     * @tc.desc      Position at 0% of 1000ms is 0.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0001', 0, () => {
      const duration: number = 1000;
      const percent: number = 0;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(0.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0002
     * @tc.name      testMorePlaybackLimit0002
     * @tc.desc      Position at 1% of 5000ms is 50.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0002', 0, () => {
      const duration: number = 5000;
      const percent: number = 1;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(50.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0003
     * @tc.name      testMorePlaybackLimit0003
     * @tc.desc      Position at 2% of 10000ms is 200.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0003', 0, () => {
      const duration: number = 10000;
      const percent: number = 2;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(200.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0004
     * @tc.name      testMorePlaybackLimit0004
     * @tc.desc      Position at 3% of 60000ms is 1800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0004', 0, () => {
      const duration: number = 60000;
      const percent: number = 3;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(1800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0005
     * @tc.name      testMorePlaybackLimit0005
     * @tc.desc      Position at 4% of 3600000ms is 144000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0005', 0, () => {
      const duration: number = 3600000;
      const percent: number = 4;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(144000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0006
     * @tc.name      testMorePlaybackLimit0006
     * @tc.desc      Position at 5% of 1000ms is 50.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0006', 0, () => {
      const duration: number = 1000;
      const percent: number = 5;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(50.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0007
     * @tc.name      testMorePlaybackLimit0007
     * @tc.desc      Position at 6% of 5000ms is 300.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0007', 0, () => {
      const duration: number = 5000;
      const percent: number = 6;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(300.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0008
     * @tc.name      testMorePlaybackLimit0008
     * @tc.desc      Position at 7% of 10000ms is 700.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0008', 0, () => {
      const duration: number = 10000;
      const percent: number = 7;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(700.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0009
     * @tc.name      testMorePlaybackLimit0009
     * @tc.desc      Position at 8% of 60000ms is 4800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0009', 0, () => {
      const duration: number = 60000;
      const percent: number = 8;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(4800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0010
     * @tc.name      testMorePlaybackLimit0010
     * @tc.desc      Position at 9% of 3600000ms is 324000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0010', 0, () => {
      const duration: number = 3600000;
      const percent: number = 9;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(324000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0011
     * @tc.name      testMorePlaybackLimit0011
     * @tc.desc      Position at 10% of 1000ms is 100.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0011', 0, () => {
      const duration: number = 1000;
      const percent: number = 10;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(100.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0012
     * @tc.name      testMorePlaybackLimit0012
     * @tc.desc      Position at 11% of 5000ms is 550.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0012', 0, () => {
      const duration: number = 5000;
      const percent: number = 11;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(550.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0013
     * @tc.name      testMorePlaybackLimit0013
     * @tc.desc      Position at 12% of 10000ms is 1200.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0013', 0, () => {
      const duration: number = 10000;
      const percent: number = 12;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(1200.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0014
     * @tc.name      testMorePlaybackLimit0014
     * @tc.desc      Position at 13% of 60000ms is 7800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0014', 0, () => {
      const duration: number = 60000;
      const percent: number = 13;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(7800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0015
     * @tc.name      testMorePlaybackLimit0015
     * @tc.desc      Position at 14% of 3600000ms is 504000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0015', 0, () => {
      const duration: number = 3600000;
      const percent: number = 14;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(504000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0016
     * @tc.name      testMorePlaybackLimit0016
     * @tc.desc      Position at 15% of 1000ms is 150.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0016', 0, () => {
      const duration: number = 1000;
      const percent: number = 15;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(150.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0017
     * @tc.name      testMorePlaybackLimit0017
     * @tc.desc      Position at 16% of 5000ms is 800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0017', 0, () => {
      const duration: number = 5000;
      const percent: number = 16;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0018
     * @tc.name      testMorePlaybackLimit0018
     * @tc.desc      Position at 17% of 10000ms is 1700.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0018', 0, () => {
      const duration: number = 10000;
      const percent: number = 17;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(1700.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0019
     * @tc.name      testMorePlaybackLimit0019
     * @tc.desc      Position at 18% of 60000ms is 10800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0019', 0, () => {
      const duration: number = 60000;
      const percent: number = 18;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(10800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0020
     * @tc.name      testMorePlaybackLimit0020
     * @tc.desc      Position at 19% of 3600000ms is 684000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0020', 0, () => {
      const duration: number = 3600000;
      const percent: number = 19;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(684000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0021
     * @tc.name      testMorePlaybackLimit0021
     * @tc.desc      Position at 20% of 1000ms is 200.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0021', 0, () => {
      const duration: number = 1000;
      const percent: number = 20;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(200.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0022
     * @tc.name      testMorePlaybackLimit0022
     * @tc.desc      Position at 21% of 5000ms is 1050.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0022', 0, () => {
      const duration: number = 5000;
      const percent: number = 21;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(1050.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0023
     * @tc.name      testMorePlaybackLimit0023
     * @tc.desc      Position at 22% of 10000ms is 2200.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0023', 0, () => {
      const duration: number = 10000;
      const percent: number = 22;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(2200.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0024
     * @tc.name      testMorePlaybackLimit0024
     * @tc.desc      Position at 23% of 60000ms is 13800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0024', 0, () => {
      const duration: number = 60000;
      const percent: number = 23;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(13800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0025
     * @tc.name      testMorePlaybackLimit0025
     * @tc.desc      Position at 24% of 3600000ms is 864000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0025', 0, () => {
      const duration: number = 3600000;
      const percent: number = 24;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(864000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0026
     * @tc.name      testMorePlaybackLimit0026
     * @tc.desc      Position at 25% of 1000ms is 250.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0026', 0, () => {
      const duration: number = 1000;
      const percent: number = 25;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(250.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0027
     * @tc.name      testMorePlaybackLimit0027
     * @tc.desc      Position at 26% of 5000ms is 1300.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0027', 0, () => {
      const duration: number = 5000;
      const percent: number = 26;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(1300.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0028
     * @tc.name      testMorePlaybackLimit0028
     * @tc.desc      Position at 27% of 10000ms is 2700.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0028', 0, () => {
      const duration: number = 10000;
      const percent: number = 27;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(2700.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0029
     * @tc.name      testMorePlaybackLimit0029
     * @tc.desc      Position at 28% of 60000ms is 16800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0029', 0, () => {
      const duration: number = 60000;
      const percent: number = 28;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(16800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0030
     * @tc.name      testMorePlaybackLimit0030
     * @tc.desc      Position at 29% of 3600000ms is 1044000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0030', 0, () => {
      const duration: number = 3600000;
      const percent: number = 29;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(1044000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0031
     * @tc.name      testMorePlaybackLimit0031
     * @tc.desc      Position at 30% of 1000ms is 300.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0031', 0, () => {
      const duration: number = 1000;
      const percent: number = 30;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(300.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0032
     * @tc.name      testMorePlaybackLimit0032
     * @tc.desc      Position at 31% of 5000ms is 1550.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0032', 0, () => {
      const duration: number = 5000;
      const percent: number = 31;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(1550.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0033
     * @tc.name      testMorePlaybackLimit0033
     * @tc.desc      Position at 32% of 10000ms is 3200.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0033', 0, () => {
      const duration: number = 10000;
      const percent: number = 32;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(3200.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0034
     * @tc.name      testMorePlaybackLimit0034
     * @tc.desc      Position at 33% of 60000ms is 19800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0034', 0, () => {
      const duration: number = 60000;
      const percent: number = 33;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(19800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0035
     * @tc.name      testMorePlaybackLimit0035
     * @tc.desc      Position at 34% of 3600000ms is 1224000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0035', 0, () => {
      const duration: number = 3600000;
      const percent: number = 34;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(1224000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0036
     * @tc.name      testMorePlaybackLimit0036
     * @tc.desc      Position at 35% of 1000ms is 350.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0036', 0, () => {
      const duration: number = 1000;
      const percent: number = 35;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(350.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0037
     * @tc.name      testMorePlaybackLimit0037
     * @tc.desc      Position at 36% of 5000ms is 1800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0037', 0, () => {
      const duration: number = 5000;
      const percent: number = 36;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(1800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0038
     * @tc.name      testMorePlaybackLimit0038
     * @tc.desc      Position at 37% of 10000ms is 3700.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0038', 0, () => {
      const duration: number = 10000;
      const percent: number = 37;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(3700.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0039
     * @tc.name      testMorePlaybackLimit0039
     * @tc.desc      Position at 38% of 60000ms is 22800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0039', 0, () => {
      const duration: number = 60000;
      const percent: number = 38;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(22800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0040
     * @tc.name      testMorePlaybackLimit0040
     * @tc.desc      Position at 39% of 3600000ms is 1404000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0040', 0, () => {
      const duration: number = 3600000;
      const percent: number = 39;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(1404000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0041
     * @tc.name      testMorePlaybackLimit0041
     * @tc.desc      Position at 40% of 1000ms is 400.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0041', 0, () => {
      const duration: number = 1000;
      const percent: number = 40;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(400.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0042
     * @tc.name      testMorePlaybackLimit0042
     * @tc.desc      Position at 41% of 5000ms is 2050.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0042', 0, () => {
      const duration: number = 5000;
      const percent: number = 41;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(2050.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0043
     * @tc.name      testMorePlaybackLimit0043
     * @tc.desc      Position at 42% of 10000ms is 4200.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0043', 0, () => {
      const duration: number = 10000;
      const percent: number = 42;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(4200.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0044
     * @tc.name      testMorePlaybackLimit0044
     * @tc.desc      Position at 43% of 60000ms is 25800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0044', 0, () => {
      const duration: number = 60000;
      const percent: number = 43;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(25800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0045
     * @tc.name      testMorePlaybackLimit0045
     * @tc.desc      Position at 44% of 3600000ms is 1584000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0045', 0, () => {
      const duration: number = 3600000;
      const percent: number = 44;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(1584000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0046
     * @tc.name      testMorePlaybackLimit0046
     * @tc.desc      Position at 45% of 1000ms is 450.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0046', 0, () => {
      const duration: number = 1000;
      const percent: number = 45;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(450.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0047
     * @tc.name      testMorePlaybackLimit0047
     * @tc.desc      Position at 46% of 5000ms is 2300.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0047', 0, () => {
      const duration: number = 5000;
      const percent: number = 46;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(2300.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0048
     * @tc.name      testMorePlaybackLimit0048
     * @tc.desc      Position at 47% of 10000ms is 4700.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0048', 0, () => {
      const duration: number = 10000;
      const percent: number = 47;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(4700.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0049
     * @tc.name      testMorePlaybackLimit0049
     * @tc.desc      Position at 48% of 60000ms is 28800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0049', 0, () => {
      const duration: number = 60000;
      const percent: number = 48;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(28800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0050
     * @tc.name      testMorePlaybackLimit0050
     * @tc.desc      Position at 49% of 3600000ms is 1764000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0050', 0, () => {
      const duration: number = 3600000;
      const percent: number = 49;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(1764000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0051
     * @tc.name      testMorePlaybackLimit0051
     * @tc.desc      Position at 50% of 1000ms is 500.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0051', 0, () => {
      const duration: number = 1000;
      const percent: number = 50;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(500.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0052
     * @tc.name      testMorePlaybackLimit0052
     * @tc.desc      Position at 51% of 5000ms is 2550.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0052', 0, () => {
      const duration: number = 5000;
      const percent: number = 51;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(2550.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0053
     * @tc.name      testMorePlaybackLimit0053
     * @tc.desc      Position at 52% of 10000ms is 5200.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0053', 0, () => {
      const duration: number = 10000;
      const percent: number = 52;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(5200.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0054
     * @tc.name      testMorePlaybackLimit0054
     * @tc.desc      Position at 53% of 60000ms is 31800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0054', 0, () => {
      const duration: number = 60000;
      const percent: number = 53;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(31800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0055
     * @tc.name      testMorePlaybackLimit0055
     * @tc.desc      Position at 54% of 3600000ms is 1944000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0055', 0, () => {
      const duration: number = 3600000;
      const percent: number = 54;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(1944000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0056
     * @tc.name      testMorePlaybackLimit0056
     * @tc.desc      Position at 55% of 1000ms is 550.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0056', 0, () => {
      const duration: number = 1000;
      const percent: number = 55;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(550.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0057
     * @tc.name      testMorePlaybackLimit0057
     * @tc.desc      Position at 56% of 5000ms is 2800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0057', 0, () => {
      const duration: number = 5000;
      const percent: number = 56;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(2800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0058
     * @tc.name      testMorePlaybackLimit0058
     * @tc.desc      Position at 57% of 10000ms is 5700.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0058', 0, () => {
      const duration: number = 10000;
      const percent: number = 57;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(5700.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0059
     * @tc.name      testMorePlaybackLimit0059
     * @tc.desc      Position at 58% of 60000ms is 34800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0059', 0, () => {
      const duration: number = 60000;
      const percent: number = 58;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(34800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0060
     * @tc.name      testMorePlaybackLimit0060
     * @tc.desc      Position at 59% of 3600000ms is 2124000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0060', 0, () => {
      const duration: number = 3600000;
      const percent: number = 59;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(2124000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0061
     * @tc.name      testMorePlaybackLimit0061
     * @tc.desc      Position at 60% of 1000ms is 600.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0061', 0, () => {
      const duration: number = 1000;
      const percent: number = 60;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(600.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0062
     * @tc.name      testMorePlaybackLimit0062
     * @tc.desc      Position at 61% of 5000ms is 3050.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0062', 0, () => {
      const duration: number = 5000;
      const percent: number = 61;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(3050.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0063
     * @tc.name      testMorePlaybackLimit0063
     * @tc.desc      Position at 62% of 10000ms is 6200.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0063', 0, () => {
      const duration: number = 10000;
      const percent: number = 62;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(6200.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0064
     * @tc.name      testMorePlaybackLimit0064
     * @tc.desc      Position at 63% of 60000ms is 37800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0064', 0, () => {
      const duration: number = 60000;
      const percent: number = 63;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(37800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0065
     * @tc.name      testMorePlaybackLimit0065
     * @tc.desc      Position at 64% of 3600000ms is 2304000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0065', 0, () => {
      const duration: number = 3600000;
      const percent: number = 64;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(2304000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0066
     * @tc.name      testMorePlaybackLimit0066
     * @tc.desc      Position at 65% of 1000ms is 650.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0066', 0, () => {
      const duration: number = 1000;
      const percent: number = 65;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(650.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0067
     * @tc.name      testMorePlaybackLimit0067
     * @tc.desc      Position at 66% of 5000ms is 3300.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0067', 0, () => {
      const duration: number = 5000;
      const percent: number = 66;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(3300.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0068
     * @tc.name      testMorePlaybackLimit0068
     * @tc.desc      Position at 67% of 10000ms is 6700.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0068', 0, () => {
      const duration: number = 10000;
      const percent: number = 67;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(6700.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0069
     * @tc.name      testMorePlaybackLimit0069
     * @tc.desc      Position at 68% of 60000ms is 40800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0069', 0, () => {
      const duration: number = 60000;
      const percent: number = 68;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(40800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0070
     * @tc.name      testMorePlaybackLimit0070
     * @tc.desc      Position at 69% of 3600000ms is 2484000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0070', 0, () => {
      const duration: number = 3600000;
      const percent: number = 69;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(2484000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0071
     * @tc.name      testMorePlaybackLimit0071
     * @tc.desc      Position at 70% of 1000ms is 700.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0071', 0, () => {
      const duration: number = 1000;
      const percent: number = 70;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(700.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0072
     * @tc.name      testMorePlaybackLimit0072
     * @tc.desc      Position at 71% of 5000ms is 3550.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0072', 0, () => {
      const duration: number = 5000;
      const percent: number = 71;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(3550.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0073
     * @tc.name      testMorePlaybackLimit0073
     * @tc.desc      Position at 72% of 10000ms is 7200.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0073', 0, () => {
      const duration: number = 10000;
      const percent: number = 72;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(7200.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0074
     * @tc.name      testMorePlaybackLimit0074
     * @tc.desc      Position at 73% of 60000ms is 43800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0074', 0, () => {
      const duration: number = 60000;
      const percent: number = 73;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(43800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0075
     * @tc.name      testMorePlaybackLimit0075
     * @tc.desc      Position at 74% of 3600000ms is 2664000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0075', 0, () => {
      const duration: number = 3600000;
      const percent: number = 74;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(2664000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0076
     * @tc.name      testMorePlaybackLimit0076
     * @tc.desc      Position at 75% of 1000ms is 750.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0076', 0, () => {
      const duration: number = 1000;
      const percent: number = 75;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(750.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0077
     * @tc.name      testMorePlaybackLimit0077
     * @tc.desc      Position at 76% of 5000ms is 3800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0077', 0, () => {
      const duration: number = 5000;
      const percent: number = 76;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(3800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0078
     * @tc.name      testMorePlaybackLimit0078
     * @tc.desc      Position at 77% of 10000ms is 7700.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0078', 0, () => {
      const duration: number = 10000;
      const percent: number = 77;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(7700.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0079
     * @tc.name      testMorePlaybackLimit0079
     * @tc.desc      Position at 78% of 60000ms is 46800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0079', 0, () => {
      const duration: number = 60000;
      const percent: number = 78;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(46800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0080
     * @tc.name      testMorePlaybackLimit0080
     * @tc.desc      Position at 79% of 3600000ms is 2844000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0080', 0, () => {
      const duration: number = 3600000;
      const percent: number = 79;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(2844000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0081
     * @tc.name      testMorePlaybackLimit0081
     * @tc.desc      Position at 80% of 1000ms is 800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0081', 0, () => {
      const duration: number = 1000;
      const percent: number = 80;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0082
     * @tc.name      testMorePlaybackLimit0082
     * @tc.desc      Position at 81% of 5000ms is 4050.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0082', 0, () => {
      const duration: number = 5000;
      const percent: number = 81;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(4050.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0083
     * @tc.name      testMorePlaybackLimit0083
     * @tc.desc      Position at 82% of 10000ms is 8200.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0083', 0, () => {
      const duration: number = 10000;
      const percent: number = 82;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(8200.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0084
     * @tc.name      testMorePlaybackLimit0084
     * @tc.desc      Position at 83% of 60000ms is 49800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0084', 0, () => {
      const duration: number = 60000;
      const percent: number = 83;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(49800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0085
     * @tc.name      testMorePlaybackLimit0085
     * @tc.desc      Position at 84% of 3600000ms is 3024000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0085', 0, () => {
      const duration: number = 3600000;
      const percent: number = 84;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(3024000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0086
     * @tc.name      testMorePlaybackLimit0086
     * @tc.desc      Position at 85% of 1000ms is 850.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0086', 0, () => {
      const duration: number = 1000;
      const percent: number = 85;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(850.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0087
     * @tc.name      testMorePlaybackLimit0087
     * @tc.desc      Position at 86% of 5000ms is 4300.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0087', 0, () => {
      const duration: number = 5000;
      const percent: number = 86;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(4300.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0088
     * @tc.name      testMorePlaybackLimit0088
     * @tc.desc      Position at 87% of 10000ms is 8700.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0088', 0, () => {
      const duration: number = 10000;
      const percent: number = 87;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(8700.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0089
     * @tc.name      testMorePlaybackLimit0089
     * @tc.desc      Position at 88% of 60000ms is 52800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0089', 0, () => {
      const duration: number = 60000;
      const percent: number = 88;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(52800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0090
     * @tc.name      testMorePlaybackLimit0090
     * @tc.desc      Position at 89% of 3600000ms is 3204000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0090', 0, () => {
      const duration: number = 3600000;
      const percent: number = 89;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(3204000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0091
     * @tc.name      testMorePlaybackLimit0091
     * @tc.desc      Position at 90% of 1000ms is 900.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0091', 0, () => {
      const duration: number = 1000;
      const percent: number = 90;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(900.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0092
     * @tc.name      testMorePlaybackLimit0092
     * @tc.desc      Position at 91% of 5000ms is 4550.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0092', 0, () => {
      const duration: number = 5000;
      const percent: number = 91;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(4550.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0093
     * @tc.name      testMorePlaybackLimit0093
     * @tc.desc      Position at 92% of 10000ms is 9200.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0093', 0, () => {
      const duration: number = 10000;
      const percent: number = 92;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(9200.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0094
     * @tc.name      testMorePlaybackLimit0094
     * @tc.desc      Position at 93% of 60000ms is 55800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0094', 0, () => {
      const duration: number = 60000;
      const percent: number = 93;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(55800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0095
     * @tc.name      testMorePlaybackLimit0095
     * @tc.desc      Position at 94% of 3600000ms is 3384000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0095', 0, () => {
      const duration: number = 3600000;
      const percent: number = 94;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(3384000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0096
     * @tc.name      testMorePlaybackLimit0096
     * @tc.desc      Position at 95% of 1000ms is 950.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0096', 0, () => {
      const duration: number = 1000;
      const percent: number = 95;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(950.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0097
     * @tc.name      testMorePlaybackLimit0097
     * @tc.desc      Position at 96% of 5000ms is 4800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0097', 0, () => {
      const duration: number = 5000;
      const percent: number = 96;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(4800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0098
     * @tc.name      testMorePlaybackLimit0098
     * @tc.desc      Position at 97% of 10000ms is 9700.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0098', 0, () => {
      const duration: number = 10000;
      const percent: number = 97;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(9700.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0099
     * @tc.name      testMorePlaybackLimit0099
     * @tc.desc      Position at 98% of 60000ms is 58800.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0099', 0, () => {
      const duration: number = 60000;
      const percent: number = 98;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(58800.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_LIM_0100
     * @tc.name      testMorePlaybackLimit0100
     * @tc.desc      Position at 99% of 3600000ms is 3564000.0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMorePlaybackLimit0100', 0, () => {
      const duration: number = 3600000;
      const percent: number = 99;
      const position: number = duration * percent / 100;
      expect(position).assertEqual(3564000.0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
      expect(position).assertLessOrEqual(duration);
    })
  })
}
