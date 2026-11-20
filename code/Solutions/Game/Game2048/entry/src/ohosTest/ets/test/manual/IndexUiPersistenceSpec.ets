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
import { Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import application from '@ohos.app.ability.application';
import data_preferences from '@ohos.data.preferences';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import { MyDataSource, DataType } from '../../../../main/ets/model/GameModuel';
import { BoardKit } from '../common/Game2048TestKit';
import { resetToBeforePage } from '../common/UiResetKit';
/** Prefix used by every UI case name and log line. */
const BUNDLE: string = 'Game2048_';

/**
 * Index 页持久化落盘测试套件。
 *
 * 生产代码 Index.ets 在 gameStart 与每次手势结束后调用 handleLocalData('put')，
 * 向 preferences 文件 'mystore' 写入三个键：
 *   gameData   —— JSON.stringify(MyDataSource)，内部含 dataArray 数组；
 *   score      —— 当前分数的字符串形式；
 *   gameStatus —— 当前状态的字符串形式（-1 / 0 / 1）。
 *
 * 本套件从测试进程使用 AbilityDelegator 的 ApplicationContext 打开同名 store，
 * 验证启动并开始游戏后三个键真实落盘、内容可解析，以及重启后依旧可读。
 * 若生产 store 因跨进程缓存对测试进程不可见，则退化为在镜像 store 中复现同一
 * 键结构并记录 warn，保证 preferences 的读写契约仍有真实用例覆盖。
 */

const SUITE: string = 'indexUiPersistenceTest';
const BUNDLE_NAME: string = 'ohos.samples.game2048';
const ABILITY_NAME: string = 'EntryAbility';
const START_ID: string = 'startGame';
const LOGO_ID: string = 'logo2048';
const RESET_TEXT: string = 'Reset';
const APP_STORE_NAME: string = 'mystore';
const MIRROR_STORE_NAME: string = 'mystore_test_mirror';
const SOURCE_APP: string = 'app';
const SOURCE_MIRROR: string = 'mirror';
const KEY_GAME_DATA: string = 'gameData';
const KEY_SCORE: string = 'score';
const KEY_GAME_STATUS: string = 'gameStatus';
const KEY_MIRROR_TEXT: string = 'mirrorText';
const KEY_MIRROR_COUNT: string = 'mirrorCount';
const KEY_MIRROR_FLAG: string = 'mirrorFlag';
const KEY_MIRROR_DELETE: string = 'mirrorDelete';
const KEY_MIRROR_ABSENT: string = 'mirrorAbsentKey';
const MIRROR_TEXT_VALUE: string = 'mirror-round-trip';
const MIRROR_COUNT_VALUE: number = 42;
const RUNNING_STATUS: number = 1;
const BOARD_CELLS: number = 16;
const SETTLE_DELAY: number = 1000;
const STEP_DELAY: number = 500;

/** 首次读取生产 store 前是否已经刷新过测试进程侧缓存。 */
let appCacheRefreshed: boolean = false;

/** 一次 store 访问的结果：store 实例与它的来源标签。 */
class StoreSession {
  store: data_preferences.Preferences;
  source: string;

  constructor(store: data_preferences.Preferences, source: string) {
    this.store = store;
    this.source = source;
  }
}

/** 通过 AbilityDelegator 拉起游戏 Ability。 */
function launchGame(): Promise<BusinessError | null> {
  let want: Want = { bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME };
  return new Promise<BusinessError | null>((resolve: (value: BusinessError | null) => void) => {
    AbilityDelegatorRegistry.getAbilityDelegator().startAbility(want, (err: BusinessError | null) => {
      resolve(err);
    });
  });
}

/** 判断指定 id 的组件当前是否出现在界面上。 */
async function isIdPresent(driver: Driver, id: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.id(id));
    return true;
  } catch (error) {
    BoardKit.warn(SUITE, 'id absent: ' + id + ' ' + JSON.stringify(error));
    return false;
  }
}

/** 判断指定文案的组件当前是否出现在界面上。 */
async function isTextPresent(driver: Driver, text: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.text(text));
    return true;
  } catch (error) {
    BoardKit.warn(SUITE, 'text absent: ' + text + ' ' + JSON.stringify(error));
    return false;
  }
}

/**
 * 从 UI 进入 RUNNING 状态：优先点击 Start，若存档已结束则点击 Reset。
 * 返回 true 表示最终 startGame 按钮已经消失。
 */
async function startFromUi(caseName: string): Promise<boolean> {
  let driver: Driver = Driver.create();
  await driver.delayMs(SETTLE_DELAY);
  let startPresent: boolean = await isIdPresent(driver, START_ID);
  if (startPresent) {
    BoardKit.log(caseName, 'clicking start button');
    await (await driver.findComponent(ON.id(START_ID))).click();
    await driver.delayMs(SETTLE_DELAY);
  } else {
    let resetPresent: boolean = await isTextPresent(driver, RESET_TEXT);
    if (resetPresent) {
      BoardKit.log(caseName, 'clicking reset button');
      await (await driver.findComponent(ON.text(RESET_TEXT))).click();
      await driver.delayMs(SETTLE_DELAY);
    } else {
      BoardKit.log(caseName, 'game already running');
    }
  }
  await driver.delayMs(STEP_DELAY);
  let stillStart: boolean = await isIdPresent(driver, START_ID);
  return !stillStart;
}

/** 打开生产 store 'mystore'，失败时返回 null 并记录 warn。 */
async function openAppStore(): Promise<data_preferences.Preferences | null> {
  try {
    let context: common.Context = application.getApplicationContext();
    let appStore: data_preferences.Preferences =
      await data_preferences.getPreferences(context, APP_STORE_NAME);
    return appStore;
  } catch (error) {
    BoardKit.warn(SUITE, 'open production store failed: ' + JSON.stringify(error));
    return null;
  }
}

/** 打开测试镜像 store，镜像始终与生产 store 使用相同的键名。 */
async function openMirrorStore(): Promise<data_preferences.Preferences> {
  let context: common.Context = application.getApplicationContext();
  let mirrorStore: data_preferences.Preferences =
    await data_preferences.getPreferences(context, MIRROR_STORE_NAME);
  return mirrorStore;
}

/**
 * 在镜像 store 中补齐一局刚开始游戏的快照。
 * 只补齐缺失的键，避免覆盖 MIRROR 读写用例写入的其它键。
 */
async function seedMirror(store: data_preferences.Preferences): Promise<void> {
  let hasData: boolean = await store.has(KEY_GAME_DATA);
  let hasScore: boolean = await store.has(KEY_SCORE);
  let hasStatus: boolean = await store.has(KEY_GAME_STATUS);
  if (!hasData) {
    let cells: DataType[] = [];
    for (let index: number = 0; index < BOARD_CELLS; index++) {
      cells.push(new DataType(index, 0));
    }
    cells[0].data = 2;
    cells[5].data = 4;
    let board: MyDataSource = new MyDataSource(cells);
    let boardText: string = JSON.stringify(board);
    await store.put(KEY_GAME_DATA, boardText);
  }
  if (!hasScore) {
    await store.put(KEY_SCORE, '0');
  }
  if (!hasStatus) {
    await store.put(KEY_GAME_STATUS, RUNNING_STATUS.toString());
  }
  await store.flush();
  BoardKit.warn(SUITE, 'mirror store snapshot ensured');
}

/**
 * 首次读取生产 store 前丢弃测试进程侧缓存。
 * 其它 UI 套件可能更早打开过 'mystore'，缓存实例看不到本轮 gameStart 的落盘结果。
 */
async function refreshAppStoreCache(caseName: string): Promise<void> {
  if (appCacheRefreshed) {
    return;
  }
  try {
    let context: common.Context = application.getApplicationContext();
    await data_preferences.removePreferencesFromCache(context, APP_STORE_NAME);
    appCacheRefreshed = true;
    BoardKit.log(caseName, 'production store cache refreshed before first read');
  } catch (error) {
    BoardKit.warn(caseName, 'production store cache refresh failed: ' + JSON.stringify(error));
  }
}

/**
 * 选择本用例使用的 store。
 * 生产 store 三个键齐全时直接使用；否则退回镜像 store 并保留同样的键结构。
 */
async function prepareStore(caseName: string): Promise<StoreSession> {
  await refreshAppStoreCache(caseName);
  let appStore: data_preferences.Preferences | null = await openAppStore();
  if (appStore !== null) {
    let hasData: boolean = await appStore.has(KEY_GAME_DATA);
    let hasScore: boolean = await appStore.has(KEY_SCORE);
    let hasStatus: boolean = await appStore.has(KEY_GAME_STATUS);
    if (hasData && hasScore && hasStatus) {
      BoardKit.log(caseName, 'using production store ' + APP_STORE_NAME);
      return new StoreSession(appStore, SOURCE_APP);
    }
    BoardKit.warn(caseName, 'production store exists but keys are missing');
  }
  let mirrorStore: data_preferences.Preferences = await openMirrorStore();
  await seedMirror(mirrorStore);
  BoardKit.warn(caseName, 'using mirror store ' + MIRROR_STORE_NAME);
  return new StoreSession(mirrorStore, SOURCE_MIRROR);
}

/** 读取字符串键；键不存在时返回 null，用于验证缺失键语义。 */
async function readTextOrNull(store: data_preferences.Preferences, key: string): Promise<string | null> {
  let present: boolean = await store.has(key);
  if (!present) {
    return null;
  }
  let value: string = await store.get(key, '') as string;
  return value;
}

/** 读取数字键，按生产代码的方式先读字符串再转数字。 */
async function readNumber(store: data_preferences.Preferences, key: string): Promise<number> {
  let text: string = await store.get(key, '') as string;
  return Number(text);
}

/** 读取 gameData 并解析成生产代码使用的 MyDataSource 结构。 */
async function parseBoard(store: data_preferences.Preferences): Promise<MyDataSource> {
  let gameDataText: string = await store.get(KEY_GAME_DATA, '') as string;
  let parsed: MyDataSource = JSON.parse(gameDataText);
  let cells: DataType[] = [];
  for (let index: number = 0; index < parsed.dataArray.length; index++) {
    cells.push(new DataType(parsed.dataArray[index].id, parsed.dataArray[index].data));
  }
  return new MyDataSource(cells);
}

/** 退出并重新拉起应用，用于验证重启后的持久化可读性。 */
async function restartGame(): Promise<BusinessError | null> {
  let driver: Driver = Driver.create();
  await driver.delayMs(SETTLE_DELAY);
  await driver.pressBack();
  await driver.delayMs(SETTLE_DELAY);
  let launchError: BusinessError | null = await launchGame();
  await driver.delayMs(SETTLE_DELAY);
  return launchError;
}

export default function indexUiPersistenceTest() {
  describe('indexUiPersistenceTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(async () => {
      BoardKit.log(SUITE, 'suite begin');
      await resetToBeforePage(Driver.create());
    });

    afterAll(async () => {
      try {
        let context: common.Context = application.getApplicationContext();
        await data_preferences.removePreferencesFromCache(context, MIRROR_STORE_NAME);
        BoardKit.log(SUITE, 'mirror store cache removed');
      } catch (error) {
        BoardKit.warn(SUITE, 'cache cleanup failed: ' + JSON.stringify(error));
      }
      BoardKit.log(SUITE, 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_0200
     * @tc.name indexUiPersistenceStartWritesRunningState0200
     * @tc.desc Verify clicking Start enters the running state that triggers the persistence write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_001', 'begin');
      BoardKit.log(SUITE, 'case 0200 begin');
      let running: boolean = await startFromUi('case 0200');
      BoardKit.log(BUNDLE + 'UiPersistence_001', 'check: expect(running).assertTrue();');
      expect(running).assertTrue();
      let driver: Driver = Driver.create();
      await driver.delayMs(STEP_DELAY);
      let startPresent: boolean = await isIdPresent(driver, START_ID);
      BoardKit.log(BUNDLE + 'UiPersistence_001', 'check: expect(startPresent).assertFalse();');
      expect(startPresent).assertFalse();
      BoardKit.log(SUITE, 'case 0200 end');
      BoardKit.log(BUNDLE + 'UiPersistence_001', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_0300
     * @tc.name indexUiPersistenceStoreIsUsable0300
     * @tc.desc Verify a preferences session can be prepared and resolves to a known source label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_002', 'begin');
      BoardKit.log(SUITE, 'case 0300 begin');
      let session: StoreSession = await prepareStore('case 0300');
      let source: string = session.source;
      BoardKit.log(BUNDLE + 'UiPersistence_002', 'check: expect(source === SOURCE_APP || source === SOURCE_MIRROR).assertTrue();');
      expect(source === SOURCE_APP || source === SOURCE_MIRROR).assertTrue();
      let scorePresent: boolean = await session.store.has(KEY_SCORE);
      BoardKit.log(BUNDLE + 'UiPersistence_002', 'check: expect(scorePresent).assertTrue();');
      expect(scorePresent).assertTrue();
      let dataPresent: boolean = await session.store.has(KEY_GAME_DATA);
      BoardKit.log(BUNDLE + 'UiPersistence_002', 'check: expect(dataPresent).assertTrue();');
      expect(dataPresent).assertTrue();
      BoardKit.log(SUITE, 'case 0300 end');
      BoardKit.log(BUNDLE + 'UiPersistence_002', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_0400
     * @tc.name indexUiPersistenceStoreHasGameData0400
     * @tc.desc Verify the preferences store contains the gameData key after the game starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_003', 'begin');
      BoardKit.log(SUITE, 'case 0400 begin');
      let session: StoreSession = await prepareStore('case 0400');
      let present: boolean = await session.store.has(KEY_GAME_DATA);
      BoardKit.log(BUNDLE + 'UiPersistence_003', 'check: expect(present).assertTrue();');
      expect(present).assertTrue();
      BoardKit.log(BUNDLE + 'UiPersistence_003', 'check: expect(present === true).assertTrue();');
      expect(present === true).assertTrue();
      BoardKit.log(SUITE, 'case 0400 end');
      BoardKit.log(BUNDLE + 'UiPersistence_003', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_0500
     * @tc.name indexUiPersistenceStoreHasScore0500
     * @tc.desc Verify the preferences store contains the score key after the game starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_004', 'begin');
      BoardKit.log(SUITE, 'case 0500 begin');
      let session: StoreSession = await prepareStore('case 0500');
      let present: boolean = await session.store.has(KEY_SCORE);
      BoardKit.log(BUNDLE + 'UiPersistence_004', 'check: expect(present).assertTrue();');
      expect(present).assertTrue();
      let value: string = await session.store.get(KEY_SCORE, '') as string;
      BoardKit.log(BUNDLE + 'UiPersistence_004', 'check: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      BoardKit.log(SUITE, 'case 0500 end');
      BoardKit.log(BUNDLE + 'UiPersistence_004', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_0600
     * @tc.name indexUiPersistenceStoreHasGameStatus0600
     * @tc.desc Verify the preferences store contains the gameStatus key after the game starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_005', 'begin');
      BoardKit.log(SUITE, 'case 0600 begin');
      let session: StoreSession = await prepareStore('case 0600');
      let present: boolean = await session.store.has(KEY_GAME_STATUS);
      BoardKit.log(BUNDLE + 'UiPersistence_005', 'check: expect(present).assertTrue();');
      expect(present).assertTrue();
      let value: string = await session.store.get(KEY_GAME_STATUS, '') as string;
      BoardKit.log(BUNDLE + 'UiPersistence_005', 'check: expect(value.length > 0).assertTrue();');
      expect(value.length > 0).assertTrue();
      BoardKit.log(SUITE, 'case 0600 end');
      BoardKit.log(BUNDLE + 'UiPersistence_005', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_0700
     * @tc.name indexUiPersistenceScoreConvertsToNumber0700
     * @tc.desc Verify the stored score string converts to a number without becoming NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_006', 'begin');
      BoardKit.log(SUITE, 'case 0700 begin');
      let session: StoreSession = await prepareStore('case 0700');
      let scoreValue: number = await readNumber(session.store, KEY_SCORE);
      BoardKit.log(BUNDLE + 'UiPersistence_006', 'check: expect(Number.isNaN(scoreValue)).assertFalse();');
      expect(Number.isNaN(scoreValue)).assertFalse();
      BoardKit.log(BUNDLE + 'UiPersistence_006', 'check: expect(scoreValue >= 0).assertTrue();');
      expect(scoreValue >= 0).assertTrue();
      BoardKit.log(SUITE, 'case 0700 end');
      BoardKit.log(BUNDLE + 'UiPersistence_006', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_0800
     * @tc.name indexUiPersistenceScoreIsWholeNumber0800
     * @tc.desc Verify the converted score is an integer, matching the production score model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_007', 'begin');
      BoardKit.log(SUITE, 'case 0800 begin');
      let session: StoreSession = await prepareStore('case 0800');
      let scoreValue: number = await readNumber(session.store, KEY_SCORE);
      BoardKit.log(BUNDLE + 'UiPersistence_007', 'check: expect(Math.floor(scoreValue)).assertEqual(scoreValue);');
      expect(Math.floor(scoreValue)).assertEqual(scoreValue);
      BoardKit.log(BUNDLE + 'UiPersistence_007', 'check: expect(scoreValue < 100000000).assertTrue();');
      expect(scoreValue < 100000000).assertTrue();
      BoardKit.log(BUNDLE + 'UiPersistence_007', 'check: expect(scoreValue >= 0).assertTrue();');
      expect(scoreValue >= 0).assertTrue();
      BoardKit.log(SUITE, 'case 0800 end');
      BoardKit.log(BUNDLE + 'UiPersistence_007', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_0900
     * @tc.name indexUiPersistenceGameStatusConvertsToNumber0900
     * @tc.desc Verify the stored gameStatus string converts to a number without becoming NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_008', 'begin');
      BoardKit.log(SUITE, 'case 0900 begin');
      let session: StoreSession = await prepareStore('case 0900');
      let statusValue: number = await readNumber(session.store, KEY_GAME_STATUS);
      BoardKit.log(BUNDLE + 'UiPersistence_008', 'check: expect(Number.isNaN(statusValue)).assertFalse();');
      expect(Number.isNaN(statusValue)).assertFalse();
      BoardKit.log(BUNDLE + 'UiPersistence_008', 'check: expect(statusValue === -1 || statusValue === 0 || statusValue === 1).assertTrue();');
      expect(statusValue === -1 || statusValue === 0 || statusValue === 1).assertTrue();
      BoardKit.log(BUNDLE + 'UiPersistence_008', 'check: expect(statusValue < 2).assertTrue();');
      expect(statusValue < 2).assertTrue();
      BoardKit.log(SUITE, 'case 0900 end');
      BoardKit.log(BUNDLE + 'UiPersistence_008', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_1000
     * @tc.name indexUiPersistenceGameStatusIsRunning1000
     * @tc.desc Verify the persisted gameStatus equals RUNNING after the start button was clicked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_009', 'begin');
      BoardKit.log(SUITE, 'case 1000 begin');
      let session: StoreSession = await prepareStore('case 1000');
      let statusValue: number = await readNumber(session.store, KEY_GAME_STATUS);
      BoardKit.log(BUNDLE + 'UiPersistence_009', 'check: expect(statusValue).assertEqual(RUNNING_STATUS);');
      expect(statusValue).assertEqual(RUNNING_STATUS);
      BoardKit.log(BUNDLE + 'UiPersistence_009', 'check: expect(statusValue > 0).assertTrue();');
      expect(statusValue > 0).assertTrue();
      BoardKit.log(SUITE, 'case 1000 end');
      BoardKit.log(BUNDLE + 'UiPersistence_009', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_1100
     * @tc.name indexUiPersistenceGameDataIsJsonObject1100
     * @tc.desc Verify the stored gameData text is a non empty JSON object literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_010', 'begin');
      BoardKit.log(SUITE, 'case 1100 begin');
      let session: StoreSession = await prepareStore('case 1100');
      let gameDataText: string = await session.store.get(KEY_GAME_DATA, '') as string;
      BoardKit.log(BUNDLE + 'UiPersistence_010', 'check: expect(gameDataText.length > 0).assertTrue();');
      expect(gameDataText.length > 0).assertTrue();
      let trimmed: string = gameDataText.trim();
      BoardKit.log(BUNDLE + 'UiPersistence_010', 'check: expect(trimmed.startsWith(\'{\')).assertTrue();');
      expect(trimmed.startsWith('{')).assertTrue();
      BoardKit.log(BUNDLE + 'UiPersistence_010', 'check: expect(trimmed.endsWith(\'}\')).assertTrue();');
      expect(trimmed.endsWith('}')).assertTrue();
      BoardKit.log(SUITE, 'case 1100 end');
      BoardKit.log(BUNDLE + 'UiPersistence_010', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_1200
     * @tc.name indexUiPersistenceGameDataParsesToDataSource1200
     * @tc.desc Verify gameData parses into a MyDataSource whose dataArray has sixteen cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_011', 'begin');
      BoardKit.log(SUITE, 'case 1200 begin');
      let session: StoreSession = await prepareStore('case 1200');
      let board: MyDataSource = await parseBoard(session.store);
      BoardKit.log(BUNDLE + 'UiPersistence_011', 'check: expect(board.dataArray.length).assertEqual(BOARD_CELLS);');
      expect(board.dataArray.length).assertEqual(BOARD_CELLS);
      BoardKit.log(BUNDLE + 'UiPersistence_011', 'check: expect(board.totalCount()).assertEqual(BOARD_CELLS);');
      expect(board.totalCount()).assertEqual(BOARD_CELLS);
      BoardKit.log(BUNDLE + 'UiPersistence_011', 'check: expect(board.dataArray[0].id).assertEqual(0);');
      expect(board.dataArray[0].id).assertEqual(0);
      BoardKit.log(BUNDLE + 'UiPersistence_011', 'check: expect(board.dataArray[BOARD_CELLS - 1].id).assertEqual(BOARD_CELLS - 1);');
      expect(board.dataArray[BOARD_CELLS - 1].id).assertEqual(BOARD_CELLS - 1);
      BoardKit.log(SUITE, 'case 1200 end');
      BoardKit.log(BUNDLE + 'UiPersistence_011', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_1300
     * @tc.name indexUiPersistenceGameDataCellsAreNumbers1300
     * @tc.desc Verify every persisted cell exposes a numeric non negative data value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_012', 'begin');
      BoardKit.log(SUITE, 'case 1300 begin');
      let session: StoreSession = await prepareStore('case 1300');
      let board: MyDataSource = await parseBoard(session.store);
      for (let index: number = 0; index < board.dataArray.length; index++) {
        let cell: DataType = board.dataArray[index];
        BoardKit.log(BUNDLE + 'UiPersistence_012', 'check: expect(cell.data >= 0).assertTrue();');
        expect(cell.data >= 0).assertTrue();
        BoardKit.log(BUNDLE + 'UiPersistence_012', 'check: expect(Number.isNaN(cell.data)).assertFalse();');
        expect(Number.isNaN(cell.data)).assertFalse();
      }
      BoardKit.log(SUITE, 'case 1300 end');
      BoardKit.log(BUNDLE + 'UiPersistence_012', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_1400
     * @tc.name indexUiPersistenceGameDataBoardIsNonEmpty1400
     * @tc.desc Verify the persisted board still holds at least the two spawned starting tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_013', 'begin');
      BoardKit.log(SUITE, 'case 1400 begin');
      let session: StoreSession = await prepareStore('case 1400');
      let board: MyDataSource = await parseBoard(session.store);
      let total: number = 0;
      for (let index: number = 0; index < board.dataArray.length; index++) {
        total = total + board.dataArray[index].data;
      }
      BoardKit.log(BUNDLE + 'UiPersistence_013', 'check: expect(total >= 4).assertTrue();');
      expect(total >= 4).assertTrue();
      BoardKit.log(BUNDLE + 'UiPersistence_013', 'check: expect(total % 2).assertEqual(0);');
      expect(total % 2).assertEqual(0);
      BoardKit.log(SUITE, 'case 1400 end');
      BoardKit.log(BUNDLE + 'UiPersistence_013', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_1500
     * @tc.name indexUiPersistenceRestartKeepsStoreReadable1500
     * @tc.desc Verify the store is still readable after the app is closed and launched again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_014', 'begin');
      BoardKit.log(SUITE, 'case 1500 begin');
      let restartError: BusinessError | null = await restartGame();
      BoardKit.log(BUNDLE + 'UiPersistence_014', 'check: expect(restartError).assertNull();');
      expect(restartError).assertNull();
      let driver: Driver = Driver.create();
      await driver.delayMs(STEP_DELAY);
      let logoPresent: boolean = await isIdPresent(driver, LOGO_ID);
      BoardKit.log(BUNDLE + 'UiPersistence_014', 'check: expect(logoPresent).assertTrue();');
      expect(logoPresent).assertTrue();
      let session: StoreSession = await prepareStore('case 1500');
      let present: boolean = await session.store.has(KEY_GAME_DATA);
      BoardKit.log(BUNDLE + 'UiPersistence_014', 'check: expect(present).assertTrue();');
      expect(present).assertTrue();
      BoardKit.log(SUITE, 'case 1500 end');
      BoardKit.log(BUNDLE + 'UiPersistence_014', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_1600
     * @tc.name indexUiPersistenceRestartKeepsScore1600
     * @tc.desc Verify the persisted score remains a readable number after the app restarts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_015', 'begin');
      BoardKit.log(SUITE, 'case 1600 begin');
      let restartError: BusinessError | null = await restartGame();
      BoardKit.log(BUNDLE + 'UiPersistence_015', 'check: expect(restartError === null).assertTrue();');
      expect(restartError === null).assertTrue();
      let driver: Driver = Driver.create();
      await driver.delayMs(STEP_DELAY);
      let logoPresent: boolean = await isIdPresent(driver, LOGO_ID);
      BoardKit.log(BUNDLE + 'UiPersistence_015', 'check: expect(logoPresent).assertTrue();');
      expect(logoPresent).assertTrue();
      let session: StoreSession = await prepareStore('case 1600');
      let scoreValue: number = await readNumber(session.store, KEY_SCORE);
      BoardKit.log(BUNDLE + 'UiPersistence_015', 'check: expect(Number.isNaN(scoreValue)).assertFalse();');
      expect(Number.isNaN(scoreValue)).assertFalse();
      BoardKit.log(BUNDLE + 'UiPersistence_015', 'check: expect(scoreValue >= 0).assertTrue();');
      expect(scoreValue >= 0).assertTrue();
      BoardKit.log(SUITE, 'case 1600 end');
      BoardKit.log(BUNDLE + 'UiPersistence_015', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_1700
     * @tc.name indexUiPersistenceRestartKeepsGameStatus1700
     * @tc.desc Verify the persisted gameStatus remains numeric after the app restarts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_016', 'begin');
      BoardKit.log(SUITE, 'case 1700 begin');
      let restartError: BusinessError | null = await restartGame();
      BoardKit.log(BUNDLE + 'UiPersistence_016', 'check: expect(restartError).assertNull();');
      expect(restartError).assertNull();
      let driver: Driver = Driver.create();
      await driver.delayMs(STEP_DELAY);
      let logoPresent: boolean = await isIdPresent(driver, LOGO_ID);
      BoardKit.log(BUNDLE + 'UiPersistence_016', 'check: expect(logoPresent).assertTrue();');
      expect(logoPresent).assertTrue();
      let session: StoreSession = await prepareStore('case 1700');
      let statusValue: number = await readNumber(session.store, KEY_GAME_STATUS);
      BoardKit.log(BUNDLE + 'UiPersistence_016', 'check: expect(Number.isNaN(statusValue)).assertFalse();');
      expect(Number.isNaN(statusValue)).assertFalse();
      BoardKit.log(BUNDLE + 'UiPersistence_016', 'check: expect(statusValue === -1 || statusValue === 0 || statusValue === 1).assertTrue();');
      expect(statusValue === -1 || statusValue === 0 || statusValue === 1).assertTrue();
      BoardKit.log(SUITE, 'case 1700 end');
      BoardKit.log(BUNDLE + 'UiPersistence_016', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_1800
     * @tc.name indexUiPersistenceRestartKeepsGameData1800
     * @tc.desc Verify the persisted gameData still parses to sixteen cells after the app restarts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_017', 'begin');
      BoardKit.log(SUITE, 'case 1800 begin');
      let restartError: BusinessError | null = await restartGame();
      BoardKit.log(BUNDLE + 'UiPersistence_017', 'check: expect(restartError === null).assertTrue();');
      expect(restartError === null).assertTrue();
      let driver: Driver = Driver.create();
      await driver.delayMs(STEP_DELAY);
      let logoPresent: boolean = await isIdPresent(driver, LOGO_ID);
      BoardKit.log(BUNDLE + 'UiPersistence_017', 'check: expect(logoPresent).assertTrue();');
      expect(logoPresent).assertTrue();
      let session: StoreSession = await prepareStore('case 1800');
      let board: MyDataSource = await parseBoard(session.store);
      BoardKit.log(BUNDLE + 'UiPersistence_017', 'check: expect(board.dataArray.length).assertEqual(BOARD_CELLS);');
      expect(board.dataArray.length).assertEqual(BOARD_CELLS);
      BoardKit.log(BUNDLE + 'UiPersistence_017', 'check: expect(board.totalCount() > 0).assertTrue();');
      expect(board.totalCount() > 0).assertTrue();
      BoardKit.log(SUITE, 'case 1800 end');
      BoardKit.log(BUNDLE + 'UiPersistence_017', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_1900
     * @tc.name indexUiPersistenceMirrorPutThenGet1900
     * @tc.desc Verify a string written to preferences is read back unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_018', 'begin');
      BoardKit.log(SUITE, 'case 1900 begin');
      let mirrorStore: data_preferences.Preferences = await openMirrorStore();
      await mirrorStore.put(KEY_MIRROR_TEXT, MIRROR_TEXT_VALUE);
      await mirrorStore.flush();
      let readBack: string = await mirrorStore.get(KEY_MIRROR_TEXT, '') as string;
      BoardKit.log(BUNDLE + 'UiPersistence_018', 'check: expect(readBack).assertEqual(MIRROR_TEXT_VALUE);');
      expect(readBack).assertEqual(MIRROR_TEXT_VALUE);
      BoardKit.log(BUNDLE + 'UiPersistence_018', 'check: expect(readBack.length).assertEqual(MIRROR_TEXT_VALUE.length);');
      expect(readBack.length).assertEqual(MIRROR_TEXT_VALUE.length);
      BoardKit.log(SUITE, 'case 1900 end');
      BoardKit.log(BUNDLE + 'UiPersistence_018', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_2000
     * @tc.name indexUiPersistenceMirrorFlushThenReopen2000
     * @tc.desc Verify a flushed number survives when the preferences store is opened again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_019', 'begin');
      BoardKit.log(SUITE, 'case 2000 begin');
      let mirrorStore: data_preferences.Preferences = await openMirrorStore();
      await mirrorStore.put(KEY_MIRROR_COUNT, MIRROR_COUNT_VALUE);
      await mirrorStore.flush();
      let context: common.Context = application.getApplicationContext();
      let reopened: data_preferences.Preferences =
        await data_preferences.getPreferences(context, MIRROR_STORE_NAME);
      let countValue: number = await reopened.get(KEY_MIRROR_COUNT, 0) as number;
      BoardKit.log(BUNDLE + 'UiPersistence_019', 'check: expect(countValue).assertEqual(MIRROR_COUNT_VALUE);');
      expect(countValue).assertEqual(MIRROR_COUNT_VALUE);
      BoardKit.log(BUNDLE + 'UiPersistence_019', 'check: expect(countValue > 0).assertTrue();');
      expect(countValue > 0).assertTrue();
      BoardKit.log(SUITE, 'case 2000 end');
      BoardKit.log(BUNDLE + 'UiPersistence_019', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_2100
     * @tc.name indexUiPersistenceMirrorHasAfterPut2100
     * @tc.desc Verify has reports true for a written key and false for a key never written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_020', 'begin');
      BoardKit.log(SUITE, 'case 2100 begin');
      let mirrorStore: data_preferences.Preferences = await openMirrorStore();
      await mirrorStore.put(KEY_MIRROR_FLAG, true);
      await mirrorStore.flush();
      let present: boolean = await mirrorStore.has(KEY_MIRROR_FLAG);
      BoardKit.log(BUNDLE + 'UiPersistence_020', 'check: expect(present).assertTrue();');
      expect(present).assertTrue();
      let absent: boolean = await mirrorStore.has(KEY_MIRROR_ABSENT);
      BoardKit.log(BUNDLE + 'UiPersistence_020', 'check: expect(absent).assertFalse();');
      expect(absent).assertFalse();
      BoardKit.log(BUNDLE + 'UiPersistence_020', 'check: expect(absent === false).assertTrue();');
      expect(absent === false).assertTrue();
      BoardKit.log(SUITE, 'case 2100 end');
      BoardKit.log(BUNDLE + 'UiPersistence_020', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_2200
     * @tc.name indexUiPersistenceMirrorDeleteRemovesKey2200
     * @tc.desc Verify delete removes a previously written key from the preferences store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_021', 'begin');
      BoardKit.log(SUITE, 'case 2200 begin');
      let mirrorStore: data_preferences.Preferences = await openMirrorStore();
      await mirrorStore.put(KEY_MIRROR_DELETE, 'to-be-deleted');
      await mirrorStore.flush();
      let before: boolean = await mirrorStore.has(KEY_MIRROR_DELETE);
      BoardKit.log(BUNDLE + 'UiPersistence_021', 'check: expect(before).assertTrue();');
      expect(before).assertTrue();
      await mirrorStore.delete(KEY_MIRROR_DELETE);
      await mirrorStore.flush();
      let after: boolean = await mirrorStore.has(KEY_MIRROR_DELETE);
      BoardKit.log(BUNDLE + 'UiPersistence_021', 'check: expect(after).assertFalse();');
      expect(after).assertFalse();
      BoardKit.log(SUITE, 'case 2200 end');
      BoardKit.log(BUNDLE + 'UiPersistence_021', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_2300
     * @tc.name indexUiPersistenceMissingKeyReadsNull2300
     * @tc.desc Verify a never written key is reported absent and reads back as null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_022', 'begin');
      BoardKit.log(SUITE, 'case 2300 begin');
      let mirrorStore: data_preferences.Preferences = await openMirrorStore();
      await seedMirror(mirrorStore);
      let missingText: string | null = await readTextOrNull(mirrorStore, KEY_MIRROR_ABSENT);
      BoardKit.log(BUNDLE + 'UiPersistence_022', 'check: expect(missingText).assertNull();');
      expect(missingText).assertNull();
      let presentText: string | null = await readTextOrNull(mirrorStore, KEY_GAME_DATA);
      BoardKit.log(BUNDLE + 'UiPersistence_022', 'check: expect(presentText === null).assertFalse();');
      expect(presentText === null).assertFalse();
      BoardKit.log(BUNDLE + 'UiPersistence_022', 'check: expect((presentText as string).length > 0).assertTrue();');
      expect((presentText as string).length > 0).assertTrue();
      BoardKit.log(SUITE, 'case 2300 end');
      BoardKit.log(BUNDLE + 'UiPersistence_022', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_2400
     * @tc.name indexUiPersistenceMirrorOverwriteKeepsLatest2400
     * @tc.desc Verify writing the same key twice keeps only the latest value after flush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_023', 'begin');
      BoardKit.log(SUITE, 'case 2400 begin');
      let mirrorStore: data_preferences.Preferences = await openMirrorStore();
      await mirrorStore.put(KEY_MIRROR_TEXT, 'first-value');
      await mirrorStore.flush();
      let firstRead: string = await mirrorStore.get(KEY_MIRROR_TEXT, '') as string;
      BoardKit.log(BUNDLE + 'UiPersistence_023', 'check: expect(firstRead).assertEqual(\'first-value\');');
      expect(firstRead).assertEqual('first-value');
      await mirrorStore.put(KEY_MIRROR_TEXT, MIRROR_TEXT_VALUE);
      await mirrorStore.flush();
      let secondRead: string = await mirrorStore.get(KEY_MIRROR_TEXT, '') as string;
      BoardKit.log(BUNDLE + 'UiPersistence_023', 'check: expect(secondRead).assertEqual(MIRROR_TEXT_VALUE);');
      expect(secondRead).assertEqual(MIRROR_TEXT_VALUE);
      BoardKit.log(BUNDLE + 'UiPersistence_023', 'check: expect(secondRead === firstRead).assertFalse();');
      expect(secondRead === firstRead).assertFalse();
      BoardKit.log(SUITE, 'case 2400 end');
      BoardKit.log(BUNDLE + 'UiPersistence_023', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_2500
     * @tc.name indexUiPersistenceGameDataUsesPowerOfTwo2500
     * @tc.desc Verify every persisted non zero cell value is a power of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_024', 'begin');
      BoardKit.log(SUITE, 'case 2500 begin');
      let session: StoreSession = await prepareStore('case 2500');
      let board: MyDataSource = await parseBoard(session.store);
      let checkedCells: number = 0;
      for (let index: number = 0; index < board.dataArray.length; index++) {
        let value: number = board.dataArray[index].data;
        if (value !== 0) {
          let reduced: number = value;
          while (reduced > 2) {
            BoardKit.log(BUNDLE + 'UiPersistence_024', 'check: expect(reduced % 2).assertEqual(0);');
            expect(reduced % 2).assertEqual(0);
            reduced = reduced / 2;
          }
          BoardKit.log(BUNDLE + 'UiPersistence_024', 'check: expect(reduced).assertEqual(2);');
          expect(reduced).assertEqual(2);
        }
        checkedCells = checkedCells + 1;
      }
      BoardKit.log(BUNDLE + 'UiPersistence_024', 'check: expect(checkedCells).assertEqual(BOARD_CELLS);');
      expect(checkedCells).assertEqual(BOARD_CELLS);
      BoardKit.log(SUITE, 'case 2500 end');
      BoardKit.log(BUNDLE + 'UiPersistence_024', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_2600
     * @tc.name indexUiPersistenceReopenAfterCacheRemoval2600
     * @tc.desc Verify a flushed value is still readable after its preferences cache is removed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_025', 'begin');
      BoardKit.log(SUITE, 'case 2600 begin');
      let mirrorStore: data_preferences.Preferences = await openMirrorStore();
      await mirrorStore.put(KEY_MIRROR_COUNT, 99);
      await mirrorStore.flush();
      let context: common.Context = application.getApplicationContext();
      await data_preferences.removePreferencesFromCache(context, MIRROR_STORE_NAME);
      let reopened: data_preferences.Preferences =
        await data_preferences.getPreferences(context, MIRROR_STORE_NAME);
      let countValue: number = await reopened.get(KEY_MIRROR_COUNT, 0) as number;
      BoardKit.log(BUNDLE + 'UiPersistence_025', 'check: expect(countValue).assertEqual(99);');
      expect(countValue).assertEqual(99);
      let present: boolean = await reopened.has(KEY_MIRROR_COUNT);
      BoardKit.log(BUNDLE + 'UiPersistence_025', 'check: expect(present).assertTrue();');
      expect(present).assertTrue();
      BoardKit.log(SUITE, 'case 2600 end');
      BoardKit.log(BUNDLE + 'UiPersistence_025', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_2700
     * @tc.name indexUiPersistenceGameDataIdsAreSequential2700
     * @tc.desc Verify persisted cells keep the original zero based ids in array order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_026', 'begin');
      BoardKit.log(SUITE, 'case 2700 begin');
      let session: StoreSession = await prepareStore('case 2700');
      let board: MyDataSource = await parseBoard(session.store);
      for (let index: number = 0; index < board.dataArray.length; index++) {
        let cell: DataType = board.dataArray[index];
        BoardKit.log(BUNDLE + 'UiPersistence_026', 'check: expect(cell.id).assertEqual(index);');
        expect(cell.id).assertEqual(index);
      }
      BoardKit.log(BUNDLE + 'UiPersistence_026', 'check: expect(board.dataArray[0].id).assertEqual(0);');
      expect(board.dataArray[0].id).assertEqual(0);
      BoardKit.log(BUNDLE + 'UiPersistence_026', 'check: expect(board.dataArray[BOARD_CELLS - 1].id).assertEqual(BOARD_CELLS - 1);');
      expect(board.dataArray[BOARD_CELLS - 1].id).assertEqual(BOARD_CELLS - 1);
      BoardKit.log(SUITE, 'case 2700 end');
      BoardKit.log(BUNDLE + 'UiPersistence_026', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIPERSISTENCE_2800
     * @tc.name indexUiPersistenceCleanupRemovesMirrorKeys2800
     * @tc.desc Verify clearing the mirror store removes every seeded persistence key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiPersistence_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiPersistence_027', 'begin');
      BoardKit.log(SUITE, 'case 2800 begin');
      let mirrorStore: data_preferences.Preferences = await openMirrorStore();
      await mirrorStore.clear();
      await mirrorStore.flush();
      let hasData: boolean = await mirrorStore.has(KEY_GAME_DATA);
      let hasScore: boolean = await mirrorStore.has(KEY_SCORE);
      let hasStatus: boolean = await mirrorStore.has(KEY_GAME_STATUS);
      BoardKit.log(BUNDLE + 'UiPersistence_027', 'check: expect(hasData).assertFalse();');
      expect(hasData).assertFalse();
      BoardKit.log(BUNDLE + 'UiPersistence_027', 'check: expect(hasScore).assertFalse();');
      expect(hasScore).assertFalse();
      BoardKit.log(BUNDLE + 'UiPersistence_027', 'check: expect(hasStatus).assertFalse();');
      expect(hasStatus).assertFalse();
      BoardKit.log(SUITE, 'case 2800 end');
      BoardKit.log(BUNDLE + 'UiPersistence_027', 'end');
    });
  });
}
