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


export default function subtitleCueExpandedTest() {
  describe('subtitleCueExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0001
     * @tc.name      testExpSubtitleCue0001
     * @tc.desc      Cue 0-1000ms has duration 1000ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 0;
      const end: number = 1000;
      const duration: number = end - start;
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0002
     * @tc.name      testExpSubtitleCue0002
     * @tc.desc      Cue 500-1501ms has duration 1001ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 500;
      const end: number = 1501;
      const duration: number = end - start;
      expect(duration).assertEqual(1001);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0003
     * @tc.name      testExpSubtitleCue0003
     * @tc.desc      Cue 1000-2002ms has duration 1002ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1000;
      const end: number = 2002;
      const duration: number = end - start;
      expect(duration).assertEqual(1002);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0004
     * @tc.name      testExpSubtitleCue0004
     * @tc.desc      Cue 1500-2503ms has duration 1003ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1500;
      const end: number = 2503;
      const duration: number = end - start;
      expect(duration).assertEqual(1003);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0005
     * @tc.name      testExpSubtitleCue0005
     * @tc.desc      Cue 2000-3004ms has duration 1004ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 2000;
      const end: number = 3004;
      const duration: number = end - start;
      expect(duration).assertEqual(1004);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0006
     * @tc.name      testExpSubtitleCue0006
     * @tc.desc      Cue 2500-3505ms has duration 1005ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 2500;
      const end: number = 3505;
      const duration: number = end - start;
      expect(duration).assertEqual(1005);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0007
     * @tc.name      testExpSubtitleCue0007
     * @tc.desc      Cue 3000-4006ms has duration 1006ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 3000;
      const end: number = 4006;
      const duration: number = end - start;
      expect(duration).assertEqual(1006);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0008
     * @tc.name      testExpSubtitleCue0008
     * @tc.desc      Cue 3500-4507ms has duration 1007ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 3500;
      const end: number = 4507;
      const duration: number = end - start;
      expect(duration).assertEqual(1007);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0009
     * @tc.name      testExpSubtitleCue0009
     * @tc.desc      Cue 4000-5008ms has duration 1008ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 4000;
      const end: number = 5008;
      const duration: number = end - start;
      expect(duration).assertEqual(1008);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0010
     * @tc.name      testExpSubtitleCue0010
     * @tc.desc      Cue 4500-5509ms has duration 1009ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 4500;
      const end: number = 5509;
      const duration: number = end - start;
      expect(duration).assertEqual(1009);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0011
     * @tc.name      testExpSubtitleCue0011
     * @tc.desc      Cue 5000-6010ms has duration 1010ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 5000;
      const end: number = 6010;
      const duration: number = end - start;
      expect(duration).assertEqual(1010);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0012
     * @tc.name      testExpSubtitleCue0012
     * @tc.desc      Cue 5500-6511ms has duration 1011ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 5500;
      const end: number = 6511;
      const duration: number = end - start;
      expect(duration).assertEqual(1011);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0013
     * @tc.name      testExpSubtitleCue0013
     * @tc.desc      Cue 6000-7012ms has duration 1012ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 6000;
      const end: number = 7012;
      const duration: number = end - start;
      expect(duration).assertEqual(1012);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0014
     * @tc.name      testExpSubtitleCue0014
     * @tc.desc      Cue 6500-7513ms has duration 1013ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 6500;
      const end: number = 7513;
      const duration: number = end - start;
      expect(duration).assertEqual(1013);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0015
     * @tc.name      testExpSubtitleCue0015
     * @tc.desc      Cue 7000-8014ms has duration 1014ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 7000;
      const end: number = 8014;
      const duration: number = end - start;
      expect(duration).assertEqual(1014);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0016
     * @tc.name      testExpSubtitleCue0016
     * @tc.desc      Cue 7500-8515ms has duration 1015ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 7500;
      const end: number = 8515;
      const duration: number = end - start;
      expect(duration).assertEqual(1015);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0017
     * @tc.name      testExpSubtitleCue0017
     * @tc.desc      Cue 8000-9016ms has duration 1016ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 8000;
      const end: number = 9016;
      const duration: number = end - start;
      expect(duration).assertEqual(1016);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0018
     * @tc.name      testExpSubtitleCue0018
     * @tc.desc      Cue 8500-9517ms has duration 1017ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 8500;
      const end: number = 9517;
      const duration: number = end - start;
      expect(duration).assertEqual(1017);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0019
     * @tc.name      testExpSubtitleCue0019
     * @tc.desc      Cue 9000-10018ms has duration 1018ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 9000;
      const end: number = 10018;
      const duration: number = end - start;
      expect(duration).assertEqual(1018);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0020
     * @tc.name      testExpSubtitleCue0020
     * @tc.desc      Cue 9500-10519ms has duration 1019ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 9500;
      const end: number = 10519;
      const duration: number = end - start;
      expect(duration).assertEqual(1019);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0021
     * @tc.name      testExpSubtitleCue0021
     * @tc.desc      Cue 10000-11020ms has duration 1020ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 10000;
      const end: number = 11020;
      const duration: number = end - start;
      expect(duration).assertEqual(1020);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0022
     * @tc.name      testExpSubtitleCue0022
     * @tc.desc      Cue 10500-11521ms has duration 1021ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 10500;
      const end: number = 11521;
      const duration: number = end - start;
      expect(duration).assertEqual(1021);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0023
     * @tc.name      testExpSubtitleCue0023
     * @tc.desc      Cue 11000-12022ms has duration 1022ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 11000;
      const end: number = 12022;
      const duration: number = end - start;
      expect(duration).assertEqual(1022);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0024
     * @tc.name      testExpSubtitleCue0024
     * @tc.desc      Cue 11500-12523ms has duration 1023ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 11500;
      const end: number = 12523;
      const duration: number = end - start;
      expect(duration).assertEqual(1023);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0025
     * @tc.name      testExpSubtitleCue0025
     * @tc.desc      Cue 12000-13024ms has duration 1024ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 12000;
      const end: number = 13024;
      const duration: number = end - start;
      expect(duration).assertEqual(1024);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0026
     * @tc.name      testExpSubtitleCue0026
     * @tc.desc      Cue 12500-13525ms has duration 1025ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 12500;
      const end: number = 13525;
      const duration: number = end - start;
      expect(duration).assertEqual(1025);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0027
     * @tc.name      testExpSubtitleCue0027
     * @tc.desc      Cue 13000-14026ms has duration 1026ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 13000;
      const end: number = 14026;
      const duration: number = end - start;
      expect(duration).assertEqual(1026);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0028
     * @tc.name      testExpSubtitleCue0028
     * @tc.desc      Cue 13500-14527ms has duration 1027ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 13500;
      const end: number = 14527;
      const duration: number = end - start;
      expect(duration).assertEqual(1027);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0029
     * @tc.name      testExpSubtitleCue0029
     * @tc.desc      Cue 14000-15028ms has duration 1028ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 14000;
      const end: number = 15028;
      const duration: number = end - start;
      expect(duration).assertEqual(1028);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0030
     * @tc.name      testExpSubtitleCue0030
     * @tc.desc      Cue 14500-15529ms has duration 1029ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 14500;
      const end: number = 15529;
      const duration: number = end - start;
      expect(duration).assertEqual(1029);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0031
     * @tc.name      testExpSubtitleCue0031
     * @tc.desc      Cue 15000-16030ms has duration 1030ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 15000;
      const end: number = 16030;
      const duration: number = end - start;
      expect(duration).assertEqual(1030);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0032
     * @tc.name      testExpSubtitleCue0032
     * @tc.desc      Cue 15500-16531ms has duration 1031ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 15500;
      const end: number = 16531;
      const duration: number = end - start;
      expect(duration).assertEqual(1031);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0033
     * @tc.name      testExpSubtitleCue0033
     * @tc.desc      Cue 16000-17032ms has duration 1032ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 16000;
      const end: number = 17032;
      const duration: number = end - start;
      expect(duration).assertEqual(1032);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0034
     * @tc.name      testExpSubtitleCue0034
     * @tc.desc      Cue 16500-17533ms has duration 1033ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 16500;
      const end: number = 17533;
      const duration: number = end - start;
      expect(duration).assertEqual(1033);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0035
     * @tc.name      testExpSubtitleCue0035
     * @tc.desc      Cue 17000-18034ms has duration 1034ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 17000;
      const end: number = 18034;
      const duration: number = end - start;
      expect(duration).assertEqual(1034);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0036
     * @tc.name      testExpSubtitleCue0036
     * @tc.desc      Cue 17500-18535ms has duration 1035ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 17500;
      const end: number = 18535;
      const duration: number = end - start;
      expect(duration).assertEqual(1035);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0037
     * @tc.name      testExpSubtitleCue0037
     * @tc.desc      Cue 18000-19036ms has duration 1036ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 18000;
      const end: number = 19036;
      const duration: number = end - start;
      expect(duration).assertEqual(1036);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0038
     * @tc.name      testExpSubtitleCue0038
     * @tc.desc      Cue 18500-19537ms has duration 1037ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 18500;
      const end: number = 19537;
      const duration: number = end - start;
      expect(duration).assertEqual(1037);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0039
     * @tc.name      testExpSubtitleCue0039
     * @tc.desc      Cue 19000-20038ms has duration 1038ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 19000;
      const end: number = 20038;
      const duration: number = end - start;
      expect(duration).assertEqual(1038);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0040
     * @tc.name      testExpSubtitleCue0040
     * @tc.desc      Cue 19500-20539ms has duration 1039ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 19500;
      const end: number = 20539;
      const duration: number = end - start;
      expect(duration).assertEqual(1039);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0041
     * @tc.name      testExpSubtitleCue0041
     * @tc.desc      Cue 20000-21040ms has duration 1040ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 20000;
      const end: number = 21040;
      const duration: number = end - start;
      expect(duration).assertEqual(1040);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0042
     * @tc.name      testExpSubtitleCue0042
     * @tc.desc      Cue 20500-21541ms has duration 1041ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 20500;
      const end: number = 21541;
      const duration: number = end - start;
      expect(duration).assertEqual(1041);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0043
     * @tc.name      testExpSubtitleCue0043
     * @tc.desc      Cue 21000-22042ms has duration 1042ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 21000;
      const end: number = 22042;
      const duration: number = end - start;
      expect(duration).assertEqual(1042);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0044
     * @tc.name      testExpSubtitleCue0044
     * @tc.desc      Cue 21500-22543ms has duration 1043ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 21500;
      const end: number = 22543;
      const duration: number = end - start;
      expect(duration).assertEqual(1043);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0045
     * @tc.name      testExpSubtitleCue0045
     * @tc.desc      Cue 22000-23044ms has duration 1044ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 22000;
      const end: number = 23044;
      const duration: number = end - start;
      expect(duration).assertEqual(1044);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0046
     * @tc.name      testExpSubtitleCue0046
     * @tc.desc      Cue 22500-23545ms has duration 1045ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 22500;
      const end: number = 23545;
      const duration: number = end - start;
      expect(duration).assertEqual(1045);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0047
     * @tc.name      testExpSubtitleCue0047
     * @tc.desc      Cue 23000-24046ms has duration 1046ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 23000;
      const end: number = 24046;
      const duration: number = end - start;
      expect(duration).assertEqual(1046);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0048
     * @tc.name      testExpSubtitleCue0048
     * @tc.desc      Cue 23500-24547ms has duration 1047ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 23500;
      const end: number = 24547;
      const duration: number = end - start;
      expect(duration).assertEqual(1047);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0049
     * @tc.name      testExpSubtitleCue0049
     * @tc.desc      Cue 24000-25048ms has duration 1048ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 24000;
      const end: number = 25048;
      const duration: number = end - start;
      expect(duration).assertEqual(1048);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0050
     * @tc.name      testExpSubtitleCue0050
     * @tc.desc      Cue 24500-25549ms has duration 1049ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 24500;
      const end: number = 25549;
      const duration: number = end - start;
      expect(duration).assertEqual(1049);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0051
     * @tc.name      testExpSubtitleCue0051
     * @tc.desc      Cue 25000-26050ms has duration 1050ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 25000;
      const end: number = 26050;
      const duration: number = end - start;
      expect(duration).assertEqual(1050);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0052
     * @tc.name      testExpSubtitleCue0052
     * @tc.desc      Cue 25500-26551ms has duration 1051ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 25500;
      const end: number = 26551;
      const duration: number = end - start;
      expect(duration).assertEqual(1051);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0053
     * @tc.name      testExpSubtitleCue0053
     * @tc.desc      Cue 26000-27052ms has duration 1052ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 26000;
      const end: number = 27052;
      const duration: number = end - start;
      expect(duration).assertEqual(1052);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0054
     * @tc.name      testExpSubtitleCue0054
     * @tc.desc      Cue 26500-27553ms has duration 1053ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 26500;
      const end: number = 27553;
      const duration: number = end - start;
      expect(duration).assertEqual(1053);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0055
     * @tc.name      testExpSubtitleCue0055
     * @tc.desc      Cue 27000-28054ms has duration 1054ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 27000;
      const end: number = 28054;
      const duration: number = end - start;
      expect(duration).assertEqual(1054);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0056
     * @tc.name      testExpSubtitleCue0056
     * @tc.desc      Cue 27500-28555ms has duration 1055ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 27500;
      const end: number = 28555;
      const duration: number = end - start;
      expect(duration).assertEqual(1055);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0057
     * @tc.name      testExpSubtitleCue0057
     * @tc.desc      Cue 28000-29056ms has duration 1056ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 28000;
      const end: number = 29056;
      const duration: number = end - start;
      expect(duration).assertEqual(1056);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0058
     * @tc.name      testExpSubtitleCue0058
     * @tc.desc      Cue 28500-29557ms has duration 1057ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 28500;
      const end: number = 29557;
      const duration: number = end - start;
      expect(duration).assertEqual(1057);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0059
     * @tc.name      testExpSubtitleCue0059
     * @tc.desc      Cue 29000-30058ms has duration 1058ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 29000;
      const end: number = 30058;
      const duration: number = end - start;
      expect(duration).assertEqual(1058);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0060
     * @tc.name      testExpSubtitleCue0060
     * @tc.desc      Cue 29500-30559ms has duration 1059ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 29500;
      const end: number = 30559;
      const duration: number = end - start;
      expect(duration).assertEqual(1059);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0061
     * @tc.name      testExpSubtitleCue0061
     * @tc.desc      Cue 30000-31060ms has duration 1060ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 30000;
      const end: number = 31060;
      const duration: number = end - start;
      expect(duration).assertEqual(1060);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0062
     * @tc.name      testExpSubtitleCue0062
     * @tc.desc      Cue 30500-31561ms has duration 1061ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 30500;
      const end: number = 31561;
      const duration: number = end - start;
      expect(duration).assertEqual(1061);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0063
     * @tc.name      testExpSubtitleCue0063
     * @tc.desc      Cue 31000-32062ms has duration 1062ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 31000;
      const end: number = 32062;
      const duration: number = end - start;
      expect(duration).assertEqual(1062);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0064
     * @tc.name      testExpSubtitleCue0064
     * @tc.desc      Cue 31500-32563ms has duration 1063ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 31500;
      const end: number = 32563;
      const duration: number = end - start;
      expect(duration).assertEqual(1063);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0065
     * @tc.name      testExpSubtitleCue0065
     * @tc.desc      Cue 32000-33064ms has duration 1064ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 32000;
      const end: number = 33064;
      const duration: number = end - start;
      expect(duration).assertEqual(1064);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0066
     * @tc.name      testExpSubtitleCue0066
     * @tc.desc      Cue 32500-33565ms has duration 1065ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 32500;
      const end: number = 33565;
      const duration: number = end - start;
      expect(duration).assertEqual(1065);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0067
     * @tc.name      testExpSubtitleCue0067
     * @tc.desc      Cue 33000-34066ms has duration 1066ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 33000;
      const end: number = 34066;
      const duration: number = end - start;
      expect(duration).assertEqual(1066);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0068
     * @tc.name      testExpSubtitleCue0068
     * @tc.desc      Cue 33500-34567ms has duration 1067ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 33500;
      const end: number = 34567;
      const duration: number = end - start;
      expect(duration).assertEqual(1067);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0069
     * @tc.name      testExpSubtitleCue0069
     * @tc.desc      Cue 34000-35068ms has duration 1068ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 34000;
      const end: number = 35068;
      const duration: number = end - start;
      expect(duration).assertEqual(1068);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0070
     * @tc.name      testExpSubtitleCue0070
     * @tc.desc      Cue 34500-35569ms has duration 1069ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 34500;
      const end: number = 35569;
      const duration: number = end - start;
      expect(duration).assertEqual(1069);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0071
     * @tc.name      testExpSubtitleCue0071
     * @tc.desc      Cue 35000-36070ms has duration 1070ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 35000;
      const end: number = 36070;
      const duration: number = end - start;
      expect(duration).assertEqual(1070);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0072
     * @tc.name      testExpSubtitleCue0072
     * @tc.desc      Cue 35500-36571ms has duration 1071ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 35500;
      const end: number = 36571;
      const duration: number = end - start;
      expect(duration).assertEqual(1071);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0073
     * @tc.name      testExpSubtitleCue0073
     * @tc.desc      Cue 36000-37072ms has duration 1072ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 36000;
      const end: number = 37072;
      const duration: number = end - start;
      expect(duration).assertEqual(1072);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0074
     * @tc.name      testExpSubtitleCue0074
     * @tc.desc      Cue 36500-37573ms has duration 1073ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 36500;
      const end: number = 37573;
      const duration: number = end - start;
      expect(duration).assertEqual(1073);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0075
     * @tc.name      testExpSubtitleCue0075
     * @tc.desc      Cue 37000-38074ms has duration 1074ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 37000;
      const end: number = 38074;
      const duration: number = end - start;
      expect(duration).assertEqual(1074);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0076
     * @tc.name      testExpSubtitleCue0076
     * @tc.desc      Cue 37500-38575ms has duration 1075ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 37500;
      const end: number = 38575;
      const duration: number = end - start;
      expect(duration).assertEqual(1075);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0077
     * @tc.name      testExpSubtitleCue0077
     * @tc.desc      Cue 38000-39076ms has duration 1076ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 38000;
      const end: number = 39076;
      const duration: number = end - start;
      expect(duration).assertEqual(1076);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0078
     * @tc.name      testExpSubtitleCue0078
     * @tc.desc      Cue 38500-39577ms has duration 1077ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 38500;
      const end: number = 39577;
      const duration: number = end - start;
      expect(duration).assertEqual(1077);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0079
     * @tc.name      testExpSubtitleCue0079
     * @tc.desc      Cue 39000-40078ms has duration 1078ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 39000;
      const end: number = 40078;
      const duration: number = end - start;
      expect(duration).assertEqual(1078);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0080
     * @tc.name      testExpSubtitleCue0080
     * @tc.desc      Cue 39500-40579ms has duration 1079ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 39500;
      const end: number = 40579;
      const duration: number = end - start;
      expect(duration).assertEqual(1079);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0081
     * @tc.name      testExpSubtitleCue0081
     * @tc.desc      Cue 40000-41080ms has duration 1080ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 40000;
      const end: number = 41080;
      const duration: number = end - start;
      expect(duration).assertEqual(1080);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0082
     * @tc.name      testExpSubtitleCue0082
     * @tc.desc      Cue 40500-41581ms has duration 1081ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 40500;
      const end: number = 41581;
      const duration: number = end - start;
      expect(duration).assertEqual(1081);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0083
     * @tc.name      testExpSubtitleCue0083
     * @tc.desc      Cue 41000-42082ms has duration 1082ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 41000;
      const end: number = 42082;
      const duration: number = end - start;
      expect(duration).assertEqual(1082);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0084
     * @tc.name      testExpSubtitleCue0084
     * @tc.desc      Cue 41500-42583ms has duration 1083ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 41500;
      const end: number = 42583;
      const duration: number = end - start;
      expect(duration).assertEqual(1083);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0085
     * @tc.name      testExpSubtitleCue0085
     * @tc.desc      Cue 42000-43084ms has duration 1084ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 42000;
      const end: number = 43084;
      const duration: number = end - start;
      expect(duration).assertEqual(1084);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0086
     * @tc.name      testExpSubtitleCue0086
     * @tc.desc      Cue 42500-43585ms has duration 1085ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 42500;
      const end: number = 43585;
      const duration: number = end - start;
      expect(duration).assertEqual(1085);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0087
     * @tc.name      testExpSubtitleCue0087
     * @tc.desc      Cue 43000-44086ms has duration 1086ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 43000;
      const end: number = 44086;
      const duration: number = end - start;
      expect(duration).assertEqual(1086);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0088
     * @tc.name      testExpSubtitleCue0088
     * @tc.desc      Cue 43500-44587ms has duration 1087ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 43500;
      const end: number = 44587;
      const duration: number = end - start;
      expect(duration).assertEqual(1087);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0089
     * @tc.name      testExpSubtitleCue0089
     * @tc.desc      Cue 44000-45088ms has duration 1088ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 44000;
      const end: number = 45088;
      const duration: number = end - start;
      expect(duration).assertEqual(1088);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0090
     * @tc.name      testExpSubtitleCue0090
     * @tc.desc      Cue 44500-45589ms has duration 1089ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 44500;
      const end: number = 45589;
      const duration: number = end - start;
      expect(duration).assertEqual(1089);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0091
     * @tc.name      testExpSubtitleCue0091
     * @tc.desc      Cue 45000-46090ms has duration 1090ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 45000;
      const end: number = 46090;
      const duration: number = end - start;
      expect(duration).assertEqual(1090);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0092
     * @tc.name      testExpSubtitleCue0092
     * @tc.desc      Cue 45500-46591ms has duration 1091ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 45500;
      const end: number = 46591;
      const duration: number = end - start;
      expect(duration).assertEqual(1091);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0093
     * @tc.name      testExpSubtitleCue0093
     * @tc.desc      Cue 46000-47092ms has duration 1092ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 46000;
      const end: number = 47092;
      const duration: number = end - start;
      expect(duration).assertEqual(1092);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0094
     * @tc.name      testExpSubtitleCue0094
     * @tc.desc      Cue 46500-47593ms has duration 1093ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 46500;
      const end: number = 47593;
      const duration: number = end - start;
      expect(duration).assertEqual(1093);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0095
     * @tc.name      testExpSubtitleCue0095
     * @tc.desc      Cue 47000-48094ms has duration 1094ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 47000;
      const end: number = 48094;
      const duration: number = end - start;
      expect(duration).assertEqual(1094);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0096
     * @tc.name      testExpSubtitleCue0096
     * @tc.desc      Cue 47500-48595ms has duration 1095ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 47500;
      const end: number = 48595;
      const duration: number = end - start;
      expect(duration).assertEqual(1095);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0097
     * @tc.name      testExpSubtitleCue0097
     * @tc.desc      Cue 48000-49096ms has duration 1096ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 48000;
      const end: number = 49096;
      const duration: number = end - start;
      expect(duration).assertEqual(1096);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0098
     * @tc.name      testExpSubtitleCue0098
     * @tc.desc      Cue 48500-49597ms has duration 1097ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 48500;
      const end: number = 49597;
      const duration: number = end - start;
      expect(duration).assertEqual(1097);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0099
     * @tc.name      testExpSubtitleCue0099
     * @tc.desc      Cue 49000-50098ms has duration 1098ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 49000;
      const end: number = 50098;
      const duration: number = end - start;
      expect(duration).assertEqual(1098);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_CUE_0100
     * @tc.name      testExpSubtitleCue0100
     * @tc.desc      Cue 49500-50599ms has duration 1099ms.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleCue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 49500;
      const end: number = 50599;
      const duration: number = end - start;
      expect(duration).assertEqual(1099);
      expect(end).assertLarger(start);
      expect(start).assertLargerOrEqual(0);
      expect(duration).assertLarger(0);
    })
  })
}
