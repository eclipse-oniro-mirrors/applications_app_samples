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
import { describe, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';



const TAG: string = '[Sample_PlayerTimeline8W]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}


function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}
export default function playerTimeline8wTest(): void {
  describe('playerTimeline8wTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0001
     * @tc.name      test8wPlayerTimeline0001
     * @tc.desc      Timeline position 0 of 10000 yields 0.0 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 0;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(0.0);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0002
     * @tc.name      test8wPlayerTimeline0002
     * @tc.desc      Timeline position 137 of 20000 yields 0.685 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 137;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(0.685);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0003
     * @tc.name      test8wPlayerTimeline0003
     * @tc.desc      Timeline position 274 of 30000 yields 0.9133333333333333 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 274;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(0.9133333333333333);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0004
     * @tc.name      test8wPlayerTimeline0004
     * @tc.desc      Timeline position 411 of 60000 yields 0.685 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 411;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(0.685);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0005
     * @tc.name      test8wPlayerTimeline0005
     * @tc.desc      Timeline position 548 of 120000 yields 0.45666666666666667 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 548;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(0.45666666666666667);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0006
     * @tc.name      test8wPlayerTimeline0006
     * @tc.desc      Timeline position 685 of 10000 yields 6.85 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 685;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(6.85);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0007
     * @tc.name      test8wPlayerTimeline0007
     * @tc.desc      Timeline position 822 of 20000 yields 4.11 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 822;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(4.11);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0008
     * @tc.name      test8wPlayerTimeline0008
     * @tc.desc      Timeline position 959 of 30000 yields 3.1966666666666668 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 959;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(3.1966666666666668);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0009
     * @tc.name      test8wPlayerTimeline0009
     * @tc.desc      Timeline position 1096 of 60000 yields 1.8266666666666667 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 1096;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(1.8266666666666667);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0010
     * @tc.name      test8wPlayerTimeline0010
     * @tc.desc      Timeline position 1233 of 120000 yields 1.0275 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 1233;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(1.0275);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0011
     * @tc.name      test8wPlayerTimeline0011
     * @tc.desc      Timeline position 1370 of 10000 yields 13.7 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 1370;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(13.7);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0012
     * @tc.name      test8wPlayerTimeline0012
     * @tc.desc      Timeline position 1507 of 20000 yields 7.535 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 1507;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(7.535);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0013
     * @tc.name      test8wPlayerTimeline0013
     * @tc.desc      Timeline position 1644 of 30000 yields 5.48 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 1644;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(5.48);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0014
     * @tc.name      test8wPlayerTimeline0014
     * @tc.desc      Timeline position 1781 of 60000 yields 2.9683333333333333 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 1781;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(2.9683333333333333);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0015
     * @tc.name      test8wPlayerTimeline0015
     * @tc.desc      Timeline position 1918 of 120000 yields 1.5983333333333334 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 1918;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(1.5983333333333334);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0016
     * @tc.name      test8wPlayerTimeline0016
     * @tc.desc      Timeline position 2055 of 10000 yields 20.55 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 2055;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(20.55);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0017
     * @tc.name      test8wPlayerTimeline0017
     * @tc.desc      Timeline position 2192 of 20000 yields 10.96 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 2192;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(10.96);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0018
     * @tc.name      test8wPlayerTimeline0018
     * @tc.desc      Timeline position 2329 of 30000 yields 7.763333333333334 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 2329;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(7.763333333333334);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0019
     * @tc.name      test8wPlayerTimeline0019
     * @tc.desc      Timeline position 2466 of 60000 yields 4.11 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 2466;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(4.11);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0020
     * @tc.name      test8wPlayerTimeline0020
     * @tc.desc      Timeline position 2603 of 120000 yields 2.1691666666666665 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 2603;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(2.1691666666666665);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0021
     * @tc.name      test8wPlayerTimeline0021
     * @tc.desc      Timeline position 2740 of 10000 yields 27.4 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 2740;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(27.4);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0022
     * @tc.name      test8wPlayerTimeline0022
     * @tc.desc      Timeline position 2877 of 20000 yields 14.385 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 2877;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(14.385);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0023
     * @tc.name      test8wPlayerTimeline0023
     * @tc.desc      Timeline position 3014 of 30000 yields 10.046666666666667 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 3014;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(10.046666666666667);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0024
     * @tc.name      test8wPlayerTimeline0024
     * @tc.desc      Timeline position 3151 of 60000 yields 5.251666666666667 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 3151;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(5.251666666666667);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0025
     * @tc.name      test8wPlayerTimeline0025
     * @tc.desc      Timeline position 3288 of 120000 yields 2.74 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 3288;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(2.74);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0026
     * @tc.name      test8wPlayerTimeline0026
     * @tc.desc      Timeline position 3425 of 10000 yields 34.25 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 3425;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(34.25);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0027
     * @tc.name      test8wPlayerTimeline0027
     * @tc.desc      Timeline position 3562 of 20000 yields 17.81 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 3562;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(17.81);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0028
     * @tc.name      test8wPlayerTimeline0028
     * @tc.desc      Timeline position 3699 of 30000 yields 12.33 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 3699;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(12.33);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0029
     * @tc.name      test8wPlayerTimeline0029
     * @tc.desc      Timeline position 3836 of 60000 yields 6.3933333333333335 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 3836;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(6.3933333333333335);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0030
     * @tc.name      test8wPlayerTimeline0030
     * @tc.desc      Timeline position 3973 of 120000 yields 3.3108333333333335 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 3973;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(3.3108333333333335);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0031
     * @tc.name      test8wPlayerTimeline0031
     * @tc.desc      Timeline position 4110 of 10000 yields 41.1 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 4110;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(41.1);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0032
     * @tc.name      test8wPlayerTimeline0032
     * @tc.desc      Timeline position 4247 of 20000 yields 21.235 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 4247;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(21.235);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0033
     * @tc.name      test8wPlayerTimeline0033
     * @tc.desc      Timeline position 4384 of 30000 yields 14.613333333333333 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 4384;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(14.613333333333333);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0034
     * @tc.name      test8wPlayerTimeline0034
     * @tc.desc      Timeline position 4521 of 60000 yields 7.535 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 4521;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(7.535);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0035
     * @tc.name      test8wPlayerTimeline0035
     * @tc.desc      Timeline position 4658 of 120000 yields 3.881666666666667 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 4658;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(3.881666666666667);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0036
     * @tc.name      test8wPlayerTimeline0036
     * @tc.desc      Timeline position 4795 of 10000 yields 47.95 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 4795;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(47.95);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0037
     * @tc.name      test8wPlayerTimeline0037
     * @tc.desc      Timeline position 4932 of 20000 yields 24.66 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 4932;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(24.66);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0038
     * @tc.name      test8wPlayerTimeline0038
     * @tc.desc      Timeline position 5069 of 30000 yields 16.89666666666667 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 5069;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(16.89666666666667);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0039
     * @tc.name      test8wPlayerTimeline0039
     * @tc.desc      Timeline position 5206 of 60000 yields 8.676666666666666 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 5206;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(8.676666666666666);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0040
     * @tc.name      test8wPlayerTimeline0040
     * @tc.desc      Timeline position 5343 of 120000 yields 4.4525 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 5343;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(4.4525);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0041
     * @tc.name      test8wPlayerTimeline0041
     * @tc.desc      Timeline position 5480 of 10000 yields 54.8 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 5480;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(54.8);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0042
     * @tc.name      test8wPlayerTimeline0042
     * @tc.desc      Timeline position 5617 of 20000 yields 28.085 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 5617;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(28.085);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0043
     * @tc.name      test8wPlayerTimeline0043
     * @tc.desc      Timeline position 5754 of 30000 yields 19.18 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 5754;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(19.18);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0044
     * @tc.name      test8wPlayerTimeline0044
     * @tc.desc      Timeline position 5891 of 60000 yields 9.818333333333333 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 5891;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(9.818333333333333);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0045
     * @tc.name      test8wPlayerTimeline0045
     * @tc.desc      Timeline position 6028 of 120000 yields 5.023333333333333 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 6028;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(5.023333333333333);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0046
     * @tc.name      test8wPlayerTimeline0046
     * @tc.desc      Timeline position 6165 of 10000 yields 61.65 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 6165;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(61.65);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0047
     * @tc.name      test8wPlayerTimeline0047
     * @tc.desc      Timeline position 6302 of 20000 yields 31.51 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 6302;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(31.51);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0048
     * @tc.name      test8wPlayerTimeline0048
     * @tc.desc      Timeline position 6439 of 30000 yields 21.463333333333335 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 6439;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(21.463333333333335);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0049
     * @tc.name      test8wPlayerTimeline0049
     * @tc.desc      Timeline position 6576 of 60000 yields 10.96 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 6576;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(10.96);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0050
     * @tc.name      test8wPlayerTimeline0050
     * @tc.desc      Timeline position 6713 of 120000 yields 5.594166666666666 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 6713;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(5.594166666666666);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0051
     * @tc.name      test8wPlayerTimeline0051
     * @tc.desc      Timeline position 6850 of 10000 yields 68.5 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 6850;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(68.5);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0052
     * @tc.name      test8wPlayerTimeline0052
     * @tc.desc      Timeline position 6987 of 20000 yields 34.935 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 6987;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(34.935);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0053
     * @tc.name      test8wPlayerTimeline0053
     * @tc.desc      Timeline position 7124 of 30000 yields 23.746666666666666 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 7124;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(23.746666666666666);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0054
     * @tc.name      test8wPlayerTimeline0054
     * @tc.desc      Timeline position 7261 of 60000 yields 12.101666666666667 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 7261;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(12.101666666666667);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0055
     * @tc.name      test8wPlayerTimeline0055
     * @tc.desc      Timeline position 7398 of 120000 yields 6.165 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 7398;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(6.165);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0056
     * @tc.name      test8wPlayerTimeline0056
     * @tc.desc      Timeline position 7535 of 10000 yields 75.35 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 7535;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(75.35);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0057
     * @tc.name      test8wPlayerTimeline0057
     * @tc.desc      Timeline position 7672 of 20000 yields 38.36 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 7672;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(38.36);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0058
     * @tc.name      test8wPlayerTimeline0058
     * @tc.desc      Timeline position 7809 of 30000 yields 26.03 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 7809;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(26.03);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0059
     * @tc.name      test8wPlayerTimeline0059
     * @tc.desc      Timeline position 7946 of 60000 yields 13.243333333333334 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 7946;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(13.243333333333334);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0060
     * @tc.name      test8wPlayerTimeline0060
     * @tc.desc      Timeline position 8083 of 120000 yields 6.735833333333333 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 8083;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(6.735833333333333);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0061
     * @tc.name      test8wPlayerTimeline0061
     * @tc.desc      Timeline position 8220 of 10000 yields 82.2 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 8220;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(82.2);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0062
     * @tc.name      test8wPlayerTimeline0062
     * @tc.desc      Timeline position 8357 of 20000 yields 41.785 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 8357;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(41.785);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0063
     * @tc.name      test8wPlayerTimeline0063
     * @tc.desc      Timeline position 8494 of 30000 yields 28.313333333333333 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 8494;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(28.313333333333333);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0064
     * @tc.name      test8wPlayerTimeline0064
     * @tc.desc      Timeline position 8631 of 60000 yields 14.385 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 8631;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(14.385);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0065
     * @tc.name      test8wPlayerTimeline0065
     * @tc.desc      Timeline position 8768 of 120000 yields 7.306666666666667 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 8768;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(7.306666666666667);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0066
     * @tc.name      test8wPlayerTimeline0066
     * @tc.desc      Timeline position 8905 of 10000 yields 89.05 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 8905;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(89.05);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0067
     * @tc.name      test8wPlayerTimeline0067
     * @tc.desc      Timeline position 9042 of 20000 yields 45.21 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 9042;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(45.21);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0068
     * @tc.name      test8wPlayerTimeline0068
     * @tc.desc      Timeline position 9179 of 30000 yields 30.596666666666668 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 9179;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(30.596666666666668);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0069
     * @tc.name      test8wPlayerTimeline0069
     * @tc.desc      Timeline position 9316 of 60000 yields 15.526666666666667 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 9316;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(15.526666666666667);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0070
     * @tc.name      test8wPlayerTimeline0070
     * @tc.desc      Timeline position 9453 of 120000 yields 7.8775 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 9453;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(7.8775);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0071
     * @tc.name      test8wPlayerTimeline0071
     * @tc.desc      Timeline position 9590 of 10000 yields 95.9 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 9590;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(95.9);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0072
     * @tc.name      test8wPlayerTimeline0072
     * @tc.desc      Timeline position 9727 of 20000 yields 48.635 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 9727;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(48.635);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0073
     * @tc.name      test8wPlayerTimeline0073
     * @tc.desc      Timeline position 9864 of 30000 yields 32.88 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 9864;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(32.88);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0074
     * @tc.name      test8wPlayerTimeline0074
     * @tc.desc      Timeline position 10001 of 60000 yields 16.668333333333333 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 10001;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(16.668333333333333);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0075
     * @tc.name      test8wPlayerTimeline0075
     * @tc.desc      Timeline position 10138 of 120000 yields 8.448333333333334 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 10138;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(8.448333333333334);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0076
     * @tc.name      test8wPlayerTimeline0076
     * @tc.desc      Timeline position 275 of 10000 yields 2.75 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 275;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(2.75);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0077
     * @tc.name      test8wPlayerTimeline0077
     * @tc.desc      Timeline position 10412 of 20000 yields 52.06 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 10412;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(52.06);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0078
     * @tc.name      test8wPlayerTimeline0078
     * @tc.desc      Timeline position 10549 of 30000 yields 35.163333333333334 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 10549;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(35.163333333333334);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0079
     * @tc.name      test8wPlayerTimeline0079
     * @tc.desc      Timeline position 10686 of 60000 yields 17.81 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 10686;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(17.81);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0080
     * @tc.name      test8wPlayerTimeline0080
     * @tc.desc      Timeline position 10823 of 120000 yields 9.019166666666667 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 10823;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(9.019166666666667);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0081
     * @tc.name      test8wPlayerTimeline0081
     * @tc.desc      Timeline position 960 of 10000 yields 9.6 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 960;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(9.6);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0082
     * @tc.name      test8wPlayerTimeline0082
     * @tc.desc      Timeline position 11097 of 20000 yields 55.485 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 11097;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(55.485);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0083
     * @tc.name      test8wPlayerTimeline0083
     * @tc.desc      Timeline position 11234 of 30000 yields 37.446666666666665 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 11234;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(37.446666666666665);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0084
     * @tc.name      test8wPlayerTimeline0084
     * @tc.desc      Timeline position 11371 of 60000 yields 18.951666666666668 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 11371;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(18.951666666666668);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0085
     * @tc.name      test8wPlayerTimeline0085
     * @tc.desc      Timeline position 11508 of 120000 yields 9.59 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 11508;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(9.59);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0086
     * @tc.name      test8wPlayerTimeline0086
     * @tc.desc      Timeline position 1645 of 10000 yields 16.45 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 1645;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(16.45);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0087
     * @tc.name      test8wPlayerTimeline0087
     * @tc.desc      Timeline position 11782 of 20000 yields 58.91 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 11782;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(58.91);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0088
     * @tc.name      test8wPlayerTimeline0088
     * @tc.desc      Timeline position 11919 of 30000 yields 39.73 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 11919;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(39.73);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0089
     * @tc.name      test8wPlayerTimeline0089
     * @tc.desc      Timeline position 12056 of 60000 yields 20.093333333333334 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 12056;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(20.093333333333334);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0090
     * @tc.name      test8wPlayerTimeline0090
     * @tc.desc      Timeline position 12193 of 120000 yields 10.160833333333333 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 12193;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(10.160833333333333);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0091
     * @tc.name      test8wPlayerTimeline0091
     * @tc.desc      Timeline position 2330 of 10000 yields 23.3 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 2330;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(23.3);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0092
     * @tc.name      test8wPlayerTimeline0092
     * @tc.desc      Timeline position 12467 of 20000 yields 62.335 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 12467;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(62.335);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0093
     * @tc.name      test8wPlayerTimeline0093
     * @tc.desc      Timeline position 12604 of 30000 yields 42.013333333333335 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 12604;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(42.013333333333335);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0094
     * @tc.name      test8wPlayerTimeline0094
     * @tc.desc      Timeline position 12741 of 60000 yields 21.235 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 12741;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(21.235);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0095
     * @tc.name      test8wPlayerTimeline0095
     * @tc.desc      Timeline position 12878 of 120000 yields 10.731666666666667 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 12878;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(10.731666666666667);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0096
     * @tc.name      test8wPlayerTimeline0096
     * @tc.desc      Timeline position 3015 of 10000 yields 30.15 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const position: number = 3015;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(30.15);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0097
     * @tc.name      test8wPlayerTimeline0097
     * @tc.desc      Timeline position 13152 of 20000 yields 65.76 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 20000;
      const position: number = 13152;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(65.76);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0098
     * @tc.name      test8wPlayerTimeline0098
     * @tc.desc      Timeline position 13289 of 30000 yields 44.29666666666667 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 30000;
      const position: number = 13289;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(44.29666666666667);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0099
     * @tc.name      test8wPlayerTimeline0099
     * @tc.desc      Timeline position 13426 of 60000 yields 22.376666666666665 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const position: number = 13426;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(22.376666666666665);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_8W_TIME_0100
     * @tc.name      test8wPlayerTimeline0100
     * @tc.desc      Timeline position 13563 of 120000 yields 11.3025 percent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('test8wPlayerTimeline0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const position: number = 13563;
      const percent: number = position * 100 / duration;
      expect(percent).assertEqual(11.3025);
      expect(position).assertLargerOrEqual(0);
      expect(position).assertLessOrEqual(duration);
      expect(percent).assertLessOrEqual(100);
    })
  })
}
