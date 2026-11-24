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
import { throwsSync } from '../Shared/AsyncSupport';
import { yieldToEventLoop } from '../Shared/TestDriver';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Address, AddressBook, Cart, CartLine, CartSnapshot, Catalog, Coupon, CouponBook, Goods, Money, Order, OrderCenter, OrderState, SearchEngine } from '../Shared/ShopModel';
import { EMPTY_KEYWORDS, INVALID_PHONES, PHONE_SAMPLES, PRODUCTS, cartLine, cartWith, createAddress, createGoods, defaultCatalog, defaultCouponBook } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function securityValidationTest() {
  describe('OrangeShoppingSecurity', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'security suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0010
     * @tc.name      money_yuan_conversion_rounds_to_integer_cents_001
     * @tc.desc      Verify money yuan conversion rounds to integer cents.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_yuan_conversion_rounds_to_integer_cents_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_yuan_conversion_rounds_to_integer_cents_001');
      let price: Money = Money.ofYuan(19.99);
      expect(price.cents()).assertEqual(1999);
      let rounded: Money = new Money(12.6);
      expect(rounded.cents()).assertEqual(13);
      let free: Money = Money.ofYuan(0);
      expect(free.cents()).assertEqual(0);
      expect(free.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0020
     * @tc.name      money_rejects_non_finite_cents_002
     * @tc.desc      Verify money rejects non finite cents.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_rejects_non_finite_cents_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_rejects_non_finite_cents_002');
      // NaN, +Infinity and -Infinity are the three non-finite doubles a price could arrive as.
      let __thrown476: boolean = false;
      try {
        ((): void => {
        let invalid: Money = new Money(Number.NaN);
        expect(invalid !== null && invalid !== undefined).assertTrue();
      })();
      } catch (error) {
        __thrown476 = true;
      }
      expect(__thrown476).assertTrue();
      let __thrown477: boolean = false;
      try {
        ((): void => {
        let invalid: Money = new Money(Number.POSITIVE_INFINITY);
        expect(invalid !== null && invalid !== undefined).assertTrue();
      })();
      } catch (error) {
        __thrown477 = true;
      }
      expect(__thrown477).assertTrue();
      let __thrown478: boolean = false;
      try {
        ((): void => {
        let invalid: Money = new Money(Number.NEGATIVE_INFINITY);
        expect(invalid !== null && invalid !== undefined).assertTrue();
      })();
      } catch (error) {
        __thrown478 = true;
      }
      expect(__thrown478).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0030
     * @tc.name      money_negative_value_is_detected_and_clamped_003
     * @tc.desc      Verify money negative value is detected and clamped.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_negative_value_is_detected_and_clamped_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_negative_value_is_detected_and_clamped_003');
      let adjustment: Money = new Money(-500);
      expect(adjustment.isNegative()).assertTrue();
      expect(adjustment.isPositive()).assertFalse();
      expect(adjustment.isZero()).assertFalse();
      let clamped: Money = adjustment.clampAtZero();
      expect(clamped.cents()).assertEqual(0);
      expect(clamped.isNegative()).assertFalse();
      expect(adjustment.equals(clamped)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0040
     * @tc.name      security_negative_quantity_multiplication_rejected_004
     * @tc.desc      Verify security negative quantity multiplication rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('security_negative_quantity_multiplication_rejected_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_negative_quantity_multiplication_rejected_004');
      let base: Money = new Money(1000);
      let thrown: boolean = throwsSync((): void => {
        let invalid: Money = base.multiply(-1);
        expect(invalid !== null && invalid !== undefined).assertTrue();
      });
      expect(thrown).assertTrue();
      // The guard rejects negative factors only: a factor of 0 must still pass and yield exact zero.
      let zero: Money = base.multiply(0);
      expect(zero.cents()).assertEqual(0);
      expect(base.multiply(3).cents()).assertEqual(3000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0050
     * @tc.name      money_percentage_enforces_zero_to_one_hundred_005
     * @tc.desc      Verify money percentage enforces zero to one hundred.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_enforces_zero_to_one_hundred_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_enforces_zero_to_one_hundred_005');
      let base: Money = new Money(1000);
      let below: boolean = throwsSync((): void => {
        let invalid: Money = base.percentage(-1);
        expect(invalid !== null && invalid !== undefined).assertTrue();
      });
      let above: boolean = throwsSync((): void => {
        let invalid: Money = base.percentage(101);
        expect(invalid !== null && invalid !== undefined).assertTrue();
      });
      expect(below).assertTrue();
      expect(above).assertTrue();
      // The rejected values sit one step outside the legal window, and both endpoints 0 and 100 must stay valid.
      expect(base.percentage(0).cents()).assertEqual(0);
      expect(base.percentage(25).cents()).assertEqual(250);
      expect(base.percentage(100).cents()).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0060
     * @tc.name      money_format_keeps_the_sign_for_negative_amounts_006
     * @tc.desc      Verify money format keeps the sign for negative amounts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_format_keeps_the_sign_for_negative_amounts_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_format_keeps_the_sign_for_negative_amounts_006');
      expect(new Money(-1205).format()).assertEqual('-¥12.05');
      expect(new Money(-5).format()).assertEqual('-¥0.05');
      expect(new Money(0).format()).assertEqual('¥0.00');
      expect(new Money(1205).format()).assertEqual('¥12.05');
      expect(new Money(499900).format()).assertEqual('¥4999.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0070
     * @tc.name      cart_quantity_is_capped_at_ninety_nine_007
     * @tc.desc      Verify cart quantity is capped at ninety nine.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_quantity_is_capped_at_ninety_nine_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_quantity_is_capped_at_ninety_nine_007');
      let cart: Cart = new Cart();
      let added: number = cart.add(0, 1000, 150, 500);
      expect(added).assertEqual(99);
      let set: number = cart.setQuantity(0, 120, 500);
      expect(set).assertEqual(99);
      let increased: number = cart.increase(0, 20, 500);
      expect(increased).assertEqual(99);
      expect(cart.quantityOf(0)).assertEqual(99);
      expect(cart.subtotal().cents()).assertEqual(99000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0080
     * @tc.name      cart_zero_quantity_removes_the_line_008
     * @tc.desc      Verify cart zero quantity removes the line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_zero_quantity_removes_the_line_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_zero_quantity_removes_the_line_008');
      let cart: Cart = new Cart();
      cart.add(0, 1000, 2, 99);
      expect(cart.distinctCount()).assertEqual(1);
      let applied: number = cart.setQuantity(0, 0, 99);
      expect(applied).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.quantityOf(0)).assertEqual(0);
      expect(cart.contains(0)).assertFalse();
      expect(cart.subtotal().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0090
     * @tc.name      cart_non_positive_add_is_ignored_009
     * @tc.desc      Verify cart non positive add is ignored.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_non_positive_add_is_ignored_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_non_positive_add_is_ignored_009');
      let cart: Cart = new Cart();
      let zero: number = cart.add(0, 1000, 0, 99);
      expect(zero).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      let negative: number = cart.add(0, 1000, -5, 99);
      expect(negative).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      // A refused add reports the line's existing quantity of 2 rather than 0, so a badge keeps its value.
      cart.add(0, 1000, 2, 99);
      let rejected: number = cart.add(0, 1000, -1, 99);
      expect(rejected).assertEqual(2);
      expect(cart.quantityOf(0)).assertEqual(2);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0100
     * @tc.name      stock_cap_limits_the_line_quantity_010
     * @tc.desc      Verify stock cap limits the line quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_cap_limits_the_line_quantity_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_cap_limits_the_line_quantity_010');
      let goods: Goods = createGoods(800, 'Limited Stock Item', 2500, 'phone', 'limited', 'new_product', 5);
      let cart: Cart = new Cart();
      let added: number = cart.add(goods.id, goods.price.cents(), 10, goods.stock);
      expect(added).assertEqual(5);
      expect(cart.quantityOf(goods.id)).assertEqual(5);
      expect(cart.subtotal().cents()).assertEqual(12500);
      expect(goods.stock).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0110
     * @tc.name      stock_zero_rejects_the_add_011
     * @tc.desc      Verify stock zero rejects the add.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_zero_rejects_the_add_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_zero_rejects_the_add_011');
      let soldOut: Goods = PRODUCTS[6];
      expect(soldOut.isInStock()).assertFalse();
      let cart: Cart = new Cart();
      let accepted: number = cart.add(soldOut.id, soldOut.price.cents(), 1, soldOut.stock);
      expect(accepted).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.quantityOf(soldOut.id)).assertEqual(0);
      expect(cart.contains(soldOut.id)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0120
     * @tc.name      set_quantity_cannot_exceed_stock_012
     * @tc.desc      Verify set quantity cannot exceed stock.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_quantity_cannot_exceed_stock_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_quantity_cannot_exceed_stock_012');
      let cart: Cart = new Cart();
      cart.add(0, 1000, 1, 10);
      let applied: number = cart.setQuantity(0, 30, 10);
      expect(applied).assertEqual(10);
      expect(cart.quantityOf(0)).assertEqual(10);
      expect(cart.subtotal().cents()).assertEqual(10000);
      let increased: number = cart.increase(0, 5, 10);
      expect(increased).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0130
     * @tc.name      decrease_below_zero_removes_the_line_013
     * @tc.desc      Verify decrease below zero removes the line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('decrease_below_zero_removes_the_line_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: decrease_below_zero_removes_the_line_013');
      let cart: Cart = new Cart();
      cart.add(0, 1000, 2, 99);
      let applied: number = cart.decrease(0, 5, 99);
      expect(applied).assertEqual(0);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.quantityOf(0)).assertEqual(0);
      expect(cart.contains(0)).assertFalse();
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0140
     * @tc.name      increase_at_stock_cap_is_stable_014
     * @tc.desc      Verify increase at stock cap is stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_at_stock_cap_is_stable_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_at_stock_cap_is_stable_014');
      let cart: Cart = new Cart();
      cart.add(0, 1000, 10, 10);
      for (let index: number = 0; index < 10; index++) {
        let applied: number = cart.increase(0, 5, 10);
        expect(applied).assertEqual(10);
      }
      expect(cart.quantityOf(0)).assertEqual(10);
      expect(cart.subtotal().cents()).assertEqual(10000);
      expect(cart.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0150
     * @tc.name      cart_payable_never_goes_negative_015
     * @tc.desc      Verify cart payable never goes negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_payable_never_goes_negative_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_payable_never_goes_negative_015');
      let cart: Cart = cartWith([cartLine(0, 8900, 1, true)]);
      let book: CouponBook = new CouponBook([new Coupon('OVER', 'over the top', 0, 50000)]);
      let payable: Money = cart.payable(book);
      expect(payable.cents()).assertEqual(0);
      expect(payable.isNegative()).assertFalse();
      expect(payable.isZero()).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(8900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0160
     * @tc.name      coupon_threshold_is_not_unlocked_by_unselected_lines_016
     * @tc.desc      Verify coupon threshold is not unlocked by unselected lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_threshold_is_not_unlocked_by_unselected_lines_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_threshold_is_not_unlocked_by_unselected_lines_016');
      let cart: Cart = cartWith([
        cartLine(0, 5000, 1, true),
        cartLine(1, 20000, 1, false)
      ]);
      let book: CouponBook = new CouponBook([new Coupon('BULK', 'bulk threshold', 20000, 2000)]);
      expect(cart.subtotal().cents()).assertEqual(5000);
      // Only the checked 5000-cent line counts, so the 20000 threshold stays shut even though all lines total 25000.
      expect(cart.allLinesSubtotal().cents()).assertEqual(25000);
      expect(book.applicable(cart.subtotal()).length).assertEqual(0);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(0);
      expect(cart.payable(book).cents()).assertEqual(5000);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(0);
      expect(cart.selectedQuantity()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0170
     * @tc.name      zero_discount_coupon_keeps_the_payable_017
     * @tc.desc      Verify zero discount coupon keeps the payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_discount_coupon_keeps_the_payable_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_discount_coupon_keeps_the_payable_017');
      let cart: Cart = cartWith([cartLine(0, 12345, 1, true)]);
      let coupon: Coupon = new Coupon('ZERO', 'zero discount', 0, 0);
      let book: CouponBook = new CouponBook([coupon]);
      expect(book.size()).assertEqual(1);
      expect(book.applicable(cart.subtotal()).length).assertEqual(1);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(0);
      expect(cart.payable(book).cents()).assertEqual(12345);
      expect(cart.payable(book).cents()).assertEqual(cart.subtotal().cents());
      expect(cart.totalWithCoupon(book).cents()).assertEqual(0);
      expect(cart.payable(book).isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0180
     * @tc.name      empty_cart_payable_is_zero_018
     * @tc.desc      Verify empty cart payable is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('empty_cart_payable_is_zero_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: empty_cart_payable_is_zero_018');
      let cart: Cart = new Cart();
      let book: CouponBook = defaultCouponBook();
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.payable(book).cents()).assertEqual(0);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(100);
      expect(cart.payable(book).isZero()).assertTrue();
      expect(cart.payable(book).isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0190
     * @tc.name      cancelled_order_is_not_counted_as_spent_019
     * @tc.desc      Verify cancelled order is not counted as spent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cancelled_order_is_not_counted_as_spent_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cancelled_order_is_not_counted_as_spent_019');
      let order: Order = new Order(700, [cartLine(0, 5000, 1, true)], OrderState.OBLIGATION, 1);
      let center: OrderCenter = new OrderCenter([order]);
      let before: number = center.spent().cents();
      expect(order.cancel()).assertTrue();
      expect(center.spent().cents()).assertEqual(0);
      expect(before).assertEqual(5000);
      expect(order.total().cents()).assertEqual(5000);
      expect(center.counts().cancelled).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0200
     * @tc.name      completed_order_rejects_a_refund_request_020
     * @tc.desc      Verify completed order rejects a refund request.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('completed_order_rejects_a_refund_request_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: completed_order_rejects_a_refund_request_020');
      let order: Order = new Order(701, [cartLine(1, 5000, 1, true)], OrderState.OBLIGATION, 2);
      for (let step: number = 0; step < 4; step++) {
        order.advance();
      }
      let center: OrderCenter = new OrderCenter([order]);
      let refunded: boolean = order.refund();
      expect(refunded).assertFalse();
      expect(order.state).assertEqual(OrderState.COMPLETED);
      expect(order.isFinal()).assertTrue();
      expect(center.spent().cents()).assertEqual(5000);
      expect(center.counts().refund).assertEqual(0);
      expect(center.counts().completed).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0210
     * @tc.name      repeated_cancellation_keeps_the_spent_total_021
     * @tc.desc      Verify repeated cancellation keeps the spent total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_cancellation_keeps_the_spent_total_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_cancellation_keeps_the_spent_total_021');
      let order: Order = new Order(702, [cartLine(2, 7000, 1, true)], OrderState.OBLIGATION, 3);
      let center: OrderCenter = new OrderCenter([order]);
      let first: boolean = order.cancel();
      let second: boolean = order.cancel();
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().cancelled).assertEqual(1);
      expect(center.counts().total).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0220
     * @tc.name      phone_with_injection_characters_is_rejected_022
     * @tc.desc      Verify phone with injection characters is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('phone_with_injection_characters_is_rejected_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: phone_with_injection_characters_is_rejected_022');
      // Each entry keeps eleven leading digits and adds one hostile character, so only the digit check can reject it.
      let injections: string[] = [
        "1880000176'",
        '1880000176;',
        '1880000176 ',
        '<script>1'
      ];
      expect(injections.length).assertEqual(4);
      for (let index: number = 0; index < injections.length; index++) {
        expect(AddressBook.isValidPhone(injections[index])).assertFalse();
      }
      expect(AddressBook.isValidPhone("18800001765' OR '1'='1")).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0230
     * @tc.name      phone_outside_the_digit_pattern_is_rejected_023
     * @tc.desc      Verify phone outside the digit pattern is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('phone_outside_the_digit_pattern_is_rejected_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: phone_outside_the_digit_pattern_is_rejected_023');
      expect(INVALID_PHONES.length).assertEqual(10);
      for (let index: number = 0; index < INVALID_PHONES.length; index++) {
        expect(AddressBook.isValidPhone(INVALID_PHONES[index])).assertFalse();
      }
      expect(AddressBook.isValidPhone('1234567890')).assertFalse();
      expect(AddressBook.isValidPhone('28800001765')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0240
     * @tc.name      valid_phones_are_accepted_024
     * @tc.desc      Verify valid phones are accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('valid_phones_are_accepted_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: valid_phones_are_accepted_024');
      expect(PHONE_SAMPLES.length).assertEqual(10);
      for (let index: number = 0; index < PHONE_SAMPLES.length; index++) {
        expect(AddressBook.isValidPhone(PHONE_SAMPLES[index])).assertTrue();
        expect(PHONE_SAMPLES[index].length).assertEqual(11);
      }
      expect(AddressBook.isValidPhone('18800001765')).assertTrue();
      expect(AddressBook.isValidPhone('')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0250
     * @tc.name      address_with_missing_city_is_rejected_025
     * @tc.desc      Verify address with missing city is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_with_missing_city_is_rejected_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_with_missing_city_is_rejected_025');
      let book: AddressBook = new AddressBook();
      let address: Address = createAddress(5, 'Carol', '15800005678', '', '', 'Tianhe', '300 South Road');
      expect(book.validate(address)).assertEqual('CITY_EMPTY');
      expect(address.province.length).assertEqual(0);
      expect(address.city.length).assertEqual(0);
      expect(address.fullAddress()).assertEqual('Tianhe300 South Road');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0260
     * @tc.name      address_with_invalid_phone_is_rejected_026
     * @tc.desc      Verify address with invalid phone is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_with_invalid_phone_is_rejected_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_with_invalid_phone_is_rejected_026');
      let book: AddressBook = new AddressBook();
      let address: Address = createAddress(6, 'David', "1880000176'", 'Zhejiang', 'Hangzhou',
        'Xihu', '400 West Road');
      expect(book.validate(address)).assertEqual('PHONE_INVALID');
      let emptyPhone: Address = createAddress(7, 'David', '', 'Zhejiang', 'Hangzhou',
        'Xihu', '400 West Road');
      expect(book.validate(emptyPhone)).assertEqual('PHONE_INVALID');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0270
     * @tc.name      empty_and_blank_keywords_return_no_results_027
     * @tc.desc      Verify empty and blank keywords return no results.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('empty_and_blank_keywords_return_no_results_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: empty_and_blank_keywords_return_no_results_027');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      expect(EMPTY_KEYWORDS.length).assertEqual(5);
      for (let index: number = 0; index < EMPTY_KEYWORDS.length; index++) {
        expect(engine.search(EMPTY_KEYWORDS[index]).length).assertEqual(0);
        expect(engine.suggest(EMPTY_KEYWORDS[index], 5).length).assertEqual(0);
      }
      expect(engine.suggest('', 0).length).assertEqual(0);
      expect(engine.search('phone').length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0280
     * @tc.name      long_keyword_does_not_crash_search_or_suggest_028
     * @tc.desc      Verify long keyword does not crash search or suggest.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('long_keyword_does_not_crash_search_or_suggest_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: long_keyword_does_not_crash_search_or_suggest_028');
      // 4000 characters is long enough to stress any scanner or buffer, and prefixing 'phone' must not rescue it.
      let longKeyword: string = '';
      for (let index: number = 0; index < 4000; index++) {
        longKeyword += 'x';
      }
      expect(longKeyword.length).assertEqual(4000);
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      expect(engine.search(longKeyword).length).assertEqual(0);
      expect(engine.suggest(longKeyword, 5).length).assertEqual(0);
      expect(engine.search('phone' + longKeyword).length).assertEqual(0);
      expect(engine.search('phone').length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0290
     * @tc.name      keyword_with_injection_text_matches_nothing_029
     * @tc.desc      Verify keyword with injection text matches nothing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('keyword_with_injection_text_matches_nothing_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: keyword_with_injection_text_matches_nothing_029');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let hostile: string[] = [
        "' OR '1'='1",
        '; DROP TABLE goods',
        '<script>alert(1)</script>',
        'phone OR 1=1',
        '%%%'
      ];
      for (let index: number = 0; index < hostile.length; index++) {
        expect(engine.search(hostile[index]).length).assertEqual(0);
      }
      expect(catalog.count()).assertEqual(16);
      expect(engine.search('phone').length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0300
     * @tc.name      snapshot_lines_are_copies_of_the_cart_030
     * @tc.desc      Verify snapshot lines are copies of the cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_lines_are_copies_of_the_cart_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_lines_are_copies_of_the_cart_030');
      let cart: Cart = cartWith([
        cartLine(0, 1000, 1, true),
        cartLine(1, 2000, 2, true)
      ]);
      let subtotalBefore: number = cart.subtotal().cents();
      let snapshot: CartSnapshot = cart.snapshot();
      snapshot.lines[0].quantity = 50;
      snapshot.lines[1].selected = false;

      expect(cart.quantityOf(0)).assertEqual(1);
      let secondLine: CartLine | undefined = cart.lineAt(1);
      expect(secondLine !== null && secondLine !== undefined).assertTrue();
      if (secondLine !== undefined) {
        expect(secondLine.selected).assertTrue();
        expect(secondLine.quantity).assertEqual(2);
      }
      expect(cart.subtotal().cents()).assertEqual(subtotalBefore);
      expect(snapshot.lines[0].quantity).assertEqual(50);
      expect(snapshot.lines[1].selected).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0310
     * @tc.name      restored_cart_is_a_copy_of_the_snapshot_031
     * @tc.desc      Verify restored cart is a copy of the snapshot.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('restored_cart_is_a_copy_of_the_snapshot_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: restored_cart_is_a_copy_of_the_snapshot_031');
      let source: Cart = cartWith([cartLine(2, 3000, 3, true)]);
      let snapshot: CartSnapshot = source.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      // The snapshot is edited after restore, yet the restored cart keeps its three 3000-cent units: 9000.
      snapshot.lines[0].quantity = 77;
      expect(restored.quantityOf(2)).assertEqual(3);
      expect(restored.subtotal().cents()).assertEqual(9000);
      restored.clear();
      expect(snapshot.lines.length).assertEqual(1);
      expect(source.quantityOf(2)).assertEqual(3);
      expect(source.subtotal().cents()).assertEqual(9000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0320
     * @tc.name      repeated_snapshot_capture_is_stable_032
     * @tc.desc      Verify repeated snapshot capture is stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_snapshot_capture_is_stable_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_snapshot_capture_is_stable_032');
      let cart: Cart = cartWith([cartLine(0, 1500, 2, true), cartLine(4, 2500, 1, false)]);
      let first: CartSnapshot = cart.snapshot();
      let second: CartSnapshot = cart.snapshot();
      expect(first.lines.length).assertEqual(2);
      expect(second.lines.length).assertEqual(2);
      expect(first.lines[0].quantity).assertEqual(second.lines[0].quantity);
      first.lines[0].quantity = 40;
      expect(second.lines[0].quantity).assertEqual(2);
      expect(cart.quantityOf(0)).assertEqual(2);
      expect(cart.allLinesSubtotal().cents()).assertEqual(5500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0330
     * @tc.name      cart_operations_do_not_modify_catalog_prices_033
     * @tc.desc      Verify cart operations do not modify catalog prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_operations_do_not_modify_catalog_prices_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_operations_do_not_modify_catalog_prices_033');
      let catalog: Catalog = defaultCatalog();
      let before: number[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        before.push(catalog.all()[index].price.cents());
      }
      let cart: Cart = new Cart();
      cart.add(0, 1, 5, 30);
      cart.setQuantity(0, 99, 30);
      cart.increase(0, 10, 30);
      cart.remove(0);
      cart.add(4, 1, 2, 200);
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      restored.merge(cart);
      restored.clear();
      let after: number[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        after.push(catalog.all()[index].price.cents());

        expect(after[index] > 0).assertTrue();
      }
      expect((after).length).assertEqual((before).length);
      for (let __i475: number = 0; __i475 < (before).length; __i475++) {
        expect((after)[__i475]).assertEqual((before)[__i475]);
      }
      let firstGoods: Goods | undefined = catalog.byId(0);
      expect(firstGoods !== null && firstGoods !== undefined).assertTrue();
      if (firstGoods !== undefined) {
        expect(firstGoods.price.cents()).assertEqual(before[0]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0340
     * @tc.name      order_total_is_never_negative_034
     * @tc.desc      Verify order total is never negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_total_is_never_negative_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_total_is_never_negative_034');
      let paid: Order = new Order(703, [cartLine(0, 1000, 2, true)], OrderState.OBLIGATION, 4);
      expect(paid.total().cents()).assertEqual(2000);
      expect(paid.total().isNegative()).assertFalse();
      expect(paid.total().isPositive()).assertTrue();
      let free: Order = new Order(704, [cartLine(0, 0, 1, true)], OrderState.OBLIGATION, 5);
      expect(free.total().cents()).assertEqual(0);
      expect(free.total().isNegative()).assertFalse();
      expect(free.total().isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0350
     * @tc.name      order_center_spent_is_never_negative_035
     * @tc.desc      Verify order center spent is never negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_center_spent_is_never_negative_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_center_spent_is_never_negative_035');
      let orders: Order[] = [
        new Order(705, [cartLine(0, 3000, 1, true)], OrderState.OBLIGATION, 6),
        new Order(706, [cartLine(1, 4000, 1, true)], OrderState.CANCELLED, 7),
        new Order(707, [cartLine(2, 5000, 1, true)], OrderState.REFUND, 8)
      ];
      let center: OrderCenter = new OrderCenter(orders);
      let spent: Money = center.spent();
      expect(spent.cents()).assertEqual(3000);
      expect(spent.isNegative()).assertFalse();
      expect(spent.isPositive()).assertTrue();
      expect(center.counts().cancelled).assertEqual(1);
      expect(center.counts().refund).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0360
     * @tc.name      order_lines_are_copies_of_the_cart_lines_036
     * @tc.desc      Verify order lines are copies of the cart lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_lines_are_copies_of_the_cart_lines_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_lines_are_copies_of_the_cart_lines_036');
      let cart: Cart = cartWith([cartLine(0, 1000, 2, true), cartLine(1, 2000, 1, true)]);
      let order: Order = new Order(708, cart.selectedLines(), OrderState.OBLIGATION, 9);
      let originalTotal: number = order.total().cents();
      cart.setQuantity(0, 9, 99);
      cart.remove(1);
      expect(order.quantity()).assertEqual(3);
      expect(order.total().cents()).assertEqual(originalTotal);
      expect(order.lines[0].quantity).assertEqual(2);
      expect(order.lines.length).assertEqual(2);
      expect(cart.quantityOf(0)).assertEqual(9);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0370
     * @tc.name      cart_quantity_sweep_respects_the_cap_and_zero_037
     * @tc.desc      Verify cart quantity sweep respects the cap and zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_quantity_sweep_respects_the_cap_and_zero_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_quantity_sweep_respects_the_cap_and_zero_037');
      let cart: Cart = new Cart();
      cart.add(0, 1000, 1, 200);
      // 100 hits the cap at 99, while both -3 and 0 delete the line, so the cart ends empty.
      let requested: number[] = [1, 50, 99, 100, -3, 0];
      let expected: number[] = [1, 50, 99, 99, 0, 0];
      for (let index: number = 0; index < requested.length; index++) {
        let applied: number = cart.setQuantity(0, requested[index], 200);
        expect(applied).assertEqual(expected[index]);
        expect(cart.quantityOf(0)).assertEqual(expected[index]);
      }
      expect(cart.isEmpty()).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(0);
      expect(cart.distinctCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0380
     * @tc.name      stock_sweep_limits_each_add_to_available_units_038
     * @tc.desc      Verify stock sweep limits each add to available units.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_sweep_limits_each_add_to_available_units_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_sweep_limits_each_add_to_available_units_038');
      let stocks: number[] = [1, 3, 7, 12];
      for (let index: number = 0; index < stocks.length; index++) {
        let cart: Cart = new Cart();
        let accepted: number = cart.add(0, 1000, 20, stocks[index]);
        expect(accepted).assertEqual(stocks[index]);
        expect(cart.quantityOf(0)).assertEqual(stocks[index]);
        expect(cart.subtotal().cents()).assertEqual(stocks[index] * 1000);
        expect(cart.distinctCount()).assertEqual(1);
        expect(cart.totalQuantity()).assertEqual(stocks[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0390
     * @tc.name      coupon_threshold_sweep_keeps_payable_bounded_039
     * @tc.desc      Verify coupon threshold sweep keeps payable bounded.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_threshold_sweep_keeps_payable_bounded_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_threshold_sweep_keeps_payable_bounded_039');
      let cart: Cart = cartWith([cartLine(0, 10000, 1, true)]);
      // The sweep brackets the 10000-cent subtotal: a 9999 threshold still qualifies, 10001 does not.
      let thresholds: number[] = [0, 5000, 9999, 10001];
      let discounts: number[] = [100, 500, 1000, 1500];
      let usable: boolean[] = [true, true, true, false];
      for (let index: number = 0; index < thresholds.length; index++) {
        let coupon: Coupon = new Coupon('T' + index.toString(), 'tier coupon', thresholds[index],
          discounts[index]);
        let book: CouponBook = new CouponBook([coupon]);

        expect(book.size()).assertEqual(1);
        let payable: Money = cart.payable(book);
        expect(payable.isNegative()).assertFalse();
        if (usable[index]) {
          expect(payable.cents()).assertEqual(10000 - discounts[index]);
        } else {
          expect(payable.cents()).assertEqual(10000);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0400
     * @tc.name      phone_length_boundary_is_enforced_040
     * @tc.desc      Verify phone length boundary is enforced.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('phone_length_boundary_is_enforced_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: phone_length_boundary_is_enforced_040');
      let base: string = '18800001765';
      expect(base.length).assertEqual(11);
      expect(AddressBook.isValidPhone(base)).assertTrue();
      // Ten digits, twelve digits and a trailing letter each break one rule of the eleven-digit, leading-1 format.
      expect(AddressBook.isValidPhone(base.substring(0, 10))).assertFalse();
      expect(AddressBook.isValidPhone(base + '1')).assertFalse();
      expect(AddressBook.isValidPhone('1880000176')).assertFalse();
      expect(AddressBook.isValidPhone('188000017650')).assertFalse();
      expect(AddressBook.isValidPhone('')).assertFalse();
      expect(AddressBook.isValidPhone('1880000176a')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0410
     * @tc.name      address_validation_reports_the_first_failure_041
     * @tc.desc      Verify address validation reports the first failure.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_reports_the_first_failure_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_reports_the_first_failure_041');
      let book: AddressBook = new AddressBook();
      let addresses: Address[] = [
        createAddress(10, '   ', 'bad', 'Anhui', 'Anqing', 'Downtown', '100 Main Road'),
        createAddress(11, 'Alice', 'bad', 'Anhui', 'Anqing', 'Downtown', '100 Main Road'),
        createAddress(12, 'Alice', '18800001765', '', '', 'Downtown', '100 Main Road'),
        createAddress(13, 'Alice', '18800001765', 'Anhui', 'Anqing', 'Downtown', '   '),
        createAddress(14, 'Alice', '18800001765', 'Anhui', 'Anqing', 'Downtown', '100 Main Road')
      ];
      // Validation reports the first failing field in name, phone, city, detail order; the last address is clean.
      let expected: string[] = ['NAME_EMPTY', 'PHONE_INVALID', 'CITY_EMPTY', 'DETAIL_EMPTY', ''];
      for (let index: number = 0; index < addresses.length; index++) {
        expect(book.validate(addresses[index])).assertEqual(expected[index]);
      }
      expect(book.size()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0420
     * @tc.name      merge_cannot_exceed_the_quantity_ceiling_042
     * @tc.desc      Verify merge cannot exceed the quantity ceiling.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_cannot_exceed_the_quantity_ceiling_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_cannot_exceed_the_quantity_ceiling_042');
      let first: Cart = cartWith([cartLine(0, 1000, 99, true)]);
      let second: Cart = cartWith([cartLine(0, 1000, 99, true)]);
      first.merge(second);
      expect(first.distinctCount()).assertEqual(1);
      expect(first.quantityOf(0)).assertEqual(99);
      expect(first.totalQuantity()).assertEqual(99);
      expect(first.subtotal().cents()).assertEqual(99000);
      expect(second.quantityOf(0)).assertEqual(99);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0430
     * @tc.name      cancellation_preserves_the_order_lines_043
     * @tc.desc      Verify cancellation preserves the order lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cancellation_preserves_the_order_lines_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cancellation_preserves_the_order_lines_043');
      let order: Order = new Order(709, [
        cartLine(0, 1000, 2, true),
        cartLine(1, 2000, 1, true)
      ], OrderState.OBLIGATION, 10);
      let center: OrderCenter = new OrderCenter([order]);
      expect(order.cancel()).assertTrue();
      expect(order.lines.length).assertEqual(2);
      expect(order.quantity()).assertEqual(3);
      expect(order.total().cents()).assertEqual(4000);
      expect(order.isFinal()).assertTrue();
      expect(center.spent().cents()).assertEqual(0);
      expect(center.byState(OrderState.CANCELLED).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0440
     * @tc.name      suggest_rejects_non_positive_limits_044
     * @tc.desc      Verify suggest rejects non positive limits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_rejects_non_positive_limits_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_rejects_non_positive_limits_044');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      expect(engine.suggest('phone', 0).length).assertEqual(0);
      expect(engine.suggest('phone', -5).length).assertEqual(0);
      expect(engine.suggest('', 5).length).assertEqual(0);
      expect(engine.suggest('phone', 5).length > 0).assertTrue();
      // The default catalog holds only two distinct phone titles, so a limit of 5 still comes back with 2.
      expect(engine.suggest('phone', 5).length).assertEqual(2);
      expect(catalog.count()).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SECURITY_VALIDATION_0450
     * @tc.name      address_validation_reports_the_first_blank_field_045
     * @tc.desc      Verify address validation reports the first blank field.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_reports_the_first_blank_field_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_reports_the_first_blank_field_045');
      let book: AddressBook = new AddressBook();
      let names: string[] = ['   ', 'Bob'];
      let details: string[] = ['100 Main Road', '   '];
      let codes: string[] = ['NAME_EMPTY', 'DETAIL_EMPTY'];
      expect(names.length).assertEqual(codes.length);
      for (let index: number = 0; index < names.length; index++) {
        let address: Address = createAddress(index + 1, names[index], '18800001765',
          'Anhui', 'Anqing', 'Downtown', details[index]);
        expect(book.validate(address)).assertEqual(codes[index]);
      }
      let valid: Address = createAddress(9, 'Alice', '18800001765', 'Anhui', 'Anqing',
        'Downtown', '100 Main Road');
      expect(book.validate(valid)).assertEqual('');
    });

  });
}
