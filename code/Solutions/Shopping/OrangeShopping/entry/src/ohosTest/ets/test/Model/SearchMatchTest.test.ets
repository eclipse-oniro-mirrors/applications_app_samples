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
import { EMPTY_KEYWORDS, PRODUCTS, SEARCH_KEYWORDS, UNKNOWN_KEYWORDS, createGoods, defaultCatalog } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

function collectIds(items: Goods[]): number[] {
  let ids: number[] = [];
  for (let index: number = 0; index < items.length; index++) {
    ids.push(items[index].id);
  }
  return ids;
}

function sortedIds(items: Goods[]): number[] {
  let ids: number[] = collectIds(items);
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

/** Independent count oracle for the row counts engine.search returns. */
function countBySearchText(items: Goods[], token: string): number {
  let total: number = 0;
  for (let index: number = 0; index < items.length; index++) {
    if (items[index].searchText().indexOf(token) >= 0) {
      total++;
    }
  }
  return total;
}

/** Non-overlapping matches; the cursor advances past each hit. */
function countOccurrences(text: string, token: string): number {
  let total: number = 0;
  let cursor: number = text.indexOf(token);
  while (cursor >= 0) {
    total++;
    cursor = text.indexOf(token, cursor + token.length);
  }
  return total;
}

export default function searchMatchTest() {
  describe('OrangeShoppingSearchMatch', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'search match suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0010
     * @tc.name      match_title_keyword_returns_tea_pair_001
     * @tc.desc      Verify match title keyword returns tea pair.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_title_keyword_returns_tea_pair_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_title_keyword_returns_tea_pair_001');
      // "tea" hits both Green Tea Pack rows, ids 4 and 12.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('tea');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([4, 12]).length);
      for (let __i311: number = 0; __i311 < ([4, 12]).length; __i311++) {
        expect((sortedIds(results))[__i311]).assertEqual(([4, 12])[__i311]);
      }
      expect(results[0].title).assertEqual('Green Tea Pack');
      expect(results[1].title).assertEqual('Green Tea Pack');
      expect(results[0].searchText().indexOf('tea') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0020
     * @tc.name      match_title_keyword_returns_harmony_family_002
     * @tc.desc      Verify match title keyword returns harmony family.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_title_keyword_returns_harmony_family_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_title_keyword_returns_harmony_family_002');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('harmony');
      expect(results.length).assertEqual(4);
      expect((sortedIds(results)).length).assertEqual(([0, 1, 8, 9]).length);
      for (let __i312: number = 0; __i312 < ([0, 1, 8, 9]).length; __i312++) {
        expect((sortedIds(results))[__i312]).assertEqual(([0, 1, 8, 9])[__i312]);
      }
      let titles: string[] = [];
      for (let index: number = 0; index < results.length; index++) {
        titles.push(results[index].title);
        expect(results[index].title.startsWith('Harmony')).assertTrue();
      }
      expect(titles.indexOf('Harmony Phone One') >= 0).assertTrue();
      expect(titles.indexOf('Harmony Phone Two') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0030
     * @tc.name      match_info_only_keyword_flagship_003
     * @tc.desc      Verify match info only keyword flagship.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_info_only_keyword_flagship_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_info_only_keyword_flagship_003');
      // "flagship" appears only in the info field, so every hit must fail a title search for it.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('flagship');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([0, 8]).length);
      for (let __i313: number = 0; __i313 < ([0, 8]).length; __i313++) {
        expect((sortedIds(results))[__i313]).assertEqual(([0, 8])[__i313]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].title.toLowerCase().indexOf('flagship') < 0).assertTrue();
        expect(results[index].info.toLowerCase().indexOf('flagship') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0040
     * @tc.name      match_info_keywords_cover_each_product_004
     * @tc.desc      Verify match info keywords cover each product.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_info_keywords_cover_each_product_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_info_keywords_cover_each_product_004');
      let keywords: string[] = ['organic', 'fitness', 'running', 'cotton', 'lite', 'noise', 'flagship'];
      let firstIds: number[] = [4, 2, 3, 7, 1, 6, 0];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(2);
        expect((sortedIds(results)).length).assertEqual(([firstIds[index], firstIds[index] + 8]).length);
        for (let __i314: number = 0; __i314 < ([firstIds[index], firstIds[index] + 8]).length; __i314++) {
          expect((sortedIds(results))[__i314]).assertEqual(([firstIds[index], firstIds[index] + 8])[__i314]);
        }
        expect(results[0].title.toLowerCase().indexOf(keywords[index]) < 0).assertTrue();
        expect(results[0].info.toLowerCase().indexOf(keywords[index]) >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0050
     * @tc.name      match_label_keyword_case_variants_005
     * @tc.desc      Verify match label keyword case variants.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_label_keyword_case_variants_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_label_keyword_case_variants_005');
      // new_product and NeW_PrOdUcT must reach the same six label rows with case-insensitive matching.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let variants: string[] = ['new_product', 'NeW_PrOdUcT'];
      let expected: number[] = [0, 2, 5, 8, 10, 13];
      for (let variantIndex: number = 0; variantIndex < variants.length; variantIndex++) {
        let results: Goods[] = engine.search(variants[variantIndex]);
        expect(results.length).assertEqual(6);
        expect((sortedIds(results)).length).assertEqual((expected).length);
        for (let __i315: number = 0; __i315 < (expected).length; __i315++) {
          expect((sortedIds(results))[__i315]).assertEqual((expected)[__i315]);
        }
        let __seen360: number[] = [];
        for (let __i360: number = 0; __i360 < (collectIds(results)).length; __i360++) {
          expect(__seen360.indexOf((collectIds(results))[__i360]) < 0).assertTrue();
          __seen360.push((collectIds(results))[__i360]);
        }
        for (let rowIndex: number = 0; rowIndex < results.length; rowIndex++) {
          expect(results[rowIndex].labels).assertEqual('new_product');
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0060
     * @tc.name      match_labels_keyword_hot_sale_006
     * @tc.desc      Verify match labels keyword hot sale.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_labels_keyword_hot_sale_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_labels_keyword_hot_sale_006');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('hot_sale');
      expect(results.length).assertEqual(6);
      expect((sortedIds(results)).length).assertEqual(([1, 4, 6, 9, 12, 14]).length);
      for (let __i316: number = 0; __i316 < ([1, 4, 6, 9, 12, 14]).length; __i316++) {
        expect((sortedIds(results))[__i316]).assertEqual(([1, 4, 6, 9, 12, 14])[__i316]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].labels).assertEqual('hot_sale');
        expect(results[index].title.toLowerCase().indexOf('hot_sale') < 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0070
     * @tc.name      match_labels_keyword_discount_007
     * @tc.desc      Verify match labels keyword discount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_labels_keyword_discount_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_labels_keyword_discount_007');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('discount');
      expect(results.length).assertEqual(4);
      expect((sortedIds(results)).length).assertEqual(([3, 7, 11, 15]).length);
      for (let __i317: number = 0; __i317 < ([3, 7, 11, 15]).length; __i317++) {
        expect((sortedIds(results))[__i317]).assertEqual(([3, 7, 11, 15])[__i317]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].labels).assertEqual('discount');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0080
     * @tc.name      match_label_substring_reaches_group_008
     * @tc.desc      Verify match label substring reaches group.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_label_substring_reaches_group_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_label_substring_reaches_group_008');
      // Both halves of the new_product label match as substrings, returning the same six ids.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let tokens: string[] = ['new', 'product'];
      let expected: number[] = [0, 2, 5, 8, 10, 13];
      expect(tokens.length).assertEqual(2);
      for (let tokenIndex: number = 0; tokenIndex < tokens.length; tokenIndex++) {
        let results: Goods[] = engine.search(tokens[tokenIndex]);
        expect((sortedIds(results)).length).assertEqual((expected).length);
        for (let __i318: number = 0; __i318 < (expected).length; __i318++) {
          expect((sortedIds(results))[__i318]).assertEqual((expected)[__i318]);
        }
        expect(results.length).assertEqual(6);
        for (let rowIndex: number = 0; rowIndex < results.length; rowIndex++) {
          expect(results[rowIndex].labels.indexOf('product') >= 0).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0090
     * @tc.name      match_label_substring_sale_reaches_hot_group_009
     * @tc.desc      Verify match label substring sale reaches hot group.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_label_substring_sale_reaches_hot_group_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_label_substring_sale_reaches_hot_group_009');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('sale');
      expect(results.length).assertEqual(6);
      expect((sortedIds(results)).length).assertEqual(([1, 4, 6, 9, 12, 14]).length);
      for (let __i319: number = 0; __i319 < ([1, 4, 6, 9, 12, 14]).length; __i319++) {
        expect((sortedIds(results))[__i319]).assertEqual(([1, 4, 6, 9, 12, 14])[__i319]);
      }
      expect(results[0].labels).assertEqual('hot_sale');
      expect(results[5].labels).assertEqual('hot_sale');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0100
     * @tc.name      match_category_phone_includes_category_only_entries_010
     * @tc.desc      Verify match category phone includes category only entries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_category_phone_includes_category_only_entries_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_category_phone_includes_category_only_entries_010');
      // Id 6 is category phone even though its title, info and labels never contain "phone".
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone');

      expect(results.length).assertEqual(6);
      expect((sortedIds(results)).length).assertEqual(([0, 1, 6, 8, 9, 14]).length);
      for (let __i320: number = 0; __i320 < ([0, 1, 6, 8, 9, 14]).length; __i320++) {
        expect((sortedIds(results))[__i320]).assertEqual(([0, 1, 6, 8, 9, 14])[__i320]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].category).assertEqual('phone');
      }
      let earbuds: Goods | undefined = undefined;
      for (let index: number = 0; index < results.length; index++) {
        if (results[index].id === 6) {
          earbuds = results[index];
        }
      }
      expect(earbuds !== null && earbuds !== undefined).assertTrue();
      if (earbuds !== undefined) {
        expect(earbuds.title.toLowerCase().indexOf('phone') < 0).assertTrue();
        expect(earbuds.info.toLowerCase().indexOf('phone') < 0).assertTrue();
        expect(earbuds.labels.toLowerCase().indexOf('phone') < 0).assertTrue();
        expect(earbuds.category.indexOf('phone') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0110
     * @tc.name      match_category_men_wear_returns_shirts_011
     * @tc.desc      Verify match category men wear returns shirts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_category_men_wear_returns_shirts_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_category_men_wear_returns_shirts_011');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('men_wear');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([7, 15]).length);
      for (let __i321: number = 0; __i321 < ([7, 15]).length; __i321++) {
        expect((sortedIds(results))[__i321]).assertEqual(([7, 15])[__i321]);
      }
      expect(results[0].title).assertEqual('Classic Shirt');
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].category).assertEqual('men_wear');
        expect(results[index].title.toLowerCase().indexOf('men_wear') < 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0120
     * @tc.name      match_category_appliances_returns_blenders_012
     * @tc.desc      Verify match category appliances returns blenders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_category_appliances_returns_blenders_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_category_appliances_returns_blenders_012');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('appliances');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([5, 13]).length);
      for (let __i322: number = 0; __i322 < ([5, 13]).length; __i322++) {
        expect((sortedIds(results))[__i322]).assertEqual(([5, 13])[__i322]);
      }
      expect(results[0].title).assertEqual('Kitchen Blender');
      expect(results[1].category).assertEqual('appliances');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0130
     * @tc.name      match_category_sport_returns_four_entries_013
     * @tc.desc      Verify match category sport returns four entries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_category_sport_returns_four_entries_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_category_sport_returns_four_entries_013');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('sport');
      expect(results.length).assertEqual(4);
      expect((sortedIds(results)).length).assertEqual(([2, 3, 10, 11]).length);
      for (let __i323: number = 0; __i323 < ([2, 3, 10, 11]).length; __i323++) {
        expect((sortedIds(results))[__i323]).assertEqual(([2, 3, 10, 11])[__i323]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].category).assertEqual('sport');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0140
     * @tc.name      match_info_and_category_home_returns_blenders_014
     * @tc.desc      Verify match info and category home returns blenders.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_info_and_category_home_returns_blenders_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_info_and_category_home_returns_blenders_014');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('home');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([5, 13]).length);
      for (let __i324: number = 0; __i324 < ([5, 13]).length; __i324++) {
        expect((sortedIds(results))[__i324]).assertEqual(([5, 13])[__i324]);
      }
      for (let index: number = 0; index < results.length; index++) {
        let infoHit: boolean = results[index].info.toLowerCase().indexOf('home') >= 0;
        let categoryHit: boolean = results[index].category.toLowerCase().indexOf('home') >= 0;
        expect(infoHit || categoryHit).assertTrue();
        expect(results[index].title.toLowerCase().indexOf('home') < 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0150
     * @tc.name      match_case_variants_return_same_identifier_set_015
     * @tc.desc      Verify match case variants return same identifier set.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_case_variants_return_same_identifier_set_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_case_variants_return_same_identifier_set_015');
      // phone, PHONE, Phone and pHoNe must all yield the same six ids as the lowercase baseline.
      let variants: string[] = ['phone', 'PHONE', 'Phone', 'pHoNe'];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let baseline: number[] = sortedIds(engine.search(variants[0]));
      for (let index: number = 0; index < variants.length; index++) {
        let current: number[] = sortedIds(engine.search(variants[index]));
        expect((current).length).assertEqual((baseline).length);
        for (let __i325: number = 0; __i325 < (baseline).length; __i325++) {
          expect((current)[__i325]).assertEqual((baseline)[__i325]);
        }
      }
      expect((baseline).length).assertEqual(([0, 1, 6, 8, 9, 14]).length);
      for (let __i326: number = 0; __i326 < ([0, 1, 6, 8, 9, 14]).length; __i326++) {
        expect((baseline)[__i326]).assertEqual(([0, 1, 6, 8, 9, 14])[__i326]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0160
     * @tc.name      match_uppercase_field_tokens_are_accepted_016
     * @tc.desc      Verify match uppercase field tokens are accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_uppercase_field_tokens_are_accepted_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_uppercase_field_tokens_are_accepted_016');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let labels: Goods[] = engine.search('HOT_SALE');
      let category: Goods[] = engine.search('MEN_WEAR');
      expect(labels.length).assertEqual(6);
      expect(category.length).assertEqual(2);
      expect((sortedIds(category)).length).assertEqual(([7, 15]).length);
      for (let __i327: number = 0; __i327 < ([7, 15]).length; __i327++) {
        expect((sortedIds(category))[__i327]).assertEqual(([7, 15])[__i327]);
      }
      expect(labels[0].labels).assertEqual('hot_sale');
      expect(category[0].category).assertEqual('men_wear');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0170
     * @tc.name      match_padding_around_keyword_ignored_017
     * @tc.desc      Verify match padding around keyword ignored.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_padding_around_keyword_ignored_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_padding_around_keyword_ignored_017');
      // Leading spaces, trailing spaces and tabs around "tea" must trim back to the 4/12 pair.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let variants: string[] = ['  tea', 'tea  ', '\ttea\t'];
      let expected: number[] = [4, 12];
      for (let index: number = 0; index < variants.length; index++) {
        let results: Goods[] = engine.search(variants[index]);
        expect(results.length).assertEqual(2);
        expect((sortedIds(results)).length).assertEqual((expected).length);
        for (let __i328: number = 0; __i328 < (expected).length; __i328++) {
          expect((sortedIds(results))[__i328]).assertEqual((expected)[__i328]);
        }
        expect(results[0].title).assertEqual('Green Tea Pack');
        expect(results[1].info).assertEqual('organic tea');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0180
     * @tc.name      match_surrounding_spaces_do_not_change_results_018
     * @tc.desc      Verify match surrounding spaces do not change results.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_surrounding_spaces_do_not_change_results_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_surrounding_spaces_do_not_change_results_018');
      let variants: string[] = ['phone', ' phone', 'phone ', '   phone   '];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let baseline: number[] = sortedIds(engine.search(variants[0]));
      for (let index: number = 0; index < variants.length; index++) {
        expect((sortedIds(engine.search(variants[index]))).length).assertEqual((baseline).length);
        for (let __i329: number = 0; __i329 < (baseline).length; __i329++) {
          expect((sortedIds(engine.search(variants[index])))[__i329]).assertEqual((baseline)[__i329]);
        }
      }
      expect(baseline.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0190
     * @tc.name      match_tab_padded_keyword_is_trimmed_019
     * @tc.desc      Verify match tab padded keyword is trimmed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_tab_padded_keyword_is_trimmed_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_tab_padded_keyword_is_trimmed_019');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('\tphone\t');
      expect(results.length).assertEqual(6);
      expect((sortedIds(results)).length).assertEqual(([0, 1, 6, 8, 9, 14]).length);
      for (let __i330: number = 0; __i330 < ([0, 1, 6, 8, 9, 14]).length; __i330++) {
        expect((sortedIds(results))[__i330]).assertEqual(([0, 1, 6, 8, 9, 14])[__i330]);
      }
      expect(results[0].title).assertEqual('Harmony Phone One');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0200
     * @tc.name      match_newline_padded_keyword_is_trimmed_020
     * @tc.desc      Verify match newline padded keyword is trimmed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_newline_padded_keyword_is_trimmed_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_newline_padded_keyword_is_trimmed_020');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('\nphone\n');
      expect(results.length).assertEqual(6);
      expect((sortedIds(results)).length).assertEqual(([0, 1, 6, 8, 9, 14]).length);
      for (let __i331: number = 0; __i331 < ([0, 1, 6, 8, 9, 14]).length; __i331++) {
        expect((sortedIds(results))[__i331]).assertEqual(([0, 1, 6, 8, 9, 14])[__i331]);
      }
      expect(results[5].title === 'Wireless Earbuds').assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0210
     * @tc.name      match_and_two_title_tokens_021
     * @tc.desc      Verify match and two title tokens.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_and_two_title_tokens_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_and_two_title_tokens_021');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('green tea');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([4, 12]).length);
      for (let __i332: number = 0; __i332 < ([4, 12]).length; __i332++) {
        expect((sortedIds(results))[__i332]).assertEqual(([4, 12])[__i332]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].title.toLowerCase().indexOf('green') >= 0).assertTrue();
        expect(results[index].title.toLowerCase().indexOf('tea') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0220
     * @tc.name      match_and_title_and_info_tokens_022
     * @tc.desc      Verify match and title and info tokens.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_and_title_and_info_tokens_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_and_title_and_info_tokens_022');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('watch fitness');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([2, 10]).length);
      for (let __i333: number = 0; __i333 < ([2, 10]).length; __i333++) {
        expect((sortedIds(results))[__i333]).assertEqual(([2, 10])[__i333]);
      }
      expect(results[0].title).assertEqual('Smart Watch Pro');
      expect(results[0].info).assertEqual('fitness watch');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0230
     * @tc.name      match_and_title_and_category_tokens_023
     * @tc.desc      Verify match and title and category tokens.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_and_title_and_category_tokens_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_and_title_and_category_tokens_023');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('watch sport');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([2, 10]).length);
      for (let __i334: number = 0; __i334 < ([2, 10]).length; __i334++) {
        expect((sortedIds(results))[__i334]).assertEqual(([2, 10])[__i334]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].category).assertEqual('sport');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0240
     * @tc.name      match_and_info_and_label_tokens_024
     * @tc.desc      Verify match and info and label tokens.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_and_info_and_label_tokens_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_and_info_and_label_tokens_024');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('tea hot_sale');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([4, 12]).length);
      for (let __i335: number = 0; __i335 < ([4, 12]).length; __i335++) {
        expect((sortedIds(results))[__i335]).assertEqual(([4, 12])[__i335]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].labels).assertEqual('hot_sale');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0250
     * @tc.name      match_and_two_valid_but_disjoint_tokens_025
     * @tc.desc      Verify match and two valid but disjoint tokens.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_and_two_valid_but_disjoint_tokens_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_and_two_valid_but_disjoint_tokens_025');
      // No product carries both tea and phone, so the AND of the two tokens is empty.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('tea phone');
      expect(results.length).assertEqual(0);
      expect(results.length > 0).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0260
     * @tc.name      match_and_three_tokens_all_present_026
     * @tc.desc      Verify match and three tokens all present.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_and_three_tokens_all_present_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_and_three_tokens_all_present_026');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('harmony phone one');
      expect(results.length).assertEqual(4);
      expect((sortedIds(results)).length).assertEqual(([0, 1, 8, 9]).length);
      for (let __i336: number = 0; __i336 < ([0, 1, 8, 9]).length; __i336++) {
        expect((sortedIds(results))[__i336]).assertEqual(([0, 1, 8, 9])[__i336]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].searchText().indexOf('harmony') >= 0).assertTrue();
        expect(results[index].searchText().indexOf('phone') >= 0).assertTrue();
        expect(results[index].searchText().indexOf('one') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0270
     * @tc.name      match_and_duplicate_token_still_unique_027
     * @tc.desc      Verify match and duplicate token still unique.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_and_duplicate_token_still_unique_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_and_duplicate_token_still_unique_027');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('tea tea');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([4, 12]).length);
      for (let __i337: number = 0; __i337 < ([4, 12]).length; __i337++) {
        expect((sortedIds(results))[__i337]).assertEqual(([4, 12])[__i337]);
      }
      let __seen361: number[] = [];
      for (let __i361: number = 0; __i361 < (collectIds(results)).length; __i361++) {
        expect(__seen361.indexOf((collectIds(results))[__i361]) < 0).assertTrue();
        __seen361.push((collectIds(results))[__i361]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0280
     * @tc.name      match_and_tokens_from_three_fields_028
     * @tc.desc      Verify match and tokens from three fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_and_tokens_from_three_fields_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_and_tokens_from_three_fields_028');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('new_product watch fitness');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([2, 10]).length);
      for (let __i338: number = 0; __i338 < ([2, 10]).length; __i338++) {
        expect((sortedIds(results))[__i338]).assertEqual(([2, 10])[__i338]);
      }
      expect(results[0].labels).assertEqual('new_product');
      expect(results[0].info).assertEqual('fitness watch');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0290
     * @tc.name      match_and_phone_one_keeps_category_matches_029
     * @tc.desc      Verify match and phone one keeps category matches.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_and_phone_one_keeps_category_matches_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_and_phone_one_keeps_category_matches_029');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone one');
      expect(results.length).assertEqual(6);
      expect((sortedIds(results)).length).assertEqual(([0, 1, 6, 8, 9, 14]).length);
      for (let __i339: number = 0; __i339 < ([0, 1, 6, 8, 9, 14]).length; __i339++) {
        expect((sortedIds(results))[__i339]).assertEqual(([0, 1, 6, 8, 9, 14])[__i339]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].searchText().indexOf('phone') >= 0).assertTrue();
        expect(results[index].searchText().indexOf('one') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0300
     * @tc.name      match_substring_fragments_across_word_positions_030
     * @tc.desc      Verify match substring fragments across word positions.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_substring_fragments_across_word_positions_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_substring_fragments_across_word_positions_030');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let keywords: string[] = ['sho', 'wat', 'nder'];
      let expected: number[][] = [[3, 11], [2, 10], [5, 13]];
      let titles: string[] = ['Sport Runner Shoes', 'Smart Watch Pro', 'Kitchen Blender'];
      expect(keywords.length).assertEqual(expected.length);
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(2);
        expect((sortedIds(results)).length).assertEqual((expected[index]).length);
        for (let __i340: number = 0; __i340 < (expected[index]).length; __i340++) {
          expect((sortedIds(results))[__i340]).assertEqual((expected[index])[__i340]);
        }
        expect(results[0].title).assertEqual(titles[index]);
        expect(results[0].title.toLowerCase().indexOf(keywords[index]) >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0310
     * @tc.name      match_substring_phon_matches_phone_group_031
     * @tc.desc      Verify match substring phon matches phone group.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_substring_phon_matches_phone_group_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_substring_phon_matches_phone_group_031');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phon');
      expect(results.length).assertEqual(6);
      expect((sortedIds(results)).length).assertEqual(([0, 1, 6, 8, 9, 14]).length);
      for (let __i341: number = 0; __i341 < ([0, 1, 6, 8, 9, 14]).length; __i341++) {
        expect((sortedIds(results))[__i341]).assertEqual(([0, 1, 6, 8, 9, 14])[__i341]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].searchText().indexOf('phon') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0320
     * @tc.name      match_substring_one_matches_inside_phone_032
     * @tc.desc      Verify match substring one matches inside phone.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_substring_one_matches_inside_phone_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_substring_one_matches_inside_phone_032');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let oneResults: Goods[] = engine.search('one');
      let oneIds: number[] = sortedIds(oneResults);
      let phoneIds: number[] = sortedIds(engine.search('phone'));

      expect((oneIds).length).assertEqual((phoneIds).length);
      for (let __i342: number = 0; __i342 < (phoneIds).length; __i342++) {
        expect((oneIds)[__i342]).assertEqual((phoneIds)[__i342]);
      }
      expect((oneIds).length).assertEqual(([0, 1, 6, 8, 9, 14]).length);
      for (let __i343: number = 0; __i343 < ([0, 1, 6, 8, 9, 14]).length; __i343++) {
        expect((oneIds)[__i343]).assertEqual(([0, 1, 6, 8, 9, 14])[__i343]);
      }
      let earbuds: Goods | undefined = undefined;
      for (let index: number = 0; index < oneResults.length; index++) {
        if (oneResults[index].id === 6) {
          earbuds = oneResults[index];
        }
      }
      expect(earbuds !== null && earbuds !== undefined).assertTrue();
      if (earbuds !== undefined) {
        expect(earbuds.title.toLowerCase().indexOf('one') < 0).assertTrue();
        expect(earbuds.category.indexOf('phone') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0330
     * @tc.name      match_substring_oes_matches_shoes_suffix_033
     * @tc.desc      Verify match substring oes matches shoes suffix.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_substring_oes_matches_shoes_suffix_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_substring_oes_matches_shoes_suffix_033');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('oes');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([3, 11]).length);
      for (let __i344: number = 0; __i344 < ([3, 11]).length; __i344++) {
        expect((sortedIds(results))[__i344]).assertEqual(([3, 11])[__i344]);
      }
      expect(results[0].title.toLowerCase().endsWith('oes')).assertTrue();
      expect(results[1].info).assertEqual('running shoes');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0340
     * @tc.name      match_single_letter_e_matches_all_products_034
     * @tc.desc      Verify match single letter e matches all products.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_single_letter_e_matches_all_products_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_single_letter_e_matches_all_products_034');
      // Every one of the 16 products contains an "e" somewhere in its searchable text.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('e');
      expect(results.length).assertEqual(PRODUCTS.length);
      let __seen362: number[] = [];
      for (let __i362: number = 0; __i362 < (collectIds(results)).length; __i362++) {
        expect(__seen362.indexOf((collectIds(results))[__i362]) < 0).assertTrue();
        __seen362.push((collectIds(results))[__i362]);
      }
      expect(collectIds(results).indexOf(0) >= 0).assertTrue();
      expect(collectIds(results).indexOf(15) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0350
     * @tc.name      match_single_letter_a_skips_sport_entries_035
     * @tc.desc      Verify match single letter a skips sport entries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_single_letter_a_skips_sport_entries_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_single_letter_a_skips_sport_entries_035');
      // The two Sport Runner Shoes rows (ids 3 and 11) contain no "a", leaving 14 of 16.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('a');
      let ids: number[] = collectIds(results);
      expect(ids.length).assertEqual(14);
      expect(ids.indexOf(3) >= 0).assertFalse();
      expect(ids.indexOf(11) >= 0).assertFalse();
      expect(ids.indexOf(7) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0360
     * @tc.name      match_single_letter_o_matches_every_product_036
     * @tc.desc      Verify match single letter o matches every product.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_single_letter_o_matches_every_product_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_single_letter_o_matches_every_product_036');
      // All 16 products contain an "o", so the single-letter search must not drop any row.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('o');
      expect(results.length).assertEqual(16);
      let __seen363: number[] = [];
      for (let __i363: number = 0; __i363 < (collectIds(results)).length; __i363++) {
        expect(__seen363.indexOf((collectIds(results))[__i363]) < 0).assertTrue();
        __seen363.push((collectIds(results))[__i363]);
      }
      expect(results[0].title).assertEqual('Harmony Phone One');
      expect(results[15].title).assertEqual('Classic Shirt');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0370
     * @tc.name      match_single_letter_u_matches_labels_and_titles_037
     * @tc.desc      Verify match single letter u matches labels and titles.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_single_letter_u_matches_labels_and_titles_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_single_letter_u_matches_labels_and_titles_037');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('u');
      expect(results.length).assertEqual(12);
      expect(collectIds(results).indexOf(6) >= 0).assertTrue();
      expect(results[0].labels).assertEqual('discount');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0380
     * @tc.name      match_empty_keywords_return_empty_038
     * @tc.desc      Verify match empty keywords return empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_empty_keywords_return_empty_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_empty_keywords_return_empty_038');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let first: Goods[] = engine.search(EMPTY_KEYWORDS[0]);
      expect(first.length).assertEqual(0);
      for (let index: number = 0; index < EMPTY_KEYWORDS.length; index++) {
        expect(engine.search(EMPTY_KEYWORDS[index]).length).assertEqual(0);
      }
      expect(engine.search('tea').length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0390
     * @tc.name      match_whitespace_combinations_return_empty_039
     * @tc.desc      Verify match whitespace combinations return empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_whitespace_combinations_return_empty_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_whitespace_combinations_return_empty_039');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let keywords: string[] = ['    ', '\t\t', '\n\n', ' \t '];
      for (let index: number = 0; index < keywords.length; index++) {
        expect(engine.search(keywords[index]).length).assertEqual(0);
      }
      expect(engine.search(' \t\n').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0400
     * @tc.name      match_unknown_keyword_list_returns_empty_040
     * @tc.desc      Verify match unknown keyword list returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_unknown_keyword_list_returns_empty_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_unknown_keyword_list_returns_empty_040');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let checked: number = 0;
      for (let index: number = 0; index < UNKNOWN_KEYWORDS.length; index++) {
        let results: Goods[] = engine.search(UNKNOWN_KEYWORDS[index]);
        expect(results.length).assertEqual(0);
        checked++;
      }
      expect(checked).assertEqual(UNKNOWN_KEYWORDS.length);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0410
     * @tc.name      match_numeric_keyword_absent_from_default_data_041
     * @tc.desc      Verify match numeric keyword absent from default data.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_numeric_keyword_absent_from_default_data_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_numeric_keyword_absent_from_default_data_041');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let keywords: string[] = ['2024', '0', '12', '999'];
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(0);
      }
      expect(engine.search('phone').length > 0).assertTrue();
      expect(engine.search('1').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0420
     * @tc.name      match_numeric_substring_in_custom_titles_042
     * @tc.desc      Verify match numeric substring in custom titles.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_numeric_substring_in_custom_titles_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_numeric_substring_in_custom_titles_042');
      // "12" is a substring of both Model 12 and Model 123.
      let catalog: Catalog = new Catalog([
        createGoods(100, 'Model 12', 1000, 'zzz', 'plain', 'plain'),
        createGoods(101, 'Model 123', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('12');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([100, 101]).length);
      for (let __i345: number = 0; __i345 < ([100, 101]).length; __i345++) {
        expect((sortedIds(results))[__i345]).assertEqual(([100, 101])[__i345]);
      }
      expect(results[0].title.indexOf('12') >= 0).assertTrue();
      expect(results[1].title.indexOf('12') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0430
     * @tc.name      match_numeric_exact_keyword_in_custom_titles_043
     * @tc.desc      Verify match numeric exact keyword in custom titles.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_numeric_exact_keyword_in_custom_titles_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_numeric_exact_keyword_in_custom_titles_043');
      // "123" only occurs inside Model 123, so Model 12 must be excluded.
      let catalog: Catalog = new Catalog([
        createGoods(100, 'Model 12', 1000, 'zzz', 'plain', 'plain'),
        createGoods(101, 'Model 123', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('123');
      expect(results.length).assertEqual(1);
      expect(collectIds(results)[0]).assertEqual(101);
      expect(results[0].title).assertEqual('Model 123');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0440
     * @tc.name      match_numeric_token_in_custom_info_044
     * @tc.desc      Verify match numeric token in custom info.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_numeric_token_in_custom_info_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_numeric_token_in_custom_info_044');
      let catalog: Catalog = new Catalog([
        createGoods(200, 'Gadget A', 1000, 'zzz', 'version 7 build', 'plain'),
        createGoods(201, 'Gadget B', 1000, 'zzz', 'version 7 build', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('7');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([200, 201]).length);
      for (let __i346: number = 0; __i346 < ([200, 201]).length; __i346++) {
        expect((sortedIds(results))[__i346]).assertEqual(([200, 201])[__i346]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].title.indexOf('7') < 0).assertTrue();
        expect(results[index].info.indexOf('7') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0450
     * @tc.name      match_full_title_returns_duplicate_pair_045
     * @tc.desc      Verify match full title returns duplicate pair.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_full_title_returns_duplicate_pair_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_full_title_returns_duplicate_pair_045');
      // Every default title is duplicated at an id 8 higher, so each full-title search returns a pair.
      let titles: string[] = ['Classic Shirt', 'Sport Runner Shoes', 'Green Tea Pack',
        'Smart Watch Pro', 'Wireless Earbuds', 'Kitchen Blender', 'Harmony Phone Two'];
      let firstIds: number[] = [7, 3, 4, 2, 6, 5, 1];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < titles.length; index++) {
        let results: Goods[] = engine.search(titles[index]);
        expect(results.length).assertEqual(2);
        expect((sortedIds(results)).length).assertEqual(([firstIds[index], firstIds[index] + 8]).length);
        for (let __i347: number = 0; __i347 < ([firstIds[index], firstIds[index] + 8]).length; __i347++) {
          expect((sortedIds(results))[__i347]).assertEqual(([firstIds[index], firstIds[index] + 8])[__i347]);
        }
        expect(results[0].title).assertEqual(titles[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0460
     * @tc.name      match_full_title_with_overlapping_substrings_046
     * @tc.desc      Verify match full title with overlapping substrings.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_full_title_with_overlapping_substrings_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_full_title_with_overlapping_substrings_046');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('Harmony Phone One');
      expect(results.length).assertEqual(4);
      expect((sortedIds(results)).length).assertEqual(([0, 1, 8, 9]).length);
      for (let __i348: number = 0; __i348 < ([0, 1, 8, 9]).length; __i348++) {
        expect((sortedIds(results))[__i348]).assertEqual(([0, 1, 8, 9])[__i348]);
      }
      let titles: string[] = [];
      for (let index: number = 0; index < results.length; index++) {
        titles.push(results[index].title);
      }
      expect(titles.indexOf('Harmony Phone One') >= 0).assertTrue();
      expect(titles.indexOf('Harmony Phone Two') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0470
     * @tc.name      match_full_title_uppercase_047
     * @tc.desc      Verify match full title uppercase.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_full_title_uppercase_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_full_title_uppercase_047');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('HARMONY PHONE ONE');
      expect(results.length).assertEqual(4);
      expect((sortedIds(results)).length).assertEqual(([0, 1, 8, 9]).length);
      for (let __i349: number = 0; __i349 < ([0, 1, 8, 9]).length; __i349++) {
        expect((sortedIds(results))[__i349]).assertEqual(([0, 1, 8, 9])[__i349]);
      }
      expect(results[0].title).assertEqual('Harmony Phone One');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0480
     * @tc.name      match_full_title_mixed_case_048
     * @tc.desc      Verify match full title mixed case.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_full_title_mixed_case_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_full_title_mixed_case_048');
      // Mixed case still matches the two Sport Runner Shoes rows 3 and 11.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('sPoRt RuNnEr ShOeS');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([3, 11]).length);
      for (let __i350: number = 0; __i350 < ([3, 11]).length; __i350++) {
        expect((sortedIds(results))[__i350]).assertEqual(([3, 11])[__i350]);
      }
      expect(results[0].title).assertEqual('Sport Runner Shoes');
      expect(results[1].id).assertEqual(11);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0490
     * @tc.name      match_title_prefix_returns_family_049
     * @tc.desc      Verify match title prefix returns family.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_title_prefix_returns_family_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_title_prefix_returns_family_049');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('Harmony Phone');
      expect(results.length).assertEqual(4);
      expect((sortedIds(results)).length).assertEqual(([0, 1, 8, 9]).length);
      for (let __i351: number = 0; __i351 < ([0, 1, 8, 9]).length; __i351++) {
        expect((sortedIds(results))[__i351]).assertEqual(([0, 1, 8, 9])[__i351]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].title.startsWith('Harmony Phone')).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0500
     * @tc.name      match_keyword_prefix_of_word_050
     * @tc.desc      Verify match keyword prefix of word.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_keyword_prefix_of_word_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_keyword_prefix_of_word_050');
      // The prefix "shoe" must still reach both rows whose title ends in "shoes".
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('shoe');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([3, 11]).length);
      for (let __i352: number = 0; __i352 < ([3, 11]).length; __i352++) {
        expect((sortedIds(results))[__i352]).assertEqual(([3, 11])[__i352]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].title.toLowerCase().indexOf('shoes') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0510
     * @tc.name      match_keyword_suffix_of_word_051
     * @tc.desc      Verify match keyword suffix of word.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_keyword_suffix_of_word_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_keyword_suffix_of_word_051');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('buds');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([6, 14]).length);
      for (let __i353: number = 0; __i353 < ([6, 14]).length; __i353++) {
        expect((sortedIds(results))[__i353]).assertEqual(([6, 14])[__i353]);
      }
      expect(results[0].title.toLowerCase().endsWith('buds')).assertTrue();
      expect(results[1].title).assertEqual('Wireless Earbuds');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0520
     * @tc.name      match_uppercase_info_only_keyword_052
     * @tc.desc      Verify match uppercase info only keyword.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_uppercase_info_only_keyword_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_uppercase_info_only_keyword_052');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('ORGANIC');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([4, 12]).length);
      for (let __i354: number = 0; __i354 < ([4, 12]).length; __i354++) {
        expect((sortedIds(results))[__i354]).assertEqual(([4, 12])[__i354]);
      }
      expect(results[0].info).assertEqual('organic tea');
      expect(results[0].title).assertEqual('Green Tea Pack');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0530
     * @tc.name      match_result_count_matches_search_text_scan_053
     * @tc.desc      Verify match result count matches search text scan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_result_count_matches_search_text_scan_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_result_count_matches_search_text_scan_053');
      // countBySearchText scans PRODUCTS independently, so its counts must equal the engine's row counts.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let tea: Goods[] = engine.search('tea');
      let labels: Goods[] = engine.search('new_product');
      expect(tea.length).assertEqual(countBySearchText(PRODUCTS, 'tea'));
      expect(labels.length).assertEqual(countBySearchText(PRODUCTS, 'new_product'));
      expect(tea.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0540
     * @tc.name      match_result_ids_are_unique_054
     * @tc.desc      Verify match result ids are unique.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_result_ids_are_unique_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_result_ids_are_unique_054');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('sport');
      let ids: number[] = collectIds(results);
      let __seen364: number[] = [];
      for (let __i364: number = 0; __i364 < (ids).length; __i364++) {
        expect(__seen364.indexOf((ids)[__i364]) < 0).assertTrue();
        __seen364.push((ids)[__i364]);
      }
      expect(ids.length).assertEqual(results.length);
      expect((sortedIds(results)).length).assertEqual(([2, 3, 10, 11]).length);
      for (let __i355: number = 0; __i355 < ([2, 3, 10, 11]).length; __i355++) {
        expect((sortedIds(results))[__i355]).assertEqual(([2, 3, 10, 11])[__i355]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0550
     * @tc.name      match_result_ids_belong_to_catalog_055
     * @tc.desc      Verify match result ids belong to catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_result_ids_belong_to_catalog_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_result_ids_belong_to_catalog_055');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('phone');
      let catalogIds: number[] = catalog.ids();
      for (let index: number = 0; index < results.length; index++) {
        expect(catalogIds.indexOf(results[index].id) >= 0).assertTrue();
      }
      expect(results.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0560
     * @tc.name      match_every_result_contains_every_token_056
     * @tc.desc      Verify match every result contains every token.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_every_result_contains_every_token_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_every_result_contains_every_token_056');
      let tokens: string[] = ['phone', 'one'];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone one');
      for (let resultIndex: number = 0; resultIndex < results.length; resultIndex++) {
        for (let tokenIndex: number = 0; tokenIndex < tokens.length; tokenIndex++) {
          expect(results[resultIndex].searchText().indexOf(tokens[tokenIndex]) >= 0).assertTrue();
        }
      }
      expect(results.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0570
     * @tc.name      match_repeated_title_entries_are_counted_twice_057
     * @tc.desc      Verify match repeated title entries are counted twice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_repeated_title_entries_are_counted_twice_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_repeated_title_entries_are_counted_twice_057');
      // The duplicated Harmony Phone One rows both carry new_product, so the title repeats twice.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('new_product');
      let repeats: number = 0;
      for (let index: number = 0; index < results.length; index++) {
        if (results[index].title === 'Harmony Phone One') {
          repeats++;
        }
      }
      expect(repeats).assertEqual(2);
      expect(results.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0580
     * @tc.name      match_goods_matched_in_all_fields_appears_once_058
     * @tc.desc      Verify match goods matched in all fields appears once.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_goods_matched_in_all_fields_appears_once_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_goods_matched_in_all_fields_appears_once_058');
      let catalog: Catalog = new Catalog([
        createGoods(310, 'Nova Total', 1000, 'nova_cat', 'nova detail', 'nova_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect(results.length).assertEqual(1);
      expect(results[0].id).assertEqual(310);
      expect(results[0].searchText().indexOf('nova') >= 0).assertTrue();
      expect(results[0].labels).assertEqual('nova_label');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0590
     * @tc.name      match_token_repeated_in_search_text_appears_once_059
     * @tc.desc      Verify match token repeated in search text appears once.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_token_repeated_in_search_text_appears_once_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_token_repeated_in_search_text_appears_once_059');
      // Id 0's searchText contains "phone" three times, yet the row must be listed only once.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone');
      let firstCount: number = 0;
      for (let index: number = 0; index < results.length; index++) {
        if (results[index].id === 0) {
          firstCount++;
        }
      }
      expect(firstCount).assertEqual(1);
      expect(countOccurrences(results[0].searchText(), 'phone')).assertEqual(3);
      expect(results[0].title).assertEqual('Harmony Phone One');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0600
     * @tc.name      match_all_default_keywords_return_rows_060
     * @tc.desc      Verify match all default keywords return rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_all_default_keywords_return_rows_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_all_default_keywords_return_rows_060');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < SEARCH_KEYWORDS.length; index++) {
        let results: Goods[] = engine.search(SEARCH_KEYWORDS[index]);
        expect(results.length > 0).assertTrue();
        let __seen365: number[] = [];
        for (let __i365: number = 0; __i365 < (collectIds(results)).length; __i365++) {
          expect(__seen365.indexOf((collectIds(results))[__i365]) < 0).assertTrue();
          __seen365.push((collectIds(results))[__i365]);
        }
      }
      expect(engine.search('blender').length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0610
     * @tc.name      match_category_phone_rows_all_use_phone_category_061
     * @tc.desc      Verify match category phone rows all use phone category.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_category_phone_rows_all_use_phone_category_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_category_phone_rows_all_use_phone_category_061');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('phone');
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].category).assertEqual('phone');
        expect(results[index].id >= 0).assertTrue();
      }
      expect(collectIds(results).indexOf(14) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0620
     * @tc.name      match_discount_rows_carry_the_discount_label_062
     * @tc.desc      Verify match discount rows carry the discount label.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_discount_rows_carry_the_discount_label_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_discount_rows_carry_the_discount_label_062');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('discount');
      expect(results.length).assertEqual(4);
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].labels).assertEqual('discount');
        expect(results[index].title.toLowerCase().indexOf('discount') < 0).assertTrue();
      }
      expect(results[3].title).assertEqual('Classic Shirt');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0630
     * @tc.name      match_and_token_order_is_commutative_063
     * @tc.desc      Verify match and token order is commutative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_and_token_order_is_commutative_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_and_token_order_is_commutative_063');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let forward: number[] = sortedIds(engine.search('tea hot_sale'));
      let backward: number[] = sortedIds(engine.search('hot_sale tea'));
      expect((forward).length).assertEqual((backward).length);
      for (let __i356: number = 0; __i356 < (backward).length; __i356++) {
        expect((forward)[__i356]).assertEqual((backward)[__i356]);
      }
      expect((forward).length).assertEqual(([4, 12]).length);
      for (let __i357: number = 0; __i357 < ([4, 12]).length; __i357++) {
        expect((forward)[__i357]).assertEqual(([4, 12])[__i357]);
      }
      expect(forward.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0640
     * @tc.name      match_results_exclude_unrelated_products_064
     * @tc.desc      Verify match results exclude unrelated products.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_results_exclude_unrelated_products_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_results_exclude_unrelated_products_064');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('watch');
      let ids: number[] = collectIds(results);
      expect(ids.length).assertEqual(2);
      expect(ids.indexOf(3) >= 0).assertFalse();
      expect(ids.indexOf(7) >= 0).assertFalse();
      expect(ids.indexOf(2) >= 0).assertTrue();
      expect(ids.indexOf(10) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0650
     * @tc.name      match_single_letter_m_matches_title_and_category_065
     * @tc.desc      Verify match single letter m matches title and category.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_single_letter_m_matches_title_and_category_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_single_letter_m_matches_title_and_category_065');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('m');
      expect(results.length).assertEqual(10);
      expect(collectIds(results).indexOf(5) >= 0).assertTrue();
      expect(collectIds(results).indexOf(7) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0660
     * @tc.name      match_and_across_info_and_label_066
     * @tc.desc      Verify match and across info and label.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_and_across_info_and_label_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_and_across_info_and_label_066');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: Goods[] = engine.search('flagship new_product');
      expect(results.length).assertEqual(2);
      expect((sortedIds(results)).length).assertEqual(([0, 8]).length);
      for (let __i358: number = 0; __i358 < ([0, 8]).length; __i358++) {
        expect((sortedIds(results))[__i358]).assertEqual(([0, 8])[__i358]);
      }
      expect(results[0].info).assertEqual('flagship phone');
      expect(results[0].labels).assertEqual('new_product');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0670
     * @tc.name      match_custom_field_combinations_return_four_067
     * @tc.desc      Verify match custom field combinations return four.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_custom_field_combinations_return_four_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_custom_field_combinations_return_four_067');
      // Four custom goods put "nova" in title, info, label and category respectively.
      let catalog: Catalog = new Catalog([
        createGoods(300, 'Nova Title', 1000, 'zzz', 'plain', 'plain'),
        createGoods(301, 'Plain One', 1000, 'zzz', 'nova detail', 'plain'),
        createGoods(302, 'Plain Two', 1000, 'zzz', 'plain', 'nova_label'),
        createGoods(303, 'Plain Three', 1000, 'nova_cat', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect(results.length).assertEqual(4);
      expect((sortedIds(results)).length).assertEqual(([300, 301, 302, 303]).length);
      for (let __i359: number = 0; __i359 < ([300, 301, 302, 303]).length; __i359++) {
        expect((sortedIds(results))[__i359]).assertEqual(([300, 301, 302, 303])[__i359]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].searchText().indexOf('nova') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0680
     * @tc.name      match_custom_keyword_absent_returns_empty_068
     * @tc.desc      Verify match custom keyword absent returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_custom_keyword_absent_returns_empty_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_custom_keyword_absent_returns_empty_068');
      let catalog: Catalog = new Catalog([
        createGoods(300, 'Nova Title', 1000, 'zzz', 'plain', 'plain'),
        createGoods(301, 'Plain One', 1000, 'zzz', 'nova detail', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('quasar');
      expect(results.length).assertEqual(0);
      expect(results.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0690
     * @tc.name      match_partial_token_list_returns_empty_069
     * @tc.desc      Verify match partial token list returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_partial_token_list_returns_empty_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_partial_token_list_returns_empty_069');
      let keywords: string[] = ['alpha beta', 'qqq www'];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < keywords.length; index++) {
        expect(engine.search(keywords[index]).length).assertEqual(0);
      }
      expect(engine.search(keywords[0]).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_MATCH_0700
     * @tc.name      match_keywords_with_an_absent_token_return_empty_070
     * @tc.desc      Verify match keywords with an absent token return empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('match_keywords_with_an_absent_token_return_empty_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: match_keywords_with_an_absent_token_return_empty_070');
      // Every query carries an absent token: tablet, three, z, or the joined teatablet.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let keywords: string[] = ['tablet tea', 'tea tablet', 'harmony phone three', 'z', 'teatablet'];
      expect(keywords.length).assertEqual(5);
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(0);
      }
    });

  });
}
