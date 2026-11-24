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
import { itemKeyOf } from '../model/FilePreviewDlpLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FilePreviewDLP]';
const BUNDLE: string = 'FilePreviewDLP_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for itemKeyOf (96 cases). */
export default function itemKeyOf2Test(): void {
  describe('ItemKeyOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0097
     * @tc.name      FilePreviewDLP_ItemKeyOf_0097
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=3) returns "3__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0097 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 3);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('3__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0097 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0098
     * @tc.name      FilePreviewDLP_ItemKeyOf_0098
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=100) returns "100__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0098 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 100);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('100__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0098 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0099
     * @tc.name      FilePreviewDLP_ItemKeyOf_0099
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=15) returns "15__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0099 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 15);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('15__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0099 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0100
     * @tc.name      FilePreviewDLP_ItemKeyOf_0100
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=20) returns "20__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0100 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 20);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('20__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0100 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0101
     * @tc.name      FilePreviewDLP_ItemKeyOf_0101
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=25) returns "25__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0101 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 25);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('25__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0101 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0102
     * @tc.name      FilePreviewDLP_ItemKeyOf_0102
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=30) returns "30__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0102 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 30);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('30__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0102 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0103
     * @tc.name      FilePreviewDLP_ItemKeyOf_0103
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=35) returns "35__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0103 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 35);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('35__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0103 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0104
     * @tc.name      FilePreviewDLP_ItemKeyOf_0104
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=40) returns "40__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0104 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 40);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('40__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0104 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0105
     * @tc.name      FilePreviewDLP_ItemKeyOf_0105
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=45) returns "45__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0105 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 45);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('45__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0105 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0106
     * @tc.name      FilePreviewDLP_ItemKeyOf_0106
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=50) returns "50__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0106 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 50);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('50__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0106 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0107
     * @tc.name      FilePreviewDLP_ItemKeyOf_0107
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=55) returns "55__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0107 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 55);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('55__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0107 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0108
     * @tc.name      FilePreviewDLP_ItemKeyOf_0108
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=60) returns "60__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0108 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 60);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('60__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0108 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0109
     * @tc.name      FilePreviewDLP_ItemKeyOf_0109
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=65) returns "65__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0109 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 65);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('65__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0109 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0110
     * @tc.name      FilePreviewDLP_ItemKeyOf_0110
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=70) returns "70__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0110 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 70);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('70__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0110 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0111
     * @tc.name      FilePreviewDLP_ItemKeyOf_0111
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=75) returns "75__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0111 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 75);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('75__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0111 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0112
     * @tc.name      FilePreviewDLP_ItemKeyOf_0112
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=80) returns "80__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0112 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 80);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('80__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0112 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0113
     * @tc.name      FilePreviewDLP_ItemKeyOf_0113
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=85) returns "85__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0113 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 85);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('85__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0113 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0114
     * @tc.name      FilePreviewDLP_ItemKeyOf_0114
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=90) returns "90__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0114 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 90);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('90__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0114 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0115
     * @tc.name      FilePreviewDLP_ItemKeyOf_0115
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=95) returns "95__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0115 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 95);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('95__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0115 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0116
     * @tc.name      FilePreviewDLP_ItemKeyOf_0116
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=105) returns "105__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0116 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 105);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('105__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0116 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0117
     * @tc.name      FilePreviewDLP_ItemKeyOf_0117
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=110) returns "110__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0117 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 110);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('110__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0117 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0118
     * @tc.name      FilePreviewDLP_ItemKeyOf_0118
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=12.14) returns "12.14__datashare:///media/imag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0118 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 12.14);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('12.14__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0118 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0119
     * @tc.name      FilePreviewDLP_ItemKeyOf_0119
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=99.84) returns "99.84__datashare:///media/imag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0119 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', 99.84);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('99.84__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0119 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0120
     * @tc.name      FilePreviewDLP_ItemKeyOf_0120
     * @tc.desc      itemKeyOf(uri="datashare:///media/image/1", index=-3) returns "-3__datashare:///media/image/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0120 begin`);
      const actual: string = itemKeyOf('datashare:///media/image/1', -3);
      logInfo(`itemKeyOf(uri="datashare:///media/image/1...: actual=${actual}`);
      expect(actual).assertEqual('-3__datashare:///media/image/1');
      logInfo(`${BUNDLE}ItemKeyOf_0120 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0121
     * @tc.name      FilePreviewDLP_ItemKeyOf_0121
     * @tc.desc      itemKeyOf(uri="", index=0) returns "0__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0121 begin`);
      const actual: string = itemKeyOf('', 0);
      logInfo(`itemKeyOf(uri="", index=0): actual=${actual}`);
      expect(actual).assertEqual('0__');
      logInfo(`${BUNDLE}ItemKeyOf_0121 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0122
     * @tc.name      FilePreviewDLP_ItemKeyOf_0122
     * @tc.desc      itemKeyOf(uri="", index=1) returns "1__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0122 begin`);
      const actual: string = itemKeyOf('', 1);
      logInfo(`itemKeyOf(uri="", index=1): actual=${actual}`);
      expect(actual).assertEqual('1__');
      logInfo(`${BUNDLE}ItemKeyOf_0122 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0123
     * @tc.name      FilePreviewDLP_ItemKeyOf_0123
     * @tc.desc      itemKeyOf(uri="", index=2) returns "2__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0123 begin`);
      const actual: string = itemKeyOf('', 2);
      logInfo(`itemKeyOf(uri="", index=2): actual=${actual}`);
      expect(actual).assertEqual('2__');
      logInfo(`${BUNDLE}ItemKeyOf_0123 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0124
     * @tc.name      FilePreviewDLP_ItemKeyOf_0124
     * @tc.desc      itemKeyOf(uri="", index=-1) returns "-1__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0124 begin`);
      const actual: string = itemKeyOf('', -1);
      logInfo(`itemKeyOf(uri="", index=-1): actual=${actual}`);
      expect(actual).assertEqual('-1__');
      logInfo(`${BUNDLE}ItemKeyOf_0124 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0125
     * @tc.name      FilePreviewDLP_ItemKeyOf_0125
     * @tc.desc      itemKeyOf(uri="", index=5) returns "5__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0125 begin`);
      const actual: string = itemKeyOf('', 5);
      logInfo(`itemKeyOf(uri="", index=5): actual=${actual}`);
      expect(actual).assertEqual('5__');
      logInfo(`${BUNDLE}ItemKeyOf_0125 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0126
     * @tc.name      FilePreviewDLP_ItemKeyOf_0126
     * @tc.desc      itemKeyOf(uri="", index=10) returns "10__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0126 begin`);
      const actual: string = itemKeyOf('', 10);
      logInfo(`itemKeyOf(uri="", index=10): actual=${actual}`);
      expect(actual).assertEqual('10__');
      logInfo(`${BUNDLE}ItemKeyOf_0126 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0127
     * @tc.name      FilePreviewDLP_ItemKeyOf_0127
     * @tc.desc      itemKeyOf(uri="", index=3) returns "3__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0127 begin`);
      const actual: string = itemKeyOf('', 3);
      logInfo(`itemKeyOf(uri="", index=3): actual=${actual}`);
      expect(actual).assertEqual('3__');
      logInfo(`${BUNDLE}ItemKeyOf_0127 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0128
     * @tc.name      FilePreviewDLP_ItemKeyOf_0128
     * @tc.desc      itemKeyOf(uri="", index=100) returns "100__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0128 begin`);
      const actual: string = itemKeyOf('', 100);
      logInfo(`itemKeyOf(uri="", index=100): actual=${actual}`);
      expect(actual).assertEqual('100__');
      logInfo(`${BUNDLE}ItemKeyOf_0128 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0129
     * @tc.name      FilePreviewDLP_ItemKeyOf_0129
     * @tc.desc      itemKeyOf(uri="", index=15) returns "15__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0129 begin`);
      const actual: string = itemKeyOf('', 15);
      logInfo(`itemKeyOf(uri="", index=15): actual=${actual}`);
      expect(actual).assertEqual('15__');
      logInfo(`${BUNDLE}ItemKeyOf_0129 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0130
     * @tc.name      FilePreviewDLP_ItemKeyOf_0130
     * @tc.desc      itemKeyOf(uri="", index=20) returns "20__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0130 begin`);
      const actual: string = itemKeyOf('', 20);
      logInfo(`itemKeyOf(uri="", index=20): actual=${actual}`);
      expect(actual).assertEqual('20__');
      logInfo(`${BUNDLE}ItemKeyOf_0130 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0131
     * @tc.name      FilePreviewDLP_ItemKeyOf_0131
     * @tc.desc      itemKeyOf(uri="", index=25) returns "25__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0131 begin`);
      const actual: string = itemKeyOf('', 25);
      logInfo(`itemKeyOf(uri="", index=25): actual=${actual}`);
      expect(actual).assertEqual('25__');
      logInfo(`${BUNDLE}ItemKeyOf_0131 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0132
     * @tc.name      FilePreviewDLP_ItemKeyOf_0132
     * @tc.desc      itemKeyOf(uri="", index=30) returns "30__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0132 begin`);
      const actual: string = itemKeyOf('', 30);
      logInfo(`itemKeyOf(uri="", index=30): actual=${actual}`);
      expect(actual).assertEqual('30__');
      logInfo(`${BUNDLE}ItemKeyOf_0132 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0133
     * @tc.name      FilePreviewDLP_ItemKeyOf_0133
     * @tc.desc      itemKeyOf(uri="", index=35) returns "35__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0133 begin`);
      const actual: string = itemKeyOf('', 35);
      logInfo(`itemKeyOf(uri="", index=35): actual=${actual}`);
      expect(actual).assertEqual('35__');
      logInfo(`${BUNDLE}ItemKeyOf_0133 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0134
     * @tc.name      FilePreviewDLP_ItemKeyOf_0134
     * @tc.desc      itemKeyOf(uri="", index=40) returns "40__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0134 begin`);
      const actual: string = itemKeyOf('', 40);
      logInfo(`itemKeyOf(uri="", index=40): actual=${actual}`);
      expect(actual).assertEqual('40__');
      logInfo(`${BUNDLE}ItemKeyOf_0134 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0135
     * @tc.name      FilePreviewDLP_ItemKeyOf_0135
     * @tc.desc      itemKeyOf(uri="", index=45) returns "45__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0135 begin`);
      const actual: string = itemKeyOf('', 45);
      logInfo(`itemKeyOf(uri="", index=45): actual=${actual}`);
      expect(actual).assertEqual('45__');
      logInfo(`${BUNDLE}ItemKeyOf_0135 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0136
     * @tc.name      FilePreviewDLP_ItemKeyOf_0136
     * @tc.desc      itemKeyOf(uri="", index=50) returns "50__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0136 begin`);
      const actual: string = itemKeyOf('', 50);
      logInfo(`itemKeyOf(uri="", index=50): actual=${actual}`);
      expect(actual).assertEqual('50__');
      logInfo(`${BUNDLE}ItemKeyOf_0136 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0137
     * @tc.name      FilePreviewDLP_ItemKeyOf_0137
     * @tc.desc      itemKeyOf(uri="", index=55) returns "55__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0137 begin`);
      const actual: string = itemKeyOf('', 55);
      logInfo(`itemKeyOf(uri="", index=55): actual=${actual}`);
      expect(actual).assertEqual('55__');
      logInfo(`${BUNDLE}ItemKeyOf_0137 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0138
     * @tc.name      FilePreviewDLP_ItemKeyOf_0138
     * @tc.desc      itemKeyOf(uri="", index=60) returns "60__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0138 begin`);
      const actual: string = itemKeyOf('', 60);
      logInfo(`itemKeyOf(uri="", index=60): actual=${actual}`);
      expect(actual).assertEqual('60__');
      logInfo(`${BUNDLE}ItemKeyOf_0138 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0139
     * @tc.name      FilePreviewDLP_ItemKeyOf_0139
     * @tc.desc      itemKeyOf(uri="", index=65) returns "65__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0139 begin`);
      const actual: string = itemKeyOf('', 65);
      logInfo(`itemKeyOf(uri="", index=65): actual=${actual}`);
      expect(actual).assertEqual('65__');
      logInfo(`${BUNDLE}ItemKeyOf_0139 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0140
     * @tc.name      FilePreviewDLP_ItemKeyOf_0140
     * @tc.desc      itemKeyOf(uri="", index=70) returns "70__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0140 begin`);
      const actual: string = itemKeyOf('', 70);
      logInfo(`itemKeyOf(uri="", index=70): actual=${actual}`);
      expect(actual).assertEqual('70__');
      logInfo(`${BUNDLE}ItemKeyOf_0140 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0141
     * @tc.name      FilePreviewDLP_ItemKeyOf_0141
     * @tc.desc      itemKeyOf(uri="", index=75) returns "75__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0141 begin`);
      const actual: string = itemKeyOf('', 75);
      logInfo(`itemKeyOf(uri="", index=75): actual=${actual}`);
      expect(actual).assertEqual('75__');
      logInfo(`${BUNDLE}ItemKeyOf_0141 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0142
     * @tc.name      FilePreviewDLP_ItemKeyOf_0142
     * @tc.desc      itemKeyOf(uri="", index=80) returns "80__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0142 begin`);
      const actual: string = itemKeyOf('', 80);
      logInfo(`itemKeyOf(uri="", index=80): actual=${actual}`);
      expect(actual).assertEqual('80__');
      logInfo(`${BUNDLE}ItemKeyOf_0142 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0143
     * @tc.name      FilePreviewDLP_ItemKeyOf_0143
     * @tc.desc      itemKeyOf(uri="", index=85) returns "85__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0143 begin`);
      const actual: string = itemKeyOf('', 85);
      logInfo(`itemKeyOf(uri="", index=85): actual=${actual}`);
      expect(actual).assertEqual('85__');
      logInfo(`${BUNDLE}ItemKeyOf_0143 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0144
     * @tc.name      FilePreviewDLP_ItemKeyOf_0144
     * @tc.desc      itemKeyOf(uri="", index=90) returns "90__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0144 begin`);
      const actual: string = itemKeyOf('', 90);
      logInfo(`itemKeyOf(uri="", index=90): actual=${actual}`);
      expect(actual).assertEqual('90__');
      logInfo(`${BUNDLE}ItemKeyOf_0144 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0145
     * @tc.name      FilePreviewDLP_ItemKeyOf_0145
     * @tc.desc      itemKeyOf(uri="", index=95) returns "95__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0145 begin`);
      const actual: string = itemKeyOf('', 95);
      logInfo(`itemKeyOf(uri="", index=95): actual=${actual}`);
      expect(actual).assertEqual('95__');
      logInfo(`${BUNDLE}ItemKeyOf_0145 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0146
     * @tc.name      FilePreviewDLP_ItemKeyOf_0146
     * @tc.desc      itemKeyOf(uri="", index=105) returns "105__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0146 begin`);
      const actual: string = itemKeyOf('', 105);
      logInfo(`itemKeyOf(uri="", index=105): actual=${actual}`);
      expect(actual).assertEqual('105__');
      logInfo(`${BUNDLE}ItemKeyOf_0146 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0147
     * @tc.name      FilePreviewDLP_ItemKeyOf_0147
     * @tc.desc      itemKeyOf(uri="", index=110) returns "110__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0147 begin`);
      const actual: string = itemKeyOf('', 110);
      logInfo(`itemKeyOf(uri="", index=110): actual=${actual}`);
      expect(actual).assertEqual('110__');
      logInfo(`${BUNDLE}ItemKeyOf_0147 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0148
     * @tc.name      FilePreviewDLP_ItemKeyOf_0148
     * @tc.desc      itemKeyOf(uri="", index=12.14) returns "12.14__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0148 begin`);
      const actual: string = itemKeyOf('', 12.14);
      logInfo(`itemKeyOf(uri="", index=12.14): actual=${actual}`);
      expect(actual).assertEqual('12.14__');
      logInfo(`${BUNDLE}ItemKeyOf_0148 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0149
     * @tc.name      FilePreviewDLP_ItemKeyOf_0149
     * @tc.desc      itemKeyOf(uri="", index=99.84) returns "99.84__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0149 begin`);
      const actual: string = itemKeyOf('', 99.84);
      logInfo(`itemKeyOf(uri="", index=99.84): actual=${actual}`);
      expect(actual).assertEqual('99.84__');
      logInfo(`${BUNDLE}ItemKeyOf_0149 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0150
     * @tc.name      FilePreviewDLP_ItemKeyOf_0150
     * @tc.desc      itemKeyOf(uri="", index=-3) returns "-3__"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0150 begin`);
      const actual: string = itemKeyOf('', -3);
      logInfo(`itemKeyOf(uri="", index=-3): actual=${actual}`);
      expect(actual).assertEqual('-3__');
      logInfo(`${BUNDLE}ItemKeyOf_0150 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0151
     * @tc.name      FilePreviewDLP_ItemKeyOf_0151
     * @tc.desc      itemKeyOf(uri="not a url", index=0) returns "0__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0151 begin`);
      const actual: string = itemKeyOf('not a url', 0);
      logInfo(`itemKeyOf(uri="not a url", index=0): actual=${actual}`);
      expect(actual).assertEqual('0__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0151 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0152
     * @tc.name      FilePreviewDLP_ItemKeyOf_0152
     * @tc.desc      itemKeyOf(uri="not a url", index=1) returns "1__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0152 begin`);
      const actual: string = itemKeyOf('not a url', 1);
      logInfo(`itemKeyOf(uri="not a url", index=1): actual=${actual}`);
      expect(actual).assertEqual('1__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0152 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0153
     * @tc.name      FilePreviewDLP_ItemKeyOf_0153
     * @tc.desc      itemKeyOf(uri="not a url", index=2) returns "2__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0153 begin`);
      const actual: string = itemKeyOf('not a url', 2);
      logInfo(`itemKeyOf(uri="not a url", index=2): actual=${actual}`);
      expect(actual).assertEqual('2__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0153 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0154
     * @tc.name      FilePreviewDLP_ItemKeyOf_0154
     * @tc.desc      itemKeyOf(uri="not a url", index=-1) returns "-1__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0154 begin`);
      const actual: string = itemKeyOf('not a url', -1);
      logInfo(`itemKeyOf(uri="not a url", index=-1): actual=${actual}`);
      expect(actual).assertEqual('-1__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0154 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0155
     * @tc.name      FilePreviewDLP_ItemKeyOf_0155
     * @tc.desc      itemKeyOf(uri="not a url", index=5) returns "5__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0155 begin`);
      const actual: string = itemKeyOf('not a url', 5);
      logInfo(`itemKeyOf(uri="not a url", index=5): actual=${actual}`);
      expect(actual).assertEqual('5__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0155 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0156
     * @tc.name      FilePreviewDLP_ItemKeyOf_0156
     * @tc.desc      itemKeyOf(uri="not a url", index=10) returns "10__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0156 begin`);
      const actual: string = itemKeyOf('not a url', 10);
      logInfo(`itemKeyOf(uri="not a url", index=10): actual=${actual}`);
      expect(actual).assertEqual('10__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0156 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0157
     * @tc.name      FilePreviewDLP_ItemKeyOf_0157
     * @tc.desc      itemKeyOf(uri="not a url", index=3) returns "3__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0157 begin`);
      const actual: string = itemKeyOf('not a url', 3);
      logInfo(`itemKeyOf(uri="not a url", index=3): actual=${actual}`);
      expect(actual).assertEqual('3__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0157 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0158
     * @tc.name      FilePreviewDLP_ItemKeyOf_0158
     * @tc.desc      itemKeyOf(uri="not a url", index=100) returns "100__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0158 begin`);
      const actual: string = itemKeyOf('not a url', 100);
      logInfo(`itemKeyOf(uri="not a url", index=100): actual=${actual}`);
      expect(actual).assertEqual('100__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0158 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0159
     * @tc.name      FilePreviewDLP_ItemKeyOf_0159
     * @tc.desc      itemKeyOf(uri="not a url", index=15) returns "15__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0159 begin`);
      const actual: string = itemKeyOf('not a url', 15);
      logInfo(`itemKeyOf(uri="not a url", index=15): actual=${actual}`);
      expect(actual).assertEqual('15__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0159 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0160
     * @tc.name      FilePreviewDLP_ItemKeyOf_0160
     * @tc.desc      itemKeyOf(uri="not a url", index=20) returns "20__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0160 begin`);
      const actual: string = itemKeyOf('not a url', 20);
      logInfo(`itemKeyOf(uri="not a url", index=20): actual=${actual}`);
      expect(actual).assertEqual('20__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0160 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0161
     * @tc.name      FilePreviewDLP_ItemKeyOf_0161
     * @tc.desc      itemKeyOf(uri="not a url", index=25) returns "25__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0161 begin`);
      const actual: string = itemKeyOf('not a url', 25);
      logInfo(`itemKeyOf(uri="not a url", index=25): actual=${actual}`);
      expect(actual).assertEqual('25__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0161 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0162
     * @tc.name      FilePreviewDLP_ItemKeyOf_0162
     * @tc.desc      itemKeyOf(uri="not a url", index=30) returns "30__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0162 begin`);
      const actual: string = itemKeyOf('not a url', 30);
      logInfo(`itemKeyOf(uri="not a url", index=30): actual=${actual}`);
      expect(actual).assertEqual('30__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0162 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0163
     * @tc.name      FilePreviewDLP_ItemKeyOf_0163
     * @tc.desc      itemKeyOf(uri="not a url", index=35) returns "35__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0163 begin`);
      const actual: string = itemKeyOf('not a url', 35);
      logInfo(`itemKeyOf(uri="not a url", index=35): actual=${actual}`);
      expect(actual).assertEqual('35__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0163 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0164
     * @tc.name      FilePreviewDLP_ItemKeyOf_0164
     * @tc.desc      itemKeyOf(uri="not a url", index=40) returns "40__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0164 begin`);
      const actual: string = itemKeyOf('not a url', 40);
      logInfo(`itemKeyOf(uri="not a url", index=40): actual=${actual}`);
      expect(actual).assertEqual('40__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0164 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0165
     * @tc.name      FilePreviewDLP_ItemKeyOf_0165
     * @tc.desc      itemKeyOf(uri="not a url", index=45) returns "45__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0165 begin`);
      const actual: string = itemKeyOf('not a url', 45);
      logInfo(`itemKeyOf(uri="not a url", index=45): actual=${actual}`);
      expect(actual).assertEqual('45__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0165 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0166
     * @tc.name      FilePreviewDLP_ItemKeyOf_0166
     * @tc.desc      itemKeyOf(uri="not a url", index=50) returns "50__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0166 begin`);
      const actual: string = itemKeyOf('not a url', 50);
      logInfo(`itemKeyOf(uri="not a url", index=50): actual=${actual}`);
      expect(actual).assertEqual('50__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0166 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0167
     * @tc.name      FilePreviewDLP_ItemKeyOf_0167
     * @tc.desc      itemKeyOf(uri="not a url", index=55) returns "55__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0167 begin`);
      const actual: string = itemKeyOf('not a url', 55);
      logInfo(`itemKeyOf(uri="not a url", index=55): actual=${actual}`);
      expect(actual).assertEqual('55__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0167 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0168
     * @tc.name      FilePreviewDLP_ItemKeyOf_0168
     * @tc.desc      itemKeyOf(uri="not a url", index=60) returns "60__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0168 begin`);
      const actual: string = itemKeyOf('not a url', 60);
      logInfo(`itemKeyOf(uri="not a url", index=60): actual=${actual}`);
      expect(actual).assertEqual('60__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0168 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0169
     * @tc.name      FilePreviewDLP_ItemKeyOf_0169
     * @tc.desc      itemKeyOf(uri="not a url", index=65) returns "65__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0169 begin`);
      const actual: string = itemKeyOf('not a url', 65);
      logInfo(`itemKeyOf(uri="not a url", index=65): actual=${actual}`);
      expect(actual).assertEqual('65__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0169 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0170
     * @tc.name      FilePreviewDLP_ItemKeyOf_0170
     * @tc.desc      itemKeyOf(uri="not a url", index=70) returns "70__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0170 begin`);
      const actual: string = itemKeyOf('not a url', 70);
      logInfo(`itemKeyOf(uri="not a url", index=70): actual=${actual}`);
      expect(actual).assertEqual('70__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0170 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0171
     * @tc.name      FilePreviewDLP_ItemKeyOf_0171
     * @tc.desc      itemKeyOf(uri="not a url", index=75) returns "75__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0171 begin`);
      const actual: string = itemKeyOf('not a url', 75);
      logInfo(`itemKeyOf(uri="not a url", index=75): actual=${actual}`);
      expect(actual).assertEqual('75__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0171 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0172
     * @tc.name      FilePreviewDLP_ItemKeyOf_0172
     * @tc.desc      itemKeyOf(uri="not a url", index=80) returns "80__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0172 begin`);
      const actual: string = itemKeyOf('not a url', 80);
      logInfo(`itemKeyOf(uri="not a url", index=80): actual=${actual}`);
      expect(actual).assertEqual('80__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0172 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0173
     * @tc.name      FilePreviewDLP_ItemKeyOf_0173
     * @tc.desc      itemKeyOf(uri="not a url", index=85) returns "85__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0173 begin`);
      const actual: string = itemKeyOf('not a url', 85);
      logInfo(`itemKeyOf(uri="not a url", index=85): actual=${actual}`);
      expect(actual).assertEqual('85__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0173 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0174
     * @tc.name      FilePreviewDLP_ItemKeyOf_0174
     * @tc.desc      itemKeyOf(uri="not a url", index=90) returns "90__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0174 begin`);
      const actual: string = itemKeyOf('not a url', 90);
      logInfo(`itemKeyOf(uri="not a url", index=90): actual=${actual}`);
      expect(actual).assertEqual('90__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0174 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0175
     * @tc.name      FilePreviewDLP_ItemKeyOf_0175
     * @tc.desc      itemKeyOf(uri="not a url", index=95) returns "95__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0175 begin`);
      const actual: string = itemKeyOf('not a url', 95);
      logInfo(`itemKeyOf(uri="not a url", index=95): actual=${actual}`);
      expect(actual).assertEqual('95__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0175 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0176
     * @tc.name      FilePreviewDLP_ItemKeyOf_0176
     * @tc.desc      itemKeyOf(uri="not a url", index=105) returns "105__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0176 begin`);
      const actual: string = itemKeyOf('not a url', 105);
      logInfo(`itemKeyOf(uri="not a url", index=105): actual=${actual}`);
      expect(actual).assertEqual('105__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0176 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0177
     * @tc.name      FilePreviewDLP_ItemKeyOf_0177
     * @tc.desc      itemKeyOf(uri="not a url", index=110) returns "110__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0177 begin`);
      const actual: string = itemKeyOf('not a url', 110);
      logInfo(`itemKeyOf(uri="not a url", index=110): actual=${actual}`);
      expect(actual).assertEqual('110__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0177 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0178
     * @tc.name      FilePreviewDLP_ItemKeyOf_0178
     * @tc.desc      itemKeyOf(uri="not a url", index=12.14) returns "12.14__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0178 begin`);
      const actual: string = itemKeyOf('not a url', 12.14);
      logInfo(`itemKeyOf(uri="not a url", index=12.14): actual=${actual}`);
      expect(actual).assertEqual('12.14__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0178 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0179
     * @tc.name      FilePreviewDLP_ItemKeyOf_0179
     * @tc.desc      itemKeyOf(uri="not a url", index=99.84) returns "99.84__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0179 begin`);
      const actual: string = itemKeyOf('not a url', 99.84);
      logInfo(`itemKeyOf(uri="not a url", index=99.84): actual=${actual}`);
      expect(actual).assertEqual('99.84__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0179 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0180
     * @tc.name      FilePreviewDLP_ItemKeyOf_0180
     * @tc.desc      itemKeyOf(uri="not a url", index=-3) returns "-3__not a url"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0180 begin`);
      const actual: string = itemKeyOf('not a url', -3);
      logInfo(`itemKeyOf(uri="not a url", index=-3): actual=${actual}`);
      expect(actual).assertEqual('-3__not a url');
      logInfo(`${BUNDLE}ItemKeyOf_0180 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0181
     * @tc.name      FilePreviewDLP_ItemKeyOf_0181
     * @tc.desc      itemKeyOf(uri="a", index=0) returns "0__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0181 begin`);
      const actual: string = itemKeyOf('a', 0);
      logInfo(`itemKeyOf(uri="a", index=0): actual=${actual}`);
      expect(actual).assertEqual('0__a');
      logInfo(`${BUNDLE}ItemKeyOf_0181 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0182
     * @tc.name      FilePreviewDLP_ItemKeyOf_0182
     * @tc.desc      itemKeyOf(uri="a", index=1) returns "1__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0182 begin`);
      const actual: string = itemKeyOf('a', 1);
      logInfo(`itemKeyOf(uri="a", index=1): actual=${actual}`);
      expect(actual).assertEqual('1__a');
      logInfo(`${BUNDLE}ItemKeyOf_0182 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0183
     * @tc.name      FilePreviewDLP_ItemKeyOf_0183
     * @tc.desc      itemKeyOf(uri="a", index=2) returns "2__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0183 begin`);
      const actual: string = itemKeyOf('a', 2);
      logInfo(`itemKeyOf(uri="a", index=2): actual=${actual}`);
      expect(actual).assertEqual('2__a');
      logInfo(`${BUNDLE}ItemKeyOf_0183 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0184
     * @tc.name      FilePreviewDLP_ItemKeyOf_0184
     * @tc.desc      itemKeyOf(uri="a", index=-1) returns "-1__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0184 begin`);
      const actual: string = itemKeyOf('a', -1);
      logInfo(`itemKeyOf(uri="a", index=-1): actual=${actual}`);
      expect(actual).assertEqual('-1__a');
      logInfo(`${BUNDLE}ItemKeyOf_0184 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0185
     * @tc.name      FilePreviewDLP_ItemKeyOf_0185
     * @tc.desc      itemKeyOf(uri="a", index=5) returns "5__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0185 begin`);
      const actual: string = itemKeyOf('a', 5);
      logInfo(`itemKeyOf(uri="a", index=5): actual=${actual}`);
      expect(actual).assertEqual('5__a');
      logInfo(`${BUNDLE}ItemKeyOf_0185 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0186
     * @tc.name      FilePreviewDLP_ItemKeyOf_0186
     * @tc.desc      itemKeyOf(uri="a", index=10) returns "10__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0186 begin`);
      const actual: string = itemKeyOf('a', 10);
      logInfo(`itemKeyOf(uri="a", index=10): actual=${actual}`);
      expect(actual).assertEqual('10__a');
      logInfo(`${BUNDLE}ItemKeyOf_0186 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0187
     * @tc.name      FilePreviewDLP_ItemKeyOf_0187
     * @tc.desc      itemKeyOf(uri="a", index=3) returns "3__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0187 begin`);
      const actual: string = itemKeyOf('a', 3);
      logInfo(`itemKeyOf(uri="a", index=3): actual=${actual}`);
      expect(actual).assertEqual('3__a');
      logInfo(`${BUNDLE}ItemKeyOf_0187 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0188
     * @tc.name      FilePreviewDLP_ItemKeyOf_0188
     * @tc.desc      itemKeyOf(uri="a", index=100) returns "100__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0188 begin`);
      const actual: string = itemKeyOf('a', 100);
      logInfo(`itemKeyOf(uri="a", index=100): actual=${actual}`);
      expect(actual).assertEqual('100__a');
      logInfo(`${BUNDLE}ItemKeyOf_0188 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0189
     * @tc.name      FilePreviewDLP_ItemKeyOf_0189
     * @tc.desc      itemKeyOf(uri="a", index=15) returns "15__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0189 begin`);
      const actual: string = itemKeyOf('a', 15);
      logInfo(`itemKeyOf(uri="a", index=15): actual=${actual}`);
      expect(actual).assertEqual('15__a');
      logInfo(`${BUNDLE}ItemKeyOf_0189 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0190
     * @tc.name      FilePreviewDLP_ItemKeyOf_0190
     * @tc.desc      itemKeyOf(uri="a", index=20) returns "20__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0190 begin`);
      const actual: string = itemKeyOf('a', 20);
      logInfo(`itemKeyOf(uri="a", index=20): actual=${actual}`);
      expect(actual).assertEqual('20__a');
      logInfo(`${BUNDLE}ItemKeyOf_0190 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0191
     * @tc.name      FilePreviewDLP_ItemKeyOf_0191
     * @tc.desc      itemKeyOf(uri="a", index=25) returns "25__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0191 begin`);
      const actual: string = itemKeyOf('a', 25);
      logInfo(`itemKeyOf(uri="a", index=25): actual=${actual}`);
      expect(actual).assertEqual('25__a');
      logInfo(`${BUNDLE}ItemKeyOf_0191 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0192
     * @tc.name      FilePreviewDLP_ItemKeyOf_0192
     * @tc.desc      itemKeyOf(uri="a", index=30) returns "30__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0192 begin`);
      const actual: string = itemKeyOf('a', 30);
      logInfo(`itemKeyOf(uri="a", index=30): actual=${actual}`);
      expect(actual).assertEqual('30__a');
      logInfo(`${BUNDLE}ItemKeyOf_0192 end`);
    });
  });
}
