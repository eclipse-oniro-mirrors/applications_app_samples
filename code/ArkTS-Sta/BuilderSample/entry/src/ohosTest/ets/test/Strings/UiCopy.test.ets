'use static';

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
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import {
  PLACEHOLDER_DEFAULT, PLACEHOLDER_UPDATED, TEXT_DEFAULT, HEADER_TITLE,
  HEADER_SUBTITLE, INPUT_LABEL, FOOTER_COPY, UPDATE_LABEL, logSuite
} from '../Shared/Copy';
import { codePointLength, utf8Length, countSurrogateHigh, hasSurrogatePair, countOf } from '../Shared/ColorMath';

export default function UiCopyTest(): void {
  describe('UiCopyTest', () => {
    beforeAll(() => {
      logSuite('UiCopyTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('UiCopyTest', 'end');
    });

    /**
     * @tc.name UiCopyTest_case_001
     * @tc.desc ui-copy: PlaceholderDefault literal shape, variant 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_001', 0, () => {
      const value: string = PLACEHOLDER_DEFAULT;
      expect(value).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(value.length).assertEqual(12);
      expect(codePointLength(value)).assertEqual(12);
      expect(utf8Length(value)).assertEqual(30);
      expect(countSurrogateHigh(value)).assertEqual(0);
      expect(hasSurrogatePair(value)).assertEqual(false);
      expect(value.length >= codePointLength(value)).assertTrue();
      expect(utf8Length(value) >= value.length).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_002
     * @tc.desc ui-copy: PlaceholderDefault literal shape, variant 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_002', 0, () => {
      const value: string = PLACEHOLDER_DEFAULT;
      expect(value).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(value.length).assertEqual(12);
      expect(value.substring(0, 1)).assertEqual('\u8BF7');
      expect(value.substring(0, 1)).assertEqual('\u8BF7');
      expect(value.substring(11)).assertEqual('\u002E');
      expect(value.startsWith('\u8BF7')).assertTrue();
      expect(value.endsWith('\u002E')).assertTrue();
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, 3)).assertEqual('\u8BF7\u8F93\u5165');
      expect(countOf(value, '\u8BF7') >= 1).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_003
     * @tc.desc ui-copy: PlaceholderDefault literal shape, variant 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_003', 0, () => {
      const value: string = PLACEHOLDER_DEFAULT;
      expect(value).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(value.length).assertEqual(12);
      expect(value.trim()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(value.trim().length).assertEqual(12);
      expect(value.toUpperCase()).assertEqual('\u8BF7\u8F93\u5165\u4F60\u7684\u65B0\u5E74\u613F\u671B\u002E\u002E\u002E');
      expect(value.toLowerCase()).assertEqual('\u8BF7\u8F93\u5165\u4F60\u7684\u65B0\u5E74\u613F\u671B\u002E\u002E\u002E');
      expect(('[' + value + ']').length).assertEqual(14);
      expect(('[' + value + ']').indexOf(value)).assertEqual(1);
      expect(value !== '').assertTrue();
      expect(0 === 0).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_004
     * @tc.desc ui-copy: PlaceholderUpdated literal shape, variant 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_004', 0, () => {
      const value: string = PLACEHOLDER_UPDATED;
      expect(value).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(value.length).assertEqual(5);
      expect(codePointLength(value)).assertEqual(5);
      expect(utf8Length(value)).assertEqual(13);
      expect(countSurrogateHigh(value)).assertEqual(0);
      expect(hasSurrogatePair(value)).assertEqual(false);
      expect(value.length >= codePointLength(value)).assertTrue();
      expect(utf8Length(value) >= value.length).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_005
     * @tc.desc ui-copy: PlaceholderUpdated literal shape, variant 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_005', 0, () => {
      const value: string = PLACEHOLDER_UPDATED;
      expect(value).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(value.length).assertEqual(5);
      expect(value.substring(0, 1)).assertEqual('\u65B0');
      expect(value.substring(0, 1)).assertEqual('\u65B0');
      expect(value.substring(4)).assertEqual('\u0021');
      expect(value.startsWith('\u65B0')).assertTrue();
      expect(value.endsWith('\u0021')).assertTrue();
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, 3)).assertEqual('\u65B0\u5E74\u5FEB');
      expect(countOf(value, '\u65B0') >= 1).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_006
     * @tc.desc ui-copy: PlaceholderUpdated literal shape, variant 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_006', 0, () => {
      const value: string = PLACEHOLDER_UPDATED;
      expect(value).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(value.length).assertEqual(5);
      expect(value.trim()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(value.trim().length).assertEqual(5);
      expect(value.toUpperCase()).assertEqual('\u65B0\u5E74\u5FEB\u4E50\u0021');
      expect(value.toLowerCase()).assertEqual('\u65B0\u5E74\u5FEB\u4E50\u0021');
      expect(('[' + value + ']').length).assertEqual(7);
      expect(('[' + value + ']').indexOf(value)).assertEqual(1);
      expect(value !== '').assertTrue();
      expect(0 === 0).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_007
     * @tc.desc ui-copy: TextDefault literal shape, variant 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_007', 0, () => {
      const value: string = TEXT_DEFAULT;
      expect(value).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(value.length).assertEqual(12);
      expect(codePointLength(value)).assertEqual(12);
      expect(utf8Length(value)).assertEqual(28);
      expect(countSurrogateHigh(value)).assertEqual(0);
      expect(hasSurrogatePair(value)).assertEqual(false);
      expect(value.length >= codePointLength(value)).assertTrue();
      expect(utf8Length(value) >= value.length).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_008
     * @tc.desc ui-copy: TextDefault literal shape, variant 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_008', 0, () => {
      const value: string = TEXT_DEFAULT;
      expect(value).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(value.length).assertEqual(12);
      expect(value.substring(0, 1)).assertEqual('\u0022');
      expect(value.substring(0, 1)).assertEqual('\u0022');
      expect(value.substring(11)).assertEqual('\u0022');
      expect(value.startsWith('\u0022')).assertTrue();
      expect(value.endsWith('\u0022')).assertTrue();
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, 3)).assertEqual('\u0022\u270D\uFE0F');
      expect(countOf(value, '\u0022') >= 1).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_009
     * @tc.desc ui-copy: TextDefault literal shape, variant 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_009', 0, () => {
      const value: string = TEXT_DEFAULT;
      expect(value).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(value.length).assertEqual(12);
      expect(value.trim()).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(value.trim().length).assertEqual(12);
      expect(value.toUpperCase()).assertEqual('\u0022\u270D\uFE0F\u0020\u5199\u4E0B\u4F60\u7684\u613F\u671B\u003A\u0022');
      expect(value.toLowerCase()).assertEqual('\u0022\u270D\uFE0F\u0020\u5199\u4E0B\u4F60\u7684\u613F\u671B\u003A\u0022');
      expect(('[' + value + ']').length).assertEqual(14);
      expect(('[' + value + ']').indexOf(value)).assertEqual(1);
      expect(value !== '').assertTrue();
      expect(0 === 0).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_010
     * @tc.desc ui-copy: HeaderTitle literal shape, variant 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_010', 0, () => {
      const value: string = HEADER_TITLE;
      expect(value).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(value.length).assertEqual(9);
      expect(codePointLength(value)).assertEqual(8);
      expect(utf8Length(value)).assertEqual(23);
      expect(countSurrogateHigh(value)).assertEqual(1);
      expect(hasSurrogatePair(value)).assertEqual(true);
      expect(value.length >= codePointLength(value)).assertTrue();
      expect(utf8Length(value) >= value.length).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_011
     * @tc.desc ui-copy: HeaderTitle literal shape, variant 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_011', 0, () => {
      const value: string = HEADER_TITLE;
      expect(value).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(value.length).assertEqual(9);
      expect(value.substring(0, 2)).assertEqual('\uD83C\uDF88');
      expect(value.substring(0, 1)).assertEqual('\uD83C');
      expect(value.substring(8)).assertEqual('\u5199');
      expect(value.startsWith('\uD83C\uDF88')).assertTrue();
      expect(value.endsWith('\u5199')).assertTrue();
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, 3)).assertEqual('\uD83C\uDF88\u0020');
      expect(countOf(value, '\uD83C\uDF88') >= 1).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_012
     * @tc.desc ui-copy: HeaderTitle literal shape, variant 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_012', 0, () => {
      const value: string = HEADER_TITLE;
      expect(value).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(value.length).assertEqual(9);
      expect(value.trim()).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(value.trim().length).assertEqual(9);
      expect(value.toUpperCase()).assertEqual('\uD83C\uDF88\u0020\u65B0\u5E74\u613F\u671B\u586B\u5199');
      expect(value.toLowerCase()).assertEqual('\uD83C\uDF88\u0020\u65B0\u5E74\u613F\u671B\u586B\u5199');
      expect(('[' + value + ']').length).assertEqual(11);
      expect(('[' + value + ']').indexOf(value)).assertEqual(1);
      expect(value !== '').assertTrue();
      expect(0 === 0).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_013
     * @tc.desc ui-copy: HeaderSubtitle literal shape, variant 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_013', 0, () => {
      const value: string = HEADER_SUBTITLE;
      expect(value).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(value.length).assertEqual(16);
      expect(codePointLength(value)).assertEqual(16);
      expect(utf8Length(value)).assertEqual(48);
      expect(countSurrogateHigh(value)).assertEqual(0);
      expect(hasSurrogatePair(value)).assertEqual(false);
      expect(value.length >= codePointLength(value)).assertTrue();
      expect(utf8Length(value) >= value.length).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_014
     * @tc.desc ui-copy: HeaderSubtitle literal shape, variant 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_014', 0, () => {
      const value: string = HEADER_SUBTITLE;
      expect(value).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(value.length).assertEqual(16);
      expect(value.substring(0, 1)).assertEqual('\u628A');
      expect(value.substring(0, 1)).assertEqual('\u628A');
      expect(value.substring(15)).assertEqual('\uFF5E');
      expect(value.startsWith('\u628A')).assertTrue();
      expect(value.endsWith('\uFF5E')).assertTrue();
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, 3)).assertEqual('\u628A\u5FC3\u613F');
      expect(countOf(value, '\u628A') >= 1).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_015
     * @tc.desc ui-copy: HeaderSubtitle literal shape, variant 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_015', 0, () => {
      const value: string = HEADER_SUBTITLE;
      expect(value).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(value.length).assertEqual(16);
      expect(value.trim()).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(value.trim().length).assertEqual(16);
      expect(value.toUpperCase()).assertEqual('\u628A\u5FC3\u613F\u5199\u4E0B\u6765\uFF0C\u65B0\u7684\u4E00\u5E74\u90FD\u4F1A\u5B9E\u73B0\uFF5E');
      expect(value.toLowerCase()).assertEqual('\u628A\u5FC3\u613F\u5199\u4E0B\u6765\uFF0C\u65B0\u7684\u4E00\u5E74\u90FD\u4F1A\u5B9E\u73B0\uFF5E');
      expect(('[' + value + ']').length).assertEqual(18);
      expect(('[' + value + ']').indexOf(value)).assertEqual(1);
      expect(value !== '').assertTrue();
      expect(0 === 0).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_016
     * @tc.desc ui-copy: InputLabel literal shape, variant 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_016', 0, () => {
      const value: string = INPUT_LABEL;
      expect(value).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(value.length).assertEqual(10);
      expect(codePointLength(value)).assertEqual(9);
      expect(utf8Length(value)).assertEqual(24);
      expect(countSurrogateHigh(value)).assertEqual(1);
      expect(hasSurrogatePair(value)).assertEqual(true);
      expect(value.length >= codePointLength(value)).assertTrue();
      expect(utf8Length(value) >= value.length).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_017
     * @tc.desc ui-copy: InputLabel literal shape, variant 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_017', 0, () => {
      const value: string = INPUT_LABEL;
      expect(value).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(value.length).assertEqual(10);
      expect(value.substring(0, 2)).assertEqual('\uD83D\uDCDD');
      expect(value.substring(0, 1)).assertEqual('\uD83D');
      expect(value.substring(9)).assertEqual('\u003A');
      expect(value.startsWith('\uD83D\uDCDD')).assertTrue();
      expect(value.endsWith('\u003A')).assertTrue();
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, 3)).assertEqual('\uD83D\uDCDD\u0020');
      expect(countOf(value, '\uD83D\uDCDD') >= 1).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_018
     * @tc.desc ui-copy: InputLabel literal shape, variant 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_018', 0, () => {
      const value: string = INPUT_LABEL;
      expect(value).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(value.length).assertEqual(10);
      expect(value.trim()).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(value.trim().length).assertEqual(10);
      expect(value.toUpperCase()).assertEqual('\uD83D\uDCDD\u0020\u4F60\u8F93\u5165\u7684\u5185\u5BB9\u003A');
      expect(value.toLowerCase()).assertEqual('\uD83D\uDCDD\u0020\u4F60\u8F93\u5165\u7684\u5185\u5BB9\u003A');
      expect(('[' + value + ']').length).assertEqual(12);
      expect(('[' + value + ']').indexOf(value)).assertEqual(1);
      expect(value !== '').assertTrue();
      expect(0 === 0).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_019
     * @tc.desc ui-copy: FooterCopy literal shape, variant 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_019', 0, () => {
      const value: string = FOOTER_COPY;
      expect(value).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(value.length).assertEqual(13);
      expect(codePointLength(value)).assertEqual(11);
      expect(utf8Length(value)).assertEqual(31);
      expect(countSurrogateHigh(value)).assertEqual(2);
      expect(hasSurrogatePair(value)).assertEqual(true);
      expect(value.length >= codePointLength(value)).assertTrue();
      expect(utf8Length(value) >= value.length).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_020
     * @tc.desc ui-copy: FooterCopy literal shape, variant 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_020', 0, () => {
      const value: string = FOOTER_COPY;
      expect(value).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(value.length).assertEqual(13);
      expect(value.substring(0, 2)).assertEqual('\uD83D\uDCAB');
      expect(value.substring(0, 1)).assertEqual('\uD83D');
      expect(value.substring(11)).assertEqual('\uD83D\uDCAB');
      expect(value.startsWith('\uD83D\uDCAB')).assertTrue();
      expect(value.endsWith('\uD83D\uDCAB')).assertTrue();
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, 3)).assertEqual('\uD83D\uDCAB\u0020');
      expect(countOf(value, '\uD83D\uDCAB') >= 1).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_021
     * @tc.desc ui-copy: FooterCopy literal shape, variant 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_021', 0, () => {
      const value: string = FOOTER_COPY;
      expect(value).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(value.length).assertEqual(13);
      expect(value.trim()).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(value.trim().length).assertEqual(13);
      expect(value.toUpperCase()).assertEqual('\uD83D\uDCAB\u0020\u613F\u65B0\u5E74\uFF0C\u80DC\u65E7\u5E74\u0020\uD83D\uDCAB');
      expect(value.toLowerCase()).assertEqual('\uD83D\uDCAB\u0020\u613F\u65B0\u5E74\uFF0C\u80DC\u65E7\u5E74\u0020\uD83D\uDCAB');
      expect(('[' + value + ']').length).assertEqual(15);
      expect(('[' + value + ']').indexOf(value)).assertEqual(1);
      expect(value !== '').assertTrue();
      expect(0 === 0).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_022
     * @tc.desc ui-copy: UpdateLabel literal shape, variant 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_022', 0, () => {
      const value: string = UPDATE_LABEL;
      expect(value).assertEqual('update');
      expect(value.length).assertEqual(6);
      expect(codePointLength(value)).assertEqual(6);
      expect(utf8Length(value)).assertEqual(6);
      expect(countSurrogateHigh(value)).assertEqual(0);
      expect(hasSurrogatePair(value)).assertEqual(false);
      expect(value.length >= codePointLength(value)).assertTrue();
      expect(utf8Length(value) >= value.length).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_023
     * @tc.desc ui-copy: UpdateLabel literal shape, variant 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_023', 0, () => {
      const value: string = UPDATE_LABEL;
      expect(value).assertEqual('update');
      expect(value.length).assertEqual(6);
      expect(value.substring(0, 1)).assertEqual('\u0075');
      expect(value.substring(0, 1)).assertEqual('\u0075');
      expect(value.substring(5)).assertEqual('\u0065');
      expect(value.startsWith('\u0075')).assertTrue();
      expect(value.endsWith('\u0065')).assertTrue();
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, 3)).assertEqual('\u0075\u0070\u0064');
      expect(countOf(value, '\u0075') >= 1).assertTrue();
    });

    /**
     * @tc.name UiCopyTest_case_024
     * @tc.desc ui-copy: UpdateLabel literal shape, variant 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UiCopyTest_case_024', 0, () => {
      const value: string = UPDATE_LABEL;
      expect(value).assertEqual('update');
      expect(value.length).assertEqual(6);
      expect(value.trim()).assertEqual('update');
      expect(value.trim().length).assertEqual(6);
      expect(value.toUpperCase()).assertEqual('\u0055\u0050\u0044\u0041\u0054\u0045');
      expect(value.toLowerCase()).assertEqual('\u0075\u0070\u0064\u0061\u0074\u0065');
      expect(('[' + value + ']').length).assertEqual(8);
      expect(('[' + value + ']').indexOf(value)).assertEqual(1);
      expect(value !== '').assertTrue();
      expect(0 === 0).assertTrue();
    });

  });
}
