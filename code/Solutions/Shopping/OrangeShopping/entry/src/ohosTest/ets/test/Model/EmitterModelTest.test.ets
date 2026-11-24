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
import { EmitterEvent } from '../Shared/ShopModel';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Forwards the raw number, so NaN and Infinity stay unquoted. */
function payloadOf(goodsId: number): string {
  return EmitterEvent.cartPayload(goodsId);
}

/** Single-character matches only; a longer target always yields 0. */
function countChar(text: string, target: string): number {
  let count: number = 0;
  for (let index: number = 0; index < text.length; index++) {
    if (text.charAt(index) === target) {
      count++;
    }
  }
  return count;
}

/** Decimal width: 10 reports 2, and negatives include the sign. */
function digitCount(value: number): number {
  return value.toString().length;
}

export default function emitterModelTest() {
  describe('OrangeShoppingEmitterModel', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'emitter model suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0010
     * @tc.name      emitter_dialog_event_id_is_one_001
     * @tc.desc      Verify emitter dialog event id is one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_dialog_event_id_is_one_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_dialog_event_id_is_one_001');
      expect(EmitterEvent.DIALOG_EVENT_ID).assertEqual(1);
      expect(EmitterEvent.DIALOG_EVENT_ID > 0).assertTrue();
      expect(EmitterEvent.DIALOG_EVENT_ID < EmitterEvent.ADD_EVENT_ID).assertTrue();
      expect(Number.isInteger(EmitterEvent.DIALOG_EVENT_ID)).assertTrue();
      expect(EmitterEvent.DIALOG_EVENT_ID < 0).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0020
     * @tc.name      emitter_add_event_id_is_two_002
     * @tc.desc      Verify emitter add event id is two.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_add_event_id_is_two_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_add_event_id_is_two_002');
      expect(EmitterEvent.ADD_EVENT_ID).assertEqual(2);
      expect(EmitterEvent.ADD_EVENT_ID > 0).assertTrue();
      expect(EmitterEvent.ADD_EVENT_ID > EmitterEvent.DIALOG_EVENT_ID).assertTrue();
      expect(Number.isInteger(EmitterEvent.ADD_EVENT_ID)).assertTrue();
      expect(EmitterEvent.ADD_EVENT_ID < 0).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0030
     * @tc.name      emitter_event_ids_are_distinct_003
     * @tc.desc      Verify emitter event ids are distinct.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_event_ids_are_distinct_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_event_ids_are_distinct_003');
      expect(EmitterEvent.DIALOG_EVENT_ID !== EmitterEvent.ADD_EVENT_ID).assertTrue();
      expect(EmitterEvent.ADD_EVENT_ID - EmitterEvent.DIALOG_EVENT_ID).assertEqual(1);
      expect(EmitterEvent.DIALOG_EVENT_ID + 1).assertEqual(EmitterEvent.ADD_EVENT_ID);
      expect(EmitterEvent.DIALOG_EVENT_ID > EmitterEvent.ADD_EVENT_ID).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0040
     * @tc.name      emitter_event_ids_are_small_dispatch_values_004
     * @tc.desc      Verify emitter event ids are small dispatch values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_event_ids_are_small_dispatch_values_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_event_ids_are_small_dispatch_values_004');
      let ids: number[] = [EmitterEvent.DIALOG_EVENT_ID, EmitterEvent.ADD_EVENT_ID];
      for (let index: number = 0; index < ids.length; index++) {
        expect(ids[index] > 0).assertTrue();
        expect(ids[index] < 10).assertTrue();
        expect(Number.isInteger(ids[index])).assertTrue();
      }
      expect(ids.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0050
     * @tc.name      emitter_event_ids_are_consecutive_005
     * @tc.desc      Verify emitter event ids are consecutive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_event_ids_are_consecutive_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_event_ids_are_consecutive_005');
      expect(EmitterEvent.DIALOG_EVENT_ID + 1).assertEqual(EmitterEvent.ADD_EVENT_ID);
      expect(EmitterEvent.ADD_EVENT_ID - EmitterEvent.DIALOG_EVENT_ID).assertEqual(1);
      expect(EmitterEvent.DIALOG_EVENT_ID < EmitterEvent.ADD_EVENT_ID).assertTrue();
      expect(EmitterEvent.DIALOG_EVENT_ID * 2).assertEqual(EmitterEvent.ADD_EVENT_ID);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0060
     * @tc.name      emitter_event_ids_fit_in_one_byte_006
     * @tc.desc      Verify emitter event ids fit in one byte.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_event_ids_fit_in_one_byte_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_event_ids_fit_in_one_byte_006');
      expect(EmitterEvent.DIALOG_EVENT_ID <= 255).assertTrue();
      expect(EmitterEvent.ADD_EVENT_ID <= 255).assertTrue();
      expect(EmitterEvent.ADD_EVENT_ID < 256).assertTrue();
      expect(EmitterEvent.DIALOG_EVENT_ID < 256).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0070
     * @tc.name      emitter_cart_predicate_accepts_the_add_id_007
     * @tc.desc      Verify emitter cart predicate accepts the add id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_cart_predicate_accepts_the_add_id_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_cart_predicate_accepts_the_add_id_007');
      expect(EmitterEvent.isCartEvent(2)).assertTrue();
      expect(EmitterEvent.isCartEvent(EmitterEvent.ADD_EVENT_ID)).assertTrue();
      expect(EmitterEvent.ADD_EVENT_ID).assertEqual(2);
      expect(EmitterEvent.isCartEvent(EmitterEvent.DIALOG_EVENT_ID)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0080
     * @tc.name      emitter_cart_predicate_rejects_the_dialog_id_008
     * @tc.desc      Verify emitter cart predicate rejects the dialog id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_cart_predicate_rejects_the_dialog_id_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_cart_predicate_rejects_the_dialog_id_008');
      expect(EmitterEvent.isCartEvent(1)).assertFalse();
      expect(EmitterEvent.isCartEvent(EmitterEvent.DIALOG_EVENT_ID)).assertFalse();
      expect(EmitterEvent.isDialogEvent(EmitterEvent.DIALOG_EVENT_ID)).assertTrue();
      expect(EmitterEvent.DIALOG_EVENT_ID).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0090
     * @tc.name      emitter_dialog_predicate_accepts_the_dialog_id_009
     * @tc.desc      Verify emitter dialog predicate accepts the dialog id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_dialog_predicate_accepts_the_dialog_id_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_dialog_predicate_accepts_the_dialog_id_009');
      expect(EmitterEvent.isDialogEvent(1)).assertTrue();
      expect(EmitterEvent.isDialogEvent(EmitterEvent.DIALOG_EVENT_ID)).assertTrue();
      expect(EmitterEvent.DIALOG_EVENT_ID).assertEqual(1);
      expect(EmitterEvent.isDialogEvent(EmitterEvent.ADD_EVENT_ID)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0100
     * @tc.name      emitter_dialog_predicate_rejects_the_add_id_010
     * @tc.desc      Verify emitter dialog predicate rejects the add id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_dialog_predicate_rejects_the_add_id_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_dialog_predicate_rejects_the_add_id_010');
      expect(EmitterEvent.isDialogEvent(2)).assertFalse();
      expect(EmitterEvent.isDialogEvent(EmitterEvent.ADD_EVENT_ID)).assertFalse();
      expect(EmitterEvent.isCartEvent(EmitterEvent.ADD_EVENT_ID)).assertTrue();
      expect(EmitterEvent.ADD_EVENT_ID).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0110
     * @tc.name      emitter_predicates_reject_non_event_ids_011
     * @tc.desc      Verify emitter predicates reject non event ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_predicates_reject_non_event_ids_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_predicates_reject_non_event_ids_011');
      let ids: number[] = [0, 2.0001, 1.0001, 1.9999, 0.9999];
      // The near misses sit a fraction either side of 1 and 2, so the
      // predicates must compare exactly without rounding.
      expect(ids.length).assertEqual(5);
      for (let index: number = 0; index < ids.length; index++) {
        expect(EmitterEvent.isCartEvent(ids[index])).assertFalse();
        expect(EmitterEvent.isDialogEvent(ids[index])).assertFalse();
        expect(ids[index] < 3).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0120
     * @tc.name      emitter_negative_ids_match_neither_event_012
     * @tc.desc      Verify emitter negative ids match neither event.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_negative_ids_match_neither_event_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_negative_ids_match_neither_event_012');
      let negativeIds: number[] = [-1, -2, -99];
      for (let index: number = 0; index < negativeIds.length; index++) {
        expect(EmitterEvent.isCartEvent(negativeIds[index])).assertFalse();
        expect(EmitterEvent.isDialogEvent(negativeIds[index])).assertFalse();
        expect(negativeIds[index] < 0).assertTrue();
      }
      expect(EmitterEvent.isCartEvent(-1)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0130
     * @tc.name      emitter_unknown_positive_ids_match_neither_event_013
     * @tc.desc      Verify emitter unknown positive ids match neither event.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_unknown_positive_ids_match_neither_event_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_unknown_positive_ids_match_neither_event_013');
      let unknownIds: number[] = [3, 4, 10, 99];
      for (let index: number = 0; index < unknownIds.length; index++) {
        expect(EmitterEvent.isCartEvent(unknownIds[index])).assertFalse();
        expect(EmitterEvent.isDialogEvent(unknownIds[index])).assertFalse();
        expect(unknownIds[index] > 2).assertTrue();
      }
      expect(EmitterEvent.isCartEvent(3)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0140
     * @tc.name      emitter_large_ids_match_neither_event_014
     * @tc.desc      Verify emitter large ids match neither event.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_large_ids_match_neither_event_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_large_ids_match_neither_event_014');
      let largeIds: number[] = [1000, 2147483647];
      for (let index: number = 0; index < largeIds.length; index++) {
        expect(EmitterEvent.isCartEvent(largeIds[index])).assertFalse();
        expect(EmitterEvent.isDialogEvent(largeIds[index])).assertFalse();
        expect(largeIds[index] > 255).assertTrue();
      }
      expect(EmitterEvent.isDialogEvent(1000)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0150
     * @tc.name      emitter_fractional_ids_match_neither_event_015
     * @tc.desc      Verify emitter fractional ids match neither event.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_fractional_ids_match_neither_event_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_fractional_ids_match_neither_event_015');
      expect(EmitterEvent.isCartEvent(2.5)).assertFalse();
      expect(EmitterEvent.isDialogEvent(1.5)).assertFalse();
      expect(EmitterEvent.isCartEvent(2)).assertTrue();
      expect(EmitterEvent.isDialogEvent(1)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0160
     * @tc.name      emitter_payload_for_zero_is_exact_016
     * @tc.desc      Verify emitter payload for zero is exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_zero_is_exact_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_zero_is_exact_016');
      let payload: string = payloadOf(0);
      expect(payload).assertEqual('{"id":0}');
      // The shortest payload: six shell characters, one digit and one brace.
      expect(payload.length).assertEqual(8);
      expect(payload.indexOf('-') < 0).assertTrue();
      expect(digitCount(0)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0170
     * @tc.name      emitter_payload_for_two_digits_is_exact_017
     * @tc.desc      Verify emitter payload for two digits is exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_two_digits_is_exact_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_two_digits_is_exact_017');
      let payload: string = payloadOf(42);
      expect(payload).assertEqual('{"id":42}');
      expect(payload.length).assertEqual(9);
      expect(digitCount(42)).assertEqual(2);
      expect(payload.substring(6, 8)).assertEqual('42');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0180
     * @tc.name      emitter_payload_for_negative_id_keeps_the_sign_018
     * @tc.desc      Verify emitter payload for negative id keeps the sign.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_negative_id_keeps_the_sign_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_negative_id_keeps_the_sign_018');
      let payload: string = payloadOf(-5);
      expect(payload).assertEqual('{"id":-5}');
      expect(payload.indexOf('-5') >= 0).assertTrue();
      expect(payload.length).assertEqual(9);
      expect(payload.indexOf('-')).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0190
     * @tc.name      emitter_payload_for_minus_one_is_exact_019
     * @tc.desc      Verify emitter payload for minus one is exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_minus_one_is_exact_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_minus_one_is_exact_019');
      let payload: string = payloadOf(-1);
      expect(payload).assertEqual('{"id":-1}');
      expect(payload.length).assertEqual(9);
      expect(payload.indexOf(':-1') >= 0).assertTrue();
      expect(payload.charAt(6)).assertEqual('-');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0200
     * @tc.name      emitter_payload_for_large_id_is_exact_020
     * @tc.desc      Verify emitter payload for large id is exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_large_id_is_exact_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_large_id_is_exact_020');
      let payload: string = payloadOf(123456789);
      expect(payload).assertEqual('{"id":123456789}');
      expect(payload.length).assertEqual(16);
      expect(digitCount(123456789)).assertEqual(9);
      expect(payload.indexOf('123456789') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0210
     * @tc.name      emitter_payload_for_int32_max_is_exact_021
     * @tc.desc      Verify emitter payload for int32 max is exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_int32_max_is_exact_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_int32_max_is_exact_021');
      let payload: string = payloadOf(2147483647);
      expect(payload).assertEqual('{"id":2147483647}');
      expect(payload.indexOf('2147483647') >= 0).assertTrue();
      expect(digitCount(2147483647)).assertEqual(10);
      expect(payload.length).assertEqual(17);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0220
     * @tc.name      emitter_payload_for_max_safe_integer_is_exact_022
     * @tc.desc      Verify emitter payload for max safe integer is exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_max_safe_integer_is_exact_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_max_safe_integer_is_exact_022');
      let payload: string = payloadOf(Number.MAX_SAFE_INTEGER);
      expect(payload.indexOf('9007199254740991') >= 0).assertTrue();
      expect(payload.startsWith('{"id":')).assertTrue();
      expect(payload.endsWith('}')).assertTrue();
      // The max safe integer has 16 digits, so the 7-character shell gives 23.
      expect(digitCount(Number.MAX_SAFE_INTEGER)).assertEqual(16);
      expect(payload.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0230
     * @tc.name      emitter_payload_for_large_negative_id_is_exact_023
     * @tc.desc      Verify emitter payload for large negative id is exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_large_negative_id_is_exact_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_large_negative_id_is_exact_023');
      let payload: string = payloadOf(-123456789);
      expect(payload).assertEqual('{"id":-123456789}');
      expect(payload.length).assertEqual(17);
      expect(payload.indexOf('-123456789') >= 0).assertTrue();
      expect(payload.indexOf('-')).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0240
     * @tc.name      emitter_payload_starts_with_the_id_key_prefix_024
     * @tc.desc      Verify emitter payload starts with the id key prefix.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_starts_with_the_id_key_prefix_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_starts_with_the_id_key_prefix_024');
      let ids: number[] = [0, 42, -5, 123456789];
      for (let index: number = 0; index < ids.length; index++) {
        let payload: string = payloadOf(ids[index]);
        expect(payload.startsWith('{"id":')).assertTrue();
        expect(payload.indexOf('{')).assertEqual(0);
        expect(payload.substring(0, 6)).assertEqual('{"id":');
        expect(payload.charAt(0)).assertEqual('{');
      }
      expect(payloadOf(7).startsWith('{"id":')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0250
     * @tc.name      emitter_payload_ends_with_a_closing_brace_025
     * @tc.desc      Verify emitter payload ends with a closing brace.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_ends_with_a_closing_brace_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_ends_with_a_closing_brace_025');
      let ids: number[] = [0, 42, -5, 123456789];
      for (let index: number = 0; index < ids.length; index++) {
        let payload: string = payloadOf(ids[index]);
        expect(payload.endsWith('}')).assertTrue();
        expect(payload.lastIndexOf('}')).assertEqual(payload.length - 1);
        expect(payload.substring(payload.length - 1)).assertEqual('}');
        expect(payload.charAt(payload.length - 1)).assertEqual('}');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0260
     * @tc.name      emitter_payload_uses_a_lowercase_id_key_026
     * @tc.desc      Verify emitter payload uses a lowercase id key.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_uses_a_lowercase_id_key_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_uses_a_lowercase_id_key_026');
      let payload: string = payloadOf(42);
      expect(payload.indexOf('"id":') >= 0).assertTrue();
      expect(payload.indexOf('"ID"') < 0).assertTrue();
      expect(payload.indexOf('"Id"') < 0).assertTrue();
      // The key opens right after the brace: the quote sits at 1 and the
      // letters themselves start at 2.
      expect(payload.indexOf('"id"')).assertEqual(1);
      expect(payload.indexOf('id')).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0270
     * @tc.name      emitter_payload_has_no_spaces_for_any_id_027
     * @tc.desc      Verify emitter payload has no spaces for any id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_has_no_spaces_for_any_id_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_has_no_spaces_for_any_id_027');
      let ids: number[] = [0, 7, 42, -5, 1000, 123456789];
      for (let index: number = 0; index < ids.length; index++) {
        let payload: string = payloadOf(ids[index]);
        expect(payload.indexOf(' ') < 0).assertTrue();
        expect(payload.indexOf(' ')).assertEqual(-1);
      }
      expect(payloadOf(42).indexOf(' ') >= 0).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0280
     * @tc.name      emitter_payload_has_no_control_whitespace_028
     * @tc.desc      Verify emitter payload has no control whitespace.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_has_no_control_whitespace_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_has_no_control_whitespace_028');
      let ids: number[] = [0, 7, 42, -5, 1000];
      for (let index: number = 0; index < ids.length; index++) {
        let payload: string = payloadOf(ids[index]);
        expect(payload.indexOf('\t') < 0).assertTrue();
        expect(payload.indexOf('\n') < 0).assertTrue();
        expect(payload.indexOf('\r') < 0).assertTrue();
        expect(payload.indexOf('\t')).assertEqual(-1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0290
     * @tc.name      emitter_payload_has_no_leading_or_trailing_whitespace_029
     * @tc.desc      Verify emitter payload has no leading or trailing whitespace.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_has_no_leading_or_trailing_whitespace_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_has_no_leading_or_trailing_whitespace_029');
      let payload: string = payloadOf(42);
      expect(payload.charAt(0)).assertEqual('{');
      expect(payload.charAt(payload.length - 1)).assertEqual('}');
      expect(payload.length > 0).assertTrue();
      expect(payload.trim().length).assertEqual(payload.length);
      expect(payload.trim()).assertEqual(payload);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0300
     * @tc.name      emitter_payload_braces_are_balanced_030
     * @tc.desc      Verify emitter payload braces are balanced.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_braces_are_balanced_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_braces_are_balanced_030');
      let ids: number[] = [0, 42, -5, 123456789];
      for (let index: number = 0; index < ids.length; index++) {
        let payload: string = payloadOf(ids[index]);
        expect(countChar(payload, '{')).assertEqual(1);
        expect(countChar(payload, '}')).assertEqual(1);
        expect(payload.indexOf('{') < payload.indexOf('}')).assertTrue();
        expect(payload.indexOf('{')).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0310
     * @tc.name      emitter_payload_has_exactly_two_quotes_031
     * @tc.desc      Verify emitter payload has exactly two quotes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_has_exactly_two_quotes_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_has_exactly_two_quotes_031');
      let ids: number[] = [0, 42, -5, 123456789];
      for (let index: number = 0; index < ids.length; index++) {
        let payload: string = payloadOf(ids[index]);
        expect(countChar(payload, '"')).assertEqual(2);
        // The pair brackets the two-letter key, so the quotes sit at 1 and 4.
        expect(payload.indexOf('"')).assertEqual(1);
        expect(payload.lastIndexOf('"')).assertEqual(4);
      }
      expect(countChar(payloadOf(7), '"')).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0320
     * @tc.name      emitter_payload_has_exactly_one_colon_032
     * @tc.desc      Verify emitter payload has exactly one colon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_has_exactly_one_colon_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_has_exactly_one_colon_032');
      let ids: number[] = [0, 42, -5, 123456789];
      for (let index: number = 0; index < ids.length; index++) {
        let payload: string = payloadOf(ids[index]);
        expect(countChar(payload, ':')).assertEqual(1);
        // '{', opening quote, 'i', 'd', closing quote fill 0..4, so the colon
        // lands at 5 whatever the id is.
        expect(payload.indexOf(':')).assertEqual(5);
        expect(payload.charAt(5)).assertEqual(':');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0330
     * @tc.name      emitter_payload_inner_value_equals_the_id_text_033
     * @tc.desc      Verify emitter payload inner value equals the id text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_inner_value_equals_the_id_text_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_inner_value_equals_the_id_text_033');
      let ids: number[] = [0, 7, 42, -5];
      for (let index: number = 0; index < ids.length; index++) {
        let payload: string = payloadOf(ids[index]);
        expect(payload.substring(6, payload.length - 1)).assertEqual(ids[index].toString());
        expect(payload.substring(6, payload.length - 1)).assertEqual(ids[index].toString());
      }
      expect(payloadOf(42).substring(6, 8)).assertEqual('42');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0340
     * @tc.name      emitter_payload_length_is_seven_plus_digits_034
     * @tc.desc      Verify emitter payload length is seven plus digits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_length_is_seven_plus_digits_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_length_is_seven_plus_digits_034');
      let ids: number[] = [0, 9, 42, 999, 12345];
      // Brace, two quotes, 'id', colon and closing brace are seven fixed
      // characters, so only the digit text varies with the id.
      for (let index: number = 0; index < ids.length; index++) {
        let payload: string = payloadOf(ids[index]);
        expect(payload.length).assertEqual(7 + digitCount(ids[index]));
        expect(payload.length).assertEqual(6 + digitCount(ids[index]) + 1);
        expect(payload.length).assertEqual(payload.substring(6, payload.length - 1).length + 7);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0350
     * @tc.name      emitter_payload_grows_by_one_digit_across_nine_and_ten_035
     * @tc.desc      Verify emitter payload grows by one digit across nine and ten.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_grows_by_one_digit_across_nine_and_ten_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_grows_by_one_digit_across_nine_and_ten_035');
      let nine: string = payloadOf(9);
      let ten: string = payloadOf(10);
      expect(ten.length - nine.length).assertEqual(1);
      expect(nine.length).assertEqual(8);
      expect(ten.length).assertEqual(9);
      expect(nine).assertEqual('{"id":9}');
      expect(ten).assertEqual('{"id":10}');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0360
     * @tc.name      emitter_payload_grows_by_one_digit_across_99_and_036
     * @tc.desc      Verify emitter payload grows by one digit across 99 and 100.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_grows_by_one_digit_across_99_and_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_grows_by_one_digit_across_99_and_036');
      let ninetyNine: string = payloadOf(99);
      let hundred: string = payloadOf(100);
      expect(hundred.length - ninetyNine.length).assertEqual(1);
      expect(ninetyNine).assertEqual('{"id":99}');
      expect(hundred).assertEqual('{"id":100}');
      expect(hundred.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0370
     * @tc.name      emitter_payload_is_stable_for_the_same_id_037
     * @tc.desc      Verify emitter payload is stable for the same id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_is_stable_for_the_same_id_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_is_stable_for_the_same_id_037');
      let ids: number[] = [0, 7, 42, -5, 123456789];
      for (let index: number = 0; index < ids.length; index++) {
        let first: string = payloadOf(ids[index]);
        let second: string = payloadOf(ids[index]);
        expect(first).assertEqual(second);
        expect(first.length).assertEqual(second.length);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0380
     * @tc.name      emitter_payload_is_stable_across_other_calls_038
     * @tc.desc      Verify emitter payload is stable across other calls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_is_stable_across_other_calls_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_is_stable_across_other_calls_038');
      let before: string = payloadOf(42);
      payloadOf(7);
      payloadOf(-5);
      payloadOf(123456789);
      let after: string = payloadOf(42);
      expect(before).assertEqual(after);
      expect(after).assertEqual('{"id":42}');
      expect(before.length).assertEqual(after.length);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0390
     * @tc.name      emitter_payload_differs_for_different_ids_039
     * @tc.desc      Verify emitter payload differs for different ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_differs_for_different_ids_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_differs_for_different_ids_039');
      expect(payloadOf(1) !== payloadOf(2)).assertTrue();
      expect(payloadOf(42) !== payloadOf(-42)).assertTrue();
      expect(payloadOf(7) !== payloadOf(70)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0400
     * @tc.name      emitter_payload_negative_sign_sits_before_the_digits_040
     * @tc.desc      Verify emitter payload negative sign sits before the digits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_negative_sign_sits_before_the_digits_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_negative_sign_sits_before_the_digits_040');
      let payload: string = payloadOf(-5);
      expect(payload.indexOf('-')).assertEqual(6);
      expect(payload.charAt(6)).assertEqual('-');
      expect(payload.substring(6, 8)).assertEqual('-5');
      expect(payload.indexOf('-') < payload.indexOf('5')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0410
     * @tc.name      emitter_payload_has_no_thousands_separators_041
     * @tc.desc      Verify emitter payload has no thousands separators.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_has_no_thousands_separators_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_has_no_thousands_separators_041');
      let payload: string = payloadOf(123456789);
      expect(payload.indexOf(',') < 0).assertTrue();
      expect(payload.indexOf('_') < 0).assertTrue();
      expect(payload.indexOf(' ') < 0).assertTrue();
      expect(payload.indexOf(',')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0420
     * @tc.name      emitter_payload_has_no_exponent_notation_042
     * @tc.desc      Verify emitter payload has no exponent notation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_has_no_exponent_notation_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_has_no_exponent_notation_042');
      let payload: string = payloadOf(123456789);
      expect(payload.indexOf('e') < 0).assertTrue();
      expect(payload.indexOf('E') < 0).assertTrue();
      expect(payload.indexOf('123456789') >= 0).assertTrue();
      expect(payload.indexOf('e')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0430
     * @tc.name      emitter_payload_does_not_contain_event_names_043
     * @tc.desc      Verify emitter payload does not contain event names.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_does_not_contain_event_names_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_does_not_contain_event_names_043');
      let payload: string = payloadOf(42);
      expect(payload.indexOf('DIALOG') < 0).assertTrue();
      expect(payload.indexOf('ADD') < 0).assertTrue();
      expect(payload.indexOf('cart') < 0).assertTrue();
      expect(payload.indexOf('dialog') < 0).assertTrue();
      expect(payload.indexOf('id') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0440
     * @tc.name      emitter_payload_preserves_every_digit_of_a_large_id_044
     * @tc.desc      Verify emitter payload preserves every digit of a large id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_preserves_every_digit_of_a_large_id_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_preserves_every_digit_of_a_large_id_044');
      let payload: string = payloadOf(987654321);
      expect(payload.indexOf('987654321') >= 0).assertTrue();
      expect(digitCount(987654321)).assertEqual(9);
      expect(payload.length).assertEqual(16);
      expect(payload.lastIndexOf('}')).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0450
     * @tc.name      emitter_payload_for_two_similar_ids_differs_only_by_digits_045
     * @tc.desc      Verify emitter payload for two similar ids differs only by digits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_two_similar_ids_differs_only_by_digits_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_two_similar_ids_differs_only_by_digits_045');
      let first: string = payloadOf(123);
      let second: string = payloadOf(124);
      expect(first.length).assertEqual(second.length);
      expect(first !== second).assertTrue();
      expect(first.substring(0, 6)).assertEqual(second.substring(0, 6));
      expect(first.substring(9)).assertEqual(second.substring(9));
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0460
     * @tc.name      emitter_payload_for_max_safe_integer_keeps_all_digits_046
     * @tc.desc      Verify emitter payload for max safe integer keeps all digits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_max_safe_integer_keeps_all_digits_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_max_safe_integer_keeps_all_digits_046');
      let payload: string = payloadOf(Number.MAX_SAFE_INTEGER);
      expect(payload.length).assertEqual(23);
      // '9007199254740991' holds five 9 digits, a checksum that the whole
      // 16-digit text survived the concatenation.
      expect(countChar(payload, '9')).assertEqual(5);
      expect(payload.indexOf('9007199254740991') >= 0).assertTrue();
      expect(payload.indexOf('}')).assertEqual(22);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0470
     * @tc.name      emitter_payload_for_negative_zero_uses_zero_text_047
     * @tc.desc      Verify emitter payload for negative zero uses zero text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_negative_zero_uses_zero_text_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_negative_zero_uses_zero_text_047');
      // String(-0) is '0', so no minus sign ever reaches the payload.
      let payload: string = payloadOf(-0);
      expect(payload).assertEqual('{"id":0}');
      expect(payload.indexOf('-') < 0).assertTrue();
      expect(payload.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0480
     * @tc.name      emitter_payload_for_negative_values_is_exact_048
     * @tc.desc      Verify emitter payload for negative values is exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_negative_values_is_exact_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_negative_values_is_exact_048');
      let values: number[] = [-2147483648, -10, -1000];
      let expected: string[] = ['{"id":-2147483648}', '{"id":-10}', '{"id":-1000}'];
      let lengths: number[] = [18, 10, 12];
      expect(values.length).assertEqual(expected.length);
      for (let index: number = 0; index < values.length; index++) {
        let payload: string = payloadOf(values[index]);
        expect(payload).assertEqual(expected[index]);
        expect(payload.length).assertEqual(lengths[index]);
        expect(payload.indexOf('-')).assertEqual(6);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0490
     * @tc.name      emitter_payload_for_id_above_int32_max_is_exact_049
     * @tc.desc      Verify emitter payload for id above int32 max is exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_id_above_int32_max_is_exact_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_id_above_int32_max_is_exact_049');
      let payload: string = payloadOf(2147483648);
      expect(payload).assertEqual('{"id":2147483648}');
      expect(payload.length).assertEqual(17);
      expect(payload.indexOf('2147483648') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0500
     * @tc.name      emitter_payload_for_min_safe_integer_is_exact_050
     * @tc.desc      Verify emitter payload for min safe integer is exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_min_safe_integer_is_exact_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_min_safe_integer_is_exact_050');
      let payload: string = payloadOf(Number.MIN_SAFE_INTEGER);
      expect(payload.indexOf('-9007199254740991') >= 0).assertTrue();
      expect(payload.length).assertEqual(24);
      expect(payload.indexOf('-')).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0510
     * @tc.name      emitter_payload_for_negative_hundred_and_million_is_exact_051
     * @tc.desc      Verify emitter payload for negative hundred and million is exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_negative_hundred_and_million_is_exact_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s',
        'CASE: emitter_payload_for_negative_hundred_and_million_is_exact_051');
      let values: number[] = [-100, -1000000];
      let expected: string[] = ['{"id":-100}', '{"id":-1000000}'];
      let lengths: number[] = [11, 15];
      let fragments: string[] = [':-100', '-1000000'];
      expect(values.length).assertEqual(expected.length);
      for (let index: number = 0; index < values.length; index++) {
        let payload: string = payloadOf(values[index]);
        expect(payload).assertEqual(expected[index]);
        expect(payload.length).assertEqual(lengths[index]);
        expect(payload.indexOf(fragments[index]) >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0520
     * @tc.name      emitter_payload_for_nan_uses_nan_text_052
     * @tc.desc      Verify emitter payload for nan uses nan text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_nan_uses_nan_text_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_nan_uses_nan_text_052');
      // The payload is plain concatenation, so NaN is pasted in unquoted and
      // contributes three characters instead of a numeric value.
      let payload: string = payloadOf(Number.NaN);
      expect(payload).assertEqual('{"id":NaN}');
      expect(payload.indexOf('NaN') >= 0).assertTrue();
      expect(payload.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0530
     * @tc.name      emitter_payload_for_infinity_uses_infinity_text_053
     * @tc.desc      Verify emitter payload for infinity uses infinity text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_infinity_uses_infinity_text_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_infinity_uses_infinity_text_053');
      let payload: string = payloadOf(Number.POSITIVE_INFINITY);
      expect(payload).assertEqual('{"id":Infinity}');
      expect(payload.indexOf('Infinity') >= 0).assertTrue();
      expect(payload.length).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0540
     * @tc.name      emitter_payload_for_negative_infinity_keeps_the_sign_054
     * @tc.desc      Verify emitter payload for negative infinity keeps the sign.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_negative_infinity_keeps_the_sign_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_negative_infinity_keeps_the_sign_054');
      let payload: string = payloadOf(Number.NEGATIVE_INFINITY);
      expect(payload).assertEqual('{"id":-Infinity}');
      expect(payload.indexOf('-Infinity') >= 0).assertTrue();
      expect(payload.length).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0550
     * @tc.name      emitter_payload_for_fractional_id_uses_a_decimal_point_055
     * @tc.desc      Verify emitter payload for fractional id uses a decimal point.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_fractional_id_uses_a_decimal_point_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_fractional_id_uses_a_decimal_point_055');
      let payload: string = payloadOf(1.5);
      expect(payload).assertEqual('{"id":1.5}');
      expect(payload.indexOf('1.5') >= 0).assertTrue();
      expect(countChar(payload, '.')).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0560
     * @tc.name      emitter_payload_for_negative_fraction_keeps_the_sign_056
     * @tc.desc      Verify emitter payload for negative fraction keeps the sign.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_negative_fraction_keeps_the_sign_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_negative_fraction_keeps_the_sign_056');
      let payload: string = payloadOf(-0.5);
      expect(payload).assertEqual('{"id":-0.5}');
      expect(payload.indexOf('-')).assertEqual(6);
      expect(payload.indexOf('-0.5') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0570
     * @tc.name      emitter_payload_for_one_tenth_uses_a_decimal_point_057
     * @tc.desc      Verify emitter payload for one tenth uses a decimal point.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_one_tenth_uses_a_decimal_point_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_one_tenth_uses_a_decimal_point_057');
      let payload: string = payloadOf(0.1);
      expect(payload).assertEqual('{"id":0.1}');
      expect(payload.length).assertEqual(10);
      expect(countChar(payload, '.')).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0580
     * @tc.name      emitter_payload_for_one_and_a_quarter_keeps_two_decimals_058
     * @tc.desc      Verify emitter payload for one and a quarter keeps two decimals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_one_and_a_quarter_keeps_two_decimals_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_one_and_a_quarter_keeps_two_decimals_058');
      let payload: string = payloadOf(1.25);
      expect(payload).assertEqual('{"id":1.25}');
      expect(payload.endsWith('1.25}')).assertTrue();
      expect(payload.length).assertEqual(11);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0590
     * @tc.name      emitter_predicates_reject_nan_059
     * @tc.desc      Verify emitter predicates reject nan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_predicates_reject_nan_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_predicates_reject_nan_059');
      expect(EmitterEvent.isCartEvent(Number.NaN)).assertFalse();
      expect(EmitterEvent.isDialogEvent(Number.NaN)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0600
     * @tc.name      emitter_predicates_reject_infinity_060
     * @tc.desc      Verify emitter predicates reject infinity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_predicates_reject_infinity_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_predicates_reject_infinity_060');
      expect(EmitterEvent.isCartEvent(Number.POSITIVE_INFINITY)).assertFalse();
      expect(EmitterEvent.isDialogEvent(Number.POSITIVE_INFINITY)).assertFalse();
      expect(EmitterEvent.isCartEvent(Number.NEGATIVE_INFINITY)).assertFalse();
      expect(EmitterEvent.isDialogEvent(Number.NEGATIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0610
     * @tc.name      emitter_predicates_accept_integral_equivalent_numbers_061
     * @tc.desc      Verify emitter predicates accept integral equivalent numbers.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_predicates_accept_integral_equivalent_numbers_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_predicates_accept_integral_equivalent_numbers_061');
      expect(EmitterEvent.isCartEvent(2.0)).assertTrue();
      expect(EmitterEvent.isDialogEvent(1.0)).assertTrue();
      expect(EmitterEvent.ADD_EVENT_ID).assertEqual(2);
      expect(EmitterEvent.DIALOG_EVENT_ID).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0620
     * @tc.name      emitter_event_ids_sum_to_three_062
     * @tc.desc      Verify emitter event ids sum to three.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_event_ids_sum_to_three_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_event_ids_sum_to_three_062');
      expect(EmitterEvent.DIALOG_EVENT_ID + EmitterEvent.ADD_EVENT_ID).assertEqual(3);
      expect(EmitterEvent.DIALOG_EVENT_ID).assertEqual(1);
      expect(EmitterEvent.ADD_EVENT_ID - EmitterEvent.DIALOG_EVENT_ID).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0630
     * @tc.name      emitter_event_ids_fit_int32_063
     * @tc.desc      Verify emitter event ids fit int32.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_event_ids_fit_int32_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_event_ids_fit_int32_063');
      expect(EmitterEvent.DIALOG_EVENT_ID < 2147483647).assertTrue();
      expect(EmitterEvent.ADD_EVENT_ID < 2147483647).assertTrue();
      expect(EmitterEvent.DIALOG_EVENT_ID > -2147483648).assertTrue();
      expect(EmitterEvent.ADD_EVENT_ID > -2147483648).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0640
     * @tc.name      emitter_payload_for_100_is_exact_064
     * @tc.desc      Verify emitter payload for 100 is exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_for_100_is_exact_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_for_100_is_exact_064');
      let payload: string = payloadOf(100);
      expect(payload).assertEqual('{"id":100}');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0650
     * @tc.name      emitter_payload_embeds_the_id_text_for_representative_widths_065
     * @tc.desc      Verify emitter payload embeds the id text for representative widths.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_embeds_the_id_text_for_representative_widths_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_embeds_the_id_text_for_representative_widths_065');
      let ids: number[] = [5, 99, 100, 2147483646];
      // One, two, three and ten digit ids force the slice end to move with the
      // text width in every round.
      expect(ids.length).assertEqual(4);
      for (let index: number = 0; index < ids.length; index++) {
        let payload: string = payloadOf(ids[index]);
        let idText: string = ids[index].toString();
        expect(payload.startsWith('{"id":')).assertTrue();
        expect(payload.endsWith('}')).assertTrue();
        expect(payload.substring(6, payload.length - 1)).assertEqual(idText);
        expect(payload.length).assertEqual(idText.length + 7);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0660
     * @tc.name      emitter_payload_width_grows_by_one_at_each_digit_boundary_066
     * @tc.desc      Verify emitter payload width grows by one at each digit boundary.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_payload_width_grows_by_one_at_each_digit_boundary_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_payload_width_grows_by_one_at_each_digit_boundary_066');
      let lower: number[] = [9, 99, 999];
      let upper: number[] = [10, 100, 1000];
      expect(lower.length).assertEqual(upper.length);
      for (let index: number = 0; index < lower.length; index++) {
        let shorter: string = payloadOf(lower[index]);
        let longer: string = payloadOf(upper[index]);
        expect(longer.length - shorter.length).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0670
     * @tc.name      emitter_predicates_select_exactly_one_event_kind_067
     * @tc.desc      Verify emitter predicates select exactly one event kind.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_predicates_select_exactly_one_event_kind_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_predicates_select_exactly_one_event_kind_067');
      let ids: number[] = [EmitterEvent.DIALOG_EVENT_ID, EmitterEvent.ADD_EVENT_ID, 1, 2];
      let dialogFlags: boolean[] = [true, false, true, false];
      let cartFlags: boolean[] = [false, true, false, true];
      expect(ids.length).assertEqual(dialogFlags.length);
      for (let index: number = 0; index < ids.length; index++) {
        expect(EmitterEvent.isDialogEvent(ids[index])).assertEqual(dialogFlags[index]);
        expect(EmitterEvent.isCartEvent(ids[index])).assertEqual(cartFlags[index]);
        expect(EmitterEvent.isDialogEvent(ids[index]) === EmitterEvent.isCartEvent(ids[index])).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_EMITTER_MODEL_0680
     * @tc.name      emitter_predicates_reject_extreme_ids_without_losing_known_ones_068
     * @tc.desc      Verify emitter predicates reject extreme ids without losing known ones.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('emitter_predicates_reject_extreme_ids_without_losing_known_ones_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: emitter_predicates_reject_extreme_ids_without_losing_known_ones_068');
      let extremes: number[] = [Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER];
      for (let index: number = 0; index < extremes.length; index++) {
        expect(EmitterEvent.isCartEvent(extremes[index])).assertFalse();
        expect(EmitterEvent.isDialogEvent(extremes[index])).assertFalse();
      }
      // The two safe-integer extremes must not poison the later checks, which
      // still accept the exact ids 2 and 1.
      expect(EmitterEvent.isCartEvent(EmitterEvent.ADD_EVENT_ID)).assertTrue();
      expect(EmitterEvent.isDialogEvent(EmitterEvent.DIALOG_EVENT_ID)).assertTrue();
    });

  });
}
