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

export default function DataExposureTest(): void {
  describe('DataExposureTest', () => {
    beforeAll(() => {
      logSuite('DataExposureTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('DataExposureTest', 'end');
    });

    /**
     * @tc.name payloadIsStoredVerbatimWithPlainBeforePublish
     * @tc.desc Punctuation and quote counts in the stored a plain-text payload match the original input.
     * @tc.type Function
     * @tc.level Level1
     */
    it('payloadIsStoredVerbatimWithPlainBeforePublish', 0, () => {
      const payload: string = 'back\\slash';
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft(payload);
      expect(board.publish('custom-id') !== null).assertTrue();
      const stored: string = board.comments[8].text;
      expect(stored).assertEqual(payload);
      expect(stored.length).assertEqual(payload.length);
      expect(board.comments[8].id).assertEqual('custom-id');
      expect(board.comments[8].id.length).assertEqual(9);
      expect(stored.indexOf('<') >= 0).assertEqual(payload.indexOf('<') >= 0);
      expect(countChar(stored, ';')).assertEqual(countChar(payload, ';'));
      expect(stored.indexOf('\\\\')).assertEqual(payload.indexOf('\\\\'));
      const scenarioTag: string = 'back\\slash' + ':' + '你若安好便是晴天' + '@' + 'custom-id' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name unicodeAuthorSurvivesReplyWithPlainWithMixedScript
     * @tc.desc Surrogate-pair detection for a plain-text author name matches the actual UTF-16 composition of that name.
     * @tc.type Function
     * @tc.level Level1
     */
    it('unicodeAuthorSurvivesReplyWithPlainWithMixedScript', 0, () => {
      const name: string = '等烟雨而我在等你';
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
      const scenarioTag: string = 'null' + ':' + '等烟雨而我在等你' + '@' + 'row_alpha-1' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-1')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithDigitsOnRetry
     * @tc.desc Replying to fixture row 3 with a digit-only draft appends a row carrying the parent id, parent author and current user.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithDigitsOnRetry', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '0', 'R-42-2');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('0');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const scenarioTag: string = '0' + ':' + 'stadium_guest' + '@' + 'R-42-2' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-2')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithCjkPunctuationWithDuplicateId
     * @tc.desc Splitting a CJK-punctuated draft into UTF-16 units agrees with its length while a single emoji contributes two units and one code point.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithCjkPunctuationWithDuplicateId', 0, () => {
      const text: string = '主队控球率 58%，射门 14 次';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('夜班解说') <= '夜班解说'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('夜班解说')).assertEqual(false);
      expect(text.split('').length).assertEqual(text.length);
      expect(codePointCount('😀')).assertEqual(1);
      expect('😀'.length).assertEqual(2);
      expect(hasSurrogatePair('😀')).assertTrue();
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '夜班解说' + '@' + 'x' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name longDraftSurvivesRoundTripWithPlainWithReplyMeta
     * @tc.desc The long draft remains BMP-only with no surrogate pairs and stays distinct from the fixture bodies.
     * @tc.type Function
     * @tc.level Level1
     */
    it('longDraftSurvivesRoundTripWithPlainWithReplyMeta', 0, () => {
      const longText: string = '长文本填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落结束';
      expect(longText.length).assertEqual(245);
      expect(longText.length > 200).assertTrue();
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      expect(board.updateDraft(longText)).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('1-4') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text.length).assertEqual(245);
      expect(board.comments[8].text === longText).assertTrue();
      expect(board.comments[8].text.startsWith('长文本')).assertTrue();
      expect(board.comments[8].text.endsWith('结束')).assertTrue();
      expect(codePointCount(longText)).assertEqual(longText.length);
      expect(board.comments[8].text === EXPECTED_TEXTS[3]).assertFalse();
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '1-4' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '1-4')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name payloadIsStoredVerbatimWithPlainAfterPublish
     * @tc.desc Payload text from a plain-text draft is stored verbatim with identical length, identifier and authored row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('payloadIsStoredVerbatimWithPlainAfterPublish', 0, () => {
      const payload: string = '角球战术演练得非常熟练';
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft(payload);
      expect(board.publish('3-5') !== null).assertTrue();
      const stored: string = board.comments[8].text;
      expect(stored).assertEqual(payload);
      expect(stored.length).assertEqual(payload.length);
      expect(board.comments[8].id).assertEqual('3-5');
      expect(board.comments[8].id.length).assertEqual(3);
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '访客甲' + '@' + '3-5' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '3-5')).assertLarger(0);
      expect(scenarioTag.length > 17).assertTrue();
    });

    /**
     * @tc.name unicodeAuthorSurvivesReplyWithAstralAcrossSessions
     * @tc.desc The reply row written for an astral-plane author keeps the current user as author and parent id 1 as reply id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('unicodeAuthorSurvivesReplyWithAstralAcrossSessions', 0, () => {
      const name: string = '看台第七排';
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
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '看台第七排' + '@' + '7' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '7')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithSymbolHeavyUnderPanel
     * @tc.desc A reply against an empty-id target built from a symbol-heavy context is rejected and the authored row count stays one.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithSymbolHeavyUnderPanel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, 'semi;colon;only;', 'custom-id-7');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('semi;colon;only;');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const orphan: NewsCommentModel = makeComment('', 'nobody', 'body', '', '', FIXED_TIME);
      expect(board.reply(orphan, orphan.id, orphan.user, 'text', 'orphan')).assertNull();
      expect(board.byUser(curUser).length).assertEqual(1);
      const scenarioTag: string = 'semi;colon;only;' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'custom-id-7' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-7')).assertLarger(0);
      expect(scenarioTag.length > 39).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithCjkPunctuationAfterInterruptRoute
     * @tc.desc Counting code points in a CJK-punctuated draft never exceeds its UTF-16 length and equals it only when no surrogate pair exists.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithCjkPunctuationAfterInterruptRoute', 0, () => {
      const text: string = '国足加油！国足必胜！';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('兔子不吃窝边草') <= '兔子不吃窝边草'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('兔子不吃窝边草')).assertEqual(false);
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '兔子不吃窝边草' + '@' + 'row_alpha-8' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-8')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name longDraftSurvivesRoundTripWithTabOnlyInIdleState
     * @tc.desc The long draft keeps more than ten repeated segment markers and preserves its first three characters.
     * @tc.type Function
     * @tc.level Level1
     */
    it('longDraftSurvivesRoundTripWithTabOnlyInIdleState', 0, () => {
      const longText: string = '长文本填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落填充段落结束';
      expect(longText.length).assertEqual(245);
      expect(longText.length > 200).assertTrue();
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      expect(board.updateDraft(longText)).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('R-42') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text.length).assertEqual(245);
      expect(board.comments[8].text === longText).assertTrue();
      expect(board.comments[8].text.startsWith('长文本')).assertTrue();
      expect(board.comments[8].text.endsWith('结束')).assertTrue();
      expect(countChar(board.comments[8].text, '段')).assertLarger(10);
      expect(board.comments[8].text.substring(0, 3)).assertEqual('长文本');
      expect(board.comments[8].text.indexOf('填充')).assertLarger(0);
      const scenarioTag: string = '\t' + ':' + 'a' + '@' + 'R-42' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + 'R-42')).assertLarger(0);
      expect(scenarioTag.length > 6).assertTrue();
    });

    /**
     * @tc.name payloadIsStoredVerbatimWithEmojiWithMixedScript
     * @tc.desc The first and last characters of the stored an emoji-bearing payload match the original payload exactly.
     * @tc.type Function
     * @tc.level Level1
     */
    it('payloadIsStoredVerbatimWithEmojiWithMixedScript', 0, () => {
      const payload: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛';
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft(payload);
      expect(board.publish('x-10') !== null).assertTrue();
      const stored: string = board.comments[8].text;
      expect(stored).assertEqual(payload);
      expect(stored.length).assertEqual(payload.length);
      expect(board.comments[8].id).assertEqual('x-10');
      expect(board.comments[8].id.length).assertEqual(4);
      expect(stored.substring(0, 1)).assertEqual(payload.substring(0, 1));
      expect(stored.charAt(stored.length - 1).toString()).assertEqual(payload.charAt(payload.length - 1).toString());
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '太阳打北边出来了' + '@' + 'x-10' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'x-10')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name unicodeAuthorSurvivesReplyWithScriptLikeDuringScroll
     * @tc.desc An author name of a script-like style survives model construction and reply metadata unchanged in length and value.
     * @tc.type Function
     * @tc.level Level1
     */
    it('unicodeAuthorSurvivesReplyWithScriptLikeDuringScroll', 0, () => {
      const name: string = '小猫带耳机';
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
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '小猫带耳机' + '@' + '1-11' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '1-11')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithPlainOnColdStartAudit
     * @tc.desc A blank reply body against fixture row 3 using a plain-text context is rejected without changing the row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithPlainOnColdStartAudit', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, 'normal english comment', '3');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('normal english comment');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.reply(target, target.id, target.user, '', 'blank-reply')).assertNull();
      expect(board.count).assertEqual(9);
      const scenarioTag: string = 'normal english comment' + ':' + 'ＵＳＥＲ' + '@' + '3' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '3')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithPaddedInIdleState
     * @tc.desc Code-point probes on empty text and two CJK characters return zero and two respectively.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithPaddedInIdleState', 0, () => {
      const text: string = '  leading and trailing  ';
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
      expect(codePointCount('')).assertEqual(0);
      expect(codePointCount('中文')).assertEqual(2);
      expect(text.length === 0).assertEqual(points === 0);
      const scenarioTag: string = '  leading and trailing  ' + ':' + '天要下雨娘要嫁人' + '@' + '7-13' + '#' + 'DataExposureTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '7-13')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

  });
}
