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

interface TimeCase {
  minutes: number;
  seconds: number;
  fraction: string;
  separator: string;
}

/**
 * 时间标签用例表：覆盖小数与冒号两种分隔、两位到五位小数、分钟位数增长与整分钟边界。
 */
const TIME_CASES: TimeCase[] = [
  { minutes: 0, seconds: 0, fraction: '00', separator: '.' },
  { minutes: 0, seconds: 1, fraction: '10', separator: '.' },
  { minutes: 0, seconds: 59, fraction: '99', separator: '.' },
  { minutes: 1, seconds: 0, fraction: '00', separator: '.' },
  { minutes: 1, seconds: 60, fraction: '00', separator: '.' },
  { minutes: 2, seconds: 30, fraction: '50', separator: '.' },
  { minutes: 3, seconds: 15, fraction: '25', separator: ':' },
  { minutes: 9, seconds: 1, fraction: '010', separator: '.' },
  { minutes: 10, seconds: 2, fraction: '020', separator: '.' },
  { minutes: 99, seconds: 3, fraction: '030', separator: ':' },
  { minutes: 100, seconds: 4, fraction: '040', separator: '.' },
  { minutes: 123, seconds: 5, fraction: '050', separator: ':' },
  { minutes: 600, seconds: 6, fraction: '060', separator: '.' },
  { minutes: 999, seconds: 7, fraction: '070', separator: ':' },
  { minutes: 1000, seconds: 8, fraction: '080', separator: '.' },
  { minutes: 1001, seconds: 9, fraction: '090', separator: ':' }
];

/**
 * 逐条手写期望起始时间（毫秒），与解析实现分开计算。
 */
const EXPECTED_START_MS: number[] = [
  0, 1100, 59990, 60000, 120000, 150500, 195250, 541010, 602020, 5943030,
  6004040, 7385050, 36006060, 59947070, 60008080, 60069090
];

function pad2(value: number): string {
  return value < 10 ? `0${value}` : `${value}`;
}

function buildTag(item: TimeCase): string {
  let minutes: string = `${item.minutes}`;
  while (minutes.length < 2) {
    minutes = `0${minutes}`;
  }
  return `[${minutes}:${pad2(item.seconds)}${item.separator}${item.fraction}]`;
}

function buildLyric(): string {
  let lines: string[] = [];
  for (let index = 0; index < TIME_CASES.length; index++) {
    lines.push(`${buildTag(TIME_CASES[index])}line${pad2(index)}`);
  }
  return lines.join('\n');
}

function starts(entries: LrcEntry[]): number[] {
  return entries.map((entry: LrcEntry) => entry.lineStartTime);
}

function texts(entries: LrcEntry[]): string[] {
  return entries.map((entry: LrcEntry) => entry.lineWords);
}

function durationsMatchSteps(entries: LrcEntry[]): boolean {
  for (let index = 0; index < entries.length - 1; index++) {
    if (entries[index].lineDuration !== entries[index + 1].lineStartTime - entries[index].lineStartTime) {
      return false;
    }
  }
  return true;
}

export default function LrcTableTest() {
  describe('LrcTableTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_LRC_TABLE_0100
     * @tc.name      testLrcTable0001
     * @tc.desc      验证 16 种时间标签写法逐行解析出的起始时间与手写期望表完全一致，行文本与行序保持不变
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcTable_StartTimes_0100 begin');
      let entries: LrcEntry[] = parseLrcLyric(buildLyric());
      let actual: number[] = starts(entries);
      let expectedTexts: string[] = TIME_CASES.map((item: TimeCase, index: number) => `line${pad2(index)}`);
      let mismatched: number[] = [];
      for (let index = 0; index < EXPECTED_START_MS.length; index++) {
        if (actual[index] !== EXPECTED_START_MS[index]) {
          mismatched.push(index);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `条数=${entries.length}, 不一致下标=${JSON.stringify(mismatched)}, 期望=${EXPECTED_START_MS.join(',')}`);
      expect(mismatched).assertDeepEquals([]);
      expect(entries.length).assertEqual(TIME_CASES.length);
      expect(texts(entries)).assertDeepEquals(expectedTexts);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcTable_StartTimes_0100 end');
    });

    /**
     * @tc.number    SUB_LRC_TABLE_0200
     * @tc.name      testLrcTable0002
     * @tc.desc      验证大表解析后起始时间严格递增、每行持续时间为下一行起始差值、末行持续时间为最大安全整数
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcTable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcTable_Contiguous_0200 begin');
      let entries: LrcEntry[] = parseLrcLyric(buildLyric());
      let ascending: number = 0;
      let firstDuration: number = entries.length > 0 ? entries[0].lineDuration : -1;
      for (let index = 1; index < entries.length; index++) {
        if (entries[index].lineStartTime > entries[index - 1].lineStartTime) {
          ascending++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `条数=${entries.length}, 严格递增=${ascending}, 首行时长=${firstDuration}, ` +
        `末行时长=${entries.length > 0 ? entries[entries.length - 1].lineDuration : -1}`);
      expect(ascending).assertEqual(entries.length - 1);
      expect(firstDuration).assertEqual(EXPECTED_START_MS[1] - EXPECTED_START_MS[0]);
      expect(entries[entries.length - 1].lineDuration).assertEqual(Number.MAX_VALUE);
      expect(durationsMatchSteps(entries)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcTable_Contiguous_0200 end');
    });

    /**
     * @tc.number    SUB_LRC_TABLE_0300
     * @tc.name      testLrcTable0003
     * @tc.desc      验证乱序输入按时间升序重排后文本跟随时间移动，且重排后每行时长仍与相邻起始差值一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcTable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcTable_Shuffle_0300 begin');
      let order: number[] = [5, 0, 9, 2, 7, 1, 8, 3, 6, 4];
      let lines: string[] = order.map((position: number) =>
        `${buildTag(TIME_CASES[position])}line${pad2(position)}`);
      let entries: LrcEntry[] = parseLrcLyric(lines.join('\n'));
      let expectedTexts: string[] = order.slice()
        .sort((left: number, right: number) =>
          EXPECTED_START_MS[left] - EXPECTED_START_MS[right])
        .map((position: number) => `line${pad2(position)}`);
      let actualTexts: string[] = texts(entries);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `条数=${entries.length}, 输入顺序=${order.join(',')}, 重排文本=${actualTexts.join(',')}`);
      expect(actualTexts).assertDeepEquals(expectedTexts);
      expect(starts(entries)).assertDeepEquals(order.slice()
        .sort((left: number, right: number) => EXPECTED_START_MS[left] - EXPECTED_START_MS[right])
        .map((position: number) => EXPECTED_START_MS[position]));
      expect(durationsMatchSteps(entries)).assertTrue();
      expect(actualTexts[0]).assertEqual('line00');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcTable_Shuffle_0300 end');
    });

    /**
     * @tc.number    SUB_LRC_TABLE_0400
     * @tc.name      testLrcTable0004
     * @tc.desc      验证同一时间标签重复出现时按出现顺序保留多条相同起始时间记录，时长按相邻记录差值为零
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcTable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcTable_Duplicates_0400 begin');
      let input: string = [
        '[00:10.00]alpha',
        '[00:10.00]beta',
        '[00:10.000]gamma',
        '[00:20.00]delta'
      ].join('\n');
      let entries: LrcEntry[] = parseLrcLyric(input);
      let actual: number[] = starts(entries);
      let zeroDurations: number = 0;
      for (let index = 0; index < entries.length - 1; index++) {
        if (entries[index].lineDuration === 0) {
          zeroDurations++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `条数=${entries.length}, 起始=${actual.join(',')}, 文本=${texts(entries).join(',')}, 零时长行=${zeroDurations}`);
      expect(entries.length).assertEqual(4);
      expect(actual).assertDeepEquals([10000, 10000, 10000, 20000]);
      expect(texts(entries)).assertDeepEquals(['alpha', 'beta', 'gamma', 'delta']);
      expect(zeroDurations).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcTable_Duplicates_0400 end');
    });
  });
}
