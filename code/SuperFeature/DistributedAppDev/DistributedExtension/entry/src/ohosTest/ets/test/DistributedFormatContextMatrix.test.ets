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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { formatDateTime, formatDuration, formatTime, pad2, truncateMiddle } from '../../../main/ets/utils/FormatUtil';
import {
  ContextSnapshot, contextSnapshot, contextUnknownText, safeText
} from '../../../main/ets/model/ExtensionContextInfo';
import {
  DEFAULT_PEER_ADDRESS, DEFAULT_PEER_UUID, EXTENSION_TYPE_DISTRIBUTED
} from '../../../main/ets/common/AppConstants';

const ALPHABET: string = 'abcdefghijklmnopqrstuvwxyz';

/** 输入与期望输出成对出现的表，失败时 mismatched 里直接列出是哪个输入 */
class DurationCase {
  public ms: number;
  public text: string;

  constructor(ms: number, text: string) {
    this.ms = ms;
    this.text = text;
  }
}

function wrongDurations(cases: DurationCase[]): string {
  const wrong: string[] = [];
  for (const c of cases) {
    if (formatDuration(c.ms) !== c.text) {
      wrong.push(`${c.ms}`);
    }
  }
  return wrong.join(',');
}

function occurrences(text: string, part: string): number {
  return text.split(part).length - 1;
}

/**
 * 格式化 × 上下文快照（分）：formatDuration 的四段分支逐个踩边界，truncateMiddle 按长度全扫，
 * pad2 / formatTime / formatDateTime 用固定日期与进位日期断言，
 * ContextSnapshot 按 名称 × type × 模块 × 语言 的 2×2×2×2 网格核对兜底文案。
 */
export default function distributedFormatContextMatrixTest() {
  describe('DistributedFormatContextMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_0100
     * @tc.name testFmtCtx0001
     * @tc.desc Verify negative and sub second durations stay in milliseconds without rounding.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0001', 0, () => {
      const cases: DurationCase[] = [
        new DurationCase(-1000, '0 ms'), new DurationCase(-1, '0 ms'), new DurationCase(0, '0 ms'),
        new DurationCase(1, '1 ms'), new DurationCase(999, '999 ms'), new DurationCase(0.5, '0.5 ms'),
        new DurationCase(999.5, '999.5 ms')
      ];
      expect(cases.length).assertEqual(7);
      expect(wrongDurations(cases)).assertEqual('');
      expect(formatDuration(-0.1)).assertEqual('0 ms');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_0200
     * @tc.name testFmtCtx0002
     * @tc.desc Verify second durations use one decimal place from 1000 up to just below a minute.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0002', 0, () => {
      const cases: DurationCase[] = [
        new DurationCase(1000, '1.0 s'), new DurationCase(1001, '1.0 s'), new DurationCase(1051, '1.1 s'),
        new DurationCase(1500, '1.5 s'), new DurationCase(1999, '2.0 s'), new DurationCase(2000, '2.0 s'),
        new DurationCase(9999, '10.0 s'), new DurationCase(10000, '10.0 s'), new DurationCase(59999, '60.0 s')
      ];
      expect(cases.length).assertEqual(9);
      expect(wrongDurations(cases)).assertEqual('');
      expect(formatDuration(59999).startsWith('60')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_0300
     * @tc.name testFmtCtx0003
     * @tc.desc Verify minute durations floor both minutes and seconds including past one hour.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0003', 0, () => {
      const cases: DurationCase[] = [
        new DurationCase(60000, '1 min 0 s'), new DurationCase(60999, '1 min 0 s'),
        new DurationCase(61000, '1 min 1 s'), new DurationCase(61500, '1 min 1 s'),
        new DurationCase(119999, '1 min 59 s'), new DurationCase(120000, '2 min 0 s'),
        new DurationCase(3599999, '59 min 59 s'), new DurationCase(3600000, '60 min 0 s'),
        new DurationCase(7322000, '122 min 2 s')
      ];
      expect(cases.length).assertEqual(9);
      expect(wrongDurations(cases)).assertEqual('');
      expect(formatDuration(60000).includes('.')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_0400
     * @tc.name testFmtCtx0004
     * @tc.desc Verify a 28 point millisecond sweep and a 60 point minute sweep follow their formulas.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0004', 0, () => {
      let msChecked = 0;
      let wrong = 0;
      for (let ms = 0; ms < 1000; ms += 37) {
        wrong += formatDuration(ms) === `${ms} ms` ? 0 : 1;
        msChecked++;
      }
      let minChecked = 0;
      for (let m = 1; m <= 60; m++) {
        const ms = m * 60000 + (m % 60) * 1000;
        wrong += formatDuration(ms) === `${m} min ${m % 60} s` ? 0 : 1;
        minChecked++;
      }
      expect(msChecked).assertEqual(28);
      expect(minChecked).assertEqual(60);
      expect(wrong).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_0500
     * @tc.name testFmtCtx0005
     * @tc.desc Verify truncateMiddle leaves text unchanged for limits up to three or at least its length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0005', 0, () => {
      const limits: number[] = [-1, 0, 1, 2, 3, 26, 27, 1000];
      let unchanged = 0;
      for (const limit of limits) {
        unchanged += truncateMiddle(ALPHABET, limit) === ALPHABET ? 1 : 0;
      }
      expect(unchanged).assertEqual(limits.length);
      expect(truncateMiddle('', 4)).assertEqual('');
      expect(truncateMiddle('abcd', 4)).assertEqual('abcd');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_0600
     * @tc.name testFmtCtx0006
     * @tc.desc Verify the head gets the extra character when the kept length is odd.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0006', 0, () => {
      expect(truncateMiddle(ALPHABET, 4)).assertEqual('ab…z');
      expect(truncateMiddle(ALPHABET, 5)).assertEqual('ab…yz');
      expect(truncateMiddle(ALPHABET, 6)).assertEqual('abc…yz');
      expect(truncateMiddle(ALPHABET, 7)).assertEqual('abc…xyz');
      expect(truncateMiddle(ALPHABET, 8)).assertEqual('abcd…xyz');
      expect(truncateMiddle(ALPHABET, 9)).assertEqual('abcd…wxyz');
      expect(truncateMiddle(ALPHABET, 10)).assertEqual('abcde…wxyz');
      expect(truncateMiddle(ALPHABET, 25)).assertEqual('abcdefghijkl…opqrstuvwxyz');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_0700
     * @tc.name testFmtCtx0007
     * @tc.desc Verify every limit from 4 to 25 yields exactly that length with the ellipsis at head plus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0007', 0, () => {
      let checked = 0;
      let wrong = 0;
      for (let limit = 4; limit <= 25; limit++) {
        const out = truncateMiddle(ALPHABET, limit);
        const head = Math.ceil((limit - 1) / 2);
        const ok = out.length === limit && out.indexOf('…') === head && ALPHABET.startsWith(out.slice(0, head)) &&
          ALPHABET.endsWith(out.slice(head + 1));
        wrong += ok ? 0 : 1;
        checked++;
      }
      expect(checked).assertEqual(22);
      expect(wrong).assertEqual(0);
      expect(occurrences(truncateMiddle(ALPHABET, 12), '…')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_0800
     * @tc.name testFmtCtx0008
     * @tc.desc Verify the default peer MAC and UUID shorten to their documented heads and tails.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0008', 0, () => {
      expect(truncateMiddle(DEFAULT_PEER_ADDRESS, 9)).assertEqual('12:3…A:BC');
      expect(truncateMiddle(DEFAULT_PEER_UUID, 12)).assertEqual('0000A0…B34FB');
      expect(truncateMiddle(DEFAULT_PEER_ADDRESS, 17)).assertEqual(DEFAULT_PEER_ADDRESS);
      expect(truncateMiddle(DEFAULT_PEER_UUID, 36)).assertEqual(DEFAULT_PEER_UUID);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_0900
     * @tc.name testFmtCtx0009
     * @tc.desc Verify truncateMiddle counts UTF-16 units so CJK stays whole and emoji may split.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0009', 0, () => {
      expect(truncateMiddle('分布式扩展与链路示例', 6)).assertEqual('分布式…示例');
      const emoji = truncateMiddle('😀😀😀😀', 4);
      expect(emoji.length).assertEqual(4);
      expect(emoji.slice(0, 2)).assertEqual('😀');
      expect(emoji.charAt(2)).assertEqual('…');
      expect(emoji.charCodeAt(3)).assertEqual(0xDE00);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_1000
     * @tc.name testFmtCtx0010
     * @tc.desc Verify pad2 pads only values below ten including negatives and fractions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0010', 0, () => {
      const inputs: number[] = [-1, 0, 5, 9, 10, 59, 99, 100, 9.5];
      const outputs: string[] = [];
      for (const value of inputs) {
        outputs.push(pad2(value));
      }
      expect(outputs.join(',')).assertEqual('0-1,00,05,09,10,59,99,100,09.5');
      expect(pad2(23).length).assertEqual(2);
      expect(pad2(7).startsWith('0')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_1100
     * @tc.name testFmtCtx0011
     * @tc.desc Verify formatTime and formatDateTime for fixed dates at the start and end of a year.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0011', 0, () => {
      expect(formatDateTime(new Date(2026, 0, 2, 3, 4, 5))).assertEqual('2026-01-02 03:04:05');
      expect(formatDateTime(new Date(2026, 11, 31, 23, 59, 59))).assertEqual('2026-12-31 23:59:59');
      expect(formatTime(new Date(2026, 5, 15, 12, 0, 0))).assertEqual('12:00:00');
      expect(formatDateTime(new Date(2000, 1, 29, 12, 0, 0))).assertEqual('2000-02-29 12:00:00');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_1200
     * @tc.name testFmtCtx0012
     * @tc.desc Verify out of range month, day and second arguments roll over before formatting.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0012', 0, () => {
      expect(formatDateTime(new Date(2026, 12, 1, 0, 0, 0))).assertEqual('2027-01-01 00:00:00');
      expect(formatDateTime(new Date(2026, 1, 30, 8, 0, 0))).assertEqual('2026-03-02 08:00:00');
      expect(formatDateTime(new Date(2026, 0, 1, 10, 59, 60))).assertEqual('2026-01-01 11:00:00');
      expect(formatTime(new Date(2026, 0, 1, 10, 0, -1))).assertEqual('09:59:59');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_1300
     * @tc.name testFmtCtx0013
     * @tc.desc Verify a 24 hour by 4 minute sweep always formats as an 8 character clock.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0013', 0, () => {
      let checked = 0;
      let wrong = 0;
      const minutes: number[] = [0, 9, 10, 59];
      for (let hour = 0; hour < 24; hour++) {
        for (const minute of minutes) {
          const text = formatTime(new Date(2026, 5, 15, hour, minute, minute));
          wrong += text === `${pad2(hour)}:${pad2(minute)}:${pad2(minute)}` && text.length === 8 ? 0 : 1;
          checked++;
        }
      }
      expect(checked).assertEqual(96);
      expect(wrong).assertEqual(0);
      expect(formatDateTime(new Date(2026, 5, 15, 7, 8, 9)).endsWith(' 07:08:09')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_1400
     * @tc.name testFmtCtx0014
     * @tc.desc Verify a twelve month sweep zero pads the month and keeps the date part 10 characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0014', 0, () => {
      let wrong = 0;
      for (let month = 0; month < 12; month++) {
        const text = formatDateTime(new Date(2026, month, 9, 1, 2, 3));
        wrong += text === `2026-${pad2(month + 1)}-09 01:02:03` && text.length === 19 ? 0 : 1;
      }
      expect(wrong).assertEqual(0);
      expect(formatDateTime(new Date(2026, 9, 10, 1, 2, 3))).assertEqual('2026-10-10 01:02:03');
      expect(formatDateTime(new Date(2026, 8, 1, 1, 2, 3)).slice(0, 10)).assertEqual('2026-09-01');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_1500
     * @tc.name testFmtCtx0015
     * @tc.desc Verify only type 28 is named distributed across nearby and negative ability types.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0015', 0, () => {
      const types: number[] = [0, 27, 28, 29, -1, 255];
      const names: string[] = [];
      for (const type of types) {
        names.push(new ContextSnapshot('A', type, 'm', 'zh').typeName());
      }
      expect(EXTENSION_TYPE_DISTRIBUTED).assertEqual(28);
      expect(names.join('|')).assertEqual(
        '0（非 distributed）|27（非 distributed）|28（distributed）|29（非 distributed）|-1（非 distributed）|255（非 distributed）');
      expect(names.filter((name: string) => !name.includes('非')).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_1600
     * @tc.name testFmtCtx0016
     * @tc.desc Verify a 2 by 2 by 2 by 2 snapshot grid shows one placeholder per blank field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0016', 0, () => {
      const names: string[] = ['', 'DistributedExtAbility'];
      const types: number[] = [27, 28];
      const modules: string[] = ['', 'entry'];
      const languages: string[] = ['', 'zh-Hans'];
      let combos = 0;
      let wrong = 0;
      for (const name of names) {
        for (const type of types) {
          for (const mod of modules) {
            for (const language of languages) {
              const blanks = (name === '' ? 1 : 0) + (mod === '' ? 1 : 0) + (language === '' ? 1 : 0);
              const text = contextSnapshot(name, type, mod, language).describe();
              wrong += occurrences(text, contextUnknownText()) === blanks && text.startsWith('context 可用：') ? 0 : 1;
              combos++;
            }
          }
        }
      }
      expect(combos).assertEqual(16);
      expect(wrong).assertEqual(0);
      expect(contextUnknownText()).assertEqual('（未提供）');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_1700
     * @tc.name testFmtCtx0017
     * @tc.desc Verify the full description for the declared extension and for an all blank snapshot.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0017', 0, () => {
      expect(contextSnapshot('DistributedExtAbility', 28, 'entry', 'zh-Hans').describe()).assertEqual(
        'context 可用：DistributedExtAbility，type=28（distributed），模块 entry，语言 zh-Hans');
      expect(contextSnapshot('', 0, '', '').describe()).assertEqual(
        'context 可用：（未提供），type=0（非 distributed），模块 （未提供），语言 （未提供）');
      expect(contextSnapshot('', 0, '', '').abilityType).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_1800
     * @tc.name testFmtCtx0018
     * @tc.desc Verify blank but non empty fields are kept verbatim instead of the placeholder.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0018', 0, () => {
      const snapshot = new ContextSnapshot(' ', 28, '\t', ' ');
      expect(snapshot.abilityName).assertEqual(' ');
      expect(snapshot.moduleName).assertEqual('\t');
      expect(snapshot.language).assertEqual(' ');
      expect(occurrences(snapshot.describe(), contextUnknownText())).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_1900
     * @tc.name testFmtCtx0019
     * @tc.desc Verify safeText turns undefined into empty so the snapshot shows the placeholder.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0019', 0, () => {
      const missing: string | undefined = undefined;
      expect(safeText(missing)).assertEqual('');
      expect(safeText('')).assertEqual('');
      expect(safeText('en-Latn-US')).assertEqual('en-Latn-US');
      expect(contextSnapshot('A', 28, 'entry', safeText(missing)).language).assertEqual(contextUnknownText());
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_2000
     * @tc.name testFmtCtx0020
     * @tc.desc Verify the factory and the constructor produce identical snapshots across a type sweep.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0020', 0, () => {
      let wrong = 0;
      let checked = 0;
      for (let type = 20; type <= 35; type++) {
        const a = contextSnapshot('Ext', type, 'entry', 'zh');
        const b = new ContextSnapshot('Ext', type, 'entry', 'zh');
        wrong += a.describe() === b.describe() && a.typeName() === b.typeName() ? 0 : 1;
        checked++;
      }
      expect(checked).assertEqual(16);
      expect(wrong).assertEqual(0);
      expect(contextSnapshot('Ext', 28, 'entry', 'zh').describe().includes('（distributed）')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FMTCTX_2100
     * @tc.name testFmtCtx0021
     * @tc.desc Verify a long context description shortened for the panel keeps the prefix and the language.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFmtCtx0021', 0, () => {
      const text = contextSnapshot('DistributedExtAbility', 28, 'entry', 'zh-Hans').describe();
      const short = truncateMiddle(text, 23);
      expect(text.length > 23).assertTrue();
      expect(short.length).assertEqual(23);
      expect(short.startsWith('context 可用：')).assertTrue();
      expect(short.endsWith('zh-Hans')).assertTrue();
    });
  });
}
