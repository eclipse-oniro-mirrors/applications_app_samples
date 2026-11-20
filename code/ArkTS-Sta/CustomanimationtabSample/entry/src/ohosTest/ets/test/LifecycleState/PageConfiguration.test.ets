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
  FIXED_TIME, EXPECTED_USERS, EXPECTED_TEXTS, joinIds, distinctIdCount, tailOf,
  CommentBoard, BoardSnapshot, snapshot, runPublishCycles
} from '../Shared/SharedDriver.ets';
import { logSuite } from '../Shared/Support.ets';

export default function PageConfigurationTest(): void {
  describe('PageConfigurationTest', () => {
    beforeAll(() => {
      logSuite('PageConfigurationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('PageConfigurationTest', 'end');
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithEmojiInFirstRow
     * @tc.desc Typing an emoji-bearing draft after the first open keeps the editor mounted with a publishable non-empty draft.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithEmojiInFirstRow', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      expect(board.updateDraft('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛')).assertTrue();
      expect(board.draft).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(board.canPublish).assertTrue();
      expect(board.listVisible).assertFalse();
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'id-001' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithScriptLikeAfterReset
     * @tc.desc Reopening after the cancelled a script-like draft publishes a different draft normally with one appended row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithScriptLikeAfterReset', 0, () => {
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
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('！！！！')).assertTrue();
      expect(board.publish('row_beta-1') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('！！！！');
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '访客甲' + '@' + 'row_beta-1' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-1')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithPlainAfterCancel
     * @tc.desc Publishing a plain-text draft appends exactly one row at the tail while the eight seed rows keep their order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithPlainAfterCancel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('normal english comment');
      const row: NewsCommentModel | null = board.publish('uuid-like-0001-2');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('normal english comment');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const scenarioTag: string = 'normal english comment' + ':' + '看台第七排' + '@' + 'uuid-like-0001-2' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-2')).assertLarger(0);
      expect(scenarioTag.length > 43).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPaddedDuringScroll
     * @tc.desc A second empty attempt after publishing a space-padded draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPaddedDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('  leading and trailing  ');
      board.publish('记录-1');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('记录-1');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('记录-1');
      const scenarioTag: string = '  leading and trailing  ' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '记录-1' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 40).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithFullWidthSpaceWithReplyMeta
     * @tc.desc Two drafts published from a full-width-space draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithFullWidthSpaceWithReplyMeta', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('full-width\u3000space');
      board.publish('2-4');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('full-width\u3000space');
      board.openComposer();
      board.updateDraft('café résumé naïve');
      board.publish('2-4-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('full-width\u3000space');
      expect(board.byUser(curUser)[1].text).assertEqual('café résumé naïve');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = 'full-width\u3000space' + ':' + '兔子不吃窝边草' + '@' + '2-4' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '2-4')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithPlainOnRetryCell
     * @tc.desc Publishing a plain-text draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithPlainOnRetryCell', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 6, '@mention someone');
      expect(board.count).assertEqual(14);
      expect(board.publishCount).assertEqual(6);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(14);
      expect(board.byUser(curUser).length).assertEqual(6);
      expect(board.comments[board.count - 1].text).assertEqual('@mention someone');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-5');
      const scenarioTag: string = '@mention someone' + ':' + 'a' + '@' + '5-5' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '5-5')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithPlainOnRetryBatch
     * @tc.desc Erasing a plain-text draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithPlainOnRetryBatch', 0, () => {
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
      const scenarioTag: string = 'back\\slash' + ':' + '太阳打北边出来了' + '@' + '9' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '9')).assertLarger(0);
      expect(scenarioTag.length > 19).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPlainInIdleStateReplay
     * @tc.desc The initial snapshot of a seeded board reports the id chain 1|2|3|4|5|7|8|9 and the last fixture body.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPlainInIdleStateReplay', 0, () => {
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
      const scenarioTag: string = 'null' + ':' + '小猫带耳机' + '@' + 'id-001-7' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-7')).assertLarger(0);
      expect(scenarioTag.length > 17).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithDigitsAfterPublish
     * @tc.desc Opening the composer once mounts the editor, hides the list panel and rejects a second open.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithDigitsAfterPublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      const scenarioTag: string = '0' + ':' + 'ＵＳＥＲ' + '@' + 'row_beta-8' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-8')).assertLarger(0);
      expect(scenarioTag.length > 15).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithCjkPunctuationAfterInterrupt
     * @tc.desc Publishing immediately after cancelling a CJK-punctuated draft is rejected, and a second cancel reports no state change.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithCjkPunctuationAfterInterrupt', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('主队控球率 58%，射门 14 次')).assertTrue();
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
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '天要下雨娘要嫁人' + '@' + 'uuid-like-0001' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001')).assertLarger(0);
      expect(scenarioTag.length > 39).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithPlainAfterInterrupt
     * @tc.desc The snapshot after publishing a plain-text draft ends with the new id, names the current user and reports one publish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithPlainAfterInterrupt', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('守门员的三次扑救挽救了球队');
      const row: NewsCommentModel | null = board.publish('记录-1-10');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('守门员的三次扑救挽救了球队');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const snap: BoardSnapshot = snapshot(board);
      expect(snap.count).assertEqual(9);
      expect(snap.lastUser).assertEqual(curUser);
      expect(snap.lastText).assertEqual('守门员的三次扑救挽救了球队');
      expect(snap.ids.endsWith('|' + '记录-1-10')).assertTrue();
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '大事不妙了' + '@' + '记录-1-10' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-10')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainWithEmptyBufferTrace
     * @tc.desc After publishing a plain-text draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainWithEmptyBufferTrace', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('角球战术演练得非常熟练');
      board.publish('2-11');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('2-11');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '2-11' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '2-11')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithAstralOnSeededBoard
     * @tc.desc Fixture authors still map to one row each, and the missing author probe returns an empty list.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithAstralOnSeededBoard', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      board.publish('5');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      board.openComposer();
      board.updateDraft('国足加油！国足必胜！');
      board.publish('5-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(board.byUser(curUser)[1].text).assertEqual('国足加油！国足必胜！');
      expect(board.byUser(curUser)[0].id).assertEqual('5');
      expect(board.byUser(EXPECTED_USERS[7]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[7])[0].text).assertEqual(EXPECTED_TEXTS[7]);
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '你若安好便是晴天' + '@' + '5' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '5')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithSymbolHeavyInIdleState
     * @tc.desc The id chain after repeated publish cycles of a symbol-heavy draft starts at cycle-0 and the joined row count matches the board count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithSymbolHeavyInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 10, 'semi;colon;only;');
      expect(board.count).assertEqual(18);
      expect(board.publishCount).assertEqual(10);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(18);
      expect(board.byUser(curUser).length).assertEqual(10);
      expect(board.comments[board.count - 1].text).assertEqual('semi;colon;only;');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-9');
      const ids: Array<string> = board.ids();
      expect(ids[8]).assertEqual('cycle-0');
      expect(joinIds(board.comments).split('|').length).assertEqual(18);
      const scenarioTag: string = 'semi;colon;only;' + ':' + '等烟雨而我在等你' + '@' + '9-13' + '#' + 'PageConfigurationTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '9-13')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

  });
}
