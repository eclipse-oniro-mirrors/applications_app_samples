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
import { keySourceListData, keySourceListType, numberSourceListData, sourceListType, symbolSourceListData } from '../../../../main/ets/model/KeyboardKeyData';

const DOMAIN: number = 0xF814;

const TAG: string = '[Sample_KikaInputKeyDataCoverageMatrix]';

function uniqueContentCount(list: sourceListType[]): number {
  const seen: Set<string> = new Set<string>();
  for (let i = 0; i < list.length; i++) {
    seen.add(list[i].content);
  }
  return seen.size;
}

function isAscii(value: string): boolean {
  return value.length === 1 && value.charCodeAt(0) < 128;
}

export default function keyDataTypeFamilyTest(): void {
  describe('KeyDataTypeFamilyTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_0100
     * @tc.name      testKeyDataCoverageMatrix_001
     * @tc.desc      Verify the first key row pairs ten digit titles with q-to-p contents.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_001 begin');

      const titles: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
      const contents: string[] = ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'];
      let i: number = 0;
      while (i < 10) {
        expect(keySourceListData[i].title).assertEqual(titles[i]);
        expect(keySourceListData[i].content).assertEqual(contents[i]);
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_0200
     * @tc.name      testKeyDataCoverageMatrix_002
     * @tc.desc      Verify the second key row pairs nine symbol titles with a-to-l contents.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_002 begin');

      const titleCodes: number[] = [126, 33, 64, 35, 37, 39, 38, 42, 63];
      const contents: string[] = ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'];
      for (let i = 0; i < 9; i++) {
        expect(keySourceListData[10 + i].content).assertEqual(contents[i]);
        expect(keySourceListData[10 + i].title.charCodeAt(0)).assertEqual(titleCodes[i]);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_0300
     * @tc.name      testKeyDataCoverageMatrix_003
     * @tc.desc      Verify the third key row pairs seven symbol titles with z-to-m contents.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_003 begin');

      const titleCodes: number[] = [72, 73, 175, 95, 58, 59, 47];
      const contents: string[] = ['z', 'x', 'c', 'v', 'b', 'n', 'm'];
      let i: number = 0;
      while (i < 7) {
        expect(keySourceListData[19 + i].title.charCodeAt(0)).assertEqual(titleCodes[i]);
        expect(keySourceListData[19 + i].content).assertEqual(contents[i]);
        i = i + 1;
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_0400
     * @tc.name      testKeyDataCoverageMatrix_004
     * @tc.desc      Verify the three numeric rows have ten, ten and seven slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_004 begin');

      const lengthsSeen: number[] = [numberSourceListData.slice(0, 10).length, numberSourceListData.slice(10, 20).length, numberSourceListData.slice(20, 27).length];
      expect(lengthsSeen.join('|')).assertEqual('10|10|7');
      expect(numberSourceListData.length).assertEqual(27);

      expect(numberSourceListData[10].content).assertEqual('@');
      expect(numberSourceListData[20].content.charCodeAt(0)).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_0500
     * @tc.name      testKeyDataCoverageMatrix_005
     * @tc.desc      Verify the three symbol rows have ten, ten and seven slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_005 begin');

      const lengthsSeen: number[] = [symbolSourceListData.slice(0, 10).length, symbolSourceListData.slice(10, 20).length, symbolSourceListData.slice(20, 27).length];
      expect(lengthsSeen.join('|')).assertEqual('10|10|7');
      expect(symbolSourceListData.length).assertEqual(27);

      expect(symbolSourceListData[20].content.charCodeAt(0)).assertEqual(92);
      expect(symbolSourceListData[10].content.charCodeAt(0)).assertEqual(163);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_0700
     * @tc.name      testKeyDataCoverageMatrix_007
     * @tc.desc      Verify the second numeric row exposes the arithmetic symbols in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_007 begin');

      const symbols: string[] = ['@', '#', '$', '%', '&', '-', '+', '(', ')', '/'];
      for (let i = 0; i < symbols.length; i++) {
        expect(numberSourceListData[10 + i].content).assertEqual(symbols[i]);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_0800
     * @tc.name      testKeyDataCoverageMatrix_008
     * @tc.desc      Verify the third numeric row ends with the question mark.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_008 begin');

      expect(numberSourceListData[20].content).assertEqual('*');
      expect(numberSourceListData[26].content).assertEqual('?');
      expect(numberSourceListData[26].content.length).assertEqual(1);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_0900
     * @tc.name      testKeyDataCoverageMatrix_009
     * @tc.desc      Verify the first symbol row starts with tilde and ends with the delta sign.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_009 begin');

      expect(symbolSourceListData[9].content.charCodeAt(0)).assertEqual(8710);
      expect(symbolSourceListData[9].content.length).assertEqual(1);
      expect(symbolSourceListData[0].content).assertEqual('~');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_1000
     * @tc.name      testKeyDataCoverageMatrix_010
     * @tc.desc      Verify the second symbol row starts with the pound sign and ends with a comma.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_010 begin');

      expect(symbolSourceListData[19].content.length).assertEqual(1);
      expect(symbolSourceListData[10].content.charCodeAt(0)).assertEqual(163);
      expect(symbolSourceListData[19].content).assertEqual(',');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_1100
     * @tc.name      testKeyDataCoverageMatrix_011
     * @tc.desc      Verify the third symbol row ends with the square bracket pair.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_011 begin');

      expect(symbolSourceListData[20].content.charCodeAt(0)).assertEqual(92);
      expect(symbolSourceListData[25].content).assertEqual('[');
      expect(symbolSourceListData[26].content).assertEqual(']');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_1200
     * @tc.name      testKeyDataCoverageMatrix_012
     * @tc.desc      Verify that key contents are unique across the whole alphabet table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_012 begin');

      const seen: Set<string> = new Set<string>();
      let i: number = 0;
      while (i < keySourceListData.length) {
        const item: keySourceListType = keySourceListData[i];
        expect(seen.has(item.content)).assertFalse();
        seen.add(item.content);
        i = i + 1;
      }
      expect(seen.size).assertEqual(26);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_1300
     * @tc.name      testKeyDataCoverageMatrix_013
     * @tc.desc      Verify that numeric contents are unique across the whole pad.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_013 begin');

      expect(uniqueContentCount(numberSourceListData)).assertEqual(27);

      expect(numberSourceListData.length).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_1400
     * @tc.name      testKeyDataCoverageMatrix_014
     * @tc.desc      Verify that symbol contents are unique across the whole pad.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_014 begin');

      expect(uniqueContentCount(symbolSourceListData)).assertEqual(27);

      expect(symbolSourceListData[0].content).assertEqual('~');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_014 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_COVERAGE_MATRIX_1600
     * @tc.name      testKeyDataCoverageMatrix_016
     * @tc.desc      Verify that every key and pad title is a single UTF-16 code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataCoverageMatrix_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_016 begin');

      for (let i = 0; i < keySourceListData.length; i++) {
        expect(keySourceListData[i].title.length).assertEqual(1);
      }
      for (let i = 0; i < numberSourceListData.length; i++) {
        expect(numberSourceListData[i].content.length).assertEqual(1);
      }
      for (let i = 0; i < symbolSourceListData.length; i++) {
        expect(symbolSourceListData[i].content.length).assertEqual(1);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataCoverageMatrix_016 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_0100
     * @tc.name      testKeyDataTypeAxis_001
     * @tc.desc      Verify that every alphabet content is a single ASCII letter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataTypeAxis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_001 begin');
      let i: number = 0;
      while (i < keySourceListData.length) {
        const content: string = keySourceListData[i].content;
        expect(isAscii(content)).assertTrue();
        expect(content >= 'a' && content <= 'z').assertTrue();
        i = i + 1;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_0200
     * @tc.name      testKeyDataTypeAxis_002
     * @tc.desc      Verify that every number-page content is a single ASCII glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataTypeAxis_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_002 begin');
      for (let i = 0; i < numberSourceListData.length; i++) {
        expect(isAscii(numberSourceListData[i].content)).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_0300
     * @tc.name      testKeyDataTypeAxis_003
     * @tc.desc      Verify the split between ASCII and non-ASCII symbol glyphs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataTypeAxis_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_003 begin');
      let ascii: number = 0;
      let unicode: number = 0;
      let i: number = 0;
      while (i < symbolSourceListData.length) {
        if (isAscii(symbolSourceListData[i].content)) {
          ascii = ascii + 1;
          } else {
          unicode = unicode + 1;
        }
        i = i + 1;
      }
      expect(unicode).assertEqual(16);
      expect(ascii + unicode).assertEqual(27);
      expect(ascii).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_0400
     * @tc.name      testKeyDataTypeAxis_004
     * @tc.desc      Verify that every symbol glyph occupies one UTF-16 code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataTypeAxis_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_004 begin');
      for (let i = 0; i < symbolSourceListData.length; i++) {
        expect(symbolSourceListData[i].content.length).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_0500
     * @tc.name      testKeyDataTypeAxis_005
     * @tc.desc      Verify that every key title is a single code unit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataTypeAxis_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_005 begin');
      let i: number = 0;
      while (i < keySourceListData.length) {
        expect(keySourceListData[i].title.length).assertEqual(1);
        i = i + 1;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_005 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_0600
     * @tc.name      testKeyDataTypeAxis_006
     * @tc.desc      Verify the ASCII and non-ASCII split of key titles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataTypeAxis_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_006 begin');
      let ascii: number = 0;
      let unicode: number = 0;
      for (let i = 0; i < keySourceListData.length; i++) {
        if (isAscii(keySourceListData[i].title)) {
          ascii = ascii + 1;
        } else {
          unicode = unicode + 1;
        }
      }
      expect(unicode).assertEqual(1);
      expect(ascii).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_006 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_0700
     * @tc.name      testKeyDataTypeAxis_007
     * @tc.desc      Verify five documented non-ASCII code points in the symbol page.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataTypeAxis_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_007 begin');
      const codes: number[] = [];
      for (let i = 3; i < 8; i++) {
        codes.push(symbolSourceListData[i].content.charCodeAt(0));
      }
      expect(codes.join('|')).assertEqual('8226|8730|928|247|215');
      expect(codes.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_007 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_0800
     * @tc.name      testKeyDataTypeAxis_008
     * @tc.desc      Verify that the upper field of every key differs only by case.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataTypeAxis_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_008 begin');
      for (let i = 0; i < keySourceListData.length; i++) {
        expect(keySourceListData[i].upperContent === keySourceListData[i].content).assertEqual(false);
        expect(keySourceListData[i].upperContent).assertEqual(keySourceListData[i].content.toUpperCase());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_008 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_0900
     * @tc.name      testKeyDataTypeAxis_009
     * @tc.desc      Verify that all non-ASCII symbol glyphs are distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataTypeAxis_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_009 begin');
      const seen: Set<string> = new Set<string>();
      let i: number = 0;
      while (i < symbolSourceListData.length) {
        const content: string = symbolSourceListData[i].content;
        if (!isAscii(content)) {
          expect(seen.has(content)).assertFalse();
          seen.add(content);
        }
        i = i + 1;
      }
      expect(seen.size).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_009 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_1000
     * @tc.name      testKeyDataTypeAxis_010
     * @tc.desc      Verify that the number and symbol pages share no ASCII glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataTypeAxis_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_010 begin');
      for (let i = 0; i < numberSourceListData.length; i++) {
        const glyph: string = numberSourceListData[i].content;
        for (let j = 0; j < symbolSourceListData.length; j++) {
          expect(glyph === symbolSourceListData[j].content).assertFalse();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_010 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_1100
     * @tc.name      testKeyDataTypeAxis_011
     * @tc.desc      Verify that the number page has no empty or multi-unit glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataTypeAxis_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_011 begin');
      let i: number = 0;
      while (i < numberSourceListData.length) {
        expect(numberSourceListData[i].content.length).assertEqual(1);
        expect(numberSourceListData[i].content.length === 0).assertEqual(false);
        i = i + 1;
      }
      expect(numberSourceListData[0].content.charCodeAt(0)).assertEqual(49);
      expect(numberSourceListData[26].content.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_011 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_1200
     * @tc.name      testKeyDataTypeAxis_012
     * @tc.desc      Verify that the symbol page has no empty glyph.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataTypeAxis_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_012 begin');
      for (let i = 0; i < symbolSourceListData.length; i++) {
        expect(symbolSourceListData[i].content.length === 0).assertFalse();
        expect(symbolSourceListData[i].content.length).assertEqual(1);
      }
      expect(symbolSourceListData[26].content.charCodeAt(0)).assertEqual(93);
      expect(symbolSourceListData[0].content.charCodeAt(0)).assertEqual(126);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_012 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_1300
     * @tc.name      testKeyDataTypeAxis_013
     * @tc.desc      Verify that the alphabet page has no empty field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKeyDataTypeAxis_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_013 begin');
      let i: number = 0;
      while (i < keySourceListData.length) {
        expect(keySourceListData[i].upperContent.length === 0).assertFalse();
        expect(keySourceListData[i].title.length === 0).assertFalse();
        expect(keySourceListData[i].content.length === 0).assertFalse();
        i = i + 1;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_013 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_KEY_DATA_TYPE_AXIS_1400
     * @tc.name      testKeyDataTypeAxis_014
     * @tc.desc      Verify that the symbol page's non-ASCII glyphs are all above the ASCII ceiling.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testKeyDataTypeAxis_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_014 begin');
      for (let i = 0; i < symbolSourceListData.length; i++) {
        const codePoint: number = symbolSourceListData[i].content.charCodeAt(0);
        if (codePoint >= 128) {
          expect(codePoint <= 65535).assertEqual(true);
          expect(codePoint > 127).assertEqual(true);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataTypeAxis_014 end');
      await yieldToEventLoop();
    });

  });

}
