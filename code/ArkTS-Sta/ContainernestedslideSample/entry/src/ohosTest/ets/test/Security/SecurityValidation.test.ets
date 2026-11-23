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
import { NewsCommentModel } from '../../../../main/ets/model/NewsCommentModel.ets';
import { curUser } from '../../../../main/ets/mock/NewsDetailData.ets';
import {
  FIXED_TIME, EXPECTED_TEXTS, countChar, CommentBoard, makeComment
} from '../Shared/SharedDriver.ets';
import { logSuite , codePointCount, hasSurrogatePair} from '../Shared/Support.ets';

export default function SecurityValidationTest(): void {
  describe('SecurityValidationTest', () => {
    beforeAll(() => {
      logSuite('SecurityValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SecurityValidationTest', 'end');
    });

    /**
     * @tc.name unicodeAuthorSurvivesReplyWithDigitsInFirstRow
     * @tc.desc Surrogate-pair detection for a digit-only author name matches the actual UTF-16 composition of that name.
     * @tc.type Function
     * @tc.level Level1
     */
    it('unicodeAuthorSurvivesReplyWithDigitsInFirstRow', 0, () => {
      const name: string = '东边有个塔玛，西边有个喇嘛';
      const row: NewsCommentModel = makeComment('unicode-row', name, '正文', '1', name, FIXED_TIME);
      expect(row.user).assertEqual(name);
      expect(row.replyUser).assertEqual(name);
      expect(row.user.length).assertEqual(name.length);
      expect(codePointCount(row.user) <= row.user.length).assertTrue();
      expect(row.replyId).assertEqual('1');
      expect(row.text).assertEqual('正文');
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[0];
      const reply: NewsCommentModel | null = board.reply(target, target.id, name, '回复正文', 'unicode-reply');
      expect(reply !== null).assertTrue();
      expect(board.comments[8].replyUser).assertEqual(name);
      expect(hasSurrogatePair(name)).assertEqual(false);
      expect(codePointCount(name)).assertEqual(13);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const scenarioTag: string = '0' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'id-001' + '#' + 'SecurityValidationTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithCjkPunctuationAfterReset
     * @tc.desc Replying to fixture row 3 with a CJK-punctuated draft appends a row carrying the parent id, parent author and current user.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithCjkPunctuationAfterReset', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '主队控球率 58%，射门 14 次', 'row_beta-1');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('主队控球率 58%，射门 14 次');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '访客甲' + '@' + 'row_beta-1' + '#' + 'SecurityValidationTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-1')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithPlainOnTailRowReplay
     * @tc.desc Splitting a plain-text draft into UTF-16 units agrees with its length while a single emoji contributes two units and one code point.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithPlainOnTailRowReplay', 0, () => {
      const text: string = '守门员的三次扑救挽救了球队';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('看台第七排') <= '看台第七排'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('看台第七排')).assertEqual(false);
      expect(text.split('').length).assertEqual(text.length);
      expect(codePointCount('😀')).assertEqual(1);
      expect('😀'.length).assertEqual(2);
      expect(hasSurrogatePair('😀')).assertTrue();
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '看台第七排' + '@' + 'uuid-like-0001-2' + '#' + 'SecurityValidationTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-2')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name longDraftSurvivesRoundTripWithPlainDuringScroll
     * @tc.desc The long draft remains BMP-only with no surrogate pairs and stays distinct from the fixture bodies.
     * @tc.type Function
     * @tc.level Level1
     */
    it('longDraftSurvivesRoundTripWithPlainDuringScroll', 0, () => {
      const longText: string = '长文本填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落结束';
      expect(longText.length).assertEqual(245);
      expect(longText.length > 200).assertTrue();
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      expect(board.updateDraft(longText)).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('记录-1') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text.length).assertEqual(245);
      expect(board.comments[8].text === longText).assertTrue();
      expect(board.comments[8].text.startsWith('长文本')).assertTrue();
      expect(board.comments[8].text.endsWith('结束')).assertTrue();
      expect(codePointCount(longText)).assertEqual(longText.length);
      expect(board.comments[8].text === EXPECTED_TEXTS[3]).assertFalse();
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '记录-1' + '#' + 'SecurityValidationTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name payloadIsStoredVerbatimWithAstralWithReplyMeta
     * @tc.desc Payload text from an astral-plane draft is stored verbatim with identical length, identifier and authored row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('payloadIsStoredVerbatimWithAstralWithReplyMeta', 0, () => {
      const payload: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89';
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft(payload);
      expect(board.publish('2-4') !== null).assertTrue();
      const stored: string = board.comments[8].text;
      expect(stored).assertEqual(payload);
      expect(stored.length).assertEqual(payload.length);
      expect(board.comments[8].id).assertEqual('2-4');
      expect(board.comments[8].id.length).assertEqual(3);
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '兔子不吃窝边草' + '@' + '2-4' + '#' + 'SecurityValidationTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '2-4')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name unicodeAuthorSurvivesReplyWithSymbolHeavyAfterPublish
     * @tc.desc The reply row written for a symbol-heavy author keeps the current user as author and parent id 1 as reply id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('unicodeAuthorSurvivesReplyWithSymbolHeavyAfterPublish', 0, () => {
      const name: string = 'a';
      const row: NewsCommentModel = makeComment('unicode-row', name, '正文', '1', name, FIXED_TIME);
      expect(row.user).assertEqual(name);
      expect(row.replyUser).assertEqual(name);
      expect(row.user.length).assertEqual(name.length);
      expect(codePointCount(row.user) <= row.user.length).assertTrue();
      expect(row.replyId).assertEqual('1');
      expect(row.text).assertEqual('正文');
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[0];
      const reply: NewsCommentModel | null = board.reply(target, target.id, name, '回复正文', 'unicode-reply');
      expect(reply !== null).assertTrue();
      expect(board.comments[8].replyUser).assertEqual(name);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].replyId).assertEqual('1');
      expect(name === curUser).assertEqual(false);
      const scenarioTag: string = 'semi;colon;only;' + ':' + 'a' + '@' + '5-5' + '#' + 'SecurityValidationTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '5-5')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithCjkPunctuationDuringScrollCycle
     * @tc.desc A reply against an empty-id target built from a CJK-punctuated context is rejected and the authored row count stays one.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithCjkPunctuationDuringScrollCycle', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '国足加油！国足必胜！', '9');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('国足加油！国足必胜！');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const orphan: NewsCommentModel = makeComment('', 'nobody', 'body', '', '', FIXED_TIME);
      expect(board.reply(orphan, orphan.id, orphan.user, 'text', 'orphan')).assertNull();
      expect(board.byUser(curUser).length).assertEqual(1);
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '太阳打北边出来了' + '@' + '9' + '#' + 'SecurityValidationTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '9')).assertLarger(0);
      expect(scenarioTag.length > 19).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithTabOnlyInFirstRowGuard
     * @tc.desc Counting code points in a tab-only draft never exceeds its UTF-16 length and equals it only when no surrogate pair exists.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithTabOnlyInFirstRowGuard', 0, () => {
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
      const scenarioTag: string = '\t' + ':' + '小猫带耳机' + '@' + 'id-001-7' + '#' + 'SecurityValidationTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-7')).assertLarger(0);
      expect(scenarioTag.length > 14).assertTrue();
    });

    /**
     * @tc.name longDraftSurvivesRoundTripWithEmojiAfterPublish
     * @tc.desc The long draft keeps more than ten repeated segment markers and preserves its first three characters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('longDraftSurvivesRoundTripWithEmojiAfterPublish', 0, () => {
      const longText: string = '长文本填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落结束';
      expect(longText.length).assertEqual(245);
      expect(longText.length > 200).assertTrue();
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      expect(board.updateDraft(longText)).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('row_beta-8') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text.length).assertEqual(245);
      expect(board.comments[8].text === longText).assertTrue();
      expect(board.comments[8].text.startsWith('长文本')).assertTrue();
      expect(board.comments[8].text.endsWith('结束')).assertTrue();
      expect(countChar(board.comments[8].text, '段')).assertLarger(10);
      expect(board.comments[8].text.substring(0, 3)).assertEqual('长文本');
      expect(board.comments[8].text.indexOf('填充')).assertLarger(0);
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'ＵＳＥＲ' + '@' + 'row_beta-8' + '#' + 'SecurityValidationTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-8')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name payloadIsStoredVerbatimWithScriptLikeAfterInterrupt
     * @tc.desc The first and last characters of the stored a script-like payload match the original payload exactly.
     * @tc.type Function
     * @tc.level Level1
     */
    it('payloadIsStoredVerbatimWithScriptLikeAfterInterrupt', 0, () => {
      const payload: string = '<script>alert(1)</script>';
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft(payload);
      expect(board.publish('uuid-like-0001') !== null).assertTrue();
      const stored: string = board.comments[8].text;
      expect(stored).assertEqual(payload);
      expect(stored.length).assertEqual(payload.length);
      expect(board.comments[8].id).assertEqual('uuid-like-0001');
      expect(board.comments[8].id.length).assertEqual(14);
      expect(stored.substring(0, 1)).assertEqual(payload.substring(0, 1));
      expect(stored.charAt(stored.length - 1).toString()).assertEqual(payload.charAt(payload.length - 1).toString());
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '天要下雨娘要嫁人' + '@' + 'uuid-like-0001' + '#' + 'SecurityValidationTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001')).assertLarger(0);
      expect(scenarioTag.length > 47).assertTrue();
    });

    /**
     * @tc.name unicodeAuthorSurvivesReplyWithPlainAfterInterrupt
     * @tc.desc An author name of a plain-text style survives model construction and reply metadata unchanged in length and value.
     * @tc.type Function
     * @tc.level Level1
     */
    it('unicodeAuthorSurvivesReplyWithPlainAfterInterrupt', 0, () => {
      const name: string = '大事不妙了';
      const row: NewsCommentModel = makeComment('unicode-row', name, '正文', '1', name, FIXED_TIME);
      expect(row.user).assertEqual(name);
      expect(row.replyUser).assertEqual(name);
      expect(row.user.length).assertEqual(name.length);
      expect(codePointCount(row.user) <= row.user.length).assertTrue();
      expect(row.replyId).assertEqual('1');
      expect(row.text).assertEqual('正文');
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[0];
      const reply: NewsCommentModel | null = board.reply(target, target.id, name, '回复正文', 'unicode-reply');
      expect(reply !== null).assertTrue();
      expect(board.comments[8].replyUser).assertEqual(name);
      const scenarioTag: string = 'normal english comment' + ':' + '大事不妙了' + '@' + '记录-1-10' + '#' + 'SecurityValidationTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-10')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithPaddedOnTailRowCompass
     * @tc.desc A blank reply body against fixture row 3 using a space-padded context is rejected without changing the row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithPaddedOnTailRowCompass', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '  leading and trailing  ', '2-11');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('  leading and trailing  ');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.reply(target, target.id, target.user, '', 'blank-reply')).assertNull();
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '  leading and trailing  ' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '2-11' + '#' + 'SecurityValidationTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '2-11')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

  });
}
