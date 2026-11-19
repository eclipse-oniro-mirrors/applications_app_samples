/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { RecentItem, RecentModel, RECENT_CAPACITY, buildId, parseRecentText } from '../main/ets/feature/RecentModel';

function mkItem(id: string, name: string, opened: number, favorite: boolean): RecentItem {
  return new RecentItem(id, name, 'file:///docs/' + name, false, opened, favorite);
}

function namesOf(items: RecentItem[]): string {
  const parts: string[] = [];
  for (let index = 0; index < items.length; index++) {
    parts.push(items[index].name);
  }
  return parts.join('|');
}

export default function recentMatrix2Test(): void {
  describe('RecentMatrix2Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0001
     * @tc.name      testTrimKeepsFavorite0001
     * @tc.desc      capacity trimming keeps favorites and drops the oldest recent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTrimKeepsFavorite0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.setCapacity(2);
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('c.txt', 'file:///c', false, 300);
      expect(model.count()).assertEqual(2);
      expect(model.favoriteCount()).assertEqual(1);
      expect(model.favorites()[0].id).assertEqual('id1');
      expect(model.nonFavorites()[0].name).assertEqual('c.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0002
     * @tc.name      testAddFavoriteMerge0002
     * @tc.desc      favorite flags merge to true on duplicate adds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddFavoriteMerge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, false));
      model.addRecent(mkItem('id1', 'a.txt', 200, true));
      model.addRecent(mkItem('id1', 'a.txt', 300, false));
      expect(model.favoriteCount()).assertEqual(1);
      expect(model.recents()[0].lastOpenedSec).assertEqual(300);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0003
     * @tc.name      testUpdateOlderTime0003
     * @tc.desc      updating with an older time still moves the item first
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateOlderTime0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.updateOpened('file:///a', 10);
      expect(namesOf(model.recents())).assertEqual('a.txt|b.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0004
     * @tc.name      testRemoveEdges0004
     * @tc.desc      removing first and last records keeps the middle
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveEdges0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('c.txt', 'file:///c', false, 300);
      model.remove('file:///c');
      model.remove('file:///a');
      expect(namesOf(model.recents())).assertEqual('b.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0005
     * @tc.name      testClearSequence0005
     * @tc.desc      clear return values follow the removed count
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearSequence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      expect(model.clearRecents()).assertEqual(2);
      expect(model.clearRecents()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0006
     * @tc.name      testSerializeFlagsOrder0006
     * @tc.desc      serialization keeps order and flags
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeFlagsOrder0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addRecent(new RecentItem('id1', 'a.txt', 'file:///a', true, 100, true));
      model.addRecent(new RecentItem('id2', 'b.txt', 'file:///b', false, 200, false));
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(namesOf(parsed.recents())).assertEqual('b.txt|a.txt');
      expect(parsed.recents()[1].isDlp).assertTrue();
      expect(parsed.recents()[1].favorite).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0007
     * @tc.name      testSerializeNewline0007
     * @tc.desc      newlines inside names round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeNewline0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a\nb\tc.txt', 'file:///nl', false, 100);
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(parsed.recents()[0].name).assertEqual('a\nb\tc.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0008
     * @tc.name      testParseExtraFields0008
     * @tc.desc      lines with extra fields are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseExtraFields0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(parseRecentText('a|b|c|0|1|0|extra', RECENT_CAPACITY).isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0009
     * @tc.name      testParseBadTime0009
     * @tc.desc      non numeric times are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseBadTime0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(parseRecentText('a|a.txt|file:///a|0|nope|0', RECENT_CAPACITY).isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0010
     * @tc.name      testParseCapacityTrim0010
     * @tc.desc      parsed capacities trim older records
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseCapacityTrim0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('c.txt', 'file:///c', false, 300);
      const parsed: RecentModel = parseRecentText(model.serialize(), 1);
      expect(parsed.count()).assertEqual(1);
      expect(parsed.recents()[0].name).assertEqual('c.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0011
     * @tc.name      testSetItemsTrim0011
     * @tc.desc      setItems trims to the configured capacity
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSetItemsTrim0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.setCapacity(2);
      model.setItems([mkItem('1', 'a.txt', 1, false), mkItem('2', 'b.txt', 2, false),
        mkItem('3', 'c.txt', 3, false)]);
      expect(model.count()).assertEqual(2);
      expect(namesOf(model.recents())).assertEqual('a.txt|b.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0012
     * @tc.name      testFindAfterRemove0012
     * @tc.desc      removed records cannot be found
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindAfterRemove0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.remove('file:///a');
      expect(model.find('file:///a')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0013
     * @tc.name      testFavoritesCopy0013
     * @tc.desc      favorites returns a detached collection
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFavoritesCopy0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      const favorites: RecentItem[] = model.favorites();
      favorites.pop();
      expect(model.favoriteCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0014
     * @tc.name      testBuildIdEmptyName0014
     * @tc.desc      empty names still produce stable ids
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildIdEmptyName0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(buildId('', '')).assertEqual('name:');
      expect(buildId('', 'file:///a')).assertEqual('file:///a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0015
     * @tc.name      testAddZeroTime0015
     * @tc.desc      zero open times are stored as-is
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddZeroTime0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 0);
      expect(model.recents()[0].lastOpenedSec).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0016
     * @tc.name      testToggleMultipleCycle0016
     * @tc.desc      favorites can be toggled through multiple cycles
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToggleMultipleCycle0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      for (let index = 0; index < 5; index++) {
        model.toggleFavorite('file:///a');
      }
      expect(model.favoriteCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0017
     * @tc.name      testSerializeEmptyFields0017
     * @tc.desc      empty models serialize to empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeEmptyFields0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(new RecentModel().serialize()).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0018
     * @tc.name      testUpdateKeepsFavorite0018
     * @tc.desc      updating records keeps favorite state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateKeepsFavorite0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      model.updateOpened('id1', 900);
      expect(model.favoriteCount()).assertEqual(1);
      expect(model.recents()[0].lastOpenedSec).assertEqual(900);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0019
     * @tc.name      testRemoveMissingMatrix0019
     * @tc.desc      removing unknown ids is a no-op
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveMissingMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      expect(model.remove('missing')).assertFalse();
      expect(model.count()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0020
     * @tc.name      testCapacityOneFavorite0020
     * @tc.desc      a single favorite survives within capacity
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapacityOneFavorite0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.setCapacity(1);
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      expect(model.count()).assertEqual(1);
      expect(model.favoriteCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0021
     * @tc.name      testParseUnicodeMatrix0021
     * @tc.desc      unicode and separators round trip together
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseUnicodeMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('年度|报告;😀.txt', 'file:///p|q', false, 100);
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(parsed.recents()[0].name).assertEqual('年度|报告;😀.txt');
      expect(parsed.recents()[0].uri).assertEqual('file:///p|q');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0022
     * @tc.name      testClearKeepsOrder0022
     * @tc.desc      clearing keeps favorite order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearKeepsOrder0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      model.addRecent(mkItem('id2', 'b.txt', 200, true));
      model.addOpen('c.txt', 'file:///c', false, 300);
      model.clearRecents();
      expect(namesOf(model.recents())).assertEqual('b.txt|a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0023
     * @tc.name      testSerializeTimeFormats0023
     * @tc.desc      large timestamps survive serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeTimeFormats0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 1700000000);
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(parsed.recents()[0].lastOpenedSec).assertEqual(1700000000);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0024
     * @tc.name      testClearAllTwice0024
     * @tc.desc      clearing everything twice stays empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearAllTwice0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.clearAll();
      model.clearAll();
      expect(model.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0025
     * @tc.name      testNonFavoritesOnly0025
     * @tc.desc      non favorites exclude favorites
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNonFavoritesOnly0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      model.addOpen('b.txt', 'file:///b', false, 200);
      expect(namesOf(model.nonFavorites())).assertEqual('b.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX2_0026
     * @tc.name      testCapacityClampSequence0026
     * @tc.desc      capacity clamping keeps at least one record
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapacityClampSequence0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.setCapacity(0);
      expect(model.getCapacity()).assertEqual(1);
      expect(model.count()).assertEqual(1);
      expect(model.recents()[0].name).assertEqual('b.txt');
    })
  });
}
