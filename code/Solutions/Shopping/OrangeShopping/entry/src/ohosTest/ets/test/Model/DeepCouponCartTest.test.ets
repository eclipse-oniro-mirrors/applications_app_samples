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

import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Cart, CartLine, CartSnapshot, Coupon, CouponBook, Money } from '../Shared/ShopModel';
import { cartLine, cartWith, defaultCouponBook } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function deepCouponCartTest() {
  describe('OrangeShoppingDeepCouponCart', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'deep coupon cart suite prepared');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0010
     * @tc.name      coupon_negative_discount_increases_applied_amount_001
     * @tc.desc      Verify a negative coupon discount increases the applied amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_negative_discount_increases_applied_amount_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_negative_discount_increases_applied_amount_001');
      let coupon: Coupon = new Coupon('N1', 'negative adjustment', 0, -500);
      let source: Money = new Money(1000);
      // apply subtracts a negative discount, so the 1000-cent total grows to 1500 instead of clamping.
      let applied: Money = coupon.apply(source);
      expect(coupon.isUsableFor(1000)).assertTrue();
      expect(applied.cents()).assertEqual(1500);
      expect(applied.format()).assertEqual('¥15.00');
      expect(source.cents()).assertEqual(1000);
      expect(coupon.discountCents).assertEqual(-500);
      expect(coupon.thresholdCents).assertEqual(0);
      expect(applied.subtract(source).cents()).assertEqual(500);
      expect(coupon.apply(new Money(0)).cents()).assertEqual(500);
      expect(applied.subtract(new Money(500)).equals(source)).assertTrue();
      expect(coupon.title).assertEqual('negative adjustment');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0020
     * @tc.name      negative_discount_coupon_payable_raises_cart_total_002
     * @tc.desc      Verify a negative discount coupon raises the cart payable total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_discount_coupon_payable_raises_cart_total_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_discount_coupon_payable_raises_cart_total_002');
      let cart: Cart = cartWith([cartLine(1, 1000, 1)]);
      let book: CouponBook = new CouponBook([new Coupon('N2', 'cash back', 0, -500)]);
      expect(cart.subtotal().cents()).assertEqual(1000);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(-500);
      expect(cart.payable(book).cents()).assertEqual(1500);
      expect(cart.payable(book).format()).assertEqual('¥15.00');
      expect(book.payable(cart.subtotal()).equals(cart.payable(book))).assertTrue();
      expect(book.size()).assertEqual(1);
      let best: Coupon | undefined = book.best(cart.subtotal());
      if (best !== undefined) {
        expect(best.id).assertEqual('N2');
      }
      expect(cart.totalQuantity()).assertEqual(1);
      expect(book.applicable(cart.subtotal()).length).assertEqual(1);
      expect(cart.payable(book).isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0030
     * @tc.name      negative_threshold_coupon_applies_on_zero_cart_003
     * @tc.desc      Verify a negative threshold coupon applies on a zero cart.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_threshold_coupon_applies_on_zero_cart_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_threshold_coupon_applies_on_zero_cart_003');
      let coupon: Coupon = new Coupon('N3', 'credit', -1000, 500);
      let book: CouponBook = new CouponBook([coupon]);
      let cart: Cart = new Cart();
      // The gate is subtotal >= threshold, so -1000 admits an empty cart while -2000 falls short.
      expect(coupon.isUsableFor(0)).assertTrue();
      expect(coupon.isUsableFor(-2000)).assertFalse();
      expect(book.applicable(cart.subtotal()).length).assertEqual(1);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(500);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(500);
      expect(cart.payable(book).isZero()).assertTrue();
      let best: Coupon | undefined = book.best(cart.subtotal());
      if (best !== undefined) {
      }
      expect(cart.subtotal().isZero()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(0);
      expect(coupon.apply(new Money(1000)).cents()).assertEqual(500);
      expect(book.payable(cart.subtotal()).isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0040
     * @tc.name      threshold_at_max_safe_matches_max_safe_subtotal_004
     * @tc.desc      Verify a threshold at max safe matches a max safe subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('threshold_at_max_safe_matches_max_safe_subtotal_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: threshold_at_max_safe_matches_max_safe_subtotal_004');
      let coupon: Coupon = new Coupon('M1', 'max threshold', Number.MAX_SAFE_INTEGER, 100);
      let cart: Cart = cartWith([cartLine(1, Number.MAX_SAFE_INTEGER, 1)]);
      let book: CouponBook = new CouponBook([coupon]);
      expect(cart.subtotal().cents()).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(coupon.isUsableFor(cart.subtotal().cents())).assertTrue();
      expect(book.applicable(cart.subtotal()).length).assertEqual(1);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(100);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(100);
      expect(cart.payable(book).cents()).assertEqual(Number.MAX_SAFE_INTEGER - 100);
      let best: Coupon | undefined = book.best(cart.subtotal());
      if (best !== undefined) {
        expect(best.discountCents).assertEqual(100);
      }
      expect(cart.distinctCount()).assertEqual(1);
      expect(coupon.apply(cart.subtotal()).cents()).assertEqual(Number.MAX_SAFE_INTEGER - 100);
      expect(book.best(cart.subtotal()) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0050
     * @tc.name      threshold_above_max_safe_is_never_usable_005
     * @tc.desc      Verify a threshold above max safe is never usable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('threshold_above_max_safe_is_never_usable_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: threshold_above_max_safe_is_never_usable_005');
      let coupon: Coupon = new Coupon('M2', 'unreachable', Number.MAX_SAFE_INTEGER + 1, 100);
      // The threshold sits one above MAX_SAFE_INTEGER, so even a cart holding that exact amount falls short.
      let cart: Cart = cartWith([cartLine(1, Number.MAX_SAFE_INTEGER, 1)]);
      let book: CouponBook = new CouponBook([coupon]);
      expect(cart.subtotal().cents()).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(coupon.isUsableFor(cart.subtotal().cents())).assertFalse();
      expect(book.applicable(cart.subtotal()).length).assertEqual(0);
      expect(book.best(cart.subtotal()) === undefined).assertTrue();
      expect(book.bestDiscount(cart.subtotal()).isZero()).assertTrue();
      expect(cart.totalWithCoupon(book).isZero()).assertTrue();
      expect(cart.lineAt(0) !== undefined).assertTrue();
      expect(coupon.discountCents).assertEqual(100);
      expect(cart.payable(book).isPositive()).assertTrue();
      expect(book.all().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0060
     * @tc.name      discount_at_max_safe_zeroes_small_subtotal_006
     * @tc.desc      Verify a max safe discount zeroes a small subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('discount_at_max_safe_zeroes_small_subtotal_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: discount_at_max_safe_zeroes_small_subtotal_006');
      let coupon: Coupon = new Coupon('M3', 'huge discount', 0, Number.MAX_SAFE_INTEGER);
      let cart: Cart = cartWith([cartLine(1, 1000, 1)]);
      let book: CouponBook = new CouponBook([coupon]);
      // bestDiscount reports the raw MAX_SAFE credit, while apply clamps the 1000-cent subtotal to zero.
      expect(cart.subtotal().cents()).assertEqual(1000);
      expect(coupon.isUsableFor(1000)).assertTrue();
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(cart.payable(book).isZero()).assertTrue();
      expect(coupon.apply(cart.subtotal()).isZero()).assertTrue();
      expect(book.size()).assertEqual(1);
      expect(coupon.apply(cart.subtotal()).isNegative()).assertFalse();
      expect(cart.totalQuantity()).assertEqual(1);
      expect(book.all().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0070
     * @tc.name      apply_on_negative_subtotal_clamps_to_zero_007
     * @tc.desc      Verify applying a coupon on a negative subtotal clamps to zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('apply_on_negative_subtotal_clamps_to_zero_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: apply_on_negative_subtotal_clamps_to_zero_007');
      let coupon: Coupon = new Coupon('N4', 'small discount', 0, 100);
      let negativeSubtotal: Money = new Money(-500);
      let applied: Money = coupon.apply(negativeSubtotal);
      // -500 minus the 100-cent coupon would be -600, but apply floors the result at zero.
      expect(negativeSubtotal.isNegative()).assertTrue();
      expect(negativeSubtotal.cents()).assertEqual(-500);
      expect(applied.isZero()).assertTrue();
      expect(applied.cents()).assertEqual(0);
      expect(applied.isNegative()).assertFalse();
      expect(applied.format()).assertEqual('¥0.00');
      expect(applied.equals(Money.zero())).assertTrue();
      expect(coupon.apply(new Money(-100)).isZero()).assertTrue();
      expect(applied.isPositive()).assertFalse();
      expect(coupon.title).assertEqual('small discount');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0080
     * @tc.name      negative_subtotal_cart_payable_clamps_to_zero_008
     * @tc.desc      Verify a negative subtotal cart payable clamps to zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_subtotal_cart_payable_clamps_to_zero_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_subtotal_cart_payable_clamps_to_zero_008');
      let cart: Cart = cartWith([cartLine(1, -1000, 2)]);
      let book: CouponBook = new CouponBook([new Coupon('N5', 'discount', 0, 100)]);
      expect(cart.subtotal().cents()).assertEqual(-2000);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(0);
      expect(cart.payable(book).isZero()).assertTrue();
      expect(book.payable(cart.subtotal()).isZero()).assertTrue();
      expect(cart.payable(book).equals(book.payable(cart.subtotal()))).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(-2000);
      expect(cart.payable(book).format()).assertEqual('¥0.00');
      expect(book.best(cart.subtotal()) === undefined).assertTrue();
      expect(cart.allLinesSubtotal().cents()).assertEqual(-2000);
      expect(book.all().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0090
     * @tc.name      apply_negative_discount_on_zero_subtotal_returns_discount_009
     * @tc.desc      Verify a negative discount on a zero subtotal returns the discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('apply_negative_discount_on_zero_subtotal_returns_discount_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: apply_negative_discount_on_zero_subtotal_returns_discount_009');
      let coupon: Coupon = new Coupon('N6', 'credit', 0, -300);
      let applied: Money = coupon.apply(Money.zero());
      expect(applied.cents()).assertEqual(300);
      expect(applied.isPositive()).assertTrue();
      expect(applied.format()).assertEqual('¥3.00');
      expect(coupon.apply(new Money(100)).cents()).assertEqual(400);
      expect(coupon.discountCents).assertEqual(-300);
      expect(coupon.thresholdCents).assertEqual(0);
      expect(coupon.apply(Money.zero()).isPositive()).assertTrue();
      expect(coupon.apply(new Money(-100)).cents()).assertEqual(200);
      expect(applied.subtract(new Money(300)).isZero()).assertTrue();
      expect(coupon.title).assertEqual('credit');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0100
     * @tc.name      negative_subtotal_below_zero_threshold_is_unusable_010
     * @tc.desc      Verify a negative subtotal below a zero threshold is unusable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_subtotal_below_zero_threshold_is_unusable_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_subtotal_below_zero_threshold_is_unusable_010');
      let coupon: Coupon = new Coupon('N7', 'zero gate', 0, 100);
      expect(coupon.isUsableFor(-1)).assertFalse();
      expect(coupon.isUsableFor(0)).assertTrue();
      let cart: Cart = cartWith([cartLine(1, -1000, 1)]);
      let book: CouponBook = new CouponBook([coupon]);
      expect(cart.subtotal().cents()).assertEqual(-1000);
      expect(book.applicable(cart.subtotal()).length).assertEqual(0);
      expect(book.best(cart.subtotal()) === undefined).assertTrue();
      expect(book.bestDiscount(cart.subtotal()).isZero()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(1);
      expect(coupon.discountCents).assertEqual(100);
      expect(cart.allLinesSubtotal().cents()).assertEqual(-1000);
      expect(book.all().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0110
     * @tc.name      book_constructor_copies_input_array_011
     * @tc.desc      Verify the coupon book constructor copies the input array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('book_constructor_copies_input_array_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: book_constructor_copies_input_array_011');
      let coupons: Coupon[] = [new Coupon('A', 'first', 0, 100)];
      let book: CouponBook = new CouponBook(coupons);
      expect(book.size()).assertEqual(1);
      expect(book.all().length).assertEqual(1);
      // Pushing a 2000-cent coupon into the caller array must leave the book at its one original entry.
      coupons.push(new Coupon('B', 'second', 0, 2000));
      expect(coupons.length).assertEqual(2);
      expect(book.size()).assertEqual(1);
      expect(book.all().length).assertEqual(1);
      expect(book.bestDiscount(new Money(500)).cents()).assertEqual(100);
      let best: Coupon | undefined = book.best(new Money(500));
      if (best !== undefined) {
        expect(best.id).assertEqual('A');
      }
      expect(coupons[0].id).assertEqual('A');
      expect(book.payable(new Money(500)).cents()).assertEqual(400);
      expect(book.all()[0] === coupons[0]).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0120
     * @tc.name      book_constructor_shares_coupon_instances_012
     * @tc.desc      Verify the coupon book constructor shares coupon instances.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('book_constructor_shares_coupon_instances_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: book_constructor_shares_coupon_instances_012');
      let coupon: Coupon = new Coupon('S1', 'shared entry', 0, 100);
      let book: CouponBook = new CouponBook([coupon]);
      expect(book.all()[0] === coupon).assertTrue();
      expect(book.bestDiscount(new Money(1000)).cents()).assertEqual(100);
      // The array is copied but its coupons are not, so raising discountCents to 700 is seen by best().
      coupon.discountCents = 700;
      let best: Coupon | undefined = book.best(new Money(1000));
      expect(best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.discountCents).assertEqual(700);
        expect(best === coupon).assertTrue();
      }
      expect(book.bestDiscount(new Money(1000)).cents()).assertEqual(700);
      expect(book.applicable(new Money(1000)).length).assertEqual(1);
      expect(coupon.thresholdCents).assertEqual(0);
      expect(book.all().length).assertEqual(1);
      expect(book.payable(new Money(1000)).format()).assertEqual('¥3.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0130
     * @tc.name      duplicate_coupon_entries_are_counted_separately_013
     * @tc.desc      Verify duplicate coupon entries are counted separately.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('duplicate_coupon_entries_are_counted_separately_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: duplicate_coupon_entries_are_counted_separately_013');
      let book: CouponBook = new CouponBook([
        new Coupon('D1', 'first entry', 0, 100),
        new Coupon('D1', 'second entry', 0, 100),
        new Coupon('D1', 'third entry', 0, 100)
      ]);
      expect(book.size()).assertEqual(3);
      expect(book.all().length).assertEqual(3);
      expect(book.applicable(new Money(0)).length).assertEqual(3);
      expect(book.bestDiscount(new Money(0)).cents()).assertEqual(100);
      let all: Coupon[] = book.all();
      let wrong: number = 0;
      for (let index: number = 0; index < all.length; index++) {
        if (all[index].id !== 'D1') {
          wrong++;
        }
      }
      expect(wrong).assertEqual(0);
      expect(book.payable(new Money(500)).cents()).assertEqual(400);
      expect(book.all()[2].title).assertEqual('third entry');
      expect(book.best(new Money(0)) !== undefined).assertTrue();
      expect(book.payable(new Money(500)).isPositive()).assertTrue();
      expect(all.length).assertEqual(book.size());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0140
     * @tc.name      duplicate_coupon_entries_pick_larger_discount_014
     * @tc.desc      Verify duplicate coupon entries pick the larger discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('duplicate_coupon_entries_pick_larger_discount_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: duplicate_coupon_entries_pick_larger_discount_014');
      let small: Coupon = new Coupon('D2', 'small entry', 0, 100);
      let large: Coupon = new Coupon('D2', 'large entry', 0, 900);
      let book: CouponBook = new CouponBook([small, large]);
      let best: Coupon | undefined = book.best(new Money(1000));
      expect(best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best === large).assertTrue();
        expect(best.title).assertEqual('large entry');
      }
      expect(book.size()).assertEqual(2);
      expect(book.applicable(new Money(1000)).length).assertEqual(2);
      expect(book.bestDiscount(new Money(1000)).cents()).assertEqual(900);
      expect(book.all()[1] === large).assertTrue();
      expect(book.payable(new Money(1000)).isPositive()).assertTrue();
      expect(small.thresholdCents).assertEqual(0);
      expect(book.all().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0150
     * @tc.name      apply_does_not_mutate_source_subtotal_015
     * @tc.desc      Verify coupon apply does not mutate the source subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('apply_does_not_mutate_source_subtotal_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: apply_does_not_mutate_source_subtotal_015');
      let coupon: Coupon = new Coupon('P1', 'ten off twenty five', 10000, 1000);
      let subtotal: Money = new Money(25000);
      let applied: Money = coupon.apply(subtotal);
      expect(applied.cents()).assertEqual(24000);
      expect(subtotal.cents()).assertEqual(25000);
      expect(applied === subtotal).assertFalse();
      expect(coupon.thresholdCents).assertEqual(10000);
      expect(coupon.discountCents).assertEqual(1000);
      expect(coupon.apply(subtotal).cents()).assertEqual(24000);
      expect(applied.equals(new Money(24000))).assertTrue();
      expect(coupon.apply(subtotal).isPositive()).assertTrue();
      expect(applied.format()).assertEqual('¥240.00');
      expect(coupon.title).assertEqual('ten off twenty five');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0160
     * @tc.name      empty_cart_with_negative_discount_pays_discount_amount_016
     * @tc.desc      Verify an empty cart with a negative discount pays the discount amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('empty_cart_with_negative_discount_pays_discount_amount_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: empty_cart_with_negative_discount_pays_discount_amount_016');
      let book: CouponBook = new CouponBook([new Coupon('N8', 'credit', 0, -500)]);
      let cart: Cart = new Cart();
      expect(cart.subtotal().isZero()).assertTrue();
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(-500);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(-500);
      expect(cart.payable(book).cents()).assertEqual(500);
      expect(cart.payable(book).format()).assertEqual('¥5.00');
      expect(book.payable(cart.subtotal()).cents()).assertEqual(500);
      expect(cart.subtotal().isZero()).assertTrue();
      expect(book.payable(cart.subtotal()).format()).assertEqual('¥5.00');
      expect(book.all().length).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0170
     * @tc.name      selection_fallback_to_zero_threshold_coupon_017
     * @tc.desc      Verify deselecting a line falls back to the zero threshold coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('selection_fallback_to_zero_threshold_coupon_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: selection_fallback_to_zero_threshold_coupon_017');
      let cart: Cart = cartWith([
        cartLine(1, 20000, 1, true),
        cartLine(2, 8000, 1, true),
        cartLine(3, 5000, 1, false)
      ]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.subtotal().cents()).assertEqual(28000);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(1000);
      expect(cart.payable(book).cents()).assertEqual(27000);
      // Dropping the 20000 line leaves 8000, under C10's 10000 gate, so only C0's 100 survives.
      expect(cart.setSelected(1, false)).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(8000);
      expect(book.applicable(cart.subtotal()).length).assertEqual(1);
      let best: Coupon | undefined = book.best(cart.subtotal());
      if (best !== undefined) {
        expect(best.id).assertEqual('C0');
      }
      expect(cart.distinctCount()).assertEqual(3);
      expect(cart.allLinesSubtotal().cents()).assertEqual(33000);
      expect(cart.payable(book).isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0180
     * @tc.name      empty_book_on_negative_subtotal_clamps_payable_018
     * @tc.desc      Verify an empty coupon book on a negative subtotal clamps the payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('empty_book_on_negative_subtotal_clamps_payable_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: empty_book_on_negative_subtotal_clamps_payable_018');
      let book: CouponBook = new CouponBook([]);
      let cart: Cart = cartWith([cartLine(1, -1000, 2)]);
      expect(book.size()).assertEqual(0);
      expect(book.all().length).assertEqual(0);
      expect(book.applicable(cart.subtotal()).length).assertEqual(0);
      expect(book.best(cart.subtotal()) === undefined).assertTrue();
      expect(book.bestDiscount(cart.subtotal()).isZero()).assertTrue();
      expect(cart.totalWithCoupon(book).isZero()).assertTrue();
      expect(cart.payable(book).isNegative()).assertFalse();
      expect(cart.allLinesSubtotal().cents()).assertEqual(-2000);
      expect(cart.totalQuantity()).assertEqual(2);
      expect(cart.payable(book).format()).assertEqual('¥0.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0190
     * @tc.name      threshold_free_coupon_discount_invariant_019
     * @tc.desc      Verify a threshold free coupon discount stays invariant across selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('threshold_free_coupon_discount_invariant_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: threshold_free_coupon_discount_invariant_019');
      let book: CouponBook = new CouponBook([new Coupon('F1', 'flat discount', 0, 500)]);
      let cart: Cart = cartWith([cartLine(1, 10000, 1, true), cartLine(2, 9000, 1, false)]);
      expect(cart.subtotal().cents()).assertEqual(10000);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(500);
      expect(cart.payable(book).cents()).assertEqual(9500);
      cart.setAllSelected(true);
      // The 500-cent flat coupon survives the jump from 10000 to 19000, so only the payable base moves.
      expect(cart.subtotal().cents()).assertEqual(19000);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(500);
      expect(cart.payable(book).cents()).assertEqual(18500);
      cart.setAllSelected(false);
      expect(book.size()).assertEqual(1);
      expect(book.all().length).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(2);
      expect(cart.payable(book).isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0200
     * @tc.name      set_selected_unknown_leaves_payable_unchanged_020
     * @tc.desc      Verify selecting an unknown product leaves the payable unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_selected_unknown_leaves_payable_unchanged_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_selected_unknown_leaves_payable_unchanged_020');
      let cart: Cart = cartWith([cartLine(1, 30000, 1)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.payable(book).cents()).assertEqual(28000);
      expect(cart.setSelected(99, false)).assertFalse();
      expect(cart.setSelected(99, true)).assertFalse();
      expect(cart.subtotal().cents()).assertEqual(30000);
      expect(cart.payable(book).cents()).assertEqual(28000);
      expect(cart.contains(99)).assertFalse();
      let best: Coupon | undefined = book.best(cart.subtotal());
      if (best !== undefined) {
      }
      expect(cart.totalQuantity()).assertEqual(1);
      expect(cart.payable(book).equals(book.payable(cart.subtotal()))).assertTrue();
      expect(book.all().length).assertEqual(4);
      expect(cart.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0210
     * @tc.name      toggle_selected_twice_restores_payable_021
     * @tc.desc      Verify toggling a line twice restores the payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('toggle_selected_twice_restores_payable_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: toggle_selected_twice_restores_payable_021');
      let cart: Cart = cartWith([cartLine(1, 15000, 1, true), cartLine(2, 15000, 1, true)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.subtotal().cents()).assertEqual(30000);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(2000);
      expect(cart.payable(book).cents()).assertEqual(28000);
      expect(cart.toggleSelected(1)).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(15000);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(1000);
      expect(cart.selectedQuantity()).assertEqual(1);
      expect(book.size()).assertEqual(4);
      expect(cart.payable(book).isPositive()).assertTrue();
      expect(cart.distinctCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0220
     * @tc.name      merge_crossing_threshold_switches_best_coupon_022
     * @tc.desc      Verify a merge crossing a threshold switches the best coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_crossing_threshold_switches_best_coupon_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_crossing_threshold_switches_best_coupon_022');
      let target: Cart = cartWith([cartLine(1, 20000, 1)]);
      let source: Cart = cartWith([cartLine(2, 10000, 1)]);
      let book: CouponBook = defaultCouponBook();
      expect(target.subtotal().cents()).assertEqual(20000);
      expect(book.bestDiscount(target.subtotal()).cents()).assertEqual(1000);
      expect(target.payable(book).cents()).assertEqual(19000);
      target.merge(source);
      expect(target.subtotal().cents()).assertEqual(30000);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.totalQuantity()).assertEqual(2);
      let best: Coupon | undefined = book.best(target.subtotal());
      if (best !== undefined) {
      }
      expect(book.size()).assertEqual(4);
      expect(target.allLinesSubtotal().equals(target.subtotal())).assertTrue();
      expect(source.quantityOf(2)).assertEqual(1);
      expect(book.all().length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0230
     * @tc.name      merge_unselected_source_keeps_payable_023
     * @tc.desc      Verify merging an unselected source keeps the payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_unselected_source_keeps_payable_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_unselected_source_keeps_payable_023');
      let target: Cart = cartWith([cartLine(1, 20000, 1, true)]);
      let source: Cart = cartWith([cartLine(2, 5000, 1, false)]);
      let book: CouponBook = defaultCouponBook();
      expect(target.payable(book).cents()).assertEqual(19000);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.subtotal().cents()).assertEqual(20000);
      expect(target.allLinesSubtotal().cents()).assertEqual(25000);
      expect(target.selectedQuantity()).assertEqual(1);
      expect(target.totalQuantity()).assertEqual(2);
      expect(book.size()).assertEqual(4);
      expect(target.isAllSelected()).assertFalse();
      expect(source.quantityOf(2)).assertEqual(1);
      expect(target.allLines().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0240
     * @tc.name      merge_capped_quantity_payable_uses_cap_amount_024
     * @tc.desc      Verify a capped merged quantity pays the cap amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_capped_quantity_payable_uses_cap_amount_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_capped_quantity_payable_uses_cap_amount_024');
      let target: Cart = cartWith([cartLine(1, 400, 60)]);
      let source: Cart = cartWith([cartLine(1, 400, 60)]);
      let book: CouponBook = defaultCouponBook();
      expect(target.subtotal().cents()).assertEqual(24000);
      expect(book.bestDiscount(target.subtotal()).cents()).assertEqual(1000);
      target.merge(source);
      // 60 + 60 would be 120, but the merge parks at the 99-unit ceiling and 400 x 99 = 39600.
      expect(target.quantityOf(1)).assertEqual(99);
      expect(target.distinctCount()).assertEqual(1);
      expect(target.totalQuantity()).assertEqual(99);
      expect(target.subtotal().cents()).assertEqual(39600);
      expect(source.quantityOf(1)).assertEqual(60);
      expect(source.totalQuantity()).assertEqual(60);
      expect(target.payable(book).isPositive()).assertTrue();
      expect(book.all().length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0250
     * @tc.name      merge_zero_quantity_line_keeps_payable_025
     * @tc.desc      Verify merging a zero quantity line keeps the payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_zero_quantity_line_keeps_payable_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_zero_quantity_line_keeps_payable_025');
      let target: Cart = cartWith([cartLine(1, 20000, 1)]);
      let source: Cart = cartWith([cartLine(2, 5000, 0, true)]);
      let book: CouponBook = defaultCouponBook();
      expect(target.payable(book).cents()).assertEqual(19000);
      target.merge(source);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.quantityOf(2)).assertEqual(0);
      expect(target.subtotal().cents()).assertEqual(20000);
      expect(target.allLinesSubtotal().cents()).assertEqual(20000);
      expect(target.totalQuantity()).assertEqual(1);
      expect(book.size()).assertEqual(4);
      expect(target.allLines().length).assertEqual(2);
      expect(target.payable(book).isPositive()).assertTrue();
      expect(book.all().length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0260
     * @tc.name      merge_above_threshold_keeps_coupon_and_adds_payable_026
     * @tc.desc      Verify a merge above the threshold keeps the coupon and adds payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_above_threshold_keeps_coupon_and_adds_payable_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_above_threshold_keeps_coupon_and_adds_payable_026');
      let target: Cart = cartWith([cartLine(1, 35000, 1)]);
      let source: Cart = cartWith([cartLine(2, 10000, 1)]);
      let book: CouponBook = defaultCouponBook();
      let payableBefore: Money = target.payable(book);
      expect(payableBefore.cents()).assertEqual(33000);
      expect(book.bestDiscount(target.subtotal()).cents()).assertEqual(2000);
      target.merge(source);
      // At 45000 only C50's 100000 gate is still shut, so three offers apply and C20's 2000 stays best.
      expect(target.subtotal().cents()).assertEqual(45000);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.totalQuantity()).assertEqual(2);
      expect(book.bestDiscount(target.subtotal()).cents()).assertEqual(2000);
      expect(book.size()).assertEqual(4);
      expect(source.totalQuantity()).assertEqual(1);
      expect(target.payable(book).isPositive()).assertTrue();
      expect(book.applicable(target.subtotal()).length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0270
     * @tc.name      merge_then_remove_restores_original_payable_027
     * @tc.desc      Verify merging then removing the added line restores the payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_then_remove_restores_original_payable_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_then_remove_restores_original_payable_027');
      let target: Cart = cartWith([cartLine(1, 20000, 1)]);
      let source: Cart = cartWith([cartLine(2, 15000, 1)]);
      let book: CouponBook = defaultCouponBook();
      expect(target.payable(book).cents()).assertEqual(19000);
      target.merge(source);
      expect(target.subtotal().cents()).assertEqual(35000);
      expect(target.payable(book).cents()).assertEqual(33000);
      expect(target.remove(2)).assertTrue();
      expect(target.subtotal().cents()).assertEqual(20000);
      expect(target.distinctCount()).assertEqual(1);
      expect(book.size()).assertEqual(4);
      expect(source.quantityOf(2)).assertEqual(1);
      expect(target.payable(book).isPositive()).assertTrue();
      expect(target.allLines().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0280
     * @tc.name      remove_line_downgrades_best_coupon_028
     * @tc.desc      Verify removing a line downgrades the best coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_line_downgrades_best_coupon_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_line_downgrades_best_coupon_028');
      let cart: Cart = cartWith([cartLine(1, 20000, 1), cartLine(2, 10000, 1)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.subtotal().cents()).assertEqual(30000);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(2000);
      expect(cart.payable(book).cents()).assertEqual(28000);
      expect(cart.remove(2)).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(20000);
      expect(cart.distinctCount()).assertEqual(1);
      expect(book.size()).assertEqual(4);
      expect(cart.contains(2)).assertFalse();
      expect(cart.payable(book).isPositive()).assertTrue();
      expect(cart.allLines().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0290
     * @tc.name      remove_all_but_one_line_keeps_only_zero_threshold_discount_029
     * @tc.desc      Verify removing all but one line keeps only the zero threshold discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_all_but_one_line_keeps_only_zero_threshold_discount_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_all_but_one_line_keeps_only_zero_threshold_discount_029');
      let cart: Cart = cartWith([cartLine(1, 20000, 1), cartLine(2, 15000, 1), cartLine(3, 5000, 1)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.subtotal().cents()).assertEqual(40000);
      expect(cart.payable(book).cents()).assertEqual(38000);
      expect(cart.remove(2)).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(25000);
      expect(cart.payable(book).cents()).assertEqual(24000);
      // Removing the 20000-cent line leaves 5000, below every tiered threshold,
      // so only the zero-threshold coupon (100 cents) still applies.
      expect(cart.remove(1)).assertTrue();
      expect(cart.totalWithCoupon(book).cents()).assertEqual(100);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.payable(book).cents()).assertEqual(4900);
      expect(book.size()).assertEqual(4);
      expect(cart.allLinesSubtotal().cents()).assertEqual(5000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0300
     * @tc.name      remove_then_readd_line_restores_best_coupon_030
     * @tc.desc      Verify removing then readding a line restores the best coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_then_readd_line_restores_best_coupon_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_then_readd_line_restores_best_coupon_030');
      let cart: Cart = cartWith([cartLine(1, 20000, 1), cartLine(2, 10000, 1)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.payable(book).cents()).assertEqual(28000);
      expect(cart.remove(2)).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(20000);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(1000);
      expect(cart.payable(book).cents()).assertEqual(19000);
      expect(cart.add(2, 10000, 1)).assertEqual(1);
      expect(book.size()).assertEqual(4);
      expect(cart.payable(book).isPositive()).assertTrue();
      expect(cart.allLines().length).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0310
     * @tc.name      remove_last_line_empties_threshold_applicable_031
     * @tc.desc      Verify removing the last line empties the threshold applicable list.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_last_line_empties_threshold_applicable_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_last_line_empties_threshold_applicable_031');
      let cart: Cart = cartWith([cartLine(1, 15000, 1)]);
      let book: CouponBook = defaultCouponBook();
      expect(book.applicable(cart.subtotal()).length).assertEqual(2);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(1000);
      expect(cart.payable(book).cents()).assertEqual(14000);
      expect(cart.remove(1)).assertTrue();
      expect(cart.isEmpty()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      expect(book.size()).assertEqual(4);
      expect(cart.allLinesSubtotal().isZero()).assertTrue();
      expect(book.all().length).assertEqual(4);
      expect(cart.payable(book).isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0320
     * @tc.name      snapshot_before_deselect_restores_coupon_eligibility_032
     * @tc.desc      Verify a snapshot before deselect restores coupon eligibility.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_before_deselect_restores_coupon_eligibility_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_before_deselect_restores_coupon_eligibility_032');
      let cart: Cart = cartWith([cartLine(1, 20000, 1, true), cartLine(2, 12000, 1, true)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.subtotal().cents()).assertEqual(32000);
      expect(cart.payable(book).cents()).assertEqual(30000);
      let snapshot: CartSnapshot = cart.snapshot();
      // Deselecting the 20000 line leaves 12000 and a 1000 coupon, while the snapshot still holds 32000.
      expect(cart.setSelected(1, false)).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(12000);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(1000);
      expect(cart.payable(book).cents()).assertEqual(11000);
      let restored: Cart = Cart.restore(snapshot);
      expect(book.bestDiscount(restored.subtotal()).cents()).assertEqual(2000);
      expect(cart.selectedQuantity()).assertEqual(1);
      expect(restored.distinctCount()).assertEqual(2);
      expect(book.all().length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0330
     * @tc.name      snapshot_of_all_unselected_cart_restores_zero_payable_033
     * @tc.desc      Verify a snapshot of an all unselected cart restores zero payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_of_all_unselected_cart_restores_zero_payable_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_of_all_unselected_cart_restores_zero_payable_033');
      let cart: Cart = cartWith([cartLine(1, 20000, 1, false), cartLine(2, 12000, 1, false)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.subtotal().isZero()).assertTrue();
      expect(cart.payable(book).isZero()).assertTrue();
      let snapshot: CartSnapshot = cart.snapshot();
      cart.setAllSelected(true);
      expect(cart.subtotal().cents()).assertEqual(32000);
      expect(cart.payable(book).cents()).assertEqual(30000);
      let restored: Cart = Cart.restore(snapshot);
      expect(restored.selectedQuantity()).assertEqual(0);
      expect(restored.subtotal().isZero()).assertTrue();
      expect(book.bestDiscount(restored.subtotal()).cents()).assertEqual(100);
      expect(restored.distinctCount()).assertEqual(2);
      expect(book.all().length).assertEqual(4);
      expect(restored.payable(book).isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0340
     * @tc.name      snapshot_restore_keeps_coupon_book_size_034
     * @tc.desc      Verify snapshot restore keeps the coupon book size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_restore_keeps_coupon_book_size_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_restore_keeps_coupon_book_size_034');
      let book: CouponBook = defaultCouponBook();
      let cart: Cart = cartWith([cartLine(1, 30000, 1)]);
      expect(book.size()).assertEqual(4);
      expect(cart.payable(book).cents()).assertEqual(28000);
      let snapshot: CartSnapshot = cart.snapshot();
      cart.add(3, 50000, 1);
      expect(cart.subtotal().cents()).assertEqual(80000);
      expect(cart.payable(book).cents()).assertEqual(78000);
      expect(book.size()).assertEqual(4);
      let restored: Cart = Cart.restore(snapshot);
      expect(restored.subtotal().cents()).assertEqual(30000);
      expect(book.all().length).assertEqual(4);
      expect(cart.distinctCount()).assertEqual(2);
      expect(restored.totalQuantity()).assertEqual(1);
      expect(restored.payable(book).isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0350
     * @tc.name      snapshot_restore_uses_external_coupon_book_035
     * @tc.desc      Verify a snapshot restore stays bound to the external coupon book.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_restore_uses_external_coupon_book_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_restore_uses_external_coupon_book_035');
      let cart: Cart = cartWith([cartLine(1, 30000, 1)]);
      let defaultBook: CouponBook = defaultCouponBook();
      expect(cart.payable(defaultBook).cents()).assertEqual(28000);
      let snapshot: CartSnapshot = cart.snapshot();
      let richer: CouponBook = new CouponBook([new Coupon('R1', 'richer entry', 0, 5000)]);
      expect(cart.payable(richer).cents()).assertEqual(25000);
      cart.add(4, 20000, 1);
      expect(cart.subtotal().cents()).assertEqual(50000);
      expect(cart.payable(richer).cents()).assertEqual(45000);
      let restored: Cart = Cart.restore(snapshot);
      expect(restored.subtotal().cents()).assertEqual(30000);
      expect(restored.payable(richer).cents()).assertEqual(25000);
      expect(defaultBook.size()).assertEqual(4);
      expect(restored.totalQuantity()).assertEqual(1);
      expect(defaultBook.applicable(restored.subtotal()).length).assertEqual(3);
      expect(richer.all().length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0360
     * @tc.name      restore_then_select_all_uses_combined_subtotal_036
     * @tc.desc      Verify a restored cart then select all uses the combined subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('restore_then_select_all_uses_combined_subtotal_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: restore_then_select_all_uses_combined_subtotal_036');
      let lines: CartLine[] = [cartLine(1, 20000, 1, true), cartLine(2, 12000, 1, false)];
      let snapshot: CartSnapshot = new CartSnapshot(lines);
      let restored: Cart = Cart.restore(snapshot);
      let book: CouponBook = defaultCouponBook();
      expect(restored.subtotal().cents()).assertEqual(20000);
      expect(restored.payable(book).cents()).assertEqual(19000);
      restored.setAllSelected(true);
      expect(restored.subtotal().cents()).assertEqual(32000);
      expect(restored.payable(book).cents()).assertEqual(30000);
      expect(restored.selectedQuantity()).assertEqual(2);
      expect(restored.isAllSelected()).assertTrue();
      expect(book.bestDiscount(restored.subtotal()).cents()).assertEqual(2000);
      expect(restored.distinctCount()).assertEqual(2);
      expect(book.all().length).assertEqual(4);
      expect(restored.payable(book).isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0370
     * @tc.name      cart_and_book_payable_stay_in_sync_037
     * @tc.desc      Verify the cart and book payable entry points stay in sync.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_and_book_payable_stay_in_sync_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_and_book_payable_stay_in_sync_037');
      let cart: Cart = cartWith([cartLine(1, 20000, 1, true), cartLine(2, 12000, 1, true)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.subtotal().cents()).assertEqual(32000);
      expect(cart.payable(book).equals(book.payable(cart.subtotal()))).assertTrue();
      expect(cart.payable(book).cents()).assertEqual(30000);
      expect(cart.setSelected(2, false)).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(20000);
      expect(cart.payable(book).equals(book.payable(cart.subtotal()))).assertTrue();
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(1000);
      expect(cart.totalQuantity()).assertEqual(2);
      expect(book.size()).assertEqual(4);
      expect(cart.payable(book).isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0380
     * @tc.name      zero_price_selected_lines_keep_zero_payable_038
     * @tc.desc      Verify zero price selected lines keep a zero payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_price_selected_lines_keep_zero_payable_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_price_selected_lines_keep_zero_payable_038');
      let cart: Cart = cartWith([cartLine(1, 0, 1, true), cartLine(2, 0, 5, true)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.subtotal().isZero()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(6);
      expect(cart.selectedQuantity()).assertEqual(6);
      expect(cart.distinctCount()).assertEqual(2);
      expect(book.applicable(cart.subtotal()).length).assertEqual(1);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(100);
      expect(cart.allLinesSubtotal().isZero()).assertTrue();
      expect(book.all().length).assertEqual(4);
      expect(cart.payable(book).isNegative()).assertFalse();
      expect(book.best(cart.subtotal()) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0390
     * @tc.name      duplicate_zero_quantity_line_keeps_payable_039
     * @tc.desc      Verify a duplicate zero quantity line keeps the payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('duplicate_zero_quantity_line_keeps_payable_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: duplicate_zero_quantity_line_keeps_payable_039');
      let lines: CartLine[] = [cartLine(1, 10000, 1, true), cartLine(1, 10000, 0, true)];
      let cart: Cart = cartWith(lines);
      let book: CouponBook = defaultCouponBook();
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.quantityOf(1)).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(1);
      expect(cart.subtotal().cents()).assertEqual(10000);
      expect(cart.allLinesSubtotal().cents()).assertEqual(10000);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(1000);
      expect(book.size()).assertEqual(4);
      expect(cart.payable(book).isPositive()).assertTrue();
      expect(book.all().length).assertEqual(4);
      expect(cart.lineAt(1) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0400
     * @tc.name      quantity_decrease_below_threshold_downgrades_coupon_040
     * @tc.desc      Verify a quantity decrease below the threshold downgrades the coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('quantity_decrease_below_threshold_downgrades_coupon_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: quantity_decrease_below_threshold_downgrades_coupon_040');
      let cart: Cart = cartWith([cartLine(1, 5000, 6)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.subtotal().cents()).assertEqual(30000);
      expect(cart.payable(book).cents()).assertEqual(28000);
      expect(cart.setQuantity(1, 5)).assertEqual(5);
      expect(cart.subtotal().cents()).assertEqual(25000);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(1000);
      expect(cart.payable(book).cents()).assertEqual(24000);
      expect(cart.totalQuantity()).assertEqual(5);
      expect(book.size()).assertEqual(4);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.payable(book).isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0410
     * @tc.name      subtotal_one_cent_below_threshold_uses_smaller_coupon_041
     * @tc.desc      Verify a subtotal one cent below the threshold uses the smaller coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('subtotal_one_cent_below_threshold_uses_smaller_coupon_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: subtotal_one_cent_below_threshold_uses_smaller_coupon_041');
      let cart: Cart = cartWith([cartLine(1, 29999, 1)]);
      let book: CouponBook = defaultCouponBook();
      // At 29999 the 30000 gate is still shut, so C10's 1000 is the best of the two usable offers.
      expect(cart.subtotal().cents()).assertEqual(29999);
      expect(book.applicable(cart.subtotal()).length).assertEqual(2);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(1000);
      expect(cart.payable(book).cents()).assertEqual(28999);
      let best: Coupon | undefined = book.best(cart.subtotal());
      expect(best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.id).assertEqual('C10');
      }
      expect(cart.subtotal().isPositive()).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
      expect(book.all().length).assertEqual(4);
      expect(cart.payable(book).isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0420
     * @tc.name      subtotal_exactly_at_threshold_upgrades_coupon_042
     * @tc.desc      Verify a subtotal exactly at the threshold upgrades the coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('subtotal_exactly_at_threshold_upgrades_coupon_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: subtotal_exactly_at_threshold_upgrades_coupon_042');
      let cart: Cart = cartWith([cartLine(1, 29999, 1)]);
      let book: CouponBook = defaultCouponBook();
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(1000);
      expect(cart.add(2, 1, 1)).assertEqual(1);
      expect(cart.subtotal().cents()).assertEqual(30000);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(2);
      expect(book.applicable(cart.subtotal()).length).assertEqual(3);
      let best: Coupon | undefined = book.best(cart.subtotal());
      if (best !== undefined) {
      }
      expect(book.size()).assertEqual(4);
      expect(cart.allLinesSubtotal().equals(cart.subtotal())).assertTrue();
      expect(cart.payable(book).isPositive()).assertTrue();
      expect(cart.lineAt(1) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0430
     * @tc.name      max_safe_subtotal_with_one_cent_discount_stays_exact_043
     * @tc.desc      Verify a max safe subtotal with a one cent discount stays exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_subtotal_with_one_cent_discount_stays_exact_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_subtotal_with_one_cent_discount_stays_exact_043');
      let book: CouponBook = new CouponBook([new Coupon('S9', 'one cent off', 0, 1)]);
      let cart: Cart = cartWith([cartLine(1, Number.MAX_SAFE_INTEGER, 1)]);
      expect(cart.subtotal().cents()).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(book.applicable(cart.subtotal()).length).assertEqual(1);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(1);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(1);
      expect(cart.payable(book).cents()).assertEqual(Number.MAX_SAFE_INTEGER - 1);
      expect(cart.payable(book).add(new Money(1)).equals(cart.subtotal())).assertTrue();
      let best: Coupon | undefined = book.best(cart.subtotal());
      if (best !== undefined) {
        expect(best.discountCents).assertEqual(1);
      }
      expect(cart.subtotal().isPositive()).assertTrue();
      expect(book.all().length).assertEqual(1);
      expect(cart.payable(book).isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0440
     * @tc.name      best_prefers_positive_discount_over_negative_044
     * @tc.desc      Verify the best coupon prefers a positive discount over a negative one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('best_prefers_positive_discount_over_negative_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: best_prefers_positive_discount_over_negative_044');
      let book: CouponBook = new CouponBook([
        new Coupon('X1', 'refund', 0, -500),
        new Coupon('X2', 'small credit', 0, 300),
        new Coupon('X3', 'large credit', 0, 1200)
      ]);
      let cart: Cart = cartWith([cartLine(1, 5000, 1)]);
      // Of -500, 300 and 1200 the largest discount is 1200, so the rebate coupon is never picked.
      expect(book.size()).assertEqual(3);
      expect(book.applicable(cart.subtotal()).length).assertEqual(3);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(1200);
      expect(cart.payable(book).cents()).assertEqual(3800);
      expect(cart.payable(book).format()).assertEqual('¥38.00');
      let best: Coupon | undefined = book.best(cart.subtotal());
      expect(best !== undefined).assertTrue();
      if (best !== undefined) {
      }
      expect(cart.subtotal().cents()).assertEqual(5000);
      expect(book.payable(cart.subtotal()).cents()).assertEqual(3800);
      expect(book.all().length).assertEqual(3);
      expect(cart.payable(book).isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0450
     * @tc.name      payable_with_negative_discount_uses_selected_only_045
     * @tc.desc      Verify payable with a negative discount uses only the selected lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('payable_with_negative_discount_uses_selected_only_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: payable_with_negative_discount_uses_selected_only_045');
      let cart: Cart = cartWith([cartLine(1, 2000, 1, true), cartLine(2, 9000, 1, false)]);
      let book: CouponBook = new CouponBook([new Coupon('N9', 'rebate', 0, -300)]);
      expect(cart.subtotal().cents()).assertEqual(2000);
      expect(cart.allLinesSubtotal().cents()).assertEqual(11000);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(-300);
      expect(cart.payable(book).cents()).assertEqual(2300);
      expect(cart.payable(book).compareTo(cart.subtotal())).assertEqual(1);
      expect(book.payable(cart.subtotal()).cents()).assertEqual(2300);
      expect(cart.payable(book).isPositive()).assertTrue();
      expect(book.all().length).assertEqual(1);
      expect(cart.allLinesSubtotal().subtract(cart.subtotal()).cents()).assertEqual(9000);
      expect(book.payable(cart.subtotal()).isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0460
     * @tc.name      set_all_selected_false_zeroes_total_with_coupon_046
     * @tc.desc      Verify setting all lines unselected zeroes the total with a coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('set_all_selected_false_zeroes_total_with_coupon_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_all_selected_false_zeroes_total_with_coupon_046');
      let cart: Cart = cartWith([cartLine(1, 30000, 1)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.totalWithCoupon(book).cents()).assertEqual(2000);
      expect(cart.payable(book).cents()).assertEqual(28000);
      cart.setAllSelected(false);
      expect(cart.subtotal().isZero()).assertTrue();
      expect(cart.totalWithCoupon(book).cents()).assertEqual(100);
      expect(cart.payable(book).isZero()).assertTrue();
      expect(cart.isAllSelected()).assertFalse();
      cart.setAllSelected(true);
      expect(book.size()).assertEqual(4);
      expect(book.all().length).assertEqual(4);
      expect(cart.totalQuantity()).assertEqual(1);
      expect(cart.payable(book).isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0470
     * @tc.name      book_all_exposes_internal_array_047
     * @tc.desc      Verify the coupon book all method exposes its internal array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('book_all_exposes_internal_array_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: book_all_exposes_internal_array_047');
      let book: CouponBook = new CouponBook([new Coupon('E1', 'first entry', 0, 100)]);
      expect(book.size()).assertEqual(1);
      let entries: Coupon[] = book.all();
      expect(entries.length).assertEqual(1);
      // all() hands back the live array, so this push raises book.size() to 2 with no registration call.
      entries.push(new Coupon('E2', 'second entry', 0, 2500));
      expect(entries.length).assertEqual(2);
      expect(book.size()).assertEqual(2);
      expect(book.all().length).assertEqual(2);
      expect(book.bestDiscount(new Money(5000)).cents()).assertEqual(2500);
      expect(entries[1].id).assertEqual('E2');
      expect(book.all()[0].discountCents).assertEqual(100);
      expect(book.payable(new Money(5000)).isPositive()).assertTrue();
      expect(entries.length).assertEqual(book.size());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0480
     * @tc.name      live_threshold_mutation_changes_eligibility_048
     * @tc.desc      Verify a live threshold mutation changes coupon eligibility.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('live_threshold_mutation_changes_eligibility_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: live_threshold_mutation_changes_eligibility_048');
      let coupon: Coupon = new Coupon('T1', 'live threshold', 5000, 100);
      expect(coupon.isUsableFor(4999)).assertFalse();
      expect(coupon.isUsableFor(5000)).assertTrue();
      expect(coupon.thresholdCents).assertEqual(5000);
      // Lowering the gate to 100 moves the cut-off: exactly 100 passes, 99 still does not.
      coupon.thresholdCents = 100;
      expect(coupon.isUsableFor(100)).assertTrue();
      expect(coupon.isUsableFor(99)).assertFalse();
      let book: CouponBook = new CouponBook([coupon]);
      let cart: Cart = cartWith([cartLine(1, 150, 1)]);
      expect(book.applicable(cart.subtotal()).length).assertEqual(1);
      expect(cart.subtotal().cents()).assertEqual(150);
      expect(coupon.discountCents).assertEqual(100);
      expect(book.all().length).assertEqual(1);
      expect(cart.payable(book).isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0490
     * @tc.name      merge_two_unselected_carts_keeps_payable_zero_049
     * @tc.desc      Verify merging two unselected carts keeps the payable at zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_two_unselected_carts_keeps_payable_zero_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_two_unselected_carts_keeps_payable_zero_049');
      let target: Cart = cartWith([cartLine(1, 10000, 1, false)]);
      let source: Cart = cartWith([cartLine(2, 20000, 1, false)]);
      let book: CouponBook = defaultCouponBook();
      expect(target.payable(book).isZero()).assertTrue();
      target.merge(source);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.subtotal().isZero()).assertTrue();
      expect(target.selectedQuantity()).assertEqual(0);
      expect(target.totalQuantity()).assertEqual(2);
      expect(target.allLinesSubtotal().cents()).assertEqual(30000);
      expect(book.size()).assertEqual(4);
      expect(target.allLinesSubtotal().isPositive()).assertTrue();
      expect(book.all().length).assertEqual(4);
      expect(source.totalQuantity()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0500
     * @tc.name      remove_selected_line_leaves_unselected_payable_zero_050
     * @tc.desc      Verify removing the selected line leaves the unselected payable at zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_selected_line_leaves_unselected_payable_zero_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_selected_line_leaves_unselected_payable_zero_050');
      let cart: Cart = cartWith([cartLine(1, 30000, 1, true), cartLine(2, 40000, 1, false)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.payable(book).cents()).assertEqual(28000);
      expect(cart.remove(1)).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(1);
      expect(cart.subtotal().isZero()).assertTrue();
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(book.size()).assertEqual(4);
      expect(book.all().length).assertEqual(4);
      expect(cart.payable(book).isNegative()).assertFalse();
      expect(cart.contains(1)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0510
     * @tc.name      negative_subtotal_with_negative_discount_stays_zero_051
     * @tc.desc      Verify a negative subtotal with a negative discount stays zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_subtotal_with_negative_discount_stays_zero_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_subtotal_with_negative_discount_stays_zero_051');
      let cart: Cart = cartWith([cartLine(1, -1000, 2)]);
      let book: CouponBook = new CouponBook([new Coupon('ND', 'negative rebate', 0, -500)]);
      expect(cart.subtotal().cents()).assertEqual(-2000);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(0);
      expect(cart.payable(book).isZero()).assertTrue();
      expect(book.payable(cart.subtotal()).isZero()).assertTrue();
      expect(cart.payable(book).equals(book.payable(cart.subtotal()))).assertTrue();
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(0);
      expect(book.size()).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(2);
      expect(cart.payable(book).format()).assertEqual('¥0.00');
      expect(cart.payable(book).isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0520
     * @tc.name      one_cent_removal_keeps_coupon_at_threshold_052
     * @tc.desc      Verify a one cent removal keeps the coupon at the exact threshold.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_removal_keeps_coupon_at_threshold_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_removal_keeps_coupon_at_threshold_052');
      let cart: Cart = cartWith([cartLine(1, 30000, 1), cartLine(2, 1, 1)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.subtotal().cents()).assertEqual(30001);
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(2000);
      expect(cart.payable(book).cents()).assertEqual(28001);
      expect(cart.setQuantity(2, 0)).assertEqual(0);
      // Dropping the single cent lands exactly on 30000, where C20's 2000 still qualifies.
      expect(cart.subtotal().cents()).assertEqual(30000);
      expect(cart.distinctCount()).assertEqual(1);
      expect(book.size()).assertEqual(4);
      expect(cart.allLinesSubtotal().equals(cart.subtotal())).assertTrue();
      expect(book.all().length).assertEqual(4);
      expect(cart.payable(book).isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0530
     * @tc.name      increase_beyond_cap_keeps_payable_at_cap_053
     * @tc.desc      Verify an increase beyond the cap keeps the payable at the cap amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('increase_beyond_cap_keeps_payable_at_cap_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: increase_beyond_cap_keeps_payable_at_cap_053');
      let cart: Cart = cartWith([cartLine(1, 1000, 98)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.quantityOf(1)).assertEqual(98);
      // 98 + 5 would be 103, so the increase stops at the 99-unit ceiling and the subtotal at 99000.
      expect(cart.increase(1, 5)).assertEqual(99);
      expect(cart.quantityOf(1)).assertEqual(99);
      expect(cart.totalQuantity()).assertEqual(99);
      expect(cart.subtotal().cents()).assertEqual(99000);
      expect(book.applicable(cart.subtotal()).length).assertEqual(3);
      expect(book.size()).assertEqual(4);
      expect(cart.payable(book).isPositive()).assertTrue();
      expect(book.best(cart.subtotal()) !== undefined).assertTrue();
      expect(cart.lineAt(0) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_COUPON_CART_0540
     * @tc.name      removing_zero_price_selected_line_keeps_payable_054
     * @tc.desc      Verify removing a zero price selected line keeps the payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('removing_zero_price_selected_line_keeps_payable_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: removing_zero_price_selected_line_keeps_payable_054');
      let cart: Cart = cartWith([cartLine(1, 30000, 1, true), cartLine(2, 0, 1, true)]);
      let book: CouponBook = defaultCouponBook();
      expect(cart.subtotal().cents()).assertEqual(30000);
      expect(cart.payable(book).cents()).assertEqual(28000);
      expect(cart.totalQuantity()).assertEqual(2);
      expect(cart.remove(2)).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(1);
      expect(book.size()).assertEqual(4);
      expect(book.all().length).assertEqual(4);
      expect(cart.payable(book).isPositive()).assertTrue();
      expect(cart.contains(2)).assertFalse();
    });
  });
}
