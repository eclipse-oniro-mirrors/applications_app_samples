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
import { Money } from '../Shared/ShopModel';
import { LARGE_CART, MIXED_CART, SMALL_CART, defaultCouponBook } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

export default function moneyFormatTest() {
  describe('OrangeShoppingMoneyFormat', () => {
    let referenceAmount: Money = new Money(0);

    beforeAll(() => {
      referenceAmount = new Money(499900);
      hilog.info(DOMAIN, TAG, '%{public}s', 'money format suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0010
     * @tc.name      format_zero_cents_renders_zero_yuan_001
     * @tc.desc      Verify format zero cents renders zero yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_zero_cents_renders_zero_yuan_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_zero_cents_renders_zero_yuan_001');
      let text: string = new Money(0).format();
      expect(text).assertEqual('¥0.00');
      expect(text.length).assertEqual(5);
      expect(text.startsWith('¥')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0020
     * @tc.name      format_sub_yuan_cents_pad_fraction_002
     * @tc.desc      Verify format sub yuan cents pad fraction.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_sub_yuan_cents_pad_fraction_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_sub_yuan_cents_pad_fraction_002');
      // One-digit cent counts pad to two digits, so 1 and 5 render 01 and 05 and every text stays 5 characters.
      let cents: number[] = [1, 5, 9, 99];
      let texts: string[] = ['¥0.01', '¥0.05', '¥0.09', '¥0.99'];
      let fractions: string[] = ['01', '05', '09', '99'];
      expect(cents.length).assertEqual(texts.length);
      expect(texts.length).assertEqual(fractions.length);
      for (let index: number = 0; index < cents.length; index++) {
        let text: string = new Money(cents[index]).format();
        expect(text).assertEqual(texts[index]);
        expect(text.endsWith(fractions[index])).assertTrue();
        expect(text.length).assertEqual(5);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0030
     * @tc.name      format_ten_cents_keeps_leading_zero_003
     * @tc.desc      Verify format ten cents keeps leading zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_ten_cents_keeps_leading_zero_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_ten_cents_keeps_leading_zero_003');
      let text: string = new Money(10).format();
      expect(text).assertEqual('¥0.10');
      expect(text.endsWith('10')).assertTrue();
      expect(text.charAt(1)).assertEqual('0');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0040
     * @tc.name      format_one_yuan_has_two_zero_decimals_004
     * @tc.desc      Verify format one yuan has two zero decimals.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_one_yuan_has_two_zero_decimals_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_one_yuan_has_two_zero_decimals_004');
      let text: string = new Money(100).format();
      expect(text).assertEqual('¥1.00');
      expect(text.indexOf('.')).assertEqual(2);
      expect(text.substring(3)).assertEqual('00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0050
     * @tc.name      format_one_yuan_one_cent_005
     * @tc.desc      Verify format one yuan one cent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_one_yuan_one_cent_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_one_yuan_one_cent_005');
      let amount: Money = new Money(100).add(new Money(1));
      let text: string = amount.format();
      expect(text).assertEqual('¥1.01');
      expect(text.charAt(2)).assertEqual('.');
      expect(text.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0060
     * @tc.name      format_999_cents_renders_nine_ninety_nine_006
     * @tc.desc      Verify format 999 cents renders nine ninety nine.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_999_cents_renders_nine_ninety_nine_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_999_cents_renders_nine_ninety_nine_006');
      let text: string = new Money(999).format();
      expect(text).assertEqual('¥9.99');
      expect(text.substring(1, 3)).assertEqual('9.');
      expect(text.length).assertEqual(5);
      expect(text.indexOf('¥')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0070
     * @tc.name      format_1000_cents_renders_ten_yuan_007
     * @tc.desc      Verify format 1000 cents renders ten yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_1000_cents_renders_ten_yuan_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_1000_cents_renders_ten_yuan_007');
      let text: string = new Money(100).multiply(10).format();
      expect(text).assertEqual('¥10.00');
      expect(text.indexOf('.')).assertEqual(3);
      expect(text.startsWith('¥10.')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0080
     * @tc.name      format_9999_cents_renders_ninety_nine_yuan_008
     * @tc.desc      Verify format 9999 cents renders ninety nine yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_9999_cents_renders_ninety_nine_yuan_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_9999_cents_renders_ninety_nine_yuan_008');
      let text: string = new Money(9999).format();
      expect(text).assertEqual('¥99.99');
      expect(text.length).assertEqual(6);
      expect(text.startsWith('¥99.')).assertTrue();
      expect(text.endsWith('99')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0090
     * @tc.name      format_10000_cents_renders_hundred_yuan_009
     * @tc.desc      Verify format 10000 cents renders hundred yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_10000_cents_renders_hundred_yuan_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_10000_cents_renders_hundred_yuan_009');
      let amount: Money = Money.ofYuan(100);
      let text: string = amount.format();
      expect(text).assertEqual('¥100.00');
      expect(text.length).assertEqual(7);
      expect(text.substring(4)).assertEqual('.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0100
     * @tc.name      format_12345_cents_renders_hundreds_010
     * @tc.desc      Verify format 12345 cents renders hundreds.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_12345_cents_renders_hundreds_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_12345_cents_renders_hundreds_010');
      let text: string = new Money(12345).format();
      expect(text).assertEqual('¥123.45');
      expect(text.length).assertEqual(7);
      expect(text.substring(1)).assertEqual('123.45');
      expect(text.indexOf(',') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0110
     * @tc.name      format_100000_cents_renders_thousand_yuan_011
     * @tc.desc      Verify format 100000 cents renders thousand yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_100000_cents_renders_thousand_yuan_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_100000_cents_renders_thousand_yuan_011');
      // 100000 cents is 1000 yuan, and the formatter omits the thousands comma so the text reads 1000.00.
      let text: string = new Money(100000).format();
      expect(text).assertEqual('¥1000.00');
      expect(text.length).assertEqual(8);
      expect(text.indexOf(',') < 0).assertTrue();
      expect(text.endsWith('.00')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0120
     * @tc.name      format_100100_cents_renders_after_thousand_boundary_012
     * @tc.desc      Verify format 100100 cents renders after thousand boundary.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_100100_cents_renders_after_thousand_boundary_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_100100_cents_renders_after_thousand_boundary_012');
      let text: string = new Money(100100).format();
      expect(text).assertEqual('¥1001.00');
      expect(text.substring(1, 5)).assertEqual('1001');
      expect(text.indexOf('.')).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0130
     * @tc.name      format_100001_cents_keeps_cent_padding_after_thousand_013
     * @tc.desc      Verify format 100001 cents keeps cent padding after thousand.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_100001_cents_keeps_cent_padding_after_thousand_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_100001_cents_keeps_cent_padding_after_thousand_013');
      let text: string = new Money(100001).format();
      expect(text).assertEqual('¥1000.01');
      expect(text.endsWith('01')).assertTrue();
      expect(text.charAt(text.length - 3)).assertEqual('.');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0140
     * @tc.name      format_499900_cents_renders_flagship_price_014
     * @tc.desc      Verify format 499900 cents renders flagship price.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_499900_cents_renders_flagship_price_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_499900_cents_renders_flagship_price_014');
      let amount: Money = Money.ofYuan(4999);
      let text: string = amount.format();
      expect(text).assertEqual('¥4999.00');
      expect(text.substring(1, 5)).assertEqual('4999');
      expect(text.endsWith('.00')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0150
     * @tc.name      format_500000_cents_renders_five_thousand_yuan_015
     * @tc.desc      Verify format 500000 cents renders five thousand yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_500000_cents_renders_five_thousand_yuan_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_500000_cents_renders_five_thousand_yuan_015');
      let amount: Money = Money.ofYuan(5000);
      let text: string = amount.format();
      expect(text).assertEqual('¥5000.00');
      expect(text.indexOf('.')).assertEqual(5);
      expect(text.indexOf(',') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0160
     * @tc.name      format_1000000_cents_renders_ten_thousand_yuan_016
     * @tc.desc      Verify format 1000000 cents renders ten thousand yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_1000000_cents_renders_ten_thousand_yuan_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_1000000_cents_renders_ten_thousand_yuan_016');
      // Two 500000-cent parts sum to 1000000, which formats as the 9-character 10000.00.
      let parts: Money[] = [new Money(500000), new Money(500000)];
      let total: Money = Money.sum(parts);
      let text: string = total.format();
      expect(text).assertEqual('¥10000.00');
      expect(text.length).assertEqual(9);
      expect(text.indexOf(',') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0170
     * @tc.name      format_two_yuan_renders_plain_017
     * @tc.desc      Verify format two yuan renders plain.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_two_yuan_renders_plain_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_two_yuan_renders_plain_017');
      let text: string = new Money(200).format();
      expect(text).assertEqual('¥2.00');
      expect(text.indexOf('.')).assertEqual(2);
      expect(text.endsWith('00')).assertTrue();
      expect(text.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0180
     * @tc.name      format_twenty_yuan_renders_plain_018
     * @tc.desc      Verify format twenty yuan renders plain.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_twenty_yuan_renders_plain_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_twenty_yuan_renders_plain_018');
      let text: string = new Money(200).multiply(10).format();
      expect(text).assertEqual('¥20.00');
      expect(text.length).assertEqual(6);
      expect(text.endsWith('.00')).assertTrue();
      expect(text.indexOf('.')).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0190
     * @tc.name      format_negative_fifty_cents_puts_minus_outside_019
     * @tc.desc      Verify format negative fifty cents puts minus outside.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_negative_fifty_cents_puts_minus_outside_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_negative_fifty_cents_puts_minus_outside_019');
      let text: string = new Money(-50).format();
      // The sign is hoisted outside the currency symbol, so a negative renders -¥ and never ¥-.
      expect(text).assertEqual('-¥0.50');
      expect(text.startsWith('-¥')).assertTrue();
      expect(text.charAt(1)).assertEqual('¥');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0200
     * @tc.name      format_negative_999_cents_has_minus_prefix_020
     * @tc.desc      Verify format negative 999 cents has minus prefix.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_negative_999_cents_has_minus_prefix_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_negative_999_cents_has_minus_prefix_020');
      let text: string = new Money(-999).format();
      expect(text).assertEqual('-¥9.99');
      expect(text.charAt(0)).assertEqual('-');
      expect(text.charAt(1)).assertEqual('¥');
      expect(text.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0210
     * @tc.name      format_negative_whole_yuan_021
     * @tc.desc      Verify format negative whole yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_negative_whole_yuan_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_negative_whole_yuan_021');
      let text: string = Money.zero().subtract(new Money(50000)).format();
      expect(text).assertEqual('-¥500.00');
      expect(text.indexOf('-')).assertEqual(0);
      expect(text.length).assertEqual(8);
      expect(text.indexOf(',') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0220
     * @tc.name      format_negative_12345_keeps_cent_digits_022
     * @tc.desc      Verify format negative 12345 keeps cent digits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_negative_12345_keeps_cent_digits_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_negative_12345_keeps_cent_digits_022');
      // Subtracting twice the amount leaves -12345 cents, so the 123.45 digits survive behind the sign.
      let text: string = new Money(12345).subtract(new Money(24690)).format();
      expect(text).assertEqual('-¥123.45');
      expect(text.substring(1)).assertEqual('¥123.45');
      expect(text.endsWith('45')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0230
     * @tc.name      format_negative_thousand_and_one_cent_023
     * @tc.desc      Verify format negative thousand and one cent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_negative_thousand_and_one_cent_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_negative_thousand_and_one_cent_023');
      let text: string = Money.zero().subtract(new Money(10001)).format();
      expect(text).assertEqual('-¥100.01');
      expect(text.substring(2)).assertEqual('100.01');
      expect(text.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0240
     * @tc.name      format_large_amount_keeps_every_yuan_digit_024
     * @tc.desc      Verify format large amount keeps every yuan digit.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_large_amount_keeps_every_yuan_digit_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_large_amount_keeps_every_yuan_digit_024');
      let text: string = new Money(123456789).format();
      expect(text).assertEqual('¥1234567.89');
      expect(text.length).assertEqual(11);
      expect(text.charAt(text.length - 3)).assertEqual('.');
      expect(text.indexOf(',') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0250
     * @tc.name      format_trillion_cents_avoids_exponent_notation_025
     * @tc.desc      Verify format trillion cents avoids exponent notation.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_trillion_cents_avoids_exponent_notation_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_trillion_cents_avoids_exponent_notation_025');
      // 1e15 cents would print in exponent form through a plain toString, which is what the no-'e' check guards against.
      let text: string = new Money(1000000000000000).format();
      expect(text).assertEqual('¥10000000000000.00');
      expect(text.length).assertEqual(18);
      expect(text.indexOf('e') < 0).assertTrue();
      expect(text.endsWith('.00')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0260
     * @tc.name      format_hundred_trillion_cents_stays_plain_026
     * @tc.desc      Verify format hundred trillion cents stays plain.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_hundred_trillion_cents_stays_plain_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_hundred_trillion_cents_stays_plain_026');
      let text: string = new Money(100000000000000000).format();
      expect(text).assertEqual('¥1000000000000000.00');
      expect(text.length).assertEqual(20);
      expect(text.substring(1, 5)).assertEqual('1000');
      expect(text.endsWith('.00')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0270
     * @tc.name      format_fraction_always_has_two_digits_027
     * @tc.desc      Verify format fraction always has two digits.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_fraction_always_has_two_digits_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_fraction_always_has_two_digits_027');
      let values: number[] = [0, 9, 10, 101, 499900];
      for (let index: number = 0; index < values.length; index++) {
        let text: string = new Money(values[index]).format();
        let fraction: string = text.substring(text.length - 2);
        expect(fraction.length).assertEqual(2);
        expect(fraction.charCodeAt(0) >= 48 && fraction.charCodeAt(0) <= 57).assertTrue();
        expect(fraction.charCodeAt(1) >= 48 && fraction.charCodeAt(1) <= 57).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0280
     * @tc.name      format_decimal_point_is_third_from_end_028
     * @tc.desc      Verify format decimal point is third from end.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_decimal_point_is_third_from_end_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_decimal_point_is_third_from_end_028');
      let values: number[] = [0, 1, 99, 100, 12345, 499900];
      for (let index: number = 0; index < values.length; index++) {
        let text: string = new Money(values[index]).format();
        expect(text.charAt(text.length - 3)).assertEqual('.');
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0290
     * @tc.name      format_has_no_thousands_separators_029
     * @tc.desc      Verify format has no thousands separators.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_has_no_thousands_separators_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_has_no_thousands_separators_029');
      let values: number[] = [100000, 499900, 1000000, 123456789];
      for (let index: number = 0; index < values.length; index++) {
        let text: string = new Money(values[index]).format();
        expect(text.indexOf(',') < 0).assertTrue();
      }
      expect(new Money(1234567).format()).assertEqual('¥12345.67');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0300
     * @tc.name      format_positive_amounts_have_no_minus_sign_030
     * @tc.desc      Verify format positive amounts have no minus sign.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_positive_amounts_have_no_minus_sign_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_positive_amounts_have_no_minus_sign_030');
      let source: number[] = [100, 499900, 12345];
      let derived: Money[] = [];
      for (let index: number = 0; index < source.length; index++) {
        derived.push(new Money(source[index]).add(Money.zero()));
      }
      expect(derived.length).assertEqual(source.length);
      for (let index: number = 0; index < derived.length; index++) {
        let text: string = derived[index].format();
        expect(text.indexOf('-')).assertEqual(-1);
        expect(text.startsWith('¥')).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0310
     * @tc.name      format_positive_amounts_start_with_currency_symbol_031
     * @tc.desc      Verify format positive amounts start with currency symbol.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_positive_amounts_start_with_currency_symbol_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_positive_amounts_start_with_currency_symbol_031');
      let values: number[] = [1, 100, 499900];
      for (let index: number = 0; index < values.length; index++) {
        let text: string = new Money(values[index]).format();
        expect(text.startsWith('¥')).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0320
     * @tc.name      format_negative_amounts_start_with_minus_symbol_032
     * @tc.desc      Verify format negative amounts start with minus symbol.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_negative_amounts_start_with_minus_symbol_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_negative_amounts_start_with_minus_symbol_032');
      let values: number[] = [-1, -50, -499900];
      for (let index: number = 0; index < values.length; index++) {
        let text: string = new Money(values[index]).format();
        expect(text.startsWith('-¥')).assertTrue();
        expect(text.startsWith('¥-')).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0330
     * @tc.name      format_never_emits_plus_sign_033
     * @tc.desc      Verify format never emits plus sign.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_never_emits_plus_sign_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_never_emits_plus_sign_033');
      let yuan: number[] = [0, 0.5, 1, 4999];
      for (let index: number = 0; index < yuan.length; index++) {
        let text: string = Money.ofYuan(yuan[index]).format();
        expect(text.charAt(0) === '+').assertFalse();
        expect(text.indexOf('+')).assertEqual(-1);
      }
      expect(Money.zero().format()).assertEqual('¥0.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0340
     * @tc.name      format_whole_yuan_ends_with_zero_cents_034
     * @tc.desc      Verify format whole yuan ends with zero cents.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_whole_yuan_ends_with_zero_cents_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_whole_yuan_ends_with_zero_cents_034');
      let values: number[] = [0, 100, 500, 1000, 10000, 499900];
      for (let index: number = 0; index < values.length; index++) {
        let text: string = new Money(values[index]).format();
        expect(text.endsWith('.00')).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0350
     * @tc.name      format_cent_sequence_is_unique_035
     * @tc.desc      Verify format cent sequence is unique.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_cent_sequence_is_unique_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_cent_sequence_is_unique_035');
      let rendered: string[] = [];
      // The 20 consecutive cent values 0..19 must map to 20 distinct strings, with index 10 being 0.10.
      for (let cent: number = 0; cent < 20; cent++) {
        rendered.push(new Money(cent).format());
      }
      let __seen175: string[] = [];
      for (let __i175: number = 0; __i175 < (rendered).length; __i175++) {
        expect(__seen175.indexOf((rendered)[__i175]) < 0).assertTrue();
        __seen175.push((rendered)[__i175]);
      }
      expect(rendered[0]).assertEqual('¥0.00');
      expect(rendered[10]).assertEqual('¥0.10');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0360
     * @tc.name      format_of_yuan_half_cent_rounds_up_036
     * @tc.desc      Verify format of yuan half cent rounds up.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_yuan_half_cent_rounds_up_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_yuan_half_cent_rounds_up_036');
      // 0.005 yuan is exactly half a cent, and ofYuan rounds halves up to 1 cent instead of truncating.
      let text: string = Money.ofYuan(0.005).format();
      expect(text).assertEqual('¥0.01');
      expect(text.endsWith('01')).assertTrue();
      expect(text.startsWith('¥0.')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0370
     * @tc.name      format_of_yuan_below_half_cent_rounds_down_037
     * @tc.desc      Verify format of yuan below half cent rounds down.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_yuan_below_half_cent_rounds_down_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_yuan_below_half_cent_rounds_down_037');
      let text: string = Money.ofYuan(0.004).format();
      expect(text).assertEqual('¥0.00');
      expect(text.endsWith('.00')).assertTrue();
      expect(text.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0380
     * @tc.name      format_is_idempotent_038
     * @tc.desc      Verify format is idempotent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_is_idempotent_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_is_idempotent_038');
      // referenceAmount carries 499900 cents set in beforeAll, so both calls must print 4999.00.
      let first: string = referenceAmount.format();
      let second: string = referenceAmount.format();
      expect(first).assertEqual(second);
      expect(first).assertEqual('¥4999.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0390
     * @tc.name      format_does_not_change_stored_cents_039
     * @tc.desc      Verify format does not change stored cents.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_does_not_change_stored_cents_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_does_not_change_stored_cents_039');
      let amount: Money = new Money(12345);
      let before: number = amount.cents();
      let text: string = amount.format();
      let after: number = amount.cents();
      expect(before).assertEqual(after);
      expect(after).assertEqual(12345);
      expect(text).assertEqual('¥123.45');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0400
     * @tc.name      format_same_amount_across_instances_is_equal_040
     * @tc.desc      Verify format same amount across instances is equal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_same_amount_across_instances_is_equal_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_same_amount_across_instances_is_equal_040');
      let first: Money = new Money(250);
      let second: Money = new Money(250);
      expect(first.format()).assertEqual(second.format());
      expect(first.format()).assertEqual('¥2.50');
      expect(first.equals(second)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0410
     * @tc.name      format_different_amounts_produce_different_text_041
     * @tc.desc      Verify format different amounts produce different text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_different_amounts_produce_different_text_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_different_amounts_produce_different_text_041');
      let lower: string = new Money(250).format();
      let higher: string = new Money(251).format();
      expect(lower !== higher).assertTrue();
      expect(lower).assertEqual('¥2.50');
      expect(higher).assertEqual('¥2.51');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0420
     * @tc.name      format_after_addition_042
     * @tc.desc      Verify format after addition.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_after_addition_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_after_addition_042');
      let total: Money = new Money(100).add(new Money(5));
      expect(total.cents()).assertEqual(105);
      expect(total.format()).assertEqual('¥1.05');
      expect(total.format().endsWith('05')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0430
     * @tc.name      format_after_subtraction_into_negative_043
     * @tc.desc      Verify format after subtraction into negative.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_after_subtraction_into_negative_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_after_subtraction_into_negative_043');
      let balance: Money = new Money(100).subtract(new Money(105));
      expect(balance.cents()).assertEqual(-5);
      expect(balance.format()).assertEqual('-¥0.05');
      expect(balance.format().startsWith('-¥0.')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0440
     * @tc.name      format_of_percentage_results_044
     * @tc.desc      Verify format of percentage results.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_percentage_results_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_percentage_results_044');
      let baseCents: number[] = [12345, 1000, 10000, 499900, 1000];
      let percents: number[] = [50, 100, 1, 50, 0];
      let expectedCents: number[] = [6173, 1000, 100, 249950, 0];
      let expectedTexts: string[] = ['¥61.73', '¥10.00', '¥1.00', '¥2499.50', '¥0.00'];
      expect(baseCents.length).assertEqual(percents.length);
      expect(expectedCents.length).assertEqual(expectedTexts.length);
      // Half of 12345 is 6172.5 cents, so the 50 percent case rounds up to 6173 while exact halves stay integral.
      for (let index: number = 0; index < baseCents.length; index++) {
        let reduced: Money = new Money(baseCents[index]).percentage(percents[index]);
        expect(reduced.cents()).assertEqual(expectedCents[index]);
        let text: string = reduced.format();
        expect(text).assertEqual(expectedTexts[index]);
        expect(text.startsWith('¥')).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0450
     * @tc.name      format_of_multiplication_results_045
     * @tc.desc      Verify format of multiplication results.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_multiplication_results_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_multiplication_results_045');
      let units: number[] = [8900, 499900];
      let quantities: number[] = [4, 20];
      let expectedCents: number[] = [35600, 9998000];
      let expectedTexts: string[] = ['¥356.00', '¥99980.00'];
      expect(units.length).assertEqual(quantities.length);
      expect(expectedCents.length).assertEqual(expectedTexts.length);
      // 499900 x 20 reaches 9998000 cents and still formats as 99980.00 without any grouping comma.
      for (let index: number = 0; index < units.length; index++) {
        let lineTotal: Money = new Money(units[index]).multiply(quantities[index]);
        expect(lineTotal.cents()).assertEqual(expectedCents[index]);
        let text: string = lineTotal.format();
        expect(text).assertEqual(expectedTexts[index]);
        expect(text.indexOf(',')).assertEqual(-1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0460
     * @tc.name      format_of_sum_of_two_prices_046
     * @tc.desc      Verify format of sum of two prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_sum_of_two_prices_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_sum_of_two_prices_046');
      let parts: Money[] = [new Money(129900), new Money(59900)];
      let total: Money = Money.sum(parts);
      expect(total.cents()).assertEqual(189800);
      expect(total.format()).assertEqual('¥1898.00');
      expect(total.format().endsWith('.00')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0470
     * @tc.name      format_of_small_cart_subtotal_047
     * @tc.desc      Verify format of small cart subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_small_cart_subtotal_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_small_cart_subtotal_047');
      // SMALL_CART's lines add to 517700 cents, so the subtotal prints as 5177.00.
      let subtotal: Money = SMALL_CART.allLinesSubtotal();
      expect(subtotal.cents()).assertEqual(517700);
      expect(subtotal.format()).assertEqual('¥5177.00');
      expect(subtotal.format().startsWith('¥5177.')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0480
     * @tc.name      format_of_mixed_cart_all_lines_subtotal_048
     * @tc.desc      Verify format of mixed cart all lines subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_mixed_cart_all_lines_subtotal_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_mixed_cart_all_lines_subtotal_048');
      let subtotal: Money = MIXED_CART.allLinesSubtotal();
      expect(subtotal.cents()).assertEqual(806300);
      expect(subtotal.format()).assertEqual('¥8063.00');
      expect(subtotal.format().endsWith('.00')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0490
     * @tc.name      format_of_cart_payable_after_coupon_049
     * @tc.desc      Verify format of cart payable after coupon.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_cart_payable_after_coupon_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_cart_payable_after_coupon_049');
      // The default coupon book takes 5000 cents off 517700, leaving 512700 to print as 5127.00.
      let payable: Money = SMALL_CART.payable(defaultCouponBook());
      expect(payable.cents()).assertEqual(512700);
      expect(payable.format()).assertEqual('¥5127.00');
      expect(payable.format().startsWith('¥5127.')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0500
     * @tc.name      format_199_cents_renders_below_two_yuan_050
     * @tc.desc      Verify format 199 cents renders below two yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_199_cents_renders_below_two_yuan_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_199_cents_renders_below_two_yuan_050');
      let text: string = new Money(199).format();
      expect(text).assertEqual('¥1.99');
      expect(text.startsWith('¥1.9')).assertTrue();
      expect(text.charCodeAt(1)).assertEqual(49);
      expect(text.endsWith('99')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0510
     * @tc.name      format_999999_cents_renders_nine_thousand_051
     * @tc.desc      Verify format 999999 cents renders nine thousand.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_999999_cents_renders_nine_thousand_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_999999_cents_renders_nine_thousand_051');
      let text: string = new Money(999999).format();
      expect(text).assertEqual('¥9999.99');
      expect(text.indexOf('.')).assertEqual(5);
      expect(text.indexOf(',') < 0).assertTrue();
      expect(text.endsWith('99')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0520
     * @tc.name      format_10000000_cents_renders_hundred_thousand_yuan_052
     * @tc.desc      Verify format 10000000 cents renders hundred thousand yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_10000000_cents_renders_hundred_thousand_yuan_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_10000000_cents_renders_hundred_thousand_yuan_052');
      let text: string = new Money(10000000).format();
      expect(text).assertEqual('¥100000.00');
      expect(text.length).assertEqual(10);
      expect(text.indexOf('e') < 0).assertTrue();
      expect(text.startsWith('¥100000.')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0530
     * @tc.name      format_100000000_cents_renders_million_yuan_053
     * @tc.desc      Verify format 100000000 cents renders million yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_100000000_cents_renders_million_yuan_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_100000000_cents_renders_million_yuan_053');
      // Seven yuan digits put the decimal point at index 8 once the ¥ occupies index 0.
      let amount: Money = Money.ofYuan(1000000);
      let text: string = amount.format();
      expect(text).assertEqual('¥1000000.00');
      expect(text.length).assertEqual(11);
      expect(text.charAt(8)).assertEqual('.');
      expect(text.indexOf(',') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0540
     * @tc.name      format_negative_two_yuan_054
     * @tc.desc      Verify format negative two yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_negative_two_yuan_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_negative_two_yuan_054');
      let amount: Money = Money.ofYuan(-2);
      let text: string = amount.format();
      expect(text).assertEqual('-¥2.00');
      expect(text.length).assertEqual(6);
      expect(text.endsWith('.00')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0550
     * @tc.name      format_negative_ten_cents_055
     * @tc.desc      Verify format negative ten cents.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_negative_ten_cents_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_negative_ten_cents_055');
      let text: string = new Money(-10).format();
      expect(text).assertEqual('-¥0.10');
      expect(text.length).assertEqual(6);
      expect(text.endsWith('10')).assertTrue();
      expect(text.startsWith('-¥0.')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0560
     * @tc.name      format_negative_one_thousand_yuan_056
     * @tc.desc      Verify format negative one thousand yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_negative_one_thousand_yuan_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_negative_one_thousand_yuan_056');
      let text: string = new Money(-100000).format();
      expect(text).assertEqual('-¥1000.00');
      expect(text.indexOf(',') < 0).assertTrue();
      expect(text.startsWith('-¥1000.')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0570
     * @tc.name      format_negative_large_amount_057
     * @tc.desc      Verify format negative large amount.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_negative_large_amount_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_negative_large_amount_057');
      let text: string = new Money(-123456789).format();
      expect(text).assertEqual('-¥1234567.89');
      expect(text.startsWith('-¥1234567.')).assertTrue();
      expect(text.indexOf(',') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0580
     * @tc.name      format_after_subtract_to_zero_058
     * @tc.desc      Verify format after subtract to zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_after_subtract_to_zero_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_after_subtract_to_zero_058');
      let zero: Money = new Money(100).subtract(new Money(100));
      expect(zero.cents()).assertEqual(0);
      expect(zero.format()).assertEqual('¥0.00');
      expect(zero.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0590
     * @tc.name      format_after_clamp_to_zero_059
     * @tc.desc      Verify format after clamp to zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_after_clamp_to_zero_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_after_clamp_to_zero_059');
      let clamped: Money = new Money(-5).clampAtZero();
      expect(clamped.cents()).assertEqual(0);
      expect(clamped.format()).assertEqual('¥0.00');
      expect(clamped.format().endsWith('.00')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0600
     * @tc.name      format_after_multiply_by_zero_060
     * @tc.desc      Verify format after multiply by zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_after_multiply_by_zero_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_after_multiply_by_zero_060');
      let zero: Money = new Money(199).multiply(0);
      expect(zero.cents()).assertEqual(0);
      expect(zero.format()).assertEqual('¥0.00');
      expect(zero.isNegative()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0610
     * @tc.name      format_after_sum_of_empty_array_061
     * @tc.desc      Verify format after sum of empty array.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_after_sum_of_empty_array_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_after_sum_of_empty_array_061');
      let parts: Money[] = [];
      let zero: Money = Money.sum(parts);
      expect(zero.cents()).assertEqual(0);
      expect(zero.format()).assertEqual('¥0.00');
      expect(zero.isZero()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0620
     * @tc.name      format_after_sum_three_prices_062
     * @tc.desc      Verify format after sum three prices.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_after_sum_three_prices_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_after_sum_three_prices_062');
      let parts: Money[] = [new Money(499900), new Money(8900), new Money(19900)];
      let total: Money = Money.sum(parts);
      expect(total.cents()).assertEqual(528700);
      expect(total.format()).assertEqual('¥5287.00');
      expect(total.format().indexOf(',') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0630
     * @tc.name      format_after_multiply_large_quantity_063
     * @tc.desc      Verify format after multiply large quantity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_after_multiply_large_quantity_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_after_multiply_large_quantity_063');
      let total: Money = new Money(199).multiply(150);
      expect(total.cents()).assertEqual(29850);
      expect(total.format()).assertEqual('¥298.50');
      expect(total.format().endsWith('50')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0640
     * @tc.name      format_addition_carry_at_one_yuan_064
     * @tc.desc      Verify format addition carry at one yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_addition_carry_at_one_yuan_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_addition_carry_at_one_yuan_064');
      // 99 + 1 crosses the yuan boundary, so the carry lands in the yuan digit and the cents reset to 00.
      let oneYuan: Money = new Money(99).add(new Money(1));
      let twoYuan: Money = new Money(199).add(new Money(1));
      expect(oneYuan.format()).assertEqual('¥1.00');
      expect(twoYuan.format()).assertEqual('¥2.00');
      expect(oneYuan.isZero()).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0650
     * @tc.name      format_subtraction_borrow_at_one_yuan_065
     * @tc.desc      Verify format subtraction borrow at one yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_subtraction_borrow_at_one_yuan_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_subtraction_borrow_at_one_yuan_065');
      let belowOne: Money = new Money(100).subtract(new Money(1));
      let belowTwo: Money = new Money(200).subtract(new Money(1));
      expect(belowOne.format()).assertEqual('¥0.99');
      expect(belowTwo.format()).assertEqual('¥1.99');
      expect(belowOne.format().endsWith('99')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0660
     * @tc.name      format_addition_carry_between_yuan_066
     * @tc.desc      Verify format addition carry between yuan.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_addition_carry_between_yuan_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_addition_carry_between_yuan_066');
      let carried: Money = new Money(49999).add(new Money(1));
      expect(carried.cents()).assertEqual(50000);
      expect(carried.format()).assertEqual('¥500.00');
      expect(carried.format().startsWith('¥500.')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0670
     * @tc.name      format_length_grows_with_magnitude_067
     * @tc.desc      Verify format length grows with magnitude.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_length_grows_with_magnitude_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_length_grows_with_magnitude_067');
      let values: number[] = [0, 10000, 1000000];
      let lengths: number[] = [5, 7, 9];
      for (let index: number = 0; index < values.length; index++) {
        let text: string = new Money(values[index]).format();
        expect(text.length).assertEqual(lengths[index]);
      }
      expect(new Money(1000000).format().endsWith('.00')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0680
     * @tc.name      format_negative_text_is_one_character_longer_068
     * @tc.desc      Verify format negative text is one character longer.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_negative_text_is_one_character_longer_068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_negative_text_is_one_character_longer_068');
      // 1 and -1 cents differ only by the leading minus, so their lengths must differ by exactly one.
      let positive: string = new Money(1).format();
      let negative: string = new Money(-1).format();
      expect(negative.length - positive.length).assertEqual(1);
      expect(negative.startsWith('-')).assertTrue();
      expect(positive).assertEqual('¥0.01');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0690
     * @tc.name      format_cent_sequence_around_yuan_is_unique_069
     * @tc.desc      Verify format cent sequence around yuan is unique.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_cent_sequence_around_yuan_is_unique_069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_cent_sequence_around_yuan_is_unique_069');
      let rendered: string[] = [];
      for (let cent: number = 90; cent <= 110; cent++) {
        rendered.push(new Money(cent).format());
      }
      let __seen176: string[] = [];
      for (let __i176: number = 0; __i176 < (rendered).length; __i176++) {
        expect(__seen176.indexOf((rendered)[__i176]) < 0).assertTrue();
        __seen176.push((rendered)[__i176]);
      }
      expect(rendered[0]).assertEqual('¥0.90');
      expect(rendered[10]).assertEqual('¥1.00');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0700
     * @tc.name      format_of_large_cart_all_lines_subtotal_070
     * @tc.desc      Verify format of large cart all lines subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_large_cart_all_lines_subtotal_070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_large_cart_all_lines_subtotal_070');
      let subtotal: Money = LARGE_CART.allLinesSubtotal();
      expect(subtotal.cents()).assertEqual(4242000);
      expect(subtotal.format()).assertEqual('¥42420.00');
      expect(subtotal.format().indexOf(',') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0710
     * @tc.name      format_of_large_cart_payable_071
     * @tc.desc      Verify format of large cart payable.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_large_cart_payable_071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_large_cart_payable_071');
      let payable: Money = LARGE_CART.payable(defaultCouponBook());
      expect(payable.cents()).assertEqual(2565500);
      expect(payable.format()).assertEqual('¥25655.00');
      expect(payable.format().endsWith('.00')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0720
     * @tc.name      format_of_mixed_cart_selected_subtotal_072
     * @tc.desc      Verify format of mixed cart selected subtotal.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_mixed_cart_selected_subtotal_072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_mixed_cart_selected_subtotal_072');
      let subtotal: Money = MIXED_CART.subtotal();
      expect(subtotal.cents()).assertEqual(526600);
      expect(subtotal.format()).assertEqual('¥5266.00');
      expect(subtotal.format().startsWith('¥5266.')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0730
     * @tc.name      format_never_returns_an_empty_string_073
     * @tc.desc      Verify format never returns an empty string.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_never_returns_an_empty_string_073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_never_returns_an_empty_string_073');
      let values: number[] = [0, 1, 99, 100, 12345];
      for (let index: number = 0; index < values.length; index++) {
        let text: string = new Money(values[index]).format();
        expect(text.length > 4).assertTrue();
        expect(text.indexOf('¥') >= 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0740
     * @tc.name      format_of_yuan_rounds_at_cent_boundary_074
     * @tc.desc      Verify format of yuan rounds at cent boundary.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_yuan_rounds_at_cent_boundary_074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_yuan_rounds_at_cent_boundary_074');
      let yuan: number[] = [0.096, 0.994];
      // Rounding is compared against Math.round(yuan x 100), so 0.096 and 0.994 must match the half-up result.
      let expectedCents: number[] = [10, 99];
      let expectedTexts: string[] = ['¥0.10', '¥0.99'];
      expect(yuan.length).assertEqual(expectedCents.length);
      expect(expectedCents.length).assertEqual(expectedTexts.length);
      for (let index: number = 0; index < yuan.length; index++) {
        let amount: Money = Money.ofYuan(yuan[index]);
        expect(amount.cents()).assertEqual(expectedCents[index]);
        expect(amount.cents()).assertEqual(Math.round(yuan[index] * 100));
        expect(amount.format()).assertEqual(expectedTexts[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0750
     * @tc.name      format_of_yuan_rounds_above_half_cent_075
     * @tc.desc      Verify format of yuan rounds above half cent.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_yuan_rounds_above_half_cent_075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_yuan_rounds_above_half_cent_075');
      let amount: Money = Money.ofYuan(0.006);
      expect(amount.cents()).assertEqual(1);
      expect(amount.format()).assertEqual('¥0.01');
      expect(amount.isPositive()).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0760
     * @tc.name      format_negative_addition_carry_076
     * @tc.desc      Verify format negative addition carry.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_negative_addition_carry_076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_negative_addition_carry_076');
      let total: Money = new Money(-99).add(new Money(-1));
      expect(total.cents()).assertEqual(-100);
      expect(total.format()).assertEqual('-¥1.00');
      expect(total.format().startsWith('-¥1.')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0770
     * @tc.name      format_of_yuan_formats_positive_values_077
     * @tc.desc      Verify format of yuan formats positive values.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_yuan_formats_positive_values_077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_yuan_formats_positive_values_077');
      // Trailing zeros survive the yuan conversion, so 7 prints 7.00 and 0.5 prints 0.50.
      let yuan: number[] = [12.34, 7, 0.5, 3.10, 5000];
      let texts: string[] = ['¥12.34', '¥7.00', '¥0.50', '¥3.10', '¥5000.00'];
      expect(yuan.length).assertEqual(texts.length);
      for (let index: number = 0; index < yuan.length; index++) {
        expect(Money.ofYuan(yuan[index]).format()).assertEqual(texts[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_MONEY_FORMAT_0780
     * @tc.name      format_of_yuan_keeps_the_negative_sign_078
     * @tc.desc      Verify format of yuan keeps the negative sign.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('format_of_yuan_keeps_the_negative_sign_078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: format_of_yuan_keeps_the_negative_sign_078');
      let yuan: number[] = [-19.99, -0.5, -7];
      let texts: string[] = ['-¥19.99', '-¥0.50', '-¥7.00'];
      expect(yuan.length).assertEqual(texts.length);
      for (let index: number = 0; index < yuan.length; index++) {
        let text: string = Money.ofYuan(yuan[index]).format();
        expect(text).assertEqual(texts[index]);
        expect(text.startsWith('-')).assertTrue();
      }
    });

  });
}
