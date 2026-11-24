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
import { Money } from '../Shared/ShopModel';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Fractional cents pass through Math.round, so -0.5 becomes -0. */
function moneyFrom(cents: number): Money {
  return new Money(cents);
}

/** ofYuan scales by 100 and rounds; NaN and Infinity are rejected. */
function yuanMoney(yuan: number): Money {
  return Money.ofYuan(yuan);
}

function addMoney(left: Money, right: Money): Money {
  return left.add(right);
}

function multiplyMoney(value: Money, quantity: number): Money {
  return value.multiply(quantity);
}

function percentOfMoney(value: Money, percent: number): Money {
  return value.percentage(percent);
}

/** Folds left to right; a total of Infinity throws during construction. */
function sumMoney(values: Money[]): Money {
  return Money.sum(values);
}

export default function moneySpecialValuesTest() {
  describe('OrangeShoppingMoneySpecialValues', () => {
    let zeroValue: Money = new Money(1);

    beforeAll(() => {
      zeroValue = Money.zero();
      hilog.info(DOMAIN, TAG, '%{public}s', 'money special values suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0010
     * @tc.name      zero_amount_reports_zero_state_001
     * @tc.desc      Verify zero amount reports zero state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_amount_reports_zero_state_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_amount_reports_zero_state_001');
      let amount: Money = new Money(0);
      expect(amount.cents()).assertEqual(0);
      expect(amount.isZero()).assertTrue();
      expect(amount.equals(zeroValue)).assertTrue();
      expect(amount.compareTo(zeroValue)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0020
     * @tc.name      zero_amount_is_neither_positive_nor_negative_002
     * @tc.desc      Verify zero amount is neither positive nor negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_amount_is_neither_positive_nor_negative_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_amount_is_neither_positive_nor_negative_002');
      let amount: Money = Money.zero();
      expect(amount.isPositive()).assertFalse();
      expect(amount.isNegative()).assertFalse();
      expect(amount.isZero()).assertTrue();
      expect(amount.cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0030
     * @tc.name      negative_zero_equals_positive_zero_003
     * @tc.desc      Verify negative zero equals positive zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_zero_equals_positive_zero_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_zero_equals_positive_zero_003');
      let negativeZero: Money = new Money(-0);
      let positiveZero: Money = new Money(0);
      expect(negativeZero.equals(positiveZero)).assertTrue();
      expect(positiveZero.equals(negativeZero)).assertTrue();
      // Math.round can hand back -0, a distinct value that still compares as equal to 0.
      expect(negativeZero.cents() === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0040
     * @tc.name      negative_zero_is_not_negative_004
     * @tc.desc      Verify negative zero is not negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_zero_is_not_negative_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_zero_is_not_negative_004');
      let amount: Money = new Money(-0);
      expect(amount.isZero()).assertTrue();
      expect(amount.isNegative()).assertFalse();
      expect(amount.isPositive()).assertFalse();
      expect(amount.cents() === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0050
     * @tc.name      negative_zero_formats_without_sign_005
     * @tc.desc      Verify negative zero formats without sign.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_zero_formats_without_sign_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_zero_formats_without_sign_005');
      let text: string = new Money(-0).format();
      // The sign branch needs cents < 0, which -0 is not, so the output stays '¥0.00'.
      expect(text).assertEqual('¥0.00');
      expect(text.indexOf('-')).assertEqual(-1);
      expect(text.charAt(2)).assertEqual('.');
      expect(text.charCodeAt(0)).assertEqual(165);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0060
     * @tc.name      negative_zero_compare_to_zero_is_equal_006
     * @tc.desc      Verify negative zero compare to zero is equal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_zero_compare_to_zero_is_equal_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_zero_compare_to_zero_is_equal_006');
      let amount: Money = new Money(-0);
      let zero: Money = Money.zero();
      expect(amount.compareTo(zero)).assertEqual(0);
      expect(zero.compareTo(amount)).assertEqual(0);
      expect(amount.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0070
     * @tc.name      negative_zero_add_zero_is_zero_007
     * @tc.desc      Verify negative zero add zero is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_zero_add_zero_is_zero_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_zero_add_zero_is_zero_007');
      let amount: Money = new Money(-0);
      let sum: Money = addMoney(amount, Money.zero());
      expect(sum.cents()).assertEqual(0);
      expect(sum.isZero()).assertTrue();
      expect(sum.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0080
     * @tc.name      negative_zero_clamp_is_zero_008
     * @tc.desc      Verify negative zero clamp is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_zero_clamp_is_zero_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_zero_clamp_is_zero_008');
      let amount: Money = new Money(-0);
      let clamped: Money = amount.clampAtZero();
      expect(clamped.cents() === 0).assertTrue();
      expect(clamped.isZero()).assertTrue();
      expect(clamped.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0090
     * @tc.name      negative_zero_scaling_stays_zero_009
     * @tc.desc      Verify negative zero scaling stays zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_zero_scaling_stays_zero_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_zero_scaling_stays_zero_009');
      let factors: number[] = [500, 0];
      let amount: Money = new Money(-0);
      expect(factors.length).assertEqual(2);
      for (let index: number = 0; index < factors.length; index++) {
        let scaled: Money = multiplyMoney(amount, factors[index]);
        expect(scaled.cents() === 0).assertTrue();
        expect(scaled.isZero()).assertTrue();
        expect(scaled.isNegative()).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0100
     * @tc.name      negative_half_rounds_to_negative_zero_010
     * @tc.desc      Verify negative half rounds to negative zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_half_rounds_to_negative_zero_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_half_rounds_to_negative_zero_010');
      let amount: Money = moneyFrom(-0.5);
      // Math.round(-0.5) returns -0 rather than -1, so half a cent vanishes instead of rounding away.
      expect(amount.cents() === 0).assertTrue();
      expect(amount.isZero()).assertTrue();
      expect(amount.isNegative()).assertFalse();
      expect(amount.format()).assertEqual('¥0.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0110
     * @tc.name      one_cent_is_smallest_positive_unit_011
     * @tc.desc      Verify one cent is smallest positive unit.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_is_smallest_positive_unit_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_is_smallest_positive_unit_011');
      let amount: Money = new Money(1);
      expect(amount.cents()).assertEqual(1);
      expect(amount.isPositive()).assertTrue();
      expect(amount.isZero()).assertFalse();
      expect(amount.compareTo(Money.zero())).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0120
     * @tc.name      one_cent_plus_one_cent_is_two_012
     * @tc.desc      Verify one cent plus one cent is two.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_plus_one_cent_is_two_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_plus_one_cent_is_two_012');
      let one: Money = new Money(1);
      let sum: Money = addMoney(one, one);
      expect(sum.cents()).assertEqual(2);
      expect(sum.equals(new Money(2))).assertTrue();
      expect(sum.compareTo(one)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0130
     * @tc.name      one_cent_accumulates_to_one_yuan_013
     * @tc.desc      Verify one cent accumulates to one yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_accumulates_to_one_yuan_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_accumulates_to_one_yuan_013');
      let parts: Money[] = [];
      for (let index: number = 0; index < 100; index++) {
        parts.push(new Money(1));
      }
      // One hundred separate single-cent values are folded by Money.sum, so this covers accumulation, not multiplication.
      let total: Money = sumMoney(parts);
      expect(total.cents()).assertEqual(100);
      expect(total.format()).assertEqual('¥1.00');
      expect(total.equals(new Money(100))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0140
     * @tc.name      one_cent_multiplied_by_99_014
     * @tc.desc      Verify one cent multiplied by 99.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_multiplied_by_99_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_multiplied_by_99_014');
      let unit: Money = new Money(1);
      let total: Money = multiplyMoney(unit, 99);
      expect(total.cents()).assertEqual(99);
      expect(total.format()).assertEqual('¥0.99');
      expect(total.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0150
     * @tc.name      one_cent_compare_to_zero_015
     * @tc.desc      Verify one cent compare to zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_compare_to_zero_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_compare_to_zero_015');
      let amount: Money = new Money(1);
      expect(amount.compareTo(Money.zero())).assertEqual(1);
      expect(amount.equals(Money.zero())).assertFalse();
      expect(amount.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0160
     * @tc.name      one_cent_minus_one_cent_is_zero_016
     * @tc.desc      Verify one cent minus one cent is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_minus_one_cent_is_zero_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_minus_one_cent_is_zero_016');
      let one: Money = new Money(1);
      let difference: Money = one.subtract(one);
      expect(difference.cents()).assertEqual(0);
      expect(difference.isZero()).assertTrue();
      expect(difference.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0170
     * @tc.name      negative_one_cent_is_negative_017
     * @tc.desc      Verify negative one cent is negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_one_cent_is_negative_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_one_cent_is_negative_017');
      let amount: Money = new Money(-1);
      expect(amount.cents()).assertEqual(-1);
      expect(amount.isNegative()).assertTrue();
      expect(amount.isPositive()).assertFalse();
      expect(amount.isZero()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0180
     * @tc.name      negative_one_cent_formats_with_minus_018
     * @tc.desc      Verify negative one cent formats with minus.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_one_cent_formats_with_minus_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_one_cent_formats_with_minus_018');
      let text: string = new Money(-1).format();
      // Six characters: minus, currency sign, 0, dot, 0, 1, with the minus deliberately before the sign.
      expect(text).assertEqual('-¥0.01');
      expect(text.charAt(0)).assertEqual('-');
      expect(text.substring(1)).assertEqual('¥0.01');
      expect(text.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0190
     * @tc.name      zero_minus_one_cent_is_negative_one_019
     * @tc.desc      Verify zero minus one cent is negative one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_minus_one_cent_is_negative_one_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_minus_one_cent_is_negative_one_019');
      let balance: Money = Money.zero().subtract(new Money(1));
      expect(balance.cents()).assertEqual(-1);
      expect(balance.isNegative()).assertTrue();
      expect(balance.compareTo(Money.zero())).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0200
     * @tc.name      negative_one_cent_compares_below_zero_020
     * @tc.desc      Verify negative one cent compares below zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_one_cent_compares_below_zero_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_one_cent_compares_below_zero_020');
      let amount: Money = new Money(-1);
      expect(amount.compareTo(Money.zero())).assertEqual(-1);
      expect(Money.zero().compareTo(amount)).assertEqual(1);
      expect(amount.equals(Money.zero())).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0210
     * @tc.name      negative_one_cent_clamps_to_zero_021
     * @tc.desc      Verify negative one cent clamps to zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_one_cent_clamps_to_zero_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_one_cent_clamps_to_zero_021');
      let amount: Money = new Money(-1);
      let clamped: Money = amount.clampAtZero();
      expect(clamped.cents()).assertEqual(0);
      expect(clamped.isZero()).assertTrue();
      expect(amount.cents()).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0220
     * @tc.name      negative_one_cent_plus_one_cent_is_zero_022
     * @tc.desc      Verify negative one cent plus one cent is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_one_cent_plus_one_cent_is_zero_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_one_cent_plus_one_cent_is_zero_022');
      let sum: Money = new Money(-1).add(new Money(1));
      expect(sum.cents()).assertEqual(0);
      expect(sum.isZero()).assertTrue();
      expect(sum.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0230
     * @tc.name      max_safe_integer_is_constructible_023
     * @tc.desc      Verify max safe integer is constructible.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_is_constructible_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_is_constructible_023');
      let amount: Money = new Money(Number.MAX_SAFE_INTEGER);
      expect(amount.cents()).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(amount.isPositive()).assertTrue();
      expect(amount.isZero()).assertFalse();
      expect(Number.isInteger(amount.cents())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0240
     * @tc.name      max_safe_integer_compare_orders_024
     * @tc.desc      Verify max safe integer compare orders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_compare_orders_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_compare_orders_024');
      let max: Money = new Money(Number.MAX_SAFE_INTEGER);
      let lower: Money = new Money(Number.MAX_SAFE_INTEGER - 1);
      expect(max.compareTo(lower)).assertEqual(1);
      expect(lower.compareTo(max)).assertEqual(-1);
      expect(max.equals(lower)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0250
     * @tc.name      max_safe_integer_minus_itself_is_zero_025
     * @tc.desc      Verify max safe integer minus itself is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_minus_itself_is_zero_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_minus_itself_is_zero_025');
      let max: Money = new Money(Number.MAX_SAFE_INTEGER);
      let difference: Money = max.subtract(max);
      expect(difference.cents()).assertEqual(0);
      expect(difference.isZero()).assertTrue();
      expect(difference.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0260
     * @tc.name      max_safe_integer_multiplied_by_zero_is_zero_026
     * @tc.desc      Verify max safe integer multiplied by zero is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_multiplied_by_zero_is_zero_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_multiplied_by_zero_is_zero_026');
      let max: Money = new Money(Number.MAX_SAFE_INTEGER);
      let zero: Money = multiplyMoney(max, 0);
      expect(zero.cents()).assertEqual(0);
      expect(zero.isZero()).assertTrue();
      expect(zero.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0270
     * @tc.name      max_safe_integer_plus_zero_is_unchanged_027
     * @tc.desc      Verify max safe integer plus zero is unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_plus_zero_is_unchanged_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_plus_zero_is_unchanged_027');
      let max: Money = new Money(Number.MAX_SAFE_INTEGER);
      let unchanged: Money = addMoney(max, Money.zero());
      expect(unchanged.cents()).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(unchanged.equals(max)).assertTrue();
      expect(unchanged.compareTo(max)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0280
     * @tc.name      max_safe_integer_formats_with_plain_digits_028
     * @tc.desc      Verify max safe integer formats with plain digits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_formats_with_plain_digits_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_formats_with_plain_digits_028');
      let text: string = new Money(Number.MAX_SAFE_INTEGER).format();
      // The cent count ends in 91, so the yuan digits stop at ...409 and the cents render as .91.
      expect(text).assertEqual('¥90071992547409.91');
      expect(text.startsWith('¥90071992547409.')).assertTrue();
      expect(text.indexOf('.91') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0290
     * @tc.name      max_safe_integer_equals_equal_instances_029
     * @tc.desc      Verify max safe integer equals equal instances.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_equals_equal_instances_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_equals_equal_instances_029');
      let first: Money = new Money(Number.MAX_SAFE_INTEGER);
      let second: Money = new Money(Number.MAX_SAFE_INTEGER);
      expect(first.equals(second)).assertTrue();
      expect(second.equals(first)).assertTrue();
      expect(first.compareTo(second)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0300
     * @tc.name      max_safe_integer_add_one_advances_value_030
     * @tc.desc      Verify max safe integer add one advances value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_add_one_advances_value_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_add_one_advances_value_030');
      let max: Money = new Money(Number.MAX_SAFE_INTEGER);
      let advanced: Money = max.add(new Money(1));
      // One past MAX_SAFE_INTEGER is 2^53, which is still exactly representable, so no rounding occurs.
      expect(advanced.cents()).assertEqual(Number.MAX_SAFE_INTEGER + 1);
      expect(advanced.compareTo(max)).assertEqual(1);
      expect(advanced.equals(max)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0310
     * @tc.name      max_safe_integer_add_two_rounds_to_even_031
     * @tc.desc      Verify max safe integer add two rounds to even.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_add_two_rounds_to_even_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_add_two_rounds_to_even_031');
      let max: Money = new Money(Number.MAX_SAFE_INTEGER);
      let plusOne: Money = max.add(new Money(1));
      let plusTwo: Money = max.add(new Money(2));
      // Odd values past 2^53 are unrepresentable, so +2 rounds back onto the same 2^53 that +1 reached.
      expect(plusTwo.cents()).assertEqual(Number.MAX_SAFE_INTEGER + 1);
      expect(plusTwo.equals(plusOne)).assertTrue();
      expect(plusTwo.equals(new Money(Number.MAX_SAFE_INTEGER + 2))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0320
     * @tc.name      max_value_is_constructible_and_positive_032
     * @tc.desc      Verify max value is constructible and positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_is_constructible_and_positive_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_is_constructible_and_positive_032');
      let amount: Money = new Money(Number.MAX_VALUE);
      expect(Number.isFinite(amount.cents())).assertTrue();
      expect(amount.cents()).assertEqual(Number.MAX_VALUE);
      expect(amount.isPositive()).assertTrue();
      expect(amount.isZero()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0330
     * @tc.name      max_value_minus_itself_is_zero_033
     * @tc.desc      Verify max value minus itself is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_minus_itself_is_zero_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_minus_itself_is_zero_033');
      let max: Money = new Money(Number.MAX_VALUE);
      let difference: Money = max.subtract(max);
      expect(difference.cents()).assertEqual(0);
      expect(difference.isZero()).assertTrue();
      expect(difference.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0340
     * @tc.name      max_value_plus_itself_throws_034
     * @tc.desc      Verify max value plus itself throws.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_plus_itself_throws_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_plus_itself_throws_034');
      let max: Money = new Money(Number.MAX_VALUE);
      let __thrown177: boolean = false;
      // Doubling MAX_VALUE overflows to Infinity, which the Money constructor rejects as non-finite.
      try {
        (() => {
        addMoney(max, max);
      })();
      } catch (error) {
        __thrown177 = true;
      }
      expect(__thrown177).assertTrue();
      expect(max.cents()).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0350
     * @tc.name      max_value_multiplied_by_two_throws_035
     * @tc.desc      Verify max value multiplied by two throws.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_multiplied_by_two_throws_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_multiplied_by_two_throws_035');
      let max: Money = new Money(Number.MAX_VALUE);
      let __thrown178: boolean = false;
      try {
        (() => {
        multiplyMoney(max, 2);
      })();
      } catch (error) {
        __thrown178 = true;
      }
      expect(__thrown178).assertTrue();
      expect(max.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0360
     * @tc.name      max_value_minus_zero_is_unchanged_036
     * @tc.desc      Verify max value minus zero is unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_minus_zero_is_unchanged_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_minus_zero_is_unchanged_036');
      let max: Money = new Money(Number.MAX_VALUE);
      let unchanged: Money = max.subtract(Money.zero());
      expect(unchanged.cents()).assertEqual(Number.MAX_VALUE);
      expect(unchanged.equals(max)).assertTrue();
      expect(unchanged.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0370
     * @tc.name      max_value_compare_to_zero_is_positive_037
     * @tc.desc      Verify max value compare to zero is positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_compare_to_zero_is_positive_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_compare_to_zero_is_positive_037');
      let max: Money = new Money(Number.MAX_VALUE);
      expect(max.compareTo(Money.zero())).assertEqual(1);
      expect(Money.zero().compareTo(max)).assertEqual(-1);
      expect(max.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0380
     * @tc.name      max_value_format_starts_with_currency_symbol_038
     * @tc.desc      Verify max value format starts with currency symbol.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_format_starts_with_currency_symbol_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_format_starts_with_currency_symbol_038');
      let text: string = new Money(Number.MAX_VALUE).format();
      // Number.MAX_VALUE stringifies in exponential form, so the yuan digits carry an 'e+' suffix.
      expect(text.startsWith('¥')).assertTrue();
      expect(text.length > 10).assertTrue();
      expect(text.indexOf('e+') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0390
     * @tc.name      sum_of_two_max_values_throws_039
     * @tc.desc      Verify sum of two max values throws.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sum_of_two_max_values_throws_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sum_of_two_max_values_throws_039');
      let parts: Money[] = [new Money(Number.MAX_VALUE), new Money(Number.MAX_VALUE)];
      let __thrown179: boolean = false;
      try {
        (() => {
        sumMoney(parts);
      })();
      } catch (error) {
        __thrown179 = true;
      }
      expect(__thrown179).assertTrue();
      expect(parts[0].isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0400
     * @tc.name      non_finite_of_yuan_rejects_values_040
     * @tc.desc      Verify non finite of yuan rejects values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('non_finite_of_yuan_rejects_values_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: non_finite_of_yuan_rejects_values_040');
      // NaN and both infinities survive the times-100 scaling and then fail the constructor's finite check.
      let invalid: number[] = [Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY];
      for (let index: number = 0; index < invalid.length; index++) {
        let __thrown180: boolean = false;
        try {
          (() => {
          yuanMoney(invalid[index]);
        })();
        } catch (error) {
          __thrown180 = true;
        }
        expect(__thrown180).assertTrue();
      }
      expect(yuanMoney(1).isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0410
     * @tc.name      rounding_just_below_positive_half_041
     * @tc.desc      Verify rounding just below positive half.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rounding_just_below_positive_half_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rounding_just_below_positive_half_041');
      let amount: Money = moneyFrom(0.4999);
      expect(amount.cents()).assertEqual(0);
      expect(amount.isZero()).assertTrue();
      expect(amount.isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0420
     * @tc.name      rounding_just_above_positive_half_042
     * @tc.desc      Verify rounding just above positive half.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rounding_just_above_positive_half_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rounding_just_above_positive_half_042');
      let amount: Money = moneyFrom(0.5001);
      expect(amount.cents()).assertEqual(1);
      expect(amount.isPositive()).assertTrue();
      expect(amount.isZero()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0430
     * @tc.name      rounding_just_below_negative_half_043
     * @tc.desc      Verify rounding just below negative half.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rounding_just_below_negative_half_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rounding_just_below_negative_half_043');
      let amount: Money = moneyFrom(-0.5001);
      expect(amount.cents()).assertEqual(-1);
      expect(amount.isNegative()).assertTrue();
      expect(amount.format()).assertEqual('-¥0.01');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0440
     * @tc.name      rounding_just_above_negative_half_044
     * @tc.desc      Verify rounding just above negative half.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rounding_just_above_negative_half_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rounding_just_above_negative_half_044');
      let amount: Money = moneyFrom(-0.4999);
      expect(amount.cents() === 0).assertTrue();
      expect(amount.isZero()).assertTrue();
      expect(amount.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0450
     * @tc.name      subnormal_min_value_rounds_to_zero_045
     * @tc.desc      Verify subnormal min value rounds to zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('subnormal_min_value_rounds_to_zero_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: subnormal_min_value_rounds_to_zero_045');
      // Number.MIN_VALUE is 5e-324, astronomically below half a cent, so Math.round collapses it to zero.
      let amount: Money = moneyFrom(Number.MIN_VALUE);
      expect(amount.cents()).assertEqual(0);
      expect(amount.isZero()).assertTrue();
      expect(amount.compareTo(Money.zero())).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0460
     * @tc.name      negative_subnormal_rounds_to_zero_046
     * @tc.desc      Verify negative subnormal rounds to zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_subnormal_rounds_to_zero_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_subnormal_rounds_to_zero_046');
      let amount: Money = moneyFrom(-Number.MIN_VALUE);
      expect(amount.cents() === 0).assertTrue();
      expect(amount.isNegative()).assertFalse();
      expect(amount.format()).assertEqual('¥0.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0470
     * @tc.name      min_value_plus_min_value_rounds_to_zero_047
     * @tc.desc      Verify min value plus min value rounds to zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('min_value_plus_min_value_rounds_to_zero_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: min_value_plus_min_value_rounds_to_zero_047');
      let tiny: Money = new Money(Number.MIN_VALUE);
      let sum: Money = tiny.add(tiny);
      expect(sum.cents()).assertEqual(0);
      expect(sum.isZero()).assertTrue();
      expect(sum.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0480
     * @tc.name      huge_amount_absorbs_one_cent_048
     * @tc.desc      Verify huge amount absorbs one cent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('huge_amount_absorbs_one_cent_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: huge_amount_absorbs_one_cent_048');
      let huge: Money = new Money(1e100);
      // One cent is below the precision of a 1e100 double, so adding it leaves the value bit-identical.
      let incremented: Money = huge.add(new Money(1));
      expect(incremented.cents()).assertEqual(1e100);
      expect(incremented.equals(huge)).assertTrue();
      expect(incremented.compareTo(huge)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0490
     * @tc.name      huge_amount_absorbs_negative_adjustment_049
     * @tc.desc      Verify huge amount absorbs negative adjustment.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('huge_amount_absorbs_negative_adjustment_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: huge_amount_absorbs_negative_adjustment_049');
      let huge: Money = new Money(1e100);
      let decremented: Money = huge.subtract(new Money(1));
      expect(decremented.cents()).assertEqual(1e100);
      expect(decremented.equals(huge)).assertTrue();
      expect(decremented.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0500
     * @tc.name      huge_amount_instances_compare_equal_050
     * @tc.desc      Verify huge amount instances compare equal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('huge_amount_instances_compare_equal_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: huge_amount_instances_compare_equal_050');
      let first: Money = new Money(1e100);
      let second: Money = new Money(1e100);
      expect(first.equals(second)).assertTrue();
      expect(first.compareTo(second)).assertEqual(0);
      expect(first.cents()).assertEqual(second.cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0510
     * @tc.name      huge_amount_ordering_051
     * @tc.desc      Verify huge amount ordering.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('huge_amount_ordering_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: huge_amount_ordering_051');
      let larger: Money = new Money(1e100);
      let smaller: Money = new Money(1e99);
      expect(larger.compareTo(smaller)).assertEqual(1);
      expect(smaller.compareTo(larger)).assertEqual(-1);
      expect(larger.equals(smaller)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0520
     * @tc.name      huge_amount_minus_itself_is_zero_052
     * @tc.desc      Verify huge amount minus itself is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('huge_amount_minus_itself_is_zero_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: huge_amount_minus_itself_is_zero_052');
      let huge: Money = new Money(1e100);
      let difference: Money = huge.subtract(huge);
      expect(difference.cents()).assertEqual(0);
      expect(difference.isZero()).assertTrue();
      expect(difference.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0530
     * @tc.name      huge_amount_multiplied_by_one_is_unchanged_053
     * @tc.desc      Verify huge amount multiplied by one is unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('huge_amount_multiplied_by_one_is_unchanged_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: huge_amount_multiplied_by_one_is_unchanged_053');
      let huge: Money = new Money(1e100);
      let unchanged: Money = multiplyMoney(huge, 1);
      expect(unchanged.cents()).assertEqual(1e100);
      expect(unchanged.equals(huge)).assertTrue();
      expect(unchanged.compareTo(huge)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0540
     * @tc.name      huge_amount_cancels_in_sum_054
     * @tc.desc      Verify huge amount cancels in sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('huge_amount_cancels_in_sum_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: huge_amount_cancels_in_sum_054');
      // Money.sum folds left to right, so 1e100 and -1e100 cancel before the 7 cents is added.
      let parts: Money[] = [new Money(1e100), new Money(-1e100), new Money(7)];
      let total: Money = sumMoney(parts);
      expect(total.cents()).assertEqual(7);
      expect(total.isPositive()).assertTrue();
      expect(total.equals(new Money(7))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0550
     * @tc.name      max_value_minus_max_safe_is_unchanged_055
     * @tc.desc      Verify max value minus max safe is unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_minus_max_safe_is_unchanged_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_minus_max_safe_is_unchanged_055');
      let max: Money = new Money(Number.MAX_VALUE);
      // 9007199254740991 is below MAX_VALUE's spacing between doubles, so subtracting it changes nothing.
      let reduced: Money = max.subtract(new Money(Number.MAX_SAFE_INTEGER));
      expect(reduced.cents()).assertEqual(Number.MAX_VALUE);
      expect(reduced.equals(max)).assertTrue();
      expect(reduced.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0560
     * @tc.name      max_value_compare_to_max_safe_is_positive_056
     * @tc.desc      Verify max value compare to max safe is positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_compare_to_max_safe_is_positive_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_compare_to_max_safe_is_positive_056');
      let max: Money = new Money(Number.MAX_VALUE);
      let safe: Money = new Money(Number.MAX_SAFE_INTEGER);
      expect(max.compareTo(safe)).assertEqual(1);
      expect(safe.compareTo(max)).assertEqual(-1);
      expect(max.equals(safe)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0570
     * @tc.name      zero_percentage_is_zero_057
     * @tc.desc      Verify zero percentage is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_percentage_is_zero_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_percentage_is_zero_057');
      let zero: Money = Money.zero();
      let result: Money = percentOfMoney(zero, 50);
      expect(result.cents()).assertEqual(0);
      expect(result.isZero()).assertTrue();
      expect(result.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0580
     * @tc.name      zero_multiplied_by_large_is_zero_058
     * @tc.desc      Verify zero multiplied by large is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_multiplied_by_large_is_zero_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_multiplied_by_large_is_zero_058');
      let zero: Money = Money.zero();
      let scaled: Money = multiplyMoney(zero, 1e6);
      expect(scaled.cents()).assertEqual(0);
      expect(scaled.isZero()).assertTrue();
      expect(scaled.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0590
     * @tc.name      sum_of_zeros_is_zero_059
     * @tc.desc      Verify sum of zeros is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sum_of_zeros_is_zero_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sum_of_zeros_is_zero_059');
      let parts: Money[] = [Money.zero(), Money.zero(), Money.zero()];
      let total: Money = sumMoney(parts);
      expect(total.cents()).assertEqual(0);
      expect(total.isZero()).assertTrue();
      expect(total.compareTo(Money.zero())).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0600
     * @tc.name      sum_of_max_value_and_its_negation_is_zero_060
     * @tc.desc      Verify sum of max value and its negation is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sum_of_max_value_and_its_negation_is_zero_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sum_of_max_value_and_its_negation_is_zero_060');
      let parts: Money[] = [new Money(Number.MAX_VALUE), new Money(-Number.MAX_VALUE)];
      let total: Money = sumMoney(parts);
      expect(total.cents()).assertEqual(0);
      expect(total.isZero()).assertTrue();
      expect(total.equals(Money.zero())).assertTrue();
      expect(total.isNegative()).assertFalse();
      expect(total.compareTo(Money.zero())).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0610
     * @tc.name      negative_zero_subtracted_from_zero_is_zero_061
     * @tc.desc      Verify negative zero subtracted from zero is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_zero_subtracted_from_zero_is_zero_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_zero_subtracted_from_zero_is_zero_061');
      let result: Money = Money.zero().subtract(new Money(-0));
      expect(result.cents() === 0).assertTrue();
      expect(result.isZero()).assertTrue();
      expect(result.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0620
     * @tc.name      negative_zero_percentage_is_zero_062
     * @tc.desc      Verify negative zero percentage is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_zero_percentage_is_zero_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_zero_percentage_is_zero_062');
      let amount: Money = new Money(-0);
      let result: Money = percentOfMoney(amount, 50);
      expect(result.cents() === 0).assertTrue();
      expect(result.isZero()).assertTrue();
      expect(result.compareTo(Money.zero())).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0630
     * @tc.name      max_safe_integer_minus_one_is_lower_063
     * @tc.desc      Verify max safe integer minus one is lower.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_minus_one_is_lower_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_minus_one_is_lower_063');
      let max: Money = new Money(Number.MAX_SAFE_INTEGER);
      let lower: Money = max.subtract(new Money(1));
      expect(lower.cents()).assertEqual(Number.MAX_SAFE_INTEGER - 1);
      expect(lower.compareTo(max)).assertEqual(-1);
      expect(lower.equals(max)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0640
     * @tc.name      negative_zero_compare_to_positive_cent_064
     * @tc.desc      Verify negative zero compare to positive cent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_zero_compare_to_positive_cent_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_zero_compare_to_positive_cent_064');
      let amount: Money = new Money(-0);
      let positive: Money = new Money(1);
      expect(amount.compareTo(positive)).assertEqual(-1);
      expect(positive.compareTo(amount)).assertEqual(1);
      expect(amount.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0650
     * @tc.name      negative_zero_add_positive_cent_065
     * @tc.desc      Verify negative zero add positive cent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_zero_add_positive_cent_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_zero_add_positive_cent_065');
      let sum: Money = new Money(-0).add(new Money(1));
      expect(sum.cents()).assertEqual(1);
      expect(sum.isPositive()).assertTrue();
      expect(sum.format()).assertEqual('¥0.01');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0660
     * @tc.name      negative_zero_instances_are_equal_066
     * @tc.desc      Verify negative zero instances are equal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_zero_instances_are_equal_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_zero_instances_are_equal_066');
      let first: Money = new Money(-0);
      let second: Money = new Money(-0);
      expect(first.equals(second)).assertTrue();
      expect(first.compareTo(second)).assertEqual(0);
      expect(first.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0670
     * @tc.name      zero_minus_zero_is_zero_067
     * @tc.desc      Verify zero minus zero is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_minus_zero_is_zero_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_minus_zero_is_zero_067');
      let difference: Money = Money.zero().subtract(Money.zero());
      expect(difference.cents()).assertEqual(0);
      expect(difference.isZero()).assertTrue();
      expect(difference.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0680
     * @tc.name      sum_of_zero_and_negative_zero_is_zero_068
     * @tc.desc      Verify sum of zero and negative zero is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sum_of_zero_and_negative_zero_is_zero_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sum_of_zero_and_negative_zero_is_zero_068');
      let parts: Money[] = [Money.zero(), new Money(-0)];
      let total: Money = sumMoney(parts);
      expect(total.cents() === 0).assertTrue();
      expect(total.isZero()).assertTrue();
      expect(total.compareTo(Money.zero())).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0690
     * @tc.name      max_safe_integer_plus_negative_one_069
     * @tc.desc      Verify max safe integer plus negative one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_plus_negative_one_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_plus_negative_one_069');
      let max: Money = new Money(Number.MAX_SAFE_INTEGER);
      let reduced: Money = max.add(new Money(-1));
      expect(reduced.cents()).assertEqual(Number.MAX_SAFE_INTEGER - 1);
      expect(reduced.compareTo(max)).assertEqual(-1);
      expect(reduced.equals(max)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0700
     * @tc.name      max_safe_integer_compare_with_half_value_070
     * @tc.desc      Verify max safe integer compare with half value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_compare_with_half_value_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_compare_with_half_value_070');
      let max: Money = new Money(Number.MAX_SAFE_INTEGER);
      // 4503599627370496 is 2^52, exactly representable and one cent below half of 2^53.
      let half: Money = new Money(4503599627370496);
      expect(max.compareTo(half)).assertEqual(1);
      expect(half.compareTo(max)).assertEqual(-1);
      expect(max.equals(half)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0710
     * @tc.name      max_safe_integer_format_has_no_exponent_071
     * @tc.desc      Verify max safe integer format has no exponent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_format_has_no_exponent_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_format_has_no_exponent_071');
      let text: string = new Money(Number.MAX_SAFE_INTEGER).format();
      // The plain form is 18 characters: currency sign, 14 yuan digits, a dot and two cent digits.
      expect(text.indexOf('e') < 0).assertTrue();
      expect(text.length).assertEqual(18);
      expect(text.startsWith('¥9007')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0720
     * @tc.name      max_safe_integer_from_sum_of_halves_072
     * @tc.desc      Verify max safe integer from sum of halves.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_from_sum_of_halves_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_from_sum_of_halves_072');
      let lowerHalf: Money = new Money(4503599627370495);
      let upperHalf: Money = new Money(4503599627370496);
      let parts: Money[] = [lowerHalf, upperHalf];
      let total: Money = sumMoney(parts);
      expect(total.cents()).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(total.equals(new Money(Number.MAX_SAFE_INTEGER))).assertTrue();
      expect(total.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0730
     * @tc.name      sum_cancelling_around_max_safe_integer_073
     * @tc.desc      Verify sum cancelling around max safe integer.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('sum_cancelling_around_max_safe_integer_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: sum_cancelling_around_max_safe_integer_073');
      let parts: Money[] = [new Money(Number.MAX_SAFE_INTEGER), new Money(-1), new Money(1)];
      let total: Money = sumMoney(parts);
      expect(total.cents()).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(total.equals(new Money(Number.MAX_SAFE_INTEGER))).assertTrue();
      expect(total.compareTo(new Money(Number.MAX_SAFE_INTEGER))).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0740
     * @tc.name      max_safe_integer_add_two_then_subtract_two_loses_a_cent_074
     * @tc.desc      Verify max safe integer add two then subtract two loses a cent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_integer_add_two_then_subtract_two_loses_a_cent_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_integer_add_two_then_subtract_two_loses_a_cent_074');
      let max: Money = new Money(Number.MAX_SAFE_INTEGER);
      // The +2 step already rounds down to 2^53, so the -2 ends one cent below the starting MAX_SAFE_INTEGER.
      let roundTrip: Money = max.add(new Money(2)).subtract(new Money(2));
      expect(roundTrip.cents()).assertEqual(Number.MAX_SAFE_INTEGER - 1);
      expect(roundTrip.equals(max)).assertFalse();
      expect(roundTrip.compareTo(max)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0750
     * @tc.name      max_value_equals_equal_instances_075
     * @tc.desc      Verify max value equals equal instances.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_equals_equal_instances_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_equals_equal_instances_075');
      let first: Money = new Money(Number.MAX_VALUE);
      let second: Money = new Money(Number.MAX_VALUE);
      expect(first.equals(second)).assertTrue();
      expect(first.compareTo(second)).assertEqual(0);
      expect(first.cents()).assertEqual(second.cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0760
     * @tc.name      max_value_plus_zero_is_unchanged_076
     * @tc.desc      Verify max value plus zero is unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_plus_zero_is_unchanged_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_plus_zero_is_unchanged_076');
      let max: Money = new Money(Number.MAX_VALUE);
      let unchanged: Money = max.add(Money.zero());
      expect(unchanged.cents()).assertEqual(Number.MAX_VALUE);
      expect(unchanged.equals(max)).assertTrue();
      expect(unchanged.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0770
     * @tc.name      max_value_minus_negative_max_throws_077
     * @tc.desc      Verify max value minus negative max throws.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_minus_negative_max_throws_077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_minus_negative_max_throws_077');
      let max: Money = new Money(Number.MAX_VALUE);
      let negativeMax: Money = new Money(-Number.MAX_VALUE);
      let __thrown181: boolean = false;
      // Subtracting a negative is really MAX_VALUE + MAX_VALUE, which overflows to Infinity.
      try {
        (() => {
        max.subtract(negativeMax);
      })();
      } catch (error) {
        __thrown181 = true;
      }
      expect(__thrown181).assertTrue();
      expect(max.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0780
     * @tc.name      max_value_multiplied_by_one_is_unchanged_078
     * @tc.desc      Verify max value multiplied by one is unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_multiplied_by_one_is_unchanged_078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_multiplied_by_one_is_unchanged_078');
      let max: Money = new Money(Number.MAX_VALUE);
      let unchanged: Money = multiplyMoney(max, 1);
      expect(unchanged.cents()).assertEqual(Number.MAX_VALUE);
      expect(unchanged.equals(max)).assertTrue();
      expect(unchanged.isZero()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0790
     * @tc.name      max_value_compare_to_min_value_is_positive_079
     * @tc.desc      Verify max value compare to min value is positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_value_compare_to_min_value_is_positive_079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_value_compare_to_min_value_is_positive_079');
      let max: Money = new Money(Number.MAX_VALUE);
      let tiny: Money = new Money(Number.MIN_VALUE);
      expect(max.compareTo(tiny)).assertEqual(1);
      expect(tiny.compareTo(max)).assertEqual(-1);
      expect(max.equals(tiny)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0800
     * @tc.name      min_value_equals_zero_080
     * @tc.desc      Verify min value equals zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('min_value_equals_zero_080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: min_value_equals_zero_080');
      let tiny: Money = new Money(Number.MIN_VALUE);
      expect(tiny.equals(Money.zero())).assertTrue();
      expect(tiny.isZero()).assertTrue();
      expect(tiny.cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0810
     * @tc.name      negative_min_value_equals_zero_081
     * @tc.desc      Verify negative min value equals zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_min_value_equals_zero_081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_min_value_equals_zero_081');
      let tiny: Money = new Money(-Number.MIN_VALUE);
      expect(tiny.equals(Money.zero())).assertTrue();
      expect(tiny.isZero()).assertTrue();
      expect(tiny.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0820
     * @tc.name      min_value_compare_to_zero_is_equal_082
     * @tc.desc      Verify min value compare to zero is equal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('min_value_compare_to_zero_is_equal_082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: min_value_compare_to_zero_is_equal_082');
      let tiny: Money = new Money(Number.MIN_VALUE);
      expect(tiny.compareTo(Money.zero())).assertEqual(0);
      expect(Money.zero().compareTo(tiny)).assertEqual(0);
      expect(tiny.format()).assertEqual('¥0.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0830
     * @tc.name      subnormal_plus_one_cent_is_one_083
     * @tc.desc      Verify subnormal plus one cent is one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('subnormal_plus_one_cent_is_one_083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: subnormal_plus_one_cent_is_one_083');
      let tiny: Money = new Money(Number.MIN_VALUE);
      let sum: Money = tiny.add(new Money(1));
      expect(sum.cents()).assertEqual(1);
      expect(sum.isPositive()).assertTrue();
      expect(sum.format()).assertEqual('¥0.01');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0840
     * @tc.name      one_cent_compare_to_max_safe_is_lower_084
     * @tc.desc      Verify one cent compare to max safe is lower.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_compare_to_max_safe_is_lower_084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_compare_to_max_safe_is_lower_084');
      let one: Money = new Money(1);
      let max: Money = new Money(Number.MAX_SAFE_INTEGER);
      expect(one.compareTo(max)).assertEqual(-1);
      expect(max.compareTo(one)).assertEqual(1);
      expect(one.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0850
     * @tc.name      zero_compare_to_max_safe_is_lower_085
     * @tc.desc      Verify zero compare to max safe is lower.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_compare_to_max_safe_is_lower_085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_compare_to_max_safe_is_lower_085');
      let zero: Money = Money.zero();
      let max: Money = new Money(Number.MAX_SAFE_INTEGER);
      expect(zero.compareTo(max)).assertEqual(-1);
      expect(max.compareTo(zero)).assertEqual(1);
      expect(zero.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0860
     * @tc.name      one_cent_from_yuan_086
     * @tc.desc      Verify one cent from yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_from_yuan_086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_from_yuan_086');
      // One hundredth of a yuan scales to exactly 1 cent once the multiply and round are applied.
      let amount: Money = yuanMoney(0.01);
      expect(amount.cents()).assertEqual(1);
      expect(amount.isPositive()).assertTrue();
      expect(amount.format()).assertEqual('¥0.01');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0870
     * @tc.name      negative_one_cent_from_yuan_087
     * @tc.desc      Verify negative one cent from yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_one_cent_from_yuan_087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_one_cent_from_yuan_087');
      let amount: Money = yuanMoney(-0.01);
      expect(amount.cents()).assertEqual(-1);
      expect(amount.isNegative()).assertTrue();
      expect(amount.format()).assertEqual('-¥0.01');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0880
     * @tc.name      huge_amount_plus_zero_is_unchanged_088
     * @tc.desc      Verify huge amount plus zero is unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('huge_amount_plus_zero_is_unchanged_088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: huge_amount_plus_zero_is_unchanged_088');
      let huge: Money = new Money(1e100);
      let unchanged: Money = huge.add(Money.zero());
      expect(unchanged.cents()).assertEqual(1e100);
      expect(unchanged.equals(huge)).assertTrue();
      expect(unchanged.compareTo(huge)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_SPECIAL_VALUES_0890
     * @tc.name      huge_amount_add_negative_zero_is_unchanged_089
     * @tc.desc      Verify huge amount add negative zero is unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('huge_amount_add_negative_zero_is_unchanged_089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: huge_amount_add_negative_zero_is_unchanged_089');
      let huge: Money = new Money(1e100);
      let unchanged: Money = huge.add(new Money(-0));
      expect(unchanged.cents()).assertEqual(1e100);
      expect(unchanged.equals(huge)).assertTrue();
      expect(unchanged.isPositive()).assertTrue();
    });
  });
}
