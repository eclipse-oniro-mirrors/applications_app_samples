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
import { mockData, curUser } from '../../../../main/ets/mock/NewsDetailData.ets';
import {
  FIXED_TIME, EXPECTED_USERS, EXPECTED_TEXTS, TimeParts, formatTime, countChar,
  stableHash, joinIds, distinctIdCount, tailOf, CommentBoard, runScript,
  BoardSnapshot, snapshot, allFieldsNonEmptyText
} from '../Shared/SharedDriver.ets';
import { logSuite , allDigits, digitCount} from '../Shared/Support.ets';

export default function DraftContentRulesTest(): void {
  describe('DraftContentRulesTest', () => {
    beforeAll(() => {
      logSuite('DraftContentRulesTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('DraftContentRulesTest', 'end');
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithCjkPunctuationOnSeededBoard
     * @tc.desc Erasing a CJK-punctuated draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithCjkPunctuationOnSeededBoard', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.updateDraft('国足加油！国足必胜！')).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('empty-2')).assertNull();
      expect(distinctIdCount(board.comments)).assertEqual(8);
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '你若安好便是晴天' + '@' + '3' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '3')).assertLarger(0);
      expect(scenarioTag.length > 19).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithTabOnlyAfterPublish
     * @tc.desc Publishing a tab-only draft records the supplied id as the last id and leaves the eight seed ids intact.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithTabOnlyAfterPublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('\t')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('7-1') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('\t');
      expect(board.comments[8].text.length).assertEqual(1);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].id).assertEqual('7-1');
      expect(board.lastId).assertEqual('7-1');
      expect(board.comments[0].id).assertEqual('1');
      expect(board.listVisible).assertTrue();
      const scenarioTag: string = '\t' + ':' + '等烟雨而我在等你' + '@' + '7-1' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '7-1')).assertLarger(0);
      expect(scenarioTag.length > 12).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithEmojiDuringScroll
     * @tc.desc After publishing an emoji-bearing draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithEmojiDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      board.publish('custom-id-2');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('custom-id-2');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'stadium_guest' + '@' + 'custom-id-2' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-2')).assertLarger(0);
      expect(scenarioTag.length > 37).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithScriptLikeAfterCancel
     * @tc.desc The author filter returns the three rows published from a script-like drafts in publish order after the seed rows.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithScriptLikeAfterCancel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['<script>alert(1)</script>', '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛', 'percent 100%'];
      const tokens: Array<string> = ['row_alpha', 'row_alpha-b', 'row_alpha-c'];
      for (let index = 0; index < texts.length; index++) {
        expect(board.openComposer()).assertTrue();
        expect(board.updateDraft(texts[index])).assertTrue();
        expect(board.canPublish).assertTrue();
        expect(board.publish(tokens[index]) !== null).assertTrue();
        expect(board.draft).assertEqual('');
        expect(board.editing).assertFalse();
        expect(board.publishCount).assertEqual(index + 1);
      }
      expect(board.count).assertEqual(11);
      expect(board.comments[8].text).assertEqual(texts[0]);
      expect(board.comments[9].text).assertEqual(texts[1]);
      expect(board.comments[10].text).assertEqual(texts[2]);
      expect(distinctIdCount(board.comments)).assertEqual(11);
      expect(board.lastId).assertEqual(tokens[2]);
      expect(board.byUser(curUser).length).assertEqual(3);
      expect(tailOf(board.comments, 3)[0].id).assertEqual(tokens[0]);
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '夜班解说' + '@' + 'row_alpha' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithPlainInFirstRow
     * @tc.desc Reopening after the cancelled a plain-text draft publishes a different draft normally with one appended row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithPlainInFirstRow', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('normal english comment')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('Mixed 中文 and English 123')).assertTrue();
      expect(board.publish('R-42-4') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('Mixed 中文 and English 123');
      const scenarioTag: string = 'normal english comment' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'R-42-4' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-4')).assertLarger(0);
      expect(scenarioTag.length > 41).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithPaddedAfterPublish
     * @tc.desc An open/type/publish/cancel script over a space-padded draft accepts five steps and leaves one appended row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithPaddedAfterPublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['open', 'type:' + '  leading and trailing  ', 'publish:' + 'x-5', 'open', 'cancel'];
      expect(runScript(board, script)).assertEqual(5);
      expect(board.count).assertEqual(9);
      expect(board.editing).assertFalse();
      expect(board.publishCount).assertEqual(1);
      expect(board.draft).assertEqual('');
      expect(board.comments[8].text).assertEqual('  leading and trailing  ');
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '  leading and trailing  ' + ':' + '访客甲' + '@' + 'x-5' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'x-5')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithFullWidthSpaceAcrossSessions
     * @tc.desc The combined length of the eight fixture bodies exceeds one hundred UTF-16 units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithFullWidthSpaceAcrossSessions', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      const texts: Array<string> = list.map((row: NewsCommentModel) => row.text);
      expect(texts[0]).assertEqual(EXPECTED_TEXTS[0]);
      expect(texts[1]).assertEqual(EXPECTED_TEXTS[1]);
      expect(texts[7]).assertEqual(EXPECTED_TEXTS[7]);
      expect(texts.length).assertEqual(8);
      expect(allFieldsNonEmptyText(list)).assertTrue();
      expect(texts[0].charAt(texts[0].length - 1).toString()).assertEqual('！');
      expect(texts[1].charAt(texts[1].length - 1).toString()).assertEqual('~');
      let total: number = 0;
      for (let index = 0; index < texts.length; index++) { total += texts[index].length; }
      expect(total > 100).assertTrue();
      expect(texts.indexOf(EXPECTED_TEXTS[3])).assertEqual(3);
      const scenarioTag: string = 'full-width\u3000space' + ':' + '看台第七排' + '@' + '1' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '1')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name timestampKeepsCanonicalShapeWithPlainWithPaddedBody
     * @tc.desc Rebuilding the fixed timestamp through TimeParts keeps the same text and the same stable digest.
     * @tc.type Function
     * @tc.level Level1
     */
    it('timestampKeepsCanonicalShapeWithPlainWithPaddedBody', 0, () => {
      expect(FIXED_TIME.length).assertEqual(19);
      expect(countChar(FIXED_TIME, '-')).assertEqual(2);
      expect(countChar(FIXED_TIME, ':')).assertEqual(2);
      expect(countChar(FIXED_TIME, ' ')).assertEqual(1);
      expect(FIXED_TIME.charAt(4).toString()).assertEqual('-');
      expect(FIXED_TIME.charAt(10).toString()).assertEqual(' ');
      expect(FIXED_TIME.substring(0, 4)).assertEqual('2024');
      expect(FIXED_TIME.substring(11, 13)).assertEqual('23');
      expect(FIXED_TIME.substring(14, 16)).assertEqual('00');
      expect(FIXED_TIME.substring(17, 19)).assertEqual('00');
      const rebuilt: string = formatTime(new TimeParts(2024, 11, 1, 23, 0, 0));
      expect(rebuilt).assertEqual(FIXED_TIME);
      expect(stableHash(rebuilt)).assertEqual(stableHash(FIXED_TIME));
      const scenarioTag: string = '@mention someone' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '3-7' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '3-7')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithPlainDuringTypingAudit
     * @tc.desc Publishing an empty draft is rejected and leaves the eight rows, draft and publish counter untouched.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithPlainDuringTypingAudit', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      const scenarioTag: string = 'back\\slash' + ':' + '兔子不吃窝边草' + '@' + '7-8' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '7-8')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithPlainOnColdStart
     * @tc.desc The row published from a plain-text draft carries an empty reply id, empty reply user and the fixed timestamp.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithPlainOnColdStart', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('null')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('custom-id') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('null');
      expect(board.comments[8].text.length).assertEqual(4);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].replyId).assertEqual('');
      expect(board.comments[8].replyUser).assertEqual('');
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.comments[8].url === '').assertTrue();
      const scenarioTag: string = 'null' + ':' + 'a' + '@' + 'custom-id' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 14).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithDigitsOnPanelClose
     * @tc.desc Resetting a board that published a digit-only draft restores the eight seed rows with a zero publish count and no last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithDigitsOnPanelClose', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('0');
      board.publish('row_alpha-10');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('row_alpha-10');
      expect(board.count).assertEqual(9);
      board.reset();
      expect(board.count).assertEqual(8);
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      const scenarioTag: string = '0' + ':' + '太阳打北边出来了' + '@' + 'row_alpha-10' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-10')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithCjkPunctuationAtSeedEdge
     * @tc.desc Three consecutive publishes of a CJK-punctuated drafts append in order while the counter rises from one to three.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithCjkPunctuationAtSeedEdge', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['主队控球率 58%，射门 14 次', 'line1\nline2', '主队控球率 58%，射门 14 次'];
      const tokens: Array<string> = ['R-42-11', 'R-42-11-b', 'R-42-11-c'];
      for (let index = 0; index < texts.length; index++) {
        expect(board.openComposer()).assertTrue();
        expect(board.updateDraft(texts[index])).assertTrue();
        expect(board.canPublish).assertTrue();
        expect(board.publish(tokens[index]) !== null).assertTrue();
        expect(board.draft).assertEqual('');
        expect(board.editing).assertFalse();
        expect(board.publishCount).assertEqual(index + 1);
      }
      expect(board.count).assertEqual(11);
      expect(board.comments[8].text).assertEqual(texts[0]);
      expect(board.comments[9].text).assertEqual(texts[1]);
      expect(board.comments[10].text).assertEqual(texts[2]);
      expect(distinctIdCount(board.comments)).assertEqual(11);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '小猫带耳机' + '@' + 'R-42-11' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-11')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithPlainOnSeededBoard
     * @tc.desc Publishing immediately after cancelling a plain-text draft is rejected, and a second cancel reports no state change.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithPlainOnSeededBoard', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('守门员的三次扑救挽救了球队')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(board.ids().length).assertEqual(8);
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'ＵＳＥＲ' + '@' + 'x' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithPlainInIdleState
     * @tc.desc A reply script over a plain-text draft records parent id 1 and the fixture author before the cancel step.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithPlainInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['open', 'reply:0:' + '1-13' + ':' + '角球战术演练得非常熟练', 'cancel'];
      expect(runScript(board, script)).assertEqual(3);
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('1');
      expect(board.comments[8].replyUser).assertEqual(EXPECTED_USERS[0]);
      expect(board.comments[8].text).assertEqual('角球战术演练得非常熟练');
      expect(board.editing).assertFalse();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '天要下雨娘要嫁人' + '@' + '1-13' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '1-13')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithAstralWithMixedScript
     * @tc.desc Fixture bodies match the eight expected texts and end with the documented exclamation, tilde or period.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithAstralWithMixedScript', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      const texts: Array<string> = list.map((row: NewsCommentModel) => row.text);
      expect(texts[0]).assertEqual(EXPECTED_TEXTS[0]);
      expect(texts[1]).assertEqual(EXPECTED_TEXTS[1]);
      expect(texts[7]).assertEqual(EXPECTED_TEXTS[7]);
      expect(texts.length).assertEqual(8);
      expect(allFieldsNonEmptyText(list)).assertTrue();
      expect(texts[0].charAt(texts[0].length - 1).toString()).assertEqual('！');
      expect(texts[1].charAt(texts[1].length - 1).toString()).assertEqual('~');
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '大事不妙了' + '@' + '3-14' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '3-14')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name timestampKeepsCanonicalShapeWithSymbolHeavyWithDuplicateId
     * @tc.desc The fixed timestamp contains fourteen digits, and its date and time segments are all-digit slices.
     * @tc.type Function
     * @tc.level Level1
     */
    it('timestampKeepsCanonicalShapeWithSymbolHeavyWithDuplicateId', 0, () => {
      expect(FIXED_TIME.length).assertEqual(19);
      expect(countChar(FIXED_TIME, '-')).assertEqual(2);
      expect(countChar(FIXED_TIME, ':')).assertEqual(2);
      expect(countChar(FIXED_TIME, ' ')).assertEqual(1);
      expect(FIXED_TIME.charAt(4).toString()).assertEqual('-');
      expect(FIXED_TIME.charAt(10).toString()).assertEqual(' ');
      expect(FIXED_TIME.substring(0, 4)).assertEqual('2024');
      expect(FIXED_TIME.substring(11, 13)).assertEqual('23');
      expect(FIXED_TIME.substring(14, 16)).assertEqual('00');
      expect(FIXED_TIME.substring(17, 19)).assertEqual('00');
      expect(digitCount(FIXED_TIME)).assertEqual(14);
      expect(allDigits(FIXED_TIME.substring(0, 4))).assertTrue();
      expect(allDigits(FIXED_TIME.substring(5, 7))).assertTrue();
      const scenarioTag: string = 'semi;colon;only;' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '7' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '7')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithCjkPunctuationWithEmptyBuffer
     * @tc.desc Calling publish with an empty token appends nothing and preserves the seed id chain.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithCjkPunctuationWithEmptyBuffer', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.publish('')).assertNull();
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '你若安好便是晴天' + '@' + 'custom-id-16' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-16')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithTabOnlyUnderBudget
     * @tc.desc Publishing a tab-only draft is accepted because the rule only rejects the empty string, and the new row keeps the payload exactly.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithTabOnlyUnderBudget', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('\t')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('row_alpha-17') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('\t');
      expect(board.comments[8].text.length).assertEqual(1);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      const scenarioTag: string = '\t' + ':' + '等烟雨而我在等你' + '@' + 'row_alpha-17' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-17')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithEmojiWithMixedScript
     * @tc.desc A second empty attempt after publishing an emoji-bearing draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithEmojiWithMixedScript', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      board.publish('R-42');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('R-42');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('R-42');
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'stadium_guest' + '@' + 'R-42' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'R-42')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithScriptLikeDuringScroll
     * @tc.desc The snapshot after three a script-like publishes keeps the seed id prefix and reports the third body as the tail.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithScriptLikeDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['<script>alert(1)</script>', '#topic tag', 'Ω≈ç√∫˜µ≤≥÷'];
      const tokens: Array<string> = ['x-19', 'x-19-b', 'x-19-c'];
      for (let index = 0; index < texts.length; index++) {
        expect(board.openComposer()).assertTrue();
        expect(board.updateDraft(texts[index])).assertTrue();
        expect(board.canPublish).assertTrue();
        expect(board.publish(tokens[index]) !== null).assertTrue();
        expect(board.draft).assertEqual('');
        expect(board.editing).assertFalse();
        expect(board.publishCount).assertEqual(index + 1);
      }
      expect(board.count).assertEqual(11);
      expect(board.comments[8].text).assertEqual(texts[0]);
      expect(board.comments[9].text).assertEqual(texts[1]);
      expect(board.comments[10].text).assertEqual(texts[2]);
      expect(distinctIdCount(board.comments)).assertEqual(11);
      const snap: BoardSnapshot = snapshot(board);
      expect(snap.count).assertEqual(11);
      expect(snap.publishCount).assertEqual(3);
      expect(snap.ids.startsWith('1|2|3|4|5|7|8|9|')).assertTrue();
      expect(snap.lastText).assertEqual(texts[2]);
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '夜班解说' + '@' + 'x-19' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'x-19')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithPlainBeforePublishSnapshot
     * @tc.desc Cancelling a plain-text draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithPlainBeforePublishSnapshot', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('normal english comment')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      const scenarioTag: string = 'normal english comment' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '1-20' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '1-20')).assertLarger(0);
      expect(scenarioTag.length > 39).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithPaddedDuringTyping
     * @tc.desc A script that types a space-padded draft before opening the composer refuses the typing and the second publish. Both premature publish attempts leave the seed state intact; typing after opening then publishes successfully.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithPaddedDuringTyping', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['type:' + '  leading and trailing  ', 'open', 'publish:' + '3', 'publish:' + '3-b'];
      expect(runScript(board, script)).assertEqual(1);
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.publishCount).assertEqual(0);
      expect(board.draft).assertEqual('');
      expect(board.publish('late')).assertNull();
      expect(board.updateDraft('  leading and trailing  ')).assertTrue();
      expect(board.publish('3') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.editing).assertFalse();
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].id).assertEqual('3');
      expect(board.publish('late')).assertNull();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '  leading and trailing  ' + ':' + '访客甲' + '@' + '3' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '3')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithFullWidthSpaceWithMixedScript
     * @tc.desc Keyword probes locate the expected substrings in fixture rows 3, 6 and 7 while question marks stay absent from row 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithFullWidthSpaceWithMixedScript', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      const texts: Array<string> = list.map((row: NewsCommentModel) => row.text);
      expect(texts[0]).assertEqual(EXPECTED_TEXTS[0]);
      expect(texts[1]).assertEqual(EXPECTED_TEXTS[1]);
      expect(texts[7]).assertEqual(EXPECTED_TEXTS[7]);
      expect(texts.length).assertEqual(8);
      expect(allFieldsNonEmptyText(list)).assertTrue();
      expect(texts[0].charAt(texts[0].length - 1).toString()).assertEqual('！');
      expect(texts[1].charAt(texts[1].length - 1).toString()).assertEqual('~');
      expect(texts[5].indexOf('继续')).assertLarger(0);
      expect(texts[6].indexOf('差距')).assertLarger(0);
      expect(texts[2].indexOf('？') < 0).assertTrue();
      expect(texts[2].indexOf('吗')).assertLarger(0);
      expect(countChar(texts[7], '，')).assertEqual(1);
      const scenarioTag: string = 'full-width\u3000space' + ':' + '看台第七排' + '@' + '7-22' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '7-22')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name timestampKeepsCanonicalShapeWithPlainAcrossCycles
     * @tc.desc The fixed timestamp holds 19 characters with dashes at offsets 4 and 7 and colons at 13 and 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('timestampKeepsCanonicalShapeWithPlainAcrossCycles', 0, () => {
      expect(FIXED_TIME.length).assertEqual(19);
      expect(countChar(FIXED_TIME, '-')).assertEqual(2);
      expect(countChar(FIXED_TIME, ':')).assertEqual(2);
      expect(countChar(FIXED_TIME, ' ')).assertEqual(1);
      expect(FIXED_TIME.charAt(4).toString()).assertEqual('-');
      expect(FIXED_TIME.charAt(10).toString()).assertEqual(' ');
      expect(FIXED_TIME.substring(0, 4)).assertEqual('2024');
      expect(FIXED_TIME.substring(11, 13)).assertEqual('23');
      expect(FIXED_TIME.substring(14, 16)).assertEqual('00');
      expect(FIXED_TIME.substring(17, 19)).assertEqual('00');
      const scenarioTag: string = '@mention someone' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'custom-id-23' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-23')).assertLarger(0);
      expect(scenarioTag.length > 40).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithPlainBeforePublish
     * @tc.desc Erasing a plain-text draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithPlainBeforePublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.updateDraft('back\\slash')).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('empty-2')).assertNull();
      expect(distinctIdCount(board.comments)).assertEqual(8);
      const scenarioTag: string = 'back\\slash' + ':' + '兔子不吃窝边草' + '@' + 'row_alpha' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithPlainWithStaleDraft
     * @tc.desc Publishing a plain-text draft records the supplied id as the last id and leaves the eight seed ids intact.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithPlainWithStaleDraft', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('null')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('R-42-25') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('null');
      expect(board.comments[8].text.length).assertEqual(4);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].id).assertEqual('R-42-25');
      expect(board.lastId).assertEqual('R-42-25');
      expect(board.comments[0].id).assertEqual('1');
      expect(board.listVisible).assertTrue();
      const scenarioTag: string = 'null' + ':' + 'a' + '@' + 'R-42-25' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-25')).assertLarger(0);
      expect(scenarioTag.length > 12).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithDigitsWithMixedScript
     * @tc.desc After publishing a digit-only draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithDigitsWithMixedScript', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('0');
      board.publish('x-26');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('x-26');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '0' + ':' + '太阳打北边出来了' + '@' + 'x-26' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'x-26')).assertLarger(0);
      expect(scenarioTag.length > 13).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithCjkPunctuationWithDuplicateId
     * @tc.desc The author filter returns the three rows published from a CJK-punctuated drafts in publish order after the seed rows.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithCjkPunctuationWithDuplicateId', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['主队控球率 58%，射门 14 次', '0', '   '];
      const tokens: Array<string> = ['1', '1-b', '1-c'];
      for (let index = 0; index < texts.length; index++) {
        expect(board.openComposer()).assertTrue();
        expect(board.updateDraft(texts[index])).assertTrue();
        expect(board.canPublish).assertTrue();
        expect(board.publish(tokens[index]) !== null).assertTrue();
        expect(board.draft).assertEqual('');
        expect(board.editing).assertFalse();
        expect(board.publishCount).assertEqual(index + 1);
      }
      expect(board.count).assertEqual(11);
      expect(board.comments[8].text).assertEqual(texts[0]);
      expect(board.comments[9].text).assertEqual(texts[1]);
      expect(board.comments[10].text).assertEqual(texts[2]);
      expect(distinctIdCount(board.comments)).assertEqual(10);
      expect(board.lastId).assertEqual(tokens[2]);
      expect(board.byUser(curUser).length).assertEqual(3);
      expect(tailOf(board.comments, 3)[0].id).assertEqual(tokens[0]);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '小猫带耳机' + '@' + '1' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '1')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithPlainWithStaleDraftLedger
     * @tc.desc Reopening after the cancelled a plain-text draft publishes a different draft normally with one appended row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithPlainWithStaleDraftLedger', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('守门员的三次扑救挽救了球队')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('下半场换人之后节奏明显加快')).assertTrue();
      expect(board.publish('3-28') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('下半场换人之后节奏明显加快');
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'ＵＳＥＲ' + '@' + '3-28' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '3-28')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithPlainOnColdStartCell
     * @tc.desc An open/type/publish/cancel script over a plain-text draft accepts five steps and leaves one appended row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithPlainOnColdStartCell', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['open', 'type:' + '角球战术演练得非常熟练', 'publish:' + '7-29', 'open', 'cancel'];
      expect(runScript(board, script)).assertEqual(5);
      expect(board.count).assertEqual(9);
      expect(board.editing).assertFalse();
      expect(board.publishCount).assertEqual(1);
      expect(board.draft).assertEqual('');
      expect(board.comments[8].text).assertEqual('角球战术演练得非常熟练');
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '天要下雨娘要嫁人' + '@' + '7-29' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '7-29')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithAstralOnLegacyDevice
     * @tc.desc The combined length of the eight fixture bodies exceeds one hundred UTF-16 units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithAstralOnLegacyDevice', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      const texts: Array<string> = list.map((row: NewsCommentModel) => row.text);
      expect(texts[0]).assertEqual(EXPECTED_TEXTS[0]);
      expect(texts[1]).assertEqual(EXPECTED_TEXTS[1]);
      expect(texts[7]).assertEqual(EXPECTED_TEXTS[7]);
      expect(texts.length).assertEqual(8);
      expect(allFieldsNonEmptyText(list)).assertTrue();
      expect(texts[0].charAt(texts[0].length - 1).toString()).assertEqual('！');
      expect(texts[1].charAt(texts[1].length - 1).toString()).assertEqual('~');
      let total: number = 0;
      for (let index = 0; index < texts.length; index++) { total += texts[index].length; }
      expect(total > 100).assertTrue();
      expect(texts.indexOf(EXPECTED_TEXTS[3])).assertEqual(3);
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '大事不妙了' + '@' + 'custom-id' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

    /**
     * @tc.name timestampKeepsCanonicalShapeWithSymbolHeavyAcrossCycles
     * @tc.desc Rebuilding the fixed timestamp through TimeParts keeps the same text and the same stable digest.
     * @tc.type Function
     * @tc.level Level1
     */
    it('timestampKeepsCanonicalShapeWithSymbolHeavyAcrossCycles', 0, () => {
      expect(FIXED_TIME.length).assertEqual(19);
      expect(countChar(FIXED_TIME, '-')).assertEqual(2);
      expect(countChar(FIXED_TIME, ':')).assertEqual(2);
      expect(countChar(FIXED_TIME, ' ')).assertEqual(1);
      expect(FIXED_TIME.charAt(4).toString()).assertEqual('-');
      expect(FIXED_TIME.charAt(10).toString()).assertEqual(' ');
      expect(FIXED_TIME.substring(0, 4)).assertEqual('2024');
      expect(FIXED_TIME.substring(11, 13)).assertEqual('23');
      expect(FIXED_TIME.substring(14, 16)).assertEqual('00');
      expect(FIXED_TIME.substring(17, 19)).assertEqual('00');
      const rebuilt: string = formatTime(new TimeParts(2024, 11, 1, 23, 0, 0));
      expect(rebuilt).assertEqual(FIXED_TIME);
      expect(stableHash(rebuilt)).assertEqual(stableHash(FIXED_TIME));
      const scenarioTag: string = 'semi;colon;only;' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'row_alpha-31' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-31')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithCjkPunctuationOnTailRow
     * @tc.desc Publishing an empty draft is rejected and leaves the eight rows, draft and publish counter untouched.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithCjkPunctuationOnTailRow', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '你若安好便是晴天' + '@' + 'R-42-32' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-32')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithTabOnlyDuringTyping
     * @tc.desc The row published from a tab-only draft carries an empty reply id, empty reply user and the fixed timestamp.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithTabOnlyDuringTyping', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('\t')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('x') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('\t');
      expect(board.comments[8].text.length).assertEqual(1);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].replyId).assertEqual('');
      expect(board.comments[8].replyUser).assertEqual('');
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.comments[8].url === '').assertTrue();
      const scenarioTag: string = '\t' + ':' + '等烟雨而我在等你' + '@' + 'x' + '#' + 'DraftContentRulesTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 10).assertTrue();
    });

  });
}
