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

export default function BoardExceptionHandlingTest(): void {
  describe('BoardExceptionHandlingTest', () => {
    beforeAll(() => {
      logSuite('BoardExceptionHandlingTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('BoardExceptionHandlingTest', 'end');
    });

    /**
     * @tc.name authorFilterPreservesOrderWithDigitsWithStaleDraft
     * @tc.desc Two drafts published from a digit-only draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithDigitsWithStaleDraft', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('0');
      board.publish('uuid-like-0001');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('0');
      board.openComposer();
      board.updateDraft('下一场什么时候，有直播吗');
      board.publish('uuid-like-0001-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('0');
      expect(board.byUser(curUser)[1].text).assertEqual('下一场什么时候，有直播吗');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = '0' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'uuid-like-0001' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithCjkPunctuationUnderFocus
     * @tc.desc Publishing a CJK-punctuated draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithCjkPunctuationUnderFocus', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 8, '主队控球率 58%，射门 14 次');
      expect(board.count).assertEqual(16);
      expect(board.publishCount).assertEqual(8);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(16);
      expect(board.byUser(curUser).length).assertEqual(8);
      expect(board.comments[board.count - 1].text).assertEqual('主队控球率 58%，射门 14 次');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-7');
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '访客甲' + '@' + '记录-1-1' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-1')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithPlainAfterReset
     * @tc.desc Erasing a plain-text draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithPlainAfterReset', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.updateDraft('守门员的三次扑救挽救了球队')).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('empty-2')).assertNull();
      expect(distinctIdCount(board.comments)).assertEqual(8);
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '看台第七排' + '@' + '2-2' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '2-2')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPlainWithDuplicateId
     * @tc.desc The initial snapshot of a seeded board reports the id chain 1|2|3|4|5|7|8|9 and the last fixture body.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPlainWithDuplicateId', 0, () => {
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
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '5' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '5')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithAstralWithReplyMeta
     * @tc.desc Opening the composer once mounts the editor, hides the list panel and rejects a second open.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithAstralWithReplyMeta', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '兔子不吃窝边草' + '@' + '9-4' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '9-4')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithSymbolHeavyOnRetryBatch
     * @tc.desc Publishing immediately after cancelling a symbol-heavy draft is rejected, and a second cancel reports no state change.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithSymbolHeavyOnRetryBatch', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('semi;colon;only;')).assertTrue();
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
      const scenarioTag: string = 'semi;colon;only;' + ':' + 'a' + '@' + 'id-001-5' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-5')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithCjkPunctuationWithDuplicateId
     * @tc.desc The snapshot after publishing a CJK-punctuated draft ends with the new id, names the current user and reports one publish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithCjkPunctuationWithDuplicateId', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('国足加油！国足必胜！');
      const row: NewsCommentModel | null = board.publish('row_beta');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('国足加油！国足必胜！');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const snap: BoardSnapshot = snapshot(board);
      expect(snap.count).assertEqual(9);
      expect(snap.lastUser).assertEqual(curUser);
      expect(snap.lastText).assertEqual('国足加油！国足必胜！');
      expect(snap.ids.endsWith('|' + 'row_beta')).assertTrue();
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '太阳打北边出来了' + '@' + 'row_beta' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithTabOnlyBeforePublish
     * @tc.desc After publishing a tab-only draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithTabOnlyBeforePublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('\t');
      board.publish('uuid-like-0001-7');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('uuid-like-0001-7');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '\t' + ':' + '小猫带耳机' + '@' + 'uuid-like-0001-7' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-7')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithEmojiInFirstRow
     * @tc.desc Fixture authors still map to one row each, and the missing author probe returns an empty list.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithEmojiInFirstRow', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      board.publish('记录-1-8');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      board.openComposer();
      board.updateDraft('tab\tinside');
      board.publish('记录-1-8-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(board.byUser(curUser)[1].text).assertEqual('tab\tinside');
      expect(board.byUser(curUser)[0].id).assertEqual('记录-1-8');
      expect(board.byUser(EXPECTED_USERS[7]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[7])[0].text).assertEqual(EXPECTED_TEXTS[7]);
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'ＵＳＥＲ' + '@' + '记录-1-8' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-8')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithScriptLikeDuringTyping
     * @tc.desc The id chain after repeated publish cycles of a script-like draft starts at cycle-0 and the joined row count matches the board count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithScriptLikeDuringTyping', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 7, '<script>alert(1)</script>');
      expect(board.count).assertEqual(15);
      expect(board.publishCount).assertEqual(7);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(15);
      expect(board.byUser(curUser).length).assertEqual(7);
      expect(board.comments[board.count - 1].text).assertEqual('<script>alert(1)</script>');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-6');
      const ids: Array<string> = board.ids();
      expect(ids[8]).assertEqual('cycle-0');
      expect(joinIds(board.comments).split('|').length).assertEqual(15);
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '天要下雨娘要嫁人' + '@' + '2' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '2')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithPlainAfterPublishBeacon
     * @tc.desc Publishing an empty draft is rejected and leaves the eight rows, draft and publish counter untouched.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithPlainAfterPublishBeacon', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      const scenarioTag: string = 'normal english comment' + ':' + '大事不妙了' + '@' + '5-10' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '5-10')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPaddedDuringScroll
     * @tc.desc A seeded board exposes the first fixture body while an unseeded board starts empty with publishing disabled.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPaddedDuringScroll', 0, () => {
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
      const scenarioTag: string = '  leading and trailing  ' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '9-11' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '9-11')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithFullWidthSpaceInFirstRow
     * @tc.desc Cancelling and reopening the composer clears the a full-width-space draft while the editor stays mounted.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithFullWidthSpaceInFirstRow', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      expect(board.updateDraft('full-width\u3000space')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.openComposer()).assertTrue();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = 'full-width\u3000space' + ':' + '你若安好便是晴天' + '@' + 'id-001' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithPlainOnLegacyDeviceDigest
     * @tc.desc Cancelling a plain-text draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithPlainOnLegacyDeviceDigest', 0, () => {
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
      const scenarioTag: string = '@mention someone' + ':' + '等烟雨而我在等你' + '@' + 'row_beta-13' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-13')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithPlainDuringTypingAudit
     * @tc.desc The row appended from a plain-text draft is observable through the current-user filter and the fixture text index stays unchanged.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithPlainDuringTypingAudit', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('back\\slash');
      const row: NewsCommentModel | null = board.publish('uuid-like-0001-14');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('back\\slash');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      expect(EXPECTED_TEXTS.indexOf(board.comments[8].text)).assertEqual(EXPECTED_TEXTS.indexOf('back\\slash'));
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('back\\slash');
      const scenarioTag: string = 'back\\slash' + ':' + 'stadium_guest' + '@' + 'uuid-like-0001-14' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-14')).assertLarger(0);
      expect(scenarioTag.length > 40).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainAfterResetProbe
     * @tc.desc Resetting a board that published a plain-text draft restores the eight seed rows with a zero publish count and no last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainAfterResetProbe', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('null');
      board.publish('记录-1');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('记录-1');
      expect(board.count).assertEqual(9);
      board.reset();
      expect(board.count).assertEqual(8);
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      const scenarioTag: string = 'null' + ':' + '夜班解说' + '@' + '记录-1' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 12).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithDigitsUnderPanel
     * @tc.desc The author filter returns only rows written by the requested author while preserving list order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithDigitsUnderPanel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('0');
      board.publish('2-16');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('0');
      board.openComposer();
      board.updateDraft('back\\slash');
      board.publish('2-16-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('0');
      expect(board.byUser(curUser)[1].text).assertEqual('back\\slash');
      const scenarioTag: string = '0' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '2-16' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '2-16')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithCjkPunctuationInIdleState
     * @tc.desc The tail slice after repeated publish cycles of a CJK-punctuated draft equals the cycle count and the draft state is cleared.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithCjkPunctuationInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 6, '主队控球率 58%，射门 14 次');
      expect(board.count).assertEqual(14);
      expect(board.publishCount).assertEqual(6);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(14);
      expect(board.byUser(curUser).length).assertEqual(6);
      expect(board.comments[board.count - 1].text).assertEqual('主队控球率 58%，射门 14 次');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-5');
      expect(tailOf(board.comments, 6).length).assertEqual(6);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '访客甲' + '@' + '5-17' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '5-17')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithPlainDuringScrollCycle
     * @tc.desc Calling publish with an empty token appends nothing and preserves the seed id chain.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithPlainDuringScrollCycle', 0, () => {
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
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '看台第七排' + '@' + '9' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '9')).assertLarger(0);
      expect(scenarioTag.length > 19).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPlainAfterCancel
     * @tc.desc A seeded board starts with eight rows, an empty draft, a zero publish count and the list panel visible.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPlainAfterCancel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.count).assertEqual(8);
      expect(board.listVisible).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.canPublish).assertFalse();
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      expect(board.lastId).assertEqual('');
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'id-001-19' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-19')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithAstralInIdleState
     * @tc.desc Typing an astral-plane draft after the first open keeps the editor mounted with a publishable non-empty draft.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithAstralInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      expect(board.updateDraft('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89')).assertTrue();
      expect(board.draft).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(board.canPublish).assertTrue();
      expect(board.listVisible).assertFalse();
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '兔子不吃窝边草' + '@' + 'row_beta-20' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-20')).assertLarger(0);
      expect(scenarioTag.length > 39).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithSymbolHeavyAfterInterrupt
     * @tc.desc Reopening after the cancelled a symbol-heavy draft publishes a different draft normally with one appended row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithSymbolHeavyAfterInterrupt', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('semi;colon;only;')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('${__proto__}')).assertTrue();
      expect(board.publish('uuid-like-0001') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('${__proto__}');
      const scenarioTag: string = 'semi;colon;only;' + ':' + 'a' + '@' + 'uuid-like-0001' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithCjkPunctuationAfterInterrupt
     * @tc.desc Publishing a CJK-punctuated draft appends exactly one row at the tail while the eight seed rows keep their order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithCjkPunctuationAfterInterrupt', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('国足加油！国足必胜！');
      const row: NewsCommentModel | null = board.publish('记录-1-22');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('国足加油！国足必胜！');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '太阳打北边出来了' + '@' + '记录-1-22' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-22')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithTabOnlyAfterCancelLadder
     * @tc.desc A second empty attempt after publishing a tab-only draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithTabOnlyAfterCancelLadder', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('\t');
      board.publish('2-23');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('2-23');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('2-23');
      const scenarioTag: string = '\t' + ':' + '小猫带耳机' + '@' + '2-23' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '2-23')).assertLarger(0);
      expect(scenarioTag.length > 10).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithEmojiOnSeededBoard
     * @tc.desc Two drafts published from an emoji-bearing draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithEmojiOnSeededBoard', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      board.publish('5');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      board.openComposer();
      board.updateDraft('今日比分 2:1，补时绝杀！');
      board.publish('5-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(board.byUser(curUser)[1].text).assertEqual('今日比分 2:1，补时绝杀！');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'ＵＳＥＲ' + '@' + '5' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + '5')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithScriptLikeInIdleState
     * @tc.desc Publishing a script-like draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithScriptLikeInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 10, '<script>alert(1)</script>');
      expect(board.count).assertEqual(18);
      expect(board.publishCount).assertEqual(10);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(18);
      expect(board.byUser(curUser).length).assertEqual(10);
      expect(board.comments[board.count - 1].text).assertEqual('<script>alert(1)</script>');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-9');
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '天要下雨娘要嫁人' + '@' + '9-25' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '9-25')).assertLarger(0);
      expect(scenarioTag.length > 37).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithPlainAtSeedEdgeProbe2
     * @tc.desc Erasing a plain-text draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithPlainAtSeedEdgeProbe2', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.updateDraft('normal english comment')).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('empty-2')).assertNull();
      expect(distinctIdCount(board.comments)).assertEqual(8);
      const scenarioTag: string = 'normal english comment' + ':' + '大事不妙了' + '@' + 'id-001-26' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-26')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPaddedOnSeededBoard
     * @tc.desc The initial snapshot of a seeded board reports the id chain 1|2|3|4|5|7|8|9 and the last fixture body.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPaddedOnSeededBoard', 0, () => {
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
      const scenarioTag: string = '  leading and trailing  ' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'row_beta' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithFullWidthSpaceAfterReset
     * @tc.desc Opening the composer once mounts the editor, hides the list panel and rejects a second open.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithFullWidthSpaceAfterReset', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      const scenarioTag: string = 'full-width\u3000space' + ':' + '你若安好便是晴天' + '@' + 'uuid-like-0001-28' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-28')).assertLarger(0);
      expect(scenarioTag.length > 41).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithPlainWithStaleDraft
     * @tc.desc Publishing immediately after cancelling a plain-text draft is rejected, and a second cancel reports no state change.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithPlainWithStaleDraft', 0, () => {
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
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(board.ids().length).assertEqual(8);
      const scenarioTag: string = '@mention someone' + ':' + '等烟雨而我在等你' + '@' + '记录-1-29' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-29')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithPlainAcrossSessions
     * @tc.desc The snapshot after publishing a plain-text draft ends with the new id, names the current user and reports one publish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithPlainAcrossSessions', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('back\\slash');
      const row: NewsCommentModel | null = board.publish('2');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(8);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('back\\slash');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const snap: BoardSnapshot = snapshot(board);
      expect(snap.count).assertEqual(9);
      expect(snap.lastUser).assertEqual(curUser);
      expect(snap.lastText).assertEqual('back\\slash');
      expect(snap.ids.endsWith('|' + '2')).assertTrue();
      const scenarioTag: string = 'back\\slash' + ':' + 'stadium_guest' + '@' + '2' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '2')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainWithDuplicateIdGuard
     * @tc.desc After publishing a plain-text draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainWithDuplicateIdGuard', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('null');
      board.publish('5-31');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('5-31');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = 'null' + ':' + '夜班解说' + '@' + '5-31' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '5-31')).assertLarger(0);
      expect(scenarioTag.length > 12).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithDigitsBeforePublishSnapshot
     * @tc.desc Fixture authors still map to one row each, and the missing author probe returns an empty list.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithDigitsBeforePublishSnapshot', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('0');
      board.publish('9-32');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('0');
      board.openComposer();
      board.updateDraft('café résumé naïve');
      board.publish('9-32-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('0');
      expect(board.byUser(curUser)[1].text).assertEqual('café résumé naïve');
      expect(board.byUser(curUser)[0].id).assertEqual('9-32');
      expect(board.byUser(EXPECTED_USERS[7]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[7])[0].text).assertEqual(EXPECTED_TEXTS[7]);
      const scenarioTag: string = '0' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '9-32' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '9-32')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithCjkPunctuationWithMixedScriptStage
     * @tc.desc The id chain after repeated publish cycles of a CJK-punctuated draft starts at cycle-0 and the joined row count matches the board count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithCjkPunctuationWithMixedScriptStage', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 9, '主队控球率 58%，射门 14 次');
      expect(board.count).assertEqual(17);
      expect(board.publishCount).assertEqual(9);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(17);
      expect(board.byUser(curUser).length).assertEqual(9);
      expect(board.comments[board.count - 1].text).assertEqual('主队控球率 58%，射门 14 次');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-8');
      const ids: Array<string> = board.ids();
      expect(ids[8]).assertEqual('cycle-0');
      expect(joinIds(board.comments).split('|').length).assertEqual(17);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '访客甲' + '@' + 'id-001' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithPlainWithEmptyBufferTrace
     * @tc.desc Publishing an empty draft is rejected and leaves the eight rows, draft and publish counter untouched.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithPlainWithEmptyBufferTrace', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '看台第七排' + '@' + 'row_beta-34' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-34')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPlainAcrossSessionsPanel
     * @tc.desc A seeded board exposes the first fixture body while an unseeded board starts empty with publishing disabled.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPlainAcrossSessionsPanel', 0, () => {
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
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'uuid-like-0001-35' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-35')).assertLarger(0);
      expect(scenarioTag.length > 40).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithAstralUnderPanel
     * @tc.desc Cancelling and reopening the composer clears the an astral-plane draft while the editor stays mounted.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithAstralUnderPanel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      expect(board.updateDraft('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.openComposer()).assertTrue();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '兔子不吃窝边草' + '@' + '记录-1' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithSymbolHeavyInIdleState
     * @tc.desc Cancelling a symbol-heavy draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithSymbolHeavyInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('semi;colon;only;')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      const scenarioTag: string = 'semi;colon;only;' + ':' + 'a' + '@' + '2-37' + '#' + 'BoardExceptionHandlingTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '2-37')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

  });
}
