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

import { describe, beforeAll, it, expect, afterEach } from '@ohos/hypium';
import { yieldToEventLoop } from '../Shared/TestDriver';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Goods, Money } from '../Shared/ShopModel';
import { CATEGORY_APPLIANCE, CATEGORY_FOOD, CATEGORY_PHONE, CATEGORY_SPORT, CATEGORY_WEAR, LABEL_HOT, LABEL_NEW, createGoods } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function goodsModelTest() {
  describe('OrangeShoppingGoodsModel', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'goods suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0010
     * @tc.name      goods_constructor_assigns_every_required_field_001
     * @tc.desc      Verify goods constructor assigns every required field.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_constructor_assigns_every_required_field_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_constructor_assigns_every_required_field_001');
      let goods: Goods = new Goods(42, 'Aurora Phone', 'titanium body', 'new_product',
        new Money(259900), CATEGORY_PHONE);
      expect(goods.id).assertEqual(42);
      expect(goods.title).assertEqual('Aurora Phone');
      expect(goods.info).assertEqual('titanium body');
      expect(goods.labels).assertEqual('new_product');
      expect(goods.price.cents()).assertEqual(259900);
      expect(goods.category).assertEqual(CATEGORY_PHONE);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0020
     * @tc.name      goods_constructor_applies_optional_defaults_002
     * @tc.desc      Verify goods constructor applies optional defaults.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_constructor_applies_optional_defaults_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_constructor_applies_optional_defaults_002');
      let goods: Goods = new Goods(5, 'Default Field Phone', 'plain info', 'plain_label',
        new Money(1000), CATEGORY_PHONE);
      // Stock 99 is the shelf default, which is why a freshly built item reports itself in stock.
      expect(goods.stock).assertEqual(99);
      expect(goods.sales).assertEqual(0);
      expect(goods.rating).assertEqual(5);
      expect(goods.liveRoomId).assertEqual(-1);
      expect(goods.imageIndex).assertEqual(0);
      expect(goods.isInStock()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0030
     * @tc.name      goods_constructor_honours_explicit_optional_values_003
     * @tc.desc      Verify goods constructor honours explicit optional values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_constructor_honours_explicit_optional_values_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_constructor_honours_explicit_optional_values_003');
      let goods: Goods = new Goods(42, 'Configured Item', 'custom info', 'custom_label',
        new Money(12000), CATEGORY_SPORT, 7, 42, 3, 12, 6);
      expect(goods.stock).assertEqual(7);
      expect(goods.sales).assertEqual(42);
      expect(goods.rating).assertEqual(3);
      expect(goods.liveRoomId).assertEqual(12);
      expect(goods.imageIndex).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0040
     * @tc.name      goods_constructor_accepts_a_zero_identifier_004
     * @tc.desc      Verify goods constructor accepts a zero identifier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_constructor_accepts_a_zero_identifier_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_constructor_accepts_a_zero_identifier_004');
      let goods: Goods = new Goods(0, 'First Catalogue Item', 'first info', 'first_label',
        new Money(1000), CATEGORY_PHONE);
      expect(goods.id).assertEqual(0);
      expect(goods.title).assertEqual('First Catalogue Item');
      expect(goods.price.cents()).assertEqual(1000);
      expect(goods.stock).assertEqual(99);
      expect(goods.isInStock()).assertTrue();
      expect(goods.isExpensive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0050
     * @tc.name      goods_constructor_accepts_a_negative_identifier_005
     * @tc.desc      Verify goods constructor accepts a negative identifier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_constructor_accepts_a_negative_identifier_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_constructor_accepts_a_negative_identifier_005');
      let goods: Goods = new Goods(-7, 'Temporary Item', 'draft info', 'draft_label',
        new Money(1000), CATEGORY_PHONE);
      expect(goods.id).assertEqual(-7);
      expect(goods.title).assertEqual('Temporary Item');
      expect(goods.stock).assertEqual(99);
      expect(goods.isInStock()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0060
     * @tc.name      goods_constructor_keeps_remaining_defaults_after_a_supplied_stock_006
     * @tc.desc      Verify goods constructor keeps remaining defaults after a supplied stock.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_constructor_keeps_remaining_defaults_after_a_supplied_stock_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_constructor_keeps_remaining_defaults_after_a_supplied_stock_006');
      let goods: Goods = new Goods(6, 'Partial Config Item', 'partial info', 'partial_label',
        new Money(3300), CATEGORY_FOOD, 7);
      expect(goods.stock).assertEqual(7);
      expect(goods.sales).assertEqual(0);
      expect(goods.rating).assertEqual(5);
      expect(goods.liveRoomId).assertEqual(-1);
      expect(goods.imageIndex).assertEqual(0);
      expect(goods.isInStock()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0070
     * @tc.name      goods_constructor_preserves_negative_sales_and_image_index_007
     * @tc.desc      Verify goods constructor preserves negative sales and image index.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_constructor_preserves_negative_sales_and_image_index_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_constructor_preserves_negative_sales_and_image_index_007');
      let goods: Goods = new Goods(8, 'Counter Item', 'counter probe', 'basic_label',
        new Money(900), CATEGORY_WEAR, 0, -3, 5, -1, -4);
      // Stock 0 is already the out-of-stock edge, while sales -3 and image index -4 stay negative.
      expect(goods.sales).assertEqual(-3);
      expect(goods.imageIndex).assertEqual(-4);
      expect(goods.stock).assertEqual(0);
      expect(goods.isInStock()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0080
     * @tc.name      goods_constructor_preserves_empty_text_and_category_008
     * @tc.desc      Verify goods constructor preserves empty text and category.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_constructor_preserves_empty_text_and_category_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_constructor_preserves_empty_text_and_category_008');
      let goods: Goods = new Goods(9, '', '', '', new Money(1000), '');
      expect(goods.title).assertEqual('');
      expect(goods.info).assertEqual('');
      expect(goods.labels).assertEqual('');
      expect(goods.category).assertEqual('');
      expect(goods.searchText()).assertEqual('   ');
      expect(goods.searchText().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0090
     * @tc.name      goods_constructor_preserves_internal_title_whitespace_009
     * @tc.desc      Verify goods constructor preserves internal title whitespace.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_constructor_preserves_internal_title_whitespace_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_constructor_preserves_internal_title_whitespace_009');
      let goods: Goods = new Goods(10, '  double  spaced  ', 'info', 'label',
        new Money(1000), CATEGORY_PHONE);
      expect(goods.title).assertEqual('  double  spaced  ');
      expect(goods.searchText().startsWith('  double')).assertTrue();
      expect(goods.searchText().indexOf('double  spaced') >= 0).assertTrue();
      let expectedLength: number = goods.title.length + goods.info.length +
        goods.labels.length + goods.category.length + 3;
      expect(goods.searchText().length).assertEqual(expectedLength);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0100
     * @tc.name      goods_constructor_preserves_negative_stock_without_clamping_010
     * @tc.desc      Verify goods constructor preserves negative stock without clamping.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_constructor_preserves_negative_stock_without_clamping_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_constructor_preserves_negative_stock_without_clamping_010');
      let goods: Goods = new Goods(77, 'Overbooked Item', 'negative stock', 'basic_label',
        new Money(500), CATEGORY_FOOD, -5);
      expect(goods.stock).assertEqual(-5);
      expect(goods.isInStock()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0110
     * @tc.name      goods_constructor_preserves_ratings_outside_the_star_range_011
     * @tc.desc      Verify goods constructor preserves ratings outside the star range.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_constructor_preserves_ratings_outside_the_star_range_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_constructor_preserves_ratings_outside_the_star_range_011');
      let ratings: number[] = [0, 9];
      let expectedStocks: number[] = [3, 4];
      // 0 and 9 sit outside the usual 1-5 star band; keeping them verbatim shows no clamping happens.
      for (let index: number = 0; index < ratings.length; index++) {
        let goods: Goods = new Goods(index + 80, 'Rated Item', 'rating probe', 'basic_label',
          new Money(700), CATEGORY_APPLIANCE, expectedStocks[index], 0, ratings[index]);
        expect(goods.rating).assertEqual(ratings[index]);
        expect(goods.stock).assertEqual(expectedStocks[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0120
     * @tc.name      builder_derives_image_index_from_identifier_modulo_eight_012
     * @tc.desc      Verify builder derives image index from identifier modulo eight.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('builder_derives_image_index_from_identifier_modulo_eight_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: builder_derives_image_index_from_identifier_modulo_eight_012');
      let identifiers: number[] = [0, 3, 7, 8, 11, 15];
      for (let index: number = 0; index < identifiers.length; index++) {
        let goods: Goods = createGoods(identifiers[index], 'Gallery Item', 1000);
        expect(goods.imageIndex).assertEqual(identifiers[index] % 8);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0130
     * @tc.name      goods_explicit_image_index_is_not_derived_from_the_identifier_013
     * @tc.desc      Verify goods explicit image index is not derived from the identifier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_explicit_image_index_is_not_derived_from_the_identifier_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_explicit_image_index_is_not_derived_from_the_identifier_013');
      let built: Goods = createGoods(8, 'Builder Gallery Item', 1000);
      let explicit: Goods = new Goods(8, 'Explicit Gallery Item', 'gallery info', 'basic_label',
        new Money(1000), CATEGORY_PHONE, 99, 0, 5, -1, 3);
      expect(built.imageIndex).assertEqual(0);
      expect(explicit.imageIndex).assertEqual(3);
      expect(explicit.imageIndex !== built.imageIndex).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0140
     * @tc.name      goods_default_image_index_is_zero_for_a_large_identifier_014
     * @tc.desc      Verify goods default image index is zero for a large identifier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_default_image_index_is_zero_for_a_large_identifier_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_default_image_index_is_zero_for_a_large_identifier_014');
      let goods: Goods = new Goods(Number.MAX_SAFE_INTEGER, 'Large Identifier Item', 'large id',
        'basic_label', new Money(1000), CATEGORY_PHONE);
      // MAX_SAFE_INTEGER is the largest exactly representable id, and an omitted image index keeps 0.
      expect(goods.id).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(goods.imageIndex).assertEqual(0);
      expect(goods.stock).assertEqual(99);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0150
     * @tc.name      goods_with_same_identifier_remain_independent_instances_015
     * @tc.desc      Verify goods with same identifier remain independent instances.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_with_same_identifier_remain_independent_instances_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_with_same_identifier_remain_independent_instances_015');
      let left: Goods = new Goods(21, 'Left Twin', 'left body', 'left_label',
        new Money(1000), CATEGORY_PHONE, 3, 10);
      let right: Goods = new Goods(21, 'Right Twin', 'right body', 'right_label',
        new Money(2000), CATEGORY_PHONE, 40, 20);
      expect(left.id).assertEqual(right.id);
      expect(left.title).assertEqual('Left Twin');
      expect(right.title).assertEqual('Right Twin');
      left.stock = 0;
      // Emptying the left twin is the probe: a shared reference would also drop the right stock to 0.
      expect(right.stock).assertEqual(40);
      expect(left.isInStock()).assertFalse();
      expect(right.isInStock()).assertTrue();
      expect(left !== right).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0160
     * @tc.name      builder_calls_return_independent_goods_instances_016
     * @tc.desc      Verify builder calls return independent goods instances.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('builder_calls_return_independent_goods_instances_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: builder_calls_return_independent_goods_instances_016');
      let first: Goods = createGoods(200, 'Builder Item', 1000);
      let second: Goods = createGoods(200, 'Builder Item', 1000);
      expect(first.stock).assertEqual(99);
      expect(second.stock).assertEqual(99);
      first.stock = 0;
      first.title = 'Changed Builder Item';
      expect(second.stock).assertEqual(99);
      expect(second.title).assertEqual('Builder Item');
      expect(second.isInStock()).assertTrue();
      expect(first !== second).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0170
     * @tc.name      goods_same_identifier_twins_keep_independent_prices_017
     * @tc.desc      Verify goods same identifier twins keep independent prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_same_identifier_twins_keep_independent_prices_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_same_identifier_twins_keep_independent_prices_017');
      let left: Goods = new Goods(22, 'Affordable Twin', 'left price', 'left_label',
        new Money(1000), CATEGORY_PHONE);
      let right: Goods = new Goods(22, 'Premium Twin', 'right price', 'right_label',
        new Money(777000), CATEGORY_PHONE);
      expect(left.price.cents()).assertEqual(1000);
      expect(right.price.cents()).assertEqual(777000);
      left.price = new Money(900000);
      expect(left.price.cents()).assertEqual(900000);
      expect(right.price.cents()).assertEqual(777000);
      expect(right.isExpensive()).assertTrue();
      expect(left !== right).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0180
     * @tc.name      goods_is_in_stock_for_positive_stock_values_018
     * @tc.desc      Verify goods is in stock for positive stock values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_is_in_stock_for_positive_stock_values_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_is_in_stock_for_positive_stock_values_018');
      let stocks: number[] = [1, 50, 99];
      for (let index: number = 0; index < stocks.length; index++) {
        let goods: Goods = new Goods(index + 90, 'Stock Item', 'stock probe', 'stock_label',
          new Money(1000), CATEGORY_PHONE, stocks[index]);
        expect(goods.stock).assertEqual(stocks[index]);
        expect(goods.isInStock()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0190
     * @tc.name      goods_is_out_of_stock_when_stock_is_zero_019
     * @tc.desc      Verify goods is out of stock when stock is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_is_out_of_stock_when_stock_is_zero_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_is_out_of_stock_when_stock_is_zero_019');
      let goods: Goods = new Goods(91, 'Sold Out Item', 'zero stock', 'stock_label',
        new Money(1000), CATEGORY_PHONE, 0);
      expect(goods.stock).assertEqual(0);
      expect(goods.isInStock()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0200
     * @tc.name      goods_availability_follows_a_decrement_sequence_020
     * @tc.desc      Verify goods availability follows a decrement sequence.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_availability_follows_a_decrement_sequence_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_availability_follows_a_decrement_sequence_020');
      let goods: Goods = new Goods(95, 'Counting Down Item', 'sequence probe', 'stock_label',
        new Money(1000), CATEGORY_PHONE, 3);
      let stocks: number[] = [3, 2, 1, 0];
      let expected: boolean[] = [true, true, true, false];
      // Three positive levels then 0: only the empty shelf flips isInStock to false.
      for (let index: number = 0; index < stocks.length; index++) {
        goods.stock = stocks[index];
        expect(goods.stock).assertEqual(stocks[index]);
        expect(goods.isInStock()).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0210
     * @tc.name      goods_availability_ignores_sales_and_rating_021
     * @tc.desc      Verify goods availability ignores sales and rating.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_availability_ignores_sales_and_rating_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_availability_ignores_sales_and_rating_021');
      let soldOut: Goods = new Goods(103, 'Sold Out Bestseller', 'high demand', 'hot_label',
        new Money(1000), CATEGORY_PHONE, 0, Number.MAX_SAFE_INTEGER, 5);
      expect(soldOut.sales).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(soldOut.rating).assertEqual(5);
      expect(soldOut.isInStock()).assertFalse();
      let available: Goods = new Goods(104, 'Slow Mover', 'low demand', 'plain_label',
        new Money(1000), CATEGORY_PHONE, 1, 0, 0);
      expect(available.sales).assertEqual(0);
      expect(available.rating).assertEqual(0);
      expect(available.isInStock()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0220
     * @tc.name      goods_stock_mutation_switches_availability_in_both_directions_022
     * @tc.desc      Verify goods stock mutation switches availability in both directions.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_stock_mutation_switches_availability_in_both_directions_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_stock_mutation_switches_availability_in_both_directions_022');
      let goods: Goods = new Goods(92, 'Restocked Item', 'mutable stock', 'stock_label',
        new Money(1000), CATEGORY_FOOD, 0);
      expect(goods.isInStock()).assertFalse();
      goods.stock = 5;
      expect(goods.isInStock()).assertTrue();
      goods.stock = 0;
      expect(goods.isInStock()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0230
     * @tc.name      goods_has_live_room_for_identifier_zero_023
     * @tc.desc      Verify goods has live room for identifier zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_has_live_room_for_identifier_zero_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_has_live_room_for_identifier_zero_023');
      let goods: Goods = new Goods(93, 'Live Anchor Item', 'room zero', 'live_label',
        new Money(1000), CATEGORY_PHONE, 10, 0, 5, 0);
      // Room 0 is a real room; only the -1 sentinel means offline, so zero must not read as absent.
      expect(goods.liveRoomId).assertEqual(0);
      expect(goods.hasLiveRoom()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0240
     * @tc.name      goods_has_live_room_for_positive_identifiers_024
     * @tc.desc      Verify goods has live room for positive identifiers.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_has_live_room_for_positive_identifiers_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_has_live_room_for_positive_identifiers_024');
      let roomIds: number[] = [1, 42, 999];
      for (let index: number = 0; index < roomIds.length; index++) {
        let goods: Goods = new Goods(index + 94, 'Live Room Item', 'room probe', 'live_label',
          new Money(1000), CATEGORY_SPORT, 10, 0, 5, roomIds[index]);
        expect(goods.hasLiveRoom()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0250
     * @tc.name      goods_has_no_live_room_for_negative_identifiers_025
     * @tc.desc      Verify goods has no live room for negative identifiers.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_has_no_live_room_for_negative_identifiers_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_has_no_live_room_for_negative_identifiers_025');
      let roomIds: number[] = [-1, -2, -100];
      for (let index: number = 0; index < roomIds.length; index++) {
        let goods: Goods = new Goods(index + 98, 'Offline Item', 'no room', 'plain_label',
          new Money(1000), CATEGORY_SPORT, 10, 0, 5, roomIds[index]);
        expect(goods.liveRoomId).assertEqual(roomIds[index]);
        expect(goods.hasLiveRoom()).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0260
     * @tc.name      goods_live_room_mutation_switches_the_flag_in_both_directions_026
     * @tc.desc      Verify goods live room mutation switches the flag in both directions.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_live_room_mutation_switches_the_flag_in_both_directions_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_live_room_mutation_switches_the_flag_in_both_directions_026');
      let goods: Goods = new Goods(101, 'Room Switcher', 'room mutation', 'live_label',
        new Money(1000), CATEGORY_APPLIANCE, 10, 0, 5, -1);
      expect(goods.hasLiveRoom()).assertFalse();
      goods.liveRoomId = 3;
      expect(goods.hasLiveRoom()).assertTrue();
      goods.liveRoomId = -1;
      expect(goods.hasLiveRoom()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0270
     * @tc.name      goods_live_room_and_stock_flags_are_independent_027
     * @tc.desc      Verify goods live room and stock flags are independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_live_room_and_stock_flags_are_independent_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_live_room_and_stock_flags_are_independent_027');
      let liveSoldOut: Goods = new Goods(105, 'Live Sold Out', 'room but no stock', 'live_label',
        new Money(1000), CATEGORY_PHONE, 0, 0, 5, 4);
      expect(liveSoldOut.hasLiveRoom()).assertTrue();
      expect(liveSoldOut.isInStock()).assertFalse();
      let offlineInStock: Goods = new Goods(106, 'Offline In Stock', 'stock but no room', 'plain_label',
        new Money(1000), CATEGORY_PHONE, 6, 0, 5, -1);
      expect(offlineInStock.hasLiveRoom()).assertFalse();
      expect(offlineInStock.isInStock()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0280
     * @tc.name      goods_has_live_room_for_max_safe_identifiers_028
     * @tc.desc      Verify goods has live room for max safe identifiers.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_has_live_room_for_max_safe_identifiers_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_has_live_room_for_max_safe_identifiers_028');
      let goods: Goods = new Goods(102, 'Huge Room Item', 'room ceiling', 'live_label',
        new Money(1000), CATEGORY_WEAR, 10, 0, 5, Number.MAX_SAFE_INTEGER);
      expect(goods.liveRoomId).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(goods.hasLiveRoom()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0290
     * @tc.name      goods_keyword_matching_is_case_insensitive_in_both_directions_029
     * @tc.desc      Verify goods keyword matching is case insensitive in both directions.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_matching_is_case_insensitive_in_both_directions_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_matching_is_case_insensitive_in_both_directions_029');
      let mixedGoods: Goods = new Goods(110, 'Harmony Phone One', 'flagship phone', 'new_product',
        new Money(1000), CATEGORY_PHONE);
      let keywords: string[] = ['phone', 'PHONE', 'PhOnE'];
      for (let index: number = 0; index < keywords.length; index++) {
        expect(mixedGoods.matchesKeyword(keywords[index])).assertTrue();
      }
      let upperGoods: Goods = new Goods(111, 'SUPER TABLET', 'STORE INFO', 'BASIC_LABEL',
        new Money(1000), CATEGORY_APPLIANCE);
      expect(upperGoods.matchesKeyword('super')).assertTrue();
      expect(upperGoods.matchesKeyword('STORE')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0300
     * @tc.name      goods_keyword_matches_positive_keyword_forms_030
     * @tc.desc      Verify goods keyword matches positive keyword forms.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_matches_positive_keyword_forms_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_matches_positive_keyword_forms_030');
      let titles: string[] = ['Harmony Phone One', 'Harmony Phone One', ''];
      let infos: string[] = ['flagship phone', 'flagship phone', ''];
      let labels: string[] = ['new_product', 'new_product', ''];
      // Row 0 carries padding, row 1 fragments plus the whole title, row 2 case variants; padding trims first.
      let keywords: string[][] = [
        ['  phone  ', '\tphone', 'phone\n'],
        ['harm', 'phone one', 'Harmony Phone One'],
        ['PHONE', 'Phone', 'pHoNe']
      ];

      expect(keywords.length).assertEqual(titles.length);
      for (let row: number = 0; row < keywords.length; row++) {
        let goods: Goods = new Goods(112 + row, titles[row], infos[row], labels[row],
          new Money(1000), CATEGORY_PHONE);
        for (let column: number = 0; column < keywords[row].length; column++) {
          expect(goods.matchesKeyword(keywords[row][column])).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0310
     * @tc.name      goods_keyword_blank_input_never_matches_031
     * @tc.desc      Verify goods keyword blank input never matches.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_blank_input_never_matches_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_blank_input_never_matches_031');
      let goods: Goods = new Goods(113, 'Harmony Phone One', 'flagship phone', 'new_product',
        new Money(1000), CATEGORY_PHONE);
      // Each entry reduces to empty once trimmed, so none may match the whole search text.
      let keywords: string[] = ['', ' ', '   ', '\t', '\n'];
      for (let index: number = 0; index < keywords.length; index++) {
        expect(goods.matchesKeyword(keywords[index])).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0320
     * @tc.name      goods_keyword_never_matches_a_fully_empty_item_032
     * @tc.desc      Verify goods keyword never matches a fully empty item.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_never_matches_a_fully_empty_item_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_never_matches_a_fully_empty_item_032');
      let goods: Goods = new Goods(151, '', '', '', new Money(1000), '');
      let keywords: string[] = ['phone', 'a', 'item', '   '];
      for (let index: number = 0; index < keywords.length; index++) {
        expect(goods.matchesKeyword(keywords[index])).assertFalse();
      }
      expect(goods.searchText()).assertEqual('   ');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0330
     * @tc.name      goods_keyword_matches_version_label_literally_033
     * @tc.desc      Verify goods keyword matches version label literally.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_matches_version_label_literally_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_matches_version_label_literally_033');
      let labels: string[] = ['v2.0', '2025_edition'];
      let matching: string[][] = [['v2.0', '2.0'], ['2025', '2025_edition']];
      let nonMatching: string[] = ['v2 0', '2025 edition'];
      expect(labels.length).assertEqual(nonMatching.length);
      for (let row: number = 0; row < labels.length; row++) {
        let goods: Goods = new Goods(152 + row, 'Plain Item', 'plain info', labels[row],
          new Money(1000), CATEGORY_PHONE);
        expect(goods.searchText().indexOf(labels[row]) >= 0).assertTrue();
        for (let column: number = 0; column < matching[row].length; column++) {
          expect(goods.matchesKeyword(matching[row][column])).assertTrue();
        }
        expect(goods.matchesKeyword(nonMatching[row])).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0340
     * @tc.name      goods_keyword_misses_unrelated_words_034
     * @tc.desc      Verify goods keyword misses unrelated words.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_misses_unrelated_words_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_misses_unrelated_words_034');
      let goods: Goods = new Goods(118, 'Harmony Phone One', 'flagship phone', 'new_product',
        new Money(1000), CATEGORY_PHONE);
      let keywords: string[] = ['tablet', 'laptop', 'camera'];
      for (let index: number = 0; index < keywords.length; index++) {
        expect(goods.matchesKeyword(keywords[index])).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0350
     * @tc.name      goods_keyword_does_not_match_the_price_digits_035
     * @tc.desc      Verify goods keyword does not match the price digits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_does_not_match_the_price_digits_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_does_not_match_the_price_digits_035');
      let goods: Goods = new Goods(119, 'Plain Item', 'no number here', 'basic_label',
        new Money(123456), CATEGORY_PHONE);
      expect(goods.matchesKeyword('123456')).assertFalse();
      expect(goods.searchText().indexOf('123456') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0360
     * @tc.name      goods_keyword_requires_contiguous_characters_036
     * @tc.desc      Verify goods keyword requires contiguous characters.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_requires_contiguous_characters_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_requires_contiguous_characters_036');
      let goods: Goods = new Goods(120, 'Harmony Phone One', 'flagship phone', 'new_product',
        new Money(1000), CATEGORY_PHONE);
      // Both phrases reverse the title word order, so no contiguous run in the joined text spells them.
      let keywords: string[] = ['phone harmony', 'harmony one'];
      for (let index: number = 0; index < keywords.length; index++) {
        expect(goods.matchesKeyword(keywords[index])).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0370
     * @tc.name      goods_keyword_matches_across_a_field_boundary_037
     * @tc.desc      Verify goods keyword matches across a field boundary.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_matches_across_a_field_boundary_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_matches_across_a_field_boundary_037');
      let goods: Goods = new Goods(121, 'Harmony Phone One', 'flagship phone', 'new_product',
        new Money(1000), CATEGORY_PHONE);
      // 'One' closes the title and 'flagship' opens the info; the joining space makes them adjacent.
      expect(goods.searchText().indexOf('one flagship') >= 0).assertTrue();
      expect(goods.matchesKeyword('one flagship')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0380
     * @tc.name      goods_keyword_matches_digits_inside_the_info_field_038
     * @tc.desc      Verify goods keyword matches digits inside the info field.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_matches_digits_inside_the_info_field_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_matches_digits_inside_the_info_field_038');
      let goods: Goods = new Goods(122, 'Model Phone', 'model 2024 edition', 'basic_label',
        new Money(1000), CATEGORY_PHONE);
      expect(goods.matchesKeyword('2024')).assertTrue();
      expect(goods.matchesKeyword('model 2024')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0390
     * @tc.name      goods_keyword_matches_inside_a_longer_word_039
     * @tc.desc      Verify goods keyword matches inside a longer word.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_matches_inside_a_longer_word_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_matches_inside_a_longer_word_039');
      let goods: Goods = new Goods(123, 'Smart Watch', 'fitness band', 'basic_label',
        new Money(1000), CATEGORY_SPORT);
      expect(goods.searchText().indexOf('smart watch') >= 0).assertTrue();
      expect(goods.matchesKeyword('art')).assertTrue();
      expect(goods.matchesKeyword('atch')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0400
     * @tc.name      goods_keyword_matches_a_single_present_character_040
     * @tc.desc      Verify goods keyword matches a single present character.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_matches_a_single_present_character_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_matches_a_single_present_character_040');
      let goods: Goods = new Goods(127, 'Harmony Phone One', 'flagship phone', 'new_product',
        new Money(1000), CATEGORY_PHONE);
      expect(goods.searchText().indexOf('h') >= 0).assertTrue();
      expect(goods.searchText().indexOf('y') >= 0).assertTrue();
      expect(goods.matchesKeyword('h')).assertTrue();
      expect(goods.matchesKeyword('y')).assertTrue();
      expect(goods.matchesKeyword('o')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0410
     * @tc.name      goods_keyword_single_absent_character_returns_false_041
     * @tc.desc      Verify goods keyword single absent character returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_single_absent_character_returns_false_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_single_absent_character_returns_false_041');
      let goods: Goods = new Goods(128, 'Harmony Phone One', 'flagship phone', 'new_product',
        new Money(1000), CATEGORY_PHONE);
      expect(goods.searchText().indexOf('q') < 0).assertTrue();
      expect(goods.searchText().indexOf('z') < 0).assertTrue();
      expect(goods.matchesKeyword('q')).assertFalse();
      expect(goods.matchesKeyword('z')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0420
     * @tc.name      goods_keyword_equal_to_the_whole_search_text_matches_042
     * @tc.desc      Verify goods keyword equal to the whole search text matches.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_equal_to_the_whole_search_text_matches_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_equal_to_the_whole_search_text_matches_042');
      let goods: Goods = new Goods(129, 'Wholesale Item', 'bulk info', 'bulk_label',
        new Money(1000), CATEGORY_FOOD);
      let search: string = goods.searchText();
      // 14 + 9 + 10 + 4 characters plus three separators add up to 40, so no field is repeated.
      expect(search.length).assertEqual(40);
      expect(search.indexOf('wholesale item') >= 0).assertTrue();
      expect(goods.matchesKeyword(search)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0430
     * @tc.name      goods_keyword_longer_than_the_search_text_never_matches_043
     * @tc.desc      Verify goods keyword longer than the search text never matches.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_longer_than_the_search_text_never_matches_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_longer_than_the_search_text_never_matches_043');
      let goods: Goods = new Goods(130, 'Short Item', 'tiny info', 'tiny_label',
        new Money(1000), CATEGORY_PHONE);
      let search: string = goods.searchText();
      let longer: string = search + ' and an extra suffix';
      expect(longer.length).assertEqual(search.length + ' and an extra suffix'.length);
      expect(goods.matchesKeyword(longer)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0440
     * @tc.name      goods_keyword_internal_double_space_does_not_match_044
     * @tc.desc      Verify goods keyword internal double space does not match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_internal_double_space_does_not_match_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_internal_double_space_does_not_match_044');
      let goods: Goods = new Goods(131, 'Harmony Phone One', 'flagship phone', 'new_product',
        new Money(1000), CATEGORY_PHONE);
      expect(goods.matchesKeyword('phone one')).assertTrue();
      expect(goods.matchesKeyword('phone  one')).assertFalse();
      expect(goods.matchesKeyword('harmony  phone')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0450
     * @tc.name      goods_keyword_matching_leaves_the_instance_unchanged_045
     * @tc.desc      Verify goods keyword matching leaves the instance unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_matching_leaves_the_instance_unchanged_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_matching_leaves_the_instance_unchanged_045');
      let goods: Goods = new Goods(133, 'Stable Item', 'stable info', 'stable_label',
        new Money(12345), CATEGORY_SPORT, 8, 21, 4, 2, 3);
      let keywords: string[] = ['stable', 'missing', '', 'sport'];
      // One hit, one miss, a blank and a category lookup race before the snapshot below.
      for (let index: number = 0; index < keywords.length; index++) {
        goods.matchesKeyword(keywords[index]);
      }

      expect(goods.id).assertEqual(133);
      expect(goods.title).assertEqual('Stable Item');
      expect(goods.info).assertEqual('stable info');
      expect(goods.labels).assertEqual('stable_label');
      expect(goods.category).assertEqual(CATEGORY_SPORT);
      expect(goods.price.cents()).assertEqual(12345);
      expect(goods.stock).assertEqual(8);
      expect(goods.sales).assertEqual(21);
      expect(goods.imageIndex).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0460
     * @tc.name      goods_price_mutation_does_not_change_keyword_matching_046
     * @tc.desc      Verify goods price mutation does not change keyword matching.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_price_mutation_does_not_change_keyword_matching_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_price_mutation_does_not_change_keyword_matching_046');
      let goods: Goods = new Goods(135, 'Harmony Phone One', 'flagship phone', 'new_product',
        new Money(100), CATEGORY_PHONE);
      let before: string = goods.searchText();
      expect(goods.matchesKeyword('flagship')).assertTrue();
      goods.price = new Money(999999);
      let after: string = goods.searchText();
      expect(after).assertEqual(before);
      expect(goods.matchesKeyword('flagship')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0470
     * @tc.name      goods_keyword_requires_the_underscore_literal_047
     * @tc.desc      Verify goods keyword requires the underscore literal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_requires_the_underscore_literal_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_requires_the_underscore_literal_047');
      let goods: Goods = new Goods(124, 'Plain Item', 'plain info', 'new_product',
        new Money(1000), CATEGORY_PHONE);
      expect(goods.matchesKeyword('new_product')).assertTrue();
      expect(goods.matchesKeyword('new product')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0480
     * @tc.name      goods_keyword_reflects_a_label_mutation_048
     * @tc.desc      Verify goods keyword reflects a label mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_reflects_a_label_mutation_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_reflects_a_label_mutation_048');
      let goods: Goods = new Goods(125, 'Plain Item', 'plain info', LABEL_NEW,
        new Money(1000), CATEGORY_PHONE);
      expect(goods.matchesKeyword('hot_sale')).assertFalse();
      goods.labels = LABEL_HOT;
      expect(goods.matchesKeyword('hot_sale')).assertTrue();
      expect(goods.matchesKeyword('new_product')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0490
     * @tc.name      goods_keyword_reflects_a_title_mutation_049
     * @tc.desc      Verify goods keyword reflects a title mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_reflects_a_title_mutation_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_reflects_a_title_mutation_049');
      let goods: Goods = new Goods(153, 'Plain Item', 'plain info', 'plain_label',
        new Money(1000), CATEGORY_PHONE);
      expect(goods.matchesKeyword('deluxe')).assertFalse();
      goods.title = 'Deluxe Item';
      let probes: string[] = ['deluxe', 'item', 'deluxe item'];
      for (let index: number = 0; index < probes.length; index++) {
        expect(goods.matchesKeyword(probes[index])).assertTrue();
      }
      expect(goods.matchesKeyword('plain item')).assertFalse();
      expect(goods.searchText().indexOf('deluxe item') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0500
     * @tc.name      goods_keyword_reflects_a_category_mutation_050
     * @tc.desc      Verify goods keyword reflects a category mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_reflects_a_category_mutation_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_reflects_a_category_mutation_050');
      let goods: Goods = new Goods(154, 'Plain Item', 'plain info', 'plain_label',
        new Money(1000), CATEGORY_PHONE);
      expect(goods.matchesKeyword('household')).assertFalse();
      goods.category = 'household';
      expect(goods.matchesKeyword('household')).assertTrue();
      expect(goods.matchesKeyword(CATEGORY_PHONE)).assertFalse();
      expect(goods.searchText().endsWith('household')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0510
     * @tc.name      goods_keyword_matches_category_when_text_fields_are_empty_051
     * @tc.desc      Verify goods keyword matches category when text fields are empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_matches_category_when_text_fields_are_empty_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_matches_category_when_text_fields_are_empty_051');
      let goods: Goods = new Goods(126, '', '', '', new Money(1000), CATEGORY_PHONE);
      expect(goods.searchText()).assertEqual('   phone');
      expect(goods.matchesKeyword('phone')).assertTrue();
      expect(goods.matchesKeyword('   ')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0520
     * @tc.name      goods_search_text_excludes_identifier_price_and_sales_052
     * @tc.desc      Verify goods search text excludes identifier price and sales.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_search_text_excludes_identifier_price_and_sales_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_search_text_excludes_identifier_price_and_sales_052');
      let goods: Goods = new Goods(4242, 'Plain Item', 'clean text', 'basic_label',
        new Money(12345), CATEGORY_PHONE, 5, 67890);
      let search: string = goods.searchText();
      expect(search.indexOf('4242') < 0).assertTrue();
      expect(search.indexOf('12345') < 0).assertTrue();
      expect(search.indexOf('67890') < 0).assertTrue();
      expect(search.indexOf('plain item') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0530
     * @tc.name      goods_search_text_has_a_length_matching_the_field_sum_053
     * @tc.desc      Verify goods search text has a length matching the field sum.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_search_text_has_a_length_matching_the_field_sum_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_search_text_has_a_length_matching_the_field_sum_053');
      let goods: Goods = new Goods(132, 'Alpha', 'Beta', 'Gamma', new Money(1000), 'Delta');
      // The join puts one space between each pair of the four fields, hence the trailing + 3.
      let expectedLength: number = goods.title.length + goods.info.length +
        goods.labels.length + goods.category.length + 3;
      expect(goods.searchText().length).assertEqual(expectedLength);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0540
     * @tc.name      goods_search_text_starts_with_the_title_and_ends_with_the_category_054
     * @tc.desc      Verify goods search text starts with the title and ends with the category.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_search_text_starts_with_the_title_and_ends_with_the_category_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_search_text_starts_with_the_title_and_ends_with_the_category_054');
      let goods: Goods = new Goods(133, 'Unique Title', 'middle info', 'middle label',
        new Money(1000), 'unique_category');
      expect(goods.searchText().startsWith('unique title')).assertTrue();
      expect(goods.searchText().endsWith('unique_category')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0550
     * @tc.name      goods_search_text_reflects_a_title_mutation_055
     * @tc.desc      Verify goods search text reflects a title mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_search_text_reflects_a_title_mutation_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_search_text_reflects_a_title_mutation_055');
      let goods: Goods = new Goods(134, 'First Name', 'stable info', 'stable_label',
        new Money(1000), CATEGORY_PHONE);
      expect(goods.searchText().indexOf('first name') >= 0).assertTrue();
      goods.title = 'Second Name';
      expect(goods.searchText().indexOf('second name') >= 0).assertTrue();
      expect(goods.searchText().indexOf('first name') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0560
     * @tc.name      goods_search_text_of_a_single_field_item_keeps_trailing_separators_056
     * @tc.desc      Verify goods search text of a single field item keeps trailing separators.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_search_text_of_a_single_field_item_keeps_trailing_separators_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_search_text_of_a_single_field_item_keeps_trailing_separators_056');
      let goods: Goods = new Goods(136, 'Only Title', '', '', new Money(1000), '');
      expect(goods.title).assertEqual('Only Title');
      expect(goods.searchText()).assertEqual('only title   ');
      expect(goods.searchText().length).assertEqual(13);
      expect(goods.searchText().endsWith('   ')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0570
     * @tc.name      goods_search_text_lists_each_field_once_in_order_057
     * @tc.desc      Verify goods search text lists each field once in order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_search_text_lists_each_field_once_in_order_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_search_text_lists_each_field_once_in_order_057');
      let goods: Goods = new Goods(137, 'Alpha', 'Beta', 'Gamma', new Money(1000), 'Delta');
      let search: string = goods.searchText();
      let alphaIndex: number = search.indexOf('alpha');
      let betaIndex: number = search.indexOf('beta');
      let gammaIndex: number = search.indexOf('gamma');
      let deltaIndex: number = search.indexOf('delta');
      expect(alphaIndex).assertEqual(0);
      // Each start equals the previous start plus that field's length plus one separator.
      expect(betaIndex).assertEqual(alphaIndex + 'alpha '.length);
      expect(gammaIndex).assertEqual(betaIndex + 'beta '.length);
      expect(deltaIndex).assertEqual(gammaIndex + 'gamma '.length);
      expect(search.lastIndexOf('alpha')).assertEqual(alphaIndex);
      expect(search.lastIndexOf('beta')).assertEqual(betaIndex);
      expect(search.lastIndexOf('gamma')).assertEqual(gammaIndex);
      expect(search.lastIndexOf('delta')).assertEqual(deltaIndex);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0580
     * @tc.name      goods_search_text_is_stable_across_repeated_calls_058
     * @tc.desc      Verify goods search text is stable across repeated calls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_search_text_is_stable_across_repeated_calls_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_search_text_is_stable_across_repeated_calls_058');
      let goods: Goods = new Goods(138, 'Repeatable Item', 'repeatable info', 'repeatable_label',
        new Money(1000), CATEGORY_SPORT);
      let first: string = goods.searchText();
      let second: string = goods.searchText();
      let third: string = goods.searchText();
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(first.length).assertEqual(second.length);
      expect(first.indexOf('repeatable item') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0590
     * @tc.name      goods_search_text_is_not_affected_by_a_stock_mutation_059
     * @tc.desc      Verify goods search text is not affected by a stock mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_search_text_is_not_affected_by_a_stock_mutation_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_search_text_is_not_affected_by_a_stock_mutation_059');
      let goods: Goods = new Goods(139, 'Stocky Item', 'stocky info', 'stocky_label',
        new Money(1000), CATEGORY_PHONE, 5);
      let before: string = goods.searchText();
      goods.stock = 0;
      let after: string = goods.searchText();
      expect(goods.isInStock()).assertFalse();
      expect(after).assertEqual(before);
      expect(after.indexOf('0') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0600
     * @tc.name      goods_is_not_expensive_for_cheap_prices_060
     * @tc.desc      Verify goods is not expensive for cheap prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_is_not_expensive_for_cheap_prices_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_is_not_expensive_for_cheap_prices_060');
      // 499999 is a cent under the 500000 line and 1 is the smallest positive amount: both must be cheap.
      let prices: number[] = [499999, 1];
      let ids: number[] = [140, 146];
      expect(prices.length).assertEqual(ids.length);
      for (let index: number = 0; index < prices.length; index++) {
        let goods: Goods = new Goods(ids[index], 'Cheap Item', 'below line', 'basic_label',
          new Money(prices[index]), CATEGORY_PHONE);
        expect(goods.price.cents()).assertEqual(prices[index]);
        expect(goods.isExpensive()).assertFalse();
        expect(goods.price.isPositive()).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0610
     * @tc.name      goods_is_expensive_at_the_exact_threshold_061
     * @tc.desc      Verify goods is expensive at the exact threshold.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_is_expensive_at_the_exact_threshold_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_is_expensive_at_the_exact_threshold_061');
      let goods: Goods = new Goods(141, 'Premium Item', 'on the line', 'basic_label',
        Money.ofYuan(5000), CATEGORY_PHONE);
      // 5000 yuan converts to exactly 500000 cents, pinning the inclusive side of the expensive boundary.
      expect(goods.price.cents()).assertEqual(500000);
      expect(goods.isExpensive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0620
     * @tc.name      goods_is_expensive_one_cent_above_the_threshold_062
     * @tc.desc      Verify goods is expensive one cent above the threshold.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_is_expensive_one_cent_above_the_threshold_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_is_expensive_one_cent_above_the_threshold_062');
      let goods: Goods = new Goods(142, 'Above Premium', 'over the line', 'basic_label',
        new Money(500001), CATEGORY_PHONE);
      expect(goods.price.cents()).assertEqual(500001);
      expect(goods.isExpensive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0630
     * @tc.name      goods_is_not_expensive_when_the_price_is_zero_063
     * @tc.desc      Verify goods is not expensive when the price is zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_is_not_expensive_when_the_price_is_zero_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_is_not_expensive_when_the_price_is_zero_063');
      let goods: Goods = new Goods(143, 'Free Sample', 'zero price', 'basic_label',
        Money.zero(), CATEGORY_FOOD);
      expect(goods.price.cents()).assertEqual(0);
      expect(goods.isExpensive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0640
     * @tc.name      goods_is_not_expensive_when_the_price_is_negative_064
     * @tc.desc      Verify goods is not expensive when the price is negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_is_not_expensive_when_the_price_is_negative_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_is_not_expensive_when_the_price_is_negative_064');
      let goods: Goods = new Goods(144, 'Adjustment Item', 'negative price', 'basic_label',
        new Money(-100), CATEGORY_FOOD);
      expect(goods.price.cents()).assertEqual(-100);
      expect(goods.isExpensive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0650
     * @tc.name      goods_is_expensive_tracks_a_price_replacement_065
     * @tc.desc      Verify goods is expensive tracks a price replacement.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_is_expensive_tracks_a_price_replacement_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_is_expensive_tracks_a_price_replacement_065');
      let goods: Goods = new Goods(145, 'Repriced Item', 'price mutation', 'basic_label',
        new Money(100), CATEGORY_PHONE);
      expect(goods.isExpensive()).assertFalse();
      goods.price = new Money(600000);
      expect(goods.isExpensive()).assertTrue();
      expect(goods.price.cents()).assertEqual(600000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0660
     * @tc.name      goods_live_room_mutation_does_not_change_availability_066
     * @tc.desc      Verify goods live room mutation does not change availability.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_live_room_mutation_does_not_change_availability_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_live_room_mutation_does_not_change_availability_066');
      let goods: Goods = new Goods(155, 'Stable Stock Item', 'stable stock', 'basic_label',
        new Money(1000), CATEGORY_PHONE, 5, 0, 5, -1);
      expect(goods.isInStock()).assertTrue();
      expect(goods.hasLiveRoom()).assertFalse();
      goods.liveRoomId = 7;
      expect(goods.hasLiveRoom()).assertTrue();
      expect(goods.isInStock()).assertTrue();
      expect(goods.stock).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0670
     * @tc.name      goods_stock_mutation_does_not_change_price_or_expensiveness_067
     * @tc.desc      Verify goods stock mutation does not change price or expensiveness.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_stock_mutation_does_not_change_price_or_expensiveness_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_stock_mutation_does_not_change_price_or_expensiveness_067');
      let goods: Goods = new Goods(156, 'Repriced Stock Item', 'stock change', 'basic_label',
        new Money(600000), CATEGORY_PHONE, 5);
      expect(goods.isExpensive()).assertTrue();
      goods.stock = 0;
      expect(goods.isInStock()).assertFalse();
      expect(goods.price.cents()).assertEqual(600000);
      expect(goods.isExpensive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0680
     * @tc.name      goods_is_not_expensive_when_sales_are_high_068
     * @tc.desc      Verify goods is not expensive when sales are high.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_is_not_expensive_when_sales_are_high_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_is_not_expensive_when_sales_are_high_068');
      let goods: Goods = new Goods(157, 'Popular Cheap Item', 'high sales', 'hot_label',
        new Money(100), CATEGORY_FOOD, 10, Number.MAX_SAFE_INTEGER);
      expect(goods.sales).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(goods.price.cents()).assertEqual(100);
      expect(goods.isExpensive()).assertFalse();
      expect(goods.isInStock()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0690
     * @tc.name      goods_expensive_flag_round_trips_across_the_threshold_069
     * @tc.desc      Verify goods expensive flag round trips across the threshold.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_expensive_flag_round_trips_across_the_threshold_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_expensive_flag_round_trips_across_the_threshold_069');
      let goods: Goods = new Goods(158, 'Cycling Price Item', 'price cycle', 'basic_label',
        new Money(600000), CATEGORY_PHONE);
      expect(goods.isExpensive()).assertTrue();
      goods.price = new Money(400000);
      // 600000, then 400000, then the exact 500000 edge: the flag flips both ways instead of latching.
      expect(goods.isExpensive()).assertFalse();
      goods.price = new Money(500000);
      expect(goods.isExpensive()).assertTrue();
      expect(goods.price.cents()).assertEqual(500000);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0700
     * @tc.name      goods_is_expensive_at_the_maximum_safe_price_070
     * @tc.desc      Verify goods is expensive at the maximum safe price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_is_expensive_at_the_maximum_safe_price_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_is_expensive_at_the_maximum_safe_price_070');
      let goods: Goods = new Goods(147, 'Ceiling Item', 'maximum price', 'basic_label',
        // The top of the exact-integer range still compares cleanly against the 500000 line.
        new Money(Number.MAX_SAFE_INTEGER), CATEGORY_PHONE);
      expect(goods.price.cents()).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(goods.isExpensive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0710
     * @tc.name      goods_is_not_expensive_after_a_price_drop_below_the_threshold_071
     * @tc.desc      Verify goods is not expensive after a price drop below the threshold.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_is_not_expensive_after_a_price_drop_below_the_threshold_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_is_not_expensive_after_a_price_drop_below_the_threshold_071');
      let goods: Goods = new Goods(148, 'Discounted Item', 'price drop', 'basic_label',
        new Money(600000), CATEGORY_PHONE);
      expect(goods.isExpensive()).assertTrue();
      goods.price = new Money(499999);
      expect(goods.isExpensive()).assertFalse();
      expect(goods.price.cents()).assertEqual(499999);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0720
     * @tc.name      goods_price_of_4999_yuan_is_not_expensive_072
     * @tc.desc      Verify goods price of 4999 yuan is not expensive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_price_of_4999_yuan_is_not_expensive_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_price_of_4999_yuan_is_not_expensive_072');
      let goods: Goods = new Goods(149, 'Whole Yuan Item', 'unit probe', 'basic_label',
        Money.ofYuan(4999), CATEGORY_APPLIANCE);
      expect(goods.price.cents()).assertEqual(499900);
      expect(goods.isExpensive()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0730
     * @tc.name      goods_is_expensive_at_the_threshold_built_from_cents_073
     * @tc.desc      Verify goods is expensive at the threshold built from cents.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_is_expensive_at_the_threshold_built_from_cents_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_is_expensive_at_the_threshold_built_from_cents_073');
      let goods: Goods = new Goods(150, 'Cent Threshold Item', 'cent probe', 'basic_label',
        new Money(500000), CATEGORY_APPLIANCE);
      expect(goods.price.cents()).assertEqual(500000);
      expect(goods.isExpensive()).assertTrue();
      expect(goods.price.isZero()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0740
     * @tc.name      goods_keyword_matches_a_single_non_title_field_074
     * @tc.desc      Verify goods keyword matches a single non title field.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_keyword_matches_a_single_non_title_field_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_keyword_matches_a_single_non_title_field_074');
      // Row 0 lives only in info, row 1 only in the label, row 2 only in the category; no title match.
      let keywords: string[] = ['daylight', 'limited', 'appliances'];
      let infos: string[] = ['warm daylight bulb', 'plain info', 'plain info'];
      let labels: string[] = ['basic_label', 'limited_offer', 'basic_label'];
      let categories: string[] = [CATEGORY_APPLIANCE, CATEGORY_APPLIANCE, CATEGORY_APPLIANCE];
      expect(keywords.length).assertEqual(infos.length);
      for (let index: number = 0; index < keywords.length; index++) {
        let goods: Goods = new Goods(115 + index, 'Studio Lamp', infos[index], labels[index],
          new Money(1000), categories[index]);
        expect(goods.matchesKeyword(keywords[index])).assertTrue();
        expect(goods.title.toLowerCase().indexOf(keywords[index]) < 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_GOODS_MODEL_0750
     * @tc.name      goods_search_text_preserves_field_order_and_lowercase_075
     * @tc.desc      Verify goods search text preserves field order and lowercase.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('goods_search_text_preserves_field_order_and_lowercase_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: goods_search_text_preserves_field_order_and_lowercase_075');
      let titles: string[] = ['Alpha', 'UPPER'];
      let infos: string[] = ['Beta', 'MIXED Case'];
      let labels: string[] = ['Gamma', 'LABEL'];
      let categories: string[] = ['Delta', 'CAT'];
      // The second row proves every capital, including the category, is lowered in the joined text.
      let expected: string[] = ['alpha beta gamma delta', 'upper mixed case label cat'];
      expect(titles.length).assertEqual(expected.length);
      for (let index: number = 0; index < titles.length; index++) {
        let goods: Goods = new Goods(130 + index, titles[index], infos[index], labels[index],
          new Money(1000), categories[index]);
        expect(goods.searchText()).assertEqual(expected[index]);
      }
    });

  });
}
