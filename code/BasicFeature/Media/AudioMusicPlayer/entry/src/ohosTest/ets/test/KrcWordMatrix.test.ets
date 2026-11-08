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

interface WordCase {
  name: string;
  text: string;
  expectedWords: number;
  expectedLine: string;
}

const WORD_CASES: WordCase[] = [
  { name: '单字', text: 'a', expectedWords: 1, expectedLine: 'a' },
  { name: '三字', text: 'abc', expectedWords: 3, expectedLine: 'abc' },
  { name: '中文字符', text: '你好世界', expectedWords: 4, expectedLine: '你好世界' },
  { name: '空文本字', text: '', expectedWords: 4, expectedLine: 'abc' },
  { name: '重复字', text: 'aaa', expectedWords: 3, expectedLine: 'aaa' }
];

/**
 * 独立构造一行 KRC：每个字符（或指定文本）作为一个 <start, duration, 0> 词标签。
 */
function buildWordLine(lineStart: number, lineDuration: number, words: string[], eachDuration: number): string {
  let body: string = '';
  for (let i = 0; i < words.length; i++) {
    body += `<${i * eachDuration},${eachDuration},0>${words[i]}`;
  }
  return `[${lineStart},${lineDuration}]${body}`;
}

function sumDurations(entry: LrcEntry): number {
  let total: number = 0;
  for (let word of entry.words) {
    total += word.duration;
  }
  return total;
}

function expectedLine(words: string[]): string {
  return words.join('');
}

export default function KrcWordMatrixTest() {
  describe('KrcWordMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_KRC_WORD_0100
     * @tc.name      testKrcWordMatrix0001
     * @tc.desc      验证逐字词标签数量与行文本拼接结果，空标签文本也保留词元
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcWordMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_WordCount_0001 begin');
      let matched: number = 0;
      let observed: number[] = [];
      for (let item of WORD_CASES) {
        let text: string = item.text === '' ? '<0,300,0><300,300,0><600,300,0><900,100,0>' : item.text;
        let parsed: LrcEntry[] = parseKrcLyric(buildWordLine(0, 1200, text.split(''), 300));
        if (parsed.length === 1) {
          observed.push(parsed[0].words.length);
          if (parsed[0].words.length === item.expectedWords && parsed[0].lineWords === item.expectedLine) {
            matched++;
          }
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `词元数=${observed.join(',')}, 一致条数=${matched}/${WORD_CASES.length}`);
      expect(WORD_CASES.length).assertEqual(5);
      expect(matched).assertEqual(5);
      expect(observed[0]).assertEqual(1);
      expect(observed[3]).assertEqual(4);
      expect(observed[2]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_WordCount_0001 end');
    });

    /**
     * @tc.number    SUB_KRC_WORD_0200
     * @tc.name      testKrcWordMatrix0002
     * @tc.desc      验证词起始时间与持续时长逐词等于标签值，且词起始时间单调不减
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcWordMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_WordTiming_0002 begin');
      let line: string = '[5000,1500]<0,200,0>We <200,300,0>will <500,400,0>go <900,600,0>home';
      let parsed: LrcEntry[] = parseKrcLyric(line);
      let words: Word[] = parsed[0].words;
      let starts: number[] = [];
      let monotonic: boolean = true;
      for (let i = 0; i < words.length; i++) {
        starts.push(words[i].wordStartTime);
        if (i > 0 && words[i - 1].wordStartTime > words[i].wordStartTime) {
          monotonic = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `词起始=${starts.join(',')}, 行文本=[${parsed[0].lineWords}]`);
      expect(parsed.length).assertEqual(1);
      expect(words.length).assertEqual(4);
      expect(starts.join(',')).assertEqual('0,200,500,900');
      expect(words[0].duration).assertEqual(200);
      expect(words[3].duration).assertEqual(600);
      expect(monotonic).assertTrue();
      expect(parsed[0].lineWords).assertEqual(expectedLine(['We ', 'will ', 'go ', 'home']));
      expect(parsed[0].lineStartTime).assertEqual(5000);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_WordTiming_0002 end');
    });

    /**
     * @tc.number    SUB_KRC_WORD_0300
     * @tc.name      testKrcWordMatrix0003
     * @tc.desc      验证词时长之和小于等于行时长且行时长取标签中的第二个字段
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcWordMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_WordDurationSum_0003 begin');
      let insideLine: LrcEntry[] = parseKrcLyric(buildWordLine(1000, 2000, ['a', 'b', 'c'], 500));
      let overLine: LrcEntry[] = parseKrcLyric(buildWordLine(1000, 1000, ['a', 'b', 'c'], 500));
      hilog.info(DOMAIN, TAG, '%{public}s',
        `正常行词时长和=${sumDurations(insideLine[0])}/${insideLine[0].lineDuration}, `
          + `超长行词时长和=${sumDurations(overLine[0])}/${overLine[0].lineDuration}`);
      expect(insideLine[0].lineDuration).assertEqual(2000);
      expect(sumDurations(insideLine[0])).assertEqual(1500);
      expect(sumDurations(insideLine[0]) <= insideLine[0].lineDuration).assertTrue();
      expect(overLine[0].lineDuration).assertEqual(1000);
      expect(sumDurations(overLine[0])).assertEqual(1500);
      expect(sumDurations(overLine[0]) > overLine[0].lineDuration).assertTrue();
      expect(insideLine[0].words[2].wordStartTime).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_WordDurationSum_0003 end');
    });

    /**
     * @tc.number    SUB_KRC_WORD_0400
     * @tc.name      testKrcWordMatrix0004
     * @tc.desc      验证无词标签的行文本被清空且词数组为空，标签外的普通文本不参与
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcWordMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_NoWordTags_0004 begin');
      let noWords: LrcEntry[] = parseKrcLyric('[1000,2000]plain text without tags');
      let mixed: LrcEntry[] = parseKrcLyric('[3000,1000]prefix<0,500,0>tagged suffix');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `无词标签行文本长度=${noWords[0].lineWords.length}, 混合行文本=[${mixed[0].lineWords}]`);
      expect(noWords.length).assertEqual(1);
      expect(noWords[0].lineWords).assertEqual('');
      expect(noWords[0].words.length).assertEqual(0);
      expect(noWords[0].lineStartTime).assertEqual(1000);
      expect(mixed[0].words.length).assertEqual(1);
      expect(mixed[0].lineWords).assertEqual('tagged');
      expect(mixed[0].lineWords.includes('prefix')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_NoWordTags_0004 end');
    });

    /**
     * @tc.number    SUB_KRC_WORD_0500
     * @tc.name      testKrcWordMatrix0005
     * @tc.desc      验证词标签之间的空格与标点保留在词元文本中，行文本与词元拼接一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcWordMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_Punctuation_0005 begin');
      let line: string = '[0,1000]<0,250,0>Dream <250,250,0>it <500,250,0>possible, <750,250,0>ok!';
      let parsed: LrcEntry[] = parseKrcLyric(line);
      let rebuilt: string = '';
      for (let word of parsed[0].words) {
        rebuilt += word.text;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `行文本=[${parsed[0].lineWords}], 词元重组=[${rebuilt}]`);
      expect(parsed[0].words.length).assertEqual(4);
      expect(parsed[0].lineWords).assertEqual('Dream it possible, ok!');
      expect(rebuilt).assertEqual(parsed[0].lineWords);
      expect(parsed[0].words[2].text.endsWith(', ')).assertTrue();
      expect(parsed[0].words[3].text.endsWith('!')).assertTrue();
      expect(parsed[0].lineWords.split(' ').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_Punctuation_0005 end');
    });

    /**
     * @tc.number    SUB_KRC_WORD_0600
     * @tc.name      testKrcWordMatrix0006
     * @tc.desc      验证格式不合法的行（缺少方括号、缺字段、非数字时间）被忽略，合法行仍解析
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcWordMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_InvalidLines_0006 begin');
      let text: string = [
        '[1000,2000]<0,500,0>ok',
        'no bracket line',
        '[1000]<0,500,0>missing duration',
        '[abc,2000]<0,500,0>bad start',
        '[4000,1000]<0,500,0>also ok'
      ].join('\n');
      let parsed: LrcEntry[] = parseKrcLyric(text);
      let starts: number[] = [];
      for (let entry of parsed) {
        starts.push(entry.lineStartTime);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `合法行数=${parsed.length}, 起始=${starts.join(',')}`);
      expect(parsed.length).assertEqual(2);
      expect(text.split('\n').length).assertEqual(5);
      expect(starts[0]).assertEqual(1000);
      expect(starts[1]).assertEqual(4000);
      expect(parsed[0].lineWords).assertEqual('ok');
      expect(parsed[1].lineWords).assertEqual('also ok');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_InvalidLines_0006 end');
    });

    /**
     * @tc.number    SUB_KRC_WORD_0700
     * @tc.name      testKrcWordMatrix0007
     * @tc.desc      验证 KRC 多行按行起始时间升序输出，词元与行归属不串行
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcWordMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_MultiLineOrder_0007 begin');
      let text: string = [
        '[9000,500]<0,250,0>third',
        '[1000,500]<0,250,0>first',
        '[5000,500]<0,250,0>second'
      ].join('\n');
      let parsed: LrcEntry[] = parseKrcLyric(text);
      let texts: string[] = [];
      let durations: number[] = [];
      for (let entry of parsed) {
        texts.push(entry.lineWords);
        durations.push(entry.lineDuration);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `行文本顺序=[${texts.join(',')}], 时长=[${durations.join(',')}]`);
      expect(parsed.length).assertEqual(3);
      expect(texts.join(',')).assertEqual('first,second,third');
      expect(parsed[0].lineStartTime).assertEqual(1000);
      expect(parsed[2].lineStartTime).assertEqual(9000);
      expect(durations.join(',')).assertEqual('500,500,500');
      expect(parsed[1].words[0].text).assertEqual('second');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_MultiLineOrder_0007 end');
    });

    /**
     * @tc.number    SUB_KRC_WORD_0800
     * @tc.name      testKrcWordMatrix0008
     * @tc.desc      验证 KRC 最后一行不会被改成无限时长，与 LRC 的末行规则不同
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcWordMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_LastLineDuration_0008 begin');
      let parsed: LrcEntry[] = parseKrcLyric('[0,700]<0,700,0>x\n[1000,300]<0,300,0>y');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `末行时长=${parsed[parsed.length - 1].lineDuration}, 是否等于最大值=${parsed[parsed.length - 1].lineDuration === Number.MAX_VALUE}`);
      expect(parsed.length).assertEqual(2);
      expect(parsed[1].lineDuration).assertEqual(300);
      expect(parsed[1].lineDuration === Number.MAX_VALUE).assertFalse();
      expect(parsed[0].lineDuration).assertEqual(700);
      expect(parsed[0].lineDuration !== parsed[1].lineDuration).assertTrue();
      expect(parsed[0].lineDuration + parsed[1].lineDuration).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_LastLineDuration_0008 end');
    });

    /**
     * @tc.number    SUB_KRC_WORD_0900
     * @tc.name      testKrcWordMatrix0009
     * @tc.desc      验证大时长与大起始值（小时级）按整数解析，不出现精度丢失
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcWordMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_LargeValues_0009 begin');
      let start: number = 3599999;
      let parsed: LrcEntry[] = parseKrcLyric(`[${start},${start}]<0,${start},0>long`);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `解析起始=${parsed[0].lineStartTime}, 时长=${parsed[0].lineDuration}, 词起始=${parsed[0].words[0].wordStartTime}`);
      expect(parsed.length).assertEqual(1);
      expect(parsed[0].lineStartTime).assertEqual(3599999);
      expect(parsed[0].lineDuration).assertEqual(3599999);
      expect(parsed[0].words[0].duration).assertEqual(3599999);
      expect(parsed[0].lineStartTime % 1000).assertEqual(999);
      expect(parsed[0].lineStartTime / 3600000 > 0.99).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_LargeValues_0009 end');
    });

    /**
     * @tc.number    SUB_KRC_WORD_1000
     * @tc.name      testKrcWordMatrix0010
     * @tc.desc      验证同一输入重复解析的词元数量与文本一致，解析结果不共享可变状态
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcWordMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_RepeatParse_0010 begin');
      let text: string = '[100,800]<0,400,0>twice <400,400,0>parse';
      let first: LrcEntry[] = parseKrcLyric(text);
      let second: LrcEntry[] = parseKrcLyric(text);
      let sameCount: boolean = first[0].words.length === second[0].words.length;
      let sameText: boolean = true;
      for (let i = 0; i < first[0].words.length && sameCount; i++) {
        if (first[0].words[i].text !== second[0].words[i].text) {
          sameText = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `首次词数=${first[0].words.length}, 再次词数=${second[0].words.length}, 文本一致=${sameText}`);
      expect(sameCount).assertTrue();
      expect(sameText).assertTrue();
      expect(first[0].words.length).assertEqual(2);
      expect(first[0] === second[0]).assertFalse();
      expect(first[0].lineWords).assertEqual(second[0].lineWords);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Krc_RepeatParse_0010 end');
    });
  });
}
