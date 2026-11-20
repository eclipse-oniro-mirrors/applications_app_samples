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
import { GameStatus, TEXT_COLOR } from '../../../../main/ets/muck/GameData';
import { BoardKit } from '../common/Game2048TestKit';

import { GameRule } from '../../../../main/ets/model/GameRule';

/**
 * 常量模块导出契约测试套件。
 *
 * GameData.ets 是页面与规则层唯一的共享字面量来源：GameStatus 决定开始按钮与
 * 手势守卫，TEXT_COLOR 决定每个棋子的背景色。本套件站在「导入方」的立场，
 * 固化两个导出绑定的数值、类型、可赋值性、下标的可覆盖范围与越界行为；
 * GameStatus 的算术关系与 switch 分支已由 GameStatus 套件覆盖，此处不再重复。
 */

/**
 * Derives the palette slot the page computes for one tile by halving the value
 * until it reaches one, so the result stays an exact integer.
 */
function paletteIndexOfTile(tile: number): number {
  if (tile < 2) {
    return 0;
  }
  let remaining: number = tile;
  let index: number = 0;
  while (remaining > 1) {
    remaining = remaining / 2;
    index = index + 1;
  }
  return index;
}

/** Widens an enum member to a plain number, proving the export is numeric. */
function widenStatus(value: number): number {
  return value;
}

/** Reads the first palette entry through a plain string array parameter. */
function firstColor(values: string[]): string {
  return values[0];
}

/** Reads the last palette entry through a plain string array parameter. */
function lastColor(values: string[]): string {
  return values[values.length - 1];
}

/** Reports how many entries a plain string array parameter carries. */
function countColors(values: string[]): number {
  return values.length;
}

/** Checks that a value is '#' followed only by lowercase hexadecimal digits. */
function isLowerHex(value: string): boolean {
  if (value.length < 4 || value.charAt(0) !== '#') {
    return false;
  }
  for (let index: number = 1; index < value.length; index++) {
    let code: number = value.charCodeAt(index);
    let isDigit: boolean = code >= 48 && code <= 57;
    let isLowerLetter: boolean = code >= 97 && code <= 102;
    if (!(isDigit || isLowerLetter)) {
      return false;
    }
  }
  return true;
}

/** Stores the three enum members in number typed fields. */
class StatusHolder {
  before: number = GameStatus.BEFORE;
  running: number = GameStatus.RUNNING;
  over: number = GameStatus.OVER;
}

export default function gameDataConstantsTest() {
  describe('gameDataConstantsTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameDataConstantsTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameDataConstantsTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_0400
     * @tc.name membersReadStable0400
     * @tc.desc Verify each member yields the same value when the constant is read twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('membersReadStable0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let firstBefore: number = GameStatus.BEFORE;
      let secondBefore: number = GameStatus.BEFORE;
      let firstRunning: number = GameStatus.RUNNING;
      let secondRunning: number = GameStatus.RUNNING;
      let firstOver: number = GameStatus.OVER;
      let secondOver: number = GameStatus.OVER;
      expect(firstBefore === secondBefore).assertTrue();
      expect(firstRunning === secondRunning).assertTrue();
      expect(firstOver === secondOver).assertTrue();
      expect(firstBefore).assertEqual(secondBefore);
      expect(firstRunning).assertEqual(secondRunning);
      expect(firstOver).assertEqual(secondOver);
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_0500
     * @tc.name membersAssignableToNumber0500
     * @tc.desc Verify all three members can initialize plain number locals without a cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('membersAssignableToNumber0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number = GameStatus.BEFORE;
      let running: number = GameStatus.RUNNING;
      let over: number = GameStatus.OVER;
      expect(before).assertEqual(-1);
      expect(running).assertEqual(1);
      expect(over).assertEqual(0);
      before = GameStatus.OVER;
      expect(before).assertEqual(0);
      expect(before === GameStatus.OVER).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_0600
     * @tc.name membersUsableAsArrayElements0600
     * @tc.desc Verify the members can populate a number array that later reads back the same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('membersUsableAsArrayElements0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let statuses: number[] = [GameStatus.BEFORE, GameStatus.RUNNING, GameStatus.OVER];
      expect(statuses.length).assertEqual(3);
      expect(statuses[0]).assertEqual(-1);
      expect(statuses[1]).assertEqual(1);
      expect(statuses[2]).assertEqual(0);
      expect(statuses[2] === 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_1100
     * @tc.name everyPaletteItemIsString1100
     * @tc.desc Verify all fourteen entries report the string type rather than a colour resource object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('everyPaletteItemIsString1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stringItems: number = 0;
      for (let index: number = 0; index < TEXT_COLOR.length; index++) {
        expect(typeof TEXT_COLOR[index]).assertEqual('string');
        stringItems = stringItems + 1;
      }
      expect(stringItems).assertEqual(14);
      expect(stringItems === TEXT_COLOR.length).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_1300
     * @tc.name paletteItemsCompareAcrossCopies1300
     * @tc.desc Verify an entry read through a copied array equals the same entry read from the export
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteItemsCompareAcrossCopies1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let copy: string[] = TEXT_COLOR.slice();
      let matches: number = 0;
      for (let index: number = 0; index < TEXT_COLOR.length; index++) {
        expect(copy[index] === TEXT_COLOR[index]).assertTrue();
        matches = matches + 1;
      }
      expect(matches).assertEqual(14);
      expect(copy[4] === TEXT_COLOR[4]).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_1700
     * @tc.name readingConstantsDoesNotThrow1700
     * @tc.desc Verify reading the enum member, the palette entry and the length inside a guard throws nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('readingConstantsDoesNotThrow1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let caught: Error | null = null;
      let entry: string = '';
      let status: number = 0;
      let size: number = 0;
      try {
        entry = TEXT_COLOR[0];
        status = GameStatus.RUNNING;
        size = TEXT_COLOR.length;
      } catch (error) {
        caught = error as Error;
      }
      expect(caught).assertNull();
      expect(entry).assertEqual('#f0fff0');
      expect(status).assertEqual(1);
      expect(size).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_1800
     * @tc.name bothExportsUsableTogether1800
     * @tc.desc Verify one import statement serves both bindings, so the RUNNING value 1 indexes palette slot 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bothExportsUsableTogether1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runningSlot: number = GameStatus.RUNNING;
      let overSlot: number = GameStatus.OVER;
      expect(TEXT_COLOR[runningSlot]).assertEqual('#eee3da');
      expect(TEXT_COLOR[overSlot]).assertEqual('#f0fff0');
      expect(runningSlot < TEXT_COLOR.length).assertTrue();
      expect(TEXT_COLOR.length).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_2200
     * @tc.name outOfRangeReadsKeepLength2200
     * @tc.desc Verify probing index 14 and index 99 leaves the palette at fourteen entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('outOfRangeReadsKeepLength2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let firstProbe: string = TEXT_COLOR[14];
      let secondProbe: string = TEXT_COLOR[99];
      expect(firstProbe).assertUndefined();
      expect(secondProbe).assertUndefined();
      expect(TEXT_COLOR.length).assertEqual(14);
      expect(TEXT_COLOR[0]).assertEqual('#f0fff0');
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_2300
     * @tc.name memberSurvivesNumberParameter2300
     * @tc.desc Verify a member passed to a number parameter arrives with the minus one, one and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('memberSurvivesNumberParameter2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(widenStatus(GameStatus.BEFORE)).assertEqual(-1);
      expect(widenStatus(GameStatus.RUNNING)).assertEqual(1);
      expect(widenStatus(GameStatus.OVER)).assertEqual(0);
      expect(widenStatus(GameStatus.RUNNING) === 1).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_2400
     * @tc.name memberFitsNumberField2400
     * @tc.desc Verify each member initializes a number typed class field without narrowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('memberFitsNumberField2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let holder: StatusHolder = new StatusHolder();
      expect(holder.before).assertEqual(-1);
      expect(holder.running).assertEqual(1);
      expect(holder.over).assertEqual(0);
      expect(holder.running === GameStatus.RUNNING).assertTrue();
      expect(holder.over !== GameStatus.RUNNING).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_2500
     * @tc.name paletteSurvivesArrayParameter2500
     * @tc.desc Verify the export passes to a string array parameter with first, last and count intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteSurvivesArrayParameter2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(firstColor(TEXT_COLOR)).assertEqual('#f0fff0');
      expect(lastColor(TEXT_COLOR)).assertEqual('#93c');
      expect(countColors(TEXT_COLOR)).assertEqual(14);
      expect(firstColor(TEXT_COLOR) === lastColor(TEXT_COLOR)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_2600
     * @tc.name everyEntryIsLowercaseHex2600
     * @tc.desc Verify all fourteen entries match hash plus lowercase hex, while an uppercase probe fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('everyEntryIsLowercaseHex2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lowercase: number = 0;
      for (let index: number = 0; index < TEXT_COLOR.length; index++) {
        expect(isLowerHex(TEXT_COLOR[index])).assertTrue();
        lowercase = lowercase + 1;
      }
      expect(lowercase).assertEqual(14);
      expect(isLowerHex('#93C')).assertFalse();
      expect(isLowerHex('93c')).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_2700
     * @tc.name noEntryIsEmpty2700
     * @tc.desc Verify no palette entry is an empty string and the shortest entry keeps the hash plus three digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noEntryIsEmpty2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let shortest: number = TEXT_COLOR[0].length;
      for (let index: number = 0; index < TEXT_COLOR.length; index++) {
        expect(TEXT_COLOR[index].length > 0).assertTrue();
        expect(TEXT_COLOR[index] !== '').assertTrue();
        if (TEXT_COLOR[index].length < shortest) {
          shortest = TEXT_COLOR[index].length;
        }
      }
      expect(shortest).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_2800
     * @tc.name paletteLengthAgreesAcrossAccessPaths2800
     * @tc.desc Verify direct, copied and parameter read paths all report the same fourteen entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteLengthAgreesAcrossAccessPaths2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let directLength: number = TEXT_COLOR.length;
      let copiedLength: number = TEXT_COLOR.slice().length;
      let parameterLength: number = countColors(TEXT_COLOR);
      expect(directLength).assertEqual(copiedLength);
      expect(parameterLength).assertEqual(directLength);
      expect(directLength).assertEqual(14);
      expect(firstColor(TEXT_COLOR)).assertEqual(TEXT_COLOR[0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_2900
     * @tc.name enumMembersIndexLabelTable2900
     * @tc.desc Verify OVER and RUNNING can index a two entry label table as slots zero and one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('enumMembersIndexLabelTable2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let labels: string[] = [];
      labels[GameStatus.OVER] = 'over';
      labels[GameStatus.RUNNING] = 'running';
      expect(labels.length).assertEqual(2);
      expect(labels[GameStatus.OVER]).assertEqual('over');
      expect(labels[GameStatus.RUNNING]).assertEqual('running');
      expect(labels[0]).assertEqual('over');
      expect(labels[1]).assertEqual('running');
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_3000
     * @tc.name beforeStatusIsOutsidePalette3000
     * @tc.desc Verify the negative BEFORE value minus one reads no palette entry while RUNNING one reads #eee3da
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('beforeStatusIsOutsidePalette3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(GameStatus.BEFORE).assertEqual(-1);
      expect(TEXT_COLOR[GameStatus.BEFORE]).assertUndefined();
      expect(TEXT_COLOR[GameStatus.RUNNING]).assertEqual('#eee3da');
      expect(TEXT_COLOR.length).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMEDATACONSTANTS_3100
     * @tc.name paletteHasNoHolesInsideRange3100
     * @tc.desc Verify all fourteen slots between index zero and thirteen are filled, leaving no undefined hole
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('paletteHasNoHolesInsideRange3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let holes: number = 0;
      for (let index: number = 0; index < TEXT_COLOR.length; index++) {
        if (TEXT_COLOR[index] === undefined) {
          holes = holes + 1;
        }
        expect(typeof TEXT_COLOR[index]).assertEqual('string');
      }
      expect(holes).assertEqual(0);
      expect(TEXT_COLOR.length).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_0100
     * @tc.name gameStatusBeforeIsMinusOne0100
     * @tc.desc Verify BEFORE keeps the documented minus one value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('gameStatus_beforeIsMinusOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(GameStatus.BEFORE).assertEqual(-1);
      expect(GameStatus.BEFORE < 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_0200
     * @tc.name gameStatusRunningIsOne0200
     * @tc.desc Verify RUNNING keeps the documented one value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('gameStatus_runningIsOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(GameStatus.RUNNING).assertEqual(1);
      expect(GameStatus.RUNNING > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_0300
     * @tc.name gameStatusOverIsZero0300
     * @tc.desc Verify OVER keeps the documented zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('gameStatus_overIsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(GameStatus.OVER).assertEqual(0);
      expect(GameStatus.OVER === 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_0400
     * @tc.name gameStatusMembersAreDistinct0400
     * @tc.desc Verify the three status members never collide
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('gameStatus_membersAreDistinct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let before: number = GameStatus.BEFORE;
      let running: number = GameStatus.RUNNING;
      let over: number = GameStatus.OVER;
      expect(before === running).assertFalse();
      expect(before === over).assertFalse();
      expect(running === over).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_0500
     * @tc.name gameStatusOrdering0500
     * @tc.desc Verify BEFORE is the smallest member and RUNNING the largest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameStatus_ordering', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(GameStatus.BEFORE < GameStatus.OVER).assertTrue();
      expect(GameStatus.OVER < GameStatus.RUNNING).assertTrue();
      expect(GameStatus.BEFORE < GameStatus.RUNNING).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_0600
     * @tc.name gameStatusSumIsZero0600
     * @tc.desc Verify the three numeric members sum to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameStatus_sumIsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let sum: number = GameStatus.BEFORE + GameStatus.RUNNING + GameStatus.OVER;
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_0700
     * @tc.name gameStatusBeforePlusRunningIsZero0700
     * @tc.desc Verify BEFORE cancels RUNNING exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameStatus_beforePlusRunningIsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let sum: number = GameStatus.BEFORE + GameStatus.RUNNING;
      expect(sum).assertEqual(0);
      expect(sum === GameStatus.OVER).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_0800
     * @tc.name gameStatusRunningMinusOverIsOne0800
     * @tc.desc Verify RUNNING minus OVER yields one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameStatus_runningMinusOverIsOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let delta: number = GameStatus.RUNNING - GameStatus.OVER;
      expect(delta).assertEqual(1);
      expect(delta).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_0900
     * @tc.name gameStatusComparableWithLiteral0900
     * @tc.desc Verify the members compare equal to the literals used by Index.ets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameStatus_comparableWithLiteral', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let status: number = GameStatus.BEFORE;
      expect(status === -1).assertTrue();
      status = GameStatus.RUNNING;
      expect(status === 1).assertTrue();
      status = GameStatus.OVER;
      expect(status === 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_1000
     * @tc.name gameStatusSwitchCoversAllMembers1000
     * @tc.desc Verify a switch on the enum resolves every member to its own branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameStatus_switchCoversAllMembers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(statusLabel(GameStatus.BEFORE)).assertEqual('before');
      expect(statusLabel(GameStatus.RUNNING)).assertEqual('running');
      expect(statusLabel(GameStatus.OVER)).assertEqual('over');
      expect(statusLabel(99)).assertEqual('unknown');
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_1100
     * @tc.name gameStatusFieldAcceptsAllMembers1100
     * @tc.desc Verify a rule status field stores every enum member verbatim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameStatus_fieldAcceptsAllMembers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.status = GameStatus.BEFORE;
      expect(rule.status).assertEqual(-1);
      rule.status = GameStatus.RUNNING;
      expect(rule.status).assertEqual(1);
      rule.status = GameStatus.OVER;
      expect(rule.status).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_1200
     * @tc.name gameStatusTypeIsNumeric1200
     * @tc.desc Verify a status field remains a number at runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameStatus_typeIsNumeric', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      expect(typeof rule.status).assertEqual('number');
      expect(typeof GameStatus.RUNNING).assertEqual('number');
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_1300
     * @tc.name gameStatusNotConditionMatchesUi1300
     * @tc.desc Verify a BEFORE status is truthy while OVER is falsy, matching UI guards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameStatus_notConditionMatchesUi', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let beforeValue: number = GameStatus.BEFORE;
      let overValue: number = GameStatus.OVER;
      let beforeTruthy: boolean = beforeValue !== 0;
      let overTruthy: boolean = overValue !== 0;
      expect(beforeTruthy).assertTrue();
      expect(overTruthy).assertFalse();
      expect(!GameStatus.OVER).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_1400
     * @tc.name gameStatusGuardUsesOne1400
     * @tc.desc Verify the gesture guard `status === 1` distinguishes RUNNING from the rest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameStatus_guardUsesOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.status = GameStatus.RUNNING;
      expect(rule.status === 1).assertTrue();
      rule.status = GameStatus.OVER;
      expect(rule.status === 1).assertFalse();
      rule.status = GameStatus.BEFORE;
      expect(rule.status === 1).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_1500
     * @tc.name gameStatusStartButtonGuard1500
     * @tc.desc Verify the start button guard `status === -1` matches only BEFORE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameStatus_startButtonGuard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.status = GameStatus.BEFORE;
      expect(rule.status === -1).assertTrue();
      rule.status = GameStatus.RUNNING;
      expect(rule.status === -1).assertFalse();
      rule.status = GameStatus.OVER;
      expect(rule.status === -1).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_1600
     * @tc.name gameStatusOverIsFalsyInIf1600
     * @tc.desc Verify an OVER status behaves as the numeric zero in an if condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameStatus_overIsFalsyInIf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let branch: string = '';
      let status: number = GameStatus.OVER;
      if (status) {
        branch = 'truthy';
      } else {
        branch = 'falsy';
      }
      expect(branch).assertEqual('falsy');
      expect(status).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESTATUS_1700
     * @tc.name gameStatusBeforeIsTruthyInIf1700
     * @tc.desc Verify a BEFORE status behaves as minus one in an if condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameStatus_beforeIsTruthyInIf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let branch: string = '';
      let status: number = GameStatus.BEFORE;
      if (status) {
        branch = 'truthy';
      } else {
        branch = 'falsy';
      }
      expect(branch).assertEqual('truthy');
      expect(status).assertEqual(-1);
    });
  });
}

function statusLabel(status: number): string {
  let label: string = 'unknown';
  switch (status) {
    case GameStatus.BEFORE:
      label = 'before';
      break;
    case GameStatus.RUNNING:
      label = 'running';
      break;
    case GameStatus.OVER:
      label = 'over';
      break;
    default:
      label = 'unknown';
      break;
  }
  return label;
}
