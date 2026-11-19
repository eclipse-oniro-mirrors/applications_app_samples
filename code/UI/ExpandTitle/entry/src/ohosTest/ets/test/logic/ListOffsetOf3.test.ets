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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { listOffsetOf } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for listOffsetOf (50 cases). */
export default function listOffsetOf3Test(): void {
  describe('ListOffsetOf3Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0193
     * @tc.name      ExpandTitle_ListOffsetOf_0193
     * @tc.desc      listOffsetOf(offset=2, yOffset=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0193 begin`);
      const actual: number = listOffsetOf(2, 25);
      logInfo(`listOffsetOf(offset=2, yOffset=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0193 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0194
     * @tc.name      ExpandTitle_ListOffsetOf_0194
     * @tc.desc      listOffsetOf(offset=2, yOffset=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0194 begin`);
      const actual: number = listOffsetOf(2, 30);
      logInfo(`listOffsetOf(offset=2, yOffset=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0194 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0195
     * @tc.name      ExpandTitle_ListOffsetOf_0195
     * @tc.desc      listOffsetOf(offset=2, yOffset=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0195 begin`);
      const actual: number = listOffsetOf(2, 35);
      logInfo(`listOffsetOf(offset=2, yOffset=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0195 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0196
     * @tc.name      ExpandTitle_ListOffsetOf_0196
     * @tc.desc      listOffsetOf(offset=2, yOffset=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0196 begin`);
      const actual: number = listOffsetOf(2, 40);
      logInfo(`listOffsetOf(offset=2, yOffset=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0196 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0197
     * @tc.name      ExpandTitle_ListOffsetOf_0197
     * @tc.desc      listOffsetOf(offset=2, yOffset=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0197 begin`);
      const actual: number = listOffsetOf(2, 45);
      logInfo(`listOffsetOf(offset=2, yOffset=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0197 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0198
     * @tc.name      ExpandTitle_ListOffsetOf_0198
     * @tc.desc      listOffsetOf(offset=2, yOffset=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0198 begin`);
      const actual: number = listOffsetOf(2, 55);
      logInfo(`listOffsetOf(offset=2, yOffset=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0198 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0199
     * @tc.name      ExpandTitle_ListOffsetOf_0199
     * @tc.desc      listOffsetOf(offset=2, yOffset=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0199 begin`);
      const actual: number = listOffsetOf(2, 60);
      logInfo(`listOffsetOf(offset=2, yOffset=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0199 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0200
     * @tc.name      ExpandTitle_ListOffsetOf_0200
     * @tc.desc      listOffsetOf(offset=2, yOffset=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0200 begin`);
      const actual: number = listOffsetOf(2, 65);
      logInfo(`listOffsetOf(offset=2, yOffset=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0200 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0201
     * @tc.name      ExpandTitle_ListOffsetOf_0201
     * @tc.desc      listOffsetOf(offset=2, yOffset=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0201 begin`);
      const actual: number = listOffsetOf(2, 70);
      logInfo(`listOffsetOf(offset=2, yOffset=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0201 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0202
     * @tc.name      ExpandTitle_ListOffsetOf_0202
     * @tc.desc      listOffsetOf(offset=2, yOffset=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0202 begin`);
      const actual: number = listOffsetOf(2, 75);
      logInfo(`listOffsetOf(offset=2, yOffset=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0202 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0203
     * @tc.name      ExpandTitle_ListOffsetOf_0203
     * @tc.desc      listOffsetOf(offset=2, yOffset=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0203 begin`);
      const actual: number = listOffsetOf(2, 80);
      logInfo(`listOffsetOf(offset=2, yOffset=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0203 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0204
     * @tc.name      ExpandTitle_ListOffsetOf_0204
     * @tc.desc      listOffsetOf(offset=2, yOffset=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0204 begin`);
      const actual: number = listOffsetOf(2, 85);
      logInfo(`listOffsetOf(offset=2, yOffset=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0204 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0205
     * @tc.name      ExpandTitle_ListOffsetOf_0205
     * @tc.desc      listOffsetOf(offset=2, yOffset=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0205 begin`);
      const actual: number = listOffsetOf(2, 90);
      logInfo(`listOffsetOf(offset=2, yOffset=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0205 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0206
     * @tc.name      ExpandTitle_ListOffsetOf_0206
     * @tc.desc      listOffsetOf(offset=2, yOffset=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0206 begin`);
      const actual: number = listOffsetOf(2, 95);
      logInfo(`listOffsetOf(offset=2, yOffset=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0206 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0207
     * @tc.name      ExpandTitle_ListOffsetOf_0207
     * @tc.desc      listOffsetOf(offset=2, yOffset=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0207 begin`);
      const actual: number = listOffsetOf(2, 105);
      logInfo(`listOffsetOf(offset=2, yOffset=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0207 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0208
     * @tc.name      ExpandTitle_ListOffsetOf_0208
     * @tc.desc      listOffsetOf(offset=2, yOffset=179) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0208 begin`);
      const actual: number = listOffsetOf(2, 179);
      logInfo(`listOffsetOf(offset=2, yOffset=179): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0208 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0209
     * @tc.name      ExpandTitle_ListOffsetOf_0209
     * @tc.desc      listOffsetOf(offset=2, yOffset=-3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0209 begin`);
      const actual: number = listOffsetOf(2, -3);
      logInfo(`listOffsetOf(offset=2, yOffset=-3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0209 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0210
     * @tc.name      ExpandTitle_ListOffsetOf_0210
     * @tc.desc      listOffsetOf(offset=2, yOffset=52.83) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0210 begin`);
      const actual: number = listOffsetOf(2, 52.83);
      logInfo(`listOffsetOf(offset=2, yOffset=52.83): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0210 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0211
     * @tc.name      ExpandTitle_ListOffsetOf_0211
     * @tc.desc      listOffsetOf(offset=3, yOffset=-100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0211 begin`);
      const actual: number = listOffsetOf(3, -100);
      logInfo(`listOffsetOf(offset=3, yOffset=-100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0211 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0212
     * @tc.name      ExpandTitle_ListOffsetOf_0212
     * @tc.desc      listOffsetOf(offset=3, yOffset=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0212 begin`);
      const actual: number = listOffsetOf(3, -1);
      logInfo(`listOffsetOf(offset=3, yOffset=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0212 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0213
     * @tc.name      ExpandTitle_ListOffsetOf_0213
     * @tc.desc      listOffsetOf(offset=3, yOffset=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0213 begin`);
      const actual: number = listOffsetOf(3, 0);
      logInfo(`listOffsetOf(offset=3, yOffset=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0213 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0214
     * @tc.name      ExpandTitle_ListOffsetOf_0214
     * @tc.desc      listOffsetOf(offset=3, yOffset=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0214 begin`);
      const actual: number = listOffsetOf(3, 1);
      logInfo(`listOffsetOf(offset=3, yOffset=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0214 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0215
     * @tc.name      ExpandTitle_ListOffsetOf_0215
     * @tc.desc      listOffsetOf(offset=3, yOffset=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0215 begin`);
      const actual: number = listOffsetOf(3, 50);
      logInfo(`listOffsetOf(offset=3, yOffset=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0215 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0216
     * @tc.name      ExpandTitle_ListOffsetOf_0216
     * @tc.desc      listOffsetOf(offset=3, yOffset=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0216 begin`);
      const actual: number = listOffsetOf(3, 100);
      logInfo(`listOffsetOf(offset=3, yOffset=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0216 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0217
     * @tc.name      ExpandTitle_ListOffsetOf_0217
     * @tc.desc      listOffsetOf(offset=3, yOffset=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0217 begin`);
      const actual: number = listOffsetOf(3, 2);
      logInfo(`listOffsetOf(offset=3, yOffset=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0217 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0218
     * @tc.name      ExpandTitle_ListOffsetOf_0218
     * @tc.desc      listOffsetOf(offset=3, yOffset=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0218 begin`);
      const actual: number = listOffsetOf(3, 3);
      logInfo(`listOffsetOf(offset=3, yOffset=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0218 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0219
     * @tc.name      ExpandTitle_ListOffsetOf_0219
     * @tc.desc      listOffsetOf(offset=3, yOffset=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0219 begin`);
      const actual: number = listOffsetOf(3, 10);
      logInfo(`listOffsetOf(offset=3, yOffset=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0219 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0220
     * @tc.name      ExpandTitle_ListOffsetOf_0220
     * @tc.desc      listOffsetOf(offset=3, yOffset=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0220 begin`);
      const actual: number = listOffsetOf(3, 5);
      logInfo(`listOffsetOf(offset=3, yOffset=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0220 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0221
     * @tc.name      ExpandTitle_ListOffsetOf_0221
     * @tc.desc      listOffsetOf(offset=3, yOffset=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0221 begin`);
      const actual: number = listOffsetOf(3, 15);
      logInfo(`listOffsetOf(offset=3, yOffset=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0221 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0222
     * @tc.name      ExpandTitle_ListOffsetOf_0222
     * @tc.desc      listOffsetOf(offset=3, yOffset=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0222 begin`);
      const actual: number = listOffsetOf(3, 20);
      logInfo(`listOffsetOf(offset=3, yOffset=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0222 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0223
     * @tc.name      ExpandTitle_ListOffsetOf_0223
     * @tc.desc      listOffsetOf(offset=3, yOffset=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0223 begin`);
      const actual: number = listOffsetOf(3, 25);
      logInfo(`listOffsetOf(offset=3, yOffset=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0223 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0224
     * @tc.name      ExpandTitle_ListOffsetOf_0224
     * @tc.desc      listOffsetOf(offset=3, yOffset=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0224 begin`);
      const actual: number = listOffsetOf(3, 30);
      logInfo(`listOffsetOf(offset=3, yOffset=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0224 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0225
     * @tc.name      ExpandTitle_ListOffsetOf_0225
     * @tc.desc      listOffsetOf(offset=3, yOffset=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0225 begin`);
      const actual: number = listOffsetOf(3, 35);
      logInfo(`listOffsetOf(offset=3, yOffset=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0225 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0226
     * @tc.name      ExpandTitle_ListOffsetOf_0226
     * @tc.desc      listOffsetOf(offset=3, yOffset=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0226 begin`);
      const actual: number = listOffsetOf(3, 40);
      logInfo(`listOffsetOf(offset=3, yOffset=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0226 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0227
     * @tc.name      ExpandTitle_ListOffsetOf_0227
     * @tc.desc      listOffsetOf(offset=3, yOffset=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0227 begin`);
      const actual: number = listOffsetOf(3, 45);
      logInfo(`listOffsetOf(offset=3, yOffset=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0227 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0228
     * @tc.name      ExpandTitle_ListOffsetOf_0228
     * @tc.desc      listOffsetOf(offset=3, yOffset=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0228 begin`);
      const actual: number = listOffsetOf(3, 55);
      logInfo(`listOffsetOf(offset=3, yOffset=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0228 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0229
     * @tc.name      ExpandTitle_ListOffsetOf_0229
     * @tc.desc      listOffsetOf(offset=3, yOffset=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0229 begin`);
      const actual: number = listOffsetOf(3, 60);
      logInfo(`listOffsetOf(offset=3, yOffset=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0229 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0230
     * @tc.name      ExpandTitle_ListOffsetOf_0230
     * @tc.desc      listOffsetOf(offset=3, yOffset=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0230 begin`);
      const actual: number = listOffsetOf(3, 65);
      logInfo(`listOffsetOf(offset=3, yOffset=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0230 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0231
     * @tc.name      ExpandTitle_ListOffsetOf_0231
     * @tc.desc      listOffsetOf(offset=3, yOffset=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0231 begin`);
      const actual: number = listOffsetOf(3, 70);
      logInfo(`listOffsetOf(offset=3, yOffset=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0231 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0232
     * @tc.name      ExpandTitle_ListOffsetOf_0232
     * @tc.desc      listOffsetOf(offset=3, yOffset=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0232 begin`);
      const actual: number = listOffsetOf(3, 75);
      logInfo(`listOffsetOf(offset=3, yOffset=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0232 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0233
     * @tc.name      ExpandTitle_ListOffsetOf_0233
     * @tc.desc      listOffsetOf(offset=3, yOffset=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0233 begin`);
      const actual: number = listOffsetOf(3, 80);
      logInfo(`listOffsetOf(offset=3, yOffset=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0233 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0234
     * @tc.name      ExpandTitle_ListOffsetOf_0234
     * @tc.desc      listOffsetOf(offset=3, yOffset=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0234 begin`);
      const actual: number = listOffsetOf(3, 85);
      logInfo(`listOffsetOf(offset=3, yOffset=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0234 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0235
     * @tc.name      ExpandTitle_ListOffsetOf_0235
     * @tc.desc      listOffsetOf(offset=3, yOffset=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0235 begin`);
      const actual: number = listOffsetOf(3, 90);
      logInfo(`listOffsetOf(offset=3, yOffset=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0235 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0236
     * @tc.name      ExpandTitle_ListOffsetOf_0236
     * @tc.desc      listOffsetOf(offset=3, yOffset=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0236 begin`);
      const actual: number = listOffsetOf(3, 95);
      logInfo(`listOffsetOf(offset=3, yOffset=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0236 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0237
     * @tc.name      ExpandTitle_ListOffsetOf_0237
     * @tc.desc      listOffsetOf(offset=3, yOffset=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0237 begin`);
      const actual: number = listOffsetOf(3, 105);
      logInfo(`listOffsetOf(offset=3, yOffset=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0237 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0238
     * @tc.name      ExpandTitle_ListOffsetOf_0238
     * @tc.desc      listOffsetOf(offset=3, yOffset=179) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0238 begin`);
      const actual: number = listOffsetOf(3, 179);
      logInfo(`listOffsetOf(offset=3, yOffset=179): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0238 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0239
     * @tc.name      ExpandTitle_ListOffsetOf_0239
     * @tc.desc      listOffsetOf(offset=3, yOffset=-3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0239 begin`);
      const actual: number = listOffsetOf(3, -3);
      logInfo(`listOffsetOf(offset=3, yOffset=-3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0239 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0240
     * @tc.name      ExpandTitle_ListOffsetOf_0240
     * @tc.desc      listOffsetOf(offset=3, yOffset=52.83) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0240 begin`);
      const actual: number = listOffsetOf(3, 52.83);
      logInfo(`listOffsetOf(offset=3, yOffset=52.83): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0240 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0241
     * @tc.name      ExpandTitle_ListOffsetOf_0241
     * @tc.desc      listOffsetOf(offset=10, yOffset=-100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0241 begin`);
      const actual: number = listOffsetOf(10, -100);
      logInfo(`listOffsetOf(offset=10, yOffset=-100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0241 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0242
     * @tc.name      ExpandTitle_ListOffsetOf_0242
     * @tc.desc      listOffsetOf(offset=10, yOffset=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0242 begin`);
      const actual: number = listOffsetOf(10, -1);
      logInfo(`listOffsetOf(offset=10, yOffset=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0242 end`);
    });
  });
}
