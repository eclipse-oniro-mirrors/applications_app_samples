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
export default function attributeAreaOf2Test(): void {
  describe('AttributeAreaOf2Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0097
     * @tc.name      WindowManage_AttributeAreaOf_0097
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=75) returns 7500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0097 begin`);
      const actual: number = attributeAreaOf(100, 75);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(7500);
      logInfo(`${BUNDLE}AttributeAreaOf_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0098
     * @tc.name      WindowManage_AttributeAreaOf_0098
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=80) returns 8000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0098 begin`);
      const actual: number = attributeAreaOf(100, 80);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(8000);
      logInfo(`${BUNDLE}AttributeAreaOf_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0099
     * @tc.name      WindowManage_AttributeAreaOf_0099
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=85) returns 8500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0099 begin`);
      const actual: number = attributeAreaOf(100, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(8500);
      logInfo(`${BUNDLE}AttributeAreaOf_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0100
     * @tc.name      WindowManage_AttributeAreaOf_0100
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=90) returns 9000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0100 begin`);
      const actual: number = attributeAreaOf(100, 90);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(9000);
      logInfo(`${BUNDLE}AttributeAreaOf_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0101
     * @tc.name      WindowManage_AttributeAreaOf_0101
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=95) returns 9500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0101 begin`);
      const actual: number = attributeAreaOf(100, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(9500);
      logInfo(`${BUNDLE}AttributeAreaOf_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0102
     * @tc.name      WindowManage_AttributeAreaOf_0102
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=105) returns 10500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0102 begin`);
      const actual: number = attributeAreaOf(100, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(10500);
      logInfo(`${BUNDLE}AttributeAreaOf_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0103
     * @tc.name      WindowManage_AttributeAreaOf_0103
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=110) returns 11000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0103 begin`);
      const actual: number = attributeAreaOf(100, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(11000);
      logInfo(`${BUNDLE}AttributeAreaOf_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0104
     * @tc.name      WindowManage_AttributeAreaOf_0104
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=127) returns 12700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0104 begin`);
      const actual: number = attributeAreaOf(100, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(12700);
      logInfo(`${BUNDLE}AttributeAreaOf_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0105
     * @tc.name      WindowManage_AttributeAreaOf_0105
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=53) returns 5300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0105 begin`);
      const actual: number = attributeAreaOf(100, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(5300);
      logInfo(`${BUNDLE}AttributeAreaOf_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0106
     * @tc.name      WindowManage_AttributeAreaOf_0106
     * @tc.desc      attributeAreaOf(resetSizeWidth=100, resetSizeHeight=174) returns 17400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0106 begin`);
      const actual: number = attributeAreaOf(100, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=100, reset...: actual=${actual}`);
      expect(actual).assertEqual(17400);
      logInfo(`${BUNDLE}AttributeAreaOf_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0107
     * @tc.name      WindowManage_AttributeAreaOf_0107
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=3) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0107 begin`);
      const actual: number = attributeAreaOf(-1, 3);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}AttributeAreaOf_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0108
     * @tc.name      WindowManage_AttributeAreaOf_0108
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=15) returns -15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0108 begin`);
      const actual: number = attributeAreaOf(-1, 15);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-15);
      logInfo(`${BUNDLE}AttributeAreaOf_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0109
     * @tc.name      WindowManage_AttributeAreaOf_0109
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=20) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0109 begin`);
      const actual: number = attributeAreaOf(-1, 20);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}AttributeAreaOf_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0110
     * @tc.name      WindowManage_AttributeAreaOf_0110
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=25) returns -25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0110 begin`);
      const actual: number = attributeAreaOf(-1, 25);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-25);
      logInfo(`${BUNDLE}AttributeAreaOf_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0111
     * @tc.name      WindowManage_AttributeAreaOf_0111
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=30) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0111 begin`);
      const actual: number = attributeAreaOf(-1, 30);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}AttributeAreaOf_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0112
     * @tc.name      WindowManage_AttributeAreaOf_0112
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=35) returns -35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0112 begin`);
      const actual: number = attributeAreaOf(-1, 35);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-35);
      logInfo(`${BUNDLE}AttributeAreaOf_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0113
     * @tc.name      WindowManage_AttributeAreaOf_0113
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=40) returns -40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0113 begin`);
      const actual: number = attributeAreaOf(-1, 40);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-40);
      logInfo(`${BUNDLE}AttributeAreaOf_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0114
     * @tc.name      WindowManage_AttributeAreaOf_0114
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0114 begin`);
      const actual: number = attributeAreaOf(-1, 45);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}AttributeAreaOf_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0115
     * @tc.name      WindowManage_AttributeAreaOf_0115
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=50) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0115 begin`);
      const actual: number = attributeAreaOf(-1, 50);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}AttributeAreaOf_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0116
     * @tc.name      WindowManage_AttributeAreaOf_0116
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=55) returns -55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0116 begin`);
      const actual: number = attributeAreaOf(-1, 55);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-55);
      logInfo(`${BUNDLE}AttributeAreaOf_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0117
     * @tc.name      WindowManage_AttributeAreaOf_0117
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=60) returns -60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0117 begin`);
      const actual: number = attributeAreaOf(-1, 60);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-60);
      logInfo(`${BUNDLE}AttributeAreaOf_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0118
     * @tc.name      WindowManage_AttributeAreaOf_0118
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=65) returns -65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0118 begin`);
      const actual: number = attributeAreaOf(-1, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-65);
      logInfo(`${BUNDLE}AttributeAreaOf_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0119
     * @tc.name      WindowManage_AttributeAreaOf_0119
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=70) returns -70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0119 begin`);
      const actual: number = attributeAreaOf(-1, 70);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-70);
      logInfo(`${BUNDLE}AttributeAreaOf_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0120
     * @tc.name      WindowManage_AttributeAreaOf_0120
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=75) returns -75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0120 begin`);
      const actual: number = attributeAreaOf(-1, 75);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-75);
      logInfo(`${BUNDLE}AttributeAreaOf_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0121
     * @tc.name      WindowManage_AttributeAreaOf_0121
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=80) returns -80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0121 begin`);
      const actual: number = attributeAreaOf(-1, 80);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-80);
      logInfo(`${BUNDLE}AttributeAreaOf_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0122
     * @tc.name      WindowManage_AttributeAreaOf_0122
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=85) returns -85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0122 begin`);
      const actual: number = attributeAreaOf(-1, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-85);
      logInfo(`${BUNDLE}AttributeAreaOf_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0123
     * @tc.name      WindowManage_AttributeAreaOf_0123
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=90) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0123 begin`);
      const actual: number = attributeAreaOf(-1, 90);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}AttributeAreaOf_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0124
     * @tc.name      WindowManage_AttributeAreaOf_0124
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=95) returns -95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0124 begin`);
      const actual: number = attributeAreaOf(-1, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-95);
      logInfo(`${BUNDLE}AttributeAreaOf_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0125
     * @tc.name      WindowManage_AttributeAreaOf_0125
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=105) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0125 begin`);
      const actual: number = attributeAreaOf(-1, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-105);
      logInfo(`${BUNDLE}AttributeAreaOf_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0126
     * @tc.name      WindowManage_AttributeAreaOf_0126
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=110) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0126 begin`);
      const actual: number = attributeAreaOf(-1, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-110);
      logInfo(`${BUNDLE}AttributeAreaOf_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0127
     * @tc.name      WindowManage_AttributeAreaOf_0127
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=127) returns -127
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0127 begin`);
      const actual: number = attributeAreaOf(-1, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-127);
      logInfo(`${BUNDLE}AttributeAreaOf_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0128
     * @tc.name      WindowManage_AttributeAreaOf_0128
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=53) returns -53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0128 begin`);
      const actual: number = attributeAreaOf(-1, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-53);
      logInfo(`${BUNDLE}AttributeAreaOf_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0129
     * @tc.name      WindowManage_AttributeAreaOf_0129
     * @tc.desc      attributeAreaOf(resetSizeWidth=-1, resetSizeHeight=174) returns -174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_AttributeAreaOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0129 begin`);
      const actual: number = attributeAreaOf(-1, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=-1, resetS...: actual=${actual}`);
      expect(actual).assertEqual(-174);
      logInfo(`${BUNDLE}AttributeAreaOf_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0130
     * @tc.name      WindowManage_AttributeAreaOf_0130
     * @tc.desc      attributeAreaOf(resetSizeWidth=3, resetSizeHeight=3) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0130 begin`);
      const actual: number = attributeAreaOf(3, 3);
      logInfo(`attributeAreaOf(resetSizeWidth=3, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}AttributeAreaOf_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0131
     * @tc.name      WindowManage_AttributeAreaOf_0131
     * @tc.desc      attributeAreaOf(resetSizeWidth=3, resetSizeHeight=45) returns 135
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0131 begin`);
      const actual: number = attributeAreaOf(3, 45);
      logInfo(`attributeAreaOf(resetSizeWidth=3, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(135);
      logInfo(`${BUNDLE}AttributeAreaOf_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0132
     * @tc.name      WindowManage_AttributeAreaOf_0132
     * @tc.desc      attributeAreaOf(resetSizeWidth=3, resetSizeHeight=55) returns 165
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0132 begin`);
      const actual: number = attributeAreaOf(3, 55);
      logInfo(`attributeAreaOf(resetSizeWidth=3, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(165);
      logInfo(`${BUNDLE}AttributeAreaOf_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0133
     * @tc.name      WindowManage_AttributeAreaOf_0133
     * @tc.desc      attributeAreaOf(resetSizeWidth=3, resetSizeHeight=65) returns 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0133 begin`);
      const actual: number = attributeAreaOf(3, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=3, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(195);
      logInfo(`${BUNDLE}AttributeAreaOf_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0134
     * @tc.name      WindowManage_AttributeAreaOf_0134
     * @tc.desc      attributeAreaOf(resetSizeWidth=3, resetSizeHeight=80) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0134 begin`);
      const actual: number = attributeAreaOf(3, 80);
      logInfo(`attributeAreaOf(resetSizeWidth=3, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}AttributeAreaOf_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0135
     * @tc.name      WindowManage_AttributeAreaOf_0135
     * @tc.desc      attributeAreaOf(resetSizeWidth=3, resetSizeHeight=85) returns 255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0135 begin`);
      const actual: number = attributeAreaOf(3, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=3, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(255);
      logInfo(`${BUNDLE}AttributeAreaOf_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0136
     * @tc.name      WindowManage_AttributeAreaOf_0136
     * @tc.desc      attributeAreaOf(resetSizeWidth=3, resetSizeHeight=90) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0136 begin`);
      const actual: number = attributeAreaOf(3, 90);
      logInfo(`attributeAreaOf(resetSizeWidth=3, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}AttributeAreaOf_0136 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0137
     * @tc.name      WindowManage_AttributeAreaOf_0137
     * @tc.desc      attributeAreaOf(resetSizeWidth=3, resetSizeHeight=95) returns 285
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0137 begin`);
      const actual: number = attributeAreaOf(3, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=3, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(285);
      logInfo(`${BUNDLE}AttributeAreaOf_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0138
     * @tc.name      WindowManage_AttributeAreaOf_0138
     * @tc.desc      attributeAreaOf(resetSizeWidth=3, resetSizeHeight=105) returns 315
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0138 begin`);
      const actual: number = attributeAreaOf(3, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=3, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(315);
      logInfo(`${BUNDLE}AttributeAreaOf_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0139
     * @tc.name      WindowManage_AttributeAreaOf_0139
     * @tc.desc      attributeAreaOf(resetSizeWidth=3, resetSizeHeight=110) returns 330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0139 begin`);
      const actual: number = attributeAreaOf(3, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=3, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(330);
      logInfo(`${BUNDLE}AttributeAreaOf_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0140
     * @tc.name      WindowManage_AttributeAreaOf_0140
     * @tc.desc      attributeAreaOf(resetSizeWidth=3, resetSizeHeight=127) returns 381
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0140 begin`);
      const actual: number = attributeAreaOf(3, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=3, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(381);
      logInfo(`${BUNDLE}AttributeAreaOf_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0141
     * @tc.name      WindowManage_AttributeAreaOf_0141
     * @tc.desc      attributeAreaOf(resetSizeWidth=3, resetSizeHeight=53) returns 159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0141 begin`);
      const actual: number = attributeAreaOf(3, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=3, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(159);
      logInfo(`${BUNDLE}AttributeAreaOf_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0142
     * @tc.name      WindowManage_AttributeAreaOf_0142
     * @tc.desc      attributeAreaOf(resetSizeWidth=3, resetSizeHeight=174) returns 522
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0142 begin`);
      const actual: number = attributeAreaOf(3, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=3, resetSi...: actual=${actual}`);
      expect(actual).assertEqual(522);
      logInfo(`${BUNDLE}AttributeAreaOf_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0143
     * @tc.name      WindowManage_AttributeAreaOf_0143
     * @tc.desc      attributeAreaOf(resetSizeWidth=15, resetSizeHeight=45) returns 675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0143 begin`);
      const actual: number = attributeAreaOf(15, 45);
      logInfo(`attributeAreaOf(resetSizeWidth=15, resetS...: actual=${actual}`);
      expect(actual).assertEqual(675);
      logInfo(`${BUNDLE}AttributeAreaOf_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0144
     * @tc.name      WindowManage_AttributeAreaOf_0144
     * @tc.desc      attributeAreaOf(resetSizeWidth=15, resetSizeHeight=55) returns 825
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0144 begin`);
      const actual: number = attributeAreaOf(15, 55);
      logInfo(`attributeAreaOf(resetSizeWidth=15, resetS...: actual=${actual}`);
      expect(actual).assertEqual(825);
      logInfo(`${BUNDLE}AttributeAreaOf_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0145
     * @tc.name      WindowManage_AttributeAreaOf_0145
     * @tc.desc      attributeAreaOf(resetSizeWidth=15, resetSizeHeight=65) returns 975
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0145 begin`);
      const actual: number = attributeAreaOf(15, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=15, resetS...: actual=${actual}`);
      expect(actual).assertEqual(975);
      logInfo(`${BUNDLE}AttributeAreaOf_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0146
     * @tc.name      WindowManage_AttributeAreaOf_0146
     * @tc.desc      attributeAreaOf(resetSizeWidth=15, resetSizeHeight=75) returns 1125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0146 begin`);
      const actual: number = attributeAreaOf(15, 75);
      logInfo(`attributeAreaOf(resetSizeWidth=15, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1125);
      logInfo(`${BUNDLE}AttributeAreaOf_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0147
     * @tc.name      WindowManage_AttributeAreaOf_0147
     * @tc.desc      attributeAreaOf(resetSizeWidth=15, resetSizeHeight=80) returns 1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0147 begin`);
      const actual: number = attributeAreaOf(15, 80);
      logInfo(`attributeAreaOf(resetSizeWidth=15, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}AttributeAreaOf_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0148
     * @tc.name      WindowManage_AttributeAreaOf_0148
     * @tc.desc      attributeAreaOf(resetSizeWidth=15, resetSizeHeight=85) returns 1275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0148 begin`);
      const actual: number = attributeAreaOf(15, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=15, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1275);
      logInfo(`${BUNDLE}AttributeAreaOf_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0149
     * @tc.name      WindowManage_AttributeAreaOf_0149
     * @tc.desc      attributeAreaOf(resetSizeWidth=15, resetSizeHeight=90) returns 1350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0149 begin`);
      const actual: number = attributeAreaOf(15, 90);
      logInfo(`attributeAreaOf(resetSizeWidth=15, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1350);
      logInfo(`${BUNDLE}AttributeAreaOf_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0150
     * @tc.name      WindowManage_AttributeAreaOf_0150
     * @tc.desc      attributeAreaOf(resetSizeWidth=15, resetSizeHeight=95) returns 1425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0150 begin`);
      const actual: number = attributeAreaOf(15, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=15, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1425);
      logInfo(`${BUNDLE}AttributeAreaOf_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0151
     * @tc.name      WindowManage_AttributeAreaOf_0151
     * @tc.desc      attributeAreaOf(resetSizeWidth=15, resetSizeHeight=105) returns 1575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0151 begin`);
      const actual: number = attributeAreaOf(15, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=15, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1575);
      logInfo(`${BUNDLE}AttributeAreaOf_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0152
     * @tc.name      WindowManage_AttributeAreaOf_0152
     * @tc.desc      attributeAreaOf(resetSizeWidth=15, resetSizeHeight=110) returns 1650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0152 begin`);
      const actual: number = attributeAreaOf(15, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=15, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1650);
      logInfo(`${BUNDLE}AttributeAreaOf_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0153
     * @tc.name      WindowManage_AttributeAreaOf_0153
     * @tc.desc      attributeAreaOf(resetSizeWidth=15, resetSizeHeight=127) returns 1905
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0153 begin`);
      const actual: number = attributeAreaOf(15, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=15, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1905);
      logInfo(`${BUNDLE}AttributeAreaOf_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0154
     * @tc.name      WindowManage_AttributeAreaOf_0154
     * @tc.desc      attributeAreaOf(resetSizeWidth=15, resetSizeHeight=53) returns 795
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0154 begin`);
      const actual: number = attributeAreaOf(15, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=15, resetS...: actual=${actual}`);
      expect(actual).assertEqual(795);
      logInfo(`${BUNDLE}AttributeAreaOf_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0155
     * @tc.name      WindowManage_AttributeAreaOf_0155
     * @tc.desc      attributeAreaOf(resetSizeWidth=15, resetSizeHeight=174) returns 2610
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0155 begin`);
      const actual: number = attributeAreaOf(15, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=15, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2610);
      logInfo(`${BUNDLE}AttributeAreaOf_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0156
     * @tc.name      WindowManage_AttributeAreaOf_0156
     * @tc.desc      attributeAreaOf(resetSizeWidth=20, resetSizeHeight=65) returns 1300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0156 begin`);
      const actual: number = attributeAreaOf(20, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=20, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1300);
      logInfo(`${BUNDLE}AttributeAreaOf_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0157
     * @tc.name      WindowManage_AttributeAreaOf_0157
     * @tc.desc      attributeAreaOf(resetSizeWidth=20, resetSizeHeight=70) returns 1400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0157 begin`);
      const actual: number = attributeAreaOf(20, 70);
      logInfo(`attributeAreaOf(resetSizeWidth=20, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1400);
      logInfo(`${BUNDLE}AttributeAreaOf_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0158
     * @tc.name      WindowManage_AttributeAreaOf_0158
     * @tc.desc      attributeAreaOf(resetSizeWidth=20, resetSizeHeight=80) returns 1600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0158 begin`);
      const actual: number = attributeAreaOf(20, 80);
      logInfo(`attributeAreaOf(resetSizeWidth=20, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1600);
      logInfo(`${BUNDLE}AttributeAreaOf_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0159
     * @tc.name      WindowManage_AttributeAreaOf_0159
     * @tc.desc      attributeAreaOf(resetSizeWidth=20, resetSizeHeight=85) returns 1700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0159 begin`);
      const actual: number = attributeAreaOf(20, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=20, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1700);
      logInfo(`${BUNDLE}AttributeAreaOf_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0160
     * @tc.name      WindowManage_AttributeAreaOf_0160
     * @tc.desc      attributeAreaOf(resetSizeWidth=20, resetSizeHeight=90) returns 1800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0160 begin`);
      const actual: number = attributeAreaOf(20, 90);
      logInfo(`attributeAreaOf(resetSizeWidth=20, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1800);
      logInfo(`${BUNDLE}AttributeAreaOf_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0161
     * @tc.name      WindowManage_AttributeAreaOf_0161
     * @tc.desc      attributeAreaOf(resetSizeWidth=20, resetSizeHeight=95) returns 1900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0161 begin`);
      const actual: number = attributeAreaOf(20, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=20, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1900);
      logInfo(`${BUNDLE}AttributeAreaOf_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0162
     * @tc.name      WindowManage_AttributeAreaOf_0162
     * @tc.desc      attributeAreaOf(resetSizeWidth=20, resetSizeHeight=105) returns 2100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0162 begin`);
      const actual: number = attributeAreaOf(20, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=20, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2100);
      logInfo(`${BUNDLE}AttributeAreaOf_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0163
     * @tc.name      WindowManage_AttributeAreaOf_0163
     * @tc.desc      attributeAreaOf(resetSizeWidth=20, resetSizeHeight=110) returns 2200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0163 begin`);
      const actual: number = attributeAreaOf(20, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=20, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2200);
      logInfo(`${BUNDLE}AttributeAreaOf_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0164
     * @tc.name      WindowManage_AttributeAreaOf_0164
     * @tc.desc      attributeAreaOf(resetSizeWidth=20, resetSizeHeight=127) returns 2540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0164 begin`);
      const actual: number = attributeAreaOf(20, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=20, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2540);
      logInfo(`${BUNDLE}AttributeAreaOf_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0165
     * @tc.name      WindowManage_AttributeAreaOf_0165
     * @tc.desc      attributeAreaOf(resetSizeWidth=20, resetSizeHeight=53) returns 1060
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0165 begin`);
      const actual: number = attributeAreaOf(20, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=20, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1060);
      logInfo(`${BUNDLE}AttributeAreaOf_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0166
     * @tc.name      WindowManage_AttributeAreaOf_0166
     * @tc.desc      attributeAreaOf(resetSizeWidth=20, resetSizeHeight=174) returns 3480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0166 begin`);
      const actual: number = attributeAreaOf(20, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=20, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3480);
      logInfo(`${BUNDLE}AttributeAreaOf_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0167
     * @tc.name      WindowManage_AttributeAreaOf_0167
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=25) returns 625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0167 begin`);
      const actual: number = attributeAreaOf(25, 25);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(625);
      logInfo(`${BUNDLE}AttributeAreaOf_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0168
     * @tc.name      WindowManage_AttributeAreaOf_0168
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=35) returns 875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0168 begin`);
      const actual: number = attributeAreaOf(25, 35);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(875);
      logInfo(`${BUNDLE}AttributeAreaOf_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0169
     * @tc.name      WindowManage_AttributeAreaOf_0169
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=50) returns 1250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0169 begin`);
      const actual: number = attributeAreaOf(25, 50);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1250);
      logInfo(`${BUNDLE}AttributeAreaOf_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0170
     * @tc.name      WindowManage_AttributeAreaOf_0170
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=55) returns 1375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0170 begin`);
      const actual: number = attributeAreaOf(25, 55);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1375);
      logInfo(`${BUNDLE}AttributeAreaOf_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0171
     * @tc.name      WindowManage_AttributeAreaOf_0171
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=65) returns 1625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0171 begin`);
      const actual: number = attributeAreaOf(25, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1625);
      logInfo(`${BUNDLE}AttributeAreaOf_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0172
     * @tc.name      WindowManage_AttributeAreaOf_0172
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=70) returns 1750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0172 begin`);
      const actual: number = attributeAreaOf(25, 70);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1750);
      logInfo(`${BUNDLE}AttributeAreaOf_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0173
     * @tc.name      WindowManage_AttributeAreaOf_0173
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=75) returns 1875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0173 begin`);
      const actual: number = attributeAreaOf(25, 75);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1875);
      logInfo(`${BUNDLE}AttributeAreaOf_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0174
     * @tc.name      WindowManage_AttributeAreaOf_0174
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=85) returns 2125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0174 begin`);
      const actual: number = attributeAreaOf(25, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2125);
      logInfo(`${BUNDLE}AttributeAreaOf_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0175
     * @tc.name      WindowManage_AttributeAreaOf_0175
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=90) returns 2250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0175 begin`);
      const actual: number = attributeAreaOf(25, 90);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2250);
      logInfo(`${BUNDLE}AttributeAreaOf_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0176
     * @tc.name      WindowManage_AttributeAreaOf_0176
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=95) returns 2375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0176 begin`);
      const actual: number = attributeAreaOf(25, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2375);
      logInfo(`${BUNDLE}AttributeAreaOf_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0177
     * @tc.name      WindowManage_AttributeAreaOf_0177
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=105) returns 2625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0177 begin`);
      const actual: number = attributeAreaOf(25, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2625);
      logInfo(`${BUNDLE}AttributeAreaOf_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0178
     * @tc.name      WindowManage_AttributeAreaOf_0178
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=110) returns 2750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0178 begin`);
      const actual: number = attributeAreaOf(25, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2750);
      logInfo(`${BUNDLE}AttributeAreaOf_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0179
     * @tc.name      WindowManage_AttributeAreaOf_0179
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=127) returns 3175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0179 begin`);
      const actual: number = attributeAreaOf(25, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3175);
      logInfo(`${BUNDLE}AttributeAreaOf_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0180
     * @tc.name      WindowManage_AttributeAreaOf_0180
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=53) returns 1325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0180 begin`);
      const actual: number = attributeAreaOf(25, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1325);
      logInfo(`${BUNDLE}AttributeAreaOf_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0181
     * @tc.name      WindowManage_AttributeAreaOf_0181
     * @tc.desc      attributeAreaOf(resetSizeWidth=25, resetSizeHeight=174) returns 4350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0181 begin`);
      const actual: number = attributeAreaOf(25, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=25, resetS...: actual=${actual}`);
      expect(actual).assertEqual(4350);
      logInfo(`${BUNDLE}AttributeAreaOf_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0182
     * @tc.name      WindowManage_AttributeAreaOf_0182
     * @tc.desc      attributeAreaOf(resetSizeWidth=30, resetSizeHeight=65) returns 1950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0182 begin`);
      const actual: number = attributeAreaOf(30, 65);
      logInfo(`attributeAreaOf(resetSizeWidth=30, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1950);
      logInfo(`${BUNDLE}AttributeAreaOf_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0183
     * @tc.name      WindowManage_AttributeAreaOf_0183
     * @tc.desc      attributeAreaOf(resetSizeWidth=30, resetSizeHeight=80) returns 2400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0183 begin`);
      const actual: number = attributeAreaOf(30, 80);
      logInfo(`attributeAreaOf(resetSizeWidth=30, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2400);
      logInfo(`${BUNDLE}AttributeAreaOf_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0184
     * @tc.name      WindowManage_AttributeAreaOf_0184
     * @tc.desc      attributeAreaOf(resetSizeWidth=30, resetSizeHeight=85) returns 2550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0184 begin`);
      const actual: number = attributeAreaOf(30, 85);
      logInfo(`attributeAreaOf(resetSizeWidth=30, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2550);
      logInfo(`${BUNDLE}AttributeAreaOf_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0185
     * @tc.name      WindowManage_AttributeAreaOf_0185
     * @tc.desc      attributeAreaOf(resetSizeWidth=30, resetSizeHeight=90) returns 2700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0185 begin`);
      const actual: number = attributeAreaOf(30, 90);
      logInfo(`attributeAreaOf(resetSizeWidth=30, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2700);
      logInfo(`${BUNDLE}AttributeAreaOf_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0186
     * @tc.name      WindowManage_AttributeAreaOf_0186
     * @tc.desc      attributeAreaOf(resetSizeWidth=30, resetSizeHeight=95) returns 2850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0186 begin`);
      const actual: number = attributeAreaOf(30, 95);
      logInfo(`attributeAreaOf(resetSizeWidth=30, resetS...: actual=${actual}`);
      expect(actual).assertEqual(2850);
      logInfo(`${BUNDLE}AttributeAreaOf_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0187
     * @tc.name      WindowManage_AttributeAreaOf_0187
     * @tc.desc      attributeAreaOf(resetSizeWidth=30, resetSizeHeight=105) returns 3150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0187 begin`);
      const actual: number = attributeAreaOf(30, 105);
      logInfo(`attributeAreaOf(resetSizeWidth=30, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3150);
      logInfo(`${BUNDLE}AttributeAreaOf_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0188
     * @tc.name      WindowManage_AttributeAreaOf_0188
     * @tc.desc      attributeAreaOf(resetSizeWidth=30, resetSizeHeight=110) returns 3300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0188 begin`);
      const actual: number = attributeAreaOf(30, 110);
      logInfo(`attributeAreaOf(resetSizeWidth=30, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3300);
      logInfo(`${BUNDLE}AttributeAreaOf_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0189
     * @tc.name      WindowManage_AttributeAreaOf_0189
     * @tc.desc      attributeAreaOf(resetSizeWidth=30, resetSizeHeight=127) returns 3810
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0189 begin`);
      const actual: number = attributeAreaOf(30, 127);
      logInfo(`attributeAreaOf(resetSizeWidth=30, resetS...: actual=${actual}`);
      expect(actual).assertEqual(3810);
      logInfo(`${BUNDLE}AttributeAreaOf_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0190
     * @tc.name      WindowManage_AttributeAreaOf_0190
     * @tc.desc      attributeAreaOf(resetSizeWidth=30, resetSizeHeight=53) returns 1590
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0190 begin`);
      const actual: number = attributeAreaOf(30, 53);
      logInfo(`attributeAreaOf(resetSizeWidth=30, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1590);
      logInfo(`${BUNDLE}AttributeAreaOf_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0191
     * @tc.name      WindowManage_AttributeAreaOf_0191
     * @tc.desc      attributeAreaOf(resetSizeWidth=30, resetSizeHeight=174) returns 5220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0191 begin`);
      const actual: number = attributeAreaOf(30, 174);
      logInfo(`attributeAreaOf(resetSizeWidth=30, resetS...: actual=${actual}`);
      expect(actual).assertEqual(5220);
      logInfo(`${BUNDLE}AttributeAreaOf_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_ATTRIBUTE_AREA_OF_0192
     * @tc.name      WindowManage_AttributeAreaOf_0192
     * @tc.desc      attributeAreaOf(resetSizeWidth=35, resetSizeHeight=35) returns 1225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_AttributeAreaOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}AttributeAreaOf_0192 begin`);
      const actual: number = attributeAreaOf(35, 35);
      logInfo(`attributeAreaOf(resetSizeWidth=35, resetS...: actual=${actual}`);
      expect(actual).assertEqual(1225);
      logInfo(`${BUNDLE}AttributeAreaOf_0192 end`);
    });
  });
}
