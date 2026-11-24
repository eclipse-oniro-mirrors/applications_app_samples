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

import { describe, beforeAll, expect, it, afterEach } from '@ohos/hypium';
import { yieldToEventLoop } from '../Shared/TestDriver';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CartLine, Order, OrderCenter, OrderCounts, OrderState } from '../Shared/ShopModel';
import { cartLine } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

const ALL_STATES: OrderState[] = [
  OrderState.OBLIGATION,
  OrderState.WAIT_DELIVERY,
  OrderState.WAIT_RECEIVE,
  OrderState.WAIT_EVALUATE,
  OrderState.REFUND,
  OrderState.COMPLETED,
  OrderState.CANCELLED
];

/** goodsId is id % 8; createdAt is caller-chosen so ordering is exact. */
function makeOrder(id: number, state: OrderState, cents: number, quantity: number,
  createdAt: number): Order {
  let lines: CartLine[] = [cartLine(id % 8, cents, quantity, true)];
  return new Order(id, lines, state, createdAt);
}

/** Fixed 517700 cents: 499900 x 1 plus 8900 x 2, 3 units. */
function makeTwoLineOrder(id: number, state: OrderState, createdAt: number): Order {
  let lines: CartLine[] = [
    cartLine(0, 499900, 1, true),
    cartLine(4, 8900, 2, true)
  ];
  return new Order(id, lines, state, createdAt);
}

export default function orderRefundTest() {
  describe('OrangeShoppingOrderRefund', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'order refund suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0010
     * @tc.name      refund_after_two_advances_marks_refund_001
     * @tc.desc      Verify refund after two advances marks refund.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_after_two_advances_marks_refund_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_after_two_advances_marks_refund_001');
      let order: Order = makeOrder(1101, OrderState.OBLIGATION, 19900, 2, 100);
      // OBLIGATION -> WAIT_DELIVERY -> WAIT_RECEIVE; the last step opens the refund window.
      order.advance();
      order.advance();
      expect(order.state).assertEqual(OrderState.WAIT_RECEIVE);
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0020
     * @tc.name      refund_after_two_advances_is_final_002
     * @tc.desc      Verify refund after two advances is final.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_after_two_advances_is_final_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_after_two_advances_is_final_002');
      let order: Order = makeOrder(1102, OrderState.OBLIGATION, 19900, 2, 100);
      order.advance();
      order.advance();
      order.refund();
      expect(order.isFinal()).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0030
     * @tc.name      refund_after_two_advances_label_is_refund_003
     * @tc.desc      Verify refund after two advances label is refund.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_after_two_advances_label_is_refund_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_after_two_advances_label_is_refund_003');
      let order: Order = makeOrder(1103, OrderState.OBLIGATION, 19900, 2, 100);
      order.advance();
      order.advance();
      order.refund();
      expect(order.stateLabel()).assertEqual('refund');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0040
     * @tc.name      refund_after_three_advances_marks_refund_004
     * @tc.desc      Verify refund after three advances marks refund.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_after_three_advances_marks_refund_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_after_three_advances_marks_refund_004');
      let order: Order = makeOrder(1104, OrderState.OBLIGATION, 29900, 1, 200);
      order.advance();
      order.advance();
      order.advance();
      expect(order.state).assertEqual(OrderState.WAIT_EVALUATE);
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0050
     * @tc.name      refund_after_three_advances_is_final_005
     * @tc.desc      Verify refund after three advances is final.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_after_three_advances_is_final_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_after_three_advances_is_final_005');
      let order: Order = makeOrder(1105, OrderState.OBLIGATION, 29900, 1, 200);
      order.advance();
      order.advance();
      order.advance();
      order.refund();
      expect(order.isFinal()).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0060
     * @tc.name      refund_after_three_advances_label_is_refund_006
     * @tc.desc      Verify refund after three advances label is refund.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_after_three_advances_label_is_refund_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_after_three_advances_label_is_refund_006');
      let order: Order = makeOrder(1106, OrderState.OBLIGATION, 29900, 1, 200);
      order.advance();
      order.advance();
      order.advance();
      order.refund();
      expect(order.stateLabel()).assertEqual('refund');
      expect(order.canRefund() === false).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0070
     * @tc.name      refund_window_is_open_before_refund_after_receipt_007
     * @tc.desc      Verify refund window is open before refund after receipt.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_window_is_open_before_refund_after_receipt_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_window_is_open_before_refund_after_receipt_007');
      let order: Order = makeOrder(1107, OrderState.OBLIGATION, 39900, 1, 300);
      order.advance();
      order.advance();
      expect(order.canRefund()).assertTrue();
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0080
     * @tc.name      refund_window_is_open_before_refund_after_evaluation_008
     * @tc.desc      Verify refund window is open before refund after evaluation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_window_is_open_before_refund_after_evaluation_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_window_is_open_before_refund_after_evaluation_008');
      let order: Order = makeOrder(1108, OrderState.OBLIGATION, 39900, 1, 300);
      order.advance();
      order.advance();
      order.advance();
      expect(order.canRefund()).assertTrue();
      expect(order.refund()).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0090
     * @tc.name      refund_from_obligation_is_rejected_009
     * @tc.desc      Verify refund from obligation is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_from_obligation_is_rejected_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_from_obligation_is_rejected_009');
      let order: Order = makeOrder(1109, OrderState.OBLIGATION, 49900, 2, 400);
      let refunded: boolean = order.refund();
      expect(refunded).assertFalse();
      expect(order.state).assertEqual(OrderState.OBLIGATION);
      expect(order.stateLabel()).assertEqual('obligation');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0100
     * @tc.name      refund_from_wait_delivery_is_rejected_010
     * @tc.desc      Verify refund from wait delivery is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_from_wait_delivery_is_rejected_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_from_wait_delivery_is_rejected_010');
      let order: Order = makeOrder(1110, OrderState.OBLIGATION, 49900, 2, 400);
      order.advance();
      let refunded: boolean = order.refund();
      expect(refunded).assertFalse();
      expect(order.state).assertEqual(OrderState.WAIT_DELIVERY);
      expect(order.stateLabel()).assertEqual('wait_delivery');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0110
     * @tc.name      refund_from_completed_is_rejected_011
     * @tc.desc      Verify refund from completed is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_from_completed_is_rejected_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_from_completed_is_rejected_011');
      let order: Order = makeOrder(1111, OrderState.OBLIGATION, 49900, 2, 400);
      // Four advances cross delivery, receipt and evaluation to land on COMPLETED,
      // one state past the last refundable one.
      for (let step: number = 0; step < 4; step++) {
        order.advance();
      }
      let refunded: boolean = order.refund();
      expect(refunded).assertFalse();
      expect(order.state).assertEqual(OrderState.COMPLETED);
      expect(order.stateLabel()).assertEqual('completed');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0120
     * @tc.name      refund_from_cancelled_is_rejected_012
     * @tc.desc      Verify refund from cancelled is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_from_cancelled_is_rejected_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_from_cancelled_is_rejected_012');
      let order: Order = makeOrder(1112, OrderState.OBLIGATION, 49900, 2, 400);
      // cancel() is allowed from OBLIGATION, and CANCELLED is final, so the refund below is refused.
      order.cancel();
      let refunded: boolean = order.refund();
      expect(refunded).assertFalse();
      expect(order.state === OrderState.CANCELLED).assertTrue();
      expect(order.stateLabel()).assertEqual('cancelled');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0130
     * @tc.name      refund_from_refund_is_rejected_013
     * @tc.desc      Verify refund from refund is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_from_refund_is_rejected_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_from_refund_is_rejected_013');
      let order: Order = makeOrder(1113, OrderState.OBLIGATION, 49900, 2, 400);
      order.advance();
      order.advance();
      expect(order.refund()).assertTrue();
      let refundedAgain: boolean = order.refund();
      expect(refundedAgain).assertFalse();
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0140
     * @tc.name      refund_failure_keeps_label_for_each_ineligible_state_014
     * @tc.desc      Verify refund failure keeps label for each ineligible state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_failure_keeps_label_for_each_ineligible_state_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_failure_keeps_label_for_each_ineligible_state_014');
      // Five ineligible states are swept with their labels, so a refused refund may only
      // pass when it leaves both the state and the label untouched.
      let states: OrderState[] = [
        OrderState.OBLIGATION,
        OrderState.WAIT_DELIVERY,
        OrderState.COMPLETED,
        OrderState.CANCELLED,
        OrderState.REFUND
      ];
      let labels: string[] = ['obligation', 'wait_delivery', 'completed', 'cancelled', 'refund'];
      for (let index: number = 0; index < states.length; index++) {
        let order: Order = makeOrder(1120 + index, states[index], 10000, 1, 500 + index);
        expect(order.refund()).assertFalse();
        expect(order.stateLabel()).assertEqual(labels[index]);
        expect(order.state).assertEqual(states[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0150
     * @tc.name      refund_failure_keeps_total_015
     * @tc.desc      Verify refund failure keeps total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_failure_keeps_total_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_failure_keeps_total_015');
      let order: Order = makeTwoLineOrder(1130, OrderState.OBLIGATION, 600);
      let before: number = order.total().cents();
      expect(order.refund()).assertFalse();
      expect(order.total().cents()).assertEqual(before);
      // The fixture is 499900 x 1 + 8900 x 2 = 517700, and a refused refund must not touch it.
      expect(order.total().cents()).assertEqual(517700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0160
     * @tc.name      refund_failure_keeps_lines_016
     * @tc.desc      Verify refund failure keeps lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_failure_keeps_lines_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_failure_keeps_lines_016');
      let order: Order = makeTwoLineOrder(1131, OrderState.WAIT_DELIVERY, 600);
      expect(order.refund()).assertFalse();
      expect(order.lines.length).assertEqual(2);
      expect(order.lines[0].unitPriceCents).assertEqual(499900);
      expect(order.lines[1].quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0170
     * @tc.name      refunded_order_rejects_advance_017
     * @tc.desc      Verify refunded order rejects advance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_rejects_advance_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_rejects_advance_017');
      let order: Order = makeOrder(1132, OrderState.WAIT_RECEIVE, 25000, 1, 700);
      order.refund();
      let moved: boolean = order.advance();
      expect(moved).assertFalse();
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0180
     * @tc.name      refunded_order_rejects_repeated_advance_018
     * @tc.desc      Verify refunded order rejects repeated advance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_rejects_repeated_advance_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_rejects_repeated_advance_018');
      let order: Order = makeOrder(1133, OrderState.WAIT_EVALUATE, 25000, 1, 700);
      order.refund();
      // REFUND is final, so each of the three advance calls must be refused rather than
      // creeping back into the state machine.
      for (let attempt: number = 0; attempt < 3; attempt++) {
        expect(order.advance()).assertFalse();
      }
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0190
     * @tc.name      refunded_order_rejects_cancel_019
     * @tc.desc      Verify refunded order rejects cancel.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_rejects_cancel_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_rejects_cancel_019');
      let order: Order = makeOrder(1134, OrderState.WAIT_RECEIVE, 25000, 1, 700);
      order.refund();
      let cancelled: boolean = order.cancel();
      expect(cancelled).assertFalse();
      expect(order.state === OrderState.REFUND).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0200
     * @tc.name      refunded_order_rejects_repeated_cancel_020
     * @tc.desc      Verify refunded order rejects repeated cancel.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_rejects_repeated_cancel_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_rejects_repeated_cancel_020');
      let order: Order = makeOrder(1135, OrderState.WAIT_EVALUATE, 25000, 1, 700);
      order.refund();
      for (let attempt: number = 0; attempt < 3; attempt++) {
        expect(order.cancel()).assertFalse();
      }
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.stateLabel()).assertEqual('refund');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0210
     * @tc.name      refunded_order_can_refund_is_false_021
     * @tc.desc      Verify refunded order can refund is false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_can_refund_is_false_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_can_refund_is_false_021');
      let order: Order = makeOrder(1136, OrderState.WAIT_RECEIVE, 25000, 1, 700);
      order.refund();
      expect(order.canRefund()).assertFalse();
      expect(order.canCancel()).assertFalse();
      expect(order.isFinal()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0220
     * @tc.name      refunded_order_keeps_total_022
     * @tc.desc      Verify refunded order keeps total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_keeps_total_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_keeps_total_022');
      let order: Order = makeTwoLineOrder(1137, OrderState.WAIT_RECEIVE, 800);
      let before: number = order.total().cents();
      order.refund();
      expect(order.total().cents()).assertEqual(before);
      expect(order.total().cents()).assertEqual(517700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0230
     * @tc.name      refunded_order_keeps_quantity_023
     * @tc.desc      Verify refunded order keeps quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_keeps_quantity_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_keeps_quantity_023');
      let order: Order = makeTwoLineOrder(1138, OrderState.WAIT_EVALUATE, 800);
      let before: number = order.quantity();
      order.refund();
      expect(order.quantity()).assertEqual(before);
      // The fixture lines carry 1 and 2 units, so the refunded order still holds 3.
      expect(order.quantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0240
     * @tc.name      refunded_order_keeps_line_count_024
     * @tc.desc      Verify refunded order keeps line count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_keeps_line_count_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_keeps_line_count_024');
      let order: Order = makeTwoLineOrder(1139, OrderState.WAIT_RECEIVE, 800);
      order.refund();
      expect(order.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0250
     * @tc.name      refunded_order_keeps_line_prices_025
     * @tc.desc      Verify refunded order keeps line prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_keeps_line_prices_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_keeps_line_prices_025');
      let order: Order = makeTwoLineOrder(1140, OrderState.WAIT_RECEIVE, 800);
      order.refund();
      expect(order.lines[0].unitPriceCents).assertEqual(499900);
      expect(order.lines[1].unitPriceCents).assertEqual(8900);
      expect(order.lines[1].quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0260
     * @tc.name      refunded_order_keeps_identity_026
     * @tc.desc      Verify refunded order keeps identity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_keeps_identity_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_keeps_identity_026');
      let order: Order = makeOrder(1141, OrderState.WAIT_EVALUATE, 15900, 2, 900);
      order.refund();
      expect(order.id).assertEqual(1141);
      expect(order.createdAt).assertEqual(900);
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0270
     * @tc.name      refund_does_not_rebuild_lines_027
     * @tc.desc      Verify refund does not rebuild lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_does_not_rebuild_lines_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_does_not_rebuild_lines_027');
      let order: Order = makeTwoLineOrder(1142, OrderState.WAIT_RECEIVE, 900);
      let lineBefore: CartLine = order.lines[0];
      order.refund();
      // refund() only rewrites the state field, so the identical CartLine instance must
      // still sit at index 0.
      expect(lineBefore === order.lines[0]).assertTrue();
      expect(order.lines[0].quantity).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0280
     * @tc.name      refunded_order_still_in_center_all_028
     * @tc.desc      Verify refunded order still in center all.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_still_in_center_all_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_still_in_center_all_028');
      let order: Order = makeOrder(1143, OrderState.WAIT_RECEIVE, 30000, 1, 1000);
      order.refund();
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.all().length).assertEqual(1);
      expect(center.all()[0].id).assertEqual(1143);
      expect(center.all()[0].state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0290
     * @tc.name      refunded_center_size_unchanged_029
     * @tc.desc      Verify refunded center size unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_center_size_unchanged_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_center_size_unchanged_029');
      let order: Order = makeOrder(1144, OrderState.WAIT_RECEIVE, 30000, 1, 1000);
      let center: OrderCenter = new OrderCenter([order]);
      let before: number = center.size();
      order.refund();
      expect(center.size()).assertEqual(before);
      expect(center.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0300
     * @tc.name      refunded_order_appears_in_refund_tab_030
     * @tc.desc      Verify refunded order appears in refund tab.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_appears_in_refund_tab_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_appears_in_refund_tab_030');
      let order: Order = makeOrder(1145, OrderState.WAIT_RECEIVE, 30000, 1, 1000);
      order.refund();
      let center: OrderCenter = new OrderCenter([order]);
      let refunds: Order[] = center.byState(OrderState.REFUND);
      expect(refunds.length).assertEqual(1);
      expect(refunds[0].id).assertEqual(1145);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0310
     * @tc.name      refunded_order_absent_from_wait_receive_tab_031
     * @tc.desc      Verify refunded order absent from wait receive tab.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_absent_from_wait_receive_tab_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_absent_from_wait_receive_tab_031');
      let order: Order = makeOrder(1146, OrderState.WAIT_RECEIVE, 30000, 1, 1000);
      order.refund();
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.byState(OrderState.WAIT_RECEIVE).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0320
     * @tc.name      refunded_order_absent_from_wait_evaluate_tab_032
     * @tc.desc      Verify refunded order absent from wait evaluate tab.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_absent_from_wait_evaluate_tab_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_absent_from_wait_evaluate_tab_032');
      let order: Order = makeOrder(1147, OrderState.WAIT_EVALUATE, 30000, 1, 1000);
      order.refund();
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.byState(OrderState.WAIT_EVALUATE).length).assertEqual(0);
      expect(center.byState(OrderState.REFUND).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0330
     * @tc.name      refunded_order_excluded_from_spent_033
     * @tc.desc      Verify refunded order excluded from spent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_excluded_from_spent_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_excluded_from_spent_033');
      let refunded: Order = makeOrder(1148, OrderState.WAIT_RECEIVE, 70000, 2, 1000);
      let active: Order = makeOrder(1149, OrderState.OBLIGATION, 10000, 1, 1100);
      refunded.refund();
      let center: OrderCenter = new OrderCenter([refunded, active]);
      // spent() skips REFUND and CANCELLED: only the 10000-cent obligation counts, while size stays 2.
      expect(center.spent().cents()).assertEqual(10000);
      expect(center.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0340
     * @tc.name      refunded_order_alone_spent_is_zero_034
     * @tc.desc      Verify refunded order alone spent is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_alone_spent_is_zero_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_alone_spent_is_zero_034');
      let order: Order = makeOrder(1150, OrderState.WAIT_RECEIVE, 88000, 3, 1000);
      order.refund();
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.spent().isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0350
     * @tc.name      refund_exclusion_equals_order_total_035
     * @tc.desc      Verify refund exclusion equals order total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_exclusion_equals_order_total_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_exclusion_equals_order_total_035');
      let order: Order = makeOrder(1151, OrderState.WAIT_EVALUATE, 12300, 4, 1000);
      let center: OrderCenter = new OrderCenter([order]);
      let before: number = center.spent().cents();
      order.refund();
      let after: number = center.spent().cents();
      expect(before - after).assertEqual(order.total().cents());
      // 4 units at 12300 cents give 49200, the exact amount spent() loses when the order flips.
      expect(order.total().cents()).assertEqual(49200);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0360
     * @tc.name      refunded_order_counted_in_counts_total_036
     * @tc.desc      Verify refunded order counted in counts total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_counted_in_counts_total_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_counted_in_counts_total_036');
      let order: Order = makeOrder(1152, OrderState.WAIT_RECEIVE, 15000, 1, 1000);
      order.refund();
      let center: OrderCenter = new OrderCenter([order]);
      let counts: OrderCounts = center.counts();
      expect(counts.total).assertEqual(1);
      expect(counts.total).assertEqual(center.size());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0370
     * @tc.name      refunded_order_increments_refund_count_037
     * @tc.desc      Verify refunded order increments refund count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_increments_refund_count_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_increments_refund_count_037');
      let order: Order = makeOrder(1153, OrderState.WAIT_RECEIVE, 15000, 1, 1000);
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.counts().refund).assertEqual(0);
      order.refund();
      expect(center.counts().refund).assertEqual(1);
      expect(center.counts().waitReceive).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0380
     * @tc.name      refunding_one_order_keeps_sibling_spent_038
     * @tc.desc      Verify refunding one order keeps sibling spent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunding_one_order_keeps_sibling_spent_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunding_one_order_keeps_sibling_spent_038');
      let first: Order = makeOrder(1154, OrderState.WAIT_RECEIVE, 20000, 1, 1000);
      let second: Order = makeOrder(1155, OrderState.COMPLETED, 30000, 1, 1100);
      let center: OrderCenter = new OrderCenter([first, second]);
      first.refund();
      expect(center.spent().cents()).assertEqual(30000);
      expect(center.spent().cents()).assertEqual(second.total().cents());
      expect(center.counts().refund).assertEqual(1);
      expect(center.counts().completed).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0390
     * @tc.name      two_refunded_orders_are_both_excluded_039
     * @tc.desc      Verify two refunded orders are both excluded.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('two_refunded_orders_are_both_excluded_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: two_refunded_orders_are_both_excluded_039');
      let first: Order = makeOrder(1156, OrderState.WAIT_RECEIVE, 20000, 1, 1000);
      let second: Order = makeOrder(1157, OrderState.WAIT_EVALUATE, 30000, 1, 1100);
      first.refund();
      second.refund();
      let center: OrderCenter = new OrderCenter([first, second]);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().refund).assertEqual(2);
      expect(center.counts().total).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0400
     * @tc.name      refunded_zero_total_order_spent_is_zero_040
     * @tc.desc      Verify refunded zero total order spent is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_zero_total_order_spent_is_zero_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_zero_total_order_spent_is_zero_040');
      let order: Order = makeOrder(1158, OrderState.WAIT_RECEIVE, 0, 5, 1000);
      order.refund();
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().refund).assertEqual(1);
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.isFinal()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0410
     * @tc.name      refunded_order_can_be_the_latest_041
     * @tc.desc      Verify refunded order can be the latest.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_can_be_the_latest_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_can_be_the_latest_041');
      let old: Order = makeOrder(1159, OrderState.OBLIGATION, 10000, 1, 100);
      let newest: Order = makeOrder(1160, OrderState.WAIT_RECEIVE, 20000, 1, 900);
      newest.refund();
      let center: OrderCenter = new OrderCenter([old, newest]);
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(1160);
        expect(latest.state).assertEqual(OrderState.REFUND);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0420
     * @tc.name      refund_failure_from_wait_delivery_keeps_spent_042
     * @tc.desc      Verify refund failure from wait delivery keeps spent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_failure_from_wait_delivery_keeps_spent_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_failure_from_wait_delivery_keeps_spent_042');
      let order: Order = makeOrder(1161, OrderState.OBLIGATION, 41000, 2, 1000);
      order.advance();
      expect(order.refund()).assertFalse();
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().cents()).assertEqual(82000);
      expect(center.counts().waitDelivery).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0430
     * @tc.name      refund_failure_from_completed_keeps_spent_043
     * @tc.desc      Verify refund failure from completed keeps spent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_failure_from_completed_keeps_spent_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_failure_from_completed_keeps_spent_043');
      let order: Order = makeOrder(1162, OrderState.OBLIGATION, 51000, 1, 1000);
      for (let step: number = 0; step < 4; step++) {
        order.advance();
      }
      expect(order.refund()).assertFalse();
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().cents()).assertEqual(51000);
      expect(center.counts().completed).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0440
     * @tc.name      cancel_then_refund_failure_stays_excluded_044
     * @tc.desc      Verify cancel then refund failure stays excluded.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cancel_then_refund_failure_stays_excluded_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cancel_then_refund_failure_stays_excluded_044');
      let order: Order = makeOrder(1163, OrderState.OBLIGATION, 61000, 1, 1000);
      order.cancel();
      expect(order.refund()).assertFalse();
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().cancelled).assertEqual(1);
      expect(center.counts().refund).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0450
     * @tc.name      refunded_center_counts_sum_equals_size_045
     * @tc.desc      Verify refunded center counts sum equals size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_center_counts_sum_equals_size_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_center_counts_sum_equals_size_045');
      let first: Order = makeOrder(1164, OrderState.WAIT_RECEIVE, 10000, 1, 1000);
      let second: Order = makeOrder(1165, OrderState.COMPLETED, 20000, 1, 1100);
      let third: Order = makeOrder(1166, OrderState.OBLIGATION, 30000, 1, 1200);
      first.refund();
      let center: OrderCenter = new OrderCenter([first, second, third]);
      let counts: OrderCounts = center.counts();
      let sum: number = counts.obligation + counts.waitDelivery + counts.waitReceive +
        counts.waitEvaluate + counts.refund + counts.completed + counts.cancelled;
      // Each order falls in exactly one bucket, so the seven counters must add up to size 3.
      expect(sum).assertEqual(center.size());
      expect(counts.total).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0460
     * @tc.name      refunded_order_by_state_only_refund_entries_046
     * @tc.desc      Verify refunded order by state only refund entries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_by_state_only_refund_entries_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_by_state_only_refund_entries_046');
      let order: Order = makeOrder(1167, OrderState.WAIT_EVALUATE, 10000, 1, 1000);
      order.refund();
      let center: OrderCenter = new OrderCenter([order]);
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        let list: Order[] = center.byState(ALL_STATES[index]);
        if (ALL_STATES[index] === OrderState.REFUND) {
          expect(list.length).assertEqual(1);
        } else {
          expect(list.length).assertEqual(0);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0470
     * @tc.name      refund_after_wait_evaluate_updates_center_counts_047
     * @tc.desc      Verify refund after wait evaluate updates center counts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_after_wait_evaluate_updates_center_counts_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_after_wait_evaluate_updates_center_counts_047');
      let order: Order = makeOrder(1168, OrderState.OBLIGATION, 33000, 2, 1000);
      order.advance();
      order.advance();
      order.advance();
      let center: OrderCenter = new OrderCenter([order]);
      // Three advances bring the order to WAIT_EVALUATE; the refund then moves its bucket
      // to refund and zeroes spent.
      expect(center.counts().waitEvaluate).assertEqual(1);
      order.refund();
      expect(center.counts().waitEvaluate).assertEqual(0);
      expect(center.counts().refund).assertEqual(1);
      expect(center.spent().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0480
     * @tc.name      refund_from_wait_receive_directly_marks_refund_048
     * @tc.desc      Verify refund from wait receive directly marks refund.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_from_wait_receive_directly_marks_refund_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_from_wait_receive_directly_marks_refund_048');
      let order: Order = makeOrder(1170, OrderState.WAIT_RECEIVE, 25000, 2, 1200);
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.isFinal()).assertTrue();
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0490
     * @tc.name      refund_from_wait_evaluate_directly_marks_refund_049
     * @tc.desc      Verify refund from wait evaluate directly marks refund.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_from_wait_evaluate_directly_marks_refund_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_from_wait_evaluate_directly_marks_refund_049');
      let order: Order = makeOrder(1171, OrderState.WAIT_EVALUATE, 35000, 1, 1200);
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.stateLabel()).assertEqual('refund');
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0500
     * @tc.name      refund_failure_from_obligation_keeps_spent_050
     * @tc.desc      Verify refund failure from obligation keeps spent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_failure_from_obligation_keeps_spent_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_failure_from_obligation_keeps_spent_050');
      let order: Order = makeOrder(1172, OrderState.OBLIGATION, 27000, 3, 1200);
      expect(order.refund()).assertFalse();
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().cents()).assertEqual(81000);
      expect(center.counts().obligation).assertEqual(1);
      expect(center.counts().refund).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0510
     * @tc.name      second_refund_failure_keeps_spent_zero_051
     * @tc.desc      Verify second refund failure keeps spent zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('second_refund_failure_keeps_spent_zero_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: second_refund_failure_keeps_spent_zero_051');
      let order: Order = makeOrder(1173, OrderState.WAIT_RECEIVE, 18000, 2, 1200);
      expect(order.refund()).assertTrue();
      let second: boolean = order.refund();
      expect(second).assertFalse();
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().refund).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0520
     * @tc.name      refund_failure_keeps_identity_052
     * @tc.desc      Verify refund failure keeps identity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_failure_keeps_identity_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_failure_keeps_identity_052');
      let order: Order = makeOrder(1174, OrderState.COMPLETED, 12000, 1, 1300);
      expect(order.refund()).assertFalse();
      expect(order.id).assertEqual(1174);
      expect(order.createdAt).assertEqual(1300);
      expect(order.state).assertEqual(OrderState.COMPLETED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0530
     * @tc.name      refund_success_keeps_line_selection_flags_053
     * @tc.desc      Verify refund success keeps line selection flags.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_success_keeps_line_selection_flags_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_success_keeps_line_selection_flags_053');
      let lines: CartLine[] = [cartLine(0, 10000, 1, true), cartLine(1, 20000, 2, false)];
      let order: Order = new Order(1175, lines, OrderState.WAIT_RECEIVE, 1300);
      order.refund();
      expect(order.lines[0].selected).assertTrue();
      expect(order.lines[1].selected).assertFalse();
      expect(order.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0540
     * @tc.name      refund_failure_keeps_line_selection_flags_054
     * @tc.desc      Verify refund failure keeps line selection flags.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_failure_keeps_line_selection_flags_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_failure_keeps_line_selection_flags_054');
      let lines: CartLine[] = [cartLine(0, 10000, 1, false), cartLine(1, 20000, 2, true)];
      let order: Order = new Order(1176, lines, OrderState.WAIT_DELIVERY, 1300);
      expect(order.refund()).assertFalse();
      expect(order.lines[0].selected).assertFalse();
      expect(order.lines[1].selected).assertTrue();
      expect(order.state).assertEqual(OrderState.WAIT_DELIVERY);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0550
     * @tc.name      refunded_order_total_matches_line_sum_055
     * @tc.desc      Verify refunded order total matches line sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_total_matches_line_sum_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_total_matches_line_sum_055');
      let order: Order = makeTwoLineOrder(1177, OrderState.WAIT_RECEIVE, 1400);
      order.refund();
      let expected: number = 0;
      for (let index: number = 0; index < order.lines.length; index++) {
        expected += order.lines[index].lineTotal().cents();
      }
      expect(order.total().cents()).assertEqual(expected);
      expect(expected).assertEqual(517700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0560
     * @tc.name      refunded_center_all_holds_two_orders_056
     * @tc.desc      Verify refunded center all holds two orders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_center_all_holds_two_orders_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_center_all_holds_two_orders_056');
      let refunded: Order = makeOrder(1178, OrderState.WAIT_RECEIVE, 10000, 1, 1400);
      let other: Order = makeOrder(1179, OrderState.OBLIGATION, 20000, 1, 1500);
      refunded.refund();
      let center: OrderCenter = new OrderCenter([refunded, other]);
      expect(center.all().length).assertEqual(2);
      expect(center.all()[0].id).assertEqual(1178);
      expect(center.all()[1].id).assertEqual(1179);
      expect(center.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0570
     * @tc.name      same_id_orders_refund_independently_057
     * @tc.desc      Verify same id orders refund independently.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('same_id_orders_refund_independently_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: same_id_orders_refund_independently_057');
      let first: Order = makeOrder(1180, OrderState.WAIT_RECEIVE, 10000, 1, 1400);
      let second: Order = makeOrder(1180, OrderState.WAIT_RECEIVE, 10000, 1, 1400);
      first.refund();
      expect(first.state).assertEqual(OrderState.REFUND);
      expect(second.state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(second.isFinal()).assertFalse();
      expect(first.id).assertEqual(second.id);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0580
     * @tc.name      refund_then_sibling_order_still_advances_058
     * @tc.desc      Verify refund then sibling order still advances.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_then_sibling_order_still_advances_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_then_sibling_order_still_advances_058');
      let refunded: Order = makeOrder(1181, OrderState.WAIT_RECEIVE, 10000, 1, 1400);
      let sibling: Order = makeOrder(1182, OrderState.OBLIGATION, 20000, 1, 1500);
      refunded.refund();
      // Refunding one order must not block another: three advances take the sibling from
      // OBLIGATION all the way to COMPLETED.
      expect(sibling.advance()).assertTrue();
      sibling.advance();
      sibling.advance();
      sibling.advance();
      expect(sibling.state).assertEqual(OrderState.COMPLETED);
      expect(refunded.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0590
     * @tc.name      refund_after_receipt_with_zero_quantity_line_059
     * @tc.desc      Verify refund after receipt with zero quantity line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_after_receipt_with_zero_quantity_line_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_after_receipt_with_zero_quantity_line_059');
      let order: Order = makeOrder(1183, OrderState.WAIT_RECEIVE, 19900, 0, 1400);
      expect(order.quantity()).assertEqual(0);
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
      // A quantity of 0 keeps total() at 0, yet the refund still succeeds: eligibility
      // depends on the state, not the amount.
      expect(order.total().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0600
     * @tc.name      refund_empty_order_after_receipt_060
     * @tc.desc      Verify refund empty order after receipt.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_empty_order_after_receipt_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_empty_order_after_receipt_060');
      let order: Order = new Order(1184, [], OrderState.WAIT_RECEIVE, 1400);
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.lines.length).assertEqual(0);
      expect(order.isFinal()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0610
     * @tc.name      refund_after_evaluation_with_large_amount_061
     * @tc.desc      Verify refund after evaluation with large amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_after_evaluation_with_large_amount_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_after_evaluation_with_large_amount_061');
      let order: Order = makeOrder(1185, OrderState.WAIT_EVALUATE, 90000000, 20, 1400);
      let center: OrderCenter = new OrderCenter([order]);
      // 20 units at 90000000 cents reach 1.8 billion, past the signed 32-bit range,
      // so the amount must survive as a plain number.
      expect(center.spent().cents()).assertEqual(1800000000);
      expect(order.refund()).assertTrue();
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().refund).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0620
     * @tc.name      two_refunded_orders_keep_insertion_order_in_tab_062
     * @tc.desc      Verify two refunded orders keep insertion order in tab.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('two_refunded_orders_keep_insertion_order_in_tab_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: two_refunded_orders_keep_insertion_order_in_tab_062');
      let first: Order = makeOrder(1186, OrderState.WAIT_RECEIVE, 10000, 1, 1400);
      let second: Order = makeOrder(1187, OrderState.WAIT_RECEIVE, 20000, 1, 1500);
      first.refund();
      second.refund();
      let center: OrderCenter = new OrderCenter([first, second]);
      let list: Order[] = center.byState(OrderState.REFUND);
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1186);
      expect(list[1].id).assertEqual(1187);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0630
     * @tc.name      refund_one_of_three_updates_only_its_counts_063
     * @tc.desc      Verify refund one of three updates only its counts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_one_of_three_updates_only_its_counts_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_one_of_three_updates_only_its_counts_063');
      let first: Order = makeOrder(1188, OrderState.WAIT_RECEIVE, 10000, 1, 1400);
      let second: Order = makeOrder(1189, OrderState.OBLIGATION, 20000, 1, 1500);
      let third: Order = makeOrder(1190, OrderState.COMPLETED, 30000, 1, 1600);
      let center: OrderCenter = new OrderCenter([first, second, third]);
      first.refund();
      let counts: OrderCounts = center.counts();
      expect(counts.refund).assertEqual(1);
      expect(counts.obligation).assertEqual(1);
      expect(counts.completed).assertEqual(1);
      expect(counts.waitReceive).assertEqual(0);
      expect(counts.total).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0640
     * @tc.name      refund_exclusion_with_two_active_orders_064
     * @tc.desc      Verify refund exclusion with two active orders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_exclusion_with_two_active_orders_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_exclusion_with_two_active_orders_064');
      let refunded: Order = makeOrder(1191, OrderState.WAIT_RECEIVE, 40000, 1, 1400);
      let activeA: Order = makeOrder(1192, OrderState.OBLIGATION, 10000, 1, 1500);
      let activeB: Order = makeOrder(1193, OrderState.COMPLETED, 25000, 1, 1600);
      let center: OrderCenter = new OrderCenter([refunded, activeA, activeB]);
      // 75000 is 40000 + 10000 + 25000; refunding the 40000 order must leave exactly 35000
      // from the two active ones.
      expect(center.spent().cents()).assertEqual(75000);
      refunded.refund();
      expect(center.spent().cents()).assertEqual(35000);
      expect(center.spent().cents()).assertEqual(activeA.total().cents() + activeB.total().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0650
     * @tc.name      refunded_order_spent_zero_when_sibling_is_zero_price_065
     * @tc.desc      Verify refunded order spent zero when sibling is zero price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_spent_zero_when_sibling_is_zero_price_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_spent_zero_when_sibling_is_zero_price_065');
      let refunded: Order = makeOrder(1194, OrderState.WAIT_RECEIVE, 50000, 1, 1400);
      let free: Order = makeOrder(1195, OrderState.COMPLETED, 0, 3, 1500);
      refunded.refund();
      let center: OrderCenter = new OrderCenter([refunded, free]);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().refund).assertEqual(1);
      expect(center.counts().completed).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0660
     * @tc.name      refund_success_keeps_line_goods_ids_066
     * @tc.desc      Verify refund success keeps line goods ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_success_keeps_line_goods_ids_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_success_keeps_line_goods_ids_066');
      let order: Order = makeTwoLineOrder(1196, OrderState.WAIT_RECEIVE, 1400);
      let idsBefore: number[] = [order.lines[0].goodsId, order.lines[1].goodsId];
      order.refund();
      expect(order.lines[0].goodsId).assertEqual(idsBefore[0]);
      expect(order.lines[1].goodsId).assertEqual(idsBefore[1]);
      expect(idsBefore[0] === idsBefore[1]).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0670
     * @tc.name      refund_success_keeps_line_quantities_067
     * @tc.desc      Verify refund success keeps line quantities.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_success_keeps_line_quantities_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_success_keeps_line_quantities_067');
      let order: Order = makeTwoLineOrder(1197, OrderState.WAIT_EVALUATE, 1400);
      let quantitiesBefore: number[] = [order.lines[0].quantity, order.lines[1].quantity];
      order.refund();
      for (let index: number = 0; index < quantitiesBefore.length; index++) {
        expect(order.lines[index].quantity).assertEqual(quantitiesBefore[index]);
      }
      expect(order.lines[1].quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0680
     * @tc.name      refund_failure_keeps_quantity_068
     * @tc.desc      Verify refund failure keeps quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_failure_keeps_quantity_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_failure_keeps_quantity_068');
      let order: Order = makeTwoLineOrder(1198, OrderState.WAIT_DELIVERY, 1400);
      let before: number = order.quantity();
      expect(order.refund()).assertFalse();
      expect(order.quantity()).assertEqual(before);
      expect(order.quantity()).assertEqual(3);
      expect(order.state).assertEqual(OrderState.WAIT_DELIVERY);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0690
     * @tc.name      refunded_order_spent_zero_with_cancelled_sibling_069
     * @tc.desc      Verify refunded order spent zero with cancelled sibling.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_spent_zero_with_cancelled_sibling_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_spent_zero_with_cancelled_sibling_069');
      let refunded: Order = makeOrder(1199, OrderState.WAIT_RECEIVE, 30000, 1, 1400);
      let cancelled: Order = makeOrder(1200, OrderState.OBLIGATION, 20000, 1, 1500);
      cancelled.cancel();
      refunded.refund();
      let center: OrderCenter = new OrderCenter([refunded, cancelled]);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().refund).assertEqual(1);
      expect(center.counts().cancelled).assertEqual(1);
      expect(center.counts().total).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0700
     * @tc.name      refund_one_of_two_same_price_orders_070
     * @tc.desc      Verify refund one of two same price orders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_one_of_two_same_price_orders_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_one_of_two_same_price_orders_070');
      let first: Order = makeOrder(1201, OrderState.WAIT_RECEIVE, 15000, 2, 1400);
      let second: Order = makeOrder(1202, OrderState.WAIT_RECEIVE, 15000, 2, 1500);
      let center: OrderCenter = new OrderCenter([first, second]);
      // Each order is 2 units at 15000 = 30000, so two total 60000 and one refund halves it.
      expect(center.spent().cents()).assertEqual(60000);
      first.refund();
      expect(center.spent().cents()).assertEqual(30000);
      expect(center.spent().cents()).assertEqual(second.total().cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0710
     * @tc.name      refunded_order_latest_is_not_the_refunded_one_071
     * @tc.desc      Verify refunded order latest is not the refunded one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_latest_is_not_the_refunded_one_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_latest_is_not_the_refunded_one_071');
      let refunded: Order = makeOrder(1203, OrderState.WAIT_RECEIVE, 10000, 1, 100);
      let newer: Order = makeOrder(1204, OrderState.OBLIGATION, 20000, 1, 900);
      refunded.refund();
      let center: OrderCenter = new OrderCenter([refunded, newer]);
      let latest: Order | undefined = center.latest();
      expect(latest !== null && latest !== undefined).assertTrue();
      if (latest !== undefined) {
        expect(latest.id).assertEqual(1204);
        expect(latest.state === OrderState.REFUND).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0720
     * @tc.name      refunded_empty_order_counted_in_center_072
     * @tc.desc      Verify refunded empty order counted in center.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_empty_order_counted_in_center_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_empty_order_counted_in_center_072');
      let order: Order = new Order(1205, [], OrderState.WAIT_RECEIVE, 1400);
      order.refund();
      let center: OrderCenter = new OrderCenter([order]);
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().refund).assertEqual(1);
      expect(center.counts().total).assertEqual(1);
      expect(center.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0730
     * @tc.name      refund_failure_from_refund_state_keeps_spent_zero_073
     * @tc.desc      Verify refund failure from refund state keeps spent zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refund_failure_from_refund_state_keeps_spent_zero_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refund_failure_from_refund_state_keeps_spent_zero_073');
      let order: Order = makeOrder(1206, OrderState.REFUND, 44000, 2, 1400);
      expect(order.refund()).assertFalse();
      let center: OrderCenter = new OrderCenter([order]);
      // Built straight in REFUND with no transition, the order must still be skipped by
      // spent() and counted once under refund.
      expect(center.spent().cents()).assertEqual(0);
      expect(center.counts().refund).assertEqual(1);
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0740
     * @tc.name      refunded_order_attempts_keep_counts_074
     * @tc.desc      Verify refunded order attempts keep counts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_attempts_keep_counts_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_attempts_keep_counts_074');
      let order: Order = makeOrder(1207, OrderState.WAIT_EVALUATE, 21000, 1, 1400);
      let center: OrderCenter = new OrderCenter([order]);
      order.refund();
      order.cancel();
      order.advance();
      let counts: OrderCounts = center.counts();
      expect(counts.refund).assertEqual(1);
      expect(counts.total).assertEqual(1);
      expect(counts.waitEvaluate).assertEqual(0);
      expect(counts.cancelled).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0750
     * @tc.name      refunded_order_by_state_returns_the_original_instance_075
     * @tc.desc      Verify refunded order by state returns the original instance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_by_state_returns_the_original_instance_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_by_state_returns_the_original_instance_075');
      let order: Order = makeOrder(1208, OrderState.WAIT_RECEIVE, 17000, 1, 1400);
      order.refund();
      let center: OrderCenter = new OrderCenter([order]);
      let list: Order[] = center.byState(OrderState.REFUND);
      expect(list.length).assertEqual(1);
      expect(list[0] === order).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_REFUND_0760
     * @tc.name      refunded_order_label_survives_rejected_attempts_076
     * @tc.desc      Verify refunded order label survives rejected attempts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('refunded_order_label_survives_rejected_attempts_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: refunded_order_label_survives_rejected_attempts_076');
      let order: Order = makeOrder(1209, OrderState.WAIT_RECEIVE, 12000, 1, 1500);
      order.refund();
      order.cancel();
      order.advance();
      expect(order.stateLabel()).assertEqual('refund');
      expect(order.isFinal()).assertTrue();
    });
  });
}
