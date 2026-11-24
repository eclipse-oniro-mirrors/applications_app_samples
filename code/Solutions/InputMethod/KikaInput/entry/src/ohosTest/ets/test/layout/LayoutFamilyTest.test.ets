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
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import { keySourceListData, keySourceListType, numberSourceListData, sourceListType, symbolSourceListData, KeyState } from '../../../../main/ets/model/KeyboardKeyData';

const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KikaInputLayoutContractTest]';

function renderForState(state: number, lower: string, upper: string): string {
  if (state === KeyState.LOWER_CASE) {
    return lower;
  }
  return upper;
}

interface LayoutTable {
  data: sourceListType[];
  starts: number[];
  ends: number[];
  counts: number[];
  total: number;
  boundaries: number[][];
}

const LAYOUT_TABLES: LayoutTable[] = [
  {
    data: keySourceListData, starts: [0, 10, 19], ends: [10, 19, 26],
    counts: [10, 9, 7], total: 26, boundaries: [[9, 10], [18, 19]]
  },
  {
    data: numberSourceListData, starts: [0, 10, 20], ends: [10, 20, 27],
    counts: [10, 10, 7], total: 27, boundaries: [[9, 10], [19, 20]]
  },
  {
    data: symbolSourceListData, starts: [0, 10, 20], ends: [10, 20, 27],
    counts: [10, 10, 7], total: 27, boundaries: [[9, 10], [19, 20]]
  }
];

export default function LayoutFamilyTestTest(): void {
  describe('LayoutFamilyTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_CONTRACT_0100
     * @tc.name      testLayoutContract_001
     * @tc.desc      Verify that every entry of each menu sits at its slot inside its own row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLayoutContract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutContract_001 begin');

      // Position is defined per row; the slice bounds decide the row of an entry.
      let t: number = 0;
      while (t < LAYOUT_TABLES.length) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        for (let r = 0; r < table.starts.length; r++) {
          const row: sourceListType[] = table.data.slice(table.starts[r], table.ends[r]);
          for (let k = 0; k < row.length; k++) {
            expect(row.indexOf(table.data[table.starts[r] + k])).assertEqual(k);
            expect(row[k]).assertEqual(table.data[table.starts[r] + k]);
          }
        }
        expect(table.starts.length).assertEqual(3);
        t = t + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutContract_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_CONTRACT_0200
     * @tc.name      testLayoutContract_002
     * @tc.desc      Verify that the three rows of each menu expose their expected slot counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutContract_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutContract_002 begin');

      // Row sizes are fixed by the layout contract, not by the data length.
      for (let t = 0; t < LAYOUT_TABLES.length; t++) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        for (let r = 0; r < table.counts.length; r++) {
          const row: sourceListType[] = table.data.slice(table.starts[r], table.ends[r]);
          expect(row.length).assertEqual(table.counts[r]);
        }
        expect(table.data.length).assertEqual(table.total);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutContract_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_CONTRACT_0300
     * @tc.name      testLayoutContract_003
     * @tc.desc      Verify that entries around each row boundary of every menu belong to different rows.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutContract_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutContract_003 begin');

      // Adjacent rows must not share their last and first entries.
      let t: number = 0;
      while (t < LAYOUT_TABLES.length) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        for (let i = 0; i < table.boundaries.length; i++) {
          const left: sourceListType = table.data[table.boundaries[i][0]];
          const right: sourceListType = table.data[table.boundaries[i][1]];
          expect(left === right).assertFalse();
          expect(left.content === right.content).assertFalse();
        }
        t = t + 1;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutContract_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_CONTRACT_0400
     * @tc.name      testLayoutContract_004
     * @tc.desc      Verify that each row of every menu exposes unique entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutContract_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutContract_004 begin');

      // Duplicate entries inside one row would make a slot ambiguous.
      for (let t = 0; t < LAYOUT_TABLES.length; t++) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        for (let r = 0; r < table.starts.length; r++) {
          const row: sourceListType[] = table.data.slice(table.starts[r], table.ends[r]);
          const seen: Set<string> = new Set<string>();
          for (let k = 0; k < row.length; k++) {
            seen.add(row[k].content);
          }
          expect(seen.size).assertEqual(row.length);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutContract_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_CONTRACT_0500
     * @tc.name      testLayoutContract_005
     * @tc.desc      Verify that LOWER_CASE renders the primary letter of every key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLayoutContract_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutContract_005 begin');

      const state: number = KeyState.LOWER_CASE;
      const entries: keySourceListType[] = keySourceListData;

      let i: number = 0;
      while (i < entries.length) {
        const item: keySourceListType = entries[i];
        const displayed: string = renderForState(state, item.content, item.upperContent);
        expect(displayed).assertEqual(item.content);
        expect(displayed.length).assertEqual(1);
        i = i + 1;
      }

      expect(entries.length).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutContract_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_CONTRACT_0600
     * @tc.name      testLayoutContract_006
     * @tc.desc      Verify that the upper-case states render the secondary letter of every key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLayoutContract_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutContract_006 begin');

      const state: number = KeyState.UPPER_CASE;
      const entries: keySourceListType[] = keySourceListData;

      for (let i = 0; i < entries.length; i++) {
        const item: keySourceListType = entries[i];
        const displayed: string = renderForState(state, item.content, item.upperContent);
        expect(item.upperContent).assertEqual(item.content.toUpperCase());
        expect(displayed).assertEqual(item.upperContent);
        expect(displayed.length).assertEqual(1);
      }

      expect(entries.length).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutContract_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_0100
     * @tc.name      testLayoutSliceMatrix_001
     * @tc.desc      Verify the key table splits into rows of ten, nine and seven entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSliceMatrix_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_001 begin');

      const lengthsSeen: number[] = [keySourceListData.slice(0, 10).length, keySourceListData.slice(10, 19).length, keySourceListData.slice(19, 26).length];
      expect(lengthsSeen.join('|')).assertEqual('10|9|7');
      expect(keySourceListData.length).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_0200
     * @tc.name      testLayoutSliceMatrix_002
     * @tc.desc      Verify the numeric table splits into rows of ten, ten and seven entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSliceMatrix_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_002 begin');

      const lengthsSeen: number[] = [numberSourceListData.slice(0, 10).length, numberSourceListData.slice(10, 20).length, numberSourceListData.slice(20, 27).length];
      expect(numberSourceListData[0].content).assertEqual('1');
      expect(lengthsSeen.join('|')).assertEqual('10|10|7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_0300
     * @tc.name      testLayoutSliceMatrix_003
     * @tc.desc      Verify the symbol table splits into rows of ten, ten and seven entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSliceMatrix_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_003 begin');

      const lengthsSeen: number[] = [symbolSourceListData.slice(0, 10).length, symbolSourceListData.slice(10, 20).length, symbolSourceListData.slice(20, 27).length];
      expect(symbolSourceListData[0].content.charCodeAt(0)).assertEqual(126);
      expect(lengthsSeen.join('|')).assertEqual('10|10|7');
      expect(symbolSourceListData[0].content).assertEqual('~');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_0400
     * @tc.name      testLayoutSliceMatrix_004
     * @tc.desc      Verify that adjacent key slices meet without gaps or overlap.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSliceMatrix_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_004 begin');

      const starts: number[] = [0, 10, 19];
      const ends: number[] = [10, 19, 26];
      for (let row = 0; row + 1 < starts.length; row++) {
        expect(starts[row]).assertLess(ends[row]);
        expect(ends[row]).assertEqual(starts[row + 1]);
      }
      expect(ends[ends.length - 1]).assertEqual(keySourceListData.length);

      expect(keySourceListData.length).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_0500
     * @tc.name      testLayoutSliceMatrix_005
     * @tc.desc      Verify that adjacent numeric slices meet without gaps or overlap.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSliceMatrix_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_005 begin');

      const starts: number[] = [0, 10, 20];
      const ends: number[] = [10, 20, 27];
      for (let row = 0; row + 1 < starts.length; row++) {
        expect(ends[row]).assertEqual(starts[row + 1]);
        expect(starts[row]).assertLess(ends[row]);
      }
      expect(ends[ends.length - 1]).assertEqual(numberSourceListData.length);

      expect(numberSourceListData.length).assertEqual(27);
      expect(numberSourceListData[0].content.charCodeAt(0)).assertEqual(49);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_0600
     * @tc.name      testLayoutSliceMatrix_006
     * @tc.desc      Verify that adjacent symbol slices meet without gaps or overlap.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSliceMatrix_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_006 begin');

      const starts: number[] = [0, 10, 20];
      const ends: number[] = [10, 20, 27];
      for (let row = 0; row + 1 < starts.length; row++) {
        expect(starts[row]).assertLess(ends[row]);
        expect(ends[row]).assertEqual(starts[row + 1]);
      }
      expect(ends[ends.length - 1]).assertEqual(symbolSourceListData.length);

      expect(symbolSourceListData[0].content.length).assertEqual(1);
      expect(symbolSourceListData.length).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_0700
     * @tc.name      testLayoutSliceMatrix_007
     * @tc.desc      Verify the first and last key entries of every row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSliceMatrix_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_007 begin');

      expect(keySourceListData[0].content).assertEqual('q');
      expect(keySourceListData[9].content).assertEqual('p');
      expect(keySourceListData[10].content).assertEqual('a');
      expect(keySourceListData[18].content).assertEqual('l');
      expect(keySourceListData[19].content).assertEqual('z');
      expect(keySourceListData[25].content).assertEqual('m');

      expect(keySourceListData.length).assertEqual(26);
      expect(keySourceListData[0].title).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_0800
     * @tc.name      testLayoutSliceMatrix_008
     * @tc.desc      Verify the first and last numeric entries of every row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSliceMatrix_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_008 begin');

      expect(numberSourceListData[9].content).assertEqual('0');
      expect(numberSourceListData[10].content).assertEqual('@');
      expect(numberSourceListData[19].content).assertEqual('/');
      expect(numberSourceListData[20].content).assertEqual('*');
      expect(numberSourceListData[26].content).assertEqual('?');
      expect(numberSourceListData[0].content).assertEqual('1');

      expect(numberSourceListData[0].content.charCodeAt(0)).assertEqual(49);
      expect(numberSourceListData.length).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_0900
     * @tc.name      testLayoutSliceMatrix_009
     * @tc.desc      Verify the first and last symbol entries of every row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSliceMatrix_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_009 begin');

      const edgeGlyphs: string[] = [symbolSourceListData[0].content,
        symbolSourceListData[19].content, symbolSourceListData[26].content];
      expect(edgeGlyphs.join('')).assertEqual('~,]');
      const edgeCodes: number[] = [symbolSourceListData[9].content.charCodeAt(0),
        symbolSourceListData[10].content.charCodeAt(0),
        symbolSourceListData[20].content.charCodeAt(0)];
      expect(edgeCodes.join('|')).assertEqual('8710|163|92');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_1000
     * @tc.name      testLayoutSliceMatrix_010
     * @tc.desc      Verify that a slice at the table end is empty rather than out of range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSliceMatrix_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_010 begin');

      const lengthsSeen: number[] = [keySourceListData.slice(26, 26).length, numberSourceListData.slice(27, 27).length, symbolSourceListData.slice(27, 27).length, keySourceListData.slice(0, 0).length, keySourceListData.slice(26, 100).length];
      expect(lengthsSeen.join('|')).assertEqual('0|0|0|0|0');      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_1100
     * @tc.name      testLayoutSliceMatrix_011
     * @tc.desc      Verify that a slice past the table end clamps to the available entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSliceMatrix_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_011 begin');

      const pastEnd: number = 100;
      const keyTailStart: number = 24;
      const numberTailStart: number = 25;
      const symbolTailStart: number = 26;
      const beyondStart: number = 30;
      const beyondEnd: number = 40;
      const zeroIndex: number = 0;
      expect(numberSourceListData.slice(numberTailStart, pastEnd).length).assertEqual(2);
      expect(symbolSourceListData.slice(symbolTailStart, pastEnd).length).assertEqual(1);
      expect(keySourceListData.slice(keyTailStart, pastEnd).length).assertEqual(2);

      expect(keySourceListData.slice(beyondStart, beyondEnd).length).assertEqual(0);
      expect(numberSourceListData.slice(zeroIndex, zeroIndex).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_1200
     * @tc.name      testLayoutSliceMatrix_012
     * @tc.desc      Verify that a slice keeps the source order of its entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSliceMatrix_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_012 begin');

      const row: keySourceListType[] = keySourceListData.slice(10, 19);
      for (let i = 0; i < row.length; i++) {
        expect(row[i]).assertEqual(keySourceListData[10 + i]);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_1300
     * @tc.name      testLayoutSliceMatrix_013
     * @tc.desc      Verify that a slice is a copy and does not shorten the source table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSliceMatrix_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_013 begin');

      const before: number = numberSourceListData.length;
      const row: sourceListType[] = numberSourceListData.slice(0, 10);
      expect(row.length).assertEqual(10);
      expect(numberSourceListData.length).assertEqual(before);
      expect(numberSourceListData[10].content).assertEqual('@');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_1400
     * @tc.name      testLayoutSliceMatrix_014
     * @tc.desc      Verify that the three row starts are the cumulative row lengths.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSliceMatrix_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_014 begin');

      const counts: number[] = [10, 9, 7];
      let cursor: number = 0;
      for (let i = 0; i < counts.length; i++) {
        expect(keySourceListData.slice(cursor, cursor + 1).length).assertEqual(1);
        cursor = cursor + counts[i];
      }
      expect(cursor).assertEqual(keySourceListData.length);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_1500
     * @tc.name      testLayoutSliceMatrix_015
     * @tc.desc      Verify that the numeric and symbol row starts follow the same cumulative rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSliceMatrix_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_015 begin');

      const counts: number[] = [10, 10, 7];
      let cursor: number = 0;
      let i: number = 0;
      while (i < counts.length) {
        expect(numberSourceListData.slice(cursor, cursor + counts[i]).length).assertEqual(counts[i]);
        expect(symbolSourceListData.slice(cursor, cursor + counts[i]).length).assertEqual(counts[i]);
        cursor = cursor + counts[i];
        i = i + 1;
      }
      expect(cursor).assertEqual(27);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_MATRIX_1600
     * @tc.name      testLayoutSliceMatrix_016
     * @tc.desc      Verify that a single-row slice contains exactly its first and last entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSliceMatrix_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_016 begin');

      const row: sourceListType[] = symbolSourceListData.slice(20, 27);
      expect(row.length).assertEqual(7);
      expect(row[0].content.charCodeAt(0)).assertEqual(92);
      expect(row[6].content).assertEqual(']');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSliceMatrix_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_RENDER_MATRIX_0100
     * @tc.name      testRenderMatrix_001
     * @tc.desc      Verify that the lower-case state renders the primary glyph of every key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRenderMatrix_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_001 begin');

      let i: number = 0;
      while (i < keySourceListData.length) {
        const item: keySourceListType = keySourceListData[i];
        expect(renderForState(KeyState.LOWER_CASE, item.content, item.upperContent)).assertEqual(item.content);
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_RENDER_MATRIX_0200
     * @tc.name      testRenderMatrix_002
     * @tc.desc      Verify that the once-upper state renders the secondary glyph of every key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRenderMatrix_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_002 begin');

      for (let i = 0; i < keySourceListData.length; i++) {
        const item: keySourceListType = keySourceListData[i];
        expect(renderForState(KeyState.ONCE_UPPER_CASE, item.content, item.upperContent))
          .assertEqual(item.upperContent);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_RENDER_MATRIX_0300
     * @tc.name      testRenderMatrix_003
     * @tc.desc      Verify that the upper-case state and the once-upper state render identically.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRenderMatrix_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_003 begin');

      let i: number = 0;
      while (i < keySourceListData.length) {
        const item: keySourceListType = keySourceListData[i];
        const once: string = renderForState(KeyState.ONCE_UPPER_CASE, item.content, item.upperContent);
        const upper: string = renderForState(KeyState.UPPER_CASE, item.content, item.upperContent);
        expect(upper).assertEqual(once);
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_RENDER_MATRIX_0400
     * @tc.name      testRenderMatrix_004
     * @tc.desc      Verify that an unknown state falls back to the secondary glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRenderMatrix_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_004 begin');

      const unknownStates: number[] = [3, 99, -1];
      for (let i = 0; i < unknownStates.length; i++) {
        expect(renderForState(unknownStates[i], 'a', 'A')).assertEqual('A');
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_RENDER_MATRIX_0500
     * @tc.name      testRenderMatrix_005
     * @tc.desc      Verify the numeric identity of the three key states through the render rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRenderMatrix_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_005 begin');

      expect(renderForState(2, 'x', 'X')).assertEqual('X');
      expect(KeyState.LOWER_CASE).assertEqual(0);
      expect(KeyState.ONCE_UPPER_CASE).assertEqual(1);
      expect(KeyState.UPPER_CASE).assertEqual(2);
      expect(renderForState(0, 'x', 'X')).assertEqual('x');
      expect(renderForState(1, 'x', 'X')).assertEqual('X');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_RENDER_MATRIX_0600
     * @tc.name      testRenderMatrix_006
     * @tc.desc      Verify the lower-case render row by row across the three layout rows.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRenderMatrix_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_006 begin');

      const starts: number[] = [0, 10, 19];
      const ends: number[] = [10, 19, 26];
      for (let row = 0; row < starts.length; row++) {
        for (let i = starts[row]; i < ends[row]; i++) {
          const item: keySourceListType = keySourceListData[i];
          expect(renderForState(KeyState.LOWER_CASE, item.content, item.upperContent)).assertEqual(item.content);
        }
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_RENDER_MATRIX_0700
     * @tc.name      testRenderMatrix_007
     * @tc.desc      Verify the upper-case render row by row across the three layout rows.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRenderMatrix_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_007 begin');

      const starts: number[] = [0, 10, 19];
      const ends: number[] = [10, 19, 26];
      let row: number = 0;
      while (row < starts.length) {
        for (let i = starts[row]; i < ends[row]; i++) {
          const item: keySourceListType = keySourceListData[i];
          expect(renderForState(KeyState.UPPER_CASE, item.content, item.upperContent))
              .assertEqual(item.upperContent);
        }
        row = row + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_RENDER_MATRIX_0800
     * @tc.name      testRenderMatrix_008
     * @tc.desc      Verify that number and symbol pages render their glyph unchanged in every state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRenderMatrix_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_008 begin');

      for (let i = 0; i < numberSourceListData.length; i++) {
        const glyph: string = numberSourceListData[i].content;
        expect(renderForState(KeyState.UPPER_CASE, glyph, glyph)).assertEqual(glyph);
        expect(renderForState(KeyState.LOWER_CASE, glyph, glyph)).assertEqual(glyph);
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        const glyph: string = symbolSourceListData[i].content;
        expect(renderForState(KeyState.UPPER_CASE, glyph, glyph)).assertEqual(glyph);
        expect(renderForState(KeyState.LOWER_CASE, glyph, glyph)).assertEqual(glyph);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_RENDER_MATRIX_0900
     * @tc.name      testRenderMatrix_009
     * @tc.desc      Verify that empty and non-Latin glyphs are rendered without transformation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRenderMatrix_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_009 begin');

      expect(renderForState(KeyState.LOWER_CASE, '中', '中')).assertEqual('中');
      expect(renderForState(KeyState.UPPER_CASE, '中', '中')).assertEqual('中');
      expect(renderForState(KeyState.LOWER_CASE, '', '')).assertEqual('');
      expect(renderForState(KeyState.UPPER_CASE, '', '')).assertEqual('');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_RENDER_MATRIX_1000
     * @tc.name      testRenderMatrix_010
     * @tc.desc      Verify that a state change only swaps the glyph and never alters its length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRenderMatrix_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_010 begin');

      for (let i = 0; i < keySourceListData.length; i++) {
        const item: keySourceListType = keySourceListData[i];
        const lower: string = renderForState(KeyState.LOWER_CASE, item.content, item.upperContent);
        const upper: string = renderForState(KeyState.UPPER_CASE, item.content, item.upperContent);
        expect(upper.length).assertEqual(1);
        expect(lower === upper).assertFalse();
        expect(lower.length).assertEqual(1);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_RENDER_MATRIX_1100
     * @tc.name      testRenderMatrix_011
     * @tc.desc      Verify the lower to upper to lower transition sequence on the same key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRenderMatrix_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_011 begin');

      const item: keySourceListType = keySourceListData[0];
      const first: string = renderForState(KeyState.LOWER_CASE, item.content, item.upperContent);
      const second: string = renderForState(KeyState.UPPER_CASE, item.content, item.upperContent);
      const third: string = renderForState(KeyState.LOWER_CASE, item.content, item.upperContent);
      expect(third).assertEqual(first);
      expect(first).assertEqual(item.content);
      expect(second).assertEqual(item.upperContent);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_RENDER_MATRIX_1200
     * @tc.name      testRenderMatrix_012
     * @tc.desc      Verify that the rendered upper glyph equals the alphabetical upper form for every key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRenderMatrix_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_012 begin');

      let checked: number = 0;
      for (let i = 0; i < keySourceListData.length; i++) {
        const item: keySourceListType = keySourceListData[i];
        const upper: string = renderForState(KeyState.UPPER_CASE, item.content, item.upperContent);
        expect(upper).assertEqual(item.content.toUpperCase());
        checked = checked + 1;
      }
      expect(checked).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testRenderMatrix_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_0100
     * @tc.name      testLayoutSlice_001
     * @tc.desc      Verify that the three row counts of every table add up to its total.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSlice_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_001 begin');

      // Row counts are an exact partition of the table, not an approximation.
      for (let t = 0; t < LAYOUT_TABLES.length; t++) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        let sum: number = 0;
        for (let r = 0; r < table.counts.length; r++) {
          sum = sum + table.counts[r];
        }
        expect(sum).assertEqual(table.total);
        expect(table.data.length).assertEqual(sum);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_0400
     * @tc.name      testLayoutSlice_004
     * @tc.desc      Verify that every table index belongs to exactly one row range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_004 begin');

      // Row ranges must not overlap, otherwise one entry would render twice.
      for (let t = 0; t < LAYOUT_TABLES.length; t++) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        for (let index = 0; index < table.data.length; index++) {
          let owners: number = 0;
          for (let r = 0; r < table.starts.length; r++) {
            if (index >= table.starts[r] && index < table.ends[r]) {
              owners = owners + 1;
            }
          }
          expect(owners).assertEqual(1);
        }
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_0500
     * @tc.name      testLayoutSlice_005
     * @tc.desc      Verify that concatenating the three rows reproduces the whole table in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_005 begin');

      // Reassembly is compared as one string so a misplaced entry is visible.
      for (let t = 0; t < LAYOUT_TABLES.length; t++) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        const rebuilt: string[] = [];
        for (let r = 0; r < table.starts.length; r++) {
          const row: sourceListType[] = table.data.slice(table.starts[r], table.ends[r]);
          for (let i = 0; i < row.length; i++) {
            rebuilt.push(row[i].content);
          }
        }
        const whole: string[] = [];
        for (let i = 0; i < table.data.length; i++) {
          whole.push(table.data[i].content);
        }
        expect(rebuilt.join('')).assertEqual(whole.join(''));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_0600
     * @tc.name      testLayoutSlice_006
     * @tc.desc      Verify that a slice whose bounds meet inside a table is empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_006 begin');

      // A zero-width window at the middle split yields no entry.
      for (let t = 0; t < LAYOUT_TABLES.length; t++) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        const empty: sourceListType[] = table.data.slice(table.starts[1], table.starts[1]);
        expect(empty.length).assertEqual(0);
        expect(empty.join()).assertEqual('');
      }
      expect(keySourceListData.slice(10, 10).length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_0700
     * @tc.name      testLayoutSlice_007
     * @tc.desc      Verify that a negative start selects the last seven slots of the alphabet page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_007 begin');

      // Negative bounds count from the tail, matching the seven-letter last row.
      const tail: keySourceListType[] = keySourceListData.slice(-7);
      expect(tail.length).assertEqual(7);
      expect(tail[0].content).assertEqual('z');
      expect(tail[6].content).assertEqual('m');
      expect(tail[6]).assertEqual(keySourceListData[25]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_0800
     * @tc.name      testLayoutSlice_008
     * @tc.desc      Verify that a start beyond the end yields no entries instead of an error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_008 begin');

      // Reversed bounds are clamped to an empty window.
      const reversed: sourceListType[] = numberSourceListData.slice(20, 5);
      const beyond: sourceListType[] = symbolSourceListData.slice(30, 40);
      expect(reversed.length).assertEqual(0);
      expect(beyond.length).assertEqual(0);
      expect(numberSourceListData.length).assertEqual(27);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_0900
     * @tc.name      testLayoutSlice_009
     * @tc.desc      Verify that an empty leading slice leaves the source table untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSlice_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_009 begin');

      // Taking nothing must not consume or shorten the table.
      const nothing: keySourceListType[] = keySourceListData.slice(0, 0);
      expect(nothing.length).assertEqual(0);
      expect(keySourceListData.length).assertEqual(26);
      expect(keySourceListData[0].content).assertEqual('q');
      expect(keySourceListData[25].content).assertEqual('m');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_1000
     * @tc.name      testLayoutSlice_010
     * @tc.desc      Verify that replacing a slot in a copied row does not change the source table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_010 begin');

      // The row view is an independent array; page data stays authoritative.
      const row: keySourceListType[] = keySourceListData.slice(0, 10);
      row[0] = { title: 'X', content: 'x', upperContent: 'X' };
      expect(row[0].content).assertEqual('x');
      expect(keySourceListData[0].content).assertEqual('q');
      expect(keySourceListData.length).assertEqual(26);
      expect(keySourceListData.slice(0, 10)[0].title).assertEqual('1');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_1100
     * @tc.name      testLayoutSlice_011
     * @tc.desc      Verify that a slice without bounds copies every table slot in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSlice_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_011 begin');

      // The unbounded slice is a full-length copy, not the same array instance.
      const copy: sourceListType[] = symbolSourceListData.slice(0);
      expect(copy.length).assertEqual(27);
      expect(copy === symbolSourceListData).assertFalse();
      let joined: string = '';
      for (let i = 0; i < copy.length; i++) {
        joined = joined + copy[i].content;
      }
      expect(joined.charCodeAt(0)).assertEqual(126);
      expect(joined.charCodeAt(26)).assertEqual(93);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_1200
     * @tc.name      testLayoutSlice_012
     * @tc.desc      Verify that excluding the final slot drops exactly one entry from the tail.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_012 begin');

      // A negative end counts from the tail and removes the bracket only.
      const trimmed: sourceListType[] = symbolSourceListData.slice(0, -1);
      expect(trimmed.length).assertEqual(26);
      expect(trimmed[25].content).assertEqual(String.fromCharCode(91));
      expect(symbolSourceListData[26].content).assertEqual(String.fromCharCode(93));
      let tailHits: number = 0;
      for (let i = 0; i < trimmed.length; i++) {
        if (trimmed[i].content === symbolSourceListData[26].content) {
          tailHits = tailHits + 1;
        }
      }
      expect(tailHits).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_1300
     * @tc.name      testLayoutSlice_013
     * @tc.desc      Verify that trimming both edges of a row slice equals the inner slice directly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_013 begin');

      // Nested slicing composes: eight entries trimmed to six match the direct six-entry window.
      const window: keySourceListType[] = keySourceListData.slice(1, 9);
      const inner: keySourceListType[] = window.slice(1, -1);
      const direct: keySourceListType[] = keySourceListData.slice(2, 8);
      expect(inner.length).assertEqual(6);
      expect(direct.length).assertEqual(inner.length);
      let innerText: string = '';
      for (let i = 0; i < inner.length; i++) {
        innerText = innerText + inner[i].content;
      }
      expect(innerText).assertEqual('ertyui');
      expect(direct[0]).assertEqual(inner[0]);
      expect(direct[5]).assertEqual(inner[5]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_1400
     * @tc.name      testLayoutSlice_014
     * @tc.desc      Verify that every alphabet entry has a single last position equal to its index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_014 begin');

      // Object identity is unique per slot, so lastIndexOf must agree with the forward index.
      for (let i = 0; i < keySourceListData.length; i++) {
        const entry: keySourceListType = keySourceListData[i];
        expect(keySourceListData.indexOf(entry)).assertEqual(i);
        expect(keySourceListData.lastIndexOf(entry)).assertEqual(i);
      }
      expect(keySourceListData.lastIndexOf(keySourceListData[25])).assertEqual(25);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_1500
     * @tc.name      testLayoutSlice_015
     * @tc.desc      Verify that applying the same render state twice is idempotent for every key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_015 begin');

      // Rendering is a pure selection, so a repeated pass cannot change the glyph.
      for (let i = 0; i < keySourceListData.length; i++) {
        const item: keySourceListType = keySourceListData[i];
        const lowerOnce: string = renderForState(KeyState.LOWER_CASE, item.content, item.upperContent);
        const lowerTwice: string = renderForState(KeyState.LOWER_CASE, lowerOnce, lowerOnce);
        const upperOnce: string = renderForState(KeyState.UPPER_CASE, item.content, item.upperContent);
        const upperTwice: string = renderForState(KeyState.UPPER_CASE, upperOnce, upperOnce);
        expect(lowerTwice).assertEqual(lowerOnce);
        expect(upperTwice).assertEqual(upperOnce);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_1600
     * @tc.name      testLayoutSlice_016
     * @tc.desc      Verify that a lower-upper-lower cycle restores the primary glyph on every key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_016 begin');

      // The render rule carries no hidden state between calls.
      let restored: number = 0;
      for (let i = 0; i < keySourceListData.length; i++) {
        const item: keySourceListType = keySourceListData[i];
        const first: string = renderForState(KeyState.LOWER_CASE, item.content, item.upperContent);
        const raised: string = renderForState(KeyState.ONCE_UPPER_CASE, item.content, item.upperContent);
        const back: string = renderForState(KeyState.LOWER_CASE, item.content, item.upperContent);
        expect(raised).assertEqual(item.upperContent);
        expect(back).assertEqual(first);
        expect(back).assertEqual(item.content);
        restored = restored + 1;
      }
      expect(restored).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_1700
     * @tc.name      testLayoutSlice_017
     * @tc.desc      Verify that no alphabet row stores its letters in ascending alphabetical order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_017 begin');

      // A sorted row would reveal a different layout, so each row must contain descents.
      for (let r = 0; r < 3; r++) {
        const start: number = LAYOUT_TABLES[0].starts[r];
        const end: number = LAYOUT_TABLES[0].ends[r];
        const row: keySourceListType[] = keySourceListData.slice(start, end);
        let descents: number = 0;
        for (let i = 1; i < row.length; i++) {
          if (row[i].content.charCodeAt(0) < row[i - 1].content.charCodeAt(0)) {
            descents = descents + 1;
          }
        }
        expect(descents > 0).assertTrue();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_1800
     * @tc.name      testLayoutSlice_018
     * @tc.desc      Verify the render branch chosen for page glyphs when the two arguments differ.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_018 begin');

      // Distinct arguments prove that the lower branch takes the first and the upper branch the last.
      for (let i = 0; i < numberSourceListData.length; i++) {
        const glyph: string = numberSourceListData[i].content;
        expect(renderForState(KeyState.LOWER_CASE, glyph, 'Z')).assertEqual(glyph);
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        const glyph: string = symbolSourceListData[i].content;
        expect(renderForState(KeyState.UPPER_CASE, 'Z', glyph)).assertEqual(glyph);
      }
      expect(numberSourceListData.length).assertEqual(symbolSourceListData.length);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_1900
     * @tc.name      testLayoutSlice_019
     * @tc.desc      Verify the final three slots of the symbol page in source order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSlice_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_019 begin');

      // The tail is the per-mille mark followed by the square bracket pair.
      const tail: sourceListType[] = symbolSourceListData.slice(24);
      expect(tail.length).assertEqual(3);
      expect(tail[0].content).assertEqual(String.fromCharCode(8453));
      expect(tail[1].content).assertEqual(String.fromCharCode(91));
      expect(tail[2].content).assertEqual(String.fromCharCode(93));
      expect(tail[2].content.charCodeAt(0) - tail[1].content.charCodeAt(0)).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_2100
     * @tc.name      testLayoutSlice_021
     * @tc.desc      Verify that an out-of-range negative end clamps the slice to empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_021 begin');

      // A negative end beyond the table length behaves like zero.
      const empty: sourceListType[] = numberSourceListData.slice(0, -30);
      expect(empty.length).assertEqual(0);
      expect(numberSourceListData.length).assertEqual(27);
      expect(numberSourceListData[0].content).assertEqual('1');
      expect(numberSourceListData[26].content).assertEqual('?');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_2200
     * @tc.name      testLayoutSlice_022
     * @tc.desc      Verify that a not-a-number state selects the secondary glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_022 begin');

      // NaN is not equal to the lower-case member, so the rule falls through to the upper glyph.
      const invalidState: number = Number.NaN;
      expect(invalidState === KeyState.LOWER_CASE).assertFalse();
      expect(renderForState(invalidState, 'q', 'Q')).assertEqual('Q');
      expect(renderForState(invalidState, String.fromCharCode(163), String.fromCharCode(163)))
          .assertEqual(String.fromCharCode(163));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_2300
     * @tc.name      testLayoutSlice_023
     * @tc.desc      Verify that each row first entry has no earlier occurrence and its last none later.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_023 begin');

      // Global position probes confirm that a row owns exactly its own slots.
      for (let t = 0; t < LAYOUT_TABLES.length; t++) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        for (let r = 0; r < table.starts.length; r++) {
          const first: sourceListType = table.data[table.starts[r]];
          const last: sourceListType = table.data[table.ends[r] - 1];
          expect(table.data.indexOf(first)).assertEqual(table.starts[r]);
          expect(table.data.lastIndexOf(last)).assertEqual(table.ends[r] - 1);
        }
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_023 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_2400
     * @tc.name      testLayoutSlice_024
     * @tc.desc      Verify that a row slice preserves the identity of the entries it copies.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_024 begin');

      // A value copy would break selection state keyed by entry reference.
      for (let t = 0; t < LAYOUT_TABLES.length; t++) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        const row: sourceListType[] = table.data.slice(table.starts[1], table.ends[1]);
        expect(row[0]).assertEqual(table.data[table.starts[1]]);
        expect(row[row.length - 1]).assertEqual(table.data[table.ends[1] - 1]);
      }
      const rowZero: sourceListType[] = keySourceListData.slice(0, 10);
      expect(rowZero[0]).assertEqual(keySourceListData[0]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_024 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_2500
     * @tc.name      testLayoutSlice_025
     * @tc.desc      Verify that the three layout tables are three separate array instances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_025 begin');

      // Sharing one backing array would let an edit on one page leak into another.
      expect(keySourceListData === numberSourceListData).assertFalse();
      expect(numberSourceListData === symbolSourceListData).assertFalse();
      expect(keySourceListData === symbolSourceListData).assertFalse();
      expect(keySourceListData.length).assertEqual(26);
      expect(numberSourceListData.length).assertEqual(27);
      expect(symbolSourceListData.length).assertEqual(27);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_025 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_2600
     * @tc.name      testLayoutSlice_026
     * @tc.desc      Verify that a negative start equal to the table length yields the whole alphabet page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_026 begin');

      // The negative bound is saturated at the table start rather than clamped to empty.
      const whole: keySourceListType[] = keySourceListData.slice(-26);
      expect(whole.length).assertEqual(26);
      expect(whole[0]).assertEqual(keySourceListData[0]);
      expect(whole[25]).assertEqual(keySourceListData[25]);
      expect(whole[0].content).assertEqual('q');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_026 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_2700
     * @tc.name      testLayoutSlice_027
     * @tc.desc      Verify that the three pages hold eighty distinct entry objects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_027 begin');

      // No entry object may be shared by two slots, or a key press would target two positions.
      const entries: Set<object> = new Set<object>();
      for (let i = 0; i < keySourceListData.length; i++) {
        entries.add(keySourceListData[i]);
      }
      for (let i = 0; i < numberSourceListData.length; i++) {
        entries.add(numberSourceListData[i]);
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        entries.add(symbolSourceListData[i]);
      }
      expect(entries.size).assertEqual(80);
      expect(keySourceListData.length + numberSourceListData.length + symbolSourceListData.length)
          .assertEqual(80);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_027 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_2800
     * @tc.name      testLayoutSlice_028
     * @tc.desc      Verify the slice length rule across starts at and beyond the table end.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_028 begin');

      // Length is the positive overlap of the requested window with the table bounds.
      const starts: number[] = [0, 5, 25, 26, 27];
      const ends: number[] = [0, 10, 27, 30];
      for (let s = 0; s < starts.length; s++) {
        for (let e = 0; e < ends.length; e++) {
          const row: sourceListType[] = keySourceListData.slice(starts[s], ends[e]);
          const from: number = Math.min(Math.max(starts[s], 0), 26);
          const to: number = Math.min(Math.max(ends[e], 0), 26);
          expect(row.length).assertEqual(Math.max(0, to - from));
        }
      }
      expect(starts.length * ends.length).assertEqual(20);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_028 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_2900
     * @tc.name      testLayoutSlice_029
     * @tc.desc      Verify that a slice from the last row start equals the last row of each table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_029 begin');

      // The unbounded end makes the final start and the explicit row window equivalent.
      for (let t = 0; t < LAYOUT_TABLES.length; t++) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        const tail: sourceListType[] = table.data.slice(table.starts[2]);
        const row: sourceListType[] = table.data.slice(table.starts[2], table.ends[2]);
        expect(tail.length).assertEqual(row.length);
        expect(tail.length).assertEqual(table.counts[2]);
        expect(tail[tail.length - 1]).assertEqual(row[row.length - 1]);
      }
      expect(symbolSourceListData.slice(20).length).assertEqual(7);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_029 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_3000
     * @tc.name      testLayoutSlice_030
     * @tc.desc      Verify that a head slice ending at the final row start excludes the tail row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_030 begin');

      // Cutting at the third start leaves exactly the first two rows in the head.
      for (let t = 0; t < LAYOUT_TABLES.length; t++) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        const head: sourceListType[] = table.data.slice(0, table.starts[2]);
        expect(head.length).assertEqual(table.counts[0] + table.counts[1]);
        expect(head.length).assertEqual(table.total - table.counts[2]);
        expect(head[head.length - 1]).assertEqual(table.data[table.starts[2] - 1]);
      }
      expect(keySourceListData.slice(0, 19).length).assertEqual(19);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_030 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_3100
     * @tc.name      testLayoutSlice_031
     * @tc.desc      Verify that the first and last rows of every table share no glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_031 begin');

      // Non-adjacent rows can collide without a boundary check noticing.
      for (let t = 0; t < LAYOUT_TABLES.length; t++) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        const first: Set<string> = new Set<string>();
        const head: sourceListType[] = table.data.slice(table.starts[0], table.ends[0]);
        for (let i = 0; i < head.length; i++) {
          first.add(head[i].content);
        }
        const tail: sourceListType[] = table.data.slice(table.starts[2], table.ends[2]);
        let shared: number = 0;
        for (let i = 0; i < tail.length; i++) {
          if (first.has(tail[i].content)) {
            shared = shared + 1;
          }
        }
        expect(shared).assertEqual(0);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_031 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_3200
     * @tc.name      testLayoutSlice_032
     * @tc.desc      Verify that the three first rows are pairwise disjoint across the three pages.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testLayoutSlice_032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_032 begin');

      // Switching pages swaps the entire first row, not just its opening glyph.
      const firstRows: Set<string>[] = [];
      for (let t = 0; t < LAYOUT_TABLES.length; t++) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        const row: Set<string> = new Set<string>();
        for (let i = table.starts[0]; i < table.ends[0]; i++) {
          row.add(table.data[i].content);
        }
        firstRows.push(row);
      }
      expect(firstRows.length).assertEqual(3);
      let overlaps: number = 0;
      for (let a = 0; a < firstRows.length; a++) {
        for (let b = a + 1; b < firstRows.length; b++) {
          firstRows[a].forEach((glyph: string) => {
            if (firstRows[b].has(glyph)) {
              overlaps = overlaps + 1;
            }
          });
        }
      }
      expect(overlaps).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_032 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_LAYOUT_SLICE_3300
     * @tc.name      testLayoutSlice_033
     * @tc.desc      Verify that row starts are strictly increasing and begin at zero on every table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testLayoutSlice_033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_033 begin');

      // A non-monotone start array would make slice windows overlap or reverse.
      for (let t = 0; t < LAYOUT_TABLES.length; t++) {
        const table: LayoutTable = LAYOUT_TABLES[t];
        expect(table.starts[0]).assertEqual(0);
        for (let r = 1; r < table.starts.length; r++) {
          expect(table.starts[r] > table.starts[r - 1]).assertTrue();
          expect(table.starts[r] < table.ends[r]).assertTrue();
        }
        expect(table.ends[table.ends.length - 1]).assertEqual(table.total);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayoutSlice_033 end');
      await yieldToEventLoop();
    });

  });
}
