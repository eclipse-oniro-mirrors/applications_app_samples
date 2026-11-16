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

/** Number of entries in the palette exported by the constant module. */
const PALETTE_SIZE: number = 14;
/** Index of the entry used by the largest tile the palette can colour. */
const LAST_INDEX: number = 13;
/** Index of the spare entry that no power of two tile reaches. */
const SPARE_INDEX: number = 0;

/**
 * 调色板 TEXT_COLOR 契约测试套件。
 *
 * Index.ets 用 `TEXT_COLOR[(Math.log(data) / Math.log(2))]` 给非空格子取背景色，
 * 所以「下标 n 对应棋子 2^n」是页面与常量模块之间的隐式契约：下标 1 是 2、
 * 下标 11 是 2048、下标 13 是 8192，下标 0 是没有任何棋子会用到的备用位。
 * 本套件逐项固化容量、逐索引精确值、十六进制格式、唯一性与只读性。
 */

/**
 * Derives the palette index the page computes for one tile value.
 * The power of two is halved until it reaches one, which keeps the result an
 * exact integer for every tile between 2 and 8192.
 */
function paletteIndexOfTile(tile: number): number {
  if (tile < 2) {
    return SPARE_INDEX;
  }
  let remaining: number = tile;
  let index: number = 0;
  while (remaining > 1) {
    remaining = remaining / 2;
    index = index + 1;
  }
  return index;
}

/**
 * Checks one entry against the CSS colour subset the page uses:
 * '#' plus either three or six lowercase hexadecimal digits.
 */
function isHexColor(value: string): boolean {
  if (value.length !== 4 && value.length !== 7) {
    return false;
  }
  if (value.charAt(0) !== '#') {
    return false;
  }
  for (let index: number = 1; index < value.length; index++) {
    let code: number = value.charCodeAt(index);
    let isDigit: boolean = code >= 48 && code <= 57;
    let isLowerHexLetter: boolean = code >= 97 && code <= 102;
    if (!(isDigit || isLowerHexLetter)) {
      return false;
    }
  }
  return true;
}

/** Counts the entries whose string length equals the requested length. */
function countWithLength(values: string[], length: number): number {
  let count: number = 0;
  for (let index: number = 0; index < values.length; index++) {
    if (values[index].length === length) {
      count = count + 1;
    }
  }
  return count;
}

/** Reports whether an entry contains an uppercase hexadecimal letter. */
function hasUpperCaseHex(value: string): boolean {
  for (let index: number = 1; index < value.length; index++) {
    let code: number = value.charCodeAt(index);
    if (code >= 65 && code <= 70) {
      return true;
    }
  }
  return false;
}

/** Counts entries that repeat a value already seen at a smaller index. */
function duplicateCount(values: string[]): number {
  let duplicates: number = 0;
  for (let index: number = 0; index < values.length; index++) {
    for (let earlier: number = 0; earlier < index; earlier++) {
      if (values[earlier] === values[index]) {
        duplicates = duplicates + 1;
      }
    }
  }
  return duplicates;
}

/** Reports the first repeated slot, or null when every slot holds a unique colour. */
function firstDuplicateIndex(values: string[]): number | null {
  for (let index: number = 0; index < values.length; index++) {
    for (let earlier: number = 0; earlier < index; earlier++) {
      if (values[earlier] === values[index]) {
        return index;
      }
    }
  }
  return null;
}

export default function textColorTest() {
  describe('textColorTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('textColorTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('textColorTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_0200
     * @tc.name paletteIndexZeroIsMintWhite0200
     * @tc.desc Verify the spare entry at index 0 is the mint white #f0fff0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexZeroIsMintWhite0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[0]).assertEqual('#f0fff0');
      expect(TEXT_COLOR[0].length).assertEqual(7);
      expect(TEXT_COLOR[0]).assertContain('f0fff0');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_0300
     * @tc.name paletteIndexOneIsTwo0300
     * @tc.desc Verify the entry used by tile 2 at index 1 is the light beige #eee3da
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexOneIsTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[1]).assertEqual('#eee3da');
      expect(TEXT_COLOR[1].length).assertEqual(7);
      expect(TEXT_COLOR[1]).assertContain('#');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_0400
     * @tc.name paletteIndexTwoIsFour0400
     * @tc.desc Verify the entry used by tile 4 at index 2 is the darker beige #ede0c8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexTwoIsFour0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[2]).assertEqual('#ede0c8');
      expect(TEXT_COLOR[2].length).assertEqual(7);
      expect(TEXT_COLOR[2] === TEXT_COLOR[1]).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_0500
     * @tc.name paletteIndexThreeIsEight0500
     * @tc.desc Verify the entry used by tile 8 at index 3 is the sand orange #f2b179
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexThreeIsEight0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[3]).assertEqual('#f2b179');
      expect(TEXT_COLOR[3].length).assertEqual(7);
      expect(TEXT_COLOR[3]).assertContain('f2b179');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_0600
     * @tc.name paletteIndexFourIsSixteen0600
     * @tc.desc Verify the entry used by tile 16 at index 4 is the orange #f59563
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexFourIsSixteen0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[4]).assertEqual('#f59563');
      expect(TEXT_COLOR[4].length).assertEqual(7);
      expect(TEXT_COLOR[4] === TEXT_COLOR[3]).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_0700
     * @tc.name paletteIndexFiveIsThirtyTwo0700
     * @tc.desc Verify the entry used by tile 32 at index 5 is the coral #f67c5f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexFiveIsThirtyTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[5]).assertEqual('#f67c5f');
      expect(TEXT_COLOR[5].length).assertEqual(7);
      expect(TEXT_COLOR[5]).assertContain('f67c5f');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_0800
     * @tc.name paletteIndexSixIsSixtyFour0800
     * @tc.desc Verify the entry used by tile 64 at index 6 is the deep coral #f65e3b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexSixIsSixtyFour0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[6]).assertEqual('#f65e3b');
      expect(TEXT_COLOR[6].length).assertEqual(7);
      expect(TEXT_COLOR[6] === TEXT_COLOR[5]).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_0900
     * @tc.name paletteIndexSevenIsOneTwentyEight0900
     * @tc.desc Verify the entry used by tile 128 at index 7 is the pale gold #edcf72
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexSevenIsOneTwentyEight0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[7]).assertEqual('#edcf72');
      expect(TEXT_COLOR[7].length).assertEqual(7);
      expect(TEXT_COLOR[7]).assertContain('edcf72');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_1000
     * @tc.name paletteIndexEightIsTwoFiftySix1000
     * @tc.desc Verify the entry used by tile 256 at index 8 is the gold #edcc61
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexEightIsTwoFiftySix1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[8]).assertEqual('#edcc61');
      expect(TEXT_COLOR[8].length).assertEqual(7);
      expect(TEXT_COLOR[8] === TEXT_COLOR[7]).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_1100
     * @tc.name paletteIndexNineIsFiveTwelve1100
     * @tc.desc Verify the entry used by tile 512 at index 9 is the shorthand #9c0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexNineIsFiveTwelve1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[9]).assertEqual('#9c0');
      expect(TEXT_COLOR[9].length).assertEqual(4);
      expect(TEXT_COLOR[9]).assertContain('#');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_1200
     * @tc.name paletteIndexTenIsOneThousandTwentyFour1200
     * @tc.desc Verify the entry used by tile 1024 at index 10 is the blue #33b5e5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexTenIsOneThousandTwentyFour1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[10]).assertEqual('#33b5e5');
      expect(TEXT_COLOR[10].length).assertEqual(7);
      expect(TEXT_COLOR[10]).assertContain('33b5e5');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_1300
     * @tc.name paletteIndexElevenIsTwoThousandFortyEight1300
     * @tc.desc Verify the entry used by tile 2048 at index 11 is the shorthand #09c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexElevenIsTwoThousandFortyEight1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[11]).assertEqual('#09c');
      expect(TEXT_COLOR[11].length).assertEqual(4);
      expect(TEXT_COLOR[11] === TEXT_COLOR[9]).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_1400
     * @tc.name paletteIndexTwelveIsFourThousandNinetySix1400
     * @tc.desc Verify the entry used by tile 4096 at index 12 is the violet shorthand #a6c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexTwelveIsFourThousandNinetySix1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[12]).assertEqual('#a6c');
      expect(TEXT_COLOR[12].length).assertEqual(4);
      expect(TEXT_COLOR[12]).assertContain('a6c');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_1500
     * @tc.name paletteIndexThirteenIsEightThousandNineteenTwo1500
     * @tc.desc Verify the entry used by tile 8192 at index 13 is the final shorthand #93c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIndexThirteenIsEightThousandNineteenTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[13]).assertEqual('#93c');
      expect(TEXT_COLOR[13].length).assertEqual(4);
      expect(TEXT_COLOR[13] === TEXT_COLOR[12]).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_1700
     * @tc.name lastEntryIsShorthandPurple1700
     * @tc.desc Verify the palette closes with the four character #93c for tile 8192
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lastEntryIsShorthandPurple1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[LAST_INDEX]).assertEqual('#93c');
      expect(TEXT_COLOR[LAST_INDEX].length).assertEqual(4);
      expect(TEXT_COLOR[LAST_INDEX] === TEXT_COLOR[LAST_INDEX - 1]).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_2000
     * @tc.name paletteHasNoDuplicates2000
     * @tc.desc Verify no two tile slots share a colour even though four entries use shorthand notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteHasNoDuplicates2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(duplicateCount(TEXT_COLOR)).assertEqual(0);
      expect(firstDuplicateIndex(TEXT_COLOR)).assertNull();
      expect(firstDuplicateIndex(['#aaa', '#bbb', '#aaa'])).assertEqual(2);
      expect(TEXT_COLOR.indexOf('#9c0')).assertEqual(9);
      expect(TEXT_COLOR.indexOf('#09c')).assertEqual(11);
      expect(TEXT_COLOR.indexOf('#a6c')).assertEqual(12);
      expect(TEXT_COLOR.indexOf('#93c')).assertEqual(13);
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_2100
     * @tc.name indexOneMatchesTileTwo2100
     * @tc.desc Verify index 1 is the slot derived for tile 2 and holds its colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexOneMatchesTileTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = paletteIndexOfTile(2);
      expect(index).assertEqual(1);
      expect(TEXT_COLOR[index]).assertEqual('#eee3da');
      expect(index < TEXT_COLOR.length).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_2200
     * @tc.name indexElevenMatchesTile2048_2200
     * @tc.desc Verify index 11 is the slot derived for tile 2048 and holds #09c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexElevenMatchesTile2048_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = paletteIndexOfTile(2048);
      expect(index).assertEqual(11);
      expect(TEXT_COLOR[index]).assertEqual('#09c');
      expect(index < TEXT_COLOR.length).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_2300
     * @tc.name indexThirteenMatchesTile8192_2300
     * @tc.desc Verify index 13 is the slot derived for tile 8192 and holds #93c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexThirteenMatchesTile8192_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let index: number = paletteIndexOfTile(8192);
      expect(index).assertEqual(13);
      expect(TEXT_COLOR[index]).assertEqual('#93c');
      expect(index).assertEqual(LAST_INDEX);
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_2400
     * @tc.name indexZeroIsNeverDerived2400
     * @tc.desc Verify no tile from 2 to 8192 maps to the spare entry at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexZeroIsNeverDerived2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let smallest: number = TEXT_COLOR.length;
      for (let exponent: number = 1; exponent <= LAST_INDEX; exponent++) {
        let index: number = paletteIndexOfTile(Math.pow(2, exponent));
        if (index < smallest) {
          smallest = index;
        }
        expect(index === SPARE_INDEX).assertFalse();
      }
      expect(smallest).assertEqual(1);
      expect(TEXT_COLOR[SPARE_INDEX]).assertEqual('#f0fff0');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_2500
     * @tc.name indexFourteenIsUndefined2500
     * @tc.desc Verify reading one past the last slot yields undefined and keeps the length at fourteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexFourteenIsUndefined2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[14]).assertUndefined();
      expect(TEXT_COLOR[LAST_INDEX + 1]).assertUndefined();
      expect(TEXT_COLOR.length).assertEqual(PALETTE_SIZE);
      expect(TEXT_COLOR[14] === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_2600
     * @tc.name randomAccessIsStable2600
     * @tc.desc Verify two reads of the same slot return the same string for every out of order index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomAccessIsStable2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let order: number[] = [7, 2, 13, 0, 9, 4, 11];
      let stable: number = 0;
      for (let step: number = 0; step < order.length; step++) {
        let index: number = order[step];
        let first: string = TEXT_COLOR[index];
        let second: string = TEXT_COLOR[index];
        expect(first).assertEqual(second);
        expect(first.length > 0).assertTrue();
        stable = stable + 1;
      }
      expect(stable).assertEqual(7);
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_2700
     * @tc.name randomAccessDoesNotMutate2700
     * @tc.desc Verify a scrambled read pass leaves all fourteen stored colours unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomAccessDoesNotMutate2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let snapshot: string[] = TEXT_COLOR.slice();
      let order: number[] = [12, 1, 8, 3, 13, 6, 10, 5];
      for (let step: number = 0; step < order.length; step++) {
        let index: number = order[step];
        expect(TEXT_COLOR[index]).assertEqual(snapshot[index]);
      }
      expect(TEXT_COLOR.length).assertEqual(snapshot.length);
      for (let index: number = 0; index < PALETTE_SIZE; index++) {
        expect(TEXT_COLOR[index]).assertEqual(snapshot[index]);
      }
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_2800
     * @tc.name paletteHasThirteenTileSlots2800
     * @tc.desc Verify thirteen tile slots are reachable and exactly one spare slot remains unused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteHasThirteenTileSlots2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tileSlots: number = LAST_INDEX - SPARE_INDEX;
      expect(tileSlots).assertEqual(13);
      expect(PALETTE_SIZE - tileSlots).assertEqual(1);
      expect(paletteIndexOfTile(8192)).assertEqual(tileSlots);
      expect(TEXT_COLOR[tileSlots]).assertEqual('#93c');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_2900
     * @tc.name everyEntryIsString2900
     * @tc.desc Verify all fourteen exported entries are strings rather than resource identifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('everyEntryIsString2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stringEntries: number = 0;
      for (let index: number = 0; index < TEXT_COLOR.length; index++) {
        expect(typeof TEXT_COLOR[index]).assertEqual('string');
        stringEntries = stringEntries + 1;
      }
      expect(stringEntries).assertEqual(PALETTE_SIZE);
      expect(typeof TEXT_COLOR).assertEqual('object');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_3000
     * @tc.name shorthandIsCaseSensitive3000
     * @tc.desc Verify the stored #9c0 only matches its lowercase literal and not the uppercase #9C0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shorthandIsCaseSensitive3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[9]).assertEqual('#9c0');
      expect(TEXT_COLOR[9] === '#9c0').assertTrue();
      expect(TEXT_COLOR[9] === '#9C0').assertFalse();
      expect(TEXT_COLOR[9]).assertContain('9c0');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_3100
     * @tc.name formatDistributionIsTenAndFour3100
     * @tc.desc Verify ten entries use six hex digits while four use the three digit shorthand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatDistributionIsTenAndFour3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(countWithLength(TEXT_COLOR, 7)).assertEqual(10);
      expect(countWithLength(TEXT_COLOR, 4)).assertEqual(4);
      expect(countWithLength(TEXT_COLOR, 7) + countWithLength(TEXT_COLOR, 4)).assertEqual(PALETTE_SIZE);
      expect(countWithLength(TEXT_COLOR, 5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_3200
     * @tc.name paletteIsLowerCase3200
     * @tc.desc Verify no entry mixes uppercase hexadecimal letters into the palette
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteIsLowerCase3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uppercaseEntries: number = 0;
      for (let index: number = 0; index < TEXT_COLOR.length; index++) {
        if (hasUpperCaseHex(TEXT_COLOR[index])) {
          uppercaseEntries = uppercaseEntries + 1;
        }
      }
      expect(uppercaseEntries).assertEqual(0);
      expect(hasUpperCaseHex('#93C')).assertTrue();
      expect(hasUpperCaseHex('#93c')).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_3300
     * @tc.name paletteBacksUniqueGridKeys3300
     * @tc.desc Verify index plus colour builds fourteen unique keys, the way LazyForEach identifies grid items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteBacksUniqueGridKeys3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let keys: string[] = [];
      for (let index: number = 0; index < TEXT_COLOR.length; index++) {
        keys.push(index.toString() + '_' + TEXT_COLOR[index]);
      }
      expect(keys.length).assertEqual(PALETTE_SIZE);
      let repeatedKeys: number = 0;
      for (let index: number = 0; index < keys.length; index++) {
        for (let earlier: number = 0; earlier < index; earlier++) {
          if (keys[earlier] === keys[index]) {
            repeatedKeys = repeatedKeys + 1;
          }
        }
      }
      expect(repeatedKeys).assertEqual(0);
      expect(keys[0]).assertEqual('0_#f0fff0');
      expect(keys[LAST_INDEX]).assertEqual('13_#93c');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_3400
     * @tc.name violetDiffersFromFinalPurple3400
     * @tc.desc Verify the last two shorthand entries differ at their first hex digit, a from 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('violetDiffersFromFinalPurple3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR[12]).assertEqual('#a6c');
      expect(TEXT_COLOR[13]).assertEqual('#93c');
      expect(TEXT_COLOR[12] === TEXT_COLOR[13]).assertFalse();
      expect(TEXT_COLOR[12].charAt(1)).assertEqual('a');
      expect(TEXT_COLOR[13].charAt(1)).assertEqual('9');
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_3500
     * @tc.name shorthandEntriesAreContiguousTail3500
     * @tc.desc Verify the shorthand entries sit at indices 9, 11, 12 and 13 in that order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shorthandEntriesAreContiguousTail3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let shorthand: number[] = [];
      for (let index: number = 0; index < TEXT_COLOR.length; index++) {
        if (TEXT_COLOR[index].length === 4) {
          shorthand.push(index);
        }
      }
      expect(shorthand.length).assertEqual(4);
      expect(shorthand[0]).assertEqual(9);
      expect(shorthand[1]).assertEqual(11);
      expect(shorthand[2]).assertEqual(12);
      expect(shorthand[3]).assertEqual(13);
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_3600
     * @tc.name twoSnapshotsAgree3600
     * @tc.desc Verify two independent copies read the same fourteen values and remain separate arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('twoSnapshotsAgree3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let first: string[] = TEXT_COLOR.slice();
      let second: string[] = TEXT_COLOR.slice();
      expect(first.length).assertEqual(second.length);
      expect(first === second).assertFalse();
      for (let index: number = 0; index < PALETTE_SIZE; index++) {
        expect(first[index]).assertEqual(second[index]);
      }
      expect(first.length).assertEqual(PALETTE_SIZE);
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_3700
     * @tc.name topTileInRangeNextTileOutOfRange3700
     * @tc.desc Verify 8192 resolves to the defined index 13 while 16384 resolves to the undefined index 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('topTileInRangeNextTileOutOfRange3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let topIndex: number = paletteIndexOfTile(8192);
      expect(topIndex).assertEqual(LAST_INDEX);
      expect(TEXT_COLOR[topIndex]).assertEqual('#93c');
      let beyondIndex: number = paletteIndexOfTile(16384);
      expect(beyondIndex).assertEqual(14);
      expect(TEXT_COLOR[beyondIndex]).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_3800
     * @tc.name noEntryIsTooShort3800
     * @tc.desc Verify every entry carries the hash sign plus at least three hex digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noEntryIsTooShort3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let shortest: number = 0;
      for (let index: number = 0; index < TEXT_COLOR.length; index++) {
        if (shortest === 0 || TEXT_COLOR[index].length < shortest) {
          shortest = TEXT_COLOR[index].length;
        }
        expect(TEXT_COLOR[index].length >= 4).assertTrue();
        expect(TEXT_COLOR[index].length > 1).assertTrue();
      }
      expect(shortest).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_3900
     * @tc.name indexOfLookups3900
     * @tc.desc Verify indexOf finds #f59563 at slot 4 and reports minus one for unknown colours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexOfLookups3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TEXT_COLOR.indexOf('#f59563')).assertEqual(4);
      expect(TEXT_COLOR.indexOf('#93c')).assertEqual(LAST_INDEX);
      expect(TEXT_COLOR.indexOf('#000')).assertEqual(-1);
      expect(TEXT_COLOR.indexOf('#F0FFF0')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_GAME2048_TEXTCOLOR_4000
     * @tc.name allTileIndicesResolveInsidePalette4000
     * @tc.desc Verify each tile from 2 to 8192 resolves to an index between 1 and 13 holding a hex colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('allTileIndicesResolveInsidePalette4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let resolved: number = 0;
      for (let exponent: number = 1; exponent <= LAST_INDEX; exponent++) {
        let tile: number = Math.pow(2, exponent);
        let index: number = paletteIndexOfTile(tile);
        expect(index >= 1).assertTrue();
        expect(index <= LAST_INDEX).assertTrue();
        expect(isHexColor(TEXT_COLOR[index])).assertTrue();
        resolved = resolved + 1;
      }
      expect(resolved).assertEqual(13);
      expect(TEXT_COLOR[paletteIndexOfTile(2)]).assertEqual('#eee3da');
    });
  });
}
