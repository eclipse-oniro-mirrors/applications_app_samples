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
import { parseKrcLyric } from '../../../main/ets/common/utils/LrcUtils';
import { LrcEntry, Word } from '../../../main/ets/viewmodel/LrcEntry';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

const SYLLABLES: string[] = ['for ', 'a ', 'mo', 'ment ', 'music ', 'is ', 'the ', 'key'];

function wordTag(start: number, duration: number, text: string): string {
  return `<${start},${duration},0>${text}`;
}

function buildLine(start: number, duration: number, from: number, take: number): string {
  let body: string = '';
  for (let index = 0; index < take; index++) {
    // 逐字标签里的起始时间是相对本行起点的偏移，整行都写成本行内的 offset。
    body += wordTag(index * 20, 20, SYLLABLES[(from + index) % SYLLABLES.length]);
  }
  return `[${start},${duration}]${body}`;
}

function joined(entry: LrcEntry): string {
  return entry.words.map((word: Word) => word.text).join('');
}

function expectedBody(from: number, take: number): string {
  let text: string = '';
  for (let index = 0; index < take; index++) {
    text += SYLLABLES[(from + index) % SYLLABLES.length];
  }
  return text;
}

function wordsInOrder(entry: LrcEntry): boolean {
  for (let index = 1; index < entry.words.length; index++) {
    if (entry.words[index - 1].wordStartTime >= entry.words[index].wordStartTime) {
      return false;
    }
  }
  return true;
}

/**
 * 逐字时间轴：行头时间 + 逐字相对偏移。
 */
function absoluteWordTimes(entry: LrcEntry): number[] {
  return entry.words.map((word: Word) => entry.lineStartTime + word.wordStartTime);
}

export default function KrcTableTest() {
  describe('KrcTableTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_KRC_TABLE_0100
     * @tc.name      testKrcTable0001
     * @tc.desc      验证五档逐字数量的行解析后逐字数组长度与手写数量表一致，整行文本等于各字拼接结果
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcTable_WordCounts_0100 begin');
      let takes: number[] = [1, 2, 4, 6, 8];
      let lines: string[] = [];
      for (let index = 0; index < takes.length; index++) {
        lines.push(buildLine(1000 + index * 500, 400, index, takes[index]));
      }
      let entries: LrcEntry[] = parseKrcLyric(lines.join('\n'));
      let counts: number[] = entries.map((entry: LrcEntry) => entry.words.length);
      let textMismatch: number = 0;
      for (let index = 0; index < entries.length; index++) {
        if (entries[index].lineWords !== expectedBody(index, takes[index]) ||
          joined(entries[index]) !== entries[index].lineWords) {
          textMismatch++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `逐字数量=${counts.join(',')}, 文本不一致=${textMismatch}, 条数=${entries.length}`);
      expect(counts).assertDeepEquals(takes);
      expect(textMismatch).assertEqual(0);
      expect(entries.length).assertEqual(takes.length);
      expect(entries.every((entry: LrcEntry) => entry.words.length > 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcTable_WordCounts_0100 end');
    });

    /**
     * @tc.number    SUB_KRC_TABLE_0200
     * @tc.name      testKrcTable0002
     * @tc.desc      验证每行逐字偏移严格递增且偏移加时长不超过行时长，逐字时长与手写表一致，绝对时间等于行头加偏移
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcTable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcTable_WordOffsets_0200 begin');
      let entries: LrcEntry[] = parseKrcLyric(
        [buildLine(2000, 400, 0, 4), buildLine(3000, 200, 4, 4)].join('\n'));
      let outside: number = 0;
      let orderBreaks: number = 0;
      let durationSum: number[] = [];
      for (let entry of entries) {
        if (!wordsInOrder(entry)) {
          orderBreaks++;
        }
        let total: number = 0;
        for (let word of entry.words) {
          total += word.duration;
          if (word.wordStartTime < 0 || word.wordStartTime + word.duration > entry.lineDuration ||
            word.duration !== 20) {
            outside++;
          }
        }
        durationSum.push(total);
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `顺序破坏=${orderBreaks}, 越界或时长异常=${outside}, 逐字时长合计=${durationSum.join(',')}, ` +
        `首行首字偏移=${entries[0].words[0].wordStartTime}, 首行绝对时间=${absoluteWordTimes(entries[0]).join(',')}`);
      expect(orderBreaks).assertEqual(0);
      expect(outside).assertEqual(0);
      expect(durationSum).assertDeepEquals([80, 80]);
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(absoluteWordTimes(entries[0])).assertDeepEquals([2000, 2020, 2040, 2060]);
      expect(absoluteWordTimes(entries[1])).assertDeepEquals([3000, 3020, 3040, 3060]);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcTable_WordOffsets_0200 end');
    });

    /**
     * @tc.number    SUB_KRC_TABLE_0300
     * @tc.name      testKrcTable0003
     * @tc.desc      验证行头起始时间与时长按整数逐行读取，正常行与乱序行重排后起始时间与手写表一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcTable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcTable_LineHeaders_0300 begin');
      let starts: number[] = [9000, 1000, 5000, 3000];
      let durations: number[] = [700, 300, 500, 400];
      let order: number[] = [2, 0, 3, 1];
      let lines: string[] = order.map((index: number) =>
        `[${starts[index]},${durations[index]}]${wordTag(0, 50, SYLLABLES[index])}`);
      let entries: LrcEntry[] = parseKrcLyric(lines.join('\n'));
      let sortedIndexes: number[] = order.slice().sort((left: number, right: number) =>
        starts[left] - starts[right]);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `输入顺序=${order.join(',')}, 输出起始=${entries.map((entry: LrcEntry) => entry.lineStartTime).join(',')}, ` +
        `输出时长=${entries.map((entry: LrcEntry) => entry.lineDuration).join(',')}`);
      expect(entries.map((entry: LrcEntry) => entry.lineStartTime))
        .assertDeepEquals(sortedIndexes.map((index: number) => starts[index]));
      expect(entries.map((entry: LrcEntry) => entry.lineDuration))
        .assertDeepEquals(sortedIndexes.map((index: number) => durations[index]));
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].lineStartTime + entries[0].words[0].wordStartTime).assertEqual(1000);
      expect(entries[entries.length - 1].words[0].text).assertEqual('for ');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcTable_LineHeaders_0300 end');
    });

    /**
     * @tc.number    SUB_KRC_TABLE_0400
     * @tc.name      testKrcTable0004
     * @tc.desc      验证同一逐字时间轴在不同行中独立计算：换行后逐字累计不跨行，行间文本互不拼接
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcTable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcTable_Boundary_0400 begin');
      let input: string = [
        `[1000,300]${wordTag(0, 100, 'aaa')}${wordTag(100, 100, 'bbb')}`,
        `[1300,300]${wordTag(0, 100, 'ccc')}${wordTag(100, 100, 'ddd')}${wordTag(200, 100, 'eee')}`,
        `[1700,200]${wordTag(0, 100, 'fff')}`
      ].join('\n');
      let entries: LrcEntry[] = parseKrcLyric(input);
      let wordTexts: string[] = entries.map((entry: LrcEntry) => joined(entry));
      let crossBoundary: number = 0;
      for (let index = 0; index < entries.length; index++) {
        for (let word of entries[index].words) {
          if (word.wordStartTime < 0 || word.wordStartTime + word.duration > entries[index].lineDuration) {
            crossBoundary++;
          }
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `行文本=${wordTexts.join('|')}, 越界逐字=${crossBoundary}, 末行字数=${entries[2].words.length}`);
      expect(wordTexts).assertDeepEquals(['aaabbb', 'cccdddeee', 'fff']);
      expect(crossBoundary).assertEqual(0);
      expect(entries[1].words.length).assertEqual(3);
      expect(entries[2].words[0].wordStartTime).assertEqual(0);
      expect(absoluteWordTimes(entries[2])).assertDeepEquals([1700]);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcTable_Boundary_0400 end');
    });

    /**
     * @tc.number    SUB_KRC_TABLE_0500
     * @tc.name      testKrcTable0005
     * @tc.desc      验证只有行头、空行与不含逐字标签的行头都会生成记录且逐字数组为空，记录数等于带行头的行数
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcTable0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcTable_HeaderOnly_0500 begin');
      let input: string = [
        '[10,100]',
        '[20,100]plain text without tags',
        '[30,100]<40,10,0>',
        '[40,100]<50,10,0><60,10,0>ok',
        '',
        '5,100 no header'
      ].join('\n');
      let entries: LrcEntry[] = parseKrcLyric(input);
      let emptyWords: number[] = entries.map((entry: LrcEntry) => entry.words.length);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `条数=${entries.length}, 逐字数量=${emptyWords.join(',')}, 文本=${JSON.stringify(entries.map((entry: LrcEntry) =>
          entry.lineWords))}`);
      expect(entries.length).assertEqual(4);
      expect(emptyWords).assertDeepEquals([0, 0, 1, 2]);
      expect(entries[1].lineWords).assertEqual('');
      expect(entries[3].lineWords).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcTable_HeaderOnly_0500 end');
    });

    /**
     * @tc.number    SUB_KRC_TABLE_0600
     * @tc.name      testKrcTable0006
     * @tc.desc      验证 8 字整行与逐字拆解两种写法解析结果一致：文本相同、逐字时间相同、行头相同
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcTable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcTable_Equivalent_0600 begin');
      let single: LrcEntry[] = parseKrcLyric(`[4000,500]${wordTag(0, 500, expectedBody(0, 8))}`);
      let split: LrcEntry[] = parseKrcLyric(buildLine(4000, 500, 0, 8));
      let splitTimes: number[] = split[0].words.map((word: Word) => word.wordStartTime);
      let expectedTimes: number[] = [];
      for (let index = 0; index < 8; index++) {
        expectedTimes.push(index * 20);
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `整行文本=${single[0].lineWords}, 拆解文本=${split[0].lineWords}, 逐字偏移=${splitTimes.join(',')}`);
      expect(split[0].lineWords).assertEqual(single[0].lineWords);
      expect(splitTimes).assertDeepEquals(expectedTimes);
      expect(absoluteWordTimes(split[0])).assertDeepEquals(expectedTimes.map((offset: number) => 4000 + offset));
      expect(split[0].lineStartTime).assertEqual(single[0].lineStartTime);
      expect(split[0].lineDuration).assertEqual(single[0].lineDuration);
      expect(single[0].words.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcTable_Equivalent_0600 end');
    });
  });
}
