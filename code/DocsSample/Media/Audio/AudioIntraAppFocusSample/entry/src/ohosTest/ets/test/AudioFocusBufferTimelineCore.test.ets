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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_audioFocusBufferTimelineCore]';
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

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function audioFocusBufferTimelineCoreTest(): void {
  describe('audioFocusBufferTimelineCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0001
     * @tc.name      testExtFocusTimeline0000
     * @tc.desc      Buffer timeline 0-20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 0;
      const end: number = 20;
      const time: number = 0;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0002
     * @tc.name      testExtFocusTimeline0001
     * @tc.desc      Buffer timeline 11-41.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 11;
      const end: number = 41;
      const time: number = 14;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0003
     * @tc.name      testExtFocusTimeline0002
     * @tc.desc      Buffer timeline 22-62.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 22;
      const end: number = 62;
      const time: number = 28;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0004
     * @tc.name      testExtFocusTimeline0003
     * @tc.desc      Buffer timeline 33-83.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 33;
      const end: number = 83;
      const time: number = 42;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0005
     * @tc.name      testExtFocusTimeline0004
     * @tc.desc      Buffer timeline 44-104.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 44;
      const end: number = 104;
      const time: number = 56;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0006
     * @tc.name      testExtFocusTimeline0005
     * @tc.desc      Buffer timeline 55-75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 55;
      const end: number = 75;
      const time: number = 70;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0007
     * @tc.name      testExtFocusTimeline0006
     * @tc.desc      Buffer timeline 66-96.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 66;
      const end: number = 96;
      const time: number = 84;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0008
     * @tc.name      testExtFocusTimeline0007
     * @tc.desc      Buffer timeline 77-117.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 77;
      const end: number = 117;
      const time: number = 78;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0009
     * @tc.name      testExtFocusTimeline0008
     * @tc.desc      Buffer timeline 88-138.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 88;
      const end: number = 138;
      const time: number = 92;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0010
     * @tc.name      testExtFocusTimeline0009
     * @tc.desc      Buffer timeline 99-159.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 99;
      const end: number = 159;
      const time: number = 106;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0011
     * @tc.name      testExtFocusTimeline0010
     * @tc.desc      Buffer timeline 110-130.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 110;
      const end: number = 130;
      const time: number = 120;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0012
     * @tc.name      testExtFocusTimeline0011
     * @tc.desc      Buffer timeline 121-151.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 121;
      const end: number = 151;
      const time: number = 134;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0013
     * @tc.name      testExtFocusTimeline0012
     * @tc.desc      Buffer timeline 132-172.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 132;
      const end: number = 172;
      const time: number = 148;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0014
     * @tc.name      testExtFocusTimeline0013
     * @tc.desc      Buffer timeline 143-193.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 143;
      const end: number = 193;
      const time: number = 162;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0015
     * @tc.name      testExtFocusTimeline0014
     * @tc.desc      Buffer timeline 154-214.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 154;
      const end: number = 214;
      const time: number = 156;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0016
     * @tc.name      testExtFocusTimeline0015
     * @tc.desc      Buffer timeline 165-185.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 165;
      const end: number = 185;
      const time: number = 170;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0017
     * @tc.name      testExtFocusTimeline0016
     * @tc.desc      Buffer timeline 176-206.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 176;
      const end: number = 206;
      const time: number = 184;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0018
     * @tc.name      testExtFocusTimeline0017
     * @tc.desc      Buffer timeline 187-227.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 187;
      const end: number = 227;
      const time: number = 198;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0019
     * @tc.name      testExtFocusTimeline0018
     * @tc.desc      Buffer timeline 198-248.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 198;
      const end: number = 248;
      const time: number = 212;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0020
     * @tc.name      testExtFocusTimeline0019
     * @tc.desc      Buffer timeline 209-269.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 209;
      const end: number = 269;
      const time: number = 226;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0021
     * @tc.name      testExtFocusTimeline0020
     * @tc.desc      Buffer timeline 220-240.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 220;
      const end: number = 240;
      const time: number = 220;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0022
     * @tc.name      testExtFocusTimeline0021
     * @tc.desc      Buffer timeline 231-261.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 231;
      const end: number = 261;
      const time: number = 234;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0023
     * @tc.name      testExtFocusTimeline0022
     * @tc.desc      Buffer timeline 242-282.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 242;
      const end: number = 282;
      const time: number = 248;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0024
     * @tc.name      testExtFocusTimeline0023
     * @tc.desc      Buffer timeline 253-303.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 253;
      const end: number = 303;
      const time: number = 262;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0025
     * @tc.name      testExtFocusTimeline0024
     * @tc.desc      Buffer timeline 264-324.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 264;
      const end: number = 324;
      const time: number = 276;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0026
     * @tc.name      testExtFocusTimeline0025
     * @tc.desc      Buffer timeline 275-295.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 275;
      const end: number = 295;
      const time: number = 290;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0027
     * @tc.name      testExtFocusTimeline0026
     * @tc.desc      Buffer timeline 286-316.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 286;
      const end: number = 316;
      const time: number = 304;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0028
     * @tc.name      testExtFocusTimeline0027
     * @tc.desc      Buffer timeline 297-337.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 297;
      const end: number = 337;
      const time: number = 298;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0029
     * @tc.name      testExtFocusTimeline0028
     * @tc.desc      Buffer timeline 308-358.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 308;
      const end: number = 358;
      const time: number = 312;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0030
     * @tc.name      testExtFocusTimeline0029
     * @tc.desc      Buffer timeline 319-379.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 319;
      const end: number = 379;
      const time: number = 326;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0031
     * @tc.name      testExtFocusTimeline0030
     * @tc.desc      Buffer timeline 330-350.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 330;
      const end: number = 350;
      const time: number = 340;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0032
     * @tc.name      testExtFocusTimeline0031
     * @tc.desc      Buffer timeline 341-371.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 341;
      const end: number = 371;
      const time: number = 354;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0033
     * @tc.name      testExtFocusTimeline0032
     * @tc.desc      Buffer timeline 352-392.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 352;
      const end: number = 392;
      const time: number = 368;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0034
     * @tc.name      testExtFocusTimeline0033
     * @tc.desc      Buffer timeline 363-413.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 363;
      const end: number = 413;
      const time: number = 382;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0035
     * @tc.name      testExtFocusTimeline0034
     * @tc.desc      Buffer timeline 374-434.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 374;
      const end: number = 434;
      const time: number = 376;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0036
     * @tc.name      testExtFocusTimeline0035
     * @tc.desc      Buffer timeline 385-405.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 385;
      const end: number = 405;
      const time: number = 390;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0037
     * @tc.name      testExtFocusTimeline0036
     * @tc.desc      Buffer timeline 396-426.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 396;
      const end: number = 426;
      const time: number = 404;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0038
     * @tc.name      testExtFocusTimeline0037
     * @tc.desc      Buffer timeline 407-447.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 407;
      const end: number = 447;
      const time: number = 418;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0039
     * @tc.name      testExtFocusTimeline0038
     * @tc.desc      Buffer timeline 418-468.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 418;
      const end: number = 468;
      const time: number = 432;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0040
     * @tc.name      testExtFocusTimeline0039
     * @tc.desc      Buffer timeline 429-489.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 429;
      const end: number = 489;
      const time: number = 446;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0041
     * @tc.name      testExtFocusTimeline0040
     * @tc.desc      Buffer timeline 440-460.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 440;
      const end: number = 460;
      const time: number = 440;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0042
     * @tc.name      testExtFocusTimeline0041
     * @tc.desc      Buffer timeline 451-481.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 451;
      const end: number = 481;
      const time: number = 454;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0043
     * @tc.name      testExtFocusTimeline0042
     * @tc.desc      Buffer timeline 462-502.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 462;
      const end: number = 502;
      const time: number = 468;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0044
     * @tc.name      testExtFocusTimeline0043
     * @tc.desc      Buffer timeline 473-523.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 473;
      const end: number = 523;
      const time: number = 482;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0045
     * @tc.name      testExtFocusTimeline0044
     * @tc.desc      Buffer timeline 484-544.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 484;
      const end: number = 544;
      const time: number = 496;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0046
     * @tc.name      testExtFocusTimeline0045
     * @tc.desc      Buffer timeline 495-515.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 495;
      const end: number = 515;
      const time: number = 510;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0047
     * @tc.name      testExtFocusTimeline0046
     * @tc.desc      Buffer timeline 6-36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 6;
      const end: number = 36;
      const time: number = 24;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0048
     * @tc.name      testExtFocusTimeline0047
     * @tc.desc      Buffer timeline 17-57.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 17;
      const end: number = 57;
      const time: number = 18;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0049
     * @tc.name      testExtFocusTimeline0048
     * @tc.desc      Buffer timeline 28-78.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 28;
      const end: number = 78;
      const time: number = 32;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0050
     * @tc.name      testExtFocusTimeline0049
     * @tc.desc      Buffer timeline 39-99.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 39;
      const end: number = 99;
      const time: number = 46;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0051
     * @tc.name      testExtFocusTimeline0050
     * @tc.desc      Buffer timeline 50-70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 50;
      const end: number = 70;
      const time: number = 60;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0052
     * @tc.name      testExtFocusTimeline0051
     * @tc.desc      Buffer timeline 61-91.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 61;
      const end: number = 91;
      const time: number = 74;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0053
     * @tc.name      testExtFocusTimeline0052
     * @tc.desc      Buffer timeline 72-112.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 72;
      const end: number = 112;
      const time: number = 88;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0054
     * @tc.name      testExtFocusTimeline0053
     * @tc.desc      Buffer timeline 83-133.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 83;
      const end: number = 133;
      const time: number = 102;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0055
     * @tc.name      testExtFocusTimeline0054
     * @tc.desc      Buffer timeline 94-154.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 94;
      const end: number = 154;
      const time: number = 96;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0056
     * @tc.name      testExtFocusTimeline0055
     * @tc.desc      Buffer timeline 105-125.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 105;
      const end: number = 125;
      const time: number = 110;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0057
     * @tc.name      testExtFocusTimeline0056
     * @tc.desc      Buffer timeline 116-146.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 116;
      const end: number = 146;
      const time: number = 124;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0058
     * @tc.name      testExtFocusTimeline0057
     * @tc.desc      Buffer timeline 127-167.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 127;
      const end: number = 167;
      const time: number = 138;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0059
     * @tc.name      testExtFocusTimeline0058
     * @tc.desc      Buffer timeline 138-188.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 138;
      const end: number = 188;
      const time: number = 152;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0060
     * @tc.name      testExtFocusTimeline0059
     * @tc.desc      Buffer timeline 149-209.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 149;
      const end: number = 209;
      const time: number = 166;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0061
     * @tc.name      testExtFocusTimeline0060
     * @tc.desc      Buffer timeline 160-180.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 160;
      const end: number = 180;
      const time: number = 160;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0062
     * @tc.name      testExtFocusTimeline0061
     * @tc.desc      Buffer timeline 171-201.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 171;
      const end: number = 201;
      const time: number = 174;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0063
     * @tc.name      testExtFocusTimeline0062
     * @tc.desc      Buffer timeline 182-222.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 182;
      const end: number = 222;
      const time: number = 188;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0064
     * @tc.name      testExtFocusTimeline0063
     * @tc.desc      Buffer timeline 193-243.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 193;
      const end: number = 243;
      const time: number = 202;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0065
     * @tc.name      testExtFocusTimeline0064
     * @tc.desc      Buffer timeline 204-264.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 204;
      const end: number = 264;
      const time: number = 216;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0066
     * @tc.name      testExtFocusTimeline0065
     * @tc.desc      Buffer timeline 215-235.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 215;
      const end: number = 235;
      const time: number = 230;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0067
     * @tc.name      testExtFocusTimeline0066
     * @tc.desc      Buffer timeline 226-256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 226;
      const end: number = 256;
      const time: number = 244;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0068
     * @tc.name      testExtFocusTimeline0067
     * @tc.desc      Buffer timeline 237-277.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 237;
      const end: number = 277;
      const time: number = 238;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0069
     * @tc.name      testExtFocusTimeline0068
     * @tc.desc      Buffer timeline 248-298.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 248;
      const end: number = 298;
      const time: number = 252;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0070
     * @tc.name      testExtFocusTimeline0069
     * @tc.desc      Buffer timeline 259-319.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 259;
      const end: number = 319;
      const time: number = 266;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0071
     * @tc.name      testExtFocusTimeline0070
     * @tc.desc      Buffer timeline 270-290.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 270;
      const end: number = 290;
      const time: number = 280;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0072
     * @tc.name      testExtFocusTimeline0071
     * @tc.desc      Buffer timeline 281-311.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 281;
      const end: number = 311;
      const time: number = 294;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0073
     * @tc.name      testExtFocusTimeline0072
     * @tc.desc      Buffer timeline 292-332.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 292;
      const end: number = 332;
      const time: number = 308;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0074
     * @tc.name      testExtFocusTimeline0073
     * @tc.desc      Buffer timeline 303-353.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 303;
      const end: number = 353;
      const time: number = 322;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0075
     * @tc.name      testExtFocusTimeline0074
     * @tc.desc      Buffer timeline 314-374.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 314;
      const end: number = 374;
      const time: number = 316;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0076
     * @tc.name      testExtFocusTimeline0075
     * @tc.desc      Buffer timeline 325-345.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 325;
      const end: number = 345;
      const time: number = 330;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0077
     * @tc.name      testExtFocusTimeline0076
     * @tc.desc      Buffer timeline 336-366.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 336;
      const end: number = 366;
      const time: number = 344;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0078
     * @tc.name      testExtFocusTimeline0077
     * @tc.desc      Buffer timeline 347-387.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 347;
      const end: number = 387;
      const time: number = 358;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0079
     * @tc.name      testExtFocusTimeline0078
     * @tc.desc      Buffer timeline 358-408.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 358;
      const end: number = 408;
      const time: number = 372;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_TIMELINE_0080
     * @tc.name      testExtFocusTimeline0079
     * @tc.desc      Buffer timeline 369-429.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusTimeline0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = 369;
      const end: number = 429;
      const time: number = 386;
      const contains: boolean = time >= start && time <= end;
      expect(end).assertLarger(start);
      expect(contains).assertEqual(true);
      expect(end - start).assertLarger(0);
    })
  });
}
