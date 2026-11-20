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
import { DataType, MyDataSource } from '../../../../main/ets/model/GameModuel';
import { GameStatus } from '../../../../main/ets/muck/GameData';
import { BoardKit, CELLS } from '../common/Game2048TestKit';

/**
 * 存档落盘测试套件。
 *
 * Index.handleLocalData 在 preferences 文件 'mystore' 上维护三个键：
 *   gameData（JSON 文本）、score（数字字符串）、gameStatus（数字字符串）。
 * 本套件使用独立的 'game2048_test_store' 复现 put/flush/get/has/delete/clear
 * 六种操作，既不触碰页面存档，也不依赖 UI。第二个 store 只用于验证隔离。
 */

function appContext(): common.Context {
  return application.getApplicationContext();
}

/** 被测存档文件名，与页面的 mystore 刻意区分。 */
const STORE_NAME: string = 'game2048_test_store';
/** 用于验证 store 之间互不影响的第二个文件名。 */
const ALT_STORE_NAME: string = 'game2048_test_store_alt';
/** handleLocalData 写入棋盘的键。 */
const KEY_GAME_DATA: string = 'gameData';
/** handleLocalData 写入分数的键。 */
const KEY_SCORE: string = 'score';
/** handleLocalData 写入游戏状态的键。 */
const KEY_STATUS: string = 'gameStatus';
/** 与三个业务键无关的辅助键。 */
const KEY_EXTRA: string = 'extraKey';
/** 未写入过的探测键。 */
const KEY_ABSENT: string = 'absentKey';
/** 长 JSON 用例使用的满盘数值。 */
const FULL_VALUES: number[] = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536];

/** 打开指定名字的 preferences 实例。 */
async function openStore(name: string): Promise<data_preferences.Preferences> {
  let store: data_preferences.Preferences = await data_preferences.getPreferences(appContext(), name);
  return store;
}

/** 清空并落盘，保证每个用例从空存档开始。 */
async function clearStore(store: data_preferences.Preferences): Promise<void> {
  await store.clear();
  await store.flush();
}

/** 写入一个字符串键并立即落盘，镜像 handleLocalData 的 put 分支。 */
async function putText(store: data_preferences.Preferences, key: string, value: string): Promise<void> {
  await store.put(key, value);
  await store.flush();
}

/** 读取一个字符串键，缺失时以空串作为默认值。 */
async function readText(store: data_preferences.Preferences, key: string): Promise<string> {
  let value: string = await store.get(key, '') as string;
  return value;
}

/** 读取一个键；键不存在时返回 undefined。 */
async function readOptional(store: data_preferences.Preferences, key: string): Promise<string | undefined> {
  let present: boolean = await store.has(key);
  if (!present) {
    return undefined;
  }
  return readText(store, key);
}

/** 按数值列表构造 DataType 列表。 */
function dataList(values: number[]): DataType[] {
  let list: DataType[] = [];
  for (let index: number = 0; index < values.length; index++) {
    list.push(new DataType(index, values[index]));
  }
  return list;
}

/** 把一个棋盘序列化成 handleLocalData 写入的文本形态。 */
function jsonOf(values: number[]): string {
  let source: MyDataSource = new MyDataSource(dataList(values));
  let text: string = JSON.stringify(source);
  return text;
}

/** 空文本视为没有存档，返回 null；否则按页面同样的方式解析。 */
function parseBoardOrNull(text: string): MyDataSource | null {
  if (text.length === 0) {
    return null;
  }
  return JSON.parse(text) as MyDataSource;
}

/**
 * preferences 落盘契约测试套件。
 */
export default function persistenceTest() {
  describe('persistenceTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      let alt: data_preferences.Preferences = await openStore(ALT_STORE_NAME);
      await clearStore(alt);
      BoardKit.log('persistenceTest', 'suite begin');
    });

    afterAll(async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      let alt: data_preferences.Preferences = await openStore(ALT_STORE_NAME);
      await clearStore(alt);
      BoardKit.log('persistenceTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_0100
     * @tc.name persistenceStoreStartsEmpty0100
     * @tc.desc Verify a freshly cleared store reports no content for all three game keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_storeStartsEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      let hasData: boolean = await store.has(KEY_GAME_DATA);
      let hasScore: boolean = await store.has(KEY_SCORE);
      let hasStatus: boolean = await store.has(KEY_STATUS);
      let hasAbsent: boolean = await store.has(KEY_ABSENT);
      expect(hasData).assertFalse();
      expect(hasScore).assertFalse();
      expect(hasStatus).assertFalse();
      expect(hasAbsent).assertFalse();
      expect(hasScore === true).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_0200
     * @tc.name persistenceHasTrueAfterGameDataPut0200
     * @tc.desc Verify has flips to true once the gameData key has been written and flushed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_hasTrueAfterGameDataPut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      let before: boolean = await store.has(KEY_GAME_DATA);
      await putText(store, KEY_GAME_DATA, jsonOf(BoardKit.blank()));
      let after: boolean = await store.has(KEY_GAME_DATA);
      expect(before).assertFalse();
      expect(after).assertTrue();
      expect(before === after).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_0300
     * @tc.name persistenceHasTrueAfterScorePut0300
     * @tc.desc Verify the score key becomes visible after a put plus flush cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_hasTrueAfterScorePut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      expect(await store.has(KEY_SCORE)).assertFalse();
      await putText(store, KEY_SCORE, '1024');
      expect(await store.has(KEY_SCORE)).assertTrue();
      expect(await store.has(KEY_STATUS)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_0400
     * @tc.name persistenceHasTrueAfterStatusPut0400
     * @tc.desc Verify the gameStatus key becomes visible after a put plus flush cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_hasTrueAfterStatusPut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      expect(await store.has(KEY_STATUS)).assertFalse();
      await putText(store, KEY_STATUS, '1');
      expect(await store.has(KEY_STATUS)).assertTrue();
      expect(await store.has(KEY_GAME_DATA)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_0500
     * @tc.name persistenceAllThreeKeysCoexist0500
     * @tc.desc Verify gameData, score and gameStatus can be stored side by side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_allThreeKeysCoexist', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_GAME_DATA, jsonOf(BoardKit.row([2, 4, 8, 16])));
      await store.put(KEY_SCORE, '2048');
      await store.put(KEY_STATUS, '1');
      await store.flush();
      expect(await store.has(KEY_GAME_DATA)).assertTrue();
      expect(await store.has(KEY_SCORE)).assertTrue();
      expect(await store.has(KEY_STATUS)).assertTrue();
      BoardKit.log('allThreeKeysCoexist', 'all keys present');
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_0600
     * @tc.name persistenceScoreReturnsExactText0600
     * @tc.desc Verify the score is read back as the identical decimal string that was written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_scoreReturnsExactText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_SCORE, '123456');
      let value: string = await readText(store, KEY_SCORE);
      expect(value).assertEqual('123456');
      expect(value.length).assertEqual(6);
      expect(value === '123456').assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_0700
     * @tc.name persistenceStatusReturnsExactText0700
     * @tc.desc Verify the status is read back as the identical signed string that was written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_statusReturnsExactText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_STATUS, '-1');
      let value: string = await readText(store, KEY_STATUS);
      expect(value).assertEqual('-1');
      expect(value).assertContain('-');
      expect(value.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_0800
     * @tc.name persistenceMissingKeyReturnsDefault0800
     * @tc.desc Verify reading an unwritten key yields the caller supplied default value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_missingKeyReturnsDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      let value: string = await store.get(KEY_SCORE, '0') as string;
      expect(value).assertEqual('0');
      expect(await store.has(KEY_SCORE)).assertFalse();
      expect(Number(value)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_0900
     * @tc.name persistenceScoreNumberRestoration0900
     * @tc.desc Verify Number restores a stored score string into the original score value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_scoreNumberRestoration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_SCORE, '123456');
      let text: string = await readText(store, KEY_SCORE);
      let score: number = Number(text);
      expect(score).assertEqual(123456);
      expect(score === 123456).assertTrue();
      expect(score > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_1000
     * @tc.name persistenceStatusBeforeRestoration1000
     * @tc.desc Verify the stored minus one text restores to the BEFORE status value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_statusBeforeRestoration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_STATUS, GameStatus.BEFORE.toString());
      let status: number = Number(await readText(store, KEY_STATUS));
      expect(status).assertEqual(GameStatus.BEFORE);
      expect(status).assertEqual(-1);
      expect(status < 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_1100
     * @tc.name persistenceStatusRunningRestoration1100
     * @tc.desc Verify the stored one text restores to the RUNNING status value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_statusRunningRestoration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_STATUS, GameStatus.RUNNING.toString());
      let status: number = Number(await readText(store, KEY_STATUS));
      expect(status).assertEqual(GameStatus.RUNNING);
      expect(status === 1).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_1200
     * @tc.name persistenceStatusOverRestoration1200
     * @tc.desc Verify the stored zero text restores to the OVER status and remains present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_statusOverRestoration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_STATUS, GameStatus.OVER.toString());
      let text: string = await readText(store, KEY_STATUS);
      expect(text).assertEqual('0');
      expect(Number(text)).assertEqual(GameStatus.OVER);
      expect(await store.has(KEY_STATUS)).assertTrue();
      expect(Number(text) > 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_1300
     * @tc.name persistenceOverwriteScoreKeepsLatest1300
     * @tc.desc Verify a second score write replaces the first value instead of appending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_overwriteScoreKeepsLatest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_SCORE, '100');
      expect(await readText(store, KEY_SCORE)).assertEqual('100');
      await putText(store, KEY_SCORE, '250');
      let value: string = await readText(store, KEY_SCORE);
      expect(value).assertEqual('250');
      expect(value === '100').assertFalse();
      expect(Number(value)).assertEqual(250);
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_1400
     * @tc.name persistenceOverwriteStatusKeepsLatest1400
     * @tc.desc Verify a status transition is persisted by overwriting the same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_overwriteStatusKeepsLatest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_STATUS, GameStatus.BEFORE.toString());
      await putText(store, KEY_STATUS, GameStatus.RUNNING.toString());
      let status: number = Number(await readText(store, KEY_STATUS));
      expect(status).assertEqual(GameStatus.RUNNING);
      expect(status === GameStatus.BEFORE).assertFalse();
      expect(await store.has(KEY_STATUS)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_1500
     * @tc.name persistenceOverwriteGameDataKeepsLatest1500
     * @tc.desc Verify a newer board snapshot replaces the older snapshot under the same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_overwriteGameDataKeepsLatest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_GAME_DATA, jsonOf(BoardKit.blank()));
      await putText(store, KEY_GAME_DATA, jsonOf(FULL_VALUES));
      let text: string = await readText(store, KEY_GAME_DATA);
      let parsed: MyDataSource = parseBoardOrNull(text) as MyDataSource;
      expect(parsed.dataArray.length).assertEqual(CELLS);
      expect(parsed.dataArray[0].data).assertEqual(2);
      expect(parsed.dataArray[15].data).assertEqual(65536);
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_1600
     * @tc.name persistenceGameDataJsonRoundTrip1600
     * @tc.desc Verify a stored board payload restores all sixteen cell values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_gameDataJsonRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      let values: number[] = BoardKit.rows([
        [2, 4, 8, 16],
        [0, 0, 0, 0],
        [32, 64, 128, 256],
        [0, 0, 0, 0]
      ]);
      await putText(store, KEY_GAME_DATA, jsonOf(values));
      let text: string = await readText(store, KEY_GAME_DATA);
      let parsed: MyDataSource = parseBoardOrNull(text) as MyDataSource;
      expect(parsed.dataArray.length).assertEqual(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        expect(parsed.dataArray[index].data).assertEqual(values[index]);
      }
      BoardKit.log('gameDataJsonRoundTrip', 'cells ' + parsed.dataArray.length);
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_1700
     * @tc.name persistenceGameDataKeepsSparseCells1700
     * @tc.desc Verify empty cells survive the store round trip instead of being compacted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_gameDataKeepsSparseCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      let values: number[] = BoardKit.blank();
      values[4] = 8;
      values[9] = 128;
      await putText(store, KEY_GAME_DATA, jsonOf(values));
      let parsed: MyDataSource = parseBoardOrNull(await readText(store, KEY_GAME_DATA)) as MyDataSource;
      expect(parsed.dataArray.length).assertEqual(CELLS);
      expect(parsed.dataArray[4].data).assertEqual(8);
      expect(parsed.dataArray[9].data).assertEqual(128);
      expect(parsed.dataArray[5].data).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_1800
     * @tc.name persistenceEmptyStringValue1800
     * @tc.desc Verify an empty string is a legal stored value that still reports as present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_emptyStringValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_GAME_DATA, '');
      let value: string = await readText(store, KEY_GAME_DATA);
      expect(value).assertEqual('');
      expect(value.length).assertEqual(0);
      expect(await store.has(KEY_GAME_DATA)).assertTrue();
      expect(parseBoardOrNull(value)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_1900
     * @tc.name persistenceLongJsonValue1900
     * @tc.desc Verify a long sixteen cell JSON payload is written and read without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_longJsonValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      let text: string = jsonOf(FULL_VALUES);
      expect(text.length > 200).assertTrue();
      await putText(store, KEY_GAME_DATA, text);
      let value: string = await readText(store, KEY_GAME_DATA);
      expect(value).assertEqual(text);
      expect(value.length).assertEqual(text.length);
      let parsed: MyDataSource = parseBoardOrNull(value) as MyDataSource;
      expect(parsed.dataArray.length).assertEqual(CELLS);
      expect(parsed.dataArray[0].data).assertEqual(2);
      BoardKit.log('longJsonValue', 'length ' + value.length);
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_2000
     * @tc.name persistenceDeleteDropsHas2000
     * @tc.desc Verify deleting a key makes has report false again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_deleteDropsHas', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_SCORE, '512');
      expect(await store.has(KEY_SCORE)).assertTrue();
      await store.delete(KEY_SCORE);
      await store.flush();
      let present: boolean = await store.has(KEY_SCORE);
      expect(present).assertFalse();
      expect(present === true).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_2100
     * @tc.name persistenceDeleteOnlyRequestedKey2100
     * @tc.desc Verify deleting one key leaves the other two game keys untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_deleteOnlyRequestedKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_SCORE, '300');
      await store.put(KEY_STATUS, '1');
      await store.put(KEY_GAME_DATA, jsonOf(BoardKit.blank()));
      await store.flush();
      await store.delete(KEY_SCORE);
      await store.flush();
      expect(await store.has(KEY_SCORE)).assertFalse();
      expect(await store.has(KEY_STATUS)).assertTrue();
      expect(await store.has(KEY_GAME_DATA)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_2200
     * @tc.name persistenceDeletedKeyReturnsDefault2200
     * @tc.desc Verify a deleted key reads back as the caller default and as undefined on optional read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_deletedKeyReturnsDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_STATUS, '1');
      await store.delete(KEY_STATUS);
      await store.flush();
      let fallback: string = await store.get(KEY_STATUS, '-1') as string;
      let optional: string | undefined = await readOptional(store, KEY_STATUS);
      expect(fallback).assertEqual('-1');
      expect(optional).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_2300
     * @tc.name persistenceClearDropsAllKeys2300
     * @tc.desc Verify clear removes every game key from the store at once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_clearDropsAllKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_GAME_DATA, jsonOf(FULL_VALUES));
      await store.put(KEY_SCORE, '999');
      await store.put(KEY_STATUS, '0');
      await store.flush();
      await clearStore(store);
      expect(await store.has(KEY_GAME_DATA)).assertFalse();
      expect(await store.has(KEY_SCORE)).assertFalse();
      expect(await store.has(KEY_STATUS)).assertFalse();
      BoardKit.log('clearDropsAllKeys', 'store emptied');
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_2400
     * @tc.name persistenceClearThenRewriteWorks2400
     * @tc.desc Verify the store is still writable after a clear operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_clearThenRewriteWorks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_SCORE, '111');
      await clearStore(store);
      expect(await store.has(KEY_SCORE)).assertFalse();
      await putText(store, KEY_SCORE, '777');
      expect(await store.has(KEY_SCORE)).assertTrue();
      expect(await readText(store, KEY_SCORE)).assertEqual('777');
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_2500
     * @tc.name persistenceStoresAreIsolated2500
     * @tc.desc Verify the same key in two stores keeps two independent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_storesAreIsolated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let main: data_preferences.Preferences = await openStore(STORE_NAME);
      let alt: data_preferences.Preferences = await openStore(ALT_STORE_NAME);
      await clearStore(main);
      await clearStore(alt);
      await putText(main, KEY_SCORE, '111');
      await putText(alt, KEY_SCORE, '222');
      expect(await readText(main, KEY_SCORE)).assertEqual('111');
      expect(await readText(alt, KEY_SCORE)).assertEqual('222');
      expect(await readText(main, KEY_SCORE) === '222').assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_2600
     * @tc.name persistenceSecondStoreStartsEmpty2600
     * @tc.desc Verify writing the main store does not create keys in the second store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_secondStoreStartsEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let main: data_preferences.Preferences = await openStore(STORE_NAME);
      let alt: data_preferences.Preferences = await openStore(ALT_STORE_NAME);
      await clearStore(alt);
      await putText(main, KEY_GAME_DATA, jsonOf(FULL_VALUES));
      expect(await main.has(KEY_GAME_DATA)).assertTrue();
      expect(await alt.has(KEY_GAME_DATA)).assertFalse();
      expect(await alt.has(KEY_SCORE)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_2700
     * @tc.name persistenceRepeatedFlushIsIdempotent2700
     * @tc.desc Verify flushing twice does not duplicate or alter the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_repeatedFlushIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await store.put(KEY_SCORE, '77');
      await store.flush();
      await store.flush();
      await store.flush();
      let value: string = await readText(store, KEY_SCORE);
      expect(value).assertEqual('77');
      expect(value.length).assertEqual(2);
      expect(await store.has(KEY_SCORE)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_2800
     * @tc.name persistencePutVisibleBeforeFlush2800
     * @tc.desc Verify a put is visible to get in the same store before an explicit flush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_putVisibleBeforeFlush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await store.put(KEY_STATUS, '1');
      let value: string = await store.get(KEY_STATUS, '') as string;
      expect(value).assertEqual('1');
      expect(await store.has(KEY_STATUS)).assertTrue();
      await store.flush();
      expect(await readText(store, KEY_STATUS)).assertEqual('1');
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_2900
     * @tc.name persistenceDeleteIsRepeatable2900
     * @tc.desc Verify deleting an already absent key keeps has false and the default readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_deleteIsRepeatable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_STATUS, '1');
      await store.delete(KEY_STATUS);
      await store.flush();
      await store.delete(KEY_STATUS);
      await store.flush();
      let present: boolean = await store.has(KEY_STATUS);
      let fallback: string = await store.get(KEY_STATUS, '-1') as string;
      expect(present).assertFalse();
      expect(fallback).assertEqual('-1');
      expect(await readText(store, KEY_STATUS)).assertEqual('');
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_3000
     * @tc.name persistenceOptionalReadUndefinedAndDefined3000
     * @tc.desc Verify the optional read helper reports undefined before a write and text after it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_optionalReadUndefinedAndDefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      let before: string | undefined = await readOptional(store, KEY_EXTRA);
      expect(before).assertUndefined();
      await putText(store, KEY_EXTRA, 'extra');
      let after: string | undefined = await readOptional(store, KEY_EXTRA);
      expect(after === undefined).assertFalse();
      expect(after).assertEqual('extra');
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_3100
     * @tc.name persistenceEmptyTextParsesToNull3100
     * @tc.desc Verify an empty stored gameData is treated as no save by the parse helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_emptyTextParsesToNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_GAME_DATA, '');
      let text: string = await readText(store, KEY_GAME_DATA);
      let parsed: MyDataSource | null = parseBoardOrNull(text);
      expect(parsed).assertNull();
      expect(text.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_3200
     * @tc.name persistenceNonEmptyTextParsesToBoard3200
     * @tc.desc Verify a stored payload parses into a board with sixteen identified cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_nonEmptyTextParsesToBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_GAME_DATA, jsonOf(FULL_VALUES));
      let text: string = await readText(store, KEY_GAME_DATA);
      let parsed: MyDataSource | null = parseBoardOrNull(text);
      expect(parsed === null).assertFalse();
      if (parsed !== null) {
        expect(parsed.dataArray.length).assertEqual(CELLS);
        for (let index: number = 0; index < CELLS; index++) {
          expect(parsed.dataArray[index].id).assertEqual(index);
        }
      }
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_3300
     * @tc.name persistenceStatusReadsAsString3300
     * @tc.desc Verify the stored status keeps the string type the Number call expects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_statusReadsAsString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_STATUS, '1');
      let value: string = await readText(store, KEY_STATUS);
      expect(typeof value).assertEqual('string');
      expect(typeof value === 'number').assertFalse();
      expect(Number(value)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_3400
     * @tc.name persistenceScoreStoredAsText3400
     * @tc.desc Verify a score written as text is not coerced into a number by the store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_scoreStoredAsText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_SCORE, '42');
      let value: string = await readText(store, KEY_SCORE);
      expect(typeof value).assertEqual('string');
      expect(value).assertEqual('42');
      expect(Number(value) + 1).assertEqual(43);
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_3500
     * @tc.name persistenceGameDataContainsKey3500
     * @tc.desc Verify the stored gameData text carries the dataArray key the read path probes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_gameDataContainsKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_GAME_DATA, jsonOf(BoardKit.blank()));
      let text: string = await readText(store, KEY_GAME_DATA);
      expect(text).assertContain('"dataArray"');
      expect(text.length > 0).assertTrue();
      expect(text.indexOf('dataArray') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_3600
     * @tc.name persistenceStoredZeroStatus3600
     * @tc.desc Verify a zero status string stays present and restores to the OVER value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_storedZeroStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_STATUS, '0');
      let value: string = await readText(store, KEY_STATUS);
      expect(value).assertEqual('0');
      expect(await store.has(KEY_STATUS)).assertTrue();
      expect(Number(value) === GameStatus.OVER).assertTrue();
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_PERSISTENCE_3700
     * @tc.name persistenceEmptyScoreTextCollapsesToZero3700
     * @tc.desc Verify an empty stored score is present but Number turns it into zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('persistence_emptyScoreTextCollapsesToZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let store: data_preferences.Preferences = await openStore(STORE_NAME);
      await clearStore(store);
      await putText(store, KEY_SCORE, '');
      let text: string = await readText(store, KEY_SCORE);
      let score: number = Number(text);
      expect(text).assertEqual('');
      expect(text.length).assertEqual(0);
      expect(await store.has(KEY_SCORE)).assertTrue();
      expect(score).assertEqual(0);
      expect(score === 0).assertTrue();
      BoardKit.warn('emptyScoreTextCollapsesToZero', 'empty text is not a distinct score');
    });
  });
}
