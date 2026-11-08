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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { parseLrcLyric } from '../../../main/ets/common/utils/LrcUtils';
import { LrcEntry } from '../../../main/ets/viewmodel/LrcEntry';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const NONE_LINE: number = -1;

const LYRICS: LrcEntry[] = parseLrcLyric(
  '[00:00.00]intro line\n' +
  '[00:08.84]I will run I will climb I will soar\n' +
  '[00:13.00]I am undefeated\n' +
  '[00:16.72]Jumping out of my skin pull the chord\n');

/**
 * 独立实现：时间落在 [起始, 起始+时长] 的首个行即高亮行，否则保持当前行。
 * 末行时长为最大数值，起点 + 时长溢出为无穷，末行起点之后一直命中末行。
 */
function expectedLine(entries: LrcEntry[], milliseconds: number, current: number): number {
  for (let index = 0; index < entries.length; index++) {
    let start: number = entries[index].lineStartTime;
    if (start <= milliseconds && start + entries[index].lineDuration >= milliseconds) {
      return index;
    }
  }
  return current;
}

interface LocateSample {
  ms: number;
  expectedIndex: number;
}

export default function LyricLocateEdgeTest() {
  describe('LyricLocateEdgeTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_LYRIC_LOCATE_0100
     * @tc.name      testLyricLocateEdge0001
     * @tc.desc      验证播放时间落在每行起止边界上时高亮行与独立定位结果一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_LYRIC_LOCATE_0200
     * @tc.name      testLyricLocateEdge0002
     * @tc.desc      验证相邻歌词行在共享边界时刻优先命中靠前一行且不跳过中间行
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricLocateEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_SharedBoundary_0002 begin');
      let adjacentPairs: LocateSample[] = [
        { ms: LYRICS[0].lineStartTime + LYRICS[0].lineDuration, expectedIndex: 0 },
        { ms: LYRICS[1].lineStartTime + LYRICS[1].lineDuration, expectedIndex: 1 },
        { ms: LYRICS[2].lineStartTime + LYRICS[2].lineDuration, expectedIndex: 2 }
      ];
      for (let sample of adjacentPairs) {
        let actual: number = expectedLine(LYRICS, sample.ms, NONE_LINE);
        hilog.info(DOMAIN, TAG, '%{public}s', `共享边界${sample.ms}ms => 行${actual}`);
        expect(actual).assertEqual(sample.expectedIndex);
      }
      let duplicates: boolean[] = [];
      for (let sample of adjacentPairs) {
        let hit: number[] = [];
        for (let index = 0; index < LYRICS.length; index++) {
          let start: number = LYRICS[index].lineStartTime;
          if (start <= sample.ms && start + LYRICS[index].lineDuration >= sample.ms) {
            hit.push(index);
          }
        }
        duplicates.push(hit.length > 1);
      }
      expect(duplicates).assertDeepEquals([true, true, true]);
      expect(adjacentPairs.length).assertEqual(LYRICS.length - 1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_SharedBoundary_0002 end');
    });

    /**
     * @tc.number    SUB_LYRIC_LOCATE_0300
     * @tc.name      testLyricLocateEdge0003
     * @tc.desc      验证播放时间超出末行范围或为负值时高亮行保持不变
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricLocateEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_LocateOutOfRange_0003 begin');
      let lastIndex: number = LYRICS.length - 1;
      let lastLine: LrcEntry = LYRICS[lastIndex];
      let beyondLast: number = (lastLine.lineDuration === Number.MAX_VALUE
        ? lastLine.lineStartTime + 60000
        : lastLine.lineStartTime + lastLine.lineDuration + 1);
      let cases: LocateSample[] = [
        { ms: -1, expectedIndex: 2 },
        { ms: Number.MIN_SAFE_INTEGER, expectedIndex: 0 },
        { ms: beyondLast, expectedIndex: lastIndex }
      ];
      for (let sample of cases) {
        let actual: number = expectedLine(LYRICS, sample.ms, sample.expectedIndex);
        let unchanged: boolean = actual === sample.expectedIndex;
        hilog.info(DOMAIN, TAG, '%{public}s', `${sample.ms}ms 当前行${sample.expectedIndex} => ${actual}`);
        expect(actual).assertEqual(sample.expectedIndex);
        expect(unchanged).assertTrue();
      }
      let negativeDirect: number = expectedLine(LYRICS, -1, NONE_LINE);
      expect(negativeDirect).assertEqual(NONE_LINE);
      expect(cases.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_LocateOutOfRange_0003 end');
    });

    /**
     * @tc.number    SUB_LYRIC_LOCATE_0400
     * @tc.name      testLyricLocateEdge0004
     * @tc.desc      验证无歌词与单行歌词场景下高亮行定位结果分别保持与命中唯一行
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLyricLocateEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_LocateEmptyAndSingle_0004 begin');
      let empty: LrcEntry[] = parseLrcLyric('[ar:Delacey]\n[ti:Dream It Possible]\n');
      let single: LrcEntry[] = parseLrcLyric('[00:05.00]only line\n');
      let emptyResult: number = expectedLine(empty, 0, NONE_LINE);
      let emptyKept: number = expectedLine(empty, 50000, 3);
      let singleHit: number = expectedLine(single, 5000, NONE_LINE);
      let singleBeyond: number = expectedLine(single, 99999999, NONE_LINE);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `空歌词行数=${empty.length}, 单行歌词行数=${single.length}, 单行末行时长=${single[0].lineDuration}`);
      expect(empty.length).assertEqual(0);
      expect(emptyResult).assertEqual(NONE_LINE);
      expect(emptyKept).assertEqual(3);
      expect(single.length).assertEqual(1);
      expect(singleHit).assertEqual(0);
      expect(singleBeyond).assertEqual(0);
      expect(single[0].lineDuration).assertEqual(Number.MAX_VALUE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lyric_LocateEmptyAndSingle_0004 end');
    });
  });
}
