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

/** Logic checks for attributeAreaOf (96 cases). */
export default function attributeAreaOfTest(): void {
  describe('AttributeAreaOfTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0001
     * @tc.name      WindowManage_AttributeAreaOf_0001
     * @tc.desc      attributeAreaOf(resetSizeWidth=0, resetSizeHeight=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_AttributeAreaOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0001 begin`);
      const actual: number = attributeAreaOf(0, 0);
      logInfo(`attributeAreaOf(resetSizeWidth=0, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}AttributeAreaOf_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0002
     * @tc.name      WindowManage_AttributeAreaOf_0002
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_AttributeAreaOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0002 begin`);
      const actual: number = attributeAreaOf(1, 1);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}AttributeAreaOf_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0003
     * @tc.name      WindowManage_AttributeAreaOf_0003
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0003 begin`);
      const actual: number = attributeAreaOf(1, 2);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}AttributeAreaOf_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0004
     * @tc.name      WindowManage_AttributeAreaOf_0004
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0004 begin`);
      const actual: number = attributeAreaOf(1, 5);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}AttributeAreaOf_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0005
     * @tc.name      WindowManage_AttributeAreaOf_0005
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0005 begin`);
      const actual: number = attributeAreaOf(1, 10);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}AttributeAreaOf_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0006
     * @tc.name      WindowManage_AttributeAreaOf_0006
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0006 begin`);
      const actual: number = attributeAreaOf(1, 100);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}AttributeAreaOf_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0007
     * @tc.name      WindowManage_AttributeAreaOf_0007
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0007 begin`);
      const actual: number = attributeAreaOf(1, -1);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}AttributeAreaOf_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0008
     * @tc.name      WindowManage_AttributeAreaOf_0008
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0008 begin`);
      const actual: number = attributeAreaOf(1, 3);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}AttributeAreaOf_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0009
     * @tc.name      WindowManage_AttributeAreaOf_0009
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0009 begin`);
      const actual: number = attributeAreaOf(1, 15);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}AttributeAreaOf_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0010
     * @tc.name      WindowManage_AttributeAreaOf_0010
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0010 begin`);
      const actual: number = attributeAreaOf(1, 20);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}AttributeAreaOf_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0011
     * @tc.name      WindowManage_AttributeAreaOf_0011
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0011 begin`);
      const actual: number = attributeAreaOf(1, 25);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}AttributeAreaOf_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0012
     * @tc.name      WindowManage_AttributeAreaOf_0012
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0012 begin`);
      const actual: number = attributeAreaOf(1, 30);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}AttributeAreaOf_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0013
     * @tc.name      WindowManage_AttributeAreaOf_0013
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0013 begin`);
      const actual: number = attributeAreaOf(1, 35);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}AttributeAreaOf_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0014
     * @tc.name      WindowManage_AttributeAreaOf_0014
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0014 begin`);
      const actual: number = attributeAreaOf(1, 40);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}AttributeAreaOf_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0015
     * @tc.name      WindowManage_AttributeAreaOf_0015
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0015 begin`);
      const actual: number = attributeAreaOf(1, 45);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}AttributeAreaOf_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0016
     * @tc.name      WindowManage_AttributeAreaOf_0016
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0016 begin`);
      const actual: number = attributeAreaOf(1, 50);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}AttributeAreaOf_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0017
     * @tc.name      WindowManage_AttributeAreaOf_0017
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0017 begin`);
      const actual: number = attributeAreaOf(1, 55);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}AttributeAreaOf_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0018
     * @tc.name      WindowManage_AttributeAreaOf_0018
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0018 begin`);
      const actual: number = attributeAreaOf(1, 60);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}AttributeAreaOf_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0019
     * @tc.name      WindowManage_AttributeAreaOf_0019
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0019 begin`);
      const actual: number = attributeAreaOf(1, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}AttributeAreaOf_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0020
     * @tc.name      WindowManage_AttributeAreaOf_0020
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0020 begin`);
      const actual: number = attributeAreaOf(1, 70);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}AttributeAreaOf_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0021
     * @tc.name      WindowManage_AttributeAreaOf_0021
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0021 begin`);
      const actual: number = attributeAreaOf(1, 75);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}AttributeAreaOf_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0022
     * @tc.name      WindowManage_AttributeAreaOf_0022
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0022 begin`);
      const actual: number = attributeAreaOf(1, 80);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}AttributeAreaOf_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0023
     * @tc.name      WindowManage_AttributeAreaOf_0023
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0023 begin`);
      const actual: number = attributeAreaOf(1, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}AttributeAreaOf_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0024
     * @tc.name      WindowManage_AttributeAreaOf_0024
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0024 begin`);
      const actual: number = attributeAreaOf(1, 90);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}AttributeAreaOf_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0025
     * @tc.name      WindowManage_AttributeAreaOf_0025
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0025 begin`);
      const actual: number = attributeAreaOf(1, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}AttributeAreaOf_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0026
     * @tc.name      WindowManage_AttributeAreaOf_0026
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0026 begin`);
      const actual: number = attributeAreaOf(1, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}AttributeAreaOf_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0027
     * @tc.name      WindowManage_AttributeAreaOf_0027
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=110) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0027 begin`);
      const actual: number = attributeAreaOf(1, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}AttributeAreaOf_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0028
     * @tc.name      WindowManage_AttributeAreaOf_0028
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=127) returns 127
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0028 begin`);
      const actual: number = attributeAreaOf(1, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(127);
      logInfo(`${BUNDLE}AttributeAreaOf_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0029
     * @tc.name      WindowManage_AttributeAreaOf_0029
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=53) returns 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0029 begin`);
      const actual: number = attributeAreaOf(1, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(53);
      logInfo(`${BUNDLE}AttributeAreaOf_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0030
     * @tc.name      WindowManage_AttributeAreaOf_0030
     * @tc.desc      attributeAreaOf(resetSizeWidth=1, resetSizeHeight=174) returns 174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0030 begin`);
      const actual: number = attributeAreaOf(1, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=1, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(174);
      logInfo(`${BUNDLE}AttributeAreaOf_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0031
     * @tc.name      WindowManage_AttributeAreaOf_0031
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=2) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0031 begin`);
      const actual: number = attributeAreaOf(2, 2);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}AttributeAreaOf_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0032
     * @tc.name      WindowManage_AttributeAreaOf_0032
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=100) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0032 begin`);
      const actual: number = attributeAreaOf(2, 100);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}AttributeAreaOf_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0033
     * @tc.name      WindowManage_AttributeAreaOf_0033
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=-1) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0033 begin`);
      const actual: number = attributeAreaOf(2, -1);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}AttributeAreaOf_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0034
     * @tc.name      WindowManage_AttributeAreaOf_0034
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=3) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0034 begin`);
      const actual: number = attributeAreaOf(2, 3);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}AttributeAreaOf_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0035
     * @tc.name      WindowManage_AttributeAreaOf_0035
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=60) returns 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0035 begin`);
      const actual: number = attributeAreaOf(2, 60);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}AttributeAreaOf_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0036
     * @tc.name      WindowManage_AttributeAreaOf_0036
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=65) returns 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0036 begin`);
      const actual: number = attributeAreaOf(2, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}AttributeAreaOf_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0037
     * @tc.name      WindowManage_AttributeAreaOf_0037
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=70) returns 140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0037 begin`);
      const actual: number = attributeAreaOf(2, 70);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(140);
      logInfo(`${BUNDLE}AttributeAreaOf_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0038
     * @tc.name      WindowManage_AttributeAreaOf_0038
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=75) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0038 begin`);
      const actual: number = attributeAreaOf(2, 75);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}AttributeAreaOf_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0039
     * @tc.name      WindowManage_AttributeAreaOf_0039
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=80) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0039 begin`);
      const actual: number = attributeAreaOf(2, 80);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}AttributeAreaOf_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0040
     * @tc.name      WindowManage_AttributeAreaOf_0040
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=85) returns 170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0040 begin`);
      const actual: number = attributeAreaOf(2, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(170);
      logInfo(`${BUNDLE}AttributeAreaOf_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0041
     * @tc.name      WindowManage_AttributeAreaOf_0041
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=90) returns 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0041 begin`);
      const actual: number = attributeAreaOf(2, 90);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}AttributeAreaOf_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0042
     * @tc.name      WindowManage_AttributeAreaOf_0042
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=95) returns 190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0042 begin`);
      const actual: number = attributeAreaOf(2, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(190);
      logInfo(`${BUNDLE}AttributeAreaOf_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0043
     * @tc.name      WindowManage_AttributeAreaOf_0043
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=105) returns 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0043 begin`);
      const actual: number = attributeAreaOf(2, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(210);
      logInfo(`${BUNDLE}AttributeAreaOf_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0044
     * @tc.name      WindowManage_AttributeAreaOf_0044
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=110) returns 220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0044 begin`);
      const actual: number = attributeAreaOf(2, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(220);
      logInfo(`${BUNDLE}AttributeAreaOf_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0045
     * @tc.name      WindowManage_AttributeAreaOf_0045
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=127) returns 254
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0045 begin`);
      const actual: number = attributeAreaOf(2, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(254);
      logInfo(`${BUNDLE}AttributeAreaOf_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0046
     * @tc.name      WindowManage_AttributeAreaOf_0046
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=53) returns 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0046 begin`);
      const actual: number = attributeAreaOf(2, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(106);
      logInfo(`${BUNDLE}AttributeAreaOf_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0047
     * @tc.name      WindowManage_AttributeAreaOf_0047
     * @tc.desc      attributeAreaOf(resetSizeWidth=2, resetSizeHeight=174) returns 348
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0047 begin`);
      const actual: number = attributeAreaOf(2, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=2, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(348);
      logInfo(`${BUNDLE}AttributeAreaOf_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0048
     * @tc.name      WindowManage_AttributeAreaOf_0048
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=100) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0048 begin`);
      const actual: number = attributeAreaOf(5, 100);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}AttributeAreaOf_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0049
     * @tc.name      WindowManage_AttributeAreaOf_0049
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=-1) returns -5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0049 begin`);
      const actual: number = attributeAreaOf(5, -1);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}AttributeAreaOf_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0050
     * @tc.name      WindowManage_AttributeAreaOf_0050
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=25) returns 125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0050 begin`);
      const actual: number = attributeAreaOf(5, 25);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}AttributeAreaOf_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0051
     * @tc.name      WindowManage_AttributeAreaOf_0051
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=35) returns 175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0051 begin`);
      const actual: number = attributeAreaOf(5, 35);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(175);
      logInfo(`${BUNDLE}AttributeAreaOf_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0052
     * @tc.name      WindowManage_AttributeAreaOf_0052
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=45) returns 225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0052 begin`);
      const actual: number = attributeAreaOf(5, 45);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(225);
      logInfo(`${BUNDLE}AttributeAreaOf_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0053
     * @tc.name      WindowManage_AttributeAreaOf_0053
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=50) returns 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0053 begin`);
      const actual: number = attributeAreaOf(5, 50);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(250);
      logInfo(`${BUNDLE}AttributeAreaOf_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0054
     * @tc.name      WindowManage_AttributeAreaOf_0054
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=55) returns 275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0054 begin`);
      const actual: number = attributeAreaOf(5, 55);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(275);
      logInfo(`${BUNDLE}AttributeAreaOf_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0055
     * @tc.name      WindowManage_AttributeAreaOf_0055
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=60) returns 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0055 begin`);
      const actual: number = attributeAreaOf(5, 60);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}AttributeAreaOf_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0056
     * @tc.name      WindowManage_AttributeAreaOf_0056
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=65) returns 325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0056 begin`);
      const actual: number = attributeAreaOf(5, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(325);
      logInfo(`${BUNDLE}AttributeAreaOf_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0057
     * @tc.name      WindowManage_AttributeAreaOf_0057
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=70) returns 350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0057 begin`);
      const actual: number = attributeAreaOf(5, 70);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(350);
      logInfo(`${BUNDLE}AttributeAreaOf_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0058
     * @tc.name      WindowManage_AttributeAreaOf_0058
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=75) returns 375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0058 begin`);
      const actual: number = attributeAreaOf(5, 75);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(375);
      logInfo(`${BUNDLE}AttributeAreaOf_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0059
     * @tc.name      WindowManage_AttributeAreaOf_0059
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=80) returns 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0059 begin`);
      const actual: number = attributeAreaOf(5, 80);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}AttributeAreaOf_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0060
     * @tc.name      WindowManage_AttributeAreaOf_0060
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=85) returns 425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0060 begin`);
      const actual: number = attributeAreaOf(5, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(425);
      logInfo(`${BUNDLE}AttributeAreaOf_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0061
     * @tc.name      WindowManage_AttributeAreaOf_0061
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=90) returns 450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0061 begin`);
      const actual: number = attributeAreaOf(5, 90);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(450);
      logInfo(`${BUNDLE}AttributeAreaOf_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0062
     * @tc.name      WindowManage_AttributeAreaOf_0062
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=95) returns 475
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0062 begin`);
      const actual: number = attributeAreaOf(5, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(475);
      logInfo(`${BUNDLE}AttributeAreaOf_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0063
     * @tc.name      WindowManage_AttributeAreaOf_0063
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=105) returns 525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0063 begin`);
      const actual: number = attributeAreaOf(5, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(525);
      logInfo(`${BUNDLE}AttributeAreaOf_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0064
     * @tc.name      WindowManage_AttributeAreaOf_0064
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=110) returns 550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0064 begin`);
      const actual: number = attributeAreaOf(5, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(550);
      logInfo(`${BUNDLE}AttributeAreaOf_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0065
     * @tc.name      WindowManage_AttributeAreaOf_0065
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=127) returns 635
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0065 begin`);
      const actual: number = attributeAreaOf(5, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(635);
      logInfo(`${BUNDLE}AttributeAreaOf_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0066
     * @tc.name      WindowManage_AttributeAreaOf_0066
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=53) returns 265
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0066 begin`);
      const actual: number = attributeAreaOf(5, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(265);
      logInfo(`${BUNDLE}AttributeAreaOf_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0067
     * @tc.name      WindowManage_AttributeAreaOf_0067
     * @tc.desc      attributeAreaOf(resetSizeWidth=5, resetSizeHeight=174) returns 870
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0067 begin`);
      const actual: number = attributeAreaOf(5, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=5, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(870);
      logInfo(`${BUNDLE}AttributeAreaOf_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0068
     * @tc.name      WindowManage_AttributeAreaOf_0068
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=100) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0068 begin`);
      const actual: number = attributeAreaOf(10, 100);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}AttributeAreaOf_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0069
     * @tc.name      WindowManage_AttributeAreaOf_0069
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=-1) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0069 begin`);
      const actual: number = attributeAreaOf(10, -1);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}AttributeAreaOf_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0070
     * @tc.name      WindowManage_AttributeAreaOf_0070
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=60) returns 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0070 begin`);
      const actual: number = attributeAreaOf(10, 60);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(600);
      logInfo(`${BUNDLE}AttributeAreaOf_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0071
     * @tc.name      WindowManage_AttributeAreaOf_0071
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=65) returns 650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0071 begin`);
      const actual: number = attributeAreaOf(10, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(650);
      logInfo(`${BUNDLE}AttributeAreaOf_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0072
     * @tc.name      WindowManage_AttributeAreaOf_0072
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=70) returns 700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0072 begin`);
      const actual: number = attributeAreaOf(10, 70);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(700);
      logInfo(`${BUNDLE}AttributeAreaOf_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0073
     * @tc.name      WindowManage_AttributeAreaOf_0073
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=75) returns 750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0073 begin`);
      const actual: number = attributeAreaOf(10, 75);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(750);
      logInfo(`${BUNDLE}AttributeAreaOf_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0074
     * @tc.name      WindowManage_AttributeAreaOf_0074
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=80) returns 800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0074 begin`);
      const actual: number = attributeAreaOf(10, 80);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(800);
      logInfo(`${BUNDLE}AttributeAreaOf_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0075
     * @tc.name      WindowManage_AttributeAreaOf_0075
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=85) returns 850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0075 begin`);
      const actual: number = attributeAreaOf(10, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(850);
      logInfo(`${BUNDLE}AttributeAreaOf_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0076
     * @tc.name      WindowManage_AttributeAreaOf_0076
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=90) returns 900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0076 begin`);
      const actual: number = attributeAreaOf(10, 90);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(900);
      logInfo(`${BUNDLE}AttributeAreaOf_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0077
     * @tc.name      WindowManage_AttributeAreaOf_0077
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=95) returns 950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0077 begin`);
      const actual: number = attributeAreaOf(10, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(950);
      logInfo(`${BUNDLE}AttributeAreaOf_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0078
     * @tc.name      WindowManage_AttributeAreaOf_0078
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=105) returns 1050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0078 begin`);
      const actual: number = attributeAreaOf(10, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1050);
      logInfo(`${BUNDLE}AttributeAreaOf_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0079
     * @tc.name      WindowManage_AttributeAreaOf_0079
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=110) returns 1100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0079 begin`);
      const actual: number = attributeAreaOf(10, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1100);
      logInfo(`${BUNDLE}AttributeAreaOf_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0080
     * @tc.name      WindowManage_AttributeAreaOf_0080
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=127) returns 1270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0080 begin`);
      const actual: number = attributeAreaOf(10, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1270);
      logInfo(`${BUNDLE}AttributeAreaOf_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0081
     * @tc.name      WindowManage_AttributeAreaOf_0081
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=53) returns 530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0081 begin`);
      const actual: number = attributeAreaOf(10, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(530);
      logInfo(`${BUNDLE}AttributeAreaOf_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0082
     * @tc.name      WindowManage_AttributeAreaOf_0082
     * @tc.desc      attributeAreaOf(resetSizeWidth=10, resetSizeHeight=174) returns 1740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0082 begin`);
      const actual: number = attributeAreaOf(10, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=10, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1740);
      logInfo(`${BUNDLE}AttributeAreaOf_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0083
     * @tc.name      WindowManage_AttributeAreaOf_0083
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=100) returns 10000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0083 begin`);
      const actual: number = attributeAreaOf(100, 100);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(10000);
      logInfo(`${BUNDLE}AttributeAreaOf_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0084
     * @tc.name      WindowManage_AttributeAreaOf_0084
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=-1) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0084 begin`);
      const actual: number = attributeAreaOf(100, -1);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}AttributeAreaOf_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0085
     * @tc.name      WindowManage_AttributeAreaOf_0085
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=15) returns 1500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0085 begin`);
      const actual: number = attributeAreaOf(100, 15);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(1500);
      logInfo(`${BUNDLE}AttributeAreaOf_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0086
     * @tc.name      WindowManage_AttributeAreaOf_0086
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=20) returns 2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0086 begin`);
      const actual: number = attributeAreaOf(100, 20);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(2000);
      logInfo(`${BUNDLE}AttributeAreaOf_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0087
     * @tc.name      WindowManage_AttributeAreaOf_0087
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=25) returns 2500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0087 begin`);
      const actual: number = attributeAreaOf(100, 25);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(2500);
      logInfo(`${BUNDLE}AttributeAreaOf_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0088
     * @tc.name      WindowManage_AttributeAreaOf_0088
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=30) returns 3000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0088 begin`);
      const actual: number = attributeAreaOf(100, 30);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(3000);
      logInfo(`${BUNDLE}AttributeAreaOf_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0089
     * @tc.name      WindowManage_AttributeAreaOf_0089
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=35) returns 3500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0089 begin`);
      const actual: number = attributeAreaOf(100, 35);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(3500);
      logInfo(`${BUNDLE}AttributeAreaOf_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0090
     * @tc.name      WindowManage_AttributeAreaOf_0090
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=40) returns 4000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0090 begin`);
      const actual: number = attributeAreaOf(100, 40);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(4000);
      logInfo(`${BUNDLE}AttributeAreaOf_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0091
     * @tc.name      WindowManage_AttributeAreaOf_0091
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=45) returns 4500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0091 begin`);
      const actual: number = attributeAreaOf(100, 45);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(4500);
      logInfo(`${BUNDLE}AttributeAreaOf_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0092
     * @tc.name      WindowManage_AttributeAreaOf_0092
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=50) returns 5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0092 begin`);
      const actual: number = attributeAreaOf(100, 50);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(5000);
      logInfo(`${BUNDLE}AttributeAreaOf_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0093
     * @tc.name      WindowManage_AttributeAreaOf_0093
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=55) returns 5500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0093 begin`);
      const actual: number = attributeAreaOf(100, 55);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(5500);
      logInfo(`${BUNDLE}AttributeAreaOf_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0094
     * @tc.name      WindowManage_AttributeAreaOf_0094
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=60) returns 6000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0094 begin`);
      const actual: number = attributeAreaOf(100, 60);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(6000);
      logInfo(`${BUNDLE}AttributeAreaOf_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0095
     * @tc.name      WindowManage_AttributeAreaOf_0095
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=65) returns 6500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0095 begin`);
      const actual: number = attributeAreaOf(100, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(6500);
      logInfo(`${BUNDLE}AttributeAreaOf_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0096
     * @tc.name      WindowManage_AttributeAreaOf_0096
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=70) returns 7000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0096 begin`);
      const actual: number = attributeAreaOf(100, 70);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(7000);
      logInfo(`${BUNDLE}AttributeAreaOf_0096 end`);
    });
  });
}
