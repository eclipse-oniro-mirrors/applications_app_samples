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

import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { TagStore, TagItem } from '../../../main/ets/model/ChipModels';

/** 构建含 A/B/C 三条（id 1/2/3）的全新仓库 */
function freshAbc(): TagStore {
  const s: TagStore = new TagStore();
  s.add('A');
  s.add('B');
  s.add('C');
  return s;
}

export default function tagStoreMatrixTest() {
  describe('tagStoreMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_0100
     * @tc.name tagIdsSequentialFromOne0001
     * @tc.desc Verify tag ids start at 1 and increase by one per add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagIdsSequentialFromOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      const all: TagItem[] = store.getAll();
      expect(all[0].id).assertEqual(1);
      expect(all[1].id).assertEqual(2);
      expect(all[2].id).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_0200
     * @tc.name addEmptyTextKeepsEntry0002
     * @tc.desc Verify adding an empty text still creates an entry with that text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('addEmptyTextKeepsEntry0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      const item: TagItem = store.add('');
      expect(store.count()).assertEqual(4);
      expect(item.text).assertEqual('');
      expect(store.findById(item.id) !== null).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_0300
     * @tc.name addUnicodeTextPreserved0003
     * @tc.desc Verify Chinese and Emoji text is stored verbatim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('addUnicodeTextPreserved0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      const item: TagItem = store.add('中文✓标签😀');
      expect(item.text).assertEqual('中文✓标签😀');
      const found: TagItem | null = store.findById(item.id);
      expect(found !== null && found.text === '中文✓标签😀').assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_0400
     * @tc.name addDuplicateTextsGetDistinctIds0004
     * @tc.desc Verify two tags with identical text receive distinct ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('addDuplicateTextsGetDistinctIds0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      const a: TagItem = store.add('重复');
      const b: TagItem = store.add('重复');
      expect(a.id !== b.id).assertTrue();
      expect(store.count()).assertEqual(5);
      expect(store.getAll().filter((t: TagItem): boolean => t.text === '重复').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_0500
     * @tc.name addDefaultsInactiveEnabled0005
     * @tc.desc Verify a new tag starts inactive with enabled true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('addDefaultsInactiveEnabled0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = new TagStore();
      const item: TagItem = store.add('X');
      expect(item.id).assertEqual(1);
      expect(item.activated).assertFalse();
      expect(item.enabled).assertTrue();
      expect(store.activatedCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_0600
     * @tc.name removeMiddleKeepsRemainingOrder0006
     * @tc.desc Verify removing the middle tag keeps the order of the others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('removeMiddleKeepsRemainingOrder0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.remove(2)).assertTrue();
      const texts: string[] = store.getAll().map((t: TagItem): string => t.text);
      expect(texts.join('-')).assertEqual('A-C');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_0700
     * @tc.name removeLastByIdSucceeds0007
     * @tc.desc Verify removing the last tag by its id succeeds and hides it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('removeLastByIdSucceeds0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.remove(3)).assertTrue();
      expect(store.count()).assertEqual(2);
      expect(store.findById(3) === null).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_0800
     * @tc.name removeTwiceSecondReturnsFalse0008
     * @tc.desc Verify removing the same id twice returns true then false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('removeTwiceSecondReturnsFalse0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.remove(1)).assertTrue();
      expect(store.remove(1)).assertFalse();
      expect(store.count()).assertEqual(2);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_0900
     * @tc.name removeNegativeIdReturnsFalse0009
     * @tc.desc Verify removing a negative id returns false and keeps the store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('removeNegativeIdReturnsFalse0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.remove(-1)).assertFalse();
      expect(store.count()).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_1000
     * @tc.name removeZeroIdReturnsFalse0010
     * @tc.desc Verify id 0 never exists so removal returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('removeZeroIdReturnsFalse0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.remove(0)).assertFalse();
      expect(store.count()).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_1100
     * @tc.name toggleMultipleIndependentStates0011
     * @tc.desc Verify activating multiple tags keeps each state independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toggleMultipleIndependentStates0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.toggleActivated(1)).assertTrue();
      expect(store.toggleActivated(3)).assertTrue();
      expect(store.activatedCount()).assertEqual(2);
      const middle: TagItem | null = store.findById(2);
      expect(middle !== null && !middle.activated).assertTrue();
      store.toggleActivated(2);
      expect(store.activatedCount()).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_1200
     * @tc.name toggleTwiceRestoresState0012
     * @tc.desc Verify toggling the same tag twice restores the inactive state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toggleTwiceRestoresState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.toggleActivated(1)).assertTrue();
      expect(store.toggleActivated(1)).assertFalse();
      expect(store.activatedCount()).assertEqual(0);
      expect(store.count()).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_1300
     * @tc.name toggleNegativeIdReturnsNull0013
     * @tc.desc Verify toggling a negative id returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toggleNegativeIdReturnsNull0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.toggleActivated(-5) === null).assertTrue();
      expect(store.activatedCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_1400
     * @tc.name toggleFractionalIdReturnsNull0014
     * @tc.desc Verify toggling a fractional id that matches no tag returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toggleFractionalIdReturnsNull0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.toggleActivated(2.5) === null).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_1500
     * @tc.name setEnabledReEnable0015
     * @tc.desc Verify a disabled tag can be enabled again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setEnabledReEnable0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.setEnabled(1, false)).assertTrue();
      expect(store.setEnabled(1, true)).assertTrue();
      const t: TagItem | null = store.findById(1);
      expect(t !== null && t.enabled).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_1600
     * @tc.name setEnabledMissingNegative0016
     * @tc.desc Verify setEnabled on a negative id returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setEnabledMissingNegative0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.setEnabled(-1, true)).assertFalse();
      expect(store.count()).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_1700
     * @tc.name setEnabledDoesNotChangeActivated0017
     * @tc.desc Verify enable/disable toggling leaves the activated flag untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setEnabledDoesNotChangeActivated0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      store.setEnabled(1, false);
      store.setEnabled(1, true);
      const t: TagItem | null = store.findById(1);
      expect(t !== null && !t.activated).assertTrue();
      expect(store.activatedCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_1800
     * @tc.name findByIdFields0018
     * @tc.desc Verify findById returns the matching tag with all default fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('findByIdFields0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      const t: TagItem | null = store.findById(2);
      expect(t !== null).assertTrue();
      if (t !== null) {
        expect(t.id).assertEqual(2);
        expect(t.text).assertEqual('B');
        expect(t.activated).assertFalse();
        expect(t.enabled).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_1900
     * @tc.name findByIdSharesReferenceWithGetAll0019
     * @tc.desc Verify getAll returns shallow copies sharing the same tag objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('findByIdSharesReferenceWithGetAll0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      const snapshot: TagItem[] = store.getAll();
      expect(store.findById(1) === snapshot[0]).assertTrue();
      store.toggleActivated(1);
      expect(snapshot[0].activated).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_2000
     * @tc.name clearThenAddContinuesIdSequence0020
     * @tc.desc Verify clear keeps the id counter so new tags continue the sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clearThenAddContinuesIdSequence0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      store.clear();
      const item: TagItem = store.add('D');
      expect(item.id).assertEqual(4);
      expect(store.count()).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_2100
     * @tc.name clearTwiceStaysEmpty0021
     * @tc.desc Verify clearing an empty store is a no-op and stays empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clearTwiceStaysEmpty0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.getAll().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_2200
     * @tc.name getAllLengthMatchesCount0022
     * @tc.desc Verify the getAll snapshot length always matches count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('getAllLengthMatchesCount0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.getAll().length).assertEqual(store.count());
      store.remove(2);
      expect(store.getAll().length).assertEqual(store.count());
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_2300
     * @tc.name getAllElementsMatchFindById0023
     * @tc.desc Verify every snapshot element can be located by findById with the same text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('getAllElementsMatchFindById0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      let matched: number = 0;
      for (const t of store.getAll()) {
        const found: TagItem | null = store.findById(t.id);
        if (found !== null && found.text === t.text) {
          matched++;
        }
      }
      expect(matched).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_2400
     * @tc.name activatedCountZeroAfterClear0024
     * @tc.desc Verify clear resets the activated count after activations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('activatedCountZeroAfterClear0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      store.toggleActivated(1);
      store.toggleActivated(2);
      expect(store.activatedCount()).assertEqual(2);
      store.clear();
      expect(store.activatedCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_2500
     * @tc.name removeAllLeavesEmptyStore0025
     * @tc.desc Verify removing every tag one by one leaves an empty store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('removeAllLeavesEmptyStore0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.remove(1)).assertTrue();
      expect(store.remove(2)).assertTrue();
      expect(store.remove(3)).assertTrue();
      expect(store.count()).assertEqual(0);
      expect(store.getAll().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_2600
     * @tc.name addRemoveCycleKeepsCountConsistent0026
     * @tc.desc Verify an add-remove cycle keeps the count and order consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('addRemoveCycleKeepsCountConsistent0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      const item: TagItem = store.add('D');
      expect(store.count()).assertEqual(4);
      expect(store.remove(item.id)).assertTrue();
      expect(store.count()).assertEqual(3);
      const texts: string[] = store.getAll().map((t: TagItem): string => t.text);
      expect(texts.join('-')).assertEqual('A-B-C');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_2700
     * @tc.name disabledTagStillToggleable0027
     * @tc.desc Verify activation is not gated by the enabled flag in TagStore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('disabledTagStillToggleable0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.setEnabled(1, false)).assertTrue();
      expect(store.toggleActivated(1)).assertTrue();
      expect(store.activatedCount()).assertEqual(1);
      expect(store.count()).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_2800
     * @tc.name removeKeepsOtherTagEnabledState0028
     * @tc.desc Verify removing one tag preserves the enabled state of the others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('removeKeepsOtherTagEnabledState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      store.setEnabled(2, false);
      expect(store.remove(1)).assertTrue();
      const t: TagItem | null = store.findById(2);
      expect(t !== null && !t.enabled).assertTrue();
      expect(store.count()).assertEqual(2);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_2900
     * @tc.name fractionalIdRejectedEverywhere0029
     * @tc.desc Verify a fractional id is uniformly rejected by find, toggle, remove and setEnabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fractionalIdRejectedEverywhere0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.findById(1.5) === null).assertTrue();
      expect(store.toggleActivated(1.5) === null).assertTrue();
      expect(store.remove(1.5)).assertFalse();
      expect(store.setEnabled(1.5, true)).assertFalse();
      expect(store.count()).assertEqual(3);
      expect(store.activatedCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_3000
     * @tc.name addFiftyIdsAndCounts0030
     * @tc.desc Verify fifty adds keep ids 1..50 sequential, order intact and counts consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('addFiftyIdsAndCounts0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = new TagStore();
      for (let i = 1; i <= 50; i++) {
        store.add(`标签${i}`);
      }
      expect(store.count()).assertEqual(50);
      expect(store.activatedCount()).assertEqual(0);
      const all: TagItem[] = store.getAll();
      expect(all.length).assertEqual(50);
      expect(all[0].id).assertEqual(1);
      expect(all[49].id).assertEqual(50);
      expect(all[24].text).assertEqual('标签25');
      expect(all[49].text).assertEqual('标签50');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_TAGSTOREMATRIX_3100
     * @tc.name disableToggleRemoveFlow0031
     * @tc.desc Verify disable, toggle and remove combine: removed head leaves disabled-activated middle intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('disableToggleRemoveFlow0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: TagStore = freshAbc();
      expect(store.setEnabled(2, false)).assertTrue();
      expect(store.toggleActivated(2)).assertTrue();
      expect(store.remove(1)).assertTrue();
      const all: TagItem[] = store.getAll();
      expect(all.length).assertEqual(2);
      expect(all[0].id).assertEqual(2);
      expect(all[0].enabled).assertFalse();
      expect(all[0].activated).assertTrue();
      expect(all[1].id).assertEqual(3);
      expect(all[1].enabled).assertTrue();
      expect(all[1].activated).assertFalse();
      expect(store.activatedCount()).assertEqual(1);
      expect(store.findById(1) === null).assertTrue();
    });
  });
}
