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


export default function subtitleCueTimelineExpandedTest() {
  describe('subtitleCueTimelineExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0001
     * @tc.name      testContinueCueTimeline0001
     * @tc.desc      Cue 0-500 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0001', 0, () => {
      const start: number = 0;
      const end: number = 500;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0002
     * @tc.name      testContinueCueTimeline0002
     * @tc.desc      Cue 250-850 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0002', 0, () => {
      const start: number = 250;
      const end: number = 850;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0003
     * @tc.name      testContinueCueTimeline0003
     * @tc.desc      Cue 500-1200 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0003', 0, () => {
      const start: number = 500;
      const end: number = 1200;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0004
     * @tc.name      testContinueCueTimeline0004
     * @tc.desc      Cue 750-1550 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0004', 0, () => {
      const start: number = 750;
      const end: number = 1550;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0005
     * @tc.name      testContinueCueTimeline0005
     * @tc.desc      Cue 1000-1900 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0005', 0, () => {
      const start: number = 1000;
      const end: number = 1900;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0006
     * @tc.name      testContinueCueTimeline0006
     * @tc.desc      Cue 1250-1750 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0006', 0, () => {
      const start: number = 1250;
      const end: number = 1750;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0007
     * @tc.name      testContinueCueTimeline0007
     * @tc.desc      Cue 1500-2100 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0007', 0, () => {
      const start: number = 1500;
      const end: number = 2100;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0008
     * @tc.name      testContinueCueTimeline0008
     * @tc.desc      Cue 1750-2450 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0008', 0, () => {
      const start: number = 1750;
      const end: number = 2450;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0009
     * @tc.name      testContinueCueTimeline0009
     * @tc.desc      Cue 2000-2800 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0009', 0, () => {
      const start: number = 2000;
      const end: number = 2800;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0010
     * @tc.name      testContinueCueTimeline0010
     * @tc.desc      Cue 2250-3150 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0010', 0, () => {
      const start: number = 2250;
      const end: number = 3150;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0011
     * @tc.name      testContinueCueTimeline0011
     * @tc.desc      Cue 2500-3000 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0011', 0, () => {
      const start: number = 2500;
      const end: number = 3000;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0012
     * @tc.name      testContinueCueTimeline0012
     * @tc.desc      Cue 2750-3350 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0012', 0, () => {
      const start: number = 2750;
      const end: number = 3350;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0013
     * @tc.name      testContinueCueTimeline0013
     * @tc.desc      Cue 3000-3700 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0013', 0, () => {
      const start: number = 3000;
      const end: number = 3700;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0014
     * @tc.name      testContinueCueTimeline0014
     * @tc.desc      Cue 3250-4050 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0014', 0, () => {
      const start: number = 3250;
      const end: number = 4050;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0015
     * @tc.name      testContinueCueTimeline0015
     * @tc.desc      Cue 3500-4400 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0015', 0, () => {
      const start: number = 3500;
      const end: number = 4400;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0016
     * @tc.name      testContinueCueTimeline0016
     * @tc.desc      Cue 3750-4250 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0016', 0, () => {
      const start: number = 3750;
      const end: number = 4250;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0017
     * @tc.name      testContinueCueTimeline0017
     * @tc.desc      Cue 4000-4600 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0017', 0, () => {
      const start: number = 4000;
      const end: number = 4600;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0018
     * @tc.name      testContinueCueTimeline0018
     * @tc.desc      Cue 4250-4950 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0018', 0, () => {
      const start: number = 4250;
      const end: number = 4950;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0019
     * @tc.name      testContinueCueTimeline0019
     * @tc.desc      Cue 4500-5300 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0019', 0, () => {
      const start: number = 4500;
      const end: number = 5300;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0020
     * @tc.name      testContinueCueTimeline0020
     * @tc.desc      Cue 4750-5650 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0020', 0, () => {
      const start: number = 4750;
      const end: number = 5650;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0021
     * @tc.name      testContinueCueTimeline0021
     * @tc.desc      Cue 5000-5500 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0021', 0, () => {
      const start: number = 5000;
      const end: number = 5500;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0022
     * @tc.name      testContinueCueTimeline0022
     * @tc.desc      Cue 5250-5850 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0022', 0, () => {
      const start: number = 5250;
      const end: number = 5850;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0023
     * @tc.name      testContinueCueTimeline0023
     * @tc.desc      Cue 5500-6200 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0023', 0, () => {
      const start: number = 5500;
      const end: number = 6200;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0024
     * @tc.name      testContinueCueTimeline0024
     * @tc.desc      Cue 5750-6550 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0024', 0, () => {
      const start: number = 5750;
      const end: number = 6550;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0025
     * @tc.name      testContinueCueTimeline0025
     * @tc.desc      Cue 6000-6900 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0025', 0, () => {
      const start: number = 6000;
      const end: number = 6900;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0026
     * @tc.name      testContinueCueTimeline0026
     * @tc.desc      Cue 6250-6750 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0026', 0, () => {
      const start: number = 6250;
      const end: number = 6750;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0027
     * @tc.name      testContinueCueTimeline0027
     * @tc.desc      Cue 6500-7100 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0027', 0, () => {
      const start: number = 6500;
      const end: number = 7100;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0028
     * @tc.name      testContinueCueTimeline0028
     * @tc.desc      Cue 6750-7450 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0028', 0, () => {
      const start: number = 6750;
      const end: number = 7450;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0029
     * @tc.name      testContinueCueTimeline0029
     * @tc.desc      Cue 7000-7800 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0029', 0, () => {
      const start: number = 7000;
      const end: number = 7800;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0030
     * @tc.name      testContinueCueTimeline0030
     * @tc.desc      Cue 7250-8150 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0030', 0, () => {
      const start: number = 7250;
      const end: number = 8150;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0031
     * @tc.name      testContinueCueTimeline0031
     * @tc.desc      Cue 7500-8000 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0031', 0, () => {
      const start: number = 7500;
      const end: number = 8000;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0032
     * @tc.name      testContinueCueTimeline0032
     * @tc.desc      Cue 7750-8350 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0032', 0, () => {
      const start: number = 7750;
      const end: number = 8350;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0033
     * @tc.name      testContinueCueTimeline0033
     * @tc.desc      Cue 8000-8700 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0033', 0, () => {
      const start: number = 8000;
      const end: number = 8700;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0034
     * @tc.name      testContinueCueTimeline0034
     * @tc.desc      Cue 8250-9050 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0034', 0, () => {
      const start: number = 8250;
      const end: number = 9050;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0035
     * @tc.name      testContinueCueTimeline0035
     * @tc.desc      Cue 8500-9400 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0035', 0, () => {
      const start: number = 8500;
      const end: number = 9400;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0036
     * @tc.name      testContinueCueTimeline0036
     * @tc.desc      Cue 8750-9250 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0036', 0, () => {
      const start: number = 8750;
      const end: number = 9250;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0037
     * @tc.name      testContinueCueTimeline0037
     * @tc.desc      Cue 9000-9600 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0037', 0, () => {
      const start: number = 9000;
      const end: number = 9600;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0038
     * @tc.name      testContinueCueTimeline0038
     * @tc.desc      Cue 9250-9950 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0038', 0, () => {
      const start: number = 9250;
      const end: number = 9950;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0039
     * @tc.name      testContinueCueTimeline0039
     * @tc.desc      Cue 9500-10300 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0039', 0, () => {
      const start: number = 9500;
      const end: number = 10300;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0040
     * @tc.name      testContinueCueTimeline0040
     * @tc.desc      Cue 9750-10650 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0040', 0, () => {
      const start: number = 9750;
      const end: number = 10650;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0041
     * @tc.name      testContinueCueTimeline0041
     * @tc.desc      Cue 10000-10500 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0041', 0, () => {
      const start: number = 10000;
      const end: number = 10500;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0042
     * @tc.name      testContinueCueTimeline0042
     * @tc.desc      Cue 10250-10850 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0042', 0, () => {
      const start: number = 10250;
      const end: number = 10850;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0043
     * @tc.name      testContinueCueTimeline0043
     * @tc.desc      Cue 10500-11200 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0043', 0, () => {
      const start: number = 10500;
      const end: number = 11200;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0044
     * @tc.name      testContinueCueTimeline0044
     * @tc.desc      Cue 10750-11550 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0044', 0, () => {
      const start: number = 10750;
      const end: number = 11550;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0045
     * @tc.name      testContinueCueTimeline0045
     * @tc.desc      Cue 11000-11900 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0045', 0, () => {
      const start: number = 11000;
      const end: number = 11900;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0046
     * @tc.name      testContinueCueTimeline0046
     * @tc.desc      Cue 11250-11750 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0046', 0, () => {
      const start: number = 11250;
      const end: number = 11750;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0047
     * @tc.name      testContinueCueTimeline0047
     * @tc.desc      Cue 11500-12100 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0047', 0, () => {
      const start: number = 11500;
      const end: number = 12100;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0048
     * @tc.name      testContinueCueTimeline0048
     * @tc.desc      Cue 11750-12450 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0048', 0, () => {
      const start: number = 11750;
      const end: number = 12450;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0049
     * @tc.name      testContinueCueTimeline0049
     * @tc.desc      Cue 12000-12800 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0049', 0, () => {
      const start: number = 12000;
      const end: number = 12800;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0050
     * @tc.name      testContinueCueTimeline0050
     * @tc.desc      Cue 12250-13150 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0050', 0, () => {
      const start: number = 12250;
      const end: number = 13150;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0051
     * @tc.name      testContinueCueTimeline0051
     * @tc.desc      Cue 12500-13000 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0051', 0, () => {
      const start: number = 12500;
      const end: number = 13000;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0052
     * @tc.name      testContinueCueTimeline0052
     * @tc.desc      Cue 12750-13350 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0052', 0, () => {
      const start: number = 12750;
      const end: number = 13350;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0053
     * @tc.name      testContinueCueTimeline0053
     * @tc.desc      Cue 13000-13700 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0053', 0, () => {
      const start: number = 13000;
      const end: number = 13700;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0054
     * @tc.name      testContinueCueTimeline0054
     * @tc.desc      Cue 13250-14050 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0054', 0, () => {
      const start: number = 13250;
      const end: number = 14050;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0055
     * @tc.name      testContinueCueTimeline0055
     * @tc.desc      Cue 13500-14400 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0055', 0, () => {
      const start: number = 13500;
      const end: number = 14400;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0056
     * @tc.name      testContinueCueTimeline0056
     * @tc.desc      Cue 13750-14250 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0056', 0, () => {
      const start: number = 13750;
      const end: number = 14250;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0057
     * @tc.name      testContinueCueTimeline0057
     * @tc.desc      Cue 14000-14600 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0057', 0, () => {
      const start: number = 14000;
      const end: number = 14600;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0058
     * @tc.name      testContinueCueTimeline0058
     * @tc.desc      Cue 14250-14950 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0058', 0, () => {
      const start: number = 14250;
      const end: number = 14950;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0059
     * @tc.name      testContinueCueTimeline0059
     * @tc.desc      Cue 14500-15300 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0059', 0, () => {
      const start: number = 14500;
      const end: number = 15300;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0060
     * @tc.name      testContinueCueTimeline0060
     * @tc.desc      Cue 14750-15650 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0060', 0, () => {
      const start: number = 14750;
      const end: number = 15650;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0061
     * @tc.name      testContinueCueTimeline0061
     * @tc.desc      Cue 15000-15500 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0061', 0, () => {
      const start: number = 15000;
      const end: number = 15500;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0062
     * @tc.name      testContinueCueTimeline0062
     * @tc.desc      Cue 15250-15850 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0062', 0, () => {
      const start: number = 15250;
      const end: number = 15850;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0063
     * @tc.name      testContinueCueTimeline0063
     * @tc.desc      Cue 15500-16200 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0063', 0, () => {
      const start: number = 15500;
      const end: number = 16200;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0064
     * @tc.name      testContinueCueTimeline0064
     * @tc.desc      Cue 15750-16550 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0064', 0, () => {
      const start: number = 15750;
      const end: number = 16550;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0065
     * @tc.name      testContinueCueTimeline0065
     * @tc.desc      Cue 16000-16900 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0065', 0, () => {
      const start: number = 16000;
      const end: number = 16900;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0066
     * @tc.name      testContinueCueTimeline0066
     * @tc.desc      Cue 16250-16750 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0066', 0, () => {
      const start: number = 16250;
      const end: number = 16750;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0067
     * @tc.name      testContinueCueTimeline0067
     * @tc.desc      Cue 16500-17100 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0067', 0, () => {
      const start: number = 16500;
      const end: number = 17100;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0068
     * @tc.name      testContinueCueTimeline0068
     * @tc.desc      Cue 16750-17450 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0068', 0, () => {
      const start: number = 16750;
      const end: number = 17450;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0069
     * @tc.name      testContinueCueTimeline0069
     * @tc.desc      Cue 17000-17800 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0069', 0, () => {
      const start: number = 17000;
      const end: number = 17800;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0070
     * @tc.name      testContinueCueTimeline0070
     * @tc.desc      Cue 17250-18150 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0070', 0, () => {
      const start: number = 17250;
      const end: number = 18150;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0071
     * @tc.name      testContinueCueTimeline0071
     * @tc.desc      Cue 17500-18000 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0071', 0, () => {
      const start: number = 17500;
      const end: number = 18000;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0072
     * @tc.name      testContinueCueTimeline0072
     * @tc.desc      Cue 17750-18350 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0072', 0, () => {
      const start: number = 17750;
      const end: number = 18350;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0073
     * @tc.name      testContinueCueTimeline0073
     * @tc.desc      Cue 18000-18700 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0073', 0, () => {
      const start: number = 18000;
      const end: number = 18700;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0074
     * @tc.name      testContinueCueTimeline0074
     * @tc.desc      Cue 18250-19050 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0074', 0, () => {
      const start: number = 18250;
      const end: number = 19050;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0075
     * @tc.name      testContinueCueTimeline0075
     * @tc.desc      Cue 18500-19400 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0075', 0, () => {
      const start: number = 18500;
      const end: number = 19400;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0076
     * @tc.name      testContinueCueTimeline0076
     * @tc.desc      Cue 18750-19250 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0076', 0, () => {
      const start: number = 18750;
      const end: number = 19250;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0077
     * @tc.name      testContinueCueTimeline0077
     * @tc.desc      Cue 19000-19600 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0077', 0, () => {
      const start: number = 19000;
      const end: number = 19600;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0078
     * @tc.name      testContinueCueTimeline0078
     * @tc.desc      Cue 19250-19950 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0078', 0, () => {
      const start: number = 19250;
      const end: number = 19950;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0079
     * @tc.name      testContinueCueTimeline0079
     * @tc.desc      Cue 19500-20300 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0079', 0, () => {
      const start: number = 19500;
      const end: number = 20300;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0080
     * @tc.name      testContinueCueTimeline0080
     * @tc.desc      Cue 19750-20650 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0080', 0, () => {
      const start: number = 19750;
      const end: number = 20650;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0081
     * @tc.name      testContinueCueTimeline0081
     * @tc.desc      Cue 20000-20500 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0081', 0, () => {
      const start: number = 20000;
      const end: number = 20500;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0082
     * @tc.name      testContinueCueTimeline0082
     * @tc.desc      Cue 20250-20850 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0082', 0, () => {
      const start: number = 20250;
      const end: number = 20850;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0083
     * @tc.name      testContinueCueTimeline0083
     * @tc.desc      Cue 20500-21200 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0083', 0, () => {
      const start: number = 20500;
      const end: number = 21200;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0084
     * @tc.name      testContinueCueTimeline0084
     * @tc.desc      Cue 20750-21550 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0084', 0, () => {
      const start: number = 20750;
      const end: number = 21550;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0085
     * @tc.name      testContinueCueTimeline0085
     * @tc.desc      Cue 21000-21900 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0085', 0, () => {
      const start: number = 21000;
      const end: number = 21900;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0086
     * @tc.name      testContinueCueTimeline0086
     * @tc.desc      Cue 21250-21750 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0086', 0, () => {
      const start: number = 21250;
      const end: number = 21750;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0087
     * @tc.name      testContinueCueTimeline0087
     * @tc.desc      Cue 21500-22100 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0087', 0, () => {
      const start: number = 21500;
      const end: number = 22100;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0088
     * @tc.name      testContinueCueTimeline0088
     * @tc.desc      Cue 21750-22450 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0088', 0, () => {
      const start: number = 21750;
      const end: number = 22450;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0089
     * @tc.name      testContinueCueTimeline0089
     * @tc.desc      Cue 22000-22800 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0089', 0, () => {
      const start: number = 22000;
      const end: number = 22800;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0090
     * @tc.name      testContinueCueTimeline0090
     * @tc.desc      Cue 22250-23150 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0090', 0, () => {
      const start: number = 22250;
      const end: number = 23150;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0091
     * @tc.name      testContinueCueTimeline0091
     * @tc.desc      Cue 22500-23000 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0091', 0, () => {
      const start: number = 22500;
      const end: number = 23000;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0092
     * @tc.name      testContinueCueTimeline0092
     * @tc.desc      Cue 22750-23350 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0092', 0, () => {
      const start: number = 22750;
      const end: number = 23350;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0093
     * @tc.name      testContinueCueTimeline0093
     * @tc.desc      Cue 23000-23700 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0093', 0, () => {
      const start: number = 23000;
      const end: number = 23700;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0094
     * @tc.name      testContinueCueTimeline0094
     * @tc.desc      Cue 23250-24050 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0094', 0, () => {
      const start: number = 23250;
      const end: number = 24050;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0095
     * @tc.name      testContinueCueTimeline0095
     * @tc.desc      Cue 23500-24400 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0095', 0, () => {
      const start: number = 23500;
      const end: number = 24400;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0096
     * @tc.name      testContinueCueTimeline0096
     * @tc.desc      Cue 23750-24250 has duration 500.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0096', 0, () => {
      const start: number = 23750;
      const end: number = 24250;
      const duration: number = end - start;
      expect(duration).assertEqual(500);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0097
     * @tc.name      testContinueCueTimeline0097
     * @tc.desc      Cue 24000-24600 has duration 600.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0097', 0, () => {
      const start: number = 24000;
      const end: number = 24600;
      const duration: number = end - start;
      expect(duration).assertEqual(600);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0098
     * @tc.name      testContinueCueTimeline0098
     * @tc.desc      Cue 24250-24950 has duration 700.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0098', 0, () => {
      const start: number = 24250;
      const end: number = 24950;
      const duration: number = end - start;
      expect(duration).assertEqual(700);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0099
     * @tc.name      testContinueCueTimeline0099
     * @tc.desc      Cue 24500-25300 has duration 800.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0099', 0, () => {
      const start: number = 24500;
      const end: number = 25300;
      const duration: number = end - start;
      expect(duration).assertEqual(800);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_CNT_CUE_0100
     * @tc.name      testContinueCueTimeline0100
     * @tc.desc      Cue 24750-25650 has duration 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueCueTimeline0100', 0, () => {
      const start: number = 24750;
      const end: number = 25650;
      const duration: number = end - start;
      expect(duration).assertEqual(900);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
  })
}
