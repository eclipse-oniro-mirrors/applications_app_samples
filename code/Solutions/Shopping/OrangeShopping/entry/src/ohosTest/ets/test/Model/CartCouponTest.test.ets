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

import { describe, beforeAll, it, afterEach, expect } from '@ohos/hypium';
import { yieldToEventLoop } from '../Shared/TestDriver';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Cart, CartLine, Coupon, CouponBook, Money } from '../Shared/ShopModel';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Generated display name; only the id is asserted as identity. */
function couponOf(id: string, thresholdCents: number, discountCents: number): Coupon {
  return new Coupon(id, 'coupon ' + id, thresholdCents, discountCents);
}

/** Coupons keep their source array order inside the book. */
function bookOf(coupons: Coupon[]): CouponBook {
  return new CouponBook(coupons);
}

function cartOf(lines: CartLine[]): Cart {
  return Cart.fromLines(lines);
}

function couponIds(coupons: Coupon[]): string[] {
  let ids: string[] = [];
  for (let index: number = 0; index < coupons.length; index++) {
    ids.push(coupons[index].id);
  }
  return ids;
}

export default function cartCouponTest() {
  describe('OrangeShoppingCartCoupon', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'cart coupon suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0010
     * @tc.name      cart_coupon_threshold_forms_are_usable_at_or_above_001
     * @tc.desc      Verify cart coupon threshold forms are usable at or above.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_threshold_forms_are_usable_at_or_above_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_threshold_forms_are_usable_at_or_above_001');
      // Rows cover exactly-at-threshold, one above, and zero-threshold coupons usable at 0 and 1.
      let thresholds: number[] = [10000, 10000, 0, 0];
      let discounts: number[] = [1000, 1000, 100, 50];
      let subtotals: number[] = [10000, 10001, 0, 1];
      expect(thresholds.length).assertEqual(subtotals.length);
      expect(discounts.length).assertEqual(subtotals.length);
      for (let index: number = 0; index < subtotals.length; index++) {
        let coupon: Coupon = couponOf('T' + (index + 1).toString(), thresholds[index], discounts[index]);
        expect(coupon.isUsableFor(subtotals[index])).assertTrue();
        expect(coupon.discountCents).assertEqual(discounts[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0020
     * @tc.name      cart_coupon_one_cent_below_threshold_is_not_usable_002
     * @tc.desc      Verify cart coupon one cent below threshold is not usable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_one_cent_below_threshold_is_not_usable_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_one_cent_below_threshold_is_not_usable_002');
      let coupon: Coupon = couponOf('T2', 10000, 1000);
      // 9999, 9998 and 0 all fall short of the 10000 threshold; only 10000 itself qualifies.
      let below: number[] = [9999, 9998, 0];
      expect(below.length).assertEqual(3);
      for (let index: number = 0; index < below.length; index++) {
        expect(coupon.isUsableFor(below[index])).assertFalse();
      }
      expect(coupon.isUsableFor(10000)).assertTrue();
      expect(coupon.thresholdCents).assertEqual(10000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0030
     * @tc.name      cart_coupon_negative_threshold_is_usable_at_zero_003
     * @tc.desc      Verify cart coupon negative threshold is usable at zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_negative_threshold_is_usable_at_zero_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_negative_threshold_is_usable_at_zero_003');
      // A threshold of -100 is already satisfied by an empty cart at 0 cents.
      let coupon: Coupon = couponOf('T5', -100, 100);
      expect(coupon.isUsableFor(0)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0040
     * @tc.name      cart_coupon_positive_threshold_rejects_zero_until_a_cent_arrives_004
     * @tc.desc      Verify cart coupon positive threshold rejects zero until a cent arrives.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_positive_threshold_rejects_zero_until_a_cent_arrives_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_positive_threshold_rejects_zero_until_a_cent_arrives_004');
      // One cent is the smallest positive threshold, so 0 must fail where 1 passes.
      let coupon: Coupon = couponOf('T7', 1, 50);
      expect(coupon.isUsableFor(0)).assertFalse();
      expect(coupon.thresholdCents).assertEqual(1);
      expect(coupon.isUsableFor(1)).assertTrue();
      let book: CouponBook = bookOf([coupon]);
      expect(book.applicable(new Money(0)).length).assertEqual(0);
      expect(book.payable(new Money(0)).cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0050
     * @tc.name      cart_coupon_apply_subtracts_the_discount_across_sizes_005
     * @tc.desc      Verify cart coupon apply subtracts the discount across sizes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_apply_subtracts_the_discount_across_sizes_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_apply_subtracts_the_discount_across_sizes_005');
      // Each row pairs a subtotal with its discount and the expected subtotal - discount result.
      let subtotals: number[] = [10000, 1000, 777, 100000];
      let discounts: number[] = [1000, 1000, 0, 2500];
      let expected: number[] = [9000, 0, 777, 97500];
      expect(subtotals.length).assertEqual(expected.length);
      expect(discounts.length).assertEqual(expected.length);
      for (let index: number = 0; index < subtotals.length; index++) {
        let coupon: Coupon = couponOf('A' + (index + 1).toString(), 0, discounts[index]);
        let result: Money = coupon.apply(new Money(subtotals[index]));
        expect(result.cents()).assertEqual(expected[index]);
        expect(result.cents()).assertEqual(subtotals[index] - discounts[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0060
     * @tc.name      cart_coupon_apply_clamps_a_discount_above_subtotal_006
     * @tc.desc      Verify cart coupon apply clamps a discount above subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_apply_clamps_a_discount_above_subtotal_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_apply_clamps_a_discount_above_subtotal_006');
      let coupon: Coupon = couponOf('A2', 0, 1000);
      // Taking 1000 off a 500 cent subtotal cannot go negative, so the result clamps to zero.
      let result: Money = coupon.apply(new Money(500));
      expect(result.cents()).assertEqual(0);
      expect(result.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0070
     * @tc.name      cart_coupon_apply_on_zero_subtotal_stays_zero_007
     * @tc.desc      Verify cart coupon apply on zero subtotal stays zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_apply_on_zero_subtotal_stays_zero_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_apply_on_zero_subtotal_stays_zero_007');
      let coupon: Coupon = couponOf('A4', 0, 700);
      let result: Money = coupon.apply(Money.zero());
      expect(result.cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0080
     * @tc.name      cart_coupon_book_size_reports_all_coupons_008
     * @tc.desc      Verify cart coupon book size reports all coupons.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_book_size_reports_all_coupons_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_book_size_reports_all_coupons_008');
      let book: CouponBook = bookOf([
        couponOf('B1', 0, 100),
        couponOf('B2', 1000, 200),
        couponOf('B3', 5000, 700)
      ]);
      expect(book.size()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0090
     * @tc.name      cart_coupon_book_all_preserves_insertion_order_009
     * @tc.desc      Verify cart coupon book all preserves insertion order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_book_all_preserves_insertion_order_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_book_all_preserves_insertion_order_009');
      let book: CouponBook = bookOf([
        couponOf('B4', 0, 100),
        couponOf('B5', 1000, 200),
        couponOf('B6', 5000, 700)
      ]);
      let ids: string[] = couponIds(book.all());
      expect((ids).length).assertEqual((['B4', 'B5', 'B6']).length);
      for (let __i15: number = 0; __i15 < (['B4', 'B5', 'B6']).length; __i15++) {
        expect((ids)[__i15]).assertEqual((['B4', 'B5', 'B6'])[__i15]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0100
     * @tc.name      cart_coupon_empty_book_has_no_entries_010
     * @tc.desc      Verify cart coupon empty book has no entries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_empty_book_has_no_entries_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_empty_book_has_no_entries_010');
      let book: CouponBook = bookOf([]);
      expect(book.size()).assertEqual(0);
      expect(book.all().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0110
     * @tc.name      cart_coupon_applicable_on_empty_book_is_empty_011
     * @tc.desc      Verify cart coupon applicable on empty book is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_applicable_on_empty_book_is_empty_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_applicable_on_empty_book_is_empty_011');
      let book: CouponBook = bookOf([]);
      let usable: Coupon[] = book.applicable(new Money(10000));
      expect(usable.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0120
     * @tc.name      cart_coupon_applicable_returns_only_usable_coupons_012
     * @tc.desc      Verify cart coupon applicable returns only usable coupons.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_applicable_returns_only_usable_coupons_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_applicable_returns_only_usable_coupons_012');
      let book: CouponBook = bookOf([
        couponOf('C1', 0, 100),
        couponOf('C2', 10000, 1000),
        couponOf('C3', 20000, 3000)
      ]);
      let usable: Coupon[] = book.applicable(new Money(15000));
      expect(usable.length).assertEqual(2);
      expect((couponIds(usable)).length).assertEqual((['C1', 'C2']).length);
      for (let __i16: number = 0; __i16 < (['C1', 'C2']).length; __i16++) {
        expect((couponIds(usable))[__i16]).assertEqual((['C1', 'C2'])[__i16]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0130
     * @tc.name      cart_coupon_applicable_preserves_order_013
     * @tc.desc      Verify cart coupon applicable preserves order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_applicable_preserves_order_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_applicable_preserves_order_013');
      let book: CouponBook = bookOf([
        couponOf('C4', 0, 100),
        couponOf('C5', 10000, 2000),
        couponOf('C6', 5000, 900)
      ]);
      let usable: Coupon[] = book.applicable(new Money(20000));
      expect((couponIds(usable)).length).assertEqual((['C4', 'C5', 'C6']).length);
      for (let __i17: number = 0; __i17 < (['C4', 'C5', 'C6']).length; __i17++) {
        expect((couponIds(usable))[__i17]).assertEqual((['C4', 'C5', 'C6'])[__i17]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0140
     * @tc.name      cart_coupon_applicable_includes_boundary_subtotals_014
     * @tc.desc      Verify cart coupon applicable includes boundary subtotals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_applicable_includes_boundary_subtotals_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_applicable_includes_boundary_subtotals_014');
      let subtotals: number[] = [10000, 10001];
      let ids: string[] = ['C7', 'H23'];
      expect(subtotals.length).assertEqual(ids.length);
      for (let index: number = 0; index < subtotals.length; index++) {
        let book: CouponBook = bookOf([couponOf(ids[index], 10000, 1000)]);
        let usable: Coupon[] = book.applicable(new Money(subtotals[index]));
        expect(usable.length).assertEqual(1);
        expect(usable[0].id).assertEqual(ids[index]);
        expect(book.applicable(new Money(9999)).length).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0150
     * @tc.name      cart_coupon_applicable_excludes_one_below_the_threshold_015
     * @tc.desc      Verify cart coupon applicable excludes one below the threshold.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_applicable_excludes_one_below_the_threshold_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_applicable_excludes_one_below_the_threshold_015');
      let book: CouponBook = bookOf([couponOf('C8', 10000, 1000)]);
      let usable: Coupon[] = book.applicable(new Money(9999));
      expect(usable.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0160
     * @tc.name      cart_coupon_applicable_at_zero_keeps_no_threshold_coupons_016
     * @tc.desc      Verify cart coupon applicable at zero keeps no threshold coupons.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_applicable_at_zero_keeps_no_threshold_coupons_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_applicable_at_zero_keeps_no_threshold_coupons_016');
      let book: CouponBook = bookOf([
        couponOf('C9', 0, 100),
        couponOf('C10', 1, 200)
      ]);
      let usable: Coupon[] = book.applicable(new Money(0));
      expect(usable.length).assertEqual(1);
      expect(usable[0].id).assertEqual('C9');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0170
     * @tc.name      cart_coupon_applicable_does_not_change_book_size_017
     * @tc.desc      Verify cart coupon applicable does not change book size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_applicable_does_not_change_book_size_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_applicable_does_not_change_book_size_017');
      let book: CouponBook = bookOf([
        couponOf('C11', 0, 100),
        couponOf('C12', 1000, 200)
      ]);
      book.applicable(new Money(5000));
      expect(book.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0180
     * @tc.name      cart_coupon_applicable_result_is_a_new_array_018
     * @tc.desc      Verify cart coupon applicable result is a new array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_applicable_result_is_a_new_array_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_applicable_result_is_a_new_array_018');
      let book: CouponBook = bookOf([
        couponOf('C13', 0, 100),
        couponOf('C14', 1000, 200)
      ]);
      let first: Coupon[] = book.applicable(new Money(5000));
      first.splice(0, 1);
      let second: Coupon[] = book.applicable(new Money(5000));
      expect(first.length).assertEqual(1);
      expect(second.length).assertEqual(2);
      expect(book.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0190
     * @tc.name      cart_coupon_best_is_undefined_when_none_is_usable_019
     * @tc.desc      Verify cart coupon best is undefined when none is usable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_is_undefined_when_none_is_usable_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_is_undefined_when_none_is_usable_019');
      // The 1000 threshold is unmet at 50 cents, so no coupon can be chosen.
      let book: CouponBook = bookOf([couponOf('D1', 1000, 200)]);
      let best: Coupon | undefined = book.best(new Money(50));
      expect(best === null || best === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0200
     * @tc.name      cart_coupon_best_is_undefined_for_an_empty_book_020
     * @tc.desc      Verify cart coupon best is undefined for an empty book.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_is_undefined_for_an_empty_book_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_is_undefined_for_an_empty_book_020');
      let book: CouponBook = bookOf([]);
      expect(book.best(new Money(10000)) === null || book.best(new Money(10000)) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0210
     * @tc.name      cart_coupon_best_works_with_a_single_entry_book_021
     * @tc.desc      Verify cart coupon best works with a single entry book.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_works_with_a_single_entry_book_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_works_with_a_single_entry_book_021');
      let book: CouponBook = bookOf([couponOf('D2', 0, 400)]);
      let best: Coupon | undefined = book.best(new Money(1000));
      expect(book.size()).assertEqual(1);
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.id).assertEqual('D2');
        expect(best.discountCents).assertEqual(400);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0220
     * @tc.name      cart_coupon_best_picks_the_largest_discount_022
     * @tc.desc      Verify cart coupon best picks the largest discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_picks_the_largest_discount_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_picks_the_largest_discount_022');
      // D5's 2000 discount beats D4's 100 and D6's 300.
      let book: CouponBook = bookOf([
        couponOf('D4', 0, 100),
        couponOf('D5', 0, 2000),
        couponOf('D6', 0, 300)
      ]);
      let best: Coupon | undefined = book.best(new Money(10000));
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.id).assertEqual('D5');
        expect(best.discountCents).assertEqual(2000);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0230
     * @tc.name      cart_coupon_best_tie_skips_a_smaller_leading_coupon_023
     * @tc.desc      Verify cart coupon best tie skips a smaller leading coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_tie_skips_a_smaller_leading_coupon_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_tie_skips_a_smaller_leading_coupon_023');
      // D14 and D15 tie at 500; the leading smaller D13 must be skipped and the first tied coupon returned.
      let book: CouponBook = bookOf([
        couponOf('D13', 0, 100),
        couponOf('D14', 0, 500),
        couponOf('D15', 0, 500)
      ]);
      let best: Coupon | undefined = book.best(new Money(1000));
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.id).assertEqual('D14');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0240
     * @tc.name      cart_coupon_best_can_return_a_zero_discount_coupon_024
     * @tc.desc      Verify cart coupon best can return a zero discount coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_can_return_a_zero_discount_coupon_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_can_return_a_zero_discount_coupon_024');
      let book: CouponBook = bookOf([couponOf('D16', 0, 0)]);
      let best: Coupon | undefined = book.best(new Money(100));
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.id).assertEqual('D16');
        expect(best.discountCents).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0250
     * @tc.name      cart_coupon_best_does_not_mutate_the_book_025
     * @tc.desc      Verify cart coupon best does not mutate the book.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_does_not_mutate_the_book_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_does_not_mutate_the_book_025');
      let book: CouponBook = bookOf([
        couponOf('D17', 0, 100),
        couponOf('D18', 0, 900)
      ]);
      book.best(new Money(1000));
      expect(book.size()).assertEqual(2);
      expect((couponIds(book.all())).length).assertEqual((['D17', 'D18']).length);
      for (let __i18: number = 0; __i18 < (['D17', 'D18']).length; __i18++) {
        expect((couponIds(book.all()))[__i18]).assertEqual((['D17', 'D18'])[__i18]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0260
     * @tc.name      cart_coupon_best_is_stable_across_calls_026
     * @tc.desc      Verify cart coupon best is stable across calls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_is_stable_across_calls_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_is_stable_across_calls_026');
      let book: CouponBook = bookOf([
        couponOf('D19', 0, 100),
        couponOf('D20', 0, 900)
      ]);
      let first: Coupon | undefined = book.best(new Money(1000));
      let second: Coupon | undefined = book.best(new Money(1000));
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined && second !== undefined) {
        expect(first.id).assertEqual(second.id);
        expect(first.id).assertEqual('D20');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0270
     * @tc.name      cart_coupon_best_discount_is_zero_when_none_is_usable_027
     * @tc.desc      Verify cart coupon best discount is zero when none is usable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_discount_is_zero_when_none_is_usable_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_discount_is_zero_when_none_is_usable_027');
      let book: CouponBook = bookOf([couponOf('E1', 1000, 100)]);
      expect(book.best(new Money(50)) === null || book.best(new Money(50)) === undefined).assertTrue();
      let discount: Money = book.bestDiscount(new Money(50));
      expect(discount.cents()).assertEqual(0);
      expect(discount.isZero()).assertTrue();
      expect(book.payable(new Money(50)).cents()).assertEqual(50);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0280
     * @tc.name      cart_coupon_best_discount_is_zero_for_an_empty_book_028
     * @tc.desc      Verify cart coupon best discount is zero for an empty book.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_discount_is_zero_for_an_empty_book_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_discount_is_zero_for_an_empty_book_028');
      let book: CouponBook = bookOf([]);
      expect(book.bestDiscount(new Money(10000)).cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0290
     * @tc.name      cart_coupon_best_discount_matches_the_best_coupon_029
     * @tc.desc      Verify cart coupon best discount matches the best coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_discount_matches_the_best_coupon_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_discount_matches_the_best_coupon_029');
      let book: CouponBook = bookOf([
        couponOf('E2', 0, 100),
        couponOf('E3', 0, 700)
      ]);
      let discount: Money = book.bestDiscount(new Money(1000));
      expect(discount.cents()).assertEqual(700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0300
     * @tc.name      cart_coupon_best_discount_uses_the_boundary_coupon_030
     * @tc.desc      Verify cart coupon best discount uses the boundary coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_discount_uses_the_boundary_coupon_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_discount_uses_the_boundary_coupon_030');
      let book: CouponBook = bookOf([couponOf('E4', 10000, 2000)]);
      expect(book.bestDiscount(new Money(10000)).cents()).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0310
     * @tc.name      cart_coupon_zero_valued_coupon_stays_the_best_031
     * @tc.desc      Verify cart coupon zero valued coupon stays the best.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_zero_valued_coupon_stays_the_best_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_zero_valued_coupon_stays_the_best_031');
      let book: CouponBook = bookOf([couponOf('E5', 0, 0)]);
      let usable: Coupon[] = book.applicable(new Money(100));
      expect(usable.length).assertEqual(1);
      let best: Coupon | undefined = book.best(new Money(100));
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.id).assertEqual('E5');
        expect(best.discountCents).assertEqual(0);
      }
      expect(book.bestDiscount(new Money(100)).isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0320
     * @tc.name      cart_coupon_best_discount_tie_keeps_the_same_amount_032
     * @tc.desc      Verify cart coupon best discount tie keeps the same amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_discount_tie_keeps_the_same_amount_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_discount_tie_keeps_the_same_amount_032');
      let book: CouponBook = bookOf([
        couponOf('E6', 0, 500),
        couponOf('E1', 0, 500)
      ]);
      expect(book.bestDiscount(new Money(1000)).cents()).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0330
     * @tc.name      cart_coupon_best_discount_follows_thresholds_033
     * @tc.desc      Verify cart coupon best discount follows thresholds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_discount_follows_thresholds_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_discount_follows_thresholds_033');
      let book: CouponBook = bookOf([
        couponOf('E8', 0, 100),
        couponOf('E9', 1000, 300),
        couponOf('E10', 5000, 700)
      ]);
      // Below 1000 the 100 coupon wins, from 1000 the 300 coupon, and from 5000 the 700 coupon.
      let subtotals: number[] = [0, 999, 1000, 4999, 5000, 6000];
      let expected: number[] = [100, 100, 300, 300, 700, 700];
      for (let index: number = 0; index < subtotals.length; index++) {
        let discount: Money = book.bestDiscount(new Money(subtotals[index]));
        expect(discount.cents()).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0340
     * @tc.name      cart_coupon_payable_subtracts_the_best_discount_034
     * @tc.desc      Verify cart coupon payable subtracts the best discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_payable_subtracts_the_best_discount_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_payable_subtracts_the_best_discount_034');
      let book: CouponBook = bookOf([
        couponOf('F1', 0, 100),
        couponOf('F2', 10000, 2000)
      ]);
      let payable: Money = book.payable(new Money(10000));
      expect(payable.cents()).assertEqual(8000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0350
     * @tc.name      cart_coupon_payable_clamps_at_zero_035
     * @tc.desc      Verify cart coupon payable clamps at zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_payable_clamps_at_zero_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_payable_clamps_at_zero_035');
      let book: CouponBook = bookOf([couponOf('F3', 0, 1000)]);
      let payable: Money = book.payable(new Money(500));
      expect(payable.cents()).assertEqual(0);
      expect(payable.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0360
     * @tc.name      cart_coupon_book_payable_subtracts_the_best_discount_036
     * @tc.desc      Verify cart coupon book payable subtracts the best discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_book_payable_subtracts_the_best_discount_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_book_payable_subtracts_the_best_discount_036');
      // Rows exercise an unmet threshold, a discount larger than the subtotal, and a large cart.
      let thresholds: number[] = [1000, 0, 10000];
      let discounts: number[] = [200, 1000, 2500];
      let subtotals: number[] = [500, 1000, 100000];
      let expected: number[] = [500, 0, 97500];

      expect(subtotals.length).assertEqual(expected.length);
      expect(discounts.length).assertEqual(expected.length);
      for (let index: number = 0; index < subtotals.length; index++) {
        let book: CouponBook = bookOf([
          couponOf('P' + (index + 1).toString(), thresholds[index], discounts[index])
        ]);
        let subtotal: Money = new Money(subtotals[index]);
        let payable: Money = book.payable(subtotal);
        expect(payable.cents()).assertEqual(expected[index]);
        expect(payable.cents()).assertEqual(subtotals[index] - book.bestDiscount(subtotal).cents());
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0370
     * @tc.name      cart_coupon_payable_equals_subtotal_for_an_empty_book_037
     * @tc.desc      Verify cart coupon payable equals subtotal for an empty book.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_payable_equals_subtotal_for_an_empty_book_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_payable_equals_subtotal_for_an_empty_book_037');
      let book: CouponBook = bookOf([]);
      expect(book.payable(new Money(5000)).cents()).assertEqual(5000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0380
     * @tc.name      cart_coupon_payable_and_discount_reconstruct_subtotal_038
     * @tc.desc      Verify cart coupon payable and discount reconstruct subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_payable_and_discount_reconstruct_subtotal_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_payable_and_discount_reconstruct_subtotal_038');
      let book: CouponBook = bookOf([couponOf('F6', 0, 3000)]);
      let subtotal: Money = new Money(10000);
      let payable: number = book.payable(subtotal).cents();
      let discount: number = book.bestDiscount(subtotal).cents();
      expect(payable + discount).assertEqual(subtotal.cents());
      expect(payable).assertEqual(7000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0390
     * @tc.name      cart_coupon_payable_on_zero_subtotal_is_zero_039
     * @tc.desc      Verify cart coupon payable on zero subtotal is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_payable_on_zero_subtotal_is_zero_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_payable_on_zero_subtotal_is_zero_039');
      let book: CouponBook = bookOf([couponOf('F7', 0, 100)]);
      expect(book.bestDiscount(new Money(0)).cents()).assertEqual(100);
      expect(book.payable(new Money(0)).cents()).assertEqual(0);
      expect(book.payable(new Money(0)).isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0400
     * @tc.name      cart_coupon_payable_at_zero_ignores_a_threshold_coupon_040
     * @tc.desc      Verify cart coupon payable at zero ignores a threshold coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_payable_at_zero_ignores_a_threshold_coupon_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_payable_at_zero_ignores_a_threshold_coupon_040');
      let book: CouponBook = bookOf([couponOf('F8', 100, 50)]);
      expect(book.applicable(new Money(0)).length).assertEqual(0);
      expect(book.best(new Money(0)) === null || book.best(new Money(0)) === undefined).assertTrue();
      expect(book.bestDiscount(new Money(0)).cents()).assertEqual(0);
      expect(book.payable(new Money(0)).cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0410
     * @tc.name      cart_coupon_payable_ignores_ineligible_coupons_041
     * @tc.desc      Verify cart coupon payable ignores ineligible coupons.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_payable_ignores_ineligible_coupons_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_payable_ignores_ineligible_coupons_041');
      let book: CouponBook = bookOf([
        couponOf('F9', 1000, 900),
        couponOf('F10', 0, 50)
      ]);
      expect(book.payable(new Money(500)).cents()).assertEqual(450);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0420
     * @tc.name      cart_coupon_payable_is_stable_across_calls_042
     * @tc.desc      Verify cart coupon payable is stable across calls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_payable_is_stable_across_calls_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_payable_is_stable_across_calls_042');
      let book: CouponBook = bookOf([
        couponOf('F11', 0, 100),
        couponOf('F12', 10000, 2000)
      ]);
      let first: number = book.payable(new Money(10000)).cents();
      let second: number = book.payable(new Money(10000)).cents();
      expect(first).assertEqual(8000);
      expect(second).assertEqual(first);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0430
     * @tc.name      cart_coupon_payable_clamp_boundary_series_043
     * @tc.desc      Verify cart coupon payable clamp boundary series.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_payable_clamp_boundary_series_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_payable_clamp_boundary_series_043');
      let book: CouponBook = bookOf([couponOf('F13', 0, 500)]);
      // At 501 cents the 500 discount leaves exactly 1; at or below 500 the payable clamps to 0.
      let subtotals: number[] = [0, 100, 500, 501, 1000];
      let expected: number[] = [0, 0, 0, 1, 500];
      for (let index: number = 0; index < subtotals.length; index++) {
        let payable: Money = book.payable(new Money(subtotals[index]));
        expect(payable.cents()).assertEqual(expected[index]);
        expect(payable.isNegative()).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0440
     * @tc.name      cart_coupon_total_with_coupon_matches_best_discount_044
     * @tc.desc      Verify cart coupon total with coupon matches best discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_total_with_coupon_matches_best_discount_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_total_with_coupon_matches_best_discount_044');
      // totalWithCoupon reports the 1000 cent discount of G1, while the subtotal stays 10000.
      let cart: Cart = cartOf([new CartLine(400, 10000, 1, true)]);
      let book: CouponBook = bookOf([couponOf('G1', 10000, 1000)]);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(1000);
      expect(cart.subtotal().cents()).assertEqual(10000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0450
     * @tc.name      cart_coupon_cart_payable_matches_subtotal_minus_discount_045
     * @tc.desc      Verify cart coupon cart payable matches subtotal minus discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_cart_payable_matches_subtotal_minus_discount_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_cart_payable_matches_subtotal_minus_discount_045');
      // Subtotal 10000 minus the 1000 cent discount leaves 9000 payable.
      let cart: Cart = cartOf([new CartLine(407, 10000, 1, true)]);
      let book: CouponBook = bookOf([couponOf('G10', 10000, 1000)]);
      let subtotal: number = cart.subtotal().cents();
      let discount: number = cart.totalWithCoupon(book).cents();
      let payable: number = cart.payable(book).cents();
      expect(subtotal).assertEqual(10000);
      expect(discount).assertEqual(1000);
      expect(payable).assertEqual(9000);
      expect(payable + discount).assertEqual(subtotal);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0460
     * @tc.name      cart_coupon_payable_clamps_on_small_carts_046
     * @tc.desc      Verify cart coupon payable clamps on small carts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_payable_clamps_on_small_carts_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_payable_clamps_on_small_carts_046');
      // Subtotals of 1, 250 and 500 all sit under the 1000 discount, so each payable clamps to zero.
      let subtotals: number[] = [1, 250, 500];
      let discountCents: number = 1000;
      expect(subtotals.length).assertEqual(3);
      for (let index: number = 0; index < subtotals.length; index++) {
        let cart: Cart = cartOf([new CartLine(600 + index, subtotals[index], 1, true)]);
        let book: CouponBook = bookOf([couponOf('G3', 0, discountCents)]);
        expect(cart.payable(book).cents()).assertEqual(0);
        expect(cart.payable(book).isZero()).assertTrue();
        expect(cart.totalWithCoupon(book).cents()).assertEqual(discountCents);
        expect(cart.subtotal().cents() < discountCents).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0470
     * @tc.name      cart_coupon_empty_cart_with_threshold_coupon_has_no_discount_047
     * @tc.desc      Verify cart coupon empty cart with threshold coupon has no discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_empty_cart_with_threshold_coupon_has_no_discount_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_empty_cart_with_threshold_coupon_has_no_discount_047');
      let cart: Cart = new Cart();
      let book: CouponBook = bookOf([couponOf('G4', 1000, 100)]);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(0);
      expect(cart.payable(book).cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0480
     * @tc.name      cart_coupon_empty_cart_with_no_threshold_coupon_still_pays_zero_048
     * @tc.desc      Verify cart coupon empty cart with no threshold coupon still pays zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_empty_cart_with_no_threshold_coupon_still_pays_zero_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_empty_cart_with_no_threshold_coupon_still_pays_zero_048');
      let cart: Cart = new Cart();
      let coupon: Coupon = couponOf('G5', 0, 100);
      let book: CouponBook = bookOf([coupon]);
      let zero: Money = cart.subtotal();
      let best: Coupon | undefined = book.best(zero);
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.id).assertEqual('G5');
        expect(best.discountCents).assertEqual(100);
      }
      expect(coupon.isUsableFor(0)).assertTrue();
      expect(cart.payable(book).cents()).assertEqual(0);
});

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0490
     * @tc.name      cart_coupon_uses_only_the_selected_subtotal_049
     * @tc.desc      Verify cart coupon uses only the selected subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_uses_only_the_selected_subtotal_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_uses_only_the_selected_subtotal_049');
      // Only the selected 5000 line counts, so the 10000 threshold fails and only the 100 cent G7 applies.
      let cart: Cart = cartOf([
        new CartLine(403, 5000, 1, true),
        new CartLine(404, 20000, 1, false)
      ]);
      let book: CouponBook = bookOf([
        couponOf('G6', 10000, 1000),
        couponOf('G7', 0, 100)
      ]);
      expect(cart.subtotal().cents()).assertEqual(5000);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(100);
      expect(cart.payable(book).cents()).assertEqual(4900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0500
     * @tc.name      cart_coupon_selecting_a_line_unlocks_a_threshold_050
     * @tc.desc      Verify cart coupon selecting a line unlocks a threshold.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_selecting_a_line_unlocks_a_threshold_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_selecting_a_line_unlocks_a_threshold_050');
      let cart: Cart = cartOf([
        new CartLine(405, 5000, 1, true),
        new CartLine(406, 20000, 1, false)
      ]);
      let book: CouponBook = bookOf([
        couponOf('G8', 10000, 1000),
        couponOf('G9', 0, 100)
      ]);
      // Selecting the 20000 line lifts the subtotal to 25000 and unlocks the 10000-threshold G8.
      cart.setSelected(406, true);
      expect(cart.subtotal().cents()).assertEqual(25000);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(1000);
      expect(cart.payable(book).cents()).assertEqual(24000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0510
     * @tc.name      cart_coupon_cart_without_a_discount_pays_the_full_subtotal_051
     * @tc.desc      Verify cart coupon cart without a discount pays the full subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_cart_without_a_discount_pays_the_full_subtotal_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_cart_without_a_discount_pays_the_full_subtotal_051');
      let prices: number[] = [9999, 3000, 2000];
      let thresholds: number[] = [10000, 5000, 0];
      let discounts: number[] = [1000, 500, 0];
      expect(prices.length).assertEqual(discounts.length);
      expect(thresholds.length).assertEqual(discounts.length);
      for (let index: number = 0; index < prices.length; index++) {
        let cart: Cart = cartOf([new CartLine(500 + index, prices[index], 1, true)]);
        let book: CouponBook = bookOf([
          couponOf('N' + (index + 1).toString(), thresholds[index], discounts[index])
        ]);
        expect(cart.totalWithCoupon(book).cents()).assertEqual(0);
        expect(cart.payable(book).cents()).assertEqual(prices[index]);
        expect(cart.payable(book).cents()).assertEqual(cart.subtotal().cents());
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0520
     * @tc.name      cart_coupon_one_cent_above_threshold_applies_the_discount_052
     * @tc.desc      Verify cart coupon one cent above threshold applies the discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_one_cent_above_threshold_applies_the_discount_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_one_cent_above_threshold_applies_the_discount_052');
      let cart: Cart = cartOf([new CartLine(409, 10001, 1, true)]);
      let book: CouponBook = bookOf([couponOf('G12', 10000, 1000)]);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(1000);
      expect(cart.payable(book).cents()).assertEqual(9001);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0530
     * @tc.name      cart_coupon_deselect_all_makes_payable_zero_053
     * @tc.desc      Verify cart coupon deselect all makes payable zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_deselect_all_makes_payable_zero_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_deselect_all_makes_payable_zero_053');
      let cart: Cart = cartOf([
        new CartLine(411, 3000, 1, true),
        new CartLine(412, 2000, 1, true)
      ]);
      let book: CouponBook = bookOf([couponOf('G14', 0, 100)]);
      cart.setAllSelected(false);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.payable(book).cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0540
     * @tc.name      cart_coupon_empty_book_keeps_the_full_price_054
     * @tc.desc      Verify cart coupon empty book keeps the full price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_empty_book_keeps_the_full_price_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_empty_book_keeps_the_full_price_054');
      let cart: Cart = cartOf([new CartLine(413, 3000, 2, true)]);
      let book: CouponBook = bookOf([]);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(0);
      expect(cart.payable(book).cents()).assertEqual(6000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0550
     * @tc.name      cart_coupon_cart_payable_matches_book_payable_055
     * @tc.desc      Verify cart coupon cart payable matches book payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_cart_payable_matches_book_payable_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_cart_payable_matches_book_payable_055');
      let cart: Cart = cartOf([new CartLine(414, 12345, 1, true)]);
      let book: CouponBook = bookOf([
        couponOf('G15', 10000, 1000),
        couponOf('G16', 0, 45)
      ]);
      // 12345 - 1000 (the best of G15 and G16) = 11345.
      let cartPayable: number = cart.payable(book).cents();
      let bookPayable: number = book.payable(cart.subtotal()).cents();
      expect(cartPayable).assertEqual(bookPayable);
      expect(cartPayable).assertEqual(11345);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0560
     * @tc.name      cart_coupon_book_is_not_mutated_by_cart_calls_056
     * @tc.desc      Verify cart coupon book is not mutated by cart calls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_book_is_not_mutated_by_cart_calls_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_book_is_not_mutated_by_cart_calls_056');
      let cart: Cart = cartOf([new CartLine(416, 5000, 1, true)]);
      let book: CouponBook = bookOf([
        couponOf('G18', 0, 100),
        couponOf('G19', 5000, 1000)
      ]);
      cart.payable(book);
      cart.totalWithCoupon(book);
      expect(book.size()).assertEqual(2);
      expect((couponIds(book.all())).length).assertEqual((['G18', 'G19']).length);
      for (let __i19: number = 0; __i19 < (['G18', 'G19']).length; __i19++) {
        expect((couponIds(book.all()))[__i19]).assertEqual((['G18', 'G19'])[__i19]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0570
     * @tc.name      cart_coupon_quantity_change_recomputes_the_payable_057
     * @tc.desc      Verify cart coupon quantity change recomputes the payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_quantity_change_recomputes_the_payable_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_quantity_change_recomputes_the_payable_057');
      let cart: Cart = cartOf([new CartLine(417, 200, 50, true)]);
      let book: CouponBook = bookOf([couponOf('G20', 10000, 1000)]);
      expect(cart.subtotal().cents()).assertEqual(10000);
      expect(cart.payable(book).cents()).assertEqual(9000);
      // Dropping the 200 cent line from 50 to 25 units cuts 10000 to 5000, below the G20 threshold.
      cart.setQuantity(417, 25, 99);
      expect(cart.subtotal().cents()).assertEqual(5000);
      expect(cart.payable(book).cents()).assertEqual(5000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0580
     * @tc.name      cart_coupon_discount_equal_to_subtotal_pays_zero_058
     * @tc.desc      Verify cart coupon discount equal to subtotal pays zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_discount_equal_to_subtotal_pays_zero_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_discount_equal_to_subtotal_pays_zero_058');
      let cart: Cart = cartOf([new CartLine(418, 1000, 1, true)]);
      let book: CouponBook = bookOf([couponOf('G21', 0, 1000)]);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(cart.subtotal().cents());
      expect(cart.payable(book).cents()).assertEqual(0);
      expect(cart.payable(book).isZero()).assertTrue();
      expect(cart.payable(book).isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0590
     * @tc.name      cart_coupon_threshold_of_one_cent_is_usable_059
     * @tc.desc      Verify cart coupon threshold of one cent is usable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_threshold_of_one_cent_is_usable_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_threshold_of_one_cent_is_usable_059');
      let coupon: Coupon = couponOf('H1', 1, 50);
      expect(coupon.isUsableFor(1)).assertTrue();
      expect(coupon.isUsableFor(0)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0600
     * @tc.name      cart_coupon_discount_may_exceed_the_threshold_060
     * @tc.desc      Verify cart coupon discount may exceed the threshold.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_discount_may_exceed_the_threshold_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_discount_may_exceed_the_threshold_060');
      let coupon: Coupon = couponOf('H2', 100, 500);
      expect(coupon.isUsableFor(100)).assertTrue();
      let result: Money = coupon.apply(new Money(100));
      expect(result.cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0610
     * @tc.name      cart_coupon_apply_does_not_change_the_discount_061
     * @tc.desc      Verify cart coupon apply does not change the discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_apply_does_not_change_the_discount_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_apply_does_not_change_the_discount_061');
      let coupon: Coupon = couponOf('H3', 0, 1000);
      coupon.apply(new Money(10000));
      expect(coupon.discountCents).assertEqual(1000);
      expect(coupon.thresholdCents).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0620
     * @tc.name      cart_coupon_applicable_keeps_every_zero_threshold_coupon_062
     * @tc.desc      Verify cart coupon applicable keeps every zero threshold coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_applicable_keeps_every_zero_threshold_coupon_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_applicable_keeps_every_zero_threshold_coupon_062');
      let book: CouponBook = bookOf([
        couponOf('H8', 0, 100),
        couponOf('H9', 0, 200),
        couponOf('H10', 0, 300)
      ]);
      let usable: Coupon[] = book.applicable(new Money(0));
      expect(usable.length).assertEqual(3);
      expect(usable.length).assertEqual(book.size());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0630
     * @tc.name      cart_coupon_applicable_keeps_every_coupon_at_a_high_subtotal_063
     * @tc.desc      Verify cart coupon applicable keeps every coupon at a high subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_applicable_keeps_every_coupon_at_a_high_subtotal_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_applicable_keeps_every_coupon_at_a_high_subtotal_063');
      let book: CouponBook = bookOf([
        couponOf('H11', 0, 100),
        couponOf('H12', 1000, 200)
      ]);
      let usable: Coupon[] = book.applicable(new Money(5000));
      expect(usable.length).assertEqual(2);
      expect((couponIds(usable)).length).assertEqual((['H11', 'H12']).length);
      for (let __i20: number = 0; __i20 < (['H11', 'H12']).length; __i20++) {
        expect((couponIds(usable))[__i20]).assertEqual((['H11', 'H12'])[__i20]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0640
     * @tc.name      cart_coupon_payable_ignores_an_unmet_large_discount_064
     * @tc.desc      Verify cart coupon payable ignores an unmet large discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_payable_ignores_an_unmet_large_discount_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_payable_ignores_an_unmet_large_discount_064');
      let book: CouponBook = bookOf([couponOf('H13', 1000, 5000)]);
      let payable: Money = book.payable(new Money(500));
      expect(payable.cents()).assertEqual(500);
      expect(payable.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0650
     * @tc.name      cart_coupon_select_all_lines_uses_the_combined_subtotal_065
     * @tc.desc      Verify cart coupon select all lines uses the combined subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_select_all_lines_uses_the_combined_subtotal_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_select_all_lines_uses_the_combined_subtotal_065');
      // Both selected lines give 3000 + 2000 = 5000, so H14's 100 cents comes off 5000.
      let cart: Cart = cartOf([
        new CartLine(419, 3000, 1, true),
        new CartLine(420, 2000, 1, true)
      ]);
      let book: CouponBook = bookOf([couponOf('H14', 0, 100)]);
      expect(cart.subtotal().cents()).assertEqual(5000);
      expect(cart.payable(book).cents()).assertEqual(4900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0660
     * @tc.name      cart_coupon_unselected_lines_do_not_meet_a_threshold_066
     * @tc.desc      Verify cart coupon unselected lines do not meet a threshold.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_unselected_lines_do_not_meet_a_threshold_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_unselected_lines_do_not_meet_a_threshold_066');
      let cart: Cart = cartOf([
        new CartLine(421, 5000, 1, true),
        new CartLine(422, 20000, 1, false)
      ]);
      let book: CouponBook = bookOf([couponOf('H15', 10000, 1000)]);
      // All lines total 25000, but only the selected 5000 counts, so the 10000 threshold fails.
      expect(cart.allLinesSubtotal().cents()).assertEqual(25000);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(0);
      expect(cart.payable(book).cents()).assertEqual(5000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0670
     * @tc.name      cart_coupon_removing_the_selected_line_zeroes_payable_067
     * @tc.desc      Verify cart coupon removing the selected line zeroes payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_removing_the_selected_line_zeroes_payable_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_removing_the_selected_line_zeroes_payable_067');
      let cart: Cart = cartOf([new CartLine(423, 5000, 1, true)]);
      let book: CouponBook = bookOf([couponOf('H16', 0, 100)]);
      expect(cart.payable(book).cents()).assertEqual(4900);
      cart.remove(423);
      expect(cart.payable(book).cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0680
     * @tc.name      cart_coupon_total_with_coupon_is_stable_068
     * @tc.desc      Verify cart coupon total with coupon is stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_total_with_coupon_is_stable_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_total_with_coupon_is_stable_068');
      let cart: Cart = cartOf([new CartLine(424, 10000, 1, true)]);
      let book: CouponBook = bookOf([couponOf('H17', 10000, 1000)]);
      let first: number = cart.totalWithCoupon(book).cents();
      let second: number = cart.totalWithCoupon(book).cents();
      expect(first).assertEqual(1000);
      expect(second).assertEqual(first);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0690
     * @tc.name      cart_coupon_payable_is_stable_on_the_cart_069
     * @tc.desc      Verify cart coupon payable is stable on the cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_payable_is_stable_on_the_cart_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_payable_is_stable_on_the_cart_069');
      let cart: Cart = cartOf([new CartLine(425, 10000, 1, true)]);
      let book: CouponBook = bookOf([couponOf('H18', 10000, 1000)]);
      let first: number = cart.payable(book).cents();
      let second: number = cart.payable(book).cents();
      expect(first).assertEqual(9000);
      expect(second).assertEqual(first);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0700
     * @tc.name      cart_coupon_best_discount_does_not_depend_on_order_070
     * @tc.desc      Verify cart coupon best discount does not depend on order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_discount_does_not_depend_on_order_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_discount_does_not_depend_on_order_070');
      let firstBook: CouponBook = bookOf([
        couponOf('H20', 0, 100),
        couponOf('H21', 0, 700)
      ]);
      let secondBook: CouponBook = bookOf([
        couponOf('H21', 0, 700),
        couponOf('H20', 0, 100)
      ]);
      expect(firstBook.bestDiscount(new Money(1000)).cents()).assertEqual(700);
      expect(secondBook.bestDiscount(new Money(1000)).cents()).assertEqual(700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0710
     * @tc.name      cart_coupon_apply_keeps_cent_precision_071
     * @tc.desc      Verify cart coupon apply keeps cent precision.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_apply_keeps_cent_precision_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_apply_keeps_cent_precision_071');
      let coupon: Coupon = couponOf('H22', 0, 345);
      // 12345 - 345 = 12000 with no rounding drift.
      expect(coupon.apply(new Money(12345)).cents()).assertEqual(12000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0720
     * @tc.name      cart_coupon_single_ineligible_coupon_is_filtered_out_072
     * @tc.desc      Verify cart coupon single ineligible coupon is filtered out.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_single_ineligible_coupon_is_filtered_out_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_single_ineligible_coupon_is_filtered_out_072');
      let book: CouponBook = bookOf([couponOf('H24', 1000, 500)]);
      expect(book.applicable(new Money(100)).length).assertEqual(0);
      expect(book.best(new Money(100)) === null || book.best(new Money(100)) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0730
     * @tc.name      cart_coupon_fully_unselected_cart_pays_zero_073
     * @tc.desc      Verify cart coupon fully unselected cart pays zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_fully_unselected_cart_pays_zero_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_fully_unselected_cart_pays_zero_073');
      let cart: Cart = cartOf([
        new CartLine(426, 3000, 1, false),
        new CartLine(427, 2000, 1, false)
      ]);
      let book: CouponBook = bookOf([couponOf('H25', 0, 100)]);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.payable(book).cents()).assertEqual(0);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0740
     * @tc.name      cart_coupon_best_discount_applies_at_zero_with_no_threshold_074
     * @tc.desc      Verify cart coupon best discount applies at zero with no threshold.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_discount_applies_at_zero_with_no_threshold_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_discount_applies_at_zero_with_no_threshold_074');
      let book: CouponBook = bookOf([couponOf('H26', 0, 100)]);
      expect(book.bestDiscount(new Money(0)).cents()).assertEqual(100);
      expect(book.payable(new Money(0)).cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0750
     * @tc.name      cart_coupon_applicable_repeated_calls_agree_075
     * @tc.desc      Verify cart coupon applicable repeated calls agree.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_applicable_repeated_calls_agree_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_applicable_repeated_calls_agree_075');
      let book: CouponBook = bookOf([
        couponOf('J1', 0, 100),
        couponOf('J2', 1000, 200)
      ]);
      let first: Coupon[] = book.applicable(new Money(5000));
      let second: Coupon[] = book.applicable(new Money(5000));
      expect(first.length).assertEqual(2);
      expect((couponIds(first)).length).assertEqual((couponIds(second)).length);
      for (let __i21: number = 0; __i21 < (couponIds(second)).length; __i21++) {
        expect((couponIds(first))[__i21]).assertEqual((couponIds(second))[__i21]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0760
     * @tc.name      cart_coupon_apply_can_leave_one_cent_076
     * @tc.desc      Verify cart coupon apply can leave one cent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_apply_can_leave_one_cent_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_apply_can_leave_one_cent_076');
      let coupon: Coupon = couponOf('J3', 0, 1000);
      // A 1000 discount on 1001 leaves exactly one cent.
      let result: Money = coupon.apply(new Money(1001));
      expect(result.cents()).assertEqual(1);
      expect(result.isZero()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0770
     * @tc.name      cart_coupon_payable_picks_larger_of_equal_thresholds_077
     * @tc.desc      Verify cart coupon payable picks larger of equal thresholds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_payable_picks_larger_of_equal_thresholds_077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_payable_picks_larger_of_equal_thresholds_077');
      let orders: string[][] = [['J4', 'J5'], ['J5', 'J4']];
      let discounts: number[] = [500, 1500];
      expect(orders.length).assertEqual(2);
      for (let index: number = 0; index < orders.length; index++) {
        let cart: Cart = cartOf([new CartLine(428, 10000, 1, true)]);
        let first: string = orders[index][0];
        let second: string = orders[index][1];
        let book: CouponBook = bookOf([
          couponOf(first, 10000, discounts[0]),
          couponOf(second, 10000, discounts[1])
        ]);
        expect(cart.totalWithCoupon(book).cents()).assertEqual(1500);
        expect(cart.payable(book).cents()).assertEqual(8500);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0780
     * @tc.name      cart_coupon_best_ignores_a_coupon_above_the_cart_total_078
     * @tc.desc      Verify cart coupon best ignores a coupon above the cart total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_ignores_a_coupon_above_the_cart_total_078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_ignores_a_coupon_above_the_cart_total_078');
      let cart: Cart = cartOf([new CartLine(429, 8000, 1, true)]);
      let book: CouponBook = bookOf([
        couponOf('J6', 0, 100),
        couponOf('J7', 10000, 2000)
      ]);
      // J7 needs 10000 but the cart is 8000, so only J6's 100 cents applies: 8000 - 100 = 7900.
      let usable: Coupon[] = book.applicable(cart.subtotal());
      expect(usable.length).assertEqual(1);
      expect(usable[0].id).assertEqual('J6');
      expect(cart.totalWithCoupon(book).cents()).assertEqual(100);
      expect(cart.payable(book).cents()).assertEqual(8000 - 100);
      expect(cart.payable(book).isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0790
     * @tc.name      cart_coupon_quantity_increase_crosses_the_threshold_079
     * @tc.desc      Verify cart coupon quantity increase crosses the threshold.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_quantity_increase_crosses_the_threshold_079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_quantity_increase_crosses_the_threshold_079');
      let cart: Cart = cartOf([new CartLine(430, 2500, 1, true)]);
      let book: CouponBook = bookOf([couponOf('J8', 5000, 500)]);
      expect(cart.payable(book).cents()).assertEqual(2500);
      // Doubling the quantity from 1 to 2 raises 2500 to 5000 and crosses J8's 5000 threshold.
      cart.setQuantity(430, 2, 99);
      expect(cart.subtotal().cents()).assertEqual(5000);
      expect(cart.payable(book).cents()).assertEqual(4500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0800
     * @tc.name      cart_coupon_book_order_is_unchanged_after_best_080
     * @tc.desc      Verify cart coupon book order is unchanged after best.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_book_order_is_unchanged_after_best_080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_book_order_is_unchanged_after_best_080');
      let book: CouponBook = bookOf([
        couponOf('J9', 0, 100),
        couponOf('J10', 0, 700)
      ]);
      let best: Coupon | undefined = book.best(new Money(1000));
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.id).assertEqual('J10');
      }
      expect((couponIds(book.all())).length).assertEqual((['J9', 'J10']).length);
      for (let __i22: number = 0; __i22 < (['J9', 'J10']).length; __i22++) {
        expect((couponIds(book.all()))[__i22]).assertEqual((['J9', 'J10'])[__i22]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0810
     * @tc.name      cart_coupon_boundary_and_near_boundary_coupons_compare_081
     * @tc.desc      Verify cart coupon boundary and near boundary coupons compare.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_boundary_and_near_boundary_coupons_compare_081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_boundary_and_near_boundary_coupons_compare_081');
      // At 10000 both thresholds are met, and J12's 1500 beats J11's 900.
      let book: CouponBook = bookOf([
        couponOf('J11', 9999, 900),
        couponOf('J12', 10000, 1500)
      ]);
      expect(book.bestDiscount(new Money(10000)).cents()).assertEqual(1500);
      expect(book.payable(new Money(10000)).cents()).assertEqual(8500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0820
     * @tc.name      cart_coupon_removing_an_unselected_line_keeps_payable_082
     * @tc.desc      Verify cart coupon removing an unselected line keeps payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_removing_an_unselected_line_keeps_payable_082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_removing_an_unselected_line_keeps_payable_082');
      let cart: Cart = cartOf([
        new CartLine(431, 5000, 1, true),
        new CartLine(432, 3000, 1, false)
      ]);
      let book: CouponBook = bookOf([couponOf('J13', 0, 100)]);
      expect(cart.payable(book).cents()).assertEqual(4900);
      cart.remove(432);
      expect(cart.payable(book).cents()).assertEqual(4900);
      expect(cart.allLines().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0830
     * @tc.name      cart_coupon_zero_discount_no_threshold_is_usable_at_zero_083
     * @tc.desc      Verify cart coupon zero discount no threshold is usable at zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_zero_discount_no_threshold_is_usable_at_zero_083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_zero_discount_no_threshold_is_usable_at_zero_083');
      let coupon: Coupon = couponOf('J14', 0, 0);
      expect(coupon.isUsableFor(0)).assertTrue();
      let book: CouponBook = bookOf([coupon]);
      expect(book.bestDiscount(new Money(0)).cents()).assertEqual(0);
      expect(book.payable(new Money(0)).cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CART_COUPON_0840
     * @tc.name      cart_coupon_best_picks_by_eligibility_then_discount_084
     * @tc.desc      Verify cart coupon best picks by eligibility then discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_coupon_best_picks_by_eligibility_then_discount_084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_coupon_best_picks_by_eligibility_then_discount_084');
      // Rows expect the eligible coupon with the larger discount, or the eligible one when the big discount is locked.
      let firstIds: string[] = ['D7', 'D3', 'D11', 'H4', 'H6'];
      let firstThresholds: number[] = [0, 0, 0, 0, 1000];
      let firstDiscounts: number[] = [100, 100, 500, 0, 500];
      let secondIds: string[] = ['D2', 'D10', 'D12', 'H5', 'H7'];
      let secondThresholds: number[] = [50000, 10000, 0, 0, 0];
      let secondDiscounts: number[] = [10000, 2000, 500, 300, 500];
      let subtotals: number[] = [10000, 10000, 1000, 1000, 500];
      let expected: string[] = ['D7', 'D10', 'D11', 'H5', 'H7'];

      expect(firstIds.length).assertEqual(subtotals.length);
      for (let index: number = 0; index < firstIds.length; index++) {
        let book: CouponBook = bookOf([
          couponOf(firstIds[index], firstThresholds[index], firstDiscounts[index]),
          couponOf(secondIds[index], secondThresholds[index], secondDiscounts[index])
        ]);
        let best: Coupon | undefined = book.best(new Money(subtotals[index]));
        expect(best !== null && best !== undefined).assertTrue();
        if (best !== undefined) {
          expect(best.id).assertEqual(expected[index]);
        }
      }
    });

  });
}
