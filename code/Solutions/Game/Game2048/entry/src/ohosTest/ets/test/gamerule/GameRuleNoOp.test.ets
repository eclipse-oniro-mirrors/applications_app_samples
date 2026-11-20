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
import { GameStatus } from '../../../../main/ets/muck/GameData';
import { BoardKit, CELLS, DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN } from '../common/Game2048TestKit';

/**
 * GameRule 无变化路径测试套件。
 *
 * 生产实现先记录 String(dataNumbers)，执行移动后再比较一次；只有两者不同时
 * 才补随机块并检测终局。因此「无变化」是一条独立且可观察的契约：盘面、score、
 * status 与 dataNumbers 引用都必须原样保留，且不允许出现任何新块。
 *
 * 本套件只覆盖无变化分支。移动后确实产生变化的补块行为由 MoveSpawn 套件负责，
 * 这里仅在末尾保留少量 moveInRow 反例，用来证明「无变化」不是断言恒真的假象。
 */
export default function gameRuleNoOpTest() {
  describe('gameRuleNoOpTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleNoOpTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleNoOpTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_0100
     * @tc.name gameRuleNoOpDeadBoardLeft0100
     * @tc.desc Verify a full dead board keeps every cell when moved left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_deadBoardLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, before);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_0200
     * @tc.name gameRuleNoOpDeadBoardRight0200
     * @tc.desc Verify a full dead board keeps its string snapshot when moved right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_deadBoardRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      let before: string = String(rule.dataNumbers);
      rule.move(DIR_RIGHT);
      expect(String(rule.dataNumbers)).assertEqual(before);
      expect(String(rule.dataNumbers)).assertContain('2,4,2,4');
      expect(rule.dataNumbers[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_0300
     * @tc.name gameRuleNoOpDeadBoardUp0300
     * @tc.desc Verify a full dead board keeps every cell when moved up
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_deadBoardUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_UP);
      for (let index: number = 0; index < CELLS; index++) {
        expect(rule.dataNumbers[index]).assertEqual(before[index]);
      }
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(48);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_0400
     * @tc.name gameRuleNoOpDeadBoardDown0400
     * @tc.desc Verify a full dead board keeps every cell when moved down
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_deadBoardDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_DOWN);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_0500
     * @tc.name gameRuleNoOpDeadBoardFourDirections0500
     * @tc.desc Verify a full dead board survives a four direction sweep unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_deadBoardFourDirections', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      let before: number[] = BoardKit.valuesOf(rule);
      for (let step: number = 0; step < directions.length; step++) {
        rule.move(directions[step]);
        BoardKit.expectValues(rule.dataNumbers, before);
        expect(rule.dataNumbers.length).assertEqual(CELLS);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_0600
     * @tc.name gameRuleNoOpDeadBoardNoSpawn0600
     * @tc.desc Verify a no-op move never spawns a tile on a full board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_deadBoardNoSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      expect(BoardKit.singleDifference(before, rule.dataNumbers)).assertEqual(-1);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_0700
     * @tc.name gameRuleNoOpDeadBoardStatusBefore0700
     * @tc.desc Verify a no-op move leaves the status at BEFORE even though the board is over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_deadBoardStatusBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      expect(rule.isGameOver()).assertTrue();
      BoardKit.expectStatus(rule, GameStatus.BEFORE);
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let step: number = 0; step < directions.length; step++) {
        rule.move(directions[step]);
        expect(rule.status).assertEqual(GameStatus.BEFORE);
      }
      expect(rule.status === GameStatus.OVER).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_0800
     * @tc.name gameRuleNoOpDeadBoardZeroScore0800
     * @tc.desc Verify a no-op move never adds score on a full board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_deadBoardZeroScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      let directions: string[] = [DIR_LEFT, DIR_UP, DIR_RIGHT, DIR_DOWN];
      for (let step: number = 0; step < directions.length; step++) {
        rule.move(directions[step]);
        expect(rule.score).assertEqual(0);
      }
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(48);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_0900
     * @tc.name gameRuleNoOpDeadBoardReference0900
     * @tc.desc Verify a no-op move keeps the same board array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_deadBoardReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      let reference: number[] = rule.dataNumbers;
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      expect(reference === rule.dataNumbers).assertTrue();
      BoardKit.expectValues(reference, before);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_1000
     * @tc.name gameRuleNoOpDeadBoardNoEmptyCell1000
     * @tc.desc Verify a full board still reports no empty cell after a no-op move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_deadBoardNoEmptyCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      let empty: number | null = firstZeroIndex(rule.dataNumbers);
      expect(empty).assertNull();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_1100
     * @tc.name gameRuleNoOpLeftEdgeTile1100
     * @tc.desc Verify a tile already on the left edge is not moved by a left move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_leftEdgeTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_LEFT);
      BoardKit.expectBoard(rule, values);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_1200
     * @tc.name gameRuleNoOpRightEdgeTile1200
     * @tc.desc Verify a tile already on the right edge is not moved by a right move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_rightEdgeTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([0, 0, 0, 4]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_RIGHT);
      BoardKit.expectBoard(rule, values);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_1300
     * @tc.name gameRuleNoOpTopEdgeTile1300
     * @tc.desc Verify a tile already on the top edge is not moved by an up move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_topEdgeTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([8]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_UP);
      BoardKit.expectNoSpawn(values, rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_1400
     * @tc.name gameRuleNoOpBottomEdgeTile1400
     * @tc.desc Verify a tile already on the bottom edge is not moved by a down move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_bottomEdgeTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([0, 0, 0, 16]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_DOWN);
      BoardKit.expectValues(rule.dataNumbers, values);
      expect(rule.dataNumbers[12]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_1500
     * @tc.name gameRuleNoOpCornerTileTwoEdges1500
     * @tc.desc Verify a corner tile satisfies both of its edge directions at once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_cornerTileTwoEdges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_LEFT);
      rule.move(DIR_UP);
      BoardKit.expectBoard(rule, values);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_1600
     * @tc.name gameRuleNoOpRowLeaderTile1600
     * @tc.desc Verify a leading tile stays put while the other three rows stay empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_rowLeaderTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[4] = 2;
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_LEFT);
      BoardKit.expectBoard(rule, values);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(15);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_1700
     * @tc.name gameRuleNoOpEdgeTileSum1700
     * @tc.desc Verify a no-op move keeps the tile sum of an edge tile board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_edgeTileSum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2]);
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(2);
      rule.move(DIR_LEFT);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(BoardKit.sum(values));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_1800
     * @tc.name gameRuleNoOpEdgeTileOccupancy1800
     * @tc.desc Verify a no-op move keeps both occupancy and the empty cell count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_edgeTileOccupancy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_LEFT);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(15);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_1900
     * @tc.name gameRuleNoOpBlankLeft1900
     * @tc.desc Verify an empty board is unchanged by a left move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_blankLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.move(DIR_LEFT);
      BoardKit.expectAllZeros(rule.dataNumbers);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_2000
     * @tc.name gameRuleNoOpBlankRight2000
     * @tc.desc Verify an empty board is unchanged by a right move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_blankRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let before: string = String(rule.dataNumbers);
      rule.move(DIR_RIGHT);
      expect(String(rule.dataNumbers)).assertEqual(before);
      expect(String(rule.dataNumbers)).assertContain('0,0,0,0');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_2100
     * @tc.name gameRuleNoOpBlankUp2100
     * @tc.desc Verify an empty board is unchanged by an up move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_blankUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.move(DIR_UP);
      BoardKit.expectAllZeros(rule.dataNumbers);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_2200
     * @tc.name gameRuleNoOpBlankDown2200
     * @tc.desc Verify an empty board is unchanged by a down move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_blankDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.move(DIR_DOWN);
      BoardKit.expectAllZeros(rule.dataNumbers);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_2300
     * @tc.name gameRuleNoOpBlankFourDirections2300
     * @tc.desc Verify an empty board stays empty across all four directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_blankFourDirections', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let step: number = 0; step < directions.length; step++) {
        rule.move(directions[step]);
        expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(0);
        BoardKit.expectAllZeros(rule.dataNumbers);
      }
      expect(rule.status).assertEqual(GameStatus.BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_2400
     * @tc.name gameRuleNoOpBlankNotGameOver2400
     * @tc.desc Verify an empty board keeps the BEFORE status and is not game over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_blankNotGameOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.move(DIR_LEFT);
      BoardKit.expectGameOver(rule, false);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_2500
     * @tc.name gameRuleNoOpUnknownDirection2500
     * @tc.desc Verify an unknown direction leaves a mergeable row untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_unknownDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move('diagonal');
      BoardKit.expectBoard(rule, values);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_2600
     * @tc.name gameRuleNoOpCompoundDirection2600
     * @tc.desc Verify a literal that merely embeds a valid token is still unknown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_compoundDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.horizontalPairBoard();
      let rule: GameRule = BoardKit.rule(values);
      rule.move('left-right');
      expect(String(rule.dataNumbers)).assertEqual(String(values));
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_2700
     * @tc.name gameRuleNoOpEmptyDirection2700
     * @tc.desc Verify an empty direction string leaves the board untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_emptyDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move('');
      BoardKit.expectValues(rule.dataNumbers, values);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_2800
     * @tc.name gameRuleNoOpPaddedDirection2800
     * @tc.desc Verify a trailing space in the direction string makes it unknown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_paddedDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move('left ');
      BoardKit.expectBoard(rule, values);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_2900
     * @tc.name gameRuleNoOpUnknownDirectionScore2900
     * @tc.desc Verify an unknown direction never adds score on a mergeable board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_unknownDirectionScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move('diagonal');
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_3000
     * @tc.name gameRuleNoOpUnknownDirectionStatus3000
     * @tc.desc Verify an unknown direction keeps a running status untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_unknownDirectionStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([4, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      rule.move('sideways');
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.status === 1).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_3100
     * @tc.name gameRuleNoOpUnknownDirectionMoveInRow3100
     * @tc.desc Verify moveInRow takes no branch for an unknown direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_unknownDirectionMoveInRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow('diagonal', 0);
      BoardKit.expectBoard(rule, values);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_3200
     * @tc.name gameRuleNoOpDirectionCaseSensitive3200
     * @tc.desc Verify LEFT keeps the board while left merges the pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_directionCaseSensitive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let upper: GameRule = BoardKit.rule(values);
      let lower: GameRule = BoardKit.rule(values);
      upper.move('LEFT');
      lower.move(DIR_LEFT);
      expect(String(upper.dataNumbers)).assertEqual(String(values));
      expect(String(lower.dataNumbers) === String(values)).assertFalse();
      expect(lower.score).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_3300
     * @tc.name gameRuleNoOpMoveKeepsPresetScore3300
     * @tc.desc Verify a no-op move does not reset an explicitly assigned score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_moveKeepsPresetScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2]);
      let rule: GameRule = BoardKit.rule(values);
      rule.score = 128;
      rule.move(DIR_LEFT);
      expect(rule.score).assertEqual(128);
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_3400
     * @tc.name gameRuleNoOpMoveKeepsRunningStatus3400
     * @tc.desc Verify a no-op move on a full board keeps the running status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_moveKeepsRunningStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.status = GameStatus.RUNNING;
      rule.move(DIR_LEFT);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_3500
     * @tc.name gameRuleNoOpMoveKeepsOverStatus3500
     * @tc.desc Verify a no-op move keeps an already assigned over status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_moveKeepsOverStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.status = GameStatus.OVER;
      rule.move(DIR_UP);
      expect(rule.status).assertEqual(GameStatus.OVER);
      expect(rule.status === 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_3600
     * @tc.name gameRuleNoOpLatentMergeWrongDirection3600
     * @tc.desc Verify a horizontal pair does not react to an up move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_latentMergeWrongDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.horizontalPairBoard();
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_UP);
      BoardKit.expectBoard(rule, values);
      expect(String(rule.dataNumbers)).assertContain('8,8,4,2');
      expect(rule.score).assertEqual(0);
      BoardKit.expectGameOver(rule, false);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_3700
     * @tc.name gameRuleNoOpVerticalPairWrongDirection3700
     * @tc.desc Verify a vertical pair does not react to a left move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_verticalPairWrongDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.verticalPairBoard();
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, values);
      expect(rule.dataNumbers[8]).assertEqual(16);
      expect(rule.dataNumbers[12]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_3800
     * @tc.name gameRuleNoOpNoSpawnCellByCell3800
     * @tc.desc Verify a no-op move keeps every cell identical one by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_noSpawnCellByCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      for (let index: number = 0; index < CELLS; index++) {
        expect(rule.dataNumbers[index]).assertEqual(before[index]);
      }
      expect(BoardKit.singleDifference(before, rule.dataNumbers)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_3900
     * @tc.name gameRuleNoOpBlankNoSpawn3900
     * @tc.desc Verify an empty board never gains a tile from a no-op move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_blankNoSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_UP);
      for (let index: number = 0; index < CELLS; index++) {
        expect(rule.dataNumbers[index]).assertEqual(0);
      }
      BoardKit.expectAllZeros(before);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_4000
     * @tc.name gameRuleNoOpZeroPositionsStable4000
     * @tc.desc Verify a full board keeps zero empty cells before and after a no-op move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_zeroPositionsStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.horizontalPairBoard();
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
      rule.move(DIR_UP);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_4100
     * @tc.name gameRuleNoOpTilePositionStable4100
     * @tc.desc Verify a right edge tile keeps its exact cell index through a no-op move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_tilePositionStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([0, 0, 0, 4]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_RIGHT);
      let positions: number[] = BoardKit.positionsOf(rule.dataNumbers, 4);
      expect(positions.length).assertEqual(1);
      expect(positions[0]).assertEqual(3);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_4200
     * @tc.name gameRuleNoOpSumPreservedUnknownDirection4200
     * @tc.desc Verify an unknown direction preserves the tile sum of a mergeable board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_sumPreservedUnknownDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move('diagonal');
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(4);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(BoardKit.sum(values));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_4300
     * @tc.name gameRuleNoOpOccupancyAcrossFourDirections4300
     * @tc.desc Verify a full board keeps sixteen occupied cells in every direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_occupancyAcrossFourDirections', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let step: number = 0; step < directions.length; step++) {
        rule.move(directions[step]);
        expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_4400
     * @tc.name gameRuleNoOpReferenceAfterMove4400
     * @tc.desc Verify a no-op whole board move keeps the board array identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_referenceAfterMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2]);
      let rule: GameRule = BoardKit.rule(values);
      let reference: number[] = rule.dataNumbers;
      rule.move(DIR_LEFT);
      expect(reference === rule.dataNumbers).assertTrue();
      expect(BoardKit.singleDifference(reference, values)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_4500
     * @tc.name gameRuleNoOpReferenceAfterMoveInRow4500
     * @tc.desc Verify moveInRow keeps the board array identity as well
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_referenceAfterMoveInRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      let reference: number[] = rule.dataNumbers;
      rule.moveInRow(DIR_LEFT, 0);
      expect(reference === rule.dataNumbers).assertTrue();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_4600
     * @tc.name gameRuleNoOpReferenceAfterUnknownDirection4600
     * @tc.desc Verify an unknown direction never replaces the board array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_referenceAfterUnknownDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      let reference: number[] = rule.dataNumbers;
      rule.move('diagonal');
      expect(reference === rule.dataNumbers).assertTrue();
      expect(reference !== rule.dataNumbers).assertFalse();
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_4700
     * @tc.name gameRuleNoOpTwentyLeftMovesStable4700
     * @tc.desc Verify twenty repeated left moves keep a dead board stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_twentyLeftMovesStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      let reference: number[] = rule.dataNumbers;
      let before: number[] = BoardKit.valuesOf(rule);
      for (let step: number = 0; step < 20; step++) {
        rule.move(DIR_LEFT);
        BoardKit.expectValues(rule.dataNumbers, before);
        expect(rule.score).assertEqual(0);
        expect(rule.status).assertEqual(GameStatus.BEFORE);
      }
      expect(reference === rule.dataNumbers).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_4800
     * @tc.name gameRuleNoOpPackedRowLeft4800
     * @tc.desc Verify an already packed row with distinct values does not move left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_packedRowLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), BoardKit.rowOf(values, 0));
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(cellAt(rule.dataNumbers, CELLS)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_4900
     * @tc.name gameRuleNoOpPackedRowRight4900
     * @tc.desc Verify a packed distinct row is also immobile to the right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_packedRowRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), BoardKit.rowOf(values, 0));
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_5000
     * @tc.name gameRuleNoOpPackedColumnUp5000
     * @tc.desc Verify a packed distinct column does not move up
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_packedColumnUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), BoardKit.columnOf(values, 0));
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_5100
     * @tc.name gameRuleNoOpPackedColumnDown5100
     * @tc.desc Verify a packed distinct column does not move down
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_packedColumnDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), BoardKit.columnOf(values, 0));
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_5200
     * @tc.name gameRuleNoOpEmptyLineAllDirections5200
     * @tc.desc Verify moveInRow leaves an empty line untouched in every direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_emptyLineAllDirections', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.moveInRow(DIR_LEFT, 0);
      rule.moveInRow(DIR_RIGHT, 0);
      rule.moveInRow(DIR_UP, 0);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.expectAllZeros(rule.dataNumbers);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_5300
     * @tc.name gameRuleNoOpMoveInRowReturnsUndefined5300
     * @tc.desc Verify moveInRow has no return value contract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_moveInRowReturnsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.moveInRow(DIR_LEFT, 0)).assertUndefined();
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 4, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_5400
     * @tc.name gameRuleNoOpMoveInRowLineIsolation5400
     * @tc.desc Verify moving one line leaves the three untouched rows byte for byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_moveInRowLineIsolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [0, 2, 0, 0],
        [0, 4, 0, 0],
        [8, 0, 0, 0],
        [0, 0, 16, 0]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 4, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [8, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 0, 16, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_5500
     * @tc.name gameRuleNoOpMoveInRowShiftScoresNothing5500
     * @tc.desc Verify a pure shift with no merge leaves the score at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_moveInRowShiftScoresNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([0, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 0, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_5600
     * @tc.name gameRuleNoOpMoveInRowLengthStable5600
     * @tc.desc Verify repeated line moves never change the sixteen cell length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_moveInRowLengthStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([0, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(values);
      for (let step: number = 0; step < 8; step++) {
        rule.moveInRow(DIR_LEFT, 0);
        expect(rule.dataNumbers.length).assertEqual(CELLS);
      }
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 0, 0, 0]);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_5700
     * @tc.name gameRuleNoOpMergedRowLeftAgain5700
     * @tc.desc Verify a row already merged to its left edge is immobile on the next left move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_mergedRowLeftAgain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 8, 0, 0]);
      expect(rule.score).assertEqual(12);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 8, 0, 0]);
      expect(rule.score).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_5800
     * @tc.name gameRuleNoOpMergedRowRightAgain5800
     * @tc.desc Verify a right packed merged row stays put on a repeated right move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_mergedRowRightAgain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 8]);
      expect(rule.score).assertEqual(12);
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 8]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_5900
     * @tc.name gameRuleNoOpMergedColumnUpAgain5900
     * @tc.desc Verify a column already merged to its top edge is immobile on the next up move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_mergedColumnUpAgain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      expect(rule.score).assertEqual(4);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      expect(rule.score).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_6000
     * @tc.name gameRuleNoOpMergedCellKeepsValue6000
     * @tc.desc Verify a single merged tile at the edge keeps its value and sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_mergedCellKeepsValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([8]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectBoard(rule, values);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(15);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_6100
     * @tc.name gameRuleNoOpContrastRowAwayFromEdge6100
     * @tc.desc Verify a lone row tile far from the move edge does move left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_contrastRowAwayFromEdge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([0, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(values);
      let beforeLine: string = String(BoardKit.rowOf(rule.dataNumbers, 0));
      rule.moveInRow(DIR_LEFT, 0);
      let afterLine: string = String(BoardKit.rowOf(rule.dataNumbers, 0));
      expect(beforeLine === afterLine).assertFalse();
      expect(BoardKit.rowOf(rule.dataNumbers, 0)[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_6200
     * @tc.name gameRuleNoOpContrastColumnAwayFromEdge6200
     * @tc.desc Verify a lone column tile far from the top edge does move up
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_contrastColumnAwayFromEdge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([0, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(values);
      let beforeLine: string = String(BoardKit.columnOf(rule.dataNumbers, 0));
      rule.moveInRow(DIR_UP, 0);
      let afterLine: string = String(BoardKit.columnOf(rule.dataNumbers, 0));
      expect(beforeLine === afterLine).assertFalse();
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[12]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_6300
     * @tc.name gameRuleNoOpTwoRowsPackedLeft6300
     * @tc.desc Verify two packed rows plus two empty rows survive a left move together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_twoRowsPackedLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 4, 0, 0],
        [0, 0, 0, 0],
        [8, 16, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_LEFT);
      BoardKit.expectBoard(rule, values);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_6400
     * @tc.name gameRuleNoOpTwoTilesPackedRow6400
     * @tc.desc Verify a two tile packed row keeps both tiles adjacent to the edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_twoTilesPackedRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_LEFT);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 4, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(6);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_6500
     * @tc.name gameRuleNoOpTwoTilesPackedColumn6500
     * @tc.desc Verify a two tile packed column keeps both tiles adjacent to the top
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_twoTilesPackedColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([2, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_UP);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [2, 4, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_6600
     * @tc.name gameRuleNoOpBlankKeepsPresetScore6600
     * @tc.desc Verify all four directions on an empty board leave a preset score alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_blankKeepsPresetScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.score = 64;
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let step: number = 0; step < directions.length; step++) {
        rule.move(directions[step]);
        expect(rule.score).assertEqual(64);
      }
      expect(rule.status).assertEqual(GameStatus.BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_6700
     * @tc.name gameRuleNoOpSparseRunningStatus6700
     * @tc.desc Verify a sparse no-op move keeps the running status and the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_sparseRunningStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      rule.move(DIR_LEFT);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      BoardKit.expectGameOver(rule, false);
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_6800
     * @tc.name gameRuleNoOpDeadBoardCanonicalTemplate6800
     * @tc.desc Verify a four direction sweep leaves the canonical dead board intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_deadBoardCanonicalTemplate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let step: number = 0; step < directions.length; step++) {
        rule.move(directions[step]);
      }
      let template: number[] = BoardKit.overBoard();
      for (let index: number = 0; index < CELLS; index++) {
        expect(rule.dataNumbers[index]).assertEqual(template[index]);
      }
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_6900
     * @tc.name gameRuleNoOpEmptyLineReferencePreserved6900
     * @tc.desc Verify moveInRow on an empty line keeps the board array identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_emptyLineReferencePreserved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let reference: number[] = rule.dataNumbers;
      rule.moveInRow(DIR_LEFT, 0);
      expect(reference === rule.dataNumbers).assertTrue();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      BoardKit.expectAllZeros(rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_7000
     * @tc.name gameRuleNoOpCornerTileReferenceAcrossMoves7000
     * @tc.desc Verify two successive edge no-ops on a corner tile keep one board object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_cornerTileReferenceAcrossMoves', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      let rule: GameRule = BoardKit.rule(values);
      let reference: number[] = rule.dataNumbers;
      rule.move(DIR_LEFT);
      rule.move(DIR_UP);
      expect(reference === rule.dataNumbers).assertTrue();
      expect(reference[0]).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_7100
     * @tc.name gameRuleNoOpLeftEdgeTilesTwoRows7100
     * @tc.desc Verify one tile per row on the left edge both stay put after a left move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_leftEdgeTilesTwoRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[12] = 4;
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_LEFT);
      BoardKit.expectBoard(rule, values);
      expect(BoardKit.positionsOf(rule.dataNumbers, 2)[0]).assertEqual(0);
      expect(BoardKit.positionsOf(rule.dataNumbers, 4)[0]).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_7200
     * @tc.name gameRuleNoOpRightEdgeTilesTwoRows7200
     * @tc.desc Verify one tile per row on the right edge both stay put after a right move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_rightEdgeTilesTwoRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[3] = 8;
      values[7] = 16;
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_RIGHT);
      BoardKit.expectValues(rule.dataNumbers, values);
      expect(BoardKit.positionsOf(rule.dataNumbers, 8)[0]).assertEqual(3);
      expect(BoardKit.positionsOf(rule.dataNumbers, 16)[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENOOP_7300
     * @tc.name gameRuleNoOpBottomEdgeTilesTwoColumns7300
     * @tc.desc Verify one tile per column on the bottom edge both stay put after a down move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noOp_bottomEdgeTilesTwoColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[12] = 8;
      values[15] = 16;
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_DOWN);
      BoardKit.expectBoard(rule, values);
      expect(rule.dataNumbers[12]).assertEqual(8);
      expect(rule.dataNumbers[15]).assertEqual(16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });
  });
}

/**
 * Returns the index of the first empty cell, or null when the board has none.
 * The null result is the explicit "board is full" marker used by the suite.
 */
function firstZeroIndex(values: number[]): number | null {
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] === 0) {
      return index;
    }
  }
  return null;
}

/**
 * Reads one cell, returning undefined when the index is past the board end.
 */
function cellAt(values: number[], index: number): number | undefined {
  return values[index];
}
