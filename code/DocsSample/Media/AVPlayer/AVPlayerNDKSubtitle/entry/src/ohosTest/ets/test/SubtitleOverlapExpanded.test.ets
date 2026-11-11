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



const TAG: string = '[Sample_SubtitleOverlapExpanded]';
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

export default function subtitleOverlapExpandedTest(): void {
  describe('subtitleOverlapExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0001
     * @tc.name      testMoreSubtitleOverlap0001
     * @tc.desc      Cue 0-500 overlap with 400 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 0;
      const end: number = 500;
      const nextStart: number = 400;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0002
     * @tc.name      testMoreSubtitleOverlap0002
     * @tc.desc      Cue 100-600 overlap with 500 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 100;
      const end: number = 600;
      const nextStart: number = 500;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0003
     * @tc.name      testMoreSubtitleOverlap0003
     * @tc.desc      Cue 200-700 overlap with 600 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 200;
      const end: number = 700;
      const nextStart: number = 600;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0004
     * @tc.name      testMoreSubtitleOverlap0004
     * @tc.desc      Cue 300-800 overlap with 700 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 300;
      const end: number = 800;
      const nextStart: number = 700;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0005
     * @tc.name      testMoreSubtitleOverlap0005
     * @tc.desc      Cue 400-900 overlap with 800 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 400;
      const end: number = 900;
      const nextStart: number = 800;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0006
     * @tc.name      testMoreSubtitleOverlap0006
     * @tc.desc      Cue 500-1000 overlap with 900 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 500;
      const end: number = 1000;
      const nextStart: number = 900;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0007
     * @tc.name      testMoreSubtitleOverlap0007
     * @tc.desc      Cue 600-1100 overlap with 1000 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 600;
      const end: number = 1100;
      const nextStart: number = 1000;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0008
     * @tc.name      testMoreSubtitleOverlap0008
     * @tc.desc      Cue 700-1200 overlap with 1100 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 700;
      const end: number = 1200;
      const nextStart: number = 1100;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0009
     * @tc.name      testMoreSubtitleOverlap0009
     * @tc.desc      Cue 800-1300 overlap with 1200 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 800;
      const end: number = 1300;
      const nextStart: number = 1200;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0010
     * @tc.name      testMoreSubtitleOverlap0010
     * @tc.desc      Cue 900-1400 overlap with 1300 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 900;
      const end: number = 1400;
      const nextStart: number = 1300;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0011
     * @tc.name      testMoreSubtitleOverlap0011
     * @tc.desc      Cue 1000-1500 overlap with 1400 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1000;
      const end: number = 1500;
      const nextStart: number = 1400;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0012
     * @tc.name      testMoreSubtitleOverlap0012
     * @tc.desc      Cue 1100-1600 overlap with 1500 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1100;
      const end: number = 1600;
      const nextStart: number = 1500;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0013
     * @tc.name      testMoreSubtitleOverlap0013
     * @tc.desc      Cue 1200-1700 overlap with 1600 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1200;
      const end: number = 1700;
      const nextStart: number = 1600;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0014
     * @tc.name      testMoreSubtitleOverlap0014
     * @tc.desc      Cue 1300-1800 overlap with 1700 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1300;
      const end: number = 1800;
      const nextStart: number = 1700;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0015
     * @tc.name      testMoreSubtitleOverlap0015
     * @tc.desc      Cue 1400-1900 overlap with 1800 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1400;
      const end: number = 1900;
      const nextStart: number = 1800;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0016
     * @tc.name      testMoreSubtitleOverlap0016
     * @tc.desc      Cue 1500-2000 overlap with 1900 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1500;
      const end: number = 2000;
      const nextStart: number = 1900;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0017
     * @tc.name      testMoreSubtitleOverlap0017
     * @tc.desc      Cue 1600-2100 overlap with 2000 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1600;
      const end: number = 2100;
      const nextStart: number = 2000;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0018
     * @tc.name      testMoreSubtitleOverlap0018
     * @tc.desc      Cue 1700-2200 overlap with 2100 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1700;
      const end: number = 2200;
      const nextStart: number = 2100;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0019
     * @tc.name      testMoreSubtitleOverlap0019
     * @tc.desc      Cue 1800-2300 overlap with 2200 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1800;
      const end: number = 2300;
      const nextStart: number = 2200;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0020
     * @tc.name      testMoreSubtitleOverlap0020
     * @tc.desc      Cue 1900-2400 overlap with 2300 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1900;
      const end: number = 2400;
      const nextStart: number = 2300;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0021
     * @tc.name      testMoreSubtitleOverlap0021
     * @tc.desc      Cue 2000-2500 overlap with 2400 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 2000;
      const end: number = 2500;
      const nextStart: number = 2400;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0022
     * @tc.name      testMoreSubtitleOverlap0022
     * @tc.desc      Cue 2100-2600 overlap with 2500 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 2100;
      const end: number = 2600;
      const nextStart: number = 2500;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0023
     * @tc.name      testMoreSubtitleOverlap0023
     * @tc.desc      Cue 2200-2700 overlap with 2600 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 2200;
      const end: number = 2700;
      const nextStart: number = 2600;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0024
     * @tc.name      testMoreSubtitleOverlap0024
     * @tc.desc      Cue 2300-2800 overlap with 2700 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 2300;
      const end: number = 2800;
      const nextStart: number = 2700;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0025
     * @tc.name      testMoreSubtitleOverlap0025
     * @tc.desc      Cue 2400-2900 overlap with 2800 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 2400;
      const end: number = 2900;
      const nextStart: number = 2800;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0026
     * @tc.name      testMoreSubtitleOverlap0026
     * @tc.desc      Cue 2500-3000 overlap with 2900 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 2500;
      const end: number = 3000;
      const nextStart: number = 2900;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0027
     * @tc.name      testMoreSubtitleOverlap0027
     * @tc.desc      Cue 2600-3100 overlap with 3000 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 2600;
      const end: number = 3100;
      const nextStart: number = 3000;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0028
     * @tc.name      testMoreSubtitleOverlap0028
     * @tc.desc      Cue 2700-3200 overlap with 3100 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 2700;
      const end: number = 3200;
      const nextStart: number = 3100;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0029
     * @tc.name      testMoreSubtitleOverlap0029
     * @tc.desc      Cue 2800-3300 overlap with 3200 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 2800;
      const end: number = 3300;
      const nextStart: number = 3200;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0030
     * @tc.name      testMoreSubtitleOverlap0030
     * @tc.desc      Cue 2900-3400 overlap with 3300 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 2900;
      const end: number = 3400;
      const nextStart: number = 3300;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0031
     * @tc.name      testMoreSubtitleOverlap0031
     * @tc.desc      Cue 3000-3500 overlap with 3400 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 3000;
      const end: number = 3500;
      const nextStart: number = 3400;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0032
     * @tc.name      testMoreSubtitleOverlap0032
     * @tc.desc      Cue 3100-3600 overlap with 3500 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 3100;
      const end: number = 3600;
      const nextStart: number = 3500;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0033
     * @tc.name      testMoreSubtitleOverlap0033
     * @tc.desc      Cue 3200-3700 overlap with 3600 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 3200;
      const end: number = 3700;
      const nextStart: number = 3600;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0034
     * @tc.name      testMoreSubtitleOverlap0034
     * @tc.desc      Cue 3300-3800 overlap with 3700 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 3300;
      const end: number = 3800;
      const nextStart: number = 3700;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0035
     * @tc.name      testMoreSubtitleOverlap0035
     * @tc.desc      Cue 3400-3900 overlap with 3800 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 3400;
      const end: number = 3900;
      const nextStart: number = 3800;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0036
     * @tc.name      testMoreSubtitleOverlap0036
     * @tc.desc      Cue 3500-4000 overlap with 3900 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 3500;
      const end: number = 4000;
      const nextStart: number = 3900;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0037
     * @tc.name      testMoreSubtitleOverlap0037
     * @tc.desc      Cue 3600-4100 overlap with 4000 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 3600;
      const end: number = 4100;
      const nextStart: number = 4000;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0038
     * @tc.name      testMoreSubtitleOverlap0038
     * @tc.desc      Cue 3700-4200 overlap with 4100 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 3700;
      const end: number = 4200;
      const nextStart: number = 4100;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0039
     * @tc.name      testMoreSubtitleOverlap0039
     * @tc.desc      Cue 3800-4300 overlap with 4200 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 3800;
      const end: number = 4300;
      const nextStart: number = 4200;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0040
     * @tc.name      testMoreSubtitleOverlap0040
     * @tc.desc      Cue 3900-4400 overlap with 4300 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 3900;
      const end: number = 4400;
      const nextStart: number = 4300;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0041
     * @tc.name      testMoreSubtitleOverlap0041
     * @tc.desc      Cue 4000-4500 overlap with 4400 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 4000;
      const end: number = 4500;
      const nextStart: number = 4400;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0042
     * @tc.name      testMoreSubtitleOverlap0042
     * @tc.desc      Cue 4100-4600 overlap with 4500 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 4100;
      const end: number = 4600;
      const nextStart: number = 4500;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0043
     * @tc.name      testMoreSubtitleOverlap0043
     * @tc.desc      Cue 4200-4700 overlap with 4600 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 4200;
      const end: number = 4700;
      const nextStart: number = 4600;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0044
     * @tc.name      testMoreSubtitleOverlap0044
     * @tc.desc      Cue 4300-4800 overlap with 4700 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 4300;
      const end: number = 4800;
      const nextStart: number = 4700;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0045
     * @tc.name      testMoreSubtitleOverlap0045
     * @tc.desc      Cue 4400-4900 overlap with 4800 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 4400;
      const end: number = 4900;
      const nextStart: number = 4800;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0046
     * @tc.name      testMoreSubtitleOverlap0046
     * @tc.desc      Cue 4500-5000 overlap with 4900 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 4500;
      const end: number = 5000;
      const nextStart: number = 4900;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0047
     * @tc.name      testMoreSubtitleOverlap0047
     * @tc.desc      Cue 4600-5100 overlap with 5000 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 4600;
      const end: number = 5100;
      const nextStart: number = 5000;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0048
     * @tc.name      testMoreSubtitleOverlap0048
     * @tc.desc      Cue 4700-5200 overlap with 5100 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 4700;
      const end: number = 5200;
      const nextStart: number = 5100;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0049
     * @tc.name      testMoreSubtitleOverlap0049
     * @tc.desc      Cue 4800-5300 overlap with 5200 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 4800;
      const end: number = 5300;
      const nextStart: number = 5200;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0050
     * @tc.name      testMoreSubtitleOverlap0050
     * @tc.desc      Cue 4900-5400 overlap with 5300 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 4900;
      const end: number = 5400;
      const nextStart: number = 5300;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0051
     * @tc.name      testMoreSubtitleOverlap0051
     * @tc.desc      Cue 5000-5500 overlap with 5400 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 5000;
      const end: number = 5500;
      const nextStart: number = 5400;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0052
     * @tc.name      testMoreSubtitleOverlap0052
     * @tc.desc      Cue 5100-5600 overlap with 5500 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 5100;
      const end: number = 5600;
      const nextStart: number = 5500;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0053
     * @tc.name      testMoreSubtitleOverlap0053
     * @tc.desc      Cue 5200-5700 overlap with 5600 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 5200;
      const end: number = 5700;
      const nextStart: number = 5600;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0054
     * @tc.name      testMoreSubtitleOverlap0054
     * @tc.desc      Cue 5300-5800 overlap with 5700 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 5300;
      const end: number = 5800;
      const nextStart: number = 5700;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0055
     * @tc.name      testMoreSubtitleOverlap0055
     * @tc.desc      Cue 5400-5900 overlap with 5800 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 5400;
      const end: number = 5900;
      const nextStart: number = 5800;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0056
     * @tc.name      testMoreSubtitleOverlap0056
     * @tc.desc      Cue 5500-6000 overlap with 5900 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 5500;
      const end: number = 6000;
      const nextStart: number = 5900;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0057
     * @tc.name      testMoreSubtitleOverlap0057
     * @tc.desc      Cue 5600-6100 overlap with 6000 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 5600;
      const end: number = 6100;
      const nextStart: number = 6000;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0058
     * @tc.name      testMoreSubtitleOverlap0058
     * @tc.desc      Cue 5700-6200 overlap with 6100 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 5700;
      const end: number = 6200;
      const nextStart: number = 6100;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0059
     * @tc.name      testMoreSubtitleOverlap0059
     * @tc.desc      Cue 5800-6300 overlap with 6200 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 5800;
      const end: number = 6300;
      const nextStart: number = 6200;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0060
     * @tc.name      testMoreSubtitleOverlap0060
     * @tc.desc      Cue 5900-6400 overlap with 6300 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 5900;
      const end: number = 6400;
      const nextStart: number = 6300;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0061
     * @tc.name      testMoreSubtitleOverlap0061
     * @tc.desc      Cue 6000-6500 overlap with 6400 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 6000;
      const end: number = 6500;
      const nextStart: number = 6400;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0062
     * @tc.name      testMoreSubtitleOverlap0062
     * @tc.desc      Cue 6100-6600 overlap with 6500 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 6100;
      const end: number = 6600;
      const nextStart: number = 6500;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0063
     * @tc.name      testMoreSubtitleOverlap0063
     * @tc.desc      Cue 6200-6700 overlap with 6600 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 6200;
      const end: number = 6700;
      const nextStart: number = 6600;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0064
     * @tc.name      testMoreSubtitleOverlap0064
     * @tc.desc      Cue 6300-6800 overlap with 6700 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 6300;
      const end: number = 6800;
      const nextStart: number = 6700;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0065
     * @tc.name      testMoreSubtitleOverlap0065
     * @tc.desc      Cue 6400-6900 overlap with 6800 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 6400;
      const end: number = 6900;
      const nextStart: number = 6800;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0066
     * @tc.name      testMoreSubtitleOverlap0066
     * @tc.desc      Cue 6500-7000 overlap with 6900 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 6500;
      const end: number = 7000;
      const nextStart: number = 6900;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0067
     * @tc.name      testMoreSubtitleOverlap0067
     * @tc.desc      Cue 6600-7100 overlap with 7000 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 6600;
      const end: number = 7100;
      const nextStart: number = 7000;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0068
     * @tc.name      testMoreSubtitleOverlap0068
     * @tc.desc      Cue 6700-7200 overlap with 7100 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 6700;
      const end: number = 7200;
      const nextStart: number = 7100;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0069
     * @tc.name      testMoreSubtitleOverlap0069
     * @tc.desc      Cue 6800-7300 overlap with 7200 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 6800;
      const end: number = 7300;
      const nextStart: number = 7200;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0070
     * @tc.name      testMoreSubtitleOverlap0070
     * @tc.desc      Cue 6900-7400 overlap with 7300 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 6900;
      const end: number = 7400;
      const nextStart: number = 7300;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0071
     * @tc.name      testMoreSubtitleOverlap0071
     * @tc.desc      Cue 7000-7500 overlap with 7400 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 7000;
      const end: number = 7500;
      const nextStart: number = 7400;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0072
     * @tc.name      testMoreSubtitleOverlap0072
     * @tc.desc      Cue 7100-7600 overlap with 7500 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 7100;
      const end: number = 7600;
      const nextStart: number = 7500;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0073
     * @tc.name      testMoreSubtitleOverlap0073
     * @tc.desc      Cue 7200-7700 overlap with 7600 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 7200;
      const end: number = 7700;
      const nextStart: number = 7600;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0074
     * @tc.name      testMoreSubtitleOverlap0074
     * @tc.desc      Cue 7300-7800 overlap with 7700 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 7300;
      const end: number = 7800;
      const nextStart: number = 7700;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0075
     * @tc.name      testMoreSubtitleOverlap0075
     * @tc.desc      Cue 7400-7900 overlap with 7800 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 7400;
      const end: number = 7900;
      const nextStart: number = 7800;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0076
     * @tc.name      testMoreSubtitleOverlap0076
     * @tc.desc      Cue 7500-8000 overlap with 7900 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 7500;
      const end: number = 8000;
      const nextStart: number = 7900;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0077
     * @tc.name      testMoreSubtitleOverlap0077
     * @tc.desc      Cue 7600-8100 overlap with 8000 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 7600;
      const end: number = 8100;
      const nextStart: number = 8000;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0078
     * @tc.name      testMoreSubtitleOverlap0078
     * @tc.desc      Cue 7700-8200 overlap with 8100 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 7700;
      const end: number = 8200;
      const nextStart: number = 8100;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0079
     * @tc.name      testMoreSubtitleOverlap0079
     * @tc.desc      Cue 7800-8300 overlap with 8200 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 7800;
      const end: number = 8300;
      const nextStart: number = 8200;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0080
     * @tc.name      testMoreSubtitleOverlap0080
     * @tc.desc      Cue 7900-8400 overlap with 8300 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 7900;
      const end: number = 8400;
      const nextStart: number = 8300;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0081
     * @tc.name      testMoreSubtitleOverlap0081
     * @tc.desc      Cue 8000-8500 overlap with 8400 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 8000;
      const end: number = 8500;
      const nextStart: number = 8400;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0082
     * @tc.name      testMoreSubtitleOverlap0082
     * @tc.desc      Cue 8100-8600 overlap with 8500 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 8100;
      const end: number = 8600;
      const nextStart: number = 8500;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0083
     * @tc.name      testMoreSubtitleOverlap0083
     * @tc.desc      Cue 8200-8700 overlap with 8600 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 8200;
      const end: number = 8700;
      const nextStart: number = 8600;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0084
     * @tc.name      testMoreSubtitleOverlap0084
     * @tc.desc      Cue 8300-8800 overlap with 8700 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 8300;
      const end: number = 8800;
      const nextStart: number = 8700;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0085
     * @tc.name      testMoreSubtitleOverlap0085
     * @tc.desc      Cue 8400-8900 overlap with 8800 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 8400;
      const end: number = 8900;
      const nextStart: number = 8800;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0086
     * @tc.name      testMoreSubtitleOverlap0086
     * @tc.desc      Cue 8500-9000 overlap with 8900 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 8500;
      const end: number = 9000;
      const nextStart: number = 8900;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0087
     * @tc.name      testMoreSubtitleOverlap0087
     * @tc.desc      Cue 8600-9100 overlap with 9000 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 8600;
      const end: number = 9100;
      const nextStart: number = 9000;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0088
     * @tc.name      testMoreSubtitleOverlap0088
     * @tc.desc      Cue 8700-9200 overlap with 9100 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 8700;
      const end: number = 9200;
      const nextStart: number = 9100;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0089
     * @tc.name      testMoreSubtitleOverlap0089
     * @tc.desc      Cue 8800-9300 overlap with 9200 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 8800;
      const end: number = 9300;
      const nextStart: number = 9200;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0090
     * @tc.name      testMoreSubtitleOverlap0090
     * @tc.desc      Cue 8900-9400 overlap with 9300 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 8900;
      const end: number = 9400;
      const nextStart: number = 9300;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0091
     * @tc.name      testMoreSubtitleOverlap0091
     * @tc.desc      Cue 9000-9500 overlap with 9400 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 9000;
      const end: number = 9500;
      const nextStart: number = 9400;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0092
     * @tc.name      testMoreSubtitleOverlap0092
     * @tc.desc      Cue 9100-9600 overlap with 9500 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 9100;
      const end: number = 9600;
      const nextStart: number = 9500;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0093
     * @tc.name      testMoreSubtitleOverlap0093
     * @tc.desc      Cue 9200-9700 overlap with 9600 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 9200;
      const end: number = 9700;
      const nextStart: number = 9600;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0094
     * @tc.name      testMoreSubtitleOverlap0094
     * @tc.desc      Cue 9300-9800 overlap with 9700 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 9300;
      const end: number = 9800;
      const nextStart: number = 9700;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0095
     * @tc.name      testMoreSubtitleOverlap0095
     * @tc.desc      Cue 9400-9900 overlap with 9800 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 9400;
      const end: number = 9900;
      const nextStart: number = 9800;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0096
     * @tc.name      testMoreSubtitleOverlap0096
     * @tc.desc      Cue 9500-10000 overlap with 9900 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 9500;
      const end: number = 10000;
      const nextStart: number = 9900;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0097
     * @tc.name      testMoreSubtitleOverlap0097
     * @tc.desc      Cue 9600-10100 overlap with 10000 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 9600;
      const end: number = 10100;
      const nextStart: number = 10000;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0098
     * @tc.name      testMoreSubtitleOverlap0098
     * @tc.desc      Cue 9700-10200 overlap with 10100 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 9700;
      const end: number = 10200;
      const nextStart: number = 10100;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0099
     * @tc.name      testMoreSubtitleOverlap0099
     * @tc.desc      Cue 9800-10300 overlap with 10200 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 9800;
      const end: number = 10300;
      const nextStart: number = 10200;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_MORE_OVL_0100
     * @tc.name      testMoreSubtitleOverlap0100
     * @tc.desc      Cue 9900-10400 overlap with 10300 is True.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreSubtitleOverlap0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 9900;
      const end: number = 10400;
      const nextStart: number = 10300;
      const overlap: boolean = nextStart < end;
      expect(end).assertLarger(start);
      expect(nextStart).assertLargerOrEqual(start);
      expect(overlap).assertEqual(true);
      expect(end - start).assertEqual(500);
    })
  })
}
