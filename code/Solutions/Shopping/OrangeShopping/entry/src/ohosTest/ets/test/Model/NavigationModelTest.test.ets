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
import { BreakpointUtil, ShopUrl } from '../Shared/ShopModel';

const DOMAIN: number = 0x0000;
const TAG: string = 'OrangeShoppingTest';

/** Eight page names, a literal copy of the ShopUrl whitelist. */
const KNOWN_PAGES: string[] = [
  'MainPage', 'NewProductPage', 'ShopCartPage', 'UserPage',
  'DetailPage', 'LivePage', 'QRCodeScanPage', 'SetPage'
];

/** Near-miss targets (casing, shortenings, nonexistent) that must fail. */
const UNKNOWN_PAGES: string[] = [
  'UnknownPage', 'Mainpage', 'ProductPage', 'CartPage', 'Detail', 'Set'
];

export default function navigationModelTest() {
  describe('OrangeShoppingNavigationModel', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'navigation model suite prepared');
    });

    afterEach(async () => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0010
     * @tc.name      navigation_recognises_all_eight_known_pages_001
     * @tc.desc      Verify navigation recognises all eight known pages.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_recognises_all_eight_known_pages_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_recognises_all_eight_known_pages_001');
      expect(KNOWN_PAGES.length).assertEqual(8);
      for (let index: number = 0; index < KNOWN_PAGES.length; index++) {
        expect(ShopUrl.isKnownPage(KNOWN_PAGES[index])).assertTrue();
      }
      expect(ShopUrl.isKnownPage('MainPage')).assertTrue();
      expect(ShopUrl.isKnownPage('SetPage')).assertTrue();
      expect(ShopUrl.isKnownPage('QRCodeScanPage')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0020
     * @tc.name      navigation_known_pages_produce_valid_urls_002
     * @tc.desc      Verify navigation known pages produce valid urls.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_known_pages_produce_valid_urls_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_known_pages_produce_valid_urls_002');
      for (let index: number = 0; index < KNOWN_PAGES.length; index++) {
        let url: ShopUrl = new ShopUrl(KNOWN_PAGES[index]);
        expect(url.valid).assertTrue();
        expect(url.page).assertEqual(KNOWN_PAGES[index]);
        expect(url.goodsId).assertEqual(-1);
        expect(ShopUrl.isKnownPage(url.page)).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0030
     * @tc.name      navigation_rejects_every_unknown_page_name_003
     * @tc.desc      Verify navigation rejects every unknown page name.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_rejects_every_unknown_page_name_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_rejects_every_unknown_page_name_003');
      for (let index: number = 0; index < UNKNOWN_PAGES.length; index++) {
        expect(ShopUrl.isKnownPage(UNKNOWN_PAGES[index])).assertFalse();
        let url: ShopUrl = new ShopUrl(UNKNOWN_PAGES[index]);
        expect(url.valid).assertFalse();
        expect(url.page).assertEqual(UNKNOWN_PAGES[index]);
      }
      expect(ShopUrl.isKnownPage('')).assertFalse();
      // The trailing space keeps 'MainPage ' from matching, showing the lookup
      // is exact string equality rather than a prefix test.
      expect(ShopUrl.isKnownPage('MainPage ')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0040
     * @tc.name      navigation_unknown_page_url_is_invalid_004
     * @tc.desc      Verify navigation unknown page url is invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_unknown_page_url_is_invalid_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_unknown_page_url_is_invalid_004');
      let url: ShopUrl = new ShopUrl('UnknownPage');
      expect(url.valid).assertFalse();
      expect(url.page).assertEqual('UnknownPage');
      expect(url.goodsId).assertEqual(-1);
      expect(ShopUrl.isKnownPage(url.page)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0050
     * @tc.name      navigation_empty_page_name_is_invalid_005
     * @tc.desc      Verify navigation empty page name is invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_empty_page_name_is_invalid_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_empty_page_name_is_invalid_005');
      let url: ShopUrl = new ShopUrl('');
      expect(url.valid).assertFalse();
      expect(url.page.length).assertEqual(0);
      expect(url.goodsId).assertEqual(-1);
      expect(ShopUrl.isKnownPage('')).assertFalse();
      // withGoods only concatenates, so an empty page still yields a query
      // string that opens with a question mark.
      expect(url.withGoods(7)).assertEqual('?id=7');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0060
     * @tc.name      navigation_page_matching_is_case_sensitive_006
     * @tc.desc      Verify navigation page matching is case sensitive.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_page_matching_is_case_sensitive_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_page_matching_is_case_sensitive_006');
      expect(ShopUrl.isKnownPage('DetailPage')).assertTrue();
      expect(ShopUrl.isKnownPage('detailpage')).assertFalse();
      expect(ShopUrl.isKnownPage('DETAILPAGE')).assertFalse();
      let url: ShopUrl = new ShopUrl('detailpage');
      expect(url.valid).assertFalse();
      expect(url.page).assertEqual('detailpage');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0070
     * @tc.name      navigation_constructor_defaults_goods_id_to_minus_one_007
     * @tc.desc      Verify navigation constructor defaults goods id to minus one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_constructor_defaults_goods_id_to_minus_one_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_constructor_defaults_goods_id_to_minus_one_007');
      let url: ShopUrl = new ShopUrl('MainPage');
      expect(url.goodsId).assertEqual(-1);
      expect(url.valid).assertTrue();
      expect(url.page).assertEqual('MainPage');
      expect(url.withGoods(3)).assertEqual('MainPage?id=3');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0080
     * @tc.name      navigation_constructor_keeps_a_supplied_goods_id_008
     * @tc.desc      Verify navigation constructor keeps a supplied goods id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_constructor_keeps_a_supplied_goods_id_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_constructor_keeps_a_supplied_goods_id_008');
      let url: ShopUrl = new ShopUrl('DetailPage', 6);
      expect(url.goodsId).assertEqual(6);
      expect(url.valid).assertTrue();
      expect(url.page).assertEqual('DetailPage');
      expect(url.withGoods(6)).assertEqual('DetailPage?id=6');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0090
     * @tc.name      navigation_constructor_keeps_a_negative_goods_id_009
     * @tc.desc      Verify navigation constructor keeps a negative goods id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_constructor_keeps_a_negative_goods_id_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_constructor_keeps_a_negative_goods_id_009');
      let url: ShopUrl = new ShopUrl('DetailPage', -7);
      expect(url.goodsId).assertEqual(-7);
      expect(url.valid).assertTrue();
      expect(url.goodsId < 0).assertTrue();
      expect(url.withGoods(-7)).assertEqual('DetailPage?id=-7');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0100
     * @tc.name      navigation_constructor_unknown_page_keeps_goods_id_010
     * @tc.desc      Verify navigation constructor unknown page keeps goods id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_constructor_unknown_page_keeps_goods_id_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_constructor_unknown_page_keeps_goods_id_010');
      let url: ShopUrl = new ShopUrl('MissingPage', 9);
      expect(url.page).assertEqual('MissingPage');
      expect(url.goodsId).assertEqual(9);
      expect(url.valid).assertFalse();
      expect(ShopUrl.isKnownPage(url.page)).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0110
     * @tc.name      navigation_parse_without_parameters_keeps_default_id_011
     * @tc.desc      Verify navigation parse without parameters keeps default id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_without_parameters_keeps_default_id_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_without_parameters_keeps_default_id_011');
      let url: ShopUrl = ShopUrl.parse('MainPage');
      expect(url.page).assertEqual('MainPage');
      expect(url.goodsId).assertEqual(-1);
      expect(url.valid).assertTrue();
      expect(ShopUrl.isKnownPage(url.page)).assertTrue();
      expect(url.withGoods(3)).assertEqual('MainPage?id=3');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0120
     * @tc.name      navigation_parse_empty_or_bare_question_is_invalid_012
     * @tc.desc      Verify navigation parse empty or bare question is invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_empty_or_bare_question_is_invalid_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_empty_or_bare_question_is_invalid_012');
      let texts: string[] = ['', '?'];
      let ids: number[] = [1, 2];
      // Empty text returns early, and a lone '?' splits into a page of '' and
      // an empty parameter list, so both keep the -1 default id.
      expect(texts.length).assertEqual(ids.length);
      for (let index: number = 0; index < texts.length; index++) {
        let url: ShopUrl = ShopUrl.parse(texts[index]);
        expect(url.page.length).assertEqual(0);
        expect(url.goodsId).assertEqual(-1);
        expect(url.valid).assertFalse();
        expect(ShopUrl.isKnownPage(url.page)).assertFalse();
        expect(url.withGoods(ids[index])).assertEqual('?id=' + ids[index].toString());
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0130
     * @tc.name      navigation_parse_text_without_query_keeps_whole_text_013
     * @tc.desc      Verify navigation parse text without query keeps whole text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_text_without_query_keeps_whole_text_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_text_without_query_keeps_whole_text_013');
      let texts: string[] = ['id=5', '   ', 'DetailPage#top'];
      expect(texts.length).assertEqual(3);
      for (let index: number = 0; index < texts.length; index++) {
        let url: ShopUrl = ShopUrl.parse(texts[index]);
        expect(url.page).assertEqual(texts[index]);
        expect(url.page.length).assertEqual(texts[index].length);
        expect(url.goodsId).assertEqual(-1);
        expect(url.valid).assertFalse();
        expect(ShopUrl.isKnownPage(url.page)).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0140
     * @tc.name      navigation_parse_extracts_a_numeric_id_014
     * @tc.desc      Verify navigation parse extracts a numeric id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_extracts_a_numeric_id_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_extracts_a_numeric_id_014');
      let url: ShopUrl = ShopUrl.parse('DetailPage?id=42');
      expect(url.page).assertEqual('DetailPage');
      expect(url.goodsId).assertEqual(42);
      expect(url.valid).assertTrue();
      expect(ShopUrl.isKnownPage(url.page)).assertTrue();
      expect(url.withGoods(42)).assertEqual('DetailPage?id=42');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0150
     * @tc.name      navigation_parse_invalid_id_values_keep_default_015
     * @tc.desc      Verify navigation parse invalid id values keep default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_invalid_id_values_keep_default_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_invalid_id_values_keep_default_015');
      // An unusable id only loses the id: the DetailPage itself remains a
      // valid, recognised target with goodsId -1.
      let invalidValues: string[] = ['abc', '', 'x9'];
      for (let index: number = 0; index < invalidValues.length; index++) {
        let url: ShopUrl = ShopUrl.parse('DetailPage?id=' + invalidValues[index]);
        expect(url.goodsId).assertEqual(-1);
        expect(url.valid).assertTrue();
        expect(url.page).assertEqual('DetailPage');
      }
      expect(ShopUrl.parse('DetailPage?id=abc').goodsId).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0160
     * @tc.name      navigation_parse_unrecognised_id_forms_keep_default_016
     * @tc.desc      Verify navigation parse unrecognised id forms keep default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_unrecognised_id_forms_keep_default_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_unrecognised_id_forms_keep_default_016');
      let queries: string[] = ['DetailPage?id=1=2', 'DetailPage?goods=5', 'DetailPage?ID=5',
        'MainPage?#'];
      let pages: string[] = ['DetailPage', 'DetailPage', 'DetailPage', 'MainPage'];
      let ids: number[] = [1, 5, 5, 2];
      expect(queries.length).assertEqual(pages.length);
      for (let index: number = 0; index < queries.length; index++) {
        let url: ShopUrl = ShopUrl.parse(queries[index]);
        expect(url.page).assertEqual(pages[index]);
        expect(url.goodsId).assertEqual(-1);
        expect(url.valid).assertTrue();
        expect(url.withGoods(ids[index])).assertEqual(pages[index] + '?id=' + ids[index].toString());
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0170
     * @tc.name      navigation_parse_invalid_id_payload_keeps_default_017
     * @tc.desc      Verify navigation parse invalid id payload keeps default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_invalid_id_payload_keeps_default_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_invalid_id_payload_keeps_default_017');
      let queries: string[] = ['DetailPage?id', 'DetailPage?id=   ', 'DetailPage?id=null'];
      let emptyPayloads: string[] = ['DetailPage?id=', 'DetailPage?id=\t', 'DetailPage?id=true'];
      expect(queries.length).assertEqual(emptyPayloads.length);
      for (let index: number = 0; index < queries.length; index++) {
        let url: ShopUrl = ShopUrl.parse(queries[index]);
        expect(url.page).assertEqual('DetailPage');
        expect(url.goodsId).assertEqual(-1);
        expect(url.valid).assertTrue();
        expect(ShopUrl.isKnownPage(url.page)).assertTrue();
        expect(url.withGoods(3)).assertEqual('DetailPage?id=3');
        expect(ShopUrl.parse(emptyPayloads[index]).goodsId).assertEqual(-1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0180
     * @tc.name      navigation_parse_malformed_query_forms_stay_valid_018
     * @tc.desc      Verify navigation parse malformed query forms stay valid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_malformed_query_forms_stay_valid_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_malformed_query_forms_stay_valid_018');
      let queries: string[] = ['DetailPage?id =5', 'DetailPage?=5', 'DetailPage??id=5',
        'DetailPage?id=--5'];
      expect(queries.length).assertEqual(4);
      for (let index: number = 0; index < queries.length; index++) {
        let url: ShopUrl = ShopUrl.parse(queries[index]);
        expect(url.page).assertEqual('DetailPage');
        expect(url.goodsId).assertEqual(-1);
        expect(url.valid).assertTrue();
        expect(ShopUrl.isKnownPage(url.page)).assertTrue();
        expect(url.page.indexOf('?')).assertEqual(-1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0190
     * @tc.name      navigation_parse_double_equals_is_malformed_019
     * @tc.desc      Verify navigation parse double equals is malformed.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_double_equals_is_malformed_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_double_equals_is_malformed_019');
      let url: ShopUrl = ShopUrl.parse('DetailPage?id==5');
      // Splitting 'id==5' on '=' produces three parts, so the pair check
      // discards it, while the plain 'id=5' on the last line still parses.
      expect(url.page).assertEqual('DetailPage');
      expect(url.goodsId).assertEqual(-1);
      expect(url.valid).assertTrue();
      expect(ShopUrl.parse('DetailPage?id=5').goodsId).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0200
     * @tc.name      navigation_parse_negative_id_is_accepted_020
     * @tc.desc      Verify navigation parse negative id is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_negative_id_is_accepted_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_negative_id_is_accepted_020');
      let url: ShopUrl = ShopUrl.parse('DetailPage?id=-5');
      expect(url.page).assertEqual('DetailPage');
      expect(url.goodsId).assertEqual(-5);
      expect(url.valid).assertTrue();
      expect(url.goodsId < 0).assertTrue();
      expect(url.withGoods(-5)).assertEqual('DetailPage?id=-5');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0210
     * @tc.name      navigation_parse_zero_id_is_accepted_021
     * @tc.desc      Verify navigation parse zero id is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_zero_id_is_accepted_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_zero_id_is_accepted_021');
      let url: ShopUrl = ShopUrl.parse('DetailPage?id=0');
      // Zero is a legitimate goods id; only a missing parameter falls back to -1.
      expect(url.page).assertEqual('DetailPage');
      expect(url.goodsId).assertEqual(0);
      expect(url.valid).assertTrue();
      expect(ShopUrl.parse('DetailPage').goodsId).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0220
     * @tc.name      navigation_parse_query_without_page_keeps_empty_page_022
     * @tc.desc      Verify navigation parse query without page keeps empty page.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_query_without_page_keeps_empty_page_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_query_without_page_keeps_empty_page_022');
      let url: ShopUrl = ShopUrl.parse('?id=5');
      // The query half still yields id 5 even though the page half is empty
      // and therefore never a known page.
      expect(url.page.length).assertEqual(0);
      expect(url.goodsId).assertEqual(5);
      expect(url.valid).assertFalse();
      expect(url.withGoods(5)).assertEqual('?id=5');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0230
     * @tc.name      navigation_parse_question_mark_without_id_keeps_default_023
     * @tc.desc      Verify navigation parse question mark without id keeps default.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_question_mark_without_id_keeps_default_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_question_mark_without_id_keeps_default_023');
      let texts: string[] = ['MainPage?', 'DetailPage??'];
      let pages: string[] = ['MainPage', 'DetailPage'];
      expect(texts.length).assertEqual(pages.length);
      for (let index: number = 0; index < texts.length; index++) {
        let url: ShopUrl = ShopUrl.parse(texts[index]);
        expect(url.page).assertEqual(pages[index]);
        expect(url.goodsId).assertEqual(-1);
        expect(url.valid).assertTrue();
        expect(ShopUrl.isKnownPage(url.page)).assertTrue();
        expect(ShopUrl.parse(url.withGoods(1)).goodsId).assertEqual(1);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0240
     * @tc.name      navigation_parse_large_id_is_accepted_024
     * @tc.desc      Verify navigation parse large id is accepted.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_large_id_is_accepted_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_large_id_is_accepted_024');
      let url: ShopUrl = ShopUrl.parse('DetailPage?id=2147483648');
      expect(url.page).assertEqual('DetailPage');
      expect(url.goodsId).assertEqual(2147483648);
      expect(url.valid).assertTrue();
      expect(ShopUrl.parse(url.withGoods(2147483648)).goodsId).assertEqual(2147483648);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0250
     * @tc.name      navigation_with_goods_formats_a_query_string_025
     * @tc.desc      Verify navigation with goods formats a query string.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_with_goods_formats_a_query_string_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_with_goods_formats_a_query_string_025');
      let url: ShopUrl = new ShopUrl('DetailPage');
      expect(url.withGoods(42)).assertEqual('DetailPage?id=42');
      expect(url.withGoods(42)).assertEqual('DetailPage' + '?id=' + '42');
      expect(url.valid).assertTrue();
      expect(ShopUrl.parse(url.withGoods(42)).goodsId).assertEqual(42);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0260
     * @tc.name      navigation_with_goods_accepts_zero_026
     * @tc.desc      Verify navigation with goods accepts zero.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_with_goods_accepts_zero_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_with_goods_accepts_zero_026');
      let url: ShopUrl = new ShopUrl('ShopCartPage');
      expect(url.withGoods(0)).assertEqual('ShopCartPage?id=0');
      expect(url.goodsId).assertEqual(-1);
      expect(url.valid).assertTrue();
      expect(ShopUrl.parse(url.withGoods(0)).goodsId).assertEqual(0);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0270
     * @tc.name      navigation_with_goods_accepts_negative_ids_027
     * @tc.desc      Verify navigation with goods accepts negative ids.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_with_goods_accepts_negative_ids_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_with_goods_accepts_negative_ids_027');
      let url: ShopUrl = new ShopUrl('DetailPage');
      expect(url.withGoods(-3)).assertEqual('DetailPage?id=-3');
      expect(url.valid).assertTrue();
      expect(url.goodsId).assertEqual(-1);
      expect(ShopUrl.parse(url.withGoods(-3)).goodsId).assertEqual(-3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0280
     * @tc.name      navigation_with_goods_round_trips_through_parse_028
     * @tc.desc      Verify navigation with goods round trips through parse.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_with_goods_round_trips_through_parse_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_with_goods_round_trips_through_parse_028');
      let url: ShopUrl = new ShopUrl('DetailPage');
      let text: string = url.withGoods(17);
      let parsed: ShopUrl = ShopUrl.parse(text);
      expect(parsed.page).assertEqual('DetailPage');
      expect(parsed.goodsId).assertEqual(17);
      expect(parsed.valid).assertTrue();
      expect(parsed.withGoods(17)).assertEqual(text);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0290
     * @tc.name      navigation_with_goods_overrides_the_constructor_id_029
     * @tc.desc      Verify navigation with goods overrides the constructor id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_with_goods_overrides_the_constructor_id_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_with_goods_overrides_the_constructor_id_029');
      let url: ShopUrl = new ShopUrl('DetailPage', 3);
      expect(url.goodsId).assertEqual(3);
      expect(url.withGoods(8)).assertEqual('DetailPage?id=8');
      expect(url.goodsId).assertEqual(3);
      expect(url.valid).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0300
     * @tc.name      navigation_with_goods_on_unknown_page_still_formats_030
     * @tc.desc      Verify navigation with goods on unknown page still formats.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_with_goods_on_unknown_page_still_formats_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_with_goods_on_unknown_page_still_formats_030');
      let url: ShopUrl = new ShopUrl('UnknownPage');
      expect(url.withGoods(1)).assertEqual('UnknownPage?id=1');
      expect(url.valid).assertFalse();
      expect(url.page).assertEqual('UnknownPage');
      expect(ShopUrl.parse(url.withGoods(1)).valid).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0310
     * @tc.name      navigation_with_goods_does_not_change_validity_031
     * @tc.desc      Verify navigation with goods does not change validity.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_with_goods_does_not_change_validity_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_with_goods_does_not_change_validity_031');
      let known: ShopUrl = new ShopUrl('LivePage');
      let unknownUrl: ShopUrl = new ShopUrl('StreamPage');
      known.withGoods(2);
      unknownUrl.withGoods(2);
      expect(known.valid).assertTrue();
      expect(unknownUrl.valid).assertFalse();
      expect(known.page).assertEqual('LivePage');
      expect(unknownUrl.page).assertEqual('StreamPage');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0320
     * @tc.name      navigation_with_goods_on_empty_page_starts_with_question_mark_032
     * @tc.desc      Verify navigation with goods on empty page starts with question mark.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_with_goods_on_empty_page_starts_with_question_mark_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_with_goods_on_empty_page_starts_with_question_mark_032');
      let url: ShopUrl = new ShopUrl('');
      expect(url.withGoods(7)).assertEqual('?id=7');
      expect(url.valid).assertFalse();
      expect(url.page.length).assertEqual(0);
      expect(ShopUrl.parse(url.withGoods(7)).goodsId).assertEqual(7);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0330
     * @tc.name      navigation_with_goods_large_id_keeps_every_digit_033
     * @tc.desc      Verify navigation with goods large id keeps every digit.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_with_goods_large_id_keeps_every_digit_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_with_goods_large_id_keeps_every_digit_033');
      let url: ShopUrl = new ShopUrl('DetailPage');
      let text: string = url.withGoods(123456789);
      expect(text).assertEqual('DetailPage?id=123456789');
      expect(ShopUrl.parse(text).page).assertEqual('DetailPage');
      expect(ShopUrl.parse(text).goodsId).assertEqual(123456789);
      expect(ShopUrl.parse(text).valid).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0340
     * @tc.name      navigation_with_goods_after_parse_uses_the_parsed_page_034
     * @tc.desc      Verify navigation with goods after parse uses the parsed page.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_with_goods_after_parse_uses_the_parsed_page_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_with_goods_after_parse_uses_the_parsed_page_034');
      let url: ShopUrl = ShopUrl.parse('DetailPage?from=cart');
      expect(url.goodsId).assertEqual(-1);
      expect(url.withGoods(4)).assertEqual('DetailPage?id=4');
      expect(ShopUrl.parse(url.withGoods(4)).goodsId).assertEqual(4);
      expect(url.valid).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0350
     * @tc.name      navigation_resolve_zero_width_as_small_035
     * @tc.desc      Verify navigation resolve zero width as small.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_resolve_zero_width_as_small_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_resolve_zero_width_as_small_035');
      let breakpoint: string = BreakpointUtil.resolve(0);
      expect(breakpoint).assertEqual(BreakpointUtil.SMALL);
      expect(breakpoint).assertEqual('sm');
      expect(BreakpointUtil.isKnown(breakpoint)).assertTrue();
      expect(BreakpointUtil.columns(breakpoint)).assertEqual(1);
      expect(BreakpointUtil.swiperDisplay(breakpoint)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0360
     * @tc.name      navigation_resolve_width_519_as_small_036
     * @tc.desc      Verify navigation resolve width 519 as small.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_resolve_width_519_as_small_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_resolve_width_519_as_small_036');
      let breakpoint: string = BreakpointUtil.resolve(519);
      expect(breakpoint).assertEqual(BreakpointUtil.SMALL);
      expect(breakpoint).assertEqual('sm');
      expect(BreakpointUtil.isKnown(breakpoint)).assertTrue();
      expect(BreakpointUtil.swiperDisplay(breakpoint)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0370
     * @tc.name      navigation_resolve_width_520_as_medium_037
     * @tc.desc      Verify navigation resolve width 520 as medium.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_resolve_width_520_as_medium_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_resolve_width_520_as_medium_037');
      // 520 is the first medium width: resolve only treats values below 520 as small.
      let breakpoint: string = BreakpointUtil.resolve(520);
      expect(breakpoint).assertEqual(BreakpointUtil.MEDIUM);
      expect(breakpoint).assertEqual('md');
      expect(BreakpointUtil.isKnown(breakpoint)).assertTrue();
      expect(BreakpointUtil.columns(breakpoint)).assertEqual(2);
      expect(BreakpointUtil.swiperDisplay(breakpoint)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0380
     * @tc.name      navigation_resolve_width_839_as_medium_038
     * @tc.desc      Verify navigation resolve width 839 as medium.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_resolve_width_839_as_medium_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_resolve_width_839_as_medium_038');
      let breakpoint: string = BreakpointUtil.resolve(839);
      expect(breakpoint).assertEqual('md');
      expect(breakpoint).assertEqual(BreakpointUtil.MEDIUM);
      expect(BreakpointUtil.isKnown(breakpoint)).assertTrue();
      expect(BreakpointUtil.swiperDisplay(breakpoint)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0390
     * @tc.name      navigation_resolve_width_840_as_large_039
     * @tc.desc      Verify navigation resolve width 840 as large.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_resolve_width_840_as_large_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_resolve_width_840_as_large_039');
      // 840 is the first large width because the medium branch stops below it.
      let breakpoint: string = BreakpointUtil.resolve(840);
      expect(breakpoint).assertEqual('lg');
      expect(breakpoint).assertEqual(BreakpointUtil.LARGE);
      expect(BreakpointUtil.isKnown(breakpoint)).assertTrue();
      expect(BreakpointUtil.columns(breakpoint)).assertEqual(3);
      expect(BreakpointUtil.swiperDisplay(breakpoint)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0400
     * @tc.name      navigation_resolve_wide_screen_as_large_040
     * @tc.desc      Verify navigation resolve wide screen as large.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_resolve_wide_screen_as_large_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_resolve_wide_screen_as_large_040');
      expect(BreakpointUtil.resolve(2560)).assertEqual(BreakpointUtil.LARGE);
      expect(BreakpointUtil.resolve(2560)).assertEqual('lg');
      expect(BreakpointUtil.swiperDisplay(BreakpointUtil.resolve(2560))).assertEqual(3);
      expect(BreakpointUtil.isKnown(BreakpointUtil.resolve(2560))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0410
     * @tc.name      navigation_resolve_negative_width_as_small_041
     * @tc.desc      Verify navigation resolve negative width as small.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_resolve_negative_width_as_small_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_resolve_negative_width_as_small_041');
      expect(BreakpointUtil.resolve(-1)).assertEqual(BreakpointUtil.SMALL);
      expect(BreakpointUtil.resolve(-100)).assertEqual('sm');
      expect(BreakpointUtil.columns(BreakpointUtil.resolve(-100))).assertEqual(1);
      expect(BreakpointUtil.resolve(-100)).assertEqual(BreakpointUtil.SMALL);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0420
     * @tc.name      navigation_resolve_max_safe_width_as_large_042
     * @tc.desc      Verify navigation resolve max safe width as large.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_resolve_max_safe_width_as_large_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_resolve_max_safe_width_as_large_042');
      expect(BreakpointUtil.resolve(Number.MAX_SAFE_INTEGER)).assertEqual(BreakpointUtil.LARGE);
      expect(BreakpointUtil.columns(BreakpointUtil.resolve(Number.MAX_SAFE_INTEGER))).assertEqual(3);
      expect(BreakpointUtil.isKnown(BreakpointUtil.resolve(Number.MAX_SAFE_INTEGER))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0430
     * @tc.name      navigation_columns_small_is_one_043
     * @tc.desc      Verify navigation columns small is one.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_columns_small_is_one_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_columns_small_is_one_043');
      expect(BreakpointUtil.columns(BreakpointUtil.SMALL)).assertEqual(1);
      expect(BreakpointUtil.columns('sm')).assertEqual(1);
      expect(BreakpointUtil.columns('sm') < 2).assertTrue();
      expect(BreakpointUtil.swiperDisplay('sm')).assertEqual(BreakpointUtil.columns('sm'));
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0440
     * @tc.name      navigation_columns_medium_is_two_044
     * @tc.desc      Verify navigation columns medium is two.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_columns_medium_is_two_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_columns_medium_is_two_044');
      expect(BreakpointUtil.columns(BreakpointUtil.MEDIUM)).assertEqual(2);
      expect(BreakpointUtil.columns('md')).assertEqual(2);
      expect(BreakpointUtil.columns('md') > 1).assertTrue();
      expect(BreakpointUtil.swiperDisplay('md')).assertEqual(BreakpointUtil.columns('md'));
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0450
     * @tc.name      navigation_columns_large_is_three_045
     * @tc.desc      Verify navigation columns large is three.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_columns_large_is_three_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_columns_large_is_three_045');
      expect(BreakpointUtil.columns(BreakpointUtil.LARGE)).assertEqual(3);
      expect(BreakpointUtil.columns('lg')).assertEqual(3);
      expect(BreakpointUtil.columns('lg') > 2).assertTrue();
      expect(BreakpointUtil.swiperDisplay('lg')).assertEqual(BreakpointUtil.columns('lg'));
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0460
     * @tc.name      navigation_columns_unknown_breakpoint_is_three_046
     * @tc.desc      Verify navigation columns unknown breakpoint is three.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_columns_unknown_breakpoint_is_three_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_columns_unknown_breakpoint_is_three_046');
      let unknowns: string[] = ['', 'xl', 'SM', 'small', 'lg ', 'Md'];
      // columns falls through to the large branch for anything that is not
      // exactly 'sm' or 'md', so each unknown label still reports 3.
      for (let index: number = 0; index < unknowns.length; index++) {
        expect(BreakpointUtil.columns(unknowns[index])).assertEqual(3);
        expect(BreakpointUtil.isKnown(unknowns[index])).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0470
     * @tc.name      navigation_swiper_display_unknown_is_three_047
     * @tc.desc      Verify navigation swiper display unknown is three.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_swiper_display_unknown_is_three_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_swiper_display_unknown_is_three_047');
      expect(BreakpointUtil.swiperDisplay('xl')).assertEqual(3);
      expect(BreakpointUtil.swiperDisplay('')).assertEqual(3);
      expect(BreakpointUtil.swiperDisplay('SM')).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0480
     * @tc.name      navigation_is_known_accepts_the_three_breakpoints_048
     * @tc.desc      Verify navigation is known accepts the three breakpoints.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_is_known_accepts_the_three_breakpoints_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_is_known_accepts_the_three_breakpoints_048');
      let known: string[] = [BreakpointUtil.SMALL, BreakpointUtil.MEDIUM, BreakpointUtil.LARGE];
      for (let index: number = 0; index < known.length; index++) {
        expect(BreakpointUtil.isKnown(known[index])).assertTrue();
      }
      expect(BreakpointUtil.isKnown('sm')).assertTrue();
      expect(BreakpointUtil.isKnown('md')).assertTrue();
      expect(BreakpointUtil.isKnown('lg')).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0490
     * @tc.name      navigation_is_known_rejects_unknown_breakpoints_049
     * @tc.desc      Verify navigation is known rejects unknown breakpoints.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_is_known_rejects_unknown_breakpoints_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_is_known_rejects_unknown_breakpoints_049');
      let unknownBreakpoints: string[] = ['', 'xl', 'SM', 'small', 'lg ', 'md\n'];
      for (let index: number = 0; index < unknownBreakpoints.length; index++) {
        expect(BreakpointUtil.isKnown(unknownBreakpoints[index])).assertFalse();
      }
      expect(BreakpointUtil.isKnown('medium')).assertFalse();
      expect(BreakpointUtil.isKnown('Md')).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0500
     * @tc.name      navigation_breakpoint_constants_have_stable_labels_050
     * @tc.desc      Verify navigation breakpoint constants have stable labels.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_breakpoint_constants_have_stable_labels_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_breakpoint_constants_have_stable_labels_050');
      expect(BreakpointUtil.SMALL).assertEqual('sm');
      expect(BreakpointUtil.MEDIUM).assertEqual('md');
      expect(BreakpointUtil.LARGE).assertEqual('lg');
      expect(([BreakpointUtil.SMALL, BreakpointUtil.MEDIUM, BreakpointUtil.LARGE]).length).assertEqual((['sm', 'md', 'lg']).length);
      for (let __i182: number = 0; __i182 < (['sm', 'md', 'lg']).length; __i182++) {
        expect(([BreakpointUtil.SMALL, BreakpointUtil.MEDIUM, BreakpointUtil.LARGE])[__i182]).assertEqual((['sm', 'md', 'lg'])[__i182]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0510
     * @tc.name      navigation_breakpoint_column_counts_differ_051
     * @tc.desc      Verify navigation breakpoint column counts differ.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_breakpoint_column_counts_differ_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_breakpoint_column_counts_differ_051');
      expect(BreakpointUtil.columns(BreakpointUtil.SMALL) !== BreakpointUtil.columns(BreakpointUtil.MEDIUM)).assertTrue();
      expect(BreakpointUtil.columns(BreakpointUtil.MEDIUM) !== BreakpointUtil.columns(BreakpointUtil.LARGE)).assertTrue();
      expect(BreakpointUtil.columns(BreakpointUtil.SMALL) !== BreakpointUtil.columns(BreakpointUtil.LARGE)).assertTrue();
      expect(BreakpointUtil.columns(BreakpointUtil.SMALL)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0520
     * @tc.name      navigation_resolved_breakpoint_selects_its_column_count_052
     * @tc.desc      Verify navigation resolved breakpoint selects its column count.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_resolved_breakpoint_selects_its_column_count_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_resolved_breakpoint_selects_its_column_count_052');
      expect(BreakpointUtil.columns(BreakpointUtil.resolve(360))).assertEqual(1);
      expect(BreakpointUtil.columns(BreakpointUtil.resolve(700))).assertEqual(2);
      expect(BreakpointUtil.columns(BreakpointUtil.resolve(1200))).assertEqual(3);
      expect(BreakpointUtil.swiperDisplay(BreakpointUtil.resolve(700))).assertEqual(2);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0530
     * @tc.name      navigation_parse_hash_in_value_is_truncated_053
     * @tc.desc      Verify navigation parse hash in value is truncated.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_hash_in_value_is_truncated_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_hash_in_value_is_truncated_053');
      let url: ShopUrl = ShopUrl.parse('DetailPage?id=5#top');
      // parseInt stops at '#', so the id is 5 and the fragment never reaches
      // the page field.
      expect(url.page).assertEqual('DetailPage');
      expect(url.goodsId).assertEqual(5);
      expect(url.valid).assertTrue();
      expect(url.page.indexOf('#') >= 0).assertFalse();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0540
     * @tc.name      navigation_constructor_page_containing_query_is_unknown_054
     * @tc.desc      Verify navigation constructor page containing query is unknown.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_constructor_page_containing_query_is_unknown_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_constructor_page_containing_query_is_unknown_054');
      let url: ShopUrl = new ShopUrl('MainPage?x=1');
      // The constructor validates the whole string, so the embedded query makes
      // it unknown and withGoods later appends a second '?'.
      expect(url.page).assertEqual('MainPage?x=1');
      expect(url.valid).assertFalse();
      expect(url.goodsId).assertEqual(-1);
      expect(url.withGoods(2)).assertEqual('MainPage?x=1?id=2');
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0550
     * @tc.name      navigation_with_goods_on_parsed_unknown_page_stays_invalid_055
     * @tc.desc      Verify navigation with goods on parsed unknown page stays invalid.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_with_goods_on_parsed_unknown_page_stays_invalid_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_with_goods_on_parsed_unknown_page_stays_invalid_055');
      let url: ShopUrl = ShopUrl.parse('MissingPage');
      expect(url.valid).assertFalse();
      expect(url.goodsId).assertEqual(-1);
      expect(url.withGoods(3)).assertEqual('MissingPage?id=3');
      expect(ShopUrl.parse(url.withGoods(3)).valid).assertFalse();
      expect(ShopUrl.parse(url.withGoods(3)).goodsId).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0560
     * @tc.name      navigation_resolve_fractional_zero_width_is_small_056
     * @tc.desc      Verify navigation resolve fractional zero width is small.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_resolve_fractional_zero_width_is_small_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_resolve_fractional_zero_width_is_small_056');
      expect(BreakpointUtil.resolve(0.5)).assertEqual(BreakpointUtil.SMALL);
      expect(BreakpointUtil.columns(BreakpointUtil.resolve(0.5))).assertEqual(1);
      expect(BreakpointUtil.isKnown(BreakpointUtil.resolve(0.5))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0570
     * @tc.name      navigation_resolve_fractional_width_above_large_threshold_057
     * @tc.desc      Verify navigation resolve fractional width above large threshold.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_resolve_fractional_width_above_large_threshold_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_resolve_fractional_width_above_large_threshold_057');
      expect(BreakpointUtil.resolve(840.5)).assertEqual(BreakpointUtil.LARGE);
      expect(BreakpointUtil.columns(BreakpointUtil.resolve(840.5))).assertEqual(3);
      expect(BreakpointUtil.swiperDisplay(BreakpointUtil.resolve(840.5))).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0580
     * @tc.name      navigation_columns_small_label_with_trailing_space_is_unknown_058
     * @tc.desc      Verify navigation columns small label with trailing space is unknown.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_columns_small_label_with_trailing_space_is_unknown_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_columns_small_label_with_trailing_space_is_unknown_058');
      expect(BreakpointUtil.columns('sm ')).assertEqual(3);
      expect(BreakpointUtil.isKnown('sm ')).assertFalse();
      expect(BreakpointUtil.swiperDisplay('sm ')).assertEqual(3);
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0590
     * @tc.name      navigation_is_known_accepts_every_resolved_breakpoint_059
     * @tc.desc      Verify navigation is known accepts every resolved breakpoint.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_is_known_accepts_every_resolved_breakpoint_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_is_known_accepts_every_resolved_breakpoint_059');
      let widths: number[] = [0, 519, 520, 839, 840, 2000];
      for (let index: number = 0; index < widths.length; index++) {
        expect(BreakpointUtil.isKnown(BreakpointUtil.resolve(widths[index]))).assertTrue();
      }
      expect(BreakpointUtil.isKnown(BreakpointUtil.resolve(2000))).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0600
     * @tc.name      navigation_every_known_page_round_trips_with_goods_060
     * @tc.desc      Verify navigation every known page round trips with goods.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_every_known_page_round_trips_with_goods_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_every_known_page_round_trips_with_goods_060');
      for (let index: number = 0; index < KNOWN_PAGES.length; index++) {
        let url: ShopUrl = new ShopUrl(KNOWN_PAGES[index]);
        let parsed: ShopUrl = ShopUrl.parse(url.withGoods(3));
        expect(parsed.page).assertEqual(KNOWN_PAGES[index]);
        expect(parsed.goodsId).assertEqual(3);
        expect(parsed.valid).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0610
     * @tc.name      navigation_resolve_width_300_as_small_061
     * @tc.desc      Verify navigation resolve width 300 as small.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_resolve_width_300_as_small_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_resolve_width_300_as_small_061');
      let breakpoint: string = BreakpointUtil.resolve(300);
      expect(breakpoint).assertEqual(BreakpointUtil.SMALL);
      expect(BreakpointUtil.columns(breakpoint)).assertEqual(1);
      expect(BreakpointUtil.swiperDisplay(breakpoint)).assertEqual(1);
      expect(BreakpointUtil.isKnown(breakpoint)).assertTrue();
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0620
     * @tc.name      navigation_parse_unknown_pages_keep_their_text_and_id_062
     * @tc.desc      Verify navigation parse unknown pages keep their text and id.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_unknown_pages_keep_their_text_and_id_062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_unknown_pages_keep_their_text_and_id_062');
      let texts: string[] = ['MissingPage?id=5', ' DetailPage?id=5', '\tMainPage?id=6'];
      let pages: string[] = ['MissingPage', ' DetailPage', '\tMainPage'];
      let goodsIds: number[] = [5, 5, 6];
      // parse trims nothing from the page text, so the leading space and tab
      // keep those two names unknown even though both ids still parse.
      expect(texts.length).assertEqual(pages.length);
      for (let index: number = 0; index < texts.length; index++) {
        let url: ShopUrl = ShopUrl.parse(texts[index]);
        expect(url.page).assertEqual(pages[index]);
        expect(url.goodsId).assertEqual(goodsIds[index]);
        expect(url.valid).assertFalse();
        expect(ShopUrl.isKnownPage(url.page)).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0630
     * @tc.name      navigation_parse_extracts_ids_from_parameter_lists_063
     * @tc.desc      Verify navigation parse extracts ids from parameter lists.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_extracts_ids_from_parameter_lists_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_extracts_ids_from_parameter_lists_063');
      let texts: string[] = ['DetailPage?from=cart&id=9', 'DetailPage?id=12abc',
        'DetailPage?id=0x10', 'MainPage?&id=4&&from=home', 'DetailPage?id=0X10'];
      let pages: string[] = ['DetailPage', 'DetailPage', 'DetailPage', 'MainPage', 'DetailPage'];
      // parseInt reads '12abc' as 12 and treats both '0x10' and '0X10' as
      // hexadecimal 16, while the id=9 sits second in its parameter list.
      let ids: number[] = [9, 12, 16, 4, 16];
      expect(texts.length).assertEqual(ids.length);
      for (let index: number = 0; index < texts.length; index++) {
        let url: ShopUrl = ShopUrl.parse(texts[index]);
        expect(url.page).assertEqual(pages[index]);
        expect(url.goodsId).assertEqual(ids[index]);
        expect(url.valid).assertTrue();
        expect(url.withGoods(ids[index])).assertEqual(pages[index] + '?id=' + ids[index].toString());
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0640
     * @tc.name      navigation_parse_truncates_and_trims_id_text_064
     * @tc.desc      Verify navigation parse truncates and trims id text.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_truncates_and_trims_id_text_064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_truncates_and_trims_id_text_064');
      let texts: string[] = ['DetailPage?id=1.5', 'DetailPage?id=+12', 'DetailPage?id= 42',
        'DetailPage?id=42 ', 'DetailPage?id=\t6'];
      // parseInt stops at the '.', accepts a leading '+', and skips the spaces
      // around the number, giving 1, 12, 42, 42 and 6.
      let ids: number[] = [1, 12, 42, 42, 6];
      expect(texts.length).assertEqual(ids.length);
      for (let index: number = 0; index < texts.length; index++) {
        let url: ShopUrl = ShopUrl.parse(texts[index]);
        expect(url.page).assertEqual('DetailPage');
        expect(url.goodsId).assertEqual(ids[index]);
        expect(url.valid).assertTrue();
        expect(url.withGoods(ids[index])).assertEqual('DetailPage?id=' + ids[index].toString());
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0650
     * @tc.name      navigation_parse_later_id_segments_follow_the_last_valid_value_065
     * @tc.desc      Verify navigation parse later id segments follow the last valid value.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_parse_later_id_segments_follow_the_last_valid_value_065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_parse_later_id_segments_follow_the_last_valid_value_065');
      let texts: string[] = ['DetailPage?id=1&id=2&id=3', 'DetailPage?id=5&id=abc',
        'DetailPage?id=1e3', 'DetailPage?id=0o10', 'DetailPage?id=5&id'];
      // A later segment overwrites only when it parses: the triple id list ends
      // at 3, 'id=abc' leaves 5 intact, and '1e3' contributes just 1.
      let ids: number[] = [3, 5, 1, 0, 5];
      expect(texts.length).assertEqual(ids.length);
      for (let index: number = 0; index < texts.length; index++) {
        let url: ShopUrl = ShopUrl.parse(texts[index]);
        expect(url.page).assertEqual('DetailPage');
        expect(url.goodsId).assertEqual(ids[index]);
        expect(url.valid).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0660
     * @tc.name      navigation_resolve_keeps_fractional_widths_inside_the_lower_bucket_066
     * @tc.desc      Verify navigation resolve keeps fractional widths inside the lower bucket.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_resolve_keeps_fractional_widths_inside_the_lower_bucket_066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_resolve_keeps_fractional_widths_inside_the_lower_bucket_066');
      let widths: number[] = [519.5, 519.999, 520.5, 839.5];
      let buckets: string[] = ['sm', 'sm', 'md', 'md'];
      let columns: number[] = [1, 1, 2, 2];
      expect(widths.length).assertEqual(buckets.length);
      for (let index: number = 0; index < widths.length; index++) {
        let bucket: string = BreakpointUtil.resolve(widths[index]);
        expect(bucket).assertEqual(buckets[index]);
        expect(BreakpointUtil.columns(bucket)).assertEqual(columns[index]);
        expect(BreakpointUtil.swiperDisplay(bucket)).assertEqual(columns[index]);
      }
    });

    /**
     * @tc.number    SUB_SAMPLE_ORANGE_SHOPPING_NAVIGATION_MODEL_0670
     * @tc.name      navigation_swiper_display_follows_the_bucket_width_067
     * @tc.desc      Verify navigation swiper display follows the bucket width.
     * @tc.size      MEDIUM
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('navigation_swiper_display_follows_the_bucket_width_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: navigation_swiper_display_follows_the_bucket_width_067');
      let buckets: string[] = [BreakpointUtil.SMALL, BreakpointUtil.MEDIUM, BreakpointUtil.LARGE];
      let literals: string[] = ['sm', 'md', 'lg'];
      let displays: number[] = [1, 2, 3];
      expect(buckets.length).assertEqual(displays.length);
      for (let index: number = 0; index < buckets.length; index++) {
        expect(BreakpointUtil.swiperDisplay(buckets[index])).assertEqual(displays[index]);
        expect(BreakpointUtil.swiperDisplay(literals[index])).assertEqual(displays[index]);
        expect(BreakpointUtil.swiperDisplay(literals[index])).assertEqual(BreakpointUtil.columns(literals[index]));
      }
    });

  });
}
