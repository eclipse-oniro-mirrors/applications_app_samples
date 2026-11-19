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
import { rgbOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for rgbOf (50 cases). */
export default function rgbOfTest(): void {
  describe('RgbOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0001
     * @tc.name      ComponentCollection_RgbOf_0001
     * @tc.desc      rgbOf(colorRGBData=0.000001) returns "#8108"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_RgbOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RgbOf_0001 begin`);
      const actual: string = rgbOf(0.000001);
      logInfo(`rgbOf(colorRGBData=0.000001): actual=${actual}`);
      expect(actual).assertEqual('#8108');
      logInfo(`${BUNDLE}RgbOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0002
     * @tc.name      ComponentCollection_RgbOf_0002
     * @tc.desc      rgbOf(colorRGBData=0.5) returns "#cf4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_RgbOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RgbOf_0002 begin`);
      const actual: string = rgbOf(0.5);
      logInfo(`rgbOf(colorRGBData=0.5): actual=${actual}`);
      expect(actual).assertEqual('#cf4');
      logInfo(`${BUNDLE}RgbOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0003
     * @tc.name      ComponentCollection_RgbOf_0003
     * @tc.desc      rgbOf(colorRGBData=1) returns "#fc1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0003 begin`);
      const actual: string = rgbOf(1);
      logInfo(`rgbOf(colorRGBData=1): actual=${actual}`);
      expect(actual).assertEqual('#fc1');
      logInfo(`${BUNDLE}RgbOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0004
     * @tc.name      ComponentCollection_RgbOf_0004
     * @tc.desc      rgbOf(colorRGBData=0.25) returns "#a106"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0004 begin`);
      const actual: string = rgbOf(0.25);
      logInfo(`rgbOf(colorRGBData=0.25): actual=${actual}`);
      expect(actual).assertEqual('#a106');
      logInfo(`${BUNDLE}RgbOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0005
     * @tc.name      ComponentCollection_RgbOf_0005
     * @tc.desc      rgbOf(colorRGBData=16) returns "#60a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_RgbOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RgbOf_0005 begin`);
      const actual: string = rgbOf(16);
      logInfo(`rgbOf(colorRGBData=16): actual=${actual}`);
      expect(actual).assertEqual('#60a');
      logInfo(`${BUNDLE}RgbOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0006
     * @tc.name      ComponentCollection_RgbOf_0006
     * @tc.desc      rgbOf(colorRGBData=15) returns "#d23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_RgbOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RgbOf_0006 begin`);
      const actual: string = rgbOf(15);
      logInfo(`rgbOf(colorRGBData=15): actual=${actual}`);
      expect(actual).assertEqual('#d23');
      logInfo(`${BUNDLE}RgbOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0007
     * @tc.name      ComponentCollection_RgbOf_0007
     * @tc.desc      rgbOf(colorRGBData=17) returns "#0610"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_RgbOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RgbOf_0007 begin`);
      const actual: string = rgbOf(17);
      logInfo(`rgbOf(colorRGBData=17): actual=${actual}`);
      expect(actual).assertEqual('#0610');
      logInfo(`${BUNDLE}RgbOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0008
     * @tc.name      ComponentCollection_RgbOf_0008
     * @tc.desc      rgbOf(colorRGBData=8) returns "#1070"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0008 begin`);
      const actual: string = rgbOf(8);
      logInfo(`rgbOf(colorRGBData=8): actual=${actual}`);
      expect(actual).assertEqual('#1070');
      logInfo(`${BUNDLE}RgbOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0009
     * @tc.name      ComponentCollection_RgbOf_0009
     * @tc.desc      rgbOf(colorRGBData=-1) returns "#1cf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RgbOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RgbOf_0009 begin`);
      const actual: string = rgbOf(-1);
      logInfo(`rgbOf(colorRGBData=-1): actual=${actual}`);
      expect(actual).assertEqual('#1cf');
      logInfo(`${BUNDLE}RgbOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0010
     * @tc.name      ComponentCollection_RgbOf_0010
     * @tc.desc      rgbOf(colorRGBData=2) returns "#f51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0010 begin`);
      const actual: string = rgbOf(2);
      logInfo(`rgbOf(colorRGBData=2): actual=${actual}`);
      expect(actual).assertEqual('#f51');
      logInfo(`${BUNDLE}RgbOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0011
     * @tc.name      ComponentCollection_RgbOf_0011
     * @tc.desc      rgbOf(colorRGBData=3) returns "#907"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0011 begin`);
      const actual: string = rgbOf(3);
      logInfo(`rgbOf(colorRGBData=3): actual=${actual}`);
      expect(actual).assertEqual('#907');
      logInfo(`${BUNDLE}RgbOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0012
     * @tc.name      ComponentCollection_RgbOf_0012
     * @tc.desc      rgbOf(colorRGBData=10) returns "#41c"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0012 begin`);
      const actual: string = rgbOf(10);
      logInfo(`rgbOf(colorRGBData=10): actual=${actual}`);
      expect(actual).assertEqual('#41c');
      logInfo(`${BUNDLE}RgbOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0013
     * @tc.name      ComponentCollection_RgbOf_0013
     * @tc.desc      rgbOf(colorRGBData=100) returns "#4fc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0013 begin`);
      const actual: string = rgbOf(100);
      logInfo(`rgbOf(colorRGBData=100): actual=${actual}`);
      expect(actual).assertEqual('#4fc');
      logInfo(`${BUNDLE}RgbOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0014
     * @tc.name      ComponentCollection_RgbOf_0014
     * @tc.desc      rgbOf(colorRGBData=5) returns "#0a10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0014 begin`);
      const actual: string = rgbOf(5);
      logInfo(`rgbOf(colorRGBData=5): actual=${actual}`);
      expect(actual).assertEqual('#0a10');
      logInfo(`${BUNDLE}RgbOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0015
     * @tc.name      ComponentCollection_RgbOf_0015
     * @tc.desc      rgbOf(colorRGBData=20) returns "#fb1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0015 begin`);
      const actual: string = rgbOf(20);
      logInfo(`rgbOf(colorRGBData=20): actual=${actual}`);
      expect(actual).assertEqual('#fb1');
      logInfo(`${BUNDLE}RgbOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0016
     * @tc.name      ComponentCollection_RgbOf_0016
     * @tc.desc      rgbOf(colorRGBData=25) returns "#7109"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0016 begin`);
      const actual: string = rgbOf(25);
      logInfo(`rgbOf(colorRGBData=25): actual=${actual}`);
      expect(actual).assertEqual('#7109');
      logInfo(`${BUNDLE}RgbOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0017
     * @tc.name      ComponentCollection_RgbOf_0017
     * @tc.desc      rgbOf(colorRGBData=30) returns "#0910"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0017 begin`);
      const actual: string = rgbOf(30);
      logInfo(`rgbOf(colorRGBData=30): actual=${actual}`);
      expect(actual).assertEqual('#0910');
      logInfo(`${BUNDLE}RgbOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0018
     * @tc.name      ComponentCollection_RgbOf_0018
     * @tc.desc      rgbOf(colorRGBData=35) returns "#51b"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0018 begin`);
      const actual: string = rgbOf(35);
      logInfo(`rgbOf(colorRGBData=35): actual=${actual}`);
      expect(actual).assertEqual('#51b');
      logInfo(`${BUNDLE}RgbOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0019
     * @tc.name      ComponentCollection_RgbOf_0019
     * @tc.desc      rgbOf(colorRGBData=40) returns "#e32"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0019 begin`);
      const actual: string = rgbOf(40);
      logInfo(`rgbOf(colorRGBData=40): actual=${actual}`);
      expect(actual).assertEqual('#e32');
      logInfo(`${BUNDLE}RgbOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0020
     * @tc.name      ComponentCollection_RgbOf_0020
     * @tc.desc      rgbOf(colorRGBData=50) returns "#610a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0020 begin`);
      const actual: string = rgbOf(50);
      logInfo(`rgbOf(colorRGBData=50): actual=${actual}`);
      expect(actual).assertEqual('#610a');
      logInfo(`${BUNDLE}RgbOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0021
     * @tc.name      ComponentCollection_RgbOf_0021
     * @tc.desc      rgbOf(colorRGBData=55) returns "#0810"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0021 begin`);
      const actual: string = rgbOf(55);
      logInfo(`rgbOf(colorRGBData=55): actual=${actual}`);
      expect(actual).assertEqual('#0810');
      logInfo(`${BUNDLE}RgbOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0022
     * @tc.name      ComponentCollection_RgbOf_0022
     * @tc.desc      rgbOf(colorRGBData=65) returns "#f41"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0022 begin`);
      const actual: string = rgbOf(65);
      logInfo(`rgbOf(colorRGBData=65): actual=${actual}`);
      expect(actual).assertEqual('#f41');
      logInfo(`${BUNDLE}RgbOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0023
     * @tc.name      ComponentCollection_RgbOf_0023
     * @tc.desc      rgbOf(colorRGBData=70) returns "#ed2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0023 begin`);
      const actual: string = rgbOf(70);
      logInfo(`rgbOf(colorRGBData=70): actual=${actual}`);
      expect(actual).assertEqual('#ed2');
      logInfo(`${BUNDLE}RgbOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0024
     * @tc.name      ComponentCollection_RgbOf_0024
     * @tc.desc      rgbOf(colorRGBData=75) returns "#5fb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0024 begin`);
      const actual: string = rgbOf(75);
      logInfo(`rgbOf(colorRGBData=75): actual=${actual}`);
      expect(actual).assertEqual('#5fb');
      logInfo(`${BUNDLE}RgbOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0025
     * @tc.name      ComponentCollection_RgbOf_0025
     * @tc.desc      rgbOf(colorRGBData=80) returns "#0710"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0025 begin`);
      const actual: string = rgbOf(80);
      logInfo(`rgbOf(colorRGBData=80): actual=${actual}`);
      expect(actual).assertEqual('#0710');
      logInfo(`${BUNDLE}RgbOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0026
     * @tc.name      ComponentCollection_RgbOf_0026
     * @tc.desc      rgbOf(colorRGBData=85) returns "#709"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0026 begin`);
      const actual: string = rgbOf(85);
      logInfo(`rgbOf(colorRGBData=85): actual=${actual}`);
      expect(actual).assertEqual('#709');
      logInfo(`${BUNDLE}RgbOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0027
     * @tc.name      ComponentCollection_RgbOf_0027
     * @tc.desc      rgbOf(colorRGBData=95) returns "#de3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0027 begin`);
      const actual: string = rgbOf(95);
      logInfo(`rgbOf(colorRGBData=95): actual=${actual}`);
      expect(actual).assertEqual('#de3');
      logInfo(`${BUNDLE}RgbOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0028
     * @tc.name      ComponentCollection_RgbOf_0028
     * @tc.desc      rgbOf(colorRGBData=110) returns "#808"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0028 begin`);
      const actual: string = rgbOf(110);
      logInfo(`rgbOf(colorRGBData=110): actual=${actual}`);
      expect(actual).assertEqual('#808');
      logInfo(`${BUNDLE}RgbOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0029
     * @tc.name      ComponentCollection_RgbOf_0029
     * @tc.desc      rgbOf(colorRGBData=115) returns "#1050"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0029 begin`);
      const actual: string = rgbOf(115);
      logInfo(`rgbOf(colorRGBData=115): actual=${actual}`);
      expect(actual).assertEqual('#1050');
      logInfo(`${BUNDLE}RgbOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0030
     * @tc.name      ComponentCollection_RgbOf_0030
     * @tc.desc      rgbOf(colorRGBData=120) returns "#df3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0030 begin`);
      const actual: string = rgbOf(120);
      logInfo(`rgbOf(colorRGBData=120): actual=${actual}`);
      expect(actual).assertEqual('#df3');
      logInfo(`${BUNDLE}RgbOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0031
     * @tc.name      ComponentCollection_RgbOf_0031
     * @tc.desc      rgbOf(colorRGBData=125) returns "#3ed"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0031 begin`);
      const actual: string = rgbOf(125);
      logInfo(`rgbOf(colorRGBData=125): actual=${actual}`);
      expect(actual).assertEqual('#3ed');
      logInfo(`${BUNDLE}RgbOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0032
     * @tc.name      ComponentCollection_RgbOf_0032
     * @tc.desc      rgbOf(colorRGBData=130) returns "#15f"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0032 begin`);
      const actual: string = rgbOf(130);
      logInfo(`rgbOf(colorRGBData=130): actual=${actual}`);
      expect(actual).assertEqual('#15f');
      logInfo(`${BUNDLE}RgbOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0033
     * @tc.name      ComponentCollection_RgbOf_0033
     * @tc.desc      rgbOf(colorRGBData=140) returns "#1060"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0033 begin`);
      const actual: string = rgbOf(140);
      logInfo(`rgbOf(colorRGBData=140): actual=${actual}`);
      expect(actual).assertEqual('#1060');
      logInfo(`${BUNDLE}RgbOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0034
     * @tc.name      ComponentCollection_RgbOf_0034
     * @tc.desc      rgbOf(colorRGBData=150) returns "#2ee"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0034 begin`);
      const actual: string = rgbOf(150);
      logInfo(`rgbOf(colorRGBData=150): actual=${actual}`);
      expect(actual).assertEqual('#2ee');
      logInfo(`${BUNDLE}RgbOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0035
     * @tc.name      ComponentCollection_RgbOf_0035
     * @tc.desc      rgbOf(colorRGBData=155) returns "#14f"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0035 begin`);
      const actual: string = rgbOf(155);
      logInfo(`rgbOf(colorRGBData=155): actual=${actual}`);
      expect(actual).assertEqual('#14f');
      logInfo(`${BUNDLE}RgbOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0036
     * @tc.name      ComponentCollection_RgbOf_0036
     * @tc.desc      rgbOf(colorRGBData=160) returns "#a06"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0036 begin`);
      const actual: string = rgbOf(160);
      logInfo(`rgbOf(colorRGBData=160): actual=${actual}`);
      expect(actual).assertEqual('#a06');
      logInfo(`${BUNDLE}RgbOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0037
     * @tc.name      ComponentCollection_RgbOf_0037
     * @tc.desc      rgbOf(colorRGBData=170) returns "#b105"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0037 begin`);
      const actual: string = rgbOf(170);
      logInfo(`rgbOf(colorRGBData=170): actual=${actual}`);
      expect(actual).assertEqual('#b105');
      logInfo(`${BUNDLE}RgbOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0038
     * @tc.name      ComponentCollection_RgbOf_0038
     * @tc.desc      rgbOf(colorRGBData=175) returns "#2de"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0038 begin`);
      const actual: string = rgbOf(175);
      logInfo(`rgbOf(colorRGBData=175): actual=${actual}`);
      expect(actual).assertEqual('#2de');
      logInfo(`${BUNDLE}RgbOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0039
     * @tc.name      ComponentCollection_RgbOf_0039
     * @tc.desc      rgbOf(colorRGBData=180) returns "#23e"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0039 begin`);
      const actual: string = rgbOf(180);
      logInfo(`rgbOf(colorRGBData=180): actual=${actual}`);
      expect(actual).assertEqual('#23e');
      logInfo(`${BUNDLE}RgbOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0040
     * @tc.name      ComponentCollection_RgbOf_0040
     * @tc.desc      rgbOf(colorRGBData=185) returns "#b05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0040 begin`);
      const actual: string = rgbOf(185);
      logInfo(`rgbOf(colorRGBData=185): actual=${actual}`);
      expect(actual).assertEqual('#b05');
      logInfo(`${BUNDLE}RgbOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0041
     * @tc.name      ComponentCollection_RgbOf_0041
     * @tc.desc      rgbOf(colorRGBData=190) returns "#1090"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0041 begin`);
      const actual: string = rgbOf(190);
      logInfo(`rgbOf(colorRGBData=190): actual=${actual}`);
      expect(actual).assertEqual('#1090');
      logInfo(`${BUNDLE}RgbOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0042
     * @tc.name      ComponentCollection_RgbOf_0042
     * @tc.desc      rgbOf(colorRGBData=166) returns "#c14"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0042 begin`);
      const actual: string = rgbOf(166);
      logInfo(`rgbOf(colorRGBData=166): actual=${actual}`);
      expect(actual).assertEqual('#c14');
      logInfo(`${BUNDLE}RgbOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0043
     * @tc.name      ComponentCollection_RgbOf_0043
     * @tc.desc      rgbOf(colorRGBData=-31) returns "#bf5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RgbOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RgbOf_0043 begin`);
      const actual: string = rgbOf(-31);
      logInfo(`rgbOf(colorRGBData=-31): actual=${actual}`);
      expect(actual).assertEqual('#bf5');
      logInfo(`${BUNDLE}RgbOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0044
     * @tc.name      ComponentCollection_RgbOf_0044
     * @tc.desc      rgbOf(colorRGBData=139) returns "#ee2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0044 begin`);
      const actual: string = rgbOf(139);
      logInfo(`rgbOf(colorRGBData=139): actual=${actual}`);
      expect(actual).assertEqual('#ee2');
      logInfo(`${BUNDLE}RgbOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0045
     * @tc.name      ComponentCollection_RgbOf_0045
     * @tc.desc      rgbOf(colorRGBData=33) returns "#1080"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0045 begin`);
      const actual: string = rgbOf(33);
      logInfo(`rgbOf(colorRGBData=33): actual=${actual}`);
      expect(actual).assertEqual('#1080');
      logInfo(`${BUNDLE}RgbOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0046
     * @tc.name      ComponentCollection_RgbOf_0046
     * @tc.desc      rgbOf(colorRGBData=-15) returns "#32d"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RgbOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RgbOf_0046 begin`);
      const actual: string = rgbOf(-15);
      logInfo(`rgbOf(colorRGBData=-15): actual=${actual}`);
      expect(actual).assertEqual('#32d');
      logInfo(`${BUNDLE}RgbOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0047
     * @tc.name      ComponentCollection_RgbOf_0047
     * @tc.desc      rgbOf(colorRGBData=-5) returns "#10a0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RgbOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RgbOf_0047 begin`);
      const actual: string = rgbOf(-5);
      logInfo(`rgbOf(colorRGBData=-5): actual=${actual}`);
      expect(actual).assertEqual('#10a0');
      logInfo(`${BUNDLE}RgbOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0048
     * @tc.name      ComponentCollection_RgbOf_0048
     * @tc.desc      rgbOf(colorRGBData=181) returns "#1bf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_RgbOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RgbOf_0048 begin`);
      const actual: string = rgbOf(181);
      logInfo(`rgbOf(colorRGBData=181): actual=${actual}`);
      expect(actual).assertEqual('#1bf');
      logInfo(`${BUNDLE}RgbOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0049
     * @tc.name      ComponentCollection_RgbOf_0049
     * @tc.desc      rgbOf(colorRGBData=-35) returns "#b15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RgbOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RgbOf_0049 begin`);
      const actual: string = rgbOf(-35);
      logInfo(`rgbOf(colorRGBData=-35): actual=${actual}`);
      expect(actual).assertEqual('#b15');
      logInfo(`${BUNDLE}RgbOf_0049 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_RGB_OF_0050
     * @tc.name      ComponentCollection_RgbOf_0050
     * @tc.desc      rgbOf(colorRGBData=-93) returns "#10b0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_RgbOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RgbOf_0050 begin`);
      const actual: string = rgbOf(-93);
      logInfo(`rgbOf(colorRGBData=-93): actual=${actual}`);
      expect(actual).assertEqual('#10b0');
      logInfo(`${BUNDLE}RgbOf_0050 end`);
    });
  });
}
