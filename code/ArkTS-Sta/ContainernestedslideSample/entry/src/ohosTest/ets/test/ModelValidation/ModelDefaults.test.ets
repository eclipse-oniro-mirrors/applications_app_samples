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
  formatTime, daysInMonth, isValidTime, isHexChar, isCanonicalUuid, makeUuid,
  countChar, stableHash, joinIds, distinctIdCount, cloneComment, sameFields,
  CommentBoard, makeComment, allFieldsNonEmptyText, mockMatchesOracle
} from '../Shared/SharedDriver.ets';
import { logSuite , codePointCount, hasSurrogatePair} from '../Shared/Support.ets';

export default function ModelDefaultsTest(): void {
  describe('ModelDefaultsTest', () => {
    beforeAll(() => {
      logSuite('ModelDefaultsTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ModelDefaultsTest', 'end');
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithFullWidthSpaceUnderPanel
     * @tc.desc Generated ids are canonical 36-character tokens with hyphens at offsets 8, 13, 18 and 23 and version nibble 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithFullWidthSpaceUnderPanel', 0, () => {
      const first: string = makeUuid(36);
      const second: string = makeUuid(43);
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
      const scenarioTag: string = 'full-width\u3000space' + ':' + 'ＵＳＥＲ' + '@' + '记录-1' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '记录-1')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithPlainAfterPublish
     * @tc.desc Splitting a plain-text draft into UTF-16 units agrees with its length while a single emoji contributes two units and one code point.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithPlainAfterPublish', 0, () => {
      const text: string = '@mention someone';
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
      expect(text.split('').length).assertEqual(text.length);
      expect(codePointCount('😀')).assertEqual(1);
      expect('😀'.length).assertEqual(2);
      expect(hasSurrogatePair('😀')).assertTrue();
      const scenarioTag: string = '@mention someone' + ':' + '天要下雨娘要嫁人' + '@' + '2-1' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '2-1')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithPlainAfterReset
     * @tc.desc Summing the digests of the eight fixture bodies stays inside the 32-bit range and above zero.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithPlainAfterReset', 0, () => {
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
      const scenarioTag: string = 'back\\slash' + ':' + '大事不妙了' + '@' + '5-2' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '5-2')).assertLarger(0);
      expect(scenarioTag.length > 18).assertTrue();
    });

    /**
     * @tc.name modelCarriesAllSevenFieldsWithPlainWithDuplicateId
     * @tc.desc Constructing a comment from a plain-text draft keeps all seven fields verbatim and preserves the UTF-16 length of text and author.
     * @tc.type Function
     * @tc.level Level1
     */
    it('modelCarriesAllSevenFieldsWithPlainWithDuplicateId', 0, () => {
      const row: NewsCommentModel = makeComment('9', '用户\uD83D\uDE00\uD83D\uDE00', 'null', '3', '天要下雨娘要嫁人', FIXED_TIME);
      expect(row.id).assertEqual('9');
      expect(row.user).assertEqual('用户\uD83D\uDE00\uD83D\uDE00');
      expect(row.text).assertEqual('null');
      expect(row.replyId).assertEqual('3');
      expect(row.replyUser).assertEqual('天要下雨娘要嫁人');
      expect(row.commentTime).assertEqual(FIXED_TIME);
      expect(row.url === '').assertTrue();
      expect(row.text.length).assertEqual(4);
      expect(row.user.length).assertEqual(6);
      const scenarioTag: string = 'null' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '9' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '9')).assertLarger(0);
      expect(scenarioTag.length > 11).assertTrue();
    });

    /**
     * @tc.name rowsStayIndependentAfterMutationWithDigitsDuringTyping
     * @tc.desc Reply metadata written to the sibling of a digit-only comment does not leak into the original row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('rowsStayIndependentAfterMutationWithDigitsDuringTyping', 0, () => {
      const first: NewsCommentModel = makeComment('a1', '你若安好便是晴天', '0', '', '', FIXED_TIME);
      const second: NewsCommentModel = makeComment('b2', 'counterpart', 'other body', '', '', FIXED_TIME);
      first.text = 'mutated body';
      expect(second.text).assertEqual('other body');
      first.user = 'mutated user';
      expect(second.user).assertEqual('counterpart');
      expect(first === second).assertFalse();
      expect(first.id === second.id).assertFalse();
      expect(first.text === second.text).assertFalse();
      second.replyId = 'id-001-4';
      expect(first.replyId).assertEqual('');
      expect(second.replyId).assertEqual('id-001-4');
      const scenarioTag: string = '0' + ':' + '你若安好便是晴天' + '@' + 'id-001-4' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-4')).assertLarger(0);
      expect(scenarioTag.length > 17).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithCjkPunctuationAfterReset
     * @tc.desc The fixture id projection skips id 6 and keeps id 5 at index 4 and id 7 at index 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithCjkPunctuationAfterReset', 0, () => {
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
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '等烟雨而我在等你' + '@' + 'row_beta-5' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-5')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithPlainAtSeedEdge
     * @tc.desc Fixture authors match the eight expected nicknames with no repeated name across rows.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithPlainAtSeedEdge', 0, () => {
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
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + 'stadium_guest' + '@' + 'uuid-like-0001' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001')).assertLarger(0);
      expect(scenarioTag.length > 40).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithPlainWithLongAuthor
     * @tc.desc The combined length of the eight fixture bodies exceeds one hundred UTF-16 units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithPlainWithLongAuthor', 0, () => {
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
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '夜班解说' + '@' + '记录-1-7' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-7')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithAstralWithReplyMeta
     * @tc.desc Re-formatting the parsed fixture timestamp reproduces the literal and reports November as a thirty-day month.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithAstralWithReplyMeta', 0, () => {
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
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '2-8' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '2-8')).assertLarger(0);
      expect(scenarioTag.length > 37).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithSymbolHeavyDuringTyping
     * @tc.desc Replying to fixture row 3 with a symbol-heavy draft appends a row carrying the parent id, parent author and current user.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithSymbolHeavyDuringTyping', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, 'semi;colon;only;', '5');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('semi;colon;only;');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const scenarioTag: string = 'semi;colon;only;' + ':' + '访客甲' + '@' + '5' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '5')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithCjkPunctuationWithMixedScript
     * @tc.desc The validator rejects truncated and non-hex tokens while accepting lowercase and uppercase hex digits.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithCjkPunctuationWithMixedScript', 0, () => {
      const first: string = makeUuid(26);
      const second: string = makeUuid(33);
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
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '看台第七排' + '@' + '9-10' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '9-10')).assertLarger(0);
      expect(scenarioTag.length > 19).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithTabOnlyAfterCancel
     * @tc.desc Code-point probes on empty text and two CJK characters return zero and two respectively.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithTabOnlyAfterCancel', 0, () => {
      const text: string = '\t';
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
      expect(codePointCount('')).assertEqual(0);
      expect(codePointCount('中文')).assertEqual(2);
      expect(text.length === 0).assertEqual(points === 0);
      const scenarioTag: string = '\t' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'id-001-11' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + 'id-001-11')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithEmojiDuringTyping
     * @tc.desc The stable digest of an emoji-bearing draft equals an independently recomputed 32-bit rolling hash and stays inside the unsigned range.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithEmojiDuringTyping', 0, () => {
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
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '兔子不吃窝边草' + '@' + 'row_beta' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name modelCarriesAllSevenFieldsWithScriptLikeWithPaddedBody
     * @tc.desc A comment built from a script-like draft reports a canonical timestamp that parses back to 2024-11-01 23:00:00.
     * @tc.type Function
     * @tc.level Level1
     */
    it('modelCarriesAllSevenFieldsWithScriptLikeWithPaddedBody', 0, () => {
      const row: NewsCommentModel = makeComment('uuid-like-0001-13', 'a', '<script>alert(1)</script>', 'x', '等烟雨而我在等你', FIXED_TIME);
      expect(row.id).assertEqual('uuid-like-0001-13');
      expect(row.user).assertEqual('a');
      expect(row.text).assertEqual('<script>alert(1)</script>');
      expect(row.replyId).assertEqual('x');
      expect(row.replyUser).assertEqual('等烟雨而我在等你');
      expect(row.commentTime).assertEqual(FIXED_TIME);
      expect(row.url === '').assertTrue();
      expect(row.text.length).assertEqual(25);
      expect(row.user.length).assertEqual(1);
      expect(row.id.length > 0).assertTrue();
      expect(row.commentTime.length).assertEqual(19);
      expect(parseTime(row.commentTime) !== null).assertTrue();
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + 'a' + '@' + 'uuid-like-0001-13' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-13')).assertLarger(0);
      expect(scenarioTag.length > 43).assertTrue();
    });

    /**
     * @tc.name rowsStayIndependentAfterMutationWithPlainAfterInterrupt
     * @tc.desc A clone of a row holding a plain-text draft shares every field until the clone text is edited, then diverges.
     * @tc.type Function
     * @tc.level Level1
     */
    it('rowsStayIndependentAfterMutationWithPlainAfterInterrupt', 0, () => {
      const first: NewsCommentModel = makeComment('a1', '太阳打北边出来了', 'normal english comment', '', '', FIXED_TIME);
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
      const scenarioTag: string = 'normal english comment' + ':' + '太阳打北边出来了' + '@' + '记录-1-14' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '记录-1-14')).assertLarger(0);
      expect(scenarioTag.length > 37).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithPaddedWithDuplicateId
     * @tc.desc Loading the fixture yields eight rows with ids 1,2,3,4,5,7,8,9 and no duplicate identifiers.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithPaddedWithDuplicateId', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      expect(list.length).assertEqual(8);
      expect(EXPECTED_IDS.length).assertEqual(8);
      expect(list[0].id).assertEqual('1');
      expect(list[7].id).assertEqual('9');
      expect(distinctIdCount(list)).assertEqual(8);
      expect(joinIds(list)).assertEqual('1|2|3|4|5|7|8|9');
      expect(mockMatchesOracle(list)).assertTrue();
      expect(list[3].id).assertEqual('4');
      const scenarioTag: string = '  leading and trailing  ' + ':' + '小猫带耳机' + '@' + '2' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '2')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithFullWidthSpaceUnderPanel
     * @tc.desc Fixture authors never equal the current user, and punctuation inside names such as parentheses survives.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithFullWidthSpaceUnderPanel', 0, () => {
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
      const scenarioTag: string = 'full-width\u3000space' + ':' + 'ＵＳＥＲ' + '@' + '5-16' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '5-16')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithPlainInIdleState
     * @tc.desc Keyword probes locate the expected substrings in fixture rows 3, 6 and 7 while question marks stay absent from row 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithPlainInIdleState', 0, () => {
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
      const scenarioTag: string = '@mention someone' + ':' + '天要下雨娘要嫁人' + '@' + '9-17' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '9-17')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithPlainOnRetry
     * @tc.desc All eight fixture timestamps equal the single fixed publish literal 2024-11-01 23:00:00.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithPlainOnRetry', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      for (let index = 0; index < list.length; index++) {
        expect(list[index].commentTime).assertEqual(FIXED_TIME);
      }
      expect(FIXED_TIME).assertEqual('2024-11-01 23:00:00');
      const parts: TimeParts | null = parseTime(list[0].commentTime);
      expect(parts !== null).assertTrue();
      const scenarioTag: string = 'back\\slash' + ':' + '大事不妙了' + '@' + 'id-001' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'id-001')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithPlainWithStaleDraftLedger
     * @tc.desc A blank reply body against fixture row 3 using a plain-text context is rejected without changing the row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithPlainWithStaleDraftLedger', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, 'null', 'row_beta-19');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('null');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.reply(target, target.id, target.user, '', 'blank-reply')).assertNull();
      expect(board.count).assertEqual(9);
      const scenarioTag: string = 'null' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'row_beta-19' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'row_beta-19')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithDigitsAfterReset
     * @tc.desc Distinct seeds produce distinct canonical tokens whose first eight characters differ.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithDigitsAfterReset', 0, () => {
      const first: string = makeUuid(16);
      const second: string = makeUuid(23);
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
      const third: string = makeUuid(29);
      expect(isCanonicalUuid(third)).assertTrue();
      expect(third === first).assertFalse();
      expect(first.substring(0, 8) === third.substring(0, 8)).assertFalse();
      const scenarioTag: string = '0' + ':' + '你若安好便是晴天' + '@' + 'uuid-like-0001-20' + '#' + 'ModelDefaultsTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'uuid-like-0001-20')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

  });
}
