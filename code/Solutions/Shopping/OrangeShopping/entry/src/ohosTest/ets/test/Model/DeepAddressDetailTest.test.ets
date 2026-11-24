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

import { describe, beforeAll, afterEach, expect, it } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Address, AddressBook, BreakpointUtil, Catalog, CityIndex, CityNode, Comment, Coupon, DetailModel, Goods, LiveCenter, LiveRoom, PagedResult, ProductFilter, ShopUrl, UserAccount } from '../Shared/ShopModel';
import { ADDRESSES, CITY_ROOTS, DETAIL_CHOICES, DETAIL_IMAGES, HOT_CITIES, LIVE_ROOMS, PRODUCTS, createAddress, createGoods, defaultCatalog, defaultCityIndex } from '../Shared/TestData';
import { yieldToEventLoop } from '../Shared/TestDriver';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** One review per star value, with distinct indexed user names. */
function commentsOf(stars: number[]): Comment[] {
  let result: Comment[] = [];
  for (let index: number = 0; index < stars.length; index++) {
    result.push(new Comment('reviewer' + index.toString(), 'comment ' + index.toString(), stars[index]));
  }
  return result;
}

/** Fixed 3800001765 tail, so the result is always eleven digits. */
function phoneWithLeading(leading: string): string {
  return leading + '3800001765';
}

/** '1' followed by '3's, so only the length can make it invalid. */
function phoneOfLength(length: number): string {
  let text: string = '1';
  while (text.length < length) {
    text = text + '3';
  }
  return text;
}

function copiedRooms(): LiveRoom[] {
  let rooms: LiveRoom[] = [];
  for (let index: number = 0; index < LIVE_ROOMS.length; index++) {
    let source: LiveRoom = LIVE_ROOMS[index];
    rooms.push(new LiveRoom(source.id, source.title, source.anchor, source.viewers,
      source.goodsId, source.live));
  }
  return rooms;
}

export default function deepAddressDetailTest() {
  describe('OrangeShoppingDeepAddressDetail', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'deep address detail suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0010
     * @tc.name      deep_city_every_child_city_resolves_back_to_its_root_001
     * @tc.desc      Verify every child city resolves back to the root that lists it.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_city_every_child_city_resolves_back_to_its_root_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_city_every_child_city_resolves_back_to_its_root_001');
      let index: CityIndex = defaultCityIndex();
      let checked: number = 0;
      // Every one of the 15 roots is walked, and its leaf cities are counted so the total reaches 30.
      for (let rootSlot: number = 0; rootSlot < CITY_ROOTS.length; rootSlot++) {
        let letter: string = CITY_ROOTS[rootSlot].name;
        let root: CityNode | undefined = index.rootOf(letter);
        expect(root !== undefined).assertTrue();
        let cities: string[] = index.citiesOf(letter);
        for (let citySlot: number = 0; citySlot < CITY_ROOTS[rootSlot].children.length; citySlot++) {
          let city: string = CITY_ROOTS[rootSlot].children[citySlot].name;
          expect(cities[citySlot]).assertEqual(city);
          expect(index.findLetterOf(city)).assertEqual(letter);
          let expectedHot: boolean = HOT_CITIES.indexOf(city) !== -1;
          expect(index.isHot(city)).assertEqual(expectedHot);
          checked++;
        }
      }
      expect(checked).assertEqual(30);
      expect(index.cityCount()).assertEqual(30);
      expect(index.letters().length).assertEqual(15);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0020
     * @tc.name      deep_city_tree_cities_that_are_hot_report_both_memberships_002
     * @tc.desc      Verify tree cities that are also hot report both memberships.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_city_tree_cities_that_are_hot_report_both_memberships_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_city_tree_cities_that_are_hot_report_both_memberships_002');
      let index: CityIndex = defaultCityIndex();
      let letters: string[] = ['B', 'S', 'C', 'C'];
      let cities: string[] = ['Beijing', 'Shanghai', 'Changsha', 'Chongqing'];
      for (let slot: number = 0; slot < cities.length; slot++) {
        expect(index.isHot(cities[slot])).assertTrue();
        expect(index.findLetterOf(cities[slot])).assertEqual(letters[slot]);
        expect(index.citiesOf(letters[slot]).indexOf(cities[slot]) === -1).assertFalse();
        expect(index.hotCities().indexOf(cities[slot]) === -1).assertFalse();
        expect(index.allCities().indexOf(cities[slot]) === -1).assertFalse();
      }
      expect(index.isHot('Guangzhou')).assertTrue();
      expect(index.findLetterOf('Guangzhou')).assertEqual('');
      expect(index.hotCities().length).assertEqual(12);
      expect(index.findLetterOf('Beijing')).assertEqual('B');
      expect(index.citiesOf('S').indexOf('Shanghai') === -1).assertFalse();
      expect(index.hotCities()[0]).assertEqual('Beijing');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0030
     * @tc.name      deep_city_hot_only_cities_are_absent_from_the_tree_003
     * @tc.desc      Verify hot cities that are not in the tree cannot be located.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_city_hot_only_cities_are_absent_from_the_tree_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_city_hot_only_cities_are_absent_from_the_tree_003');
      let index: CityIndex = defaultCityIndex();
      let cities: string[] = ['Shenzhen', 'Hangzhou', 'Nanjing', 'Suzhou', 'Wuhan', 'Chengdu'];
      for (let slot: number = 0; slot < cities.length; slot++) {
        expect(index.isHot(cities[slot])).assertTrue();
        expect(index.findLetterOf(cities[slot])).assertEqual('');
        expect(index.allCities().indexOf(cities[slot])).assertEqual(-1);
        expect(index.hotCities().indexOf(cities[slot]) === -1).assertFalse();
      }
      expect(index.isHot('Shenzhen')).assertTrue();
      expect(index.cityCount()).assertEqual(30);
      expect(index.isHot('Shenzhen') === index.isHot('Beijing')).assertTrue();
      expect(index.findLetterOf('Beijing')).assertEqual('B');
      expect(index.hotCities().length).assertEqual(12);
      expect(index.allCities().length).assertEqual(30);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0040
     * @tc.name      deep_city_each_root_exposes_leaf_children_matching_cities_004
     * @tc.desc      Verify each root exposes leaf children that match the city listing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_city_each_root_exposes_leaf_children_matching_cities_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_city_each_root_exposes_leaf_children_matching_cities_004');
      let index: CityIndex = defaultCityIndex();
      let letters: string[] = index.letters();
      expect(letters.length).assertEqual(15);
      for (let slot: number = 0; slot < letters.length; slot++) {
        let node: CityNode | undefined = index.rootOf(letters[slot]);
        expect(node !== undefined).assertTrue();
        if (node !== undefined) {
          expect(node.name).assertEqual(letters[slot]);
          expect(node.children.length === 0).assertFalse();
          let cities: string[] = index.citiesOf(letters[slot]);
          expect(cities.length).assertEqual(node.children.length);
          for (let childSlot: number = 0; childSlot < node.children.length; childSlot++) {
            expect(node.children[childSlot].name).assertEqual(cities[childSlot]);
            expect(node.children[childSlot].isLeaf()).assertTrue();
          }
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0050
     * @tc.name      deep_city_concatenated_children_equals_all_cities_005
     * @tc.desc      Verify the concatenated root children equal the all-cities listing.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_city_concatenated_children_equals_all_cities_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_city_concatenated_children_equals_all_cities_005');
      let index: CityIndex = defaultCityIndex();
      let combined: string[] = [];
      for (let rootSlot: number = 0; rootSlot < CITY_ROOTS.length; rootSlot++) {
        let cities: string[] = index.citiesOf(CITY_ROOTS[rootSlot].name);
        for (let citySlot: number = 0; citySlot < cities.length; citySlot++) {
          combined.push(cities[citySlot]);
        }
      }
      let all: string[] = index.allCities();
      expect(combined.length).assertEqual(30);
      expect(all.length).assertEqual(combined.length);
      for (let slot: number = 0; slot < combined.length; slot++) {
        expect(all[slot]).assertEqual(combined[slot]);
      }
      expect(index.cityCount()).assertEqual(combined.length);
      expect(index.letters().length).assertEqual(CITY_ROOTS.length);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0060
     * @tc.name      deep_city_single_child_roots_report_one_city_and_hot_flag_006
     * @tc.desc      Verify single child roots report one city and the expected hot flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_city_single_child_roots_report_one_city_and_hot_flag_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_city_single_child_roots_report_one_city_and_hot_flag_006');
      let index: CityIndex = defaultCityIndex();
      let letters: string[] = ['L', 'Q', 'T', 'Y'];
      let cities: string[] = ['Liaoning', 'Qinghai', 'Tianjin', 'Yunnan'];
      let hotFlags: boolean[] = [false, false, true, false];
      for (let slot: number = 0; slot < letters.length; slot++) {
        let listed: string[] = index.citiesOf(letters[slot]);
        expect(listed.length).assertEqual(1);
        expect(listed[0]).assertEqual(cities[slot]);
        expect(index.findLetterOf(cities[slot])).assertEqual(letters[slot]);
        expect(index.isHot(cities[slot])).assertEqual(hotFlags[slot]);
        let node: CityNode | undefined = index.rootOf(letters[slot]);
        expect(node !== undefined).assertTrue();
        if (node !== undefined) {
          expect(node.children.length).assertEqual(1);
        }
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0070
     * @tc.name      deep_city_letter_and_city_sets_stay_disjoint_007
     * @tc.desc      Verify the root letters and the city names stay disjoint sets.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_city_letter_and_city_sets_stay_disjoint_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_city_letter_and_city_sets_stay_disjoint_007');
      let index: CityIndex = defaultCityIndex();
      let letters: string[] = index.letters();
      let cities: string[] = index.allCities();
      for (let slot: number = 0; slot < letters.length; slot++) {
        expect(cities.indexOf(letters[slot])).assertEqual(-1);
        expect(letters[slot].length).assertEqual(1);
      }
      for (let slot: number = 0; slot < cities.length; slot++) {
        expect(letters.indexOf(cities[slot])).assertEqual(-1);
        expect(cities[slot].length === 1).assertFalse();
        expect(index.findLetterOf(cities[slot]).length).assertEqual(1);
      }
      expect(letters.length).assertEqual(15);
      expect(cities.length).assertEqual(30);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0080
     * @tc.name      deep_city_duplicate_root_letter_keeps_the_first_root_008
     * @tc.desc      Verify a duplicate root letter keeps the first root for city queries.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_city_duplicate_root_letter_keeps_the_first_root_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_city_duplicate_root_letter_keeps_the_first_root_008');
      let roots: CityNode[] = [
        new CityNode('A', [new CityNode('Alpha')]),
        new CityNode('A', [new CityNode('Aurora')])
      ];
      let hot: string[] = ['Alpha'];
      let index: CityIndex = new CityIndex(roots, hot);
      expect(index.letters().length).assertEqual(2);
      expect(index.letters()[0]).assertEqual('A');
      expect(index.letters()[1]).assertEqual('A');
      let node: CityNode | undefined = index.rootOf('A');
      expect(node !== undefined).assertTrue();
      if (node !== undefined) {
        expect(node.children[0].name).assertEqual('Alpha');
      }
      expect(index.citiesOf('A').length).assertEqual(1);
      expect(index.findLetterOf('Aurora')).assertEqual('A');
      expect(index.isHot('Alpha')).assertTrue();
      expect(index.isHot('Aurora')).assertFalse();
      expect(index.cityCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0090
     * @tc.name      deep_address_remove_each_fixture_id_promotes_one_default_009
     * @tc.desc      Verify removing each fixture address leaves exactly one default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_address_remove_each_fixture_id_promotes_one_default_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_address_remove_each_fixture_id_promotes_one_default_009');
      // A fresh book per fixture id: removing the default must promote one of the three survivors.
      for (let target: number = 1; target <= 4; target++) {
        let book: AddressBook = new AddressBook();
        for (let slot: number = 0; slot < ADDRESSES.length; slot++) {
          book.add(ADDRESSES[slot]);
        }
        expect(book.size()).assertEqual(4);
        expect(book.remove(target)).assertTrue();
        expect(book.size()).assertEqual(3);
        expect(book.indexOf(target)).assertEqual(-1);
        let defaults: number = 0;
        for (let slot: number = 0; slot < book.all().length; slot++) {
          if (book.all()[slot].isDefault) {
            defaults++;
          }
        }
        expect(defaults).assertEqual(1);
        expect(book.defaultAddress() !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0100
     * @tc.name      deep_address_set_default_cycles_keep_a_single_flag_010
     * @tc.desc      Verify cycling the default flag across three entries keeps one default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_address_set_default_cycles_keep_a_single_flag_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_address_set_default_cycles_keep_a_single_flag_010');
      let book: AddressBook = new AddressBook();
      for (let slot: number = 0; slot < 3; slot++) {
        book.add(createAddress(slot + 1, 'User' + slot.toString(), '18800001765',
          'Anhui', 'Anqing', 'Downtown', '100 Main Road', false));
      }
      expect(book.size()).assertEqual(3);
      expect(book.defaultAddress() !== undefined).assertTrue();
      for (let target: number = 1; target <= 3; target++) {
        expect(book.setDefault(target)).assertTrue();
        let defaults: number = 0;
        for (let slot: number = 0; slot < book.all().length; slot++) {
          if (book.all()[slot].isDefault) {
            defaults++;
          }
        }
        expect(defaults).assertEqual(1);
        let position: number = book.indexOf(target);
        expect(position === -1).assertFalse();
        expect(book.all()[position].isDefault).assertTrue();
        expect(book.defaultAddress() === book.all()[position]).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0110
     * @tc.name      deep_address_update_middle_entry_keeps_position_and_default_011
     * @tc.desc      Verify updating the middle address keeps its position and the default entry.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_address_update_middle_entry_keeps_position_and_default_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_address_update_middle_entry_keeps_position_and_default_011');
      let book: AddressBook = new AddressBook();
      for (let slot: number = 0; slot < ADDRESSES.length; slot++) {
        book.add(ADDRESSES[slot]);
      }
      let replacement: Address = createAddress(90, 'Updated', '18600007890',
        'Hunan', 'Changsha', 'Yuelu', '500 New Road', false);
      expect(book.update(3, replacement)).assertTrue();
      expect(book.size()).assertEqual(4);
      expect(book.all()[2].name).assertEqual('Updated');
      expect(book.all()[2].phone).assertEqual('18600007890');
      expect(book.all()[2].id).assertEqual(3);
      expect(book.all()[0].name).assertEqual('Alice');
      let fallback: Address | undefined = book.defaultAddress();
      expect(fallback !== undefined).assertTrue();
      if (fallback !== undefined) {
        expect(fallback.id).assertEqual(1);
      }
      expect(book.update(99, replacement)).assertFalse();
      expect(book.size()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0120
     * @tc.name      deep_address_ids_continue_after_a_middle_removal_012
     * @tc.desc      Verify identifier allocation continues after a middle removal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_address_ids_continue_after_a_middle_removal_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_address_ids_continue_after_a_middle_removal_012');
      let book: AddressBook = new AddressBook();
      expect(book.add(ADDRESSES[0])).assertEqual(1);
      expect(book.add(ADDRESSES[1])).assertEqual(2);
      expect(book.add(ADDRESSES[2])).assertEqual(3);
      expect(book.remove(2)).assertTrue();
      expect(book.size()).assertEqual(2);
      expect(book.indexOf(2)).assertEqual(-1);
      // The next add continues at 4 even though id 2 was removed from the middle.
      expect(book.add(ADDRESSES[3])).assertEqual(4);
      expect(book.size()).assertEqual(3);
      let ids: number[] = [book.all()[0].id, book.all()[1].id, book.all()[2].id];
      expect(ids[1]).assertEqual(3);
      expect(ids[2]).assertEqual(4);
      expect(book.indexOf(4)).assertEqual(2);
      expect(book.indexOf(2)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0130
     * @tc.name      deep_address_remove_missing_keeps_default_and_next_id_013
     * @tc.desc      Verify removing a missing identifier keeps the default and the next id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_address_remove_missing_keeps_default_and_next_id_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_address_remove_missing_keeps_default_and_next_id_013');
      let book: AddressBook = new AddressBook();
      for (let slot: number = 0; slot < ADDRESSES.length; slot++) {
        book.add(ADDRESSES[slot]);
      }
      expect(book.size()).assertEqual(4);
      expect(book.remove(99)).assertFalse();
      expect(book.size()).assertEqual(4);
      let first: Address | undefined = book.defaultAddress();
      expect(first !== undefined).assertTrue();
      if (first !== undefined) {
        expect(first.id).assertEqual(1);
      }
      expect(book.add(createAddress(50, 'New', '15000001111', 'Anhui',
        'Anqing', 'Downtown', '600 Main Road', false))).assertEqual(5);
      expect(book.size()).assertEqual(5);
      expect(book.indexOf(5)).assertEqual(4);
      expect(book.defaultAddress() !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0140
     * @tc.name      deep_address_validation_error_priority_covers_full_chain_014
     * @tc.desc      Verify the validation error priority covers the full rule chain.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_address_validation_error_priority_covers_full_chain_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_address_validation_error_priority_covers_full_chain_014');
      let book: AddressBook = new AddressBook();
      // Each fixture breaks one rule more than its predecessor, so the returned codes expose the check order.
      let cases: Address[] = [
        createAddress(1, '', '18800001765', 'Anhui', 'Anqing', 'Downtown', '100 Main Road', false),
        createAddress(2, 'Ann', '28800001765', '', '', '', '', false),
        createAddress(3, 'Ann', '18800001765', '', 'Anqing', '', '', false),
        createAddress(4, 'Ann', '18800001765', 'Anhui', 'Anqing', '', '', false),
        createAddress(5, 'Ann', '18800001765', 'Anhui', 'Anqing', 'Downtown', '100 Main Road', false)
      ];
      let expected: string[] = ['NAME_EMPTY', 'PHONE_INVALID', 'CITY_EMPTY', 'DETAIL_EMPTY', ''];
      for (let slot: number = 0; slot < cases.length; slot++) {
        expect(book.validate(cases[slot])).assertEqual(expected[slot]);
      }
      expect(AddressBook.isValidPhone('28800001765')).assertFalse();
      expect(AddressBook.isValidPhone('18800001765')).assertTrue();
      expect(AddressBook.isValidPhone('1380001765')).assertFalse();
      expect(book.validate(cases[3])).assertEqual('DETAIL_EMPTY');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0150
     * @tc.name      deep_address_phone_leading_digit_sweep_accepts_only_one_015
     * @tc.desc      Verify the phone leading digit sweep accepts only the one prefix.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_address_phone_leading_digit_sweep_accepts_only_one_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_address_phone_leading_digit_sweep_accepts_only_one_015');
      let book: AddressBook = new AddressBook();
      for (let digit: number = 0; digit <= 9; digit++) {
        let phone: string = phoneWithLeading(digit.toString());
        expect(phone.length).assertEqual(11);
        let valid: boolean = digit === 1;
        expect(AddressBook.isValidPhone(phone)).assertEqual(valid);
        let address: Address = createAddress(1, 'Ann', phone, 'Anhui', 'Anqing',
          'Downtown', '100 Main Road', false);
        let expectedCode: string = '';
        if (!valid) {
          expectedCode = 'PHONE_INVALID';
        }
        expect(book.validate(address)).assertEqual(expectedCode);
      }
      expect(AddressBook.isValidPhone(phoneWithLeading('1'))).assertTrue();
      expect(AddressBook.isValidPhone(phoneWithLeading('2'))).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0160
     * @tc.name      deep_address_phone_length_sweep_accepts_exactly_eleven_016
     * @tc.desc      Verify the phone length sweep accepts exactly eleven digits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_address_phone_length_sweep_accepts_exactly_eleven_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_address_phone_length_sweep_accepts_exactly_eleven_016');
      let book: AddressBook = new AddressBook();
      let lengths: number[] = [8, 9, 10, 11, 12, 13];
      for (let slot: number = 0; slot < lengths.length; slot++) {
        let phone: string = phoneOfLength(lengths[slot]);
        expect(phone.length).assertEqual(lengths[slot]);
        let valid: boolean = lengths[slot] === 11;
        expect(AddressBook.isValidPhone(phone)).assertEqual(valid);
        let address: Address = createAddress(1, 'Ann', phone, 'Anhui', 'Anqing',
          'Downtown', '100 Main Road', false);
        if (valid) {
          expect(book.validate(address)).assertEqual('');
        } else {
          expect(book.validate(address)).assertEqual('PHONE_INVALID');
        }
      }
      expect(phoneOfLength(11).length).assertEqual(11);
      expect(phoneOfLength(10).length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0170
     * @tc.name      deep_address_tab_and_newline_only_fields_are_empty_017
     * @tc.desc      Verify tab and newline only name and detail fields count as empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_address_tab_and_newline_only_fields_are_empty_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_address_tab_and_newline_only_fields_are_empty_017');
      let book: AddressBook = new AddressBook();
      let tabName: Address = createAddress(1, '\t', '18800001765', 'Anhui',
        'Anqing', 'Downtown', '100 Main Road', false);
      let newlineDetail: Address = createAddress(2, 'Ann', '18800001765', 'Anhui',
        'Anqing', 'Downtown', '\n', false);
      let mixedName: Address = createAddress(3, ' \t\n ', '18800001765', 'Anhui',
        'Anqing', 'Downtown', '100 Main Road', false);
      let validOne: Address = createAddress(4, 'Ann', '18800001765', 'Anhui',
        'Anqing', 'Downtown', '100 Main Road', false);
      expect(book.validate(tabName)).assertEqual('NAME_EMPTY');
      expect(book.validate(newlineDetail)).assertEqual('DETAIL_EMPTY');
      expect(book.validate(mixedName)).assertEqual('NAME_EMPTY');
      expect(book.validate(validOne)).assertEqual('');
      expect(tabName.fullAddress()).assertEqual('AnhuiAnqingDowntown100 Main Road');
      expect(newlineDetail.fullAddress().length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0180
     * @tc.name      deep_detail_positive_rate_sweep_matches_five_distributions_018
     * @tc.desc      Verify the positive rate sweep matches five review distributions.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_detail_positive_rate_sweep_matches_five_distributions_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_detail_positive_rate_sweep_matches_five_distributions_018');
      let sets: number[][] = [
        [1, 2, 3],
        [4, 3, 2, 1],
        [4, 5, 3, 2],
        [4, 4, 4, 3],
        [5, 4, 5, 5]
      ];
      let rates: number[] = [0, 25, 50, 75, 100];
      // The rate counts only reviews at four stars or more: the five sets yield 0, 25, 50, 75 and 100.
      for (let slot: number = 0; slot < sets.length; slot++) {
        let model: DetailModel = new DetailModel(PRODUCTS[0], DETAIL_IMAGES,
          commentsOf(sets[slot]), DETAIL_CHOICES);
        expect(model.commentCount()).assertEqual(sets[slot].length);
        expect(model.positiveRate()).assertEqual(rates[slot]);
        expect(model.selectedChoice).assertEqual(0);
        expect(model.choiceName()).assertEqual('black');
        expect(model.imageCount()).assertEqual(4);
      }
      expect(new DetailModel(PRODUCTS[0], DETAIL_IMAGES, commentsOf([5]), DETAIL_CHOICES).positiveRate()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0190
     * @tc.name      deep_detail_average_stars_sweep_keeps_one_decimal_019
     * @tc.desc      Verify the average star sweep keeps one decimal across five sets.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_detail_average_stars_sweep_keeps_one_decimal_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_detail_average_stars_sweep_keeps_one_decimal_019');
      let sets: number[][] = [
        [3],
        [3, 4],
        [4, 4, 5],
        [4, 5, 5],
        [5, 5, 5]
      ];
      let averages: number[] = [3, 3.5, 4.3, 4.7, 5];
      let positives: number[] = [0, 1, 3, 3, 3];
      for (let slot: number = 0; slot < sets.length; slot++) {
        let model: DetailModel = new DetailModel(PRODUCTS[1], DETAIL_IMAGES,
          commentsOf(sets[slot]), DETAIL_CHOICES);
        expect(model.averageStars()).assertEqual(averages[slot]);
        expect(model.positiveCount()).assertEqual(positives[slot]);
        expect(model.commentCount()).assertEqual(sets[slot].length);
      }
      expect(new DetailModel(PRODUCTS[0], DETAIL_IMAGES, commentsOf([2]), DETAIL_CHOICES).positiveRate()).assertEqual(0);
      expect(new DetailModel(PRODUCTS[0], DETAIL_IMAGES, commentsOf([4]), DETAIL_CHOICES).positiveRate()).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0200
     * @tc.name      deep_detail_shared_comment_list_updates_live_statistics_020
     * @tc.desc      Verify a shared comment list updates the detail statistics live.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_detail_shared_comment_list_updates_live_statistics_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_detail_shared_comment_list_updates_live_statistics_020');
      let comments: Comment[] = commentsOf([5, 3]);
      let model: DetailModel = new DetailModel(PRODUCTS[0], DETAIL_IMAGES, comments, DETAIL_CHOICES);
      expect(model.comments === comments).assertTrue();
      expect(model.commentCount()).assertEqual(2);
      expect(model.positiveCount()).assertEqual(1);
      expect(model.positiveRate()).assertEqual(50);
      expect(model.averageStars()).assertEqual(4);
      // The model keeps the caller's array, so this later push raises the rate from 1 of 2 to 2 of 3.
      comments.push(new Comment('extra', 'late review', 4));
      expect(model.comments.length).assertEqual(3);
      expect(model.positiveCount()).assertEqual(2);
      expect(model.positiveRate()).assertEqual(67);
      expect(model.averageStars()).assertEqual(4);
      expect(comments.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0210
     * @tc.name      deep_detail_choice_name_follows_shrink_and_restore_021
     * @tc.desc      Verify the choice name follows a shrink and a restore of the choice list.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_detail_choice_name_follows_shrink_and_restore_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_detail_choice_name_follows_shrink_and_restore_021');
      let choices: string[] = ['red', 'green', 'blue'];
      let model: DetailModel = new DetailModel(PRODUCTS[2], DETAIL_IMAGES, commentsOf([5, 4]), choices);
      expect(model.selectedChoice).assertEqual(0);
      expect(model.choiceName()).assertEqual('red');
      expect(model.selectChoice(2)).assertTrue();
      expect(model.choiceName()).assertEqual('blue');
      choices.pop();
      expect(model.choices.length).assertEqual(2);
      expect(model.selectedChoice).assertEqual(2);
      choices.push('black');
      expect(model.selectChoice(0)).assertTrue();
      expect(model.choiceName()).assertEqual('red');
      expect(model.selectChoice(1)).assertTrue();
      expect(model.choiceName()).assertEqual('green');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0220
     * @tc.name      deep_detail_seven_reviews_round_rate_and_average_together_022
     * @tc.desc      Verify seven reviews round the positive rate and average together.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_detail_seven_reviews_round_rate_and_average_together_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_detail_seven_reviews_round_rate_and_average_together_022');
      let stars: number[] = [5, 4, 4, 3, 2, 1, 5];
      let model: DetailModel = new DetailModel(PRODUCTS[0], DETAIL_IMAGES,
        commentsOf(stars), DETAIL_CHOICES);
      // Four of the seven reviews reach four stars, and 24 total stars over 7 rounds to 3.4.
      expect(model.commentCount()).assertEqual(7);
      expect(model.positiveCount()).assertEqual(4);
      expect(model.positiveRate()).assertEqual(57);
      expect(model.averageStars()).assertEqual(3.4);
      let low: number = 0;
      for (let slot: number = 0; slot < stars.length; slot++) {
        if (stars[slot] < 4) {
          low++;
        }
      }
      expect(low).assertEqual(3);
      expect(model.imageCount() + model.commentCount()).assertEqual(11);
      expect(model.commentCount() - model.positiveCount()).assertEqual(low);
      expect(model.imageCount()).assertEqual(4);
      expect(model.choiceName()).assertEqual('black');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0230
     * @tc.name      deep_comment_mask_boundary_at_seven_and_eight_characters_023
     * @tc.desc      Verify the user mask boundary sits between seven and eight characters.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_comment_mask_boundary_at_seven_and_eight_characters_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_comment_mask_boundary_at_seven_and_eight_characters_023');
      // Eight characters is the first masked length: three leading and four trailing digits remain.
      let seven: Comment = new Comment('1234567', 'short', 5);
      let eight: Comment = new Comment('12345678', 'long', 4);
      let ten: Comment = new Comment('1234567890', 'ten', 3);
      expect(seven.maskedUser()).assertEqual('1234567');
      expect(eight.maskedUser()).assertEqual('123****5678');
      expect(ten.maskedUser()).assertEqual('123****7890');
      expect(seven.isPositive()).assertTrue();
      expect(eight.isPositive()).assertTrue();
      expect(ten.isPositive()).assertFalse();
      expect(eight.maskedUser().length).assertEqual(11);
      expect(seven.maskedUser() === seven.user).assertTrue();
      expect(ten.stars).assertEqual(3);
      expect(seven.user.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0240
     * @tc.name      deep_detail_shared_reviews_with_separate_choice_state_024
     * @tc.desc      Verify two models share reviews while keeping separate choice state.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_detail_shared_reviews_with_separate_choice_state_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_detail_shared_reviews_with_separate_choice_state_024');
      let comments: Comment[] = commentsOf([5, 4, 3, 5]);
      let choicesA: string[] = ['a', 'b'];
      let choicesB: string[] = ['x', 'y', 'z'];
      let first: DetailModel = new DetailModel(PRODUCTS[0], DETAIL_IMAGES, comments, choicesA);
      let second: DetailModel = new DetailModel(PRODUCTS[0], DETAIL_IMAGES, comments, choicesB);
      expect(first.selectChoice(1)).assertTrue();
      expect(second.selectChoice(2)).assertTrue();
      expect(first.choiceName()).assertEqual('b');
      expect(second.choiceName()).assertEqual('z');
      expect(first.positiveCount()).assertEqual(3);
      expect(second.positiveCount()).assertEqual(3);
      expect(first.choices.length).assertEqual(2);
      expect(second.choices.length).assertEqual(3);
      expect(first.selectedChoice).assertEqual(1);
      expect(second.selectedChoice).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0250
     * @tc.name      deep_detail_empty_gallery_and_reviews_report_zero_025
     * @tc.desc      Verify an empty gallery and review list report zero statistics.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_detail_empty_gallery_and_reviews_report_zero_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_detail_empty_gallery_and_reviews_report_zero_025');
      let images: string[] = [];
      let comments: Comment[] = [];
      let choices: string[] = ['black', 'silver'];
      let model: DetailModel = new DetailModel(PRODUCTS[6], images, comments, choices);
      expect(model.imageCount()).assertEqual(0);
      expect(model.commentCount()).assertEqual(0);
      expect(model.positiveCount()).assertEqual(0);
      expect(model.positiveRate()).assertEqual(0);
      expect(model.averageStars()).assertEqual(0);
      expect(model.selectedChoice).assertEqual(0);
      expect(model.selectChoice(2)).assertFalse();
      expect(model.choiceName()).assertEqual('black');
      expect(model.goods.id).assertEqual(6);
      expect(model.images.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0260
     * @tc.name      deep_live_viewers_text_boundary_sweep_five_values_026
     * @tc.desc      Verify the viewer text boundary sweep renders five distinct forms.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_live_viewers_text_boundary_sweep_five_values_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_live_viewers_text_boundary_sweep_five_values_026');
      let counts: number[] = [999, 1000, 9999, 10000, 15300];
      let texts: string[] = ['999', '1k', '9.9k', '1w', '1.5w'];
      // 1000 is the first count rendered as k and 10000 the first rendered as w; 999 stays raw.
      for (let slot: number = 0; slot < counts.length; slot++) {
        let room: LiveRoom = new LiveRoom(slot, 'room' + slot.toString(), 'anchor',
          counts[slot], slot, true);
        expect(room.viewersText()).assertEqual(texts[slot]);
        expect(room.viewers).assertEqual(counts[slot]);
        expect(room.live).assertTrue();
        expect(room.title).assertEqual('room' + slot.toString());
      }
      let thousand: LiveRoom = new LiveRoom(90, 'boundary', 'anchor', 1000, 90, true);
      let tenThousand: LiveRoom = new LiveRoom(91, 'boundary', 'anchor', 10000, 91, false);
      expect(thousand.viewersText()).assertEqual('1k');
      expect(tenThousand.viewersText()).assertEqual('1w');
      expect(tenThousand.live).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0270
     * @tc.name      deep_live_zero_and_negative_viewers_render_raw_counts_027
     * @tc.desc      Verify zero and negative viewer counts render as raw values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_live_zero_and_negative_viewers_render_raw_counts_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_live_zero_and_negative_viewers_render_raw_counts_027');
      let zero: LiveRoom = new LiveRoom(900, 'zero', 'anchor', 0, 0, true);
      let negative: LiveRoom = new LiveRoom(901, 'negative', 'anchor', -20, 1, false);
      let small: LiveRoom = new LiveRoom(902, 'small', 'anchor', 999, 2, true);
      expect(zero.viewersText()).assertEqual('0');
      expect(negative.viewersText()).assertEqual('-20');
      expect(small.viewersText()).assertEqual('999');
      let center: LiveCenter = new LiveCenter([zero, negative, small]);
      // Offline rooms still count here: 0 - 20 + 999 = 979, while liveRooms keeps only the two live ones.
      expect(center.totalViewers()).assertEqual(979);
      expect(center.liveRooms().length).assertEqual(2);
      let best: LiveRoom | undefined = center.mostWatched();
      expect(best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.id).assertEqual(902);
        expect(best.viewersText()).assertEqual('999');
      }
      expect(center.byGoods(2) === small).assertTrue();
      expect(center.all().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0280
     * @tc.name      deep_live_all_negative_viewers_keep_the_first_room_028
     * @tc.desc      Verify an all-negative viewer centre keeps the first room as most watched.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_live_all_negative_viewers_keep_the_first_room_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_live_all_negative_viewers_keep_the_first_room_028');
      let rooms: LiveRoom[] = [
        new LiveRoom(0, 'first', 'anchor-a', -5, 0, true),
        new LiveRoom(1, 'second', 'anchor-b', -10, 1, true),
        new LiveRoom(2, 'third', 'anchor-c', -1, 2, true)
      ];
      let center: LiveCenter = new LiveCenter(rooms);
      let best: LiveRoom | undefined = center.mostWatched();
      expect(best !== undefined).assertTrue();
      if (best !== undefined) {
        expect(best.id).assertEqual(2);
        expect(best.viewers).assertEqual(-1);
        expect(best.viewersText()).assertEqual('-1');
      }
      expect(center.totalViewers()).assertEqual(-16);
      expect(center.liveRooms().length).assertEqual(3);
      expect(center.all().length).assertEqual(3);
      expect(center.byGoods(2) === rooms[2]).assertTrue();
      expect(rooms[1].viewersText()).assertEqual('-10');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0290
     * @tc.name      deep_live_negative_goods_id_matches_the_configured_room_029
     * @tc.desc      Verify a negative goods identifier matches the configured live room.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_live_negative_goods_id_matches_the_configured_room_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_live_negative_goods_id_matches_the_configured_room_029');
      let negativeRoom: LiveRoom = new LiveRoom(5, 'negative goods', 'anchor-a', 100, -1, true);
      let positiveRoom: LiveRoom = new LiveRoom(6, 'positive goods', 'anchor-b', 200, 3, true);
      let center: LiveCenter = new LiveCenter([negativeRoom, positiveRoom]);
      let found: LiveRoom | undefined = center.byGoods(-1);
      expect(found !== undefined).assertTrue();
      if (found !== undefined) {
        expect(found.id).assertEqual(5);
        expect(found.goodsId).assertEqual(-1);
        expect(found.viewersText()).assertEqual('100');
      }
      let missing: LiveRoom | undefined = center.byGoods(-2);
      expect(missing === undefined).assertTrue();
      expect(center.byGoods(-1) === center.all()[0]).assertTrue();
      expect(center.totalViewers()).assertEqual(300);
      expect(center.liveRooms().length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0300
     * @tc.name      deep_live_lowest_room_offline_keeps_total_and_most_watched_030
     * @tc.desc      Verify taking the lowest room offline keeps the total and most watched room.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_live_lowest_room_offline_keeps_total_and_most_watched_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_live_lowest_room_offline_keeps_total_and_most_watched_030');
      let rooms: LiveRoom[] = copiedRooms();
      let center: LiveCenter = new LiveCenter(rooms);
      expect(center.liveRooms().length).assertEqual(4);
      expect(center.totalViewers()).assertEqual(26895);
      expect(rooms[4].viewers).assertEqual(75);
      expect(rooms[4].live).assertTrue();
      rooms[4].live = false;
      expect(center.liveRooms().length).assertEqual(3);
      expect(center.totalViewers()).assertEqual(26895);
      let best: LiveRoom | undefined = center.mostWatched();
      if (best !== undefined) {
        expect(best.viewers).assertEqual(15300);
      }
      expect(center.byGoods(3) === rooms[4]).assertTrue();
      expect(rooms[4].live).assertFalse();
      expect(center.all().length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0310
     * @tc.name      deep_live_by_goods_returns_the_live_instance_from_all_031
     * @tc.desc      Verify by-goods returns the live instance held by the centre view.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_live_by_goods_returns_the_live_instance_from_all_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_live_by_goods_returns_the_live_instance_from_all_031');
      let center: LiveCenter = new LiveCenter(LIVE_ROOMS);
      let room: LiveRoom | undefined = center.byGoods(2);
      expect(room !== undefined).assertTrue();
      if (room !== undefined) {
        expect(room.id).assertEqual(2);
        expect(room.title).assertEqual('watch training live');
        expect(room.anchor).assertEqual('anchor-c');
        expect(room.viewers).assertEqual(9800);
        expect(room.viewersText()).assertEqual('9.8k');
        expect(room === center.all()[2]).assertTrue();
        expect(room === center.liveRooms()[2]).assertTrue();
      }
      expect(center.mostWatched() === center.all()[3]).assertTrue();
      expect(center.totalViewers()).assertEqual(26895);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0320
     * @tc.name      deep_user_negative_points_produce_negative_money_value_032
     * @tc.desc      Verify a negative point balance produces a negative money value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_user_negative_points_produce_negative_money_value_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_user_negative_points_produce_negative_money_value_032');
      let account: UserAccount = new UserAccount('negative', -250, 2, []);
      expect(account.points).assertEqual(-250);
      // Flooring -250 / 100 gives -3 whole yuan, so the value is -300 cents.
      expect(account.pointsValue().cents()).assertEqual(-300);
      expect(account.pointsValue().isNegative()).assertTrue();
      expect(account.pointsValue().isZero()).assertFalse();
      expect(account.pointsValue().format()).assertEqual('-¥3.00');
      expect(account.levelName()).assertEqual('silver');
      expect(account.level).assertEqual(2);
      expect(account.level).assertEqual(2);
      expect(account.pointsValue().isPositive()).assertFalse();
      expect(account.nickname.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0330
     * @tc.name      deep_user_fractional_redeem_keeps_fractional_remainder_033
     * @tc.desc      Verify a fractional redemption keeps the fractional point remainder.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_user_fractional_redeem_keeps_fractional_remainder_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_user_fractional_redeem_keeps_fractional_remainder_033');
      let account: UserAccount = new UserAccount('fraction', 100, 1, []);
      expect(account.pointsValue().cents()).assertEqual(100);
      expect(account.redeem(50.5)).assertTrue();
      expect(account.points).assertEqual(49.5);
      expect(account.pointsValue().cents()).assertEqual(0);
      expect(account.redeem(49.5)).assertTrue();
      expect(account.points).assertEqual(0);
      expect(account.levelName()).assertEqual('bronze');
      expect(account.pointsValue().isZero()).assertTrue();
      expect(account.level).assertEqual(1);
      expect(account.nickname).assertEqual('fraction');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0340
     * @tc.name      deep_user_fractional_points_accumulate_to_whole_yuan_034
     * @tc.desc      Verify fractional point additions accumulate to a whole yuan value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_user_fractional_points_accumulate_to_whole_yuan_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_user_fractional_points_accumulate_to_whole_yuan_034');
      let account: UserAccount = new UserAccount('accumulate', 0, 1, []);
      expect(account.addPoints(0.5)).assertEqual(0.5);
      expect(account.pointsValue().cents()).assertEqual(0);
      expect(account.addPoints(0.5)).assertEqual(1);
      expect(account.pointsValue().cents()).assertEqual(0);
      expect(account.addPoints(99)).assertEqual(100);
      expect(account.points).assertEqual(100);
      // addPoints ignores non-positive deltas, so the -3 leaves the balance at 100.
      expect(account.addPoints(-3)).assertEqual(100);
      expect(account.levelName()).assertEqual('bronze');
      expect(account.couponCount()).assertEqual(0);
      expect(account.pointsValue().isZero()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0350
     * @tc.name      deep_user_points_value_floor_sweep_for_five_balances_035
     * @tc.desc      Verify the points value floors to whole yuan across five balances.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_user_points_value_floor_sweep_for_five_balances_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_user_points_value_floor_sweep_for_five_balances_035');
      let balances: number[] = [99, 100, 199, 250, 999];
      let cents: number[] = [0, 100, 100, 200, 900];
      for (let slot: number = 0; slot < balances.length; slot++) {
        let account: UserAccount = new UserAccount('user' + slot.toString(), balances[slot], 1, []);
        expect(account.points).assertEqual(balances[slot]);
        expect(account.pointsValue().cents()).assertEqual(cents[slot]);
        expect(account.pointsValue().isZero()).assertEqual(cents[slot] === 0);
        expect(account.levelName()).assertEqual('bronze');
      }
      expect(new UserAccount('extra', 1000, 1, []).pointsValue().cents()).assertEqual(1000);
      expect(new UserAccount('zero', 0, 1, []).pointsValue().isZero()).assertTrue();
      expect(new UserAccount('extra', 199, 1, []).pointsValue().cents()).assertEqual(100);
      expect(cents[1]).assertEqual(100);
      expect(cents[2]).assertEqual(100);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0360
     * @tc.name      deep_user_redeem_from_fractional_hundred_keeps_value_036
     * @tc.desc      Verify redeeming a fraction from a fractional hundred keeps the yuan value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_user_redeem_from_fractional_hundred_keeps_value_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_user_redeem_from_fractional_hundred_keeps_value_036');
      let account: UserAccount = new UserAccount('half', 100.5, 2, []);
      expect(account.pointsValue().cents()).assertEqual(100);
      expect(account.redeem(0.5)).assertTrue();
      expect(account.points).assertEqual(100);
      expect(account.pointsValue().cents()).assertEqual(100);
      expect(account.redeem(0.5)).assertTrue();
      expect(account.points).assertEqual(99.5);
      expect(account.redeem(1)).assertTrue();
      expect(account.levelName()).assertEqual('silver');
      expect(account.nickname).assertEqual('half');
      expect(account.couponCount()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0370
     * @tc.name      deep_user_points_value_is_independent_of_the_coupon_wallet_037
     * @tc.desc      Verify the points value is independent of the coupon wallet size.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_user_points_value_is_independent_of_the_coupon_wallet_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_user_points_value_is_independent_of_the_coupon_wallet_037');
      let walletOne: Coupon[] = [new Coupon('C1', 'one', 0, 100)];
      let walletThree: Coupon[] = [
        new Coupon('C2', 'two', 0, 200),
        new Coupon('C3', 'three', 0, 300),
        new Coupon('C4', 'four', 0, 400)
      ];
      let first: UserAccount = new UserAccount('one', 250, 2, walletOne);
      let second: UserAccount = new UserAccount('two', 250, 2, walletThree);
      expect(first.pointsValue().cents()).assertEqual(200);
      expect(second.pointsValue().cents()).assertEqual(200);
      expect(first.couponCount()).assertEqual(1);
      expect(second.couponCount()).assertEqual(3);
      expect(first.nickname).assertEqual('one');
      expect(second.nickname).assertEqual('two');
      expect(first.addPoints(50)).assertEqual(300);
      expect(second.points).assertEqual(250);
      expect(second.pointsValue().cents()).assertEqual(200);
      expect(second.couponCount()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0380
     * @tc.name      deep_nav_nan_width_falls_into_the_large_breakpoint_038
     * @tc.desc      Verify a not-a-number width falls into the large breakpoint.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_nav_nan_width_falls_into_the_large_breakpoint_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_nav_nan_width_falls_into_the_large_breakpoint_038');
      // NaN compares false against every threshold, so it passes both bounds into the lg branch.
      let resolved: string = BreakpointUtil.resolve(Number.NaN);
      expect(resolved).assertEqual('lg');
      expect(resolved).assertEqual(BreakpointUtil.LARGE);
      expect(BreakpointUtil.columns(resolved)).assertEqual(3);
      expect(BreakpointUtil.swiperDisplay(resolved)).assertEqual(3);
      expect(BreakpointUtil.isKnown(resolved)).assertTrue();
      expect(BreakpointUtil.resolve(519.9)).assertEqual('sm');
      expect(BreakpointUtil.columns('md')).assertEqual(2);
      expect(BreakpointUtil.resolve(0)).assertEqual('sm');
      expect(BreakpointUtil.resolve(520)).assertEqual('md');
      expect(BreakpointUtil.resolve(1200)).assertEqual('lg');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0390
     * @tc.name      deep_nav_infinite_widths_map_to_small_and_large_039
     * @tc.desc      Verify the two infinite widths map to the small and large breakpoints.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_nav_infinite_widths_map_to_small_and_large_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_nav_infinite_widths_map_to_small_and_large_039');
      let positive: string = BreakpointUtil.resolve(Number.POSITIVE_INFINITY);
      let negative: string = BreakpointUtil.resolve(Number.NEGATIVE_INFINITY);
      expect(positive).assertEqual(BreakpointUtil.LARGE);
      expect(negative).assertEqual(BreakpointUtil.SMALL);
      expect(BreakpointUtil.columns(positive)).assertEqual(3);
      expect(BreakpointUtil.columns(negative)).assertEqual(1);
      expect(BreakpointUtil.swiperDisplay(positive)).assertEqual(3);
      expect(BreakpointUtil.swiperDisplay(negative)).assertEqual(1);
      expect(BreakpointUtil.resolve(Number.MAX_SAFE_INTEGER)).assertEqual('lg');
      expect(BreakpointUtil.resolve(-1)).assertEqual('sm');
      expect(BreakpointUtil.resolve(0)).assertEqual('sm');
      expect(BreakpointUtil.resolve(840)).assertEqual('lg');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0400
     * @tc.name      deep_nav_page_names_with_surrounding_spaces_are_invalid_040
     * @tc.desc      Verify page names with surrounding spaces are treated as unknown.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_nav_page_names_with_surrounding_spaces_are_invalid_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_nav_page_names_with_surrounding_spaces_are_invalid_040');
      // The space survives the split on '?', so the page text no longer matches a known name.
      let leading: ShopUrl = ShopUrl.parse(' MainPage?id=1');
      let trailing: ShopUrl = ShopUrl.parse('MainPage ?id=2');
      expect(leading.page).assertEqual(' MainPage');
      expect(leading.goodsId).assertEqual(1);
      expect(leading.valid).assertFalse();
      expect(trailing.page).assertEqual('MainPage ');
      expect(trailing.goodsId).assertEqual(2);
      expect(trailing.valid).assertFalse();
      expect(ShopUrl.isKnownPage(' MainPage')).assertFalse();
      expect(ShopUrl.isKnownPage('MainPage ')).assertFalse();
      expect(leading.withGoods(3)).assertEqual(' MainPage?id=3');
      expect(leading.goodsId === trailing.goodsId).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0410
     * @tc.name      deep_nav_plus_signed_identifier_is_parsed_as_positive_041
     * @tc.desc      Verify a plus signed identifier is parsed as a positive number.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_nav_plus_signed_identifier_is_parsed_as_positive_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_nav_plus_signed_identifier_is_parsed_as_positive_041');
      let parsed: ShopUrl = ShopUrl.parse('DetailPage?id=+7');
      expect(parsed.page).assertEqual('DetailPage');
      expect(parsed.goodsId).assertEqual(7);
      expect(parsed.valid).assertTrue();
      expect(parsed.withGoods(parsed.goodsId)).assertEqual('DetailPage?id=7');
      let again: ShopUrl = ShopUrl.parse(parsed.withGoods(7));
      expect(again.goodsId).assertEqual(7);
      expect(again.page).assertEqual('DetailPage');
      let direct: ShopUrl = new ShopUrl('DetailPage', 7);
      expect(direct.goodsId).assertEqual(7);
      expect(direct.valid).assertTrue();
      expect(direct.withGoods(7)).assertEqual('DetailPage?id=7');
      expect(ShopUrl.parse('DetailPage?id=+0').goodsId).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0420
     * @tc.name      deep_nav_negative_zero_identifier_equals_zero_042
     * @tc.desc      Verify a negative zero identifier is stored as plain zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_nav_negative_zero_identifier_equals_zero_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_nav_negative_zero_identifier_equals_zero_042');
      let parsed: ShopUrl = ShopUrl.parse('DetailPage?id=-0');
      expect(parsed.page).assertEqual('DetailPage');
      expect(parsed.goodsId === 0).assertTrue();
      expect(parsed.valid).assertTrue();
      expect(parsed.withGoods(parsed.goodsId)).assertEqual('DetailPage?id=0');
      let roundTrip: ShopUrl = ShopUrl.parse(parsed.withGoods(0));
      expect(roundTrip.goodsId).assertEqual(0);
      expect(roundTrip.valid).assertTrue();
      let direct: ShopUrl = new ShopUrl('DetailPage', -0);
      expect(direct.withGoods(-0)).assertEqual('DetailPage?id=0');
      expect(direct.valid).assertTrue();
      expect(parsed.withGoods(1)).assertEqual('DetailPage?id=1');
      expect(direct.withGoods(1)).assertEqual('DetailPage?id=1');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0430
     * @tc.name      deep_nav_page_with_existing_query_breaks_the_round_trip_043
     * @tc.desc      Verify a page that already carries a query loses its goods identifier.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_nav_page_with_existing_query_breaks_the_round_trip_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_nav_page_with_existing_query_breaks_the_round_trip_043');
      let url: ShopUrl = new ShopUrl('DetailPage?x=1');
      expect(url.page).assertEqual('DetailPage?x=1');
      expect(url.goodsId).assertEqual(-1);
      expect(url.valid).assertFalse();
      let text: string = url.withGoods(5);
      expect(text).assertEqual('DetailPage?x=1?id=5');
      expect(text.indexOf('?id=5') === -1).assertFalse();
      let parsed: ShopUrl = ShopUrl.parse(text);
      expect(parsed.page).assertEqual('DetailPage');
      expect(ShopUrl.isKnownPage(parsed.page)).assertTrue();
      expect(ShopUrl.isKnownPage('DetailPage')).assertTrue();
      expect(parsed.withGoods(5)).assertEqual('DetailPage?id=5');
      expect(parsed.withGoods(7)).assertEqual('DetailPage?id=7');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0440
     * @tc.name      deep_nav_empty_breakpoint_text_is_unknown_but_three_columns_044
     * @tc.desc      Verify empty breakpoint text is unknown yet resolves to three columns.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_nav_empty_breakpoint_text_is_unknown_but_three_columns_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_nav_empty_breakpoint_text_is_unknown_but_three_columns_044');
      expect(BreakpointUtil.columns('')).assertEqual(3);
      expect(BreakpointUtil.swiperDisplay('')).assertEqual(3);
      expect(BreakpointUtil.isKnown('')).assertFalse();
      expect(BreakpointUtil.columns(' sm')).assertEqual(3);
      expect(BreakpointUtil.isKnown(' sm')).assertFalse();
      expect(BreakpointUtil.isKnown('sm')).assertTrue();
      expect(BreakpointUtil.isKnown('lg')).assertTrue();
      expect(BreakpointUtil.columns('LG')).assertEqual(3);
      expect(BreakpointUtil.isKnown('LG')).assertFalse();
      expect(BreakpointUtil.swiperDisplay('md')).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0450
     * @tc.name      deep_filter_nan_minimum_keeps_every_catalog_row_045
     * @tc.desc      Verify a not-a-number minimum price keeps every catalog row.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_filter_nan_minimum_keeps_every_catalog_row_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_filter_nan_minimum_keeps_every_catalog_row_045');
      let wide: ProductFilter = new ProductFilter('', Number.NaN, Number.MAX_SAFE_INTEGER);
      let all: Goods[] = wide.apply(PRODUCTS);
      expect(all.length).assertEqual(16);
      expect(all[0].id).assertEqual(0);
      expect(all[15].id).assertEqual(15);
      expect(wide.matches(PRODUCTS[3])).assertTrue();
      expect(wide.matches(PRODUCTS[7])).assertTrue();
      expect(wide.inStockOnly).assertFalse();
      let phone: ProductFilter = new ProductFilter('phone', Number.NaN, Number.MAX_SAFE_INTEGER);
      let phones: Goods[] = phone.apply(PRODUCTS);
      expect(phones.length).assertEqual(6);
      expect(phones[0].category).assertEqual('phone');
      expect(phones[5].category).assertEqual('phone');
      expect(wide.category).assertEqual('');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0460
     * @tc.name      deep_filter_nan_maximum_keeps_every_catalog_row_046
     * @tc.desc      Verify a not-a-number maximum price keeps every catalog row.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_filter_nan_maximum_keeps_every_catalog_row_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_filter_nan_maximum_keeps_every_catalog_row_046');
      let wide: ProductFilter = new ProductFilter('', 0, Number.NaN);
      let all: Goods[] = wide.apply(PRODUCTS);
      expect(all.length).assertEqual(16);
      expect(all[0].id).assertEqual(0);
      expect(all[15].id).assertEqual(15);
      expect(wide.matches(PRODUCTS[15])).assertTrue();
      expect(wide.matches(PRODUCTS[0])).assertTrue();
      // A NaN ceiling disables only the upper bound, so inStockOnly still drops the two stock-0 rows.
      let stock: ProductFilter = new ProductFilter('', 0, Number.NaN, '', true);
      let available: Goods[] = stock.apply(PRODUCTS);
      expect(available.length).assertEqual(14);
      for (let slot: number = 0; slot < available.length; slot++) {
        expect(available[slot].isInStock()).assertTrue();
      }
      expect(available.length === all.length).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0470
     * @tc.name      deep_filter_tab_wrapped_keyword_matches_the_phone_group_047
     * @tc.desc      Verify a tab wrapped keyword matches the same phone rows as plain text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_filter_tab_wrapped_keyword_matches_the_phone_group_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_filter_tab_wrapped_keyword_matches_the_phone_group_047');
      // The stored keyword keeps its tab and newline (7 characters) but is trimmed before matching.
      let wrapped: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, '\tphone\n');
      let results: Goods[] = wrapped.apply(PRODUCTS);
      expect(wrapped.keyword.length).assertEqual(7);
      expect(results.length).assertEqual(6);
      let expected: number[] = [0, 1, 6, 8, 9, 14];
      for (let slot: number = 0; slot < expected.length; slot++) {
        expect(results[slot].id).assertEqual(expected[slot]);
      }
      let plain: ProductFilter = new ProductFilter('', 0, Number.MAX_SAFE_INTEGER, 'phone');
      expect(plain.apply(PRODUCTS).length).assertEqual(results.length);
      expect(results[0].id).assertEqual(plain.apply(PRODUCTS)[0].id);
      expect(results[5].id).assertEqual(14);
      expect(wrapped.category).assertEqual('');
      expect(wrapped.inStockOnly).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0480
     * @tc.name      deep_filter_negative_floor_zero_ceiling_keeps_non_positive_048
     * @tc.desc      Verify a negative floor with a zero ceiling keeps non-positive prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_filter_negative_floor_zero_ceiling_keeps_non_positive_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_filter_negative_floor_zero_ceiling_keeps_non_positive_048');
      let goods: Goods[] = [
        createGoods(300, 'Zero Cost', 0, 'phone', 'zero info', 'zero_label'),
        createGoods(301, 'Negative Price', -100, 'phone', 'negative info', 'negative_label'),
        createGoods(302, 'Positive Price', 100, 'phone', 'positive info', 'positive_label')
      ];
      let catalog: Catalog = new Catalog(goods);
      expect(catalog.count()).assertEqual(3);
      let kept: Goods[] = new ProductFilter('', -100, 0).apply(goods);
      expect(kept.length).assertEqual(2);
      expect(kept[0].id).assertEqual(300);
      expect(kept[1].id).assertEqual(301);
      expect(kept[0].price.cents()).assertEqual(0);
      expect(kept[1].price.cents()).assertEqual(-100);
      expect(new ProductFilter('', -100, -1).apply(goods).length).assertEqual(1);
      expect(new ProductFilter('', 0, 0).apply(goods).length).assertEqual(1);
      expect(new ProductFilter('', 1, 100).apply(goods).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0490
     * @tc.name      deep_filter_category_case_variants_return_no_rows_049
     * @tc.desc      Verify four category case variants return no catalog rows.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_filter_category_case_variants_return_no_rows_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_filter_category_case_variants_return_no_rows_049');
      let variants: string[] = ['Phone', 'PHONE', 'phone ', ' phone'];
      for (let slot: number = 0; slot < variants.length; slot++) {
        let filter: ProductFilter = new ProductFilter(variants[slot]);
        expect(filter.apply(PRODUCTS).length).assertEqual(0);
        expect(filter.category).assertEqual(variants[slot]);
      }
      let exact: ProductFilter = new ProductFilter('phone');
      let results: Goods[] = exact.apply(PRODUCTS);
      expect(results.length).assertEqual(6);
      expect(results[0].category).assertEqual('phone');
      expect(results[5].category).assertEqual('phone');
      expect(exact.category).assertEqual('phone');
      expect(exact.apply(PRODUCTS)[1].id).assertEqual(1);
      expect(exact.apply(PRODUCTS)[5].id).assertEqual(14);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0500
     * @tc.name      deep_filter_category_with_nan_ceiling_keeps_price_floor_050
     * @tc.desc      Verify a category with a not-a-number ceiling still applies its price floor.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_filter_category_with_nan_ceiling_keeps_price_floor_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_filter_category_with_nan_ceiling_keeps_price_floor_050');
      let filter: ProductFilter = new ProductFilter('phone', 400000, Number.NaN);
      let results: Goods[] = filter.apply(PRODUCTS);
      expect(results.length).assertEqual(2);
      expect(results[0].id).assertEqual(0);
      expect(results[1].id).assertEqual(8);
      expect(results[0].category).assertEqual('phone');
      expect(results[1].category).assertEqual('phone');
      expect(results[0].price.cents()).assertEqual(499900);
      let broad: ProductFilter = new ProductFilter('phone', 0, Number.NaN);
      expect(broad.apply(PRODUCTS).length).assertEqual(6);
      expect(filter.minCents).assertEqual(400000);
      expect(Number.isNaN(filter.maxCents)).assertTrue();
      expect(filter.category).assertEqual('phone');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0510
     * @tc.name      deep_paging_nan_size_or_page_number_returns_no_items_051
     * @tc.desc      Verify a not-a-number page size or page number returns no items.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_paging_nan_size_or_page_number_returns_no_items_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_paging_nan_size_or_page_number_returns_no_items_051');
      let catalog: Catalog = defaultCatalog();
      expect(catalog.count()).assertEqual(16);
      expect(catalog.page(0, Number.NaN).length).assertEqual(0);
      expect(catalog.page(Number.NaN, 4).length).assertEqual(0);
      expect(catalog.page(1, Number.NaN).length).assertEqual(0);
      expect(catalog.page(Number.NaN, Number.NaN).length).assertEqual(0);
      expect(catalog.page(0, 4).length).assertEqual(4);
      expect(catalog.page(0, 1)[0].id).assertEqual(0);
      expect(catalog.page(1, 1)[0].id).assertEqual(1);
      expect(catalog.page(15, 1)[0].id).assertEqual(15);
      // Id 15 is the last row, so page 16 starts past the end of the 16-row catalog.
      expect(catalog.page(16, 1).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0520
     * @tc.name      deep_paging_nan_page_count_is_not_a_number_052
     * @tc.desc      Verify a not-a-number page size produces a not-a-number page count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_paging_nan_page_count_is_not_a_number_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_paging_nan_page_count_is_not_a_number_052');
      let catalog: Catalog = defaultCatalog();
      // A NaN size slips past the non-positive guard, and Math.ceil carries it through as NaN.
      let count: number = catalog.pageCount(Number.NaN);
      expect(Number.isNaN(count)).assertTrue();
      expect(count === count).assertFalse();
      expect(catalog.pageCount(0)).assertEqual(0);
      expect(catalog.pageCount(-4)).assertEqual(0);
      expect(catalog.pageCount(1)).assertEqual(16);
      expect(catalog.pageCount(2)).assertEqual(8);
      expect(catalog.pageCount(4)).assertEqual(4);
      expect(catalog.pageCount(5)).assertEqual(4);
      expect(catalog.pageCount(8)).assertEqual(2);
      expect(catalog.pageCount(15)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0530
     * @tc.name      deep_paging_huge_size_returns_the_whole_catalog_053
     * @tc.desc      Verify a huge page size returns the whole catalog on page zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_paging_huge_size_returns_the_whole_catalog_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_paging_huge_size_returns_the_whole_catalog_053');
      let catalog: Catalog = defaultCatalog();
      expect(catalog.pageCount(1000000000)).assertEqual(1);
      let all: Goods[] = catalog.page(0, 1000000000);
      expect(all.length).assertEqual(16);
      expect(all[0].id).assertEqual(0);
      expect(all[15].id).assertEqual(15);
      expect(catalog.page(1, 1000000000).length).assertEqual(0);
      expect(catalog.pageCount(Number.MAX_SAFE_INTEGER)).assertEqual(1);
      expect(catalog.page(0, 1000).length).assertEqual(16);
      expect(catalog.page(0, 1000)[15].id).assertEqual(15);
      expect(catalog.page(1, 1000).length).assertEqual(0);
      expect(catalog.pageCount(1000)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0540
     * @tc.name      deep_paging_negative_page_reports_next_without_previous_054
     * @tc.desc      Verify a negative page number reports a next page but no previous page.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_paging_negative_page_reports_next_without_previous_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_paging_negative_page_reports_next_without_previous_054');
      let items: number[] = [1, 2, 3, 4];
      let page: PagedResult<number> = new PagedResult<number>(items, -1, 4, 16);
      expect(page.page).assertEqual(-1);
      expect(page.size).assertEqual(4);
      expect(page.total).assertEqual(16);
      expect(page.count()).assertEqual(4);
      expect(page.hasNext()).assertTrue();
      expect(page.hasPrevious()).assertFalse();
      let last: PagedResult<number> = new PagedResult<number>(items, 3, 4, 16);
      expect(last.hasPrevious()).assertTrue();
      expect(last.items.length).assertEqual(4);
      expect(page.items[0]).assertEqual(1);
      expect(last.items[3]).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_DEEP_ADDRESS_DETAIL_0550
     * @tc.name      deep_paging_oversized_second_page_is_empty_055
     * @tc.desc      Verify an oversized page on the second page number returns no items.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('deep_paging_oversized_second_page_is_empty_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: deep_paging_oversized_second_page_is_empty_055');
      let catalog: Catalog = defaultCatalog();
      expect(catalog.page(0, 32).length).assertEqual(16);
      expect(catalog.page(1, 32).length).assertEqual(0);
      expect(catalog.page(2, 32).length).assertEqual(0);
      expect(catalog.page(0, 17).length).assertEqual(16);
      expect(catalog.page(1, 17).length).assertEqual(0);
      expect(catalog.pageCount(32)).assertEqual(1);
      expect(catalog.pageCount(1)).assertEqual(16);
      expect(catalog.page(15, 1)[0].id).assertEqual(15);
      expect(catalog.pageCount(2)).assertEqual(8);
      expect(catalog.page(7, 2)[1].id).assertEqual(15);
    });
  });
}
