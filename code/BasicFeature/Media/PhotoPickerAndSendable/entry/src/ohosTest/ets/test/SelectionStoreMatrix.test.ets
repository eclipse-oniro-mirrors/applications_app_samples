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

/**
 * Matrix suite of the cross scene selection store of the entry module.
 * Every case builds its own store instance and drives the add, remove,
 * editor source and clear paths with boundary values, duplicates, overflow
 * inputs and longer add and remove sequences.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SelectionStore, selectionStore } from '../../../main/ets/photopicker/data/SelectionStore';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;

/**
 * Builds one synthetic media uri for the given index so every case works on
 * readable inputs that stay clearly distinct from each other.
 * @param index Number appended to the shared uri prefix.
 * @returns A synthetic media uri.
 */
function buildUri(index: number): string {
  // String concat keeps the uri stable and easy to match against failures.
  return 'file://media/edge_photo_' + index.toString();
}

/**
 * Fills the given store with the first nine uris of the shared scheme so the
 * store sits exactly at the configured selection limit.
 * @param store Store instance to fill up to the limit.
 * @returns The first uri that was rejected by the limit guard.
 */
function fillToLimit(store: SelectionStore): string {
  // Add nine accepted uris in a fixed order.
  for (let index: number = 0; index < 9; index++) {
    store.add(buildUri(index));
  }
  // Return the tenth uri, which every caller expects to be rejected.
  return buildUri(9);
}

/**
 * Registers every selection matrix case of the sample.
 * No case mutates the shared singleton; the singleton is only probed read only.
 */
export default function selectionStoreMatrixTest() {
  describe('SelectionStoreMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_0100
     * @tc.name      testSelMat0001
     * @tc.desc      Verify a fresh store exposes the limit of nine, an empty
     *               selection, no editor source and stable limit probes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSelMat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSelMat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build an isolated store so the case never sees another case state.
      const store: SelectionStore = new SelectionStore();
      // The limit is a compile time constant of nine items.
      expect(store.maxSelection()).assertEqual(9);
      // Repeated probes return the very same limit.
      expect(store.maxSelection()).assertEqual(store.maxSelection());
      // A fresh instance carries no picks and no editor pointer.
      expect(store.count()).assertEqual(0);
      expect(store.pickedUris.length).assertEqual(0);
      expect(store.editSource).assertEqual('');
      expect(store.firstUri()).assertEqual('');
      expect(store.hasUri(buildUri(0))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_0200
     * @tc.name      testSelMat0002
     * @tc.desc      Verify three adds keep their exact insertion order inside
     *               the backing array and expose the oldest pick first.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSelMat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSelMat0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const alpha: string = buildUri(101);
      const beta: string = buildUri(102);
      const gamma: string = buildUri(103);
      // Pick three items in a fixed order.
      store.add(alpha);
      store.add(beta);
      store.add(gamma);
      // The size reflects all three picks.
      expect(store.count()).assertEqual(3);
      // Every position keeps the uri given by the add order.
      expect(store.pickedUris[0]).assertEqual(alpha);
      expect(store.pickedUris[1]).assertEqual(beta);
      expect(store.pickedUris[2]).assertEqual(gamma);
      // The default editor input is the oldest pick.
      expect(store.firstUri()).assertEqual(alpha);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_0300
     * @tc.name      testSelMat0003
     * @tc.desc      Verify adding exactly nine uris is fully accepted and the
     *               count matches the advertised maximum.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSelMat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSelMat0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      // Fill the store with nine accepted uris.
      const overflow: string = fillToLimit(store);
      // The store sits exactly at its configured maximum.
      expect(store.count()).assertEqual(9);
      expect(store.count()).assertEqual(store.maxSelection());
      // The overflow uri has not been accepted yet.
      expect(store.hasUri(overflow)).assertFalse();
      // The head of the list is the very first accepted uri.
      expect(store.firstUri()).assertEqual(buildUri(0));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_0400
     * @tc.name      testSelMat0004
     * @tc.desc      Verify the tenth add is rejected at the cap and the nine
     *               accepted uris keep their original positions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSelMat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSelMat0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const overflow: string = fillToLimit(store);
      // The rejected add leaves the count untouched.
      store.add(overflow);
      expect(store.count()).assertEqual(9);
      expect(store.hasUri(overflow)).assertFalse();
      // Every accepted uri still sits at its original index.
      for (let index: number = 0; index < 9; index++) {
        expect(store.pickedUris[index]).assertEqual(buildUri(index));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_0500
     * @tc.name      testSelMat0005
     * @tc.desc      Verify further adds beyond the cap are rejected as well
     *               and never replace an accepted entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      fillToLimit(store);
      // Two more distinct uris are both rejected.
      store.add(buildUri(10));
      store.add(buildUri(11));
      expect(store.count()).assertEqual(9);
      expect(store.hasUri(buildUri(10))).assertFalse();
      expect(store.hasUri(buildUri(11))).assertFalse();
      // The rejected adds did not touch the head or the tail.
      expect(store.pickedUris[0]).assertEqual(buildUri(0));
      expect(store.pickedUris[8]).assertEqual(buildUri(8));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_0600
     * @tc.name      testSelMat0006
     * @tc.desc      Verify removing one entry at the cap frees a slot so the
     *               next add is accepted and appended at the end.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      fillToLimit(store);
      // Free one slot by removing the fifth accepted uri.
      store.remove(buildUri(4));
      expect(store.count()).assertEqual(8);
      // The freed slot accepts a new uri.
      const newcomer: string = buildUri(50);
      store.add(newcomer);
      expect(store.count()).assertEqual(9);
      expect(store.hasUri(newcomer)).assertTrue();
      // The newcomer sits at the end of the ordered list.
      expect(store.pickedUris[8]).assertEqual(newcomer);
      // The removed uri stays absent.
      expect(store.hasUri(buildUri(4))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_0700
     * @tc.name      testSelMat0007
     * @tc.desc      Verify an empty uri is rejected on an empty store and the
     *               store stays completely untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      // The empty uri hits the guard branch of add.
      store.add('');
      expect(store.count()).assertEqual(0);
      expect(store.pickedUris.length).assertEqual(0);
      expect(store.hasUri('')).assertFalse();
      expect(store.firstUri()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_0800
     * @tc.name      testSelMat0008
     * @tc.desc      Verify an empty uri is rejected on a filled store without
     *               changing the size or the order of the picks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const alpha: string = buildUri(201);
      const beta: string = buildUri(202);
      store.add(alpha);
      store.add(beta);
      // The empty uri is ignored while the store holds picks.
      store.add('');
      expect(store.count()).assertEqual(2);
      expect(store.pickedUris[0]).assertEqual(alpha);
      expect(store.pickedUris[1]).assertEqual(beta);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_0900
     * @tc.name      testSelMat0009
     * @tc.desc      Verify duplicate adds are rejected for the head, the
     *               middle and the tail entry of the selection.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const head: string = buildUri(301);
      const middle: string = buildUri(302);
      const tail: string = buildUri(303);
      store.add(head);
      store.add(middle);
      store.add(tail);
      expect(store.count()).assertEqual(3);
      // Re-adding every position is a no-op.
      store.add(head);
      store.add(middle);
      store.add(tail);
      expect(store.count()).assertEqual(3);
      // The original order survives all three rejected duplicates.
      expect(store.pickedUris[0]).assertEqual(head);
      expect(store.pickedUris[1]).assertEqual(middle);
      expect(store.pickedUris[2]).assertEqual(tail);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_1000
     * @tc.name      testSelMat0010
     * @tc.desc      Verify a uri removed and added again is appended at the
     *               end of the ordered list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const alpha: string = buildUri(401);
      const beta: string = buildUri(402);
      store.add(alpha);
      store.add(beta);
      // Remove the head uri and add it again.
      store.remove(alpha);
      expect(store.count()).assertEqual(1);
      store.add(alpha);
      expect(store.count()).assertEqual(2);
      // The re-added uri now sits at the end, not at its old position.
      expect(store.pickedUris[0]).assertEqual(beta);
      expect(store.pickedUris[1]).assertEqual(alpha);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_1100
     * @tc.name      testSelMat0011
     * @tc.desc      Verify removing a middle entry keeps the relative order
     *               of all surviving entries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      store.add(buildUri(501));
      store.add(buildUri(502));
      store.add(buildUri(503));
      store.add(buildUri(504));
      // Remove the second entry of four.
      store.remove(buildUri(502));
      expect(store.count()).assertEqual(3);
      // The surviving entries close the gap and keep their order.
      expect(store.pickedUris[0]).assertEqual(buildUri(501));
      expect(store.pickedUris[1]).assertEqual(buildUri(503));
      expect(store.pickedUris[2]).assertEqual(buildUri(504));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_1200
     * @tc.name      testSelMat0012
     * @tc.desc      Verify removing the head entry promotes the next entry to
     *               the first uri position.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const head: string = buildUri(601);
      const next: string = buildUri(602);
      store.add(head);
      store.add(next);
      // Remove the head uri.
      store.remove(head);
      expect(store.count()).assertEqual(1);
      // The next uri becomes the default editor input.
      expect(store.firstUri()).assertEqual(next);
      expect(store.pickedUris[0]).assertEqual(next);
      expect(store.hasUri(head)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_1300
     * @tc.name      testSelMat0013
     * @tc.desc      Verify removing the tail entry keeps the head and the
     *               order of the surviving entries unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const head: string = buildUri(701);
      const tail: string = buildUri(702);
      store.add(head);
      store.add(tail);
      // Remove the tail uri.
      store.remove(tail);
      expect(store.count()).assertEqual(1);
      // The head keeps its position and the tail is gone.
      expect(store.firstUri()).assertEqual(head);
      expect(store.pickedUris[0]).assertEqual(head);
      expect(store.hasUri(tail)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_1400
     * @tc.name      testSelMat0014
     * @tc.desc      Verify removing an unknown uri leaves a filled store
     *               completely unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const alpha: string = buildUri(801);
      const beta: string = buildUri(802);
      store.add(alpha);
      store.add(beta);
      // The unknown uri is filtered out by nothing.
      store.remove(buildUri(999));
      store.remove('');
      expect(store.count()).assertEqual(2);
      expect(store.pickedUris[0]).assertEqual(alpha);
      expect(store.pickedUris[1]).assertEqual(beta);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_1500
     * @tc.name      testSelMat0015
     * @tc.desc      Verify removing from an empty store is a safe no-op for
     *               known, unknown and empty uris.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      // Three removals on the empty store never throw and never change it.
      store.remove(buildUri(1));
      store.remove(buildUri(2));
      store.remove('');
      expect(store.count()).assertEqual(0);
      expect(store.pickedUris.length).assertEqual(0);
      expect(store.firstUri()).assertEqual('');
      expect(store.editSource).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_1600
     * @tc.name      testSelMat0016
     * @tc.desc      Verify removing every entry one by one empties the store
     *               and a later add is accepted again.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const alpha: string = buildUri(901);
      const beta: string = buildUri(902);
      const gamma: string = buildUri(903);
      store.add(alpha);
      store.add(beta);
      store.add(gamma);
      // Drain the selection one uri at a time.
      store.remove(alpha);
      expect(store.count()).assertEqual(2);
      store.remove(beta);
      expect(store.count()).assertEqual(1);
      store.remove(gamma);
      expect(store.count()).assertEqual(0);
      // The empty store accepts a fresh add again.
      store.add(alpha);
      expect(store.count()).assertEqual(1);
      expect(store.firstUri()).assertEqual(alpha);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_1700
     * @tc.name      testSelMat0017
     * @tc.desc      Verify setEditSource on a fresh store records the editor
     *               pointer and inserts the uri into the selection.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSelMat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSelMat0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const source: string = buildUri(1001);
      // Open the editor on a store that holds no picks yet.
      store.setEditSource(source);
      // The pointer and the selection both carry the uri.
      expect(store.editSource).assertEqual(source);
      expect(store.hasUri(source)).assertTrue();
      expect(store.count()).assertEqual(1);
      expect(store.firstUri()).assertEqual(source);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_1800
     * @tc.name      testSelMat0018
     * @tc.desc      Verify switching the editor source between two uris keeps
     *               exactly two entries and points at the latest one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const alpha: string = buildUri(1101);
      const beta: string = buildUri(1102);
      // Two consecutive editor sources.
      store.setEditSource(alpha);
      store.setEditSource(beta);
      expect(store.editSource).assertEqual(beta);
      expect(store.count()).assertEqual(2);
      // Switching back does not duplicate the first uri.
      store.setEditSource(alpha);
      expect(store.editSource).assertEqual(alpha);
      expect(store.count()).assertEqual(2);
      expect(store.hasUri(alpha)).assertTrue();
      expect(store.hasUri(beta)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_1900
     * @tc.name      testSelMat0019
     * @tc.desc      Verify setEditSource with an empty uri resets the editor
     *               pointer and adds nothing to the selection.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const alpha: string = buildUri(1201);
      store.add(alpha);
      expect(store.count()).assertEqual(1);
      // An empty editor source clears the pointer without touching picks.
      store.setEditSource('');
      expect(store.editSource).assertEqual('');
      expect(store.count()).assertEqual(1);
      expect(store.hasUri(alpha)).assertTrue();
      expect(store.hasUri('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_2000
     * @tc.name      testSelMat0020
     * @tc.desc      Verify setEditSource at the cap records the pointer but
     *               the guarded add rejects the eleventh uri.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSelMat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSelMat0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      fillToLimit(store);
      expect(store.count()).assertEqual(9);
      // The editor pointer moves to a uri outside the full selection.
      const outsider: string = buildUri(1300);
      store.setEditSource(outsider);
      // The pointer is recorded even though the add was rejected.
      expect(store.editSource).assertEqual(outsider);
      expect(store.count()).assertEqual(9);
      expect(store.hasUri(outsider)).assertFalse();
      // The accepted nine keep their order.
      expect(store.pickedUris[0]).assertEqual(buildUri(0));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_2100
     * @tc.name      testSelMat0021
     * @tc.desc      Verify removing a uri that equals the editor pointer but
     *               is not selected resets the pointer to the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      fillToLimit(store);
      const outsider: string = buildUri(1400);
      store.setEditSource(outsider);
      expect(store.editSource).assertEqual(outsider);
      expect(store.count()).assertEqual(9);
      // The pointer uri is not part of the picked list.
      store.remove(outsider);
      // The pointer is reset because it matched the removed uri.
      expect(store.editSource).assertEqual('');
      // The full selection stays untouched by the filtered removal.
      expect(store.count()).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_2200
     * @tc.name      testSelMat0022
     * @tc.desc      Verify clear resets the picks and the editor pointer and
     *               the store accepts new picks right after the reset.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSelMat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSelMat0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const alpha: string = buildUri(1501);
      const beta: string = buildUri(1502);
      store.add(alpha);
      store.add(beta);
      store.setEditSource(beta);
      expect(store.count()).assertEqual(2);
      expect(store.editSource).assertEqual(beta);
      // One clear drops everything.
      store.clear();
      expect(store.pickedUris.length).assertEqual(0);
      expect(store.count()).assertEqual(0);
      expect(store.editSource).assertEqual('');
      expect(store.firstUri()).assertEqual('');
      // A fresh pick is accepted immediately after the reset.
      store.add(alpha);
      expect(store.count()).assertEqual(1);
      expect(store.firstUri()).assertEqual(alpha);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_2300
     * @tc.name      testSelMat0023
     * @tc.desc      Verify clearing an already empty store twice is a stable
     *               no-op.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      // Two consecutive clears on the empty store change nothing.
      store.clear();
      store.clear();
      expect(store.pickedUris.length).assertEqual(0);
      expect(store.count()).assertEqual(0);
      expect(store.editSource).assertEqual('');
      expect(store.firstUri()).assertEqual('');
      expect(store.hasUri(buildUri(0))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_2400
     * @tc.name      testSelMat0024
     * @tc.desc      Verify the shared singleton is a real SelectionStore with
     *               the sample limit and a consistent read only state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The singleton is a genuine store instance consumed by every page.
      expect(selectionStore instanceof SelectionStore).assertTrue();
      // The singleton reports the same configured limit.
      expect(selectionStore.maxSelection()).assertEqual(9);
      // The count always mirrors the length of the observable array.
      expect(selectionStore.count()).assertEqual(selectionStore.pickedUris.length);
      // The read only probe keeps the singleton state unchanged.
      expect(selectionStore.count()).assertLargerOrEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_2500
     * @tc.name      testSelMat0025
     * @tc.desc      Verify uris containing spaces and unicode characters are
     *               accepted and round trip through the store.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSelMat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSelMat0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      const spaced: string = 'file://media/photo with space.jpg';
      const unicode: string = 'file://media/图片_风景.png';
      // Both uris pass the non empty guard.
      store.add(spaced);
      store.add(unicode);
      expect(store.count()).assertEqual(2);
      expect(store.hasUri(spaced)).assertTrue();
      expect(store.hasUri(unicode)).assertTrue();
      // The insertion order is preserved for the unusual uris.
      expect(store.pickedUris[0]).assertEqual(spaced);
      expect(store.pickedUris[1]).assertEqual(unicode);
      expect(store.firstUri()).assertEqual(spaced);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SELMAT_2600
     * @tc.name      testSelMat0026
     * @tc.desc      Verify a longer interleaved add and remove sequence ends
     *               with the exact expected ordered list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSelMat0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testSelMat0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const store: SelectionStore = new SelectionStore();
      // Interleave adds and removals across six distinct uris.
      store.add(buildUri(1));
      store.add(buildUri(2));
      store.remove(buildUri(1));
      store.add(buildUri(3));
      store.add(buildUri(4));
      store.remove(buildUri(3));
      store.add(buildUri(5));
      store.add(buildUri(2));
      // The final order contains only the survivors in add order.
      expect(store.count()).assertEqual(3);
      expect(store.pickedUris[0]).assertEqual(buildUri(2));
      expect(store.pickedUris[1]).assertEqual(buildUri(4));
      expect(store.pickedUris[2]).assertEqual(buildUri(5));
      expect(store.firstUri()).assertEqual(buildUri(2));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
