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
import { Catalog, Goods, SearchEngine } from '../Shared/ShopModel';
import { PRODUCTS, createGoods, defaultCatalog } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Allocates a new id array per call, safe to call inside a loop. */
function collectIds(items: Goods[]): number[] {
  let ids: number[] = [];
  for (let index: number = 0; index < items.length; index++) {
    ids.push(items[index].id);
  }
  return ids;
}

/** Category 'zzz' and 1000 cents; only title, info and labels vary. */
function rankGoods(id: number, title: string, info: string, labels: string): Goods {
  return createGoods(id, title, 1000, 'zzz', info, labels);
}

/** Title and info/labels are plain; only the category can match. */
function categoryGoods(id: number, category: string): Goods {
  return createGoods(id, 'Plain Item', 1000, category, 'plain', 'plain');
}

export default function searchRankingTest() {
  describe('OrangeShoppingSearchRanking', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'search ranking suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0010
     * @tc.name      rank_title_match_precedes_labels_match_001
     * @tc.desc      Verify rank title match precedes labels match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_title_match_precedes_labels_match_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_title_match_precedes_labels_match_001');
      let catalog: Catalog = new Catalog([
        rankGoods(1, 'Plain Item', 'plain', 'nova_label'),
        rankGoods(2, 'Nova Item', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      // A title hit is worth 3 points and a label hit 2, so the title row must lead the label-only row.
      expect(results.length).assertEqual(2);
      expect(results[0].title).assertEqual('Nova Item');
      expect(results[0].labels).assertEqual('plain');
      expect(results[1].labels.indexOf('nova') >= 0).assertTrue();
      expect(results[0].id === 2).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0020
     * @tc.name      rank_title_match_precedes_info_match_002
     * @tc.desc      Verify rank title match precedes info match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_title_match_precedes_info_match_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_title_match_precedes_info_match_002');
      let catalog: Catalog = new Catalog([
        rankGoods(3, 'Plain Item', 'nova detail', 'plain'),
        rankGoods(4, 'Nova Item', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect((collectIds(results)).length).assertEqual(([4, 3]).length);
      for (let __i366: number = 0; __i366 < ([4, 3]).length; __i366++) {
        expect((collectIds(results))[__i366]).assertEqual(([4, 3])[__i366]);
      }
      expect(results[0].title).assertEqual('Nova Item');
      expect(results[1].info).assertEqual('nova detail');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0030
     * @tc.name      rank_labels_match_precedes_info_match_003
     * @tc.desc      Verify rank labels match precedes info match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_labels_match_precedes_info_match_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_labels_match_precedes_info_match_003');
      let catalog: Catalog = new Catalog([
        rankGoods(5, 'Plain Item', 'nova detail', 'plain'),
        rankGoods(6, 'Plain Item', 'plain', 'nova_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect(results[0].id).assertEqual(6);
      expect(results[0].info).assertEqual('plain');
      expect(results[0].labels.indexOf('nova') >= 0).assertTrue();
      expect(results[1].id).assertEqual(5);
      expect(results[1].labels).assertEqual('plain');
      expect(results[1].info).assertEqual('nova detail');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0040
     * @tc.name      rank_title_match_precedes_category_match_004
     * @tc.desc      Verify rank title match precedes category match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_title_match_precedes_category_match_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_title_match_precedes_category_match_004');
      let catalog: Catalog = new Catalog([
        categoryGoods(7, 'nova_cat'),
        rankGoods(8, 'Nova Item', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect((collectIds(results)).length).assertEqual(([8, 7]).length);
      for (let __i367: number = 0; __i367 < ([8, 7]).length; __i367++) {
        expect((collectIds(results))[__i367]).assertEqual(([8, 7])[__i367]);
      }
      expect(results[0].title).assertEqual('Nova Item');
      expect(results[1].category).assertEqual('nova_cat');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0050
     * @tc.name      rank_info_match_precedes_category_match_005
     * @tc.desc      Verify rank info match precedes category match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_info_match_precedes_category_match_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_info_match_precedes_category_match_005');
      let catalog: Catalog = new Catalog([
        categoryGoods(9, 'nova_cat'),
        rankGoods(10, 'Plain Item', 'nova detail', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect((collectIds(results)).length).assertEqual(([10, 9]).length);
      for (let __i368: number = 0; __i368 < ([10, 9]).length; __i368++) {
        expect((collectIds(results))[__i368]).assertEqual(([10, 9])[__i368]);
      }
      expect(results[0].info).assertEqual('nova detail');
      expect(results[1].category).assertEqual('nova_cat');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0060
     * @tc.name      rank_field_priority_is_title_labels_info_category_006
     * @tc.desc      Verify rank field priority is title labels info category.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_field_priority_is_title_labels_info_category_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_field_priority_is_title_labels_info_category_006');
      let catalog: Catalog = new Catalog([
        categoryGoods(14, 'nova_cat'),
        rankGoods(13, 'Plain Item', 'nova detail', 'plain'),
        rankGoods(12, 'Plain Item', 'plain', 'nova_label'),
        rankGoods(11, 'Nova Item', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      // The four rows differ only in the field carrying 'nova', so the output follows weights 3, 2, 1, 0.
      expect((collectIds(results)).length).assertEqual(([11, 12, 13, 14]).length);
      for (let __i369: number = 0; __i369 < ([11, 12, 13, 14]).length; __i369++) {
        expect((collectIds(results))[__i369]).assertEqual(([11, 12, 13, 14])[__i369]);
      }
      expect(results[0].title).assertEqual('Nova Item');
      expect(results[3].category).assertEqual('nova_cat');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0070
     * @tc.name      rank_title_plus_labels_beats_title_plus_info_007
     * @tc.desc      Verify rank title plus labels beats title plus info.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_title_plus_labels_beats_title_plus_info_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_title_plus_labels_beats_title_plus_info_007');
      let catalog: Catalog = new Catalog([
        rankGoods(15, 'Nova Item', 'plain', 'nova_label'),
        rankGoods(16, 'Nova Item', 'nova detail', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      // Both titles score 3; labels then add 2 but info only 1, so the label row wins 5 to 4.
      expect((collectIds(results)).length).assertEqual(([15, 16]).length);
      for (let __i370: number = 0; __i370 < ([15, 16]).length; __i370++) {
        expect((collectIds(results))[__i370]).assertEqual(([15, 16])[__i370]);
      }
      expect(results[0].labels.indexOf('nova')).assertEqual(0);
      expect(results[1].info.indexOf('nova')).assertEqual(0);
      expect(results[0].info.indexOf('nova') >= 0).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0080
     * @tc.name      rank_labels_and_info_tie_with_title_only_008
     * @tc.desc      Verify rank labels and info tie with title only.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_labels_and_info_tie_with_title_only_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_labels_and_info_tie_with_title_only_008');
      let catalog: Catalog = new Catalog([
        rankGoods(17, 'Plain Item', 'nova detail', 'nova_label'),
        rankGoods(18, 'Nova Item', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect(results.length).assertEqual(2);
      // Labels plus info totals 2 + 1 = 3, tying the single title hit, so the earlier insertion (17) stays first.
      expect(results[1].title).assertEqual('Nova Item');
      expect(results[0].labels === 'nova_label').assertTrue();
      expect(results[0].info === 'nova detail').assertTrue();
      expect(results[0].title).assertEqual('Plain Item');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0090
     * @tc.name      rank_all_three_fields_outrank_partial_matches_009
     * @tc.desc      Verify rank all three fields outrank partial matches.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_all_three_fields_outrank_partial_matches_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_all_three_fields_outrank_partial_matches_009');
      let catalog: Catalog = new Catalog([
        rankGoods(21, 'Plain Item', 'nova detail', 'plain'),
        rankGoods(20, 'Nova Item', 'plain', 'nova_label'),
        rankGoods(19, 'Nova Item', 'nova detail', 'nova_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect((collectIds(results)).length).assertEqual(([19, 20, 21]).length);
      for (let __i371: number = 0; __i371 < ([19, 20, 21]).length; __i371++) {
        expect((collectIds(results))[__i371]).assertEqual(([19, 20, 21])[__i371]);
      }
      expect(results[0].info).assertEqual('nova detail');
      expect(results[0].labels).assertEqual('nova_label');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0100
     * @tc.name      rank_two_title_hits_accumulate_per_token_010
     * @tc.desc      Verify rank two title hits accumulate per token.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_two_title_hits_accumulate_per_token_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_two_title_hits_accumulate_per_token_010');
      let catalog: Catalog = new Catalog([
        rankGoods(23, 'Nova Item', 'kilo detail', 'plain'),
        rankGoods(22, 'Nova Kilo', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      // The title weight is paid once per token, so 'Nova Kilo' collects 3 + 3 against 'Nova Item' at 3.
      let kiloOnly: number[] = collectIds(engine.search('kilo'));
      let combined: Goods[] = engine.search('nova kilo');
      expect(kiloOnly.length).assertEqual(2);
      expect(kiloOnly[0]).assertEqual(22);
      expect(combined.length).assertEqual(2);
      expect(combined[0].id).assertEqual(22);
      expect(combined[1].id).assertEqual(23);
      expect(combined[0].id === kiloOnly[0]).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0110
     * @tc.name      rank_tokens_split_across_title_and_labels_011
     * @tc.desc      Verify rank tokens split across title and labels.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_tokens_split_across_title_and_labels_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_tokens_split_across_title_and_labels_011');
      let catalog: Catalog = new Catalog([
        rankGoods(24, 'Nova Item', 'plain', 'kilo_label'),
        rankGoods(25, 'Kilo Item', 'nova detail', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova kilo');
      expect(results.length).assertEqual(2);
      expect(results[0].searchText().indexOf('nova') >= 0).assertTrue();
      expect(results[0].searchText().indexOf('kilo') >= 0).assertTrue();
      expect(results[1].searchText().indexOf('kilo') >= 0).assertTrue();
      expect((collectIds(results)).length).assertEqual(([24, 25]).length);
      for (let __i372: number = 0; __i372 < ([24, 25]).length; __i372++) {
        expect((collectIds(results))[__i372]).assertEqual(([24, 25])[__i372]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0120
     * @tc.name      rank_repeated_word_in_title_counts_once_012
     * @tc.desc      Verify rank repeated word in title counts once.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_repeated_word_in_title_counts_once_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_repeated_word_in_title_counts_once_012');
      let catalog: Catalog = new Catalog([
        rankGoods(26, 'Nova Nova', 'plain', 'plain'),
        rankGoods(27, 'Nova Item', 'nova detail', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      // Repeating the token scales every row's score equally, so 27 keeps its info bonus and the order is unchanged.
      let repeated: number[] = collectIds(engine.search('nova nova'));
      let single: number[] = collectIds(engine.search('nova'));
      expect((repeated).length).assertEqual((single).length);
      for (let __i373: number = 0; __i373 < (single).length; __i373++) {
        expect((repeated)[__i373]).assertEqual((single)[__i373]);
      }
      expect(repeated.length).assertEqual(2);
      expect(repeated[0] > repeated[1]).assertTrue();
      expect(repeated[0]).assertEqual(27);
      expect(repeated[1]).assertEqual(26);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0130
     * @tc.name      rank_three_title_hits_outrank_distributed_hits_013
     * @tc.desc      Verify rank three title hits outrank distributed hits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_three_title_hits_outrank_distributed_hits_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_three_title_hits_outrank_distributed_hits_013');
      let catalog: Catalog = new Catalog([
        rankGoods(29, 'Nova Item', 'lima detail', 'kilo_label'),
        rankGoods(28, 'Nova Kilo Lima', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      // 28 earns 3 + 3 + 3 from its title, while 29 spreads the tokens over title, labels and info for 6.
      let results: Goods[] = engine.search('nova kilo lima');
      let baseline: Goods[] = engine.search('nova');
      expect(results[0].title).assertEqual('Nova Kilo Lima');
      expect(baseline[0].id).assertEqual(29);
      expect(results[0].id).assertEqual(28);
      expect(results[1].labels).assertEqual('kilo_label');
      expect(results.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0140
     * @tc.name      rank_equal_scores_keep_insertion_order_014
     * @tc.desc      Verify rank equal scores keep insertion order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_equal_scores_keep_insertion_order_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_equal_scores_keep_insertion_order_014');
      let firstCatalog: Catalog = new Catalog([
        rankGoods(31, 'Nova One', 'plain', 'plain'),
        rankGoods(32, 'Nova Two', 'plain', 'plain')
      ]);
      // The second catalog inserts 81 ahead of 80, so keeping 81 first rules out any id or title tiebreak.
      let secondCatalog: Catalog = new Catalog([
        rankGoods(81, 'Zulu Nova', 'plain', 'plain'),
        rankGoods(80, 'Alpha Nova', 'plain', 'plain')
      ]);
      let fixtures: Catalog[] = [firstCatalog, secondCatalog];
      let expected: number[][] = [[31, 32], [81, 80]];

      expect(fixtures.length).assertEqual(expected.length);
      for (let index: number = 0; index < fixtures.length; index++) {
        let engine: SearchEngine = new SearchEngine(fixtures[index]);
        let results: Goods[] = engine.search('nova');
        expect((collectIds(results)).length).assertEqual((expected[index]).length);
        for (let __i374: number = 0; __i374 < (expected[index]).length; __i374++) {
          expect((collectIds(results))[__i374]).assertEqual((expected[index])[__i374]);
        }
        expect(results[0].title).assertEqual(fixtures[index].all()[0].title);
        expect(results[1].title).assertEqual(fixtures[index].all()[1].title);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0150
     * @tc.name      rank_equal_info_scores_keep_source_order_triple_015
     * @tc.desc      Verify rank equal info scores keep source order triple.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_equal_info_scores_keep_source_order_triple_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_equal_info_scores_keep_source_order_triple_015');
      let catalog: Catalog = new Catalog([
        rankGoods(33, 'Plain One', 'nova detail', 'plain'),
        rankGoods(34, 'Plain Two', 'nova detail', 'plain'),
        rankGoods(35, 'Plain Three', 'nova detail', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect((collectIds(results)).length).assertEqual(([33, 34, 35]).length);
      for (let __i375: number = 0; __i375 < ([33, 34, 35]).length; __i375++) {
        expect((collectIds(results))[__i375]).assertEqual(([33, 34, 35])[__i375]);
      }
      expect(results.length).assertEqual(3);
      let __seen410: number[] = [];
      for (let __i410: number = 0; __i410 < (collectIds(results)).length; __i410++) {
        expect(__seen410.indexOf((collectIds(results))[__i410]) < 0).assertTrue();
        __seen410.push((collectIds(results))[__i410]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0160
     * @tc.name      rank_ties_do_not_sort_by_identifier_016
     * @tc.desc      Verify rank ties do not sort by identifier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_ties_do_not_sort_by_identifier_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_ties_do_not_sort_by_identifier_016');
      let catalog: Catalog = new Catalog([
        rankGoods(50, 'Nova Fifty', 'plain', 'plain'),
        rankGoods(40, 'Nova Forty', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect(results.length).assertEqual(2);
      expect(results[0].id > results[1].id).assertTrue();
      expect(collectIds(results)[0] === 40).assertFalse();
      expect(results[1].title).assertEqual('Nova Forty');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0170
     * @tc.name      rank_tie_groups_stay_ordered_inside_mixed_scores_017
     * @tc.desc      Verify rank tie groups stay ordered inside mixed scores.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_tie_groups_stay_ordered_inside_mixed_scores_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_tie_groups_stay_ordered_inside_mixed_scores_017');
      let catalog: Catalog = new Catalog([
        rankGoods(1, 'Plain One', 'nova detail', 'plain'),
        rankGoods(2, 'Nova Two', 'plain', 'plain'),
        rankGoods(3, 'Plain Three', 'nova detail', 'plain'),
        rankGoods(4, 'Nova Four', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect((collectIds(results)).length).assertEqual(([2, 4, 1, 3]).length);
      for (let __i376: number = 0; __i376 < ([2, 4, 1, 3]).length; __i376++) {
        expect((collectIds(results))[__i376]).assertEqual(([2, 4, 1, 3])[__i376]);
      }
      expect(results[0].title).assertEqual('Nova Two');
      expect(results[2].title).assertEqual('Plain One');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0180
     * @tc.name      rank_duplicate_titles_keep_catalog_order_018
     * @tc.desc      Verify rank duplicate titles keep catalog order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_duplicate_titles_keep_catalog_order_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_duplicate_titles_keep_catalog_order_018');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone');
      // Title hits 0, 1, 8, 9 lead; the Earbuds rows 6 and 14 match only through the phone category.
      expect((collectIds(results)).length).assertEqual(([0, 1, 8, 9, 6, 14]).length);
      for (let __i377: number = 0; __i377 < ([0, 1, 8, 9, 6, 14]).length; __i377++) {
        expect((collectIds(results))[__i377]).assertEqual(([0, 1, 8, 9, 6, 14])[__i377]);
      }
      expect(results[0].title).assertEqual(results[2].title);
      expect(results[1].title).assertEqual(results[3].title);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0190
     * @tc.name      rank_default_multi_keyword_orders_019
     * @tc.desc      Verify rank default multi keyword orders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_default_multi_keyword_orders_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_default_multi_keyword_orders_019');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let keywords: string[] = ['smart watch', 'tea', 'flagship', 'earbud'];
      let expectedIds: number[][] = [[2, 10], [4, 12], [0, 8], [6, 14]];
      let expectedTitle: string[] = ['Smart Watch Pro', 'Green Tea Pack', 'Harmony Phone One',
        'Wireless Earbuds'];
      expect(keywords.length).assertEqual(expectedIds.length);
      expect(expectedTitle.length).assertEqual(4);
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect((collectIds(results)).length).assertEqual((expectedIds[index]).length);
        for (let __i378: number = 0; __i378 < (expectedIds[index]).length; __i378++) {
          expect((collectIds(results))[__i378]).assertEqual((expectedIds[index])[__i378]);
        }
        expect(results[0].title).assertEqual(expectedTitle[index]);
        expect(results[results.length - 1].title).assertEqual(expectedTitle[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0200
     * @tc.name      rank_default_top_positions_020
     * @tc.desc      Verify rank default top positions.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_default_top_positions_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_default_top_positions_020');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      // For sport the title rows 3 and 11 lead, then the category-only rows 2 and 10 in catalog order.
      let keywords: string[] = ['phone', 'sport'];
      let topIds: number[][] = [[0, 1, 8, 9], [3, 11, 2, 10]];
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length >= topIds[index].length).assertTrue();
        for (let position: number = 0; position < 4; position++) {
          expect(results[position].id).assertEqual(topIds[index][position]);
        }
      }
      expect(engine.search('phone').length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0210
     * @tc.name      rank_default_phone_puts_category_entries_last_021
     * @tc.desc      Verify rank default phone puts category entries last.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_default_phone_puts_category_entries_last_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_default_phone_puts_category_entries_last_021');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone');
      let tail: Goods[] = results.slice(results.length - 2);
      expect(tail.length).assertEqual(2);
      for (let index: number = 0; index < tail.length; index++) {
        expect(tail[index].title).assertEqual('Wireless Earbuds');
        expect(tail[index].category).assertEqual('phone');
        expect(tail[index].labels.indexOf('phone') >= 0).assertFalse();
      }
      expect(results.indexOf(tail[0])).assertEqual(4);
      expect(tail[0].id).assertEqual(6);
      expect(tail[1].id).assertEqual(14);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0220
     * @tc.name      rank_default_sport_order_022
     * @tc.desc      Verify rank default sport order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_default_sport_order_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_default_sport_order_022');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('sport');
      expect((collectIds(results)).length).assertEqual(([3, 11, 2, 10]).length);
      for (let __i379: number = 0; __i379 < ([3, 11, 2, 10]).length; __i379++) {
        expect((collectIds(results))[__i379]).assertEqual(([3, 11, 2, 10])[__i379]);
      }
      let sportCategoryRows: number = 0;
      for (let index: number = 0; index < results.length; index++) {
        if (results[index].category === 'sport') {
          sportCategoryRows++;
        }
      }
      // All four hits carry category 'sport', including the two category-only rows 2 and 10.
      expect(sportCategoryRows).assertEqual(4);
      expect(results[2].title).assertEqual('Smart Watch Pro');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0230
     * @tc.name      rank_redundant_token_keeps_same_order_023
     * @tc.desc      Verify rank redundant token keeps same order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_redundant_token_keeps_same_order_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_redundant_token_keeps_same_order_023');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let single: Goods[] = engine.search('one');
      let paired: Goods[] = engine.search('phone one');
      expect((collectIds(paired)).length).assertEqual((collectIds(single)).length);
      for (let __i380: number = 0; __i380 < (collectIds(single)).length; __i380++) {
        expect((collectIds(paired))[__i380]).assertEqual((collectIds(single))[__i380]);
      }
      expect((collectIds(single)).length).assertEqual(([0, 1, 8, 9, 6, 14]).length);
      for (let __i381: number = 0; __i381 < ([0, 1, 8, 9, 6, 14]).length; __i381++) {
        expect((collectIds(single))[__i381]).assertEqual(([0, 1, 8, 9, 6, 14])[__i381]);
      }
      expect(paired.length).assertEqual(6);
      expect(paired[0].title).assertEqual('Harmony Phone One');
      expect(paired[paired.length - 1].title).assertEqual('Wireless Earbuds');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0240
     * @tc.name      rank_default_e_full_order_024
     * @tc.desc      Verify rank default e full order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_default_e_full_order_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_default_e_full_order_024');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('e');
      let ids: number[] = collectIds(results);
      // Every fixture product contains an 'e' somewhere, so the result spans all 16 catalog entries.
      expect(ids.length).assertEqual(PRODUCTS.length);
      expect(([ids[0], ids[1], ids[2]]).length).assertEqual(([0, 1, 4]).length);
      for (let __i382: number = 0; __i382 < ([0, 1, 4]).length; __i382++) {
        expect(([ids[0], ids[1], ids[2]])[__i382]).assertEqual(([0, 1, 4])[__i382]);
      }
      expect(([ids[ids.length - 2], ids[ids.length - 1]]).length).assertEqual(([7, 15]).length);
      for (let __i383: number = 0; __i383 < ([7, 15]).length; __i383++) {
        expect(([ids[ids.length - 2], ids[ids.length - 1]])[__i383]).assertEqual(([7, 15])[__i383]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0250
     * @tc.name      rank_default_e_top_score_group_025
     * @tc.desc      Verify rank default e top score group.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_default_e_top_score_group_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_default_e_top_score_group_025');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('e');
      let topIds: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        topIds.push(results[index].id);
      }
      expect((topIds).length).assertEqual(([0, 1, 4, 5, 6]).length);
      for (let __i384: number = 0; __i384 < ([0, 1, 4, 5, 6]).length; __i384++) {
        expect((topIds)[__i384]).assertEqual(([0, 1, 4, 5, 6])[__i384]);
      }
      expect(results.length).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0260
     * @tc.name      rank_default_e_medium_score_group_026
     * @tc.desc      Verify rank default e medium score group.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_default_e_medium_score_group_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_default_e_medium_score_group_026');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('e');
      let titles: string[] = [];
      for (let index: number = 10; index <= 11; index++) {
        titles.push(results[index].title);
      }
      expect((titles).length).assertEqual((['Sport Runner Shoes', 'Sport Runner Shoes']).length);
      for (let __i409: number = 0; __i409 < (['Sport Runner Shoes', 'Sport Runner Shoes']).length; __i409++) {
        expect((titles)[__i409]).assertEqual((['Sport Runner Shoes', 'Sport Runner Shoes'])[__i409]);
      }
      expect(results[10].id).assertEqual(3);
      expect(results[11].id).assertEqual(11);
      // The fixture is two blocks of eight products, so paired duplicates differ in id by exactly 8.
      expect(results[11].id - results[10].id).assertEqual(8);
      expect(results[10].category).assertEqual('sport');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0270
     * @tc.name      rank_default_e_low_score_group_027
     * @tc.desc      Verify rank default e low score group.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_default_e_low_score_group_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_default_e_title_and_label_group');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('e');
      expect(results[12].id).assertEqual(2);
      expect(results[13].id).assertEqual(10);
      expect(results[12].labels).assertEqual('new_product');
      expect(results[13].labels).assertEqual('new_product');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0280
     * @tc.name      rank_default_e_zero_weight_group_028
     * @tc.desc      Verify rank default e zero weight group.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_default_e_zero_weight_group_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_default_e_zero_weight_group_028');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('e');
      // Classic Shirt matches 'e' only through the men_wear category, worth 0, so both rows sink to the tail.
      let tail: Goods[] = results.slice(14);
      expect(tail.length).assertEqual(2);
      for (let index: number = 0; index < tail.length; index++) {
        expect(tail[index].category).assertEqual('men_wear');
        expect(tail[index].labels).assertEqual('discount');
        expect(tail[index].title).assertEqual('Classic Shirt');
      }
      expect((collectIds(tail)).length).assertEqual(([7, 15]).length);
      for (let __i385: number = 0; __i385 < ([7, 15]).length; __i385++) {
        expect((collectIds(tail))[__i385]).assertEqual(([7, 15])[__i385]);
      }
      expect(collectIds(tail).indexOf(7) >= 0).assertTrue();
      expect(collectIds(tail).indexOf(15) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0290
     * @tc.name      rank_default_two_token_orders_029
     * @tc.desc      Verify rank default two token orders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_default_two_token_orders_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_default_two_token_orders_029');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let keywords: string[] = ['watch', 'shoe', 'green tea', 'sport shoes'];
      let expectedIds: number[][] = [[2, 10], [3, 11], [4, 12], [3, 11]];
      let expectedTitle: string[] = ['Smart Watch Pro', 'Sport Runner Shoes', 'Green Tea Pack',
        'Sport Runner Shoes'];
      let expectedInfo: string[] = ['fitness watch', 'running shoes', 'organic tea', 'running shoes'];
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(2);
        expect((collectIds(results)).length).assertEqual((expectedIds[index]).length);
        for (let __i386: number = 0; __i386 < (expectedIds[index]).length; __i386++) {
          expect((collectIds(results))[__i386]).assertEqual((expectedIds[index])[__i386]);
        }
        expect(results[0].title).assertEqual(expectedTitle[index]);
        expect(results[0].info).assertEqual(expectedInfo[index]);
        expect(results[1].title).assertEqual(expectedTitle[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0300
     * @tc.name      rank_info_only_running_ties_keep_order_030
     * @tc.desc      Verify rank info only running ties keep order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_info_only_running_ties_keep_order_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_info_only_running_ties_keep_order_030');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('running');
      expect((collectIds(results)).length).assertEqual(([3, 11]).length);
      for (let __i387: number = 0; __i387 < ([3, 11]).length; __i387++) {
        expect((collectIds(results))[__i387]).assertEqual(([3, 11])[__i387]);
      }
      expect(results[0].info).assertEqual('running shoes');
      expect(results[0].price.cents()).assertEqual(results[1].price.cents());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0310
     * @tc.name      rank_info_only_organic_ties_keep_order_031
     * @tc.desc      Verify rank info only organic ties keep order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_info_only_organic_ties_keep_order_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_info_only_organic_ties_keep_order_031');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('organic');
      expect((collectIds(results)).length).assertEqual(([4, 12]).length);
      for (let __i388: number = 0; __i388 < ([4, 12]).length; __i388++) {
        expect((collectIds(results))[__i388]).assertEqual(([4, 12])[__i388]);
      }
      expect(results[0].info).assertEqual(results[1].info);
      expect(results[0].price.cents()).assertEqual(results[1].price.cents());
      expect(results[1].id - results[0].id).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0320
     * @tc.name      rank_label_group_new_product_order_032
     * @tc.desc      Verify rank label group new product order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_label_group_new_product_order_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_label_group_new_product_order_032');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('new_product');
      expect((collectIds(results)).length).assertEqual(([0, 2, 5, 8, 10, 13]).length);
      for (let __i389: number = 0; __i389 < ([0, 2, 5, 8, 10, 13]).length; __i389++) {
        expect((collectIds(results))[__i389]).assertEqual(([0, 2, 5, 8, 10, 13])[__i389]);
      }
      expect(results[0].labels).assertEqual('new_product');
      expect(results[5].labels).assertEqual('new_product');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0330
     * @tc.name      rank_label_group_hot_sale_order_033
     * @tc.desc      Verify rank label group hot sale order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_label_group_hot_sale_order_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_label_group_hot_sale_order_033');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('hot_sale');
      expect((collectIds(results)).length).assertEqual(([1, 4, 6, 9, 12, 14]).length);
      for (let __i390: number = 0; __i390 < ([1, 4, 6, 9, 12, 14]).length; __i390++) {
        expect((collectIds(results))[__i390]).assertEqual(([1, 4, 6, 9, 12, 14])[__i390]);
      }
      expect(results[0].id).assertEqual(1);
      expect(results[3].id).assertEqual(9);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0340
     * @tc.name      rank_label_group_discount_order_034
     * @tc.desc      Verify rank label group discount order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_label_group_discount_order_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_label_group_discount_order_034');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('discount');
      let __seen411: number[] = [];
      for (let __i411: number = 0; __i411 < (collectIds(results)).length; __i411++) {
        expect(__seen411.indexOf((collectIds(results))[__i411]) < 0).assertTrue();
        __seen411.push((collectIds(results))[__i411]);
      }
      expect((collectIds(results)).length).assertEqual(([3, 7, 11, 15]).length);
      for (let __i391: number = 0; __i391 < ([3, 7, 11, 15]).length; __i391++) {
        expect((collectIds(results))[__i391]).assertEqual(([3, 7, 11, 15])[__i391]);
      }
      let shirtRows: number = 0;
      for (let index: number = 0; index < results.length; index++) {
        if (results[index].title === 'Classic Shirt') {
          shirtRows++;
        }
      }
      expect(shirtRows).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0350
     * @tc.name      rank_category_group_men_wear_order_035
     * @tc.desc      Verify rank category group men wear order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_category_group_men_wear_order_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_category_group_men_wear_order_035');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('men_wear');
      expect(results.length).assertEqual(2);
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].category).assertEqual('men_wear');
        expect(results[index].labels).assertEqual('discount');
        expect(results[index].title).assertEqual('Classic Shirt');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0360
     * @tc.name      rank_info_and_category_group_appliance_order_036
     * @tc.desc      Verify rank info and category group appliance order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_info_and_category_group_appliance_order_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_info_and_category_group_appliance_order_036');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('appliance');
      expect((collectIds(results)).length).assertEqual(([5, 13]).length);
      for (let __i392: number = 0; __i392 < ([5, 13]).length; __i392++) {
        expect((collectIds(results))[__i392]).assertEqual(([5, 13])[__i392]);
      }
      expect(results[0].info).assertEqual('home appliance');
      expect(results[1].category).assertEqual('appliances');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0370
     * @tc.name      rank_three_token_harmony_phone_one_order_037
     * @tc.desc      Verify rank three token harmony phone one order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_three_token_harmony_phone_one_order_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_three_token_harmony_phone_one_order_037');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('harmony phone one');
      // Search ANDs the tokens, so the two Phone rows survive twice (ids 0/1 and 8/9) as duplicate blocks.
      expect(results.length).assertEqual(4);
      expect((collectIds(results)).length).assertEqual(([0, 1, 8, 9]).length);
      for (let __i393: number = 0; __i393 < ([0, 1, 8, 9]).length; __i393++) {
        expect((collectIds(results))[__i393]).assertEqual(([0, 1, 8, 9])[__i393]);
      }
      let tokens: string[] = ['harmony', 'phone', 'one'];
      for (let resultIndex: number = 0; resultIndex < results.length; resultIndex++) {
        for (let tokenIndex: number = 0; tokenIndex < tokens.length; tokenIndex++) {
          expect(results[resultIndex].searchText().indexOf(tokens[tokenIndex]) >= 0).assertTrue();
        }
      }
      expect(results[0].title).assertEqual('Harmony Phone One');
      expect(results[3].title).assertEqual('Harmony Phone Two');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0380
     * @tc.name      rank_top_phone_item_is_title_match_038
     * @tc.desc      Verify rank top phone item is title match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_top_phone_item_is_title_match_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_top_phone_item_is_title_match_038');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone');
      expect(results[0].id).assertEqual(0);
      expect(results[0].title).assertEqual('Harmony Phone One');
      expect(results[0].price.cents()).assertEqual(499900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0390
     * @tc.name      rank_top_tea_item_is_title_match_039
     * @tc.desc      Verify rank top tea item is title match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_top_tea_item_is_title_match_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_top_tea_item_is_title_match_039');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('tea');
      expect(results[0].id).assertEqual(4);
      expect(results[0].title).assertEqual('Green Tea Pack');
      expect(results[0].info).assertEqual('organic tea');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0400
     * @tc.name      rank_top_hot_sale_item_is_first_catalog_entry_040
     * @tc.desc      Verify rank top hot sale item is first catalog entry.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_top_hot_sale_item_is_first_catalog_entry_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_top_hot_sale_item_is_first_catalog_entry_040');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('hot_sale');
      expect(results[0].id).assertEqual(1);
      expect(results[0].labels).assertEqual('hot_sale');
      expect(results[0].title).assertEqual('Harmony Phone Two');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0410
     * @tc.name      rank_top_kitchen_item_is_title_match_041
     * @tc.desc      Verify rank top kitchen item is title match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_top_kitchen_item_is_title_match_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_top_kitchen_item_is_title_match_041');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('kitchen');
      expect(results[0].id).assertEqual(5);
      expect(results[0].title).assertEqual('Kitchen Blender');
      expect(results[0].category).assertEqual('appliances');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0420
     * @tc.name      rank_top_discount_item_is_first_catalog_entry_042
     * @tc.desc      Verify rank top discount item is first catalog entry.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_top_discount_item_is_first_catalog_entry_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_top_discount_item_is_first_catalog_entry_042');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('discount');
      expect(results[0].id).assertEqual(3);
      expect(results[0].title).assertEqual('Sport Runner Shoes');
      expect(results[0].labels).assertEqual('discount');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0430
     * @tc.name      rank_source_catalog_order_unchanged_043
     * @tc.desc      Verify rank source catalog order unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_source_catalog_order_unchanged_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_source_catalog_order_unchanged_043');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: number[] = catalog.ids();
      let originalFirst: number = before[0];
      let originalLast: number = before[before.length - 1];
      // Three searches run before ids() is read again, proving ranking never reorders the source catalog.
      engine.search('phone');
      engine.search('e');
      engine.search('new_product');
      let after: number[] = catalog.ids();
      expect((after).length).assertEqual((before).length);
      for (let __i394: number = 0; __i394 < (before).length; __i394++) {
        expect((after)[__i394]).assertEqual((before)[__i394]);
      }
      expect(before.length).assertEqual(PRODUCTS.length);
      expect(before[0]).assertEqual(originalFirst);
      expect(before[before.length - 1]).assertEqual(originalLast);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0440
     * @tc.name      rank_source_catalog_titles_unchanged_044
     * @tc.desc      Verify rank source catalog titles unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_source_catalog_titles_unchanged_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_source_catalog_titles_unchanged_044');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: string[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        before.push(catalog.all()[index].title);
      }
      engine.search('sport');
      let after: string[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        after.push(catalog.all()[index].title);
      }

      expect(after.length).assertEqual(before.length);
      for (let index: number = 0; index < before.length; index++) {
        expect(after[index]).assertEqual(before[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0450
     * @tc.name      rank_source_catalog_prices_unchanged_045
     * @tc.desc      Verify rank source catalog prices unchanged.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_source_catalog_prices_unchanged_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_source_catalog_prices_unchanged_045');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: number[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        before.push(catalog.all()[index].price.cents());
      }
      engine.search('e');
      engine.search('shoe');
      let after: number[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        after.push(catalog.all()[index].price.cents());
      }
      expect((after).length).assertEqual((before).length);
      for (let __i395: number = 0; __i395 < (before).length; __i395++) {
        expect((after)[__i395]).assertEqual((before)[__i395]);
      }
      expect(before[0]).assertEqual(499900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0460
     * @tc.name      rank_result_count_for_phone_is_six_046
     * @tc.desc      Verify rank result count for phone is six.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_result_count_for_phone_is_six_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_result_count_for_phone_is_six_046');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone');
      expect(results.length).assertEqual(6);
      expect(results.length).assertEqual(6);
      let __seen412: number[] = [];
      for (let __i412: number = 0; __i412 < (collectIds(results)).length; __i412++) {
        expect(__seen412.indexOf((collectIds(results))[__i412]) < 0).assertTrue();
        __seen412.push((collectIds(results))[__i412]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0470
     * @tc.name      rank_result_count_for_sport_is_four_047
     * @tc.desc      Verify rank result count for sport is four.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_result_count_for_sport_is_four_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_result_count_for_sport_is_four_047');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('sport');
      expect(results.length).assertEqual(4);
      expect(results.length).assertEqual(4);
      expect(results[3].title).assertEqual('Smart Watch Pro');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0480
     * @tc.name      rank_result_has_no_duplicate_identifiers_048
     * @tc.desc      Verify rank result has no duplicate identifiers.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_result_has_no_duplicate_identifiers_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_result_has_no_duplicate_identifiers_048');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone');
      let ids: number[] = collectIds(results);
      let __seen413: number[] = [];
      for (let __i413: number = 0; __i413 < (ids).length; __i413++) {
        expect(__seen413.indexOf((ids)[__i413]) < 0).assertTrue();
        __seen413.push((ids)[__i413]);
      }
      expect(ids.length).assertEqual(results.length);
      expect(ids[0]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0490
     * @tc.name      rank_result_is_subset_of_catalog_049
     * @tc.desc      Verify rank result is subset of catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_result_is_subset_of_catalog_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_result_is_subset_of_catalog_049');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('e');
      let catalogIds: number[] = catalog.ids();
      for (let index: number = 0; index < results.length; index++) {
        expect(catalogIds.indexOf(results[index].id) >= 0).assertTrue();
      }
      expect(results.length).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0500
     * @tc.name      rank_uppercase_keyword_keeps_order_050
     * @tc.desc      Verify rank uppercase keyword keeps order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_uppercase_keyword_keeps_order_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_uppercase_keyword_keeps_order_050');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      // search() lowercases the whole keyword up front, so PHONE must reproduce the phone id sequence exactly.
      let lower: number[] = collectIds(engine.search('phone'));
      let upper: number[] = collectIds(engine.search('PHONE'));
      expect((upper).length).assertEqual((lower).length);
      for (let __i396: number = 0; __i396 < (lower).length; __i396++) {
        expect((upper)[__i396]).assertEqual((lower)[__i396]);
      }
      expect((lower).length).assertEqual(([0, 1, 8, 9, 6, 14]).length);
      for (let __i397: number = 0; __i397 < ([0, 1, 8, 9, 6, 14]).length; __i397++) {
        expect((lower)[__i397]).assertEqual(([0, 1, 8, 9, 6, 14])[__i397]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0510
     * @tc.name      rank_padded_keyword_keeps_order_051
     * @tc.desc      Verify rank padded keyword keeps order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_padded_keyword_keeps_order_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_padded_keyword_keeps_order_051');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      // Leading and trailing spaces are trimmed before tokenizing, leaving the four-row sport order intact.
      let plain: number[] = collectIds(engine.search('sport'));
      let padded: number[] = collectIds(engine.search('   sport   '));
      expect((padded).length).assertEqual((plain).length);
      for (let __i398: number = 0; __i398 < (plain).length; __i398++) {
        expect((padded)[__i398]).assertEqual((plain)[__i398]);
      }
      expect((plain).length).assertEqual(([3, 11, 2, 10]).length);
      for (let __i399: number = 0; __i399 < ([3, 11, 2, 10]).length; __i399++) {
        expect((plain)[__i399]).assertEqual(([3, 11, 2, 10])[__i399]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0520
     * @tc.name      rank_partial_and_keyword_returns_empty_052
     * @tc.desc      Verify rank partial and keyword returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_partial_and_keyword_returns_empty_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_partial_and_keyword_returns_empty_052');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      // Tokens are ANDed: phone and watch never co-occur, so the pair is empty although each alone matches.
      let combined: Goods[] = engine.search('phone watch');
      let phones: Goods[] = engine.search('phone');
      let watches: Goods[] = engine.search('watch');
      expect(combined.length).assertEqual(0);
      expect(phones.length).assertEqual(6);
      expect(watches.length).assertEqual(2);
      expect(phones.length === 0).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0530
     * @tc.name      rank_reversed_disjoint_keyword_returns_empty_053
     * @tc.desc      Verify rank reversed disjoint keyword returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_reversed_disjoint_keyword_returns_empty_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_reversed_disjoint_keyword_returns_empty_053');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('watch phone');
      expect(results.length).assertEqual(0);
      expect(results.length > 0).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0540
     * @tc.name      rank_unknown_keyword_returns_empty_054
     * @tc.desc      Verify rank unknown keyword returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_unknown_keyword_returns_empty_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_unknown_keyword_returns_empty_054');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('tablet');
      expect(results.length).assertEqual(0);
      expect(results.length).assertEqual(0);
      let after: Goods[] = engine.search('phone');
      expect(after.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0550
     * @tc.name      rank_single_match_is_first_and_last_055
     * @tc.desc      Verify rank single match is first and last.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_single_match_is_first_and_last_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_single_match_is_first_and_last_055');
      let catalog: Catalog = new Catalog([
        rankGoods(60, 'Solo Nova', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect(results.length).assertEqual(1);
      expect(results[0].id).assertEqual(60);
      expect(results[0].id).assertEqual(results[results.length - 1].id);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0560
     * @tc.name      rank_custom_four_tiers_order_056
     * @tc.desc      Verify rank custom four tiers order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_custom_four_tiers_order_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_custom_four_tiers_order_056');
      let catalog: Catalog = new Catalog([
        rankGoods(74, 'Plain Item', 'nova detail', 'plain'),
        rankGoods(73, 'Plain Item', 'nova detail', 'nova_label'),
        rankGoods(72, 'Nova Item', 'nova detail', 'plain'),
        rankGoods(71, 'Nova Item', 'plain', 'nova_label'),
        rankGoods(70, 'Nova Item', 'nova detail', 'nova_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect((collectIds(results)).length).assertEqual(([70, 71, 72, 73, 74]).length);
      for (let __i400: number = 0; __i400 < ([70, 71, 72, 73, 74]).length; __i400++) {
        expect((collectIds(results))[__i400]).assertEqual(([70, 71, 72, 73, 74])[__i400]);
      }
      expect(results[4].info).assertEqual('nova detail');
      expect(results.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0570
     * @tc.name      rank_custom_category_group_keeps_source_order_057
     * @tc.desc      Verify rank custom category group keeps source order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_custom_category_group_keeps_source_order_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_custom_category_group_keeps_source_order_057');
      let catalog: Catalog = new Catalog([
        categoryGoods(91, 'nova_cat'),
        categoryGoods(90, 'nova_cat')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect((collectIds(results)).length).assertEqual(([91, 90]).length);
      for (let __i401: number = 0; __i401 < ([91, 90]).length; __i401++) {
        expect((collectIds(results))[__i401]).assertEqual(([91, 90])[__i401]);
      }
      expect(results[0].category).assertEqual('nova_cat');
      expect(results[1].category).assertEqual('nova_cat');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0580
     * @tc.name      rank_zero_weight_token_does_not_widen_result_058
     * @tc.desc      Verify rank zero weight token does not widen result.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_zero_weight_token_does_not_widen_result_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_zero_weight_token_does_not_widen_result_058');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      // sport appears only in the category of rows 2 and 10, which scores nothing, so the result cannot widen.
      let watchOnly: number[] = collectIds(engine.search('watch'));
      let combined: number[] = collectIds(engine.search('watch sport'));
      expect((combined).length).assertEqual((watchOnly).length);
      for (let __i402: number = 0; __i402 < (watchOnly).length; __i402++) {
        expect((combined)[__i402]).assertEqual((watchOnly)[__i402]);
      }
      expect(combined.length > watchOnly.length).assertFalse();
      expect(combined.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0590
     * @tc.name      rank_classic_group_order_059
     * @tc.desc      Verify rank classic group order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_classic_group_order_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_classic_group_order_059');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('classic');
      expect((collectIds(results)).length).assertEqual(([7, 15]).length);
      for (let __i403: number = 0; __i403 < ([7, 15]).length; __i403++) {
        expect((collectIds(results))[__i403]).assertEqual(([7, 15])[__i403]);
      }
      expect(results[0].title).assertEqual('Classic Shirt');
      expect(results[1].id - results[0].id).assertEqual(8);
      expect(results[1].category).assertEqual('men_wear');
      expect(results[0].category === 'classic').assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0600
     * @tc.name      rank_blender_group_order_060
     * @tc.desc      Verify rank blender group order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_blender_group_order_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_blender_group_order_060');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('blender');
      expect((collectIds(results)).length).assertEqual(([5, 13]).length);
      for (let __i404: number = 0; __i404 < ([5, 13]).length; __i404++) {
        expect((collectIds(results))[__i404]).assertEqual(([5, 13])[__i404]);
      }
      expect(results[0].title).assertEqual('Kitchen Blender');
      expect(results[0].id).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0610
     * @tc.name      rank_home_group_order_061
     * @tc.desc      Verify rank home group order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_home_group_order_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_home_group_order_061');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('home');
      expect(results.length).assertEqual(2);
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].info).assertEqual('home appliance');
        expect(results[index].category).assertEqual('appliances');
      }
      expect((collectIds(results)).length).assertEqual(([5, 13]).length);
      for (let __i405: number = 0; __i405 < ([5, 13]).length; __i405++) {
        expect((collectIds(results))[__i405]).assertEqual(([5, 13])[__i405]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0620
     * @tc.name      rank_single_label_hit_beats_repeated_info_hit_062
     * @tc.desc      Verify rank single label hit beats repeated info hit.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_single_label_hit_beats_repeated_info_hit_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_single_label_hit_beats_repeated_info_hit_062');
      let catalog: Catalog = new Catalog([
        rankGoods(92, 'Plain Item', 'nova nova detail', 'plain'),
        rankGoods(93, 'Plain Item', 'plain', 'nova_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      // A field is counted once however many times the token appears, so labels 2 still beats the doubled info's 1.
      expect((collectIds(results)).length).assertEqual(([93, 92]).length);
      for (let __i406: number = 0; __i406 < ([93, 92]).length; __i406++) {
        expect((collectIds(results))[__i406]).assertEqual(([93, 92])[__i406]);
      }
      expect(results[0].labels).assertEqual('nova_label');
      expect(results[1].info).assertEqual('nova nova detail');
      expect(results.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0630
     * @tc.name      rank_title_match_survives_idle_source_position_063
     * @tc.desc      Verify rank title match survives idle source position.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_title_match_survives_idle_source_position_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_title_match_survives_idle_source_position_063');
      let catalog: Catalog = new Catalog([
        rankGoods(95, 'Plain Item', 'plain', 'plain'),
        rankGoods(96, 'Plain Item', 'plain', 'plain'),
        rankGoods(97, 'Nova Tail', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect(results.length).assertEqual(1);
      expect(results[0].id).assertEqual(97);
      expect(results[0].title).assertEqual('Nova Tail');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0640
     * @tc.name      rank_only_matched_goods_enter_the_result_064
     * @tc.desc      Verify rank only matched goods enter the result.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_only_matched_goods_enter_the_result_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_only_matched_goods_enter_the_result_064');
      let catalog: Catalog = new Catalog([
        rankGoods(98, 'Nova One', 'plain', 'plain'),
        rankGoods(99, 'Nova Two', 'plain', 'plain'),
        rankGoods(100, 'Unrelated Item', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect((collectIds(results)).length).assertEqual(([98, 99]).length);
      for (let __i407: number = 0; __i407 < ([98, 99]).length; __i407++) {
        expect((collectIds(results))[__i407]).assertEqual(([98, 99])[__i407]);
      }
      expect(collectIds(results).indexOf(100) >= 0).assertFalse();
      expect(results.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0650
     * @tc.name      rank_not_null_for_every_result_065
     * @tc.desc      Verify rank not null for every result.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_not_null_for_every_result_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_not_null_for_every_result_065');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('new_product');
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index] !== null && results[index] !== undefined).assertTrue();
        expect(results[index].id >= 0).assertTrue();
      }
      expect(results.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_RANKING_0660
     * @tc.name      rank_token_order_does_not_change_the_result_066
     * @tc.desc      Verify rank token order does not change the result.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('rank_token_order_does_not_change_the_result_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: rank_token_order_does_not_change_the_result_066');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let keywords: string[] = ['watch sport', 'sport watch'];
      expect(keywords.length).assertEqual(2);
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect((collectIds(results)).length).assertEqual(([2, 10]).length);
        for (let __i408: number = 0; __i408 < ([2, 10]).length; __i408++) {
          expect((collectIds(results))[__i408]).assertEqual(([2, 10])[__i408]);
        }
        expect(results.length).assertEqual(2);
        expect(results[0].title).assertEqual('Smart Watch Pro');
      }
    });

  });
}
