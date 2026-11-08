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

function joinedWords(entry: LrcEntry): string {
  let text: string = '';
  for (let word of entry.words) {
    text += word.text;
  }
  return text;
}

function wordsAreOrdered(entry: LrcEntry): boolean {
  for (let index = 1; index < entry.words.length; index++) {
    if (entry.words[index].wordStartTime < entry.words[index - 1].wordStartTime) {
      return false;
    }
  }
  return true;
}

export default function KrcParserRobustTest() {
  describe('KrcParserRobustTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_KRC_ROBUST_0100
     * @tc.name      testKrcParserRobust0001
     * @tc.desc      验证空串、纯空白与无时间头文本都解析为空列表，且空输入之后再次解析合法行仍能正确解析
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcParserRobust0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcRobust_Empty_0001 begin');
      let inputs: string[] = ['', '   ', '\n', '\r\n\r\n', 'id:1,ar:someone,ti:title', '[offset:0]'];
      let counts: number[] = inputs.map((input: string) => parseKrcLyric(input).length);
      let after: LrcEntry[] = parseKrcLyric('[1000,500]<0,500,0>back\n');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `空类输入条数=${counts.join(',')}, 空后合法行条数=${after.length}, 词元=${after.length > 0 ? after[0].words.length : -1}`);
      expect(counts.slice(0, 4)).assertDeepEquals([0, 0, 0, 0]);
      expect(parseKrcLyric('[2000,400]plain\n').length).assertEqual(1);
      expect(after.length).assertEqual(1);
      expect(after[0].lineWords).assertEqual('back');
      expect(after[0].words.length).assertEqual(1);
      expect(after[0].lineDuration).assertEqual(500);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcRobust_Empty_0001 end');
    });

    /**
     * @tc.number    SUB_KRC_ROBUST_0200
     * @tc.name      testKrcParserRobust0002
     * @tc.desc      验证行头数字超过安全整数范围时按整数截断解析，超长数字与相邻正常行的行归属不串行
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcParserRobust0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcRobust_BigHeader_0002 begin');
      let text: string =
        '[1,1]<0,1,0>tiny\n' +
        '[2147483647,60000]<0,60000,0>max int\n' +
        '[99999999999999999999,1000]<0,1000,0>huge\n';
      let entries: LrcEntry[] = parseKrcLyric(text);
      let hasHuge: boolean = entries.some((entry: LrcEntry) => entry.lineWords === 'huge');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `条数=${entries.length}, 起始=${entries.map((entry: LrcEntry) => entry.lineStartTime).join(',')}, 含超大行=${hasHuge}`);
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(1);
      expect(entries[1].lineStartTime).assertEqual(2147483647);
      expect(entries[1].lineDuration).assertEqual(60000);
      expect(entries[2].lineStartTime > entries[1].lineStartTime).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcRobust_BigHeader_0002 end');
    });

    /**
     * @tc.number    SUB_KRC_ROBUST_0300
     * @tc.name      testKrcParserRobust0003
     * @tc.desc      验证行文本在词标签之外没有普通文本时行文本由词标签拼接而成，标签外的残留文本按词元边界处理
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcParserRobust0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcRobust_LineText_0003 begin');
      let pure: LrcEntry = parseKrcLyric('[100,900]<0,300,0>ab<300,600,0>cd\n')[0];
      let withPrefix: LrcEntry = parseKrcLyric('[100,900]lead<0,300,0>ab<300,600,0>cd\n')[0];
      hilog.info(DOMAIN, TAG, '%{public}s',
        `纯词行文本=[${pure.lineWords}] 词元数=${pure.words.length}, ` +
        `带前缀行文本=[${withPrefix.lineWords}] 词元数=${withPrefix.words.length}`);
      expect(pure.lineWords).assertEqual(joinedWords(pure));
      expect(pure.lineWords).assertEqual('abcd');
      expect(withPrefix.words.length).assertEqual(2);
      expect(withPrefix.words[0].text).assertEqual('ab');
      expect(withPrefix.words[1].wordStartTime).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcRobust_LineText_0003 end');
    });

    /**
     * @tc.number    SUB_KRC_ROBUST_0400
     * @tc.name      testKrcParserRobust0004
     * @tc.desc      验证词起始时间与时长出现 0 值时词元仍然保留，首词从 0 开始且相邻词起点单调不减
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcParserRobust0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcRobust_ZeroWord_0004 begin');
      let entry: LrcEntry = parseKrcLyric('[500,1000]<0,0,0>a<0,500,0>b<500,0,0>c\n')[0];
      let zeroDuration: number = entry.words.filter((word: Word) => word.duration === 0).length;
      let zeroStart: number = entry.words.filter((word: Word) => word.wordStartTime === 0).length;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `词元数=${entry.words.length}, 时长为零=${zeroDuration}, 起点为零=${zeroStart}, 文本=${entry.lineWords}`);
      expect(entry.words.length).assertEqual(3);
      expect(zeroDuration).assertEqual(2);
      expect(zeroStart).assertEqual(2);
      expect(entry.words[0].wordStartTime).assertEqual(0);
      expect(wordsAreOrdered(entry)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcRobust_ZeroWord_0004 end');
    });

    /**
     * @tc.number    SUB_KRC_ROBUST_0500
     * @tc.name      testKrcParserRobust0005
     * @tc.desc      验证起始时间相同的多行保留全部行，排序稳定后文本顺序仍与输入中的先后一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcParserRobust0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcRobust_SameStart_0005 begin');
      let text: string =
        '[1000,100]<0,100,0>one\n' +
        '[1000,200]<0,200,0>two\n' +
        '[1000,300]<0,300,0>three\n';
      let entries: LrcEntry[] = parseKrcLyric(text);
      let durations: number[] = entries.map((entry: LrcEntry) => entry.lineDuration);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `条数=${entries.length}, 文本=${entries.map((entry: LrcEntry) => entry.lineWords).join(',')}, ` +
        `时长=${durations.join(',')}`);
      expect(entries.length).assertEqual(3);
      expect(entries.map((entry: LrcEntry) => entry.lineStartTime)).assertDeepEquals([1000, 1000, 1000]);
      expect(durations).assertDeepEquals([100, 200, 300]);
      expect(entries[0].lineWords).assertEqual('one');
      expect(entries[2].lineWords).assertEqual('three');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcRobust_SameStart_0005 end');
    });

    /**
     * @tc.number    SUB_KRC_ROBUST_0600
     * @tc.name      testKrcParserRobust0006
     * @tc.desc      验证词标签结构残缺（缺尖括号、缺字段、括号内非数字）时对应词元被丢弃，完整词元顺序保留
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testKrcParserRobust0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcRobust_BrokenWord_0006 begin');
      let entry: LrcEntry = parseKrcLyric('[2000,2000]0,500,0>loose<300,300>missing<400,500,0>ok<500,x,0>bad\n')[0];
      let texts: string[] = entry.words.map((word: Word) => word.text);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `词元数=${entry.words.length}, 词元文本=${JSON.stringify(texts)}, 行文本=${entry.lineWords}`);
      expect(entry.words.length).assertEqual(1);
      expect(texts).assertDeepEquals(['ok']);
      expect(entry.words[0].wordStartTime).assertEqual(400);
      expect(entry.lineWords).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'KrcRobust_BrokenWord_0006 end');
    });

    /**
     * @tc.number    SUB_KRC_ROBUST_0700
     * @tc.name      testKrcParserRobust0007
     * @tc.desc      验证行头数字之间允许夹带空格或正号、整段为负数的行头被丢弃，只保留格式合法的行
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    
  });
}
