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

function namesOf(items: Array<RecentItem>): string {
  const parts: Array<string> = [];
  for (let index = 0; index < items.length; index++) {
    parts.push(items[index].name);
  }
  return parts.join('|');
}

export default function recentFlowMatrixTest(): void {
  describe('RecentFlowMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0001
     * @tc.name      testRecordSingle0001
     * @tc.desc      a single open is recorded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecordSingle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      expect(model.count()).assertEqual(1);
      expect(model.recents()[0].lastOpenedSec).assertEqual(100);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0002
     * @tc.name      testRecordOrder0002
     * @tc.desc      newer opens appear first
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRecordOrder0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('c.txt', 'file:///c', false, 300);
      expect(namesOf(model.recents())).assertEqual('c.txt|b.txt|a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0003
     * @tc.name      testReopenFront0003
     * @tc.desc      reopening moves an item to the front
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReopenFront0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('a.txt', 'file:///a', false, 300);
      expect(namesOf(model.recents())).assertEqual('a.txt|b.txt');
      expect(model.count()).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0004
     * @tc.name      testReopenFavorite0004
     * @tc.desc      reopening keeps the favorite flag
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReopenFavorite0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.toggleFavorite('file:///a');
      model.addOpen('a.txt', 'file:///a', false, 200);
      expect(model.favoriteCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0005
     * @tc.name      testToggleFavorite0005
     * @tc.desc      favorites toggle on and off
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToggleFavorite0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.toggleFavorite('file:///a');
      expect(model.favoriteCount()).assertEqual(1);
      model.toggleFavorite('file:///a');
      expect(model.favoriteCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0006
     * @tc.name      testToggleMultiple0006
     * @tc.desc      multiple favorites are tracked independently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToggleMultiple0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('c.txt', 'file:///c', false, 300);
      model.toggleFavorite('file:///a');
      model.toggleFavorite('file:///c');
      expect(namesOf(model.favorites())).assertEqual('c.txt|a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0007
     * @tc.name      testFavoriteSplit0007
     * @tc.desc      favorites and non favorites split correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFavoriteSplit0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.toggleFavorite('file:///b');
      expect(namesOf(model.favorites())).assertEqual('b.txt');
      expect(namesOf(model.nonFavorites())).assertEqual('a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0008
     * @tc.name      testUpdateMovesFront0008
     * @tc.desc      updating an open time moves the item to the front
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateMovesFront0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      expect(model.updateOpened('file:///a', 300)).assertTrue();
      expect(namesOf(model.recents())).assertEqual('a.txt|b.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0009
     * @tc.name      testUpdateMissing0009
     * @tc.desc      updating unknown items reports failure
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateMissing0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(new RecentModel().updateOpened('missing', 1)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0010
     * @tc.name      testRemoveMiddle0010
     * @tc.desc      removing a middle item keeps the order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveMiddle0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('c.txt', 'file:///c', false, 300);
      model.remove('file:///b');
      expect(namesOf(model.recents())).assertEqual('c.txt|a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0011
     * @tc.name      testReaddOrder0011
     * @tc.desc      re-adding a removed item puts it in front
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReaddOrder0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.remove('file:///a');
      model.addOpen('a.txt', 'file:///a', false, 300);
      expect(namesOf(model.recents())).assertEqual('a.txt|b.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0012
     * @tc.name      testCapacityNewest0012
     * @tc.desc      capacity keeps the newest records
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapacityNewest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.setCapacity(2);
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('c.txt', 'file:///c', false, 300);
      expect(namesOf(model.recents())).assertEqual('c.txt|b.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0013
     * @tc.name      testCapacityDefault0013
     * @tc.desc      default capacity trims beyond twenty records
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapacityDefault0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      for (let index = 0; index < 25; index++) {
        model.addOpen('f' + index.toString() + '.txt', 'file:///' + index.toString(), false, index);
      }
      expect(model.count()).assertEqual(RECENT_CAPACITY);
      expect(model.recents()[0].name).assertEqual('f24.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0014
     * @tc.name      testClearKeepsFavorites0014
     * @tc.desc      clearing recents keeps favorites
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearKeepsFavorites0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.toggleFavorite('file:///a');
      expect(model.clearRecents()).assertEqual(1);
      expect(namesOf(model.recents())).assertEqual('a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0015
     * @tc.name      testClearAll0015
     * @tc.desc      clearing everything removes favorites too
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearAll0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.toggleFavorite('file:///a');
      model.clearAll();
      expect(model.isEmpty()).assertTrue();
      expect(model.favoriteCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0016
     * @tc.name      testAddMerge0016
     * @tc.desc      explicit additions merge favorite flags
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddMerge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, false));
      model.addRecent(mkItem('id1', 'a.txt', 200, true));
      expect(model.count()).assertEqual(1);
      expect(model.favoriteCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0017
     * @tc.name      testSerializeEmpty0017
     * @tc.desc      empty models serialize to empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeEmpty0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(new RecentModel().serialize()).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0018
     * @tc.name      testSerializeOrder0018
     * @tc.desc      serialization keeps the record order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeOrder0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(namesOf(parsed.recents())).assertEqual('b.txt|a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0019
     * @tc.name      testSerializeFlags0019
     * @tc.desc      serialization keeps favorite and dlp flags
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeFlags0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addRecent(new RecentItem('id1', 'a.txt', 'file:///a', true, 100, true));
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(parsed.recents()[0].favorite).assertTrue();
      expect(parsed.recents()[0].isDlp).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0020
     * @tc.name      testParseEmpty0020
     * @tc.desc      empty text parses to an empty model
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmpty0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(parseRecentText('', RECENT_CAPACITY).isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0021
     * @tc.name      testParseMalformed0021
     * @tc.desc      malformed lines are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseMalformed0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(parseRecentText('bad\nx|y|z', RECENT_CAPACITY).isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0022
     * @tc.name      testParseExtraFields0022
     * @tc.desc      extra fields are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseExtraFields0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(parseRecentText('a|b|c|0|1|0|extra', RECENT_CAPACITY).isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0023
     * @tc.name      testParseBadTime0023
     * @tc.desc      non numeric times are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseBadTime0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(parseRecentText('a|a.txt|file:///a|0|notatime|0', RECENT_CAPACITY).isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0024
     * @tc.name      testParseUnicode0024
     * @tc.desc      unicode names round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseUnicode0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('年度报告😀.txt', '', false, 100);
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(parsed.recents()[0].name).assertEqual('年度报告😀.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0025
     * @tc.name      testParseSpecial0025
     * @tc.desc      separators inside names round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSpecial0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a|b;c=d.txt', 'file:///x|y', false, 100);
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(parsed.recents()[0].name).assertEqual('a|b;c=d.txt');
      expect(parsed.recents()[0].uri).assertEqual('file:///x|y');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0026
     * @tc.name      testParseCapacity0026
     * @tc.desc      parsed capacities trim the records
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseCapacity0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('c.txt', 'file:///c', false, 300);
      expect(parseRecentText(model.serialize(), 2).count()).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0027
     * @tc.name      testSetItemsReset0027
     * @tc.desc      setting items replaces the previous records
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSetItemsReset0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('old.txt', 'file:///old', false, 100);
      model.setItems([mkItem('new', 'new.txt', 200, false)]);
      expect(namesOf(model.recents())).assertEqual('new.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0028
     * @tc.name      testSetItemsCopy0028
     * @tc.desc      setting items copies the source array
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSetItemsCopy0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: Array<RecentItem> = [mkItem('a', 'a.txt', 100, false)];
      const model: RecentModel = new RecentModel();
      model.setItems(source);
      source.push(mkItem('b', 'b.txt', 200, false));
      expect(model.count()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0029
     * @tc.name      testCapacityGetters0029
     * @tc.desc      capacities clamp and report their values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapacityGetters0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      expect(model.getCapacity()).assertEqual(RECENT_CAPACITY);
      model.setCapacity(0);
      expect(model.getCapacity()).assertEqual(1);
      model.setCapacity(500);
      expect(model.getCapacity()).assertEqual(100);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0030
     * @tc.name      testBuildIds0030
     * @tc.desc      ids prefer uris and fall back to names
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildIds0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(buildId('a.txt', 'file:///a')).assertEqual('file:///a');
      expect(buildId('a.txt', '')).assertEqual('name:a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0031
     * @tc.name      testFindMatrix0031
     * @tc.desc      lookups return items or null
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFindMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', true, 100);
      const found: RecentItem | null = model.find('file:///a');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.isDlp).assertTrue();
      }
      expect(model.find('missing')).assertNull();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0032
     * @tc.name      testRemoveMissing0032
     * @tc.desc      removing unknown items reports failure
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveMissing0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(new RecentModel().remove('missing')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0033
     * @tc.name      testFavoriteMissing0033
     * @tc.desc      favoriting unknown items reports failure
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFavoriteMissing0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(new RecentModel().toggleFavorite('missing')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0034
     * @tc.name      testUpdateKeepsFavorite0034
     * @tc.desc      updating open times keeps favorites
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateKeepsFavorite0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      model.updateOpened('id1', 500);
      expect(model.favoriteCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0035
     * @tc.name      testSerializeAfterClear0035
     * @tc.desc      serialization after clearing keeps favorites only
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeAfterClear0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.toggleFavorite('file:///a');
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.clearRecents();
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(namesOf(parsed.recents())).assertEqual('a.txt');
      expect(parsed.favoriteCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTFLOW_0036
     * @tc.name      testClearTwice0036
     * @tc.desc      clearing twice removes nothing the second time
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearTwice0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      expect(model.clearRecents()).assertEqual(1);
      expect(model.clearRecents()).assertEqual(0);
    })
  });
}
