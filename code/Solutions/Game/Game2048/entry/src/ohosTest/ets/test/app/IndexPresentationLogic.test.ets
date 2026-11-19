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
import { TEXT_COLOR, GameStatus } from '../../../../main/ets/muck/GameData';
import { GameRule } from '../../../../main/ets/model/GameRule';
import { BoardKit } from '../common/Game2048TestKit';

/** Font colour literal used by MyGridItem for tiles whose value is at most four. */
const TILE_BLACK: string = '#000';
/** Marker for app.color.score_color, the font colour of tiles above four. */
const SCORE_COLOR_RES: string = 'app.color.score_color';
/** Marker for app.color.item_bg, the background of an empty cell. */
const ITEM_BG_RES: string = 'app.color.item_bg';
/** Dialog title rendered by ScorePannel. */
const DIALOG_TITLE: string = 'Game Over';
/** Score label rendered by the page header and by the dialog. */
const SCORE_LABEL: string = 'Score';
/** Prefix rendered in front of the maximum score inside the dialog. */
const MAX_SCORE_PREFIX: string = 'maxScore:';
/** Button text that restarts the game from the dialog. */
const RESET_LABEL: string = 'Reset';
/** Button text that starts the game from the page. */
const START_LABEL: string = 'Start';

/**
 * Label fixture that mirrors the four hard coded strings of Index.ets.
 * Keeping them in one fixture lets a case assert the exact copy, the shape of
 * the copy, and that two labels never collapse into the same text.
 */
class IndexLabels {
  dialogTitle: string = DIALOG_TITLE;
  scoreLabel: string = SCORE_LABEL;
  resetLabel: string = RESET_LABEL;
  startLabel: string = START_LABEL;
}

/**
 * Mirrors the text derivation of MyGridItem.build:
 * a zero cell renders an empty string, every other cell renders its value.
 */
function tileText(data: number): string {
  return data === 0 ? '' : `${data}`;
}

/**
 * Mirrors the base two exponent that MyGridItem.build uses as a TEXT_COLOR
 * index. Zero and values that are not a positive power of two have no stable
 * exponent and therefore no table entry, reported here as null.
 */
function tileColorIndex(data: number): number | null {
  if (data <= 0) {
    return null;
  }
  let index: number = Math.round(Math.log(data) / Math.log(2));
  if (Math.pow(2, index) !== data) {
    return null;
  }
  return index;
}

/**
 * Mirrors the font colour derivation of MyGridItem.build:
 * tiles up to four use the black literal, larger tiles the score colour.
 */
function tileFontColor(data: number): string {
  return data <= 4 ? TILE_BLACK : SCORE_COLOR_RES;
}

/**
 * Mirrors the background derivation of MyGridItem.build:
 * zero cells use the item background, tiles use the TEXT_COLOR entry of their
 * exponent. A value without an entry has no colour, reported as undefined.
 */
function tileBackground(data: number): string | undefined {
  if (data === 0) {
    return ITEM_BG_RES;
  }
  let index: number | null = tileColorIndex(data);
  if (index === null) {
    return undefined;
  }
  if (index < 0 || index >= TEXT_COLOR.length) {
    return undefined;
  }
  return TEXT_COLOR[index];
}

/** Mirrors the current score line of the page header: decimal rendering only. */
function scoreText(score: number): string {
  return `${score}`;
}

/** Mirrors the maximum score line of the page header: decimal rendering only. */
function maxScoreText(maxScore: number): string {
  return `${maxScore}`;
}

/** Mirrors the maximum score line of the dialog, prefix included, no space. */
function dialogMaxScoreText(maxScore: number): string {
  return `${MAX_SCORE_PREFIX}${maxScore}`;
}

/**
 * Index.ets 展示派生逻辑测试套件。
 *
 * 页面展示层没有独立模块，三个展示派生都内联在 build() 里：
 *  1. MyGridItem 的文本、字体色、背景色；
 *  2. 页头与弹窗的分数文本；
 *  3. 四个硬编码标签。
 * 本套件用测试内纯函数逐条镜像这三组派生，验证 0 与 2/4/8… 的分支差异、
 * <=4 的字体色边界、TEXT_COLOR 表的下标与越界行为，以及标签文案。
 */
export default function indexPresentationLogicTest() {
  describe('indexPresentationLogicTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('indexPresentationLogicTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('indexPresentationLogicTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_0100
     * @tc.name indexPresentationTileTextEmptyCell0100
     * @tc.desc Verify zero, the empty cell marker, renders no text at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_tileTextForEmptyCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 0;
      BoardKit.log('indexPresentation_tileTextForEmptyCell', 'data=' + data);
      expect(data).assertEqual(0);
      let text: string = tileText(data);
      expect(text).assertEqual('');
      expect(text.length).assertEqual(0);
      expect(text.indexOf('0') < 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_0200
     * @tc.name indexPresentationTileTextTwo0200
     * @tc.desc Verify the smallest spawned tile renders its own single digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_tileTextForTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 2;
      BoardKit.log('indexPresentation_tileTextForTwo', 'data=' + data);
      expect(data).assertEqual(2);
      let text: string = tileText(data);
      expect(text).assertEqual('2');
      expect(text.length).assertEqual(1);
      expect(text.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_0300
     * @tc.name indexPresentationTileTextFour0300
     * @tc.desc Verify a four tile renders one digit and stays distinct from the empty text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_tileTextForFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 4;
      BoardKit.log('indexPresentation_tileTextForFour', 'data=' + data);
      expect(data).assertEqual(4);
      let text: string = tileText(data);
      expect(text).assertEqual('4');
      expect(text === tileText(0)).assertFalse();
      expect(text.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_0400
     * @tc.name indexPresentationTileTextSixteen0400
     * @tc.desc Verify the two digit boundary at sixteen renders both digits in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_tileTextForSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 16;
      BoardKit.log('indexPresentation_tileTextForSixteen', 'data=' + data);
      expect(data).assertEqual(16);
      let text: string = tileText(data);
      expect(text).assertEqual('16');
      expect(text.length).assertEqual(2);
      expect(text.charAt(1)).assertEqual('6');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_0500
     * @tc.name indexPresentationTileText10240500
     * @tc.desc Verify a four digit tile keeps every digit instead of rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_tileTextFor1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 1024;
      BoardKit.log('indexPresentation_tileTextFor1024', 'data=' + data);
      expect(data).assertEqual(1024);
      let text: string = tileText(data);
      expect(text).assertEqual('1024');
      expect(text.length).assertEqual(4);
      expect(text.indexOf('1024')).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_0600
     * @tc.name indexPresentationTileText20480600
     * @tc.desc Verify the game winning tile 2048 renders its four digits unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_tileTextFor2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 2048;
      BoardKit.log('indexPresentation_tileTextFor2048', 'data=' + data);
      expect(data).assertEqual(2048);
      let text: string = tileText(data);
      expect(text).assertEqual('2048');
      expect(text.length).assertEqual(4);
      expect(text.charAt(0)).assertEqual('2');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_0700
     * @tc.name indexPresentationTileText1310720700
     * @tc.desc Verify a six digit tile above the colour table still renders in full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_tileTextFor131072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 131072;
      BoardKit.log('indexPresentation_tileTextFor131072', 'data=' + data);
      expect(data).assertEqual(131072);
      let text: string = tileText(data);
      expect(text).assertEqual('131072');
      expect(text.length).assertEqual(6);
      expect(text === '').assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_0800
     * @tc.name indexPresentationFontColorEmptyCell0800
     * @tc.desc Verify an empty cell still takes the black font branch even though its text is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_fontColorForEmptyCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 0;
      BoardKit.log('indexPresentation_fontColorForEmptyCell', 'data=' + data);
      expect(data).assertEqual(0);
      let color: string = tileFontColor(data);
      expect(color).assertEqual(TILE_BLACK);
      expect(color === SCORE_COLOR_RES).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_0900
     * @tc.name indexPresentationFontColorTwo0900
     * @tc.desc Verify the two tile uses black text on its light background
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_fontColorForTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 2;
      BoardKit.log('indexPresentation_fontColorForTwo', 'data=' + data);
      expect(data).assertEqual(2);
      let color: string = tileFontColor(data);
      expect(color).assertEqual('#000');
      expect(color.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_1000
     * @tc.name indexPresentationFontColorFourBoundary1000
     * @tc.desc Verify four is the last value on the black side of the <=4 font colour boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_fontColorForFourBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 4;
      BoardKit.log('indexPresentation_fontColorForFourBoundary', 'data=' + data);
      expect(data).assertEqual(4);
      expect(data <= 4).assertTrue();
      let color: string = tileFontColor(data);
      expect(color).assertEqual(TILE_BLACK);
      expect(tileFontColor(8)).assertEqual(SCORE_COLOR_RES);
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_1100
     * @tc.name indexPresentationFontColorEight1100
     * @tc.desc Verify eight, the first value above the boundary, switches to the score colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_fontColorForEight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 8;
      BoardKit.log('indexPresentation_fontColorForEight', 'data=' + data);
      expect(data).assertEqual(8);
      expect(data > 4).assertTrue();
      let color: string = tileFontColor(data);
      expect(color).assertEqual('app.color.score_color');
      expect(color === TILE_BLACK).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_1200
     * @tc.name indexPresentationFontColorSixteen1200
     * @tc.desc Verify a mid range tile keeps the score colour rather than drifting back to black
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_fontColorForSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 16;
      BoardKit.log('indexPresentation_fontColorForSixteen', 'data=' + data);
      expect(data).assertEqual(16);
      let color: string = tileFontColor(data);
      expect(color).assertEqual(SCORE_COLOR_RES);
      expect(color).assertEqual(tileFontColor(8));
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_1300
     * @tc.name indexPresentationFontColor20481300
     * @tc.desc Verify the winning tile keeps the score colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_fontColorFor2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 2048;
      BoardKit.log('indexPresentation_fontColorFor2048', 'data=' + data);
      expect(data).assertEqual(2048);
      let color: string = tileFontColor(data);
      expect(color).assertEqual(SCORE_COLOR_RES);
      expect(color.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_1400
     * @tc.name indexPresentationBackgroundEmptyCell1400
     * @tc.desc Verify the zero cell is the only branch that takes the item background
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_backgroundForEmptyCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 0;
      BoardKit.log('indexPresentation_backgroundForEmptyCell', 'data=' + data);
      expect(data).assertEqual(0);
      let background: string | undefined = tileBackground(data);
      expect(background).assertEqual(ITEM_BG_RES);
      expect(background === TEXT_COLOR[0]).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_2200
     * @tc.name indexPresentationBackground16384HasNoEntry2200
     * @tc.desc Verify 16384, exponent fourteen, is beyond the fourteen entry table and has no colour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_backgroundFor16384HasNoEntry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 16384;
      BoardKit.log('indexPresentation_backgroundFor16384HasNoEntry', 'data=' + data);
      expect(data).assertEqual(16384);
      let index: number | null = tileColorIndex(data);
      expect(index).assertEqual(14);
      expect(index).assertEqual(TEXT_COLOR.length);
      let background: string | undefined = tileBackground(data);
      expect(background).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_2300
     * @tc.name indexPresentationColorIndexOfNonPowerOfTwo2300
     * @tc.desc Verify a tile value that is not a power of two has no integer table index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_colorIndexOfNonPowerOfTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 3;
      BoardKit.log('indexPresentation_colorIndexOfNonPowerOfTwo', 'data=' + data);
      expect(data).assertEqual(3);
      let index: number | null = tileColorIndex(data);
      expect(index).assertNull();
      let background: string | undefined = tileBackground(data);
      expect(background).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_2400
     * @tc.name indexPresentationScoreTextFromFreshRule2400
     * @tc.desc Verify a freshly constructed rule reports the zero score text of the header
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_scoreTextFromFreshRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.log('indexPresentation_scoreTextFromFreshRule', 'score=' + rule.score);
      expect(rule.score).assertEqual(0);
      let text: string = scoreText(rule.score);
      expect(text).assertEqual('0');
      expect(text.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_2500
     * @tc.name indexPresentationScoreTextAfterMerge2500
     * @tc.desc Verify the header score text follows the score that a merge writes into the rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_scoreTextAfterMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      rule.move('left');
      BoardKit.log('indexPresentation_scoreTextAfterMerge', 'score=' + rule.score);
      expect(rule.score).assertEqual(4);
      let text: string = scoreText(rule.score);
      expect(text).assertEqual('4');
      expect(text === '0').assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_2600
     * @tc.name indexPresentationScoreTextLargeValue2600
     * @tc.desc Verify a six digit score keeps every digit in the header text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_scoreTextLargeValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let score: number = 123456;
      BoardKit.log('indexPresentation_scoreTextLargeValue', 'score=' + score);
      expect(score).assertEqual(123456);
      let text: string = scoreText(score);
      expect(text).assertEqual('123456');
      expect(text.length).assertEqual(6);
      expect(text.charAt(0)).assertEqual('1');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_2700
     * @tc.name indexPresentationMaxScoreTextDefault2700
     * @tc.desc Verify the page default maximum score 123456 renders as its six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_maxScoreTextDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxScore: number = 123456;
      BoardKit.log('indexPresentation_maxScoreTextDefault', 'maxScore=' + maxScore);
      expect(maxScore).assertEqual(123456);
      let text: string = maxScoreText(maxScore);
      expect(text).assertEqual('123456');
      expect(text).assertEqual(scoreText(maxScore));
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_2800
     * @tc.name indexPresentationMaxScoreTextZero2800
     * @tc.desc Verify a zero maximum score is not blanked out the way a zero tile is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_maxScoreTextZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxScore: number = 0;
      BoardKit.log('indexPresentation_maxScoreTextZero', 'maxScore=' + maxScore);
      expect(maxScore).assertEqual(0);
      let text: string = maxScoreText(maxScore);
      expect(text).assertEqual('0');
      expect(text === tileText(0)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_2900
     * @tc.name indexPresentationDialogMaxScoreText2900
     * @tc.desc Verify the dialog maximum score line starts with the exact prefix followed by the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_dialogMaxScoreText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxScore: number = 123456;
      BoardKit.log('indexPresentation_dialogMaxScoreText', 'maxScore=' + maxScore);
      expect(maxScore).assertEqual(123456);
      let text: string = dialogMaxScoreText(maxScore);
      expect(text).assertEqual('maxScore:123456');
      expect(text).assertContain(MAX_SCORE_PREFIX);
      expect(text.indexOf(MAX_SCORE_PREFIX)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_3000
     * @tc.name indexPresentationDialogMaxScoreZero3000
     * @tc.desc Verify the prefix is kept even when the maximum score is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_dialogMaxScoreZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxScore: number = 0;
      BoardKit.log('indexPresentation_dialogMaxScoreZero', 'maxScore=' + maxScore);
      expect(maxScore).assertEqual(0);
      let text: string = dialogMaxScoreText(maxScore);
      expect(text).assertEqual('maxScore:0');
      expect(text.length).assertEqual(10);
      expect(text).assertContain(':');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_3100
     * @tc.name indexPresentationDialogTitle3100
     * @tc.desc Verify the dialog title copy is exactly Game Over and differs from the score label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_dialogTitle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let labels: IndexLabels = new IndexLabels();
      BoardKit.log('indexPresentation_dialogTitle', 'title=' + labels.dialogTitle);
      expect(labels.dialogTitle).assertEqual('Game Over');
      expect(labels.dialogTitle.length).assertEqual(9);
      expect(labels.dialogTitle).assertContain('Over');
      expect(labels.dialogTitle === labels.scoreLabel).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_3200
     * @tc.name indexPresentationScoreLabel3200
     * @tc.desc Verify the shared Score label is one word with no trailing punctuation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_scoreLabel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let labels: IndexLabels = new IndexLabels();
      BoardKit.log('indexPresentation_scoreLabel', 'label=' + labels.scoreLabel);
      expect(labels.scoreLabel).assertEqual('Score');
      expect(labels.scoreLabel.length).assertEqual(5);
      expect(labels.scoreLabel).assertContain('Sco');
      expect(labels.scoreLabel === 'score').assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_3300
     * @tc.name indexPresentationResetButtonLabel3300
     * @tc.desc Verify the dialog button copy is Reset and stays apart from the page start copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_resetButtonLabel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let labels: IndexLabels = new IndexLabels();
      BoardKit.log('indexPresentation_resetButtonLabel', 'label=' + labels.resetLabel);
      expect(labels.resetLabel).assertEqual('Reset');
      expect(labels.resetLabel.length).assertEqual(5);
      expect(labels.resetLabel === labels.startLabel).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_3400
     * @tc.name indexPresentationStartButtonLabel3400
     * @tc.desc Verify the start button copy is Start and appears only in the BEFORE branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_startButtonLabel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let labels: IndexLabels = new IndexLabels();
      let status: number = GameStatus.BEFORE;
      BoardKit.log('indexPresentation_startButtonLabel', 'label=' + labels.startLabel);
      expect(status).assertEqual(-1);
      expect(status).assertEqual(GameStatus.BEFORE);
      expect(labels.startLabel).assertEqual('Start');
      expect(labels.startLabel.length).assertEqual(5);
      expect(labels.startLabel).assertContain('Star');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_3500
     * @tc.name indexPresentationFullTileAtBoundary3500
     * @tc.desc Verify one tile at the <=4 boundary derives text, black font and table background together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_fullTileAtBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 4;
      BoardKit.log('indexPresentation_fullTileAtBoundary', 'data=' + data);
      expect(data).assertEqual(4);
      expect(data <= 4).assertTrue();
      let text: string = tileText(data);
      let font: string = tileFontColor(data);
      let background: string | undefined = tileBackground(data);
      expect(text).assertEqual('4');
      expect(font).assertEqual(TILE_BLACK);
      expect(background).assertEqual(TEXT_COLOR[2]);
      expect(background === ITEM_BG_RES).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_3700
     * @tc.name indexPresentationZeroHasNoColorIndex3700
     * @tc.desc Verify zero takes the item background branch but has no colour table exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_zeroHasNoColorIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = 0;
      BoardKit.log('indexPresentation_zeroHasNoColorIndex', 'data=' + data);
      expect(data).assertEqual(0);
      let index: number | null = tileColorIndex(data);
      expect(index).assertNull();
      let background: string | undefined = tileBackground(data);
      expect(background).assertEqual(ITEM_BG_RES);
      expect(background).assertContain('item_bg');
    });

    /**
     * @tc.number SUB_GAME2048_INDEXPRESENTATIONLOGIC_3800
     * @tc.name indexPresentationNegativeTileHasNoEntry3800
     * @tc.desc Verify a negative value, which the logarithm cannot map, has neither exponent nor background
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexPresentation_negativeTileHasNoEntry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let data: number = -2;
      BoardKit.log('indexPresentation_negativeTileHasNoEntry', 'data=' + data);
      expect(data).assertEqual(-2);
      expect(data < 0).assertTrue();
      let index: number | null = tileColorIndex(data);
      expect(index).assertNull();
      let background: string | undefined = tileBackground(data);
      expect(background).assertUndefined();
      expect(tileFontColor(data)).assertEqual(TILE_BLACK);
    });
  });
}
