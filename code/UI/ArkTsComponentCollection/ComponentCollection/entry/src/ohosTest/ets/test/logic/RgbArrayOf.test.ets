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
import { rgbArrayOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for rgbArrayOf (50 cases). */
export default function rgbArrayOfTest(): void {
  describe('RgbArrayOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0001
     * @tc.name      ComponentCollection_RgbArrayOf_0001
     * @tc.desc      rgbArrayOf(colorRGBData=0.000001) returns [128,256,128]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_RgbArrayOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0001 begin`);
      const actual: number[] = rgbArrayOf(0.000001);
      logInfo(`rgbArrayOf(colorRGBData=0.000001): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=0.000001): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[128,256,128]');
      logInfo(`${BUNDLE}RgbArrayOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0002
     * @tc.name      ComponentCollection_RgbArrayOf_0002
     * @tc.desc      rgbArrayOf(colorRGBData=0.5) returns [189,240,67]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_RgbArrayOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0002 begin`);
      const actual: number[] = rgbArrayOf(0.5);
      logInfo(`rgbArrayOf(colorRGBData=0.5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=0.5): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[189,240,67]');
      logInfo(`${BUNDLE}RgbArrayOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0003
     * @tc.name      ComponentCollection_RgbArrayOf_0003
     * @tc.desc      rgbArrayOf(colorRGBData=1) returns [236,197,20]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0003 begin`);
      const actual: number[] = rgbArrayOf(1);
      logInfo(`rgbArrayOf(colorRGBData=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=1): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[236,197,20]');
      logInfo(`${BUNDLE}RgbArrayOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0004
     * @tc.name      ComponentCollection_RgbArrayOf_0004
     * @tc.desc      rgbArrayOf(colorRGBData=0.25) returns [160,252,96]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0004 begin`);
      const actual: number[] = rgbArrayOf(0.25);
      logInfo(`rgbArrayOf(colorRGBData=0.25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=0.25): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[160,252,96]');
      logInfo(`${BUNDLE}RgbArrayOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0005
     * @tc.name      ComponentCollection_RgbArrayOf_0005
     * @tc.desc      rgbArrayOf(colorRGBData=256) returns [0,123,256]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_RgbArrayOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0005 begin`);
      const actual: number[] = rgbArrayOf(256);
      logInfo(`rgbArrayOf(colorRGBData=256): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=256): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[0,123,256]');
      logInfo(`${BUNDLE}RgbArrayOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0006
     * @tc.name      ComponentCollection_RgbArrayOf_0006
     * @tc.desc      rgbArrayOf(colorRGBData=255) returns [63,18,193]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_RgbArrayOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0006 begin`);
      const actual: number[] = rgbArrayOf(255);
      logInfo(`rgbArrayOf(colorRGBData=255): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=255): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[63,18,193]');
      logInfo(`${BUNDLE}RgbArrayOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0007
     * @tc.name      ComponentCollection_RgbArrayOf_0007
     * @tc.desc      rgbArrayOf(colorRGBData=257) returns [55,233,201]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_RgbArrayOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0007 begin`);
      const actual: number[] = rgbArrayOf(257);
      logInfo(`rgbArrayOf(colorRGBData=257): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=257): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[55,233,201]');
      logInfo(`${BUNDLE}RgbArrayOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0008
     * @tc.name      ComponentCollection_RgbArrayOf_0008
     * @tc.desc      rgbArrayOf(colorRGBData=512) returns [138,0,118]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0008 begin`);
      const actual: number[] = rgbArrayOf(512);
      logInfo(`rgbArrayOf(colorRGBData=512): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=512): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[138,0,118]');
      logInfo(`${BUNDLE}RgbArrayOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0009
     * @tc.name      ComponentCollection_RgbArrayOf_0009
     * @tc.desc      rgbArrayOf(colorRGBData=128) returns [220,39,36]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0009 begin`);
      const actual: number[] = rgbArrayOf(128);
      logInfo(`rgbArrayOf(colorRGBData=128): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=128): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[220,39,36]');
      logInfo(`${BUNDLE}RgbArrayOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0010
     * @tc.name      ComponentCollection_RgbArrayOf_0010
     * @tc.desc      rgbArrayOf(colorRGBData=-1) returns [20,197,236]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RgbArrayOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0010 begin`);
      const actual: number[] = rgbArrayOf(-1);
      logInfo(`rgbArrayOf(colorRGBData=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=-1): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[20,197,236]');
      logInfo(`${BUNDLE}RgbArrayOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0011
     * @tc.name      ComponentCollection_RgbArrayOf_0011
     * @tc.desc      rgbArrayOf(colorRGBData=2) returns [244,75,12]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0011 begin`);
      const actual: number[] = rgbArrayOf(2);
      logInfo(`rgbArrayOf(colorRGBData=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=2): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[244,75,12]');
      logInfo(`${BUNDLE}RgbArrayOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0012
     * @tc.name      ComponentCollection_RgbArrayOf_0012
     * @tc.desc      rgbArrayOf(colorRGBData=3) returns [146,1,110]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0012 begin`);
      const actual: number[] = rgbArrayOf(3);
      logInfo(`rgbArrayOf(colorRGBData=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=3): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[146,1,110]');
      logInfo(`${BUNDLE}RgbArrayOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0013
     * @tc.name      ComponentCollection_RgbArrayOf_0013
     * @tc.desc      rgbArrayOf(colorRGBData=10) returns [58,21,198]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0013 begin`);
      const actual: number[] = rgbArrayOf(10);
      logInfo(`rgbArrayOf(colorRGBData=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=10): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[58,21,198]');
      logInfo(`${BUNDLE}RgbArrayOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0014
     * @tc.name      ComponentCollection_RgbArrayOf_0014
     * @tc.desc      rgbArrayOf(colorRGBData=100) returns [63,238,193]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0014 begin`);
      const actual: number[] = rgbArrayOf(100);
      logInfo(`rgbArrayOf(colorRGBData=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=100): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[63,238,193]');
      logInfo(`${BUNDLE}RgbArrayOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0015
     * @tc.name      ComponentCollection_RgbArrayOf_0015
     * @tc.desc      rgbArrayOf(colorRGBData=26) returns [226,211,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0015 begin`);
      const actual: number[] = rgbArrayOf(26);
      logInfo(`rgbArrayOf(colorRGBData=26): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=26): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[226,211,30]');
      logInfo(`${BUNDLE}RgbArrayOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0016
     * @tc.name      ComponentCollection_RgbArrayOf_0016
     * @tc.desc      rgbArrayOf(colorRGBData=52) returns [254,107,2]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0016 begin`);
      const actual: number[] = rgbArrayOf(52);
      logInfo(`rgbArrayOf(colorRGBData=52): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=52): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[254,107,2]');
      logInfo(`${BUNDLE}RgbArrayOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0017
     * @tc.name      ComponentCollection_RgbArrayOf_0017
     * @tc.desc      rgbArrayOf(colorRGBData=78) returns [194,18,62]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0017 begin`);
      const actual: number[] = rgbArrayOf(78);
      logInfo(`rgbArrayOf(colorRGBData=78): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=78): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[194,18,62]');
      logInfo(`${BUNDLE}RgbArrayOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0018
     * @tc.name      ComponentCollection_RgbArrayOf_0018
     * @tc.desc      rgbArrayOf(colorRGBData=104) returns [87,7,169]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0018 begin`);
      const actual: number[] = rgbArrayOf(104);
      logInfo(`rgbArrayOf(colorRGBData=104): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=104): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[87,7,169]');
      logInfo(`${BUNDLE}RgbArrayOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0019
     * @tc.name      ComponentCollection_RgbArrayOf_0019
     * @tc.desc      rgbArrayOf(colorRGBData=130) returns [9,81,247]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0019 begin`);
      const actual: number[] = rgbArrayOf(130);
      logInfo(`rgbArrayOf(colorRGBData=130): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=130): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[9,81,247]');
      logInfo(`${BUNDLE}RgbArrayOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0020
     * @tc.name      ComponentCollection_RgbArrayOf_0020
     * @tc.desc      rgbArrayOf(colorRGBData=156) returns [15,188,241]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0020 begin`);
      const actual: number[] = rgbArrayOf(156);
      logInfo(`rgbArrayOf(colorRGBData=156): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=156): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[15,188,241]');
      logInfo(`${BUNDLE}RgbArrayOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0021
     * @tc.name      ComponentCollection_RgbArrayOf_0021
     * @tc.desc      rgbArrayOf(colorRGBData=182) returns [101,253,155]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0021 begin`);
      const actual: number[] = rgbArrayOf(182);
      logInfo(`rgbArrayOf(colorRGBData=182): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=182): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[101,253,155]');
      logInfo(`${BUNDLE}RgbArrayOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0022
     * @tc.name      ComponentCollection_RgbArrayOf_0022
     * @tc.desc      rgbArrayOf(colorRGBData=208) returns [206,230,50]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0022 begin`);
      const actual: number[] = rgbArrayOf(208);
      logInfo(`rgbArrayOf(colorRGBData=208): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=208): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[206,230,50]');
      logInfo(`${BUNDLE}RgbArrayOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0023
     * @tc.name      ComponentCollection_RgbArrayOf_0023
     * @tc.desc      rgbArrayOf(colorRGBData=234) returns [256,134,0]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0023 begin`);
      const actual: number[] = rgbArrayOf(234);
      logInfo(`rgbArrayOf(colorRGBData=234): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=234): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[256,134,0]');
      logInfo(`${BUNDLE}RgbArrayOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0024
     * @tc.name      ComponentCollection_RgbArrayOf_0024
     * @tc.desc      rgbArrayOf(colorRGBData=260) returns [215,35,41]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0024 begin`);
      const actual: number[] = rgbArrayOf(260);
      logInfo(`rgbArrayOf(colorRGBData=260): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=260): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[215,35,41]');
      logInfo(`${BUNDLE}RgbArrayOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0025
     * @tc.name      ComponentCollection_RgbArrayOf_0025
     * @tc.desc      rgbArrayOf(colorRGBData=286) returns [113,1,143]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0025 begin`);
      const actual: number[] = rgbArrayOf(286);
      logInfo(`rgbArrayOf(colorRGBData=286): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=286): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[113,1,143]');
      logInfo(`${BUNDLE}RgbArrayOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0026
     * @tc.name      ComponentCollection_RgbArrayOf_0026
     * @tc.desc      rgbArrayOf(colorRGBData=312) returns [22,57,234]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0026 begin`);
      const actual: number[] = rgbArrayOf(312);
      logInfo(`rgbArrayOf(colorRGBData=312): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=312): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[22,57,234]');
      logInfo(`${BUNDLE}RgbArrayOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0027
     * @tc.name      ComponentCollection_RgbArrayOf_0027
     * @tc.desc      rgbArrayOf(colorRGBData=338) returns [5,163,251]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0027 begin`);
      const actual: number[] = rgbArrayOf(338);
      logInfo(`rgbArrayOf(colorRGBData=338): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=338): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[5,163,251]');
      logInfo(`${BUNDLE}RgbArrayOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0028
     * @tc.name      ComponentCollection_RgbArrayOf_0028
     * @tc.desc      rgbArrayOf(colorRGBData=364) returns [75,245,181]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0028 begin`);
      const actual: number[] = rgbArrayOf(364);
      logInfo(`rgbArrayOf(colorRGBData=364): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=364): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[75,245,181]');
      logInfo(`${BUNDLE}RgbArrayOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0029
     * @tc.name      ComponentCollection_RgbArrayOf_0029
     * @tc.desc      rgbArrayOf(colorRGBData=390) returns [183,244,73]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0029 begin`);
      const actual: number[] = rgbArrayOf(390);
      logInfo(`rgbArrayOf(colorRGBData=390): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=390): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[183,244,73]');
      logInfo(`${BUNDLE}RgbArrayOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0030
     * @tc.name      ComponentCollection_RgbArrayOf_0030
     * @tc.desc      rgbArrayOf(colorRGBData=416) returns [252,161,4]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0030 begin`);
      const actual: number[] = rgbArrayOf(416);
      logInfo(`rgbArrayOf(colorRGBData=416): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=416): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[252,161,4]');
      logInfo(`${BUNDLE}RgbArrayOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0031
     * @tc.name      ComponentCollection_RgbArrayOf_0031
     * @tc.desc      rgbArrayOf(colorRGBData=442) returns [233,55,23]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0031 begin`);
      const actual: number[] = rgbArrayOf(442);
      logInfo(`rgbArrayOf(colorRGBData=442): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=442): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[233,55,23]');
      logInfo(`${BUNDLE}RgbArrayOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0032
     * @tc.name      ComponentCollection_RgbArrayOf_0032
     * @tc.desc      rgbArrayOf(colorRGBData=468) returns [140,1,116]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0032 begin`);
      const actual: number[] = rgbArrayOf(468);
      logInfo(`rgbArrayOf(colorRGBData=468): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=468): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[140,1,116]');
      logInfo(`${BUNDLE}RgbArrayOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0033
     * @tc.name      ComponentCollection_RgbArrayOf_0033
     * @tc.desc      rgbArrayOf(colorRGBData=494) returns [39,36,217]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0033 begin`);
      const actual: number[] = rgbArrayOf(494);
      logInfo(`rgbArrayOf(colorRGBData=494): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=494): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[39,36,217]');
      logInfo(`${BUNDLE}RgbArrayOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0034
     * @tc.name      ComponentCollection_RgbArrayOf_0034
     * @tc.desc      rgbArrayOf(colorRGBData=520) returns [0,136,256]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0034 begin`);
      const actual: number[] = rgbArrayOf(520);
      logInfo(`rgbArrayOf(colorRGBData=520): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=520): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[0,136,256]');
      logInfo(`${BUNDLE}RgbArrayOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0035
     * @tc.name      ComponentCollection_RgbArrayOf_0035
     * @tc.desc      rgbArrayOf(colorRGBData=546) returns [52,231,204]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0035 begin`);
      const actual: number[] = rgbArrayOf(546);
      logInfo(`rgbArrayOf(colorRGBData=546): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=546): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[52,231,204]');
      logInfo(`${BUNDLE}RgbArrayOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0036
     * @tc.name      ComponentCollection_RgbArrayOf_0036
     * @tc.desc      rgbArrayOf(colorRGBData=572) returns [157,253,99]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0036 begin`);
      const actual: number[] = rgbArrayOf(572);
      logInfo(`rgbArrayOf(colorRGBData=572): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=572): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[157,253,99]');
      logInfo(`${BUNDLE}RgbArrayOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0037
     * @tc.name      ComponentCollection_RgbArrayOf_0037
     * @tc.desc      rgbArrayOf(colorRGBData=598) returns [242,186,14]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0037 begin`);
      const actual: number[] = rgbArrayOf(598);
      logInfo(`rgbArrayOf(colorRGBData=598): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=598): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[242,186,14]');
      logInfo(`${BUNDLE}RgbArrayOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0038
     * @tc.name      ComponentCollection_RgbArrayOf_0038
     * @tc.desc      rgbArrayOf(colorRGBData=624) returns [246,79,10]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0038 begin`);
      const actual: number[] = rgbArrayOf(624);
      logInfo(`rgbArrayOf(colorRGBData=624): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=624): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[246,79,10]');
      logInfo(`${BUNDLE}RgbArrayOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0039
     * @tc.name      ComponentCollection_RgbArrayOf_0039
     * @tc.desc      rgbArrayOf(colorRGBData=650) returns [167,6,89]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0039 begin`);
      const actual: number[] = rgbArrayOf(650);
      logInfo(`rgbArrayOf(colorRGBData=650): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=650): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[167,6,89]');
      logInfo(`${BUNDLE}RgbArrayOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0040
     * @tc.name      ComponentCollection_RgbArrayOf_0040
     * @tc.desc      rgbArrayOf(colorRGBData=676) returns [60,19,196]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0040 begin`);
      const actual: number[] = rgbArrayOf(676);
      logInfo(`rgbArrayOf(colorRGBData=676): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=676): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[60,19,196]');
      logInfo(`${BUNDLE}RgbArrayOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0041
     * @tc.name      ComponentCollection_RgbArrayOf_0041
     * @tc.desc      rgbArrayOf(colorRGBData=702) returns [1,109,255]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0041 begin`);
      const actual: number[] = rgbArrayOf(702);
      logInfo(`rgbArrayOf(colorRGBData=702): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=702): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[1,109,255]');
      logInfo(`${BUNDLE}RgbArrayOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0042
     * @tc.name      ComponentCollection_RgbArrayOf_0042
     * @tc.desc      rgbArrayOf(colorRGBData=728) returns [32,213,224]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0042 begin`);
      const actual: number[] = rgbArrayOf(728);
      logInfo(`rgbArrayOf(colorRGBData=728): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=728): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,213,224]');
      logInfo(`${BUNDLE}RgbArrayOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0043
     * @tc.name      ComponentCollection_RgbArrayOf_0043
     * @tc.desc      rgbArrayOf(colorRGBData=754) returns [130,256,126]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0043 begin`);
      const actual: number[] = rgbArrayOf(754);
      logInfo(`rgbArrayOf(colorRGBData=754): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=754): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[130,256,126]');
      logInfo(`${BUNDLE}RgbArrayOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0044
     * @tc.name      ComponentCollection_RgbArrayOf_0044
     * @tc.desc      rgbArrayOf(colorRGBData=780) returns [227,209,29]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0044 begin`);
      const actual: number[] = rgbArrayOf(780);
      logInfo(`rgbArrayOf(colorRGBData=780): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=780): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[227,209,29]');
      logInfo(`${BUNDLE}RgbArrayOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0045
     * @tc.name      ComponentCollection_RgbArrayOf_0045
     * @tc.desc      rgbArrayOf(colorRGBData=806) returns [254,105,2]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0045 begin`);
      const actual: number[] = rgbArrayOf(806);
      logInfo(`rgbArrayOf(colorRGBData=806): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=806): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[254,105,2]');
      logInfo(`${BUNDLE}RgbArrayOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0046
     * @tc.name      ComponentCollection_RgbArrayOf_0046
     * @tc.desc      rgbArrayOf(colorRGBData=832) returns [192,17,64]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0046 begin`);
      const actual: number[] = rgbArrayOf(832);
      logInfo(`rgbArrayOf(colorRGBData=832): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=832): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[192,17,64]');
      logInfo(`${BUNDLE}RgbArrayOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0047
     * @tc.name      ComponentCollection_RgbArrayOf_0047
     * @tc.desc      rgbArrayOf(colorRGBData=858) returns [85,8,171]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0047 begin`);
      const actual: number[] = rgbArrayOf(858);
      logInfo(`rgbArrayOf(colorRGBData=858): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=858): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[85,8,171]');
      logInfo(`${BUNDLE}RgbArrayOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0048
     * @tc.name      ComponentCollection_RgbArrayOf_0048
     * @tc.desc      rgbArrayOf(colorRGBData=884) returns [8,83,248]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0048 begin`);
      const actual: number[] = rgbArrayOf(884);
      logInfo(`rgbArrayOf(colorRGBData=884): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=884): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[8,83,248]');
      logInfo(`${BUNDLE}RgbArrayOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0049
     * @tc.name      ComponentCollection_RgbArrayOf_0049
     * @tc.desc      rgbArrayOf(colorRGBData=910) returns [16,190,240]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0049 begin`);
      const actual: number[] = rgbArrayOf(910);
      logInfo(`rgbArrayOf(colorRGBData=910): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=910): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[16,190,240]');
      logInfo(`${BUNDLE}RgbArrayOf_0049 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_ARRAY_OF_0050
     * @tc.name      ComponentCollection_RgbArrayOf_0050
     * @tc.desc      rgbArrayOf(colorRGBData=936) returns [103,254,153]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbArrayOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbArrayOf_0050 begin`);
      const actual: number[] = rgbArrayOf(936);
      logInfo(`rgbArrayOf(colorRGBData=936): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`rgbArrayOf(colorRGBData=936): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[103,254,153]');
      logInfo(`${BUNDLE}RgbArrayOf_0050 end`);
    });
  });
}
