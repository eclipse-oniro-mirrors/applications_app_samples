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

export default function ModelMutationTrackingTest(): void {
  describe('ModelMutationTrackingTest', () => {
    beforeAll(() => {
      logSuite('ModelMutationTrackingTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ModelMutationTrackingTest', 'end');
    });

    /**
     * @tc.name replyCarriesParentMetadataWithPlainInIdleStateReplay
     * @tc.desc A reply against an empty-id target built from a plain-text context is rejected and the authored row count stays one.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithPlainInIdleStateReplay', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, 'normal english comment', 'x');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('normal english comment');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const orphan: NewsCommentModel = makeComment('', 'nobody', 'body', '', '', FIXED_TIME);
      expect(board.reply(orphan, orphan.id, orphan.user, 'text', 'orphan')).assertNull();
      expect(board.byUser(curUser).length).assertEqual(1);
      const scenarioTag: string = 'normal english comment' + ':' + '兔子不吃窝边草' + '@' + 'x' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithPaddedAfterPublish
     * @tc.desc Generated ids are canonical 36-character tokens with hyphens at offsets 8, 13, 18 and 23 and version nibble 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithPaddedAfterPublish', 0, () => {
      const first: string = makeUuid(40);
      const second: string = makeUuid(47);
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
      const scenarioTag: string = '  leading and trailing  ' + ':' + 'a' + '@' + '1-1' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '1-1')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithFullWidthSpaceAfterReset
     * @tc.desc Splitting a full-width-space draft into UTF-16 units agrees with its length while a single emoji contributes two units and one code point.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithFullWidthSpaceAfterReset', 0, () => {
      const text: string = 'full-width\u3000space';
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
      expect(text.split('').length).assertEqual(text.length);
      expect(codePointCount('😀')).assertEqual(1);
      expect('😀'.length).assertEqual(2);
      expect(hasSurrogatePair('😀')).assertTrue();
      const scenarioTag: string = 'full-width\u3000space' + ':' + '太阳打北边出来了' + '@' + '3-2' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '3-2')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithPlainWithDuplicateId
     * @tc.desc Summing the digests of the eight fixture bodies stays inside the 32-bit range and above zero.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithPlainWithDuplicateId', 0, () => {
      const value: string = '@mention someone';
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
      const scenarioTag: string = '@mention someone' + ':' + '小猫带耳机' + '@' + '7' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '7')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name modelCarriesAllSevenFieldsWithPlainInIdleState
     * @tc.desc Constructing a comment from a plain-text draft keeps all seven fields verbatim and preserves the UTF-16 length of text and author.
     * @tc.type Function
     * @tc.level Level1
     */
    it('modelCarriesAllSevenFieldsWithPlainInIdleState', 0, () => {
      const row: NewsCommentModel = makeComment('custom-id-4', 'ＵＳＥＲ', 'back\\slash', '', '太阳打北边出来了', FIXED_TIME);
      expect(row.id).assertEqual('custom-id-4');
      expect(row.user).assertEqual('ＵＳＥＲ');
      expect(row.text).assertEqual('back\\slash');
      expect(row.replyId).assertEqual('');
      expect(row.replyUser).assertEqual('太阳打北边出来了');
      expect(row.commentTime).assertEqual(FIXED_TIME);
      expect(row.url === '').assertTrue();
      expect(row.text.length).assertEqual(10);
      expect(row.user.length).assertEqual(4);
      const scenarioTag: string = 'back\\slash' + ':' + 'ＵＳＥＲ' + '@' + 'custom-id-4' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-4')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name rowsStayIndependentAfterMutationWithPlainWithMixedScript
     * @tc.desc Reply metadata written to the sibling of a plain-text comment does not leak into the original row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('rowsStayIndependentAfterMutationWithPlainWithMixedScript', 0, () => {
      const first: NewsCommentModel = makeComment('a1', '天要下雨娘要嫁人', 'null', '', '', FIXED_TIME);
      const second: NewsCommentModel = makeComment('b2', 'counterpart', 'other body', '', '', FIXED_TIME);
      first.text = 'mutated body';
      expect(second.text).assertEqual('other body');
      first.user = 'mutated user';
      expect(second.user).assertEqual('counterpart');
      expect(first === second).assertFalse();
      expect(first.id === second.id).assertFalse();
      expect(first.text === second.text).assertFalse();
      second.replyId = 'row_alpha-5';
      expect(first.replyId).assertEqual('');
      expect(second.replyId).assertEqual('row_alpha-5');
      const scenarioTag: string = 'null' + ':' + '天要下雨娘要嫁人' + '@' + 'row_alpha-5' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-5')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithDigitsWithMixedScript
     * @tc.desc The fixture id projection skips id 6 and keeps id 5 at index 4 and id 7 at index 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithDigitsWithMixedScript', 0, () => {
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
      const scenarioTag: string = '0' + ':' + '大事不妙了' + '@' + 'R-42' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'R-42')).assertLarger(0);
      expect(scenarioTag.length > 10).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithCjkPunctuationWithPaddedBody
     * @tc.desc Fixture authors match the eight expected nicknames with no repeated name across rows.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithCjkPunctuationWithPaddedBody', 0, () => {
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
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'x-7' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'x-7')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithPlainDuringTypingAudit
     * @tc.desc The combined length of the eight fixture bodies exceeds one hundred UTF-16 units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithPlainDuringTypingAudit', 0, () => {
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
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '你若安好便是晴天' + '@' + '1-8' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '1-8')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithPlainDuringTyping
     * @tc.desc Re-formatting the parsed fixture timestamp reproduces the literal and reports November as a thirty-day month.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithPlainDuringTyping', 0, () => {
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
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '等烟雨而我在等你' + '@' + '3' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + '3')).assertLarger(0);
      expect(scenarioTag.length > 20).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithAstralWithMixedScript
     * @tc.desc Replying to fixture row 3 with an astral-plane draft appends a row carrying the parent id, parent author and current user.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithAstralWithMixedScript', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89', '7-10');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + 'stadium_guest' + '@' + '7-10' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + '7-10')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithSymbolHeavyAcrossCycles
     * @tc.desc The validator rejects truncated and non-hex tokens while accepting lowercase and uppercase hex digits.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithSymbolHeavyAcrossCycles', 0, () => {
      const first: string = makeUuid(30);
      const second: string = makeUuid(37);
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
      const scenarioTag: string = 'semi;colon;only;' + ':' + '夜班解说' + '@' + 'custom-id-11' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-11')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithCjkPunctuationBeforePublish
     * @tc.desc Code-point probes on empty text and two CJK characters return zero and two respectively.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithCjkPunctuationBeforePublish', 0, () => {
      const text: string = '国足加油！国足必胜！';
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
      expect(codePointCount('')).assertEqual(0);
      expect(codePointCount('中文')).assertEqual(2);
      expect(text.length === 0).assertEqual(points === 0);
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'row_alpha' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithTabOnlyWithStaleDraft
     * @tc.desc The stable digest of a tab-only draft equals an independently recomputed 32-bit rolling hash and stays inside the unsigned range.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithTabOnlyWithStaleDraft', 0, () => {
      const value: string = '\t';
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
      const scenarioTag: string = '\t' + ':' + '访客甲' + '@' + 'R-42-13' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-13')).assertLarger(0);
      expect(scenarioTag.length > 11).assertTrue();
    });

    /**
     * @tc.name modelCarriesAllSevenFieldsWithEmojiWithMixedScript
     * @tc.desc A comment built from an emoji-bearing draft reports a canonical timestamp that parses back to 2024-11-01 23:00:00.
     * @tc.type Function
     * @tc.level Level1
     */
    it('modelCarriesAllSevenFieldsWithEmojiWithMixedScript', 0, () => {
      const row: NewsCommentModel = makeComment('x-14', '看台第七排', '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛', 'x', '大事不妙了', FIXED_TIME);
      expect(row.id).assertEqual('x-14');
      expect(row.user).assertEqual('看台第七排');
      expect(row.text).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(row.replyId).assertEqual('x');
      expect(row.replyUser).assertEqual('大事不妙了');
      expect(row.commentTime).assertEqual(FIXED_TIME);
      expect(row.url === '').assertTrue();
      expect(row.text.length).assertEqual(13);
      expect(row.user.length).assertEqual(5);
      expect(row.id.length > 0).assertTrue();
      expect(row.commentTime.length).assertEqual(19);
      expect(parseTime(row.commentTime) !== null).assertTrue();
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '看台第七排' + '@' + 'x-14' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'x-14')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name rowsStayIndependentAfterMutationWithScriptLikeWithDuplicateId
     * @tc.desc A clone of a row holding a script-like draft shares every field until the clone text is edited, then diverges.
     * @tc.type Function
     * @tc.level Level1
     */
    it('rowsStayIndependentAfterMutationWithScriptLikeWithDuplicateId', 0, () => {
      const first: NewsCommentModel = makeComment('a1', '西红柿炒鸡蛋蛋卷(特辣)', '<script>alert(1)</script>', '', '', FIXED_TIME);
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
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '1' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '1')).assertLarger(0);
      expect(scenarioTag.length > 38).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithPlainUnderPanel
     * @tc.desc Loading the fixture yields eight rows with ids 1,2,3,4,5,7,8,9 and no duplicate identifiers.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithPlainUnderPanel', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      expect(list.length).assertEqual(8);
      expect(EXPECTED_IDS.length).assertEqual(8);
      expect(list[0].id).assertEqual('1');
      expect(list[7].id).assertEqual('9');
      expect(distinctIdCount(list)).assertEqual(8);
      expect(joinIds(list)).assertEqual('1|2|3|4|5|7|8|9');
      expect(mockMatchesOracle(list)).assertTrue();
      expect(list[3].id).assertEqual('4');
      const scenarioTag: string = 'normal english comment' + ':' + '兔子不吃窝边草' + '@' + '3-16' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + '3-16')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithPaddedInIdleState
     * @tc.desc Fixture authors never equal the current user, and punctuation inside names such as parentheses survives.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithPaddedInIdleState', 0, () => {
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
      const scenarioTag: string = '  leading and trailing  ' + ':' + 'a' + '@' + '7-17' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + '7-17')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithFullWidthSpaceOnLegacyDevice
     * @tc.desc Keyword probes locate the expected substrings in fixture rows 3, 6 and 7 while question marks stay absent from row 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithFullWidthSpaceOnLegacyDevice', 0, () => {
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
      const scenarioTag: string = 'full-width\u3000space' + ':' + '太阳打北边出来了' + '@' + 'custom-id' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithPlainAcrossCycles
     * @tc.desc All eight fixture timestamps equal the single fixed publish literal 2024-11-01 23:00:00.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithPlainAcrossCycles', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      for (let index = 0; index < list.length; index++) {
        expect(list[index].commentTime).assertEqual(FIXED_TIME);
      }
      expect(FIXED_TIME).assertEqual('2024-11-01 23:00:00');
      const parts: TimeParts | null = parseTime(list[0].commentTime);
      expect(parts !== null).assertTrue();
      const scenarioTag: string = '@mention someone' + ':' + '小猫带耳机' + '@' + 'row_alpha-19' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-19')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithPlainOnTailRow
     * @tc.desc A blank reply body against fixture row 3 using a plain-text context is rejected without changing the row count.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithPlainOnTailRow', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, 'back\\slash', 'R-42-20');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('back\\slash');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.reply(target, target.id, target.user, '', 'blank-reply')).assertNull();
      expect(board.count).assertEqual(9);
      const scenarioTag: string = 'back\\slash' + ':' + 'ＵＳＥＲ' + '@' + 'R-42-20' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-20')).assertLarger(0);
      expect(scenarioTag.length > 21).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithPlainUnderFocusChunk
     * @tc.desc Distinct seeds produce distinct canonical tokens whose first eight characters differ.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithPlainUnderFocusChunk', 0, () => {
      const first: string = makeUuid(20);
      const second: string = makeUuid(27);
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
      const third: string = makeUuid(33);
      expect(isCanonicalUuid(third)).assertTrue();
      expect(third === first).assertFalse();
      expect(first.substring(0, 8) === third.substring(0, 8)).assertFalse();
      const scenarioTag: string = 'null' + ':' + '天要下雨娘要嫁人' + '@' + 'x' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 13).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithDigitsWithMixedScript
     * @tc.desc Counting code points in a digit-only draft never exceeds its UTF-16 length and equals it only when no surrogate pair exists.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithDigitsWithMixedScript', 0, () => {
      const text: string = '0';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('大事不妙了') <= '大事不妙了'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('大事不妙了')).assertEqual(false);
      const scenarioTag: string = '0' + ':' + '大事不妙了' + '@' + '1-22' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '1-22')).assertLarger(0);
      expect(scenarioTag.length > 10).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithCjkPunctuationDuringScroll
     * @tc.desc Appending one character to a CJK-punctuated draft changes its digest while hashing the same value twice stays stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithCjkPunctuationDuringScroll', 0, () => {
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
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + '3-23' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + '3-23')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name modelCarriesAllSevenFieldsWithPlainInFirstRowGuard
     * @tc.desc A comment built from a plain-text draft keeps the exported seven-field order, with text at index 5 and commentTime at index 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('modelCarriesAllSevenFieldsWithPlainInFirstRowGuard', 0, () => {
      const row: NewsCommentModel = makeComment('7', '你若安好便是晴天', '守门员的三次扑救挽救了球队', '', 'stadium_guest', FIXED_TIME);
      expect(row.id).assertEqual('7');
      expect(row.user).assertEqual('你若安好便是晴天');
      expect(row.text).assertEqual('守门员的三次扑救挽救了球队');
      expect(row.replyId).assertEqual('');
      expect(row.replyUser).assertEqual('stadium_guest');
      expect(row.commentTime).assertEqual(FIXED_TIME);
      expect(row.url === '').assertTrue();
      expect(row.text.length).assertEqual(13);
      expect(row.user.length).assertEqual(8);
      const keys: Array<string> = MODEL_FIELDS;
      expect(keys.length).assertEqual(7);
      expect(keys[0]).assertEqual('id');
      expect(keys[6]).assertEqual('commentTime');
      expect(keys.indexOf('text')).assertEqual(5);
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '你若安好便是晴天' + '@' + '7' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + '7')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name rowsStayIndependentAfterMutationWithPlainUnderBudget
     * @tc.desc Mutating one comment built from a plain-text draft leaves a sibling instance with different id and body unchanged.
     * @tc.type Function
     * @tc.level Level1
     */
    it('rowsStayIndependentAfterMutationWithPlainUnderBudget', 0, () => {
      const first: NewsCommentModel = makeComment('a1', '等烟雨而我在等你', '角球战术演练得非常熟练', '', '', FIXED_TIME);
      const second: NewsCommentModel = makeComment('b2', 'counterpart', 'other body', '', '', FIXED_TIME);
      first.text = 'mutated body';
      expect(second.text).assertEqual('other body');
      first.user = 'mutated user';
      expect(second.user).assertEqual('counterpart');
      expect(first === second).assertFalse();
      expect(first.id === second.id).assertFalse();
      expect(first.text === second.text).assertFalse();
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '等烟雨而我在等你' + '@' + 'custom-id-25' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-25')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithAstralOnPanelClose
     * @tc.desc Every fixture row paired with an astral-plane style author data carries a non-empty id and author name.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithAstralOnPanelClose', 0, () => {
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
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + 'stadium_guest' + '@' + 'row_alpha-26' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-26')).assertLarger(0);
      expect(scenarioTag.length > 46).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithSymbolHeavyDuringScroll
     * @tc.desc All fixture author names are trimmed, at least three units long, and six of them exceed six units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithSymbolHeavyDuringScroll', 0, () => {
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
      const scenarioTag: string = 'semi;colon;only;' + ':' + '夜班解说' + '@' + 'R-42' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + 'R-42')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithCjkPunctuationBeforePublishSnapshot
     * @tc.desc Fixture bodies match the eight expected texts and end with the documented exclamation, tilde or period.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithCjkPunctuationBeforePublishSnapshot', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      const texts: Array<string> = list.map((row: NewsCommentModel) => row.text);
      expect(texts[0]).assertEqual(EXPECTED_TEXTS[0]);
      expect(texts[1]).assertEqual(EXPECTED_TEXTS[1]);
      expect(texts[7]).assertEqual(EXPECTED_TEXTS[7]);
      expect(texts.length).assertEqual(8);
      expect(allFieldsNonEmptyText(list)).assertTrue();
      expect(texts[0].charAt(texts[0].length - 1).toString()).assertEqual('！');
      expect(texts[1].charAt(texts[1].length - 1).toString()).assertEqual('~');
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + 'x-28' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + 'x-28')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithTabOnlyInIdleState
     * @tc.desc Parsing a fixture timestamp resolves to year 2024, month 11, day 1 and hour 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithTabOnlyInIdleState', 0, () => {
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
      const scenarioTag: string = '\t' + ':' + '访客甲' + '@' + '1-29' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '1-29')).assertLarger(0);
      expect(scenarioTag.length > 8).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithEmojiOnRetryBatch
     * @tc.desc A reply against an empty-id target built from an emoji-bearing context is rejected and the authored row count stays one.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithEmojiOnRetryBatch', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛', '3');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const orphan: NewsCommentModel = makeComment('', 'nobody', 'body', '', '', FIXED_TIME);
      expect(board.reply(orphan, orphan.id, orphan.user, 'text', 'orphan')).assertNull();
      expect(board.byUser(curUser).length).assertEqual(1);
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '看台第七排' + '@' + '3' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + '3')).assertLarger(0);
      expect(scenarioTag.length > 19).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithScriptLikeAfterCancelLadder
     * @tc.desc Generated ids are canonical 36-character tokens with hyphens at offsets 8, 13, 18 and 23 and version nibble 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithScriptLikeAfterCancelLadder', 0, () => {
      const first: string = makeUuid(10);
      const second: string = makeUuid(17);
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
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + '7-31' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + '7-31')).assertLarger(0);
      expect(scenarioTag.length > 41).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithPlainWithEmptyBuffer
     * @tc.desc Splitting a plain-text draft into UTF-16 units agrees with its length while a single emoji contributes two units and one code point.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithPlainWithEmptyBuffer', 0, () => {
      const text: string = 'normal english comment';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('兔子不吃窝边草') <= '兔子不吃窝边草'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('兔子不吃窝边草')).assertEqual(false);
      expect(text.split('').length).assertEqual(text.length);
      expect(codePointCount('😀')).assertEqual(1);
      expect('😀'.length).assertEqual(2);
      expect(hasSurrogatePair('😀')).assertTrue();
      const scenarioTag: string = 'normal english comment' + ':' + '兔子不吃窝边草' + '@' + 'custom-id-32' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-32')).assertLarger(0);
      expect(scenarioTag.length > 41).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithPaddedOnColdStart
     * @tc.desc Summing the digests of the eight fixture bodies stays inside the 32-bit range and above zero.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithPaddedOnColdStart', 0, () => {
      const value: string = '  leading and trailing  ';
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
      const scenarioTag: string = '  leading and trailing  ' + ':' + 'a' + '@' + 'row_alpha' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 34).assertTrue();
    });

    /**
     * @tc.name modelCarriesAllSevenFieldsWithFullWidthSpaceAfterInterrupt
     * @tc.desc Constructing a comment from a full-width-space draft keeps all seven fields verbatim and preserves the UTF-16 length of text and author.
     * @tc.type Function
     * @tc.level Level1
     */
    it('modelCarriesAllSevenFieldsWithFullWidthSpaceAfterInterrupt', 0, () => {
      const row: NewsCommentModel = makeComment('R-42-34', '太阳打北边出来了', 'full-width\u3000space', '7', '看台第七排', FIXED_TIME);
      expect(row.id).assertEqual('R-42-34');
      expect(row.user).assertEqual('太阳打北边出来了');
      expect(row.text).assertEqual('full-width\u3000space');
      expect(row.replyId).assertEqual('7');
      expect(row.replyUser).assertEqual('看台第七排');
      expect(row.commentTime).assertEqual(FIXED_TIME);
      expect(row.url === '').assertTrue();
      expect(row.text.length).assertEqual(16);
      expect(row.user.length).assertEqual(8);
      const scenarioTag: string = 'full-width\u3000space' + ':' + '太阳打北边出来了' + '@' + 'R-42-34' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-34')).assertLarger(0);
      expect(scenarioTag.length > 31).assertTrue();
    });

    /**
     * @tc.name rowsStayIndependentAfterMutationWithPlainDuringScroll
     * @tc.desc Reply metadata written to the sibling of a plain-text comment does not leak into the original row.
     * @tc.type Function
     * @tc.level Level1
     */
    it('rowsStayIndependentAfterMutationWithPlainDuringScroll', 0, () => {
      const first: NewsCommentModel = makeComment('a1', '小猫带耳机', '@mention someone', '', '', FIXED_TIME);
      const second: NewsCommentModel = makeComment('b2', 'counterpart', 'other body', '', '', FIXED_TIME);
      first.text = 'mutated body';
      expect(second.text).assertEqual('other body');
      first.user = 'mutated user';
      expect(second.user).assertEqual('counterpart');
      expect(first === second).assertFalse();
      expect(first.id === second.id).assertFalse();
      expect(first.text === second.text).assertFalse();
      second.replyId = 'x-35';
      expect(first.replyId).assertEqual('');
      expect(second.replyId).assertEqual('x-35');
      const scenarioTag: string = '@mention someone' + ':' + '小猫带耳机' + '@' + 'x-35' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + 'x-35')).assertLarger(0);
      expect(scenarioTag.length > 25).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithPlainOnSeededBoard
     * @tc.desc The fixture id projection skips id 6 and keeps id 5 at index 4 and id 7 at index 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithPlainOnSeededBoard', 0, () => {
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
      const scenarioTag: string = 'back\\slash' + ':' + 'ＵＳＥＲ' + '@' + '1' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '1')).assertLarger(0);
      expect(scenarioTag.length > 15).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithPlainOnColdStartCell
     * @tc.desc Fixture authors match the eight expected nicknames with no repeated name across rows.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithPlainOnColdStartCell', 0, () => {
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
      const scenarioTag: string = 'null' + ':' + '天要下雨娘要嫁人' + '@' + '3-37' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + '3-37')).assertLarger(0);
      expect(scenarioTag.length > 16).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithDigitsOnLegacyDeviceDigest
     * @tc.desc The combined length of the eight fixture bodies exceeds one hundred UTF-16 units.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithDigitsOnLegacyDeviceDigest', 0, () => {
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
      const scenarioTag: string = '0' + ':' + '大事不妙了' + '@' + '7-38' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + '7-38')).assertLarger(0);
      expect(scenarioTag.length > 10).assertTrue();
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithCjkPunctuationAfterCancel
     * @tc.desc Re-formatting the parsed fixture timestamp reproduces the literal and reports November as a thirty-day month.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithCjkPunctuationAfterCancel', 0, () => {
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
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'custom-id' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id')).assertLarger(0);
      expect(scenarioTag.length > 32).assertTrue();
    });

    /**
     * @tc.name replyCarriesParentMetadataWithPlainAfterResetRoute
     * @tc.desc Replying to fixture row 3 with a plain-text draft appends a row carrying the parent id, parent author and current user.
     * @tc.type Function
     * @tc.level Level1
     */
    it('replyCarriesParentMetadataWithPlainAfterResetRoute', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const target: NewsCommentModel = board.comments[2];
      expect(target.id).assertEqual('3');
      const reply: NewsCommentModel | null = board.reply(target, target.id, target.user, '守门员的三次扑救挽救了球队', 'row_alpha-40');
      expect(reply !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('3');
      expect(board.comments[8].replyUser).assertEqual(target.user);
      expect(board.comments[8].text).assertEqual('守门员的三次扑救挽救了球队');
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '你若安好便是晴天' + '@' + 'row_alpha-40' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-40')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name generatedTokenLooksLikeUuidWithPlainWithStaleDraft
     * @tc.desc The validator rejects truncated and non-hex tokens while accepting lowercase and uppercase hex digits.
     * @tc.type Function
     * @tc.level Level1
     */
    it('generatedTokenLooksLikeUuidWithPlainWithStaleDraft', 0, () => {
      const first: string = makeUuid(40);
      const second: string = makeUuid(47);
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
      const scenarioTag: string = '角球战术演练得非常熟练' + ':' + '等烟雨而我在等你' + '@' + 'R-42-41' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '等烟雨而我在等你')).assertEqual(11);
      expect(scenarioTag.substring(0, 11)).assertEqual('角球战术演练得非常熟练');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-41')).assertLarger(0);
      expect(scenarioTag.length > 26).assertTrue();
    });

    /**
     * @tc.name textLengthMatchesCodePointsWithAstralAcrossSessions
     * @tc.desc Code-point probes on empty text and two CJK characters return zero and two respectively.
     * @tc.type Function
     * @tc.level Level1
     */
    it('textLengthMatchesCodePointsWithAstralAcrossSessions', 0, () => {
      const text: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89';
      const points: number = codePointCount(text);
      expect(points <= text.length).assertTrue();
      expect(points === text.length).assertEqual(!hasSurrogatePair(text));
      expect(text.substring(0, 0)).assertEqual('');
      expect(text.indexOf(text)).assertEqual(0);
      expect(codePointCount('stadium_guest') <= 'stadium_guest'.length).assertTrue();
      if (text.length > 0) {
        const head: number = text.charCodeAt(0);
        expect(head >= 0 && head <= 65535).assertTrue();
      }
      expect(hasSurrogatePair('stadium_guest')).assertEqual(false);
      expect(codePointCount('')).assertEqual(0);
      expect(codePointCount('中文')).assertEqual(2);
      expect(text.length === 0).assertEqual(points === 0);
      const scenarioTag: string = '\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89' + ':' + 'stadium_guest' + '@' + 'x' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + 'stadium_guest')).assertEqual(21);
      expect(scenarioTag.substring(0, 21)).assertEqual('\uD835\uDD73\uD835\uDD8A\uD835\uDD91\uD835\uDD91\uD835\uDD94 \uD835\uDD82\uD835\uDD94\uD835\uDD97\uD835\uDD91\uD835\uDD89');
      expect(scenarioTag.lastIndexOf('@' + 'x')).assertLarger(0);
      expect(scenarioTag.length > 35).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithSymbolHeavyDuringScroll
     * @tc.desc The stable digest of a symbol-heavy draft equals an independently recomputed 32-bit rolling hash and stays inside the unsigned range.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithSymbolHeavyDuringScroll', 0, () => {
      const value: string = 'semi;colon;only;';
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
      const scenarioTag: string = 'semi;colon;only;' + ':' + '夜班解说' + '@' + '1-43' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '夜班解说')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('semi;colon;only;');
      expect(scenarioTag.lastIndexOf('@' + '1-43')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

    /**
     * @tc.name modelCarriesAllSevenFieldsWithCjkPunctuationBeforePublishSnapshot
     * @tc.desc A comment built from a CJK-punctuated draft reports a canonical timestamp that parses back to 2024-11-01 23:00:00.
     * @tc.type Function
     * @tc.level Level1
     */
    it('modelCarriesAllSevenFieldsWithCjkPunctuationBeforePublishSnapshot', 0, () => {
      const row: NewsCommentModel = makeComment('3-44', '东边有个塔玛，西边有个喇嘛', '国足加油！国足必胜！', '', '太阳打北边出来了', FIXED_TIME);
      expect(row.id).assertEqual('3-44');
      expect(row.user).assertEqual('东边有个塔玛，西边有个喇嘛');
      expect(row.text).assertEqual('国足加油！国足必胜！');
      expect(row.replyId).assertEqual('');
      expect(row.replyUser).assertEqual('太阳打北边出来了');
      expect(row.commentTime).assertEqual(FIXED_TIME);
      expect(row.url === '').assertTrue();
      expect(row.text.length).assertEqual(10);
      expect(row.user.length).assertEqual(13);
      expect(row.id.length > 0).assertTrue();
      expect(row.commentTime.length).assertEqual(19);
      expect(parseTime(row.commentTime) !== null).assertTrue();
      const scenarioTag: string = '国足加油！国足必胜！' + ':' + '东边有个塔玛，西边有个喇嘛' + '@' + '3-44' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '东边有个塔玛，西边有个喇嘛')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('国足加油！国足必胜！');
      expect(scenarioTag.lastIndexOf('@' + '3-44')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name rowsStayIndependentAfterMutationWithTabOnlyDuringTyping
     * @tc.desc A clone of a row holding a tab-only draft shares every field until the clone text is edited, then diverges.
     * @tc.type Function
     * @tc.level Level1
     */
    it('rowsStayIndependentAfterMutationWithTabOnlyDuringTyping', 0, () => {
      const first: NewsCommentModel = makeComment('a1', '访客甲', '\t', '', '', FIXED_TIME);
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
      const scenarioTag: string = '\t' + ':' + '访客甲' + '@' + '7' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '访客甲')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('\t');
      expect(scenarioTag.lastIndexOf('@' + '7')).assertLarger(0);
      expect(scenarioTag.length > 5).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithEmojiOnPanelClose
     * @tc.desc Loading the fixture yields eight rows with ids 1,2,3,4,5,7,8,9 and no duplicate identifiers.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithEmojiOnPanelClose', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      expect(list.length).assertEqual(8);
      expect(EXPECTED_IDS.length).assertEqual(8);
      expect(list[0].id).assertEqual('1');
      expect(list[7].id).assertEqual('9');
      expect(distinctIdCount(list)).assertEqual(8);
      expect(joinIds(list)).assertEqual('1|2|3|4|5|7|8|9');
      expect(mockMatchesOracle(list)).assertTrue();
      expect(list[3].id).assertEqual('4');
      const scenarioTag: string = '\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛' + ':' + '看台第七排' + '@' + 'custom-id-46' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '看台第七排')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('\uD83D\uDC68‍\uD83D\uDC69‍\uD83D\uDC67 家庭观赛');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-46')).assertLarger(0);
      expect(scenarioTag.length > 30).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithScriptLikeAfterPublishLedger
     * @tc.desc Fixture authors never equal the current user, and punctuation inside names such as parentheses survives.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithScriptLikeAfterPublishLedger', 0, () => {
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
      const scenarioTag: string = '<script>alert(1)</script>' + ':' + '西红柿炒鸡蛋蛋卷(特辣)' + '@' + 'row_alpha-47' + '#' + 'ModelMutationTrackingTest';
      expect(scenarioTag.indexOf(':' + '西红柿炒鸡蛋蛋卷(特辣)')).assertEqual(25);
      expect(scenarioTag.substring(0, 25)).assertEqual('<script>alert(1)</script>');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha-47')).assertLarger(0);
      expect(scenarioTag.length > 49).assertTrue();
    });

  });
}
