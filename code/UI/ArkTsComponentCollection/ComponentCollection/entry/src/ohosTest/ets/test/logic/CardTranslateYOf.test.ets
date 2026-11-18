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
import { cardTranslateYOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for cardTranslateYOf (50 cases). */
export default function cardTranslateYOfTest(): void {
  describe('CardTranslateYOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0001
     * @tc.name      ComponentCollection_CardTranslateYOf_0001
     * @tc.desc      cardTranslateYOf(sx=2, windowHeight=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_CardTranslateYOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0001 begin`);
      const actual: number = cardTranslateYOf(2, 0);
      logInfo(`cardTranslateYOf(sx=2, windowHeight=0): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}CardTranslateYOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0002
     * @tc.name      ComponentCollection_CardTranslateYOf_0002
     * @tc.desc      cardTranslateYOf(sx=2, windowHeight=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_CardTranslateYOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0002 begin`);
      const actual: number = cardTranslateYOf(2, 1);
      logInfo(`cardTranslateYOf(sx=2, windowHeight=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CardTranslateYOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0003
     * @tc.name      ComponentCollection_CardTranslateYOf_0003
     * @tc.desc      cardTranslateYOf(sx=2, windowHeight=-1) returns Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0003 begin`);
      const actual: number = cardTranslateYOf(2, -1);
      logInfo(`cardTranslateYOf(sx=2, windowHeight=-1): actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}CardTranslateYOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0004
     * @tc.name      ComponentCollection_CardTranslateYOf_0004
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=1) returns -1.3862943611198906
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0004 begin`);
      const actual: number = cardTranslateYOf(0, 1);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=1): actual=${actual}`);
      expect(actual).assertClose(-1.3862943611198906, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0005
     * @tc.name      ComponentCollection_CardTranslateYOf_0005
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=2) returns -2.772588722239781
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0005 begin`);
      const actual: number = cardTranslateYOf(0, 2);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=2): actual=${actual}`);
      expect(actual).assertClose(-2.772588722239781, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0006
     * @tc.name      ComponentCollection_CardTranslateYOf_0006
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=3) returns -4.1588830833596715
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0006 begin`);
      const actual: number = cardTranslateYOf(0, 3);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=3): actual=${actual}`);
      expect(actual).assertClose(-4.1588830833596715, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0007
     * @tc.name      ComponentCollection_CardTranslateYOf_0007
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=100) returns -138.62943611198907
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0007 begin`);
      const actual: number = cardTranslateYOf(0, 100);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=100): actual=${actual}`);
      expect(actual).assertClose(-138.62943611198907, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0008
     * @tc.name      ComponentCollection_CardTranslateYOf_0008
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=360) returns -499.0659700031606
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0008 begin`);
      const actual: number = cardTranslateYOf(0, 360);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=360): actual=${actual}`);
      expect(actual).assertClose(-499.0659700031606, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0009
     * @tc.name      ComponentCollection_CardTranslateYOf_0009
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=720) returns -998.1319400063212
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0009 begin`);
      const actual: number = cardTranslateYOf(0, 720);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=720): actual=${actual}`);
      expect(actual).assertClose(-998.1319400063212, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0010
     * @tc.name      ComponentCollection_CardTranslateYOf_0010
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=1080) returns -1497.1979100094818
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0010 begin`);
      const actual: number = cardTranslateYOf(0, 1080);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=1080): actual=${actual}`);
      expect(actual).assertClose(-1497.1979100094818, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0011
     * @tc.name      ComponentCollection_CardTranslateYOf_0011
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=1920) returns -2661.68517335019
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0011 begin`);
      const actual: number = cardTranslateYOf(0, 1920);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=1920): actual=${actual}`);
      expect(actual).assertClose(-2661.68517335019, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0012
     * @tc.name      ComponentCollection_CardTranslateYOf_0012
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=10) returns -13.862943611198906
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0012 begin`);
      const actual: number = cardTranslateYOf(0, 10);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=10): actual=${actual}`);
      expect(actual).assertClose(-13.862943611198906, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0013
     * @tc.name      ComponentCollection_CardTranslateYOf_0013
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=96) returns -133.0842586675095
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0013 begin`);
      const actual: number = cardTranslateYOf(0, 96);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=96): actual=${actual}`);
      expect(actual).assertClose(-133.0842586675095, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0014
     * @tc.name      ComponentCollection_CardTranslateYOf_0014
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=192) returns -266.168517335019
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0014 begin`);
      const actual: number = cardTranslateYOf(0, 192);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=192): actual=${actual}`);
      expect(actual).assertClose(-266.168517335019, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0015
     * @tc.name      ComponentCollection_CardTranslateYOf_0015
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=288) returns -399.2527760025285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0015 begin`);
      const actual: number = cardTranslateYOf(0, 288);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=288): actual=${actual}`);
      expect(actual).assertClose(-399.2527760025285, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0016
     * @tc.name      ComponentCollection_CardTranslateYOf_0016
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=384) returns -532.337034670038
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0016 begin`);
      const actual: number = cardTranslateYOf(0, 384);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=384): actual=${actual}`);
      expect(actual).assertClose(-532.337034670038, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0017
     * @tc.name      ComponentCollection_CardTranslateYOf_0017
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=480) returns -665.4212933375475
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0017 begin`);
      const actual: number = cardTranslateYOf(0, 480);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=480): actual=${actual}`);
      expect(actual).assertClose(-665.4212933375475, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0018
     * @tc.name      ComponentCollection_CardTranslateYOf_0018
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=576) returns -798.505552005057
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0018 begin`);
      const actual: number = cardTranslateYOf(0, 576);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=576): actual=${actual}`);
      expect(actual).assertClose(-798.505552005057, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0019
     * @tc.name      ComponentCollection_CardTranslateYOf_0019
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=672) returns -931.5898106725665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0019 begin`);
      const actual: number = cardTranslateYOf(0, 672);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=672): actual=${actual}`);
      expect(actual).assertClose(-931.5898106725665, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0020
     * @tc.name      ComponentCollection_CardTranslateYOf_0020
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=768) returns -1064.674069340076
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0020 begin`);
      const actual: number = cardTranslateYOf(0, 768);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=768): actual=${actual}`);
      expect(actual).assertClose(-1064.674069340076, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0021
     * @tc.name      ComponentCollection_CardTranslateYOf_0021
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=864) returns -1197.7583280075855
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0021 begin`);
      const actual: number = cardTranslateYOf(0, 864);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=864): actual=${actual}`);
      expect(actual).assertClose(-1197.7583280075855, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0022
     * @tc.name      ComponentCollection_CardTranslateYOf_0022
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=960) returns -1330.842586675095
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0022 begin`);
      const actual: number = cardTranslateYOf(0, 960);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=960): actual=${actual}`);
      expect(actual).assertClose(-1330.842586675095, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0023
     * @tc.name      ComponentCollection_CardTranslateYOf_0023
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=1056) returns -1463.9268453426043
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0023 begin`);
      const actual: number = cardTranslateYOf(0, 1056);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=1056): actual=${actual}`);
      expect(actual).assertClose(-1463.9268453426043, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0024
     * @tc.name      ComponentCollection_CardTranslateYOf_0024
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=1152) returns -1597.011104010114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0024 begin`);
      const actual: number = cardTranslateYOf(0, 1152);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=1152): actual=${actual}`);
      expect(actual).assertClose(-1597.011104010114, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0025
     * @tc.name      ComponentCollection_CardTranslateYOf_0025
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=1248) returns -1730.0953626776234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0025 begin`);
      const actual: number = cardTranslateYOf(0, 1248);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=1248): actual=${actual}`);
      expect(actual).assertClose(-1730.0953626776234, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0026
     * @tc.name      ComponentCollection_CardTranslateYOf_0026
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=1344) returns -1863.179621345133
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0026 begin`);
      const actual: number = cardTranslateYOf(0, 1344);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=1344): actual=${actual}`);
      expect(actual).assertClose(-1863.179621345133, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0027
     * @tc.name      ComponentCollection_CardTranslateYOf_0027
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=1440) returns -1996.2638800126424
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0027 begin`);
      const actual: number = cardTranslateYOf(0, 1440);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=1440): actual=${actual}`);
      expect(actual).assertClose(-1996.2638800126424, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0028
     * @tc.name      ComponentCollection_CardTranslateYOf_0028
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=1536) returns -2129.348138680152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0028 begin`);
      const actual: number = cardTranslateYOf(0, 1536);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=1536): actual=${actual}`);
      expect(actual).assertClose(-2129.348138680152, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0029
     * @tc.name      ComponentCollection_CardTranslateYOf_0029
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=1632) returns -2262.432397347661
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0029 begin`);
      const actual: number = cardTranslateYOf(0, 1632);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=1632): actual=${actual}`);
      expect(actual).assertClose(-2262.432397347661, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0030
     * @tc.name      ComponentCollection_CardTranslateYOf_0030
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=1728) returns -2395.516656015171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0030 begin`);
      const actual: number = cardTranslateYOf(0, 1728);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=1728): actual=${actual}`);
      expect(actual).assertClose(-2395.516656015171, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0031
     * @tc.name      ComponentCollection_CardTranslateYOf_0031
     * @tc.desc      cardTranslateYOf(sx=0, windowHeight=1824) returns -2528.6009146826805
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0031 begin`);
      const actual: number = cardTranslateYOf(0, 1824);
      logInfo(`cardTranslateYOf(sx=0, windowHeight=1824): actual=${actual}`);
      expect(actual).assertClose(-2528.6009146826805, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0032
     * @tc.name      ComponentCollection_CardTranslateYOf_0032
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=1) returns -2.197224577336219
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0032 begin`);
      const actual: number = cardTranslateYOf(-1, 1);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=1): actual=${actual}`);
      expect(actual).assertClose(-2.197224577336219, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0033
     * @tc.name      ComponentCollection_CardTranslateYOf_0033
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=2) returns -4.394449154672438
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0033 begin`);
      const actual: number = cardTranslateYOf(-1, 2);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=2): actual=${actual}`);
      expect(actual).assertClose(-4.394449154672438, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0034
     * @tc.name      ComponentCollection_CardTranslateYOf_0034
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=3) returns -6.591673732008657
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0034 begin`);
      const actual: number = cardTranslateYOf(-1, 3);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=3): actual=${actual}`);
      expect(actual).assertClose(-6.591673732008657, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0035
     * @tc.name      ComponentCollection_CardTranslateYOf_0035
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=100) returns -219.72245773362192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0035 begin`);
      const actual: number = cardTranslateYOf(-1, 100);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=100): actual=${actual}`);
      expect(actual).assertClose(-219.72245773362192, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0036
     * @tc.name      ComponentCollection_CardTranslateYOf_0036
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=360) returns -791.0008478410389
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0036 begin`);
      const actual: number = cardTranslateYOf(-1, 360);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=360): actual=${actual}`);
      expect(actual).assertClose(-791.0008478410389, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0037
     * @tc.name      ComponentCollection_CardTranslateYOf_0037
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=720) returns -1582.0016956820778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0037 begin`);
      const actual: number = cardTranslateYOf(-1, 720);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=720): actual=${actual}`);
      expect(actual).assertClose(-1582.0016956820778, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0038
     * @tc.name      ComponentCollection_CardTranslateYOf_0038
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=1080) returns -2373.002543523117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0038 begin`);
      const actual: number = cardTranslateYOf(-1, 1080);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=1080): actual=${actual}`);
      expect(actual).assertClose(-2373.002543523117, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0039
     * @tc.name      ComponentCollection_CardTranslateYOf_0039
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=1920) returns -4218.67118848554
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0039 begin`);
      const actual: number = cardTranslateYOf(-1, 1920);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=1920): actual=${actual}`);
      expect(actual).assertClose(-4218.67118848554, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0040
     * @tc.name      ComponentCollection_CardTranslateYOf_0040
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=10) returns -21.97224577336219
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0040 begin`);
      const actual: number = cardTranslateYOf(-1, 10);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=10): actual=${actual}`);
      expect(actual).assertClose(-21.97224577336219, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0041
     * @tc.name      ComponentCollection_CardTranslateYOf_0041
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=96) returns -210.93355942427704
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0041 begin`);
      const actual: number = cardTranslateYOf(-1, 96);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=96): actual=${actual}`);
      expect(actual).assertClose(-210.93355942427704, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0042
     * @tc.name      ComponentCollection_CardTranslateYOf_0042
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=192) returns -421.86711884855407
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0042 begin`);
      const actual: number = cardTranslateYOf(-1, 192);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=192): actual=${actual}`);
      expect(actual).assertClose(-421.86711884855407, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0043
     * @tc.name      ComponentCollection_CardTranslateYOf_0043
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=288) returns -632.8006782728311
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0043 begin`);
      const actual: number = cardTranslateYOf(-1, 288);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=288): actual=${actual}`);
      expect(actual).assertClose(-632.8006782728311, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0044
     * @tc.name      ComponentCollection_CardTranslateYOf_0044
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=384) returns -843.7342376971081
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0044 begin`);
      const actual: number = cardTranslateYOf(-1, 384);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=384): actual=${actual}`);
      expect(actual).assertClose(-843.7342376971081, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0045
     * @tc.name      ComponentCollection_CardTranslateYOf_0045
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=480) returns -1054.667797121385
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0045 begin`);
      const actual: number = cardTranslateYOf(-1, 480);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=480): actual=${actual}`);
      expect(actual).assertClose(-1054.667797121385, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0046
     * @tc.name      ComponentCollection_CardTranslateYOf_0046
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=576) returns -1265.6013565456622
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0046 begin`);
      const actual: number = cardTranslateYOf(-1, 576);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=576): actual=${actual}`);
      expect(actual).assertClose(-1265.6013565456622, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0047
     * @tc.name      ComponentCollection_CardTranslateYOf_0047
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=672) returns -1476.5349159699392
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0047 begin`);
      const actual: number = cardTranslateYOf(-1, 672);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=672): actual=${actual}`);
      expect(actual).assertClose(-1476.5349159699392, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0048
     * @tc.name      ComponentCollection_CardTranslateYOf_0048
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=768) returns -1687.4684753942163
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0048 begin`);
      const actual: number = cardTranslateYOf(-1, 768);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=768): actual=${actual}`);
      expect(actual).assertClose(-1687.4684753942163, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0049
     * @tc.name      ComponentCollection_CardTranslateYOf_0049
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=864) returns -1898.4020348184933
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0049 begin`);
      const actual: number = cardTranslateYOf(-1, 864);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=864): actual=${actual}`);
      expect(actual).assertClose(-1898.4020348184933, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0049 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_CARD_TRANSLATE_YOF_0050
     * @tc.name      ComponentCollection_CardTranslateYOf_0050
     * @tc.desc      cardTranslateYOf(sx=-1, windowHeight=960) returns -2109.33559424277
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_CardTranslateYOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CardTranslateYOf_0050 begin`);
      const actual: number = cardTranslateYOf(-1, 960);
      logInfo(`cardTranslateYOf(sx=-1, windowHeight=960): actual=${actual}`);
      expect(actual).assertClose(-2109.33559424277, PRECISION);
      logInfo(`${BUNDLE}CardTranslateYOf_0050 end`);
    });
  });
}
