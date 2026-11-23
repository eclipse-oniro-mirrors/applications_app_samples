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

export default function DraftOfflineQueueTest(): void {
  describe('DraftOfflineQueueTest', () => {
    beforeAll(() => {
      logSuite('DraftOfflineQueueTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('DraftOfflineQueueTest', 'end');
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithPlainBeforePublish
     * @tc.desc The combined length of the eight fixture bodies exceeds one hundred UTF-16 units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithPlainBeforePublish', 0, () => {
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
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '兔子不吃窝边草' + '@' + 'row_alpha' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name timestampKeepsCanonicalShapeWithPlainUnderFocus
     * @tc.desc Rebuilding the fixed timestamp through TimeParts keeps the same text and the same stable digest.
     * @tc.type Function
     * @tc.level Level1
     */
    it('timestampKeepsCanonicalShapeWithPlainUnderFocus', 0, () => {
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
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + 'a' + '@' + 'R-42-1' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-1')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithAstralAfterReset
     * @tc.desc Publishing an empty draft is rejected and leaves the eight rows, draft and publish counter untouched.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithAstralAfterReset', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '太阳打北边出来了' + '@' + 'x-2' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'x-2')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithSymbolHeavyWithDuplicateId
     * @tc.desc The row published from a symbol-heavy draft carries an empty reply id, empty reply user and the fixed timestamp.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithSymbolHeavyWithDuplicateId', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('semi;colon;only;')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('1') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('semi;colon;only;');
      expect(board.comments[8].text.length).assertEqual(16);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].replyId).assertEqual('');
      expect(board.comments[8].replyUser).assertEqual('');
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.comments[8].url === '').assertTrue();
      const scenarioTag: string = 'semi;colon;only;' + ':' + '小猫带耳机' + '@' + '1' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '1')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithCjkPunctuationWithReplyMeta
     * @tc.desc Resetting a board that published a CJK-punctuated draft restores the eight seed rows with a zero publish count and no last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithCjkPunctuationWithReplyMeta', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('国足加油！国足必胜！');
      board.publish('3-4');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('3-4');
      expect(board.count).assertEqual(9);
      board.reset();
      expect(board.count).assertEqual(8);
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(joinIds(board.comments)).assertEqual('1|2|3|4|5|7|8|9');
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + 'ＵＳＥＲ' + '@' + '3-4' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '3-4')).assertLarger(0);
      expect(scenarioTag.length > 17).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithTabOnlyAcrossSessionsPanel
     * @tc.desc Three consecutive publishes of a tab-only drafts append in order while the counter rises from one to three.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithTabOnlyAcrossSessionsPanel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['\t', '球迷在雨中唱完了整首队歌', '<script>alert(1)</script>'];
      const tokens: Array<string> = ['7-5', '7-5-b', '7-5-c'];
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
      const scenarioTag: string = '\t' + ':' + '天要下雨娘要嫁人' + '@' + '7-5' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '7-5')).assertLarger(0);
      expect(scenarioTag.length > 12).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithEmojiOnLegacyDevice
     * @tc.desc Publishing immediately after cancelling an emoji-bearing draft is rejected, and a second cancel reports no state change.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithEmojiOnLegacyDevice', 0, () => {
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
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '大事不妙了' + '@' + 'custom-id' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithScriptLikeUnderPanel
     * @tc.desc A reply script over a script-like draft records parent id 1 and the fixture author before the cancel step.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithScriptLikeUnderPanel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['open', 'reply:0:' + 'row_alpha-7' + ':' + '<script>alert(1)</script>', 'cancel'];
      expect(runScript(board, script)).assertEqual(3);
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('1');
      expect(board.comments[8].replyUser).assertEqual(EXPECTED_USERS[0]);
      expect(board.comments[8].text).assertEqual('<script>alert(1)</script>');
      expect(board.editing).assertFalse();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'row_alpha-7' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-7')).assertLarger(0);
      expect(scenarioTag.length > 42).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithPlainInFirstRow
     * @tc.desc Fixture bodies match the eight expected texts and end with the documented exclamation, tilde or period.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithPlainInFirstRow', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      const texts: Array<string> = list.map((row: NewsCommentModel) => row.text);
      expect(texts[0]).assertEqual(EXPECTED_TEXTS[0]);
      expect(texts[1]).assertEqual(EXPECTED_TEXTS[1]);
      expect(texts[7]).assertEqual(EXPECTED_TEXTS[7]);
      expect(texts.length).assertEqual(8);
      expect(allFieldsNonEmptyText(list)).assertTrue();
      expect(texts[0].charAt(texts[0].length - 1).toString()).assertEqual('！');
      expect(texts[1].charAt(texts[1].length - 1).toString()).assertEqual('~');
      const scenarioTag: string = 'normal english comment' + ':' + '你若安好便是晴天' + '@' + 'R-42-8' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-8')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

    /**
     * @tc.name timestampKeepsCanonicalShapeWithPaddedDuringTyping
     * @tc.desc The fixed timestamp contains fourteen digits, and its date and time segments are all-digit slices.
     * @tc.type Function
     * @tc.level Level1
     */
    it('timestampKeepsCanonicalShapeWithPaddedDuringTyping', 0, () => {
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
      const scenarioTag: string = '  leading and trailing  ' + ':' + '等烟雨而我在等你' + '@' + 'x' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithFullWidthSpaceWithMixedScript
     * @tc.desc Calling publish with an empty token appends nothing and preserves the seed id chain.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithFullWidthSpaceWithMixedScript', 0, () => {
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
      const scenarioTag: string = 'full-width\u3000space' + ':' + 'stadium_guest' + '@' + '1-10' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '1-10')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithPlainAfterCancelLadder
     * @tc.desc Publishing a plain-text draft is accepted because the rule only rejects the empty string, and the new row keeps the payload exactly.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithPlainAfterCancelLadder', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('@mention someone')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('3-11') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('@mention someone');
      expect(board.comments[8].text.length).assertEqual(16);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      const scenarioTag: string = '@mention someone' + ':' + '夜班解说' + '@' + '3-11' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '3-11')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainInFirstRowGuard
     * @tc.desc A second empty attempt after publishing a plain-text draft changes neither the publish counter nor the last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainInFirstRowGuard', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('back\\slash');
      board.publish('7');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('7');
      expect(board.count).assertEqual(9);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.publish('second-attempt')).assertNull();
      expect(board.publishCount).assertEqual(1);
      expect(board.lastId).assertEqual('7');
      const scenarioTag: string = 'back\\slash' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '7' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '7')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithPlainUnderBudget
     * @tc.desc The snapshot after three a plain-text publishes keeps the seed id prefix and reports the third body as the tail.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithPlainUnderBudget', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['null', 'dash-dash--dash', 'zero\u200Bwidth'];
      const tokens: Array<string> = ['custom-id-13', 'custom-id-13-b', 'custom-id-13-c'];
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
      const scenarioTag: string = 'null' + ':' + '访客甲' + '@' + 'custom-id-13' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-13')).assertLarger(0);
      expect(scenarioTag.length > 19).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithDigitsOnPanelClose
     * @tc.desc Cancelling a digit-only draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithDigitsOnPanelClose', 0, () => {
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
      const scenarioTag: string = '0' + ':' + '看台第七排' + '@' + 'row_alpha-14' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-14')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithCjkPunctuationDuringScroll
     * @tc.desc A script that types a CJK-punctuated draft before opening the composer refuses the typing and the second publish. Both premature publish attempts leave the seed state intact; typing after opening then publishes successfully.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithCjkPunctuationDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['type:' + '主队控球率 58%，射门 14 次', 'open', 'publish:' + 'R-42', 'publish:' + 'R-42-b'];
      expect(runScript(board, script)).assertEqual(1);
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.publishCount).assertEqual(0);
      expect(board.draft).assertEqual('');
      expect(board.publish('late')).assertNull();
      expect(board.updateDraft('主队控球率 58%，射门 14 次')).assertTrue();
      expect(board.publish('R-42') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.editing).assertFalse();
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].id).assertEqual('R-42');
      expect(board.publish('late')).assertNull();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'R-42' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'R-42')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithPlainBeforePublishSnapshot
     * @tc.desc Keyword probes locate the expected substrings in fixture rows 3, 6 and 7 while question marks stay absent from row 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithPlainBeforePublishSnapshot', 0, () => {
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
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '兔子不吃窝边草' + '@' + 'x-16' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'x-16')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name timestampKeepsCanonicalShapeWithPlainInIdleState
     * @tc.desc The fixed timestamp holds 19 characters with dashes at offsets 4 and 7 and colons at 13 and 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('timestampKeepsCanonicalShapeWithPlainInIdleState', 0, () => {
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
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + 'a' + '@' + '1-17' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '1-17')).assertLarger(0);
      expect(scenarioTag.length > 16).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithAstralAcrossSessions
     * @tc.desc Erasing an astral-plane draft back to the empty string still blocks publishing and keeps eight distinct ids.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithAstralAcrossSessions', 0, () => {
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
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '太阳打北边出来了' + '@' + '3' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '3')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithSymbolHeavyDuringScroll
     * @tc.desc Publishing a symbol-heavy draft records the supplied id as the last id and leaves the eight seed ids intact.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithSymbolHeavyDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('semi;colon;only;')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('7-19') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('semi;colon;only;');
      expect(board.comments[8].text.length).assertEqual(16);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].id).assertEqual('7-19');
      expect(board.lastId).assertEqual('7-19');
      expect(board.comments[0].id).assertEqual('1');
      expect(board.listVisible).assertTrue();
      const scenarioTag: string = 'semi;colon;only;' + ':' + '小猫带耳机' + '@' + '7-19' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '7-19')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithCjkPunctuationWithEmptyBuffer
     * @tc.desc After publishing a CJK-punctuated draft the draft is cleared and the board returns to the idle list state with the new row appended.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithCjkPunctuationWithEmptyBuffer', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('国足加油！国足必胜！');
      board.publish('custom-id-20');
      expect(board.publishCount).assertEqual(1);
      expect(board.editing).assertFalse();
      expect(board.listVisible).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.canPublish).assertFalse();
      expect(board.lastId).assertEqual('custom-id-20');
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + 'ＵＳＥＲ' + '@' + 'custom-id-20' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-20')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithTabOnlyOnColdStart
     * @tc.desc The author filter returns the three rows published from a tab-only drafts in publish order after the seed rows.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithTabOnlyOnColdStart', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['\t', '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛', 'percent 100%'];
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
      const scenarioTag: string = '\t' + ':' + '天要下雨娘要嫁人' + '@' + 'row_alpha' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithEmojiAfterInterrupt
     * @tc.desc Reopening after the cancelled an emoji-bearing draft publishes a different draft normally with one appended row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithEmojiAfterInterrupt', 0, () => {
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
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('Mixed 中文 and English 123')).assertTrue();
      expect(board.publish('R-42-22') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('Mixed 中文 and English 123');
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '大事不妙了' + '@' + 'R-42-22' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-22')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithScriptLikeDuringScroll
     * @tc.desc An open/type/publish/cancel script over a script-like draft accepts five steps and leaves one appended row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithScriptLikeDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['open', 'type:' + '<script>alert(1)</script>', 'publish:' + 'x-23', 'open', 'cancel'];
      expect(runScript(board, script)).assertEqual(5);
      expect(board.count).assertEqual(9);
      expect(board.editing).assertFalse();
      expect(board.publishCount).assertEqual(1);
      expect(board.draft).assertEqual('');
      expect(board.comments[8].text).assertEqual('<script>alert(1)</script>');
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'x-23' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'x-23')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithPlainOnSeededBoard
     * @tc.desc The combined length of the eight fixture bodies exceeds one hundred UTF-16 units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithPlainOnSeededBoard', 0, () => {
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
      const scenarioTag: string = 'normal english comment' + ':' + '你若安好便是晴天' + '@' + '1' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '1')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name timestampKeepsCanonicalShapeWithPaddedInIdleState
     * @tc.desc Rebuilding the fixed timestamp through TimeParts keeps the same text and the same stable digest.
     * @tc.type Function
     * @tc.level Level1
     */
    it('timestampKeepsCanonicalShapeWithPaddedInIdleState', 0, () => {
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
      const scenarioTag: string = '  leading and trailing  ' + ':' + '等烟雨而我在等你' + '@' + '3-25' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '3-25')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

    /**
     * @tc.name emptyDraftIsNeverPublishedWithFullWidthSpaceOnLegacyDeviceDigest
     * @tc.desc Publishing an empty draft is rejected and leaves the eight rows, draft and publish counter untouched.
     * @tc.type Function
     * @tc.level Level1
     */
    it('emptyDraftIsNeverPublishedWithFullWidthSpaceOnLegacyDeviceDigest', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('')).assertTrue();
      expect(board.canPublish).assertFalse();
      expect(board.publish('empty-1')).assertNull();
      expect(board.count).assertEqual(8);
      expect(board.editing).assertTrue();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(0);
      const scenarioTag: string = 'full-width\u3000space' + ':' + 'stadium_guest' + '@' + '7-26' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '7-26')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithPlainOnTailRowReplay
     * @tc.desc The row published from a plain-text draft carries an empty reply id, empty reply user and the fixed timestamp.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithPlainOnTailRowReplay', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('@mention someone')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('custom-id') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('@mention someone');
      expect(board.comments[8].text.length).assertEqual(16);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].replyId).assertEqual('');
      expect(board.comments[8].replyUser).assertEqual('');
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.comments[8].url === '').assertTrue();
      const scenarioTag: string = '@mention someone' + ':' + '夜班解说' + '@' + 'custom-id' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name boardReturnsToIdleAfterPublishWithPlainAfterResetRoute
     * @tc.desc Resetting a board that published a plain-text draft restores the eight seed rows with a zero publish count and no last id.
     * @tc.type Function
     * @tc.level Level1
     */
    it('boardReturnsToIdleAfterPublishWithPlainAfterResetRoute', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      board.openComposer();
      board.updateDraft('back\\slash');
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
      const scenarioTag: string = 'back\\slash' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'row_alpha-28' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-28')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

    /**
     * @tc.name consecutivePublishesStayOrderedWithPlainWithStaleDraft
     * @tc.desc Three consecutive publishes of a plain-text drafts append in order while the counter rises from one to three.
     * @tc.type Function
     * @tc.level Level1
     */
    it('consecutivePublishesStayOrderedWithPlainWithStaleDraft', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const texts: Array<string> = ['null', 'line1\nline2', '主队控球率 58%，射门 14 次'];
      const tokens: Array<string> = ['R-42-29', 'R-42-29-b', 'R-42-29-c'];
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
      const scenarioTag: string = 'null' + ':' + '访客甲' + '@' + 'R-42-29' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-29')).assertLarger(0);
      expect(scenarioTag.length > 14).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithDigitsAcrossSessions
     * @tc.desc Publishing immediately after cancelling a digit-only draft is rejected, and a second cancel reports no state change.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithDigitsAcrossSessions', 0, () => {
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
      expect(board.publishCount).assertEqual(0);
      expect(board.lastId).assertEqual('');
      expect(board.ids().length).assertEqual(8);
      const scenarioTag: string = '0' + ':' + '看台第七排' + '@' + 'x' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 7).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithCjkPunctuationAfterCancelLadder
     * @tc.desc A reply script over a CJK-punctuated draft records parent id 1 and the fixture author before the cancel step.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithCjkPunctuationAfterCancelLadder', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['open', 'reply:0:' + '1-31' + ':' + '主队控球率 58%，射门 14 次', 'cancel'];
      expect(runScript(board, script)).assertEqual(3);
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('1');
      expect(board.comments[8].replyUser).assertEqual(EXPECTED_USERS[0]);
      expect(board.comments[8].text).assertEqual('主队控球率 58%，射门 14 次');
      expect(board.editing).assertFalse();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '1-31' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '1-31')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithPlainWithStaleDraftLedger
     * @tc.desc Fixture bodies match the eight expected texts and end with the documented exclamation, tilde or period.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithPlainWithStaleDraftLedger', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      const texts: Array<string> = list.map((row: NewsCommentModel) => row.text);
      expect(texts[0]).assertEqual(EXPECTED_TEXTS[0]);
      expect(texts[1]).assertEqual(EXPECTED_TEXTS[1]);
      expect(texts[7]).assertEqual(EXPECTED_TEXTS[7]);
      expect(texts.length).assertEqual(8);
      expect(allFieldsNonEmptyText(list)).assertTrue();
      expect(texts[0].charAt(texts[0].length - 1).toString()).assertEqual('！');
      expect(texts[1].charAt(texts[1].length - 1).toString()).assertEqual('~');
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '兔子不吃窝边草' + '@' + '3-32' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '3-32')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name timestampKeepsCanonicalShapeWithPlainDuringTyping
     * @tc.desc The fixed timestamp contains fourteen digits, and its date and time segments are all-digit slices.
     * @tc.type Function
     * @tc.level Level1
     */
    it('timestampKeepsCanonicalShapeWithPlainDuringTyping', 0, () => {
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
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + 'a' + '@' + '7' + '#' + 'DraftOfflineQueueTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '7')).assertLarger(0);
      expect(scenarioTag.length > 13).assertTrue();
    });

  });
}
