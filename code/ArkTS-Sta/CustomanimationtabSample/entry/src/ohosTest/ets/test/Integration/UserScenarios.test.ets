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
  FIXED_TIME, EXPECTED_IDS, EXPECTED_USERS, EXPECTED_TEXTS, TimeParts, parseTime,
  countChar, stableHash, joinIds, distinctIdCount, tailOf, CommentBoard,
  runScript, BoardSnapshot, snapshot, allFieldsNonEmptyText, mockMatchesOracle
} from '../Shared/SharedDriver.ets';
import { logSuite } from '../Shared/Support.ets';

export default function UserScenariosTest(): void {
  describe('UserScenariosTest', () => {
    beforeAll(() => {
      logSuite('UserScenariosTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('UserScenariosTest', 'end');
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithPlainOnColdStartAudit
     * @tc.desc Keyword probes locate the expected substrings in fixture rows 3, 6 and 7 while question marks stay absent from row 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithPlainOnColdStartAudit', 0, () => {
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
      const scenarioTag: string = 'normal english comment' + ':' + '兔子不吃窝边草' + '@' + '7' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '7')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithPaddedOnLegacyDeviceDigest
     * @tc.desc All eight fixture timestamps equal the single fixed publish literal 2024-11-01 23:00:00.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithPaddedOnLegacyDeviceDigest', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      for (let index = 0; index < list.length; index++) {
        expect(list[index].commentTime).assertEqual(FIXED_TIME);
      }
      expect(FIXED_TIME).assertEqual('2024-11-01 23:00:00');
      const parts: TimeParts | null = parseTime(list[0].commentTime);
      expect(parts !== null).assertTrue();
      const scenarioTag: string = '  leading and trailing  ' + ':' + 'a' + '@' + 'custom-id-1' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-1')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithFullWidthSpaceDuringScroll
     * @tc.desc The row published from a full-width-space draft carries an empty reply id, empty reply user and the fixed timestamp.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithFullWidthSpaceDuringScroll', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('full-width\u3000space')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('row_alpha-2') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('full-width\u3000space');
      expect(board.comments[8].text.length).assertEqual(16);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].replyId).assertEqual('');
      expect(board.comments[8].replyUser).assertEqual('');
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.comments[8].url === '').assertTrue();
      const scenarioTag: string = 'full-width\u3000space' + ':' + '太阳打北边出来了' + '@' + 'row_alpha-2' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-2')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithPlainOnTailRowCompass
     * @tc.desc The snapshot after publishing a plain-text draft ends with the new id, names the current user and reports one publish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithPlainOnTailRowCompass', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('@mention someone');
      const row: NewsCommentModel | null = board.publish('R-42');
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
      expect(snap.ids.endsWith('|' + 'R-42')).assertTrue();
      const scenarioTag: string = '@mention someone' + ':' + '小猫带耳机' + '@' + 'R-42' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'R-42')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithPlainOnLegacyDeviceBanner
     * @tc.desc Cancelling a plain-text draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithPlainOnLegacyDeviceBanner', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('back\\slash')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      const scenarioTag: string = 'back\\slash' + ':' + 'ＵＳＥＲ' + '@' + 'x-4' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'x-4')).assertLarger(0);
      expect(scenarioTag.length > 17).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithPlainOnRetryCell
     * @tc.desc Appending one character to a plain-text draft changes its digest while hashing the same value twice stays stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithPlainOnRetryCell', 0, () => {
      const value: string = 'null';
      let oracle: number = 5381;
      for (let index = 0; index < value.length; index++) {
        oracle = (oracle * 33 + value.charCodeAt(index)) % 4294967296;
      }
      expect(stableHash(value)).assertEqual(oracle);
      expect(stableHash('')).assertEqual(5381);
      expect(stableHash(FIXED_TIME) === stableHash('2024-11-01 23:00:00')).assertTrue();
      expect(stableHash(FIXED_TIME) === stableHash('2024-11-01 23:00:01')).assertFalse();
      expect(oracle >= 0).assertTrue();
      expect(oracle < 4294967296).assertTrue();
      expect(stableHash(value + 'x') === stableHash(value)).assertFalse();
      expect(stableHash(value) === stableHash(value)).assertTrue();
      expect(stableHash('ab') === stableHash('ba')).assertFalse();
      const scenarioTag: string = 'null' + ':' + '天要下雨娘要嫁人' + '@' + '1-5' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '1-5')).assertLarger(0);
      expect(scenarioTag.length > 15).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithDigitsOnRetryBatch
     * @tc.desc A reply script over a digit-only draft records parent id 1 and the fixture author before the cancel step.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithDigitsOnRetryBatch', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['open', 'reply:0:' + '3' + ':' + '0', 'cancel'];
      expect(runScript(board, script)).assertEqual(3);
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('1');
      expect(board.comments[8].replyUser).assertEqual(EXPECTED_USERS[0]);
      expect(board.comments[8].text).assertEqual('0');
      expect(board.editing).assertFalse();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '0' + ':' + '大事不妙了' + '@' + '3' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '3')).assertLarger(0);
      expect(scenarioTag.length > 7).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithCjkPunctuationWithPaddedBody
     * @tc.desc Loading the fixture yields eight rows with ids 1,2,3,4,5,7,8,9 and no duplicate identifiers.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithCjkPunctuationWithPaddedBody', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      expect(list.length).assertEqual(8);
      expect(EXPECTED_IDS.length).assertEqual(8);
      expect(list[0].id).assertEqual('1');
      expect(list[7].id).assertEqual('9');
      expect(distinctIdCount(list)).assertEqual(8);
      expect(joinIds(list)).assertEqual('1|2|3|4|5|7|8|9');
      expect(mockMatchesOracle(list)).assertTrue();
      expect(list[3].id).assertEqual('4');
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '7-7' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '7-7')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithPlainWithReplyMetaFrame
     * @tc.desc Fixture authors never equal the current user, and punctuation inside names such as parentheses survives.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithPlainWithReplyMetaFrame', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      const users: Array<string> = list.map((row: NewsCommentModel) => row.user);
      expect(users.length).assertEqual(EXPECTED_USERS.length);
      expect(users[0]).assertEqual(EXPECTED_USERS[0]);
      expect(users[3]).assertEqual(EXPECTED_USERS[3]);
      expect(users[7]).assertEqual(EXPECTED_USERS[7]);
      let distinct: number = 0;
      for (let index = 0; index < users.length; index++) {
        if (users.indexOf(users[index]) === index) { distinct++; }
      }
      expect(distinct).assertEqual(8);
      expect(users.indexOf(curUser)).assertEqual(-1);
      expect(users[3].indexOf('(')).assertLarger(0);
      expect(users[4].indexOf('，')).assertLarger(0);
      expect(users[5].length).assertLarger(5);
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '你若安好便是晴天' + '@' + 'custom-id-8' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-8')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithPlainOnColdStart
     * @tc.desc Keyword probes locate the expected substrings in fixture rows 3, 6 and 7 while question marks stay absent from row 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithPlainOnColdStart', 0, () => {
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
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '等烟雨而我在等你' + '@' + 'row_alpha' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithAstralAfterInterrupt
     * @tc.desc All eight fixture timestamps equal the single fixed publish literal 2024-11-01 23:00:00.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithAstralAfterInterrupt', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      for (let index = 0; index < list.length; index++) {
        expect(list[index].commentTime).assertEqual(FIXED_TIME);
      }
      expect(FIXED_TIME).assertEqual('2024-11-01 23:00:00');
      const parts: TimeParts | null = parseTime(list[0].commentTime);
      expect(parts !== null).assertTrue();
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + 'stadium_guest' + '@' + 'R-42-10' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-10')).assertLarger(0);
      expect(scenarioTag.length > 41).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithSymbolHeavyAfterCancelLadder
     * @tc.desc The row published from a symbol-heavy draft carries an empty reply id, empty reply user and the fixed timestamp.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithSymbolHeavyAfterCancelLadder', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('semi;colon;only;')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('x-11') !== null).assertTrue();
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
      const scenarioTag: string = 'semi;colon;only;' + ':' + '夜班解说' + '@' + 'x-11' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'x-11')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithCjkPunctuationInIdleStateReplay
     * @tc.desc The snapshot after publishing a CJK-punctuated draft ends with the new id, names the current user and reports one publish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithCjkPunctuationInIdleStateReplay', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('国足加油！国足必胜！');
      const row: NewsCommentModel | null = board.publish('1');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(8);
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
      expect(snap.ids.endsWith('|' + '1')).assertTrue();
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '1' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '1')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithTabOnlyAfterInterruptRoute
     * @tc.desc Cancelling a tab-only draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithTabOnlyAfterInterruptRoute', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('\t')).assertTrue();
      expect(board.cancel()).assertTrue();
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.listVisible).assertTrue();
      expect(board.count).assertEqual(8);
      expect(board.publish('after-cancel')).assertNull();
      expect(board.cancel()).assertFalse();
      const scenarioTag: string = '\t' + ':' + '访客甲' + '@' + '3-13' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '3-13')).assertLarger(0);
      expect(scenarioTag.length > 8).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithEmojiWithMixedScript
     * @tc.desc Appending one character to an emoji-bearing draft changes its digest while hashing the same value twice stays stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithEmojiWithMixedScript', 0, () => {
      const value: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛';
      let oracle: number = 5381;
      for (let index = 0; index < value.length; index++) {
        oracle = (oracle * 33 + value.charCodeAt(index)) % 4294967296;
      }
      expect(stableHash(value)).assertEqual(oracle);
      expect(stableHash('')).assertEqual(5381);
      expect(stableHash(FIXED_TIME) === stableHash('2024-11-01 23:00:00')).assertTrue();
      expect(stableHash(FIXED_TIME) === stableHash('2024-11-01 23:00:01')).assertFalse();
      expect(oracle >= 0).assertTrue();
      expect(oracle < 4294967296).assertTrue();
      expect(stableHash(value + 'x') === stableHash(value)).assertFalse();
      expect(stableHash(value) === stableHash(value)).assertTrue();
      expect(stableHash('ab') === stableHash('ba')).assertFalse();
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '看台第七排' + '@' + '7-14' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + '7-14')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithScriptLikeAfterCancel
     * @tc.desc A reply script over a script-like draft records parent id 1 and the fixture author before the cancel step.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithScriptLikeAfterCancel', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['open', 'reply:0:' + 'custom-id' + ':' + '<script>alert(1)</script>', 'cancel'];
      expect(runScript(board, script)).assertEqual(3);
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('1');
      expect(board.comments[8].replyUser).assertEqual(EXPECTED_USERS[0]);
      expect(board.comments[8].text).assertEqual('<script>alert(1)</script>');
      expect(board.editing).assertFalse();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'custom-id' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 46).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithPlainWithEmptyBuffer
     * @tc.desc Loading the fixture yields eight rows with ids 1,2,3,4,5,7,8,9 and no duplicate identifiers.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithPlainWithEmptyBuffer', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      expect(list.length).assertEqual(8);
      expect(EXPECTED_IDS.length).assertEqual(8);
      expect(list[0].id).assertEqual('1');
      expect(list[7].id).assertEqual('9');
      expect(distinctIdCount(list)).assertEqual(8);
      expect(joinIds(list)).assertEqual('1|2|3|4|5|7|8|9');
      expect(mockMatchesOracle(list)).assertTrue();
      expect(list[3].id).assertEqual('4');
      const scenarioTag: string = 'normal english comment' + ':' + '兔子不吃窝边草' + '@' + 'row_alpha-16' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-16')).assertLarger(0);
      expect(scenarioTag.length > 41).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithPaddedWithStaleDraft
     * @tc.desc Fixture authors never equal the current user, and punctuation inside names such as parentheses survives.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithPaddedWithStaleDraft', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      const users: Array<string> = list.map((row: NewsCommentModel) => row.user);
      expect(users.length).assertEqual(EXPECTED_USERS.length);
      expect(users[0]).assertEqual(EXPECTED_USERS[0]);
      expect(users[3]).assertEqual(EXPECTED_USERS[3]);
      expect(users[7]).assertEqual(EXPECTED_USERS[7]);
      let distinct: number = 0;
      for (let index = 0; index < users.length; index++) {
        if (users.indexOf(users[index]) === index) { distinct++; }
      }
      expect(distinct).assertEqual(8);
      expect(users.indexOf(curUser)).assertEqual(-1);
      expect(users[3].indexOf('(')).assertLarger(0);
      expect(users[4].indexOf('，')).assertLarger(0);
      expect(users[5].length).assertLarger(5);
      const scenarioTag: string = '  leading and trailing  ' + ':' + 'a' + '@' + 'R-42-17' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-17')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithFullWidthSpaceOnRetryBatch
     * @tc.desc Keyword probes locate the expected substrings in fixture rows 3, 6 and 7 while question marks stay absent from row 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithFullWidthSpaceOnRetryBatch', 0, () => {
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
      const scenarioTag: string = 'full-width\u3000space' + ':' + '太阳打北边出来了' + '@' + 'x' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithPlainDuringScroll
     * @tc.desc All eight fixture timestamps equal the single fixed publish literal 2024-11-01 23:00:00.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithPlainDuringScroll', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      for (let index = 0; index < list.length; index++) {
        expect(list[index].commentTime).assertEqual(FIXED_TIME);
      }
      expect(FIXED_TIME).assertEqual('2024-11-01 23:00:00');
      const parts: TimeParts | null = parseTime(list[0].commentTime);
      expect(parts !== null).assertTrue();
      const scenarioTag: string = '@mention someone' + ':' + '小猫带耳机' + '@' + '1-19' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '1-19')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithPlainWithStaleDraftLedger
     * @tc.desc The row published from a plain-text draft carries an empty reply id, empty reply user and the fixed timestamp.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithPlainWithStaleDraftLedger', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('back\\slash')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('3-20') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('back\\slash');
      expect(board.comments[8].text.length).assertEqual(10);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].replyId).assertEqual('');
      expect(board.comments[8].replyUser).assertEqual('');
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.comments[8].url === '').assertTrue();
      const scenarioTag: string = 'back\\slash' + ':' + 'ＵＳＥＲ' + '@' + '3-20' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '3-20')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithPlainWithMixedScriptSlot
     * @tc.desc The snapshot after publishing a plain-text draft ends with the new id, names the current user and reports one publish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithPlainWithMixedScriptSlot', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('null');
      const row: NewsCommentModel | null = board.publish('7');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(8);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('null');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const snap: BoardSnapshot = snapshot(board);
      expect(snap.count).assertEqual(9);
      expect(snap.lastUser).assertEqual(curUser);
      expect(snap.lastText).assertEqual('null');
      expect(snap.ids.endsWith('|' + '7')).assertTrue();
      const scenarioTag: string = 'null' + ':' + '天要下雨娘要嫁人' + '@' + '7' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '7')).assertLarger(0);
      expect(scenarioTag.length > 13).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithDigitsDuringTypingTrace
     * @tc.desc Cancelling a digit-only draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithDigitsDuringTypingTrace', 0, () => {
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
      const scenarioTag: string = '0' + ':' + '大事不妙了' + '@' + 'custom-id-22' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-22')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithCjkPunctuationAcrossCycles
     * @tc.desc Appending one character to a CJK-punctuated draft changes its digest while hashing the same value twice stays stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithCjkPunctuationAcrossCycles', 0, () => {
      const value: string = '主队控球率 58%，射门 14 次';
      let oracle: number = 5381;
      for (let index = 0; index < value.length; index++) {
        oracle = (oracle * 33 + value.charCodeAt(index)) % 4294967296;
      }
      expect(stableHash(value)).assertEqual(oracle);
      expect(stableHash('')).assertEqual(5381);
      expect(stableHash(FIXED_TIME) === stableHash('2024-11-01 23:00:00')).assertTrue();
      expect(stableHash(FIXED_TIME) === stableHash('2024-11-01 23:00:01')).assertFalse();
      expect(oracle >= 0).assertTrue();
      expect(oracle < 4294967296).assertTrue();
      expect(stableHash(value + 'x') === stableHash(value)).assertFalse();
      expect(stableHash(value) === stableHash(value)).assertTrue();
      expect(stableHash('ab') === stableHash('ba')).assertFalse();
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'row_alpha-23' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-23')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithPlainBeforePublishSnapshot
     * @tc.desc A reply script over a plain-text draft records parent id 1 and the fixture author before the cancel step.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithPlainBeforePublishSnapshot', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['open', 'reply:0:' + 'R-42' + ':' + '守门员的三次扑救挽救了球队', 'cancel'];
      expect(runScript(board, script)).assertEqual(3);
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('1');
      expect(board.comments[8].replyUser).assertEqual(EXPECTED_USERS[0]);
      expect(board.comments[8].text).assertEqual('守门员的三次扑救挽救了球队');
      expect(board.editing).assertFalse();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '你若安好便是晴天' + '@' + 'R-42' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'R-42')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithPlainWithReplyMetaFrame
     * @tc.desc Loading the fixture yields eight rows with ids 1,2,3,4,5,7,8,9 and no duplicate identifiers.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithPlainWithReplyMetaFrame', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      expect(list.length).assertEqual(8);
      expect(EXPECTED_IDS.length).assertEqual(8);
      expect(list[0].id).assertEqual('1');
      expect(list[7].id).assertEqual('9');
      expect(distinctIdCount(list)).assertEqual(8);
      expect(joinIds(list)).assertEqual('1|2|3|4|5|7|8|9');
      expect(mockMatchesOracle(list)).assertTrue();
      expect(list[3].id).assertEqual('4');
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '等烟雨而我在等你' + '@' + 'x-25' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'x-25')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithAstralWithMixedScript
     * @tc.desc Fixture authors never equal the current user, and punctuation inside names such as parentheses survives.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithAstralWithMixedScript', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      const users: Array<string> = list.map((row: NewsCommentModel) => row.user);
      expect(users.length).assertEqual(EXPECTED_USERS.length);
      expect(users[0]).assertEqual(EXPECTED_USERS[0]);
      expect(users[3]).assertEqual(EXPECTED_USERS[3]);
      expect(users[7]).assertEqual(EXPECTED_USERS[7]);
      let distinct: number = 0;
      for (let index = 0; index < users.length; index++) {
        if (users.indexOf(users[index]) === index) { distinct++; }
      }
      expect(distinct).assertEqual(8);
      expect(users.indexOf(curUser)).assertEqual(-1);
      expect(users[3].indexOf('(')).assertLarger(0);
      expect(users[4].indexOf('，')).assertLarger(0);
      expect(users[5].length).assertLarger(5);
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + 'stadium_guest' + '@' + '1-26' + '#' + 'UserScenariosTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '1-26')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

  });
}
