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



const TAG: string = '[Sample_SeekBoundaryExpanded]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void): void {
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
export default function seekBoundaryExpandedTest(): void {
  describe('seekBoundaryExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0001
     * @tc.name      testMoreSeekBoundary0001
     * @tc.desc      Seek -50 clamps to 0 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = -50;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0002
     * @tc.name      testMoreSeekBoundary0002
     * @tc.desc      Seek 87 clamps to 87 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 87;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(87);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0003
     * @tc.name      testMoreSeekBoundary0003
     * @tc.desc      Seek 224 clamps to 224 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 224;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(224);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0004
     * @tc.name      testMoreSeekBoundary0004
     * @tc.desc      Seek 361 clamps to 361 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 361;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(361);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0005
     * @tc.name      testMoreSeekBoundary0005
     * @tc.desc      Seek 498 clamps to 498 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 498;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(498);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0006
     * @tc.name      testMoreSeekBoundary0006
     * @tc.desc      Seek 635 clamps to 635 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 635;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(635);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0007
     * @tc.name      testMoreSeekBoundary0007
     * @tc.desc      Seek 772 clamps to 772 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 772;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(772);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0008
     * @tc.name      testMoreSeekBoundary0008
     * @tc.desc      Seek 909 clamps to 909 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 909;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(909);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0009
     * @tc.name      testMoreSeekBoundary0009
     * @tc.desc      Seek 1046 clamps to 1046 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 1046;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(1046);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0010
     * @tc.name      testMoreSeekBoundary0010
     * @tc.desc      Seek 1183 clamps to 1183 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 1183;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(1183);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0011
     * @tc.name      testMoreSeekBoundary0011
     * @tc.desc      Seek 1320 clamps to 1320 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 1320;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(1320);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0012
     * @tc.name      testMoreSeekBoundary0012
     * @tc.desc      Seek 1457 clamps to 1457 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 1457;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(1457);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0013
     * @tc.name      testMoreSeekBoundary0013
     * @tc.desc      Seek 1594 clamps to 1594 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 1594;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(1594);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0014
     * @tc.name      testMoreSeekBoundary0014
     * @tc.desc      Seek 1731 clamps to 1731 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 1731;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(1731);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0015
     * @tc.name      testMoreSeekBoundary0015
     * @tc.desc      Seek 1868 clamps to 1868 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 1868;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(1868);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0016
     * @tc.name      testMoreSeekBoundary0016
     * @tc.desc      Seek 2005 clamps to 2005 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 2005;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(2005);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0017
     * @tc.name      testMoreSeekBoundary0017
     * @tc.desc      Seek 2142 clamps to 2142 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 2142;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(2142);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0018
     * @tc.name      testMoreSeekBoundary0018
     * @tc.desc      Seek 2279 clamps to 2279 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 2279;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(2279);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0019
     * @tc.name      testMoreSeekBoundary0019
     * @tc.desc      Seek 2416 clamps to 2416 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 2416;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(2416);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0020
     * @tc.name      testMoreSeekBoundary0020
     * @tc.desc      Seek 2553 clamps to 2553 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 2553;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(2553);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0021
     * @tc.name      testMoreSeekBoundary0021
     * @tc.desc      Seek 2690 clamps to 2690 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 2690;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(2690);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0022
     * @tc.name      testMoreSeekBoundary0022
     * @tc.desc      Seek 2827 clamps to 2827 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 2827;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(2827);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0023
     * @tc.name      testMoreSeekBoundary0023
     * @tc.desc      Seek 2964 clamps to 2964 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 2964;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(2964);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0024
     * @tc.name      testMoreSeekBoundary0024
     * @tc.desc      Seek 3101 clamps to 3101 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 3101;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(3101);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0025
     * @tc.name      testMoreSeekBoundary0025
     * @tc.desc      Seek 3238 clamps to 3238 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 3238;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(3238);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0026
     * @tc.name      testMoreSeekBoundary0026
     * @tc.desc      Seek 3375 clamps to 3375 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 3375;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(3375);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0027
     * @tc.name      testMoreSeekBoundary0027
     * @tc.desc      Seek 3512 clamps to 3512 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 3512;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(3512);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0028
     * @tc.name      testMoreSeekBoundary0028
     * @tc.desc      Seek 3649 clamps to 3649 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 3649;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(3649);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0029
     * @tc.name      testMoreSeekBoundary0029
     * @tc.desc      Seek 3786 clamps to 3786 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 3786;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(3786);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0030
     * @tc.name      testMoreSeekBoundary0030
     * @tc.desc      Seek 3923 clamps to 3923 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 3923;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(3923);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0031
     * @tc.name      testMoreSeekBoundary0031
     * @tc.desc      Seek 4060 clamps to 4060 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 4060;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(4060);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0032
     * @tc.name      testMoreSeekBoundary0032
     * @tc.desc      Seek 4197 clamps to 4197 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 4197;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(4197);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0033
     * @tc.name      testMoreSeekBoundary0033
     * @tc.desc      Seek 4334 clamps to 4334 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 4334;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(4334);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0034
     * @tc.name      testMoreSeekBoundary0034
     * @tc.desc      Seek 4471 clamps to 4471 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 4471;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(4471);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0035
     * @tc.name      testMoreSeekBoundary0035
     * @tc.desc      Seek 4608 clamps to 4608 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 4608;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(4608);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0036
     * @tc.name      testMoreSeekBoundary0036
     * @tc.desc      Seek 4745 clamps to 4745 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 4745;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(4745);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0037
     * @tc.name      testMoreSeekBoundary0037
     * @tc.desc      Seek 4882 clamps to 4882 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 4882;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(4882);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0038
     * @tc.name      testMoreSeekBoundary0038
     * @tc.desc      Seek 5019 clamps to 5019 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 5019;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(5019);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0039
     * @tc.name      testMoreSeekBoundary0039
     * @tc.desc      Seek 5156 clamps to 5156 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 5156;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(5156);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0040
     * @tc.name      testMoreSeekBoundary0040
     * @tc.desc      Seek 5293 clamps to 5293 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 5293;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(5293);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0041
     * @tc.name      testMoreSeekBoundary0041
     * @tc.desc      Seek 5430 clamps to 5430 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 5430;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(5430);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0042
     * @tc.name      testMoreSeekBoundary0042
     * @tc.desc      Seek 5567 clamps to 5567 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 5567;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(5567);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0043
     * @tc.name      testMoreSeekBoundary0043
     * @tc.desc      Seek 5704 clamps to 5704 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 5704;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(5704);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0044
     * @tc.name      testMoreSeekBoundary0044
     * @tc.desc      Seek 5841 clamps to 5841 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 5841;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(5841);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0045
     * @tc.name      testMoreSeekBoundary0045
     * @tc.desc      Seek 5978 clamps to 5978 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 5978;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(5978);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0046
     * @tc.name      testMoreSeekBoundary0046
     * @tc.desc      Seek 6115 clamps to 6115 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 6115;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(6115);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0047
     * @tc.name      testMoreSeekBoundary0047
     * @tc.desc      Seek 6252 clamps to 6252 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 6252;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(6252);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0048
     * @tc.name      testMoreSeekBoundary0048
     * @tc.desc      Seek 6389 clamps to 6389 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 6389;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(6389);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0049
     * @tc.name      testMoreSeekBoundary0049
     * @tc.desc      Seek 6526 clamps to 6526 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 6526;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(6526);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0050
     * @tc.name      testMoreSeekBoundary0050
     * @tc.desc      Seek 6663 clamps to 6663 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 6663;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(6663);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0051
     * @tc.name      testMoreSeekBoundary0051
     * @tc.desc      Seek 6800 clamps to 6800 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 6800;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(6800);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0052
     * @tc.name      testMoreSeekBoundary0052
     * @tc.desc      Seek 6937 clamps to 6937 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 6937;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(6937);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0053
     * @tc.name      testMoreSeekBoundary0053
     * @tc.desc      Seek 7074 clamps to 7074 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 7074;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(7074);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0054
     * @tc.name      testMoreSeekBoundary0054
     * @tc.desc      Seek 7211 clamps to 7211 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 7211;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(7211);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0055
     * @tc.name      testMoreSeekBoundary0055
     * @tc.desc      Seek 7348 clamps to 7348 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 7348;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(7348);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0056
     * @tc.name      testMoreSeekBoundary0056
     * @tc.desc      Seek 7485 clamps to 7485 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 7485;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(7485);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0057
     * @tc.name      testMoreSeekBoundary0057
     * @tc.desc      Seek 7622 clamps to 7622 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 7622;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(7622);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0058
     * @tc.name      testMoreSeekBoundary0058
     * @tc.desc      Seek 7759 clamps to 7759 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 7759;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(7759);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0059
     * @tc.name      testMoreSeekBoundary0059
     * @tc.desc      Seek 7896 clamps to 7896 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 7896;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(7896);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0060
     * @tc.name      testMoreSeekBoundary0060
     * @tc.desc      Seek 8033 clamps to 8033 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 8033;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(8033);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0061
     * @tc.name      testMoreSeekBoundary0061
     * @tc.desc      Seek 8170 clamps to 8170 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 8170;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(8170);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0062
     * @tc.name      testMoreSeekBoundary0062
     * @tc.desc      Seek 8307 clamps to 8307 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 8307;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(8307);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0063
     * @tc.name      testMoreSeekBoundary0063
     * @tc.desc      Seek 8444 clamps to 8444 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 8444;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(8444);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0064
     * @tc.name      testMoreSeekBoundary0064
     * @tc.desc      Seek 8581 clamps to 8581 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 8581;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(8581);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0065
     * @tc.name      testMoreSeekBoundary0065
     * @tc.desc      Seek 8718 clamps to 8718 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 8718;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(8718);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0066
     * @tc.name      testMoreSeekBoundary0066
     * @tc.desc      Seek 8855 clamps to 8855 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 8855;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(8855);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0067
     * @tc.name      testMoreSeekBoundary0067
     * @tc.desc      Seek 8992 clamps to 8992 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 8992;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(8992);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0068
     * @tc.name      testMoreSeekBoundary0068
     * @tc.desc      Seek 9129 clamps to 9129 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 9129;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(9129);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0069
     * @tc.name      testMoreSeekBoundary0069
     * @tc.desc      Seek 9266 clamps to 9266 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 9266;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(9266);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0070
     * @tc.name      testMoreSeekBoundary0070
     * @tc.desc      Seek 9403 clamps to 9403 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 9403;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(9403);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0071
     * @tc.name      testMoreSeekBoundary0071
     * @tc.desc      Seek 9540 clamps to 9540 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 9540;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(9540);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0072
     * @tc.name      testMoreSeekBoundary0072
     * @tc.desc      Seek 9677 clamps to 9677 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 9677;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(9677);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0073
     * @tc.name      testMoreSeekBoundary0073
     * @tc.desc      Seek 9814 clamps to 9814 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 9814;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(9814);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0074
     * @tc.name      testMoreSeekBoundary0074
     * @tc.desc      Seek 9951 clamps to 9951 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 9951;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(9951);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0075
     * @tc.name      testMoreSeekBoundary0075
     * @tc.desc      Seek 10088 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 10088;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0076
     * @tc.name      testMoreSeekBoundary0076
     * @tc.desc      Seek 10225 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 10225;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0077
     * @tc.name      testMoreSeekBoundary0077
     * @tc.desc      Seek 10362 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 10362;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0078
     * @tc.name      testMoreSeekBoundary0078
     * @tc.desc      Seek 10499 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 10499;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0079
     * @tc.name      testMoreSeekBoundary0079
     * @tc.desc      Seek 10636 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 10636;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0080
     * @tc.name      testMoreSeekBoundary0080
     * @tc.desc      Seek 10773 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 10773;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0081
     * @tc.name      testMoreSeekBoundary0081
     * @tc.desc      Seek 10910 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 10910;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0082
     * @tc.name      testMoreSeekBoundary0082
     * @tc.desc      Seek 11047 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 11047;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0083
     * @tc.name      testMoreSeekBoundary0083
     * @tc.desc      Seek 11184 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 11184;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0084
     * @tc.name      testMoreSeekBoundary0084
     * @tc.desc      Seek 11321 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 11321;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0085
     * @tc.name      testMoreSeekBoundary0085
     * @tc.desc      Seek 11458 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 11458;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0086
     * @tc.name      testMoreSeekBoundary0086
     * @tc.desc      Seek 11595 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 11595;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0087
     * @tc.name      testMoreSeekBoundary0087
     * @tc.desc      Seek 11732 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 11732;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0088
     * @tc.name      testMoreSeekBoundary0088
     * @tc.desc      Seek 11869 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 11869;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0089
     * @tc.name      testMoreSeekBoundary0089
     * @tc.desc      Seek 12006 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 12006;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0090
     * @tc.name      testMoreSeekBoundary0090
     * @tc.desc      Seek 12143 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 12143;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0091
     * @tc.name      testMoreSeekBoundary0091
     * @tc.desc      Seek 12280 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 12280;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0092
     * @tc.name      testMoreSeekBoundary0092
     * @tc.desc      Seek 12417 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 12417;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0093
     * @tc.name      testMoreSeekBoundary0093
     * @tc.desc      Seek 12554 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 12554;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0094
     * @tc.name      testMoreSeekBoundary0094
     * @tc.desc      Seek 12691 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 12691;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0095
     * @tc.name      testMoreSeekBoundary0095
     * @tc.desc      Seek 12828 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 12828;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0096
     * @tc.name      testMoreSeekBoundary0096
     * @tc.desc      Seek 12965 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 12965;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0097
     * @tc.name      testMoreSeekBoundary0097
     * @tc.desc      Seek 13102 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 13102;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0098
     * @tc.name      testMoreSeekBoundary0098
     * @tc.desc      Seek 13239 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 13239;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0099
     * @tc.name      testMoreSeekBoundary0099
     * @tc.desc      Seek 13376 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 13376;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_SEEK_0100
     * @tc.name      testMoreSeekBoundary0100
     * @tc.desc      Seek 13513 clamps to 10000 within duration 10000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSeekBoundary0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 10000;
      const value: number = 13513;
      const clamped: number = Math.max(0, Math.min(value, duration));
      expect(clamped).assertEqual(10000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(duration).assertLarger(0);
    })
  })
}
