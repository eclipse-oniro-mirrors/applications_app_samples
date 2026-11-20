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

export default function PublishInputInteractionTest(): void {
  describe('PublishInputInteractionTest', () => {
    beforeAll(() => {
      logSuite('PublishInputInteractionTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('PublishInputInteractionTest', 'end');
    });

    /**
     * @tc.name authorFilterPreservesOrderWithCjkPunctuationBeforePublish
     * @tc.desc Two drafts published from a CJK-punctuated draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithCjkPunctuationBeforePublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('国足加油！国足必胜！');
      board.publish('row_alpha');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('国足加油！国足必胜！');
      board.openComposer();
      board.updateDraft('Ω≈ç√∫˜µ≤≥÷');
      board.publish('row_alpha-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('国足加油！国足必胜！');
      expect(board.byUser(curUser)[1].text).assertEqual('Ω≈ç√∫˜µ≤≥÷');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '你若安好便是晴天' + '@' + 'row_alpha' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithTabOnlyUnderFocus
     * @tc.desc Publishing a tab-only draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithTabOnlyUnderFocus', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 13, '\t');
      expect(board.count).assertEqual(21);
      expect(board.publishCount).assertEqual(13);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(21);
      expect(board.byUser(curUser).length).assertEqual(13);
      expect(board.comments[board.count - 1].text).assertEqual('\t');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-12');
      const scenarioTag: string = '\t' + ':' + '等烟雨而我在等你' + '@' + 'R-42-1' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-1')).assertLarger(0);
      expect(scenarioTag.length > 15).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithEmojiAfterReset
     * @tc.desc A script that types an emoji-bearing draft before opening the composer refuses the typing and the second publish. Both premature publish attempts leave the seed state intact; typing after opening then publishes successfully.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithEmojiAfterReset', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['type:' + '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛', 'open', 'publish:' + 'x-2', 'publish:' + 'x-2-b'];
      expect(runScript(board, script)).assertEqual(1);
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.publishCount).assertEqual(0);
      expect(board.draft).assertEqual('');
      expect(board.publish('late')).assertNull();
      expect(board.updateDraft('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛')).assertTrue();
      expect(board.publish('x-2') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.editing).assertFalse();
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].id).assertEqual('x-2');
      expect(board.publish('late')).assertNull();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'stadium_guest' + '@' + 'x-2' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'x-2')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithScriptLikeWithDuplicateId
     * @tc.desc The fixture id projection skips id 6 and keeps id 5 at index 4 and id 7 at index 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithScriptLikeWithDuplicateId', 0, () => {
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
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '夜班解说' + '@' + '1' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '1')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithPlainWithReplyMeta
     * @tc.desc Publishing a plain-text draft appends exactly one row at the tail while the eight seed rows keep their order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithPlainWithReplyMeta', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('normal english comment');
      const row: NewsCommentModel | null = board.publish('3-4');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('normal english comment');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const scenarioTag: string = 'normal english comment' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '3-4' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '3-4')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPaddedAfterPublish
     * @tc.desc A second empty attempt after publishing a space-padded draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPaddedAfterPublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('  leading and trailing  ');
      board.publish('7-5');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('7-5');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('7-5');
      const scenarioTag: string = '  leading and trailing  ' + ':' + '访客甲' + '@' + '7-5' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '7-5')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithFullWidthSpaceOnLegacyDevice
     * @tc.desc The snapshot after three a full-width-space publishes keeps the seed id prefix and reports the third body as the tail.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithFullWidthSpaceOnLegacyDevice', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['full-width\u3000space', '这场比赛的裁判判罚存在争议', 'back\\slash'];
      const tokens: Array<string> = ['custom-id', 'custom-id-b', 'custom-id-c'];
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
      const scenarioTag: string = 'full-width\u3000space' + ':' + '看台第七排' + '@' + 'custom-id' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithPlainUnderPanel
     * @tc.desc Cancelling a plain-text draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithPlainUnderPanel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('@mention someone')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      const scenarioTag: string = '@mention someone' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'row_alpha-7' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-7')).assertLarger(0);
      expect(scenarioTag.length > 39).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithPlainInFirstRow
     * @tc.desc A blank reply body against fixture row 3 using a plain-text context is rejected without changing the row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithPlainInFirstRow', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, 'back\\slash', 'R-42-8');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('back\\slash');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.reply(target, target.id, target.user, '', 'blank-reply')).assertNull();
      expect(board.count).assertEqual(9);
      const scenarioTag: string = 'back\\slash' + ':' + '兔子不吃窝边草' + '@' + 'R-42-8' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-8')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithPlainDuringTyping
     * @tc.desc Distinct seeds produce distinct canonical tokens whose first eight characters differ.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithPlainDuringTyping', 0, () => {
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
      const scenarioTag: string = 'null' + ':' + 'a' + '@' + 'x' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 6).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithDigitsWithMixedScript
     * @tc.desc Publishing a digit-only draft is accepted because the rule only rejects the empty string, and the new row keeps the payload exactly.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithDigitsWithMixedScript', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('0')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('1-10') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('0');
      expect(board.comments[8].text.length).assertEqual(1);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      const scenarioTag: string = '0' + ':' + '太阳打北边出来了' + '@' + '1-10' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '1-10')).assertLarger(0);
      expect(scenarioTag.length > 13).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithCjkPunctuationAfterCancelLadder
     * @tc.desc Erasing a CJK-punctuated draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithCjkPunctuationAfterCancelLadder', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.updateDraft('主队控球率 58%，射门 14 次')).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('empty-2')).assertNull();
      expect(distinctIdCount(board.comments)).assertEqual(8);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '小猫带耳机' + '@' + '3-11' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '3-11')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithPlainOnSeededBoard
     * @tc.desc Two drafts published from a plain-text draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithPlainOnSeededBoard', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('守门员的三次扑救挽救了球队');
      board.publish('7');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('守门员的三次扑救挽救了球队');
      board.openComposer();
      board.updateDraft('true');
      board.publish('7-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('守门员的三次扑救挽救了球队');
      expect(board.byUser(curUser)[1].text).assertEqual('true');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'ＵＳＥＲ' + '@' + '7' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '7')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithPlainUnderBudget
     * @tc.desc Publishing a plain-text draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithPlainUnderBudget', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 7, '角球战术演练得非常熟练');
      expect(board.count).assertEqual(15);
      expect(board.publishCount).assertEqual(7);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(15);
      expect(board.byUser(curUser).length).assertEqual(7);
      expect(board.comments[board.count - 1].text).assertEqual('角球战术演练得非常熟练');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-6');
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '天要下雨娘要嫁人' + '@' + 'custom-id-13' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-13')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithAstralOnPanelClose
     * @tc.desc A script that types an astral-plane draft before opening the composer refuses the typing and the second publish. Both premature publish attempts leave the seed state intact; typing after opening then publishes successfully.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithAstralOnPanelClose', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['type:' + '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89', 'open', 'publish:' + 'row_alpha-14', 'publish:' + 'row_alpha-14-b'];
      expect(runScript(board, script)).assertEqual(1);
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.publishCount).assertEqual(0);
      expect(board.draft).assertEqual('');
      expect(board.publish('late')).assertNull();
      expect(board.updateDraft('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89')).assertTrue();
      expect(board.publish('row_alpha-14') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.editing).assertFalse();
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].id).assertEqual('row_alpha-14');
      expect(board.publish('late')).assertNull();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '大事不妙了' + '@' + 'row_alpha-14' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-14')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithSymbolHeavyDuringScroll
     * @tc.desc The fixture id projection skips id 6 and keeps id 5 at index 4 and id 7 at index 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithSymbolHeavyDuringScroll', 0, () => {
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
      const scenarioTag: string = 'semi;colon;only;' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'R-42' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'R-42')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithCjkPunctuationUnderPanel
     * @tc.desc Publishing a CJK-punctuated draft appends exactly one row at the tail while the eight seed rows keep their order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithCjkPunctuationUnderPanel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('国足加油！国足必胜！');
      const row: NewsCommentModel | null = board.publish('x-16');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('国足加油！国足必胜！');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '你若安好便是晴天' + '@' + 'x-16' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'x-16')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithTabOnlyInIdleState
     * @tc.desc A second empty attempt after publishing a tab-only draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithTabOnlyInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('\t');
      board.publish('1-17');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('1-17');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('1-17');
      const scenarioTag: string = '\t' + ':' + '等烟雨而我在等你' + '@' + '1-17' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '1-17')).assertLarger(0);
      expect(scenarioTag.length > 13).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithEmojiAcrossSessions
     * @tc.desc The snapshot after three an emoji-bearing publishes keeps the seed id prefix and reports the third body as the tail.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithEmojiAcrossSessions', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛', 'quote "double" and "single"', '守门员的三次扑救挽救了球队'];
      const tokens: Array<string> = ['3', '3-b', '3-c'];
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
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'stadium_guest' + '@' + '3' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + '3')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithScriptLikeAfterCancelLadder
     * @tc.desc Cancelling a script-like draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithScriptLikeAfterCancelLadder', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('<script>alert(1)</script>')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '夜班解说' + '@' + '7-19' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '7-19')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithPlainWithEmptyBuffer
     * @tc.desc A blank reply body against fixture row 3 using a plain-text context is rejected without changing the row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithPlainWithEmptyBuffer', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, 'normal english comment', 'custom-id-20');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('normal english comment');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.reply(target, target.id, target.user, '', 'blank-reply')).assertNull();
      expect(board.count).assertEqual(9);
      const scenarioTag: string = 'normal english comment' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'custom-id-20' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-20')).assertLarger(0);
      expect(scenarioTag.length > 47).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithPaddedOnColdStart
     * @tc.desc Distinct seeds produce distinct canonical tokens whose first eight characters differ.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithPaddedOnColdStart', 0, () => {
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
      const scenarioTag: string = '  leading and trailing  ' + ':' + '访客甲' + '@' + 'row_alpha' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithFullWidthSpaceAfterInterrupt
     * @tc.desc Publishing a full-width-space draft is accepted because the rule only rejects the empty string, and the new row keeps the payload exactly.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithFullWidthSpaceAfterInterrupt', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('full-width\u3000space')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('R-42-22') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('full-width\u3000space');
      expect(board.comments[8].text.length).assertEqual(16);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      const scenarioTag: string = 'full-width\u3000space' + ':' + '看台第七排' + '@' + 'R-42-22' + '#' + 'PublishInputInteractionTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-22')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

  });
}
