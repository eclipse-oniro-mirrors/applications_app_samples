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
import { Catalog, SearchEngine } from '../Shared/ShopModel';
import { EMPTY_KEYWORDS, createGoods, defaultCatalog } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function searchSuggestTest() {
  describe('OrangeShoppingSearchSuggest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'search suggest suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0010
     * @tc.name      suggest_prefix_harmony_returns_two_titles_001
     * @tc.desc      Verify suggest prefix harmony returns two titles.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_prefix_harmony_returns_two_titles_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_prefix_harmony_returns_two_titles_001');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('harmony');
      expect((results).length).assertEqual((['Harmony Phone One', 'Harmony Phone Two']).length);
      for (let __i414: number = 0; __i414 < (['Harmony Phone One', 'Harmony Phone Two']).length; __i414++) {
        expect((results)[__i414]).assertEqual((['Harmony Phone One', 'Harmony Phone Two'])[__i414]);
      }
      expect(results.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0020
     * @tc.name      suggest_single_candidate_prefixes_002
     * @tc.desc      Verify suggest single candidate prefixes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_single_candidate_prefixes_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_single_candidate_prefixes_002');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      // 'OES' is buried inside 'Shoes', so the match is a case-insensitive substring, not a word prefix.
      let prefixes: string[] = ['watch', 'two', 'pro', 'shoes', 'OES'];
      let expected: string[] = ['Smart Watch Pro', 'Harmony Phone Two', 'Smart Watch Pro',
        'Sport Runner Shoes', 'Sport Runner Shoes'];
      expect(prefixes.length).assertEqual(expected.length);
      for (let index: number = 0; index < prefixes.length; index++) {
        let results: string[] = engine.suggest(prefixes[index]);
        expect(results.length).assertEqual(1);
        expect(results[0]).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0030
     * @tc.name      suggest_substring_phone_returns_harmony_pair_003
     * @tc.desc      Verify suggest substring phone returns harmony pair.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_substring_phone_returns_harmony_pair_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_substring_phone_returns_harmony_pair_003');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('phone');
      expect((results).length).assertEqual((['Harmony Phone One', 'Harmony Phone Two']).length);
      for (let __i415: number = 0; __i415 < (['Harmony Phone One', 'Harmony Phone Two']).length; __i415++) {
        expect((results)[__i415]).assertEqual((['Harmony Phone One', 'Harmony Phone Two'])[__i415]);
      }
      let __seen437: string[] = [];
      for (let __i437: number = 0; __i437 < (results).length; __i437++) {
        expect(__seen437.indexOf((results)[__i437]) < 0).assertTrue();
        __seen437.push((results)[__i437]);
      }
      expect(results[0].startsWith('Harmony')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0040
     * @tc.name      suggest_substring_art_returns_smart_watch_004
     * @tc.desc      Verify suggest substring art returns smart watch.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_substring_art_returns_smart_watch_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_substring_art_returns_smart_watch_004');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('art');
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual('Smart Watch Pro');
      expect(results[0].toLowerCase().indexOf('art') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0050
     * @tc.name      suggest_substring_sweep_returns_single_titles_005
     * @tc.desc      Verify suggest substring sweep returns single titles.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_substring_sweep_returns_single_titles_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_substring_sweep_returns_single_titles_005');
      let keywords: string[] = ['buds', 'tea', 'watch', 'kitchen'];
      let expected: string[] = ['Wireless Earbuds', 'Green Tea Pack',
        'Smart Watch Pro', 'Kitchen Blender'];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < keywords.length; index++) {
        let results: string[] = engine.suggest(keywords[index]);
        expect(results.length).assertEqual(1);
        expect(results[0]).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0060
     * @tc.name      suggest_full_title_returns_itself_006
     * @tc.desc      Verify suggest full title returns itself.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_full_title_returns_itself_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_full_title_returns_itself_006');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('Harmony Phone One');
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual('Harmony Phone One');
      expect(results[0].startsWith('Harmony')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0070
     * @tc.name      suggest_full_title_uppercase_returns_itself_007
     * @tc.desc      Verify suggest full title uppercase returns itself.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_full_title_uppercase_returns_itself_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_full_title_uppercase_returns_itself_007');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('SMART WATCH PRO');
      expect((results).length).assertEqual((['Smart Watch Pro']).length);
      for (let __i416: number = 0; __i416 < (['Smart Watch Pro']).length; __i416++) {
        expect((results)[__i416]).assertEqual((['Smart Watch Pro'])[__i416]);
      }
      expect(results.length > 1).assertFalse();
      expect(results[0].toUpperCase().indexOf('SMART WATCH') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0080
     * @tc.name      suggest_inner_single_space_keeps_matches_008
     * @tc.desc      Verify suggest inner single space keeps matches.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_inner_single_space_keeps_matches_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_inner_single_space_keeps_matches_008');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('harmony phone');
      expect((results).length).assertEqual((['Harmony Phone One', 'Harmony Phone Two']).length);
      for (let __i417: number = 0; __i417 < (['Harmony Phone One', 'Harmony Phone Two']).length; __i417++) {
        expect((results)[__i417]).assertEqual((['Harmony Phone One', 'Harmony Phone Two'])[__i417]);
      }
      let __seen438: string[] = [];
      for (let __i438: number = 0; __i438 < (results).length; __i438++) {
        expect(__seen438.indexOf((results)[__i438]) < 0).assertTrue();
        __seen438.push((results)[__i438]);
      }
      expect(results.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0090
     * @tc.name      suggest_case_variants_prefix_009
     * @tc.desc      Verify suggest case variants prefix.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_case_variants_prefix_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_case_variants_prefix_009');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let variants: string[] = ['HARMONY', 'HaRmOnY', 'harmony'];
      let expected: string[] = ['Harmony Phone One', 'Harmony Phone Two'];
      for (let index: number = 0; index < variants.length; index++) {
        let results: string[] = engine.suggest(variants[index]);
        expect((results).length).assertEqual((expected).length);
        for (let __i418: number = 0; __i418 < (expected).length; __i418++) {
          expect((results)[__i418]).assertEqual((expected)[__i418]);
        }
        expect(results.length).assertEqual(2);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0100
     * @tc.name      suggest_padded_prefix_is_trimmed_010
     * @tc.desc      Verify suggest padded prefix is trimmed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_padded_prefix_is_trimmed_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_padded_prefix_is_trimmed_010');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('   harmony   ');
      expect(results.length).assertEqual(2);
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].startsWith('Harmony Phone')).assertTrue();
      }
      expect(results[1]).assertEqual('Harmony Phone Two');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0110
     * @tc.name      suggest_tab_and_newline_padding_011
     * @tc.desc      Verify suggest tab and newline padding.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_tab_and_newline_padding_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_tab_and_newline_padding_011');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let padded: string[] = ['\tharmony\t', '\nharmony\n'];
      let expectedFirst: string[] = ['Harmony Phone One', 'Harmony Phone One'];
      let expectedLast: string[] = ['Harmony Phone Two', 'Harmony Phone Two'];
      for (let index: number = 0; index < padded.length; index++) {
        let results: string[] = engine.suggest(padded[index]);
        expect(results.length).assertEqual(2);
        expect(results[0]).assertEqual(expectedFirst[index]);
        expect(results[results.length - 1]).assertEqual(expectedLast[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0120
     * @tc.name      suggest_case_variants_return_same_titles_012
     * @tc.desc      Verify suggest case variants return same titles.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_case_variants_return_same_titles_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_case_variants_return_same_titles_012');
      let variants: string[] = ['watch', 'WATCH', 'WaTcH', '  watch  '];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let baseline: string[] = engine.suggest(variants[0]);
      for (let index: number = 0; index < variants.length; index++) {
        expect((engine.suggest(variants[index])).length).assertEqual((baseline).length);
        for (let __i419: number = 0; __i419 < (baseline).length; __i419++) {
          expect((engine.suggest(variants[index]))[__i419]).assertEqual((baseline)[__i419]);
        }
      }
      expect(baseline.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0130
     * @tc.name      suggest_zero_limit_always_empty_013
     * @tc.desc      Verify suggest zero limit always empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_zero_limit_always_empty_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_zero_limit_always_empty_013');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      // Limit 0 yields no suggestions even for 'e', which otherwise has six titles to offer.
      let prefixes: string[] = ['e', ''];
      for (let index: number = 0; index < prefixes.length; index++) {
        let results: string[] = engine.suggest(prefixes[index], 0);
        expect(results.length).assertEqual(0);
        expect(results.length).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0140
     * @tc.name      suggest_limit_one_returns_sorted_head_014
     * @tc.desc      Verify suggest limit one returns sorted head.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_limit_one_returns_sorted_head_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_limit_one_returns_sorted_head_014');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let prefixes: string[] = ['e', 'harmony'];
      let expected: string[] = ['Green Tea Pack', 'Harmony Phone One'];
      for (let index: number = 0; index < prefixes.length; index++) {
        let results: string[] = engine.suggest(prefixes[index], 1);
        expect(results.length).assertEqual(1);
        expect(results[0]).assertEqual(expected[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0150
     * @tc.name      suggest_limit_truncation_matrix_015
     * @tc.desc      Verify suggest limit truncation matrix.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_limit_truncation_matrix_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_limit_truncation_matrix_015');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      // 'e' has six candidates: limit 5 drops one, limit 10 keeps all; 'harmony' has two, so limit 3 is a no-op.
      let prefixes: string[] = ['e', 'e', 'harmony', 'e'];
      let limits: number[] = [5, 10, 3, 7];
      let sizes: number[] = [5, 6, 2, 6];
      let firstTitles: string[] = ['Green Tea Pack', 'Green Tea Pack', 'Harmony Phone One',
        'Green Tea Pack'];
      let lastTitles: string[] = ['Sport Runner Shoes', 'Wireless Earbuds', 'Harmony Phone Two',
        'Wireless Earbuds'];

      expect(prefixes.length).assertEqual(limits.length);
      for (let index: number = 0; index < prefixes.length; index++) {
        let results: string[] = engine.suggest(prefixes[index], limits[index]);
        expect(results.length).assertEqual(sizes[index]);
        expect(results[0]).assertEqual(firstTitles[index]);
        expect(results[results.length - 1]).assertEqual(lastTitles[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0160
     * @tc.name      suggest_limit_equal_to_count_returns_all_016
     * @tc.desc      Verify suggest limit equal to count returns all.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_limit_equal_to_count_returns_all_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_limit_equal_to_count_returns_all_016');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('e', 6);
      expect(results.length).assertEqual(6);
      expect(results[5]).assertEqual('Wireless Earbuds');
      for (let __i445: number = 1; __i445 < (results).length; __i445++) {
        expect((results)[__i445 - 1] <= (results)[__i445]).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0170
     * @tc.name      suggest_limit_hundred_returns_all_six_017
     * @tc.desc      Verify suggest limit hundred returns all six.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_limit_hundred_returns_all_six_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_limit_hundred_returns_all_six_017');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('e', 100);
      expect(results.length).assertEqual(6);
      expect((results).length).assertEqual((['Green Tea Pack', 'Harmony Phone One', 'Harmony Phone Two',
        'Kitchen Blender', 'Sport Runner Shoes', 'Wireless Earbuds']).length);
      for (let __i420: number = 0; __i420 < (['Green Tea Pack', 'Harmony Phone One', 'Harmony Phone Two',
        'Kitchen Blender', 'Sport Runner Shoes', 'Wireless Earbuds']).length; __i420++) {
        expect((results)[__i420]).assertEqual((['Green Tea Pack', 'Harmony Phone One', 'Harmony Phone Two',
        'Kitchen Blender', 'Sport Runner Shoes', 'Wireless Earbuds'])[__i420]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0180
     * @tc.name      suggest_default_limit_is_five_018
     * @tc.desc      Verify suggest default limit is five.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_default_limit_is_five_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_default_limit_is_five_018');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('e');
      // Six titles contain an 'e', but the implicit limit of 5 clips the sorted list to its first five.
      expect(results.length).assertEqual(5);
      expect(results.length <= 5).assertTrue();
      for (let __i446: number = 1; __i446 < (results).length; __i446++) {
        expect((results)[__i446 - 1] <= (results)[__i446]).assertTrue();
      }
      expect(results[4]).assertEqual('Sport Runner Shoes');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0190
     * @tc.name      suggest_default_limit_keeps_all_when_fewer_019
     * @tc.desc      Verify suggest default limit keeps all when fewer.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_default_limit_keeps_all_when_fewer_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_default_limit_keeps_all_when_fewer_019');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('harmony');
      expect(results.length < 5).assertTrue();
      expect((results).length).assertEqual((['Harmony Phone One', 'Harmony Phone Two']).length);
      for (let __i421: number = 0; __i421 < (['Harmony Phone One', 'Harmony Phone Two']).length; __i421++) {
        expect((results)[__i421]).assertEqual((['Harmony Phone One', 'Harmony Phone Two'])[__i421]);
      }
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].startsWith('Harmony')).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0200
     * @tc.name      suggest_negative_limit_returns_empty_020
     * @tc.desc      Verify suggest negative limit returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_negative_limit_returns_empty_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_negative_limit_returns_empty_020');
      // Negative limits must clamp to empty instead of acting as an offset from the end of the list.
      let limits: number[] = [-1, -5, -100];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < limits.length; index++) {
        expect(engine.suggest('phone', limits[index]).length).assertEqual(0);
      }
      expect(engine.suggest('phone', -1).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0210
     * @tc.name      suggest_duplicate_product_entries_collapse_021
     * @tc.desc      Verify suggest duplicate product entries collapse.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_duplicate_product_entries_collapse_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_duplicate_product_entries_collapse_021');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('phone');
      expect(results.length).assertEqual(2);
      let __seen439: string[] = [];
      for (let __i439: number = 0; __i439 < (results).length; __i439++) {
        expect(__seen439.indexOf((results)[__i439]) < 0).assertTrue();
        __seen439.push((results)[__i439]);
      }
      expect(results[0]).assertEqual('Harmony Phone One');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0220
     * @tc.name      suggest_harmony_duplicate_entries_collapse_022
     * @tc.desc      Verify suggest harmony duplicate entries collapse.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_harmony_duplicate_entries_collapse_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_harmony_duplicate_entries_collapse_022');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('harmony');
      expect(results.length).assertEqual(2);
      let __seen440: string[] = [];
      for (let __i440: number = 0; __i440 < (results).length; __i440++) {
        expect(__seen440.indexOf((results)[__i440]) < 0).assertTrue();
        __seen440.push((results)[__i440]);
      }
      expect(results.length > 2).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0230
     * @tc.name      suggest_results_unique_for_several_prefixes_023
     * @tc.desc      Verify suggest results unique for several prefixes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_results_unique_for_several_prefixes_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_results_unique_for_several_prefixes_023');
      let prefixes: string[] = ['phone', 'harmony', 'e', 'a', 't', 's'];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < prefixes.length; index++) {
        let results: string[] = engine.suggest(prefixes[index]);
        let __seen441: string[] = [];
        for (let __i441: number = 0; __i441 < (results).length; __i441++) {
          expect(__seen441.indexOf((results)[__i441]) < 0).assertTrue();
          __seen441.push((results)[__i441]);
        }
        expect(results.length > 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0240
     * @tc.name      suggest_custom_duplicate_titles_collapse_024
     * @tc.desc      Verify suggest custom duplicate titles collapse.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_duplicate_titles_collapse_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_duplicate_titles_collapse_024');
      // Three rows carry the identical title, so dedupe by exact title must reduce them to one suggestion.
      let catalog: Catalog = new Catalog([
        createGoods(530, 'Bulk Phone', 1000, 'zzz', 'plain', 'plain'),
        createGoods(531, 'Bulk Phone', 1000, 'zzz', 'plain', 'plain'),
        createGoods(532, 'Bulk Phone', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('phone');
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual('Bulk Phone');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0250
     * @tc.name      suggest_custom_case_only_duplicates_are_kept_025
     * @tc.desc      Verify suggest custom case only duplicates are kept.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_case_only_duplicates_are_kept_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_case_only_duplicates_are_kept_025');
      // Title equality is case-sensitive: 'Tea Pack' and 'tea pack' stay separate through dedupe.
      let catalog: Catalog = new Catalog([
        createGoods(533, 'Tea Pack', 1000, 'zzz', 'plain', 'plain'),
        createGoods(534, 'tea pack', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('tea');
      expect(results.length).assertEqual(2);
      expect((results).length).assertEqual((['Tea Pack', 'tea pack']).length);
      for (let __i422: number = 0; __i422 < (['Tea Pack', 'tea pack']).length; __i422++) {
        expect((results)[__i422]).assertEqual((['Tea Pack', 'tea pack'])[__i422]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0260
     * @tc.name      suggest_ascending_e_exact_order_026
     * @tc.desc      Verify suggest ascending e exact order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_ascending_e_exact_order_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_ascending_e_exact_order_026');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('e', 10);
      expect((results).length).assertEqual((['Green Tea Pack', 'Harmony Phone One', 'Harmony Phone Two',
        'Kitchen Blender', 'Sport Runner Shoes', 'Wireless Earbuds']).length);
      for (let __i423: number = 0; __i423 < (['Green Tea Pack', 'Harmony Phone One', 'Harmony Phone Two',
        'Kitchen Blender', 'Sport Runner Shoes', 'Wireless Earbuds']).length; __i423++) {
        expect((results)[__i423]).assertEqual((['Green Tea Pack', 'Harmony Phone One', 'Harmony Phone Two',
        'Kitchen Blender', 'Sport Runner Shoes', 'Wireless Earbuds'])[__i423]);
      }
      for (let __i447: number = 1; __i447 < (results).length; __i447++) {
        expect((results)[__i447 - 1] <= (results)[__i447]).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0270
     * @tc.name      suggest_ascending_orders_match_expected_027
     * @tc.desc      Verify suggest ascending orders match expected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_ascending_orders_match_expected_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_ascending_orders_match_expected_027');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let prefixes: string[] = ['r', 'h'];
      let expected: string[][] = [
        ['Classic Shirt', 'Green Tea Pack', 'Harmony Phone One', 'Harmony Phone Two',
          'Kitchen Blender', 'Smart Watch Pro', 'Sport Runner Shoes', 'Wireless Earbuds'],
        ['Classic Shirt', 'Harmony Phone One', 'Harmony Phone Two', 'Kitchen Blender',
          'Smart Watch Pro', 'Sport Runner Shoes']
      ];

      expect(prefixes.length).assertEqual(expected.length);
      for (let index: number = 0; index < prefixes.length; index++) {
        let results: string[] = engine.suggest(prefixes[index], 10);
        expect((results).length).assertEqual((expected[index]).length);
        for (let __i424: number = 0; __i424 < (expected[index]).length; __i424++) {
          expect((results)[__i424]).assertEqual((expected[index])[__i424]);
        }
        for (let __i448: number = 1; __i448 < (results).length; __i448++) {
          expect((results)[__i448 - 1] <= (results)[__i448]).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0280
     * @tc.name      suggest_ascending_o_exact_order_028
     * @tc.desc      Verify suggest ascending o exact order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_ascending_o_exact_order_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_ascending_o_exact_order_028');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('o', 10);
      expect((results).length).assertEqual((['Harmony Phone One', 'Harmony Phone Two',
        'Smart Watch Pro', 'Sport Runner Shoes']).length);
      for (let __i425: number = 0; __i425 < (['Harmony Phone One', 'Harmony Phone Two',
        'Smart Watch Pro', 'Sport Runner Shoes']).length; __i425++) {
        expect((results)[__i425]).assertEqual((['Harmony Phone One', 'Harmony Phone Two',
        'Smart Watch Pro', 'Sport Runner Shoes'])[__i425]);
      }
      expect(results.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0290
     * @tc.name      suggest_ascending_for_prefix_list_029
     * @tc.desc      Verify suggest ascending for prefix list.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_ascending_for_prefix_list_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_ascending_for_prefix_list_029');
      let prefixes: string[] = ['r', 'a', 'h', 'w'];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < prefixes.length; index++) {
        let results: string[] = engine.suggest(prefixes[index], 10);
        for (let __i449: number = 1; __i449 < (results).length; __i449++) {
          expect((results)[__i449 - 1] <= (results)[__i449]).assertTrue();
        }
      }
      expect(engine.suggest('w', 10).length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0300
     * @tc.name      suggest_sorted_not_catalog_order_030
     * @tc.desc      Verify suggest sorted not catalog order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_sorted_not_catalog_order_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_sorted_not_catalog_order_030');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('e', 10);
      expect(results[0]).assertEqual('Green Tea Pack');
      expect(results[0] === 'Harmony Phone One').assertFalse();
      expect(results[0].charAt(0)).assertEqual('G');
      expect(results[1].charAt(0)).assertEqual('H');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0310
     * @tc.name      suggest_custom_ascii_order_031
     * @tc.desc      Verify suggest custom ascii order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_ascii_order_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_ascii_order_031');
      let catalog: Catalog = new Catalog([
        createGoods(535, 'Gamma', 1000, 'zzz', 'plain', 'plain'),
        createGoods(536, 'beta', 1000, 'zzz', 'plain', 'plain'),
        createGoods(537, 'Alpha', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('a');
      // Uppercase code units sort before lowercase, so 'Gamma' precedes 'beta' in the result.
      expect((results).length).assertEqual((['Alpha', 'Gamma', 'beta']).length);
      for (let __i426: number = 0; __i426 < (['Alpha', 'Gamma', 'beta']).length; __i426++) {
        expect((results)[__i426]).assertEqual((['Alpha', 'Gamma', 'beta'])[__i426]);
      }
      for (let __i450: number = 1; __i450 < (results).length; __i450++) {
        expect((results)[__i450 - 1] <= (results)[__i450]).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0320
     * @tc.name      suggest_non_title_token_list_returns_empty_032
     * @tc.desc      Verify suggest non title token list returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_non_title_token_list_returns_empty_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_non_title_token_list_returns_empty_032');
      // Each token sits only in a description, category or label of the stock catalogue, never in a title.
      let keywords: string[] = ['product', 'flagship', 'men_wear',
        'home', 'cotton', 'discount'];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < keywords.length; index++) {
        expect(engine.suggest(keywords[index]).length).assertEqual(0);
      }
      expect(engine.suggest('flagship').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0330
     * @tc.name      suggest_unknown_letter_list_returns_empty_033
     * @tc.desc      Verify suggest unknown letter list returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_unknown_letter_list_returns_empty_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_unknown_letter_list_returns_empty_033');
      let letters: string[] = ['x', 'z', 'q', 'j', 'v'];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < letters.length; index++) {
        expect(engine.suggest(letters[index]).length).assertEqual(0);
      }
      expect(engine.suggest('x').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0340
     * @tc.name      suggest_empty_keywords_return_empty_034
     * @tc.desc      Verify suggest empty keywords return empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_empty_keywords_return_empty_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_empty_keywords_return_empty_034');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < EMPTY_KEYWORDS.length; index++) {
        let results: string[] = engine.suggest(EMPTY_KEYWORDS[index]);
        expect(results.length).assertEqual(0);
        expect(results.length).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0350
     * @tc.name      suggest_empty_catalog_returns_empty_035
     * @tc.desc      Verify suggest empty catalog returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_empty_catalog_returns_empty_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_empty_catalog_returns_empty_035');
      let catalog: Catalog = new Catalog([]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('ph');
      expect(results.length).assertEqual(0);
      expect(catalog.count()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0360
     * @tc.name      suggest_empty_catalog_with_limit_returns_empty_036
     * @tc.desc      Verify suggest empty catalog with limit returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_empty_catalog_with_limit_returns_empty_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_empty_catalog_with_limit_returns_empty_036');
      let catalog: Catalog = new Catalog([]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('ph', 10);
      expect(results.length).assertEqual(0);
      expect(results.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0370
     * @tc.name      suggest_single_item_match_037
     * @tc.desc      Verify suggest single item match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_single_item_match_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_single_item_match_037');
      let catalog: Catalog = new Catalog([
        createGoods(520, 'Solo Phone', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('solo');
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual('Solo Phone');
      expect(catalog.count()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0380
     * @tc.name      suggest_single_item_non_match_038
     * @tc.desc      Verify suggest single item non match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_single_item_non_match_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_single_item_non_match_038');
      let catalog: Catalog = new Catalog([
        createGoods(520, 'Solo Phone', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('tablet');
      expect(results.length).assertEqual(0);
      expect(results.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0390
     * @tc.name      suggest_single_item_limit_zero_039
     * @tc.desc      Verify suggest single item limit zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_single_item_limit_zero_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_single_item_limit_zero_039');
      let catalog: Catalog = new Catalog([
        createGoods(520, 'Solo Phone', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('solo', 0);
      expect(results.length).assertEqual(0);
      expect(catalog.count()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0400
     * @tc.name      suggest_results_preserve_title_case_040
     * @tc.desc      Verify suggest results preserve title case.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_results_preserve_title_case_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_results_preserve_title_case_040');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('PHONE');
      // The query is folded to lower case for matching, yet the stored title casing comes back untouched.
      expect(results[0]).assertEqual('Harmony Phone One');
      expect(results[1]).assertEqual('Harmony Phone Two');
      expect(results[0].indexOf('Phone') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0410
     * @tc.name      suggest_results_are_full_titles_041
     * @tc.desc      Verify suggest results are full titles.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_results_are_full_titles_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_results_are_full_titles_041');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('e', 10);
      for (let index: number = 0; index < results.length; index++) {
        expect(results[index].length > 5).assertTrue();
        expect(results[index].indexOf(' ') >= 0).assertTrue();
      }
      expect(results.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0420
     * @tc.name      suggest_result_count_never_exceeds_limit_042
     * @tc.desc      Verify suggest result count never exceeds limit.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_result_count_never_exceeds_limit_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_result_count_never_exceeds_limit_042');
      let limits: number[] = [1, 4, 8];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < limits.length; index++) {
        let results: string[] = engine.suggest('e', limits[index]);
        expect(results.length <= limits[index]).assertTrue();
      }
      expect(engine.suggest('e', 9).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0430
     * @tc.name      suggest_result_count_bounded_by_distinct_titles_043
     * @tc.desc      Verify suggest result count bounded by distinct titles.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_result_count_bounded_by_distinct_titles_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_result_count_bounded_by_distinct_titles_043');
      let letters: string[] = ['a', 'e', 'm', 'z'];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < letters.length; index++) {
        let results: string[] = engine.suggest(letters[index], 100);
        expect(results.length <= 8).assertTrue();
        let __seen442: string[] = [];
        for (let __i442: number = 0; __i442 < (results).length; __i442++) {
          expect(__seen442.indexOf((results)[__i442]) < 0).assertTrue();
          __seen442.push((results)[__i442]);
        }
      }
      expect(engine.suggest('e', 100).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0440
     * @tc.name      suggest_custom_case_titles_are_preserved_044
     * @tc.desc      Verify suggest custom case titles are preserved.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_case_titles_are_preserved_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_case_titles_are_preserved_044');
      let titles: string[] = ['iPhone SE', 'HARMONY PHONE'];
      let prefixes: string[] = ['phone', 'harmony'];
      let contains: string[] = ['iPhone', 'HARMONY'];
      for (let index: number = 0; index < titles.length; index++) {
        let catalog: Catalog = new Catalog([
          createGoods(520 + index, titles[index], 1000, 'zzz', 'plain', 'plain')
        ]);
        let engine: SearchEngine = new SearchEngine(catalog);
        let results: string[] = engine.suggest(prefixes[index]);
        expect(results.length).assertEqual(1);
        expect(results[0]).assertEqual(titles[index]);
        expect(results[0].indexOf(contains[index]) >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0450
     * @tc.name      suggest_padded_uppercase_combination_045
     * @tc.desc      Verify suggest padded uppercase combination.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_padded_uppercase_combination_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_padded_uppercase_combination_045');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('  HARMONY  ', 10);
      expect(results.length).assertEqual(2);
      let expected: string[] = ['Harmony Phone One', 'Harmony Phone Two'];
      for (let index: number = 0; index < expected.length; index++) {
        expect(results[index]).assertEqual(expected[index]);
      }
      for (let __i451: number = 1; __i451 < (results).length; __i451++) {
        expect((results)[__i451 - 1] <= (results)[__i451]).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0460
     * @tc.name      suggest_limit_applied_after_dedupe_046
     * @tc.desc      Verify suggest limit applied after dedupe.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_limit_applied_after_dedupe_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_limit_applied_after_dedupe_046');
      let catalog: Catalog = new Catalog([
        createGoods(540, 'Dup Phone', 1000, 'zzz', 'plain', 'plain'),
        createGoods(541, 'Dup Phone', 1000, 'zzz', 'plain', 'plain'),
        createGoods(542, 'Other Phone', 1000, 'zzz', 'plain', 'plain'),
        createGoods(543, 'Other Phone', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      // Four rows shrink to two distinct titles, so limit 1 still has a title left to return.
      let two: string[] = engine.suggest('phone', 2);
      let one: string[] = engine.suggest('phone', 1);
      expect((two).length).assertEqual((['Dup Phone', 'Other Phone']).length);
      for (let __i427: number = 0; __i427 < (['Dup Phone', 'Other Phone']).length; __i427++) {
        expect((two)[__i427]).assertEqual((['Dup Phone', 'Other Phone'])[__i427]);
      }
      expect(one.length).assertEqual(1);
      expect(one[0]).assertEqual('Dup Phone');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0470
     * @tc.name      suggest_limit_applied_after_sorting_047
     * @tc.desc      Verify suggest limit applied after sorting.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_limit_applied_after_sorting_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_limit_applied_after_sorting_047');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('e', 3);
      expect((results).length).assertEqual((['Green Tea Pack', 'Harmony Phone One', 'Harmony Phone Two']).length);
      for (let __i428: number = 0; __i428 < (['Green Tea Pack', 'Harmony Phone One', 'Harmony Phone Two']).length; __i428++) {
        expect((results)[__i428]).assertEqual((['Green Tea Pack', 'Harmony Phone One', 'Harmony Phone Two'])[__i428]);
      }
      expect(results[2]).assertEqual('Harmony Phone Two');
      expect(results[0] === 'Harmony Phone One').assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0480
     * @tc.name      suggest_truncated_results_are_prefix_of_full_048
     * @tc.desc      Verify suggest truncated results are prefix of full.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_truncated_results_are_prefix_of_full_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_truncated_results_are_prefix_of_full_048');
      // Five successive caps must each reproduce the head of the six-item full result.
      let limits: number[] = [1, 2, 3, 4, 5];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let full: string[] = engine.suggest('e', 10);
      for (let limitIndex: number = 0; limitIndex < limits.length; limitIndex++) {
        let partial: string[] = engine.suggest('e', limits[limitIndex]);
        expect(partial.length).assertEqual(limits[limitIndex]);
        for (let index: number = 0; index < partial.length; index++) {
          expect(partial[index]).assertEqual(full[index]);
        }
      }
      expect(full.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0490
     * @tc.name      suggest_default_equals_explicit_five_049
     * @tc.desc      Verify suggest default equals explicit five.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_default_equals_explicit_five_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_default_equals_explicit_five_049');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let implicit: string[] = engine.suggest('e');
      let explicit: string[] = engine.suggest('e', 5);
      expect((implicit).length).assertEqual((explicit).length);
      for (let __i429: number = 0; __i429 < (explicit).length; __i429++) {
        expect((implicit)[__i429]).assertEqual((explicit)[__i429]);
      }
      expect(implicit.length).assertEqual(explicit.length);
      expect(implicit[0]).assertEqual('Green Tea Pack');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0500
     * @tc.name      suggest_custom_numeric_titles_sort_lexicographically_050
     * @tc.desc      Verify suggest custom numeric titles sort lexicographically.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_numeric_titles_sort_lexicographically_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_numeric_titles_sort_lexicographically_050');
      let catalog: Catalog = new Catalog([
        createGoods(550, 'Model 10', 1000, 'zzz', 'plain', 'plain'),
        createGoods(551, 'Model 2', 1000, 'zzz', 'plain', 'plain'),
        createGoods(552, 'Model 1', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('model', 10);
      // Character-wise compare puts 'Model 10' ahead of 'Model 2' because '1' ranks below '2'.
      expect((results).length).assertEqual((['Model 1', 'Model 10', 'Model 2']).length);
      for (let __i430: number = 0; __i430 < (['Model 1', 'Model 10', 'Model 2']).length; __i430++) {
        expect((results)[__i430]).assertEqual((['Model 1', 'Model 10', 'Model 2'])[__i430]);
      }
      expect(results.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0510
     * @tc.name      suggest_custom_trailing_space_titles_are_distinct_051
     * @tc.desc      Verify suggest custom trailing space titles are distinct.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_trailing_space_titles_are_distinct_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_trailing_space_titles_are_distinct_051');
      let catalog: Catalog = new Catalog([
        createGoods(553, 'Alpha ', 1000, 'zzz', 'plain', 'plain'),
        createGoods(554, 'Alpha', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      // A trailing space makes the titles unequal for dedupe, and the shorter 'Alpha' sorts before 'Alpha '.
      let results: string[] = engine.suggest('alpha', 10);
      expect((results).length).assertEqual((['Alpha', 'Alpha ']).length);
      for (let __i431: number = 0; __i431 < (['Alpha', 'Alpha ']).length; __i431++) {
        expect((results)[__i431]).assertEqual((['Alpha', 'Alpha '])[__i431]);
      }
      let __seen443: string[] = [];
      for (let __i443: number = 0; __i443 < (results).length; __i443++) {
        expect(__seen443.indexOf((results)[__i443]) < 0).assertTrue();
        __seen443.push((results)[__i443]);
      }
      expect(results.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0520
     * @tc.name      suggest_custom_reverse_insertion_is_sorted_052
     * @tc.desc      Verify suggest custom reverse insertion is sorted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_reverse_insertion_is_sorted_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_reverse_insertion_is_sorted_052');
      let catalog: Catalog = new Catalog([
        createGoods(555, 'Zulu X', 1000, 'zzz', 'plain', 'plain'),
        createGoods(556, 'Mike X', 1000, 'zzz', 'plain', 'plain'),
        createGoods(557, 'Alpha X', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('x', 10);
      expect((results).length).assertEqual((['Alpha X', 'Mike X', 'Zulu X']).length);
      for (let __i432: number = 0; __i432 < (['Alpha X', 'Mike X', 'Zulu X']).length; __i432++) {
        expect((results)[__i432]).assertEqual((['Alpha X', 'Mike X', 'Zulu X'])[__i432]);
      }
      for (let __i452: number = 1; __i452 < (results).length; __i452++) {
        expect((results)[__i452 - 1] <= (results)[__i452]).assertTrue();
      }
      expect(results.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0530
     * @tc.name      suggest_custom_empty_title_is_ignored_053
     * @tc.desc      Verify suggest custom empty title is ignored.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_empty_title_is_ignored_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_empty_title_is_ignored_053');
      let catalog: Catalog = new Catalog([
        createGoods(558, '', 1000, 'zzz', 'plain', 'plain'),
        createGoods(559, 'Phone Mate', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let phone: string[] = engine.suggest('phone');
      let mate: string[] = engine.suggest('mate');
      expect(phone.length).assertEqual(1);
      expect(phone[0]).assertEqual('Phone Mate');
      expect(mate.length).assertEqual(1);
      expect(mate[0]).assertEqual('Phone Mate');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0540
     * @tc.name      suggest_custom_case_tie_break_uppercase_first_054
     * @tc.desc      Verify suggest custom case tie break uppercase first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_case_tie_break_uppercase_first_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_case_tie_break_uppercase_first_054');
      let catalog: Catalog = new Catalog([
        createGoods(561, 'apple', 1000, 'zzz', 'plain', 'plain'),
        createGoods(562, 'Banana', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('a', 10);
      // 'B' (code 66) precedes 'a' (97), so the capitalised title leads even though the query is lower case.
      expect((results).length).assertEqual((['Banana', 'apple']).length);
      for (let __i433: number = 0; __i433 < (['Banana', 'apple']).length; __i433++) {
        expect((results)[__i433]).assertEqual((['Banana', 'apple'])[__i433]);
      }
      expect(results[0].charAt(0)).assertEqual('B');
      expect(results[1].charAt(0)).assertEqual('a');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0550
     * @tc.name      suggest_custom_all_titles_match_prefix_055
     * @tc.desc      Verify suggest custom all titles match prefix.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_all_titles_match_prefix_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_all_titles_match_prefix_055');
      let catalog: Catalog = new Catalog([
        createGoods(563, 'Item A', 1000, 'zzz', 'plain', 'plain'),
        createGoods(564, 'Item B', 1000, 'zzz', 'plain', 'plain'),
        createGoods(565, 'Item C', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('item', 10);
      expect((results).length).assertEqual((['Item A', 'Item B', 'Item C']).length);
      for (let __i434: number = 0; __i434 < (['Item A', 'Item B', 'Item C']).length; __i434++) {
        expect((results)[__i434]).assertEqual((['Item A', 'Item B', 'Item C'])[__i434]);
      }
      expect(results.length).assertEqual(catalog.count());
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0560
     * @tc.name      suggest_punctuation_prefixes_return_empty_056
     * @tc.desc      Verify suggest punctuation prefixes return empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_punctuation_prefixes_return_empty_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_punctuation_prefixes_return_empty_056');
      let prefixes: string[] = ['!!!', '@@', '##', '??'];
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < prefixes.length; index++) {
        expect(engine.suggest(prefixes[index]).length).assertEqual(0);
      }
      expect(engine.suggest('!!!').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0570
     * @tc.name      suggest_limit_equal_small_candidate_count_057
     * @tc.desc      Verify suggest limit equal small candidate count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_limit_equal_small_candidate_count_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_limit_equal_small_candidate_count_057');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('harmony', 2);
      let __seen444: string[] = [];
      for (let __i444: number = 0; __i444 < (results).length; __i444++) {
        expect(__seen444.indexOf((results)[__i444]) < 0).assertTrue();
        __seen444.push((results)[__i444]);
      }
      expect((results).length).assertEqual((['Harmony Phone One', 'Harmony Phone Two']).length);
      for (let __i435: number = 0; __i435 < (['Harmony Phone One', 'Harmony Phone Two']).length; __i435++) {
        expect((results)[__i435]).assertEqual((['Harmony Phone One', 'Harmony Phone Two'])[__i435]);
      }
      expect(results.length > 2).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0580
     * @tc.name      suggest_limit_one_uses_sorted_first_058
     * @tc.desc      Verify suggest limit one uses sorted first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_limit_one_uses_sorted_first_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_limit_one_uses_sorted_first_058');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('e', 1);
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual('Green Tea Pack');
      expect(results[0] === 'Harmony Phone One').assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0590
     * @tc.name      suggest_custom_case_only_duplicates_limit_one_059
     * @tc.desc      Verify suggest custom case only duplicates limit one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_case_only_duplicates_limit_one_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_case_only_duplicates_limit_one_059');
      let catalog: Catalog = new Catalog([
        createGoods(566, 'Tea Pack', 1000, 'zzz', 'plain', 'plain'),
        createGoods(567, 'tea pack', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('tea', 1);
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual('Tea Pack');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0600
     * @tc.name      suggest_custom_zero_limit_with_duplicates_060
     * @tc.desc      Verify suggest custom zero limit with duplicates.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_zero_limit_with_duplicates_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_zero_limit_with_duplicates_060');
      let catalog: Catalog = new Catalog([
        createGoods(568, 'Tea Pack', 1000, 'zzz', 'plain', 'plain'),
        createGoods(569, 'tea pack', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('tea', 0);
      expect(results.length).assertEqual(0);
      expect(catalog.count()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0610
     * @tc.name      suggest_category_token_also_title_returns_one_061
     * @tc.desc      Verify suggest category token also title returns one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_category_token_also_title_returns_one_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_category_token_also_title_returns_one_061');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let results: string[] = engine.suggest('sport');
      // 'sport' is also the category of Smart Watch Pro, yet suggest reads titles only, so one row remains.
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual('Sport Runner Shoes');
      expect(results.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0620
     * @tc.name      suggest_custom_repeated_prefix_in_title_once_062
     * @tc.desc      Verify suggest custom repeated prefix in title once.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_repeated_prefix_in_title_once_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_repeated_prefix_in_title_once_062');
      let catalog: Catalog = new Catalog([
        createGoods(570, 'Phone Phone', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('phone');
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual('Phone Phone');
      expect(results.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0630
     * @tc.name      suggest_custom_all_match_limit_two_sorted_063
     * @tc.desc      Verify suggest custom all match limit two sorted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_all_match_limit_two_sorted_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_all_match_limit_two_sorted_063');
      let catalog: Catalog = new Catalog([
        createGoods(571, 'Item C', 1000, 'zzz', 'plain', 'plain'),
        createGoods(572, 'Item A', 1000, 'zzz', 'plain', 'plain'),
        createGoods(573, 'Item B', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('item', 2);
      expect((results).length).assertEqual((['Item A', 'Item B']).length);
      for (let __i436: number = 0; __i436 < (['Item A', 'Item B']).length; __i436++) {
        expect((results)[__i436]).assertEqual((['Item A', 'Item B'])[__i436]);
      }
      expect(results.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0640
     * @tc.name      suggest_custom_blank_titles_never_returned_064
     * @tc.desc      Verify suggest custom blank titles never returned.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_blank_titles_never_returned_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_blank_titles_never_returned_064');
      let catalog: Catalog = new Catalog([
        createGoods(574, '', 1000, 'zzz', 'plain', 'plain'),
        createGoods(575, 'Phone One', 1000, 'zzz', 'plain', 'plain')
      ]);
      // Five prefixes probe the catalogue; the empty-title row must never surface in any of their results.
      let prefixes: string[] = ['p', 'o', 'h', 'e', 'phone'];
      let engine: SearchEngine = new SearchEngine(catalog);
      for (let index: number = 0; index < prefixes.length; index++) {
        let results: string[] = engine.suggest(prefixes[index], 10);
        for (let itemIndex: number = 0; itemIndex < results.length; itemIndex++) {
          expect(results[itemIndex].length > 0).assertTrue();
        }
      }
      expect(engine.suggest('phone').length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0650
     * @tc.name      suggest_custom_long_title_returns_full_text_065
     * @tc.desc      Verify suggest custom long title returns full text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_custom_long_title_returns_full_text_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_custom_long_title_returns_full_text_065');
      let longTitle: string = 'Super Long Phone Title With Many Words For The Catalogue';
      let catalog: Catalog = new Catalog([
        createGoods(576, longTitle, 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('many words');
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(longTitle);
      expect(results[0].length > 40).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_SUGGEST_0660
     * @tc.name      suggest_tokens_outside_titles_return_empty_066
     * @tc.desc      Verify suggest tokens outside titles return empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('suggest_tokens_outside_titles_return_empty_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: suggest_tokens_outside_titles_return_empty_066');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let prefixes: string[] = [
        'harmony phone one ultra max',
        'harmony  phone',
        'sale',
        'organic',
        'appliances',
        'tablet',
        '_'
      ];

      // Seven probes: an over-long phrase, a double-spaced one, four description-only words and a lone '_'.
      expect(prefixes.length).assertEqual(7);
      for (let index: number = 0; index < prefixes.length; index++) {
        let suggestions: string[] = engine.suggest(prefixes[index]);
        expect(suggestions.length).assertEqual(0);
      }
    });

  });
}
