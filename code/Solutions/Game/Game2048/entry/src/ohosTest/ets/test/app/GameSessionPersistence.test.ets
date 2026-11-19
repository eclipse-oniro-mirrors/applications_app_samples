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
import data_preferences from '@ohos.data.preferences';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import application from '@ohos.app.ability.application';
import { GameRule } from '../../../../main/ets/model/GameRule';
import { DataType } from '../../../../main/ets/model/GameModuel';
import { GameStatus } from '../../../../main/ets/muck/GameData';
import { BoardKit, CELLS } from '../common/Game2048TestKit';

/** Preferences store dedicated to the session snapshot of this suite. */
const STORE_NAME: string = 'game2048_session_store';
/** Key that carries the sixteen board cells as JSON. */
const KEY_BOARD: string = 'gameData';
/** Key that carries the accumulated score as a decimal string. */
const KEY_SCORE: string = 'score';
/** Key that carries the status code as a decimal string. */
const KEY_STATUS: string = 'gameStatus';

/** Value object holding the three fields read back from the store. */
class StoredSession {
  values: number[] = [];
  score: number = 0;
  status: number = 0;
}

/** Result of the tolerant board decoder: a flag plus whatever cells survived. */
class ParseOutcome {
  ok: boolean = false;
  values: number[] = [];
}

/** Returns the application context owned by the test ability. */
function appContext(): common.Context {
  return application.getApplicationContext();
}

/** Opens the session store with the application context of the test ability. */
async function openSessionStore(): Promise<data_preferences.Preferences> {
  let context: common.Context = appContext();
  return await data_preferences.getPreferences(context, STORE_NAME);
}

/** Removes every key of the session store and flushes the removal. */
async function clearSessionStore(store: data_preferences.Preferences): Promise<void> {
  await store.clear();
  await store.flush();
}

/**
 * Mirrors Index.ets handleLocalData('put'): the board becomes JSON, the score
 * and the status become decimal strings, then flush persists all three.
 */
async function writeSession(store: data_preferences.Preferences, rule: GameRule): Promise<void> {
  await store.put(KEY_BOARD, JSON.stringify(rule.dataNumbers));
  await store.put(KEY_SCORE, rule.score.toString());
  await store.put(KEY_STATUS, rule.status.toString());
  await store.flush();
}

/**
 * Mirrors Index.ets handleLocalData('has'): the three keys are read back and
 * converted, with the documented defaults used when a key is absent.
 */
async function readSession(store: data_preferences.Preferences): Promise<StoredSession> {
  let session: StoredSession = new StoredSession();
  let boardText: string = (await store.get(KEY_BOARD, '[]')) as string;
  let scoreText: string = (await store.get(KEY_SCORE, '0')) as string;
  let statusText: string = (await store.get(KEY_STATUS, '-1')) as string;
  let raw: number[] = JSON.parse(boardText) as number[];
  for (let index: number = 0; index < raw.length; index++) {
    session.values.push(raw[index]);
  }
  session.score = Number(scoreText);
  session.status = Number(statusText);
  return session;
}

/** Rebuilds a rule from a stored session, score and status included. */
function restoreRule(session: StoredSession): GameRule {
  let list: DataType[] = [];
  for (let index: number = 0; index < session.values.length; index++) {
    list.push(new DataType(index, session.values[index]));
  }
  let rule: GameRule = new GameRule(list);
  rule.score = session.score;
  rule.status = session.status;
  return rule;
}

/**
 * Reads one stored cell, or undefined when the index falls outside the stored
 * board. Mirrors the guard a caller needs before indexing the restored board.
 */
function cellAt(session: StoredSession, index: number): number | undefined {
  if (index < 0 || index >= session.values.length) {
    return undefined;
  }
  return session.values[index];
}

/**
 * Tolerant mirror of the production JSON.parse call: malformed text yields a
 * failed outcome with no cells instead of throwing out of the caller.
 */
function decodeBoardSafely(text: string): ParseOutcome {
  let outcome: ParseOutcome = new ParseOutcome();
  try {
    let parsed: number[] = JSON.parse(text) as number[];
    for (let index: number = 0; index < parsed.length; index++) {
      outcome.values.push(parsed[index]);
    }
    outcome.ok = true;
  } catch (error) {
    BoardKit.warn('decodeBoardSafely', 'board text rejected by JSON.parse');
    outcome.ok = false;
    outcome.values = [];
  }
  return outcome;
}

/**
 * Converts stored score text the way the page does through Number(), but keeps
 * a null marker when the text is not numeric. Number('') is zero, so an empty
 * string must never be treated as a valid stored score.
 */
function scoreOrNull(text: string): number | null {
  let value: number = Number(text);
  if (isNaN(value)) {
    return null;
  }
  return value;
}

/**
 * 会话落盘与恢复测试套件。
 *
 * 页面用 preferences 把规则快照写成三个键（gameData / score / gameStatus），
 * 启动时按同样的三个键恢复。本套件在与页面相互独立的 game2048_session_store
 * 上加盖同一份契约：写后读一致、连续两次落盘覆盖、多步移动后落盘、
 * 恢复后盘面/分数/状态一致、恢复后能继续走子，以及坏 JSON 的容错分支。
 * 每个用例结束都清空 store，避免用例之间互相污染。
 */
export default function gameSessionPersistenceTest() {
  describe('gameSessionPersistenceTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameSessionPersistenceTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameSessionPersistenceTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_0100
     * @tc.name gameSessionWritesBoard0100
     * @tc.desc Verify the sixteen board cells written under gameData read back unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_writesBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      await writeSession(store, rule);
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_writesBoard', 'cells=' + session.values.length);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(session.values.length).assertEqual(CELLS);
      BoardKit.expectValues(session.values, values);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_0200
     * @tc.name gameSessionWritesZeroScore0200
     * @tc.desc Verify a freshly started session persists the zero score as the one character text 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_writesZeroScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      await writeSession(store, rule);
      let scoreText: string = (await store.get(KEY_SCORE, '')) as string;
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_writesZeroScore', 'scoreText=' + scoreText);
      expect(rule.score).assertEqual(0);
      expect(scoreText).assertEqual('0');
      expect(scoreText.length).assertEqual(1);
      expect(session.score).assertEqual(0);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_0300
     * @tc.name gameSessionWritesRunningStatus0300
     * @tc.desc Verify the RUNNING status is persisted as the text 1 and restored as one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_writesRunningStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 4, 8, 16]));
      rule.status = GameStatus.RUNNING;
      await writeSession(store, rule);
      let statusText: string = (await store.get(KEY_STATUS, '')) as string;
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_writesRunningStatus', 'statusText=' + statusText);
      expect(statusText).assertEqual('1');
      expect(session.status).assertEqual(1);
      expect(session.status).assertEqual(GameStatus.RUNNING);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_0400
     * @tc.name gameSessionWritesBeforeStatus0400
     * @tc.desc Verify the negative BEFORE status survives as the text minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_writesBeforeStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      await writeSession(store, rule);
      let statusText: string = (await store.get(KEY_STATUS, '')) as string;
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_writesBeforeStatus', 'statusText=' + statusText);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(statusText).assertEqual('-1');
      expect(session.status).assertEqual(-1);
      expect(session.status === GameStatus.RUNNING).assertFalse();
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_0500
     * @tc.name gameSessionWritesThreeKeys0500
     * @tc.desc Verify a save exposes exactly the three session keys and all of them are present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_writesThreeKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      rule.status = GameStatus.RUNNING;
      await writeSession(store, rule);
      let hasBoard: boolean = await store.has(KEY_BOARD);
      let hasScore: boolean = await store.has(KEY_SCORE);
      let hasStatus: boolean = await store.has(KEY_STATUS);
      BoardKit.log('gameSession_writesThreeKeys', 'board=' + hasBoard + ' score=' + hasScore);
      expect(hasBoard).assertTrue();
      expect(hasScore).assertTrue();
      expect(hasStatus).assertTrue();
      expect(hasBoard).assertEqual(hasStatus);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_0600
     * @tc.name gameSessionClearRemovesKeys0600
     * @tc.desc Verify clearing the store drops all three session keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_clearRemovesKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 4, 0, 0]));
      await writeSession(store, rule);
      await clearSessionStore(store);
      let hasBoard: boolean = await store.has(KEY_BOARD);
      let hasScore: boolean = await store.has(KEY_SCORE);
      let hasStatus: boolean = await store.has(KEY_STATUS);
      BoardKit.log('gameSession_clearRemovesKeys', 'board=' + hasBoard);
      expect(hasBoard).assertFalse();
      expect(hasScore).assertFalse();
      expect(hasStatus).assertFalse();
      expect(hasBoard === true).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_0700
     * @tc.name gameSessionSecondSaveWins0700
     * @tc.desc Verify a second save replaces the stored board instead of appending to it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_secondSaveWins', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let first: GameRule = BoardKit.rule(BoardKit.row([2, 0, 0, 0]));
      let second: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      second.status = GameStatus.RUNNING;
      await writeSession(store, first);
      await writeSession(store, second);
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_secondSaveWins', 'cells=' + session.values.length);
      expect(session.values.length).assertEqual(CELLS);
      expect(session.values[0]).assertEqual(2);
      expect(session.values[1]).assertEqual(2);
      expect(session.values[1] === 0).assertFalse();
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_0800
     * @tc.name gameSessionSecondScoreWins0800
     * @tc.desc Verify a second save replaces a smaller stored score with the newer one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_secondScoreWins', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let first: GameRule = BoardKit.rule(BoardKit.blank());
      first.score = 4;
      let second: GameRule = BoardKit.rule(BoardKit.blank());
      second.score = 128;
      await writeSession(store, first);
      await writeSession(store, second);
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_secondScoreWins', 'score=' + session.score);
      expect(first.score).assertEqual(4);
      expect(second.score).assertEqual(128);
      expect(session.score).assertEqual(128);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_0900
     * @tc.name gameSessionSecondStatusWins0900
     * @tc.desc Verify a second save replaces BEFORE with OVER in the stored status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_secondStatusWins', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let first: GameRule = BoardKit.rule(BoardKit.blank());
      let second: GameRule = BoardKit.rule(BoardKit.overBoard());
      second.status = GameStatus.OVER;
      await writeSession(store, first);
      await writeSession(store, second);
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_secondStatusWins', 'status=' + session.status);
      expect(first.status).assertEqual(GameStatus.BEFORE);
      expect(session.status).assertEqual(GameStatus.OVER);
      expect(session.status).assertEqual(0);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_1000
     * @tc.name gameSessionPersistsAfterMoves1000
     * @tc.desc Verify the board stored after two moves equals the live rule board cell by cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_persistsAfterMoves', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 4, 4]));
      rule.status = GameStatus.RUNNING;
      rule.move('left');
      rule.move('down');
      await writeSession(store, rule);
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_persistsAfterMoves', 'sum=' + BoardKit.sum(session.values));
      expect(session.values.length).assertEqual(CELLS);
      BoardKit.expectValues(session.values, rule.dataNumbers);
      expect(BoardKit.countNonZero(session.values)).assertEqual(BoardKit.countNonZero(rule.dataNumbers));
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_1100
     * @tc.name gameSessionPersistsScoreAfterMoves1100
     * @tc.desc Verify the score stored after a merging move equals the live rule score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_persistsScoreAfterMoves', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let rule: GameRule = BoardKit.rule(BoardKit.row([8, 8, 0, 0]));
      rule.status = GameStatus.RUNNING;
      rule.move('left');
      await writeSession(store, rule);
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_persistsScoreAfterMoves', 'score=' + session.score);
      expect(rule.score).assertEqual(16);
      expect(session.score).assertEqual(16);
      expect(session.score).assertEqual(rule.score);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_1200
     * @tc.name gameSessionRestoresBoard1200
     * @tc.desc Verify restoring rebuilds a rule whose board matches the saved board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_restoresBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[5] = 4;
      values[15] = 8;
      let saved: GameRule = BoardKit.rule(values);
      await writeSession(store, saved);
      let session: StoredSession = await readSession(store);
      let restored: GameRule = restoreRule(session);
      BoardKit.log('gameSession_restoresBoard', 'cells=' + restored.dataNumbers.length);
      expect(restored.dataNumbers.length).assertEqual(CELLS);
      BoardKit.expectBoard(restored, values);
      expect(restored.dataNumbers[5]).assertEqual(4);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_1300
     * @tc.name gameSessionRestoresScore1300
     * @tc.desc Verify restoring carries the saved score into the new rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_restoresScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.row([2, 4, 8, 16]));
      saved.score = 512;
      await writeSession(store, saved);
      let restored: GameRule = restoreRule(await readSession(store));
      BoardKit.log('gameSession_restoresScore', 'score=' + restored.score);
      expect(restored.score).assertEqual(512);
      expect(restored.score).assertEqual(saved.score);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_1400
     * @tc.name gameSessionRestoresStatus1400
     * @tc.desc Verify restoring carries the saved RUNNING status into the new rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_restoresStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.row([2, 4, 8, 16]));
      saved.status = GameStatus.RUNNING;
      await writeSession(store, saved);
      let restored: GameRule = restoreRule(await readSession(store));
      BoardKit.log('gameSession_restoresStatus', 'status=' + restored.status);
      expect(restored.status).assertEqual(GameStatus.RUNNING);
      expect(restored.status).assertEqual(1);
      expect(restored.status === GameStatus.BEFORE).assertFalse();
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_1500
     * @tc.name gameSessionRestoredRuleMovesLeft1500
     * @tc.desc Verify a restored rule merges a horizontal pair to the left exactly as the page expects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_restoredRuleMovesLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      saved.status = GameStatus.RUNNING;
      await writeSession(store, saved);
      let restored: GameRule = restoreRule(await readSession(store));
      restored.move('left');
      BoardKit.log('gameSession_restoredRuleMovesLeft', 'first=' + restored.dataNumbers[0]);
      expect(restored.dataNumbers[0]).assertEqual(4);
      expect(restored.score).assertEqual(4);
      expect(BoardKit.countNonZero(restored.dataNumbers)).assertEqual(2);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_1600
     * @tc.name gameSessionRestoredRuleMovesUp1600
     * @tc.desc Verify a restored rule merges a vertical pair upward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_restoredRuleMovesUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.column([4, 4, 0, 0]));
      saved.status = GameStatus.RUNNING;
      await writeSession(store, saved);
      let restored: GameRule = restoreRule(await readSession(store));
      restored.move('up');
      BoardKit.log('gameSession_restoredRuleMovesUp', 'top=' + restored.dataNumbers[0]);
      expect(restored.dataNumbers[0]).assertEqual(8);
      expect(restored.score).assertEqual(8);
      expect(BoardKit.countNonZero(restored.dataNumbers)).assertEqual(2);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_1700
     * @tc.name gameSessionRestoredRuleMovesDown1700
     * @tc.desc Verify a restored rule merges a vertical pair downward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_restoredRuleMovesDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.column([4, 4, 0, 0]));
      saved.status = GameStatus.RUNNING;
      await writeSession(store, saved);
      let restored: GameRule = restoreRule(await readSession(store));
      restored.move('down');
      BoardKit.log('gameSession_restoredRuleMovesDown', 'bottom=' + restored.dataNumbers[12]);
      expect(restored.dataNumbers[12]).assertEqual(8);
      expect(restored.score).assertEqual(8);
      expect(BoardKit.countNonZero(restored.dataNumbers)).assertEqual(2);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_1800
     * @tc.name gameSessionScoreTextConverts1800
     * @tc.desc Verify a stored score text converts back to the same number through Number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_scoreTextConverts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.blank());
      saved.score = 4096;
      await writeSession(store, saved);
      let scoreText: string = (await store.get(KEY_SCORE, '')) as string;
      let converted: number | null = scoreOrNull(scoreText);
      BoardKit.log('gameSession_scoreTextConverts', 'text=' + scoreText);
      expect(scoreText).assertEqual('4096');
      expect(converted).assertEqual(4096);
      expect(converted === null).assertFalse();
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_1900
     * @tc.name gameSessionStatusTextConverts1900
     * @tc.desc Verify the stored status text minus one converts back to the BEFORE member
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_statusTextConverts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.blank());
      await writeSession(store, saved);
      let statusText: string = (await store.get(KEY_STATUS, '')) as string;
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_statusTextConverts', 'text=' + statusText);
      expect(statusText).assertEqual('-1');
      expect(Number(statusText)).assertEqual(-1);
      expect(session.status).assertEqual(GameStatus.BEFORE);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_2000
     * @tc.name gameSessionLargeScoreRoundTrip2000
     * @tc.desc Verify a six digit score keeps every digit through the string round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_largeScoreRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.row([2, 4, 8, 16]));
      saved.score = 131072;
      await writeSession(store, saved);
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_largeScoreRoundTrip', 'score=' + session.score);
      expect(session.score).assertEqual(131072);
      expect(session.score > 99999).assertTrue();
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_2100
     * @tc.name gameSessionBadJsonFailsSafely2100
     * @tc.desc Verify truncated board text reports a failed decode instead of throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_badJsonFailsSafely', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let broken: string = '{"values":[2,4';
      await store.put(KEY_BOARD, broken);
      await store.flush();
      let text: string = (await store.get(KEY_BOARD, '')) as string;
      let outcome: ParseOutcome = decodeBoardSafely(text);
      BoardKit.log('gameSession_badJsonFailsSafely', 'length=' + text.length);
      expect(text).assertEqual(broken);
      expect(outcome.ok).assertFalse();
      expect(outcome.ok === true).assertFalse();
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_2200
     * @tc.name gameSessionBadJsonYieldsNoCells2200
     * @tc.desc Verify a failed decode returns an empty cell list so the caller can fall back to a new game
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_badJsonYieldsNoCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      await store.put(KEY_BOARD, 'not-json');
      await store.flush();
      let text: string = (await store.get(KEY_BOARD, '')) as string;
      let outcome: ParseOutcome = decodeBoardSafely(text);
      BoardKit.log('gameSession_badJsonYieldsNoCells', 'cells=' + outcome.values.length);
      expect(outcome.values.length).assertEqual(0);
      expect(text.length).assertEqual(8);
      expect(text).assertContain('not');
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_2300
     * @tc.name gameSessionSparseBoardRoundTrip2300
     * @tc.desc Verify a sparse board keeps every empty cell instead of compacting the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_sparseBoardRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[10] = 16;
      let saved: GameRule = BoardKit.rule(values);
      await writeSession(store, saved);
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_sparseBoardRoundTrip', 'zeros=' + BoardKit.zeroPositions(session.values).length);
      expect(session.values.length).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(session.values).length).assertEqual(14);
      expect(session.values[10]).assertEqual(16);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_2400
     * @tc.name gameSessionFullBoardRoundTrip2400
     * @tc.desc Verify a fully occupied board restores with no empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_fullBoardRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let values: number[] = BoardKit.overBoard();
      let saved: GameRule = BoardKit.rule(values);
      saved.status = GameStatus.OVER;
      await writeSession(store, saved);
      let restored: GameRule = restoreRule(await readSession(store));
      BoardKit.log('gameSession_fullBoardRoundTrip', 'nonZero=' + BoardKit.countNonZero(restored.dataNumbers));
      expect(BoardKit.countNonZero(restored.dataNumbers)).assertEqual(CELLS);
      BoardKit.expectNoZero(restored.dataNumbers);
      BoardKit.expectBoard(restored, values);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_2500
     * @tc.name gameSessionEmptyBoardRoundTrip2500
     * @tc.desc Verify after init the two spawned tiles are the only non zero cells that persist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_emptyBoardRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.blank());
      saved.init();
      await writeSession(store, saved);
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_emptyBoardRoundTrip', 'nonZero=' + BoardKit.countNonZero(session.values));
      expect(session.values.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(session.values)).assertEqual(2);
      expect(session.status).assertEqual(GameStatus.RUNNING);
      expect(session.score).assertEqual(0);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_2600
     * @tc.name gameSessionDefaultsAfterClear2600
     * @tc.desc Verify a cleared store restores a blank board, a zero score and the BEFORE status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_defaultsAfterClear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_defaultsAfterClear', 'cells=' + session.values.length);
      expect(session.values.length).assertEqual(0);
      expect(session.score).assertEqual(0);
      expect(session.status).assertEqual(GameStatus.BEFORE);
      expect(session.values.length === CELLS).assertFalse();
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_2700
     * @tc.name gameSessionOverStatusRoundTrip2700
     * @tc.desc Verify the OVER status, the zero member, survives as the text 0 and restores as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_overStatusRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.overBoard());
      saved.status = GameStatus.OVER;
      await writeSession(store, saved);
      let statusText: string = (await store.get(KEY_STATUS, '')) as string;
      let restored: GameRule = restoreRule(await readSession(store));
      BoardKit.log('gameSession_overStatusRoundTrip', 'status=' + restored.status);
      expect(statusText).assertEqual('0');
      expect(restored.status).assertEqual(GameStatus.OVER);
      expect(restored.status).assertEqual(0);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_2800
     * @tc.name gameSessionBoardHasNoCellBeyond2800
     * @tc.desc Verify the stored board has sixteen addressable cells and no cell beyond the sixteenth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_boardHasNoCellBeyond', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 4, 8, 16]));
      await writeSession(store, saved);
      let session: StoredSession = await readSession(store);
      let last: number | undefined = cellAt(session, 15);
      let beyond: number | undefined = cellAt(session, 16);
      BoardKit.log('gameSession_boardHasNoCellBeyond', 'last=' + last);
      expect(session.values.length).assertEqual(CELLS);
      expect(last).assertEqual(16);
      expect(beyond).assertUndefined();
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_2900
     * @tc.name gameSessionRestoredMatchesSaved2900
     * @tc.desc Verify the restored rule reproduces all three saved fields at once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_restoredMatchesSaved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let values: number[] = BoardKit.rows([
        [2, 0, 0, 4],
        [0, 8, 0, 0],
        [0, 0, 16, 0],
        [32, 0, 0, 0]
      ]);
      let saved: GameRule = BoardKit.rule(values);
      saved.score = 256;
      saved.status = GameStatus.RUNNING;
      await writeSession(store, saved);
      let restored: GameRule = restoreRule(await readSession(store));
      BoardKit.log('gameSession_restoredMatchesSaved', 'score=' + restored.score);
      BoardKit.expectBoard(restored, values);
      expect(restored.score).assertEqual(saved.score);
      expect(restored.status).assertEqual(saved.status);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_3000
     * @tc.name gameSessionStoreUnaffectedByMove3000
     * @tc.desc Verify moving a restored rule does not rewrite the stored session until the next save
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_storeUnaffectedByMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let saved: GameRule = BoardKit.rule(values);
      saved.status = GameStatus.RUNNING;
      await writeSession(store, saved);
      let restored: GameRule = restoreRule(await readSession(store));
      restored.move('left');
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_storeUnaffectedByMove', 'storedFirst=' + session.values[0]);
      expect(restored.dataNumbers[0]).assertEqual(4);
      expect(session.values[0]).assertEqual(2);
      expect(session.values[1]).assertEqual(2);
      BoardKit.expectValues(session.values, values);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_3100
     * @tc.name gameSessionRewriteAfterRestore3100
     * @tc.desc Verify saving the restored rule again persists its new score over the old one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_rewriteAfterRestore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      saved.status = GameStatus.RUNNING;
      await writeSession(store, saved);
      let restored: GameRule = restoreRule(await readSession(store));
      restored.move('left');
      await writeSession(store, restored);
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_rewriteAfterRestore', 'score=' + session.score);
      expect(restored.score).assertEqual(4);
      expect(session.score).assertEqual(4);
      expect(session.values[0]).assertEqual(4);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_3200
     * @tc.name gameSessionSecondHandleSeesFlush3200
     * @tc.desc Verify a second handle of the same store observes values only after the writer flushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_secondHandleSeesFlush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let writer: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(writer);
      let saved: GameRule = BoardKit.rule(BoardKit.row([8, 0, 0, 0]));
      saved.score = 8;
      await writeSession(writer, saved);
      let reader: data_preferences.Preferences = await openSessionStore();
      let session: StoredSession = await readSession(reader);
      BoardKit.log('gameSession_secondHandleSeesFlush', 'first=' + session.values[0]);
      expect(session.values[0]).assertEqual(8);
      expect(session.score).assertEqual(8);
      expect(session.values.length).assertEqual(CELLS);
      await clearSessionStore(writer);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_3300
     * @tc.name gameSessionBoardTextHasNoNull3300
     * @tc.desc Verify the stored board text is a plain number array without null or object entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_boardTextHasNoNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.row([2, 0, 4, 0]));
      await writeSession(store, saved);
      let text: string = (await store.get(KEY_BOARD, '')) as string;
      BoardKit.log('gameSession_boardTextHasNoNull', 'length=' + text.length);
      expect(text.length > 0).assertTrue();
      expect(text).assertContain('[');
      expect(text.charAt(0)).assertEqual('[');
      expect(text.indexOf('null') < 0).assertTrue();
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_3400
     * @tc.name gameSessionNonNumericScoreText3400
     * @tc.desc Verify non numeric score text, which Number turns into NaN, is reported as null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_nonNumericScoreText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      await store.put(KEY_SCORE, 'unknown');
      await store.flush();
      let scoreText: string = (await store.get(KEY_SCORE, '')) as string;
      let converted: number | null = scoreOrNull(scoreText);
      BoardKit.log('gameSession_nonNumericScoreText', 'text=' + scoreText);
      expect(scoreText).assertEqual('unknown');
      expect(converted).assertNull();
      expect(scoreOrNull('0')).assertEqual(0);
      await clearSessionStore(store);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSIONPERSISTENCE_3500
     * @tc.name gameSessionPartialDeleteKeepsScore3500
     * @tc.desc Verify deleting only the board key leaves the score and status keys readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_partialDeleteKeepsScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openSessionStore();
      await clearSessionStore(store);
      let saved: GameRule = BoardKit.rule(BoardKit.row([2, 4, 0, 0]));
      saved.score = 32;
      saved.status = GameStatus.RUNNING;
      await writeSession(store, saved);
      await store.delete(KEY_BOARD);
      await store.flush();
      let hasBoard: boolean = await store.has(KEY_BOARD);
      let hasScore: boolean = await store.has(KEY_SCORE);
      let session: StoredSession = await readSession(store);
      BoardKit.log('gameSession_partialDeleteKeepsScore', 'hasBoard=' + hasBoard);
      expect(hasBoard).assertFalse();
      expect(hasScore).assertTrue();
      expect(session.values.length).assertEqual(0);
      expect(session.score).assertEqual(32);
      expect(session.status).assertEqual(GameStatus.RUNNING);
      await clearSessionStore(store);
    });
  });
}
