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
import { PRODUCTS, createGoods } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Takes raw cents, bypassing yuan scaling and its rounding. */
function moneyFrom(cents: number): Money {
  return new Money(cents);
}

function multiplyMoney(value: Money, quantity: number): Money {
  return value.multiply(quantity);
}

/** Percent, where 50 means half; values outside 0-100 are rejected. */
function percentOfMoney(value: Money, percent: number): Money {
  return value.percentage(percent);
}

export default function moneyArithmeticTest() {
  describe('OrangeShoppingMoneyArithmetic', () => {
    let baseAmount: Money = new Money(0);

    beforeAll(() => {
      baseAmount = new Money(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'money arithmetic suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0010
     * @tc.name      money_stores_exact_cent_amount_001
     * @tc.desc      Verify money stores exact cent amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_stores_exact_cent_amount_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_stores_exact_cent_amount_001');
      let amount: Money = moneyFrom(1234);
      expect(amount.cents()).assertEqual(1234);
      expect(amount.isPositive()).assertTrue();
      expect(amount.isZero()).assertFalse();
      expect(amount.isNegative()).assertFalse();
      expect(amount.equals(new Money(1234))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0020
     * @tc.name      money_rounds_sub_cent_fraction_down_002
     * @tc.desc      Verify money rounds sub cent fraction down.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_rounds_sub_cent_fraction_down_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_rounds_sub_cent_fraction_down_002');
      // 12.4 cents is below the half-cent mark, so truncation must leave 12 and not 13.
      let amount: Money = moneyFrom(12.4);
      let rounded: number = amount.cents();
      expect(rounded).assertEqual(12);
      expect(Number.isInteger(rounded)).assertTrue();
      expect(amount.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0030
     * @tc.name      money_rounds_exact_half_cent_up_003
     * @tc.desc      Verify money rounds exact half cent up.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_rounds_exact_half_cent_up_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_rounds_exact_half_cent_up_003');
      // A fraction of exactly 0.5 must round up: 12.5 cents becomes 13.
      let amount: Money = moneyFrom(12.5);
      expect(amount.cents()).assertEqual(13);
      expect(amount.isPositive()).assertTrue();
      expect(amount.equals(new Money(13))).assertTrue();
      expect(amount.compareTo(new Money(12))).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0040
     * @tc.name      money_rounds_fraction_above_half_up_004
     * @tc.desc      Verify money rounds fraction above half up.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_rounds_fraction_above_half_up_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_rounds_fraction_above_half_up_004');
      let amount: Money = moneyFrom(12.6);
      expect(amount.cents()).assertEqual(13);
      expect(Number.isInteger(amount.cents())).assertTrue();
      expect(amount.isZero()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0050
     * @tc.name      money_rounds_negative_half_toward_positive_005
     * @tc.desc      Verify money rounds negative half toward positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_rounds_negative_half_toward_positive_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_rounds_negative_half_toward_positive_005');
      // The negative half must round toward positive, landing on -12 rather than -13.
      let amount: Money = moneyFrom(-12.5);
      expect(amount.cents()).assertEqual(-12);
      expect(amount.isNegative()).assertTrue();
      expect(amount.equals(new Money(-12))).assertTrue();
      expect(amount.equals(new Money(-13))).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0060
     * @tc.name      money_zero_factory_returns_a_zero_value_006
     * @tc.desc      Verify money zero factory returns a zero value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_zero_factory_returns_a_zero_value_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_zero_factory_returns_a_zero_value_006');
      let zero: Money = Money.zero();
      expect(zero.cents()).assertEqual(0);
      expect(zero.isZero()).assertTrue();
      expect(zero.isPositive()).assertFalse();
      expect(zero.isNegative()).assertFalse();
      expect(zero.equals(new Money(0))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0070
     * @tc.name      money_of_yuan_scales_to_exact_cents_007
     * @tc.desc      Verify money of yuan scales to exact cents.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_of_yuan_scales_to_exact_cents_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_of_yuan_scales_to_exact_cents_007');
      // Each row pairs a yuan amount with its exact cent value and the cent just below it.
      let yuan: number[] = [12.34, 1.05];
      let expectedCents: number[] = [1234, 105];
      let lowerCents: number[] = [1233, 104];
      expect(yuan.length).assertEqual(expectedCents.length);
      expect(expectedCents.length).assertEqual(lowerCents.length);
      for (let index: number = 0; index < yuan.length; index++) {
        let amount: Money = Money.ofYuan(yuan[index]);
        expect(amount.cents()).assertEqual(expectedCents[index]);
        expect(amount.equals(new Money(expectedCents[index]))).assertTrue();
        expect(amount.compareTo(new Money(lowerCents[index]))).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0080
     * @tc.name      money_of_yuan_rounds_half_cent_up_008
     * @tc.desc      Verify money of yuan rounds half cent up.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_of_yuan_rounds_half_cent_up_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_of_yuan_rounds_half_cent_up_008');
      // 0.005 yuan is exactly half a cent, which rounds up to one cent.
      let amount: Money = Money.ofYuan(0.005);
      expect(amount.cents()).assertEqual(1);
      expect(amount.isPositive()).assertTrue();
      expect(amount.isZero()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0090
     * @tc.name      money_of_yuan_discards_below_half_cent_009
     * @tc.desc      Verify money of yuan discards below half cent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_of_yuan_discards_below_half_cent_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_of_yuan_discards_below_half_cent_009');
      let amount: Money = Money.ofYuan(0.004);
      expect(amount.cents()).assertEqual(0);
      expect(amount.isZero()).assertTrue();
      expect(amount.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0100
     * @tc.name      money_of_yuan_handles_whole_yuan_010
     * @tc.desc      Verify money of yuan handles whole yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_of_yuan_handles_whole_yuan_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_of_yuan_handles_whole_yuan_010');
      let amount: Money = Money.ofYuan(5);
      expect(amount.cents()).assertEqual(500);
      expect(amount.equals(new Money(500))).assertTrue();
      expect(amount.compareTo(Money.zero())).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0110
     * @tc.name      money_of_yuan_matches_catalogue_price_011
     * @tc.desc      Verify money of yuan matches catalogue price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_of_yuan_matches_catalogue_price_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_of_yuan_matches_catalogue_price_011');
      // PRODUCTS[0] is stored as 499900 cents, so 4999 yuan must convert to that same value.
      let cataloguePrice: Money = PRODUCTS[0].price;
      let converted: Money = Money.ofYuan(4999);
      expect(cataloguePrice.cents()).assertEqual(499900);
      expect(converted.equals(cataloguePrice)).assertTrue();
      expect(converted.compareTo(cataloguePrice)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0120
     * @tc.name      money_of_yuan_keeps_negative_value_negative_012
     * @tc.desc      Verify money of yuan keeps negative value negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_of_yuan_keeps_negative_value_negative_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_of_yuan_keeps_negative_value_negative_012');
      let amount: Money = Money.ofYuan(-12.34);
      expect(amount.cents()).assertEqual(-1234);
      expect(amount.isNegative()).assertTrue();
      expect(amount.isPositive()).assertFalse();
      expect(amount.equals(new Money(-1234))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0130
     * @tc.name      money_of_yuan_of_zero_is_zero_013
     * @tc.desc      Verify money of yuan of zero is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_of_yuan_of_zero_is_zero_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_of_yuan_of_zero_is_zero_013');
      let amount: Money = Money.ofYuan(0);
      expect(amount.cents()).assertEqual(0);
      expect(amount.equals(Money.zero())).assertTrue();
      expect(amount.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0140
     * @tc.name      money_add_combines_two_amounts_014
     * @tc.desc      Verify money add combines two amounts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_add_combines_two_amounts_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_add_combines_two_amounts_014');
      let left: Money = new Money(1000);
      let right: Money = new Money(250);
      let total: Money = left.add(right);
      expect(total.cents()).assertEqual(1250);
      expect(total.isPositive()).assertTrue();
      expect(total.equals(new Money(1250))).assertTrue();
      expect(total.compareTo(new Money(1250))).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0150
     * @tc.name      money_add_leaves_operands_unchanged_015
     * @tc.desc      Verify money add leaves operands unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_add_leaves_operands_unchanged_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_add_leaves_operands_unchanged_015');
      let left: Money = new Money(499900);
      let right: Money = new Money(8900);
      let total: Money = left.add(right);
      expect(total.cents()).assertEqual(508800);
      expect(left.cents()).assertEqual(499900);
      expect(right.cents()).assertEqual(8900);
      expect(left.equals(new Money(499900))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0160
     * @tc.name      money_add_zero_is_identity_016
     * @tc.desc      Verify money add zero is identity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_add_zero_is_identity_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_add_zero_is_identity_016');
      let sum: Money = baseAmount.add(Money.zero());
      expect(sum.cents()).assertEqual(1000);
      expect(sum.equals(baseAmount)).assertTrue();
      expect(sum.compareTo(baseAmount)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0170
     * @tc.name      money_add_is_commutative_017
     * @tc.desc      Verify money add is commutative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_add_is_commutative_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_add_is_commutative_017');
      let left: Money = new Money(8900);
      let right: Money = new Money(19900);
      let forward: Money = left.add(right);
      let backward: Money = right.add(left);
      expect(forward.cents()).assertEqual(28800);
      expect(forward.equals(backward)).assertTrue();
      expect(forward.compareTo(backward)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0180
     * @tc.name      money_add_is_associative_018
     * @tc.desc      Verify money add is associative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_add_is_associative_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_add_is_associative_018');
      let first: Money = new Money(100);
      let second: Money = new Money(200);
      let third: Money = new Money(300);
      let leftGrouped: Money = first.add(second).add(third);
      let rightGrouped: Money = first.add(second.add(third));
      expect(leftGrouped.cents()).assertEqual(600);
      expect(leftGrouped.equals(rightGrouped)).assertTrue();
      expect(rightGrouped.cents()).assertEqual(600);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0190
     * @tc.name      money_add_negative_amounts_019
     * @tc.desc      Verify money add negative amounts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_add_negative_amounts_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_add_negative_amounts_019');
      let debit: Money = new Money(-100);
      let refund: Money = new Money(-250);
      let total: Money = debit.add(refund);
      expect(total.cents()).assertEqual(-350);
      expect(total.isNegative()).assertTrue();
      expect(total.isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0200
     * @tc.name      money_subtract_returns_difference_020
     * @tc.desc      Verify money subtract returns difference.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_subtract_returns_difference_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_subtract_returns_difference_020');
      let total: Money = new Money(1000);
      let discount: Money = new Money(250);
      let payable: Money = total.subtract(discount);
      expect(payable.cents()).assertEqual(750);
      expect(payable.isPositive()).assertTrue();
      expect(payable.equals(new Money(750))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0210
     * @tc.name      money_subtract_can_produce_negative_balance_021
     * @tc.desc      Verify money subtract can produce negative balance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_subtract_can_produce_negative_balance_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_subtract_can_produce_negative_balance_021');
      let credit: Money = new Money(500);
      let charge: Money = new Money(800);
      let balance: Money = credit.subtract(charge);
      expect(balance.cents()).assertEqual(-300);
      expect(balance.isNegative()).assertTrue();
      expect(balance.isPositive()).assertFalse();
      expect(balance.compareTo(Money.zero())).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0220
     * @tc.name      money_subtract_equal_amounts_yields_zero_022
     * @tc.desc      Verify money subtract equal amounts yields zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_subtract_equal_amounts_yields_zero_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_subtract_equal_amounts_yields_zero_022');
      let amount: Money = new Money(500);
      let difference: Money = amount.subtract(new Money(500));
      expect(difference.cents()).assertEqual(0);
      expect(difference.isZero()).assertTrue();
      expect(difference.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0230
     * @tc.name      money_subtract_zero_is_identity_023
     * @tc.desc      Verify money subtract zero is identity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_subtract_zero_is_identity_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_subtract_zero_is_identity_023');
      let difference: Money = baseAmount.subtract(Money.zero());
      expect(difference.cents()).assertEqual(1000);
      expect(difference.equals(baseAmount)).assertTrue();
      expect(difference.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0240
     * @tc.name      money_subtract_undoes_addition_024
     * @tc.desc      Verify money subtract undoes addition.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_subtract_undoes_addition_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_subtract_undoes_addition_024');
      let original: Money = new Money(1250);
      let delta: Money = new Money(375);
      // Adding 375 then subtracting 375 must bring the balance back to 1250.
      let restored: Money = original.add(delta).subtract(delta);
      expect(restored.cents()).assertEqual(1250);
      expect(restored.equals(original)).assertTrue();
      expect(restored.compareTo(original)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0250
     * @tc.name      money_subtract_negative_amount_increases_025
     * @tc.desc      Verify money subtract negative amount increases.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_subtract_negative_amount_increases_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_subtract_negative_amount_increases_025');
      let balance: Money = new Money(100);
      let adjusted: Money = balance.subtract(new Money(-50));
      expect(adjusted.cents()).assertEqual(150);
      expect(adjusted.isPositive()).assertTrue();
      expect(adjusted.compareTo(balance)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0260
     * @tc.name      money_multiply_scales_unit_price_026
     * @tc.desc      Verify money multiply scales unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_multiply_scales_unit_price_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_multiply_scales_unit_price_026');
      let unit: Money = createGoods(21, 'Probe Phone', 19900).price;
      let lineTotal: Money = unit.multiply(3);
      expect(lineTotal.cents()).assertEqual(59700);
      expect(lineTotal.isPositive()).assertTrue();
      expect(lineTotal.equals(new Money(59700))).assertTrue();
      expect(unit.cents()).assertEqual(19900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0270
     * @tc.name      money_multiply_by_zero_is_zero_027
     * @tc.desc      Verify money multiply by zero is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_multiply_by_zero_is_zero_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_multiply_by_zero_is_zero_027');
      let unit: Money = new Money(199);
      let total: Money = unit.multiply(0);
      expect(total.cents()).assertEqual(0);
      expect(total.isZero()).assertTrue();
      expect(total.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0280
     * @tc.name      money_multiply_by_one_preserves_value_028
     * @tc.desc      Verify money multiply by one preserves value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_multiply_by_one_preserves_value_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_multiply_by_one_preserves_value_028');
      let unit: Money = new Money(199);
      let total: Money = unit.multiply(1);
      expect(total.cents()).assertEqual(199);
      expect(total.equals(unit)).assertTrue();
      expect(total.compareTo(unit)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0290
     * @tc.name      money_multiply_rejects_negative_quantity_029
     * @tc.desc      Verify money multiply rejects negative quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_multiply_rejects_negative_quantity_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_multiply_rejects_negative_quantity_029');
      // Both -1 and -5 are invalid quantities; each call must throw and leave the 100 cents intact.
      let unit: Money = new Money(100);
      let __thrown169: boolean = false;
      try {
        (() => {
        multiplyMoney(unit, -1);
      })();
      } catch (error) {
        __thrown169 = true;
      }
      expect(__thrown169).assertTrue();
      let __thrown170: boolean = false;
      try {
        (() => {
        multiplyMoney(unit, -5);
      })();
      } catch (error) {
        __thrown170 = true;
      }
      expect(__thrown170).assertTrue();
      expect(unit.cents()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0300
     * @tc.name      money_multiply_rounds_fractional_quantity_030
     * @tc.desc      Verify money multiply rounds fractional quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_multiply_rounds_fractional_quantity_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_multiply_rounds_fractional_quantity_030');
      let unit: Money = new Money(199);
      // 199 * 1.5 = 298.5 rounds up to 299, while the 500 * 0.5 case is exact at 250.
      let half: Money = unit.multiply(1.5);
      let exact: Money = new Money(500).multiply(0.5);
      expect(half.cents()).assertEqual(299);
      expect(exact.cents()).assertEqual(250);
      expect(half.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0310
     * @tc.name      money_multiply_distributes_over_addition_031
     * @tc.desc      Verify money multiply distributes over addition.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_multiply_distributes_over_addition_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_multiply_distributes_over_addition_031');
      let first: Money = new Money(199);
      let second: Money = new Money(301);
      let combined: Money = first.add(second).multiply(2);
      let separate: Money = first.multiply(2).add(second.multiply(2));
      expect(combined.cents()).assertEqual(1000);
      expect(combined.equals(separate)).assertTrue();
      expect(separate.cents()).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0320
     * @tc.name      money_sum_adds_every_element_032
     * @tc.desc      Verify money sum adds every element.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_sum_adds_every_element_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_sum_adds_every_element_032');
      let parts: Money[] = [new Money(100), new Money(200), new Money(300)];
      let total: Money = Money.sum(parts);
      expect(total.cents()).assertEqual(600);
      expect(total.isPositive()).assertTrue();
      expect(total.compareTo(new Money(599))).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0330
     * @tc.name      money_sum_of_empty_array_is_zero_033
     * @tc.desc      Verify money sum of empty array is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_sum_of_empty_array_is_zero_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_sum_of_empty_array_is_zero_033');
      let parts: Money[] = [];
      let total: Money = Money.sum(parts);
      expect(total.cents()).assertEqual(0);
      expect(total.isZero()).assertTrue();
      expect(total.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0340
     * @tc.name      money_sum_accepts_mixed_signs_034
     * @tc.desc      Verify money sum accepts mixed signs.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_sum_accepts_mixed_signs_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_sum_accepts_mixed_signs_034');
      // 100 - 40 + 5 cancels the negative middle term and settles at 65.
      let parts: Money[] = [new Money(100), new Money(-40), new Money(5)];
      let total: Money = Money.sum(parts);
      expect(total.cents()).assertEqual(65);
      expect(total.isPositive()).assertTrue();
      expect(total.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0350
     * @tc.name      money_sum_is_order_independent_035
     * @tc.desc      Verify money sum is order independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_sum_is_order_independent_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_sum_is_order_independent_035');
      let forwardParts: Money[] = [new Money(100), new Money(200), new Money(300)];
      let backwardParts: Money[] = [new Money(300), new Money(100), new Money(200)];
      let forward: Money = Money.sum(forwardParts);
      let backward: Money = Money.sum(backwardParts);
      expect(forward.cents()).assertEqual(600);
      expect(forward.equals(backward)).assertTrue();
      expect(forward.compareTo(backward)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0360
     * @tc.name      money_sum_matches_sequential_addition_036
     * @tc.desc      Verify money sum matches sequential addition.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_sum_matches_sequential_addition_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_sum_matches_sequential_addition_036');
      let parts: Money[] = [new Money(499900), new Money(8900), new Money(19900)];
      let summed: Money = Money.sum(parts);
      let sequential: Money = Money.zero();
      for (let index: number = 0; index < parts.length; index++) {
        sequential = sequential.add(parts[index]);
      }
      expect(summed.cents()).assertEqual(528700);
      expect(summed.equals(sequential)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0370
     * @tc.name      money_sum_accumulates_many_values_037
     * @tc.desc      Verify money sum accumulates many values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_sum_accumulates_many_values_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_sum_accumulates_many_values_037');
      // 500 pieces of 3 cents must accumulate to exactly 1500.
      let parts: Money[] = [];
      for (let index: number = 0; index < 500; index++) {
        parts.push(new Money(3));
      }
      let total: Money = Money.sum(parts);
      expect(total.cents()).assertEqual(1500);
      expect(total.equals(new Money(1500))).assertTrue();
      expect(total.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0380
     * @tc.name      money_compare_to_reports_lesser_038
     * @tc.desc      Verify money compare to reports lesser.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_compare_to_reports_lesser_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_compare_to_reports_lesser_038');
      let smaller: Money = new Money(100);
      let larger: Money = new Money(200);
      expect(smaller.compareTo(larger)).assertEqual(-1);
      expect(Money.zero().compareTo(new Money(1))).assertEqual(-1);
      expect(smaller.equals(larger)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0390
     * @tc.name      money_compare_to_reports_greater_039
     * @tc.desc      Verify money compare to reports greater.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_compare_to_reports_greater_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_compare_to_reports_greater_039');
      let larger: Money = new Money(200);
      let smaller: Money = new Money(100);
      expect(larger.compareTo(smaller)).assertEqual(1);
      expect(new Money(1).compareTo(Money.zero())).assertEqual(1);
      expect(larger.equals(smaller)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0400
     * @tc.name      money_compare_to_reports_equal_040
     * @tc.desc      Verify money compare to reports equal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_compare_to_reports_equal_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_compare_to_reports_equal_040');
      let left: Money = new Money(100);
      let right: Money = new Money(100);
      expect(left.compareTo(right)).assertEqual(0);
      expect(left.equals(right)).assertTrue();
      expect(left.cents()).assertEqual(right.cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0410
     * @tc.name      money_compare_to_is_antisymmetric_041
     * @tc.desc      Verify money compare to is antisymmetric.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_compare_to_is_antisymmetric_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_compare_to_is_antisymmetric_041');
      // The pairs 100/200, 500/500 and 900/700 expect signs -1, 0 and 1, and the reverse must negate each.
      let leftValues: number[] = [100, 500, 900];
      let rightValues: number[] = [200, 500, 700];
      let expectedSigns: number[] = [-1, 0, 1];
      for (let index: number = 0; index < leftValues.length; index++) {
        let left: Money = new Money(leftValues[index]);
        let right: Money = new Money(rightValues[index]);
        expect(left.compareTo(right)).assertEqual(expectedSigns[index]);
        expect(right.compareTo(left)).assertEqual(-expectedSigns[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0420
     * @tc.name      money_compare_to_orders_negative_amounts_042
     * @tc.desc      Verify money compare to orders negative amounts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_compare_to_orders_negative_amounts_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_compare_to_orders_negative_amounts_042');
      // -5 is a smaller debt than -10, so it must compare as greater.
      let lessNegative: Money = new Money(-5);
      let moreNegative: Money = new Money(-10);
      expect(lessNegative.compareTo(moreNegative)).assertEqual(1);
      expect(moreNegative.compareTo(lessNegative)).assertEqual(-1);
      expect(moreNegative.isNegative()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0430
     * @tc.name      money_equals_matches_equal_amounts_043
     * @tc.desc      Verify money equals matches equal amounts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_equals_matches_equal_amounts_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_equals_matches_equal_amounts_043');
      let first: Money = new Money(500);
      let second: Money = new Money(500);
      expect(first.equals(second)).assertTrue();
      expect(second.equals(first)).assertTrue();
      expect(first.compareTo(second)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0440
     * @tc.name      money_equals_rejects_one_cent_difference_044
     * @tc.desc      Verify money equals rejects one cent difference.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_equals_rejects_one_cent_difference_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_equals_rejects_one_cent_difference_044');
      let base: Money = new Money(500);
      let higher: Money = new Money(501);
      let lower: Money = new Money(499);
      expect(base.equals(higher)).assertFalse();
      expect(base.equals(lower)).assertFalse();
      expect(base.compareTo(higher)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0450
     * @tc.name      money_is_zero_only_for_zero_045
     * @tc.desc      Verify money is zero only for zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_is_zero_only_for_zero_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_is_zero_only_for_zero_045');
      let zero: Money = new Money(0);
      let positive: Money = new Money(1);
      let negative: Money = new Money(-1);
      expect(zero.isZero()).assertTrue();
      expect(positive.isZero()).assertFalse();
      expect(negative.isZero()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0460
     * @tc.name      money_is_positive_above_zero_046
     * @tc.desc      Verify money is positive above zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_is_positive_above_zero_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_is_positive_above_zero_046');
      let oneCent: Money = new Money(1);
      let zero: Money = new Money(0);
      let negative: Money = new Money(-1);
      expect(oneCent.isPositive()).assertTrue();
      expect(zero.isPositive()).assertFalse();
      expect(negative.isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0470
     * @tc.name      money_is_negative_below_zero_047
     * @tc.desc      Verify money is negative below zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_is_negative_below_zero_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_is_negative_below_zero_047');
      let oneCent: Money = new Money(-1);
      let zero: Money = new Money(0);
      let positive: Money = new Money(1);
      expect(oneCent.isNegative()).assertTrue();
      expect(zero.isNegative()).assertFalse();
      expect(positive.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0480
     * @tc.name      money_sign_flags_agree_with_compare_to_048
     * @tc.desc      Verify money sign flags agree with compare to.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_sign_flags_agree_with_compare_to_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_sign_flags_agree_with_compare_to_048');
      let values: number[] = [-5, 0, 5];
      let zero: Money = Money.zero();
      for (let index: number = 0; index < values.length; index++) {
        let amount: Money = new Money(values[index]);
        let comparison: number = amount.compareTo(zero);
        expect(amount.isPositive()).assertEqual(comparison > 0);
        expect(amount.isNegative()).assertEqual(comparison < 0);
        expect(amount.isZero()).assertEqual(comparison === 0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0490
     * @tc.name      money_clamp_at_zero_lifts_negative_049
     * @tc.desc      Verify money clamp at zero lifts negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_clamp_at_zero_lifts_negative_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_clamp_at_zero_lifts_negative_049');
      let negative: Money = new Money(-1);
      let clamped: Money = negative.clampAtZero();
      expect(clamped.cents()).assertEqual(0);
      expect(clamped.isZero()).assertTrue();
      expect(clamped.isNegative()).assertFalse();
      expect(clamped.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0500
     * @tc.name      money_clamp_at_zero_keeps_non_negative_050
     * @tc.desc      Verify money clamp at zero keeps non negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_clamp_at_zero_keeps_non_negative_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_clamp_at_zero_keeps_non_negative_050');
      let positive: Money = new Money(500);
      let zero: Money = Money.zero();
      let clampedPositive: Money = positive.clampAtZero();
      let clampedZero: Money = zero.clampAtZero();
      expect(clampedPositive.cents()).assertEqual(500);
      expect(clampedZero.cents()).assertEqual(0);
      expect(clampedPositive.equals(positive)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0510
     * @tc.name      money_clamp_at_zero_is_idempotent_051
     * @tc.desc      Verify money clamp at zero is idempotent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_clamp_at_zero_is_idempotent_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_clamp_at_zero_is_idempotent_051');
      let negative: Money = new Money(-750);
      let once: Money = negative.clampAtZero();
      let twice: Money = once.clampAtZero();
      expect(once.cents()).assertEqual(0);
      expect(once.equals(twice)).assertTrue();
      expect(twice.cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0520
     * @tc.name      money_percentage_zero_returns_free_amount_052
     * @tc.desc      Verify money percentage zero returns free amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_zero_returns_free_amount_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_zero_returns_free_amount_052');
      let amount: Money = new Money(1000);
      let result: Money = percentOfMoney(amount, 0);
      expect(result.cents()).assertEqual(0);
      expect(result.isZero()).assertTrue();
      expect(result.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0530
     * @tc.name      money_percentage_fifty_returns_half_053
     * @tc.desc      Verify money percentage fifty returns half.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_fifty_returns_half_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_fifty_returns_half_053');
      let amount: Money = new Money(1000);
      let result: Money = percentOfMoney(amount, 50);
      expect(result.cents()).assertEqual(500);
      expect(result.equals(new Money(500))).assertTrue();
      expect(result.compareTo(amount)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0540
     * @tc.name      money_percentage_hundred_returns_full_054
     * @tc.desc      Verify money percentage hundred returns full.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_hundred_returns_full_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_hundred_returns_full_054');
      let amount: Money = new Money(1000);
      let result: Money = percentOfMoney(amount, 100);
      expect(result.cents()).assertEqual(1000);
      expect(result.equals(amount)).assertTrue();
      expect(result.compareTo(amount)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0550
     * @tc.name      money_percentage_rounds_half_cent_up_055
     * @tc.desc      Verify money percentage rounds half cent up.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_rounds_half_cent_up_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_rounds_half_cent_up_055');
      // Half of 3 cents is 1.5, which rounds up to 2.
      let odd: Money = new Money(3);
      let result: Money = percentOfMoney(odd, 50);
      expect(result.cents()).assertEqual(2);
      expect(result.isPositive()).assertTrue();
      expect(result.compareTo(new Money(1))).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0560
     * @tc.name      money_percentage_rounds_remainder_056
     * @tc.desc      Verify money percentage rounds remainder.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_rounds_remainder_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_rounds_remainder_056');
      // 999 * 50% = 499.5 rounds to 500, and 10000 * 33% is exactly 3300.
      let amount: Money = new Money(999);
      let half: Money = percentOfMoney(amount, 50);
      let third: Money = percentOfMoney(new Money(10000), 33);
      expect(half.cents()).assertEqual(500);
      expect(third.cents()).assertEqual(3300);
      expect(half.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0570
     * @tc.name      money_percentage_of_negative_amount_rounds_toward_zero_057
     * @tc.desc      Verify money percentage of negative amount rounds toward zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_of_negative_amount_rounds_toward_zero_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_of_negative_amount_rounds_toward_zero_057');
      // Half of -1 cent is -0.5, which must round toward zero and report no negative flag.
      let amount: Money = new Money(-1);
      let result: Money = percentOfMoney(amount, 50);
      expect(result.cents() === 0).assertTrue();
      expect(result.isZero()).assertTrue();
      expect(result.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0580
     * @tc.name      money_percentage_above_hundred_throws_058
     * @tc.desc      Verify money percentage above hundred throws.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_above_hundred_throws_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_above_hundred_throws_058');
      // 101 and 1000 both exceed the 0..100 range, so both calls must throw.
      let amount: Money = new Money(1000);
      let __thrown171: boolean = false;
      try {
        (() => {
        percentOfMoney(amount, 101);
      })();
      } catch (error) {
        __thrown171 = true;
      }
      expect(__thrown171).assertTrue();
      let __thrown172: boolean = false;
      try {
        (() => {
        percentOfMoney(amount, 1000);
      })();
      } catch (error) {
        __thrown172 = true;
      }
      expect(__thrown172).assertTrue();
      expect(amount.cents()).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0590
     * @tc.name      money_percentage_negative_throws_059
     * @tc.desc      Verify money percentage negative throws.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_negative_throws_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_negative_throws_059');
      // Negative percentages are meaningless and must be rejected without changing the 1000 cents.
      let amount: Money = new Money(1000);
      let __thrown173: boolean = false;
      try {
        (() => {
        percentOfMoney(amount, -1);
      })();
      } catch (error) {
        __thrown173 = true;
      }
      expect(__thrown173).assertTrue();
      let __thrown174: boolean = false;
      try {
        (() => {
        percentOfMoney(amount, -100);
      })();
      } catch (error) {
        __thrown174 = true;
      }
      expect(__thrown174).assertTrue();
      expect(amount.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0600
     * @tc.name      money_chained_arithmetic_composes_060
     * @tc.desc      Verify money chained arithmetic composes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_chained_arithmetic_composes_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_chained_arithmetic_composes_060');
      let start: Money = new Money(100);
      let step: Money = new Money(200);
      let chained: Money = start.add(step).multiply(2).subtract(new Money(50));
      expect(chained.cents()).assertEqual(550);
      expect(chained.isPositive()).assertTrue();
      expect(chained.equals(new Money(550))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0610
     * @tc.name      money_chained_percentage_then_subtract_061
     * @tc.desc      Verify money chained percentage then subtract.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_chained_percentage_then_subtract_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_chained_percentage_then_subtract_061');
      let subtotal: Money = new Money(1000);
      let couponValue: Money = new Money(100);
      // Halving 1000 leaves 500, then the 100 cent coupon takes it down to 400.
      let payable: Money = subtotal.percentage(50).subtract(couponValue);
      expect(payable.cents()).assertEqual(400);
      expect(payable.isPositive()).assertTrue();
      expect(payable.compareTo(subtotal)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0620
     * @tc.name      money_large_accumulation_stays_exact_062
     * @tc.desc      Verify money large accumulation stays exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_large_accumulation_stays_exact_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_large_accumulation_stays_exact_062');
      // A thousand additions of 499900 must land on exactly 499900000.
      let total: Money = Money.zero();
      for (let step: number = 0; step < 1000; step++) {
        total = total.add(new Money(499900));
      }
      expect(total.cents()).assertEqual(499900000);
      expect(total.equals(new Money(499900000))).assertTrue();
      expect(total.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0630
     * @tc.name      money_large_sum_of_repeated_values_063
     * @tc.desc      Verify money large sum of repeated values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_large_sum_of_repeated_values_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_large_sum_of_repeated_values_063');
      // 2000 entries of 12345 cents must total 24690000.
      let parts: Money[] = [];
      for (let index: number = 0; index < 2000; index++) {
        parts.push(new Money(12345));
      }
      let total: Money = Money.sum(parts);
      expect(total.cents()).assertEqual(24690000);
      expect(total.compareTo(new Money(24690000))).assertEqual(0);
      expect(total.equals(new Money(24690000))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0640
     * @tc.name      money_of_yuan_handles_single_decimal_064
     * @tc.desc      Verify money of yuan handles single decimal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_of_yuan_handles_single_decimal_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_of_yuan_handles_single_decimal_064');
      let amount: Money = Money.ofYuan(0.1);
      expect(amount.cents()).assertEqual(10);
      expect(amount.equals(new Money(10))).assertTrue();
      expect(amount.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0650
     * @tc.name      money_of_yuan_handles_two_decimals_near_one_065
     * @tc.desc      Verify money of yuan handles two decimals near one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_of_yuan_handles_two_decimals_near_one_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_of_yuan_handles_two_decimals_near_one_065');
      let amount: Money = Money.ofYuan(0.99);
      expect(amount.cents()).assertEqual(99);
      expect(amount.equals(new Money(99))).assertTrue();
      expect(amount.compareTo(new Money(100))).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0660
     * @tc.name      money_of_yuan_handles_large_yuan_value_066
     * @tc.desc      Verify money of yuan handles large yuan value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_of_yuan_handles_large_yuan_value_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_of_yuan_handles_large_yuan_value_066');
      let amount: Money = Money.ofYuan(10000);
      expect(amount.cents()).assertEqual(1000000);
      expect(amount.equals(new Money(1000000))).assertTrue();
      expect(amount.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0670
     * @tc.name      money_subtract_from_zero_yields_debt_067
     * @tc.desc      Verify money subtract from zero yields debt.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_subtract_from_zero_yields_debt_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_subtract_from_zero_yields_debt_067');
      let zero: Money = Money.zero();
      let invoice: Money = new Money(250);
      let balance: Money = zero.subtract(invoice);
      expect(balance.cents()).assertEqual(-250);
      expect(balance.isNegative()).assertTrue();
      expect(balance.equals(new Money(-250))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0680
     * @tc.name      money_subtract_negative_from_negative_amount_068
     * @tc.desc      Verify money subtract negative from negative amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_subtract_negative_from_negative_amount_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_subtract_negative_from_negative_amount_068');
      let balance: Money = new Money(-100);
      let adjustment: Money = new Money(-40);
      let result: Money = balance.subtract(adjustment);
      expect(result.cents()).assertEqual(-60);
      expect(result.isNegative()).assertTrue();
      expect(result.compareTo(balance)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0690
     * @tc.name      money_subtract_then_clamp_returns_zero_069
     * @tc.desc      Verify money subtract then clamp returns zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_subtract_then_clamp_returns_zero_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_subtract_then_clamp_returns_zero_069');
      let available: Money = new Money(200);
      let requested: Money = new Money(500);
      let raw: Money = available.subtract(requested);
      let clamped: Money = raw.clampAtZero();
      expect(raw.cents()).assertEqual(-300);
      expect(clamped.cents()).assertEqual(0);
      expect(clamped.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0700
     * @tc.name      money_subtract_equals_adding_the_negation_070
     * @tc.desc      Verify money subtract equals adding the negation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_subtract_equals_adding_the_negation_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_subtract_equals_adding_the_negation_070');
      let left: Money = new Money(900);
      let right: Money = new Money(400);
      let difference: Money = left.subtract(right);
      let additive: Money = left.add(new Money(-right.cents()));
      expect(difference.cents()).assertEqual(500);
      expect(difference.equals(additive)).assertTrue();
      expect(additive.cents()).assertEqual(500);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0710
     * @tc.name      money_multiply_negative_amount_by_positive_quantity_071
     * @tc.desc      Verify money multiply negative amount by positive quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_multiply_negative_amount_by_positive_quantity_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_multiply_negative_amount_by_positive_quantity_071');
      let adjustment: Money = new Money(-100);
      let scaled: Money = adjustment.multiply(3);
      expect(scaled.cents()).assertEqual(-300);
      expect(scaled.isNegative()).assertTrue();
      expect(scaled.isPositive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0720
     * @tc.name      money_multiply_rounds_small_fraction_down_072
     * @tc.desc      Verify money multiply rounds small fraction down.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_multiply_rounds_small_fraction_down_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_multiply_rounds_small_fraction_down_072');
      let unit: Money = new Money(199);
      // 199 * 0.333 = 66.267 truncates to 66 cents.
      let scaled: Money = unit.multiply(0.333);
      expect(scaled.cents()).assertEqual(66);
      expect(scaled.isPositive()).assertTrue();
      expect(scaled.compareTo(unit)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0730
     * @tc.name      money_multiply_by_two_equals_adding_to_self_073
     * @tc.desc      Verify money multiply by two equals adding to self.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_multiply_by_two_equals_adding_to_self_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_multiply_by_two_equals_adding_to_self_073');
      let unit: Money = new Money(375);
      let doubled: Money = unit.multiply(2);
      let summed: Money = unit.add(unit);
      expect(doubled.cents()).assertEqual(750);
      expect(doubled.equals(summed)).assertTrue();
      expect(summed.cents()).assertEqual(750);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0740
     * @tc.name      money_sum_single_element_returns_equal_value_074
     * @tc.desc      Verify money sum single element returns equal value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_sum_single_element_returns_equal_value_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_sum_single_element_returns_equal_value_074');
      let only: Money = new Money(1234);
      let parts: Money[] = [only];
      let total: Money = Money.sum(parts);
      expect(total.cents()).assertEqual(1234);
      expect(total.equals(only)).assertTrue();
      expect(total.compareTo(only)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0750
     * @tc.name      money_sum_of_negative_values_is_negative_075
     * @tc.desc      Verify money sum of negative values is negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_sum_of_negative_values_is_negative_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_sum_of_negative_values_is_negative_075');
      let parts: Money[] = [new Money(-10), new Money(-20)];
      let total: Money = Money.sum(parts);
      expect(total.cents()).assertEqual(-30);
      expect(total.isNegative()).assertTrue();
      expect(total.compareTo(Money.zero())).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0760
     * @tc.name      money_sum_cancels_opposite_values_076
     * @tc.desc      Verify money sum cancels opposite values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_sum_cancels_opposite_values_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_sum_cancels_opposite_values_076');
      // The large pair cancels exactly, so only the 1 cent tail survives the sum.
      let parts: Money[] = [new Money(499900), new Money(-499900), new Money(1)];
      let total: Money = Money.sum(parts);
      expect(total.cents()).assertEqual(1);
      expect(total.isPositive()).assertTrue();
      expect(total.equals(new Money(1))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0770
     * @tc.name      money_percentage_one_percent_is_small_slice_077
     * @tc.desc      Verify money percentage one percent is small slice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_one_percent_is_small_slice_077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_one_percent_is_small_slice_077');
      let amount: Money = new Money(10000);
      let result: Money = percentOfMoney(amount, 1);
      expect(result.cents()).assertEqual(100);
      expect(result.compareTo(amount)).assertEqual(-1);
      expect(result.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0780
     * @tc.name      money_percentage_ninety_nine_keeps_almost_everything_078
     * @tc.desc      Verify money percentage ninety nine keeps almost everything.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_ninety_nine_keeps_almost_everything_078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_ninety_nine_keeps_almost_everything_078');
      let amount: Money = new Money(10000);
      let result: Money = percentOfMoney(amount, 99);
      expect(result.cents()).assertEqual(9900);
      expect(result.compareTo(amount)).assertEqual(-1);
      expect(result.equals(new Money(9900))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0790
     * @tc.name      money_percentage_of_zero_amount_is_zero_079
     * @tc.desc      Verify money percentage of zero amount is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_of_zero_amount_is_zero_079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_of_zero_amount_is_zero_079');
      let zero: Money = Money.zero();
      let zeroPercent: Money = percentOfMoney(zero, 0);
      let half: Money = percentOfMoney(zero, 50);
      expect(zeroPercent.cents()).assertEqual(0);
      expect(half.cents()).assertEqual(0);
      expect(half.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0800
     * @tc.name      money_percentage_rounds_down_below_half_cent_080
     * @tc.desc      Verify money percentage rounds down below half cent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_rounds_down_below_half_cent_080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_rounds_down_below_half_cent_080');
      // One percent of 12345 is 123.45, which must round down to 123.
      let amount: Money = new Money(12345);
      let result: Money = percentOfMoney(amount, 1);
      expect(result.cents()).assertEqual(123);
      expect(result.isPositive()).assertTrue();
      expect(result.compareTo(new Money(124))).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0810
     * @tc.name      money_percentage_rounds_up_above_half_cent_081
     * @tc.desc      Verify money percentage rounds up above half cent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_percentage_rounds_up_above_half_cent_081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_percentage_rounds_up_above_half_cent_081');
      // Two percent of 12345 is 246.9, which must round up to 247.
      let amount: Money = new Money(12345);
      let result: Money = percentOfMoney(amount, 2);
      expect(result.cents()).assertEqual(247);
      expect(result.compareTo(new Money(246))).assertEqual(1);
      expect(result.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0820
     * @tc.name      money_chained_multiply_then_add_082
     * @tc.desc      Verify money chained multiply then add.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_chained_multiply_then_add_082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_chained_multiply_then_add_082');
      let unit: Money = new Money(5);
      let shipping: Money = new Money(7);
      let total: Money = unit.multiply(3).add(shipping);
      expect(total.cents()).assertEqual(22);
      expect(total.equals(new Money(22))).assertTrue();
      expect(total.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0830
     * @tc.name      money_chained_subtract_then_multiply_083
     * @tc.desc      Verify money chained subtract then multiply.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_chained_subtract_then_multiply_083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_chained_subtract_then_multiply_083');
      let gross: Money = new Money(1000);
      let refund: Money = new Money(200);
      // Refund first, then triple the remainder: (1000 - 200) * 3 = 2400.
      let scaled: Money = gross.subtract(refund).multiply(3);
      expect(scaled.cents()).assertEqual(2400);
      expect(scaled.compareTo(gross)).assertEqual(1);
      expect(scaled.equals(new Money(2400))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0840
     * @tc.name      money_large_accumulation_subtracting_reaches_zero_084
     * @tc.desc      Verify money large accumulation subtracting reaches zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_large_accumulation_subtracting_reaches_zero_084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_large_accumulation_subtracting_reaches_zero_084');
      // A thousand subtractions of 499900 must drain 499900000 exactly to zero.
      let remaining: Money = new Money(499900000);
      for (let step: number = 0; step < 1000; step++) {
        remaining = remaining.subtract(new Money(499900));
      }
      expect(remaining.cents()).assertEqual(0);
      expect(remaining.isZero()).assertTrue();
      expect(remaining.equals(Money.zero())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0850
     * @tc.name      money_equals_matches_equal_negative_amounts_085
     * @tc.desc      Verify money equals matches equal negative amounts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_equals_matches_equal_negative_amounts_085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_equals_matches_equal_negative_amounts_085');
      let first: Money = new Money(-500);
      let second: Money = new Money(-500);
      let positive: Money = new Money(500);
      expect(first.equals(second)).assertTrue();
      expect(first.equals(positive)).assertFalse();
      expect(first.compareTo(second)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0860
     * @tc.name      money_clamp_does_not_modify_the_source_086
     * @tc.desc      Verify money clamp does not modify the source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_clamp_does_not_modify_the_source_086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_clamp_does_not_modify_the_source_086');
      let source: Money = new Money(-250);
      let clamped: Money = source.clampAtZero();
      expect(clamped.cents()).assertEqual(0);
      expect(source.cents()).assertEqual(-250);
      expect(source.isNegative()).assertTrue();
      expect(source.equals(clamped)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0870
     * @tc.name      money_add_after_clamp_ignores_negative_source_087
     * @tc.desc      Verify money add after clamp ignores negative source.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_add_after_clamp_ignores_negative_source_087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_add_after_clamp_ignores_negative_source_087');
      let debt: Money = new Money(-400);
      let payment: Money = new Money(150);
      let settled: Money = debt.clampAtZero().add(payment);
      expect(settled.cents()).assertEqual(150);
      expect(settled.isPositive()).assertTrue();
      expect(settled.equals(payment)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0880
     * @tc.name      money_of_yuan_absorbs_binary_fraction_artifact_088
     * @tc.desc      Verify money of yuan absorbs binary fraction artifact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_of_yuan_absorbs_binary_fraction_artifact_088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_of_yuan_absorbs_binary_fraction_artifact_088');
      // 8.29 has no exact binary form, so scaling by 100 and rounding must still produce 829.
      let amount: Money = Money.ofYuan(8.29);
      expect(amount.cents()).assertEqual(829);
      expect(amount.equals(new Money(829))).assertTrue();
      expect(amount.isZero()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0890
     * @tc.name      money_add_result_exceeds_both_positive_operands_089
     * @tc.desc      Verify money add result exceeds both positive operands.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_add_result_exceeds_both_positive_operands_089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_add_result_exceeds_both_positive_operands_089');
      let left: Money = new Money(1000);
      let right: Money = new Money(250);
      let total: Money = left.add(right);
      expect(total.compareTo(left)).assertEqual(1);
      expect(total.compareTo(right)).assertEqual(1);
      expect(total.equals(new Money(1250))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0900
     * @tc.name      money_repeated_halving_compounds_rounding_090
     * @tc.desc      Verify money repeated halving compounds rounding.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_repeated_halving_compounds_rounding_090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_repeated_halving_compounds_rounding_090');
      let amount: Money = new Money(1000);
      // Halving 1000 three times must pass through 500 and 250 before resting on 125.
      let firstHalf: Money = percentOfMoney(amount, 50);
      let secondHalf: Money = percentOfMoney(firstHalf, 50);
      let thirdHalf: Money = percentOfMoney(secondHalf, 50);
      expect(firstHalf.cents()).assertEqual(500);
      expect(secondHalf.cents()).assertEqual(250);
      expect(thirdHalf.cents()).assertEqual(125);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_ARITHMETIC_0910
     * @tc.name      money_multiply_quantity_above_one_hundred_091
     * @tc.desc      Verify money multiply quantity above one hundred.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_multiply_quantity_above_one_hundred_091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_multiply_quantity_above_one_hundred_091');
      let unit: Money = new Money(199);
      let bulk: Money = unit.multiply(150);
      expect(bulk.cents()).assertEqual(29850);
      expect(bulk.isPositive()).assertTrue();
      expect(bulk.compareTo(unit)).assertEqual(1);
    });
  });
}
