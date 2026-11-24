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
import { Address, AddressBook } from '../Shared/ShopModel';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Address pinned to id 0 with fixed location text. */
function addressOf(name: string, isDefault: boolean): Address {
  return new Address(0, name, '18800001765', 'Anhui', 'Anqing', 'Downtown',
    '100 Main Road', isDefault);
}

/** Lets id, phone and blank optional fields vary; add/update overwrite id. */
function detailedAddress(id: number, name: string, phone: string, province: string,
  city: string, district: string, detail: string, isDefault: boolean): Address {
  return new Address(id, name, phone, province, city, district, detail, isDefault);
}

function countDefaults(book: AddressBook): number {
  let count: number = 0;
  let addresses: Address[] = book.all();
  for (let cursor: number = 0; cursor < addresses.length; cursor++) {
    if (addresses[cursor].isDefault) {
      count++;
    }
  }
  return count;
}

function idsOf(book: AddressBook): number[] {
  let ids: number[] = [];
  let addresses: Address[] = book.all();
  for (let cursor: number = 0; cursor < addresses.length; cursor++) {
    ids.push(addresses[cursor].id);
  }
  return ids;
}

export default function addressBookTest() {
  describe('OrangeShoppingAddressBook', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'address book suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0010
     * @tc.name      address_book_starts_empty_001
     * @tc.desc      Verify address book starts empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_starts_empty_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_starts_empty_001');
      let book: AddressBook = new AddressBook();
      expect(book.size()).assertEqual(0);
      expect(book.all().length).assertEqual(0);
      expect(book.defaultAddress() === null || book.defaultAddress() === undefined).assertTrue();
      expect(book.indexOf(1)).assertEqual(-1);
      expect(book.all().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0020
     * @tc.name      address_book_add_returns_sequential_ids_002
     * @tc.desc      Verify address book add returns sequential ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_returns_sequential_ids_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_returns_sequential_ids_002');
      let book: AddressBook = new AddressBook();
      let first: number = book.add(addressOf('Alice', false));
      let second: number = book.add(addressOf('Bob', false));
      let third: number = book.add(addressOf('Carol', false));
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(third).assertEqual(3);
      expect(book.size()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0030
     * @tc.name      address_book_add_ignores_the_supplied_id_003
     * @tc.desc      Verify address book add ignores the supplied id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_ignores_the_supplied_id_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_ignores_the_supplied_id_003');
      let book: AddressBook = new AddressBook();
      // add() allocates from its own counter, so the id 99 baked into the argument is irrelevant.
      let supplied: Address = detailedAddress(99, 'Alice', '18800001765', 'Anhui',
        'Anqing', 'Downtown', '100 Main Road', false);
      let assigned: number = book.add(supplied);
      expect(assigned).assertEqual(1);
      expect(book.all()[0].id).assertEqual(1);
      expect(book.indexOf(99)).assertEqual(-1);
      expect(book.indexOf(1)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0040
     * @tc.name      address_book_add_first_address_becomes_default_004
     * @tc.desc      Verify address book add first address becomes default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_first_address_becomes_default_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_first_address_becomes_default_004');
      let book: AddressBook = new AddressBook();
      // The first insert is promoted to default even though addressOf built it with isDefault false.
      let id: number = book.add(addressOf('Alice', false));
      expect(id).assertEqual(1);
      let stored: Address = book.all()[0];
      expect(stored.isDefault).assertTrue();
      expect(stored.name).assertEqual('Alice');
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.id).assertEqual(1);
        expect(current.name).assertEqual('Alice');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0050
     * @tc.name      address_book_add_two_defaults_in_a_row_keeps_last_005
     * @tc.desc      Verify address book add two defaults in a row keeps last.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_two_defaults_in_a_row_keeps_last_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_two_defaults_in_a_row_keeps_last_005');
      let book: AddressBook = new AddressBook();
      // A second explicit default demotes the first, keeping the one-default invariant.
      book.add(addressOf('Alice', true));
      book.add(addressOf('Bob', true));
      expect(book.size()).assertEqual(2);
      expect(book.all()[0].isDefault).assertFalse();
      expect(book.all()[1].isDefault).assertTrue();
      expect(countDefaults(book)).assertEqual(1);
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.id).assertEqual(2);
        expect(current.name).assertEqual('Bob');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0060
     * @tc.name      address_book_add_second_plain_keeps_first_default_006
     * @tc.desc      Verify address book add second plain keeps first default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_second_plain_keeps_first_default_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_second_plain_keeps_first_default_006');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      expect(book.size()).assertEqual(2);
      expect(book.all()[0].isDefault).assertTrue();
      expect(book.all()[1].isDefault).assertFalse();
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.id).assertEqual(1);
        expect(current.name).assertEqual('Alice');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0070
     * @tc.name      address_book_add_explicit_default_on_second_moves_default_007
     * @tc.desc      Verify address book add explicit default on second moves default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_explicit_default_on_second_moves_default_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_explicit_default_on_second_moves_default_007');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', true));
      expect(book.all()[0].isDefault).assertFalse();
      expect(book.all()[1].isDefault).assertTrue();
      expect(countDefaults(book)).assertEqual(1);
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.id).assertEqual(2);
        expect(current.name).assertEqual('Bob');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0080
     * @tc.name      address_book_add_explicit_default_on_third_is_exclusive_008
     * @tc.desc      Verify address book add explicit default on third is exclusive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_explicit_default_on_third_is_exclusive_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_explicit_default_on_third_is_exclusive_008');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', true));
      expect(countDefaults(book)).assertEqual(1);
      expect(book.all()[0].isDefault).assertFalse();
      expect(book.all()[1].isDefault).assertFalse();
      expect(book.all()[2].isDefault).assertTrue();
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.id).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0090
     * @tc.name      address_book_add_copies_the_input_address_009
     * @tc.desc      Verify address book add copies the input address.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_copies_the_input_address_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_copies_the_input_address_009');
      let book: AddressBook = new AddressBook();
      let source: Address = addressOf('Alice', false);
      book.add(source);
      // The book holds a copy, so editing source afterwards must not reach the stored entry or its default flag.
      source.name = 'Changed';
      source.phone = '13900001234';
      source.isDefault = false;
      let stored: Address = book.all()[0];

      expect(stored.name).assertEqual('Alice');
      expect(stored.phone).assertEqual('18800001765');
      expect(stored.isDefault).assertTrue();
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.name).assertEqual('Alice');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0100
     * @tc.name      address_book_add_does_not_reorder_existing_addresses_010
     * @tc.desc      Verify address book add does not reorder existing addresses.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_does_not_reorder_existing_addresses_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_does_not_reorder_existing_addresses_010');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      let before: number[] = idsOf(book);
      book.add(addressOf('David', false));
      let after: number[] = idsOf(book);
      expect(after.length).assertEqual(4);
      expect(after[0]).assertEqual(before[0]);
      expect(after[1]).assertEqual(before[1]);
      expect(after[2]).assertEqual(before[2]);
      expect(after[3]).assertEqual(4);
      expect(book.all()[0].name).assertEqual('Alice');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0110
     * @tc.name      address_book_add_consecutive_addresses_preserve_order_011
     * @tc.desc      Verify address book add consecutive addresses preserve order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_consecutive_addresses_preserve_order_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_consecutive_addresses_preserve_order_011');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      let addresses: Address[] = book.all();
      expect(addresses[0].name).assertEqual('Alice');
      expect(addresses[1].name).assertEqual('Bob');
      expect(addresses[2].name).assertEqual('Carol');
      let __seen13: number[] = [];
      for (let __i13: number = 0; __i13 < (idsOf(book)).length; __i13++) {
        expect(__seen13.indexOf((idsOf(book))[__i13]) < 0).assertTrue();
        __seen13.push((idsOf(book))[__i13]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0120
     * @tc.name      address_book_add_same_name_twice_keeps_both_012
     * @tc.desc      Verify address book add same name twice keeps both.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_same_name_twice_keeps_both_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_same_name_twice_keeps_both_012');
      let book: AddressBook = new AddressBook();
      let first: number = book.add(addressOf('Alex', false));
      let second: number = book.add(addressOf('Alex', false));
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(book.size()).assertEqual(2);
      expect(book.all()[0].name).assertEqual('Alex');
      expect(book.all()[1].name).assertEqual('Alex');
      expect(countDefaults(book)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0130
     * @tc.name      address_book_add_after_remove_does_not_reuse_ids_013
     * @tc.desc      Verify address book add after remove does not reuse ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_after_remove_does_not_reuse_ids_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_after_remove_does_not_reuse_ids_013');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.remove(1);
      // Removing id 1 does not rewind the counter, so the next insert is 3 rather than a reused 1.
      let assigned: number = book.add(addressOf('Carol', false));
      expect(assigned).assertEqual(3);
      expect(book.size()).assertEqual(2);
      expect(book.indexOf(3)).assertEqual(1);
      expect(book.indexOf(1)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0140
     * @tc.name      address_book_add_after_removing_all_becomes_default_014
     * @tc.desc      Verify address book add after removing all becomes default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_after_removing_all_becomes_default_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_after_removing_all_becomes_default_014');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.remove(1);
      expect(book.size()).assertEqual(0);
      expect(book.defaultAddress() === null || book.defaultAddress() === undefined).assertTrue();
      // With the book emptied, the next insert is promoted to default even though the counter continues at 2.
      let assigned: number = book.add(addressOf('Bob', false));
      expect(assigned).assertEqual(2);
      expect(book.all()[0].isDefault).assertTrue();
      expect(countDefaults(book)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0150
     * @tc.name      address_book_size_tracks_adds_and_removes_015
     * @tc.desc      Verify address book size tracks adds and removes.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_size_tracks_adds_and_removes_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_size_tracks_adds_and_removes_015');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      expect(book.size()).assertEqual(3);
      book.remove(2);
      expect(book.size()).assertEqual(2);
      book.add(addressOf('David', false));
      expect(book.size()).assertEqual(3);
      expect(book.all().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0160
     * @tc.name      address_book_update_one_address_leaves_other_untouched_016
     * @tc.desc      Verify address book update one address leaves other untouched.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_one_address_leaves_other_untouched_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_one_address_leaves_other_untouched_016');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.update(2, addressOf('Bob Two', false));
      let first: Address = book.all()[0];
      expect(first.name).assertEqual('Alice');
      expect(first.phone).assertEqual('18800001765');
      expect(first.detail).assertEqual('100 Main Road');
      expect(first.isDefault).assertTrue();
      expect(book.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0170
     * @tc.name      address_book_remove_one_address_leaves_other_untouched_017
     * @tc.desc      Verify address book remove one address leaves other untouched.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_one_address_leaves_other_untouched_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_one_address_leaves_other_untouched_017');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      book.remove(2);
      let first: Address = book.all()[0];
      let last: Address = book.all()[1];
      expect(first.name).assertEqual('Alice');
      expect(last.name).assertEqual('Carol');
      expect(first.id).assertEqual(1);
      expect(last.id).assertEqual(3);
      expect(first.isDefault).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0180
     * @tc.name      address_book_set_default_moves_the_flag_018
     * @tc.desc      Verify address book set default moves the flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_set_default_moves_the_flag_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_set_default_moves_the_flag_018');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      let changed: boolean = book.setDefault(2);
      expect(changed).assertTrue();
      expect(book.all()[0].isDefault).assertFalse();
      expect(book.all()[1].isDefault).assertTrue();
      expect(countDefaults(book)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0190
     * @tc.name      address_book_set_default_same_id_is_idempotent_019
     * @tc.desc      Verify address book set default same id is idempotent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_set_default_same_id_is_idempotent_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_set_default_same_id_is_idempotent_019');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      let first: boolean = book.setDefault(1);
      let second: boolean = book.setDefault(1);
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(book.all()[0].isDefault).assertTrue();
      expect(countDefaults(book)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0200
     * @tc.name      address_book_set_default_unknown_returns_false_020
     * @tc.desc      Verify address book set default unknown returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_set_default_unknown_returns_false_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_set_default_unknown_returns_false_020');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      let changed: boolean = book.setDefault(42);
      expect(changed).assertFalse();
      expect(book.all()[0].isDefault).assertTrue();
      expect(book.all()[1].isDefault).assertFalse();
      expect(countDefaults(book)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0210
     * @tc.name      address_book_set_default_on_empty_book_returns_false_021
     * @tc.desc      Verify address book set default on empty book returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_set_default_on_empty_book_returns_false_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_set_default_on_empty_book_returns_false_021');
      let book: AddressBook = new AddressBook();
      let changed: boolean = book.setDefault(1);
      expect(changed).assertFalse();
      expect(book.size()).assertEqual(0);
      expect(book.defaultAddress() === null || book.defaultAddress() === undefined).assertTrue();
      expect(countDefaults(book)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0220
     * @tc.name      address_book_set_default_zero_id_returns_false_022
     * @tc.desc      Verify address book set default zero id returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_set_default_zero_id_returns_false_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_set_default_zero_id_returns_false_022');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      // Ids begin at 1, so 0 can never match an entry and the existing default must stay put.
      let changed: boolean = book.setDefault(0);
      expect(changed).assertFalse();
      expect(book.all()[0].isDefault).assertTrue();
      expect(book.all()[1].isDefault).assertFalse();
      expect(countDefaults(book)).assertEqual(1);
      expect(book.indexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0230
     * @tc.name      address_book_set_default_keeps_a_single_default_023
     * @tc.desc      Verify address book set default keeps a single default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_set_default_keeps_a_single_default_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_set_default_keeps_a_single_default_023');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      book.setDefault(2);
      expect(countDefaults(book)).assertEqual(1);
      book.setDefault(3);
      expect(countDefaults(book)).assertEqual(1);
      book.setDefault(1);
      expect(countDefaults(book)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0240
     * @tc.name      address_book_remove_known_returns_true_024
     * @tc.desc      Verify address book remove known returns true.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_known_returns_true_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_known_returns_true_024');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      let removed: boolean = book.remove(2);
      expect(removed).assertTrue();
      expect(book.size()).assertEqual(1);
      expect(book.indexOf(2)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0250
     * @tc.name      address_book_remove_unknown_returns_false_025
     * @tc.desc      Verify address book remove unknown returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_unknown_returns_false_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_unknown_returns_false_025');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      let removed: boolean = book.remove(77);
      expect(removed).assertFalse();
      expect(book.size()).assertEqual(2);
      expect(book.indexOf(77)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0260
     * @tc.name      address_book_remove_default_promotes_first_remaining_026
     * @tc.desc      Verify address book remove default promotes first remaining.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_default_promotes_first_remaining_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_default_promotes_first_remaining_026');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      // Deleting the current default promotes the earliest surviving address, here id 1.
      book.setDefault(2);
      let removed: boolean = book.remove(2);
      expect(removed).assertTrue();
      expect(book.size()).assertEqual(2);
      expect(book.all()[0].isDefault).assertTrue();
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.id).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0270
     * @tc.name      address_book_remove_non_default_before_default_027
     * @tc.desc      Verify address book remove non default before default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_non_default_before_default_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_non_default_before_default_027');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      let removed: boolean = book.remove(2);
      expect(removed).assertTrue();
      expect(book.size()).assertEqual(2);
      expect(book.all()[0].id).assertEqual(1);
      expect(book.all()[1].id).assertEqual(3);
      expect(book.all()[0].isDefault).assertTrue();
      expect(book.all()[1].name).assertEqual('Carol');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0280
     * @tc.name      address_book_remove_only_default_leaves_no_default_028
     * @tc.desc      Verify address book remove only default leaves no default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_only_default_leaves_no_default_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_only_default_leaves_no_default_028');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      let removed: boolean = book.remove(1);
      expect(removed).assertTrue();
      expect(book.size()).assertEqual(0);
      expect(book.all().length).assertEqual(0);
      expect(book.defaultAddress() === null || book.defaultAddress() === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0290
     * @tc.name      address_book_remove_non_default_keeps_default_029
     * @tc.desc      Verify address book remove non default keeps default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_non_default_keeps_default_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_non_default_keeps_default_029');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      let removed: boolean = book.remove(2);
      expect(removed).assertTrue();
      expect(book.all()[0].isDefault).assertTrue();
      expect(book.all()[1].isDefault).assertFalse();
      expect(countDefaults(book)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0300
     * @tc.name      address_book_remove_middle_preserves_order_030
     * @tc.desc      Verify address book remove middle preserves order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_middle_preserves_order_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_middle_preserves_order_030');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      book.add(addressOf('David', false));
      book.remove(2);
      let ids: number[] = idsOf(book);
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(3);
      expect(ids[2]).assertEqual(4);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0310
     * @tc.name      address_book_remove_middle_then_add_appends_in_order_031
     * @tc.desc      Verify address book remove middle then add appends in order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_middle_then_add_appends_in_order_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_middle_then_add_appends_in_order_031');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      book.remove(2);
      let assigned: number = book.add(addressOf('David', false));
      expect(assigned).assertEqual(4);
      let ids: number[] = idsOf(book);
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(3);
      expect(ids[2]).assertEqual(4);
      expect(book.all()[0].isDefault).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0320
     * @tc.name      address_book_remove_non_default_after_setting_other_default_032
     * @tc.desc      Verify address book remove non default after setting other default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_non_default_after_setting_other_default_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_non_default_after_setting_other_default_032');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      book.setDefault(3);
      book.remove(1);
      expect(book.size()).assertEqual(2);
      expect(book.all()[0].isDefault).assertFalse();
      expect(book.all()[1].isDefault).assertTrue();
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.id).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0330
     * @tc.name      address_book_remove_last_non_default_keeps_default_033
     * @tc.desc      Verify address book remove last non default keeps default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_last_non_default_keeps_default_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_last_non_default_keeps_default_033');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      let removed: boolean = book.remove(3);
      expect(removed).assertTrue();
      expect(book.size()).assertEqual(2);
      expect(book.all()[0].id).assertEqual(1);
      expect(book.all()[1].id).assertEqual(2);
      expect(book.all()[0].isDefault).assertTrue();
      expect(countDefaults(book)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0340
     * @tc.name      address_book_remove_all_then_add_continues_ids_034
     * @tc.desc      Verify address book remove all then add continues ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_all_then_add_continues_ids_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_all_then_add_continues_ids_034');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.remove(1);
      book.remove(2);
      expect(book.size()).assertEqual(0);
      let assigned: number = book.add(addressOf('Carol', false));
      expect(assigned).assertEqual(3);
      expect(book.size()).assertEqual(1);
      expect(book.all()[0].isDefault).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0350
     * @tc.name      address_book_update_replaces_fields_keeps_id_035
     * @tc.desc      Verify address book update replaces fields keeps id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_replaces_fields_keeps_id_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_replaces_fields_keeps_id_035');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      let replacement: Address = detailedAddress(0, 'Alice Two', '13900001234', 'Beijing',
        'Beijing', 'Chaoyang', '200 East Road', false);
      let updated: boolean = book.update(1, replacement);
      expect(updated).assertTrue();
      let stored: Address = book.all()[0];
      expect(stored.id).assertEqual(1);
      expect(stored.name).assertEqual('Alice Two');
      expect(stored.phone).assertEqual('13900001234');
      expect(stored.city).assertEqual('Beijing');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0360
     * @tc.name      address_book_update_ignores_the_supplied_id_036
     * @tc.desc      Verify address book update ignores the supplied id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_ignores_the_supplied_id_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_ignores_the_supplied_id_036');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      // The replacement carries id 99, but the entry stored under key 2 keeps key 2.
      let replacement: Address = detailedAddress(99, 'Bob Two', '13900001234', 'Beijing',
        'Beijing', 'Chaoyang', '200 East Road', false);
      let updated: boolean = book.update(2, replacement);
      expect(updated).assertTrue();
      expect(book.all()[1].id).assertEqual(2);
      expect(book.indexOf(99)).assertEqual(-1);
      expect(book.all()[1].name).assertEqual('Bob Two');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0370
     * @tc.name      address_book_update_unknown_returns_false_037
     * @tc.desc      Verify address book update unknown returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_unknown_returns_false_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_unknown_returns_false_037');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      let updated: boolean = book.update(55, addressOf('Ghost', false));
      expect(updated).assertFalse();
      expect(book.size()).assertEqual(1);
      expect(book.indexOf(55)).assertEqual(-1);
      expect(book.all()[0].name).assertEqual('Alice');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0380
     * @tc.name      address_book_update_keeps_position_038
     * @tc.desc      Verify address book update keeps position.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_keeps_position_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_keeps_position_038');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      book.update(2, addressOf('Bob Two', false));
      let ids: number[] = idsOf(book);
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(2);
      expect(ids[2]).assertEqual(3);
      expect(book.all()[1].name).assertEqual('Bob Two');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0390
     * @tc.name      address_book_update_uses_a_copy_039
     * @tc.desc      Verify address book update uses a copy.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_uses_a_copy_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_uses_a_copy_039');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      let replacement: Address = addressOf('Alice Two', false);
      book.update(1, replacement);
      // update() copies the argument, so overwriting it afterwards leaves the stored record untouched.
      replacement.name = 'Mutated';
      replacement.detail = 'Changed Road';
      expect(book.all()[0].name).assertEqual('Alice Two');
      expect(book.all()[0].detail).assertEqual('100 Main Road');
      expect(book.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0400
     * @tc.name      address_book_update_to_default_moves_flag_040
     * @tc.desc      Verify address book update to default moves flag.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_to_default_moves_flag_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_to_default_moves_flag_040');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      let updated: boolean = book.update(2, addressOf('Bob Two', true));
      expect(updated).assertTrue();
      expect(book.all()[0].isDefault).assertFalse();
      expect(book.all()[1].isDefault).assertTrue();
      expect(countDefaults(book)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0410
     * @tc.name      address_book_update_default_address_with_default_flag_true_041
     * @tc.desc      Verify address book update default address with default flag true.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_default_address_with_default_flag_true_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_default_address_with_default_flag_true_041');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      let updated: boolean = book.update(1, addressOf('Alice Two', true));
      expect(updated).assertTrue();
      expect(book.all()[0].isDefault).assertTrue();
      expect(book.all()[1].isDefault).assertFalse();
      expect(countDefaults(book)).assertEqual(1);
      expect(book.all()[0].name).assertEqual('Alice Two');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0420
     * @tc.name      address_book_update_default_to_plain_keeps_a_default_042
     * @tc.desc      Verify address book update default to plain keeps a default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_default_to_plain_keeps_a_default_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_default_to_plain_keeps_a_default_042');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      let updated: boolean = book.update(1, addressOf('Alice Two', false));
      expect(updated).assertTrue();
      expect(book.all()[0].isDefault).assertTrue();
      expect(countDefaults(book)).assertEqual(1);
      expect(book.all()[0].name).assertEqual('Alice Two');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0430
     * @tc.name      address_book_update_only_address_to_plain_keeps_default_043
     * @tc.desc      Verify address book update only address to plain keeps default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_only_address_to_plain_keeps_default_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_only_address_to_plain_keeps_default_043');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.update(1, addressOf('Alice Two', false));
      expect(book.size()).assertEqual(1);
      expect(book.all()[0].isDefault).assertTrue();
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.name).assertEqual('Alice Two');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0440
     * @tc.name      address_book_update_preserves_unchanged_fields_044
     * @tc.desc      Verify address book update preserves unchanged fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_preserves_unchanged_fields_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_preserves_unchanged_fields_044');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      let replacement: Address = detailedAddress(1, 'Alice Two', '18800001765', 'Anhui',
        'Anqing', 'Downtown', '100 Main Road', false);
      book.update(1, replacement);
      let stored: Address = book.all()[0];
      expect(stored.name).assertEqual('Alice Two');
      expect(stored.phone).assertEqual('18800001765');
      expect(stored.district).assertEqual('Downtown');
      expect(stored.detail).assertEqual('100 Main Road');
      expect(stored.id).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0450
     * @tc.name      address_book_update_negative_id_returns_false_045
     * @tc.desc      Verify address book update negative id returns false.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_negative_id_returns_false_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_negative_id_returns_false_045');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      let updated: boolean = book.update(-1, addressOf('Ghost', false));
      expect(updated).assertFalse();
      expect(book.size()).assertEqual(1);
      expect(book.all()[0].name).assertEqual('Alice');
      expect(book.all()[0].isDefault).assertTrue();
      expect(book.indexOf(-1)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0460
     * @tc.name      address_book_update_twice_same_address_keeps_latest_046
     * @tc.desc      Verify address book update twice same address keeps latest.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_twice_same_address_keeps_latest_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_twice_same_address_keeps_latest_046');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.update(2, addressOf('Bob Two', false));
      book.update(2, addressOf('Bob Three', false));
      expect(book.size()).assertEqual(2);
      expect(book.all()[1].id).assertEqual(2);
      expect(book.all()[1].name).assertEqual('Bob Three');
      expect(countDefaults(book)).assertEqual(1);
      expect(book.all()[0].isDefault).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0470
     * @tc.name      address_book_update_third_while_second_is_default_047
     * @tc.desc      Verify address book update third while second is default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_third_while_second_is_default_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_third_while_second_is_default_047');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      book.setDefault(2);
      book.update(3, addressOf('Carol Two', false));
      expect(book.all()[1].isDefault).assertTrue();
      expect(book.all()[0].isDefault).assertFalse();
      expect(book.all()[2].isDefault).assertFalse();
      expect(countDefaults(book)).assertEqual(1);
      expect(book.all()[2].name).assertEqual('Carol Two');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0480
     * @tc.name      address_book_all_returns_internal_array_048
     * @tc.desc      Verify address book all returns internal array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_all_returns_internal_array_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_all_returns_internal_array_048');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      // all() hands out the backing array rather than a copy, so a push on it is a real insert.
      let exposed: Address[] = book.all();
      expect(exposed.length).assertEqual(1);
      exposed.push(addressOf('Bob', false));
      expect(book.size()).assertEqual(2);
      expect(book.all().length).assertEqual(2);
      exposed.splice(1, 1);
      expect(book.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0490
     * @tc.name      address_book_all_returns_the_same_internal_array_049
     * @tc.desc      Verify address book all returns the same internal array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_all_returns_the_same_internal_array_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_all_returns_the_same_internal_array_049');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      // Both calls share one array instance, so a rename through second is visible through first.
      let first: Address[] = book.all();
      let second: Address[] = book.all();
      expect(first === second).assertTrue();
      second[0].name = 'Changed';
      expect(first[0].name).assertEqual('Changed');
      expect(book.all()[0].name).assertEqual('Changed');
      expect(book.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0500
     * @tc.name      address_book_all_after_update_reflects_new_values_050
     * @tc.desc      Verify address book all after update reflects new values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_all_after_update_reflects_new_values_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_all_after_update_reflects_new_values_050');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.update(1, addressOf('Alice Two', false));
      let addresses: Address[] = book.all();
      expect(addresses.length).assertEqual(2);
      expect(addresses[0].name).assertEqual('Alice Two');
      expect(addresses[1].name).assertEqual('Bob');
      expect(addresses[0].id).assertEqual(1);
      expect(addresses[1].id).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0510
     * @tc.name      address_book_all_after_set_default_exposes_flags_051
     * @tc.desc      Verify address book all after set default exposes flags.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_all_after_set_default_exposes_flags_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_all_after_set_default_exposes_flags_051');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      book.setDefault(2);
      let addresses: Address[] = book.all();
      expect(addresses.length).assertEqual(3);
      expect(addresses[0].isDefault).assertFalse();
      expect(addresses[1].isDefault).assertTrue();
      expect(addresses[2].isDefault).assertFalse();
      expect(countDefaults(book)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0520
     * @tc.name      address_book_all_after_removing_first_shows_promotion_052
     * @tc.desc      Verify address book all after removing first shows promotion.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_all_after_removing_first_shows_promotion_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_all_after_removing_first_shows_promotion_052');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      // Removing the default id 1 promotes the next surviving address, id 2.
      book.remove(1);
      let addresses: Address[] = book.all();
      expect(addresses.length).assertEqual(2);
      expect(addresses[0].id).assertEqual(2);
      expect(addresses[1].id).assertEqual(3);
      expect(addresses[0].isDefault).assertTrue();
      expect(addresses[1].isDefault).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0530
     * @tc.name      address_book_default_address_on_empty_book_053
     * @tc.desc      Verify address book default address on empty book.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_default_address_on_empty_book_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_default_address_on_empty_book_053');
      let book: AddressBook = new AddressBook();
      let current: Address | undefined = book.defaultAddress();
      expect(current === null || current === undefined).assertTrue();
      expect(book.size()).assertEqual(0);
      expect(countDefaults(book)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0540
     * @tc.name      address_book_default_address_returns_stored_address_054
     * @tc.desc      Verify address book default address returns stored address.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_default_address_returns_stored_address_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_default_address_returns_stored_address_054');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.id).assertEqual(1);
        expect(current.name).assertEqual('Alice');
        expect(current.isDefault).assertTrue();
        expect(current.phone).assertEqual('18800001765');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0550
     * @tc.name      address_book_default_address_follows_set_default_055
     * @tc.desc      Verify address book default address follows set default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_default_address_follows_set_default_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_default_address_follows_set_default_055');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      book.setDefault(3);
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.id).assertEqual(3);
        expect(current.name).assertEqual('Carol');
      }
      expect(countDefaults(book)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0560
     * @tc.name      address_book_default_address_returns_live_instance_056
     * @tc.desc      Verify address book default address returns live instance.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_default_address_returns_live_instance_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_default_address_returns_live_instance_056');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        // defaultAddress() hands back the stored object itself, so writing to it is a real edit.
        current.name = 'Changed';
        current.detail = 'Changed Road';
      }
      expect(book.all()[0].name).assertEqual('Changed');
      expect(book.all()[0].detail).assertEqual('Changed Road');
      expect(book.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0570
     * @tc.name      address_book_never_has_two_defaults_057
     * @tc.desc      Verify address book never has two defaults.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_never_has_two_defaults_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_never_has_two_defaults_057');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', true));
      book.add(addressOf('Carol', false));
      expect(countDefaults(book)).assertEqual(1);
      book.setDefault(3);
      expect(countDefaults(book)).assertEqual(1);
      book.update(1, addressOf('Alice Two', true));
      expect(countDefaults(book)).assertEqual(1);
      expect(book.all()[0].isDefault).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0580
     * @tc.name      address_book_address_copy_preserves_fields_058
     * @tc.desc      Verify address book address copy preserves fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_address_copy_preserves_fields_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_address_copy_preserves_fields_058');
      let source: Address = detailedAddress(7, 'Alice', '18800001765', 'Anhui', 'Anqing',
        'Downtown', '100 Main Road', true);
      // copy() carries every field over, including id 7 and the default flag, while being a distinct object.
      let duplicate: Address = source.copy();
      expect(duplicate !== source).assertTrue();
      expect(duplicate.id).assertEqual(7);
      expect(duplicate.name).assertEqual('Alice');
      expect(duplicate.phone).assertEqual('18800001765');
      expect(duplicate.province).assertEqual('Anhui');
      expect(duplicate.city).assertEqual('Anqing');
      expect(duplicate.district).assertEqual('Downtown');
      expect(duplicate.detail).assertEqual('100 Main Road');
      expect(duplicate.isDefault).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0590
     * @tc.name      address_book_address_copy_is_independent_059
     * @tc.desc      Verify address book address copy is independent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_address_copy_is_independent_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_address_copy_is_independent_059');
      let source: Address = addressOf('Alice', true);
      let duplicate: Address = source.copy();
      source.name = 'Changed';
      source.isDefault = false;
      source.detail = 'Changed Road';
      expect(duplicate.name).assertEqual('Alice');
      expect(duplicate.isDefault).assertTrue();
      expect(duplicate.detail).assertEqual('100 Main Road');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0600
     * @tc.name      address_book_copy_does_not_mutate_the_book_060
     * @tc.desc      Verify address book copy does not mutate the book.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_copy_does_not_mutate_the_book_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_copy_does_not_mutate_the_book_060');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      let duplicate: Address = book.all()[0].copy();
      duplicate.name = 'Changed';
      duplicate.isDefault = false;
      duplicate.detail = 'Changed Road';
      expect(book.all()[0].name).assertEqual('Alice');
      expect(book.all()[0].isDefault).assertTrue();
      expect(book.all()[0].detail).assertEqual('100 Main Road');
      expect(book.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0610
     * @tc.name      address_book_index_of_reports_positions_061
     * @tc.desc      Verify address book index of reports positions.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_index_of_reports_positions_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_index_of_reports_positions_061');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      expect(book.indexOf(1)).assertEqual(0);
      expect(book.indexOf(2)).assertEqual(1);
      expect(book.indexOf(3)).assertEqual(2);
      expect(book.indexOf(4)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0620
     * @tc.name      address_book_ids_after_set_default_are_stable_062
     * @tc.desc      Verify address book ids after set default are stable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_ids_after_set_default_are_stable_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_ids_after_set_default_are_stable_062');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      book.setDefault(3);
      let ids: number[] = idsOf(book);
      expect(ids.length).assertEqual(3);
      let __seen14: number[] = [];
      for (let __i14: number = 0; __i14 < (ids).length; __i14++) {
        expect(__seen14.indexOf((ids)[__i14]) < 0).assertTrue();
        __seen14.push((ids)[__i14]);
      }
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(2);
      expect(ids[2]).assertEqual(3);
      expect(book.indexOf(3)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0630
     * @tc.name      address_book_update_with_same_values_is_idempotent_063
     * @tc.desc      Verify address book update with same values is idempotent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_with_same_values_is_idempotent_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_with_same_values_is_idempotent_063');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      let replacement: Address = addressOf('Bob', false);
      let first: boolean = book.update(2, replacement);
      let second: boolean = book.update(2, replacement);
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(book.size()).assertEqual(2);
      expect(book.all()[1].name).assertEqual('Bob');
      expect(book.all()[1].id).assertEqual(2);
      expect(countDefaults(book)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0640
     * @tc.name      address_book_set_default_preserves_other_fields_064
     * @tc.desc      Verify address book set default preserves other fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_set_default_preserves_other_fields_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_set_default_preserves_other_fields_064');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.setDefault(2);
      let address: Address = book.all()[1];
      expect(address.name).assertEqual('Bob');
      expect(address.phone).assertEqual('18800001765');
      expect(address.detail).assertEqual('100 Main Road');
      expect(address.id).assertEqual(2);
      expect(book.size()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0650
     * @tc.name      address_book_remove_default_then_plain_add_keeps_promoted_065
     * @tc.desc      Verify address book remove default then plain add keeps promoted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_default_then_plain_add_keeps_promoted_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_default_then_plain_add_keeps_promoted_065');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      // The plain insert after promotion must not steal the default from the promoted address.
      book.remove(1);
      expect(book.all()[0].isDefault).assertTrue();
      let assigned: number = book.add(addressOf('Carol', false));
      expect(assigned).assertEqual(3);
      expect(book.all()[0].isDefault).assertTrue();
      expect(book.all()[1].isDefault).assertFalse();
      expect(countDefaults(book)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0660
     * @tc.name      address_book_set_default_to_last_then_plain_add_keeps_last_066
     * @tc.desc      Verify address book set default to last then plain add keeps last.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_set_default_to_last_then_plain_add_keeps_last_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_set_default_to_last_then_plain_add_keeps_last_066');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.setDefault(2);
      book.add(addressOf('Carol', false));
      expect(book.all()[0].isDefault).assertFalse();
      expect(book.all()[1].isDefault).assertTrue();
      expect(book.all()[2].isDefault).assertFalse();
      expect(book.size()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0670
     * @tc.name      address_book_update_all_addresses_keeps_ids_and_order_067
     * @tc.desc      Verify address book update all addresses keeps ids and order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_all_addresses_keeps_ids_and_order_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_all_addresses_keeps_ids_and_order_067');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      let replacements: string[] = ['Alice Two', 'Bob Two', 'Carol Two'];
      for (let cursor: number = 0; cursor < replacements.length; cursor++) {
        let changed: boolean = book.update(cursor + 1, addressOf(replacements[cursor], false));

        expect(changed).assertTrue();
      }
      let ids: number[] = idsOf(book);
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(2);
      expect(ids[2]).assertEqual(3);
      expect(book.all()[2].name).assertEqual('Carol Two');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0680
     * @tc.name      address_book_remove_each_address_leaves_empty_book_068
     * @tc.desc      Verify address book remove each address leaves empty book.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_each_address_leaves_empty_book_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_each_address_leaves_empty_book_068');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      let removable: number[] = [1, 2, 3];
      for (let cursor: number = 0; cursor < removable.length; cursor++) {
        let removed: boolean = book.remove(removable[cursor]);
        expect(removed).assertTrue();
      }
      expect(book.size()).assertEqual(0);
      expect(book.all().length).assertEqual(0);
      expect(book.defaultAddress() === null || book.defaultAddress() === undefined).assertTrue();
      expect(countDefaults(book)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0690
     * @tc.name      address_book_update_can_clear_optional_fields_069
     * @tc.desc      Verify address book update can clear optional fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_can_clear_optional_fields_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_can_clear_optional_fields_069');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      // Empty strings for district and detail must overwrite the previous values rather than being skipped.
      let replacement: Address = detailedAddress(0, 'Alice', '18800001765', 'Anhui',
        'Anqing', '', '', false);
      let updated: boolean = book.update(1, replacement);
      expect(updated).assertTrue();
      expect(book.all()[0].district).assertEqual('');
      expect(book.all()[0].detail).assertEqual('');
      expect(book.all()[0].isDefault).assertTrue();
      expect(book.size()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0700
     * @tc.name      address_book_add_between_updates_continues_ids_070
     * @tc.desc      Verify address book add between updates continues ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_add_between_updates_continues_ids_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_add_between_updates_continues_ids_070');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.update(1, addressOf('Alice Two', false));
      let assigned: number = book.add(addressOf('Bob', false));
      expect(assigned).assertEqual(2);
      expect(book.size()).assertEqual(2);
      expect(book.all()[0].id).assertEqual(1);
      expect(book.all()[1].id).assertEqual(2);
      expect(book.all()[1].name).assertEqual('Bob');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0710
     * @tc.name      address_book_set_default_unknown_does_not_advance_next_id_071
     * @tc.desc      Verify address book set default unknown does not advance next id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_set_default_unknown_does_not_advance_next_id_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_set_default_unknown_does_not_advance_next_id_071');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      // A failed setDefault consumes no id, so the following add still receives 2.
      let changed: boolean = book.setDefault(50);
      expect(changed).assertFalse();
      let assigned: number = book.add(addressOf('Bob', false));
      expect(assigned).assertEqual(2);
      expect(book.size()).assertEqual(2);
      expect(book.indexOf(2)).assertEqual(1);
      expect(book.all()[0].isDefault).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0720
     * @tc.name      address_book_update_known_does_not_advance_next_id_072
     * @tc.desc      Verify address book update known does not advance next id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_known_does_not_advance_next_id_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_known_does_not_advance_next_id_072');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      let updated: boolean = book.update(1, addressOf('Alice Two', false));
      expect(updated).assertTrue();
      let assigned: number = book.add(addressOf('Bob', false));
      expect(assigned).assertEqual(2);
      expect(book.size()).assertEqual(2);
      expect(book.all()[0].name).assertEqual('Alice Two');
      expect(book.all()[1].id).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0730
     * @tc.name      address_book_update_second_to_default_then_remove_first_073
     * @tc.desc      Verify address book update second to default then remove first.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_second_to_default_then_remove_first_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_second_to_default_then_remove_first_073');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      book.update(2, addressOf('Bob Two', true));
      book.remove(1);
      expect(book.size()).assertEqual(2);
      expect(book.all()[0].isDefault).assertTrue();
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.id).assertEqual(2);
        expect(current.name).assertEqual('Bob Two');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0740
     * @tc.name      address_book_remove_non_default_between_default_transitions_074
     * @tc.desc      Verify address book remove non default between default transitions.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_remove_non_default_between_default_transitions_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_remove_non_default_between_default_transitions_074');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      book.setDefault(1);
      book.setDefault(3);
      book.remove(2);

      expect(book.size()).assertEqual(2);
      expect(book.all()[1].isDefault).assertTrue();
      expect(book.all()[0].isDefault).assertFalse();
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.id).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_BOOK_0750
     * @tc.name      address_book_update_to_default_then_set_other_075
     * @tc.desc      Verify address book update to default then set other.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_book_update_to_default_then_set_other_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_book_update_to_default_then_set_other_075');
      let book: AddressBook = new AddressBook();
      book.add(addressOf('Alice', false));
      book.add(addressOf('Bob', false));
      book.add(addressOf('Carol', false));
      book.update(2, addressOf('Bob Two', true));
      book.setDefault(3);

      expect(book.all()[0].isDefault).assertFalse();
      expect(book.all()[1].isDefault).assertFalse();
      expect(book.all()[2].isDefault).assertTrue();
      expect(countDefaults(book)).assertEqual(1);
      let current: Address | undefined = book.defaultAddress();
      expect(current !== null && current !== undefined).assertTrue();
      if (current !== undefined) {
        expect(current.id).assertEqual(3);
      }
    });
  });
}
