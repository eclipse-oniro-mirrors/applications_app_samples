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

import { describe, beforeAll, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { TEXT_COLOR } from '../../../../main/ets/muck/GameData';
import { BoardKit } from '../common/Game2048TestKit';

/** Suite name written to every log line produced by this file. */
const SUITE: string = 'tileColorMappingTest';
/** Colour of the empty cell, mirroring app.color.item_bg. */
const ITEM_BG: string = '#f0fff0';
/** Colour of the score text, mirroring app.color.score_color. */
const SCORE_COLOR: string = '#fcf8f5';
/** Text colour used for tiles whose value is four or less. */
const BLACK: string = '#000';
/** Natural logarithm of two, the divisor used by the production formula. */
const LOG_BASE: number = Math.log(2);
/** Largest tile value that still has a dedicated table entry. */
const LARGEST_MAPPED: number = 8192;
/** First power of two whose index falls outside the colour table. */
const FIRST_UNMAPPED: number = 16384;
/** Exponent of the largest mapped tile. */
const LAST_EXPONENT: number = 13;

/**
 * Alias of the production colour table exported by muck/GameData.ets.
 *
 * The suite must read the real export so that a formula assertion cannot
 * drift from the palette the page actually paints. Index zero is never
 * reached by a tile: empty cells use app.color.item_bg and the smallest
 * tile (two) already maps to index one.
 */
const TABLE: string[] = TEXT_COLOR;

/**
 * Pure mirror of the derivation rules in pages/Index.ets.
 *
 * The page computes `TEXT_COLOR[Math.log(data) / Math.log(2)]` for the tile
 * background and uses `data <= 4 ? black : score_colour` for the tile text.
 * Zero is special cased before the formula is reached, because the page
 * paints empty cells with app.color.item_bg.
 */
class TileColor {
  /**
   * Reproduces the index expression exactly as written by the page.
   * No flooring happens in production, so the raw quotient is returned.
   */
  static colorIndex(value: number): number {
    return Math.log(value) / LOG_BASE;
  }

  /**
   * Reads one entry the way an array index read behaves: a negative index, a
   * fractional index or an index past the end yields no entry at all.
   */
  static colorAt(index: number): string | undefined {
    if (index < 0 || index >= TABLE.length) {
      return undefined;
    }
    if (Math.floor(index) !== index) {
      return undefined;
    }
    return TABLE[index];
  }

  /**
   * Returns the background a tile would paint, or null when the page does not
   * consult the table (empty cells and values outside the mapped range).
   */
  static background(value: number): string | null {
    if (value === 0) {
      return null;
    }
    let index: number = TileColor.colorIndex(value);
    let entry: string | undefined = TileColor.colorAt(index);
    if (entry === undefined) {
      return null;
    }
    return entry;
  }

  /**
   * Reproduces the text colour ternary from the page.
   */
  static textColor(value: number): string {
    return value <= 4 ? BLACK : SCORE_COLOR;
  }
}

/**
 * 方块颜色派生规则测试套件。
 *
 * 页面把方块值 v 映射到 TEXT_COLOR[Math.log(v) / Math.log(2)]，并对 v<=4
 * 使用黑色文字、对 v>4 使用 score_color。本套件在测试内用纯函数镜像这两条
 * 派生规则，逐条固化索引与取色结果，且所有断言都不依赖 UI 渲染。
 */
export default function tileColorMappingTest() {
  describe('tileColorMappingTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log(SUITE, 'suite begin');
    });

    afterAll(() => {
      BoardKit.log(SUITE, 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_0100
     * @tc.name tileColorTwoMapsToIndexOne0100
     * @tc.desc Verify tile two resolves to table index one and its light beige colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_twoMapsToIndexOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(2);
      let color: string | null = TileColor.background(2);
      expect(index).assertEqual(1);
      expect(color).assertEqual('#eee3da');
      expect(TileColor.colorAt(index)).assertEqual('#eee3da');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_0200
     * @tc.name tileColorFourMapsToIndexTwo0200
     * @tc.desc Verify tile four resolves to table index two and its sand colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_fourMapsToIndexTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(4);
      let color: string | null = TileColor.background(4);
      expect(index).assertEqual(2);
      expect(color).assertEqual('#ede0c8');
      expect(color === TileColor.background(2)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_0300
     * @tc.name tileColorEightMapsToIndexThree0300
     * @tc.desc Verify tile eight resolves to table index three and its orange colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_eightMapsToIndexThree', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(8);
      let color: string | null = TileColor.background(8);
      expect(index).assertEqual(3);
      expect(color).assertEqual('#f2b179');
      expect(TileColor.colorAt(3)).assertEqual('#f2b179');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_0400
     * @tc.name tileColorSixteenMapsToIndexFour0400
     * @tc.desc Verify tile sixteen resolves to table index four and its deep orange colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_sixteenMapsToIndexFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(16);
      let color: string | null = TileColor.background(16);
      expect(index).assertEqual(4);
      expect(color).assertEqual('#f59563');
      expect(color === TileColor.background(8)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_0500
     * @tc.name tileColorThirtyTwoMapsToIndexFive0500
     * @tc.desc Verify tile thirty two resolves to table index five and its red orange colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_thirtyTwoMapsToIndexFive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(32);
      let color: string | null = TileColor.background(32);
      expect(index).assertEqual(5);
      expect(color).assertEqual('#f67c5f');
      expect(index > TileColor.colorIndex(16)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_0600
     * @tc.name tileColorSixtyFourMapsToIndexSix0600
     * @tc.desc Verify tile sixty four resolves to table index six and its vivid red colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_sixtyFourMapsToIndexSix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(64);
      let color: string | null = TileColor.background(64);
      expect(index).assertEqual(6);
      expect(color).assertEqual('#f65e3b');
      expect(TileColor.colorAt(6)).assertEqual('#f65e3b');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_0700
     * @tc.name tileColorOneTwentyEightMapsToIndexSeven0700
     * @tc.desc Verify tile one hundred twenty eight resolves to index seven and its yellow colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_oneTwentyEightMapsToIndexSeven', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(128);
      let color: string | null = TileColor.background(128);
      expect(index).assertEqual(7);
      expect(color).assertEqual('#edcf72');
      expect(index > TileColor.colorIndex(64)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_0800
     * @tc.name tileColorTwoFiftySixMapsToIndexEight0800
     * @tc.desc Verify tile two hundred fifty six resolves to index eight and its gold colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_twoFiftySixMapsToIndexEight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(256);
      let color: string | null = TileColor.background(256);
      expect(index).assertEqual(8);
      expect(color).assertEqual('#edcc61');
      expect(color === TileColor.background(128)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_0900
     * @tc.name tileColorFiveTwelveMapsToIndexNine0900
     * @tc.desc Verify tile five hundred twelve resolves to index nine and its shorthand green
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_fiveTwelveMapsToIndexNine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(512);
      let color: string | null = TileColor.background(512);
      expect(index).assertEqual(9);
      expect(color).assertEqual('#9c0');
      expect(TileColor.colorAt(9)).assertEqual('#9c0');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_1000
     * @tc.name tileColorOneThousandTwentyFourMapsToIndexTen1000
     * @tc.desc Verify tile one thousand twenty four resolves to index ten and its sky blue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_oneThousandTwentyFourMapsToIndexTen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(1024);
      let color: string | null = TileColor.background(1024);
      expect(index).assertEqual(10);
      expect(color).assertEqual('#33b5e5');
      expect(index > TileColor.colorIndex(512)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_1100
     * @tc.name tileColorTwoThousandFortyEightMapsToIndexEleven1100
     * @tc.desc Verify tile two thousand forty eight resolves to index eleven and its blue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_twoThousandFortyEightMapsToIndexEleven', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(2048);
      let color: string | null = TileColor.background(2048);
      expect(index).assertEqual(11);
      expect(color).assertEqual('#09c');
      expect(color === TileColor.background(1024)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_1200
     * @tc.name tileColorFourThousandNinetySixMapsToIndexTwelve1200
     * @tc.desc Verify tile four thousand ninety six resolves to index twelve and its violet
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_fourThousandNinetySixMapsToIndexTwelve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(4096);
      let color: string | null = TileColor.background(4096);
      expect(index).assertEqual(12);
      expect(color).assertEqual('#a6c');
      expect(TileColor.colorAt(12)).assertEqual('#a6c');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_1300
     * @tc.name tileColorEightThousandOneNinetyTwoMapsToIndexThirteen1300
     * @tc.desc Verify the largest mapped tile resolves to the last table entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_eightThousandOneNinetyTwoMapsToIndexThirteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(LARGEST_MAPPED);
      let color: string | null = TileColor.background(LARGEST_MAPPED);
      expect(index).assertEqual(13);
      expect(color).assertEqual('#93c');
      expect(LARGEST_MAPPED).assertEqual(Math.pow(2, LAST_EXPONENT));
      expect(TileColor.colorIndex(4096)).assertEqual(LAST_EXPONENT - 1);
      expect(TileColor.background(LARGEST_MAPPED)).assertEqual(TABLE[LAST_EXPONENT]);
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_1400
     * @tc.name tileColorIndexEqualsExponentForWholeTable1400
     * @tc.desc Verify every mapped power of two resolves to an index equal to its exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_indexEqualsExponentForWholeTable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let checked: number = 0;
      for (let exponent: number = 1; exponent <= LAST_EXPONENT; exponent++) {
        let value: number = Math.pow(2, exponent);
        let index: number = TileColor.colorIndex(value);
        expect(index).assertEqual(exponent);
        expect(TileColor.colorAt(index)).assertEqual(TABLE[exponent]);
        checked = checked + 1;
      }
      expect(checked).assertEqual(LAST_EXPONENT);
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_1500
     * @tc.name tileColorIndexIsExactIntegerForWholeTable1500
     * @tc.desc Verify the logarithm quotient is a whole number for every mapped power of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_indexIsExactIntegerForWholeTable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let exact: number = 0;
      for (let exponent: number = 1; exponent <= LAST_EXPONENT; exponent++) {
        let value: number = Math.pow(2, exponent);
        let index: number = TileColor.colorIndex(value);
        expect(Math.floor(index)).assertEqual(index);
        expect(TileColor.background(value)).assertEqual(TABLE[exponent]);
        exact = exact + 1;
      }
      expect(exact).assertEqual(LAST_EXPONENT);
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_1600
     * @tc.name tileColorIndexGrowsByOnePerDoubling1600
     * @tc.desc Verify doubling a tile always advances the index by exactly one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_indexGrowsByOnePerDoubling', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let steps: number = 0;
      let previous: number = TileColor.colorIndex(2);
      for (let exponent: number = 2; exponent <= LAST_EXPONENT; exponent++) {
        let current: number = TileColor.colorIndex(Math.pow(2, exponent));
        expect(current - previous).assertEqual(1);
        expect(current === previous).assertFalse();
        previous = current;
        steps = steps + 1;
      }
      expect(steps).assertEqual(LAST_EXPONENT - 1);
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_1700
     * @tc.name tileColorLookupMatchesBackgroundForWholeTable1700
     * @tc.desc Verify the table lookup and the background helper agree for every mapped tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_lookupMatchesBackgroundForWholeTable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let matched: number = 0;
      for (let exponent: number = 1; exponent <= LAST_EXPONENT; exponent++) {
        let value: number = Math.pow(2, exponent);
        let index: number = TileColor.colorIndex(value);
        let color: string | null = TileColor.background(value);
        expect(color).assertEqual(TileColor.colorAt(index));
        expect(color).assertEqual(TABLE[index]);
        matched = matched + 1;
      }
      expect(matched).assertEqual(LAST_EXPONENT);
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_1800
     * @tc.name tileColorTableHasFourteenEntries1800
     * @tc.desc Verify the table spans fourteen entries and the last tile lands on the final one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_tableHasFourteenEntries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TABLE.length).assertEqual(14);
      expect(TileColor.colorIndex(LARGEST_MAPPED)).assertEqual(TABLE.length - 1);
      expect(TileColor.colorAt(TABLE.length - 1)).assertEqual('#93c');
      expect(TileColor.colorIndex(4096)).assertEqual(TABLE.length - 2);
      expect(TileColor.background(4096)).assertEqual(TABLE[TABLE.length - 2]);
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_1900
     * @tc.name tileColorTableEntriesAreDistinct1900
     * @tc.desc Verify no two table entries share a colour so adjacent tiles stay distinguishable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_tableEntriesAreDistinct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let distinct: number = 0;
      for (let outer: number = 0; outer < TABLE.length; outer++) {
        let repeated: boolean = false;
        for (let inner: number = 0; inner < outer; inner++) {
          if (TABLE[outer] === TABLE[inner]) {
            repeated = true;
          }
        }
        expect(repeated).assertFalse();
        distinct = distinct + 1;
      }
      expect(distinct).assertEqual(14);
      expect(TileColor.colorAt(1) === TileColor.colorAt(2)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_2000
     * @tc.name tileColorTableUsesHashPrefix2000
     * @tc.desc Verify every table entry is a hash prefixed colour literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_tableUsesHashPrefix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let prefixed: number = 0;
      for (let index: number = 0; index < TABLE.length; index++) {
        expect(TABLE[index]).assertContain(['#']);
        prefixed = prefixed + 1;
      }
      expect(prefixed).assertEqual(14);
      expect(TileColor.background(4)).assertEqual('#ede0c8');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_2100
     * @tc.name tileColorTableMixesLongAndShortHex2100
     * @tc.desc Verify ten entries use six digit hex and four entries use shorthand hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_tableMixesLongAndShortHex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let longForm: number = 0;
      let shortForm: number = 0;
      for (let index: number = 0; index < TABLE.length; index++) {
        if (TABLE[index].length === 7) {
          longForm = longForm + 1;
        } else if (TABLE[index].length === 4) {
          shortForm = shortForm + 1;
        }
      }
      expect(longForm).assertEqual(10);
      expect(shortForm).assertEqual(4);
      expect(TileColor.background(512) === '#9c0').assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_2200
     * @tc.name tileColorFirstEntryEqualsEmptyCellBackground2200
     * @tc.desc Verify index zero repeats the empty cell colour and is therefore invisible to tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_firstEntryEqualsEmptyCellBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TABLE[0]).assertEqual(ITEM_BG);
      expect(TileColor.colorAt(0)).assertEqual(ITEM_BG);
      expect(TileColor.background(2)).assertEqual('#eee3da');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_2300
     * @tc.name tileColorIndexOneIsZero2300
     * @tc.desc Verify value one lands on index zero, a slot no real tile ever occupies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_indexOneIsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(1);
      expect(index).assertEqual(0);
      expect(TileColor.colorAt(index)).assertEqual(ITEM_BG);
      expect(TileColor.background(2)).assertEqual('#eee3da');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_2400
     * @tc.name tileColorIndexZeroIsNegative2400
     * @tc.desc Verify zero would produce a negative index, which is why the page short circuits it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_indexZeroIsNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(0);
      expect(index < 0).assertTrue();
      expect(TileColor.background(0)).assertNull();
      expect(TileColor.colorAt(index)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_2500
     * @tc.name tileColorZeroHasNoTableBackground2500
     * @tc.desc Verify an empty cell resolves to no table colour and is painted by item_bg instead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_zeroHasNoTableBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileColor.background(0)).assertNull();
      expect(TileColor.colorAt(TileColor.colorIndex(0))).assertUndefined();
      expect(TileColor.background(2) === null).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_2600
     * @tc.name tileColorZeroTextColorIsBlack2600
     * @tc.desc Verify the text rule keeps zero on the black branch even though its cell is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_zeroTextColorIsBlack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileColor.textColor(0)).assertEqual(BLACK);
      expect(TileColor.textColor(0) === SCORE_COLOR).assertFalse();
      expect(TileColor.background(0)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_2700
     * @tc.name tileColorThreeHasFractionalIndex2700
     * @tc.desc Verify a value that is not a power of two produces a fractional index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_threeHasFractionalIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(3);
      expect(index > 1).assertTrue();
      expect(index < 2).assertTrue();
      expect(Math.floor(index) === index).assertFalse();
      expect(TileColor.colorAt(index)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_2800
     * @tc.name tileColorFractionalIndexTruncatesToLowerTile2800
     * @tc.desc Verify flooring a fractional index lands on the entry of the lower neighbouring tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_fractionalIndexTruncatesToLowerTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(3);
      let lower: number = Math.floor(index);
      expect(lower).assertEqual(TileColor.colorIndex(2));
      expect(TileColor.colorAt(lower)).assertEqual('#eee3da');
      expect(TileColor.colorAt(lower)).assertEqual(TileColor.background(2));
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_2900
     * @tc.name tileColorFractionalIndexHasNoSwatch2900
     * @tc.desc Verify the background helper refuses a fractional index instead of rounding it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_fractionalIndexHasNoSwatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileColor.background(3)).assertNull();
      expect(TileColor.colorAt(TileColor.colorIndex(3))).assertUndefined();
      expect(TileColor.background(2) === null).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_3000
     * @tc.name tileColorLastValidIndexIsTableEnd3000
     * @tc.desc Verify index thirteen is both the largest mapped index and the final table slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_lastValidIndexIsTableEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(LARGEST_MAPPED);
      expect(index).assertEqual(TABLE.length - 1);
      expect(TileColor.colorAt(index)).assertEqual('#93c');
      expect(index < TABLE.length).assertTrue();
      expect(TileColor.background(LARGEST_MAPPED)).assertEqual(TileColor.colorAt(TABLE.length - 1));
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_3100
     * @tc.name tileColorSixteenThousandIndexIsFourteen3100
     * @tc.desc Verify the first tile beyond the table computes index fourteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_sixteenThousandIndexIsFourteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(FIRST_UNMAPPED);
      expect(index).assertEqual(14);
      expect(TileColor.background(FIRST_UNMAPPED) === null).assertTrue();
      expect(TileColor.colorAt(index)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_3200
     * @tc.name tileColorThirtyTwoThousandIndexIsFifteen3200
     * @tc.desc Verify two further doublings keep advancing the index beyond the table
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_thirtyTwoThousandIndexIsFifteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(32768);
      expect(index).assertEqual(15);
      expect(index > TABLE.length).assertTrue();
      expect(TileColor.colorAt(index)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_3300
     * @tc.name tileColorBeyondTableLookupIsUndefined3300
     * @tc.desc Verify reading index fourteen yields no entry because the table ends at thirteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_beyondTableLookupIsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileColor.colorAt(14)).assertUndefined();
      expect(TileColor.colorAt(TileColor.colorIndex(FIRST_UNMAPPED))).assertUndefined();
      expect(TileColor.colorAt(13)).assertEqual('#93c');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_3400
     * @tc.name tileColorBeyondTableBackgroundIsNull3400
     * @tc.desc Verify a tile beyond the table has no background colour at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_beyondTableBackgroundIsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileColor.background(FIRST_UNMAPPED)).assertNull();
      expect(TileColor.background(FIRST_UNMAPPED) === null).assertTrue();
      expect(TileColor.background(LARGEST_MAPPED)).assertEqual('#93c');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_3500
     * @tc.name tileColorUnmappedDiffersFromLastMapped3500
     * @tc.desc Verify the unmapped tile never falls back to the last table colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_unmappedDiffersFromLastMapped', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lastMapped: string | null = TileColor.background(LARGEST_MAPPED);
      let unmapped: string | null = TileColor.background(FIRST_UNMAPPED);
      expect(lastMapped === unmapped).assertFalse();
      expect(lastMapped !== unmapped).assertTrue();
      expect(unmapped).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_3600
     * @tc.name tileColorFarBeyondTableIsUndefined3600
     * @tc.desc Verify an index past the table end yields no entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_farBeyondTableIsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let misses: number = 0;
      for (let index: number = 14; index <= 17; index++) {
        expect(TileColor.colorAt(index)).assertUndefined();
        misses = misses + 1;
      }
      expect(misses).assertEqual(4);
      expect(TileColor.background(Math.pow(2, 20))).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_3700
     * @tc.name tileColorNegativeIndexIsUndefined3700
     * @tc.desc Verify a negative index yields no entry instead of wrapping to the table end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_negativeIndexIsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileColor.colorAt(-1)).assertUndefined();
      expect(TileColor.colorAt(-1) === TileColor.colorAt(0)).assertFalse();
      expect(TileColor.background(4)).assertEqual('#ede0c8');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_3800
     * @tc.name tileColorTextBlackForSmallTiles3800
     * @tc.desc Verify tiles two and four use black text rather than the score colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_textBlackForSmallTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileColor.textColor(2)).assertEqual(BLACK);
      expect(TileColor.textColor(4)).assertEqual(BLACK);
      expect(TileColor.textColor(2) === SCORE_COLOR).assertFalse();
      expect(TileColor.background(2)).assertEqual('#eee3da');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_3900
     * @tc.name tileColorTextBoundaryFourVersusEight3900
     * @tc.desc Verify the text colour switches exactly between four and eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_textBoundaryFourVersusEight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileColor.textColor(4)).assertEqual(BLACK);
      expect(TileColor.textColor(8)).assertEqual(SCORE_COLOR);
      expect(TileColor.textColor(4) === TileColor.textColor(8)).assertFalse();
      expect(TileColor.colorIndex(8) - TileColor.colorIndex(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_4000
     * @tc.name tileColorTextScoreColorForIntermediateTile4000
     * @tc.desc Verify an intermediate tile above four uses the score colour for its text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_textScoreColorForIntermediateTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(1024);
      expect(index).assertEqual(10);
      expect(TileColor.background(1024)).assertEqual('#33b5e5');
      expect(TileColor.textColor(1024)).assertEqual(SCORE_COLOR);
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_4100
     * @tc.name tileColorTextRuleAcrossWholeTable4100
     * @tc.desc Verify only two and four take black text while the other eleven tiles take the score colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_textRuleAcrossWholeTable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let blackCount: number = 0;
      let lightCount: number = 0;
      for (let exponent: number = 1; exponent <= LAST_EXPONENT; exponent++) {
        let value: number = Math.pow(2, exponent);
        if (TileColor.textColor(value) === BLACK) {
          blackCount = blackCount + 1;
        } else {
          lightCount = lightCount + 1;
        }
      }
      expect(blackCount).assertEqual(2);
      expect(lightCount).assertEqual(11);
      expect(blackCount + lightCount).assertEqual(LAST_EXPONENT);
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_4200
     * @tc.name tileColorTextPaletteDisjointFromTilePalette4200
     * @tc.desc Verify the text colours never appear among the tile background colours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_textPaletteDisjointFromTilePalette', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let disjoint: number = 0;
      for (let index: number = 0; index < TABLE.length; index++) {
        expect(TABLE[index] === BLACK).assertFalse();
        expect(TABLE[index] === SCORE_COLOR).assertFalse();
        disjoint = disjoint + 1;
      }
      expect(disjoint).assertEqual(14);
      expect(TileColor.background(16)).assertEqual('#f59563');
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_4300
     * @tc.name tileColorTextDefinedBeyondTable4300
     * @tc.desc Verify text colour still resolves for a tile that has no table background
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_textDefinedBeyondTable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileColor.background(FIRST_UNMAPPED)).assertNull();
      expect(TileColor.textColor(FIRST_UNMAPPED)).assertEqual(SCORE_COLOR);
      expect(TileColor.textColor(FIRST_UNMAPPED) === BLACK).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_4400
     * @tc.name tileColorBackgroundAndTextAreIndependent4400
     * @tc.desc Verify the two derivation rules answer different questions for the same tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_backgroundAndTextAreIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileColor.background(2)).assertEqual('#eee3da');
      expect(TileColor.textColor(2)).assertEqual(BLACK);
      expect(TileColor.background(8)).assertEqual('#f2b179');
      expect(TileColor.textColor(8)).assertEqual(SCORE_COLOR);
      expect(TileColor.background(2) === TileColor.textColor(2)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_4500
     * @tc.name tileColorSameValueResolvesStably4500
     * @tc.desc Verify repeated lookups of one tile value return identical index and colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_sameValueResolvesStably', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let samples: number[] = [2, 1024, LARGEST_MAPPED];
      let stable: number = 0;
      for (let index: number = 0; index < samples.length; index++) {
        let value: number = samples[index];
        let firstIndex: number = TileColor.colorIndex(value);
        let secondIndex: number = TileColor.colorIndex(value);
        let firstColor: string | null = TileColor.background(value);
        let secondColor: string | null = TileColor.background(value);
        expect(firstIndex).assertEqual(secondIndex);
        expect(firstColor).assertEqual(secondColor);
        expect(firstColor).assertEqual(TileColor.colorAt(firstIndex));
        stable = stable + 1;
      }
      expect(stable).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_4600
     * @tc.name tileColorNegativeValuesHaveNoEntry4600
     * @tc.desc Verify a negative value never produces an index or a table colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_negativeValuesHaveNoEntry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = TileColor.colorIndex(-2);
      expect(index !== index).assertTrue();
      expect(TileColor.colorAt(index)).assertUndefined();
      expect(TileColor.background(-2)).assertNull();
      expect(TileColor.textColor(-2)).assertEqual(BLACK);
    });

    /**
     * @tc.number SUB_GAME2048_TILECOLORMAPPING_4700
     * @tc.name tileColorFractionalIndexAdvancesWithDoubling4700
     * @tc.desc Verify doubling a value that is not a power of two still advances the index by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileColor_fractionalIndexAdvancesWithDoubling', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let threeIndex: number = TileColor.colorIndex(3);
      let sixIndex: number = TileColor.colorIndex(6);
      expect(sixIndex > threeIndex).assertTrue();
      expect(sixIndex - threeIndex > 0.99).assertTrue();
      expect(sixIndex - threeIndex < 1.01).assertTrue();
      expect(Math.floor(threeIndex)).assertEqual(1);
      expect(Math.floor(sixIndex)).assertEqual(2);
      expect(TileColor.colorAt(threeIndex)).assertUndefined();
      expect(TileColor.background(6)).assertNull();
    });
  });
}
