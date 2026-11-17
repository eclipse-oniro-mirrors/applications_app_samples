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

export default function recentMatrixTest(): void {
  describe('RecentMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0001
     * @tc.name      testCapacityOne0001
     * @tc.desc      capacity one keeps only the newest record
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapacityOne0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCapacityOne0001 begin');
      const model: RecentModel = new RecentModel();
      model.setCapacity(1);
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('c.txt', 'file:///c', false, 300);
      expect(model.count()).assertEqual(1);
      expect(model.recents()[0].name).assertEqual('c.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0002
     * @tc.name      testCapacityFive0002
     * @tc.desc      capacities above the record count do not drop items
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapacityFive0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCapacityFive0002 begin');
      const model: RecentModel = new RecentModel();
      model.setCapacity(5);
      for (let index = 0; index < 3; index++) {
        model.addOpen('f' + index.toString() + '.txt', 'file:///' + index.toString(), false, index);
      }
      expect(model.count()).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0003
     * @tc.name      testAddMergesFavorite0003
     * @tc.desc      adding an explicit favorite item keeps the flag
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddMergesFavorite0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddMergesFavorite0003 begin');
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      expect(model.favoriteCount()).assertEqual(1);
      expect(model.find('id1') !== null).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0004
     * @tc.name      testAddDuplicate0010
     * @tc.desc      duplicate ids merge into one record
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddDuplicate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddDuplicate0010 begin');
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, false));
      model.addRecent(mkItem('id1', 'a.txt', 200, true));
      expect(model.count()).assertEqual(1);
      expect(model.recents()[0].lastOpenedSec).assertEqual(200);
      expect(model.favoriteCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0005
     * @tc.name      testUpdateFavorite0011
     * @tc.desc      updating the open time keeps the favorite flag
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUpdateFavorite0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUpdateFavorite0011 begin');
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      expect(model.updateOpened('id1', 500)).assertTrue();
      const found: RecentItem | null = model.find('id1');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.lastOpenedSec).assertEqual(500);
        expect(found.favorite).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0006
     * @tc.name      testRemoveFavorite0012
     * @tc.desc      removing a favorite clears both sections
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveFavorite0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRemoveFavorite0012 begin');
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      expect(model.remove('id1')).assertTrue();
      expect(model.favoriteCount()).assertEqual(0);
      expect(model.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0007
     * @tc.name      testClearRecentsAllPlain0013
     * @tc.desc      clearing a list without favorites removes everything
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearRecentsAllPlain0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testClearRecentsAllPlain0013 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      expect(model.clearRecents()).assertEqual(2);
      expect(model.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0008
     * @tc.name      testClearRecentsAllFavorite0014
     * @tc.desc      clearing a list of favorites removes nothing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearRecentsAllFavorite0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testClearRecentsAllFavorite0014 begin');
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      model.addRecent(mkItem('id2', 'b.txt', 200, true));
      expect(model.clearRecents()).assertEqual(0);
      expect(model.count()).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0009
     * @tc.name      testClearEmpty0015
     * @tc.desc      clearing an empty model is safe
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearEmpty0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testClearEmpty0015 begin');
      const model: RecentModel = new RecentModel();
      expect(model.clearRecents()).assertEqual(0);
      model.clearAll();
      expect(model.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0010
     * @tc.name      testFavoritesOrder0016
     * @tc.desc      favorites keep the recents order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFavoritesOrder0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFavoritesOrder0016 begin');
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      model.addRecent(mkItem('id2', 'b.txt', 200, false));
      model.addRecent(mkItem('id3', 'c.txt', 300, true));
      expect(namesOf(model.favorites())).assertEqual('c.txt|a.txt');
      expect(namesOf(model.nonFavorites())).assertEqual('b.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0011
     * @tc.name      testSerializeOrder0017
     * @tc.desc      serialization keeps the recents order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeOrder0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeOrder0017 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('c.txt', 'file:///c', false, 300);
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(namesOf(parsed.recents())).assertEqual('c.txt|b.txt|a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0012
     * @tc.name      testSerializeNewline0018
     * @tc.desc      newlines inside names survive serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeNewline0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeNewline0018 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a\nb.txt', 'file:///nl', false, 100);
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(parsed.recents()[0].name).assertEqual('a\nb.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0013
     * @tc.name      testSerializeFavorites0019
     * @tc.desc      favorite flags survive serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSerializeFavorites0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSerializeFavorites0019 begin');
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      model.addRecent(mkItem('id2', 'b.txt', 200, false));
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(parsed.favorites()[0].name).assertEqual('a.txt');
      expect(parsed.nonFavorites()[0].name).assertEqual('b.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0014
     * @tc.name      testParseExtraFields0020
     * @tc.desc      lines with extra fields are skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseExtraFields0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseExtraFields0020 begin');
      const parsed: RecentModel = parseRecentText('a|b|c|0|100|0|extra', RECENT_CAPACITY);
      expect(parsed.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0015
     * @tc.name      testParseNegativeTime0021
     * @tc.desc      numeric negative timestamps are accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseNegativeTime0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseNegativeTime0021 begin');
      const parsed: RecentModel = parseRecentText('a|a.txt|file:///a|0|-5|0', RECENT_CAPACITY);
      expect(parsed.count()).assertEqual(1);
      expect(parsed.recents()[0].lastOpenedSec).assertEqual(-5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0016
     * @tc.name      testParseCapacityClamp0022
     * @tc.desc      parse capacities are clamped like model capacities
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseCapacityClamp0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseCapacityClamp0022 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      const parsed: RecentModel = parseRecentText(model.serialize(), 0);
      expect(parsed.getCapacity()).assertEqual(1);
      expect(parsed.count()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0017
     * @tc.name      testSetItemsCopy0023
     * @tc.desc      setItems copies the source collection
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSetItemsCopy0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSetItemsCopy0023 begin');
      const source: Array<RecentItem> = [mkItem('id1', 'a.txt', 100, false)];
      const model: RecentModel = new RecentModel();
      model.setItems(source);
      source.push(mkItem('id2', 'b.txt', 200, false));
      expect(model.count()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0018
     * @tc.name      testFavoritesCopy0024
     * @tc.desc      favorites returns a new collection
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFavoritesCopy0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFavoritesCopy0024 begin');
      const model: RecentModel = new RecentModel();
      model.addRecent(mkItem('id1', 'a.txt', 100, true));
      const favorites: Array<RecentItem> = model.favorites();
      favorites.push(mkItem('id2', 'b.txt', 200, true));
      expect(model.count()).assertEqual(1);
      expect(model.favoriteCount()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0019
     * @tc.name      testBuildIdMatrix0025
     * @tc.desc      build ids prefer uris over names
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuildIdMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBuildIdMatrix0025 begin');
      expect(buildId('a.txt', 'file:///a.txt')).assertEqual('file:///a.txt');
      expect(buildId('a.txt', '')).assertEqual('name:a.txt');
      expect(buildId('', 'file:///x')).assertEqual('file:///x');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0020
     * @tc.name      testAddOpenId0026
     * @tc.desc      addOpen derives ids from the uri
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAddOpenId0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAddOpenId0026 begin');
      const model: RecentModel = new RecentModel();
      const item: RecentItem = model.addOpen('a.txt', 'file:///docs/a.txt', true, 100);
      expect(item.id).assertEqual('file:///docs/a.txt');
      expect(item.isDlp).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0021
     * @tc.name      testEmptySerialize0027
     * @tc.desc      empty models serialize to empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmptySerialize0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEmptySerialize0027 begin');
      expect(new RecentModel().serialize()).assertEqual('');
      expect(parseRecentText('', RECENT_CAPACITY).isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0022
     * @tc.name      testSpecialCharacters0028
     * @tc.desc      separators and percent signs survive serialization
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSpecialCharacters0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSpecialCharacters0028 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('100%|a;b.txt', 'file:///p%7Cq', false, 100);
      const parsed: RecentModel = parseRecentText(model.serialize(), RECENT_CAPACITY);
      expect(parsed.recents()[0].name).assertEqual('100%|a;b.txt');
      expect(parsed.recents()[0].uri).assertEqual('file:///p%7Cq');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0023
     * @tc.name      testRemoveThenToggle0029
     * @tc.desc      toggling removed items reports failure
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveThenToggle0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRemoveThenToggle0029 begin');
      const model: RecentModel = new RecentModel();
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.remove('file:///a');
      expect(model.toggleFavorite('file:///a')).assertFalse();
      expect(model.updateOpened('file:///a', 200)).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTMATRIX_0024
     * @tc.name      testCapacityTrimKeepsNewest0030
     * @tc.desc      trimming drops the oldest records first
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCapacityTrimKeepsNewest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCapacityTrimKeepsNewest0030 begin');
      const model: RecentModel = new RecentModel();
      model.setCapacity(2);
      model.addOpen('a.txt', 'file:///a', false, 100);
      model.addOpen('b.txt', 'file:///b', false, 200);
      model.addOpen('c.txt', 'file:///c', false, 300);
      expect(namesOf(model.recents())).assertEqual('c.txt|b.txt');
    })
  });
}
