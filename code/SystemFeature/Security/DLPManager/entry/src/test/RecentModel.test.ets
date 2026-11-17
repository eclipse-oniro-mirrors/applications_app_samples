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

function namesOf(items: RecentItem[]): string {
  const parts: string[] = [];
  for (let index = 0; index < items.length; index++) {
    parts.push(items[index].name);
  }
  return parts.join('|');
}

export default function recentModelTest(): void {
  describe('RecentModelTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0001
     * @tc.name      testEmpty0001
     * @tc.desc      a new model is empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEmpty0001 begin');
      console.info('testEmpty0001 begin');
      const model: RecentModel = new RecentModel();
      expect(model.isEmpty()).assertTrue();
      expect(model.count()).assertEqual(0);
      expect(model.favoriteCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0002
     * @tc.name      testAddOpen0002
     * @tc.desc      opening a file adds one recent item
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddOpen0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddOpen0002 begin');
      console.info('testAddOpen0002 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a.txt', false, 100);
      expect(model.count()).assertEqual(1);
      expect(model.recents()[0].name).assertEqual('a.txt');
      expect(model.recents()[0].lastOpenedSec).assertEqual(100);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0003
     * @tc.name      testMostRecentFirst0003
     * @tc.desc      newer items are stored first
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMostRecentFirst0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMostRecentFirst0003 begin');
      console.info('testMostRecentFirst0003 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      expect(namesOf(model.recents())).assertEqual('b.txt|a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0004
     * @tc.name      testReopenMovesFront0004
     * @tc.desc      reopening a file moves it to the front
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReopenMovesFront0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReopenMovesFront0004 begin');
      console.info('testReopenMovesFront0004 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('a.txt', 'file:///a', false, 300);
      expect(namesOf(model.recents())).assertEqual('a.txt|b.txt');
      expect(model.count()).assertEqual(2);
      expect(model.recents()[0].lastOpenedSec).assertEqual(300);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0005
     * @tc.name      testReopenKeepsFavorite0005
     * @tc.desc      reopening keeps the favorite flag
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReopenKeepsFavorite0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testReopenKeepsFavorite0005 begin');
      console.info('testReopenKeepsFavorite0005 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.toggleFavorite(buildId('a.txt', 'file:///a'));
      model.addOpen('a.txt', 'file:///a', false, 200);
      expect(model.favoriteCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0006
     * @tc.name      testCapacityTrim0006
     * @tc.desc      capacity limits the number of stored items
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapacityTrim0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCapacityTrim0006 begin');
      console.info('testCapacityTrim0006 begin');
      const model: RecentModel = new RecentModel();
      model.setCapacity(2);
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('c.txt', 'file:///c', false, 300);
      expect(model.count()).assertEqual(2);
      expect(namesOf(model.recents())).assertEqual('c.txt|b.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0007
     * @tc.name      testCapacityClamp0007
     * @tc.desc      capacity is clamped to one through one hundred
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapacityClamp0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCapacityClamp0007 begin');
      console.info('testCapacityClamp0007 begin');
      const model: RecentModel = new RecentModel();
      model.setCapacity(0);
      expect(model.getCapacity()).assertEqual(1);
      model.setCapacity(1000);
      expect(model.getCapacity()).assertEqual(100);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0008
     * @tc.name      testDefaultCapacity0008
     * @tc.desc      default capacity is the documented constant
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDefaultCapacity0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDefaultCapacity0008 begin');
      console.info('testDefaultCapacity0008 begin');
      expect(new RecentModel().getCapacity()).assertEqual(RECENT_CAPACITY);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0009
     * @tc.name      testRemove0009
     * @tc.desc      removing an existing item reports success
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemove0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRemove0009 begin');
      console.info('testRemove0009 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      expect(model.remove('file:///a')).assertTrue();
      expect(model.count()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0010
     * @tc.name      testRemoveMissing0010
     * @tc.desc      removing an unknown id returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveMissing0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRemoveMissing0010 begin');
      console.info('testRemoveMissing0010 begin');
      expect(new RecentModel().remove('missing')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0011
     * @tc.name      testToggleFavorite0011
     * @tc.desc      toggling flips the favorite flag
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToggleFavorite0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToggleFavorite0011 begin');
      console.info('testToggleFavorite0011 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      expect(model.toggleFavorite('file:///a')).assertTrue();
      expect(model.favoriteCount()).assertEqual(1);
      model.toggleFavorite('file:///a');
      expect(model.favoriteCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0012
     * @tc.name      testToggleFavoriteMissing0012
     * @tc.desc      toggling an unknown id returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToggleFavoriteMissing0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToggleFavoriteMissing0012 begin');
      console.info('testToggleFavoriteMissing0012 begin');
      expect(new RecentModel().toggleFavorite('missing')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0013
     * @tc.name      testFavoritesSplit0013
     * @tc.desc      favorites and non favorites are split
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFavoritesSplit0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFavoritesSplit0013 begin');
      console.info('testFavoritesSplit0013 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.toggleFavorite('file:///a');
      expect(namesOf(model.favorites())).assertEqual('a.txt');
      expect(namesOf(model.nonFavorites())).assertEqual('b.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0014
     * @tc.name      testClearRecents0014
     * @tc.desc      clearing recents keeps favorites
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearRecents0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testClearRecents0014 begin');
      console.info('testClearRecents0014 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.toggleFavorite('file:///a');
      expect(model.clearRecents()).assertEqual(1);
      expect(model.count()).assertEqual(1);
      expect(model.favorites()[0].name).assertEqual('a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0015
     * @tc.name      testClearAll0015
     * @tc.desc      clearing everything removes favorites too
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearAll0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testClearAll0015 begin');
      console.info('testClearAll0015 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.toggleFavorite('file:///a');
      model.clearAll();
      expect(model.isEmpty()).assertTrue();
      expect(model.favoriteCount()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0016
     * @tc.name      testUpdateOpened0016
     * @tc.desc      updating an opened time moves the item to the front
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateOpened0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpdateOpened0016 begin');
      console.info('testUpdateOpened0016 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      expect(model.updateOpened('file:///a', 300)).assertTrue();
      expect(model.recents()[0].name).assertEqual('a.txt');
      expect(model.recents()[0].lastOpenedSec).assertEqual(300);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0017
     * @tc.name      testUpdateOpenedMissing0017
     * @tc.desc      updating an unknown item returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateOpenedMissing0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpdateOpenedMissing0017 begin');
      console.info('testUpdateOpenedMissing0017 begin');
      expect(new RecentModel().updateOpened('missing', 100)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0018
     * @tc.name      testFind0018
     * @tc.desc      lookups return the stored item or null
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFind0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFind0018 begin');
      console.info('testFind0018 begin');
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
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0019
     * @tc.name      testBuildIdUri0019
     * @tc.desc      uri based ids are used when available
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildIdUri0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildIdUri0019 begin');
      console.info('testBuildIdUri0019 begin');
      expect(buildId('a.txt', 'file:///a.txt')).assertEqual('file:///a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0020
     * @tc.name      testBuildIdName0020
     * @tc.desc      names are used when the uri is empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildIdName0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildIdName0020 begin');
      console.info('testBuildIdName0020 begin');
      expect(buildId('a.txt', '')).assertEqual('name:a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0021
     * @tc.name      testSerializeEmpty0021
     * @tc.desc      empty models serialize to empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeEmpty0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeEmpty0021 begin');
      console.info('testSerializeEmpty0021 begin');
      expect(new RecentModel().serialize()).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0022
     * @tc.name      testRoundTrip0022
     * @tc.desc      serialization round trips all fields
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTrip0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTrip0022 begin');
      console.info('testRoundTrip0022 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', true, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.toggleFavorite('file:///b');
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(namesOf(parsed.recents())).assertEqual('b.txt|a.txt');
      expect(parsed.favoriteCount()).assertEqual(1);
      expect(parsed.recents()[1].isDlp).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0023
     * @tc.name      testRoundTripSpecial0023
     * @tc.desc      separators inside names survive serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripSpecial0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripSpecial0023 begin');
      console.info('testRoundTripSpecial0023 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a|b;c.txt', 'file:///x|y', false, 100);
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(parsed.recents()[0].name).assertEqual('a|b;c.txt');
      expect(parsed.recents()[0].uri).assertEqual('file:///x|y');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0024
     * @tc.name      testRoundTripChinese0024
     * @tc.desc      chinese names survive serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripChinese0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripChinese0024 begin');
      console.info('testRoundTripChinese0024 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('年度报告.txt', '', false, 100);
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(parsed.recents()[0].name).assertEqual('年度报告.txt');
      expect(parsed.recents()[0].id).assertEqual('name:年度报告.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0025
     * @tc.name      testParseEmpty0025
     * @tc.desc      empty text parses to an empty model
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmpty0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEmpty0025 begin');
      console.info('testParseEmpty0025 begin');
      expect(parseRecentText('', RECENT_CAPACITY).isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0026
     * @tc.name      testParseMalformed0026
     * @tc.desc      malformed lines are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseMalformed0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseMalformed0026 begin');
      console.info('testParseMalformed0026 begin');
      const parsed: RecentModel = parseRecentText('badline\nname|only|three', RECENT_CAPACITY);
      expect(parsed.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0027
     * @tc.name      testParseEmptyFields0027
     * @tc.desc      lines with empty ids are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseEmptyFields0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseEmptyFields0027 begin');
      console.info('testParseEmptyFields0027 begin');
      const parsed: RecentModel = parseRecentText('|a|file:///a|0|100|0', RECENT_CAPACITY);
      expect(parsed.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0028
     * @tc.name      testParseBadTime0028
     * @tc.desc      non numeric open times are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseBadTime0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseBadTime0028 begin');
      console.info('testParseBadTime0028 begin');
      const parsed: RecentModel = parseRecentText('a|a.txt|file:///a|0|notatime|0', RECENT_CAPACITY);
      expect(parsed.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0029
     * @tc.name      testParseCapacity0029
     * @tc.desc      parsed models honor the requested capacity
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseCapacity0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseCapacity0029 begin');
      console.info('testParseCapacity0029 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('c.txt', 'file:///c', false, 300);
      const parsed: RecentModel = parseRecentText(model.serialize(), 2);
      expect(parsed.count()).assertEqual(2);
      expect(namesOf(parsed.recents())).assertEqual('c.txt|b.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMODEL_0030
     * @tc.name      testSetItemsReset0030
     * @tc.desc      setting items replaces the previous list
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSetItemsReset0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSetItemsReset0030 begin');
      console.info('testSetItemsReset0030 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('old.txt', 'file:///old', false, 100);
      model.setItems([new RecentItem('new', 'new.txt', 'file:///new', false, 200, true)]);
      expect(namesOf(model.recents())).assertEqual('new.txt');
      expect(model.favoriteCount()).assertEqual(1);
    })
  });
}
