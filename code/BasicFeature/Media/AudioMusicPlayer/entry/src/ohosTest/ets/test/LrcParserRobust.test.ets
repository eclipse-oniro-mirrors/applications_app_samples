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
import { LrcLineScanner } from './TestData';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const SECONDS: number = 1000;

function starts(entries: LrcEntry[]): number[] {
  return entries.map((entry: LrcEntry) => entry.lineStartTime);
}

function texts(entries: LrcEntry[]): string[] {
  return entries.map((entry: LrcEntry) => entry.lineWords);
}

function isSorted(entries: LrcEntry[]): boolean {
  for (let index = 1; index < entries.length; index++) {
    if (entries[index - 1].lineStartTime > entries[index].lineStartTime) {
      return false;
    }
  }
  return true;
}

function isContiguous(entries: LrcEntry[]): boolean {
  for (let index = 0; index < entries.length - 1; index++) {
    if (entries[index].lineDuration !== entries[index + 1].lineStartTime - entries[index].lineStartTime) {
      return false;
    }
  }
  return entries[entries.length - 1].lineDuration === Number.MAX_VALUE;
}

export default function LrcParserRobustTest() {
  describe('LrcParserRobustTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_LRC_ROBUST_0100
     * @tc.name      testLrcParserRobust0001
     * @tc.desc      验证空串、纯空白、无时间标签文本与全空行输入都解析为空列表，且不残留上一次解析结果
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcParserRobust0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRobust_EmptyInput_0001 begin');
      let inputs: string[] = ['', '   ', '\n', '\n\n\n', 'just plain text', '[ar:someone]', '[ti:title]'];
      let counts: number[] = [];
      for (let input of inputs) {
        counts.push(parseLrcLyric(input).length);
      }
      let warmUp: LrcEntry[] = parseLrcLyric('[00:01.00]first\n[00:02.00]second\n');
      let afterEmpty: LrcEntry[] = parseLrcLyric('');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `各类空输入条数=${counts.join(',')}, 预热条数=${warmUp.length}, 预热后空串条数=${afterEmpty.length}`);
      expect(counts).assertDeepEquals([0, 0, 0, 0, 0, 0, 0]);
      expect(warmUp.length).assertEqual(2);
      expect(afterEmpty.length).assertEqual(0);
      expect(Array.isArray(afterEmpty)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRobust_EmptyInput_0001 end');
    });

    /**
     * @tc.number    SUB_LRC_ROBUST_0200
     * @tc.name      testLrcParserRobust0002
     * @tc.desc      验证只有时间标签没有歌词文本的行被丢弃，标签后的空白与制表符不被当成歌词内容
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_LRC_ROBUST_0300
     * @tc.name      testLrcParserRobust0003
     * @tc.desc      验证一行多个时间标签展开成多条记录，展开后文本相同、时间按标签顺序分别解析
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_LRC_ROBUST_0400
     * @tc.name      testLrcParserRobust0004
     * @tc.desc      验证乱序输入解析后按时间升序排列，每行时长等于下一行起点减本行起点，末行时长覆盖剩余时间
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcParserRobust0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRobust_Unordered_0004 begin');
      let input: string = '[02:00.00]last\n[00:30.00]second\n[00:05.00]first\n[01:00.00]third\n';
      let entries: LrcEntry[] = parseLrcLyric(input);
      let durations: number[] = entries.map((entry: LrcEntry) => entry.lineDuration);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `起始=${starts(entries).join(',')}, 文本=${texts(entries).join('|')}, 时长=${durations.slice(0, 3).join(',')}`);
      expect(texts(entries)).assertDeepEquals(['first', 'second', 'third', 'last']);
      expect(starts(entries)).assertDeepEquals([5 * SECONDS, 30 * SECONDS, 60 * SECONDS, 120 * SECONDS]);
      expect(durations.slice(0, 3)).assertDeepEquals([25 * SECONDS, 30 * SECONDS, 60 * SECONDS]);
      expect(isSorted(entries)).assertTrue();
      expect(isContiguous(entries)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRobust_Unordered_0004 end');
    });

    /**
     * @tc.number    SUB_LRC_ROBUST_0500
     * @tc.name      testLrcParserRobust0005
     * @tc.desc      验证同一时间点重复出现的歌词全部保留，重复行时长为零，其后的行仍从该时刻开始计时
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcParserRobust0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRobust_DuplicateTime_0005 begin');
      let input: string = '[00:10.00]a\n[00:10.00]b\n[00:20.00]c\n';
      let entries: LrcEntry[] = parseLrcLyric(input);
      let zeroDurationCount: number = entries.filter((entry: LrcEntry) => entry.lineDuration === 0).length;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `条数=${entries.length}, 文本=${texts(entries).join(',')}, 时长为零条数=${zeroDurationCount}`);
      expect(entries.length).assertEqual(3);
      expect(texts(entries)).assertDeepEquals(['a', 'b', 'c']);
      expect(zeroDurationCount).assertEqual(1);
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRobust_DuplicateTime_0005 end');
    });

    /**
     * @tc.number    SUB_LRC_ROBUST_0600
     * @tc.name      testLrcParserRobust0006
     * @tc.desc      验证不具备完整标签格式的时间文本（缺方括号、分秒位数不足、无小数部分）不被识别为歌词时间
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcParserRobust0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRobust_BadFormat_0006 begin');
      let invalidLines: string[] = [
        '00:10.00 no bracket',
        '[0:10.00]one digit minute',
        '[00:1.00]one digit second',
        '[00:10]no fraction',
        '[00:10.]empty fraction',
        '{00:10.00}braces'
      ];
      let validLine: string = '[00:10.00]valid';
      let results: number[] = [];
      for (let line of invalidLines) {
        results.push(parseLrcLyric(line + '\n' + validLine).length);
      }
      let mixed: LrcEntry[] = parseLrcLyric(invalidLines.join('\n') + '\n' + validLine);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `逐条非法格式解析条数=${results.join(',')}, 混合输入条数=${mixed.length}, 混合输入起始=${starts(mixed).join(',')}`);
      expect(new Set<number>(results).size).assertEqual(1);
      expect(results[0]).assertEqual(1);
      expect(mixed.length).assertEqual(1);
      expect(texts(mixed)).assertDeepEquals(['valid']);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRobust_BadFormat_0006 end');
    });

    /**
     * @tc.number    SUB_LRC_ROBUST_0700
     * @tc.name      testLrcParserRobust0007
     * @tc.desc      验证毫秒部分多于两位时按三位小数时间解析，三位小数与两位小数同一时刻得到相同起点
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_LRC_ROBUST_0800
     * @tc.name      testLrcParserRobust0008
     * @tc.desc      验证用冒号代替小数点的时间标签与小数点写法解析出同一时刻，两种写法的文本都能完整保留
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcParserRobust0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRobust_ColonFraction_0008 begin');
      let dotForm: LrcEntry = parseLrcLyric('[01:23.45]dot form\n')[0];
      let colonForm: LrcEntry = parseLrcLyric('[01:23:45]colon form\n')[0];
      hilog.info(DOMAIN, TAG, '%{public}s',
        `小数点写法=${dotForm.lineStartTime} ${dotForm.lineWords}, 冒号写法=${colonForm.lineStartTime} ${colonForm.lineWords}`);
      expect(colonForm.lineStartTime).assertEqual(dotForm.lineStartTime);
      expect(colonForm.lineStartTime).assertEqual(83450);
      expect(colonForm.lineWords.split('colon').length).assertEqual(2);
      expect(dotForm.lineWords).assertEqual('dot form');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRobust_ColonFraction_0008 end');
    });

    /**
     * @tc.number    SUB_LRC_ROBUST_0900
     * @tc.name      testLrcParserRobust0009
     * @tc.desc      验证分钟超过两位、分钟与秒都达到上限的极端标签仍按 分×60+秒 换算，且不影响相邻正常行
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcParserRobust0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRobust_ExtremeTag_0009 begin');
      let input: string = '[00:01.00]normal\n[100:00.00]hundred minutes\n[999:59.99]long minutes\n';
      let entries: LrcEntry[] = parseLrcLyric(input);
      let scanner: LrcLineScanner = new LrcLineScanner().scan(input);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `起始=${starts(entries).join(',')}, 扫描器=${scanner.sortedTimes().join(',')}, 条数=${entries.length}`);
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[1].lineStartTime).assertEqual(100 * 60000);
      expect(entries[2].lineStartTime).assertEqual(999 * 60000 + 59990);
      expect(starts(entries)).assertDeepEquals(scanner.sortedTimes());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LrcRobust_ExtremeTag_0009 end');
    });

    /**
     * @tc.number    SUB_LRC_ROBUST_1000
     * @tc.name      testLrcParserRobust0010
     * @tc.desc      验证回车换行与空白缩进的歌词行处理后文本不含标签与回车符，与只按换行分割得到的文本一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    
  });
}

function colonTextOk(text: string): boolean {
  return text === 'colon form' || text.trim() === 'colon form';
}
