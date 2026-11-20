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

export default function CommentModelDeepTest(): void {
  describe('CommentModelDeepTest', () => {
    beforeAll(() => {
      logSuite('CommentModelDeepTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CommentModelDeepTest', 'end');
    });

    /**
     * @tc.name fixtureExposesEightRowsWithFullWidthSpaceWithStaleDraft
     * @tc.desc The fixture id projection skips id 6 and keeps id 5 at index 4 and id 7 at index 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithFullWidthSpaceWithStaleDraft', 0, () => {
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
      const scenarioTag: string = 'full-width\u3000space' + ':' + 'ＵＳＥＲ' + '@' + 'uuid-like-0001' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithPlainUnderFocus
     * @tc.desc Publishing a plain-text draft appends exactly one row at the tail while the eight seed rows keep their order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithPlainUnderFocus', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('@mention someone');
      const row: NewsCommentModel | null = board.publish('记录-1-1');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('@mention someone');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const scenarioTag: string = '@mention someone' + ':' + '天要下雨娘要嫁人' + '@' + '记录-1-1' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-1')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainAfterReset
     * @tc.desc A second empty attempt after publishing a plain-text draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainAfterReset', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('back\\slash');
      board.publish('2-2');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('2-2');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('2-2');
      const scenarioTag: string = 'back\\slash' + ':' + '大事不妙了' + '@' + '2-2' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '2-2')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithPlainWithDuplicateId
     * @tc.desc The snapshot after three a plain-text publishes keeps the seed id prefix and reports the third body as the tail.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithPlainWithDuplicateId', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['null', 'slash//double', '守门员的三次扑救挽救了球队'];
      const tokens: Array<string> = ['5', '5-b', '5-c'];
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
      const snap: BoardSnapshot = snapshot(board);
      expect(snap.count).assertEqual(11);
      expect(snap.publishCount).assertEqual(3);
      expect(snap.ids.startsWith('1|2|3|4|5|7|8|9|')).assertTrue();
      expect(snap.lastText).assertEqual(texts[2]);
      const scenarioTag: string = 'null' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '5' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '5')).assertLarger(0);
      expect(scenarioTag.length > 11).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithDigitsWithReplyMeta
     * @tc.desc Cancelling a digit-only draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithDigitsWithReplyMeta', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('0')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      const scenarioTag: string = '0' + ':' + '你若安好便是晴天' + '@' + '9-4' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '9-4')).assertLarger(0);
      expect(scenarioTag.length > 12).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithCjkPunctuationAcrossSessions
     * @tc.desc A blank reply body against fixture row 3 using a CJK-punctuated context is rejected without changing the row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithCjkPunctuationAcrossSessions', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '主队控球率 58%，射门 14 次', 'id-001-5');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('主队控球率 58%，射门 14 次');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.reply(target, target.id, target.user, '', 'blank-reply')).assertNull();
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '等烟雨而我在等你' + '@' + 'id-001-5' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-5')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithPlainWithLongAuthorAnchor
     * @tc.desc Distinct seeds produce distinct canonical tokens whose first eight characters differ.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithPlainWithLongAuthorAnchor', 0, () => {
      const first: string = makeUuid(30);
      const second: string = makeUuid(37);
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
      const third: string = makeUuid(43);
      expect(isCanonicalUuid(third)).assertTrue();
      expect(third === first).assertFalse();
      expect(first.substring(0, 8) === third.substring(0, 8)).assertFalse();
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'stadium_guest' + '@' + 'row_beta' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithPlainWithStaleDraftSlot
     * @tc.desc Publishing a plain-text draft is accepted because the rule only rejects the empty string, and the new row keeps the payload exactly.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithPlainWithStaleDraftSlot', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('角球战术演练得非常熟练')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('uuid-like-0001-7') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('角球战术演练得非常熟练');
      expect(board.comments[8].text.length).assertEqual(11);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '夜班解说' + '@' + 'uuid-like-0001-7' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-7')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithAstralInIdleStateBanner
     * @tc.desc Erasing an astral-plane draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithAstralInIdleStateBanner', 0, () => {
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
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '记录-1-8' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-8')).assertLarger(0);
      expect(scenarioTag.length > 40).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithSymbolHeavyDuringTyping
     * @tc.desc Two drafts published from a symbol-heavy draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithSymbolHeavyDuringTyping', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('semi;colon;only;');
      board.publish('2');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('semi;colon;only;');
      board.openComposer();
      board.updateDraft('Ω≈ç√∫˜µ≤≥÷');
      board.publish('2-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('semi;colon;only;');
      expect(board.byUser(curUser)[1].text).assertEqual('Ω≈ç√∫˜µ≤≥÷');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = 'semi;colon;only;' + ':' + '访客甲' + '@' + '2' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '2')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithCjkPunctuationWithMixedScript
     * @tc.desc Publishing a CJK-punctuated draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithCjkPunctuationWithMixedScript', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 13, '国足加油！国足必胜！');
      expect(board.count).assertEqual(21);
      expect(board.publishCount).assertEqual(13);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(21);
      expect(board.byUser(curUser).length).assertEqual(13);
      expect(board.comments[board.count - 1].text).assertEqual('国足加油！国足必胜！');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-12');
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '看台第七排' + '@' + '5-10' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '5-10')).assertLarger(0);
      expect(scenarioTag.length > 19).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithTabOnlyAfterCancelLadder
     * @tc.desc A script that types a tab-only draft before opening the composer refuses the typing and the second publish. Both premature publish attempts leave the seed state intact; typing after opening then publishes successfully.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithTabOnlyAfterCancelLadder', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['type:' + '\t', 'open', 'publish:' + '9-11', 'publish:' + '9-11-b'];
      expect(runScript(board, script)).assertEqual(1);
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.publishCount).assertEqual(0);
      expect(board.draft).assertEqual('');
      expect(board.publish('late')).assertNull();
      expect(board.updateDraft('\t')).assertTrue();
      expect(board.publish('9-11') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.editing).assertFalse();
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].id).assertEqual('9-11');
      expect(board.publish('late')).assertNull();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '\t' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '9-11' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '9-11')).assertLarger(0);
      expect(scenarioTag.length > 17).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithEmojiInFirstRow
     * @tc.desc The fixture id projection skips id 6 and keeps id 5 at index 4 and id 7 at index 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithEmojiInFirstRow', 0, () => {
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
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '兔子不吃窝边草' + '@' + 'id-001' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithScriptLikeWithMixedScript
     * @tc.desc Publishing a script-like draft appends exactly one row at the tail while the eight seed rows keep their order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithScriptLikeWithMixedScript', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('<script>alert(1)</script>');
      const row: NewsCommentModel | null = board.publish('row_beta-13');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('<script>alert(1)</script>');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + 'a' + '@' + 'row_beta-13' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-13')).assertLarger(0);
      expect(scenarioTag.length > 37).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainWithReplyMeta
     * @tc.desc A second empty attempt after publishing a plain-text draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainWithReplyMeta', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('normal english comment');
      board.publish('uuid-like-0001-14');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('uuid-like-0001-14');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('uuid-like-0001-14');
      const scenarioTag: string = 'normal english comment' + ':' + '太阳打北边出来了' + '@' + 'uuid-like-0001-14' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-14')).assertLarger(0);
      expect(scenarioTag.length > 47).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithPaddedDuringScroll
     * @tc.desc The snapshot after three a space-padded publishes keeps the seed id prefix and reports the third body as the tail.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithPaddedDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['  leading and trailing  ', '这场比赛的裁判判罚存在争议', '国足加油！国足必胜！'];
      const tokens: Array<string> = ['记录-1', '记录-1-b', '记录-1-c'];
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
      const scenarioTag: string = '  leading and trailing  ' + ':' + '小猫带耳机' + '@' + '记录-1' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithFullWidthSpaceUnderPanel
     * @tc.desc Cancelling a full-width-space draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithFullWidthSpaceUnderPanel', 0, () => {
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
      const scenarioTag: string = 'full-width\u3000space' + ':' + 'ＵＳＥＲ' + '@' + '2-16' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '2-16')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithPlainOnColdStartCell
     * @tc.desc A blank reply body against fixture row 3 using a plain-text context is rejected without changing the row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithPlainOnColdStartCell', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '@mention someone', '5-17');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('@mention someone');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.reply(target, target.id, target.user, '', 'blank-reply')).assertNull();
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '@mention someone' + ':' + '天要下雨娘要嫁人' + '@' + '5-17' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '5-17')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithPlainAcrossSessions
     * @tc.desc Distinct seeds produce distinct canonical tokens whose first eight characters differ.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithPlainAcrossSessions', 0, () => {
      const first: string = makeUuid(42);
      const second: string = makeUuid(49);
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
      const third: string = makeUuid(55);
      expect(isCanonicalUuid(third)).assertTrue();
      expect(third === first).assertFalse();
      expect(first.substring(0, 8) === third.substring(0, 8)).assertFalse();
      const scenarioTag: string = 'back\\slash' + ':' + '大事不妙了' + '@' + '9' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '9')).assertLarger(0);
      expect(scenarioTag.length > 16).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithPlainAfterCancel
     * @tc.desc Publishing a plain-text draft is accepted because the rule only rejects the empty string, and the new row keeps the payload exactly.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithPlainAfterCancel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('null')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('id-001-19') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('null');
      expect(board.comments[8].text.length).assertEqual(4);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      const scenarioTag: string = 'null' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'id-001-19' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-19')).assertLarger(0);
      expect(scenarioTag.length > 19).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithDigitsInIdleState
     * @tc.desc Erasing a digit-only draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithDigitsInIdleState', 0, () => {
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
      const scenarioTag: string = '0' + ':' + '你若安好便是晴天' + '@' + 'row_beta-20' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-20')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithCjkPunctuationAfterInterrupt
     * @tc.desc Two drafts published from a CJK-punctuated draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithCjkPunctuationAfterInterrupt', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('主队控球率 58%，射门 14 次');
      board.publish('uuid-like-0001');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('主队控球率 58%，射门 14 次');
      board.openComposer();
      board.updateDraft('true');
      board.publish('uuid-like-0001-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('主队控球率 58%，射门 14 次');
      expect(board.byUser(curUser)[1].text).assertEqual('true');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '等烟雨而我在等你' + '@' + 'uuid-like-0001' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001')).assertLarger(0);
      expect(scenarioTag.length > 39).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithPlainAfterInterrupt
     * @tc.desc Publishing a plain-text draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithPlainAfterInterrupt', 0, () => {
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
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'stadium_guest' + '@' + '记录-1-22' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-22')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithPlainDuringScroll
     * @tc.desc A script that types a plain-text draft before opening the composer refuses the typing and the second publish. Both premature publish attempts leave the seed state intact; typing after opening then publishes successfully.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithPlainDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['type:' + '角球战术演练得非常熟练', 'open', 'publish:' + '2-23', 'publish:' + '2-23-b'];
      expect(runScript(board, script)).assertEqual(1);
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.publishCount).assertEqual(0);
      expect(board.draft).assertEqual('');
      expect(board.publish('late')).assertNull();
      expect(board.updateDraft('角球战术演练得非常熟练')).assertTrue();
      expect(board.publish('2-23') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.editing).assertFalse();
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].id).assertEqual('2-23');
      expect(board.publish('late')).assertNull();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '夜班解说' + '@' + '2-23' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '2-23')).assertLarger(0);
      expect(scenarioTag.length > 19).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithAstralOnSeededBoard
     * @tc.desc The fixture id projection skips id 6 and keeps id 5 at index 4 and id 7 at index 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithAstralOnSeededBoard', 0, () => {
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
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '5' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '5')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithSymbolHeavyInIdleState
     * @tc.desc Publishing a symbol-heavy draft appends exactly one row at the tail while the eight seed rows keep their order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithSymbolHeavyInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('semi;colon;only;');
      const row: NewsCommentModel | null = board.publish('9-25');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('semi;colon;only;');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const scenarioTag: string = 'semi;colon;only;' + ':' + '访客甲' + '@' + '9-25' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '9-25')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithCjkPunctuationOnLegacyDevice
     * @tc.desc A second empty attempt after publishing a CJK-punctuated draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithCjkPunctuationOnLegacyDevice', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('国足加油！国足必胜！');
      board.publish('id-001-26');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('id-001-26');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('id-001-26');
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '看台第七排' + '@' + 'id-001-26' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-26')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithTabOnlyOnSeededBoard
     * @tc.desc The snapshot after three a tab-only publishes keeps the seed id prefix and reports the third body as the tail.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithTabOnlyOnSeededBoard', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['\t', 'quote "double" and "single"', 'normal english comment'];
      const tokens: Array<string> = ['row_beta', 'row_beta-b', 'row_beta-c'];
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
      const scenarioTag: string = '\t' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'row_beta' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithEmojiAfterReset
     * @tc.desc Cancelling an emoji-bearing draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithEmojiAfterReset', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '兔子不吃窝边草' + '@' + 'uuid-like-0001-28' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-28')).assertLarger(0);
      expect(scenarioTag.length > 37).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithScriptLikeWithStaleDraft
     * @tc.desc A blank reply body against fixture row 3 using a script-like context is rejected without changing the row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithScriptLikeWithStaleDraft', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '<script>alert(1)</script>', '记录-1-29');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('<script>alert(1)</script>');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.reply(target, target.id, target.user, '', 'blank-reply')).assertNull();
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + 'a' + '@' + '记录-1-29' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-29')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithPlainOnRetryBatch
     * @tc.desc Distinct seeds produce distinct canonical tokens whose first eight characters differ.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithPlainOnRetryBatch', 0, () => {
      const first: string = makeUuid(14);
      const second: string = makeUuid(21);
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
      const third: string = makeUuid(27);
      expect(isCanonicalUuid(third)).assertTrue();
      expect(third === first).assertFalse();
      expect(first.substring(0, 8) === third.substring(0, 8)).assertFalse();
      const scenarioTag: string = 'normal english comment' + ':' + '太阳打北边出来了' + '@' + '2' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '2')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithPaddedDuringScroll
     * @tc.desc Publishing a space-padded draft is accepted because the rule only rejects the empty string, and the new row keeps the payload exactly.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithPaddedDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('  leading and trailing  ')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('5-31') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('  leading and trailing  ');
      expect(board.comments[8].text.length).assertEqual(24);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      const scenarioTag: string = '  leading and trailing  ' + ':' + '小猫带耳机' + '@' + '5-31' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '5-31')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithFullWidthSpaceUnderPanel
     * @tc.desc Erasing a full-width-space draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithFullWidthSpaceUnderPanel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.updateDraft('full-width\u3000space')).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('empty-2')).assertNull();
      expect(distinctIdCount(board.comments)).assertEqual(8);
      const scenarioTag: string = 'full-width\u3000space' + ':' + 'ＵＳＥＲ' + '@' + '9-32' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '9-32')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithPlainUnderFocus
     * @tc.desc Two drafts published from a plain-text draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithPlainUnderFocus', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('@mention someone');
      board.publish('id-001');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('@mention someone');
      board.openComposer();
      board.updateDraft('zero\u200Bwidth');
      board.publish('id-001-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('@mention someone');
      expect(board.byUser(curUser)[1].text).assertEqual('zero\u200Bwidth');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = '@mention someone' + ':' + '天要下雨娘要嫁人' + '@' + 'id-001' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithPlainDuringScroll
     * @tc.desc Publishing a plain-text draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithPlainDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 6, 'back\\slash');
      expect(board.count).assertEqual(14);
      expect(board.publishCount).assertEqual(6);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(14);
      expect(board.byUser(curUser).length).assertEqual(6);
      expect(board.comments[board.count - 1].text).assertEqual('back\\slash');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-5');
      const scenarioTag: string = 'back\\slash' + ':' + '大事不妙了' + '@' + 'row_beta-34' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-34')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithPlainAfterPublish
     * @tc.desc A script that types a plain-text draft before opening the composer refuses the typing and the second publish. Both premature publish attempts leave the seed state intact; typing after opening then publishes successfully.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithPlainAfterPublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['type:' + 'null', 'open', 'publish:' + 'uuid-like-0001-35', 'publish:' + 'uuid-like-0001-35-b'];
      expect(runScript(board, script)).assertEqual(1);
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.publishCount).assertEqual(0);
      expect(board.draft).assertEqual('');
      expect(board.publish('late')).assertNull();
      expect(board.updateDraft('null')).assertTrue();
      expect(board.publish('uuid-like-0001-35') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.editing).assertFalse();
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].id).assertEqual('uuid-like-0001-35');
      expect(board.publish('late')).assertNull();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = 'null' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'uuid-like-0001-35' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-35')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithDigitsUnderPanel
     * @tc.desc The fixture id projection skips id 6 and keeps id 5 at index 4 and id 7 at index 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithDigitsUnderPanel', 0, () => {
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
      const scenarioTag: string = '0' + ':' + '你若安好便是晴天' + '@' + '记录-1' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 13).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithCjkPunctuationOnColdStartCell
     * @tc.desc Publishing a CJK-punctuated draft appends exactly one row at the tail while the eight seed rows keep their order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithCjkPunctuationOnColdStartCell', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('主队控球率 58%，射门 14 次');
      const row: NewsCommentModel | null = board.publish('2-37');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('主队控球率 58%，射门 14 次');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '等烟雨而我在等你' + '@' + '2-37' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '2-37')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainWithMixedScript
     * @tc.desc A second empty attempt after publishing a plain-text draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainWithMixedScript', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('守门员的三次扑救挽救了球队');
      board.publish('5-38');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('5-38');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('5-38');
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'stadium_guest' + '@' + '5-38' + '#' + 'CommentModelDeepTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '5-38')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

  });
}
