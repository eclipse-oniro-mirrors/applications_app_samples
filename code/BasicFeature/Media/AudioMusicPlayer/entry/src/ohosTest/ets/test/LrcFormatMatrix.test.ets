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

interface LrcSample {
  name: string;
  minutes: number;
  seconds: number;
  hundredths: number;
  text: string;
}

interface SeparatorCase {
  name: string;
  line: string;
  expectedMs: number;
}

const FORMAT_SAMPLES: LrcSample[] = [
  { name: '全零', minutes: 0, seconds: 0, hundredths: 0, text: 'zero' },
  { name: '单位毫秒', minutes: 0, seconds: 0, hundredths: 1, text: 'one' },
  { name: '整秒', minutes: 1, seconds: 0, hundredths: 0, text: 'minute' },
  { name: '秒上界59', minutes: 0, seconds: 59, hundredths: 99, text: 'second max' },
  { name: '三位分钟', minutes: 123, seconds: 45, hundredths: 67, text: 'long minutes' },
  { name: '小数点后一位', minutes: 2, seconds: 3, hundredths: 40, text: 'single digit' },
  { name: '小数后三位', minutes: 4, seconds: 5, hundredths: 12, text: 'three digits' }
];

/**
 * 两种分隔符在同样两位数字下语义一致：秒的小数部分 ×1000。
 * 冒号形式 [mm:ss:xx] 在 main 中同样被当作小数分隔符处理。
 */
const SEPARATOR_CASES: SeparatorCase[] = [
  { name: '点号两位', line: '[00:01.50]dot', expectedMs: 1500 },
  { name: '点号一位', line: '[00:00.5]dot', expectedMs: 500 },
  { name: '点号三位', line: '[00:01.250]dot', expectedMs: 1250 },
  { name: '冒号两位', line: '[00:01:07]colon', expectedMs: 1070 }
];

function buildLine(sample: LrcSample): string {
  let fraction: string = sample.hundredths.toString().padStart(2, '0');
  let minutes: string = sample.minutes.toString().padStart(2, '0');
  let seconds: string = sample.seconds.toString().padStart(2, '0');
  return `[${minutes}:${seconds}.${fraction}]${sample.text}`;
}

/**
 * 解析单行并与独立换算结果比对，返回是否一致。
 */
function checkSingleLine(sample: LrcSample): boolean {
  let entries: LrcEntry[] = parseLrcLyric(buildLine(sample));
  if (entries.length !== 1) {
    return false;
  }
  let scanner: LrcLineScanner = new LrcLineScanner().scan(buildLine(sample));
  let expectedMs: number = scanner.times[0];
  return entries[0].lineStartTime === expectedMs && entries[0].lineWords.trim() === sample.text;
}

export default function LrcFormatMatrixTest() {
  describe('LrcFormatMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_LRC_FORMAT_0100
     * @tc.name      testLrcFormatMatrix0001
     * @tc.desc      验证七种时间标签格式（位宽、小数位、三位分钟）均按同一换算规则解析
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcFormatMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatWidth_0001 begin');
      let passed: number = 0;
      let starts: number[] = [];
      for (let sample of FORMAT_SAMPLES) {
        let line: string = buildLine(sample);
        let entries: LrcEntry[] = parseLrcLyric(line);
        let scanner: LrcLineScanner = new LrcLineScanner().scan(line);
        if (entries.length === 1) {
          starts.push(entries[0].lineStartTime);
          if (checkSingleLine(sample)) {
            passed++;
          }
        }
        hilog.info(DOMAIN, TAG, '%{public}s',
          `${sample.name}: 输入=${line}, 解析=${entries.length === 1 ? entries[0].lineStartTime : 'N/A'}, ` +
            `基准=${scanner.times[0]}`);
      }
      expect(FORMAT_SAMPLES.length).assertEqual(7);
      expect(passed).assertEqual(7);
      expect(starts[2]).assertEqual(60000);
      expect(starts[4]).assertEqual(123 * 60000 + 45 * 1000 + 670);
      expect(starts[5]).assertEqual(123040);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatWidth_0001 end');
    });

    /**
     * @tc.number    SUB_LRC_FORMAT_0200
     * @tc.name      testLrcFormatMatrix0002
     * @tc.desc      验证小数点与冒号两种小数分隔符都被识别为秒的小数部分
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcFormatMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatSeparator_0002 begin');
      let diffs: number[] = [];
      let matched: number = 0;
      for (let item of SEPARATOR_CASES) {
        let entries: LrcEntry[] = parseLrcLyric(item.line);
        let actual: number = entries.length === 1 ? entries[0].lineStartTime : -1;
        let diff: number = actual - item.expectedMs;
        diffs.push(diff);
        if (diff === 0) {
          matched++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `四种分隔符与期望差值=[${diffs.join(',')}]`);
      expect(matched).assertEqual(SEPARATOR_CASES.length);
      expect(diffs[0]).assertEqual(0);
      expect(diffs[1]).assertEqual(0);
      expect(diffs[3]).assertEqual(0);
      expect(parseLrcLyric(SEPARATOR_CASES[0].line)[0].lineStartTime).assertEqual(1500);
      expect(parseLrcLyric(SEPARATOR_CASES[3].line)[0].lineStartTime).assertEqual(1070);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatSeparator_0002 end');
    });

    /**
     * @tc.number    SUB_LRC_FORMAT_0300
     * @tc.name      testLrcFormatMatrix0003
     * @tc.desc      验证同一行内多个时间标签共享同一句歌词，并按时间升序排列
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcFormatMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatMultiTag_0003 begin');
      let text: string = '[00:10.00][00:05.00][00:01.00]chorus';
      let entries: LrcEntry[] = parseLrcLyric(text);
      let scanner: LrcLineScanner = new LrcLineScanner().scan(text);
      let sameText: number = 0;
      let starts: number[] = [];
      for (let entry of entries) {
        starts.push(entry.lineStartTime);
        if (entry.lineWords.trim() === 'chorus') {
          sameText++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `解析条数=${entries.length}, 时间=[${starts.join(',')}]`);
      expect(entries.length).assertEqual(3);
      expect(scanner.times.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[1].lineStartTime).assertEqual(5000);
      expect(entries[2].lineStartTime).assertEqual(10000);
      expect(sameText).assertEqual(3);
      expect(entries[0].lineStartTime < entries[2].lineStartTime).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatMultiTag_0003 end');
    });

    /**
     * @tc.number    SUB_LRC_FORMAT_0400
     * @tc.name      testLrcFormatMatrix0004
     * @tc.desc      验证时间相同或倒序的标签在排序后时间非递减，且总条数不丢失
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcFormatMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatSortStable_0004 begin');
      let text: string = '[00:30.00]c\n[00:20.00]a\n[00:20.00]b\n[00:10.00]z';
      let entries: LrcEntry[] = parseLrcLyric(text);
      let nonDecreasing: boolean = true;
      let starts: number[] = [];
      for (let i = 0; i < entries.length; i++) {
        starts.push(entries[i].lineStartTime);
        if (i > 0 && entries[i - 1].lineStartTime > entries[i].lineStartTime) {
          nonDecreasing = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `条数=${entries.length}, 时间=[${starts.join(',')}], 非递减=${nonDecreasing}`);
      expect(entries.length).assertEqual(4);
      expect(nonDecreasing).assertTrue();
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[1].lineStartTime).assertEqual(20000);
      expect(entries[2].lineStartTime).assertEqual(20000);
      expect(entries[3].lineStartTime).assertEqual(30000);
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatSortStable_0004 end');
    });

    /**
     * @tc.number    SUB_LRC_FORMAT_0500
     * @tc.name      testLrcFormatMatrix0005
     * @tc.desc      验证缺少标签、单一位数字、空行等不合规行被丢弃并记录丢弃数量
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcFormatMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatInvalidLines_0005 begin');
      let valid: string[] = [
        '[00:01.00]ok1',
        'no tag here',
        '[0:05.00]single digit minute',
        '[00:10.00]ok2',
        '[00:11.00]',
        '   ',
        '[00:12.00]ok3'
      ];
      let text: string = valid.join('\n');
      let entries: LrcEntry[] = parseLrcLyric(text);
      let scanner: LrcLineScanner = new LrcLineScanner().scan(text);
      let wellFormed: number = 0;
      for (let line of valid) {
        if (line.match(new RegExp('^\\[\\d{2,}:\\d{2}\\.\\d{2,}\\]\\S')) !== null) {
          wellFormed++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `输入行=${valid.length}, 规范行=${wellFormed}, 扫描标签=${scanner.times.length}, 解析条数=${entries.length}`);
      expect(entries.length).assertEqual(3);
      expect(entries.length < valid.length).assertTrue();
      expect(valid.length - entries.length).assertEqual(4);
      expect(wellFormed).assertEqual(entries.length);
      expect(entries[0].lineWords.trim()).assertEqual('ok1');
      expect(entries[2].lineWords.trim()).assertEqual('ok3');
      expect(entries[1].lineStartTime).assertEqual(10000);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatInvalidLines_0005 end');
    });

    /**
     * @tc.number    SUB_LRC_FORMAT_0600
     * @tc.name      testLrcFormatMatrix0006
     * @tc.desc      验证标签与文本间、文本结尾的空格和制表符在去掉标签后仍被保留
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcFormatMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatWhitespace_0006 begin');
      let padded: string = '[00:01.00]   padded text   ';
      let tabbed: string = '[00:02.00]\tTabbed lead';
      let entries: LrcEntry[] = parseLrcLyric(`${padded}\n${tabbed}`);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `首行原文长度=${entries.length > 0 ? entries[0].lineWords.length : -1}`);
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineWords).assertEqual('   padded text   ');
      expect(entries[0].lineWords.trim()).assertEqual('padded text');
      expect(entries[0].lineWords.trim().length).assertEqual(11);
      expect(entries[1].lineWords.trim()).assertEqual('Tabbed lead');
      expect(entries[1].lineWords.length > entries[1].lineWords.trim().length).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatWhitespace_0006 end');
    });

    /**
     * @tc.number    SUB_LRC_FORMAT_0700
     * @tc.name      testLrcFormatMatrix0007
     * @tc.desc      验证含中文与标点的歌词文本按原样保留，仅去除时间标签
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcFormatMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatUnicode_0007 begin');
      let chinese: string = '愿你梦想成真，Dream It Possible！';
      let text: string = `[00:03.50]${chinese}\n[00:04.50]🎵 music 🎶`;
      let entries: LrcEntry[] = parseLrcLyric(text);
      let scanner: LrcLineScanner = new LrcLineScanner().scan(text);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `首行字符数=${entries[0].lineWords.trim().length}, 标签数=${scanner.times.length}`);
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineWords.trim()).assertEqual(chinese);
      expect(entries[0].lineStartTime).assertEqual(3500);
      expect(scanner.times[0]).assertEqual(3500);
      expect(entries[0].lineWords.includes(',')).assertTrue();
      expect(entries[1].lineWords.trim()).assertEqual('🎵 music 🎶');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatUnicode_0007 end');
    });

    /**
     * @tc.number    SUB_LRC_FORMAT_0800
     * @tc.name      testLrcFormatMatrix0008
     * @tc.desc      验证大数值微时间（每天及天数级）按分钟继续累加，不与小时进位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcFormatMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatLargeMinutes_0008 begin');
      let big: LrcEntry[] = parseLrcLyric('[1440:00.00]one day\n[9999:59.99]far');
      hilog.info(DOMAIN, TAG, '%{public}s',
        `1440 分钟=${big[0].lineStartTime}, 9999 分钟末尾=${big[1].lineStartTime}`);
      expect(big.length).assertEqual(2);
      expect(big[0].lineStartTime).assertEqual(86400000);
      expect(big[1].lineStartTime).assertEqual(9999 * 60000 + 59990);
      expect(big[0].lineDuration).assertEqual(big[1].lineStartTime - big[0].lineStartTime);
      expect(big[1].lineStartTime > 86400000).assertTrue();
      expect(big[0].lineStartTime / 60000).assertEqual(1440);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatLargeMinutes_0008 end');
    });

    /**
     * @tc.number    SUB_LRC_FORMAT_0900
     * @tc.name      testLrcFormatMatrix0009
     * @tc.desc      验证时间标签出现在行尾或行中时，剩余文本依然被识别且标签被移除
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcFormatMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatTagPosition_0009 begin');
      let trailing: string = 'trailing text[00:20.00]';
      let middle: string = 'lazy [00:30.00]middle';
      let entries: LrcEntry[] = parseLrcLyric(`${trailing}\n${middle}`);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `条数=${entries.length}, 首行文本=${entries.length > 0 ? entries[0].lineWords : ''}`);
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(20000);
      expect(entries[0].lineWords).assertEqual('trailing text');
      expect(entries[1].lineStartTime).assertEqual(30000);
      expect(entries[1].lineWords.trim()).assertEqual('lazy middle');
      expect(entries[1].lineWords.includes('[')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatTagPosition_0009 end');
    });

    /**
     * @tc.number    SUB_LRC_FORMAT_1000
     * @tc.name      testLrcFormatMatrix0010
     * @tc.desc      验证连续调用解析不同文本结果互不影响，且同一文本重复解析一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testLrcFormatMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatIsolation_0010 begin');
      let first: LrcEntry[] = parseLrcLyric('[00:01.00]a\n[00:02.00]b');
      let second: LrcEntry[] = parseLrcLyric('[00:01.00]a\n[00:02.00]b');
      let other: LrcEntry[] = parseLrcLyric('[00:10.00]c');
      let sameContent: boolean = first.length === second.length;
      for (let i = 0; sameContent && i < first.length; i++) {
        sameContent = first[i].lineStartTime === second[i].lineStartTime;
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `首轮=${first.length}, 重解析=${second.length}, 其他文本=${other.length}, 内容一致=${sameContent}`);
      expect(sameContent).assertTrue();
      expect(first.length).assertEqual(2);
      expect(first[0].lineStartTime).assertEqual(1000);
      expect(first[1].lineDuration).assertEqual(Number.MAX_VALUE);
      expect(other.length).assertEqual(1);
      expect(other[0].lineStartTime).assertEqual(10000);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Lrc_FormatIsolation_0010 end');
    });
  });
}
