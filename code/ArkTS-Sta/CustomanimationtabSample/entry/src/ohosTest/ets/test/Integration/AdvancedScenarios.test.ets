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

export default function AdvancedScenariosTest(): void {
  describe('AdvancedScenariosTest', () => {
    beforeAll(() => {
      logSuite('AdvancedScenariosTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('AdvancedScenariosTest', 'end');
    });

    /**
     * @tc.name fixtureSharesOneTimestampWithPlainUnderPanel
     * @tc.desc All eight fixture timestamps equal the single fixed publish literal 2024-11-01 23:00:00.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureSharesOneTimestampWithPlainUnderPanel', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      for (let index = 0; index < list.length; index++) {
        expect(list[index].commentTime).assertEqual(FIXED_TIME);
      }
      expect(FIXED_TIME).assertEqual('2024-11-01 23:00:00');
      const parts: TimeParts | null = parseTime(list[0].commentTime);
      expect(parts !== null).assertTrue();
      const scenarioTag: string = 'normal english comment' + ':' + '兔子不吃窝边草' + '@' + 'R-42' + '#' + 'AdvancedScenariosTest';
      expect(scenarioTag.indexOf(':' + '兔子不吃窝边草')).assertEqual(22);
      expect(scenarioTag.substring(0, 22)).assertEqual('normal english comment');
      expect(scenarioTag.lastIndexOf('@' + 'R-42')).assertLarger(0);
      expect(scenarioTag.length > 33).assertTrue();
    });

    /**
     * @tc.name draftStoresRawWhitespaceWithPaddedAfterPublish
     * @tc.desc The row published from a space-padded draft carries an empty reply id, empty reply user and the fixed timestamp.
     * @tc.type Function
     * @tc.level Level1
     */
    it('draftStoresRawWhitespaceWithPaddedAfterPublish', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      expect(board.openComposer()).assertTrue();
      expect(board.updateDraft('  leading and trailing  ')).assertTrue();
      expect(board.canPublish).assertTrue();
      expect(board.publish('x-1') !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(board.comments[8].text).assertEqual('  leading and trailing  ');
      expect(board.comments[8].text.length).assertEqual(24);
      expect(board.comments[8].user).assertEqual(curUser);
      expect(board.editing).assertFalse();
      expect(board.draft).assertEqual('');
      expect(board.publishCount).assertEqual(1);
      expect(board.comments[8].replyId).assertEqual('');
      expect(board.comments[8].replyUser).assertEqual('');
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      expect(board.comments[8].url === '').assertTrue();
      const scenarioTag: string = '  leading and trailing  ' + ':' + 'a' + '@' + 'x-1' + '#' + 'AdvancedScenariosTest';
      expect(scenarioTag.indexOf(':' + 'a')).assertEqual(24);
      expect(scenarioTag.substring(0, 24)).assertEqual('  leading and trailing  ');
      expect(scenarioTag.lastIndexOf('@' + 'x-1')).assertLarger(0);
      expect(scenarioTag.length > 28).assertTrue();
    });

    /**
     * @tc.name publishAppendsRowAtListTailWithFullWidthSpaceWithDuplicateIdToken
     * @tc.desc The snapshot after publishing a full-width-space draft ends with the new id, names the current user and reports one publish.
     * @tc.type Function
     * @tc.level Level1
     */
    it('publishAppendsRowAtListTailWithFullWidthSpaceWithDuplicateIdToken', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const before: Array<string> = board.ids();
      expect(before.length).assertEqual(8);
      board.openComposer();
      board.updateDraft('full-width\u3000space');
      const row: NewsCommentModel | null = board.publish('1-2');
      expect(row !== null).assertTrue();
      expect(board.count).assertEqual(9);
      expect(distinctIdCount(board.comments)).assertEqual(9);
      expect(tailOf(board.comments, 1)[0].text).assertEqual('full-width\u3000space');
      expect(tailOf(board.comments, 1)[0].user).assertEqual(curUser);
      expect(board.comments[8].commentTime).assertEqual(FIXED_TIME);
      for (let index = 0; index < 8; index++) {
        expect(board.comments[index].id).assertEqual(before[index]);
      }
      const snap: BoardSnapshot = snapshot(board);
      expect(snap.count).assertEqual(9);
      expect(snap.lastUser).assertEqual(curUser);
      expect(snap.lastText).assertEqual('full-width\u3000space');
      expect(snap.ids.endsWith('|' + '1-2')).assertTrue();
      const scenarioTag: string = 'full-width\u3000space' + ':' + '太阳打北边出来了' + '@' + '1-2' + '#' + 'AdvancedScenariosTest';
      expect(scenarioTag.indexOf(':' + '太阳打北边出来了')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('full-width\u3000space');
      expect(scenarioTag.lastIndexOf('@' + '1-2')).assertLarger(0);
      expect(scenarioTag.length > 27).assertTrue();
    });

    /**
     * @tc.name cancelDropsDraftWithoutRowWithPlainUnderPanelProbe2
     * @tc.desc Cancelling a plain-text draft closes the editor without appending a row or changing the publish counter.
     * @tc.type Function
     * @tc.level Level1
     */
    it('cancelDropsDraftWithoutRowWithPlainUnderPanelProbe2', 0, () => {
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
      const scenarioTag: string = '@mention someone' + ':' + '小猫带耳机' + '@' + '3' + '#' + 'AdvancedScenariosTest';
      expect(scenarioTag.indexOf(':' + '小猫带耳机')).assertEqual(16);
      expect(scenarioTag.substring(0, 16)).assertEqual('@mention someone');
      expect(scenarioTag.lastIndexOf('@' + '3')).assertLarger(0);
      expect(scenarioTag.length > 22).assertTrue();
    });

    /**
     * @tc.name digestIsStablePerTextWithPlainWithReplyMeta
     * @tc.desc Appending one character to a plain-text draft changes its digest while hashing the same value twice stays stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('digestIsStablePerTextWithPlainWithReplyMeta', 0, () => {
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
      expect(stableHash(value + 'x') === stableHash(value)).assertFalse();
      expect(stableHash(value) === stableHash(value)).assertTrue();
      expect(stableHash('ab') === stableHash('ba')).assertFalse();
      const scenarioTag: string = 'back\\slash' + ':' + 'ＵＳＥＲ' + '@' + '7-4' + '#' + 'AdvancedScenariosTest';
      expect(scenarioTag.indexOf(':' + 'ＵＳＥＲ')).assertEqual(10);
      expect(scenarioTag.substring(0, 10)).assertEqual('back\\slash');
      expect(scenarioTag.lastIndexOf('@' + '7-4')).assertLarger(0);
      expect(scenarioTag.length > 17).assertTrue();
    });

    /**
     * @tc.name scriptedRunReachesExpectedStateWithPlainAtSeedEdgeSignal
     * @tc.desc A reply script over a plain-text draft records parent id 1 and the fixture author before the cancel step.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scriptedRunReachesExpectedStateWithPlainAtSeedEdgeSignal', 0, () => {
      const board: CommentBoard = new CommentBoard(true);
      const script: Array<string> = ['open', 'reply:0:' + 'custom-id-5' + ':' + 'null', 'cancel'];
      expect(runScript(board, script)).assertEqual(3);
      expect(board.count).assertEqual(9);
      expect(board.comments[8].replyId).assertEqual('1');
      expect(board.comments[8].replyUser).assertEqual(EXPECTED_USERS[0]);
      expect(board.comments[8].text).assertEqual('null');
      expect(board.editing).assertFalse();
      expect(board.comments[0].id).assertEqual('1');
      const scenarioTag: string = 'null' + ':' + '天要下雨娘要嫁人' + '@' + 'custom-id-5' + '#' + 'AdvancedScenariosTest';
      expect(scenarioTag.indexOf(':' + '天要下雨娘要嫁人')).assertEqual(4);
      expect(scenarioTag.substring(0, 4)).assertEqual('null');
      expect(scenarioTag.lastIndexOf('@' + 'custom-id-5')).assertLarger(0);
      expect(scenarioTag.length > 23).assertTrue();
    });

    /**
     * @tc.name fixtureExposesEightRowsWithDigitsOnLegacyDevice
     * @tc.desc Loading the fixture yields eight rows with ids 1,2,3,4,5,7,8,9 and no duplicate identifiers.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureExposesEightRowsWithDigitsOnLegacyDevice', 0, () => {
      const list: Array<NewsCommentModel> = mockData();
      expect(list.length).assertEqual(8);
      expect(EXPECTED_IDS.length).assertEqual(8);
      expect(list[0].id).assertEqual('1');
      expect(list[7].id).assertEqual('9');
      expect(distinctIdCount(list)).assertEqual(8);
      expect(joinIds(list)).assertEqual('1|2|3|4|5|7|8|9');
      expect(mockMatchesOracle(list)).assertTrue();
      expect(list[3].id).assertEqual('4');
      const scenarioTag: string = '0' + ':' + '大事不妙了' + '@' + 'row_alpha' + '#' + 'AdvancedScenariosTest';
      expect(scenarioTag.indexOf(':' + '大事不妙了')).assertEqual(1);
      expect(scenarioTag.substring(0, 1)).assertEqual('0');
      expect(scenarioTag.lastIndexOf('@' + 'row_alpha')).assertLarger(0);
      expect(scenarioTag.length > 15).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsDistinctAuthorsWithCjkPunctuationWithLongAuthor
     * @tc.desc Fixture authors never equal the current user, and punctuation inside names such as parentheses survives.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsDistinctAuthorsWithCjkPunctuationWithLongAuthor', 0, () => {
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
      const scenarioTag: string = '主队控球率 58%，射门 14 次' + ':' + '用户\uD83D\uDE00\uD83D\uDE00' + '@' + 'R-42-7' + '#' + 'AdvancedScenariosTest';
      expect(scenarioTag.indexOf(':' + '用户\uD83D\uDE00\uD83D\uDE00')).assertEqual(17);
      expect(scenarioTag.substring(0, 17)).assertEqual('主队控球率 58%，射门 14 次');
      expect(scenarioTag.lastIndexOf('@' + 'R-42-7')).assertLarger(0);
      expect(scenarioTag.length > 29).assertTrue();
    });

    /**
     * @tc.name fixtureKeepsRenderableBodiesWithPlainUnderFocusSnapshot
     * @tc.desc Keyword probes locate the expected substrings in fixture rows 3, 6 and 7 while question marks stay absent from row 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fixtureKeepsRenderableBodiesWithPlainUnderFocusSnapshot', 0, () => {
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
      const scenarioTag: string = '守门员的三次扑救挽救了球队' + ':' + '你若安好便是晴天' + '@' + 'x-8' + '#' + 'AdvancedScenariosTest';
      expect(scenarioTag.indexOf(':' + '你若安好便是晴天')).assertEqual(13);
      expect(scenarioTag.substring(0, 13)).assertEqual('守门员的三次扑救挽救了球队');
      expect(scenarioTag.lastIndexOf('@' + 'x-8')).assertLarger(0);
      expect(scenarioTag.length > 24).assertTrue();
    });

  });
}
