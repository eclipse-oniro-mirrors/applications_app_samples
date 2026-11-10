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


export default function sliderProgressExpandedTest() {
  describe('sliderProgressExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0001
     * @tc.name      testExpSlider0001
     * @tc.desc      Slider value 0 of 10000 yields 0.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0001', 0, () => {
      const current: number = 0;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(0.0);
      expect(seekValue).assertEqual(0);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0002
     * @tc.name      testExpSlider0002
     * @tc.desc      Slider value 100 of 10000 yields 1.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0002', 0, () => {
      const current: number = 100;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(1.0);
      expect(seekValue).assertEqual(100);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0003
     * @tc.name      testExpSlider0003
     * @tc.desc      Slider value 200 of 10000 yields 2.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0003', 0, () => {
      const current: number = 200;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(2.0);
      expect(seekValue).assertEqual(200);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0004
     * @tc.name      testExpSlider0004
     * @tc.desc      Slider value 300 of 10000 yields 3.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0004', 0, () => {
      const current: number = 300;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(3.0);
      expect(seekValue).assertEqual(300);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0005
     * @tc.name      testExpSlider0005
     * @tc.desc      Slider value 400 of 10000 yields 4.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0005', 0, () => {
      const current: number = 400;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(4.0);
      expect(seekValue).assertEqual(400);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0006
     * @tc.name      testExpSlider0006
     * @tc.desc      Slider value 500 of 10000 yields 5.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0006', 0, () => {
      const current: number = 500;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(5.0);
      expect(seekValue).assertEqual(500);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0007
     * @tc.name      testExpSlider0007
     * @tc.desc      Slider value 600 of 10000 yields 6.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0007', 0, () => {
      const current: number = 600;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(6.0);
      expect(seekValue).assertEqual(600);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0008
     * @tc.name      testExpSlider0008
     * @tc.desc      Slider value 700 of 10000 yields 7.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0008', 0, () => {
      const current: number = 700;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(7.0);
      expect(seekValue).assertEqual(700);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0009
     * @tc.name      testExpSlider0009
     * @tc.desc      Slider value 800 of 10000 yields 8.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0009', 0, () => {
      const current: number = 800;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(8.0);
      expect(seekValue).assertEqual(800);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0010
     * @tc.name      testExpSlider0010
     * @tc.desc      Slider value 900 of 10000 yields 9.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0010', 0, () => {
      const current: number = 900;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(9.0);
      expect(seekValue).assertEqual(900);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0011
     * @tc.name      testExpSlider0011
     * @tc.desc      Slider value 1000 of 10000 yields 10.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0011', 0, () => {
      const current: number = 1000;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(10.0);
      expect(seekValue).assertEqual(1000);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0012
     * @tc.name      testExpSlider0012
     * @tc.desc      Slider value 1100 of 10000 yields 11.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0012', 0, () => {
      const current: number = 1100;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(11.0);
      expect(seekValue).assertEqual(1100);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0013
     * @tc.name      testExpSlider0013
     * @tc.desc      Slider value 1200 of 10000 yields 12.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0013', 0, () => {
      const current: number = 1200;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(12.0);
      expect(seekValue).assertEqual(1200);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0014
     * @tc.name      testExpSlider0014
     * @tc.desc      Slider value 1300 of 10000 yields 13.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0014', 0, () => {
      const current: number = 1300;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(13.0);
      expect(seekValue).assertEqual(1300);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0015
     * @tc.name      testExpSlider0015
     * @tc.desc      Slider value 1400 of 10000 yields 14.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0015', 0, () => {
      const current: number = 1400;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(14.0);
      expect(seekValue).assertEqual(1400);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0016
     * @tc.name      testExpSlider0016
     * @tc.desc      Slider value 1500 of 10000 yields 15.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0016', 0, () => {
      const current: number = 1500;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(15.0);
      expect(seekValue).assertEqual(1500);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0017
     * @tc.name      testExpSlider0017
     * @tc.desc      Slider value 1600 of 10000 yields 16.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0017', 0, () => {
      const current: number = 1600;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(16.0);
      expect(seekValue).assertEqual(1600);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0018
     * @tc.name      testExpSlider0018
     * @tc.desc      Slider value 1700 of 10000 yields 17.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0018', 0, () => {
      const current: number = 1700;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(17.0);
      expect(seekValue).assertEqual(1700);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0019
     * @tc.name      testExpSlider0019
     * @tc.desc      Slider value 1800 of 10000 yields 18.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0019', 0, () => {
      const current: number = 1800;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(18.0);
      expect(seekValue).assertEqual(1800);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0020
     * @tc.name      testExpSlider0020
     * @tc.desc      Slider value 1900 of 10000 yields 19.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0020', 0, () => {
      const current: number = 1900;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(19.0);
      expect(seekValue).assertEqual(1900);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0021
     * @tc.name      testExpSlider0021
     * @tc.desc      Slider value 2000 of 10000 yields 20.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0021', 0, () => {
      const current: number = 2000;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(20.0);
      expect(seekValue).assertEqual(2000);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0022
     * @tc.name      testExpSlider0022
     * @tc.desc      Slider value 2100 of 10000 yields 21.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0022', 0, () => {
      const current: number = 2100;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(21.0);
      expect(seekValue).assertEqual(2100);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0023
     * @tc.name      testExpSlider0023
     * @tc.desc      Slider value 2200 of 10000 yields 22.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0023', 0, () => {
      const current: number = 2200;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(22.0);
      expect(seekValue).assertEqual(2200);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0024
     * @tc.name      testExpSlider0024
     * @tc.desc      Slider value 2300 of 10000 yields 23.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0024', 0, () => {
      const current: number = 2300;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(23.0);
      expect(seekValue).assertEqual(2300);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0025
     * @tc.name      testExpSlider0025
     * @tc.desc      Slider value 2400 of 10000 yields 24.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0025', 0, () => {
      const current: number = 2400;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(24.0);
      expect(seekValue).assertEqual(2400);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0026
     * @tc.name      testExpSlider0026
     * @tc.desc      Slider value 2500 of 10000 yields 25.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0026', 0, () => {
      const current: number = 2500;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(25.0);
      expect(seekValue).assertEqual(2500);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0027
     * @tc.name      testExpSlider0027
     * @tc.desc      Slider value 2600 of 10000 yields 26.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0027', 0, () => {
      const current: number = 2600;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(26.0);
      expect(seekValue).assertEqual(2600);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0028
     * @tc.name      testExpSlider0028
     * @tc.desc      Slider value 2700 of 10000 yields 27.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0028', 0, () => {
      const current: number = 2700;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(27.0);
      expect(seekValue).assertEqual(2700);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0029
     * @tc.name      testExpSlider0029
     * @tc.desc      Slider value 2800 of 10000 yields 28.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0029', 0, () => {
      const current: number = 2800;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(28.0);
      expect(seekValue).assertEqual(2800);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0030
     * @tc.name      testExpSlider0030
     * @tc.desc      Slider value 2900 of 10000 yields 29.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0030', 0, () => {
      const current: number = 2900;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(29.0);
      expect(seekValue).assertEqual(2900);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0031
     * @tc.name      testExpSlider0031
     * @tc.desc      Slider value 3000 of 10000 yields 30.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0031', 0, () => {
      const current: number = 3000;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(30.0);
      expect(seekValue).assertEqual(3000);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0032
     * @tc.name      testExpSlider0032
     * @tc.desc      Slider value 3100 of 10000 yields 31.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0032', 0, () => {
      const current: number = 3100;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(31.0);
      expect(seekValue).assertEqual(3100);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0033
     * @tc.name      testExpSlider0033
     * @tc.desc      Slider value 3200 of 10000 yields 32.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0033', 0, () => {
      const current: number = 3200;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(32.0);
      expect(seekValue).assertEqual(3200);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0034
     * @tc.name      testExpSlider0034
     * @tc.desc      Slider value 3300 of 10000 yields 33.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0034', 0, () => {
      const current: number = 3300;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(33.0);
      expect(seekValue).assertEqual(3300);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0035
     * @tc.name      testExpSlider0035
     * @tc.desc      Slider value 3400 of 10000 yields 34.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0035', 0, () => {
      const current: number = 3400;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(34.0);
      expect(seekValue).assertEqual(3400);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0036
     * @tc.name      testExpSlider0036
     * @tc.desc      Slider value 3500 of 10000 yields 35.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0036', 0, () => {
      const current: number = 3500;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(35.0);
      expect(seekValue).assertEqual(3500);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0037
     * @tc.name      testExpSlider0037
     * @tc.desc      Slider value 3600 of 10000 yields 36.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0037', 0, () => {
      const current: number = 3600;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(36.0);
      expect(seekValue).assertEqual(3600);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0038
     * @tc.name      testExpSlider0038
     * @tc.desc      Slider value 3700 of 10000 yields 37.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0038', 0, () => {
      const current: number = 3700;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(37.0);
      expect(seekValue).assertEqual(3700);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0039
     * @tc.name      testExpSlider0039
     * @tc.desc      Slider value 3800 of 10000 yields 38.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0039', 0, () => {
      const current: number = 3800;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(38.0);
      expect(seekValue).assertEqual(3800);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0040
     * @tc.name      testExpSlider0040
     * @tc.desc      Slider value 3900 of 10000 yields 39.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0040', 0, () => {
      const current: number = 3900;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(39.0);
      expect(seekValue).assertEqual(3900);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0041
     * @tc.name      testExpSlider0041
     * @tc.desc      Slider value 4000 of 10000 yields 40.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0041', 0, () => {
      const current: number = 4000;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(40.0);
      expect(seekValue).assertEqual(4000);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0042
     * @tc.name      testExpSlider0042
     * @tc.desc      Slider value 4100 of 10000 yields 41.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0042', 0, () => {
      const current: number = 4100;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(41.0);
      expect(seekValue).assertEqual(4100);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0043
     * @tc.name      testExpSlider0043
     * @tc.desc      Slider value 4200 of 10000 yields 42.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0043', 0, () => {
      const current: number = 4200;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(42.0);
      expect(seekValue).assertEqual(4200);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0044
     * @tc.name      testExpSlider0044
     * @tc.desc      Slider value 4300 of 10000 yields 43.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0044', 0, () => {
      const current: number = 4300;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(43.0);
      expect(seekValue).assertEqual(4300);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0045
     * @tc.name      testExpSlider0045
     * @tc.desc      Slider value 4400 of 10000 yields 44.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0045', 0, () => {
      const current: number = 4400;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(44.0);
      expect(seekValue).assertEqual(4400);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0046
     * @tc.name      testExpSlider0046
     * @tc.desc      Slider value 4500 of 10000 yields 45.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0046', 0, () => {
      const current: number = 4500;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(45.0);
      expect(seekValue).assertEqual(4500);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0047
     * @tc.name      testExpSlider0047
     * @tc.desc      Slider value 4600 of 10000 yields 46.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0047', 0, () => {
      const current: number = 4600;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(46.0);
      expect(seekValue).assertEqual(4600);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0048
     * @tc.name      testExpSlider0048
     * @tc.desc      Slider value 4700 of 10000 yields 47.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0048', 0, () => {
      const current: number = 4700;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(47.0);
      expect(seekValue).assertEqual(4700);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0049
     * @tc.name      testExpSlider0049
     * @tc.desc      Slider value 4800 of 10000 yields 48.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0049', 0, () => {
      const current: number = 4800;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(48.0);
      expect(seekValue).assertEqual(4800);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0050
     * @tc.name      testExpSlider0050
     * @tc.desc      Slider value 4900 of 10000 yields 49.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0050', 0, () => {
      const current: number = 4900;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(49.0);
      expect(seekValue).assertEqual(4900);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0051
     * @tc.name      testExpSlider0051
     * @tc.desc      Slider value 5000 of 10000 yields 50.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0051', 0, () => {
      const current: number = 5000;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(50.0);
      expect(seekValue).assertEqual(5000);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0052
     * @tc.name      testExpSlider0052
     * @tc.desc      Slider value 5100 of 10000 yields 51.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0052', 0, () => {
      const current: number = 5100;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(51.0);
      expect(seekValue).assertEqual(5100);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0053
     * @tc.name      testExpSlider0053
     * @tc.desc      Slider value 5200 of 10000 yields 52.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0053', 0, () => {
      const current: number = 5200;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(52.0);
      expect(seekValue).assertEqual(5200);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0054
     * @tc.name      testExpSlider0054
     * @tc.desc      Slider value 5300 of 10000 yields 53.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0054', 0, () => {
      const current: number = 5300;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(53.0);
      expect(seekValue).assertEqual(5300);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0055
     * @tc.name      testExpSlider0055
     * @tc.desc      Slider value 5400 of 10000 yields 54.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0055', 0, () => {
      const current: number = 5400;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(54.0);
      expect(seekValue).assertEqual(5400);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0056
     * @tc.name      testExpSlider0056
     * @tc.desc      Slider value 5500 of 10000 yields 55.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0056', 0, () => {
      const current: number = 5500;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(55.0);
      expect(seekValue).assertEqual(5500);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0057
     * @tc.name      testExpSlider0057
     * @tc.desc      Slider value 5600 of 10000 yields 56.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0057', 0, () => {
      const current: number = 5600;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(56.0);
      expect(seekValue).assertEqual(5600);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0058
     * @tc.name      testExpSlider0058
     * @tc.desc      Slider value 5700 of 10000 yields 57.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0058', 0, () => {
      const current: number = 5700;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(57.0);
      expect(seekValue).assertEqual(5700);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0059
     * @tc.name      testExpSlider0059
     * @tc.desc      Slider value 5800 of 10000 yields 58.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0059', 0, () => {
      const current: number = 5800;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(58.0);
      expect(seekValue).assertEqual(5800);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0060
     * @tc.name      testExpSlider0060
     * @tc.desc      Slider value 5900 of 10000 yields 59.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0060', 0, () => {
      const current: number = 5900;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(59.0);
      expect(seekValue).assertEqual(5900);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0061
     * @tc.name      testExpSlider0061
     * @tc.desc      Slider value 6000 of 10000 yields 60.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0061', 0, () => {
      const current: number = 6000;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(60.0);
      expect(seekValue).assertEqual(6000);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0062
     * @tc.name      testExpSlider0062
     * @tc.desc      Slider value 6100 of 10000 yields 61.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0062', 0, () => {
      const current: number = 6100;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(61.0);
      expect(seekValue).assertEqual(6100);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0063
     * @tc.name      testExpSlider0063
     * @tc.desc      Slider value 6200 of 10000 yields 62.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0063', 0, () => {
      const current: number = 6200;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(62.0);
      expect(seekValue).assertEqual(6200);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0064
     * @tc.name      testExpSlider0064
     * @tc.desc      Slider value 6300 of 10000 yields 63.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0064', 0, () => {
      const current: number = 6300;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(63.0);
      expect(seekValue).assertEqual(6300);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0065
     * @tc.name      testExpSlider0065
     * @tc.desc      Slider value 6400 of 10000 yields 64.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0065', 0, () => {
      const current: number = 6400;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(64.0);
      expect(seekValue).assertEqual(6400);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0066
     * @tc.name      testExpSlider0066
     * @tc.desc      Slider value 6500 of 10000 yields 65.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0066', 0, () => {
      const current: number = 6500;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(65.0);
      expect(seekValue).assertEqual(6500);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0067
     * @tc.name      testExpSlider0067
     * @tc.desc      Slider value 6600 of 10000 yields 66.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0067', 0, () => {
      const current: number = 6600;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(66.0);
      expect(seekValue).assertEqual(6600);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0068
     * @tc.name      testExpSlider0068
     * @tc.desc      Slider value 6700 of 10000 yields 67.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0068', 0, () => {
      const current: number = 6700;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(67.0);
      expect(seekValue).assertEqual(6700);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0069
     * @tc.name      testExpSlider0069
     * @tc.desc      Slider value 6800 of 10000 yields 68.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0069', 0, () => {
      const current: number = 6800;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(68.0);
      expect(seekValue).assertEqual(6800);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0070
     * @tc.name      testExpSlider0070
     * @tc.desc      Slider value 6900 of 10000 yields 69.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0070', 0, () => {
      const current: number = 6900;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(69.0);
      expect(seekValue).assertEqual(6900);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0071
     * @tc.name      testExpSlider0071
     * @tc.desc      Slider value 7000 of 10000 yields 70.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0071', 0, () => {
      const current: number = 7000;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(70.0);
      expect(seekValue).assertEqual(7000);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0072
     * @tc.name      testExpSlider0072
     * @tc.desc      Slider value 7100 of 10000 yields 71.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0072', 0, () => {
      const current: number = 7100;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(71.0);
      expect(seekValue).assertEqual(7100);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0073
     * @tc.name      testExpSlider0073
     * @tc.desc      Slider value 7200 of 10000 yields 72.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0073', 0, () => {
      const current: number = 7200;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(72.0);
      expect(seekValue).assertEqual(7200);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0074
     * @tc.name      testExpSlider0074
     * @tc.desc      Slider value 7300 of 10000 yields 73.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0074', 0, () => {
      const current: number = 7300;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(73.0);
      expect(seekValue).assertEqual(7300);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0075
     * @tc.name      testExpSlider0075
     * @tc.desc      Slider value 7400 of 10000 yields 74.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0075', 0, () => {
      const current: number = 7400;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(74.0);
      expect(seekValue).assertEqual(7400);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0076
     * @tc.name      testExpSlider0076
     * @tc.desc      Slider value 7500 of 10000 yields 75.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0076', 0, () => {
      const current: number = 7500;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(75.0);
      expect(seekValue).assertEqual(7500);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0077
     * @tc.name      testExpSlider0077
     * @tc.desc      Slider value 7600 of 10000 yields 76.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0077', 0, () => {
      const current: number = 7600;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(76.0);
      expect(seekValue).assertEqual(7600);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0078
     * @tc.name      testExpSlider0078
     * @tc.desc      Slider value 7700 of 10000 yields 77.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0078', 0, () => {
      const current: number = 7700;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(77.0);
      expect(seekValue).assertEqual(7700);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0079
     * @tc.name      testExpSlider0079
     * @tc.desc      Slider value 7800 of 10000 yields 78.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0079', 0, () => {
      const current: number = 7800;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(78.0);
      expect(seekValue).assertEqual(7800);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0080
     * @tc.name      testExpSlider0080
     * @tc.desc      Slider value 7900 of 10000 yields 79.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0080', 0, () => {
      const current: number = 7900;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(79.0);
      expect(seekValue).assertEqual(7900);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0081
     * @tc.name      testExpSlider0081
     * @tc.desc      Slider value 8000 of 10000 yields 80.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0081', 0, () => {
      const current: number = 8000;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(80.0);
      expect(seekValue).assertEqual(8000);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0082
     * @tc.name      testExpSlider0082
     * @tc.desc      Slider value 8100 of 10000 yields 81.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0082', 0, () => {
      const current: number = 8100;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(81.0);
      expect(seekValue).assertEqual(8100);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0083
     * @tc.name      testExpSlider0083
     * @tc.desc      Slider value 8200 of 10000 yields 82.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0083', 0, () => {
      const current: number = 8200;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(82.0);
      expect(seekValue).assertEqual(8200);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0084
     * @tc.name      testExpSlider0084
     * @tc.desc      Slider value 8300 of 10000 yields 83.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0084', 0, () => {
      const current: number = 8300;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(83.0);
      expect(seekValue).assertEqual(8300);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0085
     * @tc.name      testExpSlider0085
     * @tc.desc      Slider value 8400 of 10000 yields 84.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0085', 0, () => {
      const current: number = 8400;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(84.0);
      expect(seekValue).assertEqual(8400);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0086
     * @tc.name      testExpSlider0086
     * @tc.desc      Slider value 8500 of 10000 yields 85.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0086', 0, () => {
      const current: number = 8500;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(85.0);
      expect(seekValue).assertEqual(8500);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0087
     * @tc.name      testExpSlider0087
     * @tc.desc      Slider value 8600 of 10000 yields 86.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0087', 0, () => {
      const current: number = 8600;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(86.0);
      expect(seekValue).assertEqual(8600);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0088
     * @tc.name      testExpSlider0088
     * @tc.desc      Slider value 8700 of 10000 yields 87.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0088', 0, () => {
      const current: number = 8700;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(87.0);
      expect(seekValue).assertEqual(8700);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0089
     * @tc.name      testExpSlider0089
     * @tc.desc      Slider value 8800 of 10000 yields 88.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0089', 0, () => {
      const current: number = 8800;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(88.0);
      expect(seekValue).assertEqual(8800);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0090
     * @tc.name      testExpSlider0090
     * @tc.desc      Slider value 8900 of 10000 yields 89.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0090', 0, () => {
      const current: number = 8900;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(89.0);
      expect(seekValue).assertEqual(8900);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0091
     * @tc.name      testExpSlider0091
     * @tc.desc      Slider value 9000 of 10000 yields 90.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0091', 0, () => {
      const current: number = 9000;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(90.0);
      expect(seekValue).assertEqual(9000);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0092
     * @tc.name      testExpSlider0092
     * @tc.desc      Slider value 9100 of 10000 yields 91.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0092', 0, () => {
      const current: number = 9100;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(91.0);
      expect(seekValue).assertEqual(9100);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0093
     * @tc.name      testExpSlider0093
     * @tc.desc      Slider value 9200 of 10000 yields 92.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0093', 0, () => {
      const current: number = 9200;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(92.0);
      expect(seekValue).assertEqual(9200);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0094
     * @tc.name      testExpSlider0094
     * @tc.desc      Slider value 9300 of 10000 yields 93.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0094', 0, () => {
      const current: number = 9300;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(93.0);
      expect(seekValue).assertEqual(9300);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0095
     * @tc.name      testExpSlider0095
     * @tc.desc      Slider value 9400 of 10000 yields 94.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0095', 0, () => {
      const current: number = 9400;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(94.0);
      expect(seekValue).assertEqual(9400);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0096
     * @tc.name      testExpSlider0096
     * @tc.desc      Slider value 9500 of 10000 yields 95.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0096', 0, () => {
      const current: number = 9500;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(95.0);
      expect(seekValue).assertEqual(9500);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0097
     * @tc.name      testExpSlider0097
     * @tc.desc      Slider value 9600 of 10000 yields 96.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0097', 0, () => {
      const current: number = 9600;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(96.0);
      expect(seekValue).assertEqual(9600);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0098
     * @tc.name      testExpSlider0098
     * @tc.desc      Slider value 9700 of 10000 yields 97.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0098', 0, () => {
      const current: number = 9700;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(97.0);
      expect(seekValue).assertEqual(9700);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0099
     * @tc.name      testExpSlider0099
     * @tc.desc      Slider value 9800 of 10000 yields 98.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0099', 0, () => {
      const current: number = 9800;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(98.0);
      expect(seekValue).assertEqual(9800);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SLD_0100
     * @tc.name      testExpSlider0100
     * @tc.desc      Slider value 9900 of 10000 yields 99.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSlider0100', 0, () => {
      const current: number = 9900;
      const duration: number = 10000;
      const percent: number = current * 100 / duration;
      const seekValue: number = Math.min(current, duration);
      expect(percent).assertEqual(99.0);
      expect(seekValue).assertEqual(9900);
      expect(percent).assertLargerOrEqual(0);
      expect(percent).assertLessOrEqual(100);
    })
  })
}
