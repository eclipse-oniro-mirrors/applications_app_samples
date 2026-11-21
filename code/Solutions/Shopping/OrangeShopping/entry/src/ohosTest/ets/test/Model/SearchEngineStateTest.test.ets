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
import { Catalog, Goods, ProductFilter, SearchEngine } from '../Shared/ShopModel';
import { PRODUCTS, SEARCH_KEYWORDS, UNKNOWN_KEYWORDS, createGoods, defaultCatalog, firstHalf, secondHalf } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

function collectIds(items: Goods[]): number[] {
  let ids: number[] = [];
  for (let index: number = 0; index < items.length; index++) {
    ids.push(items[index].id);
  }
  return ids;
}

/** Ascending copy; the input array is left untouched. */
function sortNumbers(values: number[]): number[] {
  let copy: number[] = [];
  for (let index: number = 0; index < values.length; index++) {
    copy.push(values[index]);
  }
  for (let outer: number = 1; outer < copy.length; outer++) {
    let current: number = copy[outer];
    let inner: number = outer - 1;
    while (inner >= 0 && copy[inner] > current) {
      copy[inner + 1] = copy[inner];
      inner--;
    }
    copy[inner + 1] = current;
  }
  return copy;
}

/** Set comparison: collected ids sorted, ignoring emission order. */
function sortedIds(items: Goods[]): number[] {
  return sortNumbers(collectIds(items));
}

/** Only the keyword filters: any category, full price, not inverted. */
function keywordFilter(keyword: string): ProductFilter {
  return new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, keyword, false);
}

/** Independent filter oracle for SearchEngine.search. */
function filterIds(keyword: string): number[] {
  let selected: Goods[] = keywordFilter(keyword).apply(PRODUCTS);
  return sortNumbers(collectIds(selected));
}

export default function searchEngineStateTest() {
  describe('OrangeShoppingSearchEngineState', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'search engine state suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0010
     * @tc.name      state_same_engine_phone_twice_001
     * @tc.desc      Verify state same engine phone twice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_same_engine_phone_twice_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_same_engine_phone_twice_001');
      // Two consecutive phone searches on one engine must return the same six ids.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let first: number[] = collectIds(engine.search('phone'));
      let second: number[] = collectIds(engine.search('phone'));
      expect((second).length).assertEqual((first).length);
      for (let __i257: number = 0; __i257 < (first).length; __i257++) {
        expect((second)[__i257]).assertEqual((first)[__i257]);
      }
      expect((first).length).assertEqual(([0, 1, 8, 9, 6, 14]).length);
      for (let __i258: number = 0; __i258 < ([0, 1, 8, 9, 6, 14]).length; __i258++) {
        expect((first)[__i258]).assertEqual(([0, 1, 8, 9, 6, 14])[__i258]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0020
     * @tc.name      state_same_engine_tea_thrice_002
     * @tc.desc      Verify state same engine tea thrice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_same_engine_tea_thrice_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_same_engine_tea_thrice_002');
      // All three tea searches agree, and both rows carry the duplicate title Green Tea Pack.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let first: Goods[] = engine.search('tea');
      let second: Goods[] = engine.search('tea');
      let third: Goods[] = engine.search('tea');
      expect(([first[0].title, first[1].title]).length).assertEqual(([second[0].title, second[1].title]).length);
      for (let __i299: number = 0; __i299 < ([second[0].title, second[1].title]).length; __i299++) {
        expect(([first[0].title, first[1].title])[__i299]).assertEqual(([second[0].title, second[1].title])[__i299]);
      }
      expect(([second[0].title, second[1].title]).length).assertEqual(([third[0].title, third[1].title]).length);
      for (let __i300: number = 0; __i300 < ([third[0].title, third[1].title]).length; __i300++) {
        expect(([second[0].title, second[1].title])[__i300]).assertEqual(([third[0].title, third[1].title])[__i300]);
      }
      expect(first.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0030
     * @tc.name      state_same_engine_unknown_twice_empty_003
     * @tc.desc      Verify state same engine unknown twice empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_same_engine_unknown_twice_empty_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_same_engine_unknown_twice_empty_003');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let first: Goods[] = engine.search('tablet');
      let second: Goods[] = engine.search('tablet');
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(0);
      expect(first.length).assertEqual(second.length);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0040
     * @tc.name      state_same_engine_keyword_loop_stable_004
     * @tc.desc      Verify state same engine keyword loop stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_same_engine_keyword_loop_stable_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_same_engine_keyword_loop_stable_004');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      for (let index: number = 0; index < SEARCH_KEYWORDS.length; index++) {
        let first: number[] = sortedIds(engine.search(SEARCH_KEYWORDS[index]));
        let second: number[] = sortedIds(engine.search(SEARCH_KEYWORDS[index]));
        expect((second).length).assertEqual((first).length);
        for (let __i259: number = 0; __i259 < (first).length; __i259++) {
          expect((second)[__i259]).assertEqual((first)[__i259]);
        }
        expect(first.length > 0).assertTrue();
      }
      expect(engine.search('blender').length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0050
     * @tc.name      state_same_engine_interleaved_returns_same_005
     * @tc.desc      Verify state same engine interleaved returns same.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_same_engine_interleaved_returns_same_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_same_engine_interleaved_returns_same_005');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let first: number[] = sortedIds(engine.search('tea'));
      engine.search('phone');
      let second: number[] = sortedIds(engine.search('tea'));
      expect((second).length).assertEqual((first).length);
      for (let __i260: number = 0; __i260 < (first).length; __i260++) {
        expect((second)[__i260]).assertEqual((first)[__i260]);
      }
      expect((first).length).assertEqual(([4, 12]).length);
      for (let __i261: number = 0; __i261 < ([4, 12]).length; __i261++) {
        expect((first)[__i261]).assertEqual(([4, 12])[__i261]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0060
     * @tc.name      state_same_engine_interleaved_unknown_006
     * @tc.desc      Verify state same engine interleaved unknown.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_same_engine_interleaved_unknown_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_same_engine_interleaved_unknown_006');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let first: Goods[] = engine.search('tea');
      engine.search('tablet');
      engine.search('zzzz');
      let second: Goods[] = engine.search('tea');
      expect(second.length).assertEqual(first.length);
      expect(second[0].title).assertEqual(first[0].title);
      expect(first.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0070
     * @tc.name      state_same_engine_suggest_twice_007
     * @tc.desc      Verify state same engine suggest twice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_same_engine_suggest_twice_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_same_engine_suggest_twice_007');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let first: string[] = engine.suggest('e', 10);
      let second: string[] = engine.suggest('e', 10);
      expect((second).length).assertEqual((first).length);
      for (let __i301: number = 0; __i301 < (first).length; __i301++) {
        expect((second)[__i301]).assertEqual((first)[__i301]);
      }
      expect(first.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0080
     * @tc.name      state_same_engine_suggest_limit_change_008
     * @tc.desc      Verify state same engine suggest limit change.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_same_engine_suggest_limit_change_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_same_engine_suggest_limit_change_008');
      // A limit of 2 must be a prefix of the limit-5 list, and repeating 2 must reproduce it.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let small: string[] = engine.suggest('e', 2);
      let large: string[] = engine.suggest('e', 5);
      let smallAgain: string[] = engine.suggest('e', 2);
      expect((smallAgain).length).assertEqual((small).length);
      for (let __i302: number = 0; __i302 < (small).length; __i302++) {
        expect((smallAgain)[__i302]).assertEqual((small)[__i302]);
      }
      expect(large.length).assertEqual(5);
      expect(large[0]).assertEqual(small[0]);
      expect(large[1]).assertEqual(small[1]);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0090
     * @tc.name      state_same_engine_e_count_stable_009
     * @tc.desc      Verify state same engine e count stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_same_engine_e_count_stable_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_same_engine_e_count_stable_009');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let first: Goods[] = engine.search('e');
      let second: Goods[] = engine.search('e');
      expect(first.length).assertEqual(16);
      expect(second.length).assertEqual(16);
      let __seen309: number[] = [];
      for (let __i309: number = 0; __i309 < (collectIds(second)).length; __i309++) {
        expect(__seen309.indexOf((collectIds(second))[__i309]) < 0).assertTrue();
        __seen309.push((collectIds(second))[__i309]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0100
     * @tc.name      state_same_engine_multitoken_stable_010
     * @tc.desc      Verify state same engine multitoken stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_same_engine_multitoken_stable_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_same_engine_multitoken_stable_010');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let first: number[] = collectIds(engine.search('green tea'));
      let second: number[] = collectIds(engine.search('green tea'));
      expect((second).length).assertEqual((first).length);
      for (let __i262: number = 0; __i262 < (first).length; __i262++) {
        expect((second)[__i262]).assertEqual((first)[__i262]);
      }
      expect((first).length).assertEqual(([4, 12]).length);
      for (let __i263: number = 0; __i263 < ([4, 12]).length; __i263++) {
        expect((first)[__i263]).assertEqual(([4, 12])[__i263]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0110
     * @tc.name      state_new_engine_same_catalog_identical_011
     * @tc.desc      Verify state new engine same catalog identical.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_new_engine_same_catalog_identical_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_new_engine_same_catalog_identical_011');
      let catalog: Catalog = defaultCatalog();
      let first: SearchEngine = new SearchEngine(catalog);
      let second: SearchEngine = new SearchEngine(catalog);
      expect((collectIds(second.search('phone'))).length).assertEqual((collectIds(first.search('phone'))).length);
      for (let __i264: number = 0; __i264 < (collectIds(first.search('phone'))).length; __i264++) {
        expect((collectIds(second.search('phone')))[__i264]).assertEqual((collectIds(first.search('phone')))[__i264]);
      }
      expect((collectIds(first.search('phone'))).length).assertEqual(([0, 1, 8, 9, 6, 14]).length);
      for (let __i265: number = 0; __i265 < ([0, 1, 8, 9, 6, 14]).length; __i265++) {
        expect((collectIds(first.search('phone')))[__i265]).assertEqual(([0, 1, 8, 9, 6, 14])[__i265]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0120
     * @tc.name      state_new_catalog_same_products_identical_012
     * @tc.desc      Verify state new catalog same products identical.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_new_catalog_same_products_identical_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_new_catalog_same_products_identical_012');
      // Fresh default catalogs emit the sport rows as 3, 11, 2, 10, not in ascending order.
      let first: SearchEngine = new SearchEngine(defaultCatalog());
      let second: SearchEngine = new SearchEngine(defaultCatalog());
      expect((collectIds(second.search('sport'))).length).assertEqual((collectIds(first.search('sport'))).length);
      for (let __i266: number = 0; __i266 < (collectIds(first.search('sport'))).length; __i266++) {
        expect((collectIds(second.search('sport')))[__i266]).assertEqual((collectIds(first.search('sport')))[__i266]);
      }
      expect((collectIds(first.search('sport'))).length).assertEqual(([3, 11, 2, 10]).length);
      for (let __i267: number = 0; __i267 < ([3, 11, 2, 10]).length; __i267++) {
        expect((collectIds(first.search('sport')))[__i267]).assertEqual(([3, 11, 2, 10])[__i267]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0130
     * @tc.name      state_fresh_engine_loop_identical_013
     * @tc.desc      Verify state fresh engine loop identical.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_fresh_engine_loop_identical_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_fresh_engine_loop_identical_013');
      // Five newly constructed engines must all reproduce the six phone ids.
      let baseline: number[] = sortedIds(new SearchEngine(defaultCatalog()).search('phone'));
      for (let index: number = 0; index < 5; index++) {
        let engine: SearchEngine = new SearchEngine(defaultCatalog());
        expect((sortedIds(engine.search('phone'))).length).assertEqual((baseline).length);
        for (let __i268: number = 0; __i268 < (baseline).length; __i268++) {
          expect((sortedIds(engine.search('phone')))[__i268]).assertEqual((baseline)[__i268]);
        }
      }
      expect(baseline.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0140
     * @tc.name      state_new_engine_titles_identical_014
     * @tc.desc      Verify state new engine titles identical.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_new_engine_titles_identical_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_new_engine_titles_identical_014');
      let first: Goods[] = new SearchEngine(defaultCatalog()).search('new_product');
      let second: Goods[] = new SearchEngine(defaultCatalog()).search('new_product');
      let firstTitles: string[] = [];
      let secondTitles: string[] = [];
      for (let index: number = 0; index < first.length; index++) {
        firstTitles.push(first[index].title);
        secondTitles.push(second[index].title);
      }
      expect((secondTitles).length).assertEqual((firstTitles).length);
      for (let __i303: number = 0; __i303 < (firstTitles).length; __i303++) {
        expect((secondTitles)[__i303]).assertEqual((firstTitles)[__i303]);
      }
      expect(first.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0150
     * @tc.name      state_two_engines_independent_015
     * @tc.desc      Verify state two engines independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_two_engines_independent_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_two_engines_independent_015');
      let catalog: Catalog = defaultCatalog();
      let phoneEngine: SearchEngine = new SearchEngine(catalog);
      let teaEngine: SearchEngine = new SearchEngine(catalog);
      let phones: Goods[] = phoneEngine.search('phone');
      let teas: Goods[] = teaEngine.search('tea');
      expect(phones.length).assertEqual(6);
      expect(teas.length).assertEqual(2);
      expect((sortedIds(teas)).length).assertEqual(([4, 12]).length);
      for (let __i269: number = 0; __i269 < ([4, 12]).length; __i269++) {
        expect((sortedIds(teas))[__i269]).assertEqual(([4, 12])[__i269]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0160
     * @tc.name      state_engine_a_search_does_not_affect_b_016
     * @tc.desc      Verify state engine a search does not affect b.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_engine_a_search_does_not_affect_b_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_engine_a_search_does_not_affect_b_016');
      let catalog: Catalog = defaultCatalog();
      let first: SearchEngine = new SearchEngine(catalog);
      let second: SearchEngine = new SearchEngine(catalog);
      let before: number[] = sortedIds(second.search('watch'));
      first.search('phone');
      first.search('e');
      let after: number[] = sortedIds(second.search('watch'));
      expect((after).length).assertEqual((before).length);
      for (let __i270: number = 0; __i270 < (before).length; __i270++) {
        expect((after)[__i270]).assertEqual((before)[__i270]);
      }
      expect((before).length).assertEqual(([2, 10]).length);
      for (let __i271: number = 0; __i271 < ([2, 10]).length; __i271++) {
        expect((before)[__i271]).assertEqual(([2, 10])[__i271]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0170
     * @tc.name      state_new_engine_suggest_identical_017
     * @tc.desc      Verify state new engine suggest identical.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_new_engine_suggest_identical_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_new_engine_suggest_identical_017');
      let first: string[] = new SearchEngine(defaultCatalog()).suggest('e', 10);
      let second: string[] = new SearchEngine(defaultCatalog()).suggest('e', 10);
      expect((second).length).assertEqual((first).length);
      for (let __i304: number = 0; __i304 < (first).length; __i304++) {
        expect((second)[__i304]).assertEqual((first)[__i304]);
      }
      expect(first[0]).assertEqual('Green Tea Pack');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0180
     * @tc.name      state_new_engine_empty_catalog_identical_018
     * @tc.desc      Verify state new engine empty catalog identical.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_new_engine_empty_catalog_identical_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_new_engine_empty_catalog_identical_018');
      let first: SearchEngine = new SearchEngine(new Catalog([]));
      let second: SearchEngine = new SearchEngine(new Catalog([]));
      expect(first.search('phone').length).assertEqual(0);
      expect(second.search('phone').length).assertEqual(0);
      expect(first.suggest('ph').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0190
     * @tc.name      state_empty_catalog_any_keyword_empty_019
     * @tc.desc      Verify state empty catalog any keyword empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_empty_catalog_any_keyword_empty_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_empty_catalog_any_keyword_empty_019');
      let engine: SearchEngine = new SearchEngine(new Catalog([]));
      let keywords: string[] = ['phone', 'tablet', 'phone one', 'e'];
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(0);
        expect(results.length).assertEqual(0);
      }
      expect(engine.search('').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0200
     * @tc.name      state_empty_catalog_suggest_empty_020
     * @tc.desc      Verify state empty catalog suggest empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_empty_catalog_suggest_empty_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_empty_catalog_suggest_empty_020');
      let engine: SearchEngine = new SearchEngine(new Catalog([]));
      let results: string[] = engine.suggest('ph');
      expect(results.length).assertEqual(0);
      expect(results.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0210
     * @tc.name      state_empty_catalog_suggest_limit_empty_021
     * @tc.desc      Verify state empty catalog suggest limit empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_empty_catalog_suggest_limit_empty_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_empty_catalog_suggest_limit_empty_021');
      let engine: SearchEngine = new SearchEngine(new Catalog([]));
      let results: string[] = engine.suggest('ph', 5);
      expect(results.length).assertEqual(0);
      expect(results.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0220
     * @tc.name      state_empty_catalog_repeated_empty_022
     * @tc.desc      Verify state empty catalog repeated empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_empty_catalog_repeated_empty_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_empty_catalog_repeated_empty_022');
      let engine: SearchEngine = new SearchEngine(new Catalog([]));
      let first: Goods[] = engine.search('phone');
      let second: Goods[] = engine.search('phone');
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0230
     * @tc.name      state_empty_catalog_is_reported_empty_023
     * @tc.desc      Verify state empty catalog is reported empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_empty_catalog_is_reported_empty_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_empty_catalog_is_reported_empty_023');
      let catalog: Catalog = new Catalog([]);
      let engine: SearchEngine = new SearchEngine(catalog);
      expect(catalog.isEmpty()).assertTrue();
      expect(catalog.count()).assertEqual(0);
      expect(engine.search('e').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0240
     * @tc.name      state_single_item_title_match_024
     * @tc.desc      Verify state single item title match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_single_item_title_match_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_single_item_title_match_024');
      let catalog: Catalog = new Catalog([
        createGoods(700, 'Solo Nova Phone', 1000, 'solo_cat', 'solo info', 'solo_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova');
      expect(results.length).assertEqual(1);
      expect(results[0].id).assertEqual(700);
      expect(results[0].title).assertEqual('Solo Nova Phone');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0250
     * @tc.name      state_single_item_category_match_025
     * @tc.desc      Verify state single item category match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_single_item_category_match_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_single_item_category_match_025');
      let catalog: Catalog = new Catalog([
        createGoods(700, 'Solo Nova Phone', 1000, 'solo_cat', 'solo info', 'solo_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('solo_cat');
      expect(results.length).assertEqual(1);
      expect(results[0].category).assertEqual('solo_cat');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0260
     * @tc.name      state_single_item_label_match_026
     * @tc.desc      Verify state single item label match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_single_item_label_match_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_single_item_label_match_026');
      let catalog: Catalog = new Catalog([
        createGoods(700, 'Solo Nova Phone', 1000, 'solo_cat', 'solo info', 'solo_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('solo_label');
      expect(results.length).assertEqual(1);
      expect(results[0].labels).assertEqual('solo_label');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0270
     * @tc.name      state_single_item_info_match_027
     * @tc.desc      Verify state single item info match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_single_item_info_match_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_single_item_info_match_027');
      let catalog: Catalog = new Catalog([
        createGoods(700, 'Solo Nova Phone', 1000, 'solo_cat', 'solo info', 'solo_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('info');
      expect(results.length).assertEqual(1);
      expect(results[0].info).assertEqual('solo info');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0280
     * @tc.name      state_single_item_non_match_empty_028
     * @tc.desc      Verify state single item non match empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_single_item_non_match_empty_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_single_item_non_match_empty_028');
      let catalog: Catalog = new Catalog([
        createGoods(700, 'Solo Nova Phone', 1000, 'solo_cat', 'solo info', 'solo_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let keywords: string[] = ['tablet', 'nova tablet'];
      expect(keywords.length).assertEqual(2);
      for (let index: number = 0; index < keywords.length; index++) {
        let results: Goods[] = engine.search(keywords[index]);
        expect(results.length).assertEqual(0);
        expect(results.length).assertEqual(0);
      }
      expect(engine.search('nova').length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0290
     * @tc.name      state_single_item_multi_token_all_match_029
     * @tc.desc      Verify state single item multi token all match.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_single_item_multi_token_all_match_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_single_item_multi_token_all_match_029');
      let catalog: Catalog = new Catalog([
        createGoods(700, 'Solo Nova Phone', 1000, 'solo_cat', 'solo info', 'solo_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('nova phone');
      expect(results.length).assertEqual(1);
      expect(results[0].searchText().indexOf('nova') >= 0).assertTrue();
      expect(results[0].searchText().indexOf('phone') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0300
     * @tc.name      state_single_item_suggest_matches_030
     * @tc.desc      Verify state single item suggest matches.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_single_item_suggest_matches_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_single_item_suggest_matches_030');
      // solo, nova and phone are all prefixes inside Solo Nova Phone, so each suggests that title.
      let catalog: Catalog = new Catalog([
        createGoods(700, 'Solo Nova Phone', 1000, 'solo_cat', 'solo info', 'solo_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let prefixes: string[] = ['solo', 'nova', 'phone'];
      expect(prefixes.length).assertEqual(3);
      for (let index: number = 0; index < prefixes.length; index++) {
        let results: string[] = engine.suggest(prefixes[index]);
        expect(results.length).assertEqual(1);
        expect(results[0]).assertEqual('Solo Nova Phone');
      }
      expect(engine.suggest('tablet').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0310
     * @tc.name      state_single_item_suggest_miss_031
     * @tc.desc      Verify state single item suggest miss.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_single_item_suggest_miss_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_single_item_suggest_miss_031');
      let catalog: Catalog = new Catalog([
        createGoods(700, 'Solo Nova Phone', 1000, 'solo_cat', 'solo info', 'solo_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('tablet');
      expect(results.length).assertEqual(0);
      expect(results.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0320
     * @tc.name      state_single_item_suggest_limit_zero_032
     * @tc.desc      Verify state single item suggest limit zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_single_item_suggest_limit_zero_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_single_item_suggest_limit_zero_032');
      // A limit of 0 must suppress the solo suggestion entirely.
      let catalog: Catalog = new Catalog([
        createGoods(700, 'Solo Nova Phone', 1000, 'solo_cat', 'solo info', 'solo_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: string[] = engine.suggest('solo', 0);
      expect(results.length).assertEqual(0);
      expect(results.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0330
     * @tc.name      state_single_item_two_searches_stable_033
     * @tc.desc      Verify state single item two searches stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_single_item_two_searches_stable_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_single_item_two_searches_stable_033');
      let catalog: Catalog = new Catalog([
        createGoods(700, 'Solo Nova Phone', 1000, 'solo_cat', 'solo info', 'solo_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let first: Goods[] = engine.search('solo');
      let second: Goods[] = engine.search('solo');
      expect((collectIds(second)).length).assertEqual((collectIds(first)).length);
      for (let __i272: number = 0; __i272 < (collectIds(first)).length; __i272++) {
        expect((collectIds(second))[__i272]).assertEqual((collectIds(first))[__i272]);
      }
      expect(first.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0340
     * @tc.name      state_single_item_unknown_then_known_034
     * @tc.desc      Verify state single item unknown then known.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_single_item_unknown_then_known_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_single_item_unknown_then_known_034');
      let catalog: Catalog = new Catalog([
        createGoods(700, 'Solo Nova Phone', 1000, 'solo_cat', 'solo info', 'solo_label')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let miss: Goods[] = engine.search('tablet');
      let hit: Goods[] = engine.search('solo');
      expect(miss.length).assertEqual(0);
      expect(hit.length).assertEqual(1);
      expect(hit[0].id).assertEqual(700);
      expect(hit[0].title).assertEqual('Solo Nova Phone');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0350
     * @tc.name      state_search_keeps_count_035
     * @tc.desc      Verify state search keeps count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_search_keeps_count_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_search_keeps_count_035');
      // Two searches must leave the 16-entry catalog count untouched.
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: number = catalog.count();
      engine.search('phone');
      engine.search('e');
      expect(catalog.count()).assertEqual(before);
      expect(before).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0360
     * @tc.name      state_search_keeps_ids_036
     * @tc.desc      Verify state search keeps ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_search_keeps_ids_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_search_keeps_ids_036');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: number[] = catalog.ids();
      engine.search('sport');
      engine.search('new_product');
      expect((catalog.ids()).length).assertEqual((before).length);
      for (let __i273: number = 0; __i273 < (before).length; __i273++) {
        expect((catalog.ids())[__i273]).assertEqual((before)[__i273]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0370
     * @tc.name      state_search_keeps_titles_037
     * @tc.desc      Verify state search keeps titles.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_search_keeps_titles_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_search_keeps_titles_037');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: string[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        before.push(catalog.all()[index].title);
      }
      engine.search('tea');
      let after: string[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        after.push(catalog.all()[index].title);
      }
      expect((after).length).assertEqual((before).length);
      for (let __i305: number = 0; __i305 < (before).length; __i305++) {
        expect((after)[__i305]).assertEqual((before)[__i305]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0380
     * @tc.name      state_search_keeps_prices_038
     * @tc.desc      Verify state search keeps prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_search_keeps_prices_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_search_keeps_prices_038');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: number[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        before.push(catalog.all()[index].price.cents());
      }
      engine.search('discount');
      let after: number[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        after.push(catalog.all()[index].price.cents());
      }
      expect((after).length).assertEqual((before).length);
      for (let __i274: number = 0; __i274 < (before).length; __i274++) {
        expect((after)[__i274]).assertEqual((before)[__i274]);
      }
      expect(before[0]).assertEqual(499900);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0390
     * @tc.name      state_search_keeps_order_039
     * @tc.desc      Verify state search keeps order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_search_keeps_order_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_search_keeps_order_039');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: number[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        before.push(catalog.all()[index].id);
      }
      engine.search('e');
      let after: number[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        after.push(catalog.all()[index].id);
      }

      expect((after).length).assertEqual((before).length);
      for (let __i275: number = 0; __i275 < (before).length; __i275++) {
        expect((after)[__i275]).assertEqual((before)[__i275]);
      }
      expect(before.length).assertEqual(catalog.count());
      expect(before[0]).assertEqual(0);
      expect(before[before.length - 1]).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0400
     * @tc.name      state_suggest_keeps_count_and_ids_040
     * @tc.desc      Verify state suggest keeps count and ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_suggest_keeps_count_and_ids_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_suggest_keeps_count_and_ids_040');
      // suggest with and without a limit must leave catalog count and ids unchanged.
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let beforeIds: number[] = catalog.ids();
      let beforeCount: number = catalog.count();
      engine.suggest('e', 10);
      engine.suggest('harmony');
      expect(catalog.count()).assertEqual(beforeCount);
      expect((catalog.ids()).length).assertEqual((beforeIds).length);
      for (let __i276: number = 0; __i276 < (beforeIds).length; __i276++) {
        expect((catalog.ids())[__i276]).assertEqual((beforeIds)[__i276]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0410
     * @tc.name      state_search_all_keywords_no_mutation_041
     * @tc.desc      Verify state search all keywords no mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_search_all_keywords_no_mutation_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_search_all_keywords_no_mutation_041');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: number[] = catalog.ids();
      for (let index: number = 0; index < SEARCH_KEYWORDS.length; index++) {
        engine.search(SEARCH_KEYWORDS[index]);
      }
      for (let index: number = 0; index < UNKNOWN_KEYWORDS.length; index++) {
        engine.search(UNKNOWN_KEYWORDS[index]);
      }
      expect((catalog.ids()).length).assertEqual((before).length);
      for (let __i277: number = 0; __i277 < (before).length; __i277++) {
        expect((catalog.ids())[__i277]).assertEqual((before)[__i277]);
      }
      expect(catalog.count()).assertEqual(16);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0420
     * @tc.name      state_interleaved_search_suggest_no_mutation_042
     * @tc.desc      Verify state interleaved search suggest no mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_interleaved_search_suggest_no_mutation_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_interleaved_search_suggest_no_mutation_042');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: string[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        before.push(catalog.all()[index].title);
      }
      engine.search('phone');
      engine.suggest('e', 3);
      engine.search('tea');
      engine.suggest('watch');
      let after: string[] = [];
      for (let index: number = 0; index < catalog.count(); index++) {
        after.push(catalog.all()[index].title);
      }

      expect((after).length).assertEqual((before).length);
      for (let __i306: number = 0; __i306 < (before).length; __i306++) {
        expect((after)[__i306]).assertEqual((before)[__i306]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0430
     * @tc.name      state_filter_tea_same_set_043
     * @tc.desc      Verify state filter tea same set.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_filter_tea_same_set_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_filter_tea_same_set_043');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let searched: number[] = sortedIds(engine.search('tea'));
      let filtered: number[] = filterIds('tea');
      expect((searched).length).assertEqual((filtered).length);
      for (let __i278: number = 0; __i278 < (filtered).length; __i278++) {
        expect((searched)[__i278]).assertEqual((filtered)[__i278]);
      }
      expect((searched).length).assertEqual(([4, 12]).length);
      for (let __i279: number = 0; __i279 < ([4, 12]).length; __i279++) {
        expect((searched)[__i279]).assertEqual(([4, 12])[__i279]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0440
     * @tc.name      state_filter_sport_same_set_044
     * @tc.desc      Verify state filter sport same set.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_filter_sport_same_set_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_filter_sport_same_set_044');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let searched: number[] = sortedIds(engine.search('sport'));
      expect((searched).length).assertEqual((filterIds('sport')).length);
      for (let __i280: number = 0; __i280 < (filterIds('sport')).length; __i280++) {
        expect((searched)[__i280]).assertEqual((filterIds('sport'))[__i280]);
      }
      expect((searched).length).assertEqual(([2, 3, 10, 11]).length);
      for (let __i281: number = 0; __i281 < ([2, 3, 10, 11]).length; __i281++) {
        expect((searched)[__i281]).assertEqual(([2, 3, 10, 11])[__i281]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0450
     * @tc.name      state_filter_hot_sale_same_set_045
     * @tc.desc      Verify state filter hot sale same set.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_filter_hot_sale_same_set_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_filter_hot_sale_same_set_045');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      expect((sortedIds(engine.search('hot_sale'))).length).assertEqual((filterIds('hot_sale')).length);
      for (let __i282: number = 0; __i282 < (filterIds('hot_sale')).length; __i282++) {
        expect((sortedIds(engine.search('hot_sale')))[__i282]).assertEqual((filterIds('hot_sale'))[__i282]);
      }
      expect(filterIds('hot_sale').length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0460
     * @tc.name      state_filter_new_product_same_set_046
     * @tc.desc      Verify state filter new product same set.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_filter_new_product_same_set_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_filter_new_product_same_set_046');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      expect((sortedIds(engine.search('new_product'))).length).assertEqual((filterIds('new_product')).length);
      for (let __i283: number = 0; __i283 < (filterIds('new_product')).length; __i283++) {
        expect((sortedIds(engine.search('new_product')))[__i283]).assertEqual((filterIds('new_product'))[__i283]);
      }
      expect((filterIds('new_product')).length).assertEqual(([0, 2, 5, 8, 10, 13]).length);
      for (let __i284: number = 0; __i284 < ([0, 2, 5, 8, 10, 13]).length; __i284++) {
        expect((filterIds('new_product'))[__i284]).assertEqual(([0, 2, 5, 8, 10, 13])[__i284]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0470
     * @tc.name      state_filter_unknown_both_empty_047
     * @tc.desc      Verify state filter unknown both empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_filter_unknown_both_empty_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_filter_unknown_both_empty_047');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      expect(engine.search('tablet').length).assertEqual(0);
      expect(filterIds('tablet').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0480
     * @tc.name      state_filter_whole_keyword_differs_from_tokens_048
     * @tc.desc      Verify state filter whole keyword differs from tokens.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_filter_whole_keyword_differs_from_tokens_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_filter_whole_keyword_differs_from_tokens_048');
      // ProductFilter treats "phone one" as one literal substring (2 rows), while search ANDs the tokens (6 rows).
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let searched: number[] = sortedIds(engine.search('phone one'));
      let filtered: number[] = filterIds('phone one');
      expect(searched.length).assertEqual(6);
      expect((filtered).length).assertEqual(([0, 8]).length);
      for (let __i285: number = 0; __i285 < ([0, 8]).length; __i285++) {
        expect((filtered)[__i285]).assertEqual(([0, 8])[__i285]);
      }
      expect(searched.length === filtered.length).assertFalse();
      expect(searched.length > filtered.length).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0490
     * @tc.name      state_filter_two_word_substring_same_set_049
     * @tc.desc      Verify state filter two word substring same set.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_filter_two_word_substring_same_set_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_filter_two_word_substring_same_set_049');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      expect((sortedIds(engine.search('green tea'))).length).assertEqual((filterIds('green tea')).length);
      for (let __i286: number = 0; __i286 < (filterIds('green tea')).length; __i286++) {
        expect((sortedIds(engine.search('green tea')))[__i286]).assertEqual((filterIds('green tea'))[__i286]);
      }
      expect((filterIds('green tea')).length).assertEqual(([4, 12]).length);
      for (let __i287: number = 0; __i287 < ([4, 12]).length; __i287++) {
        expect((filterIds('green tea'))[__i287]).assertEqual(([4, 12])[__i287]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0500
     * @tc.name      state_filter_order_differs_but_set_same_050
     * @tc.desc      Verify state filter order differs but set same.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_filter_order_differs_but_set_same_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_filter_order_differs_but_set_same_050');
      // The engine's third phone row is 8 while the filter's third is 6; only the sorted set agrees.
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let searchIds: number[] = collectIds(engine.search('phone'));
      let filtered: Goods[] = keywordFilter('phone').apply(PRODUCTS);
      let filterIdsOrder: number[] = collectIds(filtered);
      expect((sortNumbers(searchIds)).length).assertEqual((sortNumbers(filterIdsOrder)).length);
      for (let __i288: number = 0; __i288 < (sortNumbers(filterIdsOrder)).length; __i288++) {
        expect((sortNumbers(searchIds))[__i288]).assertEqual((sortNumbers(filterIdsOrder))[__i288]);
      }
      expect(searchIds[0]).assertEqual(0);
      expect(filterIdsOrder[0]).assertEqual(0);
      expect(searchIds[2]).assertEqual(8);
      expect(filterIdsOrder[2]).assertEqual(6);
      expect(searchIds[2] === filterIdsOrder[2]).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0510
     * @tc.name      state_filter_blank_keyword_keeps_all_while_search_empty_051
     * @tc.desc      Verify state filter blank keyword keeps all while search empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_filter_blank_keyword_keeps_all_while_search_empty_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_filter_blank_keyword_keeps_all_while_search_empty_051');
      // A blank keyword keeps all 16 rows in ProductFilter, but search('') and search('   ') return none.
      let filtered: Goods[] = keywordFilter('').apply(PRODUCTS);
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let emptySearch: Goods[] = engine.search('');
      let blankSearch: Goods[] = engine.search('   ');
      expect(filtered.length).assertEqual(16);
      expect(emptySearch.length).assertEqual(0);
      expect(blankSearch.length).assertEqual(0);
      expect(filtered.length === emptySearch.length).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0520
     * @tc.name      state_search_count_unchanged_by_page_calls_052
     * @tc.desc      Verify state search count unchanged by page calls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_search_count_unchanged_by_page_calls_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_search_count_unchanged_by_page_calls_052');
      // page(0,5) then page(2,4) must not shrink the six phone results.
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: number[] = sortedIds(engine.search('phone'));
      catalog.page(0, 5);
      catalog.page(2, 4);
      let after: number[] = sortedIds(engine.search('phone'));
      expect((after).length).assertEqual((before).length);
      for (let __i289: number = 0; __i289 < (before).length; __i289++) {
        expect((after)[__i289]).assertEqual((before)[__i289]);
      }
      expect(after.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0530
     * @tc.name      state_search_result_unchanged_by_page_count_053
     * @tc.desc      Verify state search result unchanged by page count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_search_result_unchanged_by_page_count_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_search_result_unchanged_by_page_count_053');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: number[] = sortedIds(engine.search('sport'));
      catalog.pageCount(1);
      catalog.pageCount(3);
      catalog.pageCount(7);
      let after: number[] = sortedIds(engine.search('sport'));
      expect((after).length).assertEqual((before).length);
      for (let __i290: number = 0; __i290 < (before).length; __i290++) {
        expect((after)[__i290]).assertEqual((before)[__i290]);
      }
      expect((before).length).assertEqual(([2, 3, 10, 11]).length);
      for (let __i291: number = 0; __i291 < ([2, 3, 10, 11]).length; __i291++) {
        expect((before)[__i291]).assertEqual(([2, 3, 10, 11])[__i291]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0540
     * @tc.name      state_search_halves_union_full_054
     * @tc.desc      Verify state search halves union full.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_search_halves_union_full_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_search_halves_union_full_054');
      // The phone ids from the two half-catalogs must union to the full six-row set.
      let catalog: Catalog = defaultCatalog();
      let full: number[] = sortedIds(new SearchEngine(catalog).search('phone'));
      let firstHalfIds: number[] = collectIds(
        new SearchEngine(new Catalog(firstHalf(catalog))).search('phone'));
      let secondHalfIds: number[] = collectIds(
        new SearchEngine(new Catalog(secondHalf(catalog))).search('phone'));
      let combined: number[] = [];
      for (let index: number = 0; index < firstHalfIds.length; index++) {
        combined.push(firstHalfIds[index]);
      }
      for (let index: number = 0; index < secondHalfIds.length; index++) {
        combined.push(secondHalfIds[index]);
      }

      expect((sortNumbers(combined)).length).assertEqual((full).length);
      for (let __i292: number = 0; __i292 < (full).length; __i292++) {
        expect((sortNumbers(combined))[__i292]).assertEqual((full)[__i292]);
      }
      expect(full.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0550
     * @tc.name      state_search_halves_no_overlap_055
     * @tc.desc      Verify state search halves no overlap.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_search_halves_no_overlap_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_search_halves_no_overlap_055');
      // Each half contributes exactly three phone ids, with no id shared between the halves.
      let catalog: Catalog = defaultCatalog();
      let firstHalfIds: number[] = collectIds(
        new SearchEngine(new Catalog(firstHalf(catalog))).search('phone'));
      let secondHalfIds: number[] = collectIds(
        new SearchEngine(new Catalog(secondHalf(catalog))).search('phone'));
      expect(firstHalfIds.length).assertEqual(3);
      expect(secondHalfIds.length).assertEqual(3);
      for (let index: number = 0; index < firstHalfIds.length; index++) {
        expect(secondHalfIds.indexOf(firstHalfIds[index]) >= 0).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0560
     * @tc.name      state_search_paged_catalog_is_subset_056
     * @tc.desc      Verify state search paged catalog is subset.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_search_paged_catalog_is_subset_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_search_paged_catalog_is_subset_056');
      // Restricting to the first 8 goods leaves only phone ids 0, 1 and 6.
      let catalog: Catalog = defaultCatalog();
      let firstPage: Catalog = new Catalog(catalog.page(0, 8));
      let engine: SearchEngine = new SearchEngine(firstPage);
      let results: Goods[] = engine.search('phone');
      expect((sortedIds(results)).length).assertEqual(([0, 1, 6]).length);
      for (let __i293: number = 0; __i293 < ([0, 1, 6]).length; __i293++) {
        expect((sortedIds(results))[__i293]).assertEqual(([0, 1, 6])[__i293]);
      }
      expect(results.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0570
     * @tc.name      state_large_catalog_search_all_057
     * @tc.desc      Verify state large catalog search all.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_large_catalog_search_all_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_large_catalog_search_all_057');
      // All 24 distinct bulk items must be returned by a single "bulk" search.
      let goods: Goods[] = [];
      for (let index: number = 0; index < 24; index++) {
        goods.push(createGoods(800 + index, 'Bulk Item ' + index.toString(), 1000, 'zzz', 'plain', 'plain'));
      }
      let catalog: Catalog = new Catalog(goods);
      let engine: SearchEngine = new SearchEngine(catalog);
      let results: Goods[] = engine.search('bulk');
      expect(results.length).assertEqual(24);
      let __seen310: number[] = [];
      for (let __i310: number = 0; __i310 < (collectIds(results)).length; __i310++) {
        expect(__seen310.indexOf((collectIds(results))[__i310]) < 0).assertTrue();
        __seen310.push((collectIds(results))[__i310]);
      }
      expect(catalog.count()).assertEqual(24);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0580
     * @tc.name      state_large_catalog_paged_union_058
     * @tc.desc      Verify state large catalog paged union.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_large_catalog_paged_union_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_large_catalog_paged_union_058');
      // page(0,12) and page(1,12) together cover every one of the 24 catalogue ids.
      let goods: Goods[] = [];
      for (let index: number = 0; index < 24; index++) {
        goods.push(createGoods(800 + index, 'Bulk Item ' + index.toString(), 1000, 'zzz', 'plain', 'plain'));
      }
      let catalog: Catalog = new Catalog(goods);
      let firstPage: number[] = collectIds(new SearchEngine(new Catalog(catalog.page(0, 12))).search('bulk'));
      let secondPage: number[] = collectIds(new SearchEngine(new Catalog(catalog.page(1, 12))).search('bulk'));
      let combined: number[] = [];
      for (let index: number = 0; index < firstPage.length; index++) {
        combined.push(firstPage[index]);
      }
      for (let index: number = 0; index < secondPage.length; index++) {
        combined.push(secondPage[index]);
      }

      expect(firstPage.length).assertEqual(12);
      expect(secondPage.length).assertEqual(12);
      expect((sortNumbers(combined)).length).assertEqual((catalog.ids()).length);
      for (let __i294: number = 0; __i294 < (catalog.ids()).length; __i294++) {
        expect((sortNumbers(combined))[__i294]).assertEqual((catalog.ids())[__i294]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0590
     * @tc.name      state_large_catalog_independent_of_page_size_059
     * @tc.desc      Verify state large catalog independent of page size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_large_catalog_independent_of_page_size_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_large_catalog_independent_of_page_size_059');
      let goods: Goods[] = [];
      for (let index: number = 0; index < 24; index++) {
        goods.push(createGoods(800 + index, 'Bulk Item ' + index.toString(), 1000, 'zzz', 'plain', 'plain'));
      }
      let catalog: Catalog = new Catalog(goods);
      let engine: SearchEngine = new SearchEngine(catalog);
      let before: number = engine.search('bulk').length;
      catalog.pageCount(3);
      catalog.pageCount(5);
      catalog.pageCount(9);
      let after: number = engine.search('bulk').length;
      expect(after).assertEqual(before);
      expect(before).assertEqual(24);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0600
     * @tc.name      state_suggest_then_search_matches_standalone_060
     * @tc.desc      Verify state suggest then search matches standalone.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_suggest_then_search_matches_standalone_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_suggest_then_search_matches_standalone_060');
      let catalog: Catalog = defaultCatalog();
      let engine: SearchEngine = new SearchEngine(catalog);
      let standalone: number[] = sortedIds(new SearchEngine(defaultCatalog()).search('phone'));
      engine.suggest('phone');
      engine.suggest('e', 3);
      let afterSuggest: number[] = sortedIds(engine.search('phone'));
      expect((afterSuggest).length).assertEqual((standalone).length);
      for (let __i295: number = 0; __i295 < (standalone).length; __i295++) {
        expect((afterSuggest)[__i295]).assertEqual((standalone)[__i295]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0610
     * @tc.name      state_search_then_suggest_matches_standalone_061
     * @tc.desc      Verify state search then suggest matches standalone.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_search_then_suggest_matches_standalone_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_search_then_suggest_matches_standalone_061');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let standalone: string[] = new SearchEngine(defaultCatalog()).suggest('e', 10);
      engine.search('tea');
      engine.search('sport');
      let afterSearches: string[] = engine.suggest('e', 10);
      expect((afterSearches).length).assertEqual((standalone).length);
      for (let __i307: number = 0; __i307 < (standalone).length; __i307++) {
        expect((afterSearches)[__i307]).assertEqual((standalone)[__i307]);
      }
      expect(afterSearches.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0620
     * @tc.name      state_suggest_limit_then_search_unaffected_062
     * @tc.desc      Verify state suggest limit then search unaffected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_suggest_limit_then_search_unaffected_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_suggest_limit_then_search_unaffected_062');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let standalone: number[] = sortedIds(engine.search('watch'));
      engine.suggest('e', 1);
      engine.suggest('e', 3);
      engine.suggest('e', 10);
      expect((sortedIds(engine.search('watch'))).length).assertEqual((standalone).length);
      for (let __i296: number = 0; __i296 < (standalone).length; __i296++) {
        expect((sortedIds(engine.search('watch')))[__i296]).assertEqual((standalone)[__i296]);
      }
      expect((standalone).length).assertEqual(([2, 10]).length);
      for (let __i297: number = 0; __i297 < ([2, 10]).length; __i297++) {
        expect((standalone)[__i297]).assertEqual(([2, 10])[__i297]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0630
     * @tc.name      state_alternating_search_suggest_stable_063
     * @tc.desc      Verify state alternating search suggest stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_alternating_search_suggest_stable_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_alternating_search_suggest_stable_063');
      let engine: SearchEngine = new SearchEngine(defaultCatalog());
      let firstIds: number[] = sortedIds(engine.search('tea'));
      let firstSuggest: string[] = engine.suggest('harmony');
      engine.search('phone');
      engine.suggest('e', 2);
      let secondIds: number[] = sortedIds(engine.search('tea'));
      let secondSuggest: string[] = engine.suggest('harmony');
      expect((secondIds).length).assertEqual((firstIds).length);
      for (let __i298: number = 0; __i298 < (firstIds).length; __i298++) {
        expect((secondIds)[__i298]).assertEqual((firstIds)[__i298]);
      }
      expect((secondSuggest).length).assertEqual((firstSuggest).length);
      for (let __i308: number = 0; __i308 < (firstSuggest).length; __i308++) {
        expect((secondSuggest)[__i308]).assertEqual((firstSuggest)[__i308]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0640
     * @tc.name      state_engine_ignores_source_splice_064
     * @tc.desc      Verify state engine ignores source splice.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_engine_ignores_source_splice_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_engine_ignores_source_splice_064');
      // Catalog snapshots the goods array, so splicing the source still leaves all 4 snapshot rows searchable.
      let source: Goods[] = [];
      for (let index: number = 0; index < 4; index++) {
        source.push(createGoods(900 + index, 'Snapshot Item ' + index.toString(), 1000, 'zzz', 'plain', 'plain'));
      }
      let engine: SearchEngine = new SearchEngine(new Catalog(source));
      source.splice(0, 2);
      let results: Goods[] = engine.search('snapshot');
      expect(results.length).assertEqual(4);
      expect(source.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0650
     * @tc.name      state_engine_ignores_source_push_065
     * @tc.desc      Verify state engine ignores source push.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_engine_ignores_source_push_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_engine_ignores_source_push_065');
      let source: Goods[] = [];
      for (let index: number = 0; index < 3; index++) {
        source.push(createGoods(904 + index, 'Snapshot Push ' + index.toString(), 1000, 'zzz', 'plain', 'plain'));
      }
      let engine: SearchEngine = new SearchEngine(new Catalog(source));
      source.push(createGoods(999, 'Snapshot Push Extra', 1000, 'zzz', 'plain', 'plain'));
      let results: Goods[] = engine.search('snapshot');
      expect(results.length).assertEqual(3);
      expect(source.length).assertEqual(4);
      expect(collectIds(results).indexOf(999) >= 0).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0660
     * @tc.name      state_engine_ignores_source_replacement_066
     * @tc.desc      Verify state engine ignores source replacement.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_engine_ignores_source_replacement_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_engine_ignores_source_replacement_066');
      // Replacing source[0] with Gamma cannot affect the snapshot, so "gamma" stays empty.
      let source: Goods[] = [
        createGoods(907, 'Snapshot Replace One', 1000, 'zzz', 'plain', 'plain'),
        createGoods(908, 'Snapshot Replace Two', 1000, 'zzz', 'plain', 'plain')
      ];
      let engine: SearchEngine = new SearchEngine(new Catalog(source));
      source[0] = createGoods(909, 'Gamma Item', 1000, 'zzz', 'plain', 'plain');
      let snapshot: Goods[] = engine.search('snapshot');
      let gamma: Goods[] = engine.search('gamma');
      expect(snapshot.length).assertEqual(2);
      expect(gamma.length).assertEqual(0);
      expect(source[0].id).assertEqual(909);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0670
     * @tc.name      state_engine_sees_goods_field_mutation_067
     * @tc.desc      Verify state engine sees goods field mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_engine_sees_goods_field_mutation_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_engine_sees_goods_field_mutation_067');
      // Catalog shares the Goods objects, so renaming the title on the live object flips the match from live to renamed.
      let catalog: Catalog = new Catalog([
        createGoods(910, 'Live Item One', 1000, 'zzz', 'plain', 'plain')
      ]);
      let engine: SearchEngine = new SearchEngine(catalog);
      let entries: Goods[] = catalog.all();
      entries[0].title = 'Renamed Catalog Item';
      let renamed: Goods[] = engine.search('renamed');
      let stale: Goods[] = engine.search('live');
      expect(renamed.length).assertEqual(1);
      expect(stale.length).assertEqual(0);
      expect(renamed[0].title).assertEqual('Renamed Catalog Item');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0680
     * @tc.name      state_engine_sees_only_subset_catalog_068
     * @tc.desc      Verify state engine sees only subset catalog.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_engine_sees_only_subset_catalog_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_engine_sees_only_subset_catalog_068');
      let subset: Catalog = new Catalog([PRODUCTS[0], PRODUCTS[4]]);
      let engine: SearchEngine = new SearchEngine(subset);
      let phones: Goods[] = engine.search('phone');
      let teas: Goods[] = engine.search('tea');
      expect(phones.length).assertEqual(1);
      expect(phones[0].id).assertEqual(0);
      expect(teas.length).assertEqual(1);
      expect(teas[0].id).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_SEARCH_ENGINE_STATE_0690
     * @tc.name      state_two_engines_share_goods_field_change_069
     * @tc.desc      Verify state two engines share goods field change.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('state_two_engines_share_goods_field_change_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: state_two_engines_share_goods_field_change_069');
      // Both catalogs hold the same Goods reference, so the second engine sees the renamed title.
      let shared: Goods = createGoods(911, 'Shared Item One', 1000, 'zzz', 'plain', 'plain');
      let firstCatalog: Catalog = new Catalog([shared]);
      let secondCatalog: Catalog = new Catalog([shared]);
      let firstEngine: SearchEngine = new SearchEngine(firstCatalog);
      let secondEngine: SearchEngine = new SearchEngine(secondCatalog);
      let firstResults: Goods[] = firstEngine.search('shared');
      expect(firstResults.length).assertEqual(1);
      firstResults[0].title = 'Shared Renamed';
      let secondResults: Goods[] = secondEngine.search('shared');
      expect(secondResults[0].title).assertEqual('Shared Renamed');
      expect(secondResults.length).assertEqual(1);
    });
  });
}
