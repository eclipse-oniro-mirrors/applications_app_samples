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
import { logSuite , codePointCount, hasSurrogatePair} from '../Shared/Support.ets';

export default function WorkloadBudgetTest(): void {
  describe('WorkloadBudgetTest', () => {
    beforeAll(() => {
      logSuite('WorkloadBudgetTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('WorkloadBudgetTest', 'end');
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithCjkPunctuationUnderBudgetPanel
     * @tc.desc Splitting a CJK-punctuated draft into UTF-16 units agrees with its length while a single emoji contributes two units and one code point.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithCjkPunctuationUnderBudgetPanel', 0, () => {
      const text: string = '国足加油！国足必胜！';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('你若安好便是晴天') <= '你若安好便是晴天'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('你若安好便是晴天')).assertEqual(false);
      expect(text.split('').length).assertEqual(text.length);
      expect(codePointCount('😀')).assertEqual(1);
      expect('😀'.length).assertEqual(2);
      expect(hasSurrogatePair('😀')).assertTrue();
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '你若安好便是晴天' + '@' + 'row_alpha' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithTabOnlyUnderFocus
     * @tc.desc Two drafts published from a tab-only draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithTabOnlyUnderFocus', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('\t');
      board.publish('R-42-1');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('\t');
      board.openComposer();
      board.updateDraft('café résumé naïve');
      board.publish('R-42-1-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('\t');
      expect(board.byUser(curUser)[1].text).assertEqual('café résumé naïve');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = '\t' + ':' + '等烟雨而我在等你' + '@' + 'R-42-1' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-1')).assertLarger(0);
      expect(scenarioTag.length > 15).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithEmojiAfterReset
     * @tc.desc Publishing an emoji-bearing draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithEmojiAfterReset', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 7, '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(board.count).assertEqual(15);
      expect(board.publishCount).assertEqual(7);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(15);
      expect(board.byUser(curUser).length).assertEqual(7);
      expect(board.comments[board.count - 1].text).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-6');
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'stadium_guest' + '@' + 'x-2' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'x-2')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithScriptLikeUnderPanelProbe2
     * @tc.desc A second empty attempt after publishing a script-like draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithScriptLikeUnderPanelProbe2', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('<script>alert(1)</script>');
      board.publish('1');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('1');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('1');
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '夜班解说' + '@' + '1' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '1')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithPlainDuringTypingAudit
     * @tc.desc The snapshot after three a plain-text publishes keeps the seed id prefix and reports the third body as the tail.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithPlainDuringTypingAudit', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['normal english comment', 'Mixed 中文 and English 123', '球迷在雨中唱完了整首队歌'];
      const tokens: Array<string> = ['3-4', '3-4-b', '3-4-c'];
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
      const scenarioTag: string = 'normal english comment' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '3-4' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '3-4')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithPaddedAfterPublish
     * @tc.desc Counting code points in a space-padded draft never exceeds its UTF-16 length and equals it only when no surrogate pair exists.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithPaddedAfterPublish', 0, () => {
      const text: string = '  leading and trailing  ';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('访客甲') <= '访客甲'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('访客甲')).assertEqual(false);
      const scenarioTag: string = '  leading and trailing  ' + ':' + '访客甲' + '@' + '7-5' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '7-5')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithFullWidthSpaceOnLegacyDevice
     * @tc.desc Fixture authors still map to one row each, and the missing author probe returns an empty list.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithFullWidthSpaceOnLegacyDevice', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('full-width\u3000space');
      board.publish('custom-id');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('full-width\u3000space');
      board.openComposer();
      board.updateDraft('null');
      board.publish('custom-id-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('full-width\u3000space');
      expect(board.byUser(curUser)[1].text).assertEqual('null');
      expect(board.byUser(curUser)[0].id).assertEqual('custom-id');
      expect(board.byUser(EXPECTED_USERS[7]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[7])[0].text).assertEqual(EXPECTED_TEXTS[7]);
      const scenarioTag: string = 'full-width\u3000space' + ':' + '看台第七排' + '@' + 'custom-id' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithPlainWithStaleDraftLedger
     * @tc.desc The id chain after repeated publish cycles of a plain-text draft starts at cycle-0 and the joined row count matches the board count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithPlainWithStaleDraftLedger', 0, () => {
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
      const scenarioTag: string = '@mention someone' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'row_alpha-7' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-7')).assertLarger(0);
      expect(scenarioTag.length > 39).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainInFirstRow
     * @tc.desc After publishing a plain-text draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainInFirstRow', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('back\\slash');
      board.publish('R-42-8');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('R-42-8');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = 'back\\slash' + ':' + '兔子不吃窝边草' + '@' + 'R-42-8' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-8')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithPlainDuringTyping
     * @tc.desc The author filter returns the three rows published from a plain-text drafts in publish order after the seed rows.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithPlainDuringTyping', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['null', '国足加油！国足必胜！', '来点信心，加油加油~'];
      const tokens: Array<string> = ['x', 'x-b', 'x-c'];
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
      const scenarioTag: string = 'null' + ':' + 'a' + '@' + 'x' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 6).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithDigitsAcrossCyclesMarker
     * @tc.desc Code-point probes on empty text and two CJK characters return zero and two respectively.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithDigitsAcrossCyclesMarker', 0, () => {
      const text: string = '0';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('太阳打北边出来了') <= '太阳打北边出来了'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('太阳打北边出来了')).assertEqual(false);
      expect(codePointCount('')).assertEqual(0);
      expect(codePointCount('中文')).assertEqual(2);
      expect(text.length === 0).assertEqual(points === 0);
      const scenarioTag: string = '0' + ':' + '太阳打北边出来了' + '@' + '1-10' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '1-10')).assertLarger(0);
      expect(scenarioTag.length > 13).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithCjkPunctuationDuringScroll
     * @tc.desc The author filter returns only rows written by the requested author while preserving list order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithCjkPunctuationDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('主队控球率 58%，射门 14 次');
      board.publish('3-11');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('主队控球率 58%，射门 14 次');
      board.openComposer();
      board.updateDraft('line1\nline2');
      board.publish('3-11-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('主队控球率 58%，射门 14 次');
      expect(board.byUser(curUser)[1].text).assertEqual('line1\nline2');
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '小猫带耳机' + '@' + '3-11' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '3-11')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithPlainInIdleStateReplay
     * @tc.desc The tail slice after repeated publish cycles of a plain-text draft equals the cycle count and the draft state is cleared.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithPlainInIdleStateReplay', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 6, '守门员的三次扑救挽救了球队');
      expect(board.count).assertEqual(14);
      expect(board.publishCount).assertEqual(6);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(14);
      expect(board.byUser(curUser).length).assertEqual(6);
      expect(board.comments[board.count - 1].text).assertEqual('守门员的三次扑救挽救了球队');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-5');
      expect(tailOf(board.comments, 6).length).assertEqual(6);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'ＵＳＥＲ' + '@' + '7' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '7')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainUnderBudget
     * @tc.desc Resetting a board that published a plain-text draft restores the eight seed rows with a zero publish count and no last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainUnderBudget', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('角球战术演练得非常熟练');
      board.publish('custom-id-13');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('custom-id-13');
      expect(board.count).assertEqual(9);
      board.reset();
      expect(board.count).assertEqual(8);
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '天要下雨娘要嫁人' + '@' + 'custom-id-13' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-13')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithAstralOnPanelClose
     * @tc.desc Three consecutive publishes of an astral-plane drafts append in order while the counter rises from one to three.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithAstralOnPanelClose', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89', '这场比赛的裁判判罚存在争议', 'back\\slash'];
      const tokens: Array<string> = ['row_alpha-14', 'row_alpha-14-b', 'row_alpha-14-c'];
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
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '大事不妙了' + '@' + 'row_alpha-14' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-14')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithSymbolHeavyDuringScroll
     * @tc.desc Splitting a symbol-heavy draft into UTF-16 units agrees with its length while a single emoji contributes two units and one code point.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithSymbolHeavyDuringScroll', 0, () => {
      const text: string = 'semi;colon;only;';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('用户\uD83D\uDE00\uD83D\uDE00') <= '用户\uD83D\uDE00\uD83D\uDE00'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(true);
      expect(text.split('').length).assertEqual(text.length);
      expect(codePointCount('😀')).assertEqual(1);
      expect('😀'.length).assertEqual(2);
      expect(hasSurrogatePair('😀')).assertTrue();
      const scenarioTag: string = 'semi;colon;only;' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'R-42' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'R-42')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithCjkPunctuationUnderPanel
     * @tc.desc Two drafts published from a CJK-punctuated draft inputs appear as two authored rows in publish order without merging.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithCjkPunctuationUnderPanel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('国足加油！国足必胜！');
      board.publish('x-16');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('国足加油！国足必胜！');
      board.openComposer();
      board.updateDraft('   ');
      board.publish('x-16-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('国足加油！国足必胜！');
      expect(board.byUser(curUser)[1].text).assertEqual('   ');
      const mine: Array<NewsCommentModel> = board.byUser(curUser);
      expect(mine[0].text === mine[1].text).assertFalse();
      expect(mine[0].commentTime).assertEqual(FIXED_TIME);
      expect(board.count).assertEqual(10);
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '你若安好便是晴天' + '@' + 'x-16' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'x-16')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithTabOnlyOnColdStartCell
     * @tc.desc Publishing a tab-only draft in a loop keeps the row count, counter, id uniqueness and elapsed time within budget.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithTabOnlyOnColdStartCell', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 12, '\t');
      expect(board.count).assertEqual(20);
      expect(board.publishCount).assertEqual(12);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(20);
      expect(board.byUser(curUser).length).assertEqual(12);
      expect(board.comments[board.count - 1].text).assertEqual('\t');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-11');
      const scenarioTag: string = '\t' + ':' + '等烟雨而我在等你' + '@' + '1-17' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '1-17')).assertLarger(0);
      expect(scenarioTag.length > 13).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithEmojiAcrossSessions
     * @tc.desc A second empty attempt after publishing an emoji-bearing draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithEmojiAcrossSessions', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
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
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'stadium_guest' + '@' + '3' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + '3')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithScriptLikeAfterCancelLadder
     * @tc.desc The snapshot after three a script-like publishes keeps the seed id prefix and reports the third body as the tail.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithScriptLikeAfterCancelLadder', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['<script>alert(1)</script>', '#topic tag', 'Ω≈ç√∫˜µ≤≥÷'];
      const tokens: Array<string> = ['7-19', '7-19-b', '7-19-c'];
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
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '夜班解说' + '@' + '7-19' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '7-19')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithPlainWithDuplicateIdStage
     * @tc.desc Counting code points in a plain-text draft never exceeds its UTF-16 length and equals it only when no surrogate pair exists.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithPlainWithDuplicateIdStage', 0, () => {
      const text: string = 'normal english comment';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('东边有个塔玛，西边有个喇嘛') <= '东边有个塔玛，西边有个喇嘛'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('东边有个塔玛，西边有个喇嘛')).assertEqual(false);
      const scenarioTag: string = 'normal english comment' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'custom-id-20' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-20')).assertLarger(0);
      expect(scenarioTag.length > 47).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithPaddedOnColdStart
     * @tc.desc Fixture authors still map to one row each, and the missing author probe returns an empty list.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithPaddedOnColdStart', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('  leading and trailing  ');
      board.publish('row_alpha');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('  leading and trailing  ');
      board.openComposer();
      board.updateDraft('守门员的三次扑救挽救了球队');
      board.publish('row_alpha-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('  leading and trailing  ');
      expect(board.byUser(curUser)[1].text).assertEqual('守门员的三次扑救挽救了球队');
      expect(board.byUser(curUser)[0].id).assertEqual('row_alpha');
      expect(board.byUser(EXPECTED_USERS[7]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[7])[0].text).assertEqual(EXPECTED_TEXTS[7]);
      const scenarioTag: string = '  leading and trailing  ' + ':' + '访客甲' + '@' + 'row_alpha' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithFullWidthSpaceAfterInterrupt
     * @tc.desc The id chain after repeated publish cycles of a full-width-space draft starts at cycle-0 and the joined row count matches the board count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithFullWidthSpaceAfterInterrupt', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 14, 'full-width\u3000space');
      expect(board.count).assertEqual(22);
      expect(board.publishCount).assertEqual(14);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(22);
      expect(board.byUser(curUser).length).assertEqual(14);
      expect(board.comments[board.count - 1].text).assertEqual('full-width\u3000space');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-13');
      const ids: Array<string> = board.ids();
      expect(ids[8]).assertEqual('cycle-0');
      expect(joinIds(board.comments).split('|').length).assertEqual(22);
      const scenarioTag: string = 'full-width\u3000space' + ':' + '看台第七排' + '@' + 'R-42-22' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-22')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainWithLongAuthorReplay
     * @tc.desc After publishing a plain-text draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainWithLongAuthorReplay', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('@mention someone');
      board.publish('x-23');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('x-23');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '@mention someone' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'x-23' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'x-23')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithPlainOnColdStartAudit
     * @tc.desc The author filter returns the three rows published from a plain-text drafts in publish order after the seed rows.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithPlainOnColdStartAudit', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['back\\slash', '<script>alert(1)</script>', '\'; DROP TABLE comments; --'];
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
      const scenarioTag: string = 'back\\slash' + ':' + '兔子不吃窝边草' + '@' + '1' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '1')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithPlainAfterInterruptRoute
     * @tc.desc Code-point probes on empty text and two CJK characters return zero and two respectively.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithPlainAfterInterruptRoute', 0, () => {
      const text: string = 'null';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('a') <= 'a'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('a')).assertEqual(false);
      expect(codePointCount('')).assertEqual(0);
      expect(codePointCount('中文')).assertEqual(2);
      expect(text.length === 0).assertEqual(points === 0);
      const scenarioTag: string = 'null' + ':' + 'a' + '@' + '3-25' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '3-25')).assertLarger(0);
      expect(scenarioTag.length > 9).assertTrue();
    });

    /**
     * @tc.name authorFilterPreservesOrderWithDigitsOnLegacyDeviceDigest
     * @tc.desc The author filter returns only rows written by the requested author while preserving list order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('authorFilterPreservesOrderWithDigitsOnLegacyDeviceDigest', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.byUser(EXPECTED_USERS[0]).length).assertEqual(1);
      expect(board.byUser(EXPECTED_USERS[0])[0].id).assertEqual('1');
      expect(board.byUser('missing-user').length).assertEqual(0);
      board.openComposer();
      board.updateDraft('0');
      board.publish('7-26');
      expect(board.byUser(curUser).length).assertEqual(1);
      expect(board.byUser(curUser)[0].text).assertEqual('0');
      board.openComposer();
      board.updateDraft('quote "double" and "single"');
      board.publish('7-26-b');
      expect(board.byUser(curUser).length).assertEqual(2);
      expect(board.byUser(curUser)[0].text).assertEqual('0');
      expect(board.byUser(curUser)[1].text).assertEqual('quote "double" and "single"');
      const scenarioTag: string = '0' + ':' + '太阳打北边出来了' + '@' + '7-26' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '7-26')).assertLarger(0);
      expect(scenarioTag.length > 13).assertTrue();
    });

    /**
     * @tc.name publishCyclesStayCheapWithCjkPunctuationWithEmptyBufferAudit
     * @tc.desc The tail slice after repeated publish cycles of a CJK-punctuated draft equals the cycle count and the draft state is cleared.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishCyclesStayCheapWithCjkPunctuationWithEmptyBufferAudit', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const elapsed: number = runPublishCycles(board, 11, '主队控球率 58%，射门 14 次');
      expect(board.count).assertEqual(19);
      expect(board.publishCount).assertEqual(11);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 60000).assertTrue();
      expect(distinctIdCount(board.comments)).assertEqual(19);
      expect(board.byUser(curUser).length).assertEqual(11);
      expect(board.comments[board.count - 1].text).assertEqual('主队控球率 58%，射门 14 次');
      expect(board.comments[board.count - 1].id).assertEqual('cycle-10');
      expect(tailOf(board.comments, 11).length).assertEqual(11);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '小猫带耳机' + '@' + 'custom-id' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainWithDuplicateIdStage
     * @tc.desc Resetting a board that published a plain-text draft restores the eight seed rows with a zero publish count and no last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainWithDuplicateIdStage', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('守门员的三次扑救挽救了球队');
      board.publish('row_alpha-28');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('row_alpha-28');
      expect(board.count).assertEqual(9);
      board.reset();
      expect(board.count).assertEqual(8);
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'ＵＳＥＲ' + '@' + 'row_alpha-28' + '#' + 'WorkloadBudgetTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-28')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

  });
}
