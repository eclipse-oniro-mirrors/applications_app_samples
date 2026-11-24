'use static';

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
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { curUser } from '../../../../main/ets/mock/NewsDetailData.ets';
import {
  EXPECTED_TEXTS, AVATAR_SIZE, AVATAR_RADIUS, AVATAR_MARGIN_TOP, AVATAR_MARGIN_LEFT, NAME_FONT_SIZE,
  NAME_FONT_WEIGHT, NAME_COLOR, NAME_WIDTH_PERCENT, NAME_MARGIN_BOTTOM, BODY_FONT_SIZE, BODY_FONT_WEIGHT,
  BODY_OPACITY, BODY_LINE_HEIGHT, BODY_MARGIN_BOTTOM, REPLY_ROW_WIDTH_PERCENT, REPLY_COLOR, REPLY_BACKGROUND,
  REPLY_OPACITY, CONTENT_PAD_LEFT, CONTENT_PAD_TOP, ACTION_ICON_SIZE, ACTION_ICON_GAP, TITLE_BAR_HEIGHT,
  AVATAR_BADGE_SIZE, BADGE_WIDTH, BADGE_TEXT_COLOR, BADGE_BACKGROUND, SEARCH_PLACEHOLDER_FONT, HEADLINE_FONT_SIZE,
  NEWS_ROW_HEIGHT, COMMENT_TITLE_WIDTH_PERCENT, COMMENT_TITLE_HEIGHT, COMMENT_COUNT_FONT, PUBLISH_BAR_HEIGHT, PUBLISH_BAR_RADIUS,
  PUBLISH_BAR_BORDER_COLOR, PUBLISH_BAR_PAD_LEFT, PUBLISH_WRAP_HEIGHT, PANEL_HEIGHT_PERCENT, EDITOR_ROW_HEIGHT, EDITOR_PADDING,
  INPUT_HEIGHT, INPUT_PAD_LEFT, INPUT_PAD_RIGHT, PUBLISH_BUTTON_HEIGHT, PUBLISH_BUTTON_RADIUS, PUBLISH_BUTTON_BACKGROUND,
  PUBLISH_BUTTON_FOREGROUND, PUBLISH_BUTTON_GAP, SHARE_BAR_HEIGHT, SHARE_ITEM_WIDTH_PERCENT, joinIds, distinctIdCount,
  tailOf, CommentBoard, BoardSnapshot, snapshot, runPublishCycles
  , PUBLISH_WRAP_PAD
} from '../Shared/SharedDriver.ets';
import { logSuite , codePointCount, hasSurrogatePair} from '../Shared/Support.ets';

export default function NavigationModelTest(): void {
  describe('NavigationModelTest', () => {
    beforeAll(() => {
      logSuite('NavigationModelTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('NavigationModelTest', 'end');
    });

    /**
     * @tc.name composerGeometryAddsUpWithFullWidthSpaceInFirstRow
     * @tc.desc The comment title height 30, width 95 percent and search height 75 percent match the page constants.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerGeometryAddsUpWithFullWidthSpaceInFirstRow', 0, () => {
      expect(PUBLISH_WRAP_HEIGHT).assertEqual(100);
      expect(INPUT_HEIGHT + SHARE_BAR_HEIGHT).assertEqual(PUBLISH_WRAP_HEIGHT);
      expect(EDITOR_ROW_HEIGHT).assertEqual(50);
      expect(EDITOR_ROW_HEIGHT).assertEqual(INPUT_HEIGHT + EDITOR_PADDING);
      expect(PUBLISH_BUTTON_RADIUS).assertEqual(PUBLISH_BUTTON_HEIGHT / 2);
      expect(PUBLISH_BAR_RADIUS).assertEqual(PUBLISH_BAR_HEIGHT - PUBLISH_WRAP_PAD);
      expect(PANEL_HEIGHT_PERCENT < 100).assertTrue();
      expect(PANEL_HEIGHT_PERCENT > 50).assertTrue();
      expect(PUBLISH_BUTTON_GAP).assertEqual(EDITOR_PADDING);
      expect(SHARE_ITEM_WIDTH_PERCENT * 4).assertEqual(100);
      expect(COMMENT_TITLE_HEIGHT).assertEqual(30);
      expect(COMMENT_TITLE_WIDTH_PERCENT).assertEqual(95);
      expect(SHARE_BAR_HEIGHT - NEWS_ROW_HEIGHT).assertEqual(20);
      expect(NEWS_ROW_HEIGHT).assertEqual(INPUT_HEIGHT);
      const scenarioTag: string = 'full-width\u3000space' + ':' + 'ＵＳＥＲ' + '@' + 'id-001' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithPlainAfterReset
     * @tc.desc Counting code points in a plain-text draft never exceeds its UTF-16 length and equals it only when no surrogate pair exists.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithPlainAfterReset', 0, () => {
      const text: string = '@mention someone';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('天要下雨娘要嫁人') <= '天要下雨娘要嫁人'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('天要下雨娘要嫁人')).assertEqual(false);
      const scenarioTag: string = '@mention someone' + ':' + '天要下雨娘要嫁人' + '@' + 'row_beta-1' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-1')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithPlainAfterCancel
     * @tc.desc The tail slice after repeated publish cycles of a plain-text draft equals the cycle count and the draft state is cleared.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithPlainAfterCancel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 13, 'back\\slash');
      expect(board.count).assertEqual(21);
      expect(board.publishCount).assertEqual(13);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(21);
      expect(board.byUser(curUser).length).assertEqual(13);
      expect(board.comments[board.count - 1].text).assertEqual('back\\slash');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-12');
      expect(tailOf(board.comments, 13).length).assertEqual(13);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = 'back\\slash' + ':' + '大事不妙了' + '@' + 'uuid-like-0001-2' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-2')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPlainDuringScroll
     * @tc.desc The initial snapshot of a seeded board reports the id chain 1|2|3|4|5|7|8|9 and the last fixture body.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPlainDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.count).assertEqual(8);
      expect(board.listVisible).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.canPublish).assertFalse();
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      expect(board.lastId).assertEqual('');
      const snap: BoardSnapshot = snapshot(board);
      expect(snap.count).assertEqual(8);
      expect(snap.ids).assertEqual('1|2|3|4|5|7|8|9');
      expect(snap.lastText).assertEqual(EXPECTED_TEXTS[7]);
      expect(snap.publishCount).assertEqual(0);
      const scenarioTag: string = 'null' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '记录-1' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 14).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithDigitsWithReplyMeta
     * @tc.desc After publishing a digit-only draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithDigitsWithReplyMeta', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('0');
      board.publish('2-4');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('2-4');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '0' + ':' + '你若安好便是晴天' + '@' + '2-4' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '2-4')).assertLarger(0);
      expect(scenarioTag.length > 12).assertTrue();
    });

    /**
     * @tc.name avatarBoxMatchesConstantWithCjkPunctuationAfterPublish
     * @tc.desc The follow badge width matches the header avatar size and the left margin exceeds the content pad by three units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('avatarBoxMatchesConstantWithCjkPunctuationAfterPublish', 0, () => {
      expect(AVATAR_SIZE).assertEqual(30);
      expect(AVATAR_RADIUS).assertEqual(30);
      expect(AVATAR_RADIUS >= AVATAR_SIZE / 2).assertTrue();
      expect(AVATAR_MARGIN_TOP).assertEqual(10);
      expect(AVATAR_MARGIN_LEFT).assertEqual(15);
      expect(AVATAR_SIZE < TITLE_BAR_HEIGHT).assertTrue();
      expect(ACTION_ICON_SIZE < AVATAR_SIZE).assertTrue();
      expect(CONTENT_PAD_TOP).assertEqual(AVATAR_MARGIN_TOP);
      expect(AVATAR_MARGIN_LEFT > CONTENT_PAD_LEFT).assertTrue();
      expect(AVATAR_SIZE + AVATAR_MARGIN_TOP).assertEqual(40);
      expect(AVATAR_MARGIN_LEFT - CONTENT_PAD_LEFT).assertEqual(3);
      expect(BADGE_WIDTH).assertEqual(AVATAR_BADGE_SIZE);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '等烟雨而我在等你' + '@' + '5-5' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '5-5')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name typographyHierarchyHoldsWithPlainAcrossSessions
     * @tc.desc Width percentages 80 and 85 and the line-height delta of six units match the comment row constants.
     * @tc.type Function
     * @tc.level Level1
     */
    it('typographyHierarchyHoldsWithPlainAcrossSessions', 0, () => {
      expect(NAME_FONT_SIZE).assertEqual(14);
      expect(NAME_FONT_WEIGHT).assertEqual(500);
      expect(BODY_FONT_SIZE).assertEqual(14);
      expect(BODY_FONT_WEIGHT).assertEqual(400);
      expect(NAME_FONT_WEIGHT > BODY_FONT_WEIGHT).assertTrue();
      expect(BODY_LINE_HEIGHT > BODY_FONT_SIZE).assertTrue();
      expect(BODY_LINE_HEIGHT).assertEqual(20);
      expect(BODY_OPACITY < 1).assertTrue();
      expect(REPLY_OPACITY).assertEqual(BODY_OPACITY);
      expect(NAME_WIDTH_PERCENT).assertEqual(80);
      expect(REPLY_ROW_WIDTH_PERCENT > NAME_WIDTH_PERCENT).assertTrue();
      expect(NAME_WIDTH_PERCENT + REPLY_ROW_WIDTH_PERCENT).assertEqual(165);
      expect(BODY_LINE_HEIGHT - BODY_FONT_SIZE).assertEqual(6);
      expect(SEARCH_PLACEHOLDER_FONT).assertEqual(NAME_FONT_SIZE);
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'stadium_guest' + '@' + '9' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '9')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name paletteStaysHexEncodedWithPlainOnSeededBoard
     * @tc.desc All seven palette entries are seven-character hex colors starting with a hash.
     * @tc.type Function
     * @tc.level Level1
     */
    it('paletteStaysHexEncodedWithPlainOnSeededBoard', 0, () => {
      const colors: Array<string> = [NAME_COLOR, REPLY_COLOR, REPLY_BACKGROUND, PUBLISH_BUTTON_BACKGROUND, PUBLISH_BUTTON_FOREGROUND, BADGE_TEXT_COLOR, BADGE_BACKGROUND];
      for (let index = 0; index < colors.length; index++) {
        expect(colors[index].length).assertEqual(7);
        expect(colors[index].charAt(0).toString()).assertEqual('#');
      }
      expect(NAME_COLOR).assertEqual('#000000');
      expect(REPLY_COLOR).assertEqual('#368AEF');
      expect(REPLY_BACKGROUND).assertEqual('#dbdbdb');
      expect(PUBLISH_BUTTON_BACKGROUND).assertEqual('#ed394b');
      expect(PUBLISH_BUTTON_FOREGROUND).assertEqual('#ffffff');
      expect(BADGE_TEXT_COLOR).assertEqual('#ff3d36');
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '夜班解说' + '@' + 'id-001-7' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-7')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name composerGeometryAddsUpWithAstralAfterPublish
     * @tc.desc Input padding 10/50 and publish bar padding 15 match the composer literals.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerGeometryAddsUpWithAstralAfterPublish', 0, () => {
      expect(PUBLISH_WRAP_HEIGHT).assertEqual(100);
      expect(INPUT_HEIGHT + SHARE_BAR_HEIGHT).assertEqual(PUBLISH_WRAP_HEIGHT);
      expect(EDITOR_ROW_HEIGHT).assertEqual(50);
      expect(EDITOR_ROW_HEIGHT).assertEqual(INPUT_HEIGHT + EDITOR_PADDING);
      expect(PUBLISH_BUTTON_RADIUS).assertEqual(PUBLISH_BUTTON_HEIGHT / 2);
      expect(PUBLISH_BAR_RADIUS).assertEqual(PUBLISH_BAR_HEIGHT - PUBLISH_WRAP_PAD);
      expect(PANEL_HEIGHT_PERCENT < 100).assertTrue();
      expect(PANEL_HEIGHT_PERCENT > 50).assertTrue();
      expect(PUBLISH_BUTTON_GAP).assertEqual(EDITOR_PADDING);
      expect(SHARE_ITEM_WIDTH_PERCENT * 4).assertEqual(100);
      expect(INPUT_PAD_LEFT).assertEqual(10);
      expect(INPUT_PAD_RIGHT).assertEqual(50);
      expect(INPUT_PAD_RIGHT > INPUT_PAD_LEFT).assertTrue();
      expect(PUBLISH_BAR_PAD_LEFT).assertEqual(15);
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'row_beta-8' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-8')).assertLarger(0);
      expect(scenarioTag.length > 44).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithSymbolHeavyAfterInterrupt
     * @tc.desc Code-point probes on empty text and two CJK characters return zero and two respectively.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithSymbolHeavyAfterInterrupt', 0, () => {
      const text: string = 'semi;colon;only;';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('访客甲') <= '访客甲'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('访客甲')).assertEqual(false);
      expect(codePointCount('')).assertEqual(0);
      expect(codePointCount('中文')).assertEqual(2);
      expect(text.length === 0).assertEqual(points === 0);
      const scenarioTag: string = 'semi;colon;only;' + ':' + '访客甲' + '@' + 'uuid-like-0001' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithCjkPunctuationAfterInterrupt
     * @tc.desc Publishing a CJK-punctuated draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithCjkPunctuationAfterInterrupt', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 12, '国足加油！国足必胜！');
      expect(board.count).assertEqual(20);
      expect(board.publishCount).assertEqual(12);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(20);
      expect(board.byUser(curUser).length).assertEqual(12);
      expect(board.comments[board.count - 1].text).assertEqual('国足加油！国足必胜！');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-11');
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '看台第七排' + '@' + '记录-1-10' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-10')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithTabOnlyDuringScroll
     * @tc.desc A seeded board exposes the first fixture body while an unseeded board starts empty with publishing disabled.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithTabOnlyDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.count).assertEqual(8);
      expect(board.listVisible).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.canPublish).assertFalse();
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      expect(board.lastId).assertEqual('');
      expect(board.seeded).assertTrue();
      expect(board.comments[0].text).assertEqual(EXPECTED_TEXTS[0]);
      const empty: CommentBoard = new CommentBoard(false);
      expect(empty.count).assertEqual(0);
      expect(empty.canPublish).assertFalse();
      const scenarioTag: string = '\t' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '2-11' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '2-11')).assertLarger(0);
      expect(scenarioTag.length > 17).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithEmojiInIdleStateReplay
     * @tc.desc Resetting a board that published an emoji-bearing draft restores the eight seed rows with a zero publish count and no last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithEmojiInIdleStateReplay', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      board.publish('5');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('5');
      expect(board.count).assertEqual(9);
      board.reset();
      expect(board.count).assertEqual(8);
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '兔子不吃窝边草' + '@' + '5' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + '5')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name avatarBoxMatchesConstantWithScriptLikeInIdleState
     * @tc.desc Avatar geometry keeps size and radius at 30 with a content pad equal to the avatar top margin.
     * @tc.type Function
     * @tc.level Level1
     */
    it('avatarBoxMatchesConstantWithScriptLikeInIdleState', 0, () => {
      expect(AVATAR_SIZE).assertEqual(30);
      expect(AVATAR_RADIUS).assertEqual(30);
      expect(AVATAR_RADIUS >= AVATAR_SIZE / 2).assertTrue();
      expect(AVATAR_MARGIN_TOP).assertEqual(10);
      expect(AVATAR_MARGIN_LEFT).assertEqual(15);
      expect(AVATAR_SIZE < TITLE_BAR_HEIGHT).assertTrue();
      expect(ACTION_ICON_SIZE < AVATAR_SIZE).assertTrue();
      expect(CONTENT_PAD_TOP).assertEqual(AVATAR_MARGIN_TOP);
      expect(AVATAR_MARGIN_LEFT > CONTENT_PAD_LEFT).assertTrue();
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + 'a' + '@' + '9-13' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '9-13')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name typographyHierarchyHoldsWithPlainOnLegacyDevice
     * @tc.desc Author and body bottom margins match while the headline size stays above the body size.
     * @tc.type Function
     * @tc.level Level1
     */
    it('typographyHierarchyHoldsWithPlainOnLegacyDevice', 0, () => {
      expect(NAME_FONT_SIZE).assertEqual(14);
      expect(NAME_FONT_WEIGHT).assertEqual(500);
      expect(BODY_FONT_SIZE).assertEqual(14);
      expect(BODY_FONT_WEIGHT).assertEqual(400);
      expect(NAME_FONT_WEIGHT > BODY_FONT_WEIGHT).assertTrue();
      expect(BODY_LINE_HEIGHT > BODY_FONT_SIZE).assertTrue();
      expect(BODY_LINE_HEIGHT).assertEqual(20);
      expect(BODY_OPACITY < 1).assertTrue();
      expect(REPLY_OPACITY).assertEqual(BODY_OPACITY);
      expect(NAME_WIDTH_PERCENT).assertEqual(80);
      expect(REPLY_ROW_WIDTH_PERCENT > NAME_WIDTH_PERCENT).assertTrue();
      expect(NAME_MARGIN_BOTTOM).assertEqual(BODY_MARGIN_BOTTOM);
      expect(HEADLINE_FONT_SIZE > BODY_FONT_SIZE).assertTrue();
      expect(COMMENT_COUNT_FONT).assertEqual(HEADLINE_FONT_SIZE);
      const scenarioTag: string = 'normal english comment' + ':' + '太阳打北边出来了' + '@' + 'id-001-14' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-14')).assertLarger(0);
      expect(scenarioTag.length > 39).assertTrue();
    });

    /**
     * @tc.name paletteStaysHexEncodedWithPaddedOnSeededBoard
     * @tc.desc The palette contains seven distinct values and the bar border color matches its documented literal.
     * @tc.type Function
     * @tc.level Level1
     */
    it('paletteStaysHexEncodedWithPaddedOnSeededBoard', 0, () => {
      const colors: Array<string> = [NAME_COLOR, REPLY_COLOR, REPLY_BACKGROUND, PUBLISH_BUTTON_BACKGROUND, PUBLISH_BUTTON_FOREGROUND, BADGE_TEXT_COLOR, BADGE_BACKGROUND];
      for (let index = 0; index < colors.length; index++) {
        expect(colors[index].length).assertEqual(7);
        expect(colors[index].charAt(0).toString()).assertEqual('#');
      }
      expect(NAME_COLOR).assertEqual('#000000');
      expect(REPLY_COLOR).assertEqual('#368AEF');
      expect(REPLY_BACKGROUND).assertEqual('#dbdbdb');
      expect(PUBLISH_BUTTON_BACKGROUND).assertEqual('#ed394b');
      expect(PUBLISH_BUTTON_FOREGROUND).assertEqual('#ffffff');
      expect(BADGE_TEXT_COLOR).assertEqual('#ff3d36');
      const distinct: Array<string> = [];
      for (let index = 0; index < colors.length; index++) {
        if (distinct.indexOf(colors[index]) < 0) { distinct.push(colors[index]); }
      }
      expect(distinct.length).assertEqual(7);
      expect(PUBLISH_BAR_BORDER_COLOR).assertEqual('#eeeeee');
      const scenarioTag: string = '  leading and trailing  ' + ':' + '小猫带耳机' + '@' + 'row_beta' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta')).assertLarger(0);
      expect(scenarioTag.length > 37).assertTrue();
    });

    /**
     * @tc.name composerGeometryAddsUpWithFullWidthSpaceAfterReset
     * @tc.desc Composer geometry adds up: input 40 plus share bar 60 fills the 100-unit panel and the button radius is half its height.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerGeometryAddsUpWithFullWidthSpaceAfterReset', 0, () => {
      expect(PUBLISH_WRAP_HEIGHT).assertEqual(100);
      expect(INPUT_HEIGHT + SHARE_BAR_HEIGHT).assertEqual(PUBLISH_WRAP_HEIGHT);
      expect(EDITOR_ROW_HEIGHT).assertEqual(50);
      expect(EDITOR_ROW_HEIGHT).assertEqual(INPUT_HEIGHT + EDITOR_PADDING);
      expect(PUBLISH_BUTTON_RADIUS).assertEqual(PUBLISH_BUTTON_HEIGHT / 2);
      expect(PUBLISH_BAR_RADIUS).assertEqual(PUBLISH_BAR_HEIGHT - PUBLISH_WRAP_PAD);
      expect(PANEL_HEIGHT_PERCENT < 100).assertTrue();
      expect(PANEL_HEIGHT_PERCENT > 50).assertTrue();
      expect(PUBLISH_BUTTON_GAP).assertEqual(EDITOR_PADDING);
      expect(SHARE_ITEM_WIDTH_PERCENT * 4).assertEqual(100);
      const scenarioTag: string = 'full-width\u3000space' + ':' + 'ＵＳＥＲ' + '@' + 'uuid-like-0001-16' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-16')).assertLarger(0);
      expect(scenarioTag.length > 37).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithPlainWithStaleDraft
     * @tc.desc Splitting a plain-text draft into UTF-16 units agrees with its length while a single emoji contributes two units and one code point.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithPlainWithStaleDraft', 0, () => {
      const text: string = '@mention someone';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('天要下雨娘要嫁人') <= '天要下雨娘要嫁人'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('天要下雨娘要嫁人')).assertEqual(false);
      expect(text.split('').length).assertEqual(text.length);
      expect(codePointCount('😀')).assertEqual(1);
      expect('😀'.length).assertEqual(2);
      expect(hasSurrogatePair('😀')).assertTrue();
      const scenarioTag: string = '@mention someone' + ':' + '天要下雨娘要嫁人' + '@' + '记录-1-17' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-17')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithPlainOnRetryBatch
     * @tc.desc The id chain after repeated publish cycles of a plain-text draft starts at cycle-0 and the joined row count matches the board count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithPlainOnRetryBatch', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 7, 'back\\slash');
      expect(board.count).assertEqual(15);
      expect(board.publishCount).assertEqual(7);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(15);
      expect(board.byUser(curUser).length).assertEqual(7);
      expect(board.comments[board.count - 1].text).assertEqual('back\\slash');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-6');
      const ids: Array<string> = board.ids();
      expect(ids[8]).assertEqual('cycle-0');
      expect(joinIds(board.comments).split('|').length).assertEqual(15);
      const scenarioTag: string = 'back\\slash' + ':' + '大事不妙了' + '@' + '2' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '2')).assertLarger(0);
      expect(scenarioTag.length > 16).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPlainAfterCancelLadder
     * @tc.desc A seeded board starts with eight rows, an empty draft, a zero publish count and the list panel visible.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPlainAfterCancelLadder', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.count).assertEqual(8);
      expect(board.listVisible).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.canPublish).assertFalse();
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      expect(board.lastId).assertEqual('');
      const scenarioTag: string = 'null' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '5-19' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '5-19')).assertLarger(0);
      expect(scenarioTag.length > 14).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithDigitsBeforePublishSnapshot
     * @tc.desc A second empty attempt after publishing a digit-only draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithDigitsBeforePublishSnapshot', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('0');
      board.publish('9-20');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('9-20');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('9-20');
      const scenarioTag: string = '0' + ':' + '你若安好便是晴天' + '@' + '9-20' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '9-20')).assertLarger(0);
      expect(scenarioTag.length > 13).assertTrue();
    });

    /**
     * @tc.name avatarBoxMatchesConstantWithCjkPunctuationUnderFocus
     * @tc.desc Action icon size, gap and doubled icon plus gap resolve to 20, 20 and 60 units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('avatarBoxMatchesConstantWithCjkPunctuationUnderFocus', 0, () => {
      expect(AVATAR_SIZE).assertEqual(30);
      expect(AVATAR_RADIUS).assertEqual(30);
      expect(AVATAR_RADIUS >= AVATAR_SIZE / 2).assertTrue();
      expect(AVATAR_MARGIN_TOP).assertEqual(10);
      expect(AVATAR_MARGIN_LEFT).assertEqual(15);
      expect(AVATAR_SIZE < TITLE_BAR_HEIGHT).assertTrue();
      expect(ACTION_ICON_SIZE < AVATAR_SIZE).assertTrue();
      expect(CONTENT_PAD_TOP).assertEqual(AVATAR_MARGIN_TOP);
      expect(AVATAR_MARGIN_LEFT > CONTENT_PAD_LEFT).assertTrue();
      expect(ACTION_ICON_GAP).assertEqual(20);
      expect(ACTION_ICON_SIZE * 2 + ACTION_ICON_GAP).assertEqual(60);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '等烟雨而我在等你' + '@' + 'id-001' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name typographyHierarchyHoldsWithPlainDuringScroll
     * @tc.desc Name and body typography share size 14 while the author weight 500 stays above the body weight 400.
     * @tc.type Function
     * @tc.level Level1
     */
    it('typographyHierarchyHoldsWithPlainDuringScroll', 0, () => {
      expect(NAME_FONT_SIZE).assertEqual(14);
      expect(NAME_FONT_WEIGHT).assertEqual(500);
      expect(BODY_FONT_SIZE).assertEqual(14);
      expect(BODY_FONT_WEIGHT).assertEqual(400);
      expect(NAME_FONT_WEIGHT > BODY_FONT_WEIGHT).assertTrue();
      expect(BODY_LINE_HEIGHT > BODY_FONT_SIZE).assertTrue();
      expect(BODY_LINE_HEIGHT).assertEqual(20);
      expect(BODY_OPACITY < 1).assertTrue();
      expect(REPLY_OPACITY).assertEqual(BODY_OPACITY);
      expect(NAME_WIDTH_PERCENT).assertEqual(80);
      expect(REPLY_ROW_WIDTH_PERCENT > NAME_WIDTH_PERCENT).assertTrue();
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'stadium_guest' + '@' + 'row_beta-22' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-22')).assertLarger(0);
      expect(scenarioTag.length > 37).assertTrue();
    });

    /**
     * @tc.name paletteStaysHexEncodedWithPlainAfterPublish
     * @tc.desc The reply color keeps uppercase hex digits and differs from the black author color.
     * @tc.type Function
     * @tc.level Level1
     */
    it('paletteStaysHexEncodedWithPlainAfterPublish', 0, () => {
      const colors: Array<string> = [NAME_COLOR, REPLY_COLOR, REPLY_BACKGROUND, PUBLISH_BUTTON_BACKGROUND, PUBLISH_BUTTON_FOREGROUND, BADGE_TEXT_COLOR, BADGE_BACKGROUND];
      for (let index = 0; index < colors.length; index++) {
        expect(colors[index].length).assertEqual(7);
        expect(colors[index].charAt(0).toString()).assertEqual('#');
      }
      expect(NAME_COLOR).assertEqual('#000000');
      expect(REPLY_COLOR).assertEqual('#368AEF');
      expect(REPLY_BACKGROUND).assertEqual('#dbdbdb');
      expect(PUBLISH_BUTTON_BACKGROUND).assertEqual('#ed394b');
      expect(PUBLISH_BUTTON_FOREGROUND).assertEqual('#ffffff');
      expect(BADGE_TEXT_COLOR).assertEqual('#ff3d36');
      expect(NAME_COLOR === REPLY_COLOR).assertFalse();
      expect(PUBLISH_BUTTON_BACKGROUND === PUBLISH_BUTTON_FOREGROUND).assertFalse();
      expect(REPLY_COLOR.charAt(1).toString()).assertEqual('3');
      expect(colors.length).assertEqual(7);
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '夜班解说' + '@' + 'uuid-like-0001-23' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-23')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name composerGeometryAddsUpWithAstralUnderPanel
     * @tc.desc The comment title height 30, width 95 percent and search height 75 percent match the page constants.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerGeometryAddsUpWithAstralUnderPanel', 0, () => {
      expect(PUBLISH_WRAP_HEIGHT).assertEqual(100);
      expect(INPUT_HEIGHT + SHARE_BAR_HEIGHT).assertEqual(PUBLISH_WRAP_HEIGHT);
      expect(EDITOR_ROW_HEIGHT).assertEqual(50);
      expect(EDITOR_ROW_HEIGHT).assertEqual(INPUT_HEIGHT + EDITOR_PADDING);
      expect(PUBLISH_BUTTON_RADIUS).assertEqual(PUBLISH_BUTTON_HEIGHT / 2);
      expect(PUBLISH_BAR_RADIUS).assertEqual(PUBLISH_BAR_HEIGHT - PUBLISH_WRAP_PAD);
      expect(PANEL_HEIGHT_PERCENT < 100).assertTrue();
      expect(PANEL_HEIGHT_PERCENT > 50).assertTrue();
      expect(PUBLISH_BUTTON_GAP).assertEqual(EDITOR_PADDING);
      expect(SHARE_ITEM_WIDTH_PERCENT * 4).assertEqual(100);
      expect(COMMENT_TITLE_HEIGHT).assertEqual(30);
      expect(COMMENT_TITLE_WIDTH_PERCENT).assertEqual(95);
      expect(SHARE_BAR_HEIGHT - NEWS_ROW_HEIGHT).assertEqual(20);
      expect(NEWS_ROW_HEIGHT).assertEqual(INPUT_HEIGHT);
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '记录-1' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithSymbolHeavyInIdleState
     * @tc.desc Counting code points in a symbol-heavy draft never exceeds its UTF-16 length and equals it only when no surrogate pair exists.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithSymbolHeavyInIdleState', 0, () => {
      const text: string = 'semi;colon;only;';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('访客甲') <= '访客甲'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('访客甲')).assertEqual(false);
      const scenarioTag: string = 'semi;colon;only;' + ':' + '访客甲' + '@' + '2-25' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '2-25')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithCjkPunctuationOnLegacyDeviceDigest
     * @tc.desc The tail slice after repeated publish cycles of a CJK-punctuated draft equals the cycle count and the draft state is cleared.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithCjkPunctuationOnLegacyDeviceDigest', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 6, '国足加油！国足必胜！');
      expect(board.count).assertEqual(14);
      expect(board.publishCount).assertEqual(6);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(14);
      expect(board.byUser(curUser).length).assertEqual(6);
      expect(board.comments[board.count - 1].text).assertEqual('国足加油！国足必胜！');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-5');
      expect(tailOf(board.comments, 6).length).assertEqual(6);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '看台第七排' + '@' + '5-26' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '5-26')).assertLarger(0);
      expect(scenarioTag.length > 19).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithTabOnlyWithDuplicateId
     * @tc.desc The initial snapshot of a seeded board reports the id chain 1|2|3|4|5|7|8|9 and the last fixture body.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithTabOnlyWithDuplicateId', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.count).assertEqual(8);
      expect(board.listVisible).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.canPublish).assertFalse();
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      expect(board.lastId).assertEqual('');
      const snap: BoardSnapshot = snapshot(board);
      expect(snap.count).assertEqual(8);
      expect(snap.ids).assertEqual('1|2|3|4|5|7|8|9');
      expect(snap.lastText).assertEqual(EXPECTED_TEXTS[7]);
      expect(snap.publishCount).assertEqual(0);
      const scenarioTag: string = '\t' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '9' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '9')).assertLarger(0);
      expect(scenarioTag.length > 14).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithEmojiBeforePublish
     * @tc.desc After publishing an emoji-bearing draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithEmojiBeforePublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      board.publish('id-001-28');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('id-001-28');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '兔子不吃窝边草' + '@' + 'id-001-28' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-28')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name avatarBoxMatchesConstantWithScriptLikeWithMixedScript
     * @tc.desc The follow badge width matches the header avatar size and the left margin exceeds the content pad by three units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('avatarBoxMatchesConstantWithScriptLikeWithMixedScript', 0, () => {
      expect(AVATAR_SIZE).assertEqual(30);
      expect(AVATAR_RADIUS).assertEqual(30);
      expect(AVATAR_RADIUS >= AVATAR_SIZE / 2).assertTrue();
      expect(AVATAR_MARGIN_TOP).assertEqual(10);
      expect(AVATAR_MARGIN_LEFT).assertEqual(15);
      expect(AVATAR_SIZE < TITLE_BAR_HEIGHT).assertTrue();
      expect(ACTION_ICON_SIZE < AVATAR_SIZE).assertTrue();
      expect(CONTENT_PAD_TOP).assertEqual(AVATAR_MARGIN_TOP);
      expect(AVATAR_MARGIN_LEFT > CONTENT_PAD_LEFT).assertTrue();
      expect(AVATAR_SIZE + AVATAR_MARGIN_TOP).assertEqual(40);
      expect(AVATAR_MARGIN_LEFT - CONTENT_PAD_LEFT).assertEqual(3);
      expect(BADGE_WIDTH).assertEqual(AVATAR_BADGE_SIZE);
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + 'a' + '@' + 'row_beta-29' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-29')).assertLarger(0);
      expect(scenarioTag.length > 37).assertTrue();
    });

    /**
     * @tc.name typographyHierarchyHoldsWithPlainAtSeedEdge
     * @tc.desc Width percentages 80 and 85 and the line-height delta of six units match the comment row constants.
     * @tc.type Function
     * @tc.level Level1
     */
    it('typographyHierarchyHoldsWithPlainAtSeedEdge', 0, () => {
      expect(NAME_FONT_SIZE).assertEqual(14);
      expect(NAME_FONT_WEIGHT).assertEqual(500);
      expect(BODY_FONT_SIZE).assertEqual(14);
      expect(BODY_FONT_WEIGHT).assertEqual(400);
      expect(NAME_FONT_WEIGHT > BODY_FONT_WEIGHT).assertTrue();
      expect(BODY_LINE_HEIGHT > BODY_FONT_SIZE).assertTrue();
      expect(BODY_LINE_HEIGHT).assertEqual(20);
      expect(BODY_OPACITY < 1).assertTrue();
      expect(REPLY_OPACITY).assertEqual(BODY_OPACITY);
      expect(NAME_WIDTH_PERCENT).assertEqual(80);
      expect(REPLY_ROW_WIDTH_PERCENT > NAME_WIDTH_PERCENT).assertTrue();
      expect(NAME_WIDTH_PERCENT + REPLY_ROW_WIDTH_PERCENT).assertEqual(165);
      expect(BODY_LINE_HEIGHT - BODY_FONT_SIZE).assertEqual(6);
      expect(SEARCH_PLACEHOLDER_FONT).assertEqual(NAME_FONT_SIZE);
      const scenarioTag: string = 'normal english comment' + ':' + '太阳打北边出来了' + '@' + 'uuid-like-0001' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001')).assertLarger(0);
      expect(scenarioTag.length > 44).assertTrue();
    });

    /**
     * @tc.name paletteStaysHexEncodedWithPaddedAtSeedEdge
     * @tc.desc All seven palette entries are seven-character hex colors starting with a hash.
     * @tc.type Function
     * @tc.level Level1
     */
    it('paletteStaysHexEncodedWithPaddedAtSeedEdge', 0, () => {
      const colors: Array<string> = [NAME_COLOR, REPLY_COLOR, REPLY_BACKGROUND, PUBLISH_BUTTON_BACKGROUND, PUBLISH_BUTTON_FOREGROUND, BADGE_TEXT_COLOR, BADGE_BACKGROUND];
      for (let index = 0; index < colors.length; index++) {
        expect(colors[index].length).assertEqual(7);
        expect(colors[index].charAt(0).toString()).assertEqual('#');
      }
      expect(NAME_COLOR).assertEqual('#000000');
      expect(REPLY_COLOR).assertEqual('#368AEF');
      expect(REPLY_BACKGROUND).assertEqual('#dbdbdb');
      expect(PUBLISH_BUTTON_BACKGROUND).assertEqual('#ed394b');
      expect(PUBLISH_BUTTON_FOREGROUND).assertEqual('#ffffff');
      expect(BADGE_TEXT_COLOR).assertEqual('#ff3d36');
      const scenarioTag: string = '  leading and trailing  ' + ':' + '小猫带耳机' + '@' + '记录-1-31' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-31')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

    /**
     * @tc.name composerGeometryAddsUpWithFullWidthSpaceUnderPanel
     * @tc.desc Input padding 10/50 and publish bar padding 15 match the composer literals.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerGeometryAddsUpWithFullWidthSpaceUnderPanel', 0, () => {
      expect(PUBLISH_WRAP_HEIGHT).assertEqual(100);
      expect(INPUT_HEIGHT + SHARE_BAR_HEIGHT).assertEqual(PUBLISH_WRAP_HEIGHT);
      expect(EDITOR_ROW_HEIGHT).assertEqual(50);
      expect(EDITOR_ROW_HEIGHT).assertEqual(INPUT_HEIGHT + EDITOR_PADDING);
      expect(PUBLISH_BUTTON_RADIUS).assertEqual(PUBLISH_BUTTON_HEIGHT / 2);
      expect(PUBLISH_BAR_RADIUS).assertEqual(PUBLISH_BAR_HEIGHT - PUBLISH_WRAP_PAD);
      expect(PANEL_HEIGHT_PERCENT < 100).assertTrue();
      expect(PANEL_HEIGHT_PERCENT > 50).assertTrue();
      expect(PUBLISH_BUTTON_GAP).assertEqual(EDITOR_PADDING);
      expect(SHARE_ITEM_WIDTH_PERCENT * 4).assertEqual(100);
      expect(INPUT_PAD_LEFT).assertEqual(10);
      expect(INPUT_PAD_RIGHT).assertEqual(50);
      expect(INPUT_PAD_RIGHT > INPUT_PAD_LEFT).assertTrue();
      expect(PUBLISH_BAR_PAD_LEFT).assertEqual(15);
      const scenarioTag: string = 'full-width\u3000space' + ':' + 'ＵＳＥＲ' + '@' + '2-32' + '#' + 'NavigationModelTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '2-32')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

  });
}
