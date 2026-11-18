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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { SelectionStore } from '../../../main/ets/photopicker/data/SelectionStore';

/**
 * Builds one synthetic media uri for the given index so every case works on
 * readable inputs that stay clearly distinct from each other.
 * @param index Number appended to the shared uri prefix.
 * @returns A synthetic media uri.
 */
function buildUri(index: number): string {
  // String concat keeps the uri stable and easy to match against failures.
  return 'file://media/photo_' + index.toString();
}

/**
 * Registers every state machine case of the cross scene selection store.
 * Each case builds its own SelectionStore instance so no mutable state is
 * shared between cases.
 */
export default function selectionStoreTestsuite() {
  // Group every case under one suite name reported by hypium.
  describe('SelectionStoreStateTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_SELECTION_0100
     * @tc.name      testSelectionStore0001
     * @tc.desc      Verify maxSelection reports the fixed limit of nine and a
     *               fresh store starts with an empty selection and no editor
     *               source.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSelectionStore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      // Build an isolated store so the case never sees another case state.
      const store: SelectionStore = new SelectionStore();
      // The sample keeps the system picker limit of nine items.
      expect(store.maxSelection()).assertEqual(9);
      // A fresh instance must not carry any picked uri.
      expect(store.count()).assertEqual(0);
      // The observable array itself starts empty.
      expect(store.pickedUris.length).assertEqual(0);
      // No editor source is configured before any interaction.
      expect(store.editSource).assertEqual('');
      // An arbitrary uri is not part of a fresh selection.
      expect(store.hasUri(buildUri(0))).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELECTION_0101
     * @tc.name      testSelectionStore0002
     * @tc.desc      Verify adding one uri records it as count one, marks it
     *               present and exposes it as the first uri while the editor
     *               source stays empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSelectionStore0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const store: SelectionStore = new SelectionStore();
      const uri: string = buildUri(21);
      // Pick exactly one media item.
      store.add(uri);
      // The selection size reflects the single pick.
      expect(store.count()).assertEqual(1);
      // The membership check goes through the picked list.
      expect(store.hasUri(uri)).assertTrue();
      // The default editor input is the only picked uri.
      expect(store.firstUri()).assertEqual(uri);
      // The array keeps the uri at index zero because it is the only entry.
      expect(store.pickedUris[0]).assertEqual(uri);
      // A plain add must not configure the editor source.
      expect(store.editSource).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELECTION_0102
     * @tc.name      testSelectionStore0003
     * @tc.desc      Verify an empty uri is rejected by add so the selection
     *               size and the already picked entries stay unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelectionStore0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const store: SelectionStore = new SelectionStore();
      const seed: string = buildUri(7);
      // Seed one valid entry before probing the empty uri guard.
      store.add(seed);
      expect(store.count()).assertEqual(1);
      // The empty uri must hit the guard branch and be ignored.
      store.add('');
      // The rejected add leaves the selection size untouched.
      expect(store.count()).assertEqual(1);
      // The empty uri never becomes a member of the selection.
      expect(store.hasUri('')).assertFalse();
      // The guard must not remove or replace the seeded entry.
      expect(store.firstUri()).assertEqual(seed);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELECTION_0103
     * @tc.name      testSelectionStore0004
     * @tc.desc      Verify re-adding a uri that is already selected keeps the
     *               selection size and the original add order unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelectionStore0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const store: SelectionStore = new SelectionStore();
      const first: string = buildUri(42);
      const second: string = buildUri(43);
      // Build a two item selection before probing the duplicate guard.
      store.add(first);
      store.add(second);
      expect(store.count()).assertEqual(2);
      // Re-adding an entry that is already selected must be a no-op.
      store.add(first);
      // The duplicate does not inflate the selection size.
      expect(store.count()).assertEqual(2);
      // The original add order survives the rejected duplicate.
      expect(store.firstUri()).assertEqual(first);
      // The second entry stays a member of the selection.
      expect(store.hasUri(second)).assertTrue();
      // The backing array holds exactly the two distinct uris.
      expect(store.pickedUris.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELECTION_0104
     * @tc.name      testSelectionStore0005
     * @tc.desc      Verify the selection stops at nine entries so the tenth
     *               uri is dropped while the first nine keep their add order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSelectionStore0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const store: SelectionStore = new SelectionStore();
      // Add ten distinct uris, one more than the configured limit.
      for (let index: number = 0; index < 10; index++) {
        store.add(buildUri(index));
      }
      // The store caps the selection at the configured maximum.
      expect(store.count()).assertEqual(9);
      // The cap matches the advertised maxSelection value.
      expect(store.count()).assertEqual(store.maxSelection());
      // The eleventh request, here the tenth uri, is rejected by the guard.
      expect(store.hasUri(buildUri(9))).assertFalse();
      // Every accepted uri keeps the position given by its add order.
      for (let index: number = 0; index < 9; index++) {
        expect(store.pickedUris[index]).assertEqual(buildUri(index));
      }
      // The very first accepted uri stays a member of the selection.
      expect(store.hasUri(buildUri(0))).assertTrue();
      // The ordered list still exposes the oldest pick as the first uri.
      expect(store.firstUri()).assertEqual(buildUri(0));
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELECTION_0105
     * @tc.name      testSelectionStore0006
     * @tc.desc      Verify removing a selected uri shrinks the selection and
     *               reorders the list while removing an unknown uri leaves the
     *               state untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelectionStore0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const store: SelectionStore = new SelectionStore();
      const keep: string = buildUri(3);
      const drop: string = buildUri(4);
      // Seed two entries so the removal has a visible effect.
      store.add(keep);
      store.add(drop);
      expect(store.count()).assertEqual(2);
      // Remove one of the two selected uris.
      store.remove(drop);
      // The removal shrinks the selection to one entry.
      expect(store.count()).assertEqual(1);
      // The removed uri is no longer a member.
      expect(store.hasUri(drop)).assertFalse();
      // The surviving uri stays a member.
      expect(store.hasUri(keep)).assertTrue();
      // The surviving entry moves to the head of the ordered list.
      expect(store.firstUri()).assertEqual(keep);
      // An unknown uri must not change the selection size.
      store.remove(buildUri(99));
      expect(store.count()).assertEqual(1);
      // The unknown removal must not touch the ordered list either.
      expect(store.firstUri()).assertEqual(keep);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELECTION_0106
     * @tc.name      testSelectionStore0007
     * @tc.desc      Verify removing the uri that is open in the editor resets
     *               the editor source to empty while the remaining selection
     *               survives.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSelectionStore0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const store: SelectionStore = new SelectionStore();
      const edited: string = buildUri(11);
      const other: string = buildUri(12);
      // Seed two entries and open the first one in the editor.
      store.add(edited);
      store.add(other);
      store.setEditSource(edited);
      // The editor source points at the opened uri.
      expect(store.editSource).assertEqual(edited);
      // Remove exactly the uri that is open in the editor.
      store.remove(edited);
      // The editor source resets to the empty state.
      expect(store.editSource).assertEqual('');
      // The remaining selection keeps the other entry only.
      expect(store.count()).assertEqual(1);
      // The other uri survives the removal.
      expect(store.hasUri(other)).assertTrue();
      // The removed uri is no longer a member.
      expect(store.hasUri(edited)).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELECTION_0107
     * @tc.name      testSelectionStore0008
     * @tc.desc      Verify removing a uri that is not the editor source keeps
     *               the editor pointing at its original uri.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelectionStore0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const store: SelectionStore = new SelectionStore();
      const edited: string = buildUri(31);
      const removable: string = buildUri(32);
      // Open an editor source, which also inserts the uri into the selection.
      store.setEditSource(edited);
      expect(store.editSource).assertEqual(edited);
      // Pick a second uri that is not the editor source.
      store.add(removable);
      expect(store.count()).assertEqual(2);
      // Remove the unrelated uri.
      store.remove(removable);
      // The editor source keeps pointing at the original uri.
      expect(store.editSource).assertEqual(edited);
      // Only the removed entry leaves the selection.
      expect(store.count()).assertEqual(1);
      // The editor source stays a member of the selection.
      expect(store.hasUri(edited)).assertTrue();
      // The removed uri is no longer a member.
      expect(store.hasUri(removable)).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELECTION_0108
     * @tc.name      testSelectionStore0009
     * @tc.desc      Verify opening an editor source that was never picked
     *               inserts it into the selection automatically.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSelectionStore0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const store: SelectionStore = new SelectionStore();
      const source: string = buildUri(55);
      // Open an editor source on a fresh store without any prior add call.
      store.setEditSource(source);
      // The editor source is recorded as given.
      expect(store.editSource).assertEqual(source);
      // The auto insertion makes the uri a member of the selection.
      expect(store.hasUri(source)).assertTrue();
      // The selection holds exactly the auto inserted uri.
      expect(store.count()).assertEqual(1);
      // The auto insertion becomes the first uri of the empty selection.
      expect(store.firstUri()).assertEqual(source);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELECTION_0109
     * @tc.name      testSelectionStore0010
     * @tc.desc      Verify firstUri returns an empty string before any pick
     *               and the earliest picked uri after picks are recorded.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelectionStore0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const store: SelectionStore = new SelectionStore();
      const first: string = buildUri(61);
      const second: string = buildUri(62);
      // The empty state must yield an empty string instead of undefined.
      expect(store.firstUri()).assertEqual('');
      // Pick two uris in a fixed order.
      store.add(first);
      store.add(second);
      // The first uri is the oldest pick, not the newest one.
      expect(store.firstUri()).assertEqual(first);
      // The first uri matches the head of the backing array.
      expect(store.firstUri()).assertEqual(store.pickedUris[0]);
      // Both picks are recorded.
      expect(store.count()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELECTION_0110
     * @tc.name      testSelectionStore0011
     * @tc.desc      Verify clear empties the picked list and the editor source
     *               so a finished session leaves no stale state behind.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSelectionStore0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const store: SelectionStore = new SelectionStore();
      const first: string = buildUri(71);
      const second: string = buildUri(72);
      // Build a session state with picks and an active editor source.
      store.add(first);
      store.add(second);
      store.setEditSource(second);
      expect(store.count()).assertEqual(2);
      expect(store.editSource).assertEqual(second);
      // Clear the whole session state in one call.
      store.clear();
      // The backing array is reset to an empty list.
      expect(store.pickedUris.length).assertEqual(0);
      // The selection size reports the empty state as well.
      expect(store.count()).assertEqual(0);
      // The editor source is reset to the empty string.
      expect(store.editSource).assertEqual('');
      // No earlier pick survives the reset.
      expect(store.hasUri(first)).assertFalse();
      // The empty selection exposes no first uri.
      expect(store.firstUri()).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELECTION_0111
     * @tc.name      testSelectionStore0012
     * @tc.desc      Verify a later setEditSource call replaces the editor
     *               source and the selection grows only with uris that are
     *               not selected yet.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelectionStore0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const store: SelectionStore = new SelectionStore();
      const alpha: string = buildUri(81);
      const beta: string = buildUri(82);
      // Open the first editor source on a fresh store.
      store.setEditSource(alpha);
      expect(store.editSource).assertEqual(alpha);
      expect(store.count()).assertEqual(1);
      // Switch to a different uri, which is inserted while the pick stays.
      store.setEditSource(beta);
      // The editor source is overwritten by the newer uri.
      expect(store.editSource).assertEqual(beta);
      // The selection now holds both distinct uris.
      expect(store.count()).assertEqual(2);
      // Switch back to the first uri, which is already selected.
      store.setEditSource(alpha);
      // The editor source points at the restored uri.
      expect(store.editSource).assertEqual(alpha);
      // The dedup guard keeps the selection size stable.
      expect(store.count()).assertEqual(2);
      // Both uris stay members of the selection.
      expect(store.hasUri(alpha)).assertTrue();
      expect(store.hasUri(beta)).assertTrue();
    });
  });
}
