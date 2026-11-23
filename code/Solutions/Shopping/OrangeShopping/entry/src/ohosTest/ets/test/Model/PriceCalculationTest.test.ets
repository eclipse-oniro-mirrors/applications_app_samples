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
import { Cart, CartLine, CartSnapshot, Coupon, CouponBook, Money, Order, OrderState } from '../Shared/ShopModel';
import { LARGE_CART, cartLine, cartWith, createGoods, defaultCouponBook, emptyCouponBook } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Two coupons in argument order, which drives the tie-break. */
function couponBookWith(first: Coupon, second: Coupon): CouponBook {
  let coupons: Coupon[] = [first, second];
  return new CouponBook(coupons);
}

export default function priceCalculationTest() {
  describe('OrangeShoppingPriceCalculation', () => {
    let referenceCart: Cart = new Cart();

    beforeAll(() => {
      referenceCart = cartWith([cartLine(0, 1000, 2)]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'price calculation suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0010
     * @tc.name      price_calculation_line_amount_is_unit_times_quantity_001
     * @tc.desc      Verify price calculation line amount is unit times quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('price_calculation_line_amount_is_unit_times_quantity_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: price_calculation_line_amount_is_unit_times_quantity_001');
      let line: CartLine = cartLine(0, 19900, 3);
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(59700);
      expect(total.isPositive()).assertTrue();
      expect(line.unitPriceCents).assertEqual(19900);
      expect(line.quantity).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0020
     * @tc.name      line_total_with_quantity_one_equals_unit_price_002
     * @tc.desc      Verify line total with quantity one equals unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_with_quantity_one_equals_unit_price_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_with_quantity_one_equals_unit_price_002');
      let line: CartLine = cartLine(1, 8900, 1);
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(8900);
      expect(total.equals(new Money(8900))).assertTrue();
      expect(total.compareTo(new Money(line.unitPriceCents))).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0030
     * @tc.name      line_total_doubles_for_quantity_two_003
     * @tc.desc      Verify line total doubles for quantity two.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_doubles_for_quantity_two_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_doubles_for_quantity_two_003');
      let single: Money = cartLine(1, 8900, 1).lineTotal();
      let doubled: Money = cartLine(1, 8900, 2).lineTotal();
      expect(doubled.cents()).assertEqual(17800);
      expect(doubled.equals(single.multiply(2))).assertTrue();
      expect(doubled.compareTo(single)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0040
     * @tc.name      price_calculation_max_quantity_line_amount_004
     * @tc.desc      Verify price calculation max quantity line amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('price_calculation_max_quantity_line_amount_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: price_calculation_max_quantity_line_amount_004');
      let line: CartLine = cartLine(0, 19900, 99);
      // 19900 x 99 = 1970100 fixes the top of the quantity range the cart accepts.
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(1970100);
      expect(total.equals(new Money(1970100))).assertTrue();
      expect(line.quantity).assertEqual(99);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0050
     * @tc.name      line_total_is_zero_for_zero_quantity_005
     * @tc.desc      Verify line total is zero for zero quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_is_zero_for_zero_quantity_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_is_zero_for_zero_quantity_005');
      let line: CartLine = cartLine(0, 19900, 0);
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(0);
      expect(total.isZero()).assertTrue();
      expect(total.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0060
     * @tc.name      line_total_for_expensive_item_at_max_quantity_006
     * @tc.desc      Verify line total for expensive item at max quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_for_expensive_item_at_max_quantity_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_for_expensive_item_at_max_quantity_006');
      let line: CartLine = cartLine(0, 499900, 99);
      // The priciest catalogue item at 99 units lands on 49490100 with no cent lost to rounding.
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(49490100);
      expect(total.isPositive()).assertTrue();
      expect(total.equals(new Money(49490100))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0070
     * @tc.name      cart_subtotal_sums_selected_lines_007
     * @tc.desc      Verify cart subtotal sums selected lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_subtotal_sums_selected_lines_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_subtotal_sums_selected_lines_007');
      let cart: Cart = cartWith([
        cartLine(0, 1000, 2, true),
        cartLine(1, 500, 3, true)
      ]);
      let subtotal: Money = cart.subtotal();
      // 1000 x 2 plus 500 x 3 adds to 3500, which pins that both selected lines contribute.
      expect(subtotal.cents()).assertEqual(3500);
      expect(subtotal.equals(new Money(3500))).assertTrue();
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0080
     * @tc.name      cart_subtotal_of_empty_cart_is_zero_008
     * @tc.desc      Verify cart subtotal of empty cart is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_subtotal_of_empty_cart_is_zero_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_subtotal_of_empty_cart_is_zero_008');
      let cart: Cart = new Cart();
      let subtotal: Money = cart.subtotal();
      expect(subtotal.cents()).assertEqual(0);
      expect(subtotal.isZero()).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.allLinesSubtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0090
     * @tc.name      cart_all_lines_subtotal_includes_unselected_009
     * @tc.desc      Verify cart all lines subtotal includes unselected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_all_lines_subtotal_includes_unselected_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_all_lines_subtotal_includes_unselected_009');
      let cart: Cart = cartWith([
        cartLine(0, 1000, 2, true),
        cartLine(1, 500, 3, false)
      ]);
      let all: Money = cart.allLinesSubtotal();
      let selected: Money = cart.subtotal();
      // The unselected 500 x 3 line counts in allLinesSubtotal but is skipped by subtotal.
      expect(all.cents()).assertEqual(3500);
      expect(selected.cents()).assertEqual(2000);
      expect(all.compareTo(selected)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0100
     * @tc.name      cart_selected_subtotal_is_below_all_lines_subtotal_010
     * @tc.desc      Verify cart selected subtotal is below all lines subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selected_subtotal_is_below_all_lines_subtotal_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selected_subtotal_is_below_all_lines_subtotal_010');
      let cart: Cart = cartWith([
        cartLine(0, 19900, 1, true),
        cartLine(1, 8900, 2, false)
      ]);
      let selected: Money = cart.subtotal();
      let all: Money = cart.allLinesSubtotal();
      expect(all.cents()).assertEqual(37700);
      expect(selected.cents()).assertEqual(19900);
      expect(selected.compareTo(all)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0110
     * @tc.name      cart_total_quantity_sums_every_line_011
     * @tc.desc      Verify cart total quantity sums every line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_total_quantity_sums_every_line_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_total_quantity_sums_every_line_011');
      let cart: Cart = cartWith([
        cartLine(0, 1000, 1),
        cartLine(1, 2000, 3),
        cartLine(2, 3000, 2)
      ]);
      expect(cart.totalQuantity()).assertEqual(6);
      expect(cart.distinctCount()).assertEqual(3);
      expect(cart.totalQuantity() > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0120
     * @tc.name      cart_selected_quantity_ignores_unselected_012
     * @tc.desc      Verify cart selected quantity ignores unselected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_selected_quantity_ignores_unselected_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_selected_quantity_ignores_unselected_012');
      let cart: Cart = cartWith([
        cartLine(0, 1000, 1, true),
        cartLine(1, 2000, 3, false),
        cartLine(2, 3000, 2, true)
      ]);
      expect(cart.totalQuantity()).assertEqual(6);
      expect(cart.selectedQuantity()).assertEqual(3);
      expect(cart.selectedLines().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0130
     * @tc.name      cart_without_coupons_pays_full_subtotal_013
     * @tc.desc      Verify cart without coupons pays full subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_without_coupons_pays_full_subtotal_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_without_coupons_pays_full_subtotal_013');
      let cart: Cart = cartWith([cartLine(0, 1000, 2), cartLine(1, 500, 3)]);
      let book: CouponBook = emptyCouponBook();
      let payable: Money = cart.payable(book);
      expect(cart.subtotal().cents()).assertEqual(3500);
      expect(payable.cents()).assertEqual(3500);
      expect(payable.equals(cart.subtotal())).assertTrue();
      expect(cart.totalWithCoupon(book).cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0140
     * @tc.name      cart_with_coupons_pays_discounted_total_014
     * @tc.desc      Verify cart with coupons pays discounted total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_with_coupons_pays_discounted_total_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_with_coupons_pays_discounted_total_014');
      let cart: Cart = cartWith([cartLine(0, 29900, 2), cartLine(4, 8900, 1)]);
      let book: CouponBook = defaultCouponBook();
      let payable: Money = cart.payable(book);
      expect(cart.subtotal().cents()).assertEqual(68700);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(2000);
      expect(payable.cents()).assertEqual(66700);
      expect(payable.equals(new Money(66700))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0150
     * @tc.name      coupon_at_exact_threshold_is_applicable_015
     * @tc.desc      Verify coupon at exact threshold is applicable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_at_exact_threshold_is_applicable_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_at_exact_threshold_is_applicable_015');
      let cart: Cart = cartWith([cartLine(0, 10000, 1)]);
      let book: CouponBook = defaultCouponBook();
      let best: Coupon | undefined = book.best(cart.subtotal());
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        // C0's 100 cents also qualifies, but C10's 1000 cents is the larger eligible discount.
        expect(best.discountCents).assertEqual(1000);
        expect(best.id === 'C10').assertTrue();
      }
      expect(cart.payable(book).cents()).assertEqual(9000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0160
     * @tc.name      coupon_one_cent_below_threshold_is_not_applicable_016
     * @tc.desc      Verify coupon one cent below threshold is not applicable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_one_cent_below_threshold_is_not_applicable_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_one_cent_below_threshold_is_not_applicable_016');
      let cart: Cart = cartWith([cartLine(0, 9999, 1)]);
      let book: CouponBook = defaultCouponBook();
      let best: Coupon | undefined = book.best(cart.subtotal());
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        // One cent short of 10000 locks C10, leaving only the threshold-free C0 with 100 off.
        expect(best.discountCents).assertEqual(100);
        expect(best.isUsableFor(cart.subtotal().cents())).assertTrue();
      }
      expect(cart.payable(book).cents()).assertEqual(9899);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0170
     * @tc.name      best_discount_selects_largest_coupon_017
     * @tc.desc      Verify best discount selects largest coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('best_discount_selects_largest_coupon_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: best_discount_selects_largest_coupon_017');
      let lower: Coupon = new Coupon('LOW', 'low value', 0, 500);
      let higher: Coupon = new Coupon('HIGH', 'high value', 0, 1500);
      let book: CouponBook = couponBookWith(lower, higher);
      let subtotal: Money = new Money(10000);
      let best: Coupon | undefined = book.best(subtotal);
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.discountCents).assertEqual(1500);
        expect(best.thresholdCents).assertEqual(0);
      }
      expect(book.bestDiscount(subtotal).cents()).assertEqual(1500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0180
     * @tc.name      best_discount_of_empty_book_is_zero_018
     * @tc.desc      Verify best discount of empty book is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('best_discount_of_empty_book_is_zero_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: best_discount_of_empty_book_is_zero_018');
      let book: CouponBook = emptyCouponBook();
      let subtotal: Money = new Money(25000);
      expect(book.bestDiscount(subtotal).cents()).assertEqual(0);
      expect(book.best(subtotal) === undefined).assertTrue();
      expect(book.payable(subtotal).cents()).assertEqual(25000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0190
     * @tc.name      payable_never_becomes_negative_019
     * @tc.desc      Verify payable never becomes negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('payable_never_becomes_negative_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: payable_never_becomes_negative_019');
      let huge: Coupon = new Coupon('BIG', 'oversized discount', 0, 100000);
      let book: CouponBook = couponBookWith(huge, new Coupon('SMALL', 'small discount', 0, 100));
      let cart: Cart = cartWith([cartLine(0, 5000, 1)]);
      // A 100000-cent discount on a 5000-cent cart must floor at zero, not owe the buyer 95000.
      let payable: Money = cart.payable(book);
      expect(payable.cents()).assertEqual(0);
      expect(payable.isZero()).assertTrue();
      expect(payable.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0200
     * @tc.name      payable_equals_subtotal_minus_discount_020
     * @tc.desc      Verify payable equals subtotal minus discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('payable_equals_subtotal_minus_discount_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: payable_equals_subtotal_minus_discount_020');
      let cart: Cart = cartWith([cartLine(0, 30000, 1)]);
      let book: CouponBook = defaultCouponBook();
      let subtotal: Money = cart.subtotal();
      let discount: Money = cart.totalWithCoupon(book);
      let payable: Money = cart.payable(book);
      expect(discount.cents()).assertEqual(2000);
      expect(payable.cents()).assertEqual(28000);
      expect(payable.add(discount).equals(subtotal)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0210
     * @tc.name      percentage_discount_on_subtotal_rounds_to_nearest_021
     * @tc.desc      Verify percentage discount on subtotal rounds to nearest.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('percentage_discount_on_subtotal_rounds_to_nearest_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: percentage_discount_on_subtotal_rounds_to_nearest_021');
      let cart: Cart = cartWith([cartLine(0, 12345, 1)]);
      let subtotal: Money = cart.subtotal();
      let discount: Money = subtotal.percentage(33);
      expect(subtotal.cents()).assertEqual(12345);
      // 33% of 12345 is 4073.85, so the discount lands on 4074 rather than being truncated to 4073.
      expect(discount.cents()).assertEqual(4074);
      expect(discount.isPositive()).assertTrue();
      expect(discount.compareTo(subtotal)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0220
     * @tc.name      percentage_discount_rounds_half_cent_up_022
     * @tc.desc      Verify percentage discount rounds half cent up.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('percentage_discount_rounds_half_cent_up_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: percentage_discount_rounds_half_cent_up_022');
      let cart: Cart = cartWith([cartLine(0, 1235, 1)]);
      let subtotal: Money = cart.subtotal();
      let discount: Money = subtotal.percentage(50);
      // Exactly half a cent (617.5) rounds up to 618, so the tie breaks away from zero.
      expect(discount.cents()).assertEqual(618);
      expect(discount.equals(new Money(618))).assertTrue();
      expect(discount.compareTo(subtotal.percentage(100))).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0230
     * @tc.name      discounted_total_subtracts_from_subtotal_023
     * @tc.desc      Verify discounted total subtracts from subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('discounted_total_subtracts_from_subtotal_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: discounted_total_subtracts_from_subtotal_023');
      let cart: Cart = cartWith([cartLine(0, 999, 1)]);
      let subtotal: Money = cart.subtotal();
      let discount: Money = subtotal.percentage(50);
      let discounted: Money = subtotal.subtract(discount);
      expect(subtotal.cents()).assertEqual(999);
      // 499.5 rounds up to a 500 discount, so 499 is left to pay and the pair still sums to 999.
      expect(discount.cents()).assertEqual(500);
      expect(discounted.cents()).assertEqual(499);
      expect(discounted.add(discount).equals(subtotal)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0240
     * @tc.name      zero_price_item_has_zero_line_total_024
     * @tc.desc      Verify zero price item has zero line total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_price_item_has_zero_line_total_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_price_item_has_zero_line_total_024');
      let freeGoods: Money = createGoods(100, 'Free Sample', 0).price;
      let line: CartLine = new CartLine(100, freeGoods.cents(), 2, true);
      let total: Money = line.lineTotal();
      expect(total.cents()).assertEqual(0);
      expect(total.isZero()).assertTrue();
      expect(line.quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0250
     * @tc.name      zero_price_item_does_not_change_subtotal_025
     * @tc.desc      Verify zero price item does not change subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_price_item_does_not_change_subtotal_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_price_item_does_not_change_subtotal_025');
      let cart: Cart = cartWith([
        cartLine(0, 19900, 1, true),
        cartLine(100, 0, 2, true)
      ]);
      let subtotal: Money = cart.subtotal();
      expect(subtotal.cents()).assertEqual(19900);
      expect(subtotal.equals(new Money(19900))).assertTrue();
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0260
     * @tc.name      add_clamps_request_to_the_tighter_ceiling_026
     * @tc.desc      Verify add clamps request to the tighter ceiling.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_clamps_request_to_the_tighter_ceiling_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_clamps_request_to_the_tighter_ceiling_026');
      // Stock 5 caps the first request, while the 99-unit line ceiling caps the second, not stock 500.
      let stocks: number[] = [5, 500];
      let requests: number[] = [50, 200];
      let expectedAccepted: number[] = [5, 99];
      let expectedSubtotal: number[] = [500, 9900];
      expect(stocks.length).assertEqual(requests.length);
      expect(expectedAccepted.length).assertEqual(expectedSubtotal.length);
      for (let index: number = 0; index < stocks.length; index++) {
        let cart: Cart = new Cart();
        let accepted: number = cart.add(10, 100, requests[index], stocks[index]);
        expect(accepted).assertEqual(expectedAccepted[index]);
        expect(cart.quantityOf(10)).assertEqual(expectedAccepted[index]);
        expect(cart.subtotal().cents()).assertEqual(expectedSubtotal[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0270
     * @tc.name      add_twice_accumulates_quantity_027
     * @tc.desc      Verify add twice accumulates quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_twice_accumulates_quantity_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_twice_accumulates_quantity_027');
      let cart: Cart = new Cart();
      cart.add(10, 100, 2);
      let finalQuantity: number = cart.add(10, 100, 3);
      expect(finalQuantity).assertEqual(5);
      expect(cart.quantityOf(10)).assertEqual(5);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.subtotal().cents()).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0280
     * @tc.name      add_non_positive_quantity_keeps_cart_empty_028
     * @tc.desc      Verify add non positive quantity keeps cart empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_non_positive_quantity_keeps_cart_empty_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_non_positive_quantity_keeps_cart_empty_028');
      let cart: Cart = new Cart();
      let returned: number = cart.add(10, 100, 0);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(0);
      expect(cart.subtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0290
     * @tc.name      set_quantity_zero_removes_line_029
     * @tc.desc      Verify set quantity zero removes line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_zero_removes_line_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_zero_removes_line_029');
      let cart: Cart = cartWith([cartLine(10, 1000, 2)]);
      let returned: number = cart.setQuantity(10, 0);
      expect(returned).assertEqual(0);
      expect(cart.contains(10)).assertFalse();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0300
     * @tc.name      price_calculation_stock_cap_limits_line_amount_030
     * @tc.desc      Verify price calculation stock cap limits line amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('price_calculation_stock_cap_limits_line_amount_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: price_calculation_stock_cap_limits_line_amount_030');
      let cart: Cart = new Cart();
      cart.add(10, 100, 1, 10);
      let clamped: number = cart.setQuantity(10, 50, 10);
      // Only 10 units exist, so a request for 50 settles at 10 and the subtotal at 1000.
      expect(clamped).assertEqual(10);
      expect(cart.quantityOf(10)).assertEqual(10);
      expect(cart.subtotal().cents()).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0310
     * @tc.name      remove_line_reduces_subtotal_031
     * @tc.desc      Verify remove line reduces subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_line_reduces_subtotal_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_line_reduces_subtotal_031');
      let cart: Cart = cartWith([
        cartLine(0, 19900, 1),
        cartLine(1, 8900, 2)
      ]);
      expect(cart.subtotal().cents()).assertEqual(37700);
      let removed: boolean = cart.remove(0);
      expect(removed).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(17800);
      expect(cart.contains(0)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0320
     * @tc.name      cart_subtotal_after_remove_equals_remaining_032
     * @tc.desc      Verify cart subtotal after remove equals remaining.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_subtotal_after_remove_equals_remaining_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_subtotal_after_remove_equals_remaining_032');
      let cart: Cart = cartWith([
        cartLine(0, 19900, 2),
        cartLine(1, 8900, 3)
      ]);
      cart.remove(0);
      let remainingLine: CartLine | undefined = cart.lineAt(0);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.subtotal().cents()).assertEqual(26700);
      if (remainingLine !== undefined) {
        expect(remainingLine.goodsId).assertEqual(1);
        expect(cart.subtotal().equals(remainingLine.lineTotal())).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0330
     * @tc.name      deselecting_line_reduces_subtotal_033
     * @tc.desc      Verify deselecting line reduces subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deselecting_line_reduces_subtotal_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deselecting_line_reduces_subtotal_033');
      let cart: Cart = cartWith([
        cartLine(0, 19900, 1, true),
        cartLine(1, 8900, 2, true)
      ]);
      expect(cart.subtotal().cents()).assertEqual(37700);
      let flipped: boolean = cart.setSelected(1, false);
      expect(flipped).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(19900);
      expect(cart.allLinesSubtotal().cents()).assertEqual(37700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0340
     * @tc.name      clearing_selection_zeroes_subtotal_034
     * @tc.desc      Verify clearing selection zeroes subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clearing_selection_zeroes_subtotal_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clearing_selection_zeroes_subtotal_034');
      let cart: Cart = cartWith([
        cartLine(0, 19900, 1, true),
        cartLine(1, 8900, 2, true)
      ]);
      cart.setAllSelected(false);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.isAllSelected()).assertFalse();
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.allLinesSubtotal().cents()).assertEqual(37700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0350
     * @tc.name      order_total_matches_line_totals_035
     * @tc.desc      Verify order total matches line totals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_total_matches_line_totals_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_total_matches_line_totals_035');
      let lines: CartLine[] = [cartLine(0, 19900, 2), cartLine(1, 8900, 3)];
      let order: Order = new Order(1, lines, OrderState.OBLIGATION, 0);
      let total: Money = order.total();
      expect(total.cents()).assertEqual(66500);
      expect(total.equals(new Money(66500))).assertTrue();
      expect(order.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0360
     * @tc.name      order_quantity_matches_line_quantities_036
     * @tc.desc      Verify order quantity matches line quantities.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_quantity_matches_line_quantities_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_quantity_matches_line_quantities_036');
      let lines: CartLine[] = [cartLine(0, 19900, 2), cartLine(1, 8900, 3)];
      let order: Order = new Order(2, lines, OrderState.WAIT_DELIVERY, 0);
      expect(order.quantity()).assertEqual(5);
      expect(order.lines[0].quantity).assertEqual(2);
      expect(order.lines[1].quantity).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0370
     * @tc.name      order_total_matches_cart_all_lines_subtotal_037
     * @tc.desc      Verify order total matches cart all lines subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_total_matches_cart_all_lines_subtotal_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_total_matches_cart_all_lines_subtotal_037');
      let cartSubtotal: Money = LARGE_CART.allLinesSubtotal();
      // LARGE_CART holds all 16 catalogue rows, so the order must total the same 4242000.
      let order: Order = new Order(3, LARGE_CART.allLines(), OrderState.OBLIGATION, 0);
      expect(cartSubtotal.cents()).assertEqual(4242000);
      expect(order.total().equals(cartSubtotal)).assertTrue();
      expect(order.lines.length).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0380
     * @tc.name      repeated_subtotal_is_stable_038
     * @tc.desc      Verify repeated subtotal is stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_subtotal_is_stable_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_subtotal_is_stable_038');
      let first: Money = referenceCart.subtotal();
      let second: Money = referenceCart.subtotal();
      expect(first.cents()).assertEqual(2000);
      expect(first.equals(second)).assertTrue();
      expect(first.compareTo(second)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0390
     * @tc.name      repeated_payable_is_stable_039
     * @tc.desc      Verify repeated payable is stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_payable_is_stable_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_payable_is_stable_039');
      let cart: Cart = cartWith([cartLine(0, 29900, 2), cartLine(4, 8900, 1)]);
      let book: CouponBook = defaultCouponBook();
      let first: Money = cart.payable(book);
      let second: Money = cart.payable(book);
      expect(first.cents()).assertEqual(66700);
      expect(first.equals(second)).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(68700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0400
     * @tc.name      two_carts_with_same_lines_have_equal_subtotal_040
     * @tc.desc      Verify two carts with same lines have equal subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('two_carts_with_same_lines_have_equal_subtotal_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: two_carts_with_same_lines_have_equal_subtotal_040');
      let first: Cart = cartWith([cartLine(0, 1000, 2), cartLine(1, 500, 3)]);
      let second: Cart = cartWith([cartLine(0, 1000, 2), cartLine(1, 500, 3)]);
      expect(first.subtotal().cents()).assertEqual(3500);
      expect(first.subtotal().equals(second.subtotal())).assertTrue();
      expect(first.totalQuantity()).assertEqual(second.totalQuantity());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0410
     * @tc.name      empty_cart_payable_with_coupons_is_zero_041
     * @tc.desc      Verify empty cart payable with coupons is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('empty_cart_payable_with_coupons_is_zero_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: empty_cart_payable_with_coupons_is_zero_041');
      let cart: Cart = new Cart();
      let book: CouponBook = defaultCouponBook();
      let payable: Money = cart.payable(book);
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(payable.cents()).assertEqual(0);
      expect(payable.isZero()).assertTrue();
      expect(payable.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0420
     * @tc.name      total_with_coupon_returns_discount_amount_042
     * @tc.desc      Verify total with coupon returns discount amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('total_with_coupon_returns_discount_amount_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: total_with_coupon_returns_discount_amount_042');
      let cart: Cart = cartWith([cartLine(0, 30000, 1)]);
      let book: CouponBook = defaultCouponBook();
      let discount: Money = cart.totalWithCoupon(book);
      expect(discount.cents()).assertEqual(2000);
      expect(discount.equals(new Money(2000))).assertTrue();
      expect(discount.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0430
     * @tc.name      coupon_tie_keeps_first_registered_043
     * @tc.desc      Verify coupon tie keeps first registered.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_tie_keeps_first_registered_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_tie_keeps_first_registered_043');
      let first: Coupon = new Coupon('FIRST', 'first equal discount', 0, 500);
      let second: Coupon = new Coupon('SECOND', 'second equal discount', 0, 500);
      let book: CouponBook = couponBookWith(first, second);
      let subtotal: Money = new Money(10000);
      let best: Coupon | undefined = book.best(subtotal);
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        // Equal 500-cent offers resolve by registration order, so FIRST wins over SECOND.
        expect(best.discountCents).assertEqual(500);
        expect(best.title === 'first equal discount').assertTrue();
      }
      expect(book.bestDiscount(subtotal).cents()).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0440
     * @tc.name      payable_for_cart_below_threshold_uses_small_coupon_044
     * @tc.desc      Verify payable for cart below threshold uses small coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('payable_for_cart_below_threshold_uses_small_coupon_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: payable_for_cart_below_threshold_uses_small_coupon_044');
      let cart: Cart = cartWith([cartLine(0, 5000, 1)]);
      let book: CouponBook = defaultCouponBook();
      let discount: Money = cart.totalWithCoupon(book);
      // At 5000 every tiered coupon is locked, so only C0's 100 cents can be taken off.
      let payable: Money = cart.payable(book);
      expect(discount.cents()).assertEqual(100);
      expect(payable.cents()).assertEqual(4900);
      expect(payable.add(discount).equals(cart.subtotal())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0450
     * @tc.name      cart_merge_adds_quantities_of_same_goods_045
     * @tc.desc      Verify cart merge adds quantities of same goods.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_adds_quantities_of_same_goods_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_adds_quantities_of_same_goods_045');
      let target: Cart = cartWith([cartLine(0, 1000, 2)]);
      let source: Cart = cartWith([cartLine(0, 1000, 3)]);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(1);
      expect(target.quantityOf(0)).assertEqual(5);
      expect(target.subtotal().cents()).assertEqual(5000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0460
     * @tc.name      cart_merge_keeps_distinct_goods_separate_046
     * @tc.desc      Verify cart merge keeps distinct goods separate.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_merge_keeps_distinct_goods_separate_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_merge_keeps_distinct_goods_separate_046');
      let target: Cart = cartWith([cartLine(0, 1000, 2)]);
      let source: Cart = cartWith([cartLine(1, 500, 4)]);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.quantityOf(1)).assertEqual(4);
      expect(target.subtotal().cents()).assertEqual(4000);
      expect(target.allLines().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0470
     * @tc.name      cart_subtotal_single_line_equals_line_total_047
     * @tc.desc      Verify cart subtotal single line equals line total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_subtotal_single_line_equals_line_total_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_subtotal_single_line_equals_line_total_047');
      let line: CartLine = cartLine(0, 19900, 2);
      let cart: Cart = cartWith([line]);
      let fromCart: Money = cart.subtotal();
      let fromLine: Money = line.lineTotal();
      expect(fromCart.cents()).assertEqual(39800);
      expect(fromCart.equals(fromLine)).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0480
     * @tc.name      cart_all_lines_subtotal_equals_selected_when_all_selected_048
     * @tc.desc      Verify cart all lines subtotal equals selected when all selected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_all_lines_subtotal_equals_selected_when_all_selected_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_all_lines_subtotal_equals_selected_when_all_selected_048');
      let cart: Cart = cartWith([
        cartLine(0, 19900, 1, true),
        cartLine(1, 8900, 2, true)
      ]);
      expect(cart.isAllSelected()).assertTrue();
      expect(cart.subtotal().equals(cart.allLinesSubtotal())).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(37700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0490
     * @tc.name      remove_unknown_goods_returns_false_049
     * @tc.desc      Verify remove unknown goods returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_unknown_goods_returns_false_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_unknown_goods_returns_false_049');
      let cart: Cart = cartWith([cartLine(0, 19900, 1)]);
      let removed: boolean = cart.remove(99);
      expect(removed).assertFalse();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.subtotal().cents()).assertEqual(19900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0500
     * @tc.name      toggle_selected_flips_flag_and_recomputes_subtotal_050
     * @tc.desc      Verify toggle selected flips flag and recomputes subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('toggle_selected_flips_flag_and_recomputes_subtotal_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: toggle_selected_flips_flag_and_recomputes_subtotal_050');
      let cart: Cart = cartWith([
        cartLine(0, 1000, 1, true),
        cartLine(1, 2000, 1, false)
      ]);
      expect(cart.subtotal().cents()).assertEqual(1000);
      let flipped: boolean = cart.toggleSelected(1);
      expect(flipped).assertTrue();
      // Selecting the previously ignored 2000 line adds its full amount on top of the 1000 already counted.
      expect(cart.subtotal().cents()).assertEqual(3000);
      expect(cart.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0510
     * @tc.name      increase_quantity_adds_delta_051
     * @tc.desc      Verify increase quantity adds delta.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_quantity_adds_delta_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_quantity_adds_delta_051');
      let cart: Cart = cartWith([cartLine(0, 1000, 2)]);
      let updated: number = cart.increase(0, 3);
      expect(updated).assertEqual(5);
      expect(cart.quantityOf(0)).assertEqual(5);
      expect(cart.subtotal().cents()).assertEqual(5000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0520
     * @tc.name      decrease_quantity_reduces_delta_052
     * @tc.desc      Verify decrease quantity reduces delta.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_quantity_reduces_delta_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_quantity_reduces_delta_052');
      let cart: Cart = cartWith([cartLine(0, 1000, 5)]);
      let updated: number = cart.decrease(0, 2);
      expect(updated).assertEqual(3);
      expect(cart.quantityOf(0)).assertEqual(3);
      expect(cart.subtotal().cents()).assertEqual(3000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0530
     * @tc.name      increase_clamps_to_stock_053
     * @tc.desc      Verify increase clamps to stock.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_clamps_to_stock_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_clamps_to_stock_053');
      let cart: Cart = new Cart();
      cart.add(10, 100, 1, 10);
      let updated: number = cart.increase(10, 50, 10);
      expect(updated).assertEqual(10);
      expect(cart.quantityOf(10)).assertEqual(10);
      expect(cart.subtotal().cents()).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0540
     * @tc.name      decrease_to_zero_removes_line_054
     * @tc.desc      Verify decrease to zero removes line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_to_zero_removes_line_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_to_zero_removes_line_054');
      let cart: Cart = cartWith([cartLine(0, 1000, 2)]);
      let updated: number = cart.decrease(0, 2);
      expect(updated).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0550
     * @tc.name      add_with_zero_stock_leaves_cart_untouched_055
     * @tc.desc      Verify add with zero stock leaves cart untouched.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_with_zero_stock_leaves_cart_untouched_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_with_zero_stock_leaves_cart_untouched_055');
      let cart: Cart = new Cart();
      let returned: number = cart.add(10, 100, 1, 0);
      expect(returned).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(0);
      expect(cart.subtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0560
     * @tc.name      add_existing_goods_keeps_original_unit_price_056
     * @tc.desc      Verify add existing goods keeps original unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_existing_goods_keeps_original_unit_price_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_existing_goods_keeps_original_unit_price_056');
      let cart: Cart = new Cart();
      cart.add(10, 1000, 1);
      cart.add(10, 2000, 3);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(cart.quantityOf(10)).assertEqual(4);
      // The later 2000-cent add only bumps quantity; the line keeps the first 1000-cent unit price.
      expect(cart.subtotal().cents()).assertEqual(4000);
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(1000);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0570
     * @tc.name      clear_empties_cart_057
     * @tc.desc      Verify clear empties cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_empties_cart_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_empties_cart_057');
      let cart: Cart = cartWith([
        cartLine(0, 19900, 1),
        cartLine(1, 8900, 2)
      ]);
      expect(cart.distinctCount()).assertEqual(2);
      cart.clear();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0580
     * @tc.name      coupon_zero_threshold_always_usable_058
     * @tc.desc      Verify coupon zero threshold always usable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_zero_threshold_always_usable_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_zero_threshold_always_usable_058');
      let coupon: Coupon = new Coupon('ZERO', 'zero threshold', 0, 100);
      // A zero threshold makes the coupon usable from an empty cart upward, with no upper bound.
      expect(coupon.isUsableFor(0)).assertTrue();
      expect(coupon.isUsableFor(1)).assertTrue();
      expect(coupon.isUsableFor(100000)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0590
     * @tc.name      coupon_apply_clamps_at_zero_059
     * @tc.desc      Verify coupon apply clamps at zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_apply_clamps_at_zero_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_apply_clamps_at_zero_059');
      let coupon: Coupon = new Coupon('BIG', 'oversized', 0, 1000);
      let applied: Money = coupon.apply(new Money(500));
      expect(applied.cents()).assertEqual(0);
      expect(applied.isZero()).assertTrue();
      expect(applied.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0600
     * @tc.name      coupon_apply_subtracts_discount_060
     * @tc.desc      Verify coupon apply subtracts discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_apply_subtracts_discount_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_apply_subtracts_discount_060');
      let coupon: Coupon = new Coupon('C10', 'ten off', 0, 1000);
      let applied: Money = coupon.apply(new Money(5000));
      expect(applied.cents()).assertEqual(4000);
      expect(applied.equals(new Money(4000))).assertTrue();
      expect(applied.compareTo(new Money(5000))).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0610
     * @tc.name      coupon_book_applicable_lists_matching_061
     * @tc.desc      Verify coupon book applicable lists matching.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_book_applicable_lists_matching_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_book_applicable_lists_matching_061');
      let coupons: Coupon[] = [
        new Coupon('A', 'no threshold', 0, 100),
        new Coupon('B', 'mid threshold', 10000, 500),
        new Coupon('C', 'high threshold', 20000, 900)
      ];
      let book: CouponBook = new CouponBook(coupons);
      let usable: Coupon[] = book.applicable(new Money(15000));
      // 15000 clears A and B but not C's 20000 threshold, so of the three coupons only two apply.
      expect(book.size()).assertEqual(3);
      expect(usable.length).assertEqual(2);
      expect(book.applicable(new Money(0)).length).assertEqual(1);
      expect(book.bestDiscount(new Money(15000)).cents()).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0620
     * @tc.name      percentage_discount_full_percent_makes_free_062
     * @tc.desc      Verify percentage discount full percent makes free.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('percentage_discount_full_percent_makes_free_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: percentage_discount_full_percent_makes_free_062');
      let cart: Cart = cartWith([cartLine(0, 12345, 1)]);
      let subtotal: Money = cart.subtotal();
      let discount: Money = subtotal.percentage(100);
      let discounted: Money = subtotal.subtract(discount);
      expect(discount.cents()).assertEqual(12345);
      expect(discounted.cents()).assertEqual(0);
      expect(discounted.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0630
     * @tc.name      order_total_empty_is_zero_063
     * @tc.desc      Verify order total empty is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_total_empty_is_zero_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_total_empty_is_zero_063');
      let lines: CartLine[] = [];
      let order: Order = new Order(9, lines, OrderState.CANCELLED, 0);
      expect(order.total().cents()).assertEqual(0);
      expect(order.quantity()).assertEqual(0);
      expect(order.lines.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0640
     * @tc.name      order_copies_lines_so_cart_changes_do_not_affect_total_064
     * @tc.desc      Verify order copies lines so cart changes do not affect total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_copies_lines_so_cart_changes_do_not_affect_total_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_copies_lines_so_cart_changes_do_not_affect_total_064');
      let cart: Cart = cartWith([cartLine(0, 1000, 2)]);
      let order: Order = new Order(4, cart.allLines(), OrderState.WAIT_DELIVERY, 0);
      expect(order.total().cents()).assertEqual(2000);
      cart.increase(0, 3);
      expect(cart.quantityOf(0)).assertEqual(5);
      expect(cart.subtotal().cents()).assertEqual(5000);
      // The order holds its own 2000-cent total even after the source cart grew to five units.
      expect(order.total().cents()).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0650
     * @tc.name      cart_snapshot_restore_preserves_subtotal_065
     * @tc.desc      Verify cart snapshot restore preserves subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_snapshot_restore_preserves_subtotal_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_snapshot_restore_preserves_subtotal_065');
      let cart: Cart = cartWith([cartLine(0, 1000, 3), cartLine(1, 500, 2)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      expect(cart.subtotal().cents()).assertEqual(4000);
      expect(restored.subtotal().cents()).assertEqual(4000);
      expect(restored.subtotal().equals(cart.subtotal())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0660
     * @tc.name      cart_is_all_selected_only_when_every_line_selected_066
     * @tc.desc      Verify cart is all selected only when every line selected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_is_all_selected_only_when_every_line_selected_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_is_all_selected_only_when_every_line_selected_066');
      let cart: Cart = cartWith([
        cartLine(0, 1000, 1, true),
        cartLine(1, 2000, 1, false)
      ]);
      expect(cart.isAllSelected()).assertFalse();
      cart.setAllSelected(true);
      expect(cart.isAllSelected()).assertTrue();
      cart.setSelected(0, false);
      expect(cart.isAllSelected()).assertFalse();
      expect(cart.subtotal().cents()).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0670
     * @tc.name      line_total_reflects_cart_quantity_increase_067
     * @tc.desc      Verify line total reflects cart quantity increase.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('line_total_reflects_cart_quantity_increase_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: line_total_reflects_cart_quantity_increase_067');
      let cart: Cart = cartWith([cartLine(0, 1000, 1)]);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== null && line !== undefined).assertTrue();
      cart.increase(0, 2);
      if (line !== undefined) {
        expect(line.quantity).assertEqual(3);
        expect(line.lineTotal().cents()).assertEqual(3000);
      }
      expect(cart.subtotal().cents()).assertEqual(3000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0680
     * @tc.name      subtotal_with_unselected_single_line_is_zero_068
     * @tc.desc      Verify subtotal with unselected single line is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('subtotal_with_unselected_single_line_is_zero_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: subtotal_with_unselected_single_line_is_zero_068');
      let cart: Cart = cartWith([cartLine(0, 1000, 3, false)]);
      // The lone line is unselected, so subtotal is 0 while totalQuantity still reports its 3 units.
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.allLinesSubtotal().cents()).assertEqual(3000);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0690
     * @tc.name      add_zero_quantity_to_existing_goods_returns_current_quantity_069
     * @tc.desc      Verify add zero quantity to existing goods returns current quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('add_zero_quantity_to_existing_goods_returns_current_quantity_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: add_zero_quantity_to_existing_goods_returns_current_quantity_069');
      let cart: Cart = new Cart();
      cart.add(10, 1000, 2);
      let returned: number = cart.add(10, 1000, 0);
      expect(returned).assertEqual(2);
      expect(cart.quantityOf(10)).assertEqual(2);
      expect(cart.subtotal().cents()).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0700
     * @tc.name      coupon_book_best_ignores_unusable_high_discount_070
     * @tc.desc      Verify coupon book best ignores unusable high discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_book_best_ignores_unusable_high_discount_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_book_best_ignores_unusable_high_discount_070');
      let low: Coupon = new Coupon('LOW', 'always usable', 0, 100);
      let high: Coupon = new Coupon('HIGH', 'needs big order', 100000, 9000);
      let book: CouponBook = couponBookWith(low, high);
      let subtotal: Money = new Money(5000);
      let best: Coupon | undefined = book.best(subtotal);
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        // The 9000-cent offer needs a 100000 cart, so the always-usable 100-cent coupon wins by default.
        expect(best.discountCents).assertEqual(100);
        expect(best.id === 'LOW').assertTrue();
      }
      expect(book.applicable(subtotal).length).assertEqual(1);
      expect(book.bestDiscount(subtotal).cents()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0710
     * @tc.name      percentage_discount_on_empty_cart_is_zero_071
     * @tc.desc      Verify percentage discount on empty cart is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('percentage_discount_on_empty_cart_is_zero_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: percentage_discount_on_empty_cart_is_zero_071');
      let cart: Cart = new Cart();
      let subtotal: Money = cart.subtotal();
      let discount: Money = subtotal.percentage(50);
      expect(subtotal.cents()).assertEqual(0);
      expect(discount.cents()).assertEqual(0);
      expect(discount.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0720
     * @tc.name      coupon_book_payable_matches_cart_payable_072
     * @tc.desc      Verify coupon book payable matches cart payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_book_payable_matches_cart_payable_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_book_payable_matches_cart_payable_072');
      let cart: Cart = cartWith([cartLine(0, 30000, 1)]);
      let book: CouponBook = defaultCouponBook();
      let fromBook: Money = book.payable(cart.subtotal());
      let fromCart: Money = cart.payable(book);
      expect(fromBook.cents()).assertEqual(28000);
      expect(fromBook.equals(fromCart)).assertTrue();
      expect(fromCart.compareTo(new Money(30000))).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_PRICE_CALCULATION_0730
     * @tc.name      cart_remove_last_line_leaves_empty_cart_073
     * @tc.desc      Verify cart remove last line leaves empty cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_remove_last_line_leaves_empty_cart_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_remove_last_line_leaves_empty_cart_073');
      let cart: Cart = cartWith([cartLine(0, 1000, 1)]);
      expect(cart.remove(0)).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(0);
      expect(cart.contains(0)).assertFalse();
    });
  });
}
