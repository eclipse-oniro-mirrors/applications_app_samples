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
import { DataType } from '../../../../main/ets/model/GameModuel';
import { GameStatus } from '../../../../main/ets/muck/GameData';
import { BoardKit, CELLS } from '../common/Game2048TestKit';

/**
 * Plain value object holding the three fields a rule exposes to the rest of the
 * page: the sixteen cell values, the accumulated score and the status code.
 * The constructor copies the incoming array so a snapshot never aliases the
 * live rule board.
 */
class RuleSnapshot {
  values: number[] = [];
  score: number = 0;
  status: number = 0;

  constructor(values: number[], score: number, status: number) {
    this.values = values.slice();
    this.score = score;
    this.status = status;
  }
}

/**
 * Shape of a snapshot after it has passed through JSON. Every field is
 * optional because a hand written or truncated JSON text may omit any of them.
 */
interface SnapshotJson {
  values?: number[];
  score?: number;
  status?: number;
}

/** Extracts a value snapshot from a live rule. */
function snapshotOf(rule: GameRule): RuleSnapshot {
  return new RuleSnapshot(rule.dataNumbers, rule.score, rule.status);
}

/** Rebuilds a fresh rule from a snapshot, score and status included. */
function ruleOfSnapshot(snapshot: RuleSnapshot): GameRule {
  let list: DataType[] = [];
  for (let index: number = 0; index < snapshot.values.length; index++) {
    list.push(new DataType(index, snapshot.values[index]));
  }
  let rule: GameRule = new GameRule(list);
  rule.score = snapshot.score;
  rule.status = snapshot.status;
  return rule;
}

/** Reads one cell of a snapshot, or undefined when the index is outside it. */
function snapshotCell(snapshot: RuleSnapshot, index: number): number | undefined {
  if (index < 0 || index >= snapshot.values.length) {
    return undefined;
  }
  return snapshot.values[index];
}

/** Serialises a snapshot into the three field JSON text used by the page. */
function encodeSnapshot(snapshot: RuleSnapshot): string {
  return JSON.stringify(snapshot);
}

/**
 * Rebuilds a snapshot from JSON text, defaulting any missing field. The values
 * are copied again so the decoded snapshot owns its array.
 */
function decodeSnapshot(text: string): RuleSnapshot {
  let parsed: SnapshotJson = JSON.parse(text) as SnapshotJson;
  let values: number[] = parsed.values === undefined ? [] : parsed.values;
  let score: number = parsed.score === undefined ? 0 : parsed.score;
  let status: number = parsed.status === undefined ? 0 : parsed.status;
  let copy: number[] = [];
  for (let index: number = 0; index < values.length; index++) {
    copy.push(values[index]);
  }
  return new RuleSnapshot(copy, score, status);
}

/**
 * Tolerant decoder used when the stored text may predate the snapshot format.
 * A text without any cell is reported as null so the caller can fall back.
 */
function decodeSnapshotOrNull(text: string): RuleSnapshot | null {
  let snapshot: RuleSnapshot = decodeSnapshot(text);
  if (snapshot.values.length === 0) {
    return null;
  }
  return snapshot;
}

/**
 * 规则快照测试套件。
 *
 * 快照是页面与持久化之间的中间表示：从 GameRule 取出 {values, score,
 * status} 三字段，既能做值比较，也能 JSON 往返，还能重建一个新 GameRule。
 * 本套件只验证快照本身的契约：字段一致性、值拷贝语义、四向移动后的更新、
 * JSON 往返、还原以及快照与规则之间的隔离。MyDataSource 的 JSON 形状由
 * Serialization 套件负责，这里不涉及。
 */
export default function gameSnapshotTest() {
  describe('gameSnapshotTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameSnapshotTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameSnapshotTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_0100
     * @tc.name gameSnapshotCoversSixteenCells0100
     * @tc.desc Verify a snapshot covers exactly the sixteen board cells and nothing beyond
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_coversSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      let snapshot: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_coversSixteenCells', 'cells=' + snapshot.values.length);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(snapshot.values.length).assertEqual(CELLS);
      let first: number | undefined = snapshotCell(snapshot, 0);
      let last: number | undefined = snapshotCell(snapshot, 15);
      let beyond: number | undefined = snapshotCell(snapshot, 16);
      expect(first).assertEqual(2);
      expect(last).assertEqual(0);
      expect(beyond).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_0200
     * @tc.name gameSnapshotPreservesCellOrder0200
     * @tc.desc Verify a snapshot keeps row-major order instead of sorting the cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_preservesCellOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 4, 8, 16],
        [32, 64, 128, 256],
        [512, 1024, 2048, 4096],
        [8192, 16384, 32768, 65536]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      let snapshot: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_preservesCellOrder', 'first=' + snapshot.values[0]);
      expect(snapshot.values[0]).assertEqual(2);
      expect(snapshot.values[3]).assertEqual(16);
      expect(snapshot.values[4]).assertEqual(32);
      expect(snapshot.values[15]).assertEqual(65536);
      BoardKit.expectValues(snapshot.values, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_0300
     * @tc.name gameSnapshotMirrorsFreshScore0300
     * @tc.desc Verify a freshly constructed rule reports a zero score inside the snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_mirrorsFreshScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([8, 8, 0, 0]));
      let snapshot: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_mirrorsFreshScore', 'score=' + snapshot.score);
      expect(rule.score).assertEqual(0);
      expect(snapshot.score).assertEqual(0);
      expect(snapshot.score).assertEqual(rule.score);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_0400
     * @tc.name gameSnapshotMirrorsBeforeStatus0400
     * @tc.desc Verify a rule that never started reports the BEFORE status inside the snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_mirrorsBeforeStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let snapshot: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_mirrorsBeforeStatus', 'status=' + snapshot.status);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(snapshot.status).assertEqual(-1);
      expect(snapshot.status).assertEqual(rule.status);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_0500
     * @tc.name gameSnapshotMirrorsRunningStatus0500
     * @tc.desc Verify the RUNNING status reached through init is carried into the snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_mirrorsRunningStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let snapshot: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_mirrorsRunningStatus', 'status=' + snapshot.status);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(snapshot.status).assertEqual(1);
      expect(snapshot.status === GameStatus.BEFORE).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_0600
     * @tc.name gameSnapshotMirrorsOverStatus0600
     * @tc.desc Verify an OVER status, the zero enum member, is not lost by the snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_mirrorsOverStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.status = GameStatus.OVER;
      let snapshot: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_mirrorsOverStatus', 'status=' + snapshot.status);
      expect(rule.status).assertEqual(GameStatus.OVER);
      expect(snapshot.status).assertEqual(0);
      expect(snapshot.status === GameStatus.RUNNING).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_0700
     * @tc.name gameSnapshotEmptyBoard0700
     * @tc.desc Verify a blank rule produces a snapshot of sixteen zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_emptyBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let snapshot: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_emptyBoard', 'cells=' + snapshot.values.length);
      expect(snapshot.values.length).assertEqual(CELLS);
      BoardKit.expectAllZeros(snapshot.values);
      expect(BoardKit.sum(snapshot.values)).assertEqual(0);
      expect(BoardKit.countNonZero(snapshot.values)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_0800
     * @tc.name gameSnapshotFullBoard0800
     * @tc.desc Verify a fully occupied rule yields a snapshot with no empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_fullBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      let snapshot: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_fullBoard', 'sum=' + BoardKit.sum(snapshot.values));
      expect(snapshot.values.length).assertEqual(CELLS);
      BoardKit.expectNoZero(snapshot.values);
      BoardKit.expectValues(snapshot.values, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_0900
     * @tc.name gameSnapshotSparsePattern0900
     * @tc.desc Verify a sparse rule keeps the exact positions of its occupied cells in the snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_sparsePattern', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[1] = 2;
      values[6] = 8;
      values[14] = 32;
      let rule: GameRule = BoardKit.rule(values);
      let snapshot: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_sparsePattern', 'nonZero=' + BoardKit.countNonZero(snapshot.values));
      expect(snapshot.values[1]).assertEqual(2);
      expect(snapshot.values[6]).assertEqual(8);
      expect(snapshot.values[14]).assertEqual(32);
      expect(BoardKit.countNonZero(snapshot.values)).assertEqual(3);
      expect(BoardKit.zeroPositions(snapshot.values).length).assertEqual(13);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_1000
     * @tc.name gameSnapshotValuesAreCopy1000
     * @tc.desc Verify rewriting a snapshot cell cannot reach back into the rule board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_valuesAreCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      let rule: GameRule = BoardKit.rule(values);
      let snapshot: RuleSnapshot = snapshotOf(rule);
      snapshot.values[0] = 4096;
      BoardKit.log('gameSnapshot_valuesAreCopy', 'snapshot=' + snapshot.values[0]);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(snapshot.values[0]).assertEqual(4096);
      expect(rule.dataNumbers === snapshot.values).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_1100
     * @tc.name gameSnapshotSurvivesRuleMutation1100
     * @tc.desc Verify moving the rule after taking a snapshot leaves the snapshot untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_survivesRuleMutation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      let snapshot: RuleSnapshot = snapshotOf(rule);
      rule.move('left');
      BoardKit.log('gameSnapshot_survivesRuleMutation', 'ruleFirst=' + rule.dataNumbers[0]);
      expect(snapshot.values[0]).assertEqual(2);
      expect(snapshot.values[1]).assertEqual(2);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(snapshot.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_1200
     * @tc.name gameSnapshotScoreIsCopy1200
     * @tc.desc Verify rewriting the snapshot score cannot change the rule score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_scoreIsCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.score = 64;
      let snapshot: RuleSnapshot = snapshotOf(rule);
      snapshot.score = 8192;
      BoardKit.log('gameSnapshot_scoreIsCopy', 'snapshotScore=' + snapshot.score);
      expect(rule.score).assertEqual(64);
      expect(snapshot.score).assertEqual(8192);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_1300
     * @tc.name gameSnapshotStatusIsCopy1300
     * @tc.desc Verify rewriting the snapshot status cannot change the rule status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_statusIsCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.status = GameStatus.RUNNING;
      let snapshot: RuleSnapshot = snapshotOf(rule);
      snapshot.status = GameStatus.OVER;
      BoardKit.log('gameSnapshot_statusIsCopy', 'snapshotStatus=' + snapshot.status);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(snapshot.status).assertEqual(GameStatus.OVER);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_1400
     * @tc.name gameSnapshotTwoSnapshotsAreIndependent1400
     * @tc.desc Verify two snapshots of one rule agree but do not share state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_twoSnapshotsAreIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([4, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      let first: RuleSnapshot = snapshotOf(rule);
      let second: RuleSnapshot = snapshotOf(rule);
      first.values[0] = 1024;
      first.score = 7;
      BoardKit.log('gameSnapshot_twoSnapshotsAreIndependent', 'secondFirst=' + second.values[0]);
      expect(second.values[0]).assertEqual(4);
      expect(second.score).assertEqual(0);
      expect(first.values[0] === second.values[0]).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_1500
     * @tc.name gameSnapshotAfterMoveLeft1500
     * @tc.desc Verify a left move merges the row and the snapshot shows the merged value at the left edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_afterMoveLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      rule.move('left');
      let snapshot: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_afterMoveLeft', 'first=' + snapshot.values[0]);
      expect(snapshot.values[0]).assertEqual(4);
      expect(BoardKit.countNonZero(snapshot.values)).assertEqual(2);
      expect(BoardKit.sum(snapshot.values) >= 6).assertTrue();
      BoardKit.expectValues(snapshot.values, rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_1600
     * @tc.name gameSnapshotAfterMoveRight1600
     * @tc.desc Verify a right move puts the merged tile at the right edge and the snapshot follows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_afterMoveRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      rule.move('right');
      let snapshot: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_afterMoveRight', 'right=' + snapshot.values[3]);
      expect(snapshot.values[3]).assertEqual(4);
      expect(BoardKit.countNonZero(snapshot.values)).assertEqual(2);
      expect(BoardKit.sum(snapshot.values) >= 6).assertTrue();
      BoardKit.expectValues(snapshot.values, rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_1700
     * @tc.name gameSnapshotAfterMoveUp1700
     * @tc.desc Verify an up move puts the merged tile at the top edge and the snapshot follows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_afterMoveUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      rule.move('up');
      let snapshot: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_afterMoveUp', 'top=' + snapshot.values[0]);
      expect(snapshot.values[0]).assertEqual(4);
      expect(BoardKit.countNonZero(snapshot.values)).assertEqual(2);
      expect(BoardKit.sum(snapshot.values) >= 6).assertTrue();
      BoardKit.expectValues(snapshot.values, rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_1800
     * @tc.name gameSnapshotAfterMoveDown1800
     * @tc.desc Verify a down move puts the merged tile at the bottom edge and the snapshot follows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_afterMoveDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      rule.move('down');
      let snapshot: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_afterMoveDown', 'bottom=' + snapshot.values[12]);
      expect(snapshot.values[12]).assertEqual(4);
      expect(BoardKit.countNonZero(snapshot.values)).assertEqual(2);
      expect(BoardKit.sum(snapshot.values) >= 6).assertTrue();
      BoardKit.expectValues(snapshot.values, rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_1900
     * @tc.name gameSnapshotCarriesMergeScore1900
     * @tc.desc Verify the score a merge adds reaches the snapshot taken after the move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_carriesMergeScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([8, 8, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      let before: RuleSnapshot = snapshotOf(rule);
      rule.move('left');
      let after: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_carriesMergeScore', 'score=' + after.score);
      expect(before.score).assertEqual(0);
      expect(after.score).assertEqual(16);
      expect(after.score).assertEqual(rule.score);
      expect(after.values[0]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_2000
     * @tc.name gameSnapshotAfterBlockedMove2000
     * @tc.desc Verify a move that changes nothing leaves the snapshot identical and spawns no tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_afterBlockedMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      let before: RuleSnapshot = snapshotOf(rule);
      rule.move('left');
      let after: RuleSnapshot = snapshotOf(rule);
      BoardKit.log('gameSnapshot_afterBlockedMove', 'sum=' + BoardKit.sum(after.values));
      BoardKit.expectValues(after.values, before.values);
      expect(after.score).assertEqual(before.score);
      expect(after.status).assertEqual(before.status);
      expect(BoardKit.countNonZero(after.values)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_2100
     * @tc.name gameSnapshotJsonValues2100
     * @tc.desc Verify JSON text carries every cell value back unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_jsonRoundTripValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      let snapshot: RuleSnapshot = snapshotOf(rule);
      let text: string = encodeSnapshot(snapshot);
      let decoded: RuleSnapshot = decodeSnapshot(text);
      BoardKit.log('gameSnapshot_jsonRoundTripValues', 'length=' + text.length);
      expect(text.length > 0).assertTrue();
      expect(decoded.values.length).assertEqual(CELLS);
      BoardKit.expectValues(decoded.values, snapshot.values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_2200
     * @tc.name gameSnapshotJsonScore2200
     * @tc.desc Verify a non zero score survives the JSON round trip exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_jsonRoundTripScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 4, 4, 4]));
      rule.score = 1024;
      let snapshot: RuleSnapshot = snapshotOf(rule);
      let decoded: RuleSnapshot = decodeSnapshot(encodeSnapshot(snapshot));
      BoardKit.log('gameSnapshot_jsonRoundTripScore', 'score=' + decoded.score);
      expect(snapshot.score).assertEqual(1024);
      expect(decoded.score).assertEqual(1024);
      expect(decoded.score).assertEqual(snapshot.score);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_2300
     * @tc.name gameSnapshotJsonStatus2300
     * @tc.desc Verify the negative BEFORE status survives the JSON round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_jsonRoundTripStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.status = GameStatus.BEFORE;
      let snapshot: RuleSnapshot = snapshotOf(rule);
      let decoded: RuleSnapshot = decodeSnapshot(encodeSnapshot(snapshot));
      BoardKit.log('gameSnapshot_jsonRoundTripStatus', 'status=' + decoded.status);
      expect(decoded.status).assertEqual(-1);
      expect(decoded.status).assertEqual(GameStatus.BEFORE);
      expect(decoded.status === GameStatus.RUNNING).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_2400
     * @tc.name gameSnapshotJsonFieldNames2400
     * @tc.desc Verify the JSON text exposes the three documented field names and no wrapper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_jsonFieldNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 0, 0, 0]));
      let text: string = encodeSnapshot(snapshotOf(rule));
      BoardKit.log('gameSnapshot_jsonFieldNames', 'text=' + text);
      expect(text).assertContain('"values"');
      expect(text).assertContain('"score"');
      expect(text).assertContain('"status"');
      expect(text.indexOf('"values"')).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_2500
     * @tc.name gameSnapshotJsonKeepsZeros2500
     * @tc.desc Verify empty cells are encoded as zeros rather than being dropped from the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_jsonKeepsZeros', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[15] = 4;
      let rule: GameRule = BoardKit.rule(values);
      let decoded: RuleSnapshot = decodeSnapshot(encodeSnapshot(snapshotOf(rule)));
      BoardKit.log('gameSnapshot_jsonKeepsZeros', 'zeros=' + BoardKit.zeroPositions(decoded.values).length);
      expect(decoded.values.length).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(decoded.values).length).assertEqual(14);
      expect(decoded.values[0]).assertEqual(2);
      expect(decoded.values[15]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_2600
     * @tc.name gameSnapshotRestoreBoard2600
     * @tc.desc Verify a snapshot rebuilds a rule whose board matches cell by cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_restoreBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 0, 0, 0],
        [0, 4, 0, 0],
        [0, 0, 8, 0],
        [0, 0, 0, 16]
      ]);
      let source: GameRule = BoardKit.rule(values);
      let snapshot: RuleSnapshot = snapshotOf(source);
      let restored: GameRule = ruleOfSnapshot(snapshot);
      BoardKit.log('gameSnapshot_restoreBoard', 'cells=' + restored.dataNumbers.length);
      expect(restored.dataNumbers.length).assertEqual(CELLS);
      BoardKit.expectBoard(restored, values);
      expect(restored.dataNumbers[5]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_2700
     * @tc.name gameSnapshotRestoreScore2700
     * @tc.desc Verify a snapshot restores the accumulated score into the new rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_restoreScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: GameRule = BoardKit.rule(BoardKit.row([2, 4, 8, 16]));
      source.score = 2048;
      let restored: GameRule = ruleOfSnapshot(snapshotOf(source));
      BoardKit.log('gameSnapshot_restoreScore', 'score=' + restored.score);
      expect(source.score).assertEqual(2048);
      expect(restored.score).assertEqual(2048);
      expect(restored.score).assertEqual(source.score);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_2800
     * @tc.name gameSnapshotRestoreStatus2800
     * @tc.desc Verify a snapshot restores the RUNNING status into the new rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_restoreStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: GameRule = BoardKit.rule(BoardKit.row([2, 4, 8, 16]));
      source.status = GameStatus.RUNNING;
      let restored: GameRule = ruleOfSnapshot(snapshotOf(source));
      BoardKit.log('gameSnapshot_restoreStatus', 'status=' + restored.status);
      expect(restored.status).assertEqual(GameStatus.RUNNING);
      expect(restored.status).assertEqual(1);
      expect(restored.status === GameStatus.BEFORE).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_2900
     * @tc.name gameSnapshotRestoredRuleIsIndependent2900
     * @tc.desc Verify mutating the restored rule cannot change the snapshot it came from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_restoredRuleIsIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      let snapshot: RuleSnapshot = snapshotOf(source);
      let restored: GameRule = ruleOfSnapshot(snapshot);
      restored.dataNumbers[0] = 512;
      restored.score = 100;
      BoardKit.log('gameSnapshot_restoredRuleIsIndependent', 'snapshotFirst=' + snapshot.values[0]);
      expect(snapshot.values[0]).assertEqual(2);
      expect(snapshot.score).assertEqual(0);
      expect(restored.dataNumbers[0]).assertEqual(512);
      expect(restored.dataNumbers === snapshot.values).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_3000
     * @tc.name gameSnapshotRestoredRuleKeepsPlaying3000
     * @tc.desc Verify a restored rule merges exactly like the original rule did
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_restoredRuleKeepsPlaying', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let source: GameRule = BoardKit.rule(values);
      source.status = GameStatus.RUNNING;
      let restored: GameRule = ruleOfSnapshot(snapshotOf(source));
      restored.move('left');
      BoardKit.log('gameSnapshot_restoredRuleKeepsPlaying', 'first=' + restored.dataNumbers[0]);
      expect(restored.dataNumbers[0]).assertEqual(4);
      expect(restored.score).assertEqual(4);
      expect(BoardKit.countNonZero(restored.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_3100
     * @tc.name gameSnapshotRestoreBlankBoard3100
     * @tc.desc Verify a blank snapshot restores an all zero rule that a move cannot change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_restoreBlankBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let snapshot: RuleSnapshot = snapshotOf(BoardKit.rule(BoardKit.blank()));
      let restored: GameRule = ruleOfSnapshot(snapshot);
      let before: number[] = BoardKit.valuesOf(restored);
      restored.move('left');
      BoardKit.log('gameSnapshot_restoreBlankBoard', 'nonZero=' + BoardKit.countNonZero(restored.dataNumbers));
      expect(restored.dataNumbers.length).assertEqual(CELLS);
      BoardKit.expectAllZeros(restored.dataNumbers);
      BoardKit.expectValues(restored.dataNumbers, before);
      expect(restored.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_3200
     * @tc.name gameSnapshotRestoreFullBoard3200
     * @tc.desc Verify a full snapshot restores sixteen occupied cells and the game over verdict
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_restoreFullBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      let source: GameRule = BoardKit.rule(values);
      source.status = GameStatus.OVER;
      let restored: GameRule = ruleOfSnapshot(snapshotOf(source));
      BoardKit.log('gameSnapshot_restoreFullBoard', 'sum=' + BoardKit.sum(restored.dataNumbers));
      BoardKit.expectNoZero(restored.dataNumbers);
      expect(BoardKit.countNonZero(restored.dataNumbers)).assertEqual(CELLS);
      expect(restored.isGameOver()).assertTrue();
      expect(restored.status).assertEqual(GameStatus.OVER);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_3300
     * @tc.name gameSnapshotRestoreAfterInit3300
     * @tc.desc Verify a snapshot taken after init restores two spawned tiles and the running status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_restoreAfterInit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: GameRule = BoardKit.rule(BoardKit.blank());
      source.init();
      let snapshot: RuleSnapshot = snapshotOf(source);
      let restored: GameRule = ruleOfSnapshot(snapshot);
      BoardKit.log('gameSnapshot_restoreAfterInit', 'nonZero=' + BoardKit.countNonZero(restored.dataNumbers));
      expect(BoardKit.countNonZero(restored.dataNumbers)).assertEqual(2);
      expect(restored.status).assertEqual(GameStatus.RUNNING);
      expect(restored.score).assertEqual(0);
      expect(snapshot.values.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_3400
     * @tc.name gameSnapshotRoundTripIsIdempotent3400
     * @tc.desc Verify snapshot to JSON to rule to snapshot reproduces the same three fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_roundTripIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 4, 4]);
      let source: GameRule = BoardKit.rule(values);
      source.status = GameStatus.RUNNING;
      source.move('left');
      let first: RuleSnapshot = snapshotOf(source);
      let decoded: RuleSnapshot = decodeSnapshot(encodeSnapshot(first));
      let rebuilt: GameRule = ruleOfSnapshot(decoded);
      let second: RuleSnapshot = snapshotOf(rebuilt);
      BoardKit.log('gameSnapshot_roundTripIsIdempotent', 'score=' + second.score);
      expect(second.score).assertEqual(first.score);
      expect(second.status).assertEqual(first.status);
      BoardKit.expectValues(second.values, first.values);
      expect(second.values === first.values).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_3500
     * @tc.name gameSnapshotStaysFrozenAfterLaterMoves3500
     * @tc.desc Verify a snapshot taken before several moves keeps reporting the state at capture time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_staysFrozenAfterLaterMoves', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 4, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let source: GameRule = BoardKit.rule(values);
      source.status = GameStatus.RUNNING;
      let frozen: RuleSnapshot = snapshotOf(source);
      source.move('left');
      source.move('down');
      BoardKit.log('gameSnapshot_staysFrozenAfterLaterMoves', 'frozenFirst=' + frozen.values[0]);
      expect(frozen.values[0]).assertEqual(2);
      expect(frozen.values[4]).assertEqual(4);
      expect(frozen.score).assertEqual(0);
      BoardKit.expectValues(frozen.values, values);
      expect(source.score > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_3600
     * @tc.name gameSnapshotDecodeWithoutValues3600
     * @tc.desc Verify JSON text that omits the values field decodes to null instead of a board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_decodeWithoutValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = '{"score":12,"status":1}';
      let snapshot: RuleSnapshot | null = decodeSnapshotOrNull(text);
      BoardKit.log('gameSnapshot_decodeWithoutValues', 'text=' + text);
      expect(snapshot).assertNull();
      expect(text).assertContain('"score"');
      expect(text.indexOf('"values"') < 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_3700
     * @tc.name gameSnapshotJsonKeepsOverStatus3700
     * @tc.desc Verify the OVER status, whose value is the falsy zero, is not replaced by a default during decoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_jsonKeepsOverStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: GameRule = BoardKit.rule(BoardKit.row([2, 4, 8, 16]));
      source.status = GameStatus.OVER;
      let text: string = encodeSnapshot(snapshotOf(source));
      let decoded: RuleSnapshot = decodeSnapshot(text);
      BoardKit.log('gameSnapshot_jsonKeepsOverStatus', 'status=' + decoded.status);
      expect(decoded.status).assertEqual(0);
      expect(decoded.status).assertEqual(GameStatus.OVER);
      expect(decoded.status === GameStatus.BEFORE).assertFalse();
      expect(text).assertContain('"status":0');
    });

    /**
     * @tc.number SUB_GAME2048_GAMESNAPSHOT_3800
     * @tc.name gameSnapshotDecodeDefaultsMissingFields3800
     * @tc.desc Verify a values only text fills a zero score and a zero status, which equals the OVER member
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSnapshot_decodeDefaultsMissingFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = '{"values":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]}';
      let snapshot: RuleSnapshot = decodeSnapshot(text);
      BoardKit.log('gameSnapshot_decodeDefaultsMissingFields', 'status=' + snapshot.status);
      expect(snapshot.values.length).assertEqual(CELLS);
      BoardKit.expectAllZeros(snapshot.values);
      expect(snapshot.score).assertEqual(0);
      expect(snapshot.status).assertEqual(GameStatus.OVER);
      expect(text.indexOf('"score"') < 0).assertTrue();
    });
  });
}
