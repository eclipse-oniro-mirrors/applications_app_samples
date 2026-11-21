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
import { Money, Valuation } from '../Shared/ShopModel';
import { createGoods } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Takes cents directly, keeping sweeps a table of bare numbers. */
function valuationOf(originalCents: number, discountPercent: number): Valuation {
  return new Valuation(new Money(originalCents), discountPercent);
}

/** Only this call can throw; construction never does. */
function finalPriceOf(item: Valuation): Money {
  return item.finalPrice();
}

export default function valuationModelTest() {
  describe('OrangeShoppingValuationModel', () => {
    let baseline: Valuation = new Valuation(new Money(0), 0);

    beforeAll(() => {
      baseline = new Valuation(new Money(10000), 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'valuation suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0010
     * @tc.name      zero_discount_final_equals_original_001
     * @tc.desc      Verify zero discount final equals original.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_discount_final_equals_original_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_discount_final_equals_original_001');
      let final: Money = baseline.finalPrice();
      expect(final.cents()).assertEqual(10000);
      expect(final.equals(baseline.original)).assertTrue();
      expect(baseline.discountPercent).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0020
     * @tc.name      zero_discount_saved_is_zero_002
     * @tc.desc      Verify zero discount saved is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_discount_saved_is_zero_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_discount_saved_is_zero_002');
      let saved: Money = baseline.saved();
      expect(saved.cents()).assertEqual(0);
      expect(saved.isZero()).assertTrue();
      expect(saved.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0030
     * @tc.name      zero_discount_is_not_discounted_003
     * @tc.desc      Verify zero discount is not discounted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_discount_is_not_discounted_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_discount_is_not_discounted_003');
      expect(baseline.isDiscounted()).assertFalse();
      expect(baseline.discountPercent).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0040
     * @tc.name      one_cent_keeps_price_under_any_discount_004
     * @tc.desc      Verify one cent keeps price under any discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_keeps_price_under_any_discount_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_keeps_price_under_any_discount_004');
      let discounts: number[] = [1, 25];
      let finals: number[] = [1, 1];
      // A single cent cannot be split, so any percent below 100 leaves the price at 1 with nothing saved.
      expect(discounts.length).assertEqual(finals.length);
      for (let index: number = 0; index < discounts.length; index++) {
        let item: Valuation = valuationOf(1, discounts[index]);
        expect(item.finalPrice().cents()).assertEqual(finals[index]);
        expect(item.saved().cents()).assertEqual(0);
        expect(item.isDiscounted()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0050
     * @tc.name      final_and_saved_agree_at_or_above_half_005
     * @tc.desc      Verify final and saved agree at or above half.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('final_and_saved_agree_at_or_above_half_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: final_and_saved_agree_at_or_above_half_005');
      let originals: number[] = [10000, 2, 2];
      let discounts: number[] = [50, 75, 50];
      let expectedFinal: number[] = [5000, 1, 1];
      let expectedSaved: number[] = [5000, 1, 1];
      // Half splits evenly; 75% of two cents leaves half a cent that rounds to 1, matching the saved side.
      expect(originals.length).assertEqual(discounts.length);
      expect(expectedFinal.length).assertEqual(expectedSaved.length);
      for (let index: number = 0; index < originals.length; index++) {
        let item: Valuation = valuationOf(originals[index], discounts[index]);
        expect(item.finalPrice().cents()).assertEqual(expectedFinal[index]);
        expect(item.saved().cents()).assertEqual(expectedSaved[index]);
        expect(item.finalPrice().equals(item.saved())).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0060
     * @tc.name      final_and_saved_match_expected_cents_006
     * @tc.desc      Verify final and saved match expected cents.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('final_and_saved_match_expected_cents_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: final_and_saved_match_expected_cents_006');
      // Rounding runs half up: 199 at 50% keeps 100, while 999 at 99% falls to 10.
      let originals: number[] = [199, 499900, 999, 100, 12345, 100];
      let discounts: number[] = [50, 1, 99, 10, 90, 99];
      let expectedFinal: number[] = [100, 494901, 10, 90, 1235, 1];
      let expectedSaved: number[] = [99, 4999, 989, 10, 11110, 99];
      expect(originals.length).assertEqual(discounts.length);
      expect(expectedFinal.length).assertEqual(expectedSaved.length);
      for (let index: number = 0; index < originals.length; index++) {
        let item: Valuation = valuationOf(originals[index], discounts[index]);
        expect(item.finalPrice().cents()).assertEqual(expectedFinal[index]);
        expect(item.saved().cents()).assertEqual(expectedSaved[index]);
        expect(item.finalPrice().isPositive()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0070
     * @tc.name      ninety_nine_percent_keeps_one_percent_007
     * @tc.desc      Verify ninety nine percent keeps one percent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('ninety_nine_percent_keeps_one_percent_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ninety_nine_percent_keeps_one_percent_007');
      let item: Valuation = valuationOf(10000, 99);
      expect(item.finalPrice().cents()).assertEqual(100);
      expect(item.saved().cents()).assertEqual(9900);
      expect(item.finalPrice().compareTo(item.original)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0080
     * @tc.name      ninety_nine_percent_on_one_cent_is_free_008
     * @tc.desc      Verify ninety nine percent on one cent is free.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('ninety_nine_percent_on_one_cent_is_free_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ninety_nine_percent_on_one_cent_is_free_008');
      let item: Valuation = valuationOf(1, 99);
      // 99% of a single cent rounds to zero, so the item is free even below a full discount.
      expect(item.finalPrice().cents()).assertEqual(0);
      expect(item.saved().cents()).assertEqual(1);
      expect(item.finalPrice().isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0090
     * @tc.name      original_12345_at_one_percent_009
     * @tc.desc      Verify original 12345 at one percent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('original_12345_at_one_percent_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: original_12345_at_one_percent_009');
      let item: Valuation = valuationOf(12345, 1);
      let final: Money = item.finalPrice();
      expect(final.cents()).assertEqual(12222);
      expect(item.saved().cents()).assertEqual(123);
      expect(final.compareTo(item.original)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0100
     * @tc.name      hundred_percent_reports_discounted_010
     * @tc.desc      Verify hundred percent reports discounted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('hundred_percent_reports_discounted_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: hundred_percent_reports_discounted_010');
      let item: Valuation = valuationOf(10000, 100);
      expect(item.isDiscounted()).assertTrue();
      expect(item.discountPercent).assertEqual(100);
      expect(item.discountPercent > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0110
     * @tc.name      above_hundred_clamps_to_free_011
     * @tc.desc      Verify above hundred clamps to free.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('above_hundred_clamps_to_free_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: above_hundred_clamps_to_free_011');
      // Above 100 the price must clamp at free rather than flip sign and pay the buyer.
      let discounts: number[] = [101, 150, 1000];
      for (let index: number = 0; index < discounts.length; index++) {
        let item: Valuation = valuationOf(10000, discounts[index]);
        expect(item.finalPrice().cents()).assertEqual(0);
        expect(item.saved().cents()).assertEqual(10000);
        expect(item.isDiscounted()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0120
     * @tc.name      negative_discount_throws_012
     * @tc.desc      Verify negative discount throws.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_discount_throws_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_discount_throws_012');
      let discounts: number[] = [-1, -50];
      for (let index: number = 0; index < discounts.length; index++) {
        let item: Valuation = valuationOf(10000, discounts[index]);
        let __thrown453: boolean = false;
        try {
          (() => {
          finalPriceOf(item);
        })();
        } catch (error) {
          __thrown453 = true;
        }
        expect(__thrown453).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0130
     * @tc.name      final_plus_saved_equals_original_013
     * @tc.desc      Verify final plus saved equals original.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('final_plus_saved_equals_original_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: final_plus_saved_equals_original_013');
      // Six split points including both ends: no rounding step may lose or invent a cent.
      let discounts: number[] = [0, 10, 25, 50, 75, 100];
      for (let index: number = 0; index < discounts.length; index++) {
        let item: Valuation = valuationOf(10000, discounts[index]);
        let restored: Money = item.finalPrice().add(item.saved());
        expect(restored.cents()).assertEqual(10000);
        expect(restored.equals(item.original)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0140
     * @tc.name      saved_is_never_negative_014
     * @tc.desc      Verify saved is never negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('saved_is_never_negative_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: saved_is_never_negative_014');
      let discounts: number[] = [0, 1, 33, 66, 99, 100];
      for (let index: number = 0; index < discounts.length; index++) {
        let item: Valuation = valuationOf(12345, discounts[index]);
        expect(item.saved().isNegative()).assertFalse();
        expect(item.saved().compareTo(Money.zero()) >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0150
     * @tc.name      final_never_exceeds_original_015
     * @tc.desc      Verify final never exceeds original.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('final_never_exceeds_original_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: final_never_exceeds_original_015');
      let discounts: number[] = [0, 1, 33, 99, 100];
      for (let index: number = 0; index < discounts.length; index++) {
        let item: Valuation = valuationOf(12345, discounts[index]);
        expect(item.finalPrice().compareTo(item.original) <= 0).assertTrue();
        expect(item.finalPrice().isPositive() || item.finalPrice().isZero()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0160
     * @tc.name      saved_grows_with_discount_016
     * @tc.desc      Verify saved grows with discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('saved_grows_with_discount_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: saved_grows_with_discount_016');
      let discounts: number[] = [0, 10, 25, 50, 75, 100];
      let previous: Money = valuationOf(10000, discounts[0]).saved();
      for (let index: number = 1; index < discounts.length; index++) {
        let current: Money = valuationOf(10000, discounts[index]).saved();
        expect(previous.compareTo(current) <= 0).assertTrue();
        expect(current.compareTo(previous) >= 0).assertTrue();
        previous = current;
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0170
     * @tc.name      final_falls_with_discount_017
     * @tc.desc      Verify final falls with discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('final_falls_with_discount_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: final_falls_with_discount_017');
      let discounts: number[] = [0, 10, 25, 50, 75, 100];
      let previous: Money = valuationOf(10000, discounts[0]).finalPrice();
      for (let index: number = 1; index < discounts.length; index++) {
        let current: Money = valuationOf(10000, discounts[index]).finalPrice();
        expect(previous.compareTo(current) >= 0).assertTrue();
        expect(current.compareTo(previous) <= 0).assertTrue();
        previous = current;
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0180
     * @tc.name      is_discounted_true_for_positive_percents_018
     * @tc.desc      Verify is discounted true for positive percents.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('is_discounted_true_for_positive_percents_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: is_discounted_true_for_positive_percents_018');
      let discounts: number[] = [1, 25, 50, 99, 100];
      for (let index: number = 0; index < discounts.length; index++) {
        let item: Valuation = valuationOf(10000, discounts[index]);
        expect(item.isDiscounted()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0190
     * @tc.name      is_discounted_false_for_zero_percent_019
     * @tc.desc      Verify is discounted false for zero percent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('is_discounted_false_for_zero_percent_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: is_discounted_false_for_zero_percent_019');
      let item: Valuation = valuationOf(10000, 0);
      expect(item.isDiscounted()).assertFalse();
      expect(item.discountPercent).assertEqual(0);
      expect(item.finalPrice().equals(item.original)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0200
     * @tc.name      discount_flag_is_percent_based_not_saving_based_020
     * @tc.desc      Verify discount flag is percent based not saving based.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('discount_flag_is_percent_based_not_saving_based_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: discount_flag_is_percent_based_not_saving_based_020');
      let item: Valuation = valuationOf(1, 1);
      // The flag keys off discountPercent > 0, not the money saved, so one percent of a cent still counts.
      expect(item.saved().cents()).assertEqual(0);
      expect(item.isDiscounted()).assertTrue();
      expect(item.discountPercent > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0210
     * @tc.name      zero_original_still_reports_discounted_021
     * @tc.desc      Verify zero original still reports discounted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_original_still_reports_discounted_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_original_still_reports_discounted_021');
      let item: Valuation = valuationOf(0, 50);
      expect(item.isDiscounted()).assertTrue();
      expect(item.saved().cents()).assertEqual(0);
      expect(item.discountPercent).assertEqual(50);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0220
     * @tc.name      one_cent_at_fifty_percent_rounds_back_to_one_022
     * @tc.desc      Verify one cent at fifty percent rounds back to one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_at_fifty_percent_rounds_back_to_one_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_at_fifty_percent_rounds_back_to_one_022');
      let item: Valuation = valuationOf(1, 50);
      // Half a cent rounds up, so the buyer still pays the whole cent and saves nothing.
      expect(item.finalPrice().cents()).assertEqual(1);
      expect(item.saved().cents()).assertEqual(0);
      expect(item.finalPrice().equals(item.original)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0230
     * @tc.name      one_cent_at_hundred_percent_is_free_023
     * @tc.desc      Verify one cent at hundred percent is free.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_at_hundred_percent_is_free_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_at_hundred_percent_is_free_023');
      let item: Valuation = valuationOf(1, 100);
      expect(item.finalPrice().cents()).assertEqual(0);
      expect(item.saved().cents() === 1).assertTrue();
      expect(item.finalPrice().isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0240
     * @tc.name      original_1000_cents_at_forty_percent_024
     * @tc.desc      Verify original 1000 cents at forty percent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('original_1000_cents_at_forty_percent_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: original_1000_cents_at_forty_percent_024');
      let item: Valuation = valuationOf(1000, 40);
      let final: Money = item.finalPrice();
      expect(final.cents()).assertEqual(600);
      expect(item.saved().cents()).assertEqual(400);
      expect(item.saved().equals(new Money(400))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0250
     * @tc.name      expected_price_and_saving_pairs_025
     * @tc.desc      Verify expected price and saving pairs.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('expected_price_and_saving_pairs_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: expected_price_and_saving_pairs_025');
      // The last row is the sharpest: 10% of 12345 is 1234.5, so 11111 is payable and 1234 is the remainder.
      let originals: number[] = [100000, 3, 9999, 100, 12345];
      let discounts: number[] = [33, 25, 50, 5, 10];
      let expectedFinal: number[] = [67000, 2, 5000, 95, 11111];
      let expectedSaved: number[] = [33000, 1, 4999, 5, 1234];
      expect(originals.length).assertEqual(discounts.length);
      expect(expectedFinal.length).assertEqual(expectedSaved.length);
      for (let index: number = 0; index < originals.length; index++) {
        let item: Valuation = valuationOf(originals[index], discounts[index]);
        let final: Money = item.finalPrice();
        expect(final.cents()).assertEqual(expectedFinal[index]);
        expect(item.saved().cents()).assertEqual(expectedSaved[index]);
        expect(final.equals(new Money(expectedFinal[index]))).assertTrue();
        expect(item.saved().equals(new Money(expectedSaved[index]))).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0260
     * @tc.name      original_is_preserved_after_calculation_026
     * @tc.desc      Verify original is preserved after calculation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('original_is_preserved_after_calculation_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: original_is_preserved_after_calculation_026');
      let item: Valuation = valuationOf(12345, 40);
      let before: number = item.original.cents();
      item.finalPrice();
      item.saved();
      let after: number = item.original.cents();
      expect(before).assertEqual(after);
      expect(after).assertEqual(12345);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0270
     * @tc.name      discount_percent_is_retained_verbatim_027
     * @tc.desc      Verify discount percent is retained verbatim.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('discount_percent_is_retained_verbatim_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: discount_percent_is_retained_verbatim_027');
      let item: Valuation = valuationOf(10000, 37);
      expect(item.discountPercent).assertEqual(37);
      expect(item.isDiscounted()).assertTrue();
      expect(item.finalPrice().cents()).assertEqual(6300);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0280
     * @tc.name      consecutive_valuations_are_independent_028
     * @tc.desc      Verify consecutive valuations are independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('consecutive_valuations_are_independent_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: consecutive_valuations_are_independent_028');
      let first: Valuation = valuationOf(10000, 25);
      let second: Valuation = valuationOf(50000, 50);
      expect(first.finalPrice().cents()).assertEqual(7500);
      expect(second.finalPrice().cents()).assertEqual(25000);
      expect(first.finalPrice().cents()).assertEqual(7500);
      expect(first.discountPercent).assertEqual(25);
      expect(second.discountPercent).assertEqual(50);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0290
     * @tc.name      same_original_different_discounts_differ_029
     * @tc.desc      Verify same original different discounts differ.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('same_original_different_discounts_differ_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: same_original_different_discounts_differ_029');
      let light: Valuation = valuationOf(10000, 10);
      let heavy: Valuation = valuationOf(10000, 50);
      expect(light.finalPrice().cents()).assertEqual(9000);
      expect(heavy.finalPrice().cents()).assertEqual(5000);
      expect(light.finalPrice().equals(heavy.finalPrice())).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0300
     * @tc.name      same_discount_different_originals_scale_030
     * @tc.desc      Verify same discount different originals scale.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('same_discount_different_originals_scale_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: same_discount_different_originals_scale_030');
      let cheaper: Valuation = valuationOf(10000, 25);
      let dearer: Valuation = valuationOf(20000, 25);
      expect(cheaper.finalPrice().cents()).assertEqual(7500);
      expect(dearer.finalPrice().cents()).assertEqual(15000);
      expect(dearer.finalPrice().compareTo(cheaper.finalPrice())).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0310
     * @tc.name      final_equals_percentage_of_original_031
     * @tc.desc      Verify final equals percentage of original.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('final_equals_percentage_of_original_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: final_equals_percentage_of_original_031');
      let item: Valuation = valuationOf(10000, 37);
      let expected: Money = item.original.percentage(100 - item.discountPercent);
      expect(item.finalPrice().cents()).assertEqual(6300);
      expect(item.finalPrice().equals(expected)).assertTrue();
      expect(item.finalPrice().compareTo(expected)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0320
     * @tc.name      saved_equals_original_minus_final_032
     * @tc.desc      Verify saved equals original minus final.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('saved_equals_original_minus_final_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: saved_equals_original_minus_final_032');
      let item: Valuation = valuationOf(12345, 40);
      let difference: Money = item.original.subtract(item.finalPrice());
      expect(item.saved().cents()).assertEqual(difference.cents());
      expect(item.saved().equals(difference)).assertTrue();
      expect(difference.cents()).assertEqual(4938);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0330
     * @tc.name      repeated_final_price_is_stable_033
     * @tc.desc      Verify repeated final price is stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_final_price_is_stable_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_final_price_is_stable_033');
      let item: Valuation = valuationOf(19999, 20);
      let first: Money = item.finalPrice();
      let second: Money = item.finalPrice();
      expect(first.cents()).assertEqual(15999);
      expect(first.equals(second)).assertTrue();
      expect(first.compareTo(second)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0340
     * @tc.name      repeated_saved_is_stable_034
     * @tc.desc      Verify repeated saved is stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('repeated_saved_is_stable_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: repeated_saved_is_stable_034');
      let item: Valuation = valuationOf(19999, 20);
      let first: Money = item.saved();
      let second: Money = item.saved();
      expect(first.cents()).assertEqual(4000);
      expect(first.equals(second)).assertTrue();
      expect(item.finalPrice().cents()).assertEqual(15999);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0350
     * @tc.name      original_from_yuan_at_twenty_percent_035
     * @tc.desc      Verify original from yuan at twenty percent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('original_from_yuan_at_twenty_percent_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: original_from_yuan_at_twenty_percent_035');
      let original: Money = Money.ofYuan(199.99);
      let item: Valuation = new Valuation(original, 20);
      expect(original.cents()).assertEqual(19999);
      expect(item.finalPrice().cents()).assertEqual(15999);
      expect(item.saved().cents()).assertEqual(4000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0360
     * @tc.name      original_from_yuan_at_hundred_percent_036
     * @tc.desc      Verify original from yuan at hundred percent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('original_from_yuan_at_hundred_percent_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: original_from_yuan_at_hundred_percent_036');
      let original: Money = Money.ofYuan(12.34);
      let item: Valuation = new Valuation(original, 100);
      expect(original.cents()).assertEqual(1234);
      expect(item.finalPrice().cents()).assertEqual(0);
      expect(item.saved().cents()).assertEqual(1234);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0370
     * @tc.name      thirty_three_percent_on_10000_cents_037
     * @tc.desc      Verify thirty three percent on 10000 cents.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('thirty_three_percent_on_10000_cents_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: thirty_three_percent_on_10000_cents_037');
      let item: Valuation = valuationOf(10000, 33);
      expect(item.finalPrice().cents()).assertEqual(6700);
      expect(item.saved().cents()).assertEqual(3300);
      expect(item.finalPrice().compareTo(item.saved())).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0380
     * @tc.name      adjacent_full_discount_boundary_038
     * @tc.desc      Verify adjacent full discount boundary.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('adjacent_full_discount_boundary_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: adjacent_full_discount_boundary_038');
      let almost: Valuation = valuationOf(10000, 99);
      let full: Valuation = valuationOf(10000, 100);
      expect(almost.finalPrice().cents()).assertEqual(100);
      expect(full.finalPrice().cents()).assertEqual(0);
      expect(almost.finalPrice().compareTo(full.finalPrice())).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0390
     * @tc.name      above_hundred_saved_equals_original_039
     * @tc.desc      Verify above hundred saved equals original.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('above_hundred_saved_equals_original_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: above_hundred_saved_equals_original_039');
      let item: Valuation = valuationOf(499900, 150);
      expect(item.finalPrice().cents()).assertEqual(0);
      expect(item.saved().cents()).assertEqual(499900);
      expect(item.saved().equals(item.original)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0400
     * @tc.name      goods_builder_prices_feed_valuation_040
     * @tc.desc      Verify goods builder prices feed valuation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_builder_prices_feed_valuation_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_builder_prices_feed_valuation_040');
      let ids: number[] = [0, 2];
      let titles: string[] = ['Discount Probe', 'Watch Probe'];
      let prices: number[] = [499900, 129900];
      let discounts: number[] = [10, 50];
      let expectedFinal: number[] = [449910, 64950];
      let expectedSaved: number[] = [49990, 64950];

      expect(ids.length).assertEqual(titles.length);
      expect(prices.length).assertEqual(discounts.length);
      expect(expectedFinal.length).assertEqual(expectedSaved.length);
      for (let index: number = 0; index < ids.length; index++) {
        let goodsPrice: Money = createGoods(ids[index], titles[index], prices[index]).price;
        let item: Valuation = new Valuation(goodsPrice, discounts[index]);
        expect(item.original.cents()).assertEqual(prices[index]);
        expect(item.finalPrice().cents()).assertEqual(expectedFinal[index]);
        expect(item.saved().cents()).assertEqual(expectedSaved[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0410
     * @tc.name      discount_negative_zero_behaves_as_zero_041
     * @tc.desc      Verify discount negative zero behaves as zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('discount_negative_zero_behaves_as_zero_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: discount_negative_zero_behaves_as_zero_041');
      let item: Valuation = valuationOf(10000, -0);
      // Negative zero slips past a '< 0' guard because -0 compares equal to 0, so it behaves as plain zero.
      expect(item.discountPercent).assertEqual(0);
      expect(item.isDiscounted()).assertFalse();
      expect(item.finalPrice().cents()).assertEqual(10000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0420
     * @tc.name      zero_original_with_negative_zero_discount_is_zero_042
     * @tc.desc      Verify zero original with negative zero discount is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_original_with_negative_zero_discount_is_zero_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_original_with_negative_zero_discount_is_zero_042');
      let item: Valuation = valuationOf(0, -0);
      expect(item.finalPrice().cents()).assertEqual(0);
      expect(item.saved().cents()).assertEqual(0);
      expect(item.isDiscounted()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0430
     * @tc.name      is_discounted_true_above_hundred_043
     * @tc.desc      Verify is discounted true above hundred.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('is_discounted_true_above_hundred_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: is_discounted_true_above_hundred_043');
      let item: Valuation = valuationOf(10000, 120);
      expect(item.isDiscounted()).assertTrue();
      expect(item.discountPercent).assertEqual(120);
      expect(item.finalPrice().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0440
     * @tc.name      zero_original_above_hundred_stays_zero_044
     * @tc.desc      Verify zero original above hundred stays zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_original_above_hundred_stays_zero_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_original_above_hundred_stays_zero_044');
      let item: Valuation = valuationOf(0, 150);
      expect(item.finalPrice().cents()).assertEqual(0);
      expect(item.saved().cents()).assertEqual(0);
      expect(item.isDiscounted()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0450
     * @tc.name      final_price_monotonic_over_full_sweep_045
     * @tc.desc      Verify final price monotonic over full sweep.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('final_price_monotonic_over_full_sweep_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: final_price_monotonic_over_full_sweep_045');
      let previous: Money = valuationOf(10000, 0).finalPrice();
      // A hundred one-percent steps from 0% to 100% must never raise the price and must end at free.
      for (let percent: number = 1; percent <= 100; percent++) {
        let current: Money = valuationOf(10000, percent).finalPrice();
        expect(previous.compareTo(current) >= 0).assertTrue();
        previous = current;
      }
      expect(previous.cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0460
     * @tc.name      saved_monotonic_over_full_sweep_046
     * @tc.desc      Verify saved monotonic over full sweep.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('saved_monotonic_over_full_sweep_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: saved_monotonic_over_full_sweep_046');
      let previous: Money = valuationOf(10000, 0).saved();
      // The mirror sweep: every step up in percent adds to the saving, ending at the full 10000 cents.
      for (let percent: number = 1; percent <= 100; percent++) {
        let current: Money = valuationOf(10000, percent).saved();
        expect(current.compareTo(previous) >= 0).assertTrue();
        previous = current;
      }
      expect(previous.cents()).assertEqual(10000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0470
     * @tc.name      final_plus_saved_over_full_sweep_047
     * @tc.desc      Verify final plus saved over full sweep.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('final_plus_saved_over_full_sweep_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: final_plus_saved_over_full_sweep_047');
      for (let percent: number = 0; percent <= 100; percent++) {
        let item: Valuation = valuationOf(12345, percent);
        let restored: Money = item.finalPrice().add(item.saved());
        expect(restored.cents()).assertEqual(12345);
        expect(restored.equals(item.original)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0480
     * @tc.name      final_price_never_negative_over_full_sweep_048
     * @tc.desc      Verify final price never negative over full sweep.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('final_price_never_negative_over_full_sweep_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: final_price_never_negative_over_full_sweep_048');
      for (let percent: number = 0; percent <= 100; percent++) {
        let item: Valuation = valuationOf(12345, percent);
        expect(item.finalPrice().isNegative()).assertFalse();
        expect(item.finalPrice().compareTo(Money.zero()) >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0490
     * @tc.name      saved_never_exceeds_original_over_full_sweep_049
     * @tc.desc      Verify saved never exceeds original over full sweep.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('saved_never_exceeds_original_over_full_sweep_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: saved_never_exceeds_original_over_full_sweep_049');
      for (let percent: number = 0; percent <= 100; percent++) {
        let item: Valuation = valuationOf(12345, percent);
        expect(item.saved().compareTo(item.original) <= 0).assertTrue();
        expect(item.saved().isNegative()).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0500
     * @tc.name      discount_flag_matches_percent_over_full_sweep_050
     * @tc.desc      Verify discount flag matches percent over full sweep.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('discount_flag_matches_percent_over_full_sweep_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: discount_flag_matches_percent_over_full_sweep_050');
      for (let percent: number = 0; percent <= 100; percent++) {
        let item: Valuation = valuationOf(10000, percent);
        let expected: boolean = percent > 0;
        expect(item.isDiscounted() === expected).assertTrue();
      }
      expect(valuationOf(10000, 0).isDiscounted()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0510
     * @tc.name      large_original_at_ninety_percent_051
     * @tc.desc      Verify large original at ninety percent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('large_original_at_ninety_percent_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: large_original_at_ninety_percent_051');
      let item: Valuation = valuationOf(100000, 90);
      expect(item.finalPrice().cents()).assertEqual(10000);
      expect(item.saved().cents()).assertEqual(90000);
      expect(item.saved().compareTo(item.finalPrice())).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0520
     * @tc.name      final_price_stays_below_unrounded_boundary_052
     * @tc.desc      Verify final price stays below unrounded boundary.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('final_price_stays_below_unrounded_boundary_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: final_price_stays_below_unrounded_boundary_052');
      // Each final sits one cent under its unrounded boundary (90, 45, 124), proving the round-down.
      let originals: number[] = [99, 49, 12345];
      let discounts: number[] = [10, 10, 99];
      let expectedFinal: number[] = [89, 44, 123];
      let expectedSaved: number[] = [10, 5, 12222];
      let boundaries: number[] = [90, 45, 124];
      expect(originals.length).assertEqual(discounts.length);
      expect(expectedFinal.length).assertEqual(boundaries.length);
      for (let index: number = 0; index < originals.length; index++) {
        let item: Valuation = valuationOf(originals[index], discounts[index]);
        let final: Money = item.finalPrice();
        expect(final.cents()).assertEqual(expectedFinal[index]);
        expect(item.saved().cents()).assertEqual(expectedSaved[index]);
        expect(final.compareTo(new Money(boundaries[index]))).assertEqual(-1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0530
     * @tc.name      original_51_cents_at_ten_percent_rounds_up_053
     * @tc.desc      Verify original 51 cents at ten percent rounds up.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('original_51_cents_at_ten_percent_rounds_up_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: original_51_cents_at_ten_percent_rounds_up_053');
      let item: Valuation = valuationOf(51, 10);
      // 51 x 0.9 is 45.9, which rounds up to 46, so the remainder is not truncated toward zero.
      expect(item.finalPrice().cents()).assertEqual(46);
      expect(item.saved().cents()).assertEqual(5);
      expect(item.finalPrice().compareTo(new Money(45))).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0540
     * @tc.name      negative_discount_throws_for_zero_original_054
     * @tc.desc      Verify negative discount throws for zero original.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_discount_throws_for_zero_original_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_discount_throws_012_for_zero_original');
      let item: Valuation = valuationOf(0, -1);
      let __thrown454: boolean = false;
      try {
        (() => {
        finalPriceOf(item);
      })();
      } catch (error) {
        __thrown454 = true;
      }
      expect(__thrown454).assertTrue();
      expect(item.original.cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0550
     * @tc.name      negative_discount_does_not_mutate_original_055
     * @tc.desc      Verify negative discount does not mutate original.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_discount_does_not_mutate_original_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_discount_does_not_mutate_original_055');
      let item: Valuation = valuationOf(10000, -25);
      let __thrown455: boolean = false;
      try {
        (() => {
        finalPriceOf(item);
      })();
      } catch (error) {
        __thrown455 = true;
      }
      expect(__thrown455).assertTrue();
      expect(item.original.cents()).assertEqual(10000);
      expect(item.discountPercent).assertEqual(-25);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0560
     * @tc.name      valuation_from_goods_builder_at_zero_056
     * @tc.desc      Verify valuation from goods builder at zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('valuation_from_goods_builder_at_zero_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: valuation_from_goods_builder_at_zero_056');
      let goodsPrice: Money = createGoods(2, 'Watch Probe', 129900).price;
      let item: Valuation = new Valuation(goodsPrice, 0);
      expect(item.finalPrice().cents()).assertEqual(129900);
      expect(item.saved().cents()).assertEqual(0);
      expect(item.finalPrice().equals(item.original)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0570
     * @tc.name      valuation_of_free_goods_057
     * @tc.desc      Verify valuation of free goods.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('valuation_of_free_goods_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: valuation_of_free_goods_057');
      let freePrice: Money = createGoods(101, 'Free Gift', 0).price;
      let item: Valuation = new Valuation(freePrice, 50);
      expect(item.finalPrice().cents()).assertEqual(0);
      expect(item.saved().cents()).assertEqual(0);
      expect(item.isDiscounted()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0580
     * @tc.name      original_from_yuan_sub_cent_at_fifty_058
     * @tc.desc      Verify original from yuan sub cent at fifty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('original_from_yuan_sub_cent_at_fifty_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: original_from_yuan_sub_cent_at_fifty_058');
      let original: Money = Money.ofYuan(0.005);
      let item: Valuation = new Valuation(original, 50);
      expect(original.cents()).assertEqual(1);
      expect(item.finalPrice().cents()).assertEqual(1);
      expect(item.saved().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0590
     * @tc.name      shared_original_money_is_not_mutated_059
     * @tc.desc      Verify shared original money is not mutated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('shared_original_money_is_not_mutated_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: shared_original_money_is_not_mutated_059');
      let original: Money = new Money(10000);
      let light: Valuation = new Valuation(original, 25);
      let heavy: Valuation = new Valuation(original, 50);
      expect(light.finalPrice().cents()).assertEqual(7500);
      expect(heavy.finalPrice().cents()).assertEqual(5000);
      expect(original.cents()).assertEqual(10000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0600
     * @tc.name      negative_original_at_full_discount_saves_negative_amount_060
     * @tc.desc      Verify negative original at full discount saves negative amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_original_at_full_discount_saves_negative_amount_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_original_at_full_discount_saves_negative_amount_060');
      let item: Valuation = valuationOf(-100, 100);
      // A negative original keeps its sign in saved, so the discount summary reports a negative saving.
      let final: Money = item.finalPrice();
      expect(final.cents() === 0).assertTrue();
      expect(item.saved().cents()).assertEqual(-100);
      expect(item.saved().isNegative()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0610
     * @tc.name      negative_original_with_zero_discount_keeps_value_061
     * @tc.desc      Verify negative original with zero discount keeps value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_original_with_zero_discount_keeps_value_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_original_with_zero_discount_keeps_value_061');
      let item: Valuation = valuationOf(-100, 0);
      expect(item.finalPrice().cents()).assertEqual(-100);
      expect(item.finalPrice().equals(item.original)).assertTrue();
      expect(item.saved().cents()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0620
     * @tc.name      zero_original_full_sweep_stays_zero_062
     * @tc.desc      Verify zero original full sweep stays zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_original_full_sweep_stays_zero_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_original_full_sweep_stays_zero_062');
      for (let percent: number = 0; percent <= 100; percent++) {
        let item: Valuation = valuationOf(0, percent);
        expect(item.finalPrice().cents()).assertEqual(0);
        expect(item.saved().cents()).assertEqual(0);
        expect(item.finalPrice().isZero()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0630
     * @tc.name      one_cent_original_full_sweep_stays_binary_063
     * @tc.desc      Verify one cent original full sweep stays binary.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_original_full_sweep_stays_binary_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_original_full_sweep_stays_binary_063');
      for (let percent: number = 0; percent <= 100; percent++) {
        let item: Valuation = valuationOf(1, percent);
        // Across every percent the lone cent sits wholly in final or in saved, never split or doubled.
        let final: Money = item.finalPrice();
        let saved: Money = item.saved();
        expect(final.cents() >= 0).assertTrue();
        expect(final.cents() <= 1).assertTrue();
        expect(final.cents() + saved.cents()).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0640
     * @tc.name      cents_are_integers_over_full_sweep_064
     * @tc.desc      Verify cents are integers over full sweep.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cents_are_integers_over_full_sweep_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cents_are_integers_over_full_sweep_064');
      for (let percent: number = 0; percent <= 100; percent++) {
        let item: Valuation = valuationOf(12345, percent);
        expect(Number.isInteger(item.finalPrice().cents())).assertTrue();
        expect(Number.isInteger(item.saved().cents())).assertTrue();
        expect(Number.isInteger(item.original.cents())).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0650
     * @tc.name      zero_discount_keeps_original_for_many_originals_065
     * @tc.desc      Verify zero discount keeps original for many originals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_discount_keeps_original_for_many_originals_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_discount_keeps_original_for_many_originals_065');
      let originals: number[] = [0, 100, 10000, 499900];
      for (let index: number = 0; index < originals.length; index++) {
        let item: Valuation = valuationOf(originals[index], 0);
        expect(item.finalPrice().cents()).assertEqual(originals[index]);
        expect(item.finalPrice().equals(item.original)).assertTrue();
        expect(item.saved().cents()).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0660
     * @tc.name      hundred_percent_free_for_many_originals_066
     * @tc.desc      Verify hundred percent free for many originals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('hundred_percent_free_for_many_originals_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: hundred_percent_free_for_many_originals_066');
      let originals: number[] = [1, 100, 12345, 10000, 499900];
      for (let index: number = 0; index < originals.length; index++) {
        let item: Valuation = valuationOf(originals[index], 100);
        expect(item.finalPrice().cents()).assertEqual(0);
        expect(item.saved().cents()).assertEqual(originals[index]);
        expect(item.saved().equals(item.original)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0670
     * @tc.name      negative_discount_flag_is_false_067
     * @tc.desc      Verify negative discount flag is false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_discount_flag_is_false_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_discount_flag_is_false_067');
      let item: Valuation = valuationOf(10000, -5);
      expect(item.isDiscounted()).assertFalse();
      expect(item.discountPercent).assertEqual(-5);
      let __thrown456: boolean = false;
      try {
        (() => {
        finalPriceOf(item);
      })();
      } catch (error) {
        __thrown456 = true;
      }
      expect(__thrown456).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0680
     * @tc.name      interleaved_final_and_saved_calls_are_stable_068
     * @tc.desc      Verify interleaved final and saved calls are stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('interleaved_final_and_saved_calls_are_stable_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: interleaved_final_and_saved_calls_are_stable_068');
      let item: Valuation = valuationOf(12345, 30);
      // 30% of 12345 leaves 8641.5, rounded up to 8642; saved is the remainder 3703, not a second rounding.
      let firstFinal: Money = item.finalPrice();
      let firstSaved: Money = item.saved();
      let secondFinal: Money = item.finalPrice();
      let secondSaved: Money = item.saved();
      expect(firstFinal.cents()).assertEqual(8642);
      expect(firstSaved.cents()).assertEqual(3703);
      expect(firstFinal.equals(secondFinal)).assertTrue();
      expect(firstSaved.equals(secondSaved)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0690
     * @tc.name      original_and_percent_fields_survive_repeated_reads_069
     * @tc.desc      Verify original and percent fields survive repeated reads.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('original_and_percent_fields_survive_repeated_reads_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: original_and_percent_fields_survive_repeated_reads_069');
      let item: Valuation = valuationOf(8888, 45);
      item.finalPrice();
      item.saved();
      item.isDiscounted();
      expect(item.original.cents()).assertEqual(8888);
      expect(item.discountPercent).assertEqual(45);
      expect(item.finalPrice().cents()).assertEqual(4888);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0700
     * @tc.name      original_12345_at_thirty_three_percent_rounds_down_070
     * @tc.desc      Verify original 12345 at thirty three percent rounds down.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('original_12345_at_thirty_three_percent_rounds_down_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: original_12345_at_thirty_three_percent_rounds_down_070');
      let item: Valuation = valuationOf(12345, 33);
      // 12345 x 0.67 is 8271.15, so the payable stops at 8271 and saved takes the other 4074.
      let final: Money = item.finalPrice();
      expect(final.cents()).assertEqual(8271);
      expect(item.saved().cents()).assertEqual(4074);
      expect(final.compareTo(new Money(8272))).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0710
     * @tc.name      discount_33_on_three_cents_rounds_final_down_071
     * @tc.desc      Verify discount 33 on three cents rounds final down.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('discount_33_on_three_cents_rounds_final_down_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: discount_33_on_three_cents_rounds_final_down_071');
      let item: Valuation = valuationOf(3, 33);
      let final: Money = item.finalPrice();
      let restored: Money = final.add(item.saved());
      expect(final.cents()).assertEqual(2);
      expect(item.saved().cents()).assertEqual(1);
      expect(restored.equals(item.original)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0720
     * @tc.name      original_101_at_fifty_percent_keeps_half_cent_with_larger_final_072
     * @tc.desc      Verify original 101 at fifty percent keeps half cent with larger final.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('original_101_at_fifty_percent_keeps_half_cent_with_larger_final_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: original_101_at_fifty_percent_keeps_half_cent_with_larger_final_072');
      let item: Valuation = valuationOf(101, 50);
      // The half cent is rounded toward the customer, so the payable 51 exceeds the saved 50.
      let final: Money = item.finalPrice();
      let saved: Money = item.saved();
      expect(final.cents()).assertEqual(51);
      expect(saved.cents()).assertEqual(50);
      expect(final.compareTo(saved)).assertEqual(1);
      expect(final.add(saved).equals(item.original)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0730
     * @tc.name      max_safe_original_splits_without_losing_a_cent_073
     * @tc.desc      Verify max safe original splits without losing a cent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_original_splits_without_losing_a_cent_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_original_splits_without_losing_a_cent_073');
      let original: Money = new Money(Number.MAX_SAFE_INTEGER);
      // The odd original splits into an even final and odd saved with no cent lost at the 2^53-1 limit.
      let item: Valuation = new Valuation(original, 50);
      let final: Money = item.finalPrice();
      let saved: Money = item.saved();
      expect(final.cents()).assertEqual(4503599627370496);
      expect(saved.cents()).assertEqual(4503599627370495);
      expect(Number.isInteger(final.cents())).assertTrue();
      expect(final.cents() + saved.cents()).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0740
     * @tc.name      negative_original_at_ten_percent_reduces_magnitude_074
     * @tc.desc      Verify negative original at ten percent reduces magnitude.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_original_at_ten_percent_reduces_magnitude_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_original_at_ten_percent_reduces_magnitude_074');
      let item: Valuation = valuationOf(-100, 10);
      let final: Money = item.finalPrice();
      expect(final.cents()).assertEqual(-90);
      expect(item.saved().cents()).assertEqual(-10);
      expect(final.isNegative()).assertTrue();
      expect(final.add(item.saved()).equals(item.original)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0750
     * @tc.name      same_discount_scales_saved_amount_twice_075
     * @tc.desc      Verify same discount scales saved amount twice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('same_discount_scales_saved_amount_twice_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: same_discount_scales_saved_amount_twice_075');
      let cheaper: Valuation = valuationOf(10000, 25);
      let dearer: Valuation = valuationOf(20000, 25);
      expect(cheaper.saved().cents()).assertEqual(2500);
      expect(dearer.saved().cents()).assertEqual(5000);
      expect(dearer.saved().equals(cheaper.saved().multiply(2))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_VALUATION_MODEL_0760
     * @tc.name      discount_99_on_five_cents_saves_every_cent_076
     * @tc.desc      Verify discount 99 on five cents saves every cent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('discount_99_on_five_cents_saves_every_cent_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: discount_99_on_five_cents_saves_every_cent_076');
      let item: Valuation = valuationOf(5, 99);
      // One percent of five cents is 0.05, which rounds to zero, so all five cents move to saved.
      let final: Money = item.finalPrice();
      expect(final.cents()).assertEqual(0);
      expect(item.saved().cents()).assertEqual(5);
      expect(final.add(item.saved()).equals(item.original)).assertTrue();
    });

  });
}
