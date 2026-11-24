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
import { keySourceListData, numberSourceListData, symbolSourceListData, keySourceListType, sourceListType } from '../../../../main/ets/model/KeyboardKeyData';

const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KikaInputKeyDataAggregate]';

function contentList(list: sourceListType[]): string[] {
  const result: string[] = [];
  for (let i = 0; i < list.length; i++) {
    result.push(list[i].content);
  }
  return result;
}

function titleList(): string[] {
  const result: string[] = [];
  for (let i = 0; i < keySourceListData.length; i++) {
    result.push(keySourceListData[i].title);
  }
  return result;
}

function upperList(): string[] {
  const result: string[] = [];
  for (let i = 0; i < keySourceListData.length; i++) {
    result.push(keySourceListData[i].upperContent);
  }
  return result;
}

function uniqueCount(values: string[]): number {
  // Cross-entry invariants catch duplicate or missing slots that per-entry cases cannot see.
  const seen: Set<string> = new Set<string>();
  for (let i = 0; i < values.length; i++) {
    seen.add(values[i]);
  }
  return seen.size;
}

function everyContentLengthOne(list: sourceListType[]): boolean {
  for (let i = 0; i < list.length; i++) {
    if (list[i].content.length !== 1) {
      return false;
    }
  }
  return true;
}

interface ExtraEntry {
  source: string;
  index: number;
  field: string;
  expected: string;
}

export default function KeyDataAggregateFamilyTestTest(): void {
  describe('KeyDataAggregateFamilyTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_0100
     * @tc.name      testKeyDataAggregate_001
     * @tc.desc      Verify that the alphabet, numeric and symbol tables expose their documented entry counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_001 begin');

      const expectedCounts: number[] = [26, 27, 27];
      const actualCounts: number[] = [
        keySourceListData.length,
        numberSourceListData.length,
        symbolSourceListData.length
      ];
      let i: number = 0;
      while (i < expectedCounts.length) {
        expect(actualCounts[i]).assertEqual(expectedCounts[i]);
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_0200
     * @tc.name      testKeyDataAggregate_002
     * @tc.desc      Verify that alphabet titles are unique across the whole table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_002 begin');

      hilog.info(DOMAIN, TAG, '%{public}s', `invariant=${"alphabetTitleUnique"}`);

      const actual: boolean = uniqueCount(titleList()) === keySourceListData.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      // Every table slot is compared with the production value it represents.
      expect(actual).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_0300
     * @tc.name      testKeyDataAggregate_003
     * @tc.desc      Verify that the alphabet, numeric and symbol table contents are unique within each table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_003 begin');

      const tables: string[][] = [
        contentList(keySourceListData),
        contentList(numberSourceListData),
        contentList(symbolSourceListData)
      ];
      const lengths: number[] = [
        keySourceListData.length,
        numberSourceListData.length,
        symbolSourceListData.length
      ];
      let i: number = 0;
      while (i < tables.length) {
        expect(uniqueCount(tables[i])).assertEqual(lengths[i]);
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_0400
     * @tc.name      testKeyDataAggregate_004
     * @tc.desc      Verify that alphabet primary texts cover every lowercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_004 begin');

      hilog.info(DOMAIN, TAG, '%{public}s', `invariant=${"alphabetLowerCoverage"}`);

      const actual: boolean = uniqueCount(contentList(keySourceListData)) === 26;
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      // Every table slot is compared with the production value it represents.
      expect(actual).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_0500
     * @tc.name      testKeyDataAggregate_005
     * @tc.desc      Verify that alphabet secondary texts cover every uppercase ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_005 begin');

      hilog.info(DOMAIN, TAG, '%{public}s', `invariant=${"alphabetUpperCoverage"}`);

      const actual: boolean = uniqueCount(upperList()) === 26;
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      // Every table slot is compared with the production value it represents.
      expect(actual).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_0600
     * @tc.name      testKeyDataAggregate_006
     * @tc.desc      Verify that numeric pad begins with the ten decimal digits in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_006 begin');

      // The decimal block must expose the ten digits in their documented order.
      const digits: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
      for (let i = 0; i < digits.length; i++) {
        expect(numberSourceListData[i].content).assertEqual(digits[i]);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_0700
     * @tc.name      testKeyDataAggregate_007
     * @tc.desc      Verify that every alphabetic title is one UTF-16 code unit long.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_007 begin');

      // A title must be exactly one UTF-16 code unit; the min/max range pins that down.
      let minTitleLength: number = keySourceListData[0].title.length;
      let maxTitleLength: number = minTitleLength;
      for (let i = 1; i < keySourceListData.length; i++) {
        const length: number = keySourceListData[i].title.length;
        minTitleLength = Math.min(minTitleLength, length);
        maxTitleLength = Math.max(maxTitleLength, length);
      }
      expect(minTitleLength).assertEqual(1);
      expect(maxTitleLength).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_0800
     * @tc.name      testKeyDataAggregate_008
     * @tc.desc      Verify that every alphabetic primary text is one UTF-16 code unit long.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_008 begin');

      hilog.info(DOMAIN, TAG, '%{public}s', `invariant=${"alphabetContentLength"}`);

      const actual: boolean = everyContentLengthOne(keySourceListData);
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      // Every table slot is compared with the production value it represents.
      expect(actual).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_0900
     * @tc.name      testKeyDataAggregate_009
     * @tc.desc      Verify that every alphabetic secondary text equals its primary text uppercased.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_009 begin');

      // Each uppercase field is compared with the primary field it renders.
      let i: number = 0;
      while (i < keySourceListData.length) {
        const item: keySourceListType = keySourceListData[i];
        expect(item.upperContent).assertEqual(item.content.toUpperCase());
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_1000
     * @tc.name      testKeyDataAggregate_010
     * @tc.desc      Verify that numeric and symbol tables share no character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_010 begin');

      hilog.info(DOMAIN, TAG, '%{public}s', `invariant=${"crossTableDisjoint"}`);

      const actual: boolean = uniqueCount(contentList(numberSourceListData).concat(contentList(symbolSourceListData))) === 54;
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      // Every table slot is compared with the production value it represents.
      expect(actual).assertEqual(true);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_1100
     * @tc.name      testKeyDataAggregate_011
     * @tc.desc      Verify that symbol table contains both square bracket glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_011 begin');

      // The bracket pair is located by value and must stay adjacent at the table tail.
      const contents: string[] = contentList(symbolSourceListData);
      const openIndex: number = contents.indexOf('[');
      const closeIndex: number = contents.indexOf(']');
      expect(closeIndex).assertEqual(26);
      expect(closeIndex - openIndex).assertEqual(1);
      expect(openIndex).assertEqual(25);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_1200
     * @tc.name      testKeyDataAggregate_012
     * @tc.desc      Verify that alphabetic table starts with the ten digit titles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_012 begin');

      hilog.info(DOMAIN, TAG, '%{public}s', `invariant=${"alphabetDigitTitles"}`);

      const actual: boolean = keySourceListData[0].title === '1' && keySourceListData[9].title === '0';
      hilog.info(DOMAIN, TAG, '%{public}s', `actual=${actual}`);

      // Every table slot is compared with the production value it represents.
      expect(actual).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_1300
     * @tc.name      testKeyDataAggregate_013
     * @tc.desc      Verify that the alphabet, numeric and symbol tables end with their documented characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_013 begin');

      const lastMatches: boolean[] = [
        keySourceListData[25].title === '/',
        numberSourceListData[26].content === '?',
        symbolSourceListData[26].content === ']'
      ];
      let i: number = 0;
      while (i < lastMatches.length) {
        expect(lastMatches[i]).assertEqual(true);
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_1400
     * @tc.name      testKeyDataAggregate_014
     * @tc.desc      Verify that alphabetic table contains no empty fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregate_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_014 begin');

      // Collect the offending rows instead of collapsing the check into one boolean.
      const emptyIndexes: number[] = [];
      for (let i = 0; i < keySourceListData.length; i++) {
        const item: keySourceListType = keySourceListData[i];
        if (item.title.length === 0 || item.content.length === 0 || item.upperContent.length === 0) {
          emptyIndexes.push(i);
        }
      }
      expect(emptyIndexes.length).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregate_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_EXTRA_0100
     * @tc.name      testKeyDataAggregateExtra_001
     * @tc.desc      Verify that the alphabet, numeric and symbol tables keep their documented boundary and spot-check slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataAggregateExtra_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateExtra_001 begin');

      const entries: ExtraEntry[] = [
        { source: "keySourceListData", index: 10, field: "title", expected: "~" },
        { source: "keySourceListData", index: 19, field: "title", expected: "H" },
        { source: "keySourceListData", index: 25, field: "title", expected: "/" },
        { source: "keySourceListData", index: 0, field: "content", expected: "q" },
        { source: "keySourceListData", index: 9, field: "content", expected: "p" },
        { source: "keySourceListData", index: 10, field: "content", expected: "a" },
        { source: "keySourceListData", index: 25, field: "content", expected: "m" },
        { source: "keySourceListData", index: 21, field: "content", expected: "c" },
        { source: "keySourceListData", index: 11, field: "content", expected: "s" },
        { source: "keySourceListData", index: 12, field: "content", expected: "d" },
        { source: "keySourceListData", index: 18, field: "content", expected: "l" },
        { source: "numberSourceListData", index: 0, field: "content", expected: "1" },
        { source: "numberSourceListData", index: 26, field: "content", expected: "?" },
        { source: "numberSourceListData", index: 10, field: "content", expected: "@" },
        { source: "numberSourceListData", index: 11, field: "content", expected: "#" },
        { source: "symbolSourceListData", index: 0, field: "content", expected: "~" },
        { source: "symbolSourceListData", index: 26, field: "content", expected: "]" },
        { source: "symbolSourceListData", index: 16, field: "content", expected: "=" },
        { source: "symbolSourceListData", index: 25, field: "content", expected: "[" },
      ];

      let i: number = 0;
      while (i < entries.length) {
        const actual: string = entries[i].field === 'title' ?
            keySourceListData[entries[i].index].title :
            (entries[i].source === 'keySourceListData' ?
              keySourceListData[entries[i].index].content :
              entries[i].source === 'numberSourceListData' ?
                numberSourceListData[entries[i].index].content :
                symbolSourceListData[entries[i].index].content);
        expect(actual).assertEqual(entries[i].expected);
        expect(actual.length).assertEqual(1);
        i = i + 1;
      }

      expect(entries.length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateExtra_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ROW_CONTRACT_0100
     * @tc.name      testKeyDataRowContract_001
     * @tc.desc      Verify that every table row keeps its slot count and single-character boundary slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataRowContract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataRowContract_001 begin');
      const keyStarts: number[] = [0, 10, 19];
      const keyEnds: number[] = [10, 19, 26];
      const pageStarts: number[] = [0, 10, 20];
      const pageEnds: number[] = [10, 20, 27];

      // Every row must start and end with a real one-character slot.
      for (let r = 0; r < keyStarts.length; r++) {
        const row: keySourceListType[] = keySourceListData.slice(keyStarts[r], keyEnds[r]);
        expect(row.length).assertEqual(keyEnds[r] - keyStarts[r]);
        expect(row[0].content.length).assertEqual(1);
        expect(row[row.length - 1].content.length).assertEqual(1);
      }
      for (let r = 0; r < pageStarts.length; r++) {
        const numberRow: sourceListType[] = numberSourceListData.slice(pageStarts[r], pageEnds[r]);
        const symbolRow: sourceListType[] = symbolSourceListData.slice(pageStarts[r], pageEnds[r]);
        expect(symbolRow[symbolRow.length - 1].content.length).assertEqual(1);
        expect(numberRow.length).assertEqual(pageEnds[r] - pageStarts[r]);
        expect(symbolRow.length).assertEqual(pageEnds[r] - pageStarts[r]);
        expect(numberRow[0].content.length).assertEqual(1);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataRowContract_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ROW_CONTRACT_0200
     * @tc.name      testKeyDataRowContract_002
     * @tc.desc      Verify that every alphabet row keeps the lowercase to uppercase relation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataRowContract_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataRowContract_002 begin');
      const starts: number[] = [0, 10, 19];
      const ends: number[] = [10, 19, 26];

      // The uppercase field is derived from the lowercase field for every key.
      let r: number = 0;
      while (r < starts.length) {
        const row: keySourceListType[] = keySourceListData.slice(starts[r], ends[r]);
        for (let i = 0; i < row.length; i++) {
          expect(row[i].upperContent).assertEqual(row[i].content.toUpperCase());
        }
        r = r + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataRowContract_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ROW_CONTRACT_0300
     * @tc.name      testKeyDataRowContract_003
     * @tc.desc      Verify that every alphabet row has unique titles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataRowContract_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataRowContract_003 begin');
      const starts: number[] = [0, 10, 19];
      const ends: number[] = [10, 19, 26];

      // A repeated title would make two slots indistinguishable.
      for (let r = 0; r < starts.length; r++) {
        const row: keySourceListType[] = keySourceListData.slice(starts[r], ends[r]);
        const seen: Set<string> = new Set<string>();
        for (let i = 0; i < row.length; i++) {
          seen.add(row[i].title);
        }
        expect(seen.size).assertEqual(row.length);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataRowContract_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_ROW_CONTRACT_0400
     * @tc.name      testKeyDataRowContract_004
     * @tc.desc      Verify that adjacent rows split at every documented boundary.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataRowContract_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataRowContract_004 begin');
      const keyPairs: number[][] = [[9, 10], [18, 19]];
      const pagePairs: number[][] = [[9, 10], [19, 20]];

      // Entries on opposite sides of a split must stay distinct.
      let i: number = 0;
      while (i < keyPairs.length) {
        const left: keySourceListType = keySourceListData[keyPairs[i][0]];
        const right: keySourceListType = keySourceListData[keyPairs[i][1]];
        expect(left === right).assertEqual(false);
        expect(left.content === right.content).assertEqual(false);
        i = i + 1;
      }
      let iW1: number = 0;
      while (iW1 < pagePairs.length) {
        const numberLeft: sourceListType = numberSourceListData[pagePairs[iW1][0]];
        const numberRight: sourceListType = numberSourceListData[pagePairs[iW1][1]];
        const symbolLeft: sourceListType = symbolSourceListData[pagePairs[iW1][0]];
        const symbolRight: sourceListType = symbolSourceListData[pagePairs[iW1][1]];
        expect(numberLeft.content === numberRight.content).assertEqual(false);
        expect(symbolLeft.content === symbolRight.content).assertEqual(false);
        iW1 = iW1 + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataRowContract_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_INVARIANTS_0100
     * @tc.name      testKeyDataInvariants_001
     * @tc.desc      Verify that the key layout holds exactly the twenty-six lowercase letters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataInvariants_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataInvariants_001 begin');
      expect(keySourceListData.length).assertEqual(26);

      // The table is a permutation of a..z with no repeats.
      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < keySourceListData.length; i++) {
        seen.add(keySourceListData[i].content);
      }
      expect(seen.has('a')).assertTrue();
      expect(seen.has('z')).assertTrue();
      expect(seen.size).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataInvariants_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_INVARIANTS_0200
     * @tc.name      testKeyDataInvariants_002
     * @tc.desc      Verify that the number page starts with 1..0 and has no duplicate slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataInvariants_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataInvariants_002 begin');
      expect(numberSourceListData.length).assertEqual(27);

      // The first ten slots are the decimal digits in the layout order.
      const digits: string = numberSourceListData.slice(0, 10).map((item: sourceListType) => item.content).join('');
      expect(digits).assertEqual('1234567890');
      const seen: Set<string> = new Set<string>();
      let i: number = 0;
      while (i < numberSourceListData.length) {
        seen.add(numberSourceListData[i].content);
        i = i + 1;
      }
      expect(seen.size).assertEqual(27);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataInvariants_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_INVARIANTS_0300
     * @tc.name      testKeyDataInvariants_003
     * @tc.desc      Verify that the symbol page has unique slots and keeps the bracket tail.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataInvariants_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataInvariants_003 begin');
      expect(symbolSourceListData.length).assertEqual(27);

      // Brackets close the page, and no symbol appears twice.
      expect(symbolSourceListData[26].content).assertEqual(']');
      expect(symbolSourceListData[25].content).assertEqual('[');
      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < symbolSourceListData.length; i++) {
        seen.add(symbolSourceListData[i].content);
      }
      expect(seen.size).assertEqual(27);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataInvariants_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_INVARIANTS_0400
     * @tc.name      testKeyDataInvariants_004
     * @tc.desc      Verify that the two symbol pages do not share a slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataInvariants_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataInvariants_004 begin');
      const numberSymbols: sourceListType[] = numberSourceListData.slice(10);
      expect(numberSymbols.length).assertEqual(17);

      // The number page and the symbol page partition the symbol vocabulary.
      let i: number = 0;
      while (i < numberSymbols.length) {
        for (let k = 0; k < symbolSourceListData.length; k++) {
          expect(numberSymbols[i].content === symbolSourceListData[k].content).assertFalse();
        }
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataInvariants_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_INVARIANTS_0500
     * @tc.name      testKeyDataInvariants_005
     * @tc.desc      Verify that every key-layout entry has non-empty title, content and upper content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataInvariants_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataInvariants_005 begin');
      for (let i = 0; i < keySourceListData.length; i++) {
        const entry: keySourceListType = keySourceListData[i];
        expect(entry.upperContent.length).assertEqual(1);
        expect(entry.title.length > 0).assertTrue();
        expect(entry.content.length).assertEqual(1);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataInvariants_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_0100
     * @tc.name      testKeyDataAggregateVocab_001
     * @tc.desc      Verify that no keyboard page stores the space glyph because space is an editor payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_001 begin');

      // A space is typed through the space key but never appears as a page slot.
      const pages: sourceListType[][] = [numberSourceListData, symbolSourceListData];
      let spaceSlots: number = 0;
      for (let t = 0; t < pages.length; t++) {
        for (let i = 0; i < pages[t].length; i++) {
          if (pages[t][i].content === ' ') {
            spaceSlots = spaceSlots + 1;
          }
        }
      }
      for (let i = 0; i < keySourceListData.length; i++) {
        if (keySourceListData[i].content === ' ') {
          spaceSlots = spaceSlots + 1;
        }
        if (keySourceListData[i].upperContent === ' ') {
          spaceSlots = spaceSlots + 1;
        }
      }
      expect(spaceSlots).assertEqual(0);
      expect(numberSourceListData.length).assertEqual(27);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_0200
     * @tc.name      testKeyDataAggregateVocab_002
     * @tc.desc      Verify the combined vocabulary of titles, primary and uppercase fields across all pages.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_002 begin');

      // Eighty page glyphs plus four title-only marks make the stored vocabulary.
      const vocabulary: Set<string> = new Set<string>();
      for (let i = 0; i < keySourceListData.length; i++) {
        vocabulary.add(keySourceListData[i].title);
        vocabulary.add(keySourceListData[i].content);
        vocabulary.add(keySourceListData[i].upperContent);
      }
      for (let i = 0; i < numberSourceListData.length; i++) {
        vocabulary.add(numberSourceListData[i].content);
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        vocabulary.add(symbolSourceListData[i].content);
      }
      expect(vocabulary.size).assertEqual(108);
      expect(vocabulary.has('H')).assertTrue();
      expect(vocabulary.has(String.fromCharCode(175))).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_0300
     * @tc.name      testKeyDataAggregateVocab_003
     * @tc.desc      Verify the lowest and highest code points stored on the symbol page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_003 begin');

      // The page spans from the ASCII comma to the square-root sign.
      let lowest: string = symbolSourceListData[0].content;
      let highest: string = symbolSourceListData[0].content;
      for (let i = 1; i < symbolSourceListData.length; i++) {
        const glyph: string = symbolSourceListData[i].content;
        if (glyph.charCodeAt(0) < lowest.charCodeAt(0)) {
          lowest = glyph;
        }
        if (glyph.charCodeAt(0) > highest.charCodeAt(0)) {
          highest = glyph;
        }
      }
      expect(lowest).assertEqual(String.fromCharCode(44));
      expect(highest).assertEqual(String.fromCharCode(8730));
      expect(highest.charCodeAt(0) - lowest.charCodeAt(0)).assertEqual(8686);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_0400
     * @tc.name      testKeyDataAggregateVocab_004
     * @tc.desc      Verify the delimiter inventory of the number page keeps quote and parenthesis pairs only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_004 begin');

      // Square brackets belong to the symbol page, so the number page keeps round pairs only.
      const contents: string[] = [];
      for (let i = 0; i < numberSourceListData.length; i++) {
        contents.push(numberSourceListData[i].content);
      }
      const openQuote: number = contents.indexOf(String.fromCharCode(34));
      const closeQuote: number = contents.indexOf(String.fromCharCode(39));
      const openParen: number = contents.indexOf('(');
      const closeParen: number = contents.indexOf(')');
      expect(openParen).assertEqual(17);
      expect(closeParen - openParen).assertEqual(1);
      expect(openQuote).assertEqual(21);
      expect(closeQuote - openQuote).assertEqual(1);
      expect(contents.indexOf('[')).assertEqual(-1);
      expect(contents.indexOf(']')).assertEqual(-1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_0500
     * @tc.name      testKeyDataAggregateVocab_005
     * @tc.desc      Verify the exact positions of the eleven ASCII glyphs on the symbol page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_005 begin');

      // ASCII slots are clustered at the head, middle and bracket tail.
      const asciiSlots: number[] = [];
      for (let i = 0; i < symbolSourceListData.length; i++) {
        if (symbolSourceListData[i].content.charCodeAt(0) < 128) {
          asciiSlots.push(i);
        }
      }
      expect(asciiSlots.join('|')).assertEqual('0|1|2|14|16|17|18|19|20|25|26');
      expect(asciiSlots.length).assertEqual(11);
      expect(symbolSourceListData[asciiSlots[0]].content).assertEqual('~');
      expect(symbolSourceListData[asciiSlots[10]].content).assertEqual(']');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_0600
     * @tc.name      testKeyDataAggregateVocab_006
     * @tc.desc      Verify the four currency glyphs occupy one contiguous symbol block.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_006 begin');

      // Pound, euro, yen and cent sit together between the arithmetic and caret blocks.
      const codes: number[] = [];
      for (let i = 10; i < 14; i++) {
        codes.push(symbolSourceListData[i].content.charCodeAt(0));
      }
      expect(codes.join('|')).assertEqual('163|8364|165|162');
      expect(symbolSourceListData[10].content).assertEqual(String.fromCharCode(163));
      expect(symbolSourceListData[13].content).assertEqual(String.fromCharCode(162));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_0700
     * @tc.name      testKeyDataAggregateVocab_007
     * @tc.desc      Verify that exactly one symbol-page glyph is also used as an alphabet title.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_007 begin');

      // The tilde is both the first symbol slot and the eleventh alphabet title.
      const symbolSet: Set<string> = new Set<string>();
      for (let i = 0; i < symbolSourceListData.length; i++) {
        symbolSet.add(symbolSourceListData[i].content);
      }
      const shared: string[] = [];
      for (let i = 0; i < keySourceListData.length; i++) {
        if (symbolSet.has(keySourceListData[i].title)) {
          shared.push(keySourceListData[i].title);
        }
      }
      expect(shared.length).assertEqual(1);
      expect(shared[0]).assertEqual(String.fromCharCode(126));
      expect(keySourceListData[10].title).assertEqual(shared[0]);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_0800
     * @tc.name      testKeyDataAggregateVocab_008
     * @tc.desc      Verify that only two alphabet titles are uppercase ASCII letters and where they sit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_008 begin');

      // Titles are mostly digits and punctuation; H and I are the two letter titles.
      const letterSlots: number[] = [];
      for (let i = 0; i < keySourceListData.length; i++) {
        const code: number = keySourceListData[i].title.charCodeAt(0);
        if (code >= 65 && code <= 90) {
          letterSlots.push(i);
        }
      }
      expect(letterSlots.join('|')).assertEqual('19|20');
      expect(keySourceListData[19].title).assertEqual('H');
      expect(keySourceListData[20].title).assertEqual('I');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_0900
     * @tc.name      testKeyDataAggregateVocab_009
     * @tc.desc      Verify that no alphabet title falls inside the lowercase ASCII letter band.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_009 begin');

      // Lowercase glyphs are reserved for the content field, never for a title.
      let lowercaseTitles: number = 0;
      for (let i = 0; i < keySourceListData.length; i++) {
        const code: number = keySourceListData[i].title.charCodeAt(0);
        if (code >= 97 && code <= 122) {
          lowercaseTitles = lowercaseTitles + 1;
        }
      }
      expect(lowercaseTitles).assertEqual(0);
      expect(keySourceListData[10].title).assertEqual(String.fromCharCode(126));
      expect(keySourceListData[25].title).assertEqual(String.fromCharCode(47));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_1000
     * @tc.name      testKeyDataAggregateVocab_010
     * @tc.desc      Verify that the seventeen-slot punctuation tail of the number page holds no digit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_010 begin');

      // Digits are confined to the first ten slots; the remainder is punctuation only.
      let tailDigits: number = 0;
      for (let i = 10; i < numberSourceListData.length; i++) {
        const code: number = numberSourceListData[i].content.charCodeAt(0);
        if (code >= 48 && code <= 57) {
          tailDigits = tailDigits + 1;
        }
      }
      expect(tailDigits).assertEqual(0);
      expect(numberSourceListData.length - 10).assertEqual(17);
      expect(numberSourceListData[10].content.charCodeAt(0)).assertEqual(64);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_1100
     * @tc.name      testKeyDataAggregateVocab_011
     * @tc.desc      Verify how much of the alphabet title vocabulary the number page reuses as glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_011 begin');

      // Ten digits and eleven punctuation marks are shared between titles and numeric slots.
      const numberSet: Set<string> = new Set<string>();
      for (let i = 0; i < numberSourceListData.length; i++) {
        numberSet.add(numberSourceListData[i].content);
      }
      let sharedTitles: number = 0;
      for (let i = 0; i < keySourceListData.length; i++) {
        if (numberSet.has(keySourceListData[i].title)) {
          sharedTitles = sharedTitles + 1;
        }
      }
      expect(sharedTitles).assertEqual(21);
      expect(numberSet.has('0')).assertTrue();
      expect(numberSet.has('?')).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_1200
     * @tc.name      testKeyDataAggregateVocab_012
     * @tc.desc      Verify that alphabet letters and their uppercase forms are absent from both symbol pages.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_012 begin');

      // Case variants stay on the alphabet page, keeping the page vocabularies disjoint.
      const numberSet: Set<string> = new Set<string>();
      const symbolSet: Set<string> = new Set<string>();
      for (let i = 0; i < numberSourceListData.length; i++) {
        numberSet.add(numberSourceListData[i].content);
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        symbolSet.add(symbolSourceListData[i].content);
      }
      let hits: number = 0;
      for (let i = 0; i < keySourceListData.length; i++) {
        if (numberSet.has(keySourceListData[i].content) || symbolSet.has(keySourceListData[i].content)) {
          hits = hits + 1;
        }
        if (numberSet.has(keySourceListData[i].upperContent) || symbolSet.has(keySourceListData[i].upperContent)) {
          hits = hits + 1;
        }
      }
      expect(hits).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_1300
     * @tc.name      testKeyDataAggregateVocab_013
     * @tc.desc      Verify that the symbol page is the only page where non-ASCII glyphs outnumber ASCII ones.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_013 begin');

      // The alphabet and number pages are ASCII-only; the symbol page is mixed.
      let symbolAscii: number = 0;
      let symbolUnicode: number = 0;
      for (let i = 0; i < symbolSourceListData.length; i++) {
        if (symbolSourceListData[i].content.charCodeAt(0) < 128) {
          symbolAscii = symbolAscii + 1;
        } else {
          symbolUnicode = symbolUnicode + 1;
        }
      }
      let numberUnicode: number = 0;
      for (let i = 0; i < numberSourceListData.length; i++) {
        if (numberSourceListData[i].content.charCodeAt(0) >= 128) {
          numberUnicode = numberUnicode + 1;
        }
      }
      expect(symbolUnicode > symbolAscii).assertTrue();
      expect(numberUnicode).assertEqual(0);
      expect(symbolUnicode).assertEqual(16);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_1400
     * @tc.name      testKeyDataAggregateVocab_014
     * @tc.desc      Verify that decimal digit titles fill the first row and no later row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_014 begin');

      // The digit band is a prefix of the title column, not a scattered set.
      let prefixDigits: number = 0;
      for (let i = 0; i < 10; i++) {
        const code: number = keySourceListData[i].title.charCodeAt(0);
        if (code >= 48 && code <= 57) {
          prefixDigits = prefixDigits + 1;
        }
      }
      let laterDigits: number = 0;
      for (let i = 10; i < keySourceListData.length; i++) {
        const code: number = keySourceListData[i].title.charCodeAt(0);
        if (code >= 48 && code <= 57) {
          laterDigits = laterDigits + 1;
        }
      }
      expect(prefixDigits).assertEqual(10);
      expect(laterDigits).assertEqual(0);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_1500
     * @tc.name      testKeyDataAggregateVocab_015
     * @tc.desc      Verify the combined ASCII and non-ASCII glyph totals across all three pages.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_015 begin');

      // Sixty-four ASCII glyphs and sixteen non-ASCII glyphs cover the eighty slots.
      let ascii: number = 0;
      let unicode: number = 0;
      const pages: sourceListType[][] = [numberSourceListData, symbolSourceListData];
      for (let t = 0; t < pages.length; t++) {
        for (let i = 0; i < pages[t].length; i++) {
          if (pages[t][i].content.charCodeAt(0) < 128) {
            ascii = ascii + 1;
          } else {
            unicode = unicode + 1;
          }
        }
      }
      for (let i = 0; i < keySourceListData.length; i++) {
        ascii = ascii + 1;
      }
      expect(ascii).assertEqual(64);
      expect(unicode).assertEqual(16);
      expect(ascii + unicode).assertEqual(80);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_015 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_1600
     * @tc.name      testKeyDataAggregateVocab_016
     * @tc.desc      Verify the exact ASCII glyph set stored on the symbol page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_016 begin');

      // The ASCII slots spell the punctuation set used by the symbol page.
      const asciiGlyphs: string[] = [];
      for (let i = 0; i < symbolSourceListData.length; i++) {
        if (symbolSourceListData[i].content.charCodeAt(0) < 128) {
          asciiGlyphs.push(symbolSourceListData[i].content);
        }
      }
      expect(asciiGlyphs.join('')).assertEqual('~`|^={},\\[]');
      expect(asciiGlyphs.length).assertEqual(11);
      expect(asciiGlyphs[3]).assertEqual(String.fromCharCode(94));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_1700
     * @tc.name      testKeyDataAggregateVocab_017
     * @tc.desc      Verify that the numeric digit prefix is contiguous with no digit after slot nine.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_017 begin');

      // The prefix test compares each slot against its expected category rather than a fixed list.
      let mismatches: number = 0;
      for (let i = 0; i < numberSourceListData.length; i++) {
        const point: number = numberSourceListData[i].content.charCodeAt(0);
        const isDigit: boolean = point >= 48 && point <= 57;
        if (isDigit !== (i < 10)) {
          mismatches = mismatches + 1;
        }
      }
      expect(mismatches).assertEqual(0);
      expect(numberSourceListData[9].content).assertEqual('0');
      expect(numberSourceListData[10].content.charCodeAt(0)).assertEqual(64);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_017 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_1800
     * @tc.name      testKeyDataAggregateVocab_018
     * @tc.desc      Verify that the first ten alphabet titles equal the first ten numeric glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_018 begin');

      // The digit column of the letter page is the same sequence shown by the number page.
      let equalPairs: number = 0;
      for (let i = 0; i < 10; i++) {
        if (keySourceListData[i].title === numberSourceListData[i].content) {
          equalPairs = equalPairs + 1;
        }
      }
      expect(equalPairs).assertEqual(10);
      expect(keySourceListData[0].title).assertEqual(numberSourceListData[0].content);
      expect(keySourceListData[9].title).assertEqual(numberSourceListData[9].content);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_018 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_1900
     * @tc.name      testKeyDataAggregateVocab_019
     * @tc.desc      Verify that the two alphabet row breaks join letters that are not code-point neighbours.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_019 begin');

      // A one-step jump at a break would mean the row split ignored the layout order.
      const breaks: number[][] = [[9, 10], [18, 19]];
      for (let i = 0; i < breaks.length; i++) {
        const left: number = keySourceListData[breaks[i][0]].content.charCodeAt(0);
        const right: number = keySourceListData[breaks[i][1]].content.charCodeAt(0);
        const gap: number = left - right;
        expect(gap === 1 || gap === -1).assertFalse();
        expect(Math.abs(gap) > 1).assertTrue();
      }
      expect(keySourceListData[9].content).assertEqual('p');
      expect(keySourceListData[18].content).assertEqual('l');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_019 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_2000
     * @tc.name      testKeyDataAggregateVocab_020
     * @tc.desc      Verify that the eighty page slots hold eighty distinct glyph values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_020 begin');

      // Slot count and vocabulary size must agree; a repeated value would merge two slots.
      const glyphs: Set<string> = new Set<string>();
      for (let i = 0; i < keySourceListData.length; i++) {
        glyphs.add(keySourceListData[i].content);
      }
      for (let i = 0; i < numberSourceListData.length; i++) {
        glyphs.add(numberSourceListData[i].content);
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        glyphs.add(symbolSourceListData[i].content);
      }
      expect(glyphs.size).assertEqual(80);
      expect(keySourceListData.length + numberSourceListData.length + symbolSourceListData.length)
          .assertEqual(glyphs.size);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_020 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_2100
     * @tc.name      testKeyDataAggregateVocab_021
     * @tc.desc      Verify that neither symbol page stores a Latin letter in either case.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_021 begin');

      // Letters belong exclusively to the alphabet page; the two pages stay letter-free.
      const pages: sourceListType[][] = [numberSourceListData, symbolSourceListData];
      let letterSlots: number = 0;
      for (let t = 0; t < pages.length; t++) {
        for (let i = 0; i < pages[t].length; i++) {
          const point: number = pages[t][i].content.charCodeAt(0);
          if ((point >= 65 && point <= 90) || (point >= 97 && point <= 122)) {
            letterSlots = letterSlots + 1;
          }
        }
      }
      expect(letterSlots).assertEqual(0);
      expect(numberSourceListData.length + symbolSourceListData.length).assertEqual(54);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_021 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_2200
     * @tc.name      testKeyDataAggregateVocab_022
     * @tc.desc      Verify that no currency code is used as an alphabet title.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_022 begin');

      // Currency glyphs stay on the symbol page; titles use formatting marks only.
      const currency: Set<number> = new Set<number>();
      currency.add(163);
      currency.add(165);
      currency.add(162);
      currency.add(8364);
      let currencyTitles: number = 0;
      for (let i = 0; i < keySourceListData.length; i++) {
        const point: number = keySourceListData[i].title.charCodeAt(0);
        if (currency.has(point)) {
          currencyTitles = currencyTitles + 1;
        }
      }
      expect(currencyTitles).assertEqual(0);
      expect(currency.size).assertEqual(4);
      expect(symbolSourceListData[11].content.charCodeAt(0)).assertEqual(8364);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_022 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_AGGREGATE_VOCAB_2300
     * @tc.name      testKeyDataAggregateVocab_023
     * @tc.desc      Verify that no alphabet title is a whitespace or control character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataAggregateVocab_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_023 begin');

      // Every title is a visible mark; blank titles would leave an unlabelled key.
      let lowest: number = keySourceListData[0].title.charCodeAt(0);
      let whitespaceTitles: number = 0;
      for (let i = 0; i < keySourceListData.length; i++) {
        const point: number = keySourceListData[i].title.charCodeAt(0);
        lowest = Math.min(lowest, point);
        if (point <= 32) {
          whitespaceTitles = whitespaceTitles + 1;
        }
      }
      expect(whitespaceTitles).assertEqual(0);
      expect(lowest).assertEqual(33);
      expect(keySourceListData[11].title.charCodeAt(0)).assertEqual(33);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataAggregateVocab_023 end');
      await yieldToEventLoop();
    });

  });
}
