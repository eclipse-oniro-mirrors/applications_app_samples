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

const MINUTE_TAG_REGEX: RegExp = /^\[(\d{2,}):(\d{2})(?:[.:](\d{2,}))?\]/;

interface LrcSample {
  name: string;
  text: string;
  expectedMs: number;
  expectedWords: string;
}

function pad(value: number, width: number): string {
  return value.toString().padStart(width, '0');
}

function expectedMsFromTag(tag: string): number {
  let match: RegExpMatchArray | null = tag.match(MINUTE_TAG_REGEX);
  if (!match) {
    return -1;
  }
  let minute: number = Number.parseInt(match[1]);
  let second: number = Number.parseInt(match[2]);
  let fraction: number = match[3] === undefined ? 0 : Number.parseFloat('0.' + match[3]);
  return Math.round((minute * 60 + second + fraction) * 1000);
}

const SAMPLES: LrcSample[] = [
  { name: '整十秒', text: '[00:10.00]ten seconds', expectedMs: 10000, expectedWords: 'ten seconds' },
  { name: '毫秒进位', text: '[00:10.99]ninety nine', expectedMs: 10990, expectedWords: 'ninety nine' },
  { name: '冒号分隔', text: '[00:10:50]colon split', expectedMs: 10500, expectedWords: 'colon split' },
  { name: '三位小数', text: '[01:02.345]three digits', expectedMs: 62345, expectedWords: 'three digits' },
  { name: '零分整点', text: '[00:00.00]zero start', expectedMs: 0, expectedWords: 'zero start' },
  { name: '十分钟', text: '[10:00.00]ten minutes', expectedMs: 600000, expectedWords: 'ten minutes' },
  { name: '长分钟位', text: '[123:45.67]long minute', expectedMs: 7425670, expectedWords: 'long minute' },
  { name: '中文歌词', text: '[02:05.25]梦开始的地方', expectedMs: 125250, expectedWords: '梦开始的地方' },
  { name: '含空格文本', text: '[00:07.07]  spaced  line  ', expectedMs: 7070, expectedWords: 'spaced  line' },
  { name: '七分钟', text: '[07:09.10]seven nine', expectedMs: 429100, expectedWords: 'seven nine' }
];

function samplesCoverAllBranches(): boolean {
  let hasDot: boolean = false;
  let hasColon: boolean = false;
  let hasNonAscii: boolean = false;
  for (let sample of SAMPLES) {
    if (sample.text.includes('.')) {
      hasDot = true;
    }
    if (sample.text.includes(':') && sample.text.indexOf(']') > sample.text.lastIndexOf(':')) {
      hasColon = true;
    }
    if (/[^\x00-\x7F]/.test(sample.text)) {
      hasNonAscii = true;
    }
  }
  return hasDot && hasColon && hasNonAscii;
}

function checkSample(sample: LrcSample): boolean {
  let entries: LrcEntry[] = parseLrcLyric(sample.text + '\n');
  let oracleMs: number = expectedMsFromTag(sample.text);
  hilog.info(DOMAIN, TAG, '%{public}s',
    `${sample.name}: lines=${entries.length}, ms=${entries.length > 0 ? entries[0].lineStartTime : 'NA'}, ` +
    `oracle=${oracleMs}`);
  expect(entries.length).assertEqual(1);
  expect(oracleMs).assertEqual(sample.expectedMs);
  expect(entries[0].lineStartTime).assertEqual(oracleMs);
  expect(entries[0].lineWords.trim()).assertEqual(sample.expectedWords);
  return entries[0].lineStartTime === oracleMs && entries[0].lineWords.trim() === sample.expectedWords;
}

export default function LrcParseMatrixTest() {
  describe('LrcParseMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_LRC_MATRIX_0100
     * @tc.name      testLrcParseMatrix0001
     * @tc.desc      验证时间标签逐项换算为毫秒并与独立换算结果一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcParseMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_TimeTable_0001 begin');
      let matched: number = 0;
      for (let sample of SAMPLES) {
        if (checkSample(sample)) {
          matched++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `共校验时间标签样本数=${SAMPLES.length}, 与独立换算一致=${matched}`);
      expect(SAMPLES.length).assertEqual(10);
      expect(samplesCoverAllBranches()).assertTrue();
      expect(matched).assertEqual(SAMPLES.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_TimeTable_0001 end');
    });

    /**
     * @tc.number    SUB_LRC_MATRIX_0200
     * @tc.name      testLrcParseMatrix0002
     * @tc.desc      验证乱序与重复时间标签按升序排列且行时长由相邻起始时间差决定
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcParseMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_SortDuration_0002 begin');
      let text: string = '[00:30.00]third\n[00:10.00]first\n[00:20.00]second\n';
      let entries: LrcEntry[] = parseLrcLyric(text);
      let starts: number[] = [];
      let ascending: boolean = true;
      for (let i = 0; i < entries.length; i++) {
        starts.push(entries[i].lineStartTime);
        if (i > 0 && entries[i].lineStartTime <= entries[i - 1].lineStartTime) {
          ascending = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `起始时间序列=${starts}, 严格升序=${ascending}`);
      expect(entries.length).assertEqual(3);
      expect(ascending).assertTrue();
      expect(entries[0].lineWords.trim()).assertEqual('first');
      expect(entries[2].lineWords.trim()).assertEqual('third');
      for (let i = 0; i < entries.length - 1; i++) {
        expect(entries[i].lineDuration).assertEqual(entries[i + 1].lineStartTime - entries[i].lineStartTime);
      }
      expect(entries[0].lineDuration).assertEqual(10000);
      expect(entries[1].lineDuration).assertEqual(10000);
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_SortDuration_0002 end');
    });

    /**
     * @tc.number    SUB_LRC_MATRIX_0300
     * @tc.name      testLrcParseMatrix0003
     * @tc.desc      验证同一行多个时间标签各自展开为独立歌词行且行时长受重复片段约束
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcParseMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_MultiTag_0003 begin');
      let text: string = '[00:05.00][00:15.00][00:25.00]chorus\n[00:10.00]verse\n';
      let entries: LrcEntry[] = parseLrcLyric(text);
      let chorusCount: number = 0;
      for (let entry of entries) {
        if (entry.lineWords.trim() === 'chorus') {
          chorusCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `行数=${entries.length}, chorus次数=${chorusCount}, 起始=${entries.map(e => e.lineStartTime)}`);
      expect(entries.length).assertEqual(4);
      expect(chorusCount).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[1].lineStartTime).assertEqual(10000);
      expect(entries[1].lineWords.trim()).assertEqual('verse');
      expect(entries[2].lineStartTime).assertEqual(15000);
      expect(entries[3].lineStartTime).assertEqual(25000);
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      for (let i = 0; i < entries.length - 1; i++) {
        let gap: number = entries[i + 1].lineStartTime - entries[i].lineStartTime;
        expect(entries[i].lineDuration).assertEqual(gap);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_MultiTag_0003 end');
    });

    /**
     * @tc.number    SUB_LRC_MATRIX_0400
     * @tc.name      testLrcParseMatrix0004
     * @tc.desc      验证无时间标签或无歌词文本的片段被丢弃且不产生空行
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcParseMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_DropInvalid_0004 begin');
      let text: string =
        '[ar:Delacey]\n' +
        '[ti:Dream It Possible]\n' +
        '[00:08.84]\n' +
        'plain text without tag\n' +
        '[00:12.00]kept line\n' +
        '[00:13.00]\n';
      let entries: LrcEntry[] = parseLrcLyric(text);
      hilog.info(DOMAIN, TAG, '%{public}s', `保留行数=${entries.length}`);
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(12000);
      expect(entries[0].lineWords.trim()).assertEqual('kept line');
      for (let entry of entries) {
        expect(entry.lineWords.trim().length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_DropInvalid_0004 end');
    });

    /**
     * @tc.number    SUB_LRC_MATRIX_0500
     * @tc.name      testLrcParseMatrix0005
     * @tc.desc      验证真实歌词片段逐行解析结果与有效标签行数及时间递增规则一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcParseMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_RealFile_0005 begin');
      let rawText: string =
        '[00:00.15]Delacey - Dream It Possible\n' +
        '[00:08.84]I will run I will climb I will soar\n' +
        '[00:13.00]I am undefeated\n' +
        '[01:03.48]Possible\n';
      let entries: LrcEntry[] = parseLrcLyric(rawText);
      let rawLines: string[] = rawText.split('\n');
      let tagLineCount: number = 0;
      let invalidTagCount: number = 0;
      for (let line of rawLines) {
        if (line.length === 0) {
          continue;
        }
        if (MINUTE_TAG_REGEX.test(line)) {
          tagLineCount++;
          if (expectedMsFromTag(line) < 0) {
            invalidTagCount++;
          }
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `文件有效行=${tagLineCount}, 解析行=${entries.length}, 非法标签=${invalidTagCount}, ` +
        `首行时间=${entries[0].lineStartTime}, 末行时间=${entries[entries.length - 1].lineStartTime}`);
      expect(invalidTagCount).assertEqual(0);
      expect(entries.length).assertEqual(tagLineCount);
      expect(entries[0].lineStartTime).assertEqual(150);
      expect(entries[entries.length - 1].lineStartTime).assertEqual(expectedMsFromTag('[01:03.48]'));
      expect(entries[entries.length - 1].lineStartTime).assertEqual(63480);
      expect(entries[entries.length - 1].lineDuration).assertEqual(Number.MAX_VALUE);
      for (let i = 1; i < entries.length; i++) {
        expect(entries[i].lineStartTime > entries[i - 1].lineStartTime).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcParse_RealFile_0005 end');
    });
  });
}
