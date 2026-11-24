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
  NAME_FONT_WEIGHT, NAME_COLOR, NAME_WIDTH_PERCENT, BODY_FONT_SIZE, BODY_FONT_WEIGHT, BODY_OPACITY,
  BODY_LINE_HEIGHT, REPLY_ROW_WIDTH_PERCENT, REPLY_COLOR, REPLY_BACKGROUND, REPLY_OPACITY, CONTENT_PAD_LEFT,
  CONTENT_PAD_TOP, ACTION_ICON_SIZE, TITLE_BAR_HEIGHT, AVATAR_BADGE_SIZE, BADGE_WIDTH, BADGE_TEXT_COLOR,
  BADGE_BACKGROUND, SEARCH_PLACEHOLDER_FONT, PUBLISH_BAR_HEIGHT, PUBLISH_BAR_RADIUS, PUBLISH_BAR_PAD_LEFT, PUBLISH_WRAP_HEIGHT,
  PANEL_HEIGHT_PERCENT, EDITOR_ROW_HEIGHT, EDITOR_PADDING, INPUT_HEIGHT, INPUT_PAD_LEFT, INPUT_PAD_RIGHT,
  PUBLISH_BUTTON_HEIGHT, PUBLISH_BUTTON_RADIUS, PUBLISH_BUTTON_BACKGROUND, PUBLISH_BUTTON_FOREGROUND, PUBLISH_BUTTON_GAP, SHARE_BAR_HEIGHT,
  SHARE_ITEM_WIDTH_PERCENT, joinIds, distinctIdCount, tailOf, CommentBoard, BoardSnapshot,
  snapshot, runPublishCycles
  , PUBLISH_WRAP_PAD
} from '../Shared/SharedDriver.ets';
import { logSuite , codePointCount, hasSurrogatePair} from '../Shared/Support.ets';

export default function ContentScalingModelTest(): void {
  describe('ContentScalingModelTest', () => {
    beforeAll(() => {
      logSuite('ContentScalingModelTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ContentScalingModelTest', 'end');
    });

    /**
     * @tc.name publishCyclesStayCheapWithDigitsDuringTyping
     * @tc.desc The tail slice after repeated publish cycles of a digit-only draft equals the cycle count and the draft state is cleared.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithDigitsDuringTyping', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 14, '0');
      expect(board.count).assertEqual(22);
      expect(board.publishCount).assertEqual(14);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(22);
      expect(board.byUser(curUser).length).assertEqual(14);
      expect(board.comments[board.count - 1].text).assertEqual('0');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-13');
      expect(tailOf(board.comments, 14).length).assertEqual(14);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = '0' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'row_beta' + '#' + 'ContentScalingModelTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithCjkPunctuationOnLegacyDevice
     * @tc.desc The initial snapshot of a seeded board reports the id chain 1|2|3|4|5|7|8|9 and the last fixture body.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithCjkPunctuationOnLegacyDevice', 0, () => {
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
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '访客甲' + '@' + 'uuid-like-0001-1' + '#' + 'ContentScalingModelTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-1')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainOnRetry
     * @tc.desc After publishing a plain-text draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainOnRetry', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('守门员的三次扑救挽救了球队');
      board.publish('记录-1-2');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('记录-1-2');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '看台第七排' + '@' + '记录-1-2' + '#' + 'ContentScalingModelTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-2')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name avatarBoxMatchesConstantWithPlainWithDuplicateId
     * @tc.desc The follow badge width matches the header avatar size and the left margin exceeds the content pad by three units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('avatarBoxMatchesConstantWithPlainWithDuplicateId', 0, () => {
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
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '2' + '#' + 'ContentScalingModelTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '2')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name typographyHierarchyHoldsWithAstralWithReplyMeta
     * @tc.desc Width percentages 80 and 85 and the line-height delta of six units match the comment row constants.
     * @tc.type Function
     * @tc.level Level1
     */
    it('typographyHierarchyHoldsWithAstralWithReplyMeta', 0, () => {
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
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '兔子不吃窝边草' + '@' + '5-4' + '#' + 'ContentScalingModelTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '5-4')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name paletteStaysHexEncodedWithSymbolHeavyAfterPublish
     * @tc.desc All seven palette entries are seven-character hex colors starting with a hash.
     * @tc.type Function
     * @tc.level Level1
     */
    it('paletteStaysHexEncodedWithSymbolHeavyAfterPublish', 0, () => {
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
      const scenarioTag: string = 'semi;colon;only;' + ':' + 'a' + '@' + '9-5' + '#' + 'ContentScalingModelTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '9-5')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name composerGeometryAddsUpWithCjkPunctuationOnRetry
     * @tc.desc Input padding 10/50 and publish bar padding 15 match the composer literals.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerGeometryAddsUpWithCjkPunctuationOnRetry', 0, () => {
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
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '太阳打北边出来了' + '@' + 'id-001' + '#' + 'ContentScalingModelTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithTabOnlyWithReplyMeta
     * @tc.desc Code-point probes on empty text and two CJK characters return zero and two respectively.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithTabOnlyWithReplyMeta', 0, () => {
      const text: string = '\t';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('小猫带耳机') <= '小猫带耳机'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('小猫带耳机')).assertEqual(false);
      expect(codePointCount('')).assertEqual(0);
      expect(codePointCount('中文')).assertEqual(2);
      expect(text.length === 0).assertEqual(points === 0);
      const scenarioTag: string = '\t' + ':' + '小猫带耳机' + '@' + 'row_beta-7' + '#' + 'ContentScalingModelTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-7')).assertLarger(0);
      expect(scenarioTag.length > 16).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithEmojiOnColdStart
     * @tc.desc Publishing an emoji-bearing draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithEmojiOnColdStart', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 13, '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(board.count).assertEqual(21);
      expect(board.publishCount).assertEqual(13);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(21);
      expect(board.byUser(curUser).length).assertEqual(13);
      expect(board.comments[board.count - 1].text).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-12');
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'ＵＳＥＲ' + '@' + 'uuid-like-0001-8' + '#' + 'ContentScalingModelTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-8')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithScriptLikeInIdleState
     * @tc.desc A seeded board exposes the first fixture body while an unseeded board starts empty with publishing disabled.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithScriptLikeInIdleState', 0, () => {
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
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '天要下雨娘要嫁人' + '@' + '记录-1' + '#' + 'ContentScalingModelTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 37).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainAcrossCyclesMarker
     * @tc.desc Resetting a board that published a plain-text draft restores the eight seed rows with a zero publish count and no last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainAcrossCyclesMarker', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('normal english comment');
      board.publish('2-10');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('2-10');
      expect(board.count).assertEqual(9);
      board.reset();
      expect(board.count).assertEqual(8);
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      const scenarioTag: string = 'normal english comment' + ':' + '大事不妙了' + '@' + '2-10' + '#' + 'ContentScalingModelTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '2-10')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

  });
}
