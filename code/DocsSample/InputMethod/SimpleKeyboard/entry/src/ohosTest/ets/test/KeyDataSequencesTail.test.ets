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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  KeyState,
  keySourceListData,
  keySourceListType,
  numberSourceListData,
  symbolSourceListData,
  sourceListType
} from '../../../main/ets/InputMethodExtensionAbility/pages/KeyboardKeyData';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KeyDataSequences]';

export default function KeyDataSequencesTailTest(): void {
  describe('KeyDataSequencesTailTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0113
     * @tc.name      testKeyDataSequence0113
     * @tc.desc      Symbol panel key '×' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0113 begin');
      const item: sourceListType = symbolSourceListData[7];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[7].content).assertEqual('\u00D7');
      expect(item.content).assertEqual('\u00D7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0113 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0114
     * @tc.name      testKeyDataSequence0114
     * @tc.desc      Symbol panel key '¶' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0114 begin');
      const item: sourceListType = symbolSourceListData[8];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[8].content).assertEqual('\u00B6');
      expect(item.content).assertEqual('\u00B6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0114 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0115
     * @tc.name      testKeyDataSequence0115
     * @tc.desc      Symbol panel key '∆' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0115 begin');
      const item: sourceListType = symbolSourceListData[9];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[9].content).assertEqual('\u2206');
      expect(item.content).assertEqual('\u2206');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0115 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0116
     * @tc.name      testKeyDataSequence0116
     * @tc.desc      Symbol panel key '£' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0116 begin');
      const item: sourceListType = symbolSourceListData[10];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[10].content).assertEqual('\u00A3');
      expect(item.content).assertEqual('\u00A3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0116 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0117
     * @tc.name      testKeyDataSequence0117
     * @tc.desc      Symbol panel key '€' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0117 begin');
      const item: sourceListType = symbolSourceListData[11];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[11].content).assertEqual('\u20AC');
      expect(item.content).assertEqual('\u20AC');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0117 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0118
     * @tc.name      testKeyDataSequence0118
     * @tc.desc      Symbol panel key '¥' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0118 begin');
      const item: sourceListType = symbolSourceListData[12];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[12].content).assertEqual('\u00A5');
      expect(item.content).assertEqual('\u00A5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0118 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0119
     * @tc.name      testKeyDataSequence0119
     * @tc.desc      Symbol panel key '¢' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0119 begin');
      const item: sourceListType = symbolSourceListData[13];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[13].content).assertEqual('\u00A2');
      expect(item.content).assertEqual('\u00A2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0119 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0120
     * @tc.name      testKeyDataSequence0120
     * @tc.desc      Symbol panel key '^' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0120 begin');
      const item: sourceListType = symbolSourceListData[14];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[14].content).assertEqual('^');
      expect(item.content).assertEqual('^');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0120 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0121
     * @tc.name      testKeyDataSequence0121
     * @tc.desc      Symbol panel key '°' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0121 begin');
      const item: sourceListType = symbolSourceListData[15];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[15].content).assertEqual('\u00B0');
      expect(item.content).assertEqual('\u00B0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0121 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0122
     * @tc.name      testKeyDataSequence0122
     * @tc.desc      Symbol panel key '=' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0122 begin');
      const item: sourceListType = symbolSourceListData[16];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[16].content).assertEqual('=');
      expect(item.content).assertEqual('=');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0122 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0123
     * @tc.name      testKeyDataSequence0123
     * @tc.desc      Symbol panel key '{' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0123 begin');
      const item: sourceListType = symbolSourceListData[17];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[17].content).assertEqual('{');
      expect(item.content).assertEqual('{');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0123 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0124
     * @tc.name      testKeyDataSequence0124
     * @tc.desc      Symbol panel key '}' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0124 begin');
      const item: sourceListType = symbolSourceListData[18];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[18].content).assertEqual('}');
      expect(item.content).assertEqual('}');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0124 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0125
     * @tc.name      testKeyDataSequence0125
     * @tc.desc      Symbol panel key ',' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0125 begin');
      const item: sourceListType = symbolSourceListData[19];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[19].content).assertEqual(',');
      expect(item.content).assertEqual(',');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0125 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0126
     * @tc.name      testKeyDataSequence0126
     * @tc.desc      Symbol panel key '\\' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0126 begin');
      const item: sourceListType = symbolSourceListData[20];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[20].content).assertEqual('\\');
      expect(item.content).assertEqual('\\');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0126 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0127
     * @tc.name      testKeyDataSequence0127
     * @tc.desc      Symbol panel key '©' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0127 begin');
      const item: sourceListType = symbolSourceListData[21];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[21].content).assertEqual('\u00A9');
      expect(item.content).assertEqual('\u00A9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0127 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0128
     * @tc.name      testKeyDataSequence0128
     * @tc.desc      Symbol panel key '®' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0128 begin');
      const item: sourceListType = symbolSourceListData[22];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[22].content).assertEqual('\u00AE');
      expect(item.content).assertEqual('\u00AE');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0128 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0129
     * @tc.name      testKeyDataSequence0129
     * @tc.desc      Symbol panel key '™' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0129 begin');
      const item: sourceListType = symbolSourceListData[23];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[23].content).assertEqual('\u2122');
      expect(item.content).assertEqual('\u2122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0129 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0130
     * @tc.name      testKeyDataSequence0130
     * @tc.desc      Symbol panel key '℅' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0130 begin');
      const item: sourceListType = symbolSourceListData[24];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[24].content).assertEqual('\u2105');
      expect(item.content).assertEqual('\u2105');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0130 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0131
     * @tc.name      testKeyDataSequence0131
     * @tc.desc      Symbol panel key '[' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0131 begin');
      const item: sourceListType = symbolSourceListData[25];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[25].content).assertEqual('[');
      expect(item.content).assertEqual('[');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0131 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0132
     * @tc.name      testKeyDataSequence0132
     * @tc.desc      Symbol panel key ']' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0132 begin');
      const item: sourceListType = symbolSourceListData[26];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[26].content).assertEqual(']');
      expect(item.content).assertEqual(']');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0132 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0133
     * @tc.name      testKeyDataSequence0133
     * @tc.desc      Number key '1' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0133 begin');
      const first: sourceListType = numberSourceListData[0];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[0];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0133 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0134
     * @tc.name      testKeyDataSequence0134
     * @tc.desc      Number key '2' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0134 begin');
      const first: sourceListType = numberSourceListData[1];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[1];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0134 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0135
     * @tc.name      testKeyDataSequence0135
     * @tc.desc      Number key '3' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0135 begin');
      const first: sourceListType = numberSourceListData[2];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[2];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0135 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0136
     * @tc.name      testKeyDataSequence0136
     * @tc.desc      Number key '4' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0136 begin');
      const first: sourceListType = numberSourceListData[3];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[3];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0136 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0137
     * @tc.name      testKeyDataSequence0137
     * @tc.desc      Number key '5' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0137 begin');
      const first: sourceListType = numberSourceListData[4];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[4];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0137 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0138
     * @tc.name      testKeyDataSequence0138
     * @tc.desc      Number key '6' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0138 begin');
      const first: sourceListType = numberSourceListData[5];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[5];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0138 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0139
     * @tc.name      testKeyDataSequence0139
     * @tc.desc      Number key '7' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0139 begin');
      const first: sourceListType = numberSourceListData[6];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[6];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0139 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0140
     * @tc.name      testKeyDataSequence0140
     * @tc.desc      Number key '8' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0140 begin');
      const first: sourceListType = numberSourceListData[7];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[7];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0140 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0141
     * @tc.name      testKeyDataSequence0141
     * @tc.desc      Number key '9' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0141 begin');
      const first: sourceListType = numberSourceListData[8];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[8];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0141 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0142
     * @tc.name      testKeyDataSequence0142
     * @tc.desc      Number key '0' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0142 begin');
      const first: sourceListType = numberSourceListData[9];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[9];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0142 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0143
     * @tc.name      testKeyDataSequence0143
     * @tc.desc      Number key '@' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0143 begin');
      const first: sourceListType = numberSourceListData[10];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[10];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('@');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0143 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0144
     * @tc.name      testKeyDataSequence0144
     * @tc.desc      Number key '#' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0144 begin');
      const first: sourceListType = numberSourceListData[11];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[11];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('#');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0144 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0145
     * @tc.name      testKeyDataSequence0145
     * @tc.desc      Number key '$' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0145 begin');
      const first: sourceListType = numberSourceListData[12];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[12];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('$');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0145 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0146
     * @tc.name      testKeyDataSequence0146
     * @tc.desc      Number key '%' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0146 begin');
      const first: sourceListType = numberSourceListData[13];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[13];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0146 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0147
     * @tc.name      testKeyDataSequence0147
     * @tc.desc      Number key '&' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0147 begin');
      const first: sourceListType = numberSourceListData[14];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[14];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('&');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0147 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0148
     * @tc.name      testKeyDataSequence0148
     * @tc.desc      Number key '-' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0148 begin');
      const first: sourceListType = numberSourceListData[15];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[15];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('-');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0148 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0149
     * @tc.name      testKeyDataSequence0149
     * @tc.desc      Number key '+' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0149 begin');
      const first: sourceListType = numberSourceListData[16];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[16];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('+');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0149 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0150
     * @tc.name      testKeyDataSequence0150
     * @tc.desc      Number key '(' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0150 begin');
      const first: sourceListType = numberSourceListData[17];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[17];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('(');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0150 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0151
     * @tc.name      testKeyDataSequence0151
     * @tc.desc      Number key ')' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0151 begin');
      const first: sourceListType = numberSourceListData[18];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[18];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual(')');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0151 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0152
     * @tc.name      testKeyDataSequence0152
     * @tc.desc      Number key '/' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0152 begin');
      const first: sourceListType = numberSourceListData[19];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[19];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0152 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0153
     * @tc.name      testKeyDataSequence0153
     * @tc.desc      Number key '*' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0153 begin');
      const first: sourceListType = numberSourceListData[20];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[20];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('*');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0153 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0154
     * @tc.name      testKeyDataSequence0154
     * @tc.desc      Number key '"' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0154 begin');
      const first: sourceListType = numberSourceListData[21];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[21];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('"');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0154 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0155
     * @tc.name      testKeyDataSequence0155
     * @tc.desc      Number key "'" survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0155 begin');
      const first: sourceListType = numberSourceListData[22];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[22];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\'');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0155 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0156
     * @tc.name      testKeyDataSequence0156
     * @tc.desc      Number key ':' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0156 begin');
      const first: sourceListType = numberSourceListData[23];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[23];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual(':');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0156 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0157
     * @tc.name      testKeyDataSequence0157
     * @tc.desc      Number key ';' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0157 begin');
      const first: sourceListType = numberSourceListData[24];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[24];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual(';');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0157 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0158
     * @tc.name      testKeyDataSequence0158
     * @tc.desc      Number key '!' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0158 begin');
      const first: sourceListType = numberSourceListData[25];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[25];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0158 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0159
     * @tc.name      testKeyDataSequence0159
     * @tc.desc      Number key '?' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0159 begin');
      const first: sourceListType = numberSourceListData[26];
      const menu: number = 1;
      const second: sourceListType = numberSourceListData[26];
      expect(menu).assertEqual(1);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('?');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0159 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0160
     * @tc.name      testKeyDataSequence0160
     * @tc.desc      Symbol key '~' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0160 begin');
      const first: sourceListType = symbolSourceListData[0];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[0];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('~');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0160 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0161
     * @tc.name      testKeyDataSequence0161
     * @tc.desc      Symbol key '`' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0161 begin');
      const first: sourceListType = symbolSourceListData[1];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[1];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('`');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0161 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0162
     * @tc.name      testKeyDataSequence0162
     * @tc.desc      Symbol key '|' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0162 begin');
      const first: sourceListType = symbolSourceListData[2];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[2];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('|');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0162 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0163
     * @tc.name      testKeyDataSequence0163
     * @tc.desc      Symbol key '•' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0163 begin');
      const first: sourceListType = symbolSourceListData[3];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[3];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u2022');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0163 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0164
     * @tc.name      testKeyDataSequence0164
     * @tc.desc      Symbol key '√' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0164 begin');
      const first: sourceListType = symbolSourceListData[4];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[4];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u221A');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0164 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0165
     * @tc.name      testKeyDataSequence0165
     * @tc.desc      Symbol key 'Π' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0165 begin');
      const first: sourceListType = symbolSourceListData[5];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[5];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u03A0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0165 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0166
     * @tc.name      testKeyDataSequence0166
     * @tc.desc      Symbol key '÷' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0166 begin');
      const first: sourceListType = symbolSourceListData[6];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[6];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u00F7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0166 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0167
     * @tc.name      testKeyDataSequence0167
     * @tc.desc      Symbol key '×' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0167 begin');
      const first: sourceListType = symbolSourceListData[7];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[7];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u00D7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0167 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0168
     * @tc.name      testKeyDataSequence0168
     * @tc.desc      Symbol key '¶' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0168 begin');
      const first: sourceListType = symbolSourceListData[8];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[8];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u00B6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0168 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0169
     * @tc.name      testKeyDataSequence0169
     * @tc.desc      Symbol key '∆' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0169 begin');
      const first: sourceListType = symbolSourceListData[9];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[9];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u2206');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0169 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0170
     * @tc.name      testKeyDataSequence0170
     * @tc.desc      Symbol key '£' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0170 begin');
      const first: sourceListType = symbolSourceListData[10];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[10];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u00A3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0170 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0171
     * @tc.name      testKeyDataSequence0171
     * @tc.desc      Symbol key '€' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0171 begin');
      const first: sourceListType = symbolSourceListData[11];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[11];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u20AC');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0171 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0172
     * @tc.name      testKeyDataSequence0172
     * @tc.desc      Symbol key '¥' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0172 begin');
      const first: sourceListType = symbolSourceListData[12];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[12];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u00A5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0172 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0173
     * @tc.name      testKeyDataSequence0173
     * @tc.desc      Symbol key '¢' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0173 begin');
      const first: sourceListType = symbolSourceListData[13];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[13];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u00A2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0173 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0174
     * @tc.name      testKeyDataSequence0174
     * @tc.desc      Symbol key '^' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0174 begin');
      const first: sourceListType = symbolSourceListData[14];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[14];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('^');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0174 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0175
     * @tc.name      testKeyDataSequence0175
     * @tc.desc      Symbol key '°' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0175 begin');
      const first: sourceListType = symbolSourceListData[15];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[15];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u00B0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0175 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0176
     * @tc.name      testKeyDataSequence0176
     * @tc.desc      Symbol key '=' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0176 begin');
      const first: sourceListType = symbolSourceListData[16];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[16];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('=');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0176 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0177
     * @tc.name      testKeyDataSequence0177
     * @tc.desc      Symbol key '{' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0177 begin');
      const first: sourceListType = symbolSourceListData[17];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[17];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('{');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0177 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0178
     * @tc.name      testKeyDataSequence0178
     * @tc.desc      Symbol key '}' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0178 begin');
      const first: sourceListType = symbolSourceListData[18];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[18];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('}');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0178 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0179
     * @tc.name      testKeyDataSequence0179
     * @tc.desc      Symbol key ',' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0179 begin');
      const first: sourceListType = symbolSourceListData[19];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[19];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual(',');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0179 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0180
     * @tc.name      testKeyDataSequence0180
     * @tc.desc      Symbol key '\\' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0180 begin');
      const first: sourceListType = symbolSourceListData[20];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[20];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\\');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0180 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0181
     * @tc.name      testKeyDataSequence0181
     * @tc.desc      Symbol key '©' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0181 begin');
      const first: sourceListType = symbolSourceListData[21];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[21];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u00A9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0181 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0182
     * @tc.name      testKeyDataSequence0182
     * @tc.desc      Symbol key '®' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0182 begin');
      const first: sourceListType = symbolSourceListData[22];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[22];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u00AE');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0182 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0183
     * @tc.name      testKeyDataSequence0183
     * @tc.desc      Symbol key '™' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0183 begin');
      const first: sourceListType = symbolSourceListData[23];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[23];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u2122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0183 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0184
     * @tc.name      testKeyDataSequence0184
     * @tc.desc      Symbol key '℅' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0184 begin');
      const first: sourceListType = symbolSourceListData[24];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[24];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('\u2105');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0184 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0185
     * @tc.name      testKeyDataSequence0185
     * @tc.desc      Symbol key '[' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0185 begin');
      const first: sourceListType = symbolSourceListData[25];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[25];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual('[');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0185 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0186
     * @tc.name      testKeyDataSequence0186
     * @tc.desc      Symbol key ']' survives a menu leave and return lookup.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0186 begin');
      const first: sourceListType = symbolSourceListData[26];
      const menu: number = 2;
      const second: sourceListType = symbolSourceListData[26];
      expect(menu).assertEqual(2);
      expect(first.content).assertEqual(second.content);
      expect(second.content).assertEqual(']');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0186 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0187
     * @tc.name      testKeyDataSequence0187
     * @tc.desc      The exported letter table can produce the word hello.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0187 begin');
      const word: string = 'hello';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0187 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0188
     * @tc.name      testKeyDataSequence0188
     * @tc.desc      The exported letter table can produce the word world.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0188 begin');
      const word: string = 'world';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0188 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0189
     * @tc.name      testKeyDataSequence0189
     * @tc.desc      The exported letter table can produce the word keyboard.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0189 begin');
      const word: string = 'keyboard';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0189 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0190
     * @tc.name      testKeyDataSequence0190
     * @tc.desc      The exported letter table can produce the word simple.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0190 begin');
      const word: string = 'simple';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0190 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0191
     * @tc.name      testKeyDataSequence0191
     * @tc.desc      The exported letter table can produce the word input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0191 begin');
      const word: string = 'input';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0191 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0192
     * @tc.name      testKeyDataSequence0192
     * @tc.desc      The exported letter table can produce the word method.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0192 begin');
      const word: string = 'method';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0192 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0193
     * @tc.name      testKeyDataSequence0193
     * @tc.desc      The exported letter table can produce the word shift.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0193 begin');
      const word: string = 'shift';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0193 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0194
     * @tc.name      testKeyDataSequence0194
     * @tc.desc      The exported letter table can produce the word number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0194 begin');
      const word: string = 'number';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0194 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0195
     * @tc.name      testKeyDataSequence0195
     * @tc.desc      The exported letter table can produce the word symbol.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0195 begin');
      const word: string = 'symbol';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0195 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0196
     * @tc.name      testKeyDataSequence0196
     * @tc.desc      The exported letter table can produce the word sample.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0196 begin');
      const word: string = 'sample';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0196 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0197
     * @tc.name      testKeyDataSequence0197
     * @tc.desc      The exported letter table can produce the word test.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0197 begin');
      const word: string = 'test';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0197 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0198
     * @tc.name      testKeyDataSequence0198
     * @tc.desc      The exported letter table can produce the word case.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0198 begin');
      const word: string = 'case';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0198 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0199
     * @tc.name      testKeyDataSequence0199
     * @tc.desc      The exported letter table can produce the word open.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0199 begin');
      const word: string = 'open';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0199 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0200
     * @tc.name      testKeyDataSequence0200
     * @tc.desc      The exported letter table can produce the word harmony.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0200 begin');
      const word: string = 'harmony';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0200 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0201
     * @tc.name      testKeyDataSequence0201
     * @tc.desc      The exported letter table can produce the word ohos.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0201 begin');
      const word: string = 'ohos';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0201 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0202
     * @tc.name      testKeyDataSequence0202
     * @tc.desc      The exported letter table can produce the word letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0202 begin');
      const word: string = 'letter';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0202 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0203
     * @tc.name      testKeyDataSequence0203
     * @tc.desc      The exported letter table can produce the word upper.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0203 begin');
      const word: string = 'upper';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0203 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0204
     * @tc.name      testKeyDataSequence0204
     * @tc.desc      The exported letter table can produce the word lower.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0204 begin');
      const word: string = 'lower';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0204 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0205
     * @tc.name      testKeyDataSequence0205
     * @tc.desc      The exported letter table can produce the word edit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0205 begin');
      const word: string = 'edit';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0205 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0206
     * @tc.name      testKeyDataSequence0206
     * @tc.desc      The exported letter table can produce the word delete.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0206 begin');
      const word: string = 'delete';
      let generated: string = '';
      for (let i: number = 0; i < word.length; i++) {
        for (let j: number = 0; j < keySourceListData.length; j++) {
          if (keySourceListData[j].content === word.charAt(i)) {
            generated += keySourceListData[j].content;
            break;
          }
        }
      }
      expect(generated).assertEqual(word);
      expect(generated.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0206 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0207
     * @tc.name      testKeyDataSequence0207
     * @tc.desc      All letter contents are reachable in KeyMenu rows.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0207 begin');
      const rows: keySourceListType[] = keySourceListData.slice(0, 10).concat(keySourceListData.slice(10, 19)).concat(keySourceListData.slice(19));
      expect(rows.length).assertEqual(keySourceListData.length);
      for (let i: number = 0; i < rows.length; i++) {
        expect(rows[i].content).assertEqual(keySourceListData[i].content);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0207 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0208
     * @tc.name      testKeyDataSequence0208
     * @tc.desc      Number rows concatenate to the original number table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0208 begin');
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      for (let i: number = 0; i < rows.length; i++) {
        expect(rows[i].content).assertEqual(numberSourceListData[i].content);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0208 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0209
     * @tc.name      testKeyDataSequence0209
     * @tc.desc      Symbol rows concatenate to the original symbol table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0209 begin');
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      for (let i: number = 0; i < rows.length; i++) {
        expect(rows[i].content).assertEqual(symbolSourceListData[i].content);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0209 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0210
     * @tc.name      testKeyDataSequence0210
     * @tc.desc      The three panels expose distinct key content domains.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0210 begin');
      expect(keySourceListData[0].content).assertEqual('q');
      expect(numberSourceListData[0].content).assertEqual('1');
      expect(symbolSourceListData[0].content).assertEqual('~');
      expect(keySourceListData[0].content === numberSourceListData[0].content).assertFalse();
      expect(numberSourceListData[0].content === symbolSourceListData[0].content).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0210 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0211
     * @tc.name      testKeyDataSequence0211
     * @tc.desc      A lower and upper pair can form a two-character word.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0211 begin');
      let word: string = '';
      word += keySourceListData[0].upperContent;
      word += keySourceListData[1].content;
      expect(word).assertEqual('Qw');
      expect(word.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0211 end');
    })
  })
}
