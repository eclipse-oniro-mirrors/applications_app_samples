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
import { ADDRESSES, INVALID_PHONES, PHONE_SAMPLES } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Valid under every rule; district is not validated. */
function validAddress(): Address {
  return new Address(1, 'Alice', '18800001765', 'Anhui', 'Anqing', 'Downtown',
    '100 Main Road');
}

/** Six varied fields, id fixed at 1, isDefault left false. */
function addressWith(name: string, phone: string, province: string, city: string,
  district: string, detail: string): Address {
  return new Address(1, name, phone, province, city, district, detail);
}

export default function addressValidationTest() {
  describe('OrangeShoppingAddressValidation', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'address validation suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0010
     * @tc.name      address_validation_valid_address_returns_empty_code_001
     * @tc.desc      Verify address validation valid address returns empty code.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_valid_address_returns_empty_code_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_valid_address_returns_empty_code_001');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(code.length).assertEqual(0);
      expect(code.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0020
     * @tc.name      address_validation_all_fixture_addresses_pass_002
     * @tc.desc      Verify address validation all fixture addresses pass.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_all_fixture_addresses_pass_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_all_fixture_addresses_pass_002');
      let book: AddressBook = new AddressBook();
      expect(ADDRESSES.length).assertEqual(4);
      for (let cursor: number = 0; cursor < ADDRESSES.length; cursor++) {
        let code: string = book.validate(ADDRESSES[cursor]);
        expect(code).assertEqual('');
        expect(ADDRESSES[cursor].phone.length).assertEqual(11);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0030
     * @tc.name      address_validation_does_not_mutate_the_address_003
     * @tc.desc      Verify address validation does not mutate the address.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_does_not_mutate_the_address_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_does_not_mutate_the_address_003');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.name = '  Alice  ';
      address.detail = '  100 Main Road  ';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.name).assertEqual('  Alice  ');
      expect(address.detail).assertEqual('  100 Main Road  ');
      expect(address.name.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0040
     * @tc.name      address_validation_empty_district_is_accepted_004
     * @tc.desc      Verify address validation empty district is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_empty_district_is_accepted_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_empty_district_is_accepted_004');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.district = '';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.district.length).assertEqual(0);
      expect(address.fullAddress()).assertEqual('AnhuiAnqing100 Main Road');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0050
     * @tc.name      address_validation_whitespace_district_is_accepted_005
     * @tc.desc      Verify address validation whitespace district is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_whitespace_district_is_accepted_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_whitespace_district_is_accepted_005');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.district = '   ';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.district.length).assertEqual(3);
      expect(address.district).assertEqual('   ');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0060
     * @tc.name      address_validation_single_character_name_is_valid_006
     * @tc.desc      Verify address validation single character name is valid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_single_character_name_is_valid_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_single_character_name_is_valid_006');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.name = 'A';
      expect(book.validate(address)).assertEqual('');
      expect(address.name.length).assertEqual(1);
      address.name = '张';
      expect(book.validate(address)).assertEqual('');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0070
     * @tc.name      address_validation_long_name_is_valid_007
     * @tc.desc      Verify address validation long name is valid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_long_name_is_valid_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_long_name_is_valid_007');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.name = 'ABCDEFGHIJKLMNOPQRST';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.name.length).assertEqual(20);
      expect(address.name.charAt(19)).assertEqual('T');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0080
     * @tc.name      address_validation_name_with_inner_spaces_is_valid_008
     * @tc.desc      Verify address validation name with inner spaces is valid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_name_with_inner_spaces_is_valid_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_name_with_inner_spaces_is_valid_008');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.name = 'Alice Smith';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.name.indexOf(' ')).assertEqual(5);
      expect(address.name).assertEqual('Alice Smith');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0090
     * @tc.name      address_validation_numeric_name_is_valid_009
     * @tc.desc      Verify address validation numeric name is valid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_numeric_name_is_valid_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_numeric_name_is_valid_009');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.name = '12345';
      expect(book.validate(address)).assertEqual('');
      expect(address.name.length).assertEqual(5);
      expect(address.name.startsWith('1')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0100
     * @tc.name      address_validation_chinese_name_is_valid_010
     * @tc.desc      Verify address validation chinese name is valid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_chinese_name_is_valid_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_chinese_name_is_valid_010');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.name = '张三';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.name.length).assertEqual(2);
      expect(address.name).assertEqual('张三');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0110
     * @tc.name      address_validation_empty_name_returns_name_empty_011
     * @tc.desc      Verify address validation empty name returns name empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_empty_name_returns_name_empty_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_empty_name_returns_name_empty_011');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.name = '';
      let code: string = book.validate(address);
      expect(code).assertEqual('NAME_EMPTY');
      expect(address.name).assertEqual('');
      expect(address.name.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0120
     * @tc.name      address_validation_whitespace_name_returns_name_empty_012
     * @tc.desc      Verify address validation whitespace name returns name empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_whitespace_name_returns_name_empty_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_whitespace_name_returns_name_empty_012');
      let book: AddressBook = new AddressBook();
      let blanks: string[] = [' ', '   ', '\t', '\n'];
      // trim() strips all four forms, so each blank name reaches the same
      // empty-length branch and reports NAME_EMPTY.
      for (let cursor: number = 0; cursor < blanks.length; cursor++) {
        let address: Address = validAddress();
        address.name = blanks[cursor];
        expect(book.validate(address)).assertEqual('NAME_EMPTY');
        expect(address.name.length).assertEqual(blanks[cursor].length);
      }
      expect(book.validate(validAddress())).assertEqual('');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0130
     * @tc.name      address_validation_trimmed_name_is_accepted_013
     * @tc.desc      Verify address validation trimmed name is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_trimmed_name_is_accepted_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_trimmed_name_is_accepted_013');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.name = '  Alice  ';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.name.trim()).assertEqual('Alice');
      expect(address.name.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0140
     * @tc.name      address_validation_phone_with_wrong_length_or_foreign_digit_is_invalid_014
     * @tc.desc      Verify address validation phone with wrong length or foreign digit is invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phone_with_wrong_length_or_foreign_digit_is_invalid_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s',
        'CASE: address_validation_phone_with_wrong_length_or_foreign_digit_is_invalid_014');
      let book: AddressBook = new AddressBook();
      let phones: string[] = ['1234567890', '123456789012', '1８800001765'];
      // The third value is 11 characters long, but its '８' is a full-width
      // digit whose code point lies outside 48..57.
      let lengths: number[] = [10, 12, 11];
      expect(phones.length).assertEqual(lengths.length);
      for (let index: number = 0; index < phones.length; index++) {
        let address: Address = validAddress();
        address.phone = phones[index];
        expect(address.phone.length).assertEqual(lengths[index]);
        expect(book.validate(address)).assertEqual('PHONE_INVALID');
        expect(AddressBook.isValidPhone(phones[index])).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0150
     * @tc.name      address_validation_phone_not_starting_with_one_is_invalid_015
     * @tc.desc      Verify address validation phone not starting with one is invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phone_not_starting_with_one_is_invalid_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_phone_not_starting_with_one_is_invalid_015');
      let book: AddressBook = new AddressBook();
      let phones: string[] = ['28800001765', '08800001765'];
      for (let cursor: number = 0; cursor < phones.length; cursor++) {
        let address: Address = validAddress();
        address.phone = phones[cursor];
        expect(address.phone.length).assertEqual(11);
        expect(book.validate(address)).assertEqual('PHONE_INVALID');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0160
     * @tc.name      address_validation_phone_with_letter_is_invalid_016
     * @tc.desc      Verify address validation phone with letter is invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phone_with_letter_is_invalid_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_phone_with_letter_is_invalid_016');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.phone = '1880000176a';
      expect(address.phone.length).assertEqual(11);
      expect(book.validate(address)).assertEqual('PHONE_INVALID');
      address.phone = 'abcdefghijk';
      expect(book.validate(address)).assertEqual('PHONE_INVALID');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0170
     * @tc.name      address_validation_phone_with_spaces_is_invalid_017
     * @tc.desc      Verify address validation phone with spaces is invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phone_with_spaces_is_invalid_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_phone_with_spaces_is_invalid_017');
      let book: AddressBook = new AddressBook();
      let phones: string[] = ['188 0000 1765', ' 18800001765', '18800001765 '];
      for (let cursor: number = 0; cursor < phones.length; cursor++) {
        let address: Address = validAddress();
        address.phone = phones[cursor];
        expect(book.validate(address)).assertEqual('PHONE_INVALID');
        expect(address.phone.indexOf(' ') !== -1).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0180
     * @tc.name      address_validation_phone_with_tab_or_newline_is_invalid_018
     * @tc.desc      Verify address validation phone with tab or newline is invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phone_with_tab_or_newline_is_invalid_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_phone_with_tab_or_newline_is_invalid_018');
      let book: AddressBook = new AddressBook();
      let phones: string[] = ['188\t00001765', '18800001765\n'];
      for (let cursor: number = 0; cursor < phones.length; cursor++) {
        let address: Address = validAddress();
        address.phone = phones[cursor];
        expect(book.validate(address)).assertEqual('PHONE_INVALID');
      }
      expect(book.validate(validAddress())).assertEqual('');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0190
     * @tc.name      address_validation_phone_with_plus_is_invalid_019
     * @tc.desc      Verify address validation phone with plus is invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phone_with_plus_is_invalid_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_phone_with_plus_is_invalid_019');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.phone = '+8618800001765';
      expect(book.validate(address)).assertEqual('PHONE_INVALID');
      expect(address.phone.charAt(0)).assertEqual('+');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0200
     * @tc.name      address_validation_phone_with_invalid_leading_or_trailing_character_is_invalid_020
     * @tc.desc      Verify address validation phone with invalid leading or trailing character is invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phone_with_invalid_leading_or_trailing_character_is_invalid_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s',
        'CASE: address_validation_phone_with_invalid_leading_or_trailing_character_is_invalid_020');
      let book: AddressBook = new AddressBook();
      let phones: string[] = ['00000000000', '1880000176五', '1880000176500'];
      let lengths: number[] = [11, 11, 13];
      let probeIndexes: number[] = [0, 10, 0];
      let probeChars: string[] = ['0', '五', '1'];
      // The 13-digit sample still opens with '1', so only the length check can
      // reject it; the other two fail on their leading or final character.
      expect(phones.length).assertEqual(probeChars.length);
      for (let index: number = 0; index < phones.length; index++) {
        let address: Address = validAddress();
        address.phone = phones[index];
        expect(address.phone.length).assertEqual(lengths[index]);
        expect(address.phone.charAt(probeIndexes[index])).assertEqual(probeChars[index]);
        expect(book.validate(address)).assertEqual('PHONE_INVALID');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0210
     * @tc.name      address_validation_empty_phone_is_invalid_021
     * @tc.desc      Verify address validation empty phone is invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_empty_phone_is_invalid_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_empty_phone_is_invalid_021');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.phone = '';
      expect(address.phone.length).assertEqual(0);
      expect(book.validate(address)).assertEqual('PHONE_INVALID');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0220
     * @tc.name      address_validation_empty_province_returns_city_empty_022
     * @tc.desc      Verify address validation empty province returns city empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_empty_province_returns_city_empty_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_empty_province_returns_city_empty_022');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.province = '';
      expect(address.province.length).assertEqual(0);
      // An empty province reports CITY_EMPTY, the same code used for an empty
      // city, because both are checked by one combined condition.
      expect(book.validate(address)).assertEqual('CITY_EMPTY');
      expect(address.city).assertEqual('Anqing');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0230
     * @tc.name      address_validation_empty_city_returns_city_empty_023
     * @tc.desc      Verify address validation empty city returns city empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_empty_city_returns_city_empty_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_empty_city_returns_city_empty_023');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.city = '';
      expect(address.city.length).assertEqual(0);
      expect(book.validate(address)).assertEqual('CITY_EMPTY');
      expect(address.province).assertEqual('Anhui');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0240
     * @tc.name      address_validation_both_region_fields_empty_return_city_empty_024
     * @tc.desc      Verify address validation both region fields empty return city empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_both_region_fields_empty_return_city_empty_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_both_region_fields_empty_return_city_empty_024');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.province = '';
      address.city = '';
      expect(book.validate(address)).assertEqual('CITY_EMPTY');
      expect(address.fullAddress()).assertEqual('Downtown100 Main Road');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0250
     * @tc.name      address_validation_whitespace_province_is_not_empty_025
     * @tc.desc      Verify address validation whitespace province is not empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_whitespace_province_is_not_empty_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_whitespace_province_is_not_empty_025');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.province = ' ';
      let code: string = book.validate(address);
      // Province and city are tested by length only, so a single space counts
      // as a filled region and the address passes.
      expect(code).assertEqual('');
      expect(address.province.length).assertEqual(1);
      expect(address.fullAddress().charAt(0)).assertEqual(' ');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0260
     * @tc.name      address_validation_whitespace_city_is_not_empty_026
     * @tc.desc      Verify address validation whitespace city is not empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_whitespace_city_is_not_empty_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_whitespace_city_is_not_empty_026');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.city = ' ';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.city.length).assertEqual(1);
      expect(address.fullAddress()).assertEqual('Anhui Downtown100 Main Road');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0270
     * @tc.name      address_validation_province_with_inner_space_is_accepted_027
     * @tc.desc      Verify address validation province with inner space is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_province_with_inner_space_is_accepted_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_province_with_inner_space_is_accepted_027');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.province = 'An hui';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.province).assertEqual('An hui');
      expect(address.province.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0280
     * @tc.name      address_validation_city_with_inner_space_is_accepted_028
     * @tc.desc      Verify address validation city with inner space is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_city_with_inner_space_is_accepted_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_city_with_inner_space_is_accepted_028');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.city = 'An qing';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.city.length).assertEqual(7);
      expect(address.fullAddress().startsWith('AnhuiAn qing')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0290
     * @tc.name      address_validation_empty_detail_returns_detail_empty_029
     * @tc.desc      Verify address validation empty detail returns detail empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_empty_detail_returns_detail_empty_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_empty_detail_returns_detail_empty_029');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.detail = '';
      expect(address.detail.length).assertEqual(0);
      expect(book.validate(address)).assertEqual('DETAIL_EMPTY');
      expect(address.name).assertEqual('Alice');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0300
     * @tc.name      address_validation_whitespace_detail_returns_detail_empty_030
     * @tc.desc      Verify address validation whitespace detail returns detail empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_whitespace_detail_returns_detail_empty_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_whitespace_detail_returns_detail_empty_030');
      let book: AddressBook = new AddressBook();
      let blanks: string[] = [' ', '   ', '\t', '\n'];
      for (let cursor: number = 0; cursor < blanks.length; cursor++) {
        let address: Address = validAddress();
        address.detail = blanks[cursor];
        expect(book.validate(address)).assertEqual('DETAIL_EMPTY');
      }
      expect(book.validate(validAddress())).assertEqual('');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0310
     * @tc.name      address_validation_trimmed_detail_is_accepted_031
     * @tc.desc      Verify address validation trimmed detail is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_trimmed_detail_is_accepted_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_trimmed_detail_is_accepted_031');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.detail = '  100 Main Road  ';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      // '  100 Main Road  ' is 17 raw characters; trimming the two spaces on
      // each side leaves the 13-character street line.
      expect(address.detail.trim().length).assertEqual(13);
      expect(address.detail.length).assertEqual(17);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0320
     * @tc.name      address_validation_detail_with_inner_spaces_is_accepted_032
     * @tc.desc      Verify address validation detail with inner spaces is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_detail_with_inner_spaces_is_accepted_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_detail_with_inner_spaces_is_accepted_032');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.detail = 'Room 100 Main Road';
      expect(book.validate(address)).assertEqual('');
      expect(address.detail.indexOf(' ')).assertEqual(4);
      expect(address.detail).assertEqual('Room 100 Main Road');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0330
     * @tc.name      address_validation_name_error_precedes_phone_error_033
     * @tc.desc      Verify address validation name error precedes phone error.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_name_error_precedes_phone_error_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_name_error_precedes_phone_error_033');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.name = '   ';
      address.phone = '28800001765';
      // Both fields are bad, and validate returns at the first failing check,
      // so repairing the name is what exposes the phone error.
      expect(book.validate(address)).assertEqual('NAME_EMPTY');
      address.name = 'Alice';
      expect(book.validate(address)).assertEqual('PHONE_INVALID');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0340
     * @tc.name      address_validation_name_error_precedes_city_error_034
     * @tc.desc      Verify address validation name error precedes city error.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_name_error_precedes_city_error_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_name_error_precedes_city_error_034');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.name = '';
      address.province = '';
      address.city = '';
      expect(book.validate(address)).assertEqual('NAME_EMPTY');
      address.name = 'Alice';
      expect(book.validate(address)).assertEqual('CITY_EMPTY');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0350
     * @tc.name      address_validation_phone_error_precedes_city_error_035
     * @tc.desc      Verify address validation phone error precedes city error.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phone_error_precedes_city_error_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_phone_error_precedes_city_error_035');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.phone = '1234567890';
      address.province = '';
      address.city = '';
      expect(book.validate(address)).assertEqual('PHONE_INVALID');
      address.phone = '18800001765';
      expect(book.validate(address)).assertEqual('CITY_EMPTY');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0360
     * @tc.name      address_validation_phone_error_precedes_detail_error_036
     * @tc.desc      Verify address validation phone error precedes detail error.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phone_error_precedes_detail_error_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_phone_error_precedes_detail_error_036');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.phone = '28800001765';
      address.detail = '   ';
      expect(book.validate(address)).assertEqual('PHONE_INVALID');
      address.phone = '18800001765';
      expect(book.validate(address)).assertEqual('DETAIL_EMPTY');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0370
     * @tc.name      address_validation_city_error_precedes_detail_error_037
     * @tc.desc      Verify address validation city error precedes detail error.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_city_error_precedes_detail_error_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_city_error_precedes_detail_error_037');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.city = '';
      address.detail = '';
      expect(book.validate(address)).assertEqual('CITY_EMPTY');
      address.city = 'Anqing';
      expect(book.validate(address)).assertEqual('DETAIL_EMPTY');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0380
     * @tc.name      address_validation_full_address_skips_empty_parts_038
     * @tc.desc      Verify address validation full address skips empty parts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_skips_empty_parts_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_skips_empty_parts_038');
      let provinces: string[] = ['', '', 'ProvinceProvince', 'Anhui'];
      let cities: string[] = ['', 'Anqing', 'CityCityCity', ''];
      let districts: string[] = ['Downtown', 'Downtown', 'DistrictDistrict', ''];
      let details: string[] = ['', '100 Main Road', 'DetailDetailDetail', ''];
      let fulls: string[] = ['Downtown', 'AnqingDowntown100 Main Road',
        'ProvinceProvinceCityCityCityDistrictDistrictDetailDetailDetail', 'Anhui'];
      let lengths: number[] = [8, 27, 62, 5];
      let prefixes: string[] = ['Down', 'AnqingDown', 'Province', 'An'];
      let suffixes: string[] = ['town', '100 Main Road', 'Detail', 'hui'];

      // Empty parts contribute nothing: row one is just the district and row
      // four just the province, both still 8 and 5 characters wide.
      expect(fulls.length).assertEqual(provinces.length);
      for (let index: number = 0; index < fulls.length; index++) {
        let address: Address = addressWith('Alice', '18800001765', provinces[index],
          cities[index], districts[index], details[index]);
        let full: string = address.fullAddress();
        expect(full).assertEqual(fulls[index]);
        expect(full.length).assertEqual(lengths[index]);
        expect(full.startsWith(prefixes[index])).assertTrue();
        expect(full.endsWith(suffixes[index])).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0390
     * @tc.name      address_validation_full_address_concatenates_all_parts_039
     * @tc.desc      Verify address validation full address concatenates all parts.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_concatenates_all_parts_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_concatenates_all_parts_039');
      let address: Address = validAddress();
      let full: string = address.fullAddress();
      expect(full).assertEqual('AnhuiAnqingDowntown100 Main Road');
      expect(full.startsWith('Anhui')).assertTrue();
      expect(full.endsWith('100 Main Road')).assertTrue();
      // No separator is inserted, so the length is the plain sum of the four
      // parts: 5 + 6 + 8 + 13 = 32.
      expect(full.length).assertEqual(5 + 6 + 8 + 13);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0400
     * @tc.name      address_validation_full_address_has_no_separators_040
     * @tc.desc      Verify address validation full address has no separators.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_has_no_separators_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_has_no_separators_040');
      let address: Address = addressWith('Alice', '18800001765', 'Anhui', 'Anqing',
        'Downtown', '100MainRoad');
      let full: string = address.fullAddress();
      expect(full).assertEqual('AnhuiAnqingDowntown100MainRoad');
      expect(full.indexOf(',')).assertEqual(-1);
      expect(full.indexOf('-')).assertEqual(-1);
      expect(full.indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0410
     * @tc.name      address_validation_full_address_with_empty_district_041
     * @tc.desc      Verify address validation full address with empty district.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_with_empty_district_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_with_empty_district_041');
      let address: Address = validAddress();
      address.district = '';
      expect(address.fullAddress()).assertEqual('AnhuiAnqing100 Main Road');
      expect(address.fullAddress().length).assertEqual(24);
      expect(address.fullAddress().startsWith('AnhuiAnqing')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0420
     * @tc.name      address_validation_full_address_with_empty_region_042
     * @tc.desc      Verify address validation full address with empty region.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_with_empty_region_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_with_empty_region_042');
      let address: Address = validAddress();
      address.province = '';
      address.city = '';
      expect(address.fullAddress()).assertEqual('Downtown100 Main Road');
      expect(address.fullAddress().length).assertEqual(21);
      expect(address.fullAddress().endsWith('100 Main Road')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0430
     * @tc.name      address_validation_full_address_all_empty_is_empty_043
     * @tc.desc      Verify address validation full address all empty is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_all_empty_is_empty_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_all_empty_is_empty_043');
      let address: Address = addressWith('', '', '', '', '', '');
      let full: string = address.fullAddress();
      expect(full.length).assertEqual(0);
      expect(full.length).assertEqual(0);
      expect(full).assertEqual('');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0440
     * @tc.name      address_validation_full_address_single_part_044
     * @tc.desc      Verify address validation full address single part.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_single_part_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_single_part_044');
      let address: Address = addressWith('Alice', '18800001765', '', '', '', 'OnlyDetail');
      expect(address.fullAddress()).assertEqual('OnlyDetail');
      expect(address.fullAddress().length).assertEqual(10);
      expect(address.fullAddress().startsWith('Only')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0450
     * @tc.name      address_validation_full_address_reflects_mutation_045
     * @tc.desc      Verify address validation full address reflects mutation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_reflects_mutation_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_reflects_mutation_045');
      let address: Address = validAddress();
      let before: string = address.fullAddress();
      address.district = 'Xihu';
      let after: string = address.fullAddress();
      expect(before).assertEqual('AnhuiAnqingDowntown100 Main Road');
      expect(after).assertEqual('AnhuiAnqingXihu100 Main Road');
      expect(before !== after).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0460
     * @tc.name      address_validation_full_address_preserves_spaces_046
     * @tc.desc      Verify address validation full address preserves spaces.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_preserves_spaces_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_preserves_spaces_046');
      let address: Address = addressWith('Alice', '18800001765', 'Anhui', 'Anqing',
        'Downtown', '  100 Main Road  ');
      let full: string = address.fullAddress();
      expect(full.endsWith('  ')).assertTrue();
      expect(full.startsWith('Anhui')).assertTrue();
      expect(full).assertEqual('AnhuiAnqingDowntown  100 Main Road  ');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0470
     * @tc.name      address_validation_full_address_of_fixture_addresses_047
     * @tc.desc      Verify address validation full address of fixture addresses.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_of_fixture_addresses_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_of_fixture_addresses_047');
      let expected: string[] = ['AnhuiAnqingDowntown100 Main Road',
        'BeijingBeijingChaoyang200 East Road',
        'GuangdongGuangzhouTianhe300 South Road',
        'ZhejiangHangzhouXihu400 West Road'];
      expect(ADDRESSES.length).assertEqual(expected.length);
      for (let cursor: number = 0; cursor < ADDRESSES.length; cursor++) {
        expect(ADDRESSES[cursor].fullAddress()).assertEqual(expected[cursor]);
        expect(ADDRESSES[cursor].fullAddress().startsWith(ADDRESSES[cursor].province)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0480
     * @tc.name      address_validation_full_address_after_copy_048
     * @tc.desc      Verify address validation full address after copy.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_after_copy_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_after_copy_048');
      let address: Address = validAddress();
      let duplicate: Address = address.copy();
      expect(duplicate.fullAddress()).assertEqual(address.fullAddress());
      expect(duplicate.fullAddress()).assertEqual('AnhuiAnqingDowntown100 Main Road');
      expect(duplicate.fullAddress().length).assertEqual(address.fullAddress().length);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0490
     * @tc.name      address_validation_valid_phone_samples_are_accepted_049
     * @tc.desc      Verify address validation valid phone samples are accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_valid_phone_samples_are_accepted_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_valid_phone_samples_are_accepted_049');
      expect(PHONE_SAMPLES.length).assertEqual(10);
      for (let cursor: number = 0; cursor < PHONE_SAMPLES.length; cursor++) {
        expect(AddressBook.isValidPhone(PHONE_SAMPLES[cursor])).assertTrue();
        expect(PHONE_SAMPLES[cursor].length).assertEqual(11);
        expect(PHONE_SAMPLES[cursor].charAt(0)).assertEqual('1');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0500
     * @tc.name      address_validation_invalid_phone_samples_are_rejected_050
     * @tc.desc      Verify address validation invalid phone samples are rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_invalid_phone_samples_are_rejected_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_invalid_phone_samples_are_rejected_050');
      expect(INVALID_PHONES.length).assertEqual(10);
      for (let cursor: number = 0; cursor < INVALID_PHONES.length; cursor++) {
        expect(AddressBook.isValidPhone(INVALID_PHONES[cursor])).assertFalse();
      }
      expect(AddressBook.isValidPhone('18800001765')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0510
     * @tc.name      address_validation_phone_with_leading_zero_is_rejected_051
     * @tc.desc      Verify address validation phone with leading zero is rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phone_with_leading_zero_is_rejected_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_phone_with_leading_zero_is_rejected_051');
      let phone: string = '08800001765';
      expect(phone.length).assertEqual(11);
      expect(phone.charAt(0)).assertEqual('0');
      expect(AddressBook.isValidPhone(phone)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0520
     * @tc.name      address_validation_phone_empty_is_rejected_by_helper_052
     * @tc.desc      Verify address validation phone empty is rejected by helper.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phone_empty_is_rejected_by_helper_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_phone_empty_is_rejected_by_helper_052');
      expect(AddressBook.isValidPhone('')).assertFalse();
      expect(AddressBook.isValidPhone(' ')).assertFalse();
      expect(AddressBook.isValidPhone('\t')).assertFalse();
      expect(AddressBook.isValidPhone('\n')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0530
     * @tc.name      address_validation_non_ascii_phone_is_rejected_by_helper_053
     * @tc.desc      Verify address validation non ascii phone is rejected by helper.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_non_ascii_phone_is_rejected_by_helper_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_non_ascii_phone_is_rejected_by_helper_053');
      let phone: string = '1８800001765';
      expect(phone.length).assertEqual(11);
      expect(AddressBook.isValidPhone(phone)).assertFalse();
      expect(AddressBook.isValidPhone('18800001765')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0540
     * @tc.name      address_validation_whitespace_province_with_empty_city_054
     * @tc.desc      Verify address validation whitespace province with empty city.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_whitespace_province_with_empty_city_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_whitespace_province_with_empty_city_054');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.province = ' ';
      address.city = '';
      expect(address.province.length).assertEqual(1);
      expect(address.city.length).assertEqual(0);
      expect(book.validate(address)).assertEqual('CITY_EMPTY');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0550
     * @tc.name      address_validation_invalid_copy_keeps_error_code_055
     * @tc.desc      Verify address validation invalid copy keeps error code.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_invalid_copy_keeps_error_code_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_invalid_copy_keeps_error_code_055');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.city = '';
      let duplicate: Address = address.copy();
      expect(book.validate(address)).assertEqual('CITY_EMPTY');
      expect(book.validate(duplicate)).assertEqual('CITY_EMPTY');
      expect(duplicate.city).assertEqual('');
      expect(duplicate.name).assertEqual('Alice');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0560
     * @tc.name      address_validation_detail_of_punctuation_is_valid_056
     * @tc.desc      Verify address validation detail of punctuation is valid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_detail_of_punctuation_is_valid_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_detail_of_punctuation_is_valid_056');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.detail = '---';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.detail).assertEqual('---');
      expect(address.detail.trim().length).assertEqual(3);
      expect(address.fullAddress().endsWith('---')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0570
     * @tc.name      address_validation_empty_name_and_detail_returns_name_error_057
     * @tc.desc      Verify address validation empty name and detail returns name error.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_empty_name_and_detail_returns_name_error_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_empty_name_and_detail_returns_name_error_057');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.name = '';
      address.detail = '';
      expect(book.validate(address)).assertEqual('NAME_EMPTY');
      address.name = 'Alice';
      expect(book.validate(address)).assertEqual('DETAIL_EMPTY');
      expect(address.city).assertEqual('Anqing');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0580
     * @tc.name      address_validation_phone_with_punctuation_is_invalid_058
     * @tc.desc      Verify address validation phone with punctuation is invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phone_with_punctuation_is_invalid_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_phone_with_punctuation_is_invalid_058');
      let book: AddressBook = new AddressBook();
      let phones: string[] = ['1880000176.', '18800001/65', '1880000_765', '1880000(165'];
      let positions: number[] = [10, 8, 7, 7];
      let marks: string[] = ['.', '/', '_', '('];
      // Each sample keeps 11 characters with the mark at 10, 8, 7 and 7, so
      // only the per-character digit scan can reject them.
      expect(phones.length).assertEqual(marks.length);
      for (let index: number = 0; index < phones.length; index++) {
        let address: Address = validAddress();
        address.phone = phones[index];
        expect(address.phone.length).assertEqual(11);
        expect(address.phone.charAt(positions[index])).assertEqual(marks[index]);
        expect(book.validate(address)).assertEqual('PHONE_INVALID');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0590
     * @tc.name      address_validation_full_address_with_punctuation_detail_059
     * @tc.desc      Verify address validation full address with punctuation detail.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_with_punctuation_detail_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_with_punctuation_detail_059');
      let address: Address = addressWith('Alice', '18800001765', 'Anhui', 'Anqing',
        'Downtown', 'A-B,C');
      let full: string = address.fullAddress();
      expect(full).assertEqual('AnhuiAnqingDowntownA-B,C');
      expect(full.length).assertEqual(24);
      expect(full.endsWith('A-B,C')).assertTrue();
      expect(full.charAt(19)).assertEqual('A');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0600
     * @tc.name      address_validation_full_address_preserves_multibyte_and_single_chars_060
     * @tc.desc      Verify address validation full address preserves multibyte and single chars.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_preserves_multibyte_and_single_chars_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s',
        'CASE: address_validation_full_address_preserves_multibyte_and_single_chars_060');
      let provinces: string[] = ['安徽', 'A'];
      let cities: string[] = ['安庆', 'B'];
      let districts: string[] = ['市区', 'C'];
      let details: string[] = ['人民路1号', 'D'];
      let fulls: string[] = ['安徽安庆市区人民路1号', 'ABCD'];
      let lengths: number[] = [11, 4];
      let probeIndexes: number[] = [4, 3];
      let probeChars: string[] = ['市', 'D'];
      // Every CJK character occupies one UTF-16 unit here, so the Chinese
      // address measures 11 and 'ABCD' measures 4.

      expect(fulls.length).assertEqual(provinces.length);
      for (let index: number = 0; index < fulls.length; index++) {
        let address: Address = addressWith('张三', '18800001765', provinces[index],
          cities[index], districts[index], details[index]);
        let full: string = address.fullAddress();
        expect(full).assertEqual(fulls[index]);
        expect(full.length).assertEqual(lengths[index]);
        expect(full.charAt(0)).assertEqual(provinces[index].charAt(0));
        expect(full.charAt(probeIndexes[index])).assertEqual(probeChars[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0610
     * @tc.name      address_validation_full_address_after_clearing_city_061
     * @tc.desc      Verify address validation full address after clearing city.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_after_clearing_city_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_after_clearing_city_061');
      let address: Address = validAddress();
      expect(address.fullAddress().length).assertEqual(32);
      address.city = '';
      expect(address.fullAddress()).assertEqual('AnhuiDowntown100 Main Road');
      expect(address.fullAddress().length).assertEqual(26);
      address.city = 'Anqing';
      expect(address.fullAddress()).assertEqual('AnhuiAnqingDowntown100 Main Road');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0620
     * @tc.name      address_validation_whitespace_city_with_blank_detail_062
     * @tc.desc      Verify address validation whitespace city with blank detail.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_whitespace_city_with_blank_detail_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_whitespace_city_with_blank_detail_062');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.city = ' ';
      address.detail = '';
      expect(book.validate(address)).assertEqual('DETAIL_EMPTY');
      address.detail = '100 Main Road';
      expect(book.validate(address)).assertEqual('');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0630
     * @tc.name      address_validation_single_character_region_fields_063
     * @tc.desc      Verify address validation single character region fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_single_character_region_fields_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_single_character_region_fields_063');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.province = 'A';
      address.city = 'B';
      address.district = 'C';
      expect(address.province.length).assertEqual(1);
      expect(address.city.length).assertEqual(1);
      expect(book.validate(address)).assertEqual('');
      expect(address.fullAddress()).assertEqual('ABC100 Main Road');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0640
     * @tc.name      address_validation_single_character_detail_is_valid_064
     * @tc.desc      Verify address validation single character detail is valid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_single_character_detail_is_valid_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_single_character_detail_is_valid_064');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.detail = 'X';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.detail.length).assertEqual(1);
      expect(address.fullAddress()).assertEqual('AnhuiAnqingDowntownX');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0650
     * @tc.name      address_validation_valid_address_with_full_optional_fields_065
     * @tc.desc      Verify address validation valid address with full optional fields.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_valid_address_with_full_optional_fields_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_valid_address_with_full_optional_fields_065');
      let book: AddressBook = new AddressBook();
      let address: Address = addressWith('Alice', '18800001765', 'Anhui', 'Anqing',
        'Downtown', '100 Main Road, Building 5, Room 601');
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.district).assertEqual('Downtown');
      expect(address.phone.length).assertEqual(11);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0660
     * @tc.name      address_validation_carriage_return_name_is_empty_066
     * @tc.desc      Verify address validation carriage return name is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_carriage_return_name_is_empty_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_carriage_return_name_is_empty_066');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.name = '\r';
      // A lone carriage return has length 1 but trims to nothing, so the
      // blank-name branch still fires.
      expect(address.name.length).assertEqual(1);
      expect(book.validate(address)).assertEqual('NAME_EMPTY');
      expect(address.name.trim().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0670
     * @tc.name      address_validation_carriage_return_detail_is_empty_067
     * @tc.desc      Verify address validation carriage return detail is empty.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_carriage_return_detail_is_empty_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_carriage_return_detail_is_empty_067');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.detail = '\r';
      expect(address.detail.length).assertEqual(1);
      expect(book.validate(address)).assertEqual('DETAIL_EMPTY');
      expect(address.detail.trim().length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0680
     * @tc.name      address_validation_phone_with_colon_is_invalid_068
     * @tc.desc      Verify address validation phone with colon is invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phone_with_colon_is_invalid_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_phone_with_colon_is_invalid_068');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.phone = '188000017:5';
      expect(address.phone.length).assertEqual(11);
      expect(address.phone.charAt(9)).assertEqual(':');
      expect(book.validate(address)).assertEqual('PHONE_INVALID');
      expect(address.phone.substring(0, 9)).assertEqual('188000017');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0690
     * @tc.name      address_validation_validate_is_repeatable_069
     * @tc.desc      Verify address validation validate is repeatable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_validate_is_repeatable_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_validate_is_repeatable_069');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      expect(book.validate(address)).assertEqual('');
      expect(book.validate(address)).assertEqual('');
      address.city = '';
      expect(book.validate(address)).assertEqual('CITY_EMPTY');
      expect(book.validate(address)).assertEqual('CITY_EMPTY');
      expect(address.name).assertEqual('Alice');
      expect(address.city.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0700
     * @tc.name      address_validation_name_of_symbols_is_valid_070
     * @tc.desc      Verify address validation name of symbols is valid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_name_of_symbols_is_valid_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_name_of_symbols_is_valid_070');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.name = '---';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.name).assertEqual('---');
      expect(address.name.trim().length).assertEqual(3);
      expect(book.validate(address)).assertEqual('');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0710
     * @tc.name      address_validation_detail_of_digits_is_valid_071
     * @tc.desc      Verify address validation detail of digits is valid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_detail_of_digits_is_valid_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_detail_of_digits_is_valid_071');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      address.detail = '12345';
      let code: string = book.validate(address);
      expect(code).assertEqual('');
      expect(address.detail.length).assertEqual(5);
      expect(address.fullAddress().endsWith('12345')).assertTrue();
      expect(address.detail).assertEqual('12345');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0720
     * @tc.name      address_validation_full_address_with_region_only_072
     * @tc.desc      Verify address validation full address with region only.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_with_region_only_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_with_region_only_072');
      let book: AddressBook = new AddressBook();
      let address: Address = addressWith('Alice', '18800001765', 'Anhui', 'Anqing', '', '');
      let full: string = address.fullAddress();
      expect(full).assertEqual('AnhuiAnqing');
      expect(full.length).assertEqual(11);
      expect(full.startsWith('Anhui')).assertTrue();
      expect(full.endsWith('Anqing')).assertTrue();
      expect(book.validate(address)).assertEqual('DETAIL_EMPTY');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0730
     * @tc.name      address_validation_all_whitespace_fields_error_order_073
     * @tc.desc      Verify address validation all whitespace fields error order.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_all_whitespace_fields_error_order_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_all_whitespace_fields_error_order_073');
      let book: AddressBook = new AddressBook();
      let address: Address = addressWith('  ', '  ', '  ', '  ', '  ', '  ');
      // Every field holds two spaces; each repair exposes the next check, and
      // the address passes at the end because blank regions count as filled.
      expect(book.validate(address)).assertEqual('NAME_EMPTY');
      address.name = 'Alice';
      expect(book.validate(address)).assertEqual('PHONE_INVALID');
      address.phone = '18800001765';
      expect(book.validate(address)).assertEqual('DETAIL_EMPTY');
      address.detail = 'D';
      expect(book.validate(address)).assertEqual('');
      expect(address.province.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0740
     * @tc.name      address_validation_full_address_after_clearing_detail_074
     * @tc.desc      Verify address validation full address after clearing detail.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_full_address_after_clearing_detail_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_full_address_after_clearing_detail_074');
      let book: AddressBook = new AddressBook();
      let address: Address = validAddress();
      expect(address.fullAddress().length).assertEqual(32);
      address.detail = '';
      expect(address.fullAddress()).assertEqual('AnhuiAnqingDowntown');
      expect(address.fullAddress().length).assertEqual(19);
      expect(book.validate(address)).assertEqual('DETAIL_EMPTY');
      address.detail = '100 Main Road';
      expect(address.fullAddress().length).assertEqual(32);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_ADDRESS_VALIDATION_0750
     * @tc.name      address_validation_phones_with_punctuation_are_rejected_075
     * @tc.desc      Verify address validation phones with punctuation are rejected.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('address_validation_phones_with_punctuation_are_rejected_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: address_validation_phones_with_punctuation_are_rejected_075');
      let phones: string[] = [
        '18800001-65',
        '188000017６5',
        '18800017\t65',
        '18800001#65'
      ];
      expect(phones.length).assertEqual(4);
      for (let index: number = 0; index < phones.length; index++) {
        expect(phones[index].length).assertEqual(11);
        expect(phones[index].charAt(0)).assertEqual('1');
        expect(AddressBook.isValidPhone(phones[index])).assertFalse();
      }
    });

  });
}
