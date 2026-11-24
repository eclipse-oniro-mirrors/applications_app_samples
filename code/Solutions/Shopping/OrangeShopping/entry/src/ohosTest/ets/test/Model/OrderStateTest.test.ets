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
import { CartLine, Order, OrderState } from '../Shared/ShopModel';
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

const ALL_LABELS: string[] = [
  'obligation',
  'wait_delivery',
  'wait_receive',
  'wait_evaluate',
  'refund',
  'completed',
  'cancelled'
];

/** Two lines totalling 517700; defaults to OBLIGATION at 1700000000. */
function makeOrder(id: number, state: OrderState = OrderState.OBLIGATION,
  createdAt: number = 1700000000): Order {
  let lines: CartLine[] = [
    cartLine(0, 499900, 1, true),
    cartLine(4, 8900, 2, true)
  ];
  return new Order(id, lines, state, createdAt);
}

/** goodsId is id % 8 and createdAt is 1700000000 + id. */
function makeSingleLineOrder(id: number, priceCents: number, quantity: number,
  state: OrderState = OrderState.OBLIGATION): Order {
  let lines: CartLine[] = [cartLine(id % 8, priceCents, quantity, true)];
  return new Order(id, lines, state, 1700000000 + id);
}

export default function orderStateTest() {
  describe('OrangeShoppingOrderState', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'order state suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0010
     * @tc.name      state_new_order_defaults_to_obligation_001
     * @tc.desc      Verify state new order defaults to obligation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_new_order_defaults_to_obligation_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_new_order_defaults_to_obligation_001');
      let order: Order = makeSingleLineOrder(100, 19900, 1);
      expect(order.state).assertEqual(OrderState.OBLIGATION);
      expect(order.stateLabel()).assertEqual('obligation');
      expect(order.isFinal()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0020
     * @tc.name      state_constructor_preserves_every_explicit_state_002
     * @tc.desc      Verify state constructor preserves every explicit state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_constructor_preserves_every_explicit_state_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_constructor_preserves_every_explicit_state_002');
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        let order: Order = makeOrder(110 + index, ALL_STATES[index]);
        expect(order.state).assertEqual(ALL_STATES[index]);
        expect(order.lines.length).assertEqual(2);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0030
     * @tc.name      state_forward_chain_returns_true_four_times_003
     * @tc.desc      Verify state forward chain returns true four times.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_forward_chain_returns_true_four_times_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_forward_chain_returns_true_four_times_003');
      let order: Order = makeOrder(120);
      // Four accepted advances walk OBLIGATION to COMPLETED; the fifth meets a final state.
      let results: boolean[] = [];
      for (let step: number = 0; step < 5; step++) {
        results.push(order.advance());
      }
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();
      expect(results[3]).assertTrue();
      expect(results[4]).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0040
     * @tc.name      state_forward_chain_visits_expected_states_004
     * @tc.desc      Verify state forward chain visits expected states.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_forward_chain_visits_expected_states_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_forward_chain_visits_expected_states_004');
      let order: Order = makeOrder(130);
      let expected: OrderState[] = [
        OrderState.WAIT_DELIVERY,
        OrderState.WAIT_RECEIVE,
        OrderState.WAIT_EVALUATE,
        OrderState.COMPLETED
      ];
      let observed: OrderState[] = [];
      for (let step: number = 0; step < expected.length; step++) {
        order.advance();
        observed.push(order.state);
        expect(observed[step]).assertEqual(expected[step]);
      }
      expect(order.state).assertEqual(OrderState.COMPLETED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0050
     * @tc.name      state_forward_chain_labels_in_order_005
     * @tc.desc      Verify state forward chain labels in order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_forward_chain_labels_in_order_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_forward_chain_labels_in_order_005');
      let order: Order = makeOrder(140);
      let expected: string[] = ['wait_delivery', 'wait_receive', 'wait_evaluate', 'completed'];
      for (let step: number = 0; step < expected.length; step++) {
        order.advance();
        expect(order.stateLabel()).assertEqual(expected[step]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0060
     * @tc.name      state_each_single_step_targets_next_state_006
     * @tc.desc      Verify state each single step targets next state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_each_single_step_targets_next_state_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_each_single_step_targets_next_state_006');
      let fromStates: OrderState[] = [
        OrderState.OBLIGATION,
        OrderState.WAIT_DELIVERY,
        OrderState.WAIT_RECEIVE,
        OrderState.WAIT_EVALUATE
      ];
      let toStates: OrderState[] = [
        OrderState.WAIT_DELIVERY,
        OrderState.WAIT_RECEIVE,
        OrderState.WAIT_EVALUATE,
        OrderState.COMPLETED
      ];
      for (let index: number = 0; index < fromStates.length; index++) {
        let order: Order = makeOrder(150 + index, fromStates[index]);
        let moved: boolean = order.advance();

        expect(moved).assertTrue();
        expect(order.state).assertEqual(toStates[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0070
     * @tc.name      state_terminal_states_reject_advance_007
     * @tc.desc      Verify state terminal states reject advance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_terminal_states_reject_advance_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_terminal_states_reject_advance_007');
      let terminals: OrderState[] = [
        OrderState.COMPLETED,
        OrderState.CANCELLED,
        OrderState.REFUND
      ];
      for (let index: number = 0; index < terminals.length; index++) {
        let order: Order = makeOrder(160 + index, terminals[index]);
        let moved: boolean = order.advance();
        expect(moved).assertFalse();
        expect(order.state).assertEqual(terminals[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0080
     * @tc.name      state_completed_order_rejects_repeated_advance_008
     * @tc.desc      Verify state completed order rejects repeated advance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_completed_order_rejects_repeated_advance_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_completed_order_rejects_repeated_advance_008');
      let order: Order = makeOrder(170);
      for (let step: number = 0; step < 4; step++) {
        order.advance();
      }
      expect(order.state).assertEqual(OrderState.COMPLETED);
      for (let attempt: number = 0; attempt < 3; attempt++) {
        expect(order.advance()).assertFalse();
        expect(order.state).assertEqual(OrderState.COMPLETED);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0090
     * @tc.name      state_advance_preserves_order_total_009
     * @tc.desc      Verify state advance preserves order total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_advance_preserves_order_total_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_advance_preserves_order_total_009');
      let order: Order = makeOrder(180);
      // Both makeOrder lines count: 499900 + 8900 * 2 = 517700 cents before any transition.
      let before: number = order.total().cents();
      for (let step: number = 0; step < 4; step++) {
        order.advance();
      }
      expect(order.total().cents()).assertEqual(before);
      expect(order.total().cents()).assertEqual(499900 + 8900 * 2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0100
     * @tc.name      state_advance_preserves_order_quantity_010
     * @tc.desc      Verify state advance preserves order quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_advance_preserves_order_quantity_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_advance_preserves_order_quantity_010');
      let order: Order = makeSingleLineOrder(190, 129900, 3);
      let before: number = order.quantity();
      order.advance();
      order.advance();
      expect(order.quantity()).assertEqual(before);
      expect(order.quantity()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0110
     * @tc.name      state_advance_preserves_identity_fields_011
     * @tc.desc      Verify state advance preserves identity fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_advance_preserves_identity_fields_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_advance_preserves_identity_fields_011');
      // makeSingleLineOrder stamps createdAt as 1700000000 + id, so id 200 gives 1700000200.
      let order: Order = makeSingleLineOrder(200, 59900, 2);
      order.advance();
      order.advance();
      order.advance();
      order.advance();
      expect(order.id).assertEqual(200);
      expect(order.createdAt).assertEqual(1700000200);
      expect(order.state).assertEqual(OrderState.COMPLETED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0120
     * @tc.name      state_advance_preserves_line_snapshot_012
     * @tc.desc      Verify state advance preserves line snapshot.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_advance_preserves_line_snapshot_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_advance_preserves_line_snapshot_012');
      let order: Order = makeOrder(210);
      let unitBefore: number[] = [order.lines[0].unitPriceCents, order.lines[1].unitPriceCents];
      let quantityBefore: number[] = [order.lines[0].quantity, order.lines[1].quantity];
      for (let step: number = 0; step < 4; step++) {
        order.advance();
      }
      expect(order.lines.length).assertEqual(2);
      for (let index: number = 0; index < order.lines.length; index++) {
        expect(order.lines[index].unitPriceCents).assertEqual(unitBefore[index]);
        expect(order.lines[index].quantity).assertEqual(quantityBefore[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0130
     * @tc.name      state_advance_preserves_line_selection_flag_013
     * @tc.desc      Verify state advance preserves line selection flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_advance_preserves_line_selection_flag_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_advance_preserves_line_selection_flag_013');
      let lines: CartLine[] = [
        cartLine(1, 399900, 1, true),
        cartLine(4, 8900, 2, false)
      ];
      let order: Order = new Order(220, lines, OrderState.OBLIGATION, 1700000220);
      order.advance();
      expect(order.lines[0].selected).assertTrue();
      expect(order.lines[1].selected).assertFalse();
      expect(order.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0140
     * @tc.name      state_cancel_from_obligation_returns_true_014
     * @tc.desc      Verify state cancel from obligation returns true.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_from_obligation_returns_true_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_from_obligation_returns_true_014');
      let order: Order = makeOrder(230);
      let cancelled: boolean = order.cancel();
      expect(cancelled).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0150
     * @tc.name      state_cancel_from_obligation_sets_cancelled_015
     * @tc.desc      Verify state cancel from obligation sets cancelled.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_from_obligation_sets_cancelled_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_from_obligation_sets_cancelled_015');
      let order: Order = makeOrder(240);
      order.cancel();
      expect(order.state).assertEqual(OrderState.CANCELLED);
      expect(order.stateLabel()).assertEqual('cancelled');
      expect(order.isFinal()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0160
     * @tc.name      state_cancel_from_wait_delivery_succeeds_016
     * @tc.desc      Verify state cancel from wait delivery succeeds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_from_wait_delivery_succeeds_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_from_wait_delivery_succeeds_016');
      let order: Order = makeOrder(250);
      order.advance();
      expect(order.state).assertEqual(OrderState.WAIT_DELIVERY);
      let cancelled: boolean = order.cancel();
      expect(cancelled).assertTrue();
      expect(order.state).assertEqual(OrderState.CANCELLED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0170
     * @tc.name      state_cancel_predicate_matrix_matches_first_two_states_017
     * @tc.desc      Verify state cancel predicate matrix matches first two states.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_predicate_matrix_matches_first_two_states_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_predicate_matrix_matches_first_two_states_017');
      // Seven flags aligned with ALL_STATES: only the two pre-shipping states may cancel.
      let expected: boolean[] = [true, true, false, false, false, false, false];
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        let order: Order = makeOrder(260 + index, ALL_STATES[index]);
        expect(order.canCancel()).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0180
     * @tc.name      state_cancel_rejects_five_later_states_018
     * @tc.desc      Verify state cancel rejects five later states.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_rejects_five_later_states_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_rejects_five_later_states_018');
      let ineligible: OrderState[] = [
        OrderState.WAIT_RECEIVE,
        OrderState.WAIT_EVALUATE,
        OrderState.REFUND,
        OrderState.COMPLETED,
        OrderState.CANCELLED
      ];
      for (let index: number = 0; index < ineligible.length; index++) {
        let order: Order = makeOrder(270 + index, ineligible[index]);
        let cancelled: boolean = order.cancel();
        expect(cancelled).assertFalse();
        expect(order.state).assertEqual(ineligible[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0190
     * @tc.name      state_cancel_after_delivery_is_rejected_019
     * @tc.desc      Verify state cancel after delivery is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_after_delivery_is_rejected_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_after_delivery_is_rejected_019');
      let order: Order = makeOrder(280);
      order.advance();
      order.advance();
      expect(order.state).assertEqual(OrderState.WAIT_RECEIVE);
      let cancelled: boolean = order.cancel();
      expect(cancelled).assertFalse();
      expect(order.state).assertEqual(OrderState.WAIT_RECEIVE);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0200
     * @tc.name      state_cancel_after_completion_is_rejected_020
     * @tc.desc      Verify state cancel after completion is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_after_completion_is_rejected_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_after_completion_is_rejected_020');
      let order: Order = makeOrder(290);
      for (let step: number = 0; step < 4; step++) {
        order.advance();
      }
      let cancelled: boolean = order.cancel();
      expect(cancelled).assertFalse();
      expect(order.state).assertEqual(OrderState.COMPLETED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0210
     * @tc.name      state_second_cancel_is_rejected_021
     * @tc.desc      Verify state second cancel is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_second_cancel_is_rejected_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_second_cancel_is_rejected_021');
      let order: Order = makeOrder(300);
      expect(order.cancel()).assertTrue();
      let cancelledAgain: boolean = order.cancel();
      expect(cancelledAgain).assertFalse();
      expect(order.state).assertEqual(OrderState.CANCELLED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0220
     * @tc.name      state_cancel_preserves_order_total_022
     * @tc.desc      Verify state cancel preserves order total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_preserves_order_total_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_preserves_order_total_022');
      // 29900 cents times quantity 4 gives the 119600 total that cancel must leave intact.
      let order: Order = makeSingleLineOrder(310, 29900, 4);
      let before: number = order.total().cents();
      order.cancel();
      expect(order.total().cents()).assertEqual(before);
      expect(order.total().cents()).assertEqual(119600);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0230
     * @tc.name      state_cancel_preserves_lines_023
     * @tc.desc      Verify state cancel preserves lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_preserves_lines_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_preserves_lines_023');
      let order: Order = makeOrder(320);
      order.cancel();
      expect(order.lines.length).assertEqual(2);
      expect(order.lines[0].unitPriceCents).assertEqual(499900);
      expect(order.lines[1].quantity).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0240
     * @tc.name      state_cancelled_order_rejects_advance_024
     * @tc.desc      Verify state cancelled order rejects advance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancelled_order_rejects_advance_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancelled_order_rejects_advance_024');
      let order: Order = makeOrder(330);
      order.cancel();
      let moved: boolean = order.advance();
      expect(moved).assertFalse();
      expect(order.state).assertEqual(OrderState.CANCELLED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0250
     * @tc.name      state_cancelled_order_rejects_repeated_advance_025
     * @tc.desc      Verify state cancelled order rejects repeated advance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancelled_order_rejects_repeated_advance_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancelled_order_rejects_repeated_advance_025');
      let order: Order = makeOrder(340);
      order.cancel();
      for (let attempt: number = 0; attempt < 4; attempt++) {
        expect(order.advance()).assertFalse();
      }
      expect(order.state).assertEqual(OrderState.CANCELLED);
      expect(order.stateLabel()).assertEqual('cancelled');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0260
     * @tc.name      state_cancelled_order_rejects_refund_026
     * @tc.desc      Verify state cancelled order rejects refund.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancelled_order_rejects_refund_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancelled_order_rejects_refund_026');
      let order: Order = makeOrder(350);
      order.cancel();
      let refunded: boolean = order.refund();
      expect(refunded).assertFalse();
      expect(order.state).assertEqual(OrderState.CANCELLED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0270
     * @tc.name      state_cancelled_label_stays_cancelled_027
     * @tc.desc      Verify state cancelled label stays cancelled.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancelled_label_stays_cancelled_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancelled_label_stays_cancelled_027');
      let order: Order = makeOrder(360);
      // refund, advance and a second cancel all reach a terminal state and change nothing.
      order.cancel();
      order.refund();
      order.advance();
      order.cancel();
      expect(order.stateLabel()).assertEqual('cancelled');
      expect(order.isFinal()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0280
     * @tc.name      state_refund_from_wait_receive_returns_true_028
     * @tc.desc      Verify state refund from wait receive returns true.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_from_wait_receive_returns_true_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_from_wait_receive_returns_true_028');
      let order: Order = makeOrder(370, OrderState.WAIT_RECEIVE);
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0290
     * @tc.name      state_refund_from_wait_receive_sets_refund_state_029
     * @tc.desc      Verify state refund from wait receive sets refund state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_from_wait_receive_sets_refund_state_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_from_wait_receive_sets_refund_state_029');
      let order: Order = makeOrder(380, OrderState.WAIT_RECEIVE);
      order.refund();
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.canRefund()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0300
     * @tc.name      state_refund_from_wait_evaluate_succeeds_030
     * @tc.desc      Verify state refund from wait evaluate succeeds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_from_wait_evaluate_succeeds_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_from_wait_evaluate_succeeds_030');
      let order: Order = makeOrder(390, OrderState.WAIT_EVALUATE);
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0310
     * @tc.name      state_refund_after_two_advances_succeeds_031
     * @tc.desc      Verify state refund after two advances succeeds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_after_two_advances_succeeds_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_after_two_advances_succeeds_031');
      let order: Order = makeOrder(400);
      order.advance();
      order.advance();
      expect(order.state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(order.refund()).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0320
     * @tc.name      state_refund_after_three_advances_succeeds_032
     * @tc.desc      Verify state refund after three advances succeeds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_after_three_advances_succeeds_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_after_three_advances_succeeds_032');
      let order: Order = makeOrder(410);
      order.advance();
      order.advance();
      order.advance();
      expect(order.state).assertEqual(OrderState.WAIT_EVALUATE);
      expect(order.refund()).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0330
     * @tc.name      state_refund_predicate_allows_only_receipt_and_evaluation_033
     * @tc.desc      Verify state refund predicate allows only receipt and evaluation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_predicate_allows_only_receipt_and_evaluation_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_predicate_allows_only_receipt_and_evaluation_033');
      // ALL_STATES order puts true only on WAIT_RECEIVE and WAIT_EVALUATE, the receivable windows.
      let expected: boolean[] = [false, false, true, true, false, false, false];
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        let order: Order = makeOrder(420 + index, ALL_STATES[index]);
        expect(order.canRefund()).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0340
     * @tc.name      state_refund_rejects_five_ineligible_states_034
     * @tc.desc      Verify state refund rejects five ineligible states.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_rejects_five_ineligible_states_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_rejects_five_ineligible_states_034');
      let ineligible: OrderState[] = [
        OrderState.OBLIGATION,
        OrderState.WAIT_DELIVERY,
        OrderState.REFUND,
        OrderState.COMPLETED,
        OrderState.CANCELLED
      ];
      for (let index: number = 0; index < ineligible.length; index++) {
        let order: Order = makeOrder(430 + index, ineligible[index]);
        let refunded: boolean = order.refund();
        expect(refunded).assertFalse();
        expect(order.state).assertEqual(ineligible[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0350
     * @tc.name      state_refund_after_delivery_is_rejected_035
     * @tc.desc      Verify state refund after delivery is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_after_delivery_is_rejected_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_after_delivery_is_rejected_035');
      let order: Order = makeOrder(440);
      order.advance();
      expect(order.state).assertEqual(OrderState.WAIT_DELIVERY);
      let refunded: boolean = order.refund();
      expect(refunded).assertFalse();
      expect(order.state).assertEqual(OrderState.WAIT_DELIVERY);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0360
     * @tc.name      state_refund_after_completion_is_rejected_036
     * @tc.desc      Verify state refund after completion is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_after_completion_is_rejected_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_after_completion_is_rejected_036');
      let order: Order = makeOrder(450);
      for (let step: number = 0; step < 4; step++) {
        order.advance();
      }
      let refunded: boolean = order.refund();
      expect(refunded).assertFalse();
      expect(order.state).assertEqual(OrderState.COMPLETED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0370
     * @tc.name      state_second_refund_is_rejected_037
     * @tc.desc      Verify state second refund is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_second_refund_is_rejected_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_second_refund_is_rejected_037');
      let order: Order = makeOrder(460, OrderState.WAIT_RECEIVE);
      expect(order.refund()).assertTrue();
      let refundedAgain: boolean = order.refund();
      expect(refundedAgain).assertFalse();
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0380
     * @tc.name      state_is_final_matrix_matches_terminal_states_038
     * @tc.desc      Verify state is final matrix matches terminal states.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_is_final_matrix_matches_terminal_states_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_is_final_matrix_matches_terminal_states_038');
      // Only the three terminal states - refund, completed, cancelled - report final.
      let expected: boolean[] = [false, false, false, false, true, true, true];
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        let order: Order = makeOrder(550 + index, ALL_STATES[index]);
        expect(order.isFinal()).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0390
     * @tc.name      state_is_final_flips_only_at_completion_039
     * @tc.desc      Verify state is final flips only at completion.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_is_final_flips_only_at_completion_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_is_final_flips_only_at_completion_039');
      let order: Order = makeOrder(560);
      let observed: boolean[] = [];
      for (let step: number = 0; step < 4; step++) {
        order.advance();
        observed.push(order.isFinal());
      }
      expect(observed[0]).assertFalse();
      expect(observed[1]).assertFalse();
      expect(observed[2]).assertFalse();
      expect(observed[3]).assertTrue();
      expect(order.state).assertEqual(OrderState.COMPLETED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0400
     * @tc.name      state_is_final_true_after_cancel_040
     * @tc.desc      Verify state is final true after cancel.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_is_final_true_after_cancel_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_is_final_true_after_cancel_040');
      let order: Order = makeOrder(570);
      expect(order.isFinal()).assertFalse();
      order.cancel();
      expect(order.isFinal()).assertTrue();
      expect(order.state).assertEqual(OrderState.CANCELLED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0410
     * @tc.name      state_label_matrix_matches_seven_states_041
     * @tc.desc      Verify state label matrix matches seven states.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_label_matrix_matches_seven_states_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_label_matrix_matches_seven_states_041');
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        let order: Order = makeOrder(590 + index, ALL_STATES[index]);
        expect(order.stateLabel()).assertEqual(ALL_LABELS[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0420
     * @tc.name      state_label_stays_after_rejected_cancel_042
     * @tc.desc      Verify state label stays after rejected cancel.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_label_stays_after_rejected_cancel_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_label_stays_after_rejected_cancel_042');
      let order: Order = makeOrder(600, OrderState.WAIT_RECEIVE);
      expect(order.cancel()).assertFalse();
      expect(order.stateLabel() === 'wait_receive').assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0430
     * @tc.name      state_label_stays_after_rejected_refund_043
     * @tc.desc      Verify state label stays after rejected refund.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_label_stays_after_rejected_refund_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_label_stays_after_rejected_refund_043');
      let order: Order = makeOrder(610, OrderState.OBLIGATION);
      expect(order.refund()).assertFalse();
      expect(order.stateLabel() === 'obligation').assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0440
     * @tc.name      state_label_stays_after_rejected_advance_044
     * @tc.desc      Verify state label stays after rejected advance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_label_stays_after_rejected_advance_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_label_stays_after_rejected_advance_044');
      let order: Order = makeOrder(620, OrderState.COMPLETED);
      expect(order.advance()).assertFalse();
      expect(order.stateLabel()).assertEqual('completed');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0450
     * @tc.name      state_fresh_orders_advance_independently_045
     * @tc.desc      Verify state fresh orders advance independently.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_fresh_orders_advance_independently_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_fresh_orders_advance_independently_045');
      let first: Order = makeOrder(630);
      let second: Order = makeOrder(631);
      first.advance();
      first.advance();
      second.advance();
      expect(first.state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(second.state).assertEqual(OrderState.WAIT_DELIVERY);
      expect(first.state === second.state).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0460
     * @tc.name      state_transition_independent_of_created_at_046
     * @tc.desc      Verify state transition independent of created at.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_transition_independent_of_created_at_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_transition_independent_of_created_at_046');
      // Timestamps at opposite ends, 1 and 2000000000, must not influence the transition.
      let early: Order = makeOrder(640, OrderState.OBLIGATION, 1);
      let late: Order = makeOrder(641, OrderState.OBLIGATION, 2000000000);
      expect(early.advance()).assertTrue();
      expect(late.advance()).assertTrue();
      expect(early.state).assertEqual(OrderState.WAIT_DELIVERY);
      expect(late.state).assertEqual(OrderState.WAIT_DELIVERY);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0470
     * @tc.name      state_transition_independent_of_order_total_047
     * @tc.desc      Verify state transition independent of order total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_transition_independent_of_order_total_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_transition_independent_of_order_total_047');
      // 100 cents versus 499900 * 99 = 49490100 cents: totals do not gate advance().
      let cheap: Order = makeSingleLineOrder(650, 100, 1);
      let expensive: Order = makeSingleLineOrder(651, 499900, 99);
      cheap.advance();
      expensive.advance();
      expect(cheap.state).assertEqual(OrderState.WAIT_DELIVERY);
      expect(expensive.state).assertEqual(OrderState.WAIT_DELIVERY);
      expect(cheap.total().cents()).assertEqual(100);
      expect(expensive.total().cents()).assertEqual(49490100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0480
     * @tc.name      state_cancel_does_not_affect_sibling_order_048
     * @tc.desc      Verify state cancel does not affect sibling order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_does_not_affect_sibling_order_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_does_not_affect_sibling_order_048');
      let first: Order = makeOrder(660);
      let second: Order = makeOrder(661);
      first.cancel();
      expect(first.state).assertEqual(OrderState.CANCELLED);
      expect(second.state).assertEqual(OrderState.OBLIGATION);
      expect(second.isFinal()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0490
     * @tc.name      state_refund_does_not_affect_sibling_order_049
     * @tc.desc      Verify state refund does not affect sibling order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_does_not_affect_sibling_order_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_does_not_affect_sibling_order_049');
      let first: Order = makeOrder(670, OrderState.WAIT_EVALUATE);
      let second: Order = makeOrder(671, OrderState.WAIT_EVALUATE);
      first.refund();
      expect(first.state).assertEqual(OrderState.REFUND);
      expect(second.state).assertEqual(OrderState.WAIT_EVALUATE);
      expect(second.isFinal()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0500
     * @tc.name      state_remaining_path_from_wait_delivery_reaches_completed_050
     * @tc.desc      Verify state remaining path from wait delivery reaches completed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_remaining_path_from_wait_delivery_reaches_completed_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_remaining_path_from_wait_delivery_reaches_completed_050');
      // Three advances remain from WAIT_DELIVERY; the fourth call has nothing left to move to.
      let order: Order = makeOrder(680, OrderState.WAIT_DELIVERY);
      expect(order.advance()).assertTrue();
      expect(order.state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(order.advance()).assertTrue();
      expect(order.state).assertEqual(OrderState.WAIT_EVALUATE);
      expect(order.advance()).assertTrue();
      expect(order.state).assertEqual(OrderState.COMPLETED);
      expect(order.advance()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0510
     * @tc.name      state_remaining_path_from_wait_receive_reaches_completed_051
     * @tc.desc      Verify state remaining path from wait receive reaches completed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_remaining_path_from_wait_receive_reaches_completed_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_remaining_path_from_wait_receive_reaches_completed_051');
      let order: Order = makeOrder(681, OrderState.WAIT_RECEIVE);
      expect(order.advance()).assertTrue();
      expect(order.state).assertEqual(OrderState.WAIT_EVALUATE);
      expect(order.advance()).assertTrue();
      expect(order.state).assertEqual(OrderState.COMPLETED);
      expect(order.stateLabel()).assertEqual('completed');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0520
     * @tc.name      state_refund_after_failed_cancel_succeeds_052
     * @tc.desc      Verify state refund after failed cancel succeeds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_after_failed_cancel_succeeds_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_after_failed_cancel_succeeds_052');
      let order: Order = makeOrder(682, OrderState.WAIT_RECEIVE);
      let cancelled: boolean = order.cancel();
      expect(cancelled).assertFalse();
      expect(order.state).assertEqual(OrderState.WAIT_RECEIVE);
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0530
     * @tc.name      state_cancel_after_failed_refund_succeeds_053
     * @tc.desc      Verify state cancel after failed refund succeeds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_after_failed_refund_succeeds_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_after_failed_refund_succeeds_053');
      let order: Order = makeOrder(683, OrderState.WAIT_DELIVERY);
      let refunded: boolean = order.refund();
      expect(refunded).assertFalse();
      expect(order.state === OrderState.WAIT_DELIVERY).assertTrue();
      let cancelled: boolean = order.cancel();
      expect(cancelled).assertTrue();
      expect(order.state).assertEqual(OrderState.CANCELLED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0540
     * @tc.name      state_advance_after_failed_refund_progresses_054
     * @tc.desc      Verify state advance after failed refund progresses.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_advance_after_failed_refund_progresses_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_advance_after_failed_refund_progresses_054');
      let order: Order = makeOrder(684, OrderState.WAIT_DELIVERY);
      order.refund();
      let moved: boolean = order.advance();
      expect(moved).assertTrue();
      expect(order.state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(order.stateLabel()).assertEqual('wait_receive');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0550
     * @tc.name      state_advance_after_failed_cancel_progresses_055
     * @tc.desc      Verify state advance after failed cancel progresses.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_advance_after_failed_cancel_progresses_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_advance_after_failed_cancel_progresses_055');
      let order: Order = makeOrder(685, OrderState.WAIT_EVALUATE);
      let cancelled: boolean = order.cancel();
      expect(cancelled).assertFalse();
      let moved: boolean = order.advance();
      expect(moved).assertTrue();
      expect(order.state).assertEqual(OrderState.COMPLETED);
      expect(order.isFinal()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0560
     * @tc.name      state_active_windows_are_mutually_exclusive_056
     * @tc.desc      Verify state active windows are mutually exclusive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_active_windows_are_mutually_exclusive_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_active_windows_are_mutually_exclusive_056');
      for (let index: number = 0; index < ALL_STATES.length; index++) {
        let order: Order = makeOrder(690 + index, ALL_STATES[index]);
        let canCancel: boolean = order.canCancel();
        let canRefund: boolean = order.canRefund();
        expect(canCancel && canRefund).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0570
     * @tc.name      state_wait_evaluate_is_not_final_although_refundable_057
     * @tc.desc      Verify state wait evaluate is not final although refundable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_wait_evaluate_is_not_final_although_refundable_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_wait_evaluate_is_not_final_although_refundable_057');
      let order: Order = makeOrder(700, OrderState.WAIT_EVALUATE);
      expect(order.isFinal()).assertFalse();
      expect(order.canRefund()).assertTrue();
      expect(order.canCancel()).assertFalse();
      expect(order.stateLabel()).assertEqual('wait_evaluate');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0580
     * @tc.name      state_wait_receive_is_not_final_although_refundable_058
     * @tc.desc      Verify state wait receive is not final although refundable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_wait_receive_is_not_final_although_refundable_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_wait_receive_is_not_final_although_refundable_058');
      let order: Order = makeOrder(701, OrderState.WAIT_RECEIVE);
      expect(order.isFinal()).assertFalse();
      expect(order.canRefund()).assertTrue();
      expect(order.canCancel()).assertFalse();
      expect(order.stateLabel() === 'wait_receive').assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0590
     * @tc.name      state_label_after_cancel_from_wait_delivery_059
     * @tc.desc      Verify state label after cancel from wait delivery.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_label_after_cancel_from_wait_delivery_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_label_after_cancel_from_wait_delivery_059');
      let order: Order = makeOrder(702, OrderState.WAIT_DELIVERY);
      order.cancel();
      expect(order.stateLabel()).assertEqual('cancelled');
      expect(order.state).assertEqual(OrderState.CANCELLED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0600
     * @tc.name      state_is_final_true_for_completed_path_060
     * @tc.desc      Verify state is final true for completed path.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_is_final_true_for_completed_path_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_is_final_true_for_completed_path_060');
      let order: Order = makeOrder(703);
      for (let step: number = 0; step < 4; step++) {
        order.advance();
      }
      expect(order.isFinal()).assertTrue();
      expect(order.state).assertEqual(OrderState.COMPLETED);
      expect(order.stateLabel()).assertEqual('completed');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0610
     * @tc.name      state_is_final_true_for_cancelled_path_061
     * @tc.desc      Verify state is final true for cancelled path.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_is_final_true_for_cancelled_path_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_is_final_true_for_cancelled_path_061');
      let order: Order = makeOrder(704);
      order.advance();
      order.cancel();
      expect(order.isFinal()).assertTrue();
      expect(order.state).assertEqual(OrderState.CANCELLED);
      expect(order.canCancel()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0620
     * @tc.name      state_interleaved_rejected_operations_do_not_stall_progress_062
     * @tc.desc      Verify state interleaved rejected operations do not stall progress.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_interleaved_rejected_operations_do_not_stall_progress_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_interleaved_rejected_operations_do_not_stall_progress_062');
      let order: Order = makeOrder(705);
      expect(order.refund()).assertFalse();
      expect(order.advance()).assertTrue();
      expect(order.refund()).assertFalse();
      expect(order.advance()).assertTrue();
      expect(order.cancel()).assertFalse();
      expect(order.advance()).assertTrue();
      expect(order.state).assertEqual(OrderState.WAIT_EVALUATE);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0630
     * @tc.name      state_advance_keeps_line_reference_stable_063
     * @tc.desc      Verify state advance keeps line reference stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_advance_keeps_line_reference_stable_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_advance_keeps_line_reference_stable_063');
      let order: Order = makeOrder(710);
      let lineBefore: CartLine = order.lines[0];
      order.advance();
      order.advance();
      expect(lineBefore === order.lines[0]).assertTrue();
      expect(order.lines[0].unitPriceCents).assertEqual(499900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0640
     * @tc.name      state_cancel_keeps_line_reference_stable_064
     * @tc.desc      Verify state cancel keeps line reference stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_keeps_line_reference_stable_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_keeps_line_reference_stable_064');
      let order: Order = makeOrder(711);
      let lineBefore: CartLine = order.lines[1];
      order.cancel();
      expect(lineBefore === order.lines[1]).assertTrue();
      expect(order.lines.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0650
     * @tc.name      state_refund_keeps_line_reference_stable_065
     * @tc.desc      Verify state refund keeps line reference stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_keeps_line_reference_stable_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_keeps_line_reference_stable_065');
      let order: Order = makeOrder(712, OrderState.WAIT_RECEIVE);
      let lineBefore: CartLine = order.lines[0];
      order.refund();
      expect(lineBefore === order.lines[0]).assertTrue();
      expect(order.lines[0].quantity).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0660
     * @tc.name      state_rejected_operations_do_not_rebuild_lines_066
     * @tc.desc      Verify state rejected operations do not rebuild lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_rejected_operations_do_not_rebuild_lines_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_rejected_operations_do_not_rebuild_lines_066');
      let order: Order = makeOrder(713, OrderState.COMPLETED);
      let lineBefore: CartLine = order.lines[0];
      order.advance();
      order.cancel();
      order.refund();
      expect(lineBefore === order.lines[0]).assertTrue();
      expect(order.state).assertEqual(OrderState.COMPLETED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0670
     * @tc.name      state_advance_returns_true_iff_state_changes_067
     * @tc.desc      Verify state advance returns true iff state changes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_advance_returns_true_iff_state_changes_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_advance_returns_true_iff_state_changes_067');
      let order: Order = makeOrder(714);
      // Five probes cover the four real transitions plus one no-op on COMPLETED.
      for (let step: number = 0; step < 5; step++) {
        let before: OrderState = order.state;
        let moved: boolean = order.advance();
        let changed: boolean = before !== order.state;
        expect(moved).assertEqual(changed);
      }
      expect(order.state).assertEqual(OrderState.COMPLETED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0680
     * @tc.name      state_cancel_failure_keeps_quantity_068
     * @tc.desc      Verify state cancel failure keeps quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_failure_keeps_quantity_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_failure_keeps_quantity_068');
      let order: Order = makeSingleLineOrder(716, 8900, 7, OrderState.WAIT_RECEIVE);
      let before: number = order.quantity();
      expect(order.cancel()).assertFalse();
      expect(order.quantity()).assertEqual(before);
      expect(order.quantity()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0690
     * @tc.name      state_cancelled_path_keeps_total_and_quantity_069
     * @tc.desc      Verify state cancelled path keeps total and quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancelled_path_keeps_total_and_quantity_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancelled_path_keeps_total_and_quantity_069');
      let order: Order = makeSingleLineOrder(717, 129900, 2);
      let totalBefore: number = order.total().cents();
      let quantityBefore: number = order.quantity();
      order.advance();
      order.cancel();
      expect(order.total().cents()).assertEqual(totalBefore);
      expect(order.quantity()).assertEqual(quantityBefore);
      expect(order.state).assertEqual(OrderState.CANCELLED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0700
     * @tc.name      state_single_line_order_full_chain_keeps_one_line_070
     * @tc.desc      Verify state single line order full chain keeps one line.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_single_line_order_full_chain_keeps_one_line_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_single_line_order_full_chain_keeps_one_line_070');
      // goodsId is assigned as id % 8, so 719 lands on slot 7; 15900 * 2 = 31800 cents.
      let order: Order = makeSingleLineOrder(719, 15900, 2);
      for (let step: number = 0; step < 4; step++) {
        order.advance();
      }
      expect(order.lines.length).assertEqual(1);
      expect(order.lines[0].goodsId).assertEqual(719 % 8);
      expect(order.total().cents()).assertEqual(31800);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0710
     * @tc.name      state_unselected_lines_do_not_block_transitions_071
     * @tc.desc      Verify state unselected lines do not block transitions.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_unselected_lines_do_not_block_transitions_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_unselected_lines_do_not_block_transitions_071');
      let lines: CartLine[] = [cartLine(0, 499900, 1, false), cartLine(4, 8900, 2, false)];
      let order: Order = new Order(720, lines, OrderState.OBLIGATION, 1700000720);
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.state).assertEqual(OrderState.COMPLETED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0720
     * @tc.name      state_transitions_preserve_line_goods_ids_072
     * @tc.desc      Verify state transitions preserve line goods ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_transitions_preserve_line_goods_ids_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_transitions_preserve_line_goods_ids_072');
      let order: Order = makeOrder(721);
      let idsBefore: number[] = [order.lines[0].goodsId, order.lines[1].goodsId];
      order.advance();
      order.advance();
      order.refund();
      expect(order.lines[0].goodsId).assertEqual(idsBefore[0]);
      expect(order.lines[1].goodsId).assertEqual(idsBefore[1]);
      expect(idsBefore[0] === idsBefore[1]).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0730
     * @tc.name      state_terminal_states_have_no_active_window_073
     * @tc.desc      Verify state terminal states have no active window.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_terminal_states_have_no_active_window_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_terminal_states_have_no_active_window_073');
      let terminals: OrderState[] = [OrderState.REFUND, OrderState.COMPLETED, OrderState.CANCELLED];
      for (let index: number = 0; index < terminals.length; index++) {
        let order: Order = makeOrder(730 + index, terminals[index]);
        expect(order.canCancel()).assertFalse();
        expect(order.canRefund()).assertFalse();
        expect(order.isFinal()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0740
     * @tc.name      state_rejected_advance_on_refund_keeps_total_and_quantity_074
     * @tc.desc      Verify state rejected advance on refund keeps total and quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_rejected_advance_on_refund_keeps_total_and_quantity_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_rejected_advance_on_refund_keeps_total_and_quantity_074');
      // 399900 cents at quantity 2 = 799800, frozen once the order is in REFUND.
      let order: Order = makeSingleLineOrder(740, 399900, 2, OrderState.REFUND);
      let totalBefore: number = order.total().cents();
      let quantityBefore: number = order.quantity();
      expect(order.advance()).assertFalse();
      expect(order.total().cents()).assertEqual(totalBefore);
      expect(order.quantity()).assertEqual(quantityBefore);
      expect(order.total().cents()).assertEqual(799800);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0750
     * @tc.name      state_empty_line_order_advances_to_completed_075
     * @tc.desc      Verify state empty line order advances to completed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_empty_line_order_advances_to_completed_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_empty_line_order_advances_to_completed_075');
      // An order with no lines still walks the four transitions and totals 0 cents.
      let order: Order = new Order(750, [], OrderState.OBLIGATION, 1700000750);
      expect(order.lines.length).assertEqual(0);
      for (let step: number = 0; step < 4; step++) {
        expect(order.advance()).assertTrue();
      }
      expect(order.state).assertEqual(OrderState.COMPLETED);
      expect(order.isFinal()).assertTrue();
      expect(order.total().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0760
     * @tc.name      state_empty_line_order_can_cancel_076
     * @tc.desc      Verify state empty line order can cancel.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_empty_line_order_can_cancel_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_empty_line_order_can_cancel_076');
      let order: Order = new Order(751, [], OrderState.OBLIGATION, 1700000751);
      let cancelled: boolean = order.cancel();
      expect(cancelled).assertTrue();
      expect(order.state).assertEqual(OrderState.CANCELLED);
      expect(order.stateLabel()).assertEqual('cancelled');
      expect(order.quantity()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0770
     * @tc.name      state_empty_line_order_can_refund_after_delivery_077
     * @tc.desc      Verify state empty line order can refund after delivery.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_empty_line_order_can_refund_after_delivery_077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_empty_line_order_can_refund_after_delivery_077');
      let order: Order = new Order(752, [], OrderState.WAIT_RECEIVE, 1700000752);
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.isFinal()).assertTrue();
      expect(order.lines.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0780
     * @tc.name      state_cancel_after_failed_refund_from_obligation_succeeds_078
     * @tc.desc      Verify state cancel after failed refund from obligation succeeds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_after_failed_refund_from_obligation_succeeds_078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_after_failed_refund_from_obligation_succeeds_078');
      let order: Order = makeOrder(753, OrderState.OBLIGATION);
      expect(order.refund()).assertFalse();
      expect(order.state).assertEqual(OrderState.OBLIGATION);
      expect(order.cancel()).assertTrue();
      expect(order.state).assertEqual(OrderState.CANCELLED);
      expect(order.stateLabel()).assertEqual('cancelled');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0790
     * @tc.name      state_refund_after_failed_cancel_from_wait_evaluate_succeeds_079
     * @tc.desc      Verify state refund after failed cancel from wait evaluate succeeds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_after_failed_cancel_from_wait_evaluate_succeeds_079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_after_failed_cancel_from_wait_evaluate_succeeds_079');
      let order: Order = makeOrder(754, OrderState.WAIT_EVALUATE);
      expect(order.cancel()).assertFalse();
      expect(order.state).assertEqual(OrderState.WAIT_EVALUATE);
      expect(order.refund()).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.stateLabel()).assertEqual('refund');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0800
     * @tc.name      state_two_orders_with_same_id_advance_independently_080
     * @tc.desc      Verify state two orders with same id advance independently.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_two_orders_with_same_id_advance_independently_080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_two_orders_with_same_id_advance_independently_080');
      let first: Order = makeOrder(755);
      let second: Order = makeOrder(755);
      first.advance();
      first.advance();
      second.advance();
      expect(first.state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(second.state).assertEqual(OrderState.WAIT_DELIVERY);
      expect(first.id).assertEqual(second.id);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0810
     * @tc.name      state_same_total_different_states_stay_independent_081
     * @tc.desc      Verify state same total different states stay independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_same_total_different_states_stay_independent_081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_same_total_different_states_stay_independent_081');
      // Both orders cost 19900 * 2 = 39800 cents yet sit in different states.
      let first: Order = makeSingleLineOrder(756, 19900, 2, OrderState.WAIT_EVALUATE);
      let second: Order = makeSingleLineOrder(757, 19900, 2, OrderState.REFUND);
      expect(first.total().cents()).assertEqual(second.total().cents());
      expect(first.advance()).assertTrue();
      expect(first.state).assertEqual(OrderState.COMPLETED);
      expect(second.state).assertEqual(OrderState.REFUND);
      expect(second.advance()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0820
     * @tc.name      state_cancel_keeps_identity_fields_082
     * @tc.desc      Verify state cancel keeps identity fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_keeps_identity_fields_082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_keeps_identity_fields_082');
      let order: Order = makeSingleLineOrder(758, 8900, 3);
      let idBefore: number = order.id;
      let createdBefore: number = order.createdAt;
      order.advance();
      order.cancel();
      expect(order.id).assertEqual(idBefore);
      expect(order.createdAt).assertEqual(createdBefore);
      expect(order.state).assertEqual(OrderState.CANCELLED);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0830
     * @tc.name      state_advance_after_failed_cancel_from_wait_receive_progresses_083
     * @tc.desc      Verify state advance after failed cancel from wait receive progresses.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_advance_after_failed_cancel_from_wait_receive_progresses_083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_advance_after_failed_cancel_from_wait_receive_progresses_083');
      let order: Order = makeOrder(760, OrderState.WAIT_RECEIVE);
      expect(order.cancel()).assertFalse();
      expect(order.state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(order.advance()).assertTrue();
      expect(order.state).assertEqual(OrderState.WAIT_EVALUATE);
      expect(order.stateLabel()).assertEqual('wait_evaluate');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0840
     * @tc.name      state_cancel_window_closes_when_refund_window_opens_084
     * @tc.desc      Verify state cancel window closes when refund window opens.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_window_closes_when_refund_window_opens_084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_window_closes_when_refund_window_opens_084');
      let order: Order = makeOrder(770, OrderState.WAIT_DELIVERY);
      expect(order.canCancel()).assertTrue();
      expect(order.canRefund()).assertFalse();
      order.advance();
      expect(order.state).assertEqual(OrderState.WAIT_RECEIVE);
      expect(order.canCancel()).assertFalse();
      expect(order.canRefund()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0850
     * @tc.name      state_refund_window_closes_at_completion_085
     * @tc.desc      Verify state refund window closes at completion.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_window_closes_at_completion_085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_window_closes_at_completion_085');
      let order: Order = makeOrder(771, OrderState.WAIT_EVALUATE);
      expect(order.canRefund()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.state).assertEqual(OrderState.COMPLETED);
      expect(order.canRefund()).assertFalse();
      expect(order.canCancel()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0860
     * @tc.name      state_forward_chain_crosses_cancel_and_refund_windows_086
     * @tc.desc      Verify state forward chain crosses cancel and refund windows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_forward_chain_crosses_cancel_and_refund_windows_086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_forward_chain_crosses_cancel_and_refund_windows_086');
      let order: Order = makeOrder(772);
      // Slot 0 samples OBLIGATION; the four pushes sample each later state up to COMPLETED.
      let cancelFlags: boolean[] = [order.canCancel()];
      let refundFlags: boolean[] = [order.canRefund()];
      for (let step: number = 0; step < 4; step++) {
        order.advance();
        cancelFlags.push(order.canCancel());
        refundFlags.push(order.canRefund());
      }

      expect(cancelFlags[0]).assertEqual(true);
      expect(cancelFlags[1]).assertEqual(true);
      expect(cancelFlags[2]).assertEqual(false);
      expect(refundFlags[0]).assertEqual(false);
      expect(refundFlags[1]).assertEqual(false);
      expect(refundFlags[2]).assertEqual(true);
      expect(refundFlags[3]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0870
     * @tc.name      state_refund_transition_targets_refund_state_only_087
     * @tc.desc      Verify state refund transition targets refund state only.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_transition_targets_refund_state_only_087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_transition_targets_refund_state_only_087');
      let order: Order = makeOrder(773, OrderState.WAIT_EVALUATE);
      let refunded: boolean = order.refund();
      expect(refunded).assertTrue();
      expect(order.state).assertEqual(OrderState.REFUND);
      expect(order.state === OrderState.COMPLETED).assertFalse();
      expect(order.state === OrderState.CANCELLED).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0880
     * @tc.name      state_cancel_and_refund_terminals_are_distinct_088
     * @tc.desc      Verify state cancel and refund terminals are distinct.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_and_refund_terminals_are_distinct_088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_and_refund_terminals_are_distinct_088');
      // cancel() and refund() both end the order but land on distinct terminal states.
      let cancelled: Order = makeOrder(774, OrderState.WAIT_DELIVERY);
      let refunded: Order = makeOrder(775, OrderState.WAIT_RECEIVE);
      cancelled.cancel();
      refunded.refund();
      expect(cancelled.state).assertEqual(OrderState.CANCELLED);
      expect(refunded.state).assertEqual(OrderState.REFUND);
      expect(cancelled.state === refunded.state).assertFalse();
      expect(cancelled.isFinal()).assertTrue();
      expect(refunded.isFinal()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0890
     * @tc.name      state_failed_refund_does_not_open_a_window_089
     * @tc.desc      Verify state failed refund does not open a window.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_failed_refund_does_not_open_a_window_089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_failed_refund_does_not_open_a_window_089');
      let order: Order = makeOrder(776, OrderState.OBLIGATION);
      expect(order.refund()).assertFalse();
      expect(order.canRefund()).assertFalse();
      expect(order.state).assertEqual(OrderState.OBLIGATION);
      expect(order.canCancel()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0900
     * @tc.name      state_advance_wins_when_refund_is_also_allowed_090
     * @tc.desc      Verify state advance wins when refund is also allowed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_advance_wins_when_refund_is_also_allowed_090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_advance_wins_when_refund_is_also_allowed_090');
      let order: Order = makeOrder(777, OrderState.WAIT_EVALUATE);
      expect(order.canRefund()).assertTrue();
      expect(order.advance()).assertTrue();
      expect(order.state).assertEqual(OrderState.COMPLETED);
      expect(order.canRefund()).assertFalse();
      expect(order.isFinal()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0910
     * @tc.name      state_label_sequence_through_cancel_path_091
     * @tc.desc      Verify state label sequence through cancel path.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_label_sequence_through_cancel_path_091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_label_sequence_through_cancel_path_091');
      let order: Order = makeOrder(778, OrderState.OBLIGATION);
      // One label per reachable state: start, after advance, then after cancel.
      let labels: string[] = [order.stateLabel()];
      order.advance();
      labels.push(order.stateLabel());
      order.cancel();
      labels.push(order.stateLabel());
      expect(labels[0]).assertEqual('obligation');
      expect(labels[1]).assertEqual('wait_delivery');
      expect(labels[2]).assertEqual('cancelled');
      expect(labels.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0920
     * @tc.name      state_label_sequence_through_refund_path_092
     * @tc.desc      Verify state label sequence through refund path.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_label_sequence_through_refund_path_092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_label_sequence_through_refund_path_092');
      let order: Order = makeOrder(779, OrderState.OBLIGATION);
      // Reads the label after each of four mutations: start, two advances, one refund.
      let labels: string[] = [order.stateLabel()];
      order.advance();
      labels.push(order.stateLabel());
      order.advance();
      labels.push(order.stateLabel());
      order.refund();
      labels.push(order.stateLabel());
      expect(labels[0]).assertEqual('obligation');
      expect(labels[1]).assertEqual('wait_delivery');
      expect(labels[2]).assertEqual('wait_receive');
      expect(labels[3]).assertEqual('refund');
      expect(labels.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0930
     * @tc.name      state_cancel_window_remains_closed_after_refund_093
     * @tc.desc      Verify state cancel window remains closed after refund.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_cancel_window_remains_closed_after_refund_093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_cancel_window_remains_closed_after_refund_093');
      let order: Order = makeOrder(780, OrderState.WAIT_EVALUATE);
      order.refund();
      expect(order.canCancel()).assertFalse();
      expect(order.canRefund()).assertFalse();
      expect(order.isFinal()).assertTrue();
      expect(order.stateLabel()).assertEqual('refund');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ORDER_STATE_0940
     * @tc.name      state_refund_window_remains_closed_after_failed_refund_094
     * @tc.desc      Verify state refund window remains closed after failed refund.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_refund_window_remains_closed_after_failed_refund_094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_refund_window_remains_closed_after_failed_refund_094');
      let order: Order = makeOrder(781, OrderState.WAIT_DELIVERY);
      expect(order.refund()).assertFalse();
      expect(order.canRefund()).assertFalse();
      expect(order.canCancel()).assertTrue();
      expect(order.state).assertEqual(OrderState.WAIT_DELIVERY);
    });
  });
}
