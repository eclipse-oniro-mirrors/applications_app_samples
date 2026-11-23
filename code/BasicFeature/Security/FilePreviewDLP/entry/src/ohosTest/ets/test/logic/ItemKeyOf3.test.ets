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

/** Logic checks for itemKeyOf (74 cases). */
export default function itemKeyOf3Test(): void {
  describe('ItemKeyOf3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0193
     * @tc.name      FilePreviewDLP_ItemKeyOf_0193
     * @tc.desc      itemKeyOf(uri="a", index=35) returns "35__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0193 begin`);
      const actual: string = itemKeyOf('a', 35);
      logInfo(`itemKeyOf(uri="a", index=35): actual=${actual}`);
      expect(actual).assertEqual('35__a');
      logInfo(`${BUNDLE}ItemKeyOf_0193 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0194
     * @tc.name      FilePreviewDLP_ItemKeyOf_0194
     * @tc.desc      itemKeyOf(uri="a", index=40) returns "40__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0194 begin`);
      const actual: string = itemKeyOf('a', 40);
      logInfo(`itemKeyOf(uri="a", index=40): actual=${actual}`);
      expect(actual).assertEqual('40__a');
      logInfo(`${BUNDLE}ItemKeyOf_0194 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0195
     * @tc.name      FilePreviewDLP_ItemKeyOf_0195
     * @tc.desc      itemKeyOf(uri="a", index=45) returns "45__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0195 begin`);
      const actual: string = itemKeyOf('a', 45);
      logInfo(`itemKeyOf(uri="a", index=45): actual=${actual}`);
      expect(actual).assertEqual('45__a');
      logInfo(`${BUNDLE}ItemKeyOf_0195 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0196
     * @tc.name      FilePreviewDLP_ItemKeyOf_0196
     * @tc.desc      itemKeyOf(uri="a", index=50) returns "50__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0196 begin`);
      const actual: string = itemKeyOf('a', 50);
      logInfo(`itemKeyOf(uri="a", index=50): actual=${actual}`);
      expect(actual).assertEqual('50__a');
      logInfo(`${BUNDLE}ItemKeyOf_0196 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0197
     * @tc.name      FilePreviewDLP_ItemKeyOf_0197
     * @tc.desc      itemKeyOf(uri="a", index=55) returns "55__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0197 begin`);
      const actual: string = itemKeyOf('a', 55);
      logInfo(`itemKeyOf(uri="a", index=55): actual=${actual}`);
      expect(actual).assertEqual('55__a');
      logInfo(`${BUNDLE}ItemKeyOf_0197 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0198
     * @tc.name      FilePreviewDLP_ItemKeyOf_0198
     * @tc.desc      itemKeyOf(uri="a", index=60) returns "60__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0198 begin`);
      const actual: string = itemKeyOf('a', 60);
      logInfo(`itemKeyOf(uri="a", index=60): actual=${actual}`);
      expect(actual).assertEqual('60__a');
      logInfo(`${BUNDLE}ItemKeyOf_0198 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0199
     * @tc.name      FilePreviewDLP_ItemKeyOf_0199
     * @tc.desc      itemKeyOf(uri="a", index=65) returns "65__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0199 begin`);
      const actual: string = itemKeyOf('a', 65);
      logInfo(`itemKeyOf(uri="a", index=65): actual=${actual}`);
      expect(actual).assertEqual('65__a');
      logInfo(`${BUNDLE}ItemKeyOf_0199 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0200
     * @tc.name      FilePreviewDLP_ItemKeyOf_0200
     * @tc.desc      itemKeyOf(uri="a", index=70) returns "70__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0200 begin`);
      const actual: string = itemKeyOf('a', 70);
      logInfo(`itemKeyOf(uri="a", index=70): actual=${actual}`);
      expect(actual).assertEqual('70__a');
      logInfo(`${BUNDLE}ItemKeyOf_0200 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0201
     * @tc.name      FilePreviewDLP_ItemKeyOf_0201
     * @tc.desc      itemKeyOf(uri="a", index=75) returns "75__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0201 begin`);
      const actual: string = itemKeyOf('a', 75);
      logInfo(`itemKeyOf(uri="a", index=75): actual=${actual}`);
      expect(actual).assertEqual('75__a');
      logInfo(`${BUNDLE}ItemKeyOf_0201 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0202
     * @tc.name      FilePreviewDLP_ItemKeyOf_0202
     * @tc.desc      itemKeyOf(uri="a", index=80) returns "80__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0202 begin`);
      const actual: string = itemKeyOf('a', 80);
      logInfo(`itemKeyOf(uri="a", index=80): actual=${actual}`);
      expect(actual).assertEqual('80__a');
      logInfo(`${BUNDLE}ItemKeyOf_0202 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0203
     * @tc.name      FilePreviewDLP_ItemKeyOf_0203
     * @tc.desc      itemKeyOf(uri="a", index=85) returns "85__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0203 begin`);
      const actual: string = itemKeyOf('a', 85);
      logInfo(`itemKeyOf(uri="a", index=85): actual=${actual}`);
      expect(actual).assertEqual('85__a');
      logInfo(`${BUNDLE}ItemKeyOf_0203 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0204
     * @tc.name      FilePreviewDLP_ItemKeyOf_0204
     * @tc.desc      itemKeyOf(uri="a", index=90) returns "90__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0204 begin`);
      const actual: string = itemKeyOf('a', 90);
      logInfo(`itemKeyOf(uri="a", index=90): actual=${actual}`);
      expect(actual).assertEqual('90__a');
      logInfo(`${BUNDLE}ItemKeyOf_0204 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0205
     * @tc.name      FilePreviewDLP_ItemKeyOf_0205
     * @tc.desc      itemKeyOf(uri="a", index=95) returns "95__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0205 begin`);
      const actual: string = itemKeyOf('a', 95);
      logInfo(`itemKeyOf(uri="a", index=95): actual=${actual}`);
      expect(actual).assertEqual('95__a');
      logInfo(`${BUNDLE}ItemKeyOf_0205 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0206
     * @tc.name      FilePreviewDLP_ItemKeyOf_0206
     * @tc.desc      itemKeyOf(uri="a", index=105) returns "105__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0206 begin`);
      const actual: string = itemKeyOf('a', 105);
      logInfo(`itemKeyOf(uri="a", index=105): actual=${actual}`);
      expect(actual).assertEqual('105__a');
      logInfo(`${BUNDLE}ItemKeyOf_0206 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0207
     * @tc.name      FilePreviewDLP_ItemKeyOf_0207
     * @tc.desc      itemKeyOf(uri="a", index=110) returns "110__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0207 begin`);
      const actual: string = itemKeyOf('a', 110);
      logInfo(`itemKeyOf(uri="a", index=110): actual=${actual}`);
      expect(actual).assertEqual('110__a');
      logInfo(`${BUNDLE}ItemKeyOf_0207 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0208
     * @tc.name      FilePreviewDLP_ItemKeyOf_0208
     * @tc.desc      itemKeyOf(uri="a", index=12.14) returns "12.14__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0208 begin`);
      const actual: string = itemKeyOf('a', 12.14);
      logInfo(`itemKeyOf(uri="a", index=12.14): actual=${actual}`);
      expect(actual).assertEqual('12.14__a');
      logInfo(`${BUNDLE}ItemKeyOf_0208 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0209
     * @tc.name      FilePreviewDLP_ItemKeyOf_0209
     * @tc.desc      itemKeyOf(uri="a", index=99.84) returns "99.84__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0209 begin`);
      const actual: string = itemKeyOf('a', 99.84);
      logInfo(`itemKeyOf(uri="a", index=99.84): actual=${actual}`);
      expect(actual).assertEqual('99.84__a');
      logInfo(`${BUNDLE}ItemKeyOf_0209 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0210
     * @tc.name      FilePreviewDLP_ItemKeyOf_0210
     * @tc.desc      itemKeyOf(uri="a", index=-3) returns "-3__a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0210 begin`);
      const actual: string = itemKeyOf('a', -3);
      logInfo(`itemKeyOf(uri="a", index=-3): actual=${actual}`);
      expect(actual).assertEqual('-3__a');
      logInfo(`${BUNDLE}ItemKeyOf_0210 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0211
     * @tc.name      FilePreviewDLP_ItemKeyOf_0211
     * @tc.desc      itemKeyOf(uri="abc", index=0) returns "0__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0211 begin`);
      const actual: string = itemKeyOf('abc', 0);
      logInfo(`itemKeyOf(uri="abc", index=0): actual=${actual}`);
      expect(actual).assertEqual('0__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0211 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0212
     * @tc.name      FilePreviewDLP_ItemKeyOf_0212
     * @tc.desc      itemKeyOf(uri="abc", index=1) returns "1__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0212 begin`);
      const actual: string = itemKeyOf('abc', 1);
      logInfo(`itemKeyOf(uri="abc", index=1): actual=${actual}`);
      expect(actual).assertEqual('1__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0212 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0213
     * @tc.name      FilePreviewDLP_ItemKeyOf_0213
     * @tc.desc      itemKeyOf(uri="abc", index=2) returns "2__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0213 begin`);
      const actual: string = itemKeyOf('abc', 2);
      logInfo(`itemKeyOf(uri="abc", index=2): actual=${actual}`);
      expect(actual).assertEqual('2__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0213 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0214
     * @tc.name      FilePreviewDLP_ItemKeyOf_0214
     * @tc.desc      itemKeyOf(uri="abc", index=-1) returns "-1__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0214 begin`);
      const actual: string = itemKeyOf('abc', -1);
      logInfo(`itemKeyOf(uri="abc", index=-1): actual=${actual}`);
      expect(actual).assertEqual('-1__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0214 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0215
     * @tc.name      FilePreviewDLP_ItemKeyOf_0215
     * @tc.desc      itemKeyOf(uri="abc", index=5) returns "5__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0215 begin`);
      const actual: string = itemKeyOf('abc', 5);
      logInfo(`itemKeyOf(uri="abc", index=5): actual=${actual}`);
      expect(actual).assertEqual('5__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0215 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0216
     * @tc.name      FilePreviewDLP_ItemKeyOf_0216
     * @tc.desc      itemKeyOf(uri="abc", index=10) returns "10__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0216 begin`);
      const actual: string = itemKeyOf('abc', 10);
      logInfo(`itemKeyOf(uri="abc", index=10): actual=${actual}`);
      expect(actual).assertEqual('10__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0216 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0217
     * @tc.name      FilePreviewDLP_ItemKeyOf_0217
     * @tc.desc      itemKeyOf(uri="abc", index=3) returns "3__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0217 begin`);
      const actual: string = itemKeyOf('abc', 3);
      logInfo(`itemKeyOf(uri="abc", index=3): actual=${actual}`);
      expect(actual).assertEqual('3__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0217 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0218
     * @tc.name      FilePreviewDLP_ItemKeyOf_0218
     * @tc.desc      itemKeyOf(uri="abc", index=100) returns "100__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0218 begin`);
      const actual: string = itemKeyOf('abc', 100);
      logInfo(`itemKeyOf(uri="abc", index=100): actual=${actual}`);
      expect(actual).assertEqual('100__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0218 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0219
     * @tc.name      FilePreviewDLP_ItemKeyOf_0219
     * @tc.desc      itemKeyOf(uri="abc", index=15) returns "15__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0219 begin`);
      const actual: string = itemKeyOf('abc', 15);
      logInfo(`itemKeyOf(uri="abc", index=15): actual=${actual}`);
      expect(actual).assertEqual('15__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0219 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0220
     * @tc.name      FilePreviewDLP_ItemKeyOf_0220
     * @tc.desc      itemKeyOf(uri="abc", index=20) returns "20__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0220 begin`);
      const actual: string = itemKeyOf('abc', 20);
      logInfo(`itemKeyOf(uri="abc", index=20): actual=${actual}`);
      expect(actual).assertEqual('20__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0220 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0221
     * @tc.name      FilePreviewDLP_ItemKeyOf_0221
     * @tc.desc      itemKeyOf(uri="abc", index=25) returns "25__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0221 begin`);
      const actual: string = itemKeyOf('abc', 25);
      logInfo(`itemKeyOf(uri="abc", index=25): actual=${actual}`);
      expect(actual).assertEqual('25__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0221 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0222
     * @tc.name      FilePreviewDLP_ItemKeyOf_0222
     * @tc.desc      itemKeyOf(uri="abc", index=30) returns "30__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0222 begin`);
      const actual: string = itemKeyOf('abc', 30);
      logInfo(`itemKeyOf(uri="abc", index=30): actual=${actual}`);
      expect(actual).assertEqual('30__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0222 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0223
     * @tc.name      FilePreviewDLP_ItemKeyOf_0223
     * @tc.desc      itemKeyOf(uri="abc", index=35) returns "35__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0223 begin`);
      const actual: string = itemKeyOf('abc', 35);
      logInfo(`itemKeyOf(uri="abc", index=35): actual=${actual}`);
      expect(actual).assertEqual('35__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0223 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0224
     * @tc.name      FilePreviewDLP_ItemKeyOf_0224
     * @tc.desc      itemKeyOf(uri="abc", index=40) returns "40__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0224 begin`);
      const actual: string = itemKeyOf('abc', 40);
      logInfo(`itemKeyOf(uri="abc", index=40): actual=${actual}`);
      expect(actual).assertEqual('40__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0224 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0225
     * @tc.name      FilePreviewDLP_ItemKeyOf_0225
     * @tc.desc      itemKeyOf(uri="abc", index=45) returns "45__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0225 begin`);
      const actual: string = itemKeyOf('abc', 45);
      logInfo(`itemKeyOf(uri="abc", index=45): actual=${actual}`);
      expect(actual).assertEqual('45__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0225 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0226
     * @tc.name      FilePreviewDLP_ItemKeyOf_0226
     * @tc.desc      itemKeyOf(uri="abc", index=50) returns "50__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0226 begin`);
      const actual: string = itemKeyOf('abc', 50);
      logInfo(`itemKeyOf(uri="abc", index=50): actual=${actual}`);
      expect(actual).assertEqual('50__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0226 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0227
     * @tc.name      FilePreviewDLP_ItemKeyOf_0227
     * @tc.desc      itemKeyOf(uri="abc", index=55) returns "55__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0227 begin`);
      const actual: string = itemKeyOf('abc', 55);
      logInfo(`itemKeyOf(uri="abc", index=55): actual=${actual}`);
      expect(actual).assertEqual('55__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0227 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0228
     * @tc.name      FilePreviewDLP_ItemKeyOf_0228
     * @tc.desc      itemKeyOf(uri="abc", index=60) returns "60__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0228 begin`);
      const actual: string = itemKeyOf('abc', 60);
      logInfo(`itemKeyOf(uri="abc", index=60): actual=${actual}`);
      expect(actual).assertEqual('60__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0228 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0229
     * @tc.name      FilePreviewDLP_ItemKeyOf_0229
     * @tc.desc      itemKeyOf(uri="abc", index=65) returns "65__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0229 begin`);
      const actual: string = itemKeyOf('abc', 65);
      logInfo(`itemKeyOf(uri="abc", index=65): actual=${actual}`);
      expect(actual).assertEqual('65__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0229 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0230
     * @tc.name      FilePreviewDLP_ItemKeyOf_0230
     * @tc.desc      itemKeyOf(uri="abc", index=70) returns "70__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0230 begin`);
      const actual: string = itemKeyOf('abc', 70);
      logInfo(`itemKeyOf(uri="abc", index=70): actual=${actual}`);
      expect(actual).assertEqual('70__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0230 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0231
     * @tc.name      FilePreviewDLP_ItemKeyOf_0231
     * @tc.desc      itemKeyOf(uri="abc", index=75) returns "75__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0231 begin`);
      const actual: string = itemKeyOf('abc', 75);
      logInfo(`itemKeyOf(uri="abc", index=75): actual=${actual}`);
      expect(actual).assertEqual('75__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0231 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0232
     * @tc.name      FilePreviewDLP_ItemKeyOf_0232
     * @tc.desc      itemKeyOf(uri="abc", index=80) returns "80__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0232 begin`);
      const actual: string = itemKeyOf('abc', 80);
      logInfo(`itemKeyOf(uri="abc", index=80): actual=${actual}`);
      expect(actual).assertEqual('80__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0232 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0233
     * @tc.name      FilePreviewDLP_ItemKeyOf_0233
     * @tc.desc      itemKeyOf(uri="abc", index=85) returns "85__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0233 begin`);
      const actual: string = itemKeyOf('abc', 85);
      logInfo(`itemKeyOf(uri="abc", index=85): actual=${actual}`);
      expect(actual).assertEqual('85__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0233 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0234
     * @tc.name      FilePreviewDLP_ItemKeyOf_0234
     * @tc.desc      itemKeyOf(uri="abc", index=90) returns "90__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0234 begin`);
      const actual: string = itemKeyOf('abc', 90);
      logInfo(`itemKeyOf(uri="abc", index=90): actual=${actual}`);
      expect(actual).assertEqual('90__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0234 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0235
     * @tc.name      FilePreviewDLP_ItemKeyOf_0235
     * @tc.desc      itemKeyOf(uri="abc", index=95) returns "95__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0235 begin`);
      const actual: string = itemKeyOf('abc', 95);
      logInfo(`itemKeyOf(uri="abc", index=95): actual=${actual}`);
      expect(actual).assertEqual('95__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0235 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0236
     * @tc.name      FilePreviewDLP_ItemKeyOf_0236
     * @tc.desc      itemKeyOf(uri="abc", index=105) returns "105__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0236 begin`);
      const actual: string = itemKeyOf('abc', 105);
      logInfo(`itemKeyOf(uri="abc", index=105): actual=${actual}`);
      expect(actual).assertEqual('105__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0236 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0237
     * @tc.name      FilePreviewDLP_ItemKeyOf_0237
     * @tc.desc      itemKeyOf(uri="abc", index=110) returns "110__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0237 begin`);
      const actual: string = itemKeyOf('abc', 110);
      logInfo(`itemKeyOf(uri="abc", index=110): actual=${actual}`);
      expect(actual).assertEqual('110__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0237 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0238
     * @tc.name      FilePreviewDLP_ItemKeyOf_0238
     * @tc.desc      itemKeyOf(uri="abc", index=12.14) returns "12.14__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0238 begin`);
      const actual: string = itemKeyOf('abc', 12.14);
      logInfo(`itemKeyOf(uri="abc", index=12.14): actual=${actual}`);
      expect(actual).assertEqual('12.14__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0238 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0239
     * @tc.name      FilePreviewDLP_ItemKeyOf_0239
     * @tc.desc      itemKeyOf(uri="abc", index=99.84) returns "99.84__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0239 begin`);
      const actual: string = itemKeyOf('abc', 99.84);
      logInfo(`itemKeyOf(uri="abc", index=99.84): actual=${actual}`);
      expect(actual).assertEqual('99.84__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0239 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0240
     * @tc.name      FilePreviewDLP_ItemKeyOf_0240
     * @tc.desc      itemKeyOf(uri="abc", index=-3) returns "-3__abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0240 begin`);
      const actual: string = itemKeyOf('abc', -3);
      logInfo(`itemKeyOf(uri="abc", index=-3): actual=${actual}`);
      expect(actual).assertEqual('-3__abc');
      logInfo(`${BUNDLE}ItemKeyOf_0240 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0241
     * @tc.name      FilePreviewDLP_ItemKeyOf_0241
     * @tc.desc      itemKeyOf(uri="Hello World", index=0) returns "0__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0241 begin`);
      const actual: string = itemKeyOf('Hello World', 0);
      logInfo(`itemKeyOf(uri="Hello World", index=0): actual=${actual}`);
      expect(actual).assertEqual('0__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0241 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0242
     * @tc.name      FilePreviewDLP_ItemKeyOf_0242
     * @tc.desc      itemKeyOf(uri="Hello World", index=1) returns "1__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0242 begin`);
      const actual: string = itemKeyOf('Hello World', 1);
      logInfo(`itemKeyOf(uri="Hello World", index=1): actual=${actual}`);
      expect(actual).assertEqual('1__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0242 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0243
     * @tc.name      FilePreviewDLP_ItemKeyOf_0243
     * @tc.desc      itemKeyOf(uri="Hello World", index=2) returns "2__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0243 begin`);
      const actual: string = itemKeyOf('Hello World', 2);
      logInfo(`itemKeyOf(uri="Hello World", index=2): actual=${actual}`);
      expect(actual).assertEqual('2__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0243 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0244
     * @tc.name      FilePreviewDLP_ItemKeyOf_0244
     * @tc.desc      itemKeyOf(uri="Hello World", index=-1) returns "-1__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FilePreviewDLP_ItemKeyOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0244 begin`);
      const actual: string = itemKeyOf('Hello World', -1);
      logInfo(`itemKeyOf(uri="Hello World", index=-1): actual=${actual}`);
      expect(actual).assertEqual('-1__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0244 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0245
     * @tc.name      FilePreviewDLP_ItemKeyOf_0245
     * @tc.desc      itemKeyOf(uri="Hello World", index=5) returns "5__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0245 begin`);
      const actual: string = itemKeyOf('Hello World', 5);
      logInfo(`itemKeyOf(uri="Hello World", index=5): actual=${actual}`);
      expect(actual).assertEqual('5__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0245 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0246
     * @tc.name      FilePreviewDLP_ItemKeyOf_0246
     * @tc.desc      itemKeyOf(uri="Hello World", index=10) returns "10__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0246 begin`);
      const actual: string = itemKeyOf('Hello World', 10);
      logInfo(`itemKeyOf(uri="Hello World", index=10): actual=${actual}`);
      expect(actual).assertEqual('10__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0246 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0247
     * @tc.name      FilePreviewDLP_ItemKeyOf_0247
     * @tc.desc      itemKeyOf(uri="Hello World", index=3) returns "3__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0247 begin`);
      const actual: string = itemKeyOf('Hello World', 3);
      logInfo(`itemKeyOf(uri="Hello World", index=3): actual=${actual}`);
      expect(actual).assertEqual('3__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0247 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0248
     * @tc.name      FilePreviewDLP_ItemKeyOf_0248
     * @tc.desc      itemKeyOf(uri="Hello World", index=100) returns "100__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0248 begin`);
      const actual: string = itemKeyOf('Hello World', 100);
      logInfo(`itemKeyOf(uri="Hello World", index=100): actual=${actual}`);
      expect(actual).assertEqual('100__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0248 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0249
     * @tc.name      FilePreviewDLP_ItemKeyOf_0249
     * @tc.desc      itemKeyOf(uri="Hello World", index=15) returns "15__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0249 begin`);
      const actual: string = itemKeyOf('Hello World', 15);
      logInfo(`itemKeyOf(uri="Hello World", index=15): actual=${actual}`);
      expect(actual).assertEqual('15__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0249 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0250
     * @tc.name      FilePreviewDLP_ItemKeyOf_0250
     * @tc.desc      itemKeyOf(uri="Hello World", index=20) returns "20__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0250 begin`);
      const actual: string = itemKeyOf('Hello World', 20);
      logInfo(`itemKeyOf(uri="Hello World", index=20): actual=${actual}`);
      expect(actual).assertEqual('20__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0250 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0251
     * @tc.name      FilePreviewDLP_ItemKeyOf_0251
     * @tc.desc      itemKeyOf(uri="Hello World", index=25) returns "25__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0251 begin`);
      const actual: string = itemKeyOf('Hello World', 25);
      logInfo(`itemKeyOf(uri="Hello World", index=25): actual=${actual}`);
      expect(actual).assertEqual('25__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0251 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0252
     * @tc.name      FilePreviewDLP_ItemKeyOf_0252
     * @tc.desc      itemKeyOf(uri="Hello World", index=30) returns "30__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0252 begin`);
      const actual: string = itemKeyOf('Hello World', 30);
      logInfo(`itemKeyOf(uri="Hello World", index=30): actual=${actual}`);
      expect(actual).assertEqual('30__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0252 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0253
     * @tc.name      FilePreviewDLP_ItemKeyOf_0253
     * @tc.desc      itemKeyOf(uri="Hello World", index=35) returns "35__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0253 begin`);
      const actual: string = itemKeyOf('Hello World', 35);
      logInfo(`itemKeyOf(uri="Hello World", index=35): actual=${actual}`);
      expect(actual).assertEqual('35__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0253 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0254
     * @tc.name      FilePreviewDLP_ItemKeyOf_0254
     * @tc.desc      itemKeyOf(uri="Hello World", index=40) returns "40__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0254 begin`);
      const actual: string = itemKeyOf('Hello World', 40);
      logInfo(`itemKeyOf(uri="Hello World", index=40): actual=${actual}`);
      expect(actual).assertEqual('40__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0254 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0255
     * @tc.name      FilePreviewDLP_ItemKeyOf_0255
     * @tc.desc      itemKeyOf(uri="Hello World", index=45) returns "45__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0255 begin`);
      const actual: string = itemKeyOf('Hello World', 45);
      logInfo(`itemKeyOf(uri="Hello World", index=45): actual=${actual}`);
      expect(actual).assertEqual('45__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0255 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0256
     * @tc.name      FilePreviewDLP_ItemKeyOf_0256
     * @tc.desc      itemKeyOf(uri="Hello World", index=50) returns "50__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0256 begin`);
      const actual: string = itemKeyOf('Hello World', 50);
      logInfo(`itemKeyOf(uri="Hello World", index=50): actual=${actual}`);
      expect(actual).assertEqual('50__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0256 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0257
     * @tc.name      FilePreviewDLP_ItemKeyOf_0257
     * @tc.desc      itemKeyOf(uri="Hello World", index=55) returns "55__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0257 begin`);
      const actual: string = itemKeyOf('Hello World', 55);
      logInfo(`itemKeyOf(uri="Hello World", index=55): actual=${actual}`);
      expect(actual).assertEqual('55__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0257 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0258
     * @tc.name      FilePreviewDLP_ItemKeyOf_0258
     * @tc.desc      itemKeyOf(uri="Hello World", index=60) returns "60__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0258 begin`);
      const actual: string = itemKeyOf('Hello World', 60);
      logInfo(`itemKeyOf(uri="Hello World", index=60): actual=${actual}`);
      expect(actual).assertEqual('60__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0258 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0259
     * @tc.name      FilePreviewDLP_ItemKeyOf_0259
     * @tc.desc      itemKeyOf(uri="Hello World", index=65) returns "65__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0259 begin`);
      const actual: string = itemKeyOf('Hello World', 65);
      logInfo(`itemKeyOf(uri="Hello World", index=65): actual=${actual}`);
      expect(actual).assertEqual('65__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0259 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0260
     * @tc.name      FilePreviewDLP_ItemKeyOf_0260
     * @tc.desc      itemKeyOf(uri="Hello World", index=70) returns "70__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0260 begin`);
      const actual: string = itemKeyOf('Hello World', 70);
      logInfo(`itemKeyOf(uri="Hello World", index=70): actual=${actual}`);
      expect(actual).assertEqual('70__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0260 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0261
     * @tc.name      FilePreviewDLP_ItemKeyOf_0261
     * @tc.desc      itemKeyOf(uri="Hello World", index=75) returns "75__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0261 begin`);
      const actual: string = itemKeyOf('Hello World', 75);
      logInfo(`itemKeyOf(uri="Hello World", index=75): actual=${actual}`);
      expect(actual).assertEqual('75__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0261 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0262
     * @tc.name      FilePreviewDLP_ItemKeyOf_0262
     * @tc.desc      itemKeyOf(uri="Hello World", index=80) returns "80__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0262 begin`);
      const actual: string = itemKeyOf('Hello World', 80);
      logInfo(`itemKeyOf(uri="Hello World", index=80): actual=${actual}`);
      expect(actual).assertEqual('80__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0262 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0263
     * @tc.name      FilePreviewDLP_ItemKeyOf_0263
     * @tc.desc      itemKeyOf(uri="Hello World", index=85) returns "85__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0263 begin`);
      const actual: string = itemKeyOf('Hello World', 85);
      logInfo(`itemKeyOf(uri="Hello World", index=85): actual=${actual}`);
      expect(actual).assertEqual('85__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0263 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0264
     * @tc.name      FilePreviewDLP_ItemKeyOf_0264
     * @tc.desc      itemKeyOf(uri="Hello World", index=90) returns "90__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0264 begin`);
      const actual: string = itemKeyOf('Hello World', 90);
      logInfo(`itemKeyOf(uri="Hello World", index=90): actual=${actual}`);
      expect(actual).assertEqual('90__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0264 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0265
     * @tc.name      FilePreviewDLP_ItemKeyOf_0265
     * @tc.desc      itemKeyOf(uri="Hello World", index=95) returns "95__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0265 begin`);
      const actual: string = itemKeyOf('Hello World', 95);
      logInfo(`itemKeyOf(uri="Hello World", index=95): actual=${actual}`);
      expect(actual).assertEqual('95__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0265 end`);
    });

    /**
     * @tc.number    SUB_FILEPREVIEWDLP_ITEM_KEY_OF_0266
     * @tc.name      FilePreviewDLP_ItemKeyOf_0266
     * @tc.desc      itemKeyOf(uri="Hello World", index=105) returns "105__Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FilePreviewDLP_ItemKeyOf_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ItemKeyOf_0266 begin`);
      const actual: string = itemKeyOf('Hello World', 105);
      logInfo(`itemKeyOf(uri="Hello World", index=105): actual=${actual}`);
      expect(actual).assertEqual('105__Hello World');
      logInfo(`${BUNDLE}ItemKeyOf_0266 end`);
    });
  });
}
