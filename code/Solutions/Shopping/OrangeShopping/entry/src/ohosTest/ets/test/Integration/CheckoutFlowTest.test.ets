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
import { Cart, CartLine, CartSnapshot, Coupon, CouponBook, Goods, Money, Order, OrderCenter, OrderCounts, OrderState } from '../Shared/ShopModel';
import { PRODUCTS, cartLine, cartWith, defaultCouponBook, emptyCouponBook } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Three parallel arrays over PRODUCTS; unit prices come from the catalogue. */
function cartFromCatalog(ids: number[], quantities: number[], selected: boolean[]): Cart {
  let lines: CartLine[] = [];
  for (let index: number = 0; index < ids.length; index++) {
    let goods: Goods = PRODUCTS[ids[index]];
    lines.push(cartLine(goods.id, goods.price.cents(), quantities[index], selected[index]));
  }
  return cartWith(lines);
}

/** goodsId values in cart line order, not merely the product set. */
function cartIds(cart: Cart): number[] {
  let ids: number[] = [];
  for (let index: number = 0; index < cart.allLines().length; index++) {
    ids.push(cart.allLines()[index].goodsId);
  }
  return ids;
}

/** Eight orders in all seven states (OBLIGATION twice), createdAt 1001-1008. */
function buildMixedOrderCenter(): OrderCenter {
  let orders: Order[] = [
    new Order(201, [cartLine(0, 1000, 1, true)], OrderState.OBLIGATION, 1001),
    new Order(202, [cartLine(1, 2000, 1, true)], OrderState.OBLIGATION, 1002),
    new Order(203, [cartLine(2, 3000, 1, true)], OrderState.WAIT_DELIVERY, 1003),
    new Order(204, [cartLine(3, 4000, 1, true)], OrderState.WAIT_RECEIVE, 1004),
    new Order(205, [cartLine(4, 5000, 1, true)], OrderState.WAIT_EVALUATE, 1005),
    new Order(206, [cartLine(5, 6000, 1, true)], OrderState.REFUND, 1006),
    new Order(207, [cartLine(6, 19900, 2, true)], OrderState.CANCELLED, 1007),
    new Order(208, [cartLine(4, 8900, 5, true)], OrderState.COMPLETED, 1008)
  ];
  return new OrderCenter(orders);
}

export default function checkoutFlowTest() {
  describe('OrangeShoppingCheckoutFlow', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'checkout flow suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0010
     * @tc.name      browse_then_checkout_creates_the_selected_order_001
     * @tc.desc      Verify browse then checkout creates the selected order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('browse_then_checkout_creates_the_selected_order_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: browse_then_checkout_creates_the_selected_order_001');
      let cart: Cart = cartFromCatalog([0, 1], [1, 1], [true, true]);
      let order: Order = new Order(101, cart.selectedLines(), OrderState.OBLIGATION, 1700000101);
      expect(order.lines.length).assertEqual(2);
      expect(order.lines[0].goodsId).assertEqual(0);
      expect(order.lines[1].goodsId).assertEqual(1);
      expect(order.state).assertEqual(OrderState.OBLIGATION);
      expect(order.stateLabel()).assertEqual('obligation');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0020
     * @tc.name      checkout_order_total_matches_the_cart_subtotal_002
     * @tc.desc      Verify checkout order total matches the cart subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('checkout_order_total_matches_the_cart_subtotal_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: checkout_order_total_matches_the_cart_subtotal_002');
      let cart: Cart = cartFromCatalog([0, 4], [1, 2], [true, true]);
      let order: Order = new Order(102, cart.selectedLines(), OrderState.OBLIGATION);
      expect(order.total().cents()).assertEqual(cart.subtotal().cents());
      expect(order.total().cents() > 0).assertTrue();
      expect(order.total().cents()).assertEqual(cart.allLinesSubtotal().cents());
      let expected: Money = PRODUCTS[0].price.add(PRODUCTS[4].price.multiply(2));
      expect(order.total().cents()).assertEqual(expected.cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0030
     * @tc.name      checkout_order_quantity_matches_the_cart_quantity_003
     * @tc.desc      Verify checkout order quantity matches the cart quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('checkout_order_quantity_matches_the_cart_quantity_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: checkout_order_quantity_matches_the_cart_quantity_003');
      let cart: Cart = cartFromCatalog([0, 4], [2, 3], [true, true]);
      let order: Order = new Order(103, cart.selectedLines(), OrderState.OBLIGATION);
      expect(order.quantity()).assertEqual(5);
      expect(order.quantity()).assertEqual(cart.selectedQuantity());
      expect(order.lines.length).assertEqual(2);
      expect(order.lines[0].quantity).assertEqual(2);
      expect(order.lines[1].quantity).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0040
     * @tc.name      partial_selection_checkout_excludes_unselected_lines_004
     * @tc.desc      Verify partial selection checkout excludes unselected lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('partial_selection_checkout_excludes_unselected_lines_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: partial_selection_checkout_excludes_unselected_lines_004');
      let cart: Cart = cartFromCatalog([0, 2, 4], [1, 2, 1], [true, false, true]);
      let chosen: CartLine[] = cart.selectedLines();
      expect(chosen.length).assertEqual(2);
      let order: Order = new Order(104, chosen, OrderState.OBLIGATION);
      expect(order.lines.length).assertEqual(2);
      expect(order.lines[0].goodsId).assertEqual(0);
      expect(order.lines[1].goodsId).assertEqual(4);
      expect(order.total().cents()).assertEqual(cart.subtotal().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0050
     * @tc.name      partial_selection_payable_uses_only_selected_lines_005
     * @tc.desc      Verify partial selection payable uses only selected lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('partial_selection_payable_uses_only_selected_lines_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: partial_selection_payable_uses_only_selected_lines_005');
      let cart: Cart = cartFromCatalog([0, 2, 4], [1, 2, 1], [true, false, true]);
      let book: CouponBook = defaultCouponBook();
      let selectedCents: number = cart.subtotal().cents();
      let expected: Money = book.payable(new Money(selectedCents));
      expect(cart.payable(book).cents()).assertEqual(expected.cents());
      let allCents: number = cart.allLinesSubtotal().cents();
      expect(allCents > selectedCents).assertTrue();
      expect(cart.totalWithCoupon(book).cents()).assertEqual(book.bestDiscount(new Money(selectedCents)).cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0060
     * @tc.name      coupon_selection_uses_the_best_applicable_discount_006
     * @tc.desc      Verify coupon selection uses the best applicable discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_selection_uses_the_best_applicable_discount_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_selection_uses_the_best_applicable_discount_006');
      let cart: Cart = cartFromCatalog([0, 1], [1, 1], [true, true]);
      let book: CouponBook = defaultCouponBook();
      // Both flagship prices lift the subtotal past 100000 cents, so C50's 5000 off beats C20's 2000.
      let subtotal: Money = cart.subtotal();
      let best: Coupon | undefined = book.best(subtotal);
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.id).assertEqual('C50');
        expect(best.discountCents).assertEqual(5000);
        expect(cart.payable(book).cents()).assertEqual(subtotal.cents() - 5000);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0070
     * @tc.name      coupon_at_exact_threshold_is_applied_007
     * @tc.desc      Verify coupon at exact threshold is applied.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_at_exact_threshold_is_applied_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_at_exact_threshold_is_applied_007');
      let cart: Cart = cartWith([cartLine(900, 5000, 2, true)]);
      let book: CouponBook = new CouponBook([new Coupon('EXACT', 'threshold exact', 10000, 1000)]);
      // 5000 cents times two lands exactly on the 10000 threshold, which still qualifies under a greater-or-equal test.
      expect(cart.subtotal().cents()).assertEqual(10000);
      let best: Coupon | undefined = book.best(cart.subtotal());
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.id).assertEqual('EXACT');
      }
      expect(cart.payable(book).cents()).assertEqual(9000);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0080
     * @tc.name      coupon_below_threshold_is_ignored_008
     * @tc.desc      Verify coupon below threshold is ignored.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_below_threshold_is_ignored_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_below_threshold_is_ignored_008');
      let cart: Cart = cartWith([cartLine(901, 8900, 1, true)]);
      let book: CouponBook = new CouponBook([new Coupon('HIGH', 'high threshold', 20000, 2000)]);
      expect(book.applicable(cart.subtotal()).length).assertEqual(0);
      expect(book.best(cart.subtotal()) === null || book.best(cart.subtotal()) === undefined).assertTrue();
      expect(cart.payable(book).cents()).assertEqual(8900);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(0);
      expect(book.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0090
     * @tc.name      checkout_with_oversized_coupon_keeps_the_order_total_009
     * @tc.desc      Verify checkout with oversized coupon keeps the order total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('checkout_with_oversized_coupon_keeps_the_order_total_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: checkout_with_oversized_coupon_keeps_the_order_total_009');
      let cart: Cart = cartWith([cartLine(902, 8900, 1, true)]);
      let book: CouponBook = new CouponBook([new Coupon('BIG', 'over discount', 0, 50000)]);
      let order: Order = new Order(154, cart.selectedLines(), OrderState.OBLIGATION);
      // The order was constructed without a coupon book, so its 8900-cent total survives the fully discounted payable.
      let payable: Money = cart.payable(book);
      expect(payable.cents()).assertEqual(0);
      expect(payable.isNegative()).assertFalse();
      expect(book.payable(cart.subtotal()).cents()).assertEqual(payable.cents());
      expect(cart.subtotal().cents()).assertEqual(8900);
      expect(order.total().cents()).assertEqual(8900);
      expect(order.stateLabel()).assertEqual('obligation');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0100
     * @tc.name      no_coupon_book_keeps_the_subtotal_as_payable_010
     * @tc.desc      Verify no coupon book keeps the subtotal as payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('no_coupon_book_keeps_the_subtotal_as_payable_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: no_coupon_book_keeps_the_subtotal_as_payable_010');
      let cart: Cart = cartFromCatalog([3, 7], [2, 1], [true, true]);
      let book: CouponBook = emptyCouponBook();
      expect(book.size()).assertEqual(0);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(0);
      expect(cart.payable(book).cents()).assertEqual(cart.subtotal().cents());
      expect(book.bestDiscount(cart.subtotal()).cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0110
     * @tc.name      coupon_application_does_not_stack_on_repeated_payable_011
     * @tc.desc      Verify coupon application does not stack on repeated payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_application_does_not_stack_on_repeated_payable_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_application_does_not_stack_on_repeated_payable_011');
      let cart: Cart = cartFromCatalog([0, 5], [1, 2], [true, true]);
      let book: CouponBook = defaultCouponBook();
      let subtotal: number = cart.subtotal().cents();
      let first: Money = cart.payable(book);
      let second: Money = cart.payable(book);
      expect(first.cents()).assertEqual(second.cents());
      expect(first.cents()).assertEqual(subtotal - book.bestDiscount(new Money(subtotal)).cents());
      expect(cart.subtotal().cents()).assertEqual(subtotal);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0120
     * @tc.name      order_starts_in_obligation_state_012
     * @tc.desc      Verify order starts in obligation state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_starts_in_obligation_state_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_starts_in_obligation_state_012');
      let cart: Cart = cartFromCatalog([0], [1], [true]);
      let order: Order = new Order(105, cart.selectedLines(), OrderState.OBLIGATION);
      expect(order.state).assertEqual(OrderState.OBLIGATION);
      expect(order.stateLabel()).assertEqual('obligation');
      expect(order.canCancel()).assertTrue();
      expect(order.canRefund()).assertFalse();
      expect(order.isFinal()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0130
     * @tc.name      payment_advances_order_to_wait_delivery_013
     * @tc.desc      Verify payment advances order to wait delivery.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('payment_advances_order_to_wait_delivery_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: payment_advances_order_to_wait_delivery_013');
      let cart: Cart = cartFromCatalog([0], [2], [true]);
      let order: Order = new Order(106, cart.selectedLines(), OrderState.OBLIGATION);
      let paid: number = order.total().cents();
      let advanced: boolean = order.advance();
      expect(advanced).assertTrue();
      expect(order.state).assertEqual(OrderState.WAIT_DELIVERY);
      expect(order.stateLabel()).assertEqual('wait_delivery');
      expect(order.total().cents()).assertEqual(paid);
      expect(order.canCancel()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0140
     * @tc.name      delivery_advances_order_to_wait_receive_014
     * @tc.desc      Verify delivery advances order to wait receive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('delivery_advances_order_to_wait_receive_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: delivery_advances_order_to_wait_receive_014');
      let cart: Cart = cartFromCatalog([1], [1], [true]);
      let order: Order = new Order(107, cart.selectedLines(), OrderState.OBLIGATION);
      order.advance();
      let advanced: boolean = order.advance();
      expect(advanced).assertTrue();
      expect(order.state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(order.stateLabel()).assertEqual('wait_receive');
      expect(order.canCancel()).assertFalse();
      expect(order.canRefund()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0150
     * @tc.name      receipt_advances_order_to_wait_evaluate_015
     * @tc.desc      Verify receipt advances order to wait evaluate.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('receipt_advances_order_to_wait_evaluate_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: receipt_advances_order_to_wait_evaluate_015');
      let cart: Cart = cartFromCatalog([2], [1], [true]);
      let order: Order = new Order(108, cart.selectedLines(), OrderState.OBLIGATION);
      order.advance();
      order.advance();
      let advanced: boolean = order.advance();
      expect(advanced).assertTrue();
      expect(order.state).assertEqual(OrderState.WAIT_EVALUATE);
      expect(order.stateLabel()).assertEqual('wait_evaluate');
      expect(order.canRefund()).assertTrue();
      expect(order.isFinal()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0160
     * @tc.name      evaluation_completes_the_order_016
     * @tc.desc      Verify evaluation completes the order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('evaluation_completes_the_order_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: evaluation_completes_the_order_016');
      let cart: Cart = cartFromCatalog([4], [3], [true]);
      let order: Order = new Order(109, cart.selectedLines(), OrderState.OBLIGATION);
      let completed: boolean = false;
      // OBLIGATION -> WAIT_DELIVERY -> WAIT_RECEIVE -> WAIT_EVALUATE -> COMPLETED needs four advances.
      for (let step: number = 0; step < 4; step++) {
        completed = order.advance();
      }
      expect(completed).assertTrue();
      expect(order.state).assertEqual(OrderState.COMPLETED);
      expect(order.stateLabel()).assertEqual('completed');
      expect(order.isFinal()).assertTrue();
      expect(order.canCancel()).assertFalse();
      expect(order.canRefund()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0170
     * @tc.name      full_lifecycle_preserves_the_order_amount_017
     * @tc.desc      Verify full lifecycle preserves the order amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('full_lifecycle_preserves_the_order_amount_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: full_lifecycle_preserves_the_order_amount_017');
      let cart: Cart = cartFromCatalog([0, 4], [1, 2], [true, true]);
      let order: Order = new Order(110, cart.selectedLines(), OrderState.OBLIGATION);
      let paid: number = order.total().cents();
      let first: boolean = order.advance();
      let second: boolean = order.advance();
      let third: boolean = order.advance();
      let fourth: boolean = order.advance();
      let fifth: boolean = order.advance();

      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(third).assertTrue();
      expect(fourth).assertTrue();
      expect(fifth).assertFalse();
      expect(order.state).assertEqual(OrderState.COMPLETED);
      expect(order.total().cents()).assertEqual(paid);
      expect(order.quantity()).assertEqual(3);
      expect(order.stateLabel()).assertEqual('completed');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0180
     * @tc.name      cancellation_before_payment_marks_the_order_cancelled_018
     * @tc.desc      Verify cancellation before payment marks the order cancelled.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cancellation_before_payment_marks_the_order_cancelled_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cancellation_before_payment_marks_the_order_cancelled_018');
      let cart: Cart = cartFromCatalog([0], [1], [true]);
      let order: Order = new Order(111, cart.selectedLines(), OrderState.OBLIGATION);
      let cancelled: boolean = order.cancel();
      expect(cancelled).assertTrue();
      expect(order.state).assertEqual(OrderState.CANCELLED);
      expect(order.stateLabel()).assertEqual('cancelled');
      expect(order.isFinal()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0190
     * @tc.name      cancellation_after_payment_is_allowed_before_delivery_019
     * @tc.desc      Verify cancellation after payment is allowed before delivery.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cancellation_after_payment_is_allowed_before_delivery_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cancellation_after_payment_is_allowed_before_delivery_019');
      let cart: Cart = cartFromCatalog([1], [2], [true]);
      let order: Order = new Order(112, cart.selectedLines(), OrderState.OBLIGATION);
      order.advance();
      expect(order.canCancel()).assertTrue();
      let cancelled: boolean = order.cancel();
      expect(cancelled).assertTrue();
      expect(order.state).assertEqual(OrderState.CANCELLED);
      expect(order.total().cents()).assertEqual(cart.subtotal().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0200
     * @tc.name      cancellation_after_delivery_is_rejected_020
     * @tc.desc      Verify cancellation after delivery is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cancellation_after_delivery_is_rejected_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cancellation_after_delivery_is_rejected_020');
      let cart: Cart = cartFromCatalog([2], [1], [true]);
      let order: Order = new Order(113, cart.selectedLines(), OrderState.OBLIGATION);
      order.advance();
      order.advance();
      let cancelled: boolean = order.cancel();
      expect(cancelled).assertFalse();
      expect(order.state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(order.isFinal()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0210
     * @tc.name      cancelled_order_cannot_advance_021
     * @tc.desc      Verify cancelled order cannot advance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cancelled_order_cannot_advance_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cancelled_order_cannot_advance_021');
      let cart: Cart = cartFromCatalog([3], [1], [true]);
      let order: Order = new Order(114, cart.selectedLines(), OrderState.OBLIGATION);
      order.cancel();
      let advanced: boolean = order.advance();
      expect(advanced).assertFalse();
      expect(order.state).assertEqual(OrderState.CANCELLED);
      expect(order.stateLabel()).assertEqual('cancelled');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0220
     * @tc.name      refund_after_delivery_marks_the_order_refunded_022
     * @tc.desc      Verify refund after delivery marks the order refunded.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_after_delivery_marks_the_order_refunded_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_after_delivery_marks_the_order_refunded_022');
      let cart: Cart = cartFromCatalog([0, 3], [1, 2], [true, true]);
      let order: Order = new Order(115, cart.selectedLines(), OrderState.OBLIGATION);
      order.advance();
      order.advance();
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.stateLabel()).assertEqual('refund');
      expect(order.isFinal()).assertTrue();
      expect(order.total().cents()).assertEqual(cart.subtotal().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0230
     * @tc.name      refund_before_delivery_is_rejected_023
     * @tc.desc      Verify refund before delivery is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_before_delivery_is_rejected_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_before_delivery_is_rejected_023');
      let cart: Cart = cartFromCatalog([4], [1], [true]);
      let order: Order = new Order(116, cart.selectedLines(), OrderState.OBLIGATION);
      order.advance();
      let refunded: boolean = order.refund();
      expect(refunded).assertFalse();
      expect(order.state).assertEqual(OrderState.WAIT_DELIVERY);
      expect(order.canRefund()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0240
     * @tc.name      refund_after_receipt_is_allowed_024
     * @tc.desc      Verify refund after receipt is allowed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_after_receipt_is_allowed_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_after_receipt_is_allowed_024');
      let cart: Cart = cartFromCatalog([1, 6], [1, 1], [true, true]);
      let order: Order = new Order(117, cart.selectedLines(), OrderState.OBLIGATION);
      order.advance();
      order.advance();
      order.advance();
      expect(order.canRefund()).assertTrue();
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.isFinal()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0250
     * @tc.name      refunded_order_cannot_advance_025
     * @tc.desc      Verify refunded order cannot advance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_cannot_advance_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_cannot_advance_025');
      let cart: Cart = cartFromCatalog([5], [2], [true]);
      let order: Order = new Order(118, cart.selectedLines(), OrderState.OBLIGATION);
      order.advance();
      order.advance();
      order.refund();
      let advanced: boolean = order.advance();
      expect(advanced).assertFalse();
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.stateLabel()).assertEqual('refund');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0260
     * @tc.name      cancelled_order_is_excluded_from_spent_026
     * @tc.desc      Verify cancelled order is excluded from spent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cancelled_order_is_excluded_from_spent_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cancelled_order_is_excluded_from_spent_026');
      let cancelled: Order = new Order(119, [cartLine(0, 499900, 1, true)], OrderState.CANCELLED, 10);
      let completed: Order = new Order(120, [cartLine(4, 8900, 2, true)], OrderState.COMPLETED, 20);
      let center: OrderCenter = new OrderCenter([cancelled, completed]);
      expect(center.size()).assertEqual(2);
      // Only the COMPLETED line is spent: 8900 x 2 = 17800, while the 499900 cancelled order is skipped.
      expect(center.spent().cents()).assertEqual(17800);
      expect(center.counts().cancelled).assertEqual(1);
      expect(center.counts().completed).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0270
     * @tc.name      refunded_order_is_excluded_from_spent_027
     * @tc.desc      Verify refunded order is excluded from spent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_is_excluded_from_spent_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_is_excluded_from_spent_027');
      let refunded: Order = new Order(121, [cartLine(1, 399900, 1, true)], OrderState.REFUND, 30);
      let obligation: Order = new Order(122, [cartLine(7, 15900, 3, true)], OrderState.OBLIGATION, 40);
      let center: OrderCenter = new OrderCenter([refunded, obligation]);
      // The 399900 refund drops out, leaving the obligation: 15900 x 3 = 47700.
      expect(center.spent().cents()).assertEqual(47700);
      expect(center.counts().refund).assertEqual(1);
      expect(center.counts().obligation).assertEqual(1);
      expect(center.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0280
     * @tc.name      order_center_spent_matches_active_orders_028
     * @tc.desc      Verify order center spent matches active orders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_center_spent_matches_active_orders_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_center_spent_matches_active_orders_028');
      let orders: Order[] = [
        new Order(123, [cartLine(0, 1000, 1, true)], OrderState.OBLIGATION, 100),
        new Order(124, [cartLine(1, 2000, 2, true)], OrderState.WAIT_DELIVERY, 200),
        new Order(125, [cartLine(2, 3000, 1, true)], OrderState.CANCELLED, 300),
        new Order(126, [cartLine(3, 4000, 3, true)], OrderState.REFUND, 400),
        new Order(127, [cartLine(4, 5000, 1, true)], OrderState.COMPLETED, 500)
      ];
      let center: OrderCenter = new OrderCenter(orders);
      let expected: number = 0;
      for (let index: number = 0; index < orders.length; index++) {
        let state: OrderState = orders[index].state;
        if (state !== OrderState.CANCELLED && state !== OrderState.REFUND) {

          expected += orders[index].total().cents();
        }
      }
      expect(center.spent().cents()).assertEqual(expected);
      expect(center.size()).assertEqual(5);
      expect(center.counts().total).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0290
     * @tc.name      order_center_counts_match_the_state_lists_029
     * @tc.desc      Verify order center counts match the state lists.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_center_counts_match_the_state_lists_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_center_counts_match_the_state_lists_029');
      let center: OrderCenter = buildMixedOrderCenter();
      let counts: OrderCounts = center.counts();
      let summed: number = counts.obligation + counts.waitDelivery + counts.waitReceive +
        counts.waitEvaluate + counts.refund + counts.completed + counts.cancelled;
      expect(summed).assertEqual(counts.total);
      expect(counts.total).assertEqual(8);
      expect(center.byState(OrderState.OBLIGATION).length).assertEqual(counts.obligation);
      expect(center.byState(OrderState.WAIT_DELIVERY).length).assertEqual(counts.waitDelivery);
      expect(center.byState(OrderState.WAIT_RECEIVE).length).assertEqual(counts.waitReceive);
      expect(center.byState(OrderState.WAIT_EVALUATE).length).assertEqual(counts.waitEvaluate);
      expect(center.byState(OrderState.REFUND).length).assertEqual(counts.refund);
      expect(center.byState(OrderState.COMPLETED).length).assertEqual(counts.completed);
      expect(center.byState(OrderState.CANCELLED).length).assertEqual(counts.cancelled);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0300
     * @tc.name      state_filters_list_only_matching_orders_030
     * @tc.desc      Verify state filters list only matching orders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_filters_list_only_matching_orders_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_filters_list_only_matching_orders_030');
      let center: OrderCenter = buildMixedOrderCenter();
      let states: OrderState[] = [
        OrderState.OBLIGATION,
        OrderState.WAIT_DELIVERY,
        OrderState.WAIT_RECEIVE,
        OrderState.WAIT_EVALUATE,
        OrderState.REFUND,
        OrderState.COMPLETED,
        OrderState.CANCELLED
      ];
      let seen: number = 0;
      for (let index: number = 0; index < states.length; index++) {
        let list: Order[] = center.byState(states[index]);

        expect(list.length > 0).assertTrue();
        for (let orderIndex: number = 0; orderIndex < list.length; orderIndex++) {
          expect(list[orderIndex].state).assertEqual(states[index]);
          seen++;
        }
      }
      expect(seen).assertEqual(center.size());
      expect(seen > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0310
     * @tc.name      cancelled_and_refunded_orders_stay_in_the_center_031
     * @tc.desc      Verify cancelled and refunded orders stay in the center.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cancelled_and_refunded_orders_stay_in_the_center_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cancelled_and_refunded_orders_stay_in_the_center_031');
      let center: OrderCenter = buildMixedOrderCenter();
      let cancelledList: Order[] = center.byState(OrderState.CANCELLED);
      let refundList: Order[] = center.byState(OrderState.REFUND);
      expect(cancelledList.length).assertEqual(1);
      expect(refundList.length).assertEqual(1);
      expect(center.size()).assertEqual(8);
      // Order 207 bills two earbuds at 19900 each, and order 206's lone line is 6000 cents.
      expect(cancelledList[0].total().cents()).assertEqual(19900 * 2);
      expect(refundList[0].total().cents()).assertEqual(6000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0320
     * @tc.name      latest_order_is_the_most_recent_creation_032
     * @tc.desc      Verify latest order is the most recent creation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('latest_order_is_the_most_recent_creation_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: latest_order_is_the_most_recent_creation_032');
      let early: Order = new Order(128, [cartLine(0, 1000, 1, true)], OrderState.OBLIGATION, 100);
      let late: Order = new Order(129, [cartLine(1, 2000, 1, true)], OrderState.OBLIGATION, 900);
      let middle: Order = new Order(130, [cartLine(2, 3000, 1, true)], OrderState.OBLIGATION, 500);
      let center: OrderCenter = new OrderCenter([early, late, middle]);
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(129);
        expect(latest.createdAt).assertEqual(900);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0330
     * @tc.name      orders_sort_by_creation_time_descending_033
     * @tc.desc      Verify orders sort by creation time descending.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('orders_sort_by_creation_time_descending_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: orders_sort_by_creation_time_descending_033');
      let first: Order = new Order(131, [cartLine(0, 1000, 1, true)], OrderState.OBLIGATION, 100);
      let second: Order = new Order(132, [cartLine(1, 2000, 1, true)], OrderState.OBLIGATION, 200);
      let third: Order = new Order(133, [cartLine(2, 3000, 1, true)], OrderState.OBLIGATION, 300);
      let center: OrderCenter = new OrderCenter([first, third, second]);
      let sorted: Order[] = center.sortedByCreatedAt(true);
      let ids: number[] = [];
      for (let index: number = 0; index < sorted.length; index++) {
        ids.push(sorted[index].id);
      }
      expect((ids).length).assertEqual(([133, 132, 131]).length);
      for (let __i1: number = 0; __i1 < ([133, 132, 131]).length; __i1++) {
        expect((ids)[__i1]).assertEqual(([133, 132, 131])[__i1]);
      }
      let ascending: Order[] = center.sortedByCreatedAt(false);
      expect(ascending[0].id).assertEqual(131);
      expect(ascending[2].id).assertEqual(133);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0340
     * @tc.name      order_center_empty_has_zero_counts_and_spent_034
     * @tc.desc      Verify order center empty has zero counts and spent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_center_empty_has_zero_counts_and_spent_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_center_empty_has_zero_counts_and_spent_034');
      let center: OrderCenter = new OrderCenter([]);
      let counts: OrderCounts = center.counts();
      expect(center.size()).assertEqual(0);
      expect(counts.total).assertEqual(0);
      expect(counts.obligation).assertEqual(0);
      expect(counts.cancelled).assertEqual(0);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.latest() === null || center.latest() === undefined).assertTrue();
      expect(center.byState(OrderState.COMPLETED).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0350
     * @tc.name      snapshot_restore_keeps_the_cart_lines_for_checkout_035
     * @tc.desc      Verify snapshot restore keeps the cart lines for checkout.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_restore_keeps_the_cart_lines_for_checkout_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_restore_keeps_the_cart_lines_for_checkout_035');
      let cart: Cart = cartFromCatalog([0, 1, 4], [1, 2, 3], [true, true, false]);
      let snapshot: CartSnapshot = cart.snapshot();
      let restored: Cart = Cart.restore(snapshot);
      expect(restored.distinctCount()).assertEqual(3);
      // Quantities 1 + 2 + 3 total six units, and restore must keep the goodsId order for comparison below.
      expect(restored.totalQuantity()).assertEqual(6);
      let originalIds: number[] = cartIds(cart);
      let restoredIds: number[] = cartIds(restored);
      expect((restoredIds).length).assertEqual((originalIds).length);
      for (let __i2: number = 0; __i2 < (originalIds).length; __i2++) {
        expect((restoredIds)[__i2]).assertEqual((originalIds)[__i2]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0360
     * @tc.name      snapshot_restore_keeps_the_checkout_total_036
     * @tc.desc      Verify snapshot restore keeps the checkout total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_restore_keeps_the_checkout_total_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_restore_keeps_the_checkout_total_036');
      let cart: Cart = cartFromCatalog([0, 4], [1, 2], [true, true]);
      let expected: number = cart.subtotal().cents();
      let restored: Cart = Cart.restore(cart.snapshot());
      expect(restored.subtotal().cents()).assertEqual(expected);
      expect(restored.allLinesSubtotal().cents()).assertEqual(cart.allLinesSubtotal().cents());
      expect(restored.selectedQuantity()).assertEqual(cart.selectedQuantity());
      let order: Order = new Order(134, restored.selectedLines(), OrderState.OBLIGATION);
      expect(order.total().cents()).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0370
     * @tc.name      snapshot_restore_keeps_selection_for_partial_checkout_037
     * @tc.desc      Verify snapshot restore keeps selection for partial checkout.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_restore_keeps_selection_for_partial_checkout_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_restore_keeps_selection_for_partial_checkout_037');
      let cart: Cart = cartFromCatalog([0, 2, 4], [1, 2, 1], [true, false, true]);
      let restored: Cart = Cart.restore(cart.snapshot());
      expect(restored.selectedLines().length).assertEqual(2);
      // Only lines 1 and 3 are checked, so 1 + 1 = 2 selected units against 4 in total.
      expect(restored.selectedQuantity()).assertEqual(2);
      expect(restored.subtotal().cents()).assertEqual(cart.subtotal().cents());
      expect(restored.totalQuantity()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0380
     * @tc.name      checkout_after_restore_applies_the_same_coupon_038
     * @tc.desc      Verify checkout after restore applies the same coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('checkout_after_restore_applies_the_same_coupon_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: checkout_after_restore_applies_the_same_coupon_038');
      let cart: Cart = cartFromCatalog([0, 1], [1, 1], [true, true]);
      let book: CouponBook = defaultCouponBook();
      let before: number = cart.payable(book).cents();
      let restored: Cart = Cart.restore(cart.snapshot());
      let after: number = restored.payable(book).cents();
      expect(after).assertEqual(before);
      expect(restored.totalWithCoupon(book).cents()).assertEqual(cart.totalWithCoupon(book).cents());
      let order: Order = new Order(135, restored.selectedLines(), OrderState.OBLIGATION);
      expect(order.total().cents()).assertEqual(restored.subtotal().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0390
     * @tc.name      order_total_is_frozen_at_creation_039
     * @tc.desc      Verify order total is frozen at creation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_total_is_frozen_at_creation_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_total_is_frozen_at_creation_039');
      let cart: Cart = cartFromCatalog([0], [2], [true]);
      let expected: number = cart.subtotal().cents();
      let order: Order = new Order(136, cart.selectedLines(), OrderState.OBLIGATION);
      // Order copies its lines when built, so doubling the live cart to 4 units leaves the order at 2.
      cart.setQuantity(0, 4);
      expect(cart.subtotal().cents()).assertEqual(expected * 2);
      expect(order.total().cents()).assertEqual(expected);
      expect(order.quantity()).assertEqual(2);
      cart.clear();
      expect(order.total().cents()).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0400
     * @tc.name      checkout_with_empty_cart_creates_a_zero_order_040
     * @tc.desc      Verify checkout with empty cart creates a zero order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('checkout_with_empty_cart_creates_a_zero_order_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: checkout_with_empty_cart_creates_a_zero_order_040');
      let cart: Cart = new Cart();
      expect(cart.isEmpty()).assertTrue();
      let order: Order = new Order(137, cart.selectedLines(), OrderState.OBLIGATION);
      expect(order.lines.length).assertEqual(0);
      expect(order.total().cents()).assertEqual(0);
      expect(order.quantity()).assertEqual(0);
      expect(order.state).assertEqual(OrderState.OBLIGATION);
      expect(order.total().isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0410
     * @tc.name      checkout_with_all_lines_unselected_creates_a_zero_order_041
     * @tc.desc      Verify checkout with all lines unselected creates a zero order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('checkout_with_all_lines_unselected_creates_a_zero_order_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: checkout_with_all_lines_unselected_creates_a_zero_order_041');
      let cart: Cart = cartFromCatalog([0, 4], [1, 2], [false, false]);
      expect(cart.selectedLines().length).assertEqual(0);
      expect(cart.selectedQuantity()).assertEqual(0);
      expect(cart.subtotal().cents()).assertEqual(0);
      let order: Order = new Order(138, cart.selectedLines(), OrderState.OBLIGATION);
      expect(order.lines.length).assertEqual(0);
      expect(order.total().cents()).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0420
     * @tc.name      checkout_with_multiple_coupons_selects_one_discount_only_042
     * @tc.desc      Verify checkout with multiple coupons selects one discount only.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('checkout_with_multiple_coupons_selects_one_discount_only_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: checkout_with_multiple_coupons_selects_one_discount_only_042');
      let cart: Cart = cartWith([cartLine(903, 100000, 1, true)]);
      let book: CouponBook = new CouponBook([
        new Coupon('A10', 'ten off', 10000, 1000),
        new Coupon('B50', 'fifty off', 100000, 5000)
      ]);
      // Both coupons clear their thresholds, but only the 5000-cent B50 discount is taken once: 100000 - 5000.
      let payable: Money = cart.payable(book);
      expect(book.applicable(cart.subtotal()).length).assertEqual(2);
      expect(payable.cents()).assertEqual(95000);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(5000);
      let best: Coupon | undefined = book.best(cart.subtotal());
      expect(best !== null && best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.id).assertEqual('B50');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0430
     * @tc.name      paid_order_counts_toward_spent_043
     * @tc.desc      Verify paid order counts toward spent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('paid_order_counts_toward_spent_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: paid_order_counts_toward_spent_043');
      let cart: Cart = cartFromCatalog([1, 3], [1, 2], [true, true]);
      let order: Order = new Order(139, cart.selectedLines(), OrderState.OBLIGATION, 600);
      order.advance();
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().cents()).assertEqual(cart.subtotal().cents());
      expect(center.counts().waitDelivery).assertEqual(1);
      expect(center.counts().total).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0440
     * @tc.name      completed_order_counts_toward_spent_044
     * @tc.desc      Verify completed order counts toward spent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('completed_order_counts_toward_spent_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: completed_order_counts_toward_spent_044');
      let cart: Cart = cartFromCatalog([2, 5], [2, 1], [true, true]);
      let order: Order = new Order(140, cart.selectedLines(), OrderState.OBLIGATION, 700);
      for (let step: number = 0; step < 4; step++) {
        order.advance();
      }
      let center: OrderCenter = new OrderCenter([order]);
      expect(order.state).assertEqual(OrderState.COMPLETED);
      expect(center.spent().cents()).assertEqual(order.total().cents());
      expect(center.counts().completed).assertEqual(1);
      expect(center.byState(OrderState.COMPLETED).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0450
     * @tc.name      cancel_then_refund_is_rejected_045
     * @tc.desc      Verify cancel then refund is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cancel_then_refund_is_rejected_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cancel_then_refund_is_rejected_045');
      let cart: Cart = cartFromCatalog([0], [1], [true]);
      let order: Order = new Order(141, cart.selectedLines(), OrderState.OBLIGATION);
      expect(order.cancel()).assertTrue();
      let refunded: boolean = order.refund();
      expect(refunded).assertFalse();
      expect(order.state).assertEqual(OrderState.CANCELLED);
      expect(order.stateLabel()).assertEqual('cancelled');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0460
     * @tc.name      refund_then_cancel_is_rejected_046
     * @tc.desc      Verify refund then cancel is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_then_cancel_is_rejected_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_then_cancel_is_rejected_046');
      let cart: Cart = cartFromCatalog([3], [2], [true]);
      let order: Order = new Order(142, cart.selectedLines(), OrderState.OBLIGATION);
      order.advance();
      order.advance();
      expect(order.refund()).assertTrue();
      let cancelled: boolean = order.cancel();
      expect(cancelled).assertFalse();
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.isFinal()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0470
     * @tc.name      order_state_labels_cover_every_state_047
     * @tc.desc      Verify order state labels cover every state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('order_state_labels_cover_every_state_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: order_state_labels_cover_every_state_047');
      let states: OrderState[] = [
        OrderState.OBLIGATION,
        OrderState.WAIT_DELIVERY,
        OrderState.WAIT_RECEIVE,
        OrderState.WAIT_EVALUATE,
        OrderState.REFUND,
        OrderState.COMPLETED,
        OrderState.CANCELLED
      ];
      let labels: string[] = [
        'obligation',
        'wait_delivery',
        'wait_receive',
        'wait_evaluate',
        'refund',
        'completed',
        'cancelled'
      ];
      for (let index: number = 0; index < states.length; index++) {
        let order: Order = new Order(143 + index, [cartLine(0, 1000, 1, true)], states[index], 800 + index);

        expect(order.state).assertEqual(states[index]);
        expect(order.stateLabel()).assertEqual(labels[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0480
     * @tc.name      applicable_coupons_are_bounded_by_the_subtotal_048
     * @tc.desc      Verify applicable coupons are bounded by the subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('applicable_coupons_are_bounded_by_the_subtotal_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: applicable_coupons_are_bounded_by_the_subtotal_048');
      let cart: Cart = cartWith([cartLine(904, 50000, 1, true)]);
      let book: CouponBook = defaultCouponBook();
      // At 50000 cents C10, C20 and C0 qualify in declaration order, while C50's 100000 threshold does not.
      let usable: Coupon[] = book.applicable(cart.subtotal());
      expect(usable.length).assertEqual(3);
      let ids: string[] = [];
      for (let index: number = 0; index < usable.length; index++) {
        ids.push(usable[index].id);
      }
      expect(ids.indexOf('C20')).assertEqual(1);
      expect(ids.indexOf('C50')).assertEqual(-1);
      expect(ids.indexOf('C0')).assertEqual(2);
      expect(cart.payable(book).cents()).assertEqual(48000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0490
     * @tc.name      checkout_payable_is_order_total_minus_best_discount_049
     * @tc.desc      Verify checkout payable is order total minus best discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('checkout_payable_is_order_total_minus_best_discount_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: checkout_payable_is_order_total_minus_best_discount_049');
      let cart: Cart = cartFromCatalog([0, 5], [1, 2], [true, true]);
      let book: CouponBook = defaultCouponBook();
      let order: Order = new Order(144, cart.selectedLines(), OrderState.OBLIGATION);
      let discount: number = book.bestDiscount(cart.subtotal()).cents();
      expect(discount).assertEqual(5000);
      expect(cart.payable(book).cents()).assertEqual(order.total().cents() - discount);
      expect(cart.totalWithCoupon(book).cents()).assertEqual(discount);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0500
     * @tc.name      two_orders_from_one_cart_advance_independently_050
     * @tc.desc      Verify two orders from one cart advance independently.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('two_orders_from_one_cart_advance_independently_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: two_orders_from_one_cart_advance_independently_050');
      let cart: Cart = cartFromCatalog([0, 4], [1, 2], [true, true]);
      let first: Order = new Order(145, cart.selectedLines(), OrderState.OBLIGATION, 1100);
      let second: Order = new Order(146, cart.selectedLines(), OrderState.OBLIGATION, 1200);
      expect(first.total().cents()).assertEqual(second.total().cents());
      first.advance();
      first.advance();
      expect(first.state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(second.state).assertEqual(OrderState.OBLIGATION);
      let cancelled: boolean = second.cancel();
      expect(cancelled).assertTrue();
      expect(second.stateLabel()).assertEqual('cancelled');
      expect(first.total().cents()).assertEqual(second.total().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0510
     * @tc.name      advancing_one_order_updates_only_its_count_tab_051
     * @tc.desc      Verify advancing one order updates only its count tab.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('advancing_one_order_updates_only_its_count_tab_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: advancing_one_order_updates_only_its_count_tab_051');
      let first: Order = new Order(147, [cartLine(0, 10000, 1, true)], OrderState.OBLIGATION, 1300);
      let second: Order = new Order(148, [cartLine(1, 20000, 1, true)], OrderState.OBLIGATION, 1400);
      let center: OrderCenter = new OrderCenter([first, second]);
      expect(center.counts().obligation).assertEqual(2);
      first.advance();
      let after: OrderCounts = center.counts();
      expect(after.obligation).assertEqual(1);
      expect(after.waitDelivery).assertEqual(1);
      expect(after.total).assertEqual(2);
      // Advancing moves the tab but not the money: both orders still total 10000 + 20000.
      expect(center.spent().cents()).assertEqual(30000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0520
     * @tc.name      completed_order_cannot_advance_further_052
     * @tc.desc      Verify completed order cannot advance further.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('completed_order_cannot_advance_further_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: completed_order_cannot_advance_further_052');
      let cart: Cart = cartFromCatalog([2], [1], [true]);
      let order: Order = new Order(149, cart.selectedLines(), OrderState.OBLIGATION);
      for (let step: number = 0; step < 4; step++) {
        order.advance();
      }
      let advanced: boolean = order.advance();
      expect(advanced).assertFalse();
      expect(order.state).assertEqual(OrderState.COMPLETED);
      expect(order.stateLabel()).assertEqual('completed');
      expect(order.isFinal()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0530
     * @tc.name      restored_cart_edit_updates_the_resumed_checkout_amount_053
     * @tc.desc      Verify restored cart edit updates the resumed checkout amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('restored_cart_edit_updates_the_resumed_checkout_amount_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: restored_cart_edit_updates_the_resumed_checkout_amount_053');
      let cart: Cart = cartFromCatalog([0, 4], [1, 2], [true, true]);
      let restored: Cart = Cart.restore(cart.snapshot());
      // The restored copy gains two more phones (1 -> 3), and the source cart must stay at one unit.
      let updated: number = restored.increase(0, 2, PRODUCTS[0].stock);
      expect(updated).assertEqual(3);
      let expected: number = PRODUCTS[0].price.cents() * 3 + PRODUCTS[4].price.cents() * 2;
      expect(restored.subtotal().cents()).assertEqual(expected);
      let order: Order = new Order(150, restored.selectedLines(), OrderState.OBLIGATION);
      expect(order.total().cents()).assertEqual(expected);
      expect(cart.quantityOf(0)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0540
     * @tc.name      cancelling_one_order_keeps_the_other_counted_as_spent_054
     * @tc.desc      Verify cancelling one order keeps the other counted as spent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cancelling_one_order_keeps_the_other_counted_as_spent_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cancelling_one_order_keeps_the_other_counted_as_spent_054');
      let first: Order = new Order(151, [cartLine(0, 10000, 2, true)], OrderState.OBLIGATION, 1500);
      let second: Order = new Order(152, [cartLine(4, 8900, 1, true)], OrderState.OBLIGATION, 1600);
      let center: OrderCenter = new OrderCenter([first, second]);
      expect(first.cancel()).assertTrue();
      expect(center.spent().cents()).assertEqual(8900);
      expect(center.counts().cancelled).assertEqual(1);
      expect(center.counts().obligation).assertEqual(1);
      expect(center.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0550
     * @tc.name      coupon_wallet_serves_multiple_checkouts_unchanged_055
     * @tc.desc      Verify coupon wallet serves multiple checkouts unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('coupon_wallet_serves_multiple_checkouts_unchanged_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: coupon_wallet_serves_multiple_checkouts_unchanged_055');
      let first: Cart = cartWith([cartLine(905, 50000, 1, true)]);
      let second: Cart = cartWith([cartLine(906, 50000, 1, true)]);
      let book: CouponBook = defaultCouponBook();
      let sizeBefore: number = book.size();
      let firstPayable: Money = first.payable(book);
      let secondPayable: Money = second.payable(book);
      expect(firstPayable.cents()).assertEqual(secondPayable.cents());
      expect(firstPayable.cents()).assertEqual(48000);
      expect(book.size()).assertEqual(sizeBefore);
      expect(first.subtotal().equals(second.subtotal())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CHECKOUT_FLOW_0560
     * @tc.name      restored_cart_can_be_snapshotted_again_for_checkout_056
     * @tc.desc      Verify restored cart can be snapshotted again for checkout.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('restored_cart_can_be_snapshotted_again_for_checkout_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: restored_cart_can_be_snapshotted_again_for_checkout_056');
      let cart: Cart = cartFromCatalog([0, 2, 4], [1, 2, 3], [true, false, true]);
      let book: CouponBook = defaultCouponBook();
      let once: Cart = Cart.restore(cart.snapshot());
      let twice: Cart = Cart.restore(once.snapshot());
      expect(twice.distinctCount()).assertEqual(3);
      expect(twice.totalQuantity()).assertEqual(6);
      // After two restore cycles the checked quantities 1 + 3 still add up to four units.
      expect(twice.selectedQuantity()).assertEqual(4);
      expect((cartIds(twice)).length).assertEqual((cartIds(cart)).length);
      for (let __i3: number = 0; __i3 < (cartIds(cart)).length; __i3++) {
        expect((cartIds(twice))[__i3]).assertEqual((cartIds(cart))[__i3]);
      }
      expect(twice.subtotal().cents()).assertEqual(cart.subtotal().cents());
      expect(twice.payable(book).cents()).assertEqual(cart.payable(book).cents());
      let order: Order = new Order(153, twice.selectedLines(), OrderState.OBLIGATION);
      expect(order.total().cents()).assertEqual(cart.subtotal().cents());
    });
  });
}
