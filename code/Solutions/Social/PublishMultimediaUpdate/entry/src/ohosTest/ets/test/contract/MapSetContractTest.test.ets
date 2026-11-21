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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Keyed and unique collections of the runtime.
 * A feed index keeps one entry per owner while a tag list must not repeat a
 * word. The cases pin the insertion order, the overwrite rule, the key
 * identity for not a number and zero, and the de-duplication of a set.
 */
export default function mapSetContractTest() {
  describe('MapSetContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_0100
     * @tc.name MapKeysFollowInsertion001
     * @tc.desc Verify the key iterator keeps the insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MapKeysFollowInsertion_001', 0, (): void => {
      Logger.info(TAG, 'MapKeysFollowInsertion_001 begin');
      const index: Map<string, number> = new Map<string, number>();
      index.set('b', 2);
      index.set('a', 1);
      index.set('c', 3);
      const order: Array<string> = [];
      for (const key of index.keys()) {
        order.push(key);
      }
      expect(order[0]).assertEqual('b');
      expect(order[2]).assertEqual('c');
      Logger.info(TAG, 'MapKeysFollowInsertion_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_0200
     * @tc.name MapGetReturnsStoredValue002
     * @tc.desc Verify a stored value is read back by its key
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MapGetReturnsStoredValue_002', 0, (): void => {
      Logger.info(TAG, 'MapGetReturnsStoredValue_002 begin');
      const index: Map<string, number> = new Map<string, number>();
      index.set('likes', 9);
      expect(index.get('likes')).assertEqual(9);
      Logger.info(TAG, 'MapGetReturnsStoredValue_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_0300
     * @tc.name MapSizeCountsKeys003
     * @tc.desc Verify the size equals the number of distinct keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MapSizeCountsKeys_003', 0, (): void => {
      Logger.info(TAG, 'MapSizeCountsKeys_003 begin');
      const index: Map<string, number> = new Map<string, number>();
      index.set('one', 1);
      index.set('two', 2);
      expect(index.size).assertEqual(2);
      Logger.info(TAG, 'MapSizeCountsKeys_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_0400
     * @tc.name MapHasAfterDeleteFalse004
     * @tc.desc Verify a deleted map key is no longer reported as present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MapHasAfterDeleteFalse_004', 0, (): void => {
      Logger.info(TAG, 'MapHasAfterDeleteFalse_004 begin');
      const index: Map<string, number> = new Map<string, number>();
      index.set('gone', 1);
      index.delete('gone');
      expect(index.has('gone')).assertFalse();
      Logger.info(TAG, 'MapHasAfterDeleteFalse_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_0500
     * @tc.name MapDeleteReportsPresence005
     * @tc.desc Verify delete reports whether the key existed before the call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MapDeleteReportsPresence_005', 0, (): void => {
      Logger.info(TAG, 'MapDeleteReportsPresence_005 begin');
      const index: Map<string, number> = new Map<string, number>();
      index.set('present', 1);
      expect(index.delete('present')).assertTrue();
      expect(index.delete('present')).assertFalse();
      Logger.info(TAG, 'MapDeleteReportsPresence_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_0600
     * @tc.name MapOverwriteKeepsOneEntry006
     * @tc.desc Verify writing an existing key replaces its value without growing the map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MapOverwriteKeepsOneEntry_006', 0, (): void => {
      Logger.info(TAG, 'MapOverwriteKeepsOneEntry_006 begin');
      const index: Map<string, number> = new Map<string, number>();
      index.set('row', 1);
      index.set('row', 2);
      expect(index.size).assertEqual(1);
      expect(index.get('row')).assertEqual(2);
      Logger.info(TAG, 'MapOverwriteKeepsOneEntry_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_0700
     * @tc.name MapClearEmpties007
     * @tc.desc Verify clearing drops every key and resets the size
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MapClearEmpties_007', 0, (): void => {
      Logger.info(TAG, 'MapClearEmpties_007 begin');
      const index: Map<string, number> = new Map<string, number>();
      index.set('a', 1);
      index.set('b', 2);
      index.clear();
      expect(index.size).assertEqual(0);
      Logger.info(TAG, 'MapClearEmpties_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_0800
     * @tc.name MapMissingKeyUndefined008
     * @tc.desc Verify reading a key that was never written yields undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MapMissingKeyUndefined_008', 0, (): void => {
      Logger.info(TAG, 'MapMissingKeyUndefined_008 begin');
      const index: Map<string, number> = new Map<string, number>();
      expect(index.get('absent') === undefined).assertTrue();
      Logger.info(TAG, 'MapMissingKeyUndefined_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_0900
     * @tc.name MapNotANumberKeyMatches009
     * @tc.desc Verify the not a number key is found again by the same key
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MapNotANumberKeyMatches_009', 0, (): void => {
      Logger.info(TAG, 'MapNotANumberKeyMatches_009 begin');
      const index: Map<number, string> = new Map<number, string>();
      index.set(NaN, 'unstable');
      expect(index.has(NaN)).assertTrue();
      Logger.info(TAG, 'MapNotANumberKeyMatches_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_1000
     * @tc.name MapZeroAndNegativeZeroShareKey010
     * @tc.desc Verify zero and negative zero address the same entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MapZeroAndNegativeZeroShareKey_010', 0, (): void => {
      Logger.info(TAG, 'MapZeroAndNegativeZeroShareKey_010 begin');
      const index: Map<number, string> = new Map<number, string>();
      index.set(0, 'zero');
      expect(index.get(-0)).assertEqual('zero');
      Logger.info(TAG, 'MapZeroAndNegativeZeroShareKey_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_1100
     * @tc.name SetDeduplicatesValues011
     * @tc.desc Verify a repeated value is stored only once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SetDeduplicatesValues_011', 0, (): void => {
      Logger.info(TAG, 'SetDeduplicatesValues_011 begin');
      const tags: Set<number> = new Set<number>([1, 2, 2, 3]);
      expect(tags.size).assertEqual(3);
      Logger.info(TAG, 'SetDeduplicatesValues_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_1200
     * @tc.name SetDeleteRemovesValue012
     * @tc.desc Verify a deleted value is no longer reported as present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SetDeleteRemovesValue_012', 0, (): void => {
      Logger.info(TAG, 'SetDeleteRemovesValue_012 begin');
      const tags: Set<string> = new Set<string>();
      tags.add('album');
      tags.delete('album');
      expect(tags.has('album')).assertFalse();
      Logger.info(TAG, 'SetDeleteRemovesValue_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_1300
     * @tc.name SetIterationFollowsInsertion013
     * @tc.desc Verify the value iterator keeps the insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SetIterationFollowsInsertion_013', 0, (): void => {
      Logger.info(TAG, 'SetIterationFollowsInsertion_013 begin');
      const tags: Set<number> = new Set<number>();
      tags.add(3);
      tags.add(1);
      tags.add(2);
      const order: Array<number> = [];
      for (const value of tags) {
        order.push(value);
      }
      expect(order[0]).assertEqual(3);
      expect(order[2]).assertEqual(2);
      Logger.info(TAG, 'SetIterationFollowsInsertion_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_1400
     * @tc.name SetClearEmpties014
     * @tc.desc Verify clearing leaves a set with no values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SetClearEmpties_014', 0, (): void => {
      Logger.info(TAG, 'SetClearEmpties_014 begin');
      const tags: Set<string> = new Set<string>();
      tags.add('trip');
      tags.clear();
      expect(tags.size).assertEqual(0);
      Logger.info(TAG, 'SetClearEmpties_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_1500
     * @tc.name MapForEachVisitsEveryEntry015
     * @tc.desc Verify the callback runs once for every stored entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MapForEachVisitsEveryEntry_015', 0, (): void => {
      Logger.info(TAG, 'MapForEachVisitsEveryEntry_015 begin');
      const index: Map<string, number> = new Map<string, number>();
      index.set('first', 1);
      index.set('second', 2);
      let visited: number = 0;
      index.forEach((value: number, key: string): void => {
        if (key.length !== 0 && value > 0) {
          visited += 1;
        }
      });
      expect(visited).assertEqual(2);
      Logger.info(TAG, 'MapForEachVisitsEveryEntry_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_MAPSET_1600
     * @tc.name MapKeyLookupAgreesWithIteration016
     * @tc.desc Verify every iterated key resolves to its stored value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MapKeyLookupAgreesWithIteration_016', 0, (): void => {
      Logger.info(TAG, 'MapKeyLookupAgreesWithIteration_016 begin');
      const index: Map<string, number> = new Map<string, number>();
      index.set('a', 10);
      index.set('b', 20);
      let mismatched: number = 0;
      for (const key of index.keys()) {
        const stored: number | undefined = index.get(key);
        if (stored === undefined) {
          mismatched += 1;
        }
      }
      expect(mismatched).assertEqual(0);
      Logger.info(TAG, 'MapKeyLookupAgreesWithIteration_016 end');
    });
  });
}
