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
import { GameRule } from '../../../../main/ets/model/GameRule';
import { BoardKit, CELLS, SIDE, DIR_RIGHT, DIR_LEFT, DIR_UP, DIR_DOWN } from '../common/Game2048TestKit';
import { BoardOracle } from '../common/BoardOracle';

/**
 * Returns the index of the first cell holding the requested value, or null
 * when no cell holds it. The null branch states "this tile is gone" without
 * inventing a sentinel index.
 */
function firstCellOf(values: number[], target: number): number | null {
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] === target) {
      return index;
    }
  }
  return null;
}

/**
 * Performs one rightward sweep of a single row using only the public moveNext
 * and dataChange methods. It mirrors how the production moveInRow loop
 * consumes the index returned by dataChange, so the returned value is proven
 * to be usable as a loop cursor.
 */
function sweepRowRight(rule: GameRule, rowIndex: number): void {
  let cursor: number = SIDE - 1;
  while (cursor > 0) {
    let next: number = rule.moveNext(rowIndex, cursor, DIR_RIGHT);
    cursor = rule.dataChange(rowIndex, cursor, next, DIR_RIGHT).b;
    if (next === -1) {
      break;
    }
    cursor = cursor - 1;
  }
}

/**
 * GameRule.dataChange 单步操作测试套件。
 *
 * dataChange(a, b, next, direction) 是公开的单步原语，moveInRow 依赖它完成
 * 搬移与合并。它的契约是：next 为 -1 时完全不动；目标格为空则把 next 指向的
 * 块搬到当前格并清零源格，同时把返回的 b（左右移动）或 a（上下移动）调整
 * ±1 以便调用方的循环重新检查同一格；数值相等则翻倍、加分并清零源格，此时
 * 不调整索引；其余情况保持不变。本套件逐条固化这些分支与索引映射。
 */
export default function gameRuleDataChangeTest() {
  describe('gameRuleDataChangeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleDataChangeTest', 'suite begin');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_0100
     * @tc.name dataChangeNextMinusOneReturnsInputs0100
     * @tc.desc Verify a next index of minus one returns the original a and b and leaves cells untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_nextMinusOneReturnsInputs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 2, 4],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_nextMinusOneReturnsInputs', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 3, -1, DIR_RIGHT);
      expect(result.a).assertEqual(0);
      expect(result.b).assertEqual(3);
      BoardKit.expectBoard(rule, board);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_0200
     * @tc.name dataChangeNextMinusOneOnBlankRow0200
     * @tc.desc Verify a minus one next index keeps an empty row empty and returns the same column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_nextMinusOneOnBlankRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      BoardKit.log('dataChange_nextMinusOneOnBlankRow', 'before ' + BoardKit.describe(rule.dataNumbers));
      let result = rule.dataChange(0, 2, -1, DIR_LEFT);
      expect(result.a).assertEqual(0);
      expect(result.b).assertEqual(2);
      BoardKit.expectAllZeros(rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(0);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_0300
     * @tc.name dataChangeNextMinusOneKeepsScore0300
     * @tc.desc Verify a minus one next index never changes a score already on the rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_nextMinusOneKeepsScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(board);
      rule.score = 256;
      BoardKit.log('dataChange_nextMinusOneKeepsScore', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 1, -1, DIR_RIGHT);
      expect(result.b).assertEqual(1);
      expect(rule.score).assertEqual(256);
      BoardKit.expectBoard(rule, board);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_0400
     * @tc.name dataChangeNextMinusOneBlocksMerge0400
     * @tc.desc Verify a minus one next index suppresses a merge that the cells would allow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_nextMinusOneBlocksMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 2, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_nextMinusOneBlocksMerge', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, -1, DIR_RIGHT);
      BoardKit.expectBoard(rule, board);
      expect(rule.dataNumbers[3]).assertEqual(2);
      expect(rule.dataNumbers[2]).assertEqual(2);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_0500
     * @tc.name dataChangeRightMoveIntoEmptyCell0500
     * @tc.desc Verify a tile moves to an empty right edge cell and the source cell becomes zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_rightMoveIntoEmptyCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_rightMoveIntoEmptyCell', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 1, DIR_RIGHT);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      expect(rule.dataNumbers[1]).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(4);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_0600
     * @tc.name dataChangeLeftMoveIntoEmptyCell0600
     * @tc.desc Verify a tile moves to an empty left edge cell on a left step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_leftMoveIntoEmptyCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_leftMoveIntoEmptyCell', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 0, 2, DIR_LEFT);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(4);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_0700
     * @tc.name dataChangeRightMoveReturnsBPlusOne0700
     * @tc.desc Verify a rightward move returns b increased by one while a stays unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_rightMoveReturnsBPlusOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 8, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_rightMoveReturnsBPlusOne', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 3, 2, DIR_RIGHT);
      expect(result.a).assertEqual(0);
      expect(result.b).assertEqual(4);
      expect(result.b !== 3).assertTrue();
      expect(rule.dataNumbers[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_0800
     * @tc.name dataChangeLeftMoveReturnsBMinusOne0800
     * @tc.desc Verify a leftward move returns b decreased by one while a stays unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_leftMoveReturnsBMinusOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.withRow(BoardKit.blank(), 2, [0, 0, 0, 8]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_leftMoveReturnsBMinusOne', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(2, 2, 3, DIR_LEFT);
      expect(result.a).assertEqual(2);
      expect(result.b).assertEqual(1);
      expect(result.b !== 2).assertTrue();
      expect(rule.dataNumbers[10]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_0900
     * @tc.name dataChangeMoveTouchesOnlySourceAndTarget0900
     * @tc.desc Verify a right move empties its source, fills its target and leaves an inner tile untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_moveTouchesOnlySourceAndTarget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 8, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_moveTouchesOnlySourceAndTarget', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 2, DIR_RIGHT);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(8);
      expect(BoardKit.positionsOf(rule.dataNumbers, 4)).assertContain(3);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_1000
     * @tc.name dataChangeMoveKeepsScore1000
     * @tc.desc Verify a pure move adds nothing to a non zero score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_moveKeepsScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      rule.score = 128;
      BoardKit.log('dataChange_moveKeepsScore', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 1, DIR_RIGHT);
      expect(rule.score).assertEqual(128);
      expect(rule.dataNumbers[3]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_1100
     * @tc.name dataChangeMoveLeavesOtherRowsUntouched1100
     * @tc.desc Verify a step applied to the first row cannot touch the second row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_moveLeavesOtherRowsUntouched', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 2, 0, 0],
        [4, 0, 4, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_moveLeavesOtherRowsUntouched', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 1, DIR_RIGHT);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 2]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [4, 0, 4, 0]);
      expect(rule.dataNumbers[7]).assertEqual(0);
      expect(rule.dataNumbers[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_1200
     * @tc.name dataChangeRightMoveInsideRow1200
     * @tc.desc Verify an interior right step returns b plus one so the caller rechecks the cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_rightMoveInsideRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_rightMoveInsideRow', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 2, 1, DIR_RIGHT);
      expect(result.b).assertEqual(3);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(0);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_1300
     * @tc.name dataChangeLeftMoveInsideRow1300
     * @tc.desc Verify an interior left step returns b minus one and fills the target cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_leftMoveInsideRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_leftMoveInsideRow', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 1, 2, DIR_LEFT);
      expect(result.b).assertEqual(0);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_1400
     * @tc.name dataChangeRightMoveAcrossTwoZeros1400
     * @tc.desc Verify a tile can be pulled across two empty cells in a single step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_rightMoveAcrossTwoZeros', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([8, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_rightMoveAcrossTwoZeros', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 3, 0, DIR_RIGHT);
      expect(result.b).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_1500
     * @tc.name dataChangeZeroOntoZeroKeepsBoard1500
     * @tc.desc Verify moving an empty source onto an empty target leaves the board unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_zeroOntoZeroKeepsBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      BoardKit.log('dataChange_zeroOntoZeroKeepsBoard', 'before ' + BoardKit.describe(rule.dataNumbers));
      let result = rule.dataChange(0, 2, 1, DIR_RIGHT);
      expect(result.b).assertEqual(3);
      BoardKit.expectAllZeros(rule.dataNumbers);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_1600
     * @tc.name dataChangeRightMergeDoublesPair1600
     * @tc.desc Verify two equal cells merge into their doubled value and the source becomes zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_rightMergeDoublesPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 2, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_rightMergeDoublesPair', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 2, DIR_RIGHT);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      expect(rule.dataNumbers[2]).assertEqual(0);
      BoardKit.expectScore(rule, 4);
      expect(firstCellOf(rule.dataNumbers, 2)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_1700
     * @tc.name dataChangeMergeKeepsOriginalB1700
     * @tc.desc Verify a merge returns the original branch index instead of an adjusted one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_mergeKeepsOriginalB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_mergeKeepsOriginalB', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 2, 1, DIR_RIGHT);
      expect(result.a).assertEqual(0);
      expect(result.b).assertEqual(2);
      expect(result.b !== 3).assertTrue();
      expect(rule.dataNumbers[2]).assertEqual(4);
      BoardKit.expectScore(rule, 4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_1800
     * @tc.name dataChangeMergeDoesNotChain1800
     * @tc.desc Verify a merge touches only the pair and never re-merges with a same valued tile further along
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_mergeDoesNotChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 0, 2, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_mergeDoesNotChain', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 2, DIR_RIGHT);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(4);
      BoardKit.expectScore(rule, 4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_1900
     * @tc.name dataChangeMergeAddsToExistingScore1900
     * @tc.desc Verify a merge adds the doubled value on top of a score already present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_mergeAddsToExistingScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 8, 8]);
      let rule: GameRule = BoardKit.rule(board);
      rule.score = 100;
      BoardKit.log('dataChange_mergeAddsToExistingScore', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 2, DIR_RIGHT);
      expect(rule.score).assertEqual(116);
      expect(rule.dataNumbers[3]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_2000
     * @tc.name dataChangeMergeClearsSourceCell2000
     * @tc.desc Verify the merged away source cell is reset to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_mergeClearsSourceCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 4, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_mergeClearsSourceCell', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 2, DIR_RIGHT);
      expect(rule.dataNumbers[3]).assertEqual(8);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(rule.dataNumbers[1]).assertEqual(0);
      BoardKit.expectScore(rule, 8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_2100
     * @tc.name dataChangeMergeReducesOccupancy2100
     * @tc.desc Verify one merge removes exactly one occupied cell from the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_mergeReducesOccupancy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 4, 4]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number = BoardKit.countNonZero(rule.dataNumbers);
      BoardKit.log('dataChange_mergeReducesOccupancy', 'before count ' + before);
      rule.dataChange(0, 3, 2, DIR_RIGHT);
      let after: number = BoardKit.countNonZero(rule.dataNumbers);
      expect(before).assertEqual(2);
      expect(after).assertEqual(1);
      expect(after).assertEqual(before - 1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_2200
     * @tc.name dataChangeMergeAcrossGap2200
     * @tc.desc Verify equal cells separated by empty cells still merge in one step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_mergeAcrossGap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_mergeAcrossGap', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 0, DIR_RIGHT);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(0);
      BoardKit.expectScore(rule, 4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_2300
     * @tc.name dataChangeLeftMergeKeepsOriginalIndex2300
     * @tc.desc Verify a leftward merge keeps a and b unchanged and clears the far source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_leftMergeKeepsOriginalIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 0, 0, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_leftMergeKeepsOriginalIndex', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 0, 3, DIR_LEFT);
      expect(result.a).assertEqual(0);
      expect(result.b).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[3]).assertEqual(0);
      BoardKit.expectScore(rule, 8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_2400
     * @tc.name dataChangeUnequalRightPairUnchanged2400
     * @tc.desc Verify a non equal right step leaves both cells and the index untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_unequalRightPairUnchanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 2, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_unequalRightPairUnchanged', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 3, 2, DIR_RIGHT);
      expect(result.b).assertEqual(3);
      BoardKit.expectBoard(rule, board);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_2500
     * @tc.name dataChangeUnequalLeftPairUnchanged2500
     * @tc.desc Verify a non equal left step leaves the row and score unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_unequalLeftPairUnchanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([8, 16, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_unequalLeftPairUnchanged', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 0, 1, DIR_LEFT);
      expect(result.a).assertEqual(0);
      expect(result.b).assertEqual(0);
      BoardKit.expectBoard(rule, board);
      expect(rule.dataNumbers[0]).assertEqual(8);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_2600
     * @tc.name dataChangeZeroTargetDoesNotMerge2600
     * @tc.desc Verify a filled cell next to an empty target neither moves nor merges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_zeroTargetDoesNotMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_zeroTargetDoesNotMerge', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 3, 2, DIR_RIGHT);
      expect(result.b).assertEqual(3);
      BoardKit.expectBoard(rule, board);
      expect(rule.dataNumbers[3]).assertEqual(2);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_2700
     * @tc.name dataChangeUnequalPairKeepsScore2700
     * @tc.desc Verify a non merging step cannot change a score already on the rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_unequalPairKeepsScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 2, 4]);
      let rule: GameRule = BoardKit.rule(board);
      rule.score = 64;
      BoardKit.log('dataChange_unequalPairKeepsScore', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 2, DIR_RIGHT);
      expect(rule.score).assertEqual(64);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_2800
     * @tc.name dataChangeUpMoveShiftsTile2800
     * @tc.desc Verify an up step moves a tile into the top cell of its column and clears the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_upMoveShiftsTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([0, 2, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_upMoveShiftsTile', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 0, 1, DIR_UP);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [2, 0, 4, 0]);
      expect(rule.dataNumbers[4]).assertEqual(0);
      expect(rule.dataNumbers[8]).assertEqual(4);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_2900
     * @tc.name dataChangeDownMoveShiftsTile2900
     * @tc.desc Verify a down step moves the nearest tile into the bottom cell of its column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_downMoveShiftsTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([0, 8, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_downMoveShiftsTile', 'before ' + BoardKit.describe(board));
      rule.dataChange(3, 0, 2, DIR_DOWN);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 8, 0, 4]);
      expect(rule.dataNumbers[8]).assertEqual(0);
      expect(rule.dataNumbers[12]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_3000
     * @tc.name dataChangeUpMoveReturnsAMinusOne3000
     * @tc.desc Verify an upward move at the top row returns a minus one with b unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_upMoveReturnsAMinusOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      board[6] = 8;
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_upMoveReturnsAMinusOne', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 2, 1, DIR_UP);
      expect(result.a).assertEqual(-1);
      expect(result.b).assertEqual(2);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(BoardKit.positionsOf(rule.dataNumbers, 8)).assertContain(2);
      expect(rule.dataNumbers[1]).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_3100
     * @tc.name dataChangeDownMoveReturnsAPlusOne3100
     * @tc.desc Verify a downward move at the bottom row returns a plus one with b unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_downMoveReturnsAPlusOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      board[8] = 16;
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_downMoveReturnsAPlusOne', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(3, 0, 2, DIR_DOWN);
      expect(result.a).assertEqual(4);
      expect(result.b).assertEqual(0);
      expect(result.a !== 3).assertTrue();
      expect(rule.dataNumbers[12]).assertEqual(16);
      expect(rule.dataNumbers[8]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_3200
     * @tc.name dataChangeUpMergeDoublesPair3200
     * @tc.desc Verify two equal cells in a column merge on an up step and score the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_upMergeDoublesPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([4, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_upMergeDoublesPair', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 0, 1, DIR_UP);
      expect(result.a).assertEqual(0);
      expect(result.b).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[4]).assertEqual(0);
      BoardKit.expectScore(rule, 8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_3300
     * @tc.name dataChangeDownMergeDoublesPair3300
     * @tc.desc Verify two equal cells in a column merge on a down step and keep the branch index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_downMergeDoublesPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([0, 0, 16, 16]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_downMergeDoublesPair', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(3, 0, 2, DIR_DOWN);
      expect(result.a).assertEqual(3);
      expect(result.b).assertEqual(0);
      expect(rule.dataNumbers[12]).assertEqual(32);
      expect(rule.dataNumbers[8]).assertEqual(0);
      BoardKit.expectScore(rule, 32);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_3400
     * @tc.name dataChangeVerticalMappingUsesRow3400
     * @tc.desc Verify an up step reads next as a row index by leaving a decoy tile in another column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_verticalMappingUsesRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      board[9] = 32;
      board[2] = 8;
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_verticalMappingUsesRow', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 1, 2, DIR_UP);
      expect(result.a).assertEqual(-1);
      expect(result.b).assertEqual(1);
      expect(rule.dataNumbers[1]).assertEqual(32);
      expect(rule.dataNumbers[9]).assertEqual(0);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_3500
     * @tc.name dataChangeHorizontalMappingUsesRow3500
     * @tc.desc Verify a right step reads next as a column index by leaving a decoy tile in another row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_horizontalMappingUsesRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      board[9] = 4;
      board[6] = 64;
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_horizontalMappingUsesRow', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(2, 3, 1, DIR_RIGHT);
      expect(result.a).assertEqual(2);
      expect(result.b).assertEqual(4);
      expect(rule.dataNumbers[11]).assertEqual(4);
      expect(rule.dataNumbers[9]).assertEqual(0);
      expect(rule.dataNumbers[6]).assertEqual(64);
      expect(rule.dataNumbers[8]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_3600
     * @tc.name dataChangeHorizontalLeftMappingUsesRow3600
     * @tc.desc Verify a left step from column zero returns minus one and keeps the row boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_horizontalLeftMappingUsesRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      board[6] = 8;
      board[8] = 2;
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_horizontalLeftMappingUsesRow', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(1, 0, 2, DIR_LEFT);
      expect(result.a).assertEqual(1);
      expect(result.b).assertEqual(-1);
      expect(rule.dataNumbers[4]).assertEqual(8);
      expect(rule.dataNumbers[6]).assertEqual(0);
      expect(rule.dataNumbers[8]).assertEqual(2);
      expect(rule.dataNumbers[5]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_3700
     * @tc.name dataChangeEveryRowRightTarget3700
     * @tc.desc Verify the right edge cell of every row can be reached by a single right step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_everyRowRightTarget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      BoardKit.log('dataChange_everyRowRightTarget', 'sweep four rows');
      for (let row: number = 0; row < SIDE; row++) {
        let board: number[] = BoardKit.blank();
        board[row * SIDE + 1] = 2;
        let rule: GameRule = BoardKit.rule(board);
        let result = rule.dataChange(row, SIDE - 1, 1, DIR_RIGHT);
        expect(result.a).assertEqual(row);
        expect(result.b).assertEqual(4);
        expect(rule.dataNumbers[row * SIDE + 3]).assertEqual(2);
        expect(rule.dataNumbers[row * SIDE + 1]).assertEqual(0);
        expect(BoardKit.positionsOf(rule.dataNumbers, 2)).assertContain(row * SIDE + 3);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_3800
     * @tc.name dataChangeEveryColumnTopTarget3800
     * @tc.desc Verify the top cell of every column can be reached by a single up step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_everyColumnTopTarget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      BoardKit.log('dataChange_everyColumnTopTarget', 'sweep four columns');
      for (let column: number = 0; column < SIDE; column++) {
        let board: number[] = BoardKit.blank();
        board[SIDE + column] = 4;
        let rule: GameRule = BoardKit.rule(board);
        let result = rule.dataChange(0, column, 1, DIR_UP);
        expect(result.a).assertEqual(-1);
        expect(result.b).assertEqual(column);
        expect(rule.dataNumbers[column]).assertEqual(4);
        expect(rule.dataNumbers[SIDE + column]).assertEqual(0);
        expect(rule.dataNumbers.length).assertEqual(CELLS);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_3900
     * @tc.name dataChangeTwoMergesAccumulateScore3900
     * @tc.desc Verify merges performed on two different rows add up on the shared score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_twoMergesAccumulateScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 2, 2],
        [0, 0, 4, 4],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_twoMergesAccumulateScore', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 2, DIR_RIGHT);
      expect(rule.score).assertEqual(4);
      rule.dataChange(1, 3, 2, DIR_RIGHT);
      expect(rule.score).assertEqual(12);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 0, 0, 8]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_4000
     * @tc.name dataChangeSequentialMoveThenMerge4000
     * @tc.desc Verify the index returned by a move can drive a second step that merges the pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_sequentialMoveThenMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_sequentialMoveThenMerge', 'before ' + BoardKit.describe(board));
      let first = rule.dataChange(0, 2, 0, DIR_RIGHT);
      expect(first.b).assertEqual(3);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2, 2]);
      expect(rule.score).assertEqual(0);
      let second = rule.dataChange(0, first.b, 2, DIR_RIGHT);
      expect(second.b).assertEqual(3);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      BoardKit.expectScore(rule, 4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_4100
     * @tc.name dataChangeMergeDoublesNonTileValue4100
     * @tc.desc Verify merging doubles an equal pair without validating it is a power of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_mergeDoublesNonTileValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 3, 3]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_mergeDoublesNonTileValue', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 2, DIR_RIGHT);
      expect(rule.dataNumbers[3]).assertEqual(6);
      expect(rule.dataNumbers[2]).assertEqual(0);
      BoardKit.expectScore(rule, 6);
      expect(BoardOracle.isPowerOfTwo(rule.dataNumbers[3])).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_4200
     * @tc.name dataChangeMergeLeavesOtherRowsUntouched4200
     * @tc.desc Verify a merge in the first row cannot modify cells of the second row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_mergeLeavesOtherRowsUntouched', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 4, 4],
        [8, 0, 8, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_mergeLeavesOtherRowsUntouched', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 2, DIR_RIGHT);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 8]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [8, 0, 8, 0]);
      expect(rule.dataNumbers[5]).assertEqual(0);
      expect(rule.dataNumbers[4]).assertEqual(8);
      BoardKit.expectScore(rule, 8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_4300
     * @tc.name dataChangeRightEdgeKeepsBoardLength4300
     * @tc.desc Verify a merge at the last cell does not append a seventeenth cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_rightEdgeKeepsBoardLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      board[13] = 4;
      board[15] = 4;
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_rightEdgeKeepsBoardLength', 'before ' + BoardKit.describe(board));
      rule.dataChange(3, 3, 1, DIR_RIGHT);
      expect(rule.dataNumbers[15]).assertEqual(8);
      expect(rule.dataNumbers[13]).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[CELLS]).assertUndefined();
      BoardKit.expectScore(rule, 8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_4400
     * @tc.name dataChangeMergeLargeTiles4400
     * @tc.desc Verify two 1024 tiles merge into 2048 and add 2048 to the score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_mergeLargeTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 1024, 1024]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_mergeLargeTiles', 'before ' + BoardKit.describe(board));
      rule.dataChange(0, 3, 2, DIR_RIGHT);
      expect(rule.dataNumbers[3]).assertEqual(2048);
      expect(rule.dataNumbers[2]).assertEqual(0);
      BoardKit.expectScore(rule, 2048);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_4500
     * @tc.name dataChangeLeftEdgeWritesStayInBoard4500
     * @tc.desc Verify a left step at cell zero writes nothing outside the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_leftEdgeWritesStayInBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      board[1] = 16;
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_leftEdgeWritesStayInBoard', 'before ' + BoardKit.describe(board));
      let result = rule.dataChange(0, 0, 1, DIR_LEFT);
      expect(result.b).assertEqual(-1);
      expect(rule.dataNumbers[0]).assertEqual(16);
      expect(rule.dataNumbers[1]).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[CELLS - 1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDATACHANGE_4600
     * @tc.name dataChangeSweepReplicatesOracle4600
     * @tc.desc Verify a sweep built from moveNext and dataChange reproduces the oracle right move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataChange_sweepReplicatesOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 4, 0],
        [0, 4, 4, 8],
        [2, 0, 2, 2],
        [16, 0, 0, 16]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('dataChange_sweepReplicatesOracle', 'before ' + BoardKit.describe(board));
      for (let row: number = 0; row < SIDE; row++) {
        sweepRowRight(rule, row);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(board, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 4]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 0, 0, 32]);
      BoardKit.expectScore(rule, 48);
      expect(BoardOracle.mergeScore(board, DIR_RIGHT)).assertEqual(48);
    });

    afterAll(() => {
      BoardKit.log('gameRuleDataChangeTest', 'suite end');
    });
  });
}
