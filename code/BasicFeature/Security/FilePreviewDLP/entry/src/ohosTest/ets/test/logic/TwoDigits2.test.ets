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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { twoDigits } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for twoDigits (24 cases). */
export default function twoDigits2Test(): void {
  describe('TwoDigits2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0097
     * @tc.name      FilePreviewDLP_TwoDigits_0097
     * @tc.desc      twoDigits(value=148) returns "148"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0097 begin`);
      const actual: string = twoDigits(148);
      logInfo(`twoDigits(value=148): actual=${actual}`);
      expect(actual).assertEqual('148');
      logInfo(`${BUNDLE}TwoDigits_0097 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0098
     * @tc.name      FilePreviewDLP_TwoDigits_0098
     * @tc.desc      twoDigits(value=18.15) returns "18.15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0098 begin`);
      const actual: string = twoDigits(18.15);
      logInfo(`twoDigits(value=18.15): actual=${actual}`);
      expect(actual).assertEqual('18.15');
      logInfo(`${BUNDLE}TwoDigits_0098 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0099
     * @tc.name      FilePreviewDLP_TwoDigits_0099
     * @tc.desc      twoDigits(value=-17) returns "-17"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_TwoDigits_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TwoDigits_0099 begin`);
      const actual: string = twoDigits(-17);
      logInfo(`twoDigits(value=-17): actual=${actual}`);
      expect(actual).assertEqual('-17');
      logInfo(`${BUNDLE}TwoDigits_0099 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0100
     * @tc.name      FilePreviewDLP_TwoDigits_0100
     * @tc.desc      twoDigits(value=197) returns "197"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0100 begin`);
      const actual: string = twoDigits(197);
      logInfo(`twoDigits(value=197): actual=${actual}`);
      expect(actual).assertEqual('197');
      logInfo(`${BUNDLE}TwoDigits_0100 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0101
     * @tc.name      FilePreviewDLP_TwoDigits_0101
     * @tc.desc      twoDigits(value=45.26) returns "45.26"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0101 begin`);
      const actual: string = twoDigits(45.26);
      logInfo(`twoDigits(value=45.26): actual=${actual}`);
      expect(actual).assertEqual('45.26');
      logInfo(`${BUNDLE}TwoDigits_0101 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0102
     * @tc.name      FilePreviewDLP_TwoDigits_0102
     * @tc.desc      twoDigits(value=76) returns "76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0102 begin`);
      const actual: string = twoDigits(76);
      logInfo(`twoDigits(value=76): actual=${actual}`);
      expect(actual).assertEqual('76');
      logInfo(`${BUNDLE}TwoDigits_0102 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0103
     * @tc.name      FilePreviewDLP_TwoDigits_0103
     * @tc.desc      twoDigits(value=171) returns "171"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0103 begin`);
      const actual: string = twoDigits(171);
      logInfo(`twoDigits(value=171): actual=${actual}`);
      expect(actual).assertEqual('171');
      logInfo(`${BUNDLE}TwoDigits_0103 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0104
     * @tc.name      FilePreviewDLP_TwoDigits_0104
     * @tc.desc      twoDigits(value=82) returns "82"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0104 begin`);
      const actual: string = twoDigits(82);
      logInfo(`twoDigits(value=82): actual=${actual}`);
      expect(actual).assertEqual('82');
      logInfo(`${BUNDLE}TwoDigits_0104 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0105
     * @tc.name      FilePreviewDLP_TwoDigits_0105
     * @tc.desc      twoDigits(value=48.83) returns "48.83"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0105 begin`);
      const actual: string = twoDigits(48.83);
      logInfo(`twoDigits(value=48.83): actual=${actual}`);
      expect(actual).assertEqual('48.83');
      logInfo(`${BUNDLE}TwoDigits_0105 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0106
     * @tc.name      FilePreviewDLP_TwoDigits_0106
     * @tc.desc      twoDigits(value=-55) returns "-55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_TwoDigits_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TwoDigits_0106 begin`);
      const actual: string = twoDigits(-55);
      logInfo(`twoDigits(value=-55): actual=${actual}`);
      expect(actual).assertEqual('-55');
      logInfo(`${BUNDLE}TwoDigits_0106 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0107
     * @tc.name      FilePreviewDLP_TwoDigits_0107
     * @tc.desc      twoDigits(value=-94) returns "-94"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_TwoDigits_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TwoDigits_0107 begin`);
      const actual: string = twoDigits(-94);
      logInfo(`twoDigits(value=-94): actual=${actual}`);
      expect(actual).assertEqual('-94');
      logInfo(`${BUNDLE}TwoDigits_0107 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0108
     * @tc.name      FilePreviewDLP_TwoDigits_0108
     * @tc.desc      twoDigits(value=22.55) returns "22.55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0108 begin`);
      const actual: string = twoDigits(22.55);
      logInfo(`twoDigits(value=22.55): actual=${actual}`);
      expect(actual).assertEqual('22.55');
      logInfo(`${BUNDLE}TwoDigits_0108 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0109
     * @tc.name      FilePreviewDLP_TwoDigits_0109
     * @tc.desc      twoDigits(value=98) returns "98"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0109 begin`);
      const actual: string = twoDigits(98);
      logInfo(`twoDigits(value=98): actual=${actual}`);
      expect(actual).assertEqual('98');
      logInfo(`${BUNDLE}TwoDigits_0109 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0110
     * @tc.name      FilePreviewDLP_TwoDigits_0110
     * @tc.desc      twoDigits(value=9) returns "09"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0110 begin`);
      const actual: string = twoDigits(9);
      logInfo(`twoDigits(value=9): actual=${actual}`);
      expect(actual).assertEqual('09');
      logInfo(`${BUNDLE}TwoDigits_0110 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0111
     * @tc.name      FilePreviewDLP_TwoDigits_0111
     * @tc.desc      twoDigits(value=57.23) returns "57.23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0111 begin`);
      const actual: string = twoDigits(57.23);
      logInfo(`twoDigits(value=57.23): actual=${actual}`);
      expect(actual).assertEqual('57.23');
      logInfo(`${BUNDLE}TwoDigits_0111 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0112
     * @tc.name      FilePreviewDLP_TwoDigits_0112
     * @tc.desc      twoDigits(value=193) returns "193"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0112 begin`);
      const actual: string = twoDigits(193);
      logInfo(`twoDigits(value=193): actual=${actual}`);
      expect(actual).assertEqual('193');
      logInfo(`${BUNDLE}TwoDigits_0112 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0113
     * @tc.name      FilePreviewDLP_TwoDigits_0113
     * @tc.desc      twoDigits(value=59.39) returns "59.39"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0113 begin`);
      const actual: string = twoDigits(59.39);
      logInfo(`twoDigits(value=59.39): actual=${actual}`);
      expect(actual).assertEqual('59.39');
      logInfo(`${BUNDLE}TwoDigits_0113 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0114
     * @tc.name      FilePreviewDLP_TwoDigits_0114
     * @tc.desc      twoDigits(value=32.69) returns "32.69"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0114 begin`);
      const actual: string = twoDigits(32.69);
      logInfo(`twoDigits(value=32.69): actual=${actual}`);
      expect(actual).assertEqual('32.69');
      logInfo(`${BUNDLE}TwoDigits_0114 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0115
     * @tc.name      FilePreviewDLP_TwoDigits_0115
     * @tc.desc      twoDigits(value=10.87) returns "10.87"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0115 begin`);
      const actual: string = twoDigits(10.87);
      logInfo(`twoDigits(value=10.87): actual=${actual}`);
      expect(actual).assertEqual('10.87');
      logInfo(`${BUNDLE}TwoDigits_0115 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0116
     * @tc.name      FilePreviewDLP_TwoDigits_0116
     * @tc.desc      twoDigits(value=45.24) returns "45.24"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0116 begin`);
      const actual: string = twoDigits(45.24);
      logInfo(`twoDigits(value=45.24): actual=${actual}`);
      expect(actual).assertEqual('45.24');
      logInfo(`${BUNDLE}TwoDigits_0116 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0117
     * @tc.name      FilePreviewDLP_TwoDigits_0117
     * @tc.desc      twoDigits(value=90.06) returns "90.06"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0117 begin`);
      const actual: string = twoDigits(90.06);
      logInfo(`twoDigits(value=90.06): actual=${actual}`);
      expect(actual).assertEqual('90.06');
      logInfo(`${BUNDLE}TwoDigits_0117 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0118
     * @tc.name      FilePreviewDLP_TwoDigits_0118
     * @tc.desc      twoDigits(value=152) returns "152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0118 begin`);
      const actual: string = twoDigits(152);
      logInfo(`twoDigits(value=152): actual=${actual}`);
      expect(actual).assertEqual('152');
      logInfo(`${BUNDLE}TwoDigits_0118 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0119
     * @tc.name      FilePreviewDLP_TwoDigits_0119
     * @tc.desc      twoDigits(value=53.44) returns "53.44"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0119 begin`);
      const actual: string = twoDigits(53.44);
      logInfo(`twoDigits(value=53.44): actual=${actual}`);
      expect(actual).assertEqual('53.44');
      logInfo(`${BUNDLE}TwoDigits_0119 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_TWO_DIGITS_0120
     * @tc.name      FilePreviewDLP_TwoDigits_0120
     * @tc.desc      twoDigits(value=166) returns "166"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_TwoDigits_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TwoDigits_0120 begin`);
      const actual: string = twoDigits(166);
      logInfo(`twoDigits(value=166): actual=${actual}`);
      expect(actual).assertEqual('166');
      logInfo(`${BUNDLE}TwoDigits_0120 end`);
    });
  });
}
