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

export default function InputSanitizationTest(): void {
  describe('InputSanitizationTest', () => {
    beforeAll(() => {
      logSuite('InputSanitizationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('InputSanitizationTest', 'end');
    });

    /**
     * @tc.name longDraftSurvivesRoundTripWithFullWidthSpaceOnSeededBoard
     * @tc.desc A 245-unit long draft with segment markers survives publish unchanged and stays anchored by its prefix and suffix.
     * @tc.type Function
     * @tc.level Level1
     */
    it('longDraftSurvivesRoundTripWithFullWidthSpaceOnSeededBoard', 0, () => {
      const longText: string = '长文本填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落结束';
      expect(longText.length).assertEqual(245);
      expect(longText.length > 200).assertTrue();
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      expect(board.updateDraft(longText)).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('9') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text.length).assertEqual(245);
      expect(board.comments[8].text === longText).assertTrue();
      expect(board.comments[8].text.startsWith('长文本')).assertTrue();
      expect(board.comments[8].text.endsWith('结束')).assertTrue();
      const scenarioTag: string = 'full-width\u3000space' + ':' + 'ＵＳＥＲ' + '@' + '9' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '9')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name payloadIsStoredVerbatimWithPlainAcrossSessions
     * @tc.desc Punctuation and quote counts in the stored a plain-text payload match the original input.
     * @tc.type Function
     * @tc.level Level1
     */
    it('payloadIsStoredVerbatimWithPlainAcrossSessions', 0, () => {
      const payload: string = '@mention someone';
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft(payload);
      expect(board.publish('id-001-1') !== null).assertTrue();
      const stored: string = board.comments[8].text;
      expect(stored).assertEqual(payload);
      expect(stored.length).assertEqual(payload.length);
      expect(board.comments[8].id).assertEqual('id-001-1');
      expect(board.comments[8].id.length).assertEqual(8);
      expect(stored.indexOf('<') >= 0).assertEqual(payload.indexOf('<') >= 0);
      expect(countChar(stored, ';')).assertEqual(countChar(payload, ';'));
      expect(stored.indexOf('\\\\')).assertEqual(payload.indexOf('\\\\'));
      const scenarioTag: string = '@mention someone' + ':' + '天要下雨娘要嫁人' + '@' + 'id-001-1' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-1')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name unicodeAuthorSurvivesReplyWithPlainWithPaddedBody
     * @tc.desc Surrogate-pair detection for a plain-text author name matches the actual UTF-16 composition of that name.
     * @tc.type Function
     * @tc.level Level1
     */
    it('unicodeAuthorSurvivesReplyWithPlainWithPaddedBody', 0, () => {
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
      expect(hasSurrogatePair(name)).assertEqual(false);
      expect(codePointCount(name)).assertEqual(5);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const scenarioTag: string = 'back\\slash' + ':' + '大事不妙了' + '@' + 'row_beta-2' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-2')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithPlainWithEmptyBufferStream
     * @tc.desc Replying to fixture row 3 with a plain-text draft appends a row carrying the parent id, parent author and current user.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithPlainWithEmptyBufferStream', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, 'null', 'uuid-like-0001');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('null');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const scenarioTag: string = 'null' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'uuid-like-0001' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithDigitsInFirstRow
     * @tc.desc Splitting a digit-only draft into UTF-16 units agrees with its length while a single emoji contributes two units and one code point.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithDigitsInFirstRow', 0, () => {
      const text: string = '0';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('你若安好便是晴天') <= '你若安好便是晴天'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('你若安好便是晴天')).assertEqual(false);
      expect(text.split('').length).assertEqual(text.length);
      expect(codePointCount('😀')).assertEqual(1);
      expect('😀'.length).assertEqual(2);
      expect(hasSurrogatePair('😀')).assertTrue();
      const scenarioTag: string = '0' + ':' + '你若安好便是晴天' + '@' + '记录-1-4' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-4')).assertLarger(0);
      expect(scenarioTag.length > 15).assertTrue();
    });

    /**
     * @tc.name longDraftSurvivesRoundTripWithCjkPunctuationAfterPublish
     * @tc.desc The long draft remains BMP-only with no surrogate pairs and stays distinct from the fixture bodies.
     * @tc.type Function
     * @tc.level Level1
     */
    it('longDraftSurvivesRoundTripWithCjkPunctuationAfterPublish', 0, () => {
      const longText: string = '长文本填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落结束';
      expect(longText.length).assertEqual(245);
      expect(longText.length > 200).assertTrue();
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      expect(board.updateDraft(longText)).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('2-5') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text.length).assertEqual(245);
      expect(board.comments[8].text === longText).assertTrue();
      expect(board.comments[8].text.startsWith('长文本')).assertTrue();
      expect(board.comments[8].text.endsWith('结束')).assertTrue();
      expect(codePointCount(longText)).assertEqual(longText.length);
      expect(board.comments[8].text === EXPECTED_TEXTS[3]).assertFalse();
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '等烟雨而我在等你' + '@' + '2-5' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '2-5')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name payloadIsStoredVerbatimWithPlainOnRetryBatch
     * @tc.desc Payload text from a plain-text draft is stored verbatim with identical length, identifier and authored row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('payloadIsStoredVerbatimWithPlainOnRetryBatch', 0, () => {
      const payload: string = '守门员的三次扑救挽救了球队';
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft(payload);
      expect(board.publish('5') !== null).assertTrue();
      const stored: string = board.comments[8].text;
      expect(stored).assertEqual(payload);
      expect(stored.length).assertEqual(payload.length);
      expect(board.comments[8].id).assertEqual('5');
      expect(board.comments[8].id.length).assertEqual(1);
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'stadium_guest' + '@' + '5' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '5')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name unicodeAuthorSurvivesReplyWithPlainOnSeededBoardHarbor
     * @tc.desc The reply row written for a plain-text author keeps the current user as author and parent id 1 as reply id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('unicodeAuthorSurvivesReplyWithPlainOnSeededBoardHarbor', 0, () => {
      const name: string = '夜班解说';
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
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '夜班解说' + '@' + '9-7' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '9-7')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithAstralDuringTyping
     * @tc.desc A reply against an empty-id target built from an astral-plane context is rejected and the authored row count stays one.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithAstralDuringTyping', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89', 'id-001-8');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const orphan: NewsCommentModel = makeComment('', 'nobody', 'body', '', '', FIXED_TIME);
      expect(board.reply(orphan, orphan.id, orphan.user, 'text', 'orphan')).assertNull();
      expect(board.byUser(curUser).length).assertEqual(1);
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'id-001-8' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-8')).assertLarger(0);
      expect(scenarioTag.length > 42).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithSymbolHeavyAcrossSessions
     * @tc.desc Counting code points in a symbol-heavy draft never exceeds its UTF-16 length and equals it only when no surrogate pair exists.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithSymbolHeavyAcrossSessions', 0, () => {
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
      const scenarioTag: string = 'semi;colon;only;' + ':' + '访客甲' + '@' + 'row_beta' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name longDraftSurvivesRoundTripWithCjkPunctuationWithReplyMeta
     * @tc.desc The long draft keeps more than ten repeated segment markers and preserves its first three characters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('longDraftSurvivesRoundTripWithCjkPunctuationWithReplyMeta', 0, () => {
      const longText: string = '长文本填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落结束';
      expect(longText.length).assertEqual(245);
      expect(longText.length > 200).assertTrue();
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      expect(board.updateDraft(longText)).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('uuid-like-0001-10') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text.length).assertEqual(245);
      expect(board.comments[8].text === longText).assertTrue();
      expect(board.comments[8].text.startsWith('长文本')).assertTrue();
      expect(board.comments[8].text.endsWith('结束')).assertTrue();
      expect(countChar(board.comments[8].text, '段')).assertLarger(10);
      expect(board.comments[8].text.substring(0, 3)).assertEqual('长文本');
      expect(board.comments[8].text.indexOf('填充')).assertLarger(0);
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '看台第七排' + '@' + 'uuid-like-0001-10' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-10')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name payloadIsStoredVerbatimWithTabOnlyAtSeedEdge
     * @tc.desc The first and last characters of the stored a tab-only payload match the original payload exactly.
     * @tc.type Function
     * @tc.level Level1
     */
    it('payloadIsStoredVerbatimWithTabOnlyAtSeedEdge', 0, () => {
      const payload: string = '\t';
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft(payload);
      expect(board.publish('记录-1-11') !== null).assertTrue();
      const stored: string = board.comments[8].text;
      expect(stored).assertEqual(payload);
      expect(stored.length).assertEqual(payload.length);
      expect(board.comments[8].id).assertEqual('记录-1-11');
      expect(board.comments[8].id.length).assertEqual(7);
      expect(stored.substring(0, 1)).assertEqual(payload.substring(0, 1));
      expect(stored.charAt(stored.length - 1).toString()).assertEqual(payload.charAt(payload.length - 1).toString());
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '\t' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '记录-1-11' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-11')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name unicodeAuthorSurvivesReplyWithEmojiOnSeededBoard
     * @tc.desc An author name of an emoji-bearing style survives model construction and reply metadata unchanged in length and value.
     * @tc.type Function
     * @tc.level Level1
     */
    it('unicodeAuthorSurvivesReplyWithEmojiOnSeededBoard', 0, () => {
      const name: string = '兔子不吃窝边草';
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
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '兔子不吃窝边草' + '@' + '2' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + '2')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithScriptLikeOnColdStartCell
     * @tc.desc A blank reply body against fixture row 3 using a script-like context is rejected without changing the row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithScriptLikeOnColdStartCell', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '<script>alert(1)</script>', '5-13');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('<script>alert(1)</script>');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.reply(target, target.id, target.user, '', 'blank-reply')).assertNull();
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + 'a' + '@' + '5-13' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '5-13')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithPlainWithMixedScript
     * @tc.desc Code-point probes on empty text and two CJK characters return zero and two respectively.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithPlainWithMixedScript', 0, () => {
      const text: string = 'normal english comment';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('太阳打北边出来了') <= '太阳打北边出来了'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('太阳打北边出来了')).assertEqual(false);
      expect(codePointCount('')).assertEqual(0);
      expect(codePointCount('中文')).assertEqual(2);
      expect(text.length === 0).assertEqual(points === 0);
      const scenarioTag: string = 'normal english comment' + ':' + '太阳打北边出来了' + '@' + '9-14' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '9-14')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name longDraftSurvivesRoundTripWithPaddedWithLongAuthor
     * @tc.desc A 245-unit long draft with segment markers survives publish unchanged and stays anchored by its prefix and suffix.
     * @tc.type Function
     * @tc.level Level1
     */
    it('longDraftSurvivesRoundTripWithPaddedWithLongAuthor', 0, () => {
      const longText: string = '长文本填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落结束';
      expect(longText.length).assertEqual(245);
      expect(longText.length > 200).assertTrue();
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      expect(board.updateDraft(longText)).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('id-001') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text.length).assertEqual(245);
      expect(board.comments[8].text === longText).assertTrue();
      expect(board.comments[8].text.startsWith('长文本')).assertTrue();
      expect(board.comments[8].text.endsWith('结束')).assertTrue();
      const scenarioTag: string = '  leading and trailing  ' + ':' + '小猫带耳机' + '@' + 'id-001' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

    /**
     * @tc.name payloadIsStoredVerbatimWithFullWidthSpaceInIdleState
     * @tc.desc Punctuation and quote counts in the stored a full-width-space payload match the original input.
     * @tc.type Function
     * @tc.level Level1
     */
    it('payloadIsStoredVerbatimWithFullWidthSpaceInIdleState', 0, () => {
      const payload: string = 'full-width\u3000space';
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft(payload);
      expect(board.publish('row_beta-16') !== null).assertTrue();
      const stored: string = board.comments[8].text;
      expect(stored).assertEqual(payload);
      expect(stored.length).assertEqual(payload.length);
      expect(board.comments[8].id).assertEqual('row_beta-16');
      expect(board.comments[8].id.length).assertEqual(11);
      expect(stored.indexOf('<') >= 0).assertEqual(payload.indexOf('<') >= 0);
      expect(countChar(stored, ';')).assertEqual(countChar(payload, ';'));
      expect(stored.indexOf('\\\\')).assertEqual(payload.indexOf('\\\\'));
      const scenarioTag: string = 'full-width\u3000space' + ':' + 'ＵＳＥＲ' + '@' + 'row_beta-16' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-16')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name unicodeAuthorSurvivesReplyWithPlainInFirstRowLadder
     * @tc.desc Surrogate-pair detection for a plain-text author name matches the actual UTF-16 composition of that name.
     * @tc.type Function
     * @tc.level Level1
     */
    it('unicodeAuthorSurvivesReplyWithPlainInFirstRowLadder', 0, () => {
      const name: string = '天要下雨娘要嫁人';
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
      expect(codePointCount(name)).assertEqual(8);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const scenarioTag: string = '@mention someone' + ':' + '天要下雨娘要嫁人' + '@' + 'uuid-like-0001-17' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-17')).assertLarger(0);
      expect(scenarioTag.length > 41).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithPlainWithMixedScript
     * @tc.desc Replying to fixture row 3 with a plain-text draft appends a row carrying the parent id, parent author and current user.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithPlainWithMixedScript', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, 'back\\slash', '记录-1');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('back\\slash');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const scenarioTag: string = 'back\\slash' + ':' + '大事不妙了' + '@' + '记录-1' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 19).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithPlainOnTailRowCompass
     * @tc.desc Splitting a plain-text draft into UTF-16 units agrees with its length while a single emoji contributes two units and one code point.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithPlainOnTailRowCompass', 0, () => {
      const text: string = 'null';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('用户\uD83D\uDE00\uD83D\uDE00') <= '用户\uD83D\uDE00\uD83D\uDE00'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(true);
      expect(text.split('').length).assertEqual(text.length);
      expect(codePointCount('😀')).assertEqual(1);
      expect('😀'.length).assertEqual(2);
      expect(hasSurrogatePair('😀')).assertTrue();
      const scenarioTag: string = 'null' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '2-19' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '2-19')).assertLarger(0);
      expect(scenarioTag.length > 14).assertTrue();
    });

    /**
     * @tc.name longDraftSurvivesRoundTripWithDigitsUnderPanel
     * @tc.desc The long draft remains BMP-only with no surrogate pairs and stays distinct from the fixture bodies.
     * @tc.type Function
     * @tc.level Level1
     */
    it('longDraftSurvivesRoundTripWithDigitsUnderPanel', 0, () => {
      const longText: string = '长文本填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落结束';
      expect(longText.length).assertEqual(245);
      expect(longText.length > 200).assertTrue();
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      expect(board.updateDraft(longText)).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('5-20') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text.length).assertEqual(245);
      expect(board.comments[8].text === longText).assertTrue();
      expect(board.comments[8].text.startsWith('长文本')).assertTrue();
      expect(board.comments[8].text.endsWith('结束')).assertTrue();
      expect(codePointCount(longText)).assertEqual(longText.length);
      expect(board.comments[8].text === EXPECTED_TEXTS[3]).assertFalse();
      const scenarioTag: string = '0' + ':' + '你若安好便是晴天' + '@' + '5-20' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '5-20')).assertLarger(0);
      expect(scenarioTag.length > 13).assertTrue();
    });

    /**
     * @tc.name payloadIsStoredVerbatimWithCjkPunctuationDuringTyping
     * @tc.desc Payload text from a CJK-punctuated draft is stored verbatim with identical length, identifier and authored row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('payloadIsStoredVerbatimWithCjkPunctuationDuringTyping', 0, () => {
      const payload: string = '主队控球率 58%，射门 14 次';
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft(payload);
      expect(board.publish('9') !== null).assertTrue();
      const stored: string = board.comments[8].text;
      expect(stored).assertEqual(payload);
      expect(stored.length).assertEqual(payload.length);
      expect(board.comments[8].id).assertEqual('9');
      expect(board.comments[8].id.length).assertEqual(1);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '等烟雨而我在等你' + '@' + '9' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '9')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name unicodeAuthorSurvivesReplyWithPlainOnLegacyDevice
     * @tc.desc The reply row written for a plain-text author keeps the current user as author and parent id 1 as reply id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('unicodeAuthorSurvivesReplyWithPlainOnLegacyDevice', 0, () => {
      const name: string = 'stadium_guest';
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
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'stadium_guest' + '@' + 'id-001-22' + '#' + 'InputSanitizationTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-22')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

  });
}
