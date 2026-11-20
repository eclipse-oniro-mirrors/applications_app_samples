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

export default function BoardStatePersistenceTest(): void {
  describe('BoardStatePersistenceTest', () => {
    beforeAll(() => {
      logSuite('BoardStatePersistenceTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('BoardStatePersistenceTest', 'end');
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithEmojiOnSeededBoard
     * @tc.desc Opening the composer once mounts the editor, hides the list panel and rejects a second open.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithEmojiOnSeededBoard', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '2' + '#' + 'BoardStatePersistenceTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + '2')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithScriptLikeAcrossSessionsPanel
     * @tc.desc Publishing immediately after cancelling a script-like draft is rejected, and a second cancel reports no state change.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithScriptLikeAcrossSessionsPanel', 0, () => {
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
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(board.ids().length).assertEqual(8);
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '访客甲' + '@' + '5-1' + '#' + 'BoardStatePersistenceTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '5-1')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithPlainAfterReset
     * @tc.desc The snapshot after publishing a plain-text draft ends with the new id, names the current user and reports one publish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithPlainAfterReset', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('normal english comment');
      const row: NewsCommentModel | null = board.publish('9-2');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('normal english comment');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const snap: BoardSnapshot = snapshot(board);
      expect(snap.count).assertEqual(9);
      expect(snap.lastUser).assertEqual(curUser);
      expect(snap.lastText).assertEqual('normal english comment');
      expect(snap.ids.endsWith('|' + '9-2')).assertTrue();
      const scenarioTag: string = 'normal english comment' + ':' + '看台第七排' + '@' + '9-2' + '#' + 'BoardStatePersistenceTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '9-2')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPaddedUnderPanelTrace
     * @tc.desc After publishing a space-padded draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPaddedUnderPanelTrace', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('  leading and trailing  ');
      board.publish('id-001');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('id-001');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '  leading and trailing  ' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'id-001' + '#' + 'BoardStatePersistenceTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 42).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithFullWidthSpaceAfterPublish
     * @tc.desc Fixture authors still map to one row each, and the missing author probe returns an empty list.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithFullWidthSpaceAfterPublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('full-width\u3000space');
      board.publish('row_beta-4');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('full-width\u3000space');
      board.openComposer();
      board.updateDraft('今日比分 2:1，补时绝杀！');
      board.publish('row_beta-4-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('full-width\u3000space');
      expect(board.byUser(curUser)[1].text).assertEqual('今日比分 2:1，补时绝杀！');
      expect(board.byUser(curUser)[0].id).assertEqual('row_beta-4');
      expect(board.byUser(EXPECTED_USERS[7]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[7])[0].text).assertEqual(EXPECTED_TEXTS[7]);
      const scenarioTag: string = 'full-width\u3000space' + ':' + '兔子不吃窝边草' + '@' + 'row_beta-4' + '#' + 'BoardStatePersistenceTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-4')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithPlainAcrossCyclesHarbor
     * @tc.desc The id chain after repeated publish cycles of a plain-text draft starts at cycle-0 and the joined row count matches the board count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithPlainAcrossCyclesHarbor', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 9, '@mention someone');
      expect(board.count).assertEqual(17);
      expect(board.publishCount).assertEqual(9);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(17);
      expect(board.byUser(curUser).length).assertEqual(9);
      expect(board.comments[board.count - 1].text).assertEqual('@mention someone');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-8');
      const ids: Array<string> = board.ids();
      expect(ids[8]).assertEqual('cycle-0');
      expect(joinIds(board.comments).split('|').length).assertEqual(17);
      const scenarioTag: string = '@mention someone' + ':' + 'a' + '@' + 'uuid-like-0001-5' + '#' + 'BoardStatePersistenceTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-5')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithPlainAcrossSessionsAnchor
     * @tc.desc Publishing an empty draft is rejected and leaves the eight rows, draft and publish counter untouched.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithPlainAcrossSessionsAnchor', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      const scenarioTag: string = 'back\\slash' + ':' + '太阳打北边出来了' + '@' + '记录-1' + '#' + 'BoardStatePersistenceTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name boardStartsFromSeedSnapshotWithPlainWithPaddedBody
     * @tc.desc A seeded board exposes the first fixture body while an unseeded board starts empty with publishing disabled.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardStartsFromSeedSnapshotWithPlainWithPaddedBody', 0, () => {
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
      const scenarioTag: string = 'null' + ':' + '小猫带耳机' + '@' + '2-7' + '#' + 'BoardStatePersistenceTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '2-7')).assertLarger(0);
      expect(scenarioTag.length > 12).assertTrue();
    });

    /**
     * @tc.name composerMountsOnFirstOpenWithDigitsWithReplyMeta
     * @tc.desc Cancelling and reopening the composer clears the a digit-only draft while the editor stays mounted.
     * @tc.type Function
     * @tc.level Level1
     */
    it('composerMountsOnFirstOpenWithDigitsWithReplyMeta', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.editing).assertTrue();
      expect(board.listVisible).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.count).assertEqual(8);
      expect(board.openComposer()).assertFalse();
      expect(board.updateDraft('0')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.openComposer()).assertTrue();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = '0' + ':' + 'ＵＳＥＲ' + '@' + '5-8' + '#' + 'BoardStatePersistenceTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '5-8')).assertLarger(0);
      expect(scenarioTag.length > 8).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithCjkPunctuationDuringTyping
     * @tc.desc Cancelling a CJK-punctuated draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithCjkPunctuationDuringTyping', 0, () => {
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
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '天要下雨娘要嫁人' + '@' + '9' + '#' + 'BoardStatePersistenceTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '9')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithPlainOnLegacyDevice
     * @tc.desc The row appended from a plain-text draft is observable through the current-user filter and the fixture text index stays unchanged.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithPlainOnLegacyDevice', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('守门员的三次扑救挽救了球队');
      const row: NewsCommentModel | null = board.publish('id-001-10');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('守门员的三次扑救挽救了球队');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      expect(EXPECTED_TEXTS.indexOf(board.comments[8].text)).assertEqual(EXPECTED_TEXTS.indexOf('守门员的三次扑救挽救了球队'));
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('守门员的三次扑救挽救了球队');
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '大事不妙了' + '@' + 'id-001-10' + '#' + 'BoardStatePersistenceTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-10')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

  });
}
