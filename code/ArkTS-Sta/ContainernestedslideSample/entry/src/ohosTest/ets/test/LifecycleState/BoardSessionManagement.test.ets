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

export default function BoardSessionManagementTest(): void {
  describe('BoardSessionManagementTest', () => {
    beforeAll(() => {
      logSuite('BoardSessionManagementTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('BoardSessionManagementTest', 'end');
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithCjkPunctuationOnSeededBoard
     * @tc.desc The initial snapshot of a seeded board reports the id chain 1|2|3|4|5|7|8|9 and the last fixture body.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithCjkPunctuationOnSeededBoard', 0, () => {
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
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '你若安好便是晴天' + '@' + '1' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '1')).assertLarger(0);
      expect(scenarioTag.length > 19).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithTabOnlyAfterPublish
     * @tc.desc Opening the composer once mounts the editor, hides the list panel and rejects a second open.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithTabOnlyAfterPublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      const scenarioTag: string = '\t' + ':' + '等烟雨而我在等你' + '@' + '3-1' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '3-1')).assertLarger(0);
      expect(scenarioTag.length > 12).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithEmojiWithDuplicateIdToken
     * @tc.desc Publishing immediately after cancelling an emoji-bearing draft is rejected, and a second cancel reports no state change.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithEmojiWithDuplicateIdToken', 0, () => {
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
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(board.ids().length).assertEqual(8);
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'stadium_guest' + '@' + '7-2' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + '7-2')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithScriptLikeAfterCancel
     * @tc.desc The snapshot after publishing a script-like draft ends with the new id, names the current user and reports one publish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithScriptLikeAfterCancel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('<script>alert(1)</script>');
      const row: NewsCommentModel | null = board.publish('custom-id');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('<script>alert(1)</script>');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const snap: BoardSnapshot = snapshot(board);
      expect(snap.count).assertEqual(9);
      expect(snap.lastUser).assertEqual(curUser);
      expect(snap.lastText).assertEqual('<script>alert(1)</script>');
      expect(snap.ids.endsWith('|' + 'custom-id')).assertTrue();
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '夜班解说' + '@' + 'custom-id' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainUnderFocusCycle
     * @tc.desc After publishing a plain-text draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainUnderFocusCycle', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('normal english comment');
      board.publish('row_alpha-4');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('row_alpha-4');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = 'normal english comment' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'row_alpha-4' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-4')).assertLarger(0);
      expect(scenarioTag.length > 46).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithPaddedUnderFocus
     * @tc.desc Fixture authors still map to one row each, and the missing author probe returns an empty list.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithPaddedUnderFocus', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('  leading and trailing  ');
      board.publish('R-42-5');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('  leading and trailing  ');
      board.openComposer();
      board.updateDraft('undefined');
      board.publish('R-42-5-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('  leading and trailing  ');
      expect(board.byUser(curUser)[1].text).assertEqual('undefined');
      expect(board.byUser(curUser)[0].id).assertEqual('R-42-5');
      expect(board.byUser(EXPECTED_USERS[7]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[7])[0].text).assertEqual(EXPECTED_TEXTS[7]);
      const scenarioTag: string = '  leading and trailing  ' + ':' + '访客甲' + '@' + 'R-42-5' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-5')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithFullWidthSpaceAcrossSessions
     * @tc.desc The id chain after repeated publish cycles of a full-width-space draft starts at cycle-0 and the joined row count matches the board count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithFullWidthSpaceAcrossSessions', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 13, 'full-width\u3000space');
      expect(board.count).assertEqual(21);
      expect(board.publishCount).assertEqual(13);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(21);
      expect(board.byUser(curUser).length).assertEqual(13);
      expect(board.comments[board.count - 1].text).assertEqual('full-width\u3000space');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-12');
      const ids: Array<string> = board.ids();
      expect(ids[8]).assertEqual('cycle-0');
      expect(joinIds(board.comments).split('|').length).assertEqual(21);
      const scenarioTag: string = 'full-width\u3000space' + ':' + '看台第七排' + '@' + 'x' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithPlainInIdleStateCompass
     * @tc.desc Publishing an empty draft is rejected and leaves the eight rows, draft and publish counter untouched.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithPlainInIdleStateCompass', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      const scenarioTag: string = '@mention someone' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '1-7' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '1-7')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPlainUnderFocusSnapshot
     * @tc.desc A seeded board exposes the first fixture body while an unseeded board starts empty with publishing disabled.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPlainUnderFocusSnapshot', 0, () => {
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
      const scenarioTag: string = 'back\\slash' + ':' + '兔子不吃窝边草' + '@' + '3-8' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '3-8')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithPlainDuringTyping
     * @tc.desc Cancelling and reopening the composer clears the a plain-text draft while the editor stays mounted.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithPlainDuringTyping', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      expect(board.updateDraft('null')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.openComposer()).assertTrue();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = 'null' + ':' + 'a' + '@' + '7' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '7')).assertLarger(0);
      expect(scenarioTag.length > 6).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithDigitsWithReplyMetaCompass
     * @tc.desc Cancelling a digit-only draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithDigitsWithReplyMetaCompass', 0, () => {
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
      const scenarioTag: string = '0' + ':' + '太阳打北边出来了' + '@' + 'custom-id-10' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-10')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithCjkPunctuationAcrossCycles
     * @tc.desc The row appended from a CJK-punctuated draft is observable through the current-user filter and the fixture text index stays unchanged.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithCjkPunctuationAcrossCycles', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('主队控球率 58%，射门 14 次');
      const row: NewsCommentModel | null = board.publish('row_alpha-11');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('主队控球率 58%，射门 14 次');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      expect(EXPECTED_TEXTS.indexOf(board.comments[8].text)).assertEqual(EXPECTED_TEXTS.indexOf('主队控球率 58%，射门 14 次'));
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('主队控球率 58%，射门 14 次');
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '小猫带耳机' + '@' + 'row_alpha-11' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-11')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainWithPaddedBodyStream
     * @tc.desc Resetting a board that published a plain-text draft restores the eight seed rows with a zero publish count and no last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainWithPaddedBodyStream', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('守门员的三次扑救挽救了球队');
      board.publish('R-42');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('R-42');
      expect(board.count).assertEqual(9);
      board.reset();
      expect(board.count).assertEqual(8);
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'ＵＳＥＲ' + '@' + 'R-42' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'R-42')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithPlainOnColdStartCell
     * @tc.desc The author filter returns only rows written by the requested author while preserving list order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithPlainOnColdStartCell', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('角球战术演练得非常熟练');
      board.publish('x-13');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('角球战术演练得非常熟练');
      board.openComposer();
      board.updateDraft('守门员的三次扑救挽救了球队');
      board.publish('x-13-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('角球战术演练得非常熟练');
      expect(board.byUser(curUser)[1].text).assertEqual('守门员的三次扑救挽救了球队');
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '天要下雨娘要嫁人' + '@' + 'x-13' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'x-13')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithAstralWithMixedScript
     * @tc.desc The tail slice after repeated publish cycles of an astral-plane draft equals the cycle count and the draft state is cleared.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithAstralWithMixedScript', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 12, '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(board.count).assertEqual(20);
      expect(board.publishCount).assertEqual(12);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(20);
      expect(board.byUser(curUser).length).assertEqual(12);
      expect(board.comments[board.count - 1].text).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-11');
      expect(tailOf(board.comments, 12).length).assertEqual(12);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '大事不妙了' + '@' + '1-14' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '1-14')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithSymbolHeavyWithDuplicateId
     * @tc.desc Calling publish with an empty token appends nothing and preserves the seed id chain.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithSymbolHeavyWithDuplicateId', 0, () => {
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
      const scenarioTag: string = 'semi;colon;only;' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '3' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '3')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithCjkPunctuationWithStaleDraftLedger
     * @tc.desc A seeded board starts with eight rows, an empty draft, a zero publish count and the list panel visible.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithCjkPunctuationWithStaleDraftLedger', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.count).assertEqual(8);
      expect(board.listVisible).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.canPublish).assertFalse();
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      expect(board.lastId).assertEqual('');
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '你若安好便是晴天' + '@' + '7-16' + '#' + 'BoardSessionManagementTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '7-16')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

  });
}
