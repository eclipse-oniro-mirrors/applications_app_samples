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
import { PLACEHOLDER_DEFAULT, PLACEHOLDER_UPDATED, TEXT_DEFAULT, HEADER_TITLE, HEADER_SUBTITLE, INPUT_LABEL, FOOTER_COPY, UPDATE_LABEL, logSuite } from '../Shared/Copy';
import { GetterSetterBinding } from '../Shared/BindingContract';
import { SIZES } from '../../../../main/ets/common/Contants';

export default function CrossChecksTest(): void {
  describe('CrossChecksTest', () => {
    beforeAll(() => {
      logSuite('CrossChecksTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CrossChecksTest', 'end');
    });

    /**
     * @tc.name CrossChecksTest_case_001
     * @tc.desc ui-copy-relation: placeholder vs updated lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_001', 0, () => {
      expect(PLACEHOLDER_DEFAULT === PLACEHOLDER_UPDATED).assertFalse();
      expect(PLACEHOLDER_DEFAULT).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(PLACEHOLDER_UPDATED).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(PLACEHOLDER_DEFAULT.length).assertEqual(12);
      expect(PLACEHOLDER_UPDATED.length).assertEqual(5);
      expect(PLACEHOLDER_DEFAULT.length + PLACEHOLDER_UPDATED.length).assertEqual(17);
      expect(Math.abs(PLACEHOLDER_DEFAULT.length - PLACEHOLDER_UPDATED.length)).assertEqual(7);
      expect(PLACEHOLDER_DEFAULT + PLACEHOLDER_UPDATED).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...\u65b0\u5e74\u5feb\u4e50!');
    });

    /**
     * @tc.name CrossChecksTest_case_002
     * @tc.desc ui-copy-relation: placeholder vs defaulttext lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_002', 0, () => {
      expect(PLACEHOLDER_DEFAULT === TEXT_DEFAULT).assertFalse();
      expect(PLACEHOLDER_DEFAULT).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(TEXT_DEFAULT).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(PLACEHOLDER_DEFAULT.length).assertEqual(12);
      expect(TEXT_DEFAULT.length).assertEqual(12);
      expect(PLACEHOLDER_DEFAULT.length + TEXT_DEFAULT.length).assertEqual(24);
      expect(Math.abs(PLACEHOLDER_DEFAULT.length - TEXT_DEFAULT.length)).assertEqual(0);
      expect(PLACEHOLDER_DEFAULT + TEXT_DEFAULT).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b..."\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
    });

    /**
     * @tc.name CrossChecksTest_case_003
     * @tc.desc ui-copy-relation: placeholder vs headertitle lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_003', 0, () => {
      expect(PLACEHOLDER_DEFAULT === HEADER_TITLE).assertFalse();
      expect(PLACEHOLDER_DEFAULT).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(HEADER_TITLE).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(PLACEHOLDER_DEFAULT.length).assertEqual(12);
      expect(HEADER_TITLE.length).assertEqual(9);
      expect(PLACEHOLDER_DEFAULT.length + HEADER_TITLE.length).assertEqual(21);
      expect(Math.abs(PLACEHOLDER_DEFAULT.length - HEADER_TITLE.length)).assertEqual(3);
      expect(PLACEHOLDER_DEFAULT + HEADER_TITLE).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
    });

    /**
     * @tc.name CrossChecksTest_case_004
     * @tc.desc ui-copy-relation: placeholder vs headersub lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_004', 0, () => {
      expect(PLACEHOLDER_DEFAULT === HEADER_SUBTITLE).assertFalse();
      expect(PLACEHOLDER_DEFAULT).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(HEADER_SUBTITLE).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(PLACEHOLDER_DEFAULT.length).assertEqual(12);
      expect(HEADER_SUBTITLE.length).assertEqual(16);
      expect(PLACEHOLDER_DEFAULT.length + HEADER_SUBTITLE.length).assertEqual(28);
      expect(Math.abs(PLACEHOLDER_DEFAULT.length - HEADER_SUBTITLE.length)).assertEqual(4);
      expect(PLACEHOLDER_DEFAULT + HEADER_SUBTITLE).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
    });

    /**
     * @tc.name CrossChecksTest_case_005
     * @tc.desc ui-copy-relation: placeholder vs inputlabel lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_005', 0, () => {
      expect(PLACEHOLDER_DEFAULT === INPUT_LABEL).assertFalse();
      expect(PLACEHOLDER_DEFAULT).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(INPUT_LABEL).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(PLACEHOLDER_DEFAULT.length).assertEqual(12);
      expect(INPUT_LABEL.length).assertEqual(10);
      expect(PLACEHOLDER_DEFAULT.length + INPUT_LABEL.length).assertEqual(22);
      expect(Math.abs(PLACEHOLDER_DEFAULT.length - INPUT_LABEL.length)).assertEqual(2);
      expect(PLACEHOLDER_DEFAULT + INPUT_LABEL).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
    });

    /**
     * @tc.name CrossChecksTest_case_006
     * @tc.desc ui-copy-relation: placeholder vs footer lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_006', 0, () => {
      expect(PLACEHOLDER_DEFAULT === FOOTER_COPY).assertFalse();
      expect(PLACEHOLDER_DEFAULT).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(FOOTER_COPY).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(PLACEHOLDER_DEFAULT.length).assertEqual(12);
      expect(FOOTER_COPY.length).assertEqual(13);
      expect(PLACEHOLDER_DEFAULT.length + FOOTER_COPY.length).assertEqual(25);
      expect(Math.abs(PLACEHOLDER_DEFAULT.length - FOOTER_COPY.length)).assertEqual(1);
      expect(PLACEHOLDER_DEFAULT + FOOTER_COPY).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
    });

    /**
     * @tc.name CrossChecksTest_case_007
     * @tc.desc ui-copy-relation: placeholder vs updatelabel lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_007', 0, () => {
      expect(PLACEHOLDER_DEFAULT === UPDATE_LABEL).assertFalse();
      expect(PLACEHOLDER_DEFAULT).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(UPDATE_LABEL).assertEqual('update');
      expect(PLACEHOLDER_DEFAULT.length).assertEqual(12);
      expect(UPDATE_LABEL.length).assertEqual(6);
      expect(PLACEHOLDER_DEFAULT.length + UPDATE_LABEL.length).assertEqual(18);
      expect(Math.abs(PLACEHOLDER_DEFAULT.length - UPDATE_LABEL.length)).assertEqual(6);
      expect(PLACEHOLDER_DEFAULT + UPDATE_LABEL).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...update');
    });

    /**
     * @tc.name CrossChecksTest_case_008
     * @tc.desc ui-copy-relation: updated vs defaulttext lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_008', 0, () => {
      expect(PLACEHOLDER_UPDATED === TEXT_DEFAULT).assertFalse();
      expect(PLACEHOLDER_UPDATED).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(TEXT_DEFAULT).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(PLACEHOLDER_UPDATED.length).assertEqual(5);
      expect(TEXT_DEFAULT.length).assertEqual(12);
      expect(PLACEHOLDER_UPDATED.length + TEXT_DEFAULT.length).assertEqual(17);
      expect(Math.abs(PLACEHOLDER_UPDATED.length - TEXT_DEFAULT.length)).assertEqual(7);
      expect(PLACEHOLDER_UPDATED + TEXT_DEFAULT).assertEqual('\u65b0\u5e74\u5feb\u4e50!"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
    });

    /**
     * @tc.name CrossChecksTest_case_009
     * @tc.desc ui-copy-relation: updated vs headertitle lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_009', 0, () => {
      expect(PLACEHOLDER_UPDATED === HEADER_TITLE).assertFalse();
      expect(PLACEHOLDER_UPDATED).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(HEADER_TITLE).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(PLACEHOLDER_UPDATED.length).assertEqual(5);
      expect(HEADER_TITLE.length).assertEqual(9);
      expect(PLACEHOLDER_UPDATED.length + HEADER_TITLE.length).assertEqual(14);
      expect(Math.abs(PLACEHOLDER_UPDATED.length - HEADER_TITLE.length)).assertEqual(4);
      expect(PLACEHOLDER_UPDATED + HEADER_TITLE).assertEqual('\u65b0\u5e74\u5feb\u4e50!\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
    });

    /**
     * @tc.name CrossChecksTest_case_010
     * @tc.desc ui-copy-relation: updated vs headersub lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_010', 0, () => {
      expect(PLACEHOLDER_UPDATED === HEADER_SUBTITLE).assertFalse();
      expect(PLACEHOLDER_UPDATED).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(HEADER_SUBTITLE).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(PLACEHOLDER_UPDATED.length).assertEqual(5);
      expect(HEADER_SUBTITLE.length).assertEqual(16);
      expect(PLACEHOLDER_UPDATED.length + HEADER_SUBTITLE.length).assertEqual(21);
      expect(Math.abs(PLACEHOLDER_UPDATED.length - HEADER_SUBTITLE.length)).assertEqual(11);
      expect(PLACEHOLDER_UPDATED + HEADER_SUBTITLE).assertEqual('\u65b0\u5e74\u5feb\u4e50!\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
    });

    /**
     * @tc.name CrossChecksTest_case_011
     * @tc.desc ui-copy-relation: updated vs inputlabel lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_011', 0, () => {
      expect(PLACEHOLDER_UPDATED === INPUT_LABEL).assertFalse();
      expect(PLACEHOLDER_UPDATED).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(INPUT_LABEL).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(PLACEHOLDER_UPDATED.length).assertEqual(5);
      expect(INPUT_LABEL.length).assertEqual(10);
      expect(PLACEHOLDER_UPDATED.length + INPUT_LABEL.length).assertEqual(15);
      expect(Math.abs(PLACEHOLDER_UPDATED.length - INPUT_LABEL.length)).assertEqual(5);
      expect(PLACEHOLDER_UPDATED + INPUT_LABEL).assertEqual('\u65b0\u5e74\u5feb\u4e50!\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
    });

    /**
     * @tc.name CrossChecksTest_case_012
     * @tc.desc ui-copy-relation: updated vs footer lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_012', 0, () => {
      expect(PLACEHOLDER_UPDATED === FOOTER_COPY).assertFalse();
      expect(PLACEHOLDER_UPDATED).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(FOOTER_COPY).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(PLACEHOLDER_UPDATED.length).assertEqual(5);
      expect(FOOTER_COPY.length).assertEqual(13);
      expect(PLACEHOLDER_UPDATED.length + FOOTER_COPY.length).assertEqual(18);
      expect(Math.abs(PLACEHOLDER_UPDATED.length - FOOTER_COPY.length)).assertEqual(8);
      expect(PLACEHOLDER_UPDATED + FOOTER_COPY).assertEqual('\u65b0\u5e74\u5feb\u4e50!\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
    });

    /**
     * @tc.name CrossChecksTest_case_013
     * @tc.desc ui-copy-relation: updated vs updatelabel lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_013', 0, () => {
      expect(PLACEHOLDER_UPDATED === UPDATE_LABEL).assertFalse();
      expect(PLACEHOLDER_UPDATED).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(UPDATE_LABEL).assertEqual('update');
      expect(PLACEHOLDER_UPDATED.length).assertEqual(5);
      expect(UPDATE_LABEL.length).assertEqual(6);
      expect(PLACEHOLDER_UPDATED.length + UPDATE_LABEL.length).assertEqual(11);
      expect(Math.abs(PLACEHOLDER_UPDATED.length - UPDATE_LABEL.length)).assertEqual(1);
      expect(PLACEHOLDER_UPDATED + UPDATE_LABEL).assertEqual('\u65b0\u5e74\u5feb\u4e50!update');
    });

    /**
     * @tc.name CrossChecksTest_case_014
     * @tc.desc ui-copy-relation: defaulttext vs headertitle lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_014', 0, () => {
      expect(TEXT_DEFAULT === HEADER_TITLE).assertFalse();
      expect(TEXT_DEFAULT).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(HEADER_TITLE).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(TEXT_DEFAULT.length).assertEqual(12);
      expect(HEADER_TITLE.length).assertEqual(9);
      expect(TEXT_DEFAULT.length + HEADER_TITLE.length).assertEqual(21);
      expect(Math.abs(TEXT_DEFAULT.length - HEADER_TITLE.length)).assertEqual(3);
      expect(TEXT_DEFAULT + HEADER_TITLE).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
    });

    /**
     * @tc.name CrossChecksTest_case_015
     * @tc.desc ui-copy-relation: defaulttext vs headersub lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_015', 0, () => {
      expect(TEXT_DEFAULT === HEADER_SUBTITLE).assertFalse();
      expect(TEXT_DEFAULT).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(HEADER_SUBTITLE).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(TEXT_DEFAULT.length).assertEqual(12);
      expect(HEADER_SUBTITLE.length).assertEqual(16);
      expect(TEXT_DEFAULT.length + HEADER_SUBTITLE.length).assertEqual(28);
      expect(Math.abs(TEXT_DEFAULT.length - HEADER_SUBTITLE.length)).assertEqual(4);
      expect(TEXT_DEFAULT + HEADER_SUBTITLE).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
    });

    /**
     * @tc.name CrossChecksTest_case_016
     * @tc.desc ui-copy-relation: defaulttext vs inputlabel lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_016', 0, () => {
      expect(TEXT_DEFAULT === INPUT_LABEL).assertFalse();
      expect(TEXT_DEFAULT).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(INPUT_LABEL).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(TEXT_DEFAULT.length).assertEqual(12);
      expect(INPUT_LABEL.length).assertEqual(10);
      expect(TEXT_DEFAULT.length + INPUT_LABEL.length).assertEqual(22);
      expect(Math.abs(TEXT_DEFAULT.length - INPUT_LABEL.length)).assertEqual(2);
      expect(TEXT_DEFAULT + INPUT_LABEL).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
    });

    /**
     * @tc.name CrossChecksTest_case_017
     * @tc.desc ui-copy-relation: defaulttext vs footer lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_017', 0, () => {
      expect(TEXT_DEFAULT === FOOTER_COPY).assertFalse();
      expect(TEXT_DEFAULT).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(FOOTER_COPY).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(TEXT_DEFAULT.length).assertEqual(12);
      expect(FOOTER_COPY.length).assertEqual(13);
      expect(TEXT_DEFAULT.length + FOOTER_COPY.length).assertEqual(25);
      expect(Math.abs(TEXT_DEFAULT.length - FOOTER_COPY.length)).assertEqual(1);
      expect(TEXT_DEFAULT + FOOTER_COPY).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
    });

    /**
     * @tc.name CrossChecksTest_case_018
     * @tc.desc ui-copy-relation: defaulttext vs updatelabel lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_018', 0, () => {
      expect(TEXT_DEFAULT === UPDATE_LABEL).assertFalse();
      expect(TEXT_DEFAULT).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(UPDATE_LABEL).assertEqual('update');
      expect(TEXT_DEFAULT.length).assertEqual(12);
      expect(UPDATE_LABEL.length).assertEqual(6);
      expect(TEXT_DEFAULT.length + UPDATE_LABEL.length).assertEqual(18);
      expect(Math.abs(TEXT_DEFAULT.length - UPDATE_LABEL.length)).assertEqual(6);
      expect(TEXT_DEFAULT + UPDATE_LABEL).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"update');
    });

    /**
     * @tc.name CrossChecksTest_case_019
     * @tc.desc ui-copy-relation: headertitle vs headersub lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_019', 0, () => {
      expect(HEADER_TITLE === HEADER_SUBTITLE).assertFalse();
      expect(HEADER_TITLE).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(HEADER_SUBTITLE).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(HEADER_TITLE.length).assertEqual(9);
      expect(HEADER_SUBTITLE.length).assertEqual(16);
      expect(HEADER_TITLE.length + HEADER_SUBTITLE.length).assertEqual(25);
      expect(Math.abs(HEADER_TITLE.length - HEADER_SUBTITLE.length)).assertEqual(7);
      expect(HEADER_TITLE + HEADER_SUBTITLE).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
    });

    /**
     * @tc.name CrossChecksTest_case_020
     * @tc.desc ui-copy-relation: headertitle vs inputlabel lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_020', 0, () => {
      expect(HEADER_TITLE === INPUT_LABEL).assertFalse();
      expect(HEADER_TITLE).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(INPUT_LABEL).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(HEADER_TITLE.length).assertEqual(9);
      expect(INPUT_LABEL.length).assertEqual(10);
      expect(HEADER_TITLE.length + INPUT_LABEL.length).assertEqual(19);
      expect(Math.abs(HEADER_TITLE.length - INPUT_LABEL.length)).assertEqual(1);
      expect(HEADER_TITLE + INPUT_LABEL).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
    });

    /**
     * @tc.name CrossChecksTest_case_021
     * @tc.desc ui-copy-relation: headertitle vs footer lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_021', 0, () => {
      expect(HEADER_TITLE === FOOTER_COPY).assertFalse();
      expect(HEADER_TITLE).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(FOOTER_COPY).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(HEADER_TITLE.length).assertEqual(9);
      expect(FOOTER_COPY.length).assertEqual(13);
      expect(HEADER_TITLE.length + FOOTER_COPY.length).assertEqual(22);
      expect(Math.abs(HEADER_TITLE.length - FOOTER_COPY.length)).assertEqual(4);
      expect(HEADER_TITLE + FOOTER_COPY).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
    });

    /**
     * @tc.name CrossChecksTest_case_022
     * @tc.desc ui-copy-relation: headertitle vs updatelabel lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_022', 0, () => {
      expect(HEADER_TITLE === UPDATE_LABEL).assertFalse();
      expect(HEADER_TITLE).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(UPDATE_LABEL).assertEqual('update');
      expect(HEADER_TITLE.length).assertEqual(9);
      expect(UPDATE_LABEL.length).assertEqual(6);
      expect(HEADER_TITLE.length + UPDATE_LABEL.length).assertEqual(15);
      expect(Math.abs(HEADER_TITLE.length - UPDATE_LABEL.length)).assertEqual(3);
      expect(HEADER_TITLE + UPDATE_LABEL).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199update');
    });

    /**
     * @tc.name CrossChecksTest_case_023
     * @tc.desc ui-copy-relation: headersub vs inputlabel lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_023', 0, () => {
      expect(HEADER_SUBTITLE === INPUT_LABEL).assertFalse();
      expect(HEADER_SUBTITLE).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(INPUT_LABEL).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(HEADER_SUBTITLE.length).assertEqual(16);
      expect(INPUT_LABEL.length).assertEqual(10);
      expect(HEADER_SUBTITLE.length + INPUT_LABEL.length).assertEqual(26);
      expect(Math.abs(HEADER_SUBTITLE.length - INPUT_LABEL.length)).assertEqual(6);
      expect(HEADER_SUBTITLE + INPUT_LABEL).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
    });

    /**
     * @tc.name CrossChecksTest_case_024
     * @tc.desc ui-copy-relation: headersub vs footer lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_024', 0, () => {
      expect(HEADER_SUBTITLE === FOOTER_COPY).assertFalse();
      expect(HEADER_SUBTITLE).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(FOOTER_COPY).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(HEADER_SUBTITLE.length).assertEqual(16);
      expect(FOOTER_COPY.length).assertEqual(13);
      expect(HEADER_SUBTITLE.length + FOOTER_COPY.length).assertEqual(29);
      expect(Math.abs(HEADER_SUBTITLE.length - FOOTER_COPY.length)).assertEqual(3);
      expect(HEADER_SUBTITLE + FOOTER_COPY).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
    });

    /**
     * @tc.name CrossChecksTest_case_025
     * @tc.desc ui-copy-relation: headersub vs updatelabel lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_025', 0, () => {
      expect(HEADER_SUBTITLE === UPDATE_LABEL).assertFalse();
      expect(HEADER_SUBTITLE).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(UPDATE_LABEL).assertEqual('update');
      expect(HEADER_SUBTITLE.length).assertEqual(16);
      expect(UPDATE_LABEL.length).assertEqual(6);
      expect(HEADER_SUBTITLE.length + UPDATE_LABEL.length).assertEqual(22);
      expect(Math.abs(HEADER_SUBTITLE.length - UPDATE_LABEL.length)).assertEqual(10);
      expect(HEADER_SUBTITLE + UPDATE_LABEL).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5eupdate');
    });

    /**
     * @tc.name CrossChecksTest_case_026
     * @tc.desc ui-copy-relation: inputlabel vs footer lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_026', 0, () => {
      expect(INPUT_LABEL === FOOTER_COPY).assertFalse();
      expect(INPUT_LABEL).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(FOOTER_COPY).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(INPUT_LABEL.length).assertEqual(10);
      expect(FOOTER_COPY.length).assertEqual(13);
      expect(INPUT_LABEL.length + FOOTER_COPY.length).assertEqual(23);
      expect(Math.abs(INPUT_LABEL.length - FOOTER_COPY.length)).assertEqual(3);
      expect(INPUT_LABEL + FOOTER_COPY).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
    });

    /**
     * @tc.name CrossChecksTest_case_027
     * @tc.desc ui-copy-relation: inputlabel vs updatelabel lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_027', 0, () => {
      expect(INPUT_LABEL === UPDATE_LABEL).assertFalse();
      expect(INPUT_LABEL).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(UPDATE_LABEL).assertEqual('update');
      expect(INPUT_LABEL.length).assertEqual(10);
      expect(UPDATE_LABEL.length).assertEqual(6);
      expect(INPUT_LABEL.length + UPDATE_LABEL.length).assertEqual(16);
      expect(Math.abs(INPUT_LABEL.length - UPDATE_LABEL.length)).assertEqual(4);
      expect(INPUT_LABEL + UPDATE_LABEL).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:update');
    });

    /**
     * @tc.name CrossChecksTest_case_028
     * @tc.desc ui-copy-relation: footer vs updatelabel lengths and distinctness.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_028', 0, () => {
      expect(FOOTER_COPY === UPDATE_LABEL).assertFalse();
      expect(FOOTER_COPY).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(UPDATE_LABEL).assertEqual('update');
      expect(FOOTER_COPY.length).assertEqual(13);
      expect(UPDATE_LABEL.length).assertEqual(6);
      expect(FOOTER_COPY.length + UPDATE_LABEL.length).assertEqual(19);
      expect(Math.abs(FOOTER_COPY.length - UPDATE_LABEL.length)).assertEqual(7);
      expect(FOOTER_COPY + UPDATE_LABEL).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcabupdate');
    });

    /**
     * @tc.name CrossChecksTest_case_029
     * @tc.desc ui-copy-relation: placeholder unicode and whitespace shape is stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_029', 0, () => {
      const value: string = PLACEHOLDER_DEFAULT;
      expect(value.length).assertEqual(12);
      expect(value.trim()).assertEqual(value);
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, value.length)).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(value.concat(value).length).assertEqual(value.length * 2);
      expect(value.charCodeAt(0) > 0).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_030
     * @tc.desc ui-copy-relation: updated unicode and whitespace shape is stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_030', 0, () => {
      const value: string = PLACEHOLDER_UPDATED;
      expect(value.length).assertEqual(5);
      expect(value.trim()).assertEqual(value);
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, value.length)).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(value.concat(value).length).assertEqual(value.length * 2);
      expect(value.charCodeAt(0) > 0).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_031
     * @tc.desc ui-copy-relation: defaulttext unicode and whitespace shape is stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_031', 0, () => {
      const value: string = TEXT_DEFAULT;
      expect(value.length).assertEqual(12);
      expect(value.trim()).assertEqual(value);
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, value.length)).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(value.concat(value).length).assertEqual(value.length * 2);
      expect(value.charCodeAt(0) > 0).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_032
     * @tc.desc ui-copy-relation: headertitle unicode and whitespace shape is stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_032', 0, () => {
      const value: string = HEADER_TITLE;
      expect(value.length).assertEqual(9);
      expect(value.trim()).assertEqual(value);
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, value.length)).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(value.concat(value).length).assertEqual(value.length * 2);
      expect(value.charCodeAt(0) > 0).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_033
     * @tc.desc ui-copy-relation: headersub unicode and whitespace shape is stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_033', 0, () => {
      const value: string = HEADER_SUBTITLE;
      expect(value.length).assertEqual(16);
      expect(value.trim()).assertEqual(value);
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, value.length)).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(value.concat(value).length).assertEqual(value.length * 2);
      expect(value.charCodeAt(0) > 0).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_034
     * @tc.desc ui-copy-relation: inputlabel unicode and whitespace shape is stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_034', 0, () => {
      const value: string = INPUT_LABEL;
      expect(value.length).assertEqual(10);
      expect(value.trim()).assertEqual(value);
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, value.length)).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(value.concat(value).length).assertEqual(value.length * 2);
      expect(value.charCodeAt(0) > 0).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_035
     * @tc.desc ui-copy-relation: footer unicode and whitespace shape is stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_035', 0, () => {
      const value: string = FOOTER_COPY;
      expect(value.length).assertEqual(13);
      expect(value.trim()).assertEqual(value);
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, value.length)).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(value.concat(value).length).assertEqual(value.length * 2);
      expect(value.charCodeAt(0) > 0).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_036
     * @tc.desc ui-copy-relation: updatelabel unicode and whitespace shape is stable.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_036', 0, () => {
      const value: string = UPDATE_LABEL;
      expect(value.length).assertEqual(6);
      expect(value.trim()).assertEqual(value);
      expect(value.indexOf(value)).assertEqual(0);
      expect(value.substring(0, value.length)).assertEqual('update');
      expect(value.concat(value).length).assertEqual(value.length * 2);
      expect(value.charCodeAt(0) > 0).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_037
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_037', 0, () => {
      let left: string = 'L1';
      let right: string = 'R1';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L1X');
      expect(left).assertEqual('L1X');
      expect(right).assertEqual('R1');
      rightBinding.write('R1X');
      expect(left).assertEqual('L1X');
      expect(right).assertEqual('R1X');
      expect(leftBinding.read()).assertEqual('L1X');
      expect(rightBinding.read()).assertEqual('R1X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_038
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_038', 0, () => {
      let left: string = 'L2';
      let right: string = 'R2';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L2X');
      expect(left).assertEqual('L2X');
      expect(right).assertEqual('R2');
      rightBinding.write('R2X');
      expect(left).assertEqual('L2X');
      expect(right).assertEqual('R2X');
      expect(leftBinding.read()).assertEqual('L2X');
      expect(rightBinding.read()).assertEqual('R2X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_039
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_039', 0, () => {
      let left: string = 'L3';
      let right: string = 'R3';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L3X');
      expect(left).assertEqual('L3X');
      expect(right).assertEqual('R3');
      rightBinding.write('R3X');
      expect(left).assertEqual('L3X');
      expect(right).assertEqual('R3X');
      expect(leftBinding.read()).assertEqual('L3X');
      expect(rightBinding.read()).assertEqual('R3X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_040
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_040', 0, () => {
      let left: string = 'L4';
      let right: string = 'R4';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L4X');
      expect(left).assertEqual('L4X');
      expect(right).assertEqual('R4');
      rightBinding.write('R4X');
      expect(left).assertEqual('L4X');
      expect(right).assertEqual('R4X');
      expect(leftBinding.read()).assertEqual('L4X');
      expect(rightBinding.read()).assertEqual('R4X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_041
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_041', 0, () => {
      let left: string = 'L5';
      let right: string = 'R5';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L5X');
      expect(left).assertEqual('L5X');
      expect(right).assertEqual('R5');
      rightBinding.write('R5X');
      expect(left).assertEqual('L5X');
      expect(right).assertEqual('R5X');
      expect(leftBinding.read()).assertEqual('L5X');
      expect(rightBinding.read()).assertEqual('R5X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_042
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_042', 0, () => {
      let left: string = 'L6';
      let right: string = 'R6';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L6X');
      expect(left).assertEqual('L6X');
      expect(right).assertEqual('R6');
      rightBinding.write('R6X');
      expect(left).assertEqual('L6X');
      expect(right).assertEqual('R6X');
      expect(leftBinding.read()).assertEqual('L6X');
      expect(rightBinding.read()).assertEqual('R6X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_043
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_043', 0, () => {
      let left: string = 'L7';
      let right: string = 'R7';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L7X');
      expect(left).assertEqual('L7X');
      expect(right).assertEqual('R7');
      rightBinding.write('R7X');
      expect(left).assertEqual('L7X');
      expect(right).assertEqual('R7X');
      expect(leftBinding.read()).assertEqual('L7X');
      expect(rightBinding.read()).assertEqual('R7X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_044
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_044', 0, () => {
      let left: string = 'L8';
      let right: string = 'R8';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L8X');
      expect(left).assertEqual('L8X');
      expect(right).assertEqual('R8');
      rightBinding.write('R8X');
      expect(left).assertEqual('L8X');
      expect(right).assertEqual('R8X');
      expect(leftBinding.read()).assertEqual('L8X');
      expect(rightBinding.read()).assertEqual('R8X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_045
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_045', 0, () => {
      let left: string = 'L9';
      let right: string = 'R9';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L9X');
      expect(left).assertEqual('L9X');
      expect(right).assertEqual('R9');
      rightBinding.write('R9X');
      expect(left).assertEqual('L9X');
      expect(right).assertEqual('R9X');
      expect(leftBinding.read()).assertEqual('L9X');
      expect(rightBinding.read()).assertEqual('R9X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_046
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_046', 0, () => {
      let left: string = 'L10';
      let right: string = 'R10';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L10X');
      expect(left).assertEqual('L10X');
      expect(right).assertEqual('R10');
      rightBinding.write('R10X');
      expect(left).assertEqual('L10X');
      expect(right).assertEqual('R10X');
      expect(leftBinding.read()).assertEqual('L10X');
      expect(rightBinding.read()).assertEqual('R10X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_047
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_047', 0, () => {
      let left: string = 'L11';
      let right: string = 'R11';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L11X');
      expect(left).assertEqual('L11X');
      expect(right).assertEqual('R11');
      rightBinding.write('R11X');
      expect(left).assertEqual('L11X');
      expect(right).assertEqual('R11X');
      expect(leftBinding.read()).assertEqual('L11X');
      expect(rightBinding.read()).assertEqual('R11X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_048
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_048', 0, () => {
      let left: string = 'L12';
      let right: string = 'R12';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L12X');
      expect(left).assertEqual('L12X');
      expect(right).assertEqual('R12');
      rightBinding.write('R12X');
      expect(left).assertEqual('L12X');
      expect(right).assertEqual('R12X');
      expect(leftBinding.read()).assertEqual('L12X');
      expect(rightBinding.read()).assertEqual('R12X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_049
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_049', 0, () => {
      let left: string = 'L13';
      let right: string = 'R13';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L13X');
      expect(left).assertEqual('L13X');
      expect(right).assertEqual('R13');
      rightBinding.write('R13X');
      expect(left).assertEqual('L13X');
      expect(right).assertEqual('R13X');
      expect(leftBinding.read()).assertEqual('L13X');
      expect(rightBinding.read()).assertEqual('R13X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_050
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_050', 0, () => {
      let left: string = 'L14';
      let right: string = 'R14';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L14X');
      expect(left).assertEqual('L14X');
      expect(right).assertEqual('R14');
      rightBinding.write('R14X');
      expect(left).assertEqual('L14X');
      expect(right).assertEqual('R14X');
      expect(leftBinding.read()).assertEqual('L14X');
      expect(rightBinding.read()).assertEqual('R14X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_051
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_051', 0, () => {
      let left: string = 'L15';
      let right: string = 'R15';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L15X');
      expect(left).assertEqual('L15X');
      expect(right).assertEqual('R15');
      rightBinding.write('R15X');
      expect(left).assertEqual('L15X');
      expect(right).assertEqual('R15X');
      expect(leftBinding.read()).assertEqual('L15X');
      expect(rightBinding.read()).assertEqual('R15X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_052
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_052', 0, () => {
      let left: string = 'L16';
      let right: string = 'R16';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L16X');
      expect(left).assertEqual('L16X');
      expect(right).assertEqual('R16');
      rightBinding.write('R16X');
      expect(left).assertEqual('L16X');
      expect(right).assertEqual('R16X');
      expect(leftBinding.read()).assertEqual('L16X');
      expect(rightBinding.read()).assertEqual('R16X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_053
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_053', 0, () => {
      let left: string = 'L17';
      let right: string = 'R17';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L17X');
      expect(left).assertEqual('L17X');
      expect(right).assertEqual('R17');
      rightBinding.write('R17X');
      expect(left).assertEqual('L17X');
      expect(right).assertEqual('R17X');
      expect(leftBinding.read()).assertEqual('L17X');
      expect(rightBinding.read()).assertEqual('R17X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_054
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_054', 0, () => {
      let left: string = 'L18';
      let right: string = 'R18';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L18X');
      expect(left).assertEqual('L18X');
      expect(right).assertEqual('R18');
      rightBinding.write('R18X');
      expect(left).assertEqual('L18X');
      expect(right).assertEqual('R18X');
      expect(leftBinding.read()).assertEqual('L18X');
      expect(rightBinding.read()).assertEqual('R18X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_055
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_055', 0, () => {
      let left: string = 'L19';
      let right: string = 'R19';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L19X');
      expect(left).assertEqual('L19X');
      expect(right).assertEqual('R19');
      rightBinding.write('R19X');
      expect(left).assertEqual('L19X');
      expect(right).assertEqual('R19X');
      expect(leftBinding.read()).assertEqual('L19X');
      expect(rightBinding.read()).assertEqual('R19X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_056
     * @tc.desc binding-isolation: two mutable bindings keep independent stores, vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_056', 0, () => {
      let left: string = 'L20';
      let right: string = 'R20';
      const leftBinding: GetterSetterBinding = new GetterSetterBinding(() => left, (value: string) => { left = value; });
      const rightBinding: GetterSetterBinding = new GetterSetterBinding(() => right, (value: string) => { right = value; });
      leftBinding.write('L20X');
      expect(left).assertEqual('L20X');
      expect(right).assertEqual('R20');
      rightBinding.write('R20X');
      expect(left).assertEqual('L20X');
      expect(right).assertEqual('R20X');
      expect(leftBinding.read()).assertEqual('L20X');
      expect(rightBinding.read()).assertEqual('R20X');
      expect(leftBinding === rightBinding).assertFalse();
    });

    /**
     * @tc.name CrossChecksTest_case_057
     * @tc.desc size-scale: radius scaled by 0.5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_057', 0, () => {
      const value: number = SIZES.radius;
      expect(Math.round(value * 0.5)).assertEqual(6);
      expect(Math.round((value * 0.5) * 10000) / 10000).assertEqual(6.0000);
      expect(Math.round((value / 0.5) * 10000) / 10000).assertEqual(24.0000);
      expect(value > 0).assertTrue();
      expect(value * 0.5 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_058
     * @tc.desc size-scale: radius scaled by 1.5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_058', 0, () => {
      const value: number = SIZES.radius;
      expect(Math.round(value * 1.5)).assertEqual(18);
      expect(Math.round((value * 1.5) * 10000) / 10000).assertEqual(18.0000);
      expect(Math.round((value / 1.5) * 10000) / 10000).assertEqual(8.0000);
      expect(value > 0).assertTrue();
      expect(value * 1.5 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_059
     * @tc.desc size-scale: radius scaled by 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_059', 0, () => {
      const value: number = SIZES.radius;
      expect(Math.round(value * 2)).assertEqual(24);
      expect(Math.round((value * 2) * 10000) / 10000).assertEqual(24.0000);
      expect(Math.round((value / 2) * 10000) / 10000).assertEqual(6.0000);
      expect(value > 0).assertTrue();
      expect(value * 2 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_060
     * @tc.desc size-scale: radius scaled by 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_060', 0, () => {
      const value: number = SIZES.radius;
      expect(Math.round(value * 3)).assertEqual(36);
      expect(Math.round((value * 3) * 10000) / 10000).assertEqual(36.0000);
      expect(Math.round((value / 3) * 10000) / 10000).assertEqual(4.0000);
      expect(value > 0).assertTrue();
      expect(value * 3 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_061
     * @tc.desc size-scale: radius scaled by 0.25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_061', 0, () => {
      const value: number = SIZES.radius;
      expect(Math.round(value * 0.25)).assertEqual(3);
      expect(Math.round((value * 0.25) * 10000) / 10000).assertEqual(3.0000);
      expect(Math.round((value / 0.25) * 10000) / 10000).assertEqual(48.0000);
      expect(value > 0).assertTrue();
      expect(value * 0.25 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_062
     * @tc.desc size-scale: radius scaled by 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_062', 0, () => {
      const value: number = SIZES.radius;
      expect(Math.round(value * 10)).assertEqual(120);
      expect(Math.round((value * 10) * 10000) / 10000).assertEqual(120.0000);
      expect(Math.round((value / 10) * 10000) / 10000).assertEqual(1.2000);
      expect(value > 0).assertTrue();
      expect(value * 10 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_063
     * @tc.desc size-scale: padding scaled by 0.5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_063', 0, () => {
      const value: number = SIZES.padding;
      expect(Math.round(value * 0.5)).assertEqual(10);
      expect(Math.round((value * 0.5) * 10000) / 10000).assertEqual(10.0000);
      expect(Math.round((value / 0.5) * 10000) / 10000).assertEqual(40.0000);
      expect(value > 0).assertTrue();
      expect(value * 0.5 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_064
     * @tc.desc size-scale: padding scaled by 1.5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_064', 0, () => {
      const value: number = SIZES.padding;
      expect(Math.round(value * 1.5)).assertEqual(30);
      expect(Math.round((value * 1.5) * 10000) / 10000).assertEqual(30.0000);
      expect(Math.round((value / 1.5) * 10000) / 10000).assertEqual(13.3333);
      expect(value > 0).assertTrue();
      expect(value * 1.5 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_065
     * @tc.desc size-scale: padding scaled by 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_065', 0, () => {
      const value: number = SIZES.padding;
      expect(Math.round(value * 2)).assertEqual(40);
      expect(Math.round((value * 2) * 10000) / 10000).assertEqual(40.0000);
      expect(Math.round((value / 2) * 10000) / 10000).assertEqual(10.0000);
      expect(value > 0).assertTrue();
      expect(value * 2 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_066
     * @tc.desc size-scale: padding scaled by 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_066', 0, () => {
      const value: number = SIZES.padding;
      expect(Math.round(value * 3)).assertEqual(60);
      expect(Math.round((value * 3) * 10000) / 10000).assertEqual(60.0000);
      expect(Math.round((value / 3) * 10000) / 10000).assertEqual(6.6667);
      expect(value > 0).assertTrue();
      expect(value * 3 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_067
     * @tc.desc size-scale: padding scaled by 0.25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_067', 0, () => {
      const value: number = SIZES.padding;
      expect(Math.round(value * 0.25)).assertEqual(5);
      expect(Math.round((value * 0.25) * 10000) / 10000).assertEqual(5.0000);
      expect(Math.round((value / 0.25) * 10000) / 10000).assertEqual(80.0000);
      expect(value > 0).assertTrue();
      expect(value * 0.25 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_068
     * @tc.desc size-scale: padding scaled by 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_068', 0, () => {
      const value: number = SIZES.padding;
      expect(Math.round(value * 10)).assertEqual(200);
      expect(Math.round((value * 10) * 10000) / 10000).assertEqual(200.0000);
      expect(Math.round((value / 10) * 10000) / 10000).assertEqual(2.0000);
      expect(value > 0).assertTrue();
      expect(value * 10 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_069
     * @tc.desc size-scale: fontSizeTitle scaled by 0.5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_069', 0, () => {
      const value: number = SIZES.fontSizeTitle;
      expect(Math.round(value * 0.5)).assertEqual(11);
      expect(Math.round((value * 0.5) * 10000) / 10000).assertEqual(11.0000);
      expect(Math.round((value / 0.5) * 10000) / 10000).assertEqual(44.0000);
      expect(value > 0).assertTrue();
      expect(value * 0.5 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_070
     * @tc.desc size-scale: fontSizeTitle scaled by 1.5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_070', 0, () => {
      const value: number = SIZES.fontSizeTitle;
      expect(Math.round(value * 1.5)).assertEqual(33);
      expect(Math.round((value * 1.5) * 10000) / 10000).assertEqual(33.0000);
      expect(Math.round((value / 1.5) * 10000) / 10000).assertEqual(14.6667);
      expect(value > 0).assertTrue();
      expect(value * 1.5 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_071
     * @tc.desc size-scale: fontSizeTitle scaled by 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_071', 0, () => {
      const value: number = SIZES.fontSizeTitle;
      expect(Math.round(value * 2)).assertEqual(44);
      expect(Math.round((value * 2) * 10000) / 10000).assertEqual(44.0000);
      expect(Math.round((value / 2) * 10000) / 10000).assertEqual(11.0000);
      expect(value > 0).assertTrue();
      expect(value * 2 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_072
     * @tc.desc size-scale: fontSizeTitle scaled by 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_072', 0, () => {
      const value: number = SIZES.fontSizeTitle;
      expect(Math.round(value * 3)).assertEqual(66);
      expect(Math.round((value * 3) * 10000) / 10000).assertEqual(66.0000);
      expect(Math.round((value / 3) * 10000) / 10000).assertEqual(7.3333);
      expect(value > 0).assertTrue();
      expect(value * 3 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_073
     * @tc.desc size-scale: fontSizeTitle scaled by 0.25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_073', 0, () => {
      const value: number = SIZES.fontSizeTitle;
      expect(Math.round(value * 0.25)).assertEqual(6);
      expect(Math.round((value * 0.25) * 10000) / 10000).assertEqual(5.5000);
      expect(Math.round((value / 0.25) * 10000) / 10000).assertEqual(88.0000);
      expect(value > 0).assertTrue();
      expect(value * 0.25 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_074
     * @tc.desc size-scale: fontSizeTitle scaled by 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_074', 0, () => {
      const value: number = SIZES.fontSizeTitle;
      expect(Math.round(value * 10)).assertEqual(220);
      expect(Math.round((value * 10) * 10000) / 10000).assertEqual(220.0000);
      expect(Math.round((value / 10) * 10000) / 10000).assertEqual(2.2000);
      expect(value > 0).assertTrue();
      expect(value * 10 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_075
     * @tc.desc size-scale: fontSizeNormal scaled by 0.5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_075', 0, () => {
      const value: number = SIZES.fontSizeNormal;
      expect(Math.round(value * 0.5)).assertEqual(8);
      expect(Math.round((value * 0.5) * 10000) / 10000).assertEqual(8.0000);
      expect(Math.round((value / 0.5) * 10000) / 10000).assertEqual(32.0000);
      expect(value > 0).assertTrue();
      expect(value * 0.5 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_076
     * @tc.desc size-scale: fontSizeNormal scaled by 1.5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_076', 0, () => {
      const value: number = SIZES.fontSizeNormal;
      expect(Math.round(value * 1.5)).assertEqual(24);
      expect(Math.round((value * 1.5) * 10000) / 10000).assertEqual(24.0000);
      expect(Math.round((value / 1.5) * 10000) / 10000).assertEqual(10.6667);
      expect(value > 0).assertTrue();
      expect(value * 1.5 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_077
     * @tc.desc size-scale: fontSizeNormal scaled by 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_077', 0, () => {
      const value: number = SIZES.fontSizeNormal;
      expect(Math.round(value * 2)).assertEqual(32);
      expect(Math.round((value * 2) * 10000) / 10000).assertEqual(32.0000);
      expect(Math.round((value / 2) * 10000) / 10000).assertEqual(8.0000);
      expect(value > 0).assertTrue();
      expect(value * 2 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_078
     * @tc.desc size-scale: fontSizeNormal scaled by 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_078', 0, () => {
      const value: number = SIZES.fontSizeNormal;
      expect(Math.round(value * 3)).assertEqual(48);
      expect(Math.round((value * 3) * 10000) / 10000).assertEqual(48.0000);
      expect(Math.round((value / 3) * 10000) / 10000).assertEqual(5.3333);
      expect(value > 0).assertTrue();
      expect(value * 3 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_079
     * @tc.desc size-scale: fontSizeNormal scaled by 0.25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_079', 0, () => {
      const value: number = SIZES.fontSizeNormal;
      expect(Math.round(value * 0.25)).assertEqual(4);
      expect(Math.round((value * 0.25) * 10000) / 10000).assertEqual(4.0000);
      expect(Math.round((value / 0.25) * 10000) / 10000).assertEqual(64.0000);
      expect(value > 0).assertTrue();
      expect(value * 0.25 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_080
     * @tc.desc size-scale: fontSizeNormal scaled by 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_080', 0, () => {
      const value: number = SIZES.fontSizeNormal;
      expect(Math.round(value * 10)).assertEqual(160);
      expect(Math.round((value * 10) * 10000) / 10000).assertEqual(160.0000);
      expect(Math.round((value / 10) * 10000) / 10000).assertEqual(1.6000);
      expect(value > 0).assertTrue();
      expect(value * 10 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_081
     * @tc.desc size-scale: fontSizeSmall scaled by 0.5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_081', 0, () => {
      const value: number = SIZES.fontSizeSmall;
      expect(Math.round(value * 0.5)).assertEqual(7);
      expect(Math.round((value * 0.5) * 10000) / 10000).assertEqual(7.0000);
      expect(Math.round((value / 0.5) * 10000) / 10000).assertEqual(28.0000);
      expect(value > 0).assertTrue();
      expect(value * 0.5 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_082
     * @tc.desc size-scale: fontSizeSmall scaled by 1.5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_082', 0, () => {
      const value: number = SIZES.fontSizeSmall;
      expect(Math.round(value * 1.5)).assertEqual(21);
      expect(Math.round((value * 1.5) * 10000) / 10000).assertEqual(21.0000);
      expect(Math.round((value / 1.5) * 10000) / 10000).assertEqual(9.3333);
      expect(value > 0).assertTrue();
      expect(value * 1.5 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_083
     * @tc.desc size-scale: fontSizeSmall scaled by 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_083', 0, () => {
      const value: number = SIZES.fontSizeSmall;
      expect(Math.round(value * 2)).assertEqual(28);
      expect(Math.round((value * 2) * 10000) / 10000).assertEqual(28.0000);
      expect(Math.round((value / 2) * 10000) / 10000).assertEqual(7.0000);
      expect(value > 0).assertTrue();
      expect(value * 2 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_084
     * @tc.desc size-scale: fontSizeSmall scaled by 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_084', 0, () => {
      const value: number = SIZES.fontSizeSmall;
      expect(Math.round(value * 3)).assertEqual(42);
      expect(Math.round((value * 3) * 10000) / 10000).assertEqual(42.0000);
      expect(Math.round((value / 3) * 10000) / 10000).assertEqual(4.6667);
      expect(value > 0).assertTrue();
      expect(value * 3 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_085
     * @tc.desc size-scale: fontSizeSmall scaled by 0.25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_085', 0, () => {
      const value: number = SIZES.fontSizeSmall;
      expect(Math.round(value * 0.25)).assertEqual(4);
      expect(Math.round((value * 0.25) * 10000) / 10000).assertEqual(3.5000);
      expect(Math.round((value / 0.25) * 10000) / 10000).assertEqual(56.0000);
      expect(value > 0).assertTrue();
      expect(value * 0.25 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_086
     * @tc.desc size-scale: fontSizeSmall scaled by 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_086', 0, () => {
      const value: number = SIZES.fontSizeSmall;
      expect(Math.round(value * 10)).assertEqual(140);
      expect(Math.round((value * 10) * 10000) / 10000).assertEqual(140.0000);
      expect(Math.round((value / 10) * 10000) / 10000).assertEqual(1.4000);
      expect(value > 0).assertTrue();
      expect(value * 10 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_087
     * @tc.desc size-scale: spacing scaled by 0.5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_087', 0, () => {
      const value: number = SIZES.spacing;
      expect(Math.round(value * 0.5)).assertEqual(8);
      expect(Math.round((value * 0.5) * 10000) / 10000).assertEqual(8.0000);
      expect(Math.round((value / 0.5) * 10000) / 10000).assertEqual(32.0000);
      expect(value > 0).assertTrue();
      expect(value * 0.5 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_088
     * @tc.desc size-scale: spacing scaled by 1.5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_088', 0, () => {
      const value: number = SIZES.spacing;
      expect(Math.round(value * 1.5)).assertEqual(24);
      expect(Math.round((value * 1.5) * 10000) / 10000).assertEqual(24.0000);
      expect(Math.round((value / 1.5) * 10000) / 10000).assertEqual(10.6667);
      expect(value > 0).assertTrue();
      expect(value * 1.5 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_089
     * @tc.desc size-scale: spacing scaled by 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_089', 0, () => {
      const value: number = SIZES.spacing;
      expect(Math.round(value * 2)).assertEqual(32);
      expect(Math.round((value * 2) * 10000) / 10000).assertEqual(32.0000);
      expect(Math.round((value / 2) * 10000) / 10000).assertEqual(8.0000);
      expect(value > 0).assertTrue();
      expect(value * 2 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_090
     * @tc.desc size-scale: spacing scaled by 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_090', 0, () => {
      const value: number = SIZES.spacing;
      expect(Math.round(value * 3)).assertEqual(48);
      expect(Math.round((value * 3) * 10000) / 10000).assertEqual(48.0000);
      expect(Math.round((value / 3) * 10000) / 10000).assertEqual(5.3333);
      expect(value > 0).assertTrue();
      expect(value * 3 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_091
     * @tc.desc size-scale: spacing scaled by 0.25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_091', 0, () => {
      const value: number = SIZES.spacing;
      expect(Math.round(value * 0.25)).assertEqual(4);
      expect(Math.round((value * 0.25) * 10000) / 10000).assertEqual(4.0000);
      expect(Math.round((value / 0.25) * 10000) / 10000).assertEqual(64.0000);
      expect(value > 0).assertTrue();
      expect(value * 0.25 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

    /**
     * @tc.name CrossChecksTest_case_092
     * @tc.desc size-scale: spacing scaled by 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CrossChecksTest_case_092', 0, () => {
      const value: number = SIZES.spacing;
      expect(Math.round(value * 10)).assertEqual(160);
      expect(Math.round((value * 10) * 10000) / 10000).assertEqual(160.0000);
      expect(Math.round((value / 10) * 10000) / 10000).assertEqual(1.6000);
      expect(value > 0).assertTrue();
      expect(value * 10 > 0).assertTrue();
      expect(Number.isFinite(value)).assertTrue();
    });

  });
}
