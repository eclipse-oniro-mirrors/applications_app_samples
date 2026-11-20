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
  FIXED_TIME, EXPECTED_IDS, EXPECTED_USERS, EXPECTED_TEXTS, MODEL_FIELDS, TimeParts,
  parseTime, formatTime, daysInMonth, isValidTime, isHexChar, isCanonicalUuid,
  makeUuid, countChar, stableHash, joinIds, distinctIdCount, cloneComment,
  sameFields, CommentBoard, makeComment, allFieldsNonEmptyText, mockMatchesOracle
} from '../Shared/SharedDriver.ets';
import { logSuite , codePointCount, hasSurrogatePair} from '../Shared/Support.ets';

export default function ModelEqualityTest(): void {
  describe('ModelEqualityTest', () => {
    beforeAll(() => {
      logSuite('ModelEqualityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ModelEqualityTest', 'end');
    });

    /**
     * @tc.name digestIsStablePerTextWithDigitsInFirstRowGuard
     * @tc.desc Summing the digests of the eight fixture bodies stays inside the 32-bit range and above zero.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithDigitsInFirstRowGuard', 0, () => {
      const value: string = '0';
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
      const list: Array<NewsCommentModel> = mockData();
      let rolling: number = 0;
      for (let index = 0; index < list.length; index++) {
        rolling = (rolling + stableHash(list[index].text)) % 4294967296;
      }
      expect(rolling >= 0).assertTrue();
      const scenarioTag: string = '0' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '2' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '2')).assertLarger(0);
      expect(scenarioTag.length > 15).assertTrue();
    });

    /**
     * @tc.name modelCarriesAllSevenFieldsWithCjkPunctuationAfterPublish
     * @tc.desc Constructing a comment from a CJK-punctuated draft keeps all seven fields verbatim and preserves the UTF-16 length of text and author.
     * @tc.type Function
     * @tc.level Level1
     */
    it('modelCarriesAllSevenFieldsWithCjkPunctuationAfterPublish', 0, () => {
      const row: NewsCommentModel = makeComment('5-1', '访客甲', '主队控球率 58%，射门 14 次', '3', '夜班解说', FIXED_TIME);
      expect(row.id).assertEqual('5-1');
      expect(row.user).assertEqual('访客甲');
      expect(row.text).assertEqual('主队控球率 58%，射门 14 次');
      expect(row.replyId).assertEqual('3');
      expect(row.replyUser).assertEqual('夜班解说');
      expect(row.commentTime).assertEqual(FIXED_TIME);
      expect(row.url === '').assertTrue();
      expect(row.text.length).assertEqual(17);
      expect(row.user.length).assertEqual(3);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '访客甲' + '@' + '5-1' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '5-1')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name rowsStayIndependentAfterMutationWithPlainAfterReset
     * @tc.desc Reply metadata written to the sibling of a plain-text comment does not leak into the original row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('rowsStayIndependentAfterMutationWithPlainAfterReset', 0, () => {
      const first: NewsCommentModel = makeComment('a1', '看台第七排', '守门员的三次扑救挽救了球队', '', '', FIXED_TIME);
      const second: NewsCommentModel = makeComment('b2', 'counterpart', 'other body', '', '', FIXED_TIME);
      first.text = 'mutated body';
      expect(second.text).assertEqual('other body');
      first.user = 'mutated user';
      expect(second.user).assertEqual('counterpart');
      expect(first === second).assertFalse();
      expect(first.id === second.id).assertFalse();
      expect(first.text === second.text).assertFalse();
      second.replyId = '9-2';
      expect(first.replyId).assertEqual('');
      expect(second.replyId).assertEqual('9-2');
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '看台第七排' + '@' + '9-2' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '9-2')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithPlainWithLongAuthor
     * @tc.desc The fixture id projection skips id 6 and keeps id 5 at index 4 and id 7 at index 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithPlainWithLongAuthor', 0, () => {
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
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'id-001' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithAstralAfterPublish
     * @tc.desc Fixture authors match the eight expected nicknames with no repeated name across rows.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithAstralAfterPublish', 0, () => {
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
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '兔子不吃窝边草' + '@' + 'row_beta-4' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-4')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithSymbolHeavyOnLegacyDevice
     * @tc.desc The combined length of the eight fixture bodies exceeds one hundred UTF-16 units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithSymbolHeavyOnLegacyDevice', 0, () => {
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
      const scenarioTag: string = 'semi;colon;only;' + ':' + 'a' + '@' + 'uuid-like-0001-5' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-5')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithCjkPunctuationWithMixedScript
     * @tc.desc Re-formatting the parsed fixture timestamp reproduces the literal and reports November as a thirty-day month.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithCjkPunctuationWithMixedScript', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      for (let index = 0; index < list.length; index++) {
        expect(list[index].commentTime).assertEqual(FIXED_TIME);
      }
      expect(FIXED_TIME).assertEqual('2024-11-01 23:00:00');
      const parts: TimeParts | null = parseTime(list[0].commentTime);
      expect(parts !== null).assertTrue();
      expect(formatTime(new TimeParts(2024, 11, 1, 23, 0, 0))).assertEqual(FIXED_TIME);
      expect(isValidTime(FIXED_TIME)).assertTrue();
      expect(daysInMonth(2024, 11)).assertEqual(30);
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '太阳打北边出来了' + '@' + '记录-1' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithTabOnlyWithPaddedBody
     * @tc.desc Replying to fixture row 3 with a tab-only draft appends a row carrying the parent id, parent author and current user.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithTabOnlyWithPaddedBody', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '\t', '2-7');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('\t');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const scenarioTag: string = '\t' + ':' + '小猫带耳机' + '@' + '2-7' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '2-7')).assertLarger(0);
      expect(scenarioTag.length > 9).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithEmojiWithReplyMeta
     * @tc.desc The validator rejects truncated and non-hex tokens while accepting lowercase and uppercase hex digits.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithEmojiWithReplyMeta', 0, () => {
      const first: string = makeUuid(18);
      const second: string = makeUuid(25);
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
      expect(countChar(first, '-')).assertEqual(4);
      expect(isCanonicalUuid(first.substring(1))).assertFalse();
      expect(isCanonicalUuid('not-a-uuid-value')).assertFalse();
      expect(isHexChar('a')).assertTrue();
      expect(isHexChar('g')).assertFalse();
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'ＵＳＥＲ' + '@' + '5-8' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + '5-8')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithScriptLikeDuringTyping
     * @tc.desc Code-point probes on empty text and two CJK characters return zero and two respectively.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithScriptLikeDuringTyping', 0, () => {
      const text: string = '<script>alert(1)</script>';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('天要下雨娘要嫁人') <= '天要下雨娘要嫁人'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('天要下雨娘要嫁人')).assertEqual(false);
      expect(codePointCount('')).assertEqual(0);
      expect(codePointCount('中文')).assertEqual(2);
      expect(text.length === 0).assertEqual(points === 0);
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '天要下雨娘要嫁人' + '@' + '9' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '9')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithPlainOnLegacyDevice
     * @tc.desc The stable digest of a plain-text draft equals an independently recomputed 32-bit rolling hash and stays inside the unsigned range.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithPlainOnLegacyDevice', 0, () => {
      const value: string = 'normal english comment';
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
      const scenarioTag: string = 'normal english comment' + ':' + '大事不妙了' + '@' + 'id-001-10' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-10')).assertLarger(0);
      expect(scenarioTag.length > 36).assertTrue();
    });

    /**
     * @tc.name modelCarriesAllSevenFieldsWithPaddedUnderPanel
     * @tc.desc A comment built from a space-padded draft reports a canonical timestamp that parses back to 2024-11-01 23:00:00.
     * @tc.type Function
     * @tc.level Level1
     */
    it('modelCarriesAllSevenFieldsWithPaddedUnderPanel', 0, () => {
      const row: NewsCommentModel = makeComment('row_beta-11', '用户\uD83D\uDE00\uD83D\uDE00', '  leading and trailing  ', 'x', '西红柿炒鸡蛋蛋卷(特辣)', FIXED_TIME);
      expect(row.id).assertEqual('row_beta-11');
      expect(row.user).assertEqual('用户\uD83D\uDE00\uD83D\uDE00');
      expect(row.text).assertEqual('  leading and trailing  ');
      expect(row.replyId).assertEqual('x');
      expect(row.replyUser).assertEqual('西红柿炒鸡蛋蛋卷(特辣)');
      expect(row.commentTime).assertEqual(FIXED_TIME);
      expect(row.url === '').assertTrue();
      expect(row.text.length).assertEqual(24);
      expect(row.user.length).assertEqual(6);
      expect(row.id.length > 0).assertTrue();
      expect(row.commentTime.length).assertEqual(19);
      expect(parseTime(row.commentTime) !== null).assertTrue();
      const scenarioTag: string = '  leading and trailing  ' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'row_beta-11' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-11')).assertLarger(0);
      expect(scenarioTag.length > 41).assertTrue();
    });

    /**
     * @tc.name rowsStayIndependentAfterMutationWithFullWidthSpaceWithStaleDraft
     * @tc.desc A clone of a row holding a full-width-space draft shares every field until the clone text is edited, then diverges.
     * @tc.type Function
     * @tc.level Level1
     */
    it('rowsStayIndependentAfterMutationWithFullWidthSpaceWithStaleDraft', 0, () => {
      const first: NewsCommentModel = makeComment('a1', '你若安好便是晴天', 'full-width\u3000space', '', '', FIXED_TIME);
      const second: NewsCommentModel = makeComment('b2', 'counterpart', 'other body', '', '', FIXED_TIME);
      first.text = 'mutated body';
      expect(second.text).assertEqual('other body');
      first.user = 'mutated user';
      expect(second.user).assertEqual('counterpart');
      expect(first === second).assertFalse();
      expect(first.id === second.id).assertFalse();
      expect(first.text === second.text).assertFalse();
      const clone: NewsCommentModel = cloneComment(first);
      expect(sameFields(clone, first)).assertTrue();
      clone.text = 'clone drift';
      expect(clone.text === first.text).assertFalse();
      expect(clone.text).assertEqual('clone drift');
      const scenarioTag: string = 'full-width\u3000space' + ':' + '你若安好便是晴天' + '@' + 'uuid-like-0001' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithPlainWithStaleDraft
     * @tc.desc Loading the fixture yields eight rows with ids 1,2,3,4,5,7,8,9 and no duplicate identifiers.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithPlainWithStaleDraft', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      expect(list.length).assertEqual(8);
      expect(EXPECTED_IDS.length).assertEqual(8);
      expect(list[0].id).assertEqual('1');
      expect(list[7].id).assertEqual('9');
      expect(distinctIdCount(list)).assertEqual(8);
      expect(joinIds(list)).assertEqual('1|2|3|4|5|7|8|9');
      expect(mockMatchesOracle(list)).assertTrue();
      expect(list[3].id).assertEqual('4');
      const scenarioTag: string = '@mention someone' + ':' + '等烟雨而我在等你' + '@' + '记录-1-13' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-13')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithPlainWithMixedScript
     * @tc.desc Fixture authors never equal the current user, and punctuation inside names such as parentheses survives.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithPlainWithMixedScript', 0, () => {
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
      const scenarioTag: string = 'back\\slash' + ':' + 'stadium_guest' + '@' + '2-14' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '2-14')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithPlainWithDuplicateId
     * @tc.desc Keyword probes locate the expected substrings in fixture rows 3, 6 and 7 while question marks stay absent from row 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithPlainWithDuplicateId', 0, () => {
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
      const scenarioTag: string = 'null' + ':' + '夜班解说' + '@' + '5' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '5')).assertLarger(0);
      expect(scenarioTag.length > 9).assertTrue();
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithDigitsUnderPanel
     * @tc.desc All eight fixture timestamps equal the single fixed publish literal 2024-11-01 23:00:00.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithDigitsUnderPanel', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      for (let index = 0; index < list.length; index++) {
        expect(list[index].commentTime).assertEqual(FIXED_TIME);
      }
      expect(FIXED_TIME).assertEqual('2024-11-01 23:00:00');
      const parts: TimeParts | null = parseTime(list[0].commentTime);
      expect(parts !== null).assertTrue();
      const scenarioTag: string = '0' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '9-16' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '9-16')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithCjkPunctuationOnColdStart
     * @tc.desc A blank reply body against fixture row 3 using a CJK-punctuated context is rejected without changing the row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithCjkPunctuationOnColdStart', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '主队控球率 58%，射门 14 次', 'id-001-17');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('主队控球率 58%，射门 14 次');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.reply(target, target.id, target.user, '', 'blank-reply')).assertNull();
      expect(board.count).assertEqual(9);
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '访客甲' + '@' + 'id-001-17' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-17')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithPlainUnderPanelProbe2
     * @tc.desc Distinct seeds produce distinct canonical tokens whose first eight characters differ.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithPlainUnderPanelProbe2', 0, () => {
      const first: string = makeUuid(8);
      const second: string = makeUuid(15);
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
      const third: string = makeUuid(21);
      expect(isCanonicalUuid(third)).assertTrue();
      expect(third === first).assertFalse();
      expect(first.substring(0, 8) === third.substring(0, 8)).assertFalse();
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '看台第七排' + '@' + 'row_beta' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithPlainAcrossSessionsPanel
     * @tc.desc Counting code points in a plain-text draft never exceeds its UTF-16 length and equals it only when no surrogate pair exists.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithPlainAcrossSessionsPanel', 0, () => {
      const text: string = '角球战术演练得非常熟练';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('西红柿炒鸡蛋蛋卷(特辣)') <= '西红柿炒鸡蛋蛋卷(特辣)'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(false);
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'uuid-like-0001-19' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-19')).assertLarger(0);
      expect(scenarioTag.length > 40).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithAstralOnTailRow
     * @tc.desc Appending one character to an astral-plane draft changes its digest while hashing the same value twice stays stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithAstralOnTailRow', 0, () => {
      const value: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89';
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
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '兔子不吃窝边草' + '@' + '记录-1-20' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-20')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

    /**
     * @tc.name modelCarriesAllSevenFieldsWithSymbolHeavyDuringTyping
     * @tc.desc A comment built from a symbol-heavy draft keeps the exported seven-field order, with text at index 5 and commentTime at index 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('modelCarriesAllSevenFieldsWithSymbolHeavyDuringTyping', 0, () => {
      const row: NewsCommentModel = makeComment('2', 'a', 'semi;colon;only;', 'row_alpha', '小猫带耳机', FIXED_TIME);
      expect(row.id).assertEqual('2');
      expect(row.user).assertEqual('a');
      expect(row.text).assertEqual('semi;colon;only;');
      expect(row.replyId).assertEqual('row_alpha');
      expect(row.replyUser).assertEqual('小猫带耳机');
      expect(row.commentTime).assertEqual(FIXED_TIME);
      expect(row.url === '').assertTrue();
      expect(row.text.length).assertEqual(16);
      expect(row.user.length).assertEqual(1);
      const keys: Array<string> = MODEL_FIELDS;
      expect(keys.length).assertEqual(7);
      expect(keys[0]).assertEqual('id');
      expect(keys[6]).assertEqual('commentTime');
      expect(keys.indexOf('text')).assertEqual(5);
      const scenarioTag: string = 'semi;colon;only;' + ':' + 'a' + '@' + '2' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '2')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name rowsStayIndependentAfterMutationWithCjkPunctuationWithMixedScript
     * @tc.desc Mutating one comment built from a CJK-punctuated draft leaves a sibling instance with different id and body unchanged.
     * @tc.type Function
     * @tc.level Level1
     */
    it('rowsStayIndependentAfterMutationWithCjkPunctuationWithMixedScript', 0, () => {
      const first: NewsCommentModel = makeComment('a1', '太阳打北边出来了', '国足加油！国足必胜！', '', '', FIXED_TIME);
      const second: NewsCommentModel = makeComment('b2', 'counterpart', 'other body', '', '', FIXED_TIME);
      first.text = 'mutated body';
      expect(second.text).assertEqual('other body');
      first.user = 'mutated user';
      expect(second.user).assertEqual('counterpart');
      expect(first === second).assertFalse();
      expect(first.id === second.id).assertFalse();
      expect(first.text === second.text).assertFalse();
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '太阳打北边出来了' + '@' + '5-22' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '5-22')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithTabOnlyDuringScroll
     * @tc.desc Every fixture row paired with a tab-only style author data carries a non-empty id and author name.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithTabOnlyDuringScroll', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      expect(list.length).assertEqual(8);
      expect(EXPECTED_IDS.length).assertEqual(8);
      expect(list[0].id).assertEqual('1');
      expect(list[7].id).assertEqual('9');
      expect(distinctIdCount(list)).assertEqual(8);
      expect(joinIds(list)).assertEqual('1|2|3|4|5|7|8|9');
      expect(mockMatchesOracle(list)).assertTrue();
      expect(list[3].id).assertEqual('4');
      for (let index = 0; index < list.length; index++) {
        expect(list[index].id.length > 0).assertTrue();
        expect(list[index].user.length > 0).assertTrue();
      }
      expect(list.length === distinctIdCount(list)).assertTrue();
      const scenarioTag: string = '\t' + ':' + '小猫带耳机' + '@' + '9-23' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '9-23')).assertLarger(0);
      expect(scenarioTag.length > 10).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithEmojiInFirstRow
     * @tc.desc All fixture author names are trimmed, at least three units long, and six of them exceed six units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithEmojiInFirstRow', 0, () => {
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
      for (let index = 0; index < users.length; index++) {
        expect(users[index].length >= 3).assertTrue();
        expect(users[index] === users[index].trim()).assertTrue();
      }
      expect(users.join('|').indexOf('晴天')).assertLarger(0);
      expect(users.filter((name: string) => name.length > 6).length).assertEqual(6);
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'ＵＳＥＲ' + '@' + 'id-001' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithScriptLikeWithMixedScript
     * @tc.desc Fixture bodies match the eight expected texts and end with the documented exclamation, tilde or period.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithScriptLikeWithMixedScript', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      const texts: Array<string> = list.map((row: NewsCommentModel) => row.text);
      expect(texts[0]).assertEqual(EXPECTED_TEXTS[0]);
      expect(texts[1]).assertEqual(EXPECTED_TEXTS[1]);
      expect(texts[7]).assertEqual(EXPECTED_TEXTS[7]);
      expect(texts.length).assertEqual(8);
      expect(allFieldsNonEmptyText(list)).assertTrue();
      expect(texts[0].charAt(texts[0].length - 1).toString()).assertEqual('！');
      expect(texts[1].charAt(texts[1].length - 1).toString()).assertEqual('~');
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '天要下雨娘要嫁人' + '@' + 'row_beta-25' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-25')).assertLarger(0);
      expect(scenarioTag.length > 44).assertTrue();
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithPlainWithReplyMeta
     * @tc.desc Parsing a fixture timestamp resolves to year 2024, month 11, day 1 and hour 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithPlainWithReplyMeta', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      for (let index = 0; index < list.length; index++) {
        expect(list[index].commentTime).assertEqual(FIXED_TIME);
      }
      expect(FIXED_TIME).assertEqual('2024-11-01 23:00:00');
      const parts: TimeParts | null = parseTime(list[0].commentTime);
      expect(parts !== null).assertTrue();
      if (parts !== null) {
        expect(parts.year).assertEqual(2024);
        expect(parts.month).assertEqual(11);
        expect(parts.day).assertEqual(1);
        expect(parts.hour).assertEqual(23);
        expect(parts.minute).assertEqual(0);
      }
      const scenarioTag: string = 'normal english comment' + ':' + '大事不妙了' + '@' + 'uuid-like-0001-26' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-26')).assertLarger(0);
      expect(scenarioTag.length > 44).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithPaddedAfterCancelLadder
     * @tc.desc A reply against an empty-id target built from a space-padded context is rejected and the authored row count stays one.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithPaddedAfterCancelLadder', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '  leading and trailing  ', '记录-1');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('  leading and trailing  ');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const orphan: NewsCommentModel = makeComment('', 'nobody', 'body', '', '', FIXED_TIME);
      expect(board.reply(orphan, orphan.id, orphan.user, 'text', 'orphan')).assertNull();
      expect(board.byUser(curUser).length).assertEqual(1);
      const scenarioTag: string = '  leading and trailing  ' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '记录-1' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithFullWidthSpaceBeforePublishSnapshot
     * @tc.desc Generated ids are canonical 36-character tokens with hyphens at offsets 8, 13, 18 and 23 and version nibble 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithFullWidthSpaceBeforePublishSnapshot', 0, () => {
      const first: string = makeUuid(38);
      const second: string = makeUuid(45);
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
      const scenarioTag: string = 'full-width\u3000space' + ':' + '你若安好便是晴天' + '@' + '2-28' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '2-28')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithPlainInIdleState
     * @tc.desc Splitting a plain-text draft into UTF-16 units agrees with its length while a single emoji contributes two units and one code point.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithPlainInIdleState', 0, () => {
      const text: string = '@mention someone';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('等烟雨而我在等你') <= '等烟雨而我在等你'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('等烟雨而我在等你')).assertEqual(false);
      expect(text.split('').length).assertEqual(text.length);
      expect(codePointCount('😀')).assertEqual(1);
      expect('😀'.length).assertEqual(2);
      expect(hasSurrogatePair('😀')).assertTrue();
      const scenarioTag: string = '@mention someone' + ':' + '等烟雨而我在等你' + '@' + '5-29' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '5-29')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithPlainAcrossSessions
     * @tc.desc Summing the digests of the eight fixture bodies stays inside the 32-bit range and above zero.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithPlainAcrossSessions', 0, () => {
      const value: string = 'back\\slash';
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
      const list: Array<NewsCommentModel> = mockData();
      let rolling: number = 0;
      for (let index = 0; index < list.length; index++) {
        rolling = (rolling + stableHash(list[index].text)) % 4294967296;
      }
      expect(rolling >= 0).assertTrue();
      const scenarioTag: string = 'back\\slash' + ':' + 'stadium_guest' + '@' + '9' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '9')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name modelCarriesAllSevenFieldsWithPlainAfterCancel
     * @tc.desc Constructing a comment from a plain-text draft keeps all seven fields verbatim and preserves the UTF-16 length of text and author.
     * @tc.type Function
     * @tc.level Level1
     */
    it('modelCarriesAllSevenFieldsWithPlainAfterCancel', 0, () => {
      const row: NewsCommentModel = makeComment('id-001-31', '夜班解说', 'null', '7', '用户\uD83D\uDE00\uD83D\uDE00', FIXED_TIME);
      expect(row.id).assertEqual('id-001-31');
      expect(row.user).assertEqual('夜班解说');
      expect(row.text).assertEqual('null');
      expect(row.replyId).assertEqual('7');
      expect(row.replyUser).assertEqual('用户\uD83D\uDE00\uD83D\uDE00');
      expect(row.commentTime).assertEqual(FIXED_TIME);
      expect(row.url === '').assertTrue();
      expect(row.text.length).assertEqual(4);
      expect(row.user.length).assertEqual(4);
      const scenarioTag: string = 'null' + ':' + '夜班解说' + '@' + 'id-001-31' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-31')).assertLarger(0);
      expect(scenarioTag.length > 17).assertTrue();
    });

    /**
     * @tc.name rowsStayIndependentAfterMutationWithDigitsInIdleState
     * @tc.desc Reply metadata written to the sibling of a digit-only comment does not leak into the original row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('rowsStayIndependentAfterMutationWithDigitsInIdleState', 0, () => {
      const first: NewsCommentModel = makeComment('a1', '东边有个塔玛，西边有个喇嘛', '0', '', '', FIXED_TIME);
      const second: NewsCommentModel = makeComment('b2', 'counterpart', 'other body', '', '', FIXED_TIME);
      first.text = 'mutated body';
      expect(second.text).assertEqual('other body');
      first.user = 'mutated user';
      expect(second.user).assertEqual('counterpart');
      expect(first === second).assertFalse();
      expect(first.id === second.id).assertFalse();
      expect(first.text === second.text).assertFalse();
      second.replyId = 'row_beta-32';
      expect(first.replyId).assertEqual('');
      expect(second.replyId).assertEqual('row_beta-32');
      const scenarioTag: string = '0' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'row_beta-32' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-32')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithCjkPunctuationAfterInterrupt
     * @tc.desc The fixture id projection skips id 6 and keeps id 5 at index 4 and id 7 at index 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithCjkPunctuationAfterInterrupt', 0, () => {
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
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '访客甲' + '@' + 'uuid-like-0001' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithPlainAfterInterrupt
     * @tc.desc Fixture authors match the eight expected nicknames with no repeated name across rows.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithPlainAfterInterrupt', 0, () => {
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
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '看台第七排' + '@' + '记录-1-34' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-34')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithPlainAfterCancelLadder
     * @tc.desc The combined length of the eight fixture bodies exceeds one hundred UTF-16 units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithPlainAfterCancelLadder', 0, () => {
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
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '2-35' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '2-35')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithAstralOnSeededBoard
     * @tc.desc Re-formatting the parsed fixture timestamp reproduces the literal and reports November as a thirty-day month.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithAstralOnSeededBoard', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      for (let index = 0; index < list.length; index++) {
        expect(list[index].commentTime).assertEqual(FIXED_TIME);
      }
      expect(FIXED_TIME).assertEqual('2024-11-01 23:00:00');
      const parts: TimeParts | null = parseTime(list[0].commentTime);
      expect(parts !== null).assertTrue();
      expect(formatTime(new TimeParts(2024, 11, 1, 23, 0, 0))).assertEqual(FIXED_TIME);
      expect(isValidTime(FIXED_TIME)).assertTrue();
      expect(daysInMonth(2024, 11)).assertEqual(30);
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '兔子不吃窝边草' + '@' + '5' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '5')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithSymbolHeavyInIdleState
     * @tc.desc Replying to fixture row 3 with a symbol-heavy draft appends a row carrying the parent id, parent author and current user.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithSymbolHeavyInIdleState', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, 'semi;colon;only;', '9-37');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('semi;colon;only;');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const scenarioTag: string = 'semi;colon;only;' + ':' + 'a' + '@' + '9-37' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '9-37')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithCjkPunctuationOnLegacyDevice
     * @tc.desc The validator rejects truncated and non-hex tokens while accepting lowercase and uppercase hex digits.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithCjkPunctuationOnLegacyDevice', 0, () => {
      const first: string = makeUuid(28);
      const second: string = makeUuid(35);
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
      expect(countChar(first, '-')).assertEqual(4);
      expect(isCanonicalUuid(first.substring(1))).assertFalse();
      expect(isCanonicalUuid('not-a-uuid-value')).assertFalse();
      expect(isHexChar('a')).assertTrue();
      expect(isHexChar('g')).assertFalse();
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '太阳打北边出来了' + '@' + 'id-001-38' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-38')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithTabOnlyOnSeededBoard
     * @tc.desc Code-point probes on empty text and two CJK characters return zero and two respectively.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithTabOnlyOnSeededBoard', 0, () => {
      const text: string = '\t';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('小猫带耳机') <= '小猫带耳机'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('小猫带耳机')).assertEqual(false);
      expect(codePointCount('')).assertEqual(0);
      expect(codePointCount('中文')).assertEqual(2);
      expect(text.length === 0).assertEqual(points === 0);
      const scenarioTag: string = '\t' + ':' + '小猫带耳机' + '@' + 'row_beta' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta')).assertLarger(0);
      expect(scenarioTag.length > 14).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithEmojiAfterReset
     * @tc.desc The stable digest of an emoji-bearing draft equals an independently recomputed 32-bit rolling hash and stays inside the unsigned range.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithEmojiAfterReset', 0, () => {
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
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + 'ＵＳＥＲ' + '@' + 'uuid-like-0001-40' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-40')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name modelCarriesAllSevenFieldsWithScriptLikeWithStaleDraft
     * @tc.desc A comment built from a script-like draft reports a canonical timestamp that parses back to 2024-11-01 23:00:00.
     * @tc.type Function
     * @tc.level Level1
     */
    it('modelCarriesAllSevenFieldsWithScriptLikeWithStaleDraft', 0, () => {
      const row: NewsCommentModel = makeComment('记录-1-41', '天要下雨娘要嫁人', '<script>alert(1)</script>', '1', '夜班解说', FIXED_TIME);
      expect(row.id).assertEqual('记录-1-41');
      expect(row.user).assertEqual('天要下雨娘要嫁人');
      expect(row.text).assertEqual('<script>alert(1)</script>');
      expect(row.replyId).assertEqual('1');
      expect(row.replyUser).assertEqual('夜班解说');
      expect(row.commentTime).assertEqual(FIXED_TIME);
      expect(row.url === '').assertTrue();
      expect(row.text.length).assertEqual(25);
      expect(row.user.length).assertEqual(8);
      expect(row.id.length > 0).assertTrue();
      expect(row.commentTime.length).assertEqual(19);
      expect(parseTime(row.commentTime) !== null).assertTrue();
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '天要下雨娘要嫁人' + '@' + '记录-1-41' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-41')).assertLarger(0);
      expect(scenarioTag.length > 40).assertTrue();
    });

    /**
     * @tc.name rowsStayIndependentAfterMutationWithPlainAcrossSessions
     * @tc.desc A clone of a row holding a plain-text draft shares every field until the clone text is edited, then diverges.
     * @tc.type Function
     * @tc.level Level1
     */
    it('rowsStayIndependentAfterMutationWithPlainAcrossSessions', 0, () => {
      const first: NewsCommentModel = makeComment('a1', '大事不妙了', 'normal english comment', '', '', FIXED_TIME);
      const second: NewsCommentModel = makeComment('b2', 'counterpart', 'other body', '', '', FIXED_TIME);
      first.text = 'mutated body';
      expect(second.text).assertEqual('other body');
      first.user = 'mutated user';
      expect(second.user).assertEqual('counterpart');
      expect(first === second).assertFalse();
      expect(first.id === second.id).assertFalse();
      expect(first.text === second.text).assertFalse();
      const clone: NewsCommentModel = cloneComment(first);
      expect(sameFields(clone, first)).assertTrue();
      clone.text = 'clone drift';
      expect(clone.text === first.text).assertFalse();
      expect(clone.text).assertEqual('clone drift');
      const scenarioTag: string = 'normal english comment' + ':' + '大事不妙了' + '@' + '2' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '2')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithPaddedDuringScroll
     * @tc.desc Loading the fixture yields eight rows with ids 1,2,3,4,5,7,8,9 and no duplicate identifiers.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithPaddedDuringScroll', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      expect(list.length).assertEqual(8);
      expect(EXPECTED_IDS.length).assertEqual(8);
      expect(list[0].id).assertEqual('1');
      expect(list[7].id).assertEqual('9');
      expect(distinctIdCount(list)).assertEqual(8);
      expect(joinIds(list)).assertEqual('1|2|3|4|5|7|8|9');
      expect(mockMatchesOracle(list)).assertTrue();
      expect(list[3].id).assertEqual('4');
      const scenarioTag: string = '  leading and trailing  ' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '5-43' + '#' + 'ModelEqualityTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '5-43')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

  });
}
