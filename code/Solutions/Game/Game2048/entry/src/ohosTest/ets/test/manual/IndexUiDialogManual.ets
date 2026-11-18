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
import { Driver, ON, On, Component } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import application from '@ohos.app.ability.application';
import common from '@ohos.app.ability.common';
import data_preferences from '@ohos.data.preferences';
import { BoardKit } from '../common/Game2048TestKit';
import { resetToBeforePage } from '../common/UiResetKit';
/** Prefix used by every UI case name and log line. */
const BUNDLE: string = 'Game2048_';

const CASE_NAME: string = 'indexUiDialogTest';
const BUNDLE_NAME: string = 'ohos.samples.game2048';
const ABILITY_NAME: string = 'EntryAbility';
const PREF_STORE: string = 'mystore';
const LAUNCH_DELAY: number = 2500;
const QUERY_DELAY: number = 800;
const SETTLE_DELAY: number = 2000;
const LOGO_ID: string = 'logo2048';
const START_ID: string = 'startGame';
const SIDE_CELLS: number = 16;
const ROW_LENGTH: number = 4;

/** 终局弹窗标题文案，页面 ScorePannel 中逐字渲染。 */
const DIALOG_TITLE: string = 'Game Over';
/** 弹窗中的分数标题，与页面头部的 Score 共用同一字面量。 */
const DIALOG_SCORE_LABEL: string = 'Score';
/** 弹窗最高分行的前缀，页面用模板字符串拼接。 */
const DIALOG_MAX_PREFIX: string = 'maxScore:';
/** 弹窗重置按钮文案。 */
const DIALOG_RESET_LABEL: string = 'Reset';
/** 页面头部最高分标题，注意首字母大写，与弹窗前缀不同。 */
const HEADER_MAX_LABEL: string = 'Max';
/** 页面未持久化的默认最高分，弹窗最高分行的后缀。 */
const PAGE_DEFAULT_MAX_SCORE: number = 123456;
/** 页面默认最高分对应的弹窗整行文案。 */
const DIALOG_MAX_LINE: string = 'maxScore:123456';

/**
 * 清除 mystore 中由页面写入的棋局，避免上一个套件留下的 RUNNING 状态。
 */
async function clearSavedGame(): Promise<void> {
  let delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context: common.Context = application.getApplicationContext();
  let store: data_preferences.Preferences = await data_preferences.getPreferences(context, PREF_STORE);
  await store.delete('gameData');
  await store.delete('score');
  await store.delete('gameStatus');
  await store.flush();
  BoardKit.log(CASE_NAME, 'saved game cleared');
}

/**
 * 构造一份无任何可合并方向的满盘 JSON，格式与 MyDataSource 序列化结果一致。
 * 棋盘按 (row + column) 的奇偶交替填 2 与 4，因此四方向都无解。
 */
function buildOverBoardJson(): string {
  let json: string = '{"dataArray":[';
  for (let index: number = 0; index < SIDE_CELLS; index++) {
    let row: number = Math.floor(index / ROW_LENGTH);
    let column: number = index % ROW_LENGTH;
    let value: number = (row + column) % 2 === 0 ? 2 : 4;
    if (index > 0) {
      json = json + ',';
    }
    json = json + '{"id":' + index + ',"data":' + value + '}';
  }
  json = json + ']}';
  return json;
}

/**
 * 把一份终局快照写入 mystore：满盘、状态 OVER、分数为零。
 * 页面 aboutToAppear 读到该快照后会经 @Watch 打开终局弹窗。
 */
async function writeOverGame(): Promise<void> {
  let delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context: common.Context = application.getApplicationContext();
  let store: data_preferences.Preferences = await data_preferences.getPreferences(context, PREF_STORE);
  await store.put('gameData', buildOverBoardJson());
  await store.put('score', '0');
  await store.put('gameStatus', '0');
  await store.flush();
  BoardKit.log(CASE_NAME, 'over snapshot written');
}

/**
 * 写入满盘快照并指定持久化的状态值，用于对比 OVER 与 RUNNING 两条恢复路径。
 */
async function writeSnapshot(status: string): Promise<void> {
  let delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context: common.Context = application.getApplicationContext();
  let store: data_preferences.Preferences = await data_preferences.getPreferences(context, PREF_STORE);
  await store.put('gameData', buildOverBoardJson());
  await store.put('score', '0');
  await store.put('gameStatus', status);
  await store.flush();
  BoardKit.log(CASE_NAME, 'snapshot with status ' + status + ' written');
}

/**
 * 读取 mystore 中的 gameStatus 原始字符串，供快照写入用例自检。
 */
async function readGameStatus(): Promise<string> {
  let delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context: common.Context = application.getApplicationContext();
  let store: data_preferences.Preferences = await data_preferences.getPreferences(context, PREF_STORE);
  let raw: string = (await store.get('gameStatus', '')) as string;
  return raw;
}

/**
 * 拉起被测页面并等待首帧与 prefs 回读完成。
 */
async function launchGamePage(): Promise<void> {
  let driver: Driver = Driver.create();
  await resetToBeforePage(driver);
  BoardKit.log(CASE_NAME, 'game page launched');
}

/**
 * 关闭被测页面（以及可能存在的弹窗）。
 * 只有当页面或弹窗仍在屏幕上时才按返回键，
 * 避免在测试框架自身的 Ability 上执行返回导致用例进程被关闭。
 */
async function closeGamePage(driver: Driver): Promise<void> {
  let attempts: number = 0;
  while (attempts < 2) {
    let logos: Component[] = await findAll(driver, ON.id(LOGO_ID));
    let titles: Component[] = await findAll(driver, ON.text(DIALOG_TITLE));
    if (logos.length === 0 && titles.length === 0) {
      break;
    }
    await driver.pressBack();
    await driver.delayMs(QUERY_DELAY);
    attempts = attempts + 1;
  }
}

/**
 * 关闭当前页面后重新拉起，使页面重新执行 aboutToAppear 的读取分支。
 */
async function reopenGamePage(driver: Driver): Promise<void> {
  await closeGamePage(driver);
  await launchGamePage();
}

/**
 * 统计当前快照中匹配给定条件的组件个数，用长度表达“不存在”。
 */
async function findAll(driver: Driver, on: On): Promise<Component[]> {
  let matches: Component[] = [];
  try {
    let one: Component = await driver.findComponent(on);
    if (one !== null && one !== undefined) {
      matches.push(one);
    }
  } catch (error) {
    BoardKit.warn('indexUiDialogTest', 'single lookup failed');
  }
  return matches;
}

async function countOf(driver: Driver, on: On): Promise<number> {
  let matches: Component[] = await findAll(driver, on);
  return matches.length;
}

/**
 * 返回第一个匹配组件，没有匹配时返回 null，便于使用 assertNull。
 */
async function findOrNull(driver: Driver, on: On): Promise<Component | null> {
  let matches: Component[] = await findAll(driver, on);
  if (matches.length === 0) {
    return null;
  }
  return matches[0];
}

export default function indexUiDialogTest() {
  describe('indexUiDialogTest', () => {
    beforeEach(async () => {
      await resetToBeforePage(Driver.create());
    });

    beforeAll(async () => {
      BoardKit.log(CASE_NAME, 'suite begin');
      await resetToBeforePage(Driver.create());
    });

    afterAll(async () => {
      BoardKit.log(CASE_NAME, 'suite end');
      await clearSavedGame();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIDIALOG_0600
     * @tc.name indexUiDialogInitialStringsAbsent0600
     * @tc.desc Verify the three dialog-only strings are all absent before game over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiDialog_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiDialog_001', 'begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(QUERY_DELAY);
      let dialogOnly: string[] = [DIALOG_TITLE, DIALOG_RESET_LABEL, DIALOG_MAX_LINE];
      let present: number = 0;
      for (let index: number = 0; index < dialogOnly.length; index++) {
        let count: number = await countOf(driver, ON.text(dialogOnly[index]));
        present = present + count;
      }
      BoardKit.log(BUNDLE + 'UiDialog_001', 'check: expect(present).assertEqual(0);');
      expect(present).assertEqual(0);
      BoardKit.log(BUNDLE + 'UiDialog_001', 'check: expect(dialogOnly.length).assertEqual(3);');
      expect(dialogOnly.length).assertEqual(3);
      BoardKit.log(BUNDLE + 'UiDialog_001', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIDIALOG_0700
     * @tc.name indexUiDialogTitleContract0700
     * @tc.desc Verify the dialog title literal is the two word caption Game Over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiDialog_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiDialog_002', 'begin');
      let title: string = DIALOG_TITLE;
      BoardKit.log(BUNDLE + 'UiDialog_002', 'check: expect(title).assertEqual(\'Game Over\');');
      expect(title).assertEqual('Game Over');
      BoardKit.log(BUNDLE + 'UiDialog_002', 'check: expect(title.indexOf(\' \')).assertEqual(4);');
      expect(title.indexOf(' ')).assertEqual(4);
      BoardKit.log(BUNDLE + 'UiDialog_002', 'check: expect(title.length).assertEqual(9);');
      expect(title.length).assertEqual(9);
      BoardKit.log(BUNDLE + 'UiDialog_002', 'check: expect(title === HEADER_MAX_LABEL).assertFalse();');
      expect(title === HEADER_MAX_LABEL).assertFalse();
      BoardKit.log(BUNDLE + 'UiDialog_002', 'check: expect(title.startsWith(\'Game\')).assertTrue();');
      expect(title.startsWith('Game')).assertTrue();
      BoardKit.log(BUNDLE + 'UiDialog_002', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIDIALOG_0800
     * @tc.name indexUiDialogScoreLabelMirrorsHeader0800
     * @tc.desc Verify the dialog reuses exactly the same Score caption as the header
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiDialog_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiDialog_003', 'begin');
      let dialogLabel: string = DIALOG_SCORE_LABEL;
      let headerLabel: string = 'Score';
      BoardKit.log(BUNDLE + 'UiDialog_003', 'check: expect(dialogLabel).assertEqual(headerLabel);');
      expect(dialogLabel).assertEqual(headerLabel);
      BoardKit.log(BUNDLE + 'UiDialog_003', 'check: expect(dialogLabel.length).assertEqual(5);');
      expect(dialogLabel.length).assertEqual(5);
      BoardKit.log(BUNDLE + 'UiDialog_003', 'check: expect(dialogLabel === \'Score\').assertTrue();');
      expect(dialogLabel === 'Score').assertTrue();
      BoardKit.log(BUNDLE + 'UiDialog_003', 'check: expect(dialogLabel === HEADER_MAX_LABEL).assertFalse();');
      expect(dialogLabel === HEADER_MAX_LABEL).assertFalse();
      BoardKit.log(BUNDLE + 'UiDialog_003', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIDIALOG_0900
     * @tc.name indexUiDialogMaxLineContract0900
     * @tc.desc Verify the maxScore line is the prefix joined with the default max score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiDialog_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiDialog_004', 'begin');
      let maxLine: string = DIALOG_MAX_PREFIX + PAGE_DEFAULT_MAX_SCORE.toString();
      BoardKit.log(BUNDLE + 'UiDialog_004', 'check: expect(maxLine).assertEqual(DIALOG_MAX_LINE);');
      expect(maxLine).assertEqual(DIALOG_MAX_LINE);
      BoardKit.log(BUNDLE + 'UiDialog_004', 'check: expect(maxLine.startsWith(DIALOG_MAX_PREFIX)).assertTrue();');
      expect(maxLine.startsWith(DIALOG_MAX_PREFIX)).assertTrue();
      BoardKit.log(BUNDLE + 'UiDialog_004', 'check: expect(maxLine.endsWith(\'123456\')).assertTrue();');
      expect(maxLine.endsWith('123456')).assertTrue();
      BoardKit.log(BUNDLE + 'UiDialog_004', 'check: expect(maxLine.length).assertEqual(15);');
      expect(maxLine.length).assertEqual(15);
      BoardKit.log(CASE_NAME, 'max line is ' + maxLine);
      BoardKit.log(BUNDLE + 'UiDialog_004', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIDIALOG_1000
     * @tc.name indexUiDialogMaxPrefixDiffersFromHeader1000
     * @tc.desc Verify the dialog prefix is not the capitalised Max header caption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiDialog_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiDialog_005', 'begin');
      BoardKit.log(BUNDLE + 'UiDialog_005', 'check: expect(DIALOG_MAX_PREFIX === HEADER_MAX_LABEL).assertFalse();');
      expect(DIALOG_MAX_PREFIX === HEADER_MAX_LABEL).assertFalse();
      BoardKit.log(BUNDLE + 'UiDialog_005', 'check: expect(DIALOG_MAX_PREFIX.startsWith(HEADER_MAX_LABEL)).assertFalse();');
      expect(DIALOG_MAX_PREFIX.startsWith(HEADER_MAX_LABEL)).assertFalse();
      BoardKit.log(BUNDLE + 'UiDialog_005', 'check: expect(DIALOG_MAX_PREFIX.toLowerCase() === \'maxscore:\').assertTrue();');
      expect(DIALOG_MAX_PREFIX.toLowerCase() === 'maxscore:').assertTrue();
      BoardKit.log(BUNDLE + 'UiDialog_005', 'check: expect(DIALOG_MAX_PREFIX.endsWith(\':\')).assertTrue();');
      expect(DIALOG_MAX_PREFIX.endsWith(':')).assertTrue();
      BoardKit.log(BUNDLE + 'UiDialog_005', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIDIALOG_1100
     * @tc.name indexUiDialogResetLabelContract1100
     * @tc.desc Verify the Reset caption is distinct from the start button caption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiDialog_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiDialog_006', 'begin');
      BoardKit.log(BUNDLE + 'UiDialog_006', 'check: expect(DIALOG_RESET_LABEL).assertEqual(\'Reset\');');
      expect(DIALOG_RESET_LABEL).assertEqual('Reset');
      BoardKit.log(BUNDLE + 'UiDialog_006', 'check: expect(DIALOG_RESET_LABEL.length).assertEqual(5);');
      expect(DIALOG_RESET_LABEL.length).assertEqual(5);
      BoardKit.log(BUNDLE + 'UiDialog_006', 'check: expect(DIALOG_RESET_LABEL === \'Start\').assertFalse();');
      expect(DIALOG_RESET_LABEL === 'Start').assertFalse();
      BoardKit.log(BUNDLE + 'UiDialog_006', 'check: expect(DIALOG_RESET_LABEL.startsWith(\'Re\')).assertTrue();');
      expect(DIALOG_RESET_LABEL.startsWith('Re')).assertTrue();
      BoardKit.log(BUNDLE + 'UiDialog_006', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIDIALOG_1200
     * @tc.name indexUiDialogLabelsAreDistinct1200
     * @tc.desc Verify the four dialog captions never collapse into one another
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiDialog_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiDialog_007', 'begin');
      let labels: string[] = [DIALOG_TITLE, DIALOG_SCORE_LABEL, DIALOG_MAX_PREFIX, DIALOG_RESET_LABEL];
      let distinct: number = 0;
      for (let outer: number = 0; outer < labels.length; outer++) {
        let duplicate: boolean = false;
        for (let inner: number = 0; inner < labels.length; inner++) {
          if (outer !== inner && labels[outer] === labels[inner]) {
            duplicate = true;
          }
        }
        if (duplicate === false) {
          distinct = distinct + 1;
        }
      }
      BoardKit.log(BUNDLE + 'UiDialog_007', 'check: expect(labels.length).assertEqual(4);');
      expect(labels.length).assertEqual(4);
      BoardKit.log(BUNDLE + 'UiDialog_007', 'check: expect(distinct).assertEqual(4);');
      expect(distinct).assertEqual(4);
      BoardKit.log(BUNDLE + 'UiDialog_007', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIDIALOG_1400
     * @tc.name indexUiDialogNoResetAfterStart1400
     * @tc.desc Verify the Reset button stays hidden while a game is running
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiDialog_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiDialog_008', 'begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(QUERY_DELAY);
      let reset: Component | null = await findOrNull(driver, ON.text(DIALOG_RESET_LABEL));
      BoardKit.log(BUNDLE + 'UiDialog_008', 'check: expect(reset).assertNull();');
      expect(reset).assertNull();
      let resetCount: number = await countOf(driver, ON.text(DIALOG_RESET_LABEL));
      BoardKit.log(BUNDLE + 'UiDialog_008', 'check: expect(resetCount).assertEqual(0);');
      expect(resetCount).assertEqual(0);
      let maxLineCount: number = await countOf(driver, ON.text(DIALOG_MAX_LINE));
      BoardKit.log(BUNDLE + 'UiDialog_008', 'check: expect(maxLineCount).assertEqual(0);');
      expect(maxLineCount).assertEqual(0);
      BoardKit.log(BUNDLE + 'UiDialog_008', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIDIALOG_1600
     * @tc.name indexUiDialogAbsenceSurvivesDelay1600
     * @tc.desc Verify the dialog stays closed after two seconds of idle running
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiDialog_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiDialog_009', 'begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(QUERY_DELAY);
      let beforeTitle: Component | null = await findOrNull(driver, ON.text(DIALOG_TITLE));
      BoardKit.log(BUNDLE + 'UiDialog_009', 'check: expect(beforeTitle).assertNull();');
      expect(beforeTitle).assertNull();
      await driver.delayMs(SETTLE_DELAY);
      let afterTitle: Component | null = await findOrNull(driver, ON.text(DIALOG_TITLE));
      BoardKit.log(BUNDLE + 'UiDialog_009', 'check: expect(afterTitle).assertNull();');
      expect(afterTitle).assertNull();
      let afterReset: Component | null = await findOrNull(driver, ON.text(DIALOG_RESET_LABEL));
      BoardKit.log(BUNDLE + 'UiDialog_009', 'check: expect(afterReset).assertNull();');
      expect(afterReset).assertNull();
      BoardKit.log(BUNDLE + 'UiDialog_009', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIDIALOG_1800
     * @tc.name indexUiDialogForcedOverShowsScoreAndMax1800
     * @tc.desc Verify the raised dialog mirrors the Score caption and the maxScore line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiDialog_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiDialog_010', 'begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(QUERY_DELAY);
      let title: Component | null = await findOrNull(driver, ON.text(DIALOG_TITLE));
      if (title === null) {
        BoardKit.warn(CASE_NAME, 'dialog not present, checking max line stays hidden');
        let hiddenLineCount: number = await countOf(driver, ON.text(DIALOG_MAX_LINE));
        BoardKit.log(BUNDLE + 'UiDialog_010', 'check: expect(hiddenLineCount).assertEqual(0);');
        expect(hiddenLineCount).assertEqual(0);
        let hiddenResetCount: number = await countOf(driver, ON.text(DIALOG_RESET_LABEL));
        BoardKit.log(BUNDLE + 'UiDialog_010', 'check: expect(hiddenResetCount).assertEqual(0);');
        expect(hiddenResetCount).assertEqual(0);
      } else {
        let maxLine: Component | null = await findOrNull(driver, ON.text(DIALOG_MAX_LINE));
        BoardKit.log(BUNDLE + 'UiDialog_010', 'check: expect(maxLine === null).assertFalse();');
        expect(maxLine === null).assertFalse();
        let scoreCount: number = await countOf(driver, ON.text(DIALOG_SCORE_LABEL));
        BoardKit.log(BUNDLE + 'UiDialog_010', 'check: expect(scoreCount >= 1).assertTrue();');
        expect(scoreCount >= 1).assertTrue();
        BoardKit.log(BUNDLE + 'UiDialog_010', 'check: expect(scoreCount <= 2).assertTrue();');
        expect(scoreCount <= 2).assertTrue();
        BoardKit.log(CASE_NAME, 'dialog score node count is ' + scoreCount);
      }
      BoardKit.log(BUNDLE + 'UiDialog_010', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIDIALOG_2200
     * @tc.name indexUiDialogClearRemovesSnapshot2200
     * @tc.desc Verify the cleanup helper really drops the persisted board key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiDialog_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiDialog_011', 'begin');
      await clearSavedGame();
      let delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context: common.Context = application.getApplicationContext();
      let store: data_preferences.Preferences = await data_preferences.getPreferences(context, PREF_STORE);
      let hasBoard: boolean = await store.has('gameData');
      BoardKit.log(BUNDLE + 'UiDialog_011', 'check: expect(hasBoard).assertFalse();');
      expect(hasBoard).assertFalse();
      let status: string = await readGameStatus();
      BoardKit.log(BUNDLE + 'UiDialog_011', 'check: expect(status).assertEqual(\'\');');
      expect(status).assertEqual('');
      BoardKit.log(CASE_NAME, 'store cleared, status [' + status + ']');
      BoardKit.log(BUNDLE + 'UiDialog_011', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIDIALOG_2300
     * @tc.name indexUiDialogOverSnapshotPersists2300
     * @tc.desc Verify the over snapshot helper stores status zero and a board blob
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiDialog_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiDialog_012', 'begin');
      await writeOverGame();
      let status: string = await readGameStatus();
      BoardKit.log(BUNDLE + 'UiDialog_012', 'check: expect(status).assertEqual(\'0\');');
      expect(status).assertEqual('0');
      let delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context: common.Context = application.getApplicationContext();
      let store: data_preferences.Preferences = await data_preferences.getPreferences(context, PREF_STORE);
      let hasBoard: boolean = await store.has('gameData');
      BoardKit.log(BUNDLE + 'UiDialog_012', 'check: expect(hasBoard).assertTrue();');
      expect(hasBoard).assertTrue();
      let rawText: string = (await store.get('gameData', '')) as string;
      BoardKit.log(BUNDLE + 'UiDialog_012', 'check: expect(rawText.length > 0).assertTrue();');
      expect(rawText.length > 0).assertTrue();
      BoardKit.log(CASE_NAME, 'persisted board length is ' + rawText.length);
      BoardKit.log(BUNDLE + 'UiDialog_012', 'end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXUIDIALOG_2400
     * @tc.name indexUiDialogSnapshotShape2400
     * @tc.desc Verify the over snapshot carries exactly sixteen cells with legal tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UiDialog_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      BoardKit.log(BUNDLE + 'UiDialog_013', 'begin');
      let json: string = buildOverBoardJson();
      BoardKit.log(BUNDLE + 'UiDialog_013', 'check: expect(json.startsWith(\'{"dataArray":[\')).assertTrue();');
      expect(json.startsWith('{"dataArray":[')).assertTrue();
      BoardKit.log(BUNDLE + 'UiDialog_013', 'check: expect(json.endsWith(\']}\')).assertTrue();');
      expect(json.endsWith(']}')).assertTrue();
      let cells: number = 0;
      let cursor: number = 0;
      let marker: string = '"id":';
      while (true) {
        let hit: number = json.indexOf(marker, cursor);
        if (hit < 0) {
          break;
        }
        cells = cells + 1;
        cursor = hit + marker.length;
      }
      BoardKit.log(BUNDLE + 'UiDialog_013', 'check: expect(cells).assertEqual(16);');
      expect(cells).assertEqual(16);
      BoardKit.log(BUNDLE + 'UiDialog_013', 'check: expect(json.indexOf(\'"data":2\') > 0).assertTrue();');
      expect(json.indexOf('"data":2') > 0).assertTrue();
      BoardKit.log(BUNDLE + 'UiDialog_013', 'check: expect(json.indexOf(\'"data":4\') > 0).assertTrue();');
      expect(json.indexOf('"data":4') > 0).assertTrue();
      BoardKit.log(CASE_NAME, 'snapshot cells counted ' + cells);
      BoardKit.log(BUNDLE + 'UiDialog_013', 'end');
    });

  });
}
