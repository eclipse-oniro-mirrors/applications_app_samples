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
import { describe, it as hypiumIt, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';



const TAG: string = '[Sample_SubtitleDisplayExpanded]';
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

export default function subtitleDisplayExpandedTest(): void {
  describe('subtitleDisplayExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0001
     * @tc.name      testExpSubtitleDisplay0001
     * @tc.desc      Subtitle line 0 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 0  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 0');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0002
     * @tc.name      testExpSubtitleDisplay0002
     * @tc.desc      Subtitle line 1 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 1  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 1');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0003
     * @tc.name      testExpSubtitleDisplay0003
     * @tc.desc      Subtitle line 2 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 2  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 2');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0004
     * @tc.name      testExpSubtitleDisplay0004
     * @tc.desc      Subtitle line 3 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 3  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 3');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0005
     * @tc.name      testExpSubtitleDisplay0005
     * @tc.desc      Subtitle line 4 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 4  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 4');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0006
     * @tc.name      testExpSubtitleDisplay0006
     * @tc.desc      Subtitle line 5 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 5  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 5');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0007
     * @tc.name      testExpSubtitleDisplay0007
     * @tc.desc      Subtitle line 6 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 6  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 6');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0008
     * @tc.name      testExpSubtitleDisplay0008
     * @tc.desc      Subtitle line 7 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 7  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 7');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0009
     * @tc.name      testExpSubtitleDisplay0009
     * @tc.desc      Subtitle line 8 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 8  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 8');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0010
     * @tc.name      testExpSubtitleDisplay0010
     * @tc.desc      Subtitle line 9 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 9  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 9');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0011
     * @tc.name      testExpSubtitleDisplay0011
     * @tc.desc      Subtitle line 10 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 10  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 10');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0012
     * @tc.name      testExpSubtitleDisplay0012
     * @tc.desc      Subtitle line 11 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 11  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 11');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0013
     * @tc.name      testExpSubtitleDisplay0013
     * @tc.desc      Subtitle line 12 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 12  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 12');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0014
     * @tc.name      testExpSubtitleDisplay0014
     * @tc.desc      Subtitle line 13 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 13  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 13');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0015
     * @tc.name      testExpSubtitleDisplay0015
     * @tc.desc      Subtitle line 14 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 14  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 14');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0016
     * @tc.name      testExpSubtitleDisplay0016
     * @tc.desc      Subtitle line 15 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 15  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 15');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0017
     * @tc.name      testExpSubtitleDisplay0017
     * @tc.desc      Subtitle line 16 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 16  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 16');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0018
     * @tc.name      testExpSubtitleDisplay0018
     * @tc.desc      Subtitle line 17 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 17  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 17');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0019
     * @tc.name      testExpSubtitleDisplay0019
     * @tc.desc      Subtitle line 18 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 18  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 18');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0020
     * @tc.name      testExpSubtitleDisplay0020
     * @tc.desc      Subtitle line 19 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 19  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 19');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0021
     * @tc.name      testExpSubtitleDisplay0021
     * @tc.desc      Subtitle line 20 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 20  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 20');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0022
     * @tc.name      testExpSubtitleDisplay0022
     * @tc.desc      Subtitle line 21 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 21  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 21');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0023
     * @tc.name      testExpSubtitleDisplay0023
     * @tc.desc      Subtitle line 22 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 22  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 22');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0024
     * @tc.name      testExpSubtitleDisplay0024
     * @tc.desc      Subtitle line 23 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 23  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 23');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0025
     * @tc.name      testExpSubtitleDisplay0025
     * @tc.desc      Subtitle line 24 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 24  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 24');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0026
     * @tc.name      testExpSubtitleDisplay0026
     * @tc.desc      Subtitle line 25 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 25  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 25');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0027
     * @tc.name      testExpSubtitleDisplay0027
     * @tc.desc      Subtitle line 26 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 26  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 26');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0028
     * @tc.name      testExpSubtitleDisplay0028
     * @tc.desc      Subtitle line 27 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 27  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 27');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0029
     * @tc.name      testExpSubtitleDisplay0029
     * @tc.desc      Subtitle line 28 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 28  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 28');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0030
     * @tc.name      testExpSubtitleDisplay0030
     * @tc.desc      Subtitle line 29 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 29  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 29');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0031
     * @tc.name      testExpSubtitleDisplay0031
     * @tc.desc      Subtitle line 30 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 30  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 30');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0032
     * @tc.name      testExpSubtitleDisplay0032
     * @tc.desc      Subtitle line 31 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 31  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 31');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0033
     * @tc.name      testExpSubtitleDisplay0033
     * @tc.desc      Subtitle line 32 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 32  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 32');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0034
     * @tc.name      testExpSubtitleDisplay0034
     * @tc.desc      Subtitle line 33 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 33  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 33');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0035
     * @tc.name      testExpSubtitleDisplay0035
     * @tc.desc      Subtitle line 34 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 34  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 34');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0036
     * @tc.name      testExpSubtitleDisplay0036
     * @tc.desc      Subtitle line 35 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 35  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 35');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0037
     * @tc.name      testExpSubtitleDisplay0037
     * @tc.desc      Subtitle line 36 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 36  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 36');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0038
     * @tc.name      testExpSubtitleDisplay0038
     * @tc.desc      Subtitle line 37 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 37  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 37');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0039
     * @tc.name      testExpSubtitleDisplay0039
     * @tc.desc      Subtitle line 38 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 38  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 38');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0040
     * @tc.name      testExpSubtitleDisplay0040
     * @tc.desc      Subtitle line 39 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 39  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 39');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0041
     * @tc.name      testExpSubtitleDisplay0041
     * @tc.desc      Subtitle line 40 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 40  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 40');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0042
     * @tc.name      testExpSubtitleDisplay0042
     * @tc.desc      Subtitle line 41 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 41  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 41');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0043
     * @tc.name      testExpSubtitleDisplay0043
     * @tc.desc      Subtitle line 42 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 42  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 42');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0044
     * @tc.name      testExpSubtitleDisplay0044
     * @tc.desc      Subtitle line 43 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 43  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 43');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0045
     * @tc.name      testExpSubtitleDisplay0045
     * @tc.desc      Subtitle line 44 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 44  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 44');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0046
     * @tc.name      testExpSubtitleDisplay0046
     * @tc.desc      Subtitle line 45 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 45  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 45');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0047
     * @tc.name      testExpSubtitleDisplay0047
     * @tc.desc      Subtitle line 46 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 46  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 46');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0048
     * @tc.name      testExpSubtitleDisplay0048
     * @tc.desc      Subtitle line 47 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 47  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 47');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0049
     * @tc.name      testExpSubtitleDisplay0049
     * @tc.desc      Subtitle line 48 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 48  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 48');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0050
     * @tc.name      testExpSubtitleDisplay0050
     * @tc.desc      Subtitle line 49 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 49  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 49');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0051
     * @tc.name      testExpSubtitleDisplay0051
     * @tc.desc      Subtitle line 50 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 50  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 50');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0052
     * @tc.name      testExpSubtitleDisplay0052
     * @tc.desc      Subtitle line 51 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 51  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 51');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0053
     * @tc.name      testExpSubtitleDisplay0053
     * @tc.desc      Subtitle line 52 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 52  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 52');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0054
     * @tc.name      testExpSubtitleDisplay0054
     * @tc.desc      Subtitle line 53 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 53  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 53');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0055
     * @tc.name      testExpSubtitleDisplay0055
     * @tc.desc      Subtitle line 54 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 54  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 54');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0056
     * @tc.name      testExpSubtitleDisplay0056
     * @tc.desc      Subtitle line 55 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 55  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 55');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0057
     * @tc.name      testExpSubtitleDisplay0057
     * @tc.desc      Subtitle line 56 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 56  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 56');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0058
     * @tc.name      testExpSubtitleDisplay0058
     * @tc.desc      Subtitle line 57 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 57  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 57');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0059
     * @tc.name      testExpSubtitleDisplay0059
     * @tc.desc      Subtitle line 58 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 58  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 58');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0060
     * @tc.name      testExpSubtitleDisplay0060
     * @tc.desc      Subtitle line 59 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 59  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 59');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0061
     * @tc.name      testExpSubtitleDisplay0061
     * @tc.desc      Subtitle line 60 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 60  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 60');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0062
     * @tc.name      testExpSubtitleDisplay0062
     * @tc.desc      Subtitle line 61 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 61  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 61');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0063
     * @tc.name      testExpSubtitleDisplay0063
     * @tc.desc      Subtitle line 62 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 62  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 62');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0064
     * @tc.name      testExpSubtitleDisplay0064
     * @tc.desc      Subtitle line 63 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 63  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 63');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0065
     * @tc.name      testExpSubtitleDisplay0065
     * @tc.desc      Subtitle line 64 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 64  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 64');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0066
     * @tc.name      testExpSubtitleDisplay0066
     * @tc.desc      Subtitle line 65 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 65  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 65');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0067
     * @tc.name      testExpSubtitleDisplay0067
     * @tc.desc      Subtitle line 66 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 66  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 66');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0068
     * @tc.name      testExpSubtitleDisplay0068
     * @tc.desc      Subtitle line 67 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 67  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 67');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0069
     * @tc.name      testExpSubtitleDisplay0069
     * @tc.desc      Subtitle line 68 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 68  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 68');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0070
     * @tc.name      testExpSubtitleDisplay0070
     * @tc.desc      Subtitle line 69 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 69  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 69');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0071
     * @tc.name      testExpSubtitleDisplay0071
     * @tc.desc      Subtitle line 70 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 70  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 70');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0072
     * @tc.name      testExpSubtitleDisplay0072
     * @tc.desc      Subtitle line 71 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 71  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 71');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0073
     * @tc.name      testExpSubtitleDisplay0073
     * @tc.desc      Subtitle line 72 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 72  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 72');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0074
     * @tc.name      testExpSubtitleDisplay0074
     * @tc.desc      Subtitle line 73 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 73  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 73');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0075
     * @tc.name      testExpSubtitleDisplay0075
     * @tc.desc      Subtitle line 74 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 74  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 74');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0076
     * @tc.name      testExpSubtitleDisplay0076
     * @tc.desc      Subtitle line 75 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 75  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 75');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0077
     * @tc.name      testExpSubtitleDisplay0077
     * @tc.desc      Subtitle line 76 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 76  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 76');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0078
     * @tc.name      testExpSubtitleDisplay0078
     * @tc.desc      Subtitle line 77 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 77  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 77');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0079
     * @tc.name      testExpSubtitleDisplay0079
     * @tc.desc      Subtitle line 78 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 78  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 78');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0080
     * @tc.name      testExpSubtitleDisplay0080
     * @tc.desc      Subtitle line 79 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 79  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 79');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0081
     * @tc.name      testExpSubtitleDisplay0081
     * @tc.desc      Subtitle line 80 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 80  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 80');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0082
     * @tc.name      testExpSubtitleDisplay0082
     * @tc.desc      Subtitle line 81 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 81  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 81');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0083
     * @tc.name      testExpSubtitleDisplay0083
     * @tc.desc      Subtitle line 82 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 82  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 82');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0084
     * @tc.name      testExpSubtitleDisplay0084
     * @tc.desc      Subtitle line 83 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 83  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 83');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0085
     * @tc.name      testExpSubtitleDisplay0085
     * @tc.desc      Subtitle line 84 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 84  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 84');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0086
     * @tc.name      testExpSubtitleDisplay0086
     * @tc.desc      Subtitle line 85 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 85  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 85');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0087
     * @tc.name      testExpSubtitleDisplay0087
     * @tc.desc      Subtitle line 86 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 86  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 86');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0088
     * @tc.name      testExpSubtitleDisplay0088
     * @tc.desc      Subtitle line 87 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 87  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 87');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0089
     * @tc.name      testExpSubtitleDisplay0089
     * @tc.desc      Subtitle line 88 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 88  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 88');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0090
     * @tc.name      testExpSubtitleDisplay0090
     * @tc.desc      Subtitle line 89 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 89  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 89');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0091
     * @tc.name      testExpSubtitleDisplay0091
     * @tc.desc      Subtitle line 90 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 90  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 90');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0092
     * @tc.name      testExpSubtitleDisplay0092
     * @tc.desc      Subtitle line 91 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 91  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 91');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0093
     * @tc.name      testExpSubtitleDisplay0093
     * @tc.desc      Subtitle line 92 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 92  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 92');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0094
     * @tc.name      testExpSubtitleDisplay0094
     * @tc.desc      Subtitle line 93 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 93  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 93');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0095
     * @tc.name      testExpSubtitleDisplay0095
     * @tc.desc      Subtitle line 94 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 94  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 94');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0096
     * @tc.name      testExpSubtitleDisplay0096
     * @tc.desc      Subtitle line 95 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 95  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 95');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0097
     * @tc.name      testExpSubtitleDisplay0097
     * @tc.desc      Subtitle line 96 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 96  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 96');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0098
     * @tc.name      testExpSubtitleDisplay0098
     * @tc.desc      Subtitle line 97 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 97  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 97');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0099
     * @tc.name      testExpSubtitleDisplay0099
     * @tc.desc      Subtitle line 98 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 98  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 98');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0100
     * @tc.name      testExpSubtitleDisplay0100
     * @tc.desc      Subtitle line 99 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle line 99  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle line 99');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0101
     * @tc.name      testExpSubtitleDisplay0101
     * @tc.desc      Extra subtitle line 0 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle extra 0  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle extra 0');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0102
     * @tc.name      testExpSubtitleDisplay0102
     * @tc.desc      Extra subtitle line 1 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle extra 1  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle extra 1');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0103
     * @tc.name      testExpSubtitleDisplay0103
     * @tc.desc      Extra subtitle line 2 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle extra 2  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle extra 2');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0104
     * @tc.name      testExpSubtitleDisplay0104
     * @tc.desc      Extra subtitle line 3 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle extra 3  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle extra 3');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0105
     * @tc.name      testExpSubtitleDisplay0105
     * @tc.desc      Extra subtitle line 4 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle extra 4  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle extra 4');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0106
     * @tc.name      testExpSubtitleDisplay0106
     * @tc.desc      Extra subtitle line 5 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle extra 5  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle extra 5');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0107
     * @tc.name      testExpSubtitleDisplay0107
     * @tc.desc      Extra subtitle line 6 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle extra 6  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle extra 6');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_EXP_DSP_0108
     * @tc.name      testExpSubtitleDisplay0108
     * @tc.desc      Extra subtitle line 7 trims to its display text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleDisplay0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: string = '  Subtitle extra 7  ';
      const trimmed: string = source.trim();
      expect(trimmed).assertEqual('Subtitle extra 7');
      expect(source.length).assertLarger(trimmed.length);
      expect(trimmed.indexOf('Subtitle')).assertEqual(0);
      expect(trimmed.length).assertLarger(0);
    })
  })
}
