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
import { createGoods, defaultCatalog } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Insertion-sorted id copy, independent of the engine's tie order. */
function sortedIds(items: Goods[]): number[] {
  let ids: number[] = [];
  for (let index: number = 0; index < items.length; index++) {
    ids.push(items[index].id);
  }
  for (let outer: number = 1; outer < ids.length; outer++) {
    let current: number = ids[outer];
    let inner: number = outer - 1;
    while (inner >= 0 && ids[inner] > current) {
      ids[inner + 1] = ids[inner];
      inner--;
    }
    ids[inner + 1] = current;
  }
  return ids;
}

/** One character repeated count times, for the 40/41/80/120 cases. */
function repeatedCharacter(character: string, count: number): string {
  let text: string = '';
  for (let index: number = 0; index < count; index++) {
    text += character;
  }
  return text;
}

export default function searchEdgeTest() {
  describe('OrangeShoppingSearchEdge', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'search edge suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0010
     * @tc.name      edge_long_token_lists_ignore_padding_001
     * @tc.desc      Verify edge long token lists ignore padding.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_long_token_lists_ignore_padding_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_long_token_lists_ignore_padding_001');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let keywords: string[] = ['harmony phone one flagship phone',
        '  harmony   phone  one  flagship  new_product  phone  '];
      // Trim plus empty-token skipping turns both spellings into the same five
      // requirements, so each must rank ids 0 and 8 in that order.
      let expected: number[][] = [[0, 8], [0, 8]];
      expect(keywords.length).assertEqual(expected.length);
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(2);
        expect((sortedIds(results)).length).assertEqual((expected[index]).length);
        for (let __i237: number = 0; __i237 < (expected[index]).length; __i237++) {
          expect((sortedIds(results))[__i237]).assertEqual((expected[index])[__i237]);
        }
        expect(results[0].title).assertEqual('Harmony Phone One');
        expect(results[1].labels).assertEqual('new_product');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0020
     * @tc.name      edge_very_long_single_token_empty_002
     * @tc.desc      Verify edge very long single token empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_very_long_single_token_empty_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_very_long_single_token_empty_002');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      // No fixture row contains a 120-character word, so the single token finds nothing.
      let keyword: string = repeatedCharacter('a', 120);
      let results: Goods[] = engine.search(keyword);
      expect(results.length).assertEqual(0);
      expect(results.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0030
     * @tc.name      edge_long_custom_title_searchable_003
     * @tc.desc      Verify edge long custom title searchable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_long_custom_title_searchable_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_long_custom_title_searchable_003');
      let longTitle: string = 'Alpha Beta Gamma Delta Epsilon Zeta Eta Theta Iota Kappa ' +
        'Lambda Mu Nu Xi Omicron Pi Rho Sigma Tau Upsilon Phi Chi Psi Omega Quasar';
      let catalog: Catalog = new Catalog([
        createGoods(640, longTitle, 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('quasar');
      expect(results.length).assertEqual(1);
      expect(results[0].title).assertEqual(longTitle);
      expect(results[0].title.indexOf('Quasar') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0040
     * @tc.name      edge_long_custom_info_searchable_004
     * @tc.desc      Verify edge long custom info searchable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_long_custom_info_searchable_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_long_custom_info_searchable_004');
      let longInfo: string = 'plain start ' + repeatedCharacter('detail ', 12) + 'quasar end';
      let catalog: Catalog = new Catalog([
        createGoods(641, 'Long Info Item', 1000, 'zzz', longInfo, 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('quasar');
      expect(results.length).assertEqual(1);
      expect(results[0].info.indexOf('quasar') >= 0).assertTrue();
      expect(results[0].id).assertEqual(641);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0050
     * @tc.name      edge_long_multi_token_matches_duplicate_pair_005
     * @tc.desc      Verify edge long multi token matches duplicate pair.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_long_multi_token_matches_duplicate_pair_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_long_multi_token_matches_duplicate_pair_005');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('harmony phone one flagship new_product phone');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([0, 8]).length);
      for (let __i238: number = 0; __i238 < ([0, 8]).length; __i238++) {
        expect((sortedIds(results))[__i238]).assertEqual(([0, 8])[__i238]);
      }
      let labelled: number = 0;
      for (let index: number = 0; index < results.length; index++) {
        if (results[index].labels === 'new_product') {
          labelled++;
        }
      }
      expect(labelled).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0060
     * @tc.name      edge_punctuation_titles_keep_raw_tokens_006
     * @tc.desc      Verify edge punctuation titles keep raw tokens.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_punctuation_titles_keep_raw_tokens_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_punctuation_titles_keep_raw_tokens_006');
      let ids: number[] = [620, 623, 653, 664, 671];
      let titles: string[] = ['C++ Primer', 'A/B Test', '***', '50% Off', 'Phone (2024)'];
      let keywords: string[] = ['c++', 'a/b', '***', '50%', '(2024)'];
      let fragments: string[] = ['c++', 'a/b', '***', '50%', '(2024)'];

      expect(ids.length).assertEqual(titles.length);
      expect(keywords.length).assertEqual(fragments.length);
      // Each keyword embeds its symbol, so a hit proves the raw symbol survives
      // into searchText instead of being dropped as a separator.
      for (let index: number = 0; index < ids.length; index++) {
        let catalog: Catalog = new Catalog([
          createGoods(ids[index], titles[index], 1000, 'zzz', 'plain', 'plain')
        ]);
        let engine: SearchEngine = new SearchEngine(catalog);
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(1);
        expect(results[0].title).assertEqual(titles[index]);
        expect(results[0].searchText().indexOf(fragments[index]) >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0070
     * @tc.name      edge_custom_title_with_parentheses_007
     * @tc.desc      Verify edge custom title with parentheses.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_title_with_parentheses_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_title_with_parentheses_007');
      let catalog: Catalog = new Catalog([
        createGoods(621, 'Phone (2024)', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('2024');
      expect(results.length).assertEqual(1);
      expect(results[0].id).assertEqual(621);
      expect(results[0].title.indexOf('2024') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0080
     * @tc.name      edge_custom_title_with_dot_008
     * @tc.desc      Verify edge custom title with dot.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_title_with_dot_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_title_with_dot_008');
      let catalog: Catalog = new Catalog([
        createGoods(622, 'Version 1.0', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('1.0');
      expect(results.length).assertEqual(1);
      expect(results[0].title).assertEqual('Version 1.0');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0090
     * @tc.name      edge_underscore_matches_label_group_009
     * @tc.desc      Verify edge underscore matches label group.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_underscore_matches_label_group_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_underscore_matches_label_group_009');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('_');
      // Twelve labelled rows carry '_' in their label, and the two 'men_wear'
      // rows add one more each through the category, while plain discount rows stay out.
      expect(results.length).assertEqual(14);
      expect(sortedIds(results).indexOf(0) >= 0).assertTrue();
      expect(sortedIds(results).indexOf(12) >= 0).assertTrue();
      expect(sortedIds(results).indexOf(3) >= 0).assertFalse();
      expect(results[0].labels.indexOf('_') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0100
     * @tc.name      edge_custom_label_with_hyphen_010
     * @tc.desc      Verify edge custom label with hyphen.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_label_with_hyphen_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_label_with_hyphen_010');
      let catalog: Catalog = new Catalog([
        createGoods(624, 'Plain Item', 1000, 'zzz', 'plain', 'sale-off')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('sale-off');
      expect(results.length).assertEqual(1);
      expect(results[0].labels).assertEqual('sale-off');
      expect(results[0].id).assertEqual(624);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0110
     * @tc.name      edge_custom_info_with_ampersand_011
     * @tc.desc      Verify edge custom info with ampersand.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_info_with_ampersand_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_info_with_ampersand_011');
      let catalog: Catalog = new Catalog([
        createGoods(625, 'Plain Item', 1000, 'zzz', 'R&D ready', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('r&d');
      expect(results.length).assertEqual(1);
      expect(results[0].info).assertEqual('R&D ready');
      expect(results[0].info.indexOf('&') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0120
     * @tc.name      edge_custom_category_with_hyphen_012
     * @tc.desc      Verify edge custom category with hyphen.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_category_with_hyphen_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_category_with_hyphen_012');
      let catalog: Catalog = new Catalog([
        createGoods(626, 'Plain Item', 1000, 'cat-9', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('cat-9');
      expect(results.length).assertEqual(1);
      expect(results[0].category).assertEqual('cat-9');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0130
     * @tc.name      edge_symbol_titles_keep_raw_fragments_013
     * @tc.desc      Verify edge symbol titles keep raw fragments.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_symbol_titles_keep_raw_fragments_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_symbol_titles_keep_raw_fragments_013');
      let ids: number[] = [627, 628, 654, 656, 663];
      let titles: string[] = ['Price $99', 'shop@example.com', 'Ready?', '___', 'Tea, Green'];
      let keywords: string[] = ['$99', 'shop@example.com', 'ready?', '_', 'tea,'];
      let fragments: string[] = ['$', '@', '?', '_', ','];

      expect(ids.length).assertEqual(keywords.length);
      for (let index: number = 0; index < titles.length; index++) {
        let catalog: Catalog = new Catalog([
          createGoods(ids[index], titles[index], 1000, 'zzz', 'plain', 'plain')
        ]);
        let engine: SearchEngine = new SearchEngine(catalog);
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(1);
        expect(results[0].title).assertEqual(titles[index]);
        expect(results[0].searchText().indexOf(fragments[index]) >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0140
     * @tc.name      edge_inner_and_trailing_whitespace_normalized_014
     * @tc.desc      Verify edge inner and trailing whitespace normalized.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_inner_and_trailing_whitespace_normalized_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_inner_and_trailing_whitespace_normalized_014');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let keywords: string[] = ['green     tea', 'green\t tea'];
      // A literal tab is not a space, so the token keeps it until matchesKeyword
      // trims each token; both rows must still resolve to ids 4 and 12.
      let expected: number[][] = [[4, 12], [4, 12]];
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(2);
        expect((sortedIds(results)).length).assertEqual((expected[index]).length);
        for (let __i239: number = 0; __i239 < (expected[index]).length; __i239++) {
          expect((sortedIds(results))[__i239]).assertEqual((expected[index])[__i239]);
        }
        expect(results[1].info).assertEqual('organic tea');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0150
     * @tc.name      edge_padded_three_spaces_match_015
     * @tc.desc      Verify edge padded three spaces match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_padded_three_spaces_match_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_padded_three_spaces_match_015');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('  green   tea  ');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([4, 12]).length);
      for (let __i240: number = 0; __i240 < ([4, 12]).length; __i240++) {
        expect((sortedIds(results))[__i240]).assertEqual(([4, 12])[__i240]);
      }
      expect(results[1].info).assertEqual('organic tea');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0160
     * @tc.name      edge_triple_space_in_three_token_family_016
     * @tc.desc      Verify edge triple space in three token family.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_triple_space_in_three_token_family_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_triple_space_in_three_token_family_016');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('harmony   phone   one');
      expect(results.length).assertEqual(4);
      expect((sortedIds(results)).length).assertEqual(([0, 1, 8, 9]).length);
      for (let __i241: number = 0; __i241 < ([0, 1, 8, 9]).length; __i241++) {
        expect((sortedIds(results))[__i241]).assertEqual(([0, 1, 8, 9])[__i241]);
      }
      // All three words sit in one title, yet the AND pass must emit each goods
      // at most once, so the collected ids have to stay duplicate-free.
      let __seen256: number[] = [];
      for (let __i256: number = 0; __i256 < (sortedIds(results)).length; __i256++) {
        expect(__seen256.indexOf((sortedIds(results))[__i256]) < 0).assertTrue();
        __seen256.push((sortedIds(results))[__i256]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0170
     * @tc.name      edge_non_english_keywords_return_empty_017
     * @tc.desc      Verify edge non english keywords return empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_non_english_keywords_return_empty_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_non_english_keywords_return_empty_017');
      let keywords: string[] = ['茶', '手机', 'ｐｈｏｎｅ', '，'];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      // Full-width letters and the ideographic comma are distinct code points,
      // so none of them can appear in the ASCII catalogue text.
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(0);
        expect(results.length).assertEqual(0);
      }
      // Six 'phone' rows confirm the empty answers come from these keywords
      // rather than from an engine that stopped matching.
      expect(engine.search('phone').length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0180
     * @tc.name      edge_category_substring_men_returns_shirts_018
     * @tc.desc      Verify edge category substring men returns shirts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_category_substring_men_returns_shirts_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_category_substring_men_returns_shirts_018');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('men');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([7, 15]).length);
      for (let __i242: number = 0; __i242 < ([7, 15]).length; __i242++) {
        expect((sortedIds(results))[__i242]).assertEqual(([7, 15])[__i242]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].title.toLowerCase().indexOf('men') < 0).assertTrue();
        expect(results[index].info.toLowerCase().indexOf('men') < 0).assertTrue();
        expect(results[index].labels.toLowerCase().indexOf('men') < 0).assertTrue();
        expect(results[index].category.toLowerCase().indexOf('men') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0190
     * @tc.name      edge_category_only_custom_match_is_isolated_019
     * @tc.desc      Verify edge category only custom match is isolated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_category_only_custom_match_is_isolated_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_category_only_custom_match_is_isolated_019');
      let catalog: Catalog = new Catalog([
        createGoods(630, 'Plain Item', 1000, 'orbit_cat', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('orbit');
      expect(results.length).assertEqual(1);
      expect(results[0].category).assertEqual('orbit_cat');
      expect(results[0].title.toLowerCase().indexOf('orbit') < 0).assertTrue();
      expect(results[0].info.toLowerCase().indexOf('orbit') < 0).assertTrue();
      expect(results[0].labels.toLowerCase().indexOf('orbit') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0200
     * @tc.name      edge_results_are_catalog_references_020
     * @tc.desc      Verify edge results are catalog references.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_results_are_catalog_references_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_results_are_catalog_references_020');
      let catalog: Catalog = new Catalog([
        createGoods(600, 'Referred Item', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('referred');
      expect(results.length).assertEqual(1);
      // search() returns the catalogued instance rather than a copy, so writing
      // sales through the result must be observable via byId.
      results[0].sales = 77;
      let stored: Goods | undefined = catalog.byId(600);
      expect(stored !== null && stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.sales).assertEqual(77);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0210
     * @tc.name      edge_result_array_mutation_leaves_catalog_size_021
     * @tc.desc      Verify edge result array mutation leaves catalog size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_result_array_mutation_leaves_catalog_size_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_result_array_mutation_leaves_catalog_size_021');
      let catalog: Catalog = new Catalog([
        createGoods(601, 'Bulk Item One', 1000, 'zzz', 'plain', 'plain'),
        createGoods(602, 'Bulk Item Two', 1000, 'zzz', 'plain', 'plain'),
        createGoods(603, 'Bulk Item Three', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('bulk');
      expect(results.length).assertEqual(3);
      // splice only shortens the freshly built result array; the catalogue's own
      // list is untouched, so count stays at three.
      results.splice(0, 2);
      expect(results.length).assertEqual(1);
      expect(catalog.count()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0220
     * @tc.name      edge_result_title_mutation_is_visible_in_catalog_022
     * @tc.desc      Verify edge result title mutation is visible in catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_result_title_mutation_is_visible_in_catalog_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_result_title_mutation_is_visible_in_catalog_022');
      let catalog: Catalog = new Catalog([
        createGoods(604, 'Mutable Title', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('mutable');
      expect(results.length).assertEqual(1);
      results[0].title = 'Renamed Title';
      expect(catalog.all()[0].title).assertEqual('Renamed Title');
      let renamed: Goods[] = engine.search('renamed');
      expect(renamed.length).assertEqual(1);
      expect(renamed[0].id).assertEqual(604);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0230
     * @tc.name      edge_result_arrays_are_fresh_between_calls_023
     * @tc.desc      Verify edge result arrays are fresh between calls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_result_arrays_are_fresh_between_calls_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_result_arrays_are_fresh_between_calls_023');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let first: Goods[] = engine.search('tea');
      // Emptying the first array is deliberately destructive: the second call
      // has to rebuild its own list of the two 'tea' rows from the catalogue.
      first.splice(0, 2);
      let second: Goods[] = engine.search('tea');
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(2);
      expect((sortedIds(second)).length).assertEqual(([4, 12]).length);
      for (let __i243: number = 0; __i243 < ([4, 12]).length; __i243++) {
        expect((sortedIds(second))[__i243]).assertEqual(([4, 12])[__i243]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0240
     * @tc.name      edge_repeated_padded_search_same_ids_024
     * @tc.desc      Verify edge repeated padded search same ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_repeated_padded_search_same_ids_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_repeated_padded_search_same_ids_024');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let first: number[] = sortedIds(engine.search('\tphone\t'));
      let second: number[] = sortedIds(engine.search('\tphone\t'));
      expect((second).length).assertEqual((first).length);
      for (let __i244: number = 0; __i244 < (first).length; __i244++) {
        expect((second)[__i244]).assertEqual((first)[__i244]);
      }
      expect((first).length).assertEqual(([0, 1, 6, 8, 9, 14]).length);
      for (let __i245: number = 0; __i245 < ([0, 1, 6, 8, 9, 14]).length; __i245++) {
        expect((first)[__i245]).assertEqual(([0, 1, 6, 8, 9, 14])[__i245]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0250
     * @tc.name      edge_interleaved_punctuation_then_normal_025
     * @tc.desc      Verify edge interleaved punctuation then normal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_interleaved_punctuation_then_normal_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_interleaved_punctuation_then_normal_025');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let punctuated: Goods[] = engine.search('tea!');
      let normal: Goods[] = engine.search('tea');
      // 'tea!' is looked up as one literal token, so it can never equal the
      // 'tea' stored in row 4 or 12; the clean call in between rules out a cache.
      let again: Goods[] = engine.search('tea!');
      expect(punctuated.length).assertEqual(0);
      expect(normal.length).assertEqual(2);
      expect(again.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0260
     * @tc.name      edge_duplicate_title_results_are_distinct_objects_026
     * @tc.desc      Verify edge duplicate title results are distinct objects.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_duplicate_title_results_are_distinct_objects_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_duplicate_title_results_are_distinct_objects_026');
      let catalog: Catalog = new Catalog([
        createGoods(610, 'Twin Item', 1000, 'zzz', 'plain', 'plain'),
        createGoods(611, 'Twin Item', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('twin');

      expect(results.length).assertEqual(2);
      // ids 610 and 611 share a title but are separate Goods objects, so the
      // sales write on the first result must leave the second at its 0 default.
      results[0].sales = 5;
      expect(results[0].sales).assertEqual(5);
      expect(results[1].sales).assertEqual(0);
      let first: Goods | undefined = catalog.byId(610);
      let second: Goods | undefined = catalog.byId(611);
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      if (first !== undefined) {
        expect(first.sales).assertEqual(5);
      }
      if (second !== undefined) {
        expect(second.sales).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0270
     * @tc.name      edge_result_mutation_keeps_catalog_order_027
     * @tc.desc      Verify edge result mutation keeps catalog order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_result_mutation_keeps_catalog_order_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_result_mutation_keeps_catalog_order_027');
      let catalog: Catalog = new Catalog([
        createGoods(612, 'Order Item One', 1000, 'zzz', 'plain', 'plain'),
        createGoods(613, 'Order Item Two', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: number[] = catalog.ids();
      let results: Goods[] = engine.search('order');
      results[0].stock = 1;
      let after: number[] = catalog.ids();
      expect((after).length).assertEqual((before).length);
      for (let __i246: number = 0; __i246 < (before).length; __i246++) {
        expect((after)[__i246]).assertEqual((before)[__i246]);
      }
      expect(catalog.count()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0280
     * @tc.name      edge_mixed_case_label_token_028
     * @tc.desc      Verify edge mixed case label token.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_mixed_case_label_token_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_mixed_case_label_token_028');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('HoT_SaLe TeA');
      expect(results.length).assertEqual(2);
      expect(results[0].labels).assertEqual('hot_sale');
      expect(results[0].title).assertEqual('Green Tea Pack');
      expect(results[1].searchText().indexOf('tea') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0290
     * @tc.name      edge_mixed_case_category_token_029
     * @tc.desc      Verify edge mixed case category token.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_mixed_case_category_token_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_mixed_case_category_token_029');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('sPoRt');
      expect(results.length).assertEqual(4);
      expect((sortedIds(results)).length).assertEqual(([2, 3, 10, 11]).length);
      for (let __i247: number = 0; __i247 < ([2, 3, 10, 11]).length; __i247++) {
        expect((sortedIds(results))[__i247]).assertEqual(([2, 3, 10, 11])[__i247]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].category).assertEqual('sport');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0300
     * @tc.name      edge_mixed_case_full_title_030
     * @tc.desc      Verify edge mixed case full title.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_mixed_case_full_title_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_mixed_case_full_title_030');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let mixed: Goods[] = engine.search('WiReLeSs EaRbUdS');
      let lower: Goods[] = engine.search('wireless earbuds');
      expect((sortedIds(mixed)).length).assertEqual((sortedIds(lower)).length);
      for (let __i248: number = 0; __i248 < (sortedIds(lower)).length; __i248++) {
        expect((sortedIds(mixed))[__i248]).assertEqual((sortedIds(lower))[__i248]);
      }
      expect((sortedIds(mixed)).length).assertEqual(([6, 14]).length);
      for (let __i249: number = 0; __i249 < ([6, 14]).length; __i249++) {
        expect((sortedIds(mixed))[__i249]).assertEqual(([6, 14])[__i249]);
      }
      expect(mixed[1].title).assertEqual(lower[1].title);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0310
     * @tc.name      edge_custom_token_hit_and_miss_pairs_031
     * @tc.desc      Verify edge custom token hit and miss pairs.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_token_hit_and_miss_pairs_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_token_hit_and_miss_pairs_031');
      let ids: number[] = [629, 655, 665];
      let titles: string[] = ['C++ Primer', 'A', 'V2 Phone'];
      let hits: string[] = ['primer', 'a', 'v2'];
      let misses: string[] = ['plus', 'b', 'v3'];

      expect(ids.length).assertEqual(titles.length);
      expect(hits.length).assertEqual(misses.length);
      // 'plus' never occurs in 'c++ primer', 'b' is not inside 'a', and 'v3' is
      // absent from 'v2 phone', so every miss must stay at zero hits.
      for (let index: number = 0; index < ids.length; index++) {
        let catalog: Catalog = new Catalog([
          createGoods(ids[index], titles[index], 1000, 'zzz', 'plain', 'plain')
        ]);
        let engine: SearchEngine = new SearchEngine(catalog);
        let found: Goods[] = engine.search(hits[index]);
        let absent: Goods[] = engine.search(misses[index]);
        expect(found.length).assertEqual(1);
        expect(found[0].title).assertEqual(titles[index]);
        expect(found[0].id).assertEqual(ids[index]);
        expect(absent.length).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0320
     * @tc.name      edge_underscore_combined_with_tea_032
     * @tc.desc      Verify edge underscore combined with tea.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_underscore_combined_with_tea_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_underscore_combined_with_tea_032');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('_ tea');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([4, 12]).length);
      for (let __i250: number = 0; __i250 < ([4, 12]).length; __i250++) {
        expect((sortedIds(results))[__i250]).assertEqual(([4, 12])[__i250]);
      }
      expect(results[0].title).assertEqual('Green Tea Pack');
      expect(results[0].labels.indexOf('_') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0330
     * @tc.name      edge_custom_leading_space_title_matches_033
     * @tc.desc      Verify edge custom leading space title matches.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_leading_space_title_matches_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_leading_space_title_matches_033');
      let catalog: Catalog = new Catalog([
        createGoods(650, ' Alpha', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('alpha');
      expect(results.length).assertEqual(1);
      expect(results[0].title).assertEqual(' Alpha');
      // Only the query is trimmed: the stored title keeps its leading space and
      // therefore six characters, not five.
      expect(results[0].title.length).assertEqual(6);
      expect(results[0].id).assertEqual(650);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0340
     * @tc.name      edge_custom_inner_double_space_title_matches_034
     * @tc.desc      Verify edge custom inner double space title matches.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_inner_double_space_title_matches_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_inner_double_space_title_matches_034');
      let catalog: Catalog = new Catalog([
        createGoods(651, 'Two  Spaces', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let doubled: Goods[] = engine.search('two  spaces');
      let single: Goods[] = engine.search('two spaces');
      expect(doubled.length).assertEqual(1);
      expect(single.length).assertEqual(1);
      expect(doubled[0].title).assertEqual('Two  Spaces');
      expect(single[0].title).assertEqual('Two  Spaces');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0350
     * @tc.name      edge_custom_info_sentence_word_match_035
     * @tc.desc      Verify edge custom info sentence word match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_info_sentence_word_match_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_info_sentence_word_match_035');
      let catalog: Catalog = new Catalog([
        createGoods(652, 'Plain Item', 1000, 'zzz', 'fast, reliable & safe', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('reliable');
      expect(results.length).assertEqual(1);
      expect(results[0].info.indexOf('reliable') >= 0).assertTrue();
      expect(results[0].title.toLowerCase().indexOf('reliable') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0360
     * @tc.name      edge_keyword_info_two_tokens_036
     * @tc.desc      Verify edge keyword info two tokens.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_keyword_info_two_tokens_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_keyword_info_two_tokens_036');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('organic tea');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([4, 12]).length);
      for (let __i251: number = 0; __i251 < ([4, 12]).length; __i251++) {
        expect((sortedIds(results))[__i251]).assertEqual(([4, 12])[__i251]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].info.toLowerCase().indexOf('organic') >= 0).assertTrue();
        expect(results[index].info.toLowerCase().indexOf('tea') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0370
     * @tc.name      edge_custom_slash_token_pair_037
     * @tc.desc      Verify edge custom slash token pair.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_slash_token_pair_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_slash_token_pair_037');
      let catalog: Catalog = new Catalog([
        createGoods(657, 'A/B Test', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('a/b test');
      expect(results.length).assertEqual(1);
      expect(results[0].searchText().indexOf('a/b') >= 0).assertTrue();
      expect(results[0].searchText().indexOf('test') >= 0).assertTrue();
      expect(results[0].id).assertEqual(657);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0380
     * @tc.name      edge_custom_repeated_character_title_038
     * @tc.desc      Verify edge custom repeated character title.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_repeated_character_title_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_repeated_character_title_038');
      let longWord: string = repeatedCharacter('x', 80);
      let catalog: Catalog = new Catalog([
        createGoods(658, longWord, 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search(longWord);
      expect(results.length).assertEqual(1);
      expect(results[0].title).assertEqual(longWord);
      expect(results[0].title.length).assertEqual(80);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0390
     * @tc.name      edge_result_order_stable_after_mutation_039
     * @tc.desc      Verify edge result order stable after mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_result_order_stable_after_mutation_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_result_order_stable_after_mutation_039');
      let catalog: Catalog = new Catalog([
        createGoods(659, 'Stable Item One', 1000, 'zzz', 'plain', 'plain'),
        createGoods(660, 'Stable Item Two', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: number[] = sortedIds(engine.search('stable'));
      let mutable: Goods[] = engine.search('stable');
      mutable[0].stock = 1;
      let after: number[] = sortedIds(engine.search('stable'));
      expect((after).length).assertEqual((before).length);
      for (let __i252: number = 0; __i252 < (before).length; __i252++) {
        expect((after)[__i252]).assertEqual((before)[__i252]);
      }
      expect((before).length).assertEqual(([659, 660]).length);
      for (let __i253: number = 0; __i253 < ([659, 660]).length; __i253++) {
        expect((before)[__i253]).assertEqual(([659, 660])[__i253]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0400
     * @tc.name      edge_custom_title_with_inner_tab_word_match_040
     * @tc.desc      Verify edge custom title with inner tab word match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_title_with_inner_tab_word_match_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_title_with_inner_tab_word_match_040');
      let catalog: Catalog = new Catalog([
        createGoods(661, 'Alpha\tBeta', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let first: Goods[] = engine.search('alpha');
      let second: Goods[] = engine.search('beta');
      expect(first.length).assertEqual(1);
      expect(second.length).assertEqual(1);
      expect(first[0].id).assertEqual(661);
      expect(second[0].id).assertEqual(661);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0410
     * @tc.name      edge_custom_title_with_inner_newline_word_match_041
     * @tc.desc      Verify edge custom title with inner newline word match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_title_with_inner_newline_word_match_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_title_with_inner_newline_word_match_041');
      let catalog: Catalog = new Catalog([
        createGoods(662, 'Alpha\nBeta', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('beta');
      expect(results.length).assertEqual(1);
      expect(results[0].title.indexOf('\n') > 0).assertTrue();
      expect(results[0].searchText().indexOf('alpha') >= 0).assertTrue();
      expect(results[0].searchText().indexOf('beta') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0420
     * @tc.name      edge_custom_long_category_match_042
     * @tc.desc      Verify edge custom long category match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_long_category_match_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_long_category_match_042');
      let longCategory: string = repeatedCharacter('c', 60);
      let catalog: Catalog = new Catalog([
        createGoods(666, 'Plain Item', 1000, longCategory, 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search(longCategory);
      expect(results.length).assertEqual(1);
      expect(results[0].category).assertEqual(longCategory);
      expect(results[0].title.toLowerCase().indexOf('cccc') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0430
     * @tc.name      edge_catalog_copy_mutation_is_independent_043
     * @tc.desc      Verify edge catalog copy mutation is independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_catalog_copy_mutation_is_independent_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_catalog_copy_mutation_is_independent_043');
      let catalog: Catalog = new Catalog([
        createGoods(667, 'Copy Item One', 1000, 'zzz', 'plain', 'plain'),
        createGoods(668, 'Copy Item Two', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let first: Goods[] = engine.search('copy');
      let copy: Goods[] = catalog.all();
      copy.splice(0, 2);
      let second: Goods[] = engine.search('copy');
      expect(first.length).assertEqual(2);
      expect(second.length).assertEqual(2);
      expect(catalog.count()).assertEqual(2);
      expect(copy.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0440
     * @tc.name      edge_custom_uppercase_category_match_044
     * @tc.desc      Verify edge custom uppercase category match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_uppercase_category_match_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_uppercase_category_match_044');
      let catalog: Catalog = new Catalog([
        createGoods(669, 'Plain Item', 1000, 'ORBIT_CAT', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('orbit');
      expect(results.length).assertEqual(1);
      expect(results[0].category).assertEqual('ORBIT_CAT');
      expect(results[0].title.toLowerCase().indexOf('orbit') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0450
     * @tc.name      edge_custom_repeated_case_title_once_045
     * @tc.desc      Verify edge custom repeated case title once.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_repeated_case_title_once_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_repeated_case_title_once_045');
      let catalog: Catalog = new Catalog([
        createGoods(670, 'Tea tea pack', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('tea');
      expect(results.length).assertEqual(1);
      expect(results[0].id).assertEqual(670);
      expect(results[0].title).assertEqual('Tea tea pack');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0460
     * @tc.name      edge_punctuation_and_unknown_keywords_return_empty_046
     * @tc.desc      Verify edge punctuation and unknown keywords return empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_punctuation_and_unknown_keywords_return_empty_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_punctuation_and_unknown_keywords_return_empty_046');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let keywords: string[] = [
        'harmony phone one flagship phone ultra',
        '!!!',
        '[]{}()',
        'harmony-phone',
        'har\tmony',
        'zzz qqq',
        'harmony;',
        'harmony ! phone'
      ];

      expect(keywords.length).assertEqual(8);
      // Glued punctuation, bare symbol runs and the absent word 'ultra' each
      // make at least one token unfindable, so all eight searches are empty.
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0470
     * @tc.name      edge_green_tea_variants_match_the_same_pair_047
     * @tc.desc      Verify edge green tea variants match the same pair.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_green_tea_variants_match_the_same_pair_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_green_tea_variants_match_the_same_pair_047');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let keywords: string[] = [
        'green   tea',
        'green \ttea',
        'green  tea  pack',
        'GrEeN tEa',
        '\tgreen tea\t',
        'green\t\t  tea'
      ];

      expect(keywords.length).assertEqual(6);
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(2);
        expect((sortedIds(results)).length).assertEqual(([4, 12]).length);
        for (let __i254: number = 0; __i254 < ([4, 12]).length; __i254++) {
          expect((sortedIds(results))[__i254]).assertEqual(([4, 12])[__i254]);
        }
        expect(results[0].title).assertEqual('Green Tea Pack');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0480
     * @tc.name      edge_custom_long_token_near_miss_empty_048
     * @tc.desc      Verify edge custom long token near miss empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_custom_long_token_near_miss_empty_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_custom_long_token_near_miss_empty_048');
      let longWord: string = repeatedCharacter('q', 40);
      let catalog: Catalog = new Catalog([
        createGoods(672, 'Target ' + longWord, 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      // A 41-character run is one 'q' longer than the 40-character title word,
      // so the near miss must fail while the exact word still matches.
      let miss: Goods[] = engine.search(repeatedCharacter('q', 41));
      let hit: Goods[] = engine.search(longWord);
      expect(miss.length).assertEqual(0);
      expect(hit.length).assertEqual(1);
      expect(hit[0].id).assertEqual(672);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_EDGE_0490
     * @tc.name      edge_punctuated_shared_fragment_keeps_order_049
     * @tc.desc      Verify edge punctuated shared fragment keeps order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('edge_punctuated_shared_fragment_keeps_order_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: edge_punctuated_shared_fragment_keeps_order_049');
      let catalog: Catalog = new Catalog([
        createGoods(673, 'Alpha+One', 1000, 'zzz', 'plain', 'plain'),
        createGoods(674, 'Beta+One', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('one');
      expect((sortedIds(results)).length).assertEqual(([673, 674]).length);
      for (let __i255: number = 0; __i255 < ([673, 674]).length; __i255++) {
        expect((sortedIds(results))[__i255]).assertEqual(([673, 674])[__i255]);
      }
      expect(results[0].title).assertEqual('Alpha+One');
      expect(results[1].id - results[0].id).assertEqual(1);
    });
  });
}
