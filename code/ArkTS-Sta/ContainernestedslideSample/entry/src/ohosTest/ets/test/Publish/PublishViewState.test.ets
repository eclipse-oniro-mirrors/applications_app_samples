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
  FIXED_TIME, EXPECTED_IDS, EXPECTED_USERS, isCanonicalUuid, makeUuid, joinIds,
  distinctIdCount, tailOf, CommentBoard, runScript, BoardSnapshot, snapshot,
  runPublishCycles, mockMatchesOracle
} from '../Shared/SharedDriver.ets';
import { logSuite } from '../Shared/Support.ets';

export default function PublishViewStateTest(): void {
  describe('PublishViewStateTest', () => {
    beforeAll(() => {
      logSuite('PublishViewStateTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('PublishViewStateTest', 'end');
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithAstralInFirstRow
     * @tc.desc Erasing an astral-plane draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithAstralInFirstRow', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.updateDraft('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89')).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('empty-2')).assertNull();
      expect(distinctIdCount(board.comments)).assertEqual(8);
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + 'ＵＳＥＲ' + '@' + 'id-001' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithSymbolHeavyAfterReset
     * @tc.desc Two drafts published from a symbol-heavy draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithSymbolHeavyAfterReset', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('semi;colon;only;');
      board.publish('row_beta-1');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('semi;colon;only;');
      board.openComposer();
      board.updateDraft('下半场换人之后节奏明显加快');
      board.publish('row_beta-1-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('semi;colon;only;');
      expect(board.byUser(curUser)[1].text).assertEqual('下半场换人之后节奏明显加快');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = 'semi;colon;only;' + ':' + '天要下雨娘要嫁人' + '@' + 'row_beta-1' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-1')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithCjkPunctuationAfterCancel
     * @tc.desc Publishing a CJK-punctuated draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithCjkPunctuationAfterCancel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 8, '国足加油！国足必胜！');
      expect(board.count).assertEqual(16);
      expect(board.publishCount).assertEqual(8);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(16);
      expect(board.byUser(curUser).length).assertEqual(8);
      expect(board.comments[board.count - 1].text).assertEqual('国足加油！国足必胜！');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-7');
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '大事不妙了' + '@' + 'uuid-like-0001-2' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-2')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithTabOnlyDuringScroll
     * @tc.desc A script that types a tab-only draft before opening the composer refuses the typing and the second publish. Both premature publish attempts leave the seed state intact; typing after opening then publishes successfully.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithTabOnlyDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['type:' + '\t', 'open', 'publish:' + '记录-1', 'publish:' + '记录-1-b'];
      expect(runScript(board, script)).assertEqual(1);
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.publishCount).assertEqual(0);
      expect(board.draft).assertEqual('');
      expect(board.publish('late')).assertNull();
      expect(board.updateDraft('\t')).assertTrue();
      expect(board.publish('记录-1') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.editing).assertFalse();
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].id).assertEqual('记录-1');
      expect(board.publish('late')).assertNull();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '\t' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '记录-1' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 11).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithEmojiWithReplyMeta
     * @tc.desc The fixture id projection skips id 6 and keeps id 5 at index 4 and id 7 at index 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithEmojiWithReplyMeta', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      expect(list.length).assertEqual(8);
      expect(EXPECTED_IDS.length).assertEqual(8);
      expect(list[0].id).assertEqual('1');
      expect(list[7].id).assertEqual('9');
      expect(distinctIdCount(list)).assertEqual(8);
      expect(joinIds(list)).assertEqual('1|2|3|4|5|7|8|9');
      expect(mockMatchesOracle(list)).assertTrue();
      expect(list[3].id).assertEqual('4');
      const ids: Array<string> = list.map((row: NewsCommentModel) => row.id);
      expect(ids.length).assertEqual(8);
      expect(ids.indexOf('6')).assertEqual(-1);
      expect(ids.indexOf('5')).assertEqual(4);
      expect(ids.indexOf('7')).assertEqual(5);
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '你若安好便是晴天' + '@' + '2-4' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + '2-4')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithScriptLikeAfterPublish
     * @tc.desc Publishing a script-like draft appends exactly one row at the tail while the eight seed rows keep their order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithScriptLikeAfterPublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('<script>alert(1)</script>');
      const row: NewsCommentModel | null = board.publish('5-5');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('<script>alert(1)</script>');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '等烟雨而我在等你' + '@' + '5-5' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '5-5')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainAcrossSessions
     * @tc.desc A second empty attempt after publishing a plain-text draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainAcrossSessions', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('normal english comment');
      board.publish('9');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('9');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('9');
      const scenarioTag: string = 'normal english comment' + ':' + 'stadium_guest' + '@' + '9' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '9')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithPaddedOnSeededBoard
     * @tc.desc The snapshot after three a space-padded publishes keeps the seed id prefix and reports the third body as the tail.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithPaddedOnSeededBoard', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['  leading and trailing  ', '结束。', '1234567890'];
      const tokens: Array<string> = ['id-001-7', 'id-001-7-b', 'id-001-7-c'];
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
      const scenarioTag: string = '  leading and trailing  ' + ':' + '夜班解说' + '@' + 'id-001-7' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-7')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithFullWidthSpaceAfterPublish
     * @tc.desc Cancelling a full-width-space draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithFullWidthSpaceAfterPublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('full-width\u3000space')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      const scenarioTag: string = 'full-width\u3000space' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'row_beta-8' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-8')).assertLarger(0);
      expect(scenarioTag.length > 39).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithPlainAfterInterrupt
     * @tc.desc A blank reply body against fixture row 3 using a plain-text context is rejected without changing the row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithPlainAfterInterrupt', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '@mention someone', 'uuid-like-0001');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('@mention someone');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.reply(target, target.id, target.user, '', 'blank-reply')).assertNull();
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '@mention someone' + ':' + '访客甲' + '@' + 'uuid-like-0001' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithPlainAfterInterrupt
     * @tc.desc Distinct seeds produce distinct canonical tokens whose first eight characters differ.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithPlainAfterInterrupt', 0, () => {
      const first: string = makeUuid(46);
      const second: string = makeUuid(53);
      expect(first.length).assertEqual(36);
      expect(isCanonicalUuid(first)).assertTrue();
      expect(isCanonicalUuid(second)).assertTrue();
      expect(first === second).assertFalse();
      expect(first.charAt(8).toString()).assertEqual('-');
      expect(first.charAt(13).toString()).assertEqual('-');
      expect(first.charAt(18).toString()).assertEqual('-');
      expect(first.charAt(23).toString()).assertEqual('-');
      expect(first.charAt(14).toString()).assertEqual('4');
      expect(first.substring(0, 8).length).assertEqual(8);
      expect(first.substring(19, 23).length).assertEqual(4);
      const third: string = makeUuid(59);
      expect(isCanonicalUuid(third)).assertTrue();
      expect(third === first).assertFalse();
      expect(first.substring(0, 8) === third.substring(0, 8)).assertFalse();
      const scenarioTag: string = 'back\\slash' + ':' + '看台第七排' + '@' + '记录-1-10' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-10')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithPlainDuringScroll
     * @tc.desc Publishing a plain-text draft is accepted because the rule only rejects the empty string, and the new row keeps the payload exactly.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithPlainDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('null')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('2-11') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('null');
      expect(board.comments[8].text.length).assertEqual(4);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      const scenarioTag: string = 'null' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '2-11' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '2-11')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithDigitsOnSeededBoard
     * @tc.desc Erasing a digit-only draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithDigitsOnSeededBoard', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.updateDraft('0')).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('empty-2')).assertNull();
      expect(distinctIdCount(board.comments)).assertEqual(8);
      const scenarioTag: string = '0' + ':' + '兔子不吃窝边草' + '@' + '5' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '5')).assertLarger(0);
      expect(scenarioTag.length > 9).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithCjkPunctuationInIdleState
     * @tc.desc Two drafts published from a CJK-punctuated draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithCjkPunctuationInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('主队控球率 58%，射门 14 次');
      board.publish('9-13');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('主队控球率 58%，射门 14 次');
      board.openComposer();
      board.updateDraft('percent 100%');
      board.publish('9-13-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('主队控球率 58%，射门 14 次');
      expect(board.byUser(curUser)[1].text).assertEqual('percent 100%');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + 'a' + '@' + '9-13' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '9-13')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithPlainOnLegacyDevice
     * @tc.desc Publishing a plain-text draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithPlainOnLegacyDevice', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 7, '守门员的三次扑救挽救了球队');
      expect(board.count).assertEqual(15);
      expect(board.publishCount).assertEqual(7);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(15);
      expect(board.byUser(curUser).length).assertEqual(7);
      expect(board.comments[board.count - 1].text).assertEqual('守门员的三次扑救挽救了球队');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-6');
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '太阳打北边出来了' + '@' + 'id-001-14' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-14')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithPlainOnSeededBoard
     * @tc.desc A script that types a plain-text draft before opening the composer refuses the typing and the second publish. Both premature publish attempts leave the seed state intact; typing after opening then publishes successfully.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithPlainOnSeededBoard', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['type:' + '角球战术演练得非常熟练', 'open', 'publish:' + 'row_beta', 'publish:' + 'row_beta-b'];
      expect(runScript(board, script)).assertEqual(1);
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.publishCount).assertEqual(0);
      expect(board.draft).assertEqual('');
      expect(board.publish('late')).assertNull();
      expect(board.updateDraft('角球战术演练得非常熟练')).assertTrue();
      expect(board.publish('row_beta') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.editing).assertFalse();
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].id).assertEqual('row_beta');
      expect(board.publish('late')).assertNull();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '小猫带耳机' + '@' + 'row_beta' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithAstralAfterReset
     * @tc.desc The fixture id projection skips id 6 and keeps id 5 at index 4 and id 7 at index 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithAstralAfterReset', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      expect(list.length).assertEqual(8);
      expect(EXPECTED_IDS.length).assertEqual(8);
      expect(list[0].id).assertEqual('1');
      expect(list[7].id).assertEqual('9');
      expect(distinctIdCount(list)).assertEqual(8);
      expect(joinIds(list)).assertEqual('1|2|3|4|5|7|8|9');
      expect(mockMatchesOracle(list)).assertTrue();
      expect(list[3].id).assertEqual('4');
      const ids: Array<string> = list.map((row: NewsCommentModel) => row.id);
      expect(ids.length).assertEqual(8);
      expect(ids.indexOf('6')).assertEqual(-1);
      expect(ids.indexOf('5')).assertEqual(4);
      expect(ids.indexOf('7')).assertEqual(5);
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + 'ＵＳＥＲ' + '@' + 'uuid-like-0001-16' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-16')).assertLarger(0);
      expect(scenarioTag.length > 42).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithSymbolHeavyWithStaleDraft
     * @tc.desc Publishing a symbol-heavy draft appends exactly one row at the tail while the eight seed rows keep their order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithSymbolHeavyWithStaleDraft', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('semi;colon;only;');
      const row: NewsCommentModel | null = board.publish('记录-1-17');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('semi;colon;only;');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const scenarioTag: string = 'semi;colon;only;' + ':' + '天要下雨娘要嫁人' + '@' + '记录-1-17' + '#' + 'PublishViewStateTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-17')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

  });
}
