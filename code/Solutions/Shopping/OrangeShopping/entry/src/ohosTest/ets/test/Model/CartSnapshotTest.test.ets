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

import { describe, beforeAll, it, expect, afterEach } from '@ohos/hypium';
import { yieldToEventLoop } from '../Shared/TestDriver';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Cart, CartLine, CartSnapshot } from '../Shared/ShopModel';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Cart.fromLines copies each line, so fixtures survive cart mutations. */
function cartOf(lines: CartLine[]): Cart {
  return Cart.fromLines(lines);
}

function snapshotIds(snapshot: CartSnapshot): number[] {
  let ids: number[] = [];
  for (let index: number = 0; index < snapshot.lines.length; index++) {
    ids.push(snapshot.lines[index].goodsId);
  }
  return ids;
}

export default function cartSnapshotTest() {
  describe('OrangeShoppingCartSnapshot', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cart snapshot suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0010
     * @tc.name      cart_snapshot_empty_cart_has_no_lines_001
     * @tc.desc      Verify cart snapshot empty cart has no lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_empty_cart_has_no_lines_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_empty_cart_has_no_lines_001');
      let cart: Cart = new Cart();
      let snapshot: CartSnapshot = cart.snapshot();
      expect(snapshot.lines.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0020
     * @tc.name      cart_snapshot_keeps_the_line_count_002
     * @tc.desc      Verify cart snapshot keeps the line count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_keeps_the_line_count_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_keeps_the_line_count_002');
      let cart: Cart = cartOf([
        new CartLine(1, 100, 1),
        new CartLine(2, 200, 2)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      expect(snapshot.lines.length).assertEqual(2);
      expect(snapshot.lines.length).assertEqual(cart.distinctCount());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0030
     * @tc.name      cart_snapshot_keeps_goods_ids_003
     * @tc.desc      Verify cart snapshot keeps goods ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_keeps_goods_ids_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_keeps_goods_ids_003');
      let cart: Cart = cartOf([
        new CartLine(3, 100, 1),
        new CartLine(4, 200, 1),
        new CartLine(5, 300, 1)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      expect((snapshotIds(snapshot)).length).assertEqual(([3, 4, 5]).length);
      for (let __i36: number = 0; __i36 < ([3, 4, 5]).length; __i36++) {
        expect((snapshotIds(snapshot))[__i36]).assertEqual(([3, 4, 5])[__i36]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0040
     * @tc.name      cart_snapshot_keeps_quantities_004
     * @tc.desc      Verify cart snapshot keeps quantities.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_keeps_quantities_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_keeps_quantities_004');
      let cart: Cart = cartOf([
        new CartLine(6, 100, 2),
        new CartLine(7, 200, 5)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      expect(snapshot.lines[0].quantity).assertEqual(2);
      expect(snapshot.lines[1].quantity).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0050
     * @tc.name      cart_snapshot_keeps_unit_prices_005
     * @tc.desc      Verify cart snapshot keeps unit prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_keeps_unit_prices_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_keeps_unit_prices_005');
      let cart: Cart = cartOf([
        new CartLine(8, 1500, 1),
        new CartLine(9, 250, 1)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      expect(snapshot.lines[0].unitPriceCents).assertEqual(1500);
      expect(snapshot.lines[1].unitPriceCents).assertEqual(250);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0060
     * @tc.name      cart_snapshot_keeps_boolean_selection_states_006
     * @tc.desc      Verify cart snapshot keeps boolean selection states.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_keeps_boolean_selection_states_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_keeps_boolean_selection_states_006');
      let cart: Cart = cartOf([
        new CartLine(10, 100, 1, true),
        new CartLine(11, 100, 1, false)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      expect(snapshot.lines[0].selected).assertTrue();
      expect(snapshot.lines[1].selected).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0070
     * @tc.name      cart_snapshot_copies_the_line_objects_007
     * @tc.desc      Verify cart snapshot copies the line objects.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_copies_the_line_objects_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_copies_the_line_objects_007');
      let cart: Cart = cartOf([new CartLine(12, 100, 2)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let cartLine: CartLine | undefined = cart.lineAt(0);
      expect(cartLine !== null && cartLine !== undefined).assertTrue();
      // A shared reference would let every later cart edit rewrite the saved state.
      if (cartLine !== undefined) {
        expect(cartLine !== snapshot.lines[0]).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0080
     * @tc.name      cart_snapshot_keeps_the_old_quantity_after_a_change_008
     * @tc.desc      Verify cart snapshot keeps the old quantity after a change.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_keeps_the_old_quantity_after_a_change_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_keeps_the_old_quantity_after_a_change_008');
      let cart: Cart = cartOf([new CartLine(13, 100, 2)]);
      let snapshot: CartSnapshot = cart.snapshot();
      // The 99 here is stock headroom, so quantity 7 applies without clamping
      // and the 2 seen in the snapshot is genuinely the stale value.
      cart.setQuantity(13, 7, 99);
      expect(snapshot.lines[0].quantity).assertEqual(2);
      expect(cart.quantityOf(13)).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0090
     * @tc.name      cart_snapshot_keeps_the_old_selection_after_a_toggle_009
     * @tc.desc      Verify cart snapshot keeps the old selection after a toggle.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_keeps_the_old_selection_after_a_toggle_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_keeps_the_old_selection_after_a_toggle_009');
      let cart: Cart = cartOf([new CartLine(14, 100, 1, true)]);
      let snapshot: CartSnapshot = cart.snapshot();
      cart.toggleSelected(14);
      let cartLine: CartLine | undefined = cart.lineAt(0);
      expect(cartLine !== null && cartLine !== undefined).assertTrue();
      expect(snapshot.lines[0].selected).assertTrue();
      if (cartLine !== undefined) {
        expect(cartLine.selected).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0100
     * @tc.name      cart_snapshot_keeps_a_later_removed_line_010
     * @tc.desc      Verify cart snapshot keeps a later removed line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_keeps_a_later_removed_line_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_keeps_a_later_removed_line_010');
      let cart: Cart = cartOf([
        new CartLine(15, 100, 1),
        new CartLine(16, 200, 1)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      cart.remove(15);
      expect(snapshot.lines.length).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0110
     * @tc.name      cart_snapshot_excludes_later_added_goods_011
     * @tc.desc      Verify cart snapshot excludes later added goods.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_excludes_later_added_goods_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_excludes_later_added_goods_011');
      let cart: Cart = cartOf([new CartLine(17, 100, 1)]);
      let snapshot: CartSnapshot = cart.snapshot();
      cart.add(18, 200, 1, 99);
      expect(snapshot.lines.length).assertEqual(1);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0120
     * @tc.name      cart_snapshot_survives_a_clear_012
     * @tc.desc      Verify cart snapshot survives a clear.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_survives_a_clear_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_survives_a_clear_012');
      let cart: Cart = cartOf([
        new CartLine(19, 100, 1),
        new CartLine(20, 200, 2)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      // clear() swaps the internal array, so the two lines captured above survive.
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(snapshot.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0130
     * @tc.name      cart_snapshot_restores_after_the_cart_was_cleared_013
     * @tc.desc      Verify cart snapshot restores after the cart was cleared.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restores_after_the_cart_was_cleared_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restores_after_the_cart_was_cleared_013');
      let cart: Cart = cartOf([
        new CartLine(21, 100, 2),
        new CartLine(22, 200, 3)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      cart.clear();
      // Restore reads the pre-clear snapshot, so the wiped cart does not matter.
      let restored: Cart = Cart.restore(snapshot);
      expect(restored.distinctCount()).assertEqual(2);
      expect(restored.quantityOf(21)).assertEqual(2);
      expect(restored.quantityOf(22)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0140
     * @tc.name      cart_snapshot_restore_empty_snapshot_014
     * @tc.desc      Verify cart snapshot restore empty snapshot.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_empty_snapshot_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_empty_snapshot_014');
      let cart: Cart = new Cart();
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      expect(restored.isEmpty()).assertTrue();
      expect(restored.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0150
     * @tc.name      cart_snapshot_restore_keeps_the_line_count_015
     * @tc.desc      Verify cart snapshot restore keeps the line count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_keeps_the_line_count_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_keeps_the_line_count_015');
      let cart: Cart = cartOf([
        new CartLine(23, 100, 1),
        new CartLine(24, 200, 1),
        new CartLine(25, 300, 1)
      ]);
      let restored: Cart = Cart.restore(cart.snapshot());
      expect(restored.distinctCount()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0160
     * @tc.name      cart_snapshot_restore_keeps_quantities_016
     * @tc.desc      Verify cart snapshot restore keeps quantities.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_keeps_quantities_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_keeps_quantities_016');
      let cart: Cart = cartOf([
        new CartLine(26, 100, 2),
        new CartLine(27, 200, 4)
      ]);
      let restored: Cart = Cart.restore(cart.snapshot());
      expect(restored.quantityOf(26)).assertEqual(2);
      expect(restored.quantityOf(27)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0170
     * @tc.name      cart_snapshot_restore_keeps_unit_prices_017
     * @tc.desc      Verify cart snapshot restore keeps unit prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_keeps_unit_prices_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_keeps_unit_prices_017');
      let cart: Cart = cartOf([new CartLine(28, 1777, 1)]);
      let restored: Cart = Cart.restore(cart.snapshot());
      let line: CartLine | undefined = restored.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(1777);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0180
     * @tc.name      cart_snapshot_restore_keeps_selection_flags_018
     * @tc.desc      Verify cart snapshot restore keeps selection flags.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_keeps_selection_flags_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_keeps_selection_flags_018');
      let cart: Cart = cartOf([
        new CartLine(29, 100, 1, false),
        new CartLine(30, 200, 1, true)
      ]);
      let restored: Cart = Cart.restore(cart.snapshot());
      let first: CartLine | undefined = restored.lineAt(0);
      let second: CartLine | undefined = restored.lineAt(1);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.selected).assertFalse();
        expect(second.selected).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0190
     * @tc.name      cart_snapshot_restore_copies_snapshot_lines_019
     * @tc.desc      Verify cart snapshot restore copies snapshot lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_copies_snapshot_lines_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_copies_snapshot_lines_019');
      let cart: Cart = cartOf([new CartLine(31, 100, 1)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      let restoredLine: CartLine | undefined = restored.lineAt(0);
      expect(restoredLine !== null && restoredLine !== undefined).assertTrue();
      if (restoredLine !== undefined) {
        expect(restoredLine !== snapshot.lines[0]).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0200
     * @tc.name      cart_snapshot_restored_quantity_change_is_isolated_020
     * @tc.desc      Verify cart snapshot restored quantity change is isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restored_quantity_change_is_isolated_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restored_quantity_change_is_isolated_020');
      let cart: Cart = cartOf([new CartLine(32, 100, 2)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      restored.setQuantity(32, 9, 99);
      expect(restored.quantityOf(32)).assertEqual(9);
      expect(snapshot.lines[0].quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0210
     * @tc.name      cart_snapshot_restored_selection_change_is_isolated_021
     * @tc.desc      Verify cart snapshot restored selection change is isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restored_selection_change_is_isolated_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restored_selection_change_is_isolated_021');
      let cart: Cart = cartOf([new CartLine(33, 100, 1, true)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      restored.setSelected(33, false);
      expect(snapshot.lines[0].selected).assertTrue();
      expect(restored.isAllSelected()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0220
     * @tc.name      cart_snapshot_restored_removal_is_isolated_022
     * @tc.desc      Verify cart snapshot restored removal is isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restored_removal_is_isolated_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restored_removal_is_isolated_022');
      let cart: Cart = cartOf([
        new CartLine(34, 100, 1),
        new CartLine(35, 200, 1)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      restored.remove(34);
      expect(restored.distinctCount()).assertEqual(1);
      expect(snapshot.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0230
     * @tc.name      cart_snapshot_restore_twice_returns_separate_carts_023
     * @tc.desc      Verify cart snapshot restore twice returns separate carts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_twice_returns_separate_carts_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_twice_returns_separate_carts_023');
      let cart: Cart = cartOf([new CartLine(36, 100, 2)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let first: Cart = Cart.restore(snapshot);
      let second: Cart = Cart.restore(snapshot);
      // Restore copies per call, so one snapshot can back two carts that never
      // share state with each other.
      expect(first !== second).assertTrue();
      expect(first.distinctCount()).assertEqual(second.distinctCount());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0240
     * @tc.name      cart_snapshot_restore_twice_quantity_changes_isolated_024
     * @tc.desc      Verify cart snapshot restore twice quantity changes isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_twice_quantity_changes_isolated_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_twice_quantity_changes_isolated_024');
      let cart: Cart = cartOf([new CartLine(37, 100, 2)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let first: Cart = Cart.restore(snapshot);
      let second: Cart = Cart.restore(snapshot);
      first.setQuantity(37, 8, 99);
      expect(first.quantityOf(37)).assertEqual(8);
      expect(second.quantityOf(37)).assertEqual(2);
      expect(snapshot.lines[0].quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0250
     * @tc.name      cart_snapshot_restore_twice_selection_changes_isolated_025
     * @tc.desc      Verify cart snapshot restore twice selection changes isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_twice_selection_changes_isolated_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_twice_selection_changes_isolated_025');
      let cart: Cart = cartOf([new CartLine(38, 100, 1, true)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let first: Cart = Cart.restore(snapshot);
      let second: Cart = Cart.restore(snapshot);
      first.setSelected(38, false);
      expect(first.isAllSelected()).assertFalse();
      expect(second.isAllSelected()).assertTrue();
      expect(snapshot.lines[0].selected).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0260
     * @tc.name      cart_snapshot_restore_twice_removal_isolated_026
     * @tc.desc      Verify cart snapshot restore twice removal isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_twice_removal_isolated_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_twice_removal_isolated_026');
      let cart: Cart = cartOf([
        new CartLine(39, 100, 1),
        new CartLine(40, 200, 1)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      let first: Cart = Cart.restore(snapshot);
      let second: Cart = Cart.restore(snapshot);
      first.remove(39);
      expect(first.distinctCount()).assertEqual(1);
      expect(second.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0270
     * @tc.name      cart_snapshot_consecutive_snapshots_have_same_content_027
     * @tc.desc      Verify cart snapshot consecutive snapshots have same content.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_consecutive_snapshots_have_same_content_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_consecutive_snapshots_have_same_content_027');
      let cart: Cart = cartOf([
        new CartLine(41, 100, 2),
        new CartLine(42, 200, 3)
      ]);
      let first: CartSnapshot = cart.snapshot();
      let second: CartSnapshot = cart.snapshot();
      expect((snapshotIds(first)).length).assertEqual((snapshotIds(second)).length);
      for (let __i37: number = 0; __i37 < (snapshotIds(second)).length; __i37++) {
        expect((snapshotIds(first))[__i37]).assertEqual((snapshotIds(second))[__i37]);
      }
      expect(first.lines[0].quantity).assertEqual(second.lines[0].quantity);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0280
     * @tc.name      cart_snapshot_consecutive_snapshots_are_distinct_objects_028
     * @tc.desc      Verify cart snapshot consecutive snapshots are distinct objects.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_consecutive_snapshots_are_distinct_objects_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_consecutive_snapshots_are_distinct_objects_028');
      let cart: Cart = cartOf([new CartLine(43, 100, 1)]);
      let first: CartSnapshot = cart.snapshot();
      let second: CartSnapshot = cart.snapshot();
      expect(first !== second).assertTrue();
      expect(first.lines !== second.lines).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0290
     * @tc.name      cart_snapshot_consecutive_snapshots_have_distinct_lines_029
     * @tc.desc      Verify cart snapshot consecutive snapshots have distinct lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_consecutive_snapshots_have_distinct_lines_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_consecutive_snapshots_have_distinct_lines_029');
      let cart: Cart = cartOf([new CartLine(44, 100, 1)]);
      let first: CartSnapshot = cart.snapshot();
      let second: CartSnapshot = cart.snapshot();
      expect(first.lines[0] !== second.lines[0]).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0300
     * @tc.name      cart_snapshot_second_snapshot_tracks_the_change_030
     * @tc.desc      Verify cart snapshot second snapshot tracks the change.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_second_snapshot_tracks_the_change_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_second_snapshot_tracks_the_change_030');
      let cart: Cart = cartOf([new CartLine(45, 100, 2)]);
      let first: CartSnapshot = cart.snapshot();
      cart.setQuantity(45, 5, 99);
      let second: CartSnapshot = cart.snapshot();
      expect(first.lines[0].quantity).assertEqual(2);
      expect(second.lines[0].quantity).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0310
     * @tc.name      cart_snapshot_roundtrip_keeps_the_subtotal_031
     * @tc.desc      Verify cart snapshot roundtrip keeps the subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_roundtrip_keeps_the_subtotal_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_roundtrip_keeps_the_subtotal_031');
      let cart: Cart = cartOf([
        new CartLine(46, 1000, 2, true),
        new CartLine(47, 500, 3, false)
      ]);
      let before: number = cart.subtotal().cents();
      let restored: Cart = Cart.restore(cart.snapshot());
      expect(restored.subtotal().cents()).assertEqual(before);
      // Subtotal counts selected lines only: 2 x 1000; the unselected 3 x 500 line adds nothing.
      expect(before).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0320
     * @tc.name      cart_snapshot_roundtrip_keeps_the_selected_quantity_032
     * @tc.desc      Verify cart snapshot roundtrip keeps the selected quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_roundtrip_keeps_the_selected_quantity_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_roundtrip_keeps_the_selected_quantity_032');
      let cart: Cart = cartOf([
        new CartLine(48, 1000, 2, true),
        new CartLine(49, 500, 3, false)
      ]);
      let restored: Cart = Cart.restore(cart.snapshot());
      expect(restored.selectedQuantity()).assertEqual(cart.selectedQuantity());
      expect(restored.selectedQuantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0330
     * @tc.name      cart_snapshot_roundtrip_keeps_the_total_quantity_033
     * @tc.desc      Verify cart snapshot roundtrip keeps the total quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_roundtrip_keeps_the_total_quantity_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_roundtrip_keeps_the_total_quantity_033');
      let cart: Cart = cartOf([
        new CartLine(50, 1000, 2, true),
        new CartLine(51, 500, 3, false)
      ]);
      expect(Cart.restore(cart.snapshot()).totalQuantity()).assertEqual(cart.totalQuantity());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0340
     * @tc.name      cart_snapshot_roundtrip_keeps_the_all_lines_subtotal_034
     * @tc.desc      Verify cart snapshot roundtrip keeps the all lines subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_roundtrip_keeps_the_all_lines_subtotal_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_roundtrip_keeps_the_all_lines_subtotal_034');
      let cart: Cart = cartOf([
        new CartLine(52, 1000, 2, true),
        new CartLine(53, 500, 3, false)
      ]);
      let before: number = cart.allLinesSubtotal().cents();
      let restored: Cart = Cart.restore(cart.snapshot());
      expect(restored.allLinesSubtotal().cents()).assertEqual(before);
      // allLinesSubtotal ignores the selection flag: 2 x 1000 plus 3 x 500 = 3500.
      expect(before).assertEqual(3500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0350
     * @tc.name      cart_snapshot_restore_then_snapshot_keeps_ids_035
     * @tc.desc      Verify cart snapshot restore then snapshot keeps ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_then_snapshot_keeps_ids_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_then_snapshot_keeps_ids_035');
      let cart: Cart = cartOf([
        new CartLine(54, 100, 1),
        new CartLine(55, 200, 1)
      ]);
      let restored: Cart = Cart.restore(cart.snapshot());
      expect((snapshotIds(restored.snapshot())).length).assertEqual(([54, 55]).length);
      for (let __i38: number = 0; __i38 < ([54, 55]).length; __i38++) {
        expect((snapshotIds(restored.snapshot()))[__i38]).assertEqual(([54, 55])[__i38]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0360
     * @tc.name      cart_snapshot_restored_mutation_leaves_original_cart_036
     * @tc.desc      Verify cart snapshot restored mutation leaves original cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restored_mutation_leaves_original_cart_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restored_mutation_leaves_original_cart_036');
      let cart: Cart = cartOf([new CartLine(56, 100, 2)]);
      let restored: Cart = Cart.restore(cart.snapshot());
      restored.setQuantity(56, 8, 99);
      restored.setSelected(56, false);
      expect(cart.quantityOf(56)).assertEqual(2);
      expect(cart.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0370
     * @tc.name      cart_snapshot_lines_array_is_independent_037
     * @tc.desc      Verify cart snapshot lines array is independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_lines_array_is_independent_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_lines_array_is_independent_037');
      let cart: Cart = cartOf([
        new CartLine(57, 100, 1),
        new CartLine(58, 200, 1)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      // The snapshot owns its array, so this splice cannot shorten the cart's two lines.
      snapshot.lines.splice(0, 1);
      expect(snapshot.lines.length).assertEqual(1);
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0380
     * @tc.name      cart_snapshot_restored_lines_array_is_independent_038
     * @tc.desc      Verify cart snapshot restored lines array is independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restored_lines_array_is_independent_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restored_lines_array_is_independent_038');
      let cart: Cart = cartOf([
        new CartLine(59, 100, 1),
        new CartLine(60, 200, 1)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      restored.allLines().splice(0, 1);
      expect(restored.distinctCount()).assertEqual(1);
      expect(snapshot.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0390
     * @tc.name      cart_snapshot_preserves_a_zero_price_line_039
     * @tc.desc      Verify cart snapshot preserves a zero price line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_preserves_a_zero_price_line_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_preserves_a_zero_price_line_039');
      let cart: Cart = cartOf([new CartLine(61, 0, 3, true)]);
      let restored: Cart = Cart.restore(cart.snapshot());
      let line: CartLine | undefined = restored.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(0);
        expect(line.quantity).assertEqual(3);
      }
      // A 0-cent price is a free gift line; it must round-trip and contribute 0, not vanish.
      expect(restored.subtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0400
     * @tc.name      cart_snapshot_preserves_a_zero_quantity_line_040
     * @tc.desc      Verify cart snapshot preserves a zero quantity line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_preserves_a_zero_quantity_line_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_preserves_a_zero_quantity_line_040');
      let cart: Cart = cartOf([new CartLine(62, 500, 0, true)]);
      let snapshot: CartSnapshot = cart.snapshot();
      // setQuantity(…, 0) drops a line, but snapshot and restore copy verbatim,
      // so this zero-quantity line has to come back unchanged.
      expect(snapshot.lines[0].quantity).assertEqual(0);
      let restored: Cart = Cart.restore(snapshot);
      expect(restored.quantityOf(62)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0410
     * @tc.name      cart_snapshot_preserves_duplicate_goods_lines_041
     * @tc.desc      Verify cart snapshot preserves duplicate goods lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_preserves_duplicate_goods_lines_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_preserves_duplicate_goods_lines_041');
      let cart: Cart = cartOf([
        new CartLine(63, 100, 1),
        new CartLine(63, 200, 2)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      // fromLines does not merge duplicate goodsId 63, so both rows survive with
      // their own quantities 1 and 2.
      expect(snapshot.lines.length).assertEqual(2);
      expect(snapshot.lines[0].quantity).assertEqual(1);
      expect(snapshot.lines[1].quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0420
     * @tc.name      cart_snapshot_restore_preserves_duplicate_goods_lines_042
     * @tc.desc      Verify cart snapshot restore preserves duplicate goods lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_preserves_duplicate_goods_lines_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_preserves_duplicate_goods_lines_042');
      let cart: Cart = cartOf([
        new CartLine(64, 100, 1),
        new CartLine(64, 200, 2)
      ]);
      let restored: Cart = Cart.restore(cart.snapshot());
      let second: CartLine | undefined = restored.lineAt(1);
      expect(restored.distinctCount()).assertEqual(2);
      expect(second !== null && second !== undefined).assertTrue();
      if (second !== undefined) {
        expect(second.quantity).assertEqual(2);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0430
     * @tc.name      cart_snapshot_after_deselect_all_keeps_false_flags_043
     * @tc.desc      Verify cart snapshot after deselect all keeps false flags.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_after_deselect_all_keeps_false_flags_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_after_deselect_all_keeps_false_flags_043');
      let cart: Cart = cartOf([
        new CartLine(65, 100, 1, true),
        new CartLine(66, 200, 1, true)
      ]);
      cart.setAllSelected(false);
      let snapshot: CartSnapshot = cart.snapshot();
      expect(snapshot.lines[0].selected).assertFalse();
      expect(snapshot.lines[1].selected).assertFalse();
      expect(Cart.restore(snapshot).selectedQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0440
     * @tc.name      cart_snapshot_single_line_cart_044
     * @tc.desc      Verify cart snapshot single line cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_single_line_cart_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_single_line_cart_044');
      let cart: Cart = cartOf([new CartLine(67, 999, 4, true)]);
      let snapshot: CartSnapshot = cart.snapshot();
      expect(snapshot.lines.length).assertEqual(1);
      expect(snapshot.lines[0].unitPriceCents).assertEqual(999);
      expect(snapshot.lines[0].quantity).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0450
     * @tc.name      cart_snapshot_ten_lines_are_kept_045
     * @tc.desc      Verify cart snapshot ten lines are kept.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_ten_lines_are_kept_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_ten_lines_are_kept_045');
      let lines: CartLine[] = [];
      for (let index: number = 0; index < 10; index++) {
        lines.push(new CartLine(1100 + index, 100 + index, index + 1));
      }
      let cart: Cart = cartOf(lines);
      let snapshot: CartSnapshot = cart.snapshot();
      // Lines 1100..1109 are generated with quantity index + 1, so the last one holds 10.
      expect(snapshot.lines.length).assertEqual(10);
      expect(snapshot.lines[9].quantity).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0460
     * @tc.name      cart_snapshot_ten_lines_restore_046
     * @tc.desc      Verify cart snapshot ten lines restore.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_ten_lines_restore_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_ten_lines_restore_046');
      let lines: CartLine[] = [];
      for (let index: number = 0; index < 10; index++) {
        lines.push(new CartLine(1200 + index, 100 + index, index + 1));
      }
      let cart: Cart = cartOf(lines);
      let restored: Cart = Cart.restore(cart.snapshot());
      expect(restored.distinctCount()).assertEqual(10);
      // Quantities 1 through 10 sum to 55; one lost or reordered line would move it.
      expect(restored.totalQuantity()).assertEqual(55);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0470
     * @tc.name      cart_snapshot_ignores_a_later_unit_price_mutation_047
     * @tc.desc      Verify cart snapshot ignores a later unit price mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_ignores_a_later_unit_price_mutation_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_ignores_a_later_unit_price_mutation_047');
      let cart: Cart = cartOf([new CartLine(68, 100, 1)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let cartLine: CartLine | undefined = cart.lineAt(0);
      expect(cartLine !== null && cartLine !== undefined).assertTrue();
      if (cartLine !== undefined) {
        // Editing the live line to 999 only leaves the snapshot correct when
        // the snapshot stored a copy of the 100-cent price.
        cartLine.unitPriceCents = 999;
      }
      expect(snapshot.lines[0].unitPriceCents).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0480
     * @tc.name      cart_snapshot_restore_twice_price_changes_isolated_048
     * @tc.desc      Verify cart snapshot restore twice price changes isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_twice_price_changes_isolated_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_twice_price_changes_isolated_048');
      let cart: Cart = cartOf([new CartLine(69, 100, 1)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let first: Cart = Cart.restore(snapshot);
      let second: Cart = Cart.restore(snapshot);
      let firstLine: CartLine | undefined = first.lineAt(0);

      expect(firstLine !== null && firstLine !== undefined).assertTrue();
      if (firstLine !== undefined) {
        firstLine.unitPriceCents = 999;
      }
      let secondLine: CartLine | undefined = second.lineAt(0);
      expect(secondLine !== null && secondLine !== undefined).assertTrue();
      if (secondLine !== undefined) {
        expect(secondLine.unitPriceCents).assertEqual(100);
      }
      expect(snapshot.lines[0].unitPriceCents).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0490
     * @tc.name      cart_snapshot_cart_array_changes_are_not_visible_049
     * @tc.desc      Verify cart snapshot cart array changes are not visible.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_cart_array_changes_are_not_visible_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_cart_array_changes_are_not_visible_049');
      let cart: Cart = cartOf([
        new CartLine(70, 100, 1),
        new CartLine(71, 200, 1)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      // allLines() hands out the internal array, so this splice really removes
      // line 70 while the earlier snapshot keeps both entries.
      cart.allLines().splice(0, 1);
      expect(cart.distinctCount()).assertEqual(1);
      expect(snapshot.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0500
     * @tc.name      cart_snapshot_snapshot_mutation_is_not_visible_to_restored_050
     * @tc.desc      Verify cart snapshot snapshot mutation is not visible to restored.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_snapshot_mutation_is_not_visible_to_restored_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_snapshot_mutation_is_not_visible_to_restored_050');
      let cart: Cart = cartOf([new CartLine(74, 100, 2)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      // Writing 99 into the snapshot must not reach a cart that restore already copied.
      snapshot.lines[0].quantity = 99;
      expect(restored.quantityOf(74)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0510
     * @tc.name      cart_snapshot_quantities_match_the_source_051
     * @tc.desc      Verify cart snapshot quantities match the source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_quantities_match_the_source_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_quantities_match_the_source_051');
      let cart: Cart = cartOf([
        new CartLine(75, 100, 3),
        new CartLine(76, 200, 4),
        new CartLine(77, 300, 5)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      let lines: CartLine[] = cart.allLines();
      for (let index: number = 0; index < lines.length; index++) {
        expect(snapshot.lines[index].quantity).assertEqual(lines[index].quantity);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0520
     * @tc.name      cart_snapshot_selection_flags_match_the_source_052
     * @tc.desc      Verify cart snapshot selection flags match the source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_selection_flags_match_the_source_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_selection_flags_match_the_source_052');
      let cart: Cart = cartOf([
        new CartLine(78, 100, 1, true),
        new CartLine(79, 200, 1, false),
        new CartLine(80, 300, 1, true)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      let lines: CartLine[] = cart.allLines();
      for (let index: number = 0; index < lines.length; index++) {
        expect(snapshot.lines[index].selected).assertEqual(lines[index].selected);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0530
     * @tc.name      cart_snapshot_restore_keeps_source_order_053
     * @tc.desc      Verify cart snapshot restore keeps source order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_keeps_source_order_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_keeps_source_order_053');
      let cart: Cart = cartOf([
        new CartLine(81, 100, 1),
        new CartLine(82, 200, 1),
        new CartLine(83, 300, 1)
      ]);
      let restored: Cart = Cart.restore(cart.snapshot());
      expect((snapshotIds(restored.snapshot())).length).assertEqual(([81, 82, 83]).length);
      for (let __i39: number = 0; __i39 < ([81, 82, 83]).length; __i39++) {
        expect((snapshotIds(restored.snapshot()))[__i39]).assertEqual(([81, 82, 83])[__i39]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0540
     * @tc.name      cart_snapshot_keeps_flags_after_select_all_false_054
     * @tc.desc      Verify cart snapshot keeps flags after select all false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_keeps_flags_after_select_all_false_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_keeps_flags_after_select_all_false_054');
      let cart: Cart = cartOf([
        new CartLine(84, 100, 1, true),
        new CartLine(85, 200, 1, true)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      cart.setAllSelected(false);
      let restored: Cart = Cart.restore(snapshot);
      expect(snapshot.lines[0].selected).assertTrue();
      expect(snapshot.lines[1].selected).assertTrue();
      expect(restored.selectedQuantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0550
     * @tc.name      cart_snapshot_keeps_state_after_two_mutations_055
     * @tc.desc      Verify cart snapshot keeps state after two mutations.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_keeps_state_after_two_mutations_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_keeps_state_after_two_mutations_055');
      let cart: Cart = cartOf([new CartLine(86, 100, 2, true)]);
      let snapshot: CartSnapshot = cart.snapshot();
      cart.setQuantity(86, 5, 99);
      cart.setSelected(86, false);
      expect(snapshot.lines[0].quantity).assertEqual(2);
      expect(snapshot.lines[0].selected).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0560
     * @tc.name      cart_snapshot_after_removal_excludes_the_line_056
     * @tc.desc      Verify cart snapshot after removal excludes the line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_after_removal_excludes_the_line_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_after_removal_excludes_the_line_056');
      let cart: Cart = cartOf([
        new CartLine(87, 100, 1),
        new CartLine(88, 200, 1)
      ]);
      cart.remove(87);
      let snapshot: CartSnapshot = cart.snapshot();
      expect(snapshot.lines.length).assertEqual(1);
      expect(snapshot.lines[0].goodsId).assertEqual(88);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0570
     * @tc.name      cart_snapshot_after_add_includes_the_line_057
     * @tc.desc      Verify cart snapshot after add includes the line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_after_add_includes_the_line_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_after_add_includes_the_line_057');
      let cart: Cart = cartOf([new CartLine(89, 100, 1)]);
      cart.add(90, 200, 1, 99);
      let snapshot: CartSnapshot = cart.snapshot();
      expect(snapshot.lines.length).assertEqual(2);
      expect((snapshotIds(snapshot)).length).assertEqual(([89, 90]).length);
      for (let __i40: number = 0; __i40 < ([89, 90]).length; __i40++) {
        expect((snapshotIds(snapshot))[__i40]).assertEqual(([89, 90])[__i40]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0580
     * @tc.name      cart_snapshot_after_price_change_sees_the_new_price_058
     * @tc.desc      Verify cart snapshot after price change sees the new price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_after_price_change_sees_the_new_price_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_after_price_change_sees_the_new_price_058');
      let cart: Cart = cartOf([new CartLine(91, 100, 1)]);
      let cartLine: CartLine | undefined = cart.lineAt(0);
      expect(cartLine !== null && cartLine !== undefined).assertTrue();
      if (cartLine !== undefined) {
        // The edit lands before snapshotting, so 999 is the price the frozen state must show.
        cartLine.unitPriceCents = 999;
      }
      let snapshot: CartSnapshot = cart.snapshot();
      expect(snapshot.lines[0].unitPriceCents).assertEqual(999);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0590
     * @tc.name      cart_snapshot_restore_does_not_alias_original_lines_059
     * @tc.desc      Verify cart snapshot restore does not alias original lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_does_not_alias_original_lines_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_does_not_alias_original_lines_059');
      let cart: Cart = cartOf([new CartLine(92, 100, 1)]);
      let restored: Cart = Cart.restore(cart.snapshot());
      let cartLine: CartLine | undefined = cart.lineAt(0);
      let restoredLine: CartLine | undefined = restored.lineAt(0);
      expect(cartLine !== null && cartLine !== undefined).assertTrue();
      expect(restoredLine !== null && restoredLine !== undefined).assertTrue();
      if (cartLine !== undefined && restoredLine !== undefined) {
        expect(cartLine !== restoredLine).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0600
     * @tc.name      cart_snapshot_restore_twice_keeps_order_060
     * @tc.desc      Verify cart snapshot restore twice keeps order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_twice_keeps_order_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_twice_keeps_order_060');
      let cart: Cart = cartOf([
        new CartLine(93, 100, 1),
        new CartLine(94, 200, 1)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      let first: Cart = Cart.restore(snapshot);
      let second: Cart = Cart.restore(snapshot);
      expect((snapshotIds(first.snapshot())).length).assertEqual(([93, 94]).length);
      for (let __i41: number = 0; __i41 < ([93, 94]).length; __i41++) {
        expect((snapshotIds(first.snapshot()))[__i41]).assertEqual(([93, 94])[__i41]);
      }
      expect((snapshotIds(second.snapshot())).length).assertEqual(([93, 94]).length);
      for (let __i42: number = 0; __i42 < ([93, 94]).length; __i42++) {
        expect((snapshotIds(second.snapshot()))[__i42]).assertEqual(([93, 94])[__i42]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0610
     * @tc.name      cart_snapshot_prices_match_the_source_061
     * @tc.desc      Verify cart snapshot prices match the source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_prices_match_the_source_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_prices_match_the_source_061');
      let cart: Cart = cartOf([
        new CartLine(95, 11, 1),
        new CartLine(96, 22, 1),
        new CartLine(97, 33, 1)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      let lines: CartLine[] = cart.allLines();
      for (let index: number = 0; index < lines.length; index++) {
        expect(snapshot.lines[index].unitPriceCents).assertEqual(lines[index].unitPriceCents);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0620
     * @tc.name      cart_snapshot_restore_all_selected_true_062
     * @tc.desc      Verify cart snapshot restore all selected true.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_all_selected_true_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_all_selected_true_062');
      let cart: Cart = cartOf([
        new CartLine(98, 100, 2, true),
        new CartLine(99, 200, 3, true)
      ]);
      let restored: Cart = Cart.restore(cart.snapshot());
      expect(restored.isAllSelected()).assertTrue();
      // selectedQuantity sums quantities, not lines: 2 + 3 = 5 with both flags true.
      expect(restored.selectedQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0630
     * @tc.name      cart_snapshot_after_deselect_one_keeps_mixed_flags_063
     * @tc.desc      Verify cart snapshot after deselect one keeps mixed flags.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_after_deselect_one_keeps_mixed_flags_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_after_deselect_one_keeps_mixed_flags_063');
      let cart: Cart = cartOf([
        new CartLine(100, 100, 1, true),
        new CartLine(101, 200, 1, true)
      ]);
      cart.setSelected(101, false);
      let snapshot: CartSnapshot = cart.snapshot();
      expect(snapshot.lines[0].selected).assertTrue();
      expect(snapshot.lines[1].selected).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0640
     * @tc.name      cart_snapshot_second_after_clear_is_empty_064
     * @tc.desc      Verify cart snapshot second after clear is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_second_after_clear_is_empty_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_second_after_clear_is_empty_064');
      let cart: Cart = cartOf([
        new CartLine(102, 100, 1),
        new CartLine(103, 200, 1)
      ]);
      let first: CartSnapshot = cart.snapshot();
      cart.clear();
      let second: CartSnapshot = cart.snapshot();
      expect(first.lines.length).assertEqual(2);
      expect(second.lines.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0650
     * @tc.name      cart_snapshot_empty_roundtrip_stays_empty_065
     * @tc.desc      Verify cart snapshot empty roundtrip stays empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_empty_roundtrip_stays_empty_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_empty_roundtrip_stays_empty_065');
      let cart: Cart = new Cart();
      let restored: Cart = Cart.restore(cart.snapshot());
      let second: CartSnapshot = restored.snapshot();
      expect(second.lines.length).assertEqual(0);
      expect(restored.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0660
     * @tc.name      cart_snapshot_after_toggle_sees_the_new_flag_066
     * @tc.desc      Verify cart snapshot after toggle sees the new flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_after_toggle_sees_the_new_flag_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_after_toggle_sees_the_new_flag_066');
      let cart: Cart = cartOf([new CartLine(104, 100, 1, true)]);
      let first: CartSnapshot = cart.snapshot();
      cart.toggleSelected(104);
      let second: CartSnapshot = cart.snapshot();
      expect(first.lines[0].selected).assertTrue();
      expect(second.lines[0].selected).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0670
     * @tc.name      cart_snapshot_restored_empty_add_is_not_visible_067
     * @tc.desc      Verify cart snapshot restored empty add is not visible.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restored_empty_add_is_not_visible_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restored_empty_add_is_not_visible_067');
      let cart: Cart = new Cart();
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      restored.add(105, 100, 1, 99);
      expect(restored.distinctCount()).assertEqual(1);
      expect(snapshot.lines.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0680
     * @tc.name      cart_snapshot_restore_twice_clear_is_isolated_068
     * @tc.desc      Verify cart snapshot restore twice clear is isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_twice_clear_is_isolated_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_twice_clear_is_isolated_068');
      let cart: Cart = cartOf([
        new CartLine(106, 100, 1),
        new CartLine(107, 200, 1)
      ]);
      let snapshot: CartSnapshot = cart.snapshot();
      let first: Cart = Cart.restore(snapshot);
      let second: Cart = Cart.restore(snapshot);
      first.clear();
      expect(first.isEmpty()).assertTrue();
      expect(second.distinctCount()).assertEqual(2);
      expect(snapshot.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0690
     * @tc.name      cart_snapshot_original_change_after_restore_is_isolated_069
     * @tc.desc      Verify cart snapshot original change after restore is isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_original_change_after_restore_is_isolated_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_original_change_after_restore_is_isolated_069');
      let cart: Cart = cartOf([new CartLine(108, 100, 2)]);
      let restored: Cart = Cart.restore(cart.snapshot());
      cart.setQuantity(108, 9, 99);
      expect(cart.quantityOf(108)).assertEqual(9);
      expect(restored.quantityOf(108)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0700
     * @tc.name      cart_snapshot_after_select_all_true_reflects_flags_070
     * @tc.desc      Verify cart snapshot after select all true reflects flags.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_after_select_all_true_reflects_flags_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_after_select_all_true_reflects_flags_070');
      let cart: Cart = cartOf([
        new CartLine(109, 100, 1, true),
        new CartLine(110, 200, 1, true)
      ]);
      cart.setSelected(110, false);
      let mixed: CartSnapshot = cart.snapshot();
      cart.setAllSelected(true);
      let selected: CartSnapshot = cart.snapshot();
      // The two snapshots bracket setAllSelected(true), so line 110 must read false
      // in mixed and true in selected.
      expect(mixed.lines[1].selected).assertFalse();
      expect(selected.lines[1].selected).assertTrue();
      expect(Cart.restore(selected).isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0710
     * @tc.name      cart_snapshot_after_quantity_change_restores_new_value_071
     * @tc.desc      Verify cart snapshot after quantity change restores new value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_after_quantity_change_restores_new_value_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_after_quantity_change_restores_new_value_071');
      let cart: Cart = cartOf([new CartLine(111, 100, 2)]);
      cart.setQuantity(111, 9, 99);
      let restored: Cart = Cart.restore(cart.snapshot());
      expect(restored.quantityOf(111)).assertEqual(9);
      // 9 units at 100 cents give 900; the 99 stock argument keeps 9 under the clamp.
      expect(restored.subtotal().cents()).assertEqual(900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0720
     * @tc.name      cart_snapshot_restore_keeps_zero_quantity_selection_072
     * @tc.desc      Verify cart snapshot restore keeps zero quantity selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_keeps_zero_quantity_selection_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_keeps_zero_quantity_selection_072');
      let cart: Cart = cartOf([new CartLine(112, 500, 0, true)]);
      let restored: Cart = Cart.restore(cart.snapshot());
      let line: CartLine | undefined = restored.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.selected).assertTrue();
        expect(line.quantity).assertEqual(0);
      }
      expect(restored.selectedQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_SNAPSHOT_0730
     * @tc.name      cart_snapshot_each_snapshot_restores_its_own_state_073
     * @tc.desc      Verify cart snapshot each snapshot restores its own state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_each_snapshot_restores_its_own_state_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_each_snapshot_restores_its_own_state_073');
      let cart: Cart = cartOf([
        new CartLine(113, 100, 1),
        new CartLine(114, 200, 2)
      ]);
      let first: CartSnapshot = cart.snapshot();
      cart.remove(113);
      let second: CartSnapshot = cart.snapshot();
      let restoredFirst: Cart = Cart.restore(first);
      let restoredSecond: Cart = Cart.restore(second);
      expect(restoredFirst.distinctCount()).assertEqual(2);
      expect(restoredFirst.quantityOf(113)).assertEqual(1);
      expect(restoredFirst.quantityOf(114)).assertEqual(2);
      expect(restoredSecond.distinctCount()).assertEqual(1);
      // 113 was removed before the second snapshot, and quantityOf reports 0 for an absent line.
      expect(restoredSecond.quantityOf(113)).assertEqual(0);
    });
  });
}
