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
import { CityIndex, CityNode } from '../Shared/ShopModel';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Five roots, five letters, seven cities; A and C carry two children each. */
function sampleRoots(): CityNode[] {
  let roots: CityNode[] = [];
  roots.push(new CityNode('A', [new CityNode('Anhui'), new CityNode('Anqing')]));
  roots.push(new CityNode('B', [new CityNode('Beijing')]));
  roots.push(new CityNode('C', [new CityNode('Chongqing'), new CityNode('Changsha')]));
  roots.push(new CityNode('S', [new CityNode('Shanghai')]));
  roots.push(new CityNode('Z', [new CityNode('Zhejiang')]));
  return roots;
}

/** Three hot names that also exist in sampleRoots, so hits compare to the tree. */
function sampleHotCities(): string[] {
  let hot: string[] = [];
  hot.push('Beijing');
  hot.push('Shanghai');
  hot.push('Chongqing');
  return hot;
}

function sampleIndex(): CityIndex {
  return new CityIndex(sampleRoots(), sampleHotCities());
}

/** One Q root with one child, the smallest non-empty shape. */
function singleLetterIndex(): CityIndex {
  let roots: CityNode[] = [];
  roots.push(new CityNode('Q', [new CityNode('Qinghai')]));
  let hot: string[] = [];
  hot.push('Qinghai');
  return new CityIndex(roots, hot);
}

/** 'Shared' sits under both A and B; findLetterOf reports the first root. */
function duplicateCityIndex(): CityIndex {
  let roots: CityNode[] = [];
  roots.push(new CityNode('A', [new CityNode('Shared')]));
  roots.push(new CityNode('B', [new CityNode('Shared')]));
  let hot: string[] = [];
  hot.push('Shared');
  return new CityIndex(roots, hot);
}

/** Two roots both named A: letters() repeats it, rootOf('A') takes the first. */
function duplicateRootIndex(): CityIndex {
  let roots: CityNode[] = [];
  roots.push(new CityNode('A', [new CityNode('Anhui')]));
  roots.push(new CityNode('A', [new CityNode('Anqing')]));
  let hot: string[] = [];
  return new CityIndex(roots, hot);
}

/** K root with no children: the letter counts, the city does not. */
function childlessRootIndex(): CityIndex {
  let roots: CityNode[] = [];
  roots.push(new CityNode('K'));
  let hot: string[] = [];
  return new CityIndex(roots, hot);
}

/** Anhui also owns Hefei, but depth-two names stay out of citiesOf. */
function nestedIndex(): CityIndex {
  let anhui: CityNode = new CityNode('Anhui', [new CityNode('Hefei')]);
  let roots: CityNode[] = [];
  roots.push(new CityNode('A', [anhui, new CityNode('Anqing')]));
  let hot: string[] = [];
  return new CityIndex(roots, hot);
}

/** A child named '': stored and counted, not filtered out. */
function emptyNamedChildIndex(): CityIndex {
  let roots: CityNode[] = [];
  roots.push(new CityNode('E', [new CityNode('')]));
  let hot: string[] = [];
  return new CityIndex(roots, hot);
}

/** Lowercase 'a' root: lookups compare casing without normalizing. */
function lowercaseRootIndex(): CityIndex {
  let roots: CityNode[] = [];
  roots.push(new CityNode('a', [new CityNode('Anqing')]));
  let hot: string[] = [];
  return new CityIndex(roots, hot);
}

function blankIndex(): CityIndex {
  let roots: CityNode[] = [];
  let hot: string[] = [];
  return new CityIndex(roots, hot);
}

export default function cityIndexTest() {
  describe('OrangeShoppingCityIndex', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'city index suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0010
     * @tc.name      city_index_letters_preserve_root_order_001
     * @tc.desc      Verify city index letters preserve root order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_letters_preserve_root_order_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_letters_preserve_root_order_001');
      let index: CityIndex = sampleIndex();
      let letters: string[] = index.letters();
      expect(letters.length).assertEqual(5);
      expect((letters).length).assertEqual((['A', 'B', 'C', 'S', 'Z']).length);
      for (let __i102: number = 0; __i102 < (['A', 'B', 'C', 'S', 'Z']).length; __i102++) {
        expect((letters)[__i102]).assertEqual((['A', 'B', 'C', 'S', 'Z'])[__i102]);
      }
      expect(letters[0]).assertEqual('A');
      expect(letters[2]).assertEqual('C');
      expect(letters[4]).assertEqual('Z');
      expect(letters[0] !== letters[1]).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0020
     * @tc.name      city_index_root_of_empty_named_root_002
     * @tc.desc      Verify city index root of empty named root.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_root_of_empty_named_root_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_root_of_empty_named_root_002');
      // An empty root name is legal: '' shows up as a letter and still owns Unknownville.
      let roots: CityNode[] = [];
      roots.push(new CityNode('', [new CityNode('Unknownville')]));
      let hot: string[] = [];
      let index: CityIndex = new CityIndex(roots, hot);
      expect((index.letters()).length).assertEqual((['']).length);
      for (let __i103: number = 0; __i103 < (['']).length; __i103++) {
        expect((index.letters())[__i103]).assertEqual(([''])[__i103]);
      }
      let root: CityNode | undefined = index.rootOf('');
      expect(root !== null && root !== undefined).assertTrue();
      if (root !== undefined) {
        expect(root.name).assertEqual('');
        expect((root.childNames()).length).assertEqual((['Unknownville']).length);
        for (let __i104: number = 0; __i104 < (['Unknownville']).length; __i104++) {
          expect((root.childNames())[__i104]).assertEqual((['Unknownville'])[__i104]);
        }
      }
      expect((index.citiesOf('')).length).assertEqual((['Unknownville']).length);
      for (let __i105: number = 0; __i105 < (['Unknownville']).length; __i105++) {
        expect((index.citiesOf(''))[__i105]).assertEqual((['Unknownville'])[__i105]);
      }
      expect(index.findLetterOf('Unknownville')).assertEqual('');
      expect(index.cityCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0030
     * @tc.name      city_index_letters_return_a_new_array_each_call_003
     * @tc.desc      Verify city index letters return a new array each call.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_letters_return_a_new_array_each_call_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_letters_return_a_new_array_each_call_003');
      let index: CityIndex = sampleIndex();
      // Editing the returned array adds X and drops A, yet the next letters() call still rebuilds five.
      let first: string[] = index.letters();
      first.push('X');
      first.splice(0, 1);
      let second: string[] = index.letters();
      expect(first.length).assertEqual(5);
      expect(second.length).assertEqual(5);
      expect((second).length).assertEqual((['A', 'B', 'C', 'S', 'Z']).length);
      for (let __i106: number = 0; __i106 < (['A', 'B', 'C', 'S', 'Z']).length; __i106++) {
        expect((second)[__i106]).assertEqual((['A', 'B', 'C', 'S', 'Z'])[__i106]);
      }
      expect(index.rootOf('X') === null || index.rootOf('X') === undefined).assertTrue();
      expect(first.indexOf('A')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0040
     * @tc.name      city_index_duplicate_city_within_one_root_004
     * @tc.desc      Verify city index duplicate city within one root.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_duplicate_city_within_one_root_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_duplicate_city_within_one_root_004');
      let roots: CityNode[] = [];
      roots.push(new CityNode('A', [new CityNode('Twin'), new CityNode('Twin')]));
      let hot: string[] = [];
      let index: CityIndex = new CityIndex(roots, hot);
      let cities: string[] = index.citiesOf('A');
      expect(cities.length).assertEqual(2);
      expect((cities).length).assertEqual((['Twin', 'Twin']).length);
      for (let __i107: number = 0; __i107 < (['Twin', 'Twin']).length; __i107++) {
        expect((cities)[__i107]).assertEqual((['Twin', 'Twin'])[__i107]);
      }
      expect(index.cityCount()).assertEqual(2);
      expect((index.allCities()).length).assertEqual((['Twin', 'Twin']).length);
      for (let __i108: number = 0; __i108 < (['Twin', 'Twin']).length; __i108++) {
        expect((index.allCities())[__i108]).assertEqual((['Twin', 'Twin'])[__i108]);
      }
      expect(index.findLetterOf('Twin')).assertEqual('A');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0050
     * @tc.name      city_index_letters_do_not_include_city_names_005
     * @tc.desc      Verify city index letters do not include city names.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_letters_do_not_include_city_names_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_letters_do_not_include_city_names_005');
      let index: CityIndex = sampleIndex();
      let letters: string[] = index.letters();
      expect(letters.indexOf('Anhui')).assertEqual(-1);
      expect(letters.indexOf('Beijing')).assertEqual(-1);
      expect(letters.indexOf('Chongqing')).assertEqual(-1);
      expect(letters.indexOf('A') >= 0).assertTrue();
      expect(letters.indexOf('Z') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0060
     * @tc.name      city_index_letters_preserve_root_name_casing_006
     * @tc.desc      Verify city index letters preserve root name casing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_letters_preserve_root_name_casing_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_letters_preserve_root_name_casing_006');
      let index: CityIndex = lowercaseRootIndex();
      let letters: string[] = index.letters();
      expect(letters.length).assertEqual(1);
      expect(letters[0]).assertEqual('a');
      expect(index.citiesOf('a')[0]).assertEqual('Anqing');
      expect(index.rootOf('A') === null || index.rootOf('A') === undefined).assertTrue();
      expect(index.findLetterOf('Anqing')).assertEqual('a');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0070
     * @tc.name      city_index_letters_for_a_single_root_007
     * @tc.desc      Verify city index letters for a single root.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_letters_for_a_single_root_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_letters_for_a_single_root_007');
      let index: CityIndex = singleLetterIndex();
      let letters: string[] = index.letters();
      expect(letters.length).assertEqual(1);
      expect(letters[0]).assertEqual('Q');
      expect((letters).length).assertEqual((['Q']).length);
      for (let __i109: number = 0; __i109 < (['Q']).length; __i109++) {
        expect((letters)[__i109]).assertEqual((['Q'])[__i109]);
      }
      expect(index.cityCount()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0080
     * @tc.name      city_index_letters_empty_without_roots_008
     * @tc.desc      Verify city index letters empty without roots.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_letters_empty_without_roots_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_letters_empty_without_roots_008');
      let index: CityIndex = blankIndex();
      let letters: string[] = index.letters();
      expect(letters.length).assertEqual(0);
      expect(index.rootOf('A') === null || index.rootOf('A') === undefined).assertTrue();
      expect(index.cityCount()).assertEqual(0);
      expect(letters.join('')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0090
     * @tc.name      city_index_find_letter_after_renaming_root_009
     * @tc.desc      Verify city index find letter after renaming root.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_find_letter_after_renaming_root_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_find_letter_after_renaming_root_009');
      let index: CityIndex = sampleIndex();
      // Renaming the B root to P re-keys Beijing; lookups read the live node, not a cached map.
      let root: CityNode | undefined = index.rootOf('B');
      expect(root !== null && root !== undefined).assertTrue();
      if (root !== undefined) {
        root.name = 'P';
      }
      expect(index.rootOf('B') === null || index.rootOf('B') === undefined).assertTrue();
      expect(index.rootOf('P') !== null && index.rootOf('P') !== undefined).assertTrue();
      expect(index.letters().indexOf('P') >= 0).assertTrue();
      expect(index.letters().indexOf('B')).assertEqual(-1);
      expect(index.findLetterOf('Beijing')).assertEqual('P');
      expect(index.cityCount()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0100
     * @tc.name      city_index_root_of_known_letter_returns_the_node_010
     * @tc.desc      Verify city index root of known letter returns the node.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_root_of_known_letter_returns_the_node_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_root_of_known_letter_returns_the_node_010');
      let index: CityIndex = sampleIndex();
      let root: CityNode | undefined = index.rootOf('A');
      expect(root !== null && root !== undefined).assertTrue();
      if (root !== undefined) {
        expect(root.name).assertEqual('A');
        expect(root.isLeaf()).assertFalse();
        let children: string[] = root.childNames();
        expect(children.length).assertEqual(2);
        expect((children).length).assertEqual((['Anhui', 'Anqing']).length);
        for (let __i110: number = 0; __i110 < (['Anhui', 'Anqing']).length; __i110++) {
          expect((children)[__i110]).assertEqual((['Anhui', 'Anqing'])[__i110]);
        }
        expect(root.children.length).assertEqual(2);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0110
     * @tc.name      city_index_root_of_returns_the_same_node_instance_011
     * @tc.desc      Verify city index root of returns the same node instance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_root_of_returns_the_same_node_instance_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_root_of_returns_the_same_node_instance_011');
      let index: CityIndex = sampleIndex();
      let first: CityNode | undefined = index.rootOf('A');
      let second: CityNode | undefined = index.rootOf('A');
      let other: CityNode | undefined = index.rootOf('B');
      expect(first !== null && first !== undefined).assertTrue();
      expect(second !== null && second !== undefined).assertTrue();
      expect(other !== null && other !== undefined).assertTrue();
      if (first !== undefined && second !== undefined && other !== undefined) {
        expect(first === second).assertTrue();
        expect(first !== other).assertTrue();
        expect(second.name).assertEqual('A');
        expect(other.name).assertEqual('B');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0120
     * @tc.name      city_index_root_of_unknown_letter_returns_undefined_012
     * @tc.desc      Verify city index root of unknown letter returns undefined.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_root_of_unknown_letter_returns_undefined_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_root_of_unknown_letter_returns_undefined_012');
      let index: CityIndex = sampleIndex();
      let missing: string[] = ['Q', 'D', 'W', 'R'];
      for (let cursor: number = 0; cursor < missing.length; cursor++) {
        expect(index.rootOf(missing[cursor]) === null || index.rootOf(missing[cursor]) === undefined).assertTrue();
      }
      expect(index.rootOf('Z') !== null && index.rootOf('Z') !== undefined).assertTrue();
      expect(index.citiesOf('Q').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0130
     * @tc.name      city_index_root_of_matches_letter_exactly_013
     * @tc.desc      Verify city index root of matches letter exactly.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_root_of_matches_letter_exactly_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_root_of_matches_letter_exactly_013');
      let index: CityIndex = sampleIndex();
      expect(index.rootOf('a') === null || index.rootOf('a') === undefined).assertTrue();
      expect(index.rootOf('b') === null || index.rootOf('b') === undefined).assertTrue();
      expect(index.rootOf('z') === null || index.rootOf('z') === undefined).assertTrue();
      expect(index.rootOf('A') !== null && index.rootOf('A') !== undefined).assertTrue();
      expect(index.rootOf('B') !== null && index.rootOf('B') !== undefined).assertTrue();
      expect(index.rootOf('Z') !== null && index.rootOf('Z') !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0140
     * @tc.name      city_index_root_of_rejects_empty_letter_014
     * @tc.desc      Verify city index root of rejects empty letter.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_root_of_rejects_empty_letter_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_root_of_rejects_empty_letter_014');
      let index: CityIndex = sampleIndex();
      expect(index.rootOf('') === null || index.rootOf('') === undefined).assertTrue();
      expect(index.rootOf(' ') === null || index.rootOf(' ') === undefined).assertTrue();
      expect(index.rootOf('\t') === null || index.rootOf('\t') === undefined).assertTrue();
      expect(index.letters().length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0150
     * @tc.name      city_index_root_of_rejects_multi_character_letter_015
     * @tc.desc      Verify city index root of rejects multi character letter.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_root_of_rejects_multi_character_letter_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_root_of_rejects_multi_character_letter_015');
      let index: CityIndex = sampleIndex();
      expect(index.rootOf('AB') === null || index.rootOf('AB') === undefined).assertTrue();
      expect(index.rootOf('AA') === null || index.rootOf('AA') === undefined).assertTrue();
      expect(index.rootOf('A ') === null || index.rootOf('A ') === undefined).assertTrue();
      expect(index.rootOf(' A') === null || index.rootOf(' A') === undefined).assertTrue();
      expect(index.rootOf('A') !== null && index.rootOf('A') !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0160
     * @tc.name      city_index_root_of_does_not_match_city_names_016
     * @tc.desc      Verify city index root of does not match city names.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_root_of_does_not_match_city_names_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_root_of_does_not_match_city_names_016');
      let index: CityIndex = sampleIndex();
      expect(index.rootOf('Anhui') === null || index.rootOf('Anhui') === undefined).assertTrue();
      expect(index.rootOf('Beijing') === null || index.rootOf('Beijing') === undefined).assertTrue();
      expect(index.rootOf('Zhejiang') === null || index.rootOf('Zhejiang') === undefined).assertTrue();
      expect(index.findLetterOf('Beijing')).assertEqual('B');
      expect(index.cityCount()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0170
     * @tc.name      city_index_root_of_leaf_root_has_no_children_017
     * @tc.desc      Verify city index root of leaf root has no children.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_root_of_leaf_root_has_no_children_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_root_of_leaf_root_has_no_children_017');
      // A childless root still lends its letter, but adds nothing to citiesOf or the city count.
      let index: CityIndex = childlessRootIndex();
      let root: CityNode | undefined = index.rootOf('K');
      expect(root !== null && root !== undefined).assertTrue();
      if (root !== undefined) {
        expect(root.isLeaf()).assertTrue();
        expect(root.childNames().length).assertEqual(0);
        expect(root.children.length).assertEqual(0);
      }
      expect(index.citiesOf('K').length).assertEqual(0);
      expect(index.cityCount()).assertEqual(0);
      expect((index.letters()).length).assertEqual((['K']).length);
      for (let __i111: number = 0; __i111 < (['K']).length; __i111++) {
        expect((index.letters())[__i111]).assertEqual((['K'])[__i111]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0180
     * @tc.name      city_index_root_of_duplicate_root_letter_returns_first_018
     * @tc.desc      Verify city index root of duplicate root letter returns first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_root_of_duplicate_root_letter_returns_first_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_root_of_duplicate_root_letter_returns_first_018');
      // Both A roots survive verbatim, so letters() returns A twice and lookup stops at the first.
      let index: CityIndex = duplicateRootIndex();
      let root: CityNode | undefined = index.rootOf('A');
      expect(root !== null && root !== undefined).assertTrue();
      if (root !== undefined) {
        expect((root.childNames()).length).assertEqual((['Anhui']).length);
        for (let __i112: number = 0; __i112 < (['Anhui']).length; __i112++) {
          expect((root.childNames())[__i112]).assertEqual((['Anhui'])[__i112]);
        }
      }
      expect((index.letters()).length).assertEqual((['A', 'A']).length);
      for (let __i113: number = 0; __i113 < (['A', 'A']).length; __i113++) {
        expect((index.letters())[__i113]).assertEqual((['A', 'A'])[__i113]);
      }
      expect(index.cityCount()).assertEqual(2);
      expect(index.findLetterOf('Anqing')).assertEqual('A');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0190
     * @tc.name      city_index_root_of_empty_index_019
     * @tc.desc      Verify city index root of empty index.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_root_of_empty_index_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_root_of_empty_index_019');
      let index: CityIndex = blankIndex();
      expect(index.rootOf('A') === null || index.rootOf('A') === undefined).assertTrue();
      expect(index.rootOf('') === null || index.rootOf('') === undefined).assertTrue();
      expect(index.letters().length).assertEqual(0);
      expect(index.cityCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0200
     * @tc.name      city_index_cities_of_known_letter_preserves_order_020
     * @tc.desc      Verify city index cities of known letter preserves order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_known_letter_preserves_order_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_known_letter_preserves_order_020');
      let index: CityIndex = sampleIndex();
      let cities: string[] = index.citiesOf('C');
      expect(cities.length).assertEqual(2);
      expect((cities).length).assertEqual((['Chongqing', 'Changsha']).length);
      for (let __i114: number = 0; __i114 < (['Chongqing', 'Changsha']).length; __i114++) {
        expect((cities)[__i114]).assertEqual((['Chongqing', 'Changsha'])[__i114]);
      }
      expect(cities[0]).assertEqual('Chongqing');
      expect(cities[1]).assertEqual('Changsha');
      expect(index.cityCount()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0210
     * @tc.name      city_index_cities_of_single_child_root_021
     * @tc.desc      Verify city index cities of single child root.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_single_child_root_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_single_child_root_021');
      let index: CityIndex = sampleIndex();
      let cities: string[] = index.citiesOf('B');
      expect(cities.length).assertEqual(1);
      expect(cities[0]).assertEqual('Beijing');
      expect((index.citiesOf('S')).length).assertEqual((['Shanghai']).length);
      for (let __i115: number = 0; __i115 < (['Shanghai']).length; __i115++) {
        expect((index.citiesOf('S'))[__i115]).assertEqual((['Shanghai'])[__i115]);
      }
      expect((index.citiesOf('Z')).length).assertEqual((['Zhejiang']).length);
      for (let __i116: number = 0; __i116 < (['Zhejiang']).length; __i116++) {
        expect((index.citiesOf('Z'))[__i116]).assertEqual((['Zhejiang'])[__i116]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0220
     * @tc.name      city_index_cities_of_unknown_letter_returns_empty_022
     * @tc.desc      Verify city index cities of unknown letter returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_unknown_letter_returns_empty_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_unknown_letter_returns_empty_022');
      let index: CityIndex = sampleIndex();
      let missing: string[] = ['Q', 'b', 'D', 'AB'];
      for (let cursor: number = 0; cursor < missing.length; cursor++) {
        expect(index.citiesOf(missing[cursor]).length).assertEqual(0);
      }
      expect(index.citiesOf('A').length).assertEqual(2);
      expect(index.cityCount()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0230
     * @tc.name      city_index_cities_of_rejects_empty_letter_023
     * @tc.desc      Verify city index cities of rejects empty letter.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_rejects_empty_letter_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_rejects_empty_letter_023');
      let index: CityIndex = sampleIndex();
      expect(index.citiesOf('').length).assertEqual(0);
      expect(index.citiesOf(' ').length).assertEqual(0);
      expect(index.citiesOf('\n').length).assertEqual(0);
      expect(index.letters().length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0240
     * @tc.name      city_index_cities_of_is_case_sensitive_024
     * @tc.desc      Verify city index cities of is case sensitive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_is_case_sensitive_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_is_case_sensitive_024');
      let index: CityIndex = sampleIndex();
      expect((index.citiesOf('A')).length).assertEqual((['Anhui', 'Anqing']).length);
      for (let __i117: number = 0; __i117 < (['Anhui', 'Anqing']).length; __i117++) {
        expect((index.citiesOf('A'))[__i117]).assertEqual((['Anhui', 'Anqing'])[__i117]);
      }
      expect(index.citiesOf('a').length).assertEqual(0);
      expect(index.citiesOf('c').length).assertEqual(0);
      expect(index.citiesOf('z').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0250
     * @tc.name      city_index_cities_of_leaf_root_returns_empty_025
     * @tc.desc      Verify city index cities of leaf root returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_leaf_root_returns_empty_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_leaf_root_returns_empty_025');
      let index: CityIndex = childlessRootIndex();
      expect(index.citiesOf('K').length).assertEqual(0);
      expect((index.citiesOf('K')).length).assertEqual(([]).length);
      for (let __i118: number = 0; __i118 < ([]).length; __i118++) {
        expect((index.citiesOf('K'))[__i118]).assertEqual(([])[__i118]);
      }
      expect(index.allCities().length).assertEqual(0);
      expect((index.letters()).length).assertEqual((['K']).length);
      for (let __i119: number = 0; __i119 < (['K']).length; __i119++) {
        expect((index.letters())[__i119]).assertEqual((['K'])[__i119]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0260
     * @tc.name      city_index_cities_of_returns_a_new_array_each_call_026
     * @tc.desc      Verify city index cities of returns a new array each call.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_returns_a_new_array_each_call_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_returns_a_new_array_each_call_026');
      let index: CityIndex = sampleIndex();
      let first: string[] = index.citiesOf('A');
      first.push('Hefei');
      first.splice(0, 1);
      let second: string[] = index.citiesOf('A');
      expect(first.length).assertEqual(2);
      expect((second).length).assertEqual((['Anhui', 'Anqing']).length);
      for (let __i120: number = 0; __i120 < (['Anhui', 'Anqing']).length; __i120++) {
        expect((second)[__i120]).assertEqual((['Anhui', 'Anqing'])[__i120]);
      }
      expect(index.cityCount()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0270
     * @tc.name      city_index_cities_of_does_not_include_root_name_027
     * @tc.desc      Verify city index cities of does not include root name.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_does_not_include_root_name_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_does_not_include_root_name_027');
      let index: CityIndex = sampleIndex();
      let cities: string[] = index.citiesOf('A');
      expect(cities.indexOf('A')).assertEqual(-1);
      expect(cities.indexOf('Anhui')).assertEqual(0);
      expect(cities.indexOf('Anqing')).assertEqual(1);
      expect(index.letters().indexOf('Anhui')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0280
     * @tc.name      city_index_cities_of_three_children_preserve_order_028
     * @tc.desc      Verify city index cities of three children preserve order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_three_children_preserve_order_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_three_children_preserve_order_028');
      let roots: CityNode[] = [];
      roots.push(new CityNode('G', [new CityNode('Gansu'), new CityNode('Guangdong'),
        new CityNode('Guangxi')]));
      let hot: string[] = [];
      let index: CityIndex = new CityIndex(roots, hot);
      let cities: string[] = index.citiesOf('G');
      expect(cities.length).assertEqual(3);
      expect((cities).length).assertEqual((['Gansu', 'Guangdong', 'Guangxi']).length);
      for (let __i121: number = 0; __i121 < (['Gansu', 'Guangdong', 'Guangxi']).length; __i121++) {
        expect((cities)[__i121]).assertEqual((['Gansu', 'Guangdong', 'Guangxi'])[__i121]);
      }
      expect(cities[2]).assertEqual('Guangxi');
      expect(index.cityCount()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0290
     * @tc.name      city_index_cities_of_ignores_grandchildren_029
     * @tc.desc      Verify city index cities of ignores grandchildren.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_ignores_grandchildren_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_ignores_grandchildren_029');
      let index: CityIndex = nestedIndex();
      let cities: string[] = index.citiesOf('A');
      expect((cities).length).assertEqual((['Anhui', 'Anqing']).length);
      for (let __i122: number = 0; __i122 < (['Anhui', 'Anqing']).length; __i122++) {
        expect((cities)[__i122]).assertEqual((['Anhui', 'Anqing'])[__i122]);
      }
      expect(cities.length).assertEqual(2);
      expect(cities.indexOf('Hefei')).assertEqual(-1);
      expect(index.cityCount()).assertEqual(2);
      expect(index.allCities().indexOf('Hefei')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0300
     * @tc.name      city_index_cities_of_reflects_child_appended_to_root_030
     * @tc.desc      Verify city index cities of reflects child appended to root.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_reflects_child_appended_to_root_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_reflects_child_appended_to_root_030');
      let index: CityIndex = sampleIndex();
      let root: CityNode | undefined = index.rootOf('Z');
      expect(root !== null && root !== undefined).assertTrue();
      if (root !== undefined) {
        root.children.push(new CityNode('Hefei'));
      }
      let cities: string[] = index.citiesOf('Z');
      expect(cities.length).assertEqual(2);
      expect(cities[1]).assertEqual('Hefei');
      expect(index.cityCount()).assertEqual(8);
      expect(index.findLetterOf('Hefei')).assertEqual('Z');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0310
     * @tc.name      city_index_cities_of_after_clearing_root_children_031
     * @tc.desc      Verify city index cities of after clearing root children.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_after_clearing_root_children_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_after_clearing_root_children_031');
      // Deleting Zhejiang's only child keeps the Z letter but drops the city count to 6.
      let index: CityIndex = sampleIndex();
      let root: CityNode | undefined = index.rootOf('Z');
      expect(root !== null && root !== undefined).assertTrue();
      if (root !== undefined) {
        root.children.splice(0, root.children.length);
      }
      expect(index.citiesOf('Z').length).assertEqual(0);
      expect(index.cityCount()).assertEqual(6);
      expect(index.allCities().indexOf('Zhejiang')).assertEqual(-1);
      expect(index.findLetterOf('Zhejiang')).assertEqual('');
      expect((index.letters()).length).assertEqual((['A', 'B', 'C', 'S', 'Z']).length);
      for (let __i123: number = 0; __i123 < (['A', 'B', 'C', 'S', 'Z']).length; __i123++) {
        expect((index.letters())[__i123]).assertEqual((['A', 'B', 'C', 'S', 'Z'])[__i123]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0320
     * @tc.name      city_index_cities_of_includes_empty_named_child_032
     * @tc.desc      Verify city index cities of includes empty named child.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_includes_empty_named_child_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_includes_empty_named_child_032');
      // The empty name is a city like any other: one entry, counted once, and findLetterOf('') maps it to E.
      let index: CityIndex = emptyNamedChildIndex();
      let cities: string[] = index.citiesOf('E');
      expect(cities.length).assertEqual(1);
      expect(cities[0]).assertEqual('');
      expect(index.cityCount()).assertEqual(1);
      expect((index.allCities()).length).assertEqual((['']).length);
      for (let __i124: number = 0; __i124 < (['']).length; __i124++) {
        expect((index.allCities())[__i124]).assertEqual(([''])[__i124]);
      }
      expect(index.findLetterOf('')).assertEqual('E');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0330
     * @tc.name      city_index_all_cities_count_matches_tree_033
     * @tc.desc      Verify city index all cities count matches tree.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_count_matches_tree_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_count_matches_tree_033');
      let index: CityIndex = sampleIndex();
      let cities: string[] = index.allCities();
      expect(cities.length).assertEqual(7);
      expect(index.cityCount()).assertEqual(7);
      // Five roots plus the extra children under A and C: 5 + 2 = 7 leaf cities.
      let rootCount: number = index.letters().length;
      expect(rootCount).assertEqual(5);
      expect(cities.length).assertEqual(rootCount + 2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0340
     * @tc.name      city_index_all_cities_are_unique_in_sample_034
     * @tc.desc      Verify city index all cities are unique in sample.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_are_unique_in_sample_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_are_unique_in_sample_034');
      let index: CityIndex = sampleIndex();
      let cities: string[] = index.allCities();
      let __seen147: string[] = [];
      for (let __i147: number = 0; __i147 < (cities).length; __i147++) {
        expect(__seen147.indexOf((cities)[__i147]) < 0).assertTrue();
        __seen147.push((cities)[__i147]);
      }
      expect(cities.length).assertEqual(7);
      expect(index.cityCount()).assertEqual(cities.length);
      expect(cities.indexOf('Beijing') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0350
     * @tc.name      city_index_all_cities_preserves_depth_first_order_035
     * @tc.desc      Verify city index all cities preserves depth first order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_preserves_depth_first_order_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_preserves_depth_first_order_035');
      let index: CityIndex = sampleIndex();
      let cities: string[] = index.allCities();
      expect((cities).length).assertEqual((['Anhui', 'Anqing', 'Beijing', 'Chongqing',
        'Changsha', 'Shanghai', 'Zhejiang']).length);
      for (let __i125: number = 0; __i125 < (['Anhui', 'Anqing', 'Beijing', 'Chongqing',
        'Changsha', 'Shanghai', 'Zhejiang']).length; __i125++) {
        expect((cities)[__i125]).assertEqual((['Anhui', 'Anqing', 'Beijing', 'Chongqing',
        'Changsha', 'Shanghai', 'Zhejiang'])[__i125]);
      }
      expect(cities[0]).assertEqual('Anhui');
      expect(cities[2]).assertEqual('Beijing');
      expect(cities[cities.length - 1]).assertEqual('Zhejiang');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0360
     * @tc.name      city_index_all_cities_excludes_root_letters_036
     * @tc.desc      Verify city index all cities excludes root letters.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_excludes_root_letters_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_excludes_root_letters_036');
      let index: CityIndex = sampleIndex();
      let cities: string[] = index.allCities();
      let letters: string[] = index.letters();
      for (let cursor: number = 0; cursor < letters.length; cursor++) {
        expect(cities.indexOf(letters[cursor])).assertEqual(-1);
      }
      expect(cities.indexOf('Anhui')).assertEqual(0);
      expect(cities.indexOf('Zhejiang')).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0370
     * @tc.name      city_index_all_cities_after_swapping_children_037
     * @tc.desc      Verify city index all cities after swapping children.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_after_swapping_children_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_after_swapping_children_037');
      let index: CityIndex = sampleIndex();
      let root: CityNode | undefined = index.rootOf('A');
      expect(root !== null && root !== undefined).assertTrue();
      if (root !== undefined) {
        // Swapping the two cursors flips the depth-first walk, so Anqing now precedes Anhui.
        let first: CityNode = root.children[0];
        root.children[0] = root.children[1];
        root.children[1] = first;
      }
      let cities: string[] = index.allCities();
      expect((cities).length).assertEqual((['Anqing', 'Anhui', 'Beijing', 'Chongqing',
        'Changsha', 'Shanghai', 'Zhejiang']).length);
      for (let __i126: number = 0; __i126 < (['Anqing', 'Anhui', 'Beijing', 'Chongqing',
        'Changsha', 'Shanghai', 'Zhejiang']).length; __i126++) {
        expect((cities)[__i126]).assertEqual((['Anqing', 'Anhui', 'Beijing', 'Chongqing',
        'Changsha', 'Shanghai', 'Zhejiang'])[__i126]);
      }
      expect(index.cityCount()).assertEqual(7);
      expect(cities[0]).assertEqual('Anqing');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0380
     * @tc.name      city_index_all_cities_returns_a_fresh_array_038
     * @tc.desc      Verify city index all cities returns a fresh array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_returns_a_fresh_array_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_returns_a_fresh_array_038');
      let index: CityIndex = sampleIndex();
      // Three removed plus Dalian appended leaves the edited copy at five of the original seven.
      let first: string[] = index.allCities();
      first.splice(0, 3);
      first.push('Dalian');
      let second: string[] = index.allCities();
      expect(first.length).assertEqual(5);
      expect(second.length).assertEqual(7);
      expect(second.indexOf('Dalian')).assertEqual(-1);
      expect(index.cityCount()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0390
     * @tc.name      city_index_all_cities_empty_without_roots_039
     * @tc.desc      Verify city index all cities empty without roots.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_empty_without_roots_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_empty_without_roots_039');
      let index: CityIndex = blankIndex();
      expect(index.allCities().length).assertEqual(0);
      expect(index.letters().length).assertEqual(0);
      expect(index.hotCities().length).assertEqual(0);
      expect(index.cityCount()).assertEqual(0);
      expect((index.allCities()).length).assertEqual(([]).length);
      for (let __i127: number = 0; __i127 < ([]).length; __i127++) {
        expect((index.allCities())[__i127]).assertEqual(([])[__i127]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0400
     * @tc.name      city_index_all_cities_empty_when_roots_have_no_children_040
     * @tc.desc      Verify city index all cities empty when roots have no children.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_empty_when_roots_have_no_children_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_empty_when_roots_have_no_children_040');
      let index: CityIndex = childlessRootIndex();
      expect(index.allCities().length).assertEqual(0);
      expect(index.cityCount()).assertEqual(0);
      expect((index.letters()).length).assertEqual((['K']).length);
      for (let __i128: number = 0; __i128 < (['K']).length; __i128++) {
        expect((index.letters())[__i128]).assertEqual((['K'])[__i128]);
      }
      expect(index.citiesOf('K').length).assertEqual(0);
      expect(index.findLetterOf('K')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0410
     * @tc.name      city_index_all_cities_keeps_duplicates_across_roots_041
     * @tc.desc      Verify city index all cities keeps duplicates across roots.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_keeps_duplicates_across_roots_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_keeps_duplicates_across_roots_041');
      let index: CityIndex = duplicateCityIndex();
      let cities: string[] = index.allCities();
      expect((cities).length).assertEqual((['Shared', 'Shared']).length);
      for (let __i129: number = 0; __i129 < (['Shared', 'Shared']).length; __i129++) {
        expect((cities)[__i129]).assertEqual((['Shared', 'Shared'])[__i129]);
      }
      expect(cities.length).assertEqual(2);
      expect(index.cityCount()).assertEqual(2);
      expect(index.findLetterOf('Shared')).assertEqual('A');
      expect((index.citiesOf('B')).length).assertEqual((['Shared']).length);
      for (let __i130: number = 0; __i130 < (['Shared']).length; __i130++) {
        expect((index.citiesOf('B'))[__i130]).assertEqual((['Shared'])[__i130]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0420
     * @tc.name      city_index_city_count_after_clearing_children_042
     * @tc.desc      Verify city index city count after clearing children.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_city_count_after_clearing_children_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_city_count_after_clearing_children_042');
      let index: CityIndex = sampleIndex();
      let root: CityNode | undefined = index.rootOf('A');
      expect(root !== null && root !== undefined).assertTrue();
      // Dropping A's two cities leaves five of the original seven spread across the other roots.
      if (root !== undefined) {
        root.children.splice(0, root.children.length);
      }
      expect(index.cityCount()).assertEqual(5);
      expect(index.allCities().length).assertEqual(5);
      expect(index.citiesOf('A').length).assertEqual(0);
      expect(index.letters().length).assertEqual(5);
      expect(index.allCities().indexOf('Anhui')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0430
     * @tc.name      city_index_all_cities_includes_empty_named_city_043
     * @tc.desc      Verify city index all cities includes empty named city.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_includes_empty_named_city_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_includes_empty_named_city_043');
      let index: CityIndex = emptyNamedChildIndex();
      let cities: string[] = index.allCities();
      expect(cities.length).assertEqual(1);
      expect(cities[0]).assertEqual('');
      expect(index.cityCount()).assertEqual(1);
      expect((index.letters()).length).assertEqual((['E']).length);
      for (let __i131: number = 0; __i131 < (['E']).length; __i131++) {
        expect((index.letters())[__i131]).assertEqual((['E'])[__i131]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0440
     * @tc.name      city_index_all_cities_after_renaming_a_child_044
     * @tc.desc      Verify city index all cities after renaming a child.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_after_renaming_a_child_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_after_renaming_a_child_044');
      let index: CityIndex = sampleIndex();
      let root: CityNode | undefined = index.rootOf('A');
      expect(root !== null && root !== undefined).assertTrue();
      // The renamed child keeps slot 0, so Wuhu inherits that position and Anhui leaves the reverse lookup.
      if (root !== undefined) {
        root.children[0].name = 'Wuhu';
      }
      let cities: string[] = index.allCities();
      expect(cities.length).assertEqual(7);
      expect(cities.indexOf('Anhui')).assertEqual(-1);
      expect(cities.indexOf('Wuhu')).assertEqual(0);
      expect(index.findLetterOf('Wuhu')).assertEqual('A');
      expect(index.findLetterOf('Anhui')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0450
     * @tc.name      city_index_all_cities_single_root_045
     * @tc.desc      Verify city index all cities single root.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_single_root_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_single_root_045');
      let index: CityIndex = singleLetterIndex();
      expect((index.allCities()).length).assertEqual((['Qinghai']).length);
      for (let __i132: number = 0; __i132 < (['Qinghai']).length; __i132++) {
        expect((index.allCities())[__i132]).assertEqual((['Qinghai'])[__i132]);
      }
      expect(index.allCities().length).assertEqual(1);
      expect(index.cityCount()).assertEqual(1);
      expect(index.findLetterOf('Qinghai')).assertEqual('Q');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0460
     * @tc.name      city_index_cities_of_after_removing_first_child_046
     * @tc.desc      Verify city index cities of after removing first child.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_cities_of_after_removing_first_child_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_cities_of_after_removing_first_child_046');
      let index: CityIndex = sampleIndex();
      let root: CityNode | undefined = index.rootOf('A');
      expect(root !== null && root !== undefined).assertTrue();
      if (root !== undefined) {
        root.children.splice(0, 1);
      }
      expect((index.citiesOf('A')).length).assertEqual((['Anqing']).length);
      for (let __i133: number = 0; __i133 < (['Anqing']).length; __i133++) {
        expect((index.citiesOf('A'))[__i133]).assertEqual((['Anqing'])[__i133]);
      }
      expect(index.cityCount()).assertEqual(6);
      expect(index.allCities().indexOf('Anhui')).assertEqual(-1);
      expect(index.findLetterOf('Anhui')).assertEqual('');
      expect(index.findLetterOf('Anqing')).assertEqual('A');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0470
     * @tc.name      city_index_hot_cities_return_configured_list_047
     * @tc.desc      Verify city index hot cities return configured list.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_hot_cities_return_configured_list_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_hot_cities_return_configured_list_047');
      let index: CityIndex = sampleIndex();
      let hot: string[] = index.hotCities();
      expect(hot.length).assertEqual(3);
      expect((hot).length).assertEqual((['Beijing', 'Shanghai', 'Chongqing']).length);
      for (let __i134: number = 0; __i134 < (['Beijing', 'Shanghai', 'Chongqing']).length; __i134++) {
        expect((hot)[__i134]).assertEqual((['Beijing', 'Shanghai', 'Chongqing'])[__i134]);
      }
      expect(hot.indexOf('Beijing') >= 0).assertTrue();
      expect(hot.indexOf('Chongqing') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0480
     * @tc.name      city_index_hot_cities_return_a_copy_048
     * @tc.desc      Verify city index hot cities return a copy.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_hot_cities_return_a_copy_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_hot_cities_return_a_copy_048');
      let index: CityIndex = sampleIndex();
      let first: string[] = index.hotCities();
      first.push('Shenzhen');
      first.splice(0, 1);
      let second: string[] = index.hotCities();
      expect(first.length).assertEqual(3);
      expect(second.length).assertEqual(3);
      expect(index.isHot('Beijing')).assertTrue();
      expect(index.isHot('Shenzhen')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0490
     * @tc.name      city_index_hot_cities_after_tree_queries_049
     * @tc.desc      Verify city index hot cities after tree queries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_hot_cities_after_tree_queries_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_hot_cities_after_tree_queries_049');
      let index: CityIndex = sampleIndex();
      let hot: string[] = index.hotCities();
      expect((index.letters()).length).assertEqual((['A', 'B', 'C', 'S', 'Z']).length);
      for (let __i135: number = 0; __i135 < (['A', 'B', 'C', 'S', 'Z']).length; __i135++) {
        expect((index.letters())[__i135]).assertEqual((['A', 'B', 'C', 'S', 'Z'])[__i135]);
      }
      expect(index.rootOf('B') !== null && index.rootOf('B') !== undefined).assertTrue();
      expect((index.citiesOf('C')).length).assertEqual((['Chongqing', 'Changsha']).length);
      for (let __i136: number = 0; __i136 < (['Chongqing', 'Changsha']).length; __i136++) {
        expect((index.citiesOf('C'))[__i136]).assertEqual((['Chongqing', 'Changsha'])[__i136]);
      }
      expect(index.allCities().length).assertEqual(7);
      expect(index.isHot('Shanghai')).assertTrue();
      expect((index.hotCities()).length).assertEqual((hot).length);
      for (let __i137: number = 0; __i137 < (hot).length; __i137++) {
        expect((index.hotCities())[__i137]).assertEqual((hot)[__i137]);
      }
      expect(index.hotCities().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0500
     * @tc.name      city_index_hot_cities_empty_without_configuration_050
     * @tc.desc      Verify city index hot cities empty without configuration.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_hot_cities_empty_without_configuration_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_hot_cities_empty_without_configuration_050');
      let index: CityIndex = blankIndex();
      let hot: string[] = index.hotCities();
      expect(hot.length).assertEqual(0);
      expect(index.isHot('Beijing')).assertFalse();
      expect(index.cityCount()).assertEqual(0);
      expect(index.allCities().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0510
     * @tc.name      city_index_hot_cities_keep_duplicates_051
     * @tc.desc      Verify city index hot cities keep duplicates.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_hot_cities_keep_duplicates_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_hot_cities_keep_duplicates_051');
      let roots: CityNode[] = sampleRoots();
      let hot: string[] = [];
      // The hot list is stored as given, so the same name twice yields two entries.
      hot.push('Beijing');
      hot.push('Beijing');
      let index: CityIndex = new CityIndex(roots, hot);
      let listed: string[] = index.hotCities();
      expect(listed.length).assertEqual(2);
      expect((listed).length).assertEqual((['Beijing', 'Beijing']).length);
      for (let __i138: number = 0; __i138 < (['Beijing', 'Beijing']).length; __i138++) {
        expect((listed)[__i138]).assertEqual((['Beijing', 'Beijing'])[__i138]);
      }
      expect(index.isHot('Beijing')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0520
     * @tc.name      city_index_hot_cities_are_independent_of_tree_052
     * @tc.desc      Verify city index hot cities are independent of tree.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_hot_cities_are_independent_of_tree_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_hot_cities_are_independent_of_tree_052');
      let roots: CityNode[] = sampleRoots();
      let hot: string[] = [];
      hot.push('Shenzhen');
      let index: CityIndex = new CityIndex(roots, hot);
      expect(index.isHot('Shenzhen')).assertTrue();
      expect(index.citiesOf('S').indexOf('Shenzhen')).assertEqual(-1);
      expect(index.findLetterOf('Shenzhen')).assertEqual('');
      expect(index.cityCount()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0530
     * @tc.name      city_index_is_hot_hit_returns_true_053
     * @tc.desc      Verify city index is hot hit returns true.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_is_hot_hit_returns_true_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_is_hot_hit_returns_true_053');
      let index: CityIndex = sampleIndex();
      expect(index.isHot('Beijing')).assertTrue();
      expect(index.isHot('Shanghai')).assertTrue();
      expect(index.isHot('Chongqing')).assertTrue();
      expect(index.hotCities().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0540
     * @tc.name      city_index_is_hot_requires_exact_configured_name_054
     * @tc.desc      Verify city index is hot requires exact configured name.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_is_hot_requires_exact_configured_name_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_is_hot_requires_exact_configured_name_054');
      let index: CityIndex = sampleIndex();
      // A prefix, a trailing space and an extra word all miss; only the exact configured string hits.
      let misses: string[] = ['Shenzhen', 'Bei', 'Beijing ', 'Beijing City'];
      let hits: string[] = ['Beijing', 'Shanghai', 'Chongqing'];
      expect(misses.length).assertEqual(4);
      for (let cursor: number = 0; cursor < misses.length; cursor++) {
        expect(index.isHot(misses[cursor])).assertFalse();
      }
      for (let cursor: number = 0; cursor < hits.length; cursor++) {
        expect(index.isHot(hits[cursor])).assertTrue();
      }
      expect(index.hotCities().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0550
     * @tc.name      city_index_is_hot_is_case_sensitive_055
     * @tc.desc      Verify city index is hot is case sensitive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_is_hot_is_case_sensitive_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_is_hot_is_case_sensitive_055');
      let index: CityIndex = sampleIndex();
      expect(index.isHot('Beijing')).assertTrue();
      expect(index.isHot('beijing')).assertFalse();
      expect(index.isHot('BEIJING')).assertFalse();
      expect(index.isHot('BeiJing')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0560
     * @tc.name      city_index_is_hot_rejects_empty_string_056
     * @tc.desc      Verify city index is hot rejects empty string.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_is_hot_rejects_empty_string_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_is_hot_rejects_empty_string_056');
      let index: CityIndex = sampleIndex();
      expect(index.isHot('')).assertFalse();
      expect(index.isHot(' ')).assertFalse();
      expect(index.isHot('\t')).assertFalse();
      expect(index.hotCities().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0570
     * @tc.name      city_index_is_hot_uses_the_configured_case_057
     * @tc.desc      Verify city index is hot uses the configured case.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_is_hot_uses_the_configured_case_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_is_hot_uses_the_configured_case_057');
      let roots: CityNode[] = sampleRoots();
      let hot: string[] = [];
      hot.push('beijing');
      let index: CityIndex = new CityIndex(roots, hot);
      expect(index.isHot('beijing')).assertTrue();
      expect(index.isHot('Beijing')).assertFalse();
      expect(index.hotCities().length).assertEqual(1);
      expect((index.hotCities()).length).assertEqual((['beijing']).length);
      for (let __i139: number = 0; __i139 < (['beijing']).length; __i139++) {
        expect((index.hotCities())[__i139]).assertEqual((['beijing'])[__i139]);
      }
      expect(index.cityCount()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0580
     * @tc.name      city_index_is_hot_true_for_configured_root_letter_058
     * @tc.desc      Verify city index is hot true for configured root letter.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_is_hot_true_for_configured_root_letter_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_is_hot_true_for_configured_root_letter_058');
      let roots: CityNode[] = sampleRoots();
      let hot: string[] = [];
      hot.push('A');
      let index: CityIndex = new CityIndex(roots, hot);
      expect(index.isHot('A')).assertTrue();
      expect(index.isHot('B')).assertFalse();
      expect(index.isHot('Beijing')).assertFalse();
      expect(index.hotCities().length).assertEqual(1);
      expect(index.cityCount()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0590
     * @tc.name      city_index_is_hot_false_with_empty_hot_list_059
     * @tc.desc      Verify city index is hot false with empty hot list.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_is_hot_false_with_empty_hot_list_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_is_hot_false_with_empty_hot_list_059');
      let roots: CityNode[] = sampleRoots();
      let hot: string[] = [];
      let index: CityIndex = new CityIndex(roots, hot);
      expect(index.isHot('Beijing')).assertFalse();
      expect(index.isHot('Shanghai')).assertFalse();
      expect(index.hotCities().length).assertEqual(0);
      expect(index.cityCount()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0600
     * @tc.name      city_index_is_hot_false_for_root_letter_060
     * @tc.desc      Verify city index is hot false for root letter.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_is_hot_false_for_root_letter_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_is_hot_false_for_root_letter_060');
      let index: CityIndex = sampleIndex();
      expect(index.isHot('A')).assertFalse();
      expect(index.isHot('B')).assertFalse();
      expect(index.isHot('Z')).assertFalse();
      expect(index.isHot('Beijing')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0610
     * @tc.name      city_index_find_letter_of_known_city_061
     * @tc.desc      Verify city index find letter of known city.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_find_letter_of_known_city_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_find_letter_of_known_city_061');
      let index: CityIndex = sampleIndex();
      expect(index.findLetterOf('Beijing')).assertEqual('B');
      expect(index.findLetterOf('Anhui')).assertEqual('A');
      expect(index.findLetterOf('Shanghai')).assertEqual('S');
      expect(index.findLetterOf('Zhejiang')).assertEqual('Z');
      expect(index.findLetterOf('Anqing')).assertEqual('A');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0620
     * @tc.name      city_index_find_letter_resolves_exact_child_names_062
     * @tc.desc      Verify city index find letter resolves exact child names.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_find_letter_resolves_exact_child_names_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_find_letter_resolves_exact_child_names_062');
      let index: CityIndex = sampleIndex();
      let cities: string[] = ['Chongqing', 'Anhui', 'A', 'Beijing', 'beijing'];
      // 'A' is a root letter rather than a city, and 'beijing' misses the casing, so both map to ''.
      let letters: string[] = ['C', 'A', '', 'B', ''];
      expect(cities.length).assertEqual(letters.length);
      for (let cursor: number = 0; cursor < cities.length; cursor++) {
        expect(index.findLetterOf(cities[cursor])).assertEqual(letters[cursor]);
      }
      expect(index.cityCount()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0630
     * @tc.name      city_index_find_letter_of_unknown_city_returns_empty_063
     * @tc.desc      Verify city index find letter of unknown city returns empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_find_letter_of_unknown_city_returns_empty_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_find_letter_of_unknown_city_returns_empty_063');
      let index: CityIndex = sampleIndex();
      let missing: string[] = ['Chengdu', 'Dalian', 'Shenzhen', 'Hefei'];
      for (let cursor: number = 0; cursor < missing.length; cursor++) {
        expect(index.findLetterOf(missing[cursor])).assertEqual('');
      }
      expect(index.findLetterOf('Beijing')).assertEqual('B');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0640
     * @tc.name      city_index_find_letter_of_rejects_empty_city_064
     * @tc.desc      Verify city index find letter of rejects empty city.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_find_letter_of_rejects_empty_city_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_find_letter_of_rejects_empty_city_064');
      let index: CityIndex = sampleIndex();
      expect(index.findLetterOf('')).assertEqual('');
      expect(index.findLetterOf(' ')).assertEqual('');
      expect(index.findLetterOf('\t')).assertEqual('');
      expect(index.cityCount()).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0650
     * @tc.name      city_index_find_letter_of_first_root_wins_for_duplicate_city_065
     * @tc.desc      Verify city index find letter of first root wins for duplicate city.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_find_letter_of_first_root_wins_for_duplicate_city_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_find_letter_of_first_root_wins_for_duplicate_city_065');
      // Shared sits under both roots; the scan returns the first root that owns it.
      let index: CityIndex = duplicateCityIndex();
      expect(index.findLetterOf('Shared')).assertEqual('A');
      expect(index.cityCount()).assertEqual(2);
      expect((index.citiesOf('A')).length).assertEqual((['Shared']).length);
      for (let __i140: number = 0; __i140 < (['Shared']).length; __i140++) {
        expect((index.citiesOf('A'))[__i140]).assertEqual((['Shared'])[__i140]);
      }
      expect((index.citiesOf('B')).length).assertEqual((['Shared']).length);
      for (let __i141: number = 0; __i141 < (['Shared']).length; __i141++) {
        expect((index.citiesOf('B'))[__i141]).assertEqual((['Shared'])[__i141]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0660
     * @tc.name      city_index_find_letter_of_empty_index_066
     * @tc.desc      Verify city index find letter of empty index.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_find_letter_of_empty_index_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_find_letter_of_empty_index_066');
      let index: CityIndex = blankIndex();
      expect(index.findLetterOf('Beijing')).assertEqual('');
      expect(index.findLetterOf('')).assertEqual('');
      expect(index.allCities().length).assertEqual(0);
      expect(index.letters().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0670
     * @tc.name      city_index_find_letter_of_ignores_grandchildren_067
     * @tc.desc      Verify city index find letter of ignores grandchildren.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_find_letter_of_ignores_grandchildren_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_find_letter_of_ignores_grandchildren_067');
      let index: CityIndex = nestedIndex();
      expect(index.findLetterOf('Anhui')).assertEqual('A');
      expect(index.findLetterOf('Hefei')).assertEqual('');
      expect(index.findLetterOf('Anqing')).assertEqual('A');
      expect(index.cityCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0680
     * @tc.name      city_index_find_letter_of_empty_named_city_068
     * @tc.desc      Verify city index find letter of empty named city.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_find_letter_of_empty_named_city_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_find_letter_of_empty_named_city_068');
      let index: CityIndex = emptyNamedChildIndex();
      expect(index.findLetterOf('')).assertEqual('E');
      expect(index.cityCount()).assertEqual(1);
      expect((index.citiesOf('E')).length).assertEqual((['']).length);
      for (let __i142: number = 0; __i142 < (['']).length; __i142++) {
        expect((index.citiesOf('E'))[__i142]).assertEqual(([''])[__i142]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0690
     * @tc.name      city_index_city_count_matches_all_cities_length_069
     * @tc.desc      Verify city index city count matches all cities length.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_city_count_matches_all_cities_length_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_city_count_matches_all_cities_length_069');
      let index: CityIndex = sampleIndex();
      expect(index.cityCount()).assertEqual(index.allCities().length);
      expect(index.cityCount()).assertEqual(7);
      expect(index.letters().length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0700
     * @tc.name      city_index_city_count_zero_for_empty_index_070
     * @tc.desc      Verify city index city count zero for empty index.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_city_count_zero_for_empty_index_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_city_count_zero_for_empty_index_070');
      let index: CityIndex = blankIndex();
      expect(index.cityCount()).assertEqual(0);
      expect(index.allCities().length).assertEqual(0);
      expect(index.letters().length).assertEqual(0);
      expect(index.hotCities().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0710
     * @tc.name      city_index_city_count_zero_when_roots_are_childless_071
     * @tc.desc      Verify city index city count zero when roots are childless.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_city_count_zero_when_roots_are_childless_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_city_count_zero_when_roots_are_childless_071');
      let index: CityIndex = childlessRootIndex();
      expect(index.cityCount()).assertEqual(0);
      expect(index.letters().length).assertEqual(1);
      expect(index.letters()[0]).assertEqual('K');
      expect(index.citiesOf('K').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0720
     * @tc.name      city_index_city_count_for_single_root_072
     * @tc.desc      Verify city index city count for single root.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_city_count_for_single_root_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_city_count_for_single_root_072');
      let index: CityIndex = singleLetterIndex();
      expect(index.cityCount()).assertEqual(1);
      expect(index.allCities().length).assertEqual(1);
      expect(index.allCities()[0]).assertEqual('Qinghai');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0730
     * @tc.name      city_index_city_count_counts_duplicate_names_073
     * @tc.desc      Verify city index city count counts duplicate names.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_city_count_counts_duplicate_names_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_city_count_counts_duplicate_names_073');
      // The same name under two roots is not folded: two entries, two cities, two letters.
      let index: CityIndex = duplicateCityIndex();
      expect(index.cityCount()).assertEqual(2);
      expect(index.allCities().length).assertEqual(2);
      expect(index.letters().length).assertEqual(2);
      expect(index.allCities()[1]).assertEqual('Shared');
      expect(index.allCities()[0]).assertEqual(index.allCities()[1]);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0740
     * @tc.name      city_index_city_count_updates_when_tree_grows_074
     * @tc.desc      Verify city index city count updates when tree grows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_city_count_updates_when_tree_grows_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_city_count_updates_when_tree_grows_074');
      let index: CityIndex = singleLetterIndex();
      expect(index.cityCount()).assertEqual(1);
      let root: CityNode | undefined = index.rootOf('Q');
      expect(root !== null && root !== undefined).assertTrue();
      if (root !== undefined) {
        root.children.push(new CityNode('Xining'));
      }
      expect(index.cityCount()).assertEqual(2);
      expect(index.allCities().length).assertEqual(2);
      expect(index.findLetterOf('Xining')).assertEqual('Q');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0750
     * @tc.name      city_index_city_node_leaf_status_075
     * @tc.desc      Verify city index city node leaf status.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_city_node_leaf_status_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_city_node_leaf_status_075');
      let parent: CityNode = new CityNode('G', [new CityNode('Gansu'), new CityNode('Guangdong')]);
      let leaf: CityNode = new CityNode('Gansu');
      expect(parent.isLeaf()).assertFalse();
      expect(leaf.isLeaf()).assertTrue();
      expect(parent.children.length).assertEqual(2);
      expect(leaf.children.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0760
     * @tc.name      city_index_city_node_child_names_preserve_order_076
     * @tc.desc      Verify city index city node child names preserve order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_city_node_child_names_preserve_order_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_city_node_child_names_preserve_order_076');
      let parent: CityNode = new CityNode('G', [new CityNode('Gansu'), new CityNode('Guangdong'),
        new CityNode('Guangxi')]);
      let names: string[] = parent.childNames();
      expect(names.length).assertEqual(3);
      expect((names).length).assertEqual((['Gansu', 'Guangdong', 'Guangxi']).length);
      for (let __i143: number = 0; __i143 < (['Gansu', 'Guangdong', 'Guangxi']).length; __i143++) {
        expect((names)[__i143]).assertEqual((['Gansu', 'Guangdong', 'Guangxi'])[__i143]);
      }
      expect(names[0]).assertEqual('Gansu');
      expect(names[2]).assertEqual('Guangxi');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0770
     * @tc.name      city_index_city_node_child_names_return_a_copy_077
     * @tc.desc      Verify city index city node child names return a copy.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_city_node_child_names_return_a_copy_077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_city_node_child_names_return_a_copy_077');
      let parent: CityNode = new CityNode('G', [new CityNode('Gansu'), new CityNode('Guangdong')]);
      let first: string[] = parent.childNames();
      first.push('Guangxi');
      first.splice(0, 1);
      let second: string[] = parent.childNames();
      expect(first.length).assertEqual(2);
      expect((second).length).assertEqual((['Gansu', 'Guangdong']).length);
      for (let __i144: number = 0; __i144 < (['Gansu', 'Guangdong']).length; __i144++) {
        expect((second)[__i144]).assertEqual((['Gansu', 'Guangdong'])[__i144]);
      }
      expect(parent.children.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0780
     * @tc.name      city_index_city_node_children_hold_nested_nodes_078
     * @tc.desc      Verify city index city node children hold nested nodes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_city_node_children_hold_nested_nodes_078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_city_node_children_hold_nested_nodes_078');
      let hefei: CityNode = new CityNode('Hefei');
      let anhui: CityNode = new CityNode('Anhui', [hefei]);
      let parent: CityNode = new CityNode('A', [anhui, new CityNode('Anqing')]);
      expect(parent.children.length).assertEqual(2);
      expect((parent.childNames()).length).assertEqual((['Anhui', 'Anqing']).length);
      for (let __i145: number = 0; __i145 < (['Anhui', 'Anqing']).length; __i145++) {
        expect((parent.childNames())[__i145]).assertEqual((['Anhui', 'Anqing'])[__i145]);
      }
      expect(parent.children[0].children.length).assertEqual(1);
      expect(parent.children[1].isLeaf()).assertTrue();
      expect(parent.children[0].children[0].name).assertEqual('Hefei');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0790
     * @tc.name      city_index_all_cities_after_clearing_every_root_079
     * @tc.desc      Verify city index all cities after clearing every root.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_after_clearing_every_root_079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_after_clearing_every_root_079');
      let index: CityIndex = sampleIndex();
      // Walks the five letters and empties each root; the letters survive, the seven cities do not.
      let letters: string[] = index.letters();
      for (let cursor: number = 0; cursor < letters.length; cursor++) {
        let root: CityNode | undefined = index.rootOf(letters[cursor]);
        expect(root !== null && root !== undefined).assertTrue();
        if (root !== undefined) {
          root.children.splice(0, root.children.length);
        }
      }
      expect(index.allCities().length).assertEqual(0);
      expect(index.cityCount()).assertEqual(0);
      expect(index.letters().length).assertEqual(5);
      expect(index.citiesOf('A').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_CITY_INDEX_0800
     * @tc.name      city_index_all_cities_after_clearing_and_restoring_root_080
     * @tc.desc      Verify city index all cities after clearing and restoring root.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('city_index_all_cities_after_clearing_and_restoring_root_080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: city_index_all_cities_after_clearing_and_restoring_root_080');
      let index: CityIndex = sampleIndex();
      let root: CityNode | undefined = index.rootOf('A');
      expect(root !== null && root !== undefined).assertTrue();
      if (root !== undefined) {
        // Emptied A contributes nothing, so the count reads 5 until the two replacements are pushed.
        root.children.splice(0, root.children.length);
        expect(index.cityCount()).assertEqual(5);
        root.children.push(new CityNode('Hefei'));
        root.children.push(new CityNode('Wuhu'));
      }
      expect(index.cityCount()).assertEqual(7);
      expect((index.citiesOf('A')).length).assertEqual((['Hefei', 'Wuhu']).length);
      for (let __i146: number = 0; __i146 < (['Hefei', 'Wuhu']).length; __i146++) {
        expect((index.citiesOf('A'))[__i146]).assertEqual((['Hefei', 'Wuhu'])[__i146]);
      }
      expect(index.allCities().indexOf('Hefei')).assertEqual(0);
      expect(index.findLetterOf('Hefei')).assertEqual('A');
    });
  });
}
