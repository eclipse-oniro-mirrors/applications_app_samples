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
import { Cart, CartLine, CartSnapshot, Catalog, Coupon, Goods, Money, Valuation } from '../Shared/ShopModel';
import { cartLine, cartWith, createGoods, defaultCatalog } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function deepMoneyCartTest() {
  describe('OrangeShoppingDeepMoneyCart', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'deep money cart suite prepared');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0010
     * @tc.name      catalog_price_sum_matches_pair_doubling_001
     * @tc.desc      Verify catalog price sum matches pair doubling.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_price_sum_matches_pair_doubling_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_price_sum_matches_pair_doubling_001');
      let catalog: Catalog = defaultCatalog();
      let allGoods: Goods[] = catalog.all();
      let prices: Money[] = [];
      for (let index: number = 0; index < allGoods.length; index++) {
        prices.push(allGoods[index].price);
      }
      let total: Money = Money.sum(prices);
      // The catalog holds eight products twice, so each half sums to the same 1164200 cents.
      let leftSum: Money = Money.zero();
      let rightSum: Money = Money.zero();
      for (let index: number = 0; index < allGoods.length; index++) {
        if (index < 8) {
          leftSum = leftSum.add(allGoods[index].price);
        } else {
          rightSum = rightSum.add(allGoods[index].price);
        }
      }
      expect(total.cents()).assertEqual(2328400);
      expect(leftSum.cents()).assertEqual(1164200);
      expect(rightSum.equals(leftSum)).assertTrue();
      expect(total.equals(leftSum.add(rightSum))).assertTrue();
      expect(total.format()).assertEqual('¥23284.00');
      expect(total.isPositive()).assertTrue();
      expect(prices.length).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0020
     * @tc.name      three_identical_prices_sum_equals_multiply_002
     * @tc.desc      Verify three identical prices sum equals multiply.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('three_identical_prices_sum_equals_multiply_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: three_identical_prices_sum_equals_multiply_002');
      let unit: Money = new Money(1234);
      let values: Money[] = [unit, unit, unit];
      let summed: Money = Money.sum(values);
      let multiplied: Money = unit.multiply(3);
      let doubled: Money = unit.multiply(2);
      expect(summed.equals(multiplied)).assertTrue();
      expect(summed.cents()).assertEqual(3702);
      expect(summed.compareTo(multiplied)).assertEqual(0);
      expect(unit.multiply(2).add(unit).equals(summed)).assertTrue();
      expect(summed.format()).assertEqual('¥37.02');
      expect(multiplied.isPositive()).assertTrue();
      expect(doubled.compareTo(unit)).assertEqual(1);
      expect(summed.subtract(unit).equals(doubled)).assertTrue();
      expect(summed.isZero()).assertFalse();
      expect(summed.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0030
     * @tc.name      catalogue_cents_round_trip_through_money_constructor_003
     * @tc.desc      Verify catalogue cents round trip through money constructor.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalogue_cents_round_trip_through_money_constructor_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalogue_cents_round_trip_through_money_constructor_003');
      let catalog: Catalog = defaultCatalog();
      let allGoods: Goods[] = catalog.all();
      let mismatches: number = 0;
      for (let index: number = 0; index < allGoods.length; index++) {
        let rebuilt: Money = new Money(allGoods[index].price.cents());
        if (!rebuilt.equals(allGoods[index].price)) {
          mismatches++;
        }
        if (rebuilt.format() !== allGoods[index].price.format()) {
          mismatches++;
        }
      }
      expect(mismatches).assertEqual(0);
      expect(allGoods.length).assertEqual(16);
      expect(new Money(allGoods[0].price.cents()).format()).assertEqual('¥4999.00');
      expect(new Money(allGoods[4].price.cents()).format()).assertEqual('¥89.00');
      expect(new Money(0).cents()).assertEqual(0);
      expect(new Money(0).format()).assertEqual('¥0.00');
      // The constructor rounds to the nearest cent, so a fractional 10.5 becomes 11.
      expect(new Money(10.5).cents()).assertEqual(11);
      expect(new Money(10.5).isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0040
     * @tc.name      cheapest_and_most_expensive_sum_money_pair_004
     * @tc.desc      Verify cheapest and most expensive sum as a money pair.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cheapest_and_most_expensive_sum_money_pair_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cheapest_and_most_expensive_sum_money_pair_004');
      let catalog: Catalog = defaultCatalog();
      let cheapest: Goods | undefined = catalog.cheapest();
      let priciest: Goods | undefined = catalog.mostExpensive();
      expect(cheapest !== undefined).assertTrue();
      expect(priciest !== undefined).assertTrue();
      if (cheapest !== undefined && priciest !== undefined) {
        let pair: Money[] = [cheapest.price, priciest.price];
        let total: Money = Money.sum(pair);
        expect(pair.length).assertEqual(2);
        expect(total.cents()).assertEqual(508800);
        expect(total.equals(priciest.price.add(cheapest.price))).assertTrue();
        expect(total.format()).assertEqual('¥5088.00');
        expect(priciest.price.cents()).assertEqual(499900);
        expect(cheapest.price.isZero()).assertFalse();
        expect(total.isPositive()).assertTrue();
        expect(total.compareTo(priciest.price)).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0050
     * @tc.name      price_band_between_adjacent_levels_is_inclusive_005
     * @tc.desc      Verify price band between adjacent levels is inclusive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('price_band_between_adjacent_levels_is_inclusive_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: price_band_between_adjacent_levels_is_inclusive_005');
      let catalog: Catalog = defaultCatalog();
      let band: Goods[] = catalog.inPriceRange(15900, 19900);
      expect(band.length).assertEqual(4);
      let ids: number[] = [];
      for (let index: number = 0; index < band.length; index++) {
        ids.push(band[index].id);
      }
      expect(ids[0]).assertEqual(6);
      expect(ids[1]).assertEqual(7);
      expect(ids[2]).assertEqual(14);
      expect(ids[3]).assertEqual(15);
      expect(band[0].price.cents()).assertEqual(19900);
      expect(ids.length).assertEqual(4);
      expect(band[0].category).assertEqual('phone');
      // id 7 is the only clothing item inside the band, and its category is 'men_wear'.
      expect(band[1].category).assertEqual('men_wear');
      expect(band[2].price.cents()).assertEqual(19900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0060
     * @tc.name      full_span_range_keeps_every_entry_006
     * @tc.desc      Verify full span range keeps every entry.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('full_span_range_keeps_every_entry_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: full_span_range_keeps_every_entry_006');
      let catalog: Catalog = defaultCatalog();
      let everything: Goods[] = catalog.inPriceRange(0, Number.MAX_SAFE_INTEGER);
      expect(everything.length).assertEqual(catalog.count());
      expect(everything.length).assertEqual(16);
      expect(everything[0].id).assertEqual(0);
      expect(everything[15].id).assertEqual(15);
      let ids: number[] = [];
      for (let index: number = 0; index < everything.length; index++) {
        ids.push(everything[index].id);
      }
      expect(ids.indexOf(0) >= 0).assertTrue();
      expect(ids.indexOf(15) >= 0).assertTrue();
      expect(catalog.byId(0) !== undefined).assertTrue();
      expect(catalog.byId(15) !== undefined).assertTrue();
      expect(everything[0].price.isPositive()).assertTrue();
      expect(everything[15].price.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0070
     * @tc.name      negative_upper_bound_range_returns_nothing_007
     * @tc.desc      Verify negative upper bound range returns nothing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_upper_bound_range_returns_nothing_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_upper_bound_range_returns_nothing_007');
      let catalog: Catalog = defaultCatalog();
      let belowZero: Goods[] = catalog.inPriceRange(-Number.MAX_SAFE_INTEGER, -1);
      expect(belowZero.length).assertEqual(0);
      expect(catalog.inPriceRange(1, 8899).length).assertEqual(0);
      expect(catalog.inPriceRange(0, 0).length).assertEqual(0);
      expect(catalog.count()).assertEqual(16);
      let zeroBand: Goods[] = catalog.inPriceRange(0, 8900);
      expect(zeroBand.length).assertEqual(2);
      expect(zeroBand[0].id).assertEqual(4);
      expect(zeroBand[0].category).assertEqual('food');
      expect(zeroBand[1].category).assertEqual('food');
      expect(catalog.byId(4) !== undefined).assertTrue();
      expect(belowZero.length < catalog.count()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0080
     * @tc.name      range_with_negative_prices_includes_zero_008
     * @tc.desc      Verify range with negative prices includes zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('range_with_negative_prices_includes_zero_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: range_with_negative_prices_includes_zero_008');
      let goods: Goods[] = [
        createGoods(1, 'Below Zero', -100),
        createGoods(2, 'Zero Priced', 0),
        createGoods(3, 'Above Zero', 100)
      ];
      let catalog: Catalog = new Catalog(goods);
      let band: Goods[] = catalog.inPriceRange(-100, 0);
      expect(band.length).assertEqual(2);
      expect(band[0].id).assertEqual(1);
      expect(band[1].id).assertEqual(2);
      expect(catalog.inPriceRange(0, 100).length).assertEqual(2);
      let cheapest: Goods | undefined = catalog.cheapest();
      expect(cheapest !== undefined).assertTrue();
      if (cheapest !== undefined) {
        expect(cheapest.id).assertEqual(1);
        expect(cheapest.price.isNegative()).assertTrue();
      }
      expect(catalog.count()).assertEqual(3);
      expect(catalog.inPriceRange(101, 200).length).assertEqual(0);
      expect(band[1].price.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0090
     * @tc.name      negative_price_sort_orders_below_zero_009
     * @tc.desc      Verify negative price sort orders below zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_price_sort_orders_below_zero_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_price_sort_orders_below_zero_009');
      let goods: Goods[] = [
        createGoods(1, 'Positive Low', 100),
        createGoods(2, 'Negative', -500),
        createGoods(3, 'Zero', 0),
        createGoods(4, 'Positive High', 250)
      ];
      let catalog: Catalog = new Catalog(goods);
      let ascending: Goods[] = catalog.sortedByPrice(true);
      let descending: Goods[] = catalog.sortedByPrice(false);
      expect(ascending.length).assertEqual(4);
      expect(ascending[0].id).assertEqual(2);
      expect(ascending[1].id).assertEqual(3);
      expect(ascending[2].id).assertEqual(1);
      expect(ascending[3].id).assertEqual(4);
      expect(descending[0].id).assertEqual(4);
      expect(ascending[2].price.cents()).assertEqual(100);
      expect(descending[1].price.cents()).assertEqual(100);
      expect(descending[2].price.isZero()).assertTrue();
      expect(ascending[0].price.isNegative()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0100
     * @tc.name      cheapest_tie_prefers_smaller_identifier_010
     * @tc.desc      Verify cheapest tie prefers the smaller identifier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cheapest_tie_prefers_smaller_identifier_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cheapest_tie_prefers_smaller_identifier_010');
      let goods: Goods[] = [
        createGoods(9, 'Tie Later', 700),
        createGoods(3, 'Tie Earlier', 700),
        createGoods(5, 'Highest', 900)
      ];
      let catalog: Catalog = new Catalog(goods);
      let cheapest: Goods | undefined = catalog.cheapest();
      let priciest: Goods | undefined = catalog.mostExpensive();
      expect(cheapest !== undefined).assertTrue();
      expect(priciest !== undefined).assertTrue();
      if (cheapest !== undefined && priciest !== undefined) {
        expect(cheapest.id).assertEqual(3);
        expect(priciest.id).assertEqual(5);
        expect(cheapest.price.compareTo(new Money(700))).assertEqual(0);
      }
      let ascending: Goods[] = catalog.sortedByPrice(true);
      expect(ascending[0].id).assertEqual(3);
      expect(ascending[2].id).assertEqual(5);
      expect(catalog.count()).assertEqual(3);
      expect(ascending.length).assertEqual(3);
      expect(ascending[0].price.equals(ascending[1].price)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0110
     * @tc.name      range_at_expensiveness_threshold_is_empty_011
     * @tc.desc      Verify range at the expensiveness threshold is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('range_at_expensiveness_threshold_is_empty_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: range_at_expensiveness_threshold_is_empty_011');
      let catalog: Catalog = defaultCatalog();
      // The expensive flag starts at 500000 cents, a bar the 499900 top price never clears.
      let expensive: Goods[] = catalog.inPriceRange(500000, Number.MAX_SAFE_INTEGER);
      expect(expensive.length).assertEqual(0);
      let allGoods: Goods[] = catalog.all();
      let flagged: number = 0;
      for (let index: number = 0; index < allGoods.length; index++) {
        if (allGoods[index].isExpensive()) {
          flagged++;
        }
      }
      expect(flagged).assertEqual(0);
      let priciest: Goods | undefined = catalog.mostExpensive();
      expect(priciest !== undefined).assertTrue();
      if (priciest !== undefined) {
        expect(priciest.price.cents()).assertEqual(499900);
        expect(priciest.isExpensive()).assertFalse();
      }
      expect(catalog.inPriceRange(499999, 499999).length).assertEqual(0);
      expect(catalog.count()).assertEqual(16);
      expect(catalog.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0120
     * @tc.name      valuation_uses_selected_subtotal_not_all_lines_012
     * @tc.desc      Verify valuation uses the selected subtotal not all lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('valuation_uses_selected_subtotal_not_all_lines_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: valuation_uses_selected_subtotal_not_all_lines_012');
      let lines: CartLine[] = [cartLine(1, 10000, 1, true), cartLine(2, 90000, 1, false)];
      let cart: Cart = cartWith(lines);
      // Only the selected 10000-cent line feeds subtotal(); the 90000-cent line is excluded.
      let selectedSubtotal: Money = cart.subtotal();
      let allSubtotal: Money = cart.allLinesSubtotal();
      let valuation: Valuation = new Valuation(selectedSubtotal, 20);
      expect(selectedSubtotal.cents()).assertEqual(10000);
      expect(valuation.finalPrice().cents()).assertEqual(8000);
      expect(valuation.saved().cents()).assertEqual(2000);
      expect(valuation.finalPrice().add(valuation.saved()).equals(selectedSubtotal)).assertTrue();
      expect(allSubtotal.cents()).assertEqual(100000);
      expect(new Valuation(allSubtotal, 20).saved().cents()).assertEqual(20000);
      expect(cart.selectedLines().length).assertEqual(1);
      expect(cart.allLines().length).assertEqual(2);
      expect(cart.subtotal().format()).assertEqual('¥100.00');
      expect(cart.totalQuantity()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0130
     * @tc.name      valuation_saved_matches_equivalent_coupon_013
     * @tc.desc      Verify valuation saved matches an equivalent coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('valuation_saved_matches_equivalent_coupon_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: valuation_saved_matches_equivalent_coupon_013');
      let cart: Cart = cartWith([cartLine(1, 25000, 2)]);
      let subtotal: Money = cart.subtotal();
      let valuation: Valuation = new Valuation(subtotal, 20);
      let saved: Money = valuation.saved();
      let coupon: Coupon = new Coupon('V1', 'equivalent discount', 0, saved.cents());
      expect(subtotal.cents()).assertEqual(50000);
      expect(saved.cents()).assertEqual(10000);
      expect(coupon.apply(subtotal).equals(valuation.finalPrice())).assertTrue();
      expect(coupon.apply(subtotal).cents()).assertEqual(40000);
      expect(coupon.discountCents).assertEqual(valuation.saved().cents());
      expect(valuation.finalPrice().cents()).assertEqual(40000);
      expect(coupon.isUsableFor(subtotal.cents())).assertTrue();
      expect(coupon.thresholdCents).assertEqual(0);
      expect(cart.subtotal().equals(subtotal)).assertTrue();
      expect(subtotal.format()).assertEqual('¥500.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0140
     * @tc.name      valuation_after_quantity_decrease_shrinks_saved_014
     * @tc.desc      Verify valuation after a quantity decrease shrinks the saved amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('valuation_after_quantity_decrease_shrinks_saved_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: valuation_after_quantity_decrease_shrinks_saved_014');
      // Dropping the quantity from 10 to 4 rebuilds the base at 35600 cents, so the 10 percent saving falls too.
      let cart: Cart = cartWith([cartLine(4, 8900, 10)]);
      expect(cart.subtotal().cents()).assertEqual(89000);
      let before: Valuation = new Valuation(cart.subtotal(), 10);
      cart.setQuantity(4, 4);
      let after: Valuation = new Valuation(cart.subtotal(), 10);
      expect(cart.subtotal().cents()).assertEqual(35600);
      expect(before.saved().cents()).assertEqual(8900);
      expect(after.saved().cents()).assertEqual(3560);
      expect(before.saved().compareTo(after.saved())).assertEqual(1);
      expect(after.finalPrice().add(after.saved()).equals(cart.subtotal())).assertTrue();
      expect(after.saved().isPositive()).assertTrue();
      expect(before.finalPrice().add(before.saved()).equals(new Money(89000))).assertTrue();
      expect(before.saved().subtract(after.saved()).cents()).assertEqual(5340);
      expect(cart.quantityOf(4)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0150
     * @tc.name      valuation_of_merged_subtotal_reconstructs_total_015
     * @tc.desc      Verify valuation of a merged subtotal reconstructs the total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('valuation_of_merged_subtotal_reconstructs_total_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: valuation_of_merged_subtotal_reconstructs_total_015');
      let target: Cart = cartWith([cartLine(1, 10000, 2)]);
      let source: Cart = cartWith([cartLine(1, 10000, 3), cartLine(2, 5000, 2)]);
      target.merge(source);
      let subtotal: Money = target.subtotal();
      let valuation: Valuation = new Valuation(subtotal, 30);
      expect(target.quantityOf(1)).assertEqual(5);
      expect(target.distinctCount()).assertEqual(2);
      expect(subtotal.cents()).assertEqual(60000);
      expect(valuation.finalPrice().cents()).assertEqual(42000);
      expect(valuation.saved().cents()).assertEqual(18000);
      expect(valuation.finalPrice().add(valuation.saved()).equals(subtotal)).assertTrue();
      expect(source.quantityOf(1)).assertEqual(3);
      expect(target.subtotal().equals(target.allLinesSubtotal())).assertTrue();
      expect(valuation.isDiscounted()).assertTrue();
      expect(subtotal.format()).assertEqual('¥600.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0160
     * @tc.name      zero_price_selected_line_does_not_change_valuation_016
     * @tc.desc      Verify a zero price selected line does not change valuation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_price_selected_line_does_not_change_valuation_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_price_selected_line_does_not_change_valuation_016');
      // The free 5-unit line adds nothing to the subtotal but still counts toward selectedQuantity.
      let cart: Cart = cartWith([cartLine(1, 5000, 1, true), cartLine(2, 0, 5, true)]);
      let subtotal: Money = cart.subtotal();
      let freeLine: CartLine | undefined = cart.lineAt(1);
      expect(subtotal.cents()).assertEqual(5000);
      expect(cart.totalQuantity()).assertEqual(6);
      expect(freeLine !== undefined).assertTrue();
      if (freeLine !== undefined) {
        expect(freeLine.lineTotal().isZero()).assertTrue();
        expect(freeLine.selected).assertTrue();
        expect(freeLine.lineTotal().format()).assertEqual('¥0.00');
      }
      let valuation: Valuation = new Valuation(subtotal, 40);
      expect(valuation.isDiscounted()).assertTrue();
      expect(valuation.discountPercent).assertEqual(40);
      expect(cart.selectedQuantity()).assertEqual(6);
      expect(subtotal.format()).assertEqual('¥50.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0170
     * @tc.name      money_sum_of_line_totals_equals_all_subtotal_017
     * @tc.desc      Verify money sum of line totals equals the all lines subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_sum_of_line_totals_equals_all_subtotal_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_sum_of_line_totals_equals_all_subtotal_017');
      let lines: CartLine[] = [cartLine(1, 1200, 2), cartLine(2, 3400, 3, false), cartLine(3, 5600, 1)];
      let cart: Cart = cartWith(lines);
      let parts: Money[] = [];
      let allLines: CartLine[] = cart.allLines();
      for (let index: number = 0; index < allLines.length; index++) {
        parts.push(allLines[index].lineTotal());
      }
      let summed: Money = Money.sum(parts);
      expect(summed.equals(cart.allLinesSubtotal())).assertTrue();
      expect(cart.allLinesSubtotal().cents()).assertEqual(18200);
      expect(cart.subtotal().cents()).assertEqual(8000);
      expect(summed.subtract(cart.subtotal()).cents()).assertEqual(10200);
      expect(parts.length).assertEqual(3);
      expect(parts[0].cents()).assertEqual(2400);
      expect(parts[2].cents()).assertEqual(5600);
      expect(cart.distinctCount()).assertEqual(3);
      expect(cart.selectedLines().length).assertEqual(2);
      expect(summed.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0180
     * @tc.name      full_cap_cart_totals_1584_units_018
     * @tc.desc      Verify a full cap cart totals 1584 units.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('full_cap_cart_totals_1584_units_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: full_cap_cart_totals_1584_units_018');
      let products: Goods[] = defaultCatalog().all();
      // Sixteen lines at the 99-unit cap give 1584 units and 99 times the 2328400-cent catalog sum.
      let lines: CartLine[] = [];
      for (let index: number = 0; index < products.length; index++) {
        lines.push(cartLine(products[index].id, products[index].price.cents(), 99, true));
      }
      let cart: Cart = cartWith(lines);
      expect(cart.distinctCount()).assertEqual(16);
      expect(cart.totalQuantity()).assertEqual(1584);
      expect(cart.selectedQuantity()).assertEqual(1584);
      expect(cart.allLinesSubtotal().cents()).assertEqual(230511600);
      expect(cart.subtotal().equals(cart.allLinesSubtotal())).assertTrue();
      expect(cart.subtotal().format()).assertEqual('¥2305116.00');
      expect(products.length).assertEqual(16);
      expect(cart.subtotal().isPositive()).assertTrue();
      expect(cart.isEmpty()).assertFalse();
      expect(cart.lineAt(15) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0190
     * @tc.name      one_cent_unit_at_cap_stays_99_cents_019
     * @tc.desc      Verify a one cent unit at cap stays 99 cents.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('one_cent_unit_at_cap_stays_99_cents_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: one_cent_unit_at_cap_stays_99_cents_019');
      let cart: Cart = new Cart();
      cart.add(20, 1, 99);
      expect(cart.quantityOf(20)).assertEqual(99);
      expect(cart.allLinesSubtotal().cents()).assertEqual(99);
      expect(cart.subtotal().format()).assertEqual('¥0.99');
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(99);
      expect(cart.subtotal().isZero()).assertFalse();
      expect(cart.indexOf(20)).assertEqual(0);
      expect(cart.allLinesSubtotal().equals(cart.subtotal())).assertTrue();
      expect(cart.lineAt(0) !== undefined).assertTrue();
      expect(cart.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0200
     * @tc.name      zero_price_at_cap_keeps_quantity_zero_amount_020
     * @tc.desc      Verify a zero price at cap keeps quantity but zero amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('zero_price_at_cap_keeps_quantity_zero_amount_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: zero_price_at_cap_keeps_quantity_zero_amount_020');
      let cart: Cart = new Cart();
      cart.add(21, 0, 99);
      expect(cart.quantityOf(21)).assertEqual(99);
      expect(cart.selectedQuantity()).assertEqual(99);
      expect(cart.subtotal().isZero()).assertTrue();
      expect(cart.allLinesSubtotal().isZero()).assertTrue();
      expect(cart.subtotal().format()).assertEqual('¥0.00');
      expect(cart.contains(21)).assertTrue();
      expect(cart.indexOf(21)).assertEqual(0);
      expect(cart.subtotal().equals(cart.allLinesSubtotal())).assertTrue();
      expect(cart.lineAt(0) !== undefined).assertTrue();
      expect(cart.subtotal().isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0210
     * @tc.name      max_safe_unit_price_flows_to_subtotal_021
     * @tc.desc      Verify the max safe unit price flows to the subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_unit_price_flows_to_subtotal_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_unit_price_flows_to_subtotal_021');
      let cart: Cart = new Cart();
      cart.add(22, Number.MAX_SAFE_INTEGER, 1);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(Number.MAX_SAFE_INTEGER);
        expect(line.lineTotal().cents()).assertEqual(Number.MAX_SAFE_INTEGER);
      }
      expect(cart.subtotal().cents()).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(cart.allLinesSubtotal().cents()).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(cart.subtotal().isPositive()).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.indexOf(22)).assertEqual(0);
      expect(cart.subtotal().isNegative()).assertFalse();
      expect(cart.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0220
     * @tc.name      max_safe_price_at_quantity_two_stays_exact_022
     * @tc.desc      Verify the max safe price at quantity two stays exact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('max_safe_price_at_quantity_two_stays_exact_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: max_safe_price_at_quantity_two_stays_exact_022');
      let cart: Cart = new Cart();
      cart.add(23, Number.MAX_SAFE_INTEGER, 2);
      // Doubling overruns the exact integer range, so both sides rely on the same rounded expression.
      let doubled: number = Number.MAX_SAFE_INTEGER * 2;
      let text: string = cart.subtotal().format();
      expect(cart.quantityOf(23)).assertEqual(2);
      expect(cart.allLinesSubtotal().cents()).assertEqual(doubled);
      expect(cart.subtotal().cents()).assertEqual(doubled);
      expect(cart.subtotal().compareTo(new Money(Number.MAX_SAFE_INTEGER))).assertEqual(1);
      expect(cart.subtotal().isPositive()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(2);
      expect(cart.lineAt(0) !== undefined).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.subtotal().isNegative()).assertFalse();
      expect(text.indexOf('¥')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0230
     * @tc.name      negative_unit_price_line_lowers_subtotal_023
     * @tc.desc      Verify a negative unit price line lowers the subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_unit_price_line_lowers_subtotal_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_unit_price_line_lowers_subtotal_023');
      let cart: Cart = cartWith([cartLine(1, 5000, 1), cartLine(2, -1000, 2)]);
      let line: CartLine | undefined = cart.lineAt(1);
      expect(line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.lineTotal().cents()).assertEqual(-2000);
        expect(line.lineTotal().isNegative()).assertTrue();
        expect(line.lineTotal().format()).assertEqual('-¥20.00');
      }
      expect(cart.subtotal().cents()).assertEqual(3000);
      expect(cart.allLinesSubtotal().cents()).assertEqual(3000);
      expect(cart.lineAt(0) !== undefined).assertTrue();
      expect(cart.totalQuantity()).assertEqual(3);
      expect(cart.subtotal().isPositive()).assertTrue();
      expect(cart.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0240
     * @tc.name      negative_only_cart_subtotal_is_negative_and_clamps_024
     * @tc.desc      Verify a negative only cart subtotal is negative and clamps at zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_only_cart_subtotal_is_negative_and_clamps_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_only_cart_subtotal_is_negative_and_clamps_024');
      let cart: Cart = cartWith([cartLine(2, -1000, 2)]);
      let subtotal: Money = cart.subtotal();
      expect(subtotal.cents()).assertEqual(-2000);
      expect(subtotal.isNegative()).assertTrue();
      expect(subtotal.format()).assertEqual('-¥20.00');
      // Clamping is a payment view: the stored subtotal itself stays at -2000 cents.
      expect(subtotal.clampAtZero().isZero()).assertTrue();
      expect(subtotal.clampAtZero().format()).assertEqual('¥0.00');
      expect(cart.allLinesSubtotal().equals(subtotal)).assertTrue();
      expect(cart.isEmpty()).assertFalse();
      expect(subtotal.compareTo(Money.zero())).assertEqual(-1);
      expect(subtotal.subtract(new Money(-1000)).cents()).assertEqual(-1000);
      expect(subtotal.clampAtZero().isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0250
     * @tc.name      negative_price_line_survives_snapshot_restore_025
     * @tc.desc      Verify a negative price line survives snapshot restore.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('negative_price_line_survives_snapshot_restore_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: negative_price_line_survives_snapshot_restore_025');
      let cart: Cart = cartWith([cartLine(2, -1000, 2), cartLine(3, 500, 5)]);
      let snapshot: CartSnapshot = cart.snapshot();
      cart.setQuantity(3, 1);
      expect(cart.subtotal().cents()).assertEqual(-1500);
      expect(cart.subtotal().isNegative()).assertTrue();
      let restored: Cart = Cart.restore(snapshot);
      expect(restored.subtotal().cents()).assertEqual(500);
      let restoredLine: CartLine | undefined = restored.lineAt(0);
      expect(restoredLine !== undefined).assertTrue();
      if (restoredLine !== undefined) {
        expect(restoredLine.unitPriceCents).assertEqual(-1000);
        expect(restoredLine.lineTotal().cents()).assertEqual(-2000);
      }
      expect(restored.totalQuantity()).assertEqual(7);
      expect(restored.distinctCount()).assertEqual(2);
      expect(restored.subtotal().isPositive()).assertTrue();
      expect(restored.allLinesSubtotal().equals(restored.subtotal())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0260
     * @tc.name      from_lines_duplicate_goods_keeps_separate_lines_026
     * @tc.desc      Verify duplicated goods stay as separate lines when built from lines.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('from_lines_duplicate_goods_keeps_separate_lines_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: from_lines_duplicate_goods_keeps_separate_lines_026');
      let lines: CartLine[] = [cartLine(5, 1000, 2), cartLine(5, 1000, 3)];
      let cart: Cart = cartWith(lines);
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.totalQuantity()).assertEqual(5);
      expect(cart.quantityOf(5)).assertEqual(2);
      expect(cart.subtotal().cents()).assertEqual(5000);
      expect(cart.indexOf(5)).assertEqual(0);
      expect(cart.contains(5)).assertTrue();
      let removed: boolean = cart.remove(5);
      expect(cart.totalQuantity()).assertEqual(3);
      expect(cart.allLinesSubtotal().equals(cart.subtotal())).assertTrue();
      expect(cart.lineAt(0) !== undefined).assertTrue();
      expect(cart.lineAt(1) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0270
     * @tc.name      snapshot_after_merge_restores_combined_quantity_027
     * @tc.desc      Verify a snapshot after merge restores the combined quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_after_merge_restores_combined_quantity_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_after_merge_restores_combined_quantity_027');
      let target: Cart = cartWith([cartLine(1, 1000, 3)]);
      let source: Cart = cartWith([cartLine(1, 1000, 4)]);
      target.merge(source);
      expect(target.quantityOf(1)).assertEqual(7);
      let snapshot: CartSnapshot = target.snapshot();
      target.setQuantity(1, 1);
      expect(target.subtotal().cents()).assertEqual(1000);
      let restored: Cart = Cart.restore(snapshot);
      expect(restored.quantityOf(1)).assertEqual(7);
      expect(restored.subtotal().cents()).assertEqual(7000);
      expect(restored.selectedQuantity()).assertEqual(7);
      expect(restored.distinctCount()).assertEqual(1);
      expect(restored.allLinesSubtotal().equals(restored.subtotal())).assertTrue();
      expect(restored.isEmpty()).assertFalse();
      expect(restored.lineAt(0) !== undefined).assertTrue();
      expect(target.quantityOf(1)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0280
     * @tc.name      merge_to_cap_then_snapshot_restore_keeps_cap_028
     * @tc.desc      Verify merge to cap then snapshot restore keeps the cap.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_to_cap_then_snapshot_restore_keeps_cap_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_to_cap_then_snapshot_restore_keeps_cap_028');
      // The merged line keeps the target's 1000-cent unit price and takes only the quantity from the source.
      let target: Cart = cartWith([cartLine(1, 1000, 99)]);
      let source: Cart = cartWith([cartLine(1, 2000, 50)]);
      target.merge(source);
      expect(target.quantityOf(1)).assertEqual(99);
      let line: CartLine | undefined = target.lineAt(0);
      expect(line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(1000);
      }
      let snapshot: CartSnapshot = target.snapshot();
      target.clear();
      let restored: Cart = Cart.restore(snapshot);
      expect(restored.quantityOf(1)).assertEqual(99);
      expect(restored.subtotal().cents()).assertEqual(99000);
      expect(restored.distinctCount()).assertEqual(1);
      expect(restored.totalQuantity()).assertEqual(99);
      expect(restored.subtotal().isPositive()).assertTrue();
      expect(restored.lineAt(0) !== undefined).assertTrue();
      expect(restored.allLinesSubtotal().equals(restored.subtotal())).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0290
     * @tc.name      merge_two_half_cap_carts_caps_total_at_99_029
     * @tc.desc      Verify merging two half cap carts caps the total at 99.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_two_half_cap_carts_caps_total_at_99_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_two_half_cap_carts_caps_total_at_99_029');
      let target: Cart = cartWith([cartLine(1, 500, 60)]);
      let source: Cart = cartWith([cartLine(1, 500, 60)]);
      target.merge(source);
      expect(target.quantityOf(1)).assertEqual(99);
      expect(target.distinctCount()).assertEqual(1);
      expect(target.totalQuantity()).assertEqual(99);
      expect(target.allLinesSubtotal().cents()).assertEqual(49500);
      expect(target.subtotal().format()).assertEqual('¥495.00');
      expect(source.quantityOf(1)).assertEqual(60);
      expect(target.subtotal().isPositive()).assertTrue();
      expect(target.lineAt(0) !== undefined).assertTrue();
      expect(target.indexOf(1)).assertEqual(0);
      expect(target.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0300
     * @tc.name      merge_then_remove_shared_line_leaves_source_intact_030
     * @tc.desc      Verify merge then remove of the shared line leaves the source intact.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_then_remove_shared_line_leaves_source_intact_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_then_remove_shared_line_leaves_source_intact_030');
      let target: Cart = cartWith([cartLine(1, 1000, 4)]);
      let source: Cart = cartWith([cartLine(1, 1000, 5), cartLine(2, 2000, 1)]);
      target.merge(source);
      expect(target.quantityOf(1)).assertEqual(9);
      expect(target.distinctCount()).assertEqual(2);
      let removed: boolean = target.remove(1);
      expect(removed).assertTrue();
      expect(target.contains(1)).assertFalse();
      expect(target.distinctCount()).assertEqual(1);
      expect(source.quantityOf(1)).assertEqual(5);
      expect(source.distinctCount()).assertEqual(2);
      expect(source.contains(2)).assertTrue();
      expect(target.lineAt(0) !== undefined).assertTrue();
      expect(target.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0310
     * @tc.name      snapshot_is_unaffected_by_later_merge_031
     * @tc.desc      Verify a snapshot is unaffected by a later merge.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_is_unaffected_by_later_merge_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_is_unaffected_by_later_merge_031');
      let cart: Cart = cartWith([cartLine(1, 1000, 2)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let other: Cart = cartWith([cartLine(1, 1000, 5)]);
      cart.merge(other);
      expect(cart.quantityOf(1)).assertEqual(7);
      expect(cart.subtotal().cents()).assertEqual(7000);
      let restored: Cart = Cart.restore(snapshot);
      expect(restored.quantityOf(1)).assertEqual(2);
      expect(restored.subtotal().cents()).assertEqual(2000);
      expect(restored.distinctCount()).assertEqual(1);
      expect(other.quantityOf(1)).assertEqual(5);
      expect(cart.allLinesSubtotal().equals(cart.subtotal())).assertTrue();
      expect(restored.allLinesSubtotal().equals(restored.subtotal())).assertTrue();
      expect(restored.isEmpty()).assertFalse();
      expect(restored.lineAt(0) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0320
     * @tc.name      merge_disjoint_lines_makes_all_lines_subtotal_sum_032
     * @tc.desc      Verify merging disjoint lines makes the all lines subtotal the sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_disjoint_lines_makes_all_lines_subtotal_sum_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_disjoint_lines_makes_all_lines_subtotal_sum_032');
      let target: Cart = cartWith([cartLine(1, 1000, 2)]);
      let source: Cart = cartWith([cartLine(2, 2000, 3)]);
      let targetTotal: Money = target.allLinesSubtotal();
      let sourceTotal: Money = source.allLinesSubtotal();
      target.merge(source);
      expect(target.allLinesSubtotal().equals(targetTotal.add(sourceTotal))).assertTrue();
      expect(target.allLinesSubtotal().cents()).assertEqual(8000);
      expect(target.totalQuantity()).assertEqual(5);
      expect(target.distinctCount()).assertEqual(2);
      expect(target.indexOf(2)).assertEqual(1);
      expect(target.subtotal().equals(target.allLinesSubtotal())).assertTrue();
      expect(target.contains(1)).assertTrue();
      expect(target.quantityOf(2)).assertEqual(3);
      expect(target.indexOf(1)).assertEqual(0);
      expect(target.selectedQuantity()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0330
     * @tc.name      cart_built_from_catalog_rows_matches_catalog_price_sum_033
     * @tc.desc      Verify a cart built from catalog rows matches the catalog price sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_built_from_catalog_rows_matches_catalog_price_sum_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_built_from_catalog_rows_matches_catalog_price_sum_033');
      let catalog: Catalog = defaultCatalog();
      let allGoods: Goods[] = catalog.all();
      let cart: Cart = new Cart();
      for (let index: number = 0; index < allGoods.length; index++) {
        cart.add(allGoods[index].id, allGoods[index].price.cents(), 1);
      }
      expect(cart.distinctCount()).assertEqual(16);
      expect(cart.totalQuantity()).assertEqual(16);
      expect(cart.allLinesSubtotal().cents()).assertEqual(2328400);
      expect(cart.subtotal().equals(cart.allLinesSubtotal())).assertTrue();
      expect(cart.allLinesSubtotal().format()).assertEqual('¥23284.00');
      expect(cart.contains(0)).assertTrue();
      expect(cart.indexOf(15)).assertEqual(15);
      expect(cart.selectedQuantity()).assertEqual(16);
      expect(cart.isEmpty()).assertFalse();
      expect(cart.lineAt(0) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0340
     * @tc.name      catalog_sorted_first_price_feeds_cart_add_034
     * @tc.desc      Verify the first sorted catalog price feeds a cart add.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_sorted_first_price_feeds_cart_add_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_sorted_first_price_feeds_cart_add_034');
      let catalog: Catalog = defaultCatalog();
      let sorted: Goods[] = catalog.sortedByPrice(true);
      expect(sorted.length).assertEqual(16);
      let first: Goods = sorted[0];
      expect(first.id).assertEqual(4);
      expect(first.price.cents()).assertEqual(8900);
      let cart: Cart = new Cart();
      let returned: number = cart.add(first.id, first.price.cents(), 2);
      expect(returned).assertEqual(2);
      expect(cart.subtotal().cents()).assertEqual(17800);
      expect(cart.subtotal().format()).assertEqual('¥178.00');
      expect(first.price.isPositive()).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.selectedQuantity()).assertEqual(2);
      expect(sorted[0].id).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0350
     * @tc.name      catalog_by_id_price_used_as_unit_price_035
     * @tc.desc      Verify a catalog by id price can be used as a unit price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('catalog_by_id_price_used_as_unit_price_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: catalog_by_id_price_used_as_unit_price_035');
      let catalog: Catalog = defaultCatalog();
      let goods: Goods | undefined = catalog.byId(2);
      expect(goods !== undefined).assertTrue();
      if (goods !== undefined) {
        expect(goods.price.cents()).assertEqual(129900);
        let cart: Cart = new Cart();
        cart.add(goods.id, goods.price.cents(), 3);
        expect(cart.subtotal().cents()).assertEqual(389700);
        expect(cart.subtotal().format()).assertEqual('¥3897.00');
        let line: CartLine | undefined = cart.lineAt(0);
        expect(line !== undefined).assertTrue();
        if (line !== undefined) {
          expect(line.goodsId).assertEqual(2);
        }
        expect(cart.totalQuantity()).assertEqual(3);
        expect(cart.allLinesSubtotal().equals(cart.subtotal())).assertTrue();
        expect(cart.lineAt(0) !== undefined).assertTrue();
        expect(cart.isEmpty()).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0360
     * @tc.name      cart_add_freezes_catalog_price_against_goods_mutation_036
     * @tc.desc      Verify a cart add freezes the catalog price against goods mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_add_freezes_catalog_price_against_goods_mutation_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_add_freezes_catalog_price_against_goods_mutation_036');
      let goods: Goods = createGoods(20, 'Mutable Price', 10000);
      let cart: Cart = new Cart();
      cart.add(goods.id, goods.price.cents(), 1);
      let frozen: Money = goods.price;
      goods.price = new Money(99999);
      let line: CartLine | undefined = cart.lineAt(0);
      expect(line !== undefined).assertTrue();
      if (line !== undefined) {
        expect(line.unitPriceCents).assertEqual(10000);
        expect(line.lineTotal().cents()).assertEqual(10000);
      }
      expect(cart.subtotal().cents()).assertEqual(10000);
      expect(frozen.cents()).assertEqual(10000);
      expect(goods.price.cents()).assertEqual(99999);
      expect(cart.lineAt(0) !== undefined).assertTrue();
      expect(cart.isEmpty()).assertFalse();
      expect(cart.subtotal().isPositive()).assertTrue();
      expect(cart.selectedQuantity()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0370
     * @tc.name      cart_of_both_expensive_rows_doubles_the_price_037
     * @tc.desc      Verify a cart of both expensive rows doubles the price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('cart_of_both_expensive_rows_doubles_the_price_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: cart_of_both_expensive_rows_doubles_the_price_037');
      let catalog: Catalog = defaultCatalog();
      let expensive: Goods[] = catalog.inPriceRange(499900, 499900);
      expect(expensive.length).assertEqual(2);
      let cart: Cart = new Cart();
      for (let index: number = 0; index < expensive.length; index++) {
        cart.add(expensive[index].id, expensive[index].price.cents(), 1);
      }
      expect(cart.distinctCount()).assertEqual(2);
      expect(cart.subtotal().cents()).assertEqual(999800);
      expect(cart.subtotal().format()).assertEqual('¥9998.00');
      expect(cart.selectedQuantity()).assertEqual(2);
      expect(cart.indexOf(0)).assertEqual(0);
      expect(cart.totalQuantity()).assertEqual(2);
      expect(cart.lineAt(0) !== undefined).assertTrue();
      expect(expensive[0].price.equals(expensive[1].price)).assertTrue();
      expect(cart.quantityOf(8)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0380
     * @tc.name      stock_one_then_cap_drives_valuation_base_038
     * @tc.desc      Verify a stock ceiling of one then the cap drives the valuation base.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('stock_one_then_cap_drives_valuation_base_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stock_one_then_cap_drives_valuation_base_038');
      let cart: Cart = new Cart();
      // The stock ceiling of 1 trims this add, while the later explicit setQuantity allows the 99 cap.
      let returned: number = cart.add(31, 8900, 150, 1);
      expect(returned).assertEqual(1);
      expect(cart.quantityOf(31)).assertEqual(1);
      let tiny: Money = cart.subtotal();
      expect(tiny.cents()).assertEqual(8900);
      let firstValuation: Valuation = new Valuation(tiny, 25);
      expect(firstValuation.finalPrice().cents()).assertEqual(6675);
      expect(firstValuation.saved().cents()).assertEqual(2225);
      expect(cart.setQuantity(31, 150, 99)).assertEqual(99);
      let full: Money = cart.subtotal();
      expect(full.cents()).assertEqual(881100);
      let secondValuation: Valuation = new Valuation(full, 25);
      expect(secondValuation.finalPrice().cents()).assertEqual(660825);
      expect(secondValuation.saved().cents()).assertEqual(220275);
      expect(secondValuation.finalPrice().add(secondValuation.saved()).equals(full)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0390
     * @tc.name      money_of_yuan_price_feeds_cart_quantity_039
     * @tc.desc      Verify a money of yuan price feeds a cart quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_of_yuan_price_feeds_cart_quantity_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_of_yuan_price_feeds_cart_quantity_039');
      // ofYuan scales by 100 and rounds, so 0.625 yuan lands on 63 cents.
      let yuanPrice: Money = Money.ofYuan(12.34);
      let halfYuan: Money = Money.ofYuan(0.625);
      let cart: Cart = new Cart();
      cart.add(30, yuanPrice.cents(), 3);
      expect(yuanPrice.cents()).assertEqual(1234);
      expect(halfYuan.cents()).assertEqual(63);
      expect(cart.subtotal().cents()).assertEqual(3702);
      expect(cart.subtotal().format()).assertEqual('¥37.02');
      expect(cart.subtotal().equals(yuanPrice.multiply(3))).assertTrue();
      expect(cart.totalQuantity()).assertEqual(3);
      expect(cart.subtotal().isNegative()).assertFalse();
      expect(cart.lineAt(0) !== undefined).assertTrue();
      expect(halfYuan.isPositive()).assertTrue();
      expect(cart.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0400
     * @tc.name      merge_then_increase_on_capped_line_stays_capped_040
     * @tc.desc      Verify merge then increase on a capped line stays capped.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('merge_then_increase_on_capped_line_stays_capped_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: merge_then_increase_on_capped_line_stays_capped_040');
      let target: Cart = cartWith([cartLine(1, 1500, 90)]);
      let source: Cart = cartWith([cartLine(1, 1500, 20)]);
      target.merge(source);
      expect(target.quantityOf(1)).assertEqual(99);
      expect(target.increase(1, 10)).assertEqual(99);
      expect(target.subtotal().cents()).assertEqual(148500);
      expect(target.totalQuantity()).assertEqual(99);
      expect(target.allLinesSubtotal().equals(target.subtotal())).assertTrue();
      expect(target.distinctCount()).assertEqual(1);
      expect(target.subtotal().isPositive()).assertTrue();
      expect(target.isEmpty()).assertFalse();
      expect(target.quantityOf(1)).assertEqual(99);
      expect(source.totalQuantity()).assertEqual(20);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0410
     * @tc.name      toggle_off_then_money_sum_selected_matches_subtotal_041
     * @tc.desc      Verify money sum of selected lines matches the subtotal after a toggle.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('toggle_off_then_money_sum_selected_matches_subtotal_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: toggle_off_then_money_sum_selected_matches_subtotal_041');
      let cart: Cart = cartWith([cartLine(1, 1000, 1), cartLine(2, 2000, 1), cartLine(3, 3000, 1)]);
      // Hiding goods 2 leaves 1000 + 3000 cents, and the second toggle brings all three lines back.
      expect(cart.toggleSelected(2)).assertTrue();
      let selected: CartLine[] = cart.selectedLines();
      let parts: Money[] = [];
      for (let index: number = 0; index < selected.length; index++) {
        parts.push(selected[index].lineTotal());
      }
      expect(selected.length).assertEqual(2);
      expect(Money.sum(parts).equals(cart.subtotal())).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(4000);
      expect(cart.toggleSelected(2)).assertTrue();
      let restored: CartLine[] = cart.selectedLines();
      let restoredParts: Money[] = [];
      for (let index: number = 0; index < restored.length; index++) {
        restoredParts.push(restored[index].lineTotal());
      }
      expect(Money.sum(restoredParts).equals(cart.subtotal())).assertTrue();
      expect(cart.subtotal().cents()).assertEqual(6000);
      expect(cart.isAllSelected()).assertTrue();
      expect(cart.totalQuantity()).assertEqual(3);
      expect(cart.isEmpty()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0420
     * @tc.name      remove_one_of_two_cap_lines_halves_total_042
     * @tc.desc      Verify removing one of two cap lines halves the total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('remove_one_of_two_cap_lines_halves_total_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: remove_one_of_two_cap_lines_halves_total_042');
      let cart: Cart = cartWith([cartLine(1, 1000, 99), cartLine(2, 2000, 99)]);
      expect(cart.allLinesSubtotal().cents()).assertEqual(297000);
      expect(cart.remove(1)).assertTrue();
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(99);
      expect(cart.allLinesSubtotal().cents()).assertEqual(198000);
      expect(cart.subtotal().equals(cart.allLinesSubtotal())).assertTrue();
      expect(cart.selectedQuantity()).assertEqual(99);
      expect(cart.quantityOf(2)).assertEqual(99);
      expect(cart.contains(2)).assertTrue();
      expect(cart.contains(1)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0430
     * @tc.name      clear_then_add_restarts_subtotal_from_zero_043
     * @tc.desc      Verify clear then add restarts the subtotal from zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('clear_then_add_restarts_subtotal_from_zero_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: clear_then_add_restarts_subtotal_from_zero_043');
      let cart: Cart = cartWith([cartLine(1, 1000, 2)]);
      expect(cart.subtotal().cents()).assertEqual(2000);
      cart.clear();
      expect(cart.subtotal().isZero()).assertTrue();
      expect(cart.distinctCount()).assertEqual(0);
      let returned: number = cart.add(27, 2500, 2);
      expect(returned).assertEqual(2);
      expect(cart.subtotal().cents()).assertEqual(5000);
      expect(cart.distinctCount()).assertEqual(1);
      expect(cart.totalQuantity()).assertEqual(2);
      expect(cart.allLinesSubtotal().equals(cart.subtotal())).assertTrue();
      expect(cart.lineAt(0) !== undefined).assertTrue();
      expect(cart.lineAt(1) === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0440
     * @tc.name      snapshot_restore_then_merge_uses_restored_quantity_044
     * @tc.desc      Verify a restored cart merges from its restored quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_restore_then_merge_uses_restored_quantity_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_restore_then_merge_uses_restored_quantity_044');
      let cart: Cart = cartWith([cartLine(1, 1000, 3)]);
      let snapshot: CartSnapshot = cart.snapshot();
      let firstSource: Cart = cartWith([cartLine(1, 1000, 10)]);
      cart.merge(firstSource);
      expect(cart.quantityOf(1)).assertEqual(13);
      let restored: Cart = Cart.restore(snapshot);
      let secondSource: Cart = cartWith([cartLine(1, 1000, 4)]);
      restored.merge(secondSource);
      expect(restored.quantityOf(1)).assertEqual(7);
      expect(restored.subtotal().cents()).assertEqual(7000);
      expect(cart.quantityOf(1)).assertEqual(13);
      expect(restored.distinctCount()).assertEqual(1);
      expect(restored.totalQuantity()).assertEqual(7);
      expect(restored.isEmpty()).assertFalse();
      expect(cart.totalQuantity()).assertEqual(13);
      expect(restored.allLinesSubtotal().equals(restored.subtotal())).assertTrue();
      expect(restored.lineAt(0) !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0450
     * @tc.name      snapshot_constructor_shares_line_references_045
     * @tc.desc      Verify a snapshot built from lines reads later line mutations.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('snapshot_constructor_shares_line_references_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: snapshot_constructor_shares_line_references_045');
      let line: CartLine = cartLine(1, 1000, 2);
      let lines: CartLine[] = [line];
      let snapshot: CartSnapshot = new CartSnapshot(lines);
      // The snapshot keeps the caller's line objects, while restore copies them at the moment it runs.
      line.quantity = 7;
      let restored: Cart = Cart.restore(snapshot);
      expect(restored.quantityOf(1)).assertEqual(7);
      expect(restored.subtotal().cents()).assertEqual(7000);
      expect(snapshot.lines.length).assertEqual(1);
      expect(snapshot.lines[0].quantity).assertEqual(7);
      line.unitPriceCents = 2500;
      let restoredLine: CartLine | undefined = restored.lineAt(0);
      expect(restoredLine !== undefined).assertTrue();
      if (restoredLine !== undefined) {
        expect(restoredLine.unitPriceCents).assertEqual(1000);
      }
      expect(restored.totalQuantity()).assertEqual(7);
      expect(restored.selectedQuantity()).assertEqual(7);
      expect(snapshot.lines[0].unitPriceCents).assertEqual(2500);
      expect(restored.distinctCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0460
     * @tc.name      restore_of_manually_built_snapshot_preserves_selection_046
     * @tc.desc      Verify restoring a manually built snapshot preserves selection.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('restore_of_manually_built_snapshot_preserves_selection_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: restore_of_manually_built_snapshot_preserves_selection_046');
      let lines: CartLine[] = [cartLine(1, 100, 2, true), cartLine(2, 200, 1, false)];
      let snapshot: CartSnapshot = new CartSnapshot(lines);
      let restored: Cart = Cart.restore(snapshot);
      expect(restored.distinctCount()).assertEqual(2);
      expect(restored.totalQuantity()).assertEqual(3);
      expect(restored.selectedQuantity()).assertEqual(2);
      expect(restored.subtotal().cents()).assertEqual(200);
      expect(restored.allLinesSubtotal().cents()).assertEqual(400);
      let second: CartLine | undefined = restored.lineAt(1);
      expect(second !== undefined).assertTrue();
      if (second !== undefined) {
      }
      expect(restored.isEmpty()).assertFalse();
      expect(restored.isAllSelected()).assertFalse();
      expect(restored.lineAt(0) !== undefined).assertTrue();
      expect(restored.subtotal().isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0470
     * @tc.name      price_range_at_highest_price_keeps_two_rows_047
     * @tc.desc      Verify the price range at the highest price keeps two rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('price_range_at_highest_price_keeps_two_rows_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: price_range_at_highest_price_keeps_two_rows_047');
      let catalog: Catalog = defaultCatalog();
      let top: Goods[] = catalog.inPriceRange(499900, 499900);
      expect(top.length).assertEqual(2);
      expect(top[0].id).assertEqual(0);
      expect(top[1].id).assertEqual(8);
      expect(top[0].price.cents()).assertEqual(499900);
      expect(top[1].price.cents()).assertEqual(499900);
      let priciest: Goods | undefined = catalog.mostExpensive();
      expect(priciest !== undefined).assertTrue();
      if (priciest !== undefined) {
      }
      expect(top[0].category).assertEqual('phone');
      expect(top[1].category).assertEqual('phone');
      expect(catalog.count()).assertEqual(16);
      expect(top[0].isExpensive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0480
     * @tc.name      money_sum_of_phone_category_equals_group_total_048
     * @tc.desc      Verify the money sum of the phone category equals its group total.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_sum_of_phone_category_equals_group_total_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_sum_of_phone_category_equals_group_total_048');
      let catalog: Catalog = defaultCatalog();
      let phones: Goods[] = catalog.byCategory('phone');
      expect(phones.length).assertEqual(6);
      let prices: Money[] = [];
      for (let index: number = 0; index < phones.length; index++) {
        prices.push(phones[index].price);
      }
      let total: Money = Money.sum(prices);
      expect(total.cents()).assertEqual(1839400);
      expect(total.format()).assertEqual('¥18394.00');
      expect(catalog.count() - phones.length).assertEqual(10);
      expect(total.percentage(50).cents()).assertEqual(919700);
      expect(prices.length).assertEqual(6);
      expect(phones[0].category).assertEqual('phone');
      expect(catalog.byCategory('food').length).assertEqual(2);
      expect(catalog.count()).assertEqual(16);
      expect(total.subtract(new Money(919700)).cents()).assertEqual(919700);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0490
     * @tc.name      percentage_discount_on_cap_line_splits_exactly_049
     * @tc.desc      Verify a percentage discount on a cap line splits exactly.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('percentage_discount_on_cap_line_splits_exactly_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: percentage_discount_on_cap_line_splits_exactly_049');
      let cart: Cart = cartWith([cartLine(1, 8900, 99)]);
      let subtotal: Money = cart.subtotal();
      let discount: Money = subtotal.percentage(15);
      let payable: Money = subtotal.subtract(discount).clampAtZero();
      expect(subtotal.cents()).assertEqual(881100);
      expect(discount.cents()).assertEqual(132165);
      expect(payable.cents()).assertEqual(748935);
      expect(payable.add(discount).equals(subtotal)).assertTrue();
      expect(payable.format()).assertEqual('¥7489.35');
      expect(discount.format()).assertEqual('¥1321.65');
      expect(cart.totalQuantity()).assertEqual(99);
      expect(cart.distinctCount()).assertEqual(1);
      expect(payable.compareTo(subtotal)).assertEqual(-1);
      expect(cart.allLinesSubtotal().equals(subtotal)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0500
     * @tc.name      valuation_on_cap_quantity_line_splits_exactly_050
     * @tc.desc      Verify valuation on a cap quantity line splits exactly.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('valuation_on_cap_quantity_line_splits_exactly_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: valuation_on_cap_quantity_line_splits_exactly_050');
      let cart: Cart = cartWith([cartLine(1, 8900, 99)]);
      let subtotal: Money = cart.subtotal();
      let valuation: Valuation = new Valuation(subtotal, 12);
      expect(subtotal.cents()).assertEqual(881100);
      expect(valuation.finalPrice().cents()).assertEqual(775368);
      expect(valuation.saved().cents()).assertEqual(105732);
      expect(valuation.finalPrice().add(valuation.saved()).equals(subtotal)).assertTrue();
      expect(valuation.isDiscounted()).assertTrue();
      expect(valuation.finalPrice().format()).assertEqual('¥7753.68');
      expect(cart.distinctCount()).assertEqual(1);
      expect(subtotal.format()).assertEqual('¥8811.00');
      expect(valuation.discountPercent).assertEqual(12);
      expect(valuation.original.equals(subtotal)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0510
     * @tc.name      money_subtract_of_catalog_extremes_is_positive_051
     * @tc.desc      Verify subtracting the cheapest catalog price from the priciest stays positive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('money_subtract_of_catalog_extremes_is_positive_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: money_subtract_of_catalog_extremes_is_positive_051');
      let catalog: Catalog = defaultCatalog();
      let priciest: Goods | undefined = catalog.mostExpensive();
      let cheapest: Goods | undefined = catalog.cheapest();
      expect(priciest !== undefined).assertTrue();
      expect(cheapest !== undefined).assertTrue();
      if (priciest !== undefined && cheapest !== undefined) {
        let gap: Money = priciest.price.subtract(cheapest.price);
        let reversed: Money = cheapest.price.subtract(priciest.price);
        expect(gap.cents()).assertEqual(491000);
        expect(gap.isPositive()).assertTrue();
        expect(gap.format()).assertEqual('¥4910.00');
        expect(reversed.isNegative()).assertTrue();
        expect(gap.isNegative()).assertFalse();
        expect(reversed.isPositive()).assertFalse();
        expect(gap.subtract(reversed).cents()).assertEqual(982000);
        expect(cheapest.price.add(gap).equals(priciest.price)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0520
     * @tc.name      price_range_one_level_keeps_only_that_level_052
     * @tc.desc      Verify a price range around one level keeps only that level.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('price_range_one_level_keeps_only_that_level_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: price_range_one_level_keeps_only_that_level_052');
      let catalog: Catalog = defaultCatalog();
      let level: Goods[] = catalog.inPriceRange(15899, 15901);
      expect(level.length).assertEqual(2);
      expect(level[0].id).assertEqual(7);
      expect(level[1].id).assertEqual(15);
      expect(level[0].price.cents()).assertEqual(15900);
      expect(level[1].price.cents()).assertEqual(15900);
      expect(catalog.inPriceRange(15899, 15899).length).assertEqual(0);
      expect(level[0].isInStock()).assertTrue();
      expect(catalog.count()).assertEqual(16);
      expect(level.length < catalog.count()).assertTrue();
      expect(level[1].title).assertEqual('Classic Shirt');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0530
     * @tc.name      multi_line_free_cart_has_zero_subtotal_053
     * @tc.desc      Verify a multi line free cart has a zero subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('multi_line_free_cart_has_zero_subtotal_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: multi_line_free_cart_has_zero_subtotal_053');
      let cart: Cart = cartWith([cartLine(1, 0, 2), cartLine(2, 0, 3), cartLine(3, 0, 1)]);
      expect(cart.distinctCount()).assertEqual(3);
      expect(cart.totalQuantity()).assertEqual(6);
      expect(cart.selectedQuantity()).assertEqual(6);
      expect(cart.subtotal().isZero()).assertTrue();
      expect(cart.allLinesSubtotal().isZero()).assertTrue();
      expect(cart.subtotal().format()).assertEqual('¥0.00');
      let last: CartLine | undefined = cart.lineAt(2);
      if (last !== undefined) {
      }
      expect(cart.isEmpty()).assertFalse();
      expect(cart.subtotal().equals(cart.allLinesSubtotal())).assertTrue();
      expect(cart.subtotal().isNegative()).assertFalse();
      expect(cart.isAllSelected()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_MONEY_CART_0540
     * @tc.name      valuation_of_empty_cart_is_zero_054
     * @tc.desc      Verify valuation of an empty cart is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('valuation_of_empty_cart_is_zero_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: valuation_of_empty_cart_is_zero_054');
      let cart: Cart = new Cart();
      let valuation: Valuation = new Valuation(cart.subtotal(), 55);
      expect(cart.isEmpty()).assertTrue();
      expect(cart.subtotal().isZero()).assertTrue();
      expect(valuation.finalPrice().isZero()).assertTrue();
      expect(valuation.saved().isZero()).assertTrue();
      expect(valuation.isDiscounted()).assertTrue();
      expect(valuation.discountPercent).assertEqual(55);
      expect(cart.selectedLines().length).assertEqual(0);
      expect(valuation.original.isZero()).assertTrue();
      expect(valuation.finalPrice().format()).assertEqual('¥0.00');
      expect(valuation.saved().format()).assertEqual('¥0.00');
    });
  });
}
