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
import { attributeAreaOf } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for attributeAreaOf (51 cases). */
export default function attributeAreaOf3Test(): void {
  describe('AttributeAreaOf3Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0193
     * @tc.name      WindowManage_AttributeAreaOf_0193
     * @tc.desc      attributeAreaOf(resetSizeWidth=35, resetSizeHeight=55) returns 1925
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0193 begin`);
      const actual: number = attributeAreaOf(35, 55);
      logInfo(`attributeAreaOf(resetSizeWidth=35, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1925);
      logInfo(`${BUNDLE}AttributeAreaOf_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0194
     * @tc.name      WindowManage_AttributeAreaOf_0194
     * @tc.desc      attributeAreaOf(resetSizeWidth=35, resetSizeHeight=65) returns 2275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0194 begin`);
      const actual: number = attributeAreaOf(35, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=35, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2275);
      logInfo(`${BUNDLE}AttributeAreaOf_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0195
     * @tc.name      WindowManage_AttributeAreaOf_0195
     * @tc.desc      attributeAreaOf(resetSizeWidth=35, resetSizeHeight=70) returns 2450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0195 begin`);
      const actual: number = attributeAreaOf(35, 70);
      logInfo(`attributeAreaOf(resetSizeWidth=35, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2450);
      logInfo(`${BUNDLE}AttributeAreaOf_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0196
     * @tc.name      WindowManage_AttributeAreaOf_0196
     * @tc.desc      attributeAreaOf(resetSizeWidth=35, resetSizeHeight=80) returns 2800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0196 begin`);
      const actual: number = attributeAreaOf(35, 80);
      logInfo(`attributeAreaOf(resetSizeWidth=35, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2800);
      logInfo(`${BUNDLE}AttributeAreaOf_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0197
     * @tc.name      WindowManage_AttributeAreaOf_0197
     * @tc.desc      attributeAreaOf(resetSizeWidth=35, resetSizeHeight=85) returns 2975
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0197 begin`);
      const actual: number = attributeAreaOf(35, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=35, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2975);
      logInfo(`${BUNDLE}AttributeAreaOf_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0198
     * @tc.name      WindowManage_AttributeAreaOf_0198
     * @tc.desc      attributeAreaOf(resetSizeWidth=35, resetSizeHeight=95) returns 3325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0198 begin`);
      const actual: number = attributeAreaOf(35, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=35, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3325);
      logInfo(`${BUNDLE}AttributeAreaOf_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0199
     * @tc.name      WindowManage_AttributeAreaOf_0199
     * @tc.desc      attributeAreaOf(resetSizeWidth=35, resetSizeHeight=105) returns 3675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0199 begin`);
      const actual: number = attributeAreaOf(35, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=35, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3675);
      logInfo(`${BUNDLE}AttributeAreaOf_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0200
     * @tc.name      WindowManage_AttributeAreaOf_0200
     * @tc.desc      attributeAreaOf(resetSizeWidth=35, resetSizeHeight=110) returns 3850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0200 begin`);
      const actual: number = attributeAreaOf(35, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=35, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3850);
      logInfo(`${BUNDLE}AttributeAreaOf_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0201
     * @tc.name      WindowManage_AttributeAreaOf_0201
     * @tc.desc      attributeAreaOf(resetSizeWidth=35, resetSizeHeight=127) returns 4445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0201 begin`);
      const actual: number = attributeAreaOf(35, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=35, resetS...: actual=${actual}`);
      expect(actual).assertEqual(4445);
      logInfo(`${BUNDLE}AttributeAreaOf_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0202
     * @tc.name      WindowManage_AttributeAreaOf_0202
     * @tc.desc      attributeAreaOf(resetSizeWidth=35, resetSizeHeight=53) returns 1855
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0202 begin`);
      const actual: number = attributeAreaOf(35, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=35, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1855);
      logInfo(`${BUNDLE}AttributeAreaOf_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0203
     * @tc.name      WindowManage_AttributeAreaOf_0203
     * @tc.desc      attributeAreaOf(resetSizeWidth=35, resetSizeHeight=174) returns 6090
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0203 begin`);
      const actual: number = attributeAreaOf(35, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=35, resetS...: actual=${actual}`);
      expect(actual).assertEqual(6090);
      logInfo(`${BUNDLE}AttributeAreaOf_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0204
     * @tc.name      WindowManage_AttributeAreaOf_0204
     * @tc.desc      attributeAreaOf(resetSizeWidth=40, resetSizeHeight=65) returns 2600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0204 begin`);
      const actual: number = attributeAreaOf(40, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=40, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2600);
      logInfo(`${BUNDLE}AttributeAreaOf_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0205
     * @tc.name      WindowManage_AttributeAreaOf_0205
     * @tc.desc      attributeAreaOf(resetSizeWidth=40, resetSizeHeight=80) returns 3200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0205 begin`);
      const actual: number = attributeAreaOf(40, 80);
      logInfo(`attributeAreaOf(resetSizeWidth=40, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3200);
      logInfo(`${BUNDLE}AttributeAreaOf_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0206
     * @tc.name      WindowManage_AttributeAreaOf_0206
     * @tc.desc      attributeAreaOf(resetSizeWidth=40, resetSizeHeight=85) returns 3400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0206 begin`);
      const actual: number = attributeAreaOf(40, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=40, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3400);
      logInfo(`${BUNDLE}AttributeAreaOf_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0207
     * @tc.name      WindowManage_AttributeAreaOf_0207
     * @tc.desc      attributeAreaOf(resetSizeWidth=40, resetSizeHeight=90) returns 3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0207 begin`);
      const actual: number = attributeAreaOf(40, 90);
      logInfo(`attributeAreaOf(resetSizeWidth=40, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3600);
      logInfo(`${BUNDLE}AttributeAreaOf_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0208
     * @tc.name      WindowManage_AttributeAreaOf_0208
     * @tc.desc      attributeAreaOf(resetSizeWidth=40, resetSizeHeight=95) returns 3800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0208 begin`);
      const actual: number = attributeAreaOf(40, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=40, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3800);
      logInfo(`${BUNDLE}AttributeAreaOf_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0209
     * @tc.name      WindowManage_AttributeAreaOf_0209
     * @tc.desc      attributeAreaOf(resetSizeWidth=40, resetSizeHeight=105) returns 4200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0209 begin`);
      const actual: number = attributeAreaOf(40, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=40, resetS...: actual=${actual}`);
      expect(actual).assertEqual(4200);
      logInfo(`${BUNDLE}AttributeAreaOf_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0210
     * @tc.name      WindowManage_AttributeAreaOf_0210
     * @tc.desc      attributeAreaOf(resetSizeWidth=40, resetSizeHeight=110) returns 4400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0210 begin`);
      const actual: number = attributeAreaOf(40, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=40, resetS...: actual=${actual}`);
      expect(actual).assertEqual(4400);
      logInfo(`${BUNDLE}AttributeAreaOf_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0211
     * @tc.name      WindowManage_AttributeAreaOf_0211
     * @tc.desc      attributeAreaOf(resetSizeWidth=40, resetSizeHeight=127) returns 5080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0211 begin`);
      const actual: number = attributeAreaOf(40, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=40, resetS...: actual=${actual}`);
      expect(actual).assertEqual(5080);
      logInfo(`${BUNDLE}AttributeAreaOf_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0212
     * @tc.name      WindowManage_AttributeAreaOf_0212
     * @tc.desc      attributeAreaOf(resetSizeWidth=40, resetSizeHeight=53) returns 2120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0212 begin`);
      const actual: number = attributeAreaOf(40, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=40, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2120);
      logInfo(`${BUNDLE}AttributeAreaOf_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0213
     * @tc.name      WindowManage_AttributeAreaOf_0213
     * @tc.desc      attributeAreaOf(resetSizeWidth=40, resetSizeHeight=174) returns 6960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0213 begin`);
      const actual: number = attributeAreaOf(40, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=40, resetS...: actual=${actual}`);
      expect(actual).assertEqual(6960);
      logInfo(`${BUNDLE}AttributeAreaOf_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0214
     * @tc.name      WindowManage_AttributeAreaOf_0214
     * @tc.desc      attributeAreaOf(resetSizeWidth=45, resetSizeHeight=45) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0214 begin`);
      const actual: number = attributeAreaOf(45, 45);
      logInfo(`attributeAreaOf(resetSizeWidth=45, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}AttributeAreaOf_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0215
     * @tc.name      WindowManage_AttributeAreaOf_0215
     * @tc.desc      attributeAreaOf(resetSizeWidth=45, resetSizeHeight=55) returns 2475
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0215 begin`);
      const actual: number = attributeAreaOf(45, 55);
      logInfo(`attributeAreaOf(resetSizeWidth=45, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2475);
      logInfo(`${BUNDLE}AttributeAreaOf_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0216
     * @tc.name      WindowManage_AttributeAreaOf_0216
     * @tc.desc      attributeAreaOf(resetSizeWidth=45, resetSizeHeight=65) returns 2925
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0216 begin`);
      const actual: number = attributeAreaOf(45, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=45, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2925);
      logInfo(`${BUNDLE}AttributeAreaOf_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0217
     * @tc.name      WindowManage_AttributeAreaOf_0217
     * @tc.desc      attributeAreaOf(resetSizeWidth=45, resetSizeHeight=75) returns 3375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0217 begin`);
      const actual: number = attributeAreaOf(45, 75);
      logInfo(`attributeAreaOf(resetSizeWidth=45, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3375);
      logInfo(`${BUNDLE}AttributeAreaOf_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0218
     * @tc.name      WindowManage_AttributeAreaOf_0218
     * @tc.desc      attributeAreaOf(resetSizeWidth=45, resetSizeHeight=85) returns 3825
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0218 begin`);
      const actual: number = attributeAreaOf(45, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=45, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3825);
      logInfo(`${BUNDLE}AttributeAreaOf_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0219
     * @tc.name      WindowManage_AttributeAreaOf_0219
     * @tc.desc      attributeAreaOf(resetSizeWidth=45, resetSizeHeight=90) returns 4050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0219 begin`);
      const actual: number = attributeAreaOf(45, 90);
      logInfo(`attributeAreaOf(resetSizeWidth=45, resetS...: actual=${actual}`);
      expect(actual).assertEqual(4050);
      logInfo(`${BUNDLE}AttributeAreaOf_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0220
     * @tc.name      WindowManage_AttributeAreaOf_0220
     * @tc.desc      attributeAreaOf(resetSizeWidth=45, resetSizeHeight=95) returns 4275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0220 begin`);
      const actual: number = attributeAreaOf(45, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=45, resetS...: actual=${actual}`);
      expect(actual).assertEqual(4275);
      logInfo(`${BUNDLE}AttributeAreaOf_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0221
     * @tc.name      WindowManage_AttributeAreaOf_0221
     * @tc.desc      attributeAreaOf(resetSizeWidth=45, resetSizeHeight=105) returns 4725
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0221 begin`);
      const actual: number = attributeAreaOf(45, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=45, resetS...: actual=${actual}`);
      expect(actual).assertEqual(4725);
      logInfo(`${BUNDLE}AttributeAreaOf_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0222
     * @tc.name      WindowManage_AttributeAreaOf_0222
     * @tc.desc      attributeAreaOf(resetSizeWidth=45, resetSizeHeight=110) returns 4950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0222 begin`);
      const actual: number = attributeAreaOf(45, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=45, resetS...: actual=${actual}`);
      expect(actual).assertEqual(4950);
      logInfo(`${BUNDLE}AttributeAreaOf_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0223
     * @tc.name      WindowManage_AttributeAreaOf_0223
     * @tc.desc      attributeAreaOf(resetSizeWidth=45, resetSizeHeight=127) returns 5715
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0223 begin`);
      const actual: number = attributeAreaOf(45, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=45, resetS...: actual=${actual}`);
      expect(actual).assertEqual(5715);
      logInfo(`${BUNDLE}AttributeAreaOf_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0224
     * @tc.name      WindowManage_AttributeAreaOf_0224
     * @tc.desc      attributeAreaOf(resetSizeWidth=45, resetSizeHeight=53) returns 2385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0224 begin`);
      const actual: number = attributeAreaOf(45, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=45, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2385);
      logInfo(`${BUNDLE}AttributeAreaOf_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0225
     * @tc.name      WindowManage_AttributeAreaOf_0225
     * @tc.desc      attributeAreaOf(resetSizeWidth=45, resetSizeHeight=174) returns 7830
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0225 begin`);
      const actual: number = attributeAreaOf(45, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=45, resetS...: actual=${actual}`);
      expect(actual).assertEqual(7830);
      logInfo(`${BUNDLE}AttributeAreaOf_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0226
     * @tc.name      WindowManage_AttributeAreaOf_0226
     * @tc.desc      attributeAreaOf(resetSizeWidth=50, resetSizeHeight=65) returns 3250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0226 begin`);
      const actual: number = attributeAreaOf(50, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=50, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3250);
      logInfo(`${BUNDLE}AttributeAreaOf_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0227
     * @tc.name      WindowManage_AttributeAreaOf_0227
     * @tc.desc      attributeAreaOf(resetSizeWidth=50, resetSizeHeight=75) returns 3750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0227 begin`);
      const actual: number = attributeAreaOf(50, 75);
      logInfo(`attributeAreaOf(resetSizeWidth=50, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3750);
      logInfo(`${BUNDLE}AttributeAreaOf_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0228
     * @tc.name      WindowManage_AttributeAreaOf_0228
     * @tc.desc      attributeAreaOf(resetSizeWidth=50, resetSizeHeight=85) returns 4250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0228 begin`);
      const actual: number = attributeAreaOf(50, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=50, resetS...: actual=${actual}`);
      expect(actual).assertEqual(4250);
      logInfo(`${BUNDLE}AttributeAreaOf_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0229
     * @tc.name      WindowManage_AttributeAreaOf_0229
     * @tc.desc      attributeAreaOf(resetSizeWidth=50, resetSizeHeight=95) returns 4750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0229 begin`);
      const actual: number = attributeAreaOf(50, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=50, resetS...: actual=${actual}`);
      expect(actual).assertEqual(4750);
      logInfo(`${BUNDLE}AttributeAreaOf_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0230
     * @tc.name      WindowManage_AttributeAreaOf_0230
     * @tc.desc      attributeAreaOf(resetSizeWidth=50, resetSizeHeight=105) returns 5250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0230 begin`);
      const actual: number = attributeAreaOf(50, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=50, resetS...: actual=${actual}`);
      expect(actual).assertEqual(5250);
      logInfo(`${BUNDLE}AttributeAreaOf_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0231
     * @tc.name      WindowManage_AttributeAreaOf_0231
     * @tc.desc      attributeAreaOf(resetSizeWidth=50, resetSizeHeight=127) returns 6350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0231 begin`);
      const actual: number = attributeAreaOf(50, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=50, resetS...: actual=${actual}`);
      expect(actual).assertEqual(6350);
      logInfo(`${BUNDLE}AttributeAreaOf_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0232
     * @tc.name      WindowManage_AttributeAreaOf_0232
     * @tc.desc      attributeAreaOf(resetSizeWidth=50, resetSizeHeight=53) returns 2650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0232 begin`);
      const actual: number = attributeAreaOf(50, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=50, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2650);
      logInfo(`${BUNDLE}AttributeAreaOf_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0233
     * @tc.name      WindowManage_AttributeAreaOf_0233
     * @tc.desc      attributeAreaOf(resetSizeWidth=50, resetSizeHeight=174) returns 8700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0233 begin`);
      const actual: number = attributeAreaOf(50, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=50, resetS...: actual=${actual}`);
      expect(actual).assertEqual(8700);
      logInfo(`${BUNDLE}AttributeAreaOf_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0234
     * @tc.name      WindowManage_AttributeAreaOf_0234
     * @tc.desc      attributeAreaOf(resetSizeWidth=55, resetSizeHeight=55) returns 3025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0234 begin`);
      const actual: number = attributeAreaOf(55, 55);
      logInfo(`attributeAreaOf(resetSizeWidth=55, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3025);
      logInfo(`${BUNDLE}AttributeAreaOf_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0235
     * @tc.name      WindowManage_AttributeAreaOf_0235
     * @tc.desc      attributeAreaOf(resetSizeWidth=55, resetSizeHeight=65) returns 3575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0235 begin`);
      const actual: number = attributeAreaOf(55, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=55, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3575);
      logInfo(`${BUNDLE}AttributeAreaOf_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0236
     * @tc.name      WindowManage_AttributeAreaOf_0236
     * @tc.desc      attributeAreaOf(resetSizeWidth=55, resetSizeHeight=75) returns 4125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0236 begin`);
      const actual: number = attributeAreaOf(55, 75);
      logInfo(`attributeAreaOf(resetSizeWidth=55, resetS...: actual=${actual}`);
      expect(actual).assertEqual(4125);
      logInfo(`${BUNDLE}AttributeAreaOf_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0237
     * @tc.name      WindowManage_AttributeAreaOf_0237
     * @tc.desc      attributeAreaOf(resetSizeWidth=55, resetSizeHeight=85) returns 4675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0237 begin`);
      const actual: number = attributeAreaOf(55, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=55, resetS...: actual=${actual}`);
      expect(actual).assertEqual(4675);
      logInfo(`${BUNDLE}AttributeAreaOf_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0238
     * @tc.name      WindowManage_AttributeAreaOf_0238
     * @tc.desc      attributeAreaOf(resetSizeWidth=55, resetSizeHeight=95) returns 5225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0238 begin`);
      const actual: number = attributeAreaOf(55, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=55, resetS...: actual=${actual}`);
      expect(actual).assertEqual(5225);
      logInfo(`${BUNDLE}AttributeAreaOf_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0239
     * @tc.name      WindowManage_AttributeAreaOf_0239
     * @tc.desc      attributeAreaOf(resetSizeWidth=55, resetSizeHeight=105) returns 5775
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0239 begin`);
      const actual: number = attributeAreaOf(55, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=55, resetS...: actual=${actual}`);
      expect(actual).assertEqual(5775);
      logInfo(`${BUNDLE}AttributeAreaOf_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0240
     * @tc.name      WindowManage_AttributeAreaOf_0240
     * @tc.desc      attributeAreaOf(resetSizeWidth=55, resetSizeHeight=110) returns 6050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0240 begin`);
      const actual: number = attributeAreaOf(55, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=55, resetS...: actual=${actual}`);
      expect(actual).assertEqual(6050);
      logInfo(`${BUNDLE}AttributeAreaOf_0240 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0241
     * @tc.name      WindowManage_AttributeAreaOf_0241
     * @tc.desc      attributeAreaOf(resetSizeWidth=55, resetSizeHeight=127) returns 6985
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0241 begin`);
      const actual: number = attributeAreaOf(55, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=55, resetS...: actual=${actual}`);
      expect(actual).assertEqual(6985);
      logInfo(`${BUNDLE}AttributeAreaOf_0241 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0242
     * @tc.name      WindowManage_AttributeAreaOf_0242
     * @tc.desc      attributeAreaOf(resetSizeWidth=55, resetSizeHeight=53) returns 2915
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0242 begin`);
      const actual: number = attributeAreaOf(55, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=55, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2915);
      logInfo(`${BUNDLE}AttributeAreaOf_0242 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0243
     * @tc.name      WindowManage_AttributeAreaOf_0243
     * @tc.desc      attributeAreaOf(resetSizeWidth=55, resetSizeHeight=174) returns 9570
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0243 begin`);
      const actual: number = attributeAreaOf(55, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=55, resetS...: actual=${actual}`);
      expect(actual).assertEqual(9570);
      logInfo(`${BUNDLE}AttributeAreaOf_0243 end`);
    });
  });
}
