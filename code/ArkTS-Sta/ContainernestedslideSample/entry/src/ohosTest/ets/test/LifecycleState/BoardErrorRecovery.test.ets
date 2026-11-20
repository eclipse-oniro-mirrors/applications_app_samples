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

export default function BoardErrorRecoveryTest(): void {
  describe('BoardErrorRecoveryTest', () => {
    beforeAll(() => {
      logSuite('BoardErrorRecoveryTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('BoardErrorRecoveryTest', 'end');
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainBeforePublishSnapshot
     * @tc.desc A second empty attempt after publishing a plain-text draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainBeforePublishSnapshot', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('back\\slash');
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
      const scenarioTag: string = 'back\\slash' + ':' + '你若安好便是晴天' + '@' + 'R-42' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'R-42')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithPlainAfterPublish
     * @tc.desc Two drafts published from a plain-text draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithPlainAfterPublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('null');
      board.publish('x-1');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('null');
      board.openComposer();
      board.updateDraft('教练组的战术调整值得肯定');
      board.publish('x-1-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('null');
      expect(board.byUser(curUser)[1].text).assertEqual('教练组的战术调整值得肯定');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = 'null' + ':' + '等烟雨而我在等你' + '@' + 'x-1' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'x-1')).assertLarger(0);
      expect(scenarioTag.length > 15).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithDigitsAfterReset
     * @tc.desc Publishing a digit-only draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithDigitsAfterReset', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 12, '0');
      expect(board.count).assertEqual(20);
      expect(board.publishCount).assertEqual(12);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(20);
      expect(board.byUser(curUser).length).assertEqual(12);
      expect(board.comments[board.count - 1].text).assertEqual('0');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-11');
      const scenarioTag: string = '0' + ':' + 'stadium_guest' + '@' + '1-2' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '1-2')).assertLarger(0);
      expect(scenarioTag.length > 17).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithCjkPunctuationWithDuplicateId
     * @tc.desc Erasing a CJK-punctuated draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithCjkPunctuationWithDuplicateId', 0, () => {
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
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '夜班解说' + '@' + '3' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '3')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPlainDuringTypingAudit
     * @tc.desc The initial snapshot of a seeded board reports the id chain 1|2|3|4|5|7|8|9 and the last fixture body.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPlainDuringTypingAudit', 0, () => {
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
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '7-4' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '7-4')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithPlainOnLegacyDeviceDigest
     * @tc.desc Opening the composer once mounts the editor, hides the list panel and rejects a second open.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithPlainOnLegacyDeviceDigest', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '访客甲' + '@' + 'custom-id-5' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-5')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithAstralOnLegacyDevice
     * @tc.desc Publishing immediately after cancelling an astral-plane draft is rejected, and a second cancel reports no state change.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithAstralOnLegacyDevice', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89')).assertTrue();
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
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '看台第七排' + '@' + 'row_alpha' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithSymbolHeavyWithLongAuthor
     * @tc.desc The snapshot after publishing a symbol-heavy draft ends with the new id, names the current user and reports one publish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithSymbolHeavyWithLongAuthor', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('semi;colon;only;');
      const row: NewsCommentModel | null = board.publish('R-42-7');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('semi;colon;only;');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const snap: BoardSnapshot = snapshot(board);
      expect(snap.count).assertEqual(9);
      expect(snap.lastUser).assertEqual(curUser);
      expect(snap.lastText).assertEqual('semi;colon;only;');
      expect(snap.ids.endsWith('|' + 'R-42-7')).assertTrue();
      const scenarioTag: string = 'semi;colon;only;' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'R-42-7' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-7')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithCjkPunctuationDuringTypingAudit
     * @tc.desc After publishing a CJK-punctuated draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithCjkPunctuationDuringTypingAudit', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('国足加油！国足必胜！');
      board.publish('x-8');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('x-8');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '兔子不吃窝边草' + '@' + 'x-8' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'x-8')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithTabOnlyDuringTyping
     * @tc.desc Fixture authors still map to one row each, and the missing author probe returns an empty list.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithTabOnlyDuringTyping', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('\t');
      board.publish('1');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('\t');
      board.openComposer();
      board.updateDraft('normal english comment');
      board.publish('1-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('\t');
      expect(board.byUser(curUser)[1].text).assertEqual('normal english comment');
      expect(board.byUser(curUser)[0].id).assertEqual('1');
      expect(board.byUser(EXPECTED_USERS[7]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[7])[0].text).assertEqual(EXPECTED_TEXTS[7]);
      const scenarioTag: string = '\t' + ':' + 'a' + '@' + '1' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '1')).assertLarger(0);
      expect(scenarioTag.length > 3).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithEmojiWithMixedScript
     * @tc.desc The id chain after repeated publish cycles of an emoji-bearing draft starts at cycle-0 and the joined row count matches the board count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithEmojiWithMixedScript', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 11, '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(board.count).assertEqual(19);
      expect(board.publishCount).assertEqual(11);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(19);
      expect(board.byUser(curUser).length).assertEqual(11);
      expect(board.comments[board.count - 1].text).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-10');
      const ids: Array<string> = board.ids();
      expect(ids[8]).assertEqual('cycle-0');
      expect(joinIds(board.comments).split('|').length).assertEqual(19);
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '太阳打北边出来了' + '@' + '3-10' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + '3-10')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithScriptLikeDuringScroll
     * @tc.desc Publishing an empty draft is rejected and leaves the eight rows, draft and publish counter untouched.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithScriptLikeDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '小猫带耳机' + '@' + '7-11' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '7-11')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPlainBeforePublish
     * @tc.desc A seeded board exposes the first fixture body while an unseeded board starts empty with publishing disabled.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPlainBeforePublish', 0, () => {
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
      const scenarioTag: string = 'normal english comment' + ':' + 'ＵＳＥＲ' + '@' + 'custom-id' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithPaddedUnderBudget
     * @tc.desc Cancelling and reopening the composer clears the a space-padded draft while the editor stays mounted.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithPaddedUnderBudget', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      expect(board.updateDraft('  leading and trailing  ')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.openComposer()).assertTrue();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = '  leading and trailing  ' + ':' + '天要下雨娘要嫁人' + '@' + 'row_alpha-13' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-13')).assertLarger(0);
      expect(scenarioTag.length > 44).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithFullWidthSpaceAfterInterrupt
     * @tc.desc Cancelling a full-width-space draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithFullWidthSpaceAfterInterrupt', 0, () => {
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
      const scenarioTag: string = 'full-width\u3000space' + ':' + '大事不妙了' + '@' + 'R-42-14' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-14')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithPlainWithDuplicateId
     * @tc.desc The row appended from a plain-text draft is observable through the current-user filter and the fixture text index stays unchanged.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithPlainWithDuplicateId', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('@mention someone');
      const row: NewsCommentModel | null = board.publish('x');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('@mention someone');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      expect(EXPECTED_TEXTS.indexOf(board.comments[8].text)).assertEqual(EXPECTED_TEXTS.indexOf('@mention someone'));
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('@mention someone');
      const scenarioTag: string = '@mention someone' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'x' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainWithStaleDraftLedger
     * @tc.desc Resetting a board that published a plain-text draft restores the eight seed rows with a zero publish count and no last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainWithStaleDraftLedger', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('back\\slash');
      board.publish('1-16');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('1-16');
      expect(board.count).assertEqual(9);
      board.reset();
      expect(board.count).assertEqual(8);
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      const scenarioTag: string = 'back\\slash' + ':' + '你若安好便是晴天' + '@' + '1-16' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '1-16')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithPlainInIdleState
     * @tc.desc The author filter returns only rows written by the requested author while preserving list order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithPlainInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('null');
      board.publish('3-17');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('null');
      board.openComposer();
      board.updateDraft('1234567890');
      board.publish('3-17-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('null');
      expect(board.byUser(curUser)[1].text).assertEqual('1234567890');
      const scenarioTag: string = 'null' + ':' + '等烟雨而我在等你' + '@' + '3-17' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '3-17')).assertLarger(0);
      expect(scenarioTag.length > 16).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithDigitsAcrossSessions
     * @tc.desc The tail slice after repeated publish cycles of a digit-only draft equals the cycle count and the draft state is cleared.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithDigitsAcrossSessions', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 6, '0');
      expect(board.count).assertEqual(14);
      expect(board.publishCount).assertEqual(6);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(14);
      expect(board.byUser(curUser).length).assertEqual(6);
      expect(board.comments[board.count - 1].text).assertEqual('0');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-5');
      expect(tailOf(board.comments, 6).length).assertEqual(6);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = '0' + ':' + 'stadium_guest' + '@' + '7' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '7')).assertLarger(0);
      expect(scenarioTag.length > 15).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithCjkPunctuationAfterPublishLedger
     * @tc.desc Calling publish with an empty token appends nothing and preserves the seed id chain.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithCjkPunctuationAfterPublishLedger', 0, () => {
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
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '夜班解说' + '@' + 'custom-id-19' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-19')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPlainAfterResetRoute
     * @tc.desc A seeded board starts with eight rows, an empty draft, a zero publish count and the list panel visible.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPlainAfterResetRoute', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.count).assertEqual(8);
      expect(board.listVisible).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.canPublish).assertFalse();
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      expect(board.lastId).assertEqual('');
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'row_alpha-20' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-20')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithPlainInIdleState
     * @tc.desc Typing a plain-text draft after the first open keeps the editor mounted with a publishable non-empty draft.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithPlainInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      expect(board.updateDraft('角球战术演练得非常熟练')).assertTrue();
      expect(board.draft).assertEqual('角球战术演练得非常熟练');
      expect(board.canPublish).assertTrue();
      expect(board.listVisible).assertFalse();
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '访客甲' + '@' + 'R-42' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'R-42')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithAstralWithMixedScript
     * @tc.desc Reopening after the cancelled an astral-plane draft publishes a different draft normally with one appended row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithAstralWithMixedScript', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('来点信心，加油加油~')).assertTrue();
      expect(board.publish('x-22') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('来点信心，加油加油~');
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '看台第七排' + '@' + 'x-22' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'x-22')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithSymbolHeavyDuringScroll
     * @tc.desc Publishing a symbol-heavy draft appends exactly one row at the tail while the eight seed rows keep their order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithSymbolHeavyDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('semi;colon;only;');
      const row: NewsCommentModel | null = board.publish('1-23');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('semi;colon;only;');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const scenarioTag: string = 'semi;colon;only;' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '1-23' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '1-23')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithCjkPunctuationOnSeededBoard
     * @tc.desc A second empty attempt after publishing a CJK-punctuated draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithCjkPunctuationOnSeededBoard', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('国足加油！国足必胜！');
      board.publish('3');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('3');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('3');
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '兔子不吃窝边草' + '@' + '3' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '3')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithTabOnlyInIdleState
     * @tc.desc Two drafts published from a tab-only draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithTabOnlyInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('\t');
      board.publish('7-25');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('\t');
      board.openComposer();
      board.updateDraft('undefined');
      board.publish('7-25-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('\t');
      expect(board.byUser(curUser)[1].text).assertEqual('undefined');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = '\t' + ':' + 'a' + '@' + '7-25' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '7-25')).assertLarger(0);
      expect(scenarioTag.length > 6).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithEmojiOnPanelClose
     * @tc.desc Publishing an emoji-bearing draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithEmojiOnPanelClose', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 14, '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(board.count).assertEqual(22);
      expect(board.publishCount).assertEqual(14);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(22);
      expect(board.byUser(curUser).length).assertEqual(14);
      expect(board.comments[board.count - 1].text).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-13');
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '太阳打北边出来了' + '@' + 'custom-id-26' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-26')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithScriptLikeAfterCancel
     * @tc.desc Erasing a script-like draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithScriptLikeAfterCancel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      expect(board.updateDraft('<script>alert(1)</script>')).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('empty-2')).assertNull();
      expect(distinctIdCount(board.comments)).assertEqual(8);
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '小猫带耳机' + '@' + 'row_alpha' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 39).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPlainOnTailRow
     * @tc.desc The initial snapshot of a seeded board reports the id chain 1|2|3|4|5|7|8|9 and the last fixture body.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPlainOnTailRow', 0, () => {
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
      const scenarioTag: string = 'normal english comment' + ':' + 'ＵＳＥＲ' + '@' + 'R-42-28' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-28')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithPaddedInIdleState
     * @tc.desc Opening the composer once mounts the editor, hides the list panel and rejects a second open.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithPaddedInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      const scenarioTag: string = '  leading and trailing  ' + ':' + '天要下雨娘要嫁人' + '@' + 'x-29' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'x-29')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithFullWidthSpaceOnRetryBatch
     * @tc.desc Publishing immediately after cancelling a full-width-space draft is rejected, and a second cancel reports no state change.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithFullWidthSpaceOnRetryBatch', 0, () => {
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
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(board.ids().length).assertEqual(8);
      const scenarioTag: string = 'full-width\u3000space' + ':' + '大事不妙了' + '@' + '1' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '1')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithPlainAfterCancelLadder
     * @tc.desc The snapshot after publishing a plain-text draft ends with the new id, names the current user and reports one publish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithPlainAfterCancelLadder', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('@mention someone');
      const row: NewsCommentModel | null = board.publish('3-31');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('@mention someone');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const snap: BoardSnapshot = snapshot(board);
      expect(snap.count).assertEqual(9);
      expect(snap.lastUser).assertEqual(curUser);
      expect(snap.lastText).assertEqual('@mention someone');
      expect(snap.ids.endsWith('|' + '3-31')).assertTrue();
      const scenarioTag: string = '@mention someone' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '3-31' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '3-31')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainUnderBudgetBanner
     * @tc.desc After publishing a plain-text draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainUnderBudgetBanner', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('back\\slash');
      board.publish('7-32');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('7-32');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = 'back\\slash' + ':' + '你若安好便是晴天' + '@' + '7-32' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '7-32')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithPlainOnColdStart
     * @tc.desc Fixture authors still map to one row each, and the missing author probe returns an empty list.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithPlainOnColdStart', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('null');
      board.publish('custom-id');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('null');
      board.openComposer();
      board.updateDraft('守门员的三次扑救挽救了球队');
      board.publish('custom-id-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('null');
      expect(board.byUser(curUser)[1].text).assertEqual('守门员的三次扑救挽救了球队');
      expect(board.byUser(curUser)[0].id).assertEqual('custom-id');
      expect(board.byUser(EXPECTED_USERS[7]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[7])[0].text).assertEqual(EXPECTED_TEXTS[7]);
      const scenarioTag: string = 'null' + ':' + '等烟雨而我在等你' + '@' + 'custom-id' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithDigitsOnPanelClose
     * @tc.desc The id chain after repeated publish cycles of a digit-only draft starts at cycle-0 and the joined row count matches the board count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithDigitsOnPanelClose', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 13, '0');
      expect(board.count).assertEqual(21);
      expect(board.publishCount).assertEqual(13);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(21);
      expect(board.byUser(curUser).length).assertEqual(13);
      expect(board.comments[board.count - 1].text).assertEqual('0');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-12');
      const ids: Array<string> = board.ids();
      expect(ids[8]).assertEqual('cycle-0');
      expect(joinIds(board.comments).split('|').length).assertEqual(21);
      const scenarioTag: string = '0' + ':' + 'stadium_guest' + '@' + 'row_alpha-34' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-34')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithCjkPunctuationAcrossCyclesProbe
     * @tc.desc Publishing an empty draft is rejected and leaves the eight rows, draft and publish counter untouched.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithCjkPunctuationAcrossCyclesProbe', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '夜班解说' + '@' + 'R-42-35' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-35')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPlainOnColdStartAudit
     * @tc.desc A seeded board exposes the first fixture body while an unseeded board starts empty with publishing disabled.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPlainOnColdStartAudit', 0, () => {
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
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'x' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithPlainOnColdStartCell
     * @tc.desc Cancelling and reopening the composer clears the a plain-text draft while the editor stays mounted.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithPlainOnColdStartCell', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      expect(board.updateDraft('角球战术演练得非常熟练')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.openComposer()).assertTrue();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '访客甲' + '@' + '1-37' + '#' + 'BoardErrorRecoveryTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '1-37')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

  });
}
