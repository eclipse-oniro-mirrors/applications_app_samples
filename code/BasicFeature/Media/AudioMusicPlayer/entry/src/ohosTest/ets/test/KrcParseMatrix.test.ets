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

interface KrcWordSample {
  text: string;
  start: number;
  duration: number;
}

interface KrcLineSample {
  name: string;
  line: string;
  start: number;
  duration: number;
  words: KrcWordSample[];
}

const KRC_LINES: KrcLineSample[] = [
  {
    name: '单字',
    line: '[1000,500]<0,500,0>Hi',
    start: 1000,
    duration: 500,
    words: [{ text: 'Hi', start: 0, duration: 500 }]
  },
  {
    name: '逐字时间',
    line: '[2280,1140]<0,200,0>Hey <200,400,0>you <600,540,0>guys',
    start: 2280,
    duration: 1140,
    words: [
      { text: 'Hey ', start: 0, duration: 200 },
      { text: 'you ', start: 200, duration: 400 },
      { text: 'guys', start: 600, duration: 540 }
    ]
  },
  {
    name: '中文歌词',
    line: '[5000,2000]<0,1000,0>夜空中<1000,1000,0>最亮的星',
    start: 5000,
    duration: 2000,
    words: [
      { text: '夜空中', start: 0, duration: 1000 },
      { text: '最亮的星', start: 1000, duration: 1000 }
    ]
  },
  {
    name: '符号歌词',
    line: '[8000,600]<0,300,0>Ah~<300,300,0>oh!',
    start: 8000,
    duration: 600,
    words: [
      { text: 'Ah~', start: 0, duration: 300 },
      { text: 'oh!', start: 300, duration: 300 }
    ]
  },
  {
    name: '无字标签',
    line: '[12000,1000]plain text only',
    start: 12000,
    duration: 1000,
    words: []
  }
];

function checkKrcLine(sample: KrcLineSample): boolean {
  let entries: LrcEntry[] = parseKrcLyric(sample.line + '\n');
  let expectedText: string = '';
  for (let word of sample.words) {
    expectedText += word.text;
  }
  hilog.info(DOMAIN, TAG, '%{public}s',
    `${sample.name}: lines=${entries.length}, start=${entries.length > 0 ? entries[0].lineStartTime : 'NA'}, ` +
    `words=${entries.length > 0 ? entries[0].words.length : 'NA'}`);
  expect(entries.length).assertEqual(1);
  expect(entries[0].lineStartTime).assertEqual(sample.start);
  expect(entries[0].lineDuration).assertEqual(sample.duration);
  expect(entries[0].lineWords).assertEqual(expectedText);
  expect(entries[0].words.length).assertEqual(sample.words.length);
  for (let i = 0; i < sample.words.length; i++) {
    let word: Word = entries[0].words[i];
    expect(word.text).assertEqual(sample.words[i].text);
    expect(word.wordStartTime).assertEqual(sample.words[i].start);
    expect(word.duration).assertEqual(sample.words[i].duration);
  }
  return entries[0].lineWords === expectedText && entries[0].words.length === sample.words.length;
}

export default function KrcParseMatrixTest() {
  describe('KrcParseMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_KRC_MATRIX_0100
     * @tc.name      testKrcParseMatrix0001
     * @tc.desc      验证逐字时间标签解析出的起始时间、字数与文本拼接结果
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcParseMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcParse_WordTable_0001 begin');
      let matched: number = 0;
      for (let sample of KRC_LINES) {
        if (checkKrcLine(sample)) {
          matched++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `共校验KRC行样本数=${KRC_LINES.length}, 文本一致=${matched}`);
      let hasPlainLine: boolean = false;
      let hasMultiWordLine: boolean = false;
      for (let sample of KRC_LINES) {
        if (sample.words.length === 0) {
          hasPlainLine = true;
        }
        if (sample.words.length > 2) {
          hasMultiWordLine = true;
        }
      }
      expect(KRC_LINES.length).assertEqual(5);
      expect(hasPlainLine).assertTrue();
      expect(hasMultiWordLine).assertTrue();
      expect(matched).assertEqual(KRC_LINES.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcParse_WordTable_0001 end');
    });

    /**
     * @tc.number    SUB_KRC_MATRIX_0200
     * @tc.name      testKrcParseMatrix0002
     * @tc.desc      验证乱序多行KRC按行起始时间升序排列且文案与文件行一一对应
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcParseMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcParse_MultiLineSort_0002 begin');
      let text: string =
        '[3000,1000]<0,1000,0>third\n' +
        '[1000,1000]<0,500,0>first<500,500,0>line\n' +
        '[2000,1000]<0,1000,0>second\n';
      let entries: LrcEntry[] = parseKrcLyric(text);
      let starts: number[] = [];
      let ascending: boolean = true;
      for (let i = 0; i < entries.length; i++) {
        starts.push(entries[i].lineStartTime);
        if (i > 0 && entries[i].lineStartTime <= entries[i - 1].lineStartTime) {
          ascending = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `行数=${entries.length}, 起始序列=${starts}, 升序=${ascending}`);
      expect(entries.length).assertEqual(3);
      expect(ascending).assertTrue();
      expect(entries[0].lineWords).assertEqual('firstline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[1].lineWords).assertEqual('second');
      expect(entries[2].lineWords).assertEqual('third');
      let totalDuration: number = 0;
      for (let entry of entries) {
        totalDuration += entry.lineDuration;
      }
      expect(totalDuration).assertEqual(3000);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcParse_MultiLineSort_0002 end');
    });

    /**
     * @tc.number    SUB_KRC_MATRIX_0300
     * @tc.name      testKrcParseMatrix0003
     * @tc.desc      验证不符合KRC结构的行被忽略且相邻有效行互不干扰
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcParseMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcParse_IgnoreInvalid_0003 begin');
      let text: string =
        'header line without tag\n' +
        '[200000,1500]<0,750,0>valid<750,750,0>line\n' +
        '[offset:0]\n' +
        '[abc,def]<0,0,0>broken\n' +
        '[300000,900]<0,900,0>tail\n';
      let entries: LrcEntry[] = parseKrcLyric(text);
      let textJoined: string = '';
      for (let entry of entries) {
        textJoined += entry.lineWords + '|';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `保留行数=${entries.length}, 文案=${textJoined}`);
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(200000);
      expect(entries[0].lineWords).assertEqual('validline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[1].lineStartTime).assertEqual(300000);
      expect(entries[1].lineWords).assertEqual('tail');
      expect(textJoined).assertEqual('validline|tail|');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcParse_IgnoreInvalid_0003 end');
    });

    /**
     * @tc.number    SUB_KRC_MATRIX_0400
     * @tc.name      testKrcParseMatrix0004
     * @tc.desc      验证行列持续时间与逐字持续时间之和的对应关系及各字段取值范围
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcParseMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcParse_DurationSum_0004 begin');
      let line: string = '[4000,1200]<0,300,0>one <300,400,0>two <700,500,0>three';
      let entries: LrcEntry[] = parseKrcLyric(line + '\n');
      let wordDurationSum: number = 0;
      let lastEnd: number = 0;
      let monotonic: boolean = true;
      for (let word of entries[0].words) {
        wordDurationSum += word.duration;
        if (word.duration <= 0 || word.wordStartTime + word.duration <= lastEnd) {
          monotonic = false;
        }
        lastEnd = word.wordStartTime + word.duration;
      }
      expect(monotonic).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s',
        `行列时长=${entries[0].lineDuration}, 逐字时长和=${wordDurationSum}, 末字结束=${lastEnd}`);
      expect(entries[0].words.length).assertEqual(3);
      expect(wordDurationSum).assertEqual(entries[0].lineDuration);
      expect(entries[0].lineDuration).assertEqual(1200);
      expect(lastEnd).assertEqual(1200);
      expect(entries[0].lineWords).assertEqual('one two three');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcParse_DurationSum_0004 end');
    });
  });
}
