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
import { cellCountOf } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for cellCountOf (96 cases). */
export default function cellCountOfTest(): void {
  describe('CellCountOfTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0001
     * @tc.name      RequestAddForm_CellCountOf_0001
     * @tc.desc      cellCountOf(dimension=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_CellCountOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0001 begin`);
      const actual: number = cellCountOf(0);
      logInfo(`cellCountOf(dimension=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0002
     * @tc.name      RequestAddForm_CellCountOf_0002
     * @tc.desc      cellCountOf(dimension=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_CellCountOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0002 begin`);
      const actual: number = cellCountOf(1);
      logInfo(`cellCountOf(dimension=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}CellCountOf_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0003
     * @tc.name      RequestAddForm_CellCountOf_0003
     * @tc.desc      cellCountOf(dimension=2) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_CellCountOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0003 begin`);
      const actual: number = cellCountOf(2);
      logInfo(`cellCountOf(dimension=2): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}CellCountOf_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0004
     * @tc.name      RequestAddForm_CellCountOf_0004
     * @tc.desc      cellCountOf(dimension=3) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0004 begin`);
      const actual: number = cellCountOf(3);
      logInfo(`cellCountOf(dimension=3): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}CellCountOf_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0005
     * @tc.name      RequestAddForm_CellCountOf_0005
     * @tc.desc      cellCountOf(dimension=4) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0005 begin`);
      const actual: number = cellCountOf(4);
      logInfo(`cellCountOf(dimension=4): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}CellCountOf_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0006
     * @tc.name      RequestAddForm_CellCountOf_0006
     * @tc.desc      cellCountOf(dimension=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_CellCountOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0006 begin`);
      const actual: number = cellCountOf(-1);
      logInfo(`cellCountOf(dimension=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0007
     * @tc.name      RequestAddForm_CellCountOf_0007
     * @tc.desc      cellCountOf(dimension=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_CellCountOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0007 begin`);
      const actual: number = cellCountOf(10);
      logInfo(`cellCountOf(dimension=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0008
     * @tc.name      RequestAddForm_CellCountOf_0008
     * @tc.desc      cellCountOf(dimension=9) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_CellCountOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0008 begin`);
      const actual: number = cellCountOf(9);
      logInfo(`cellCountOf(dimension=9): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0009
     * @tc.name      RequestAddForm_CellCountOf_0009
     * @tc.desc      cellCountOf(dimension=11) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_CellCountOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0009 begin`);
      const actual: number = cellCountOf(11);
      logInfo(`cellCountOf(dimension=11): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0010
     * @tc.name      RequestAddForm_CellCountOf_0010
     * @tc.desc      cellCountOf(dimension=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0010 begin`);
      const actual: number = cellCountOf(20);
      logInfo(`cellCountOf(dimension=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0011
     * @tc.name      RequestAddForm_CellCountOf_0011
     * @tc.desc      cellCountOf(dimension=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0011 begin`);
      const actual: number = cellCountOf(5);
      logInfo(`cellCountOf(dimension=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0012
     * @tc.name      RequestAddForm_CellCountOf_0012
     * @tc.desc      cellCountOf(dimension=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0012 begin`);
      const actual: number = cellCountOf(100);
      logInfo(`cellCountOf(dimension=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0013
     * @tc.name      RequestAddForm_CellCountOf_0013
     * @tc.desc      cellCountOf(dimension=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0013 begin`);
      const actual: number = cellCountOf(15);
      logInfo(`cellCountOf(dimension=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0014
     * @tc.name      RequestAddForm_CellCountOf_0014
     * @tc.desc      cellCountOf(dimension=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0014 begin`);
      const actual: number = cellCountOf(25);
      logInfo(`cellCountOf(dimension=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0014 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0015
     * @tc.name      RequestAddForm_CellCountOf_0015
     * @tc.desc      cellCountOf(dimension=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0015 begin`);
      const actual: number = cellCountOf(30);
      logInfo(`cellCountOf(dimension=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0015 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0016
     * @tc.name      RequestAddForm_CellCountOf_0016
     * @tc.desc      cellCountOf(dimension=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0016 begin`);
      const actual: number = cellCountOf(35);
      logInfo(`cellCountOf(dimension=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0016 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0017
     * @tc.name      RequestAddForm_CellCountOf_0017
     * @tc.desc      cellCountOf(dimension=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0017 begin`);
      const actual: number = cellCountOf(40);
      logInfo(`cellCountOf(dimension=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0017 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0018
     * @tc.name      RequestAddForm_CellCountOf_0018
     * @tc.desc      cellCountOf(dimension=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0018 begin`);
      const actual: number = cellCountOf(45);
      logInfo(`cellCountOf(dimension=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0018 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0019
     * @tc.name      RequestAddForm_CellCountOf_0019
     * @tc.desc      cellCountOf(dimension=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0019 begin`);
      const actual: number = cellCountOf(50);
      logInfo(`cellCountOf(dimension=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0019 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0020
     * @tc.name      RequestAddForm_CellCountOf_0020
     * @tc.desc      cellCountOf(dimension=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0020 begin`);
      const actual: number = cellCountOf(55);
      logInfo(`cellCountOf(dimension=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0020 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0021
     * @tc.name      RequestAddForm_CellCountOf_0021
     * @tc.desc      cellCountOf(dimension=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0021 begin`);
      const actual: number = cellCountOf(60);
      logInfo(`cellCountOf(dimension=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0021 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0022
     * @tc.name      RequestAddForm_CellCountOf_0022
     * @tc.desc      cellCountOf(dimension=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0022 begin`);
      const actual: number = cellCountOf(65);
      logInfo(`cellCountOf(dimension=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0022 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0023
     * @tc.name      RequestAddForm_CellCountOf_0023
     * @tc.desc      cellCountOf(dimension=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0023 begin`);
      const actual: number = cellCountOf(70);
      logInfo(`cellCountOf(dimension=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0023 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0024
     * @tc.name      RequestAddForm_CellCountOf_0024
     * @tc.desc      cellCountOf(dimension=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0024 begin`);
      const actual: number = cellCountOf(75);
      logInfo(`cellCountOf(dimension=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0024 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0025
     * @tc.name      RequestAddForm_CellCountOf_0025
     * @tc.desc      cellCountOf(dimension=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0025 begin`);
      const actual: number = cellCountOf(80);
      logInfo(`cellCountOf(dimension=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0025 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0026
     * @tc.name      RequestAddForm_CellCountOf_0026
     * @tc.desc      cellCountOf(dimension=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0026 begin`);
      const actual: number = cellCountOf(85);
      logInfo(`cellCountOf(dimension=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0026 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0027
     * @tc.name      RequestAddForm_CellCountOf_0027
     * @tc.desc      cellCountOf(dimension=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0027 begin`);
      const actual: number = cellCountOf(90);
      logInfo(`cellCountOf(dimension=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0027 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0028
     * @tc.name      RequestAddForm_CellCountOf_0028
     * @tc.desc      cellCountOf(dimension=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0028 begin`);
      const actual: number = cellCountOf(95);
      logInfo(`cellCountOf(dimension=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0028 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0029
     * @tc.name      RequestAddForm_CellCountOf_0029
     * @tc.desc      cellCountOf(dimension=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0029 begin`);
      const actual: number = cellCountOf(105);
      logInfo(`cellCountOf(dimension=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0029 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0030
     * @tc.name      RequestAddForm_CellCountOf_0030
     * @tc.desc      cellCountOf(dimension=110) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0030 begin`);
      const actual: number = cellCountOf(110);
      logInfo(`cellCountOf(dimension=110): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0030 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0031
     * @tc.name      RequestAddForm_CellCountOf_0031
     * @tc.desc      cellCountOf(dimension=115) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0031 begin`);
      const actual: number = cellCountOf(115);
      logInfo(`cellCountOf(dimension=115): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0031 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0032
     * @tc.name      RequestAddForm_CellCountOf_0032
     * @tc.desc      cellCountOf(dimension=120) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0032 begin`);
      const actual: number = cellCountOf(120);
      logInfo(`cellCountOf(dimension=120): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0032 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0033
     * @tc.name      RequestAddForm_CellCountOf_0033
     * @tc.desc      cellCountOf(dimension=125) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0033 begin`);
      const actual: number = cellCountOf(125);
      logInfo(`cellCountOf(dimension=125): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0033 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0034
     * @tc.name      RequestAddForm_CellCountOf_0034
     * @tc.desc      cellCountOf(dimension=130) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0034 begin`);
      const actual: number = cellCountOf(130);
      logInfo(`cellCountOf(dimension=130): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0034 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0035
     * @tc.name      RequestAddForm_CellCountOf_0035
     * @tc.desc      cellCountOf(dimension=135) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0035 begin`);
      const actual: number = cellCountOf(135);
      logInfo(`cellCountOf(dimension=135): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0035 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0036
     * @tc.name      RequestAddForm_CellCountOf_0036
     * @tc.desc      cellCountOf(dimension=140) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0036 begin`);
      const actual: number = cellCountOf(140);
      logInfo(`cellCountOf(dimension=140): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0036 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0037
     * @tc.name      RequestAddForm_CellCountOf_0037
     * @tc.desc      cellCountOf(dimension=145) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0037 begin`);
      const actual: number = cellCountOf(145);
      logInfo(`cellCountOf(dimension=145): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0037 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0038
     * @tc.name      RequestAddForm_CellCountOf_0038
     * @tc.desc      cellCountOf(dimension=150) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0038 begin`);
      const actual: number = cellCountOf(150);
      logInfo(`cellCountOf(dimension=150): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0038 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0039
     * @tc.name      RequestAddForm_CellCountOf_0039
     * @tc.desc      cellCountOf(dimension=155) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0039 begin`);
      const actual: number = cellCountOf(155);
      logInfo(`cellCountOf(dimension=155): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0039 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0040
     * @tc.name      RequestAddForm_CellCountOf_0040
     * @tc.desc      cellCountOf(dimension=160) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0040 begin`);
      const actual: number = cellCountOf(160);
      logInfo(`cellCountOf(dimension=160): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0040 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0041
     * @tc.name      RequestAddForm_CellCountOf_0041
     * @tc.desc      cellCountOf(dimension=165) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0041 begin`);
      const actual: number = cellCountOf(165);
      logInfo(`cellCountOf(dimension=165): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0041 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0042
     * @tc.name      RequestAddForm_CellCountOf_0042
     * @tc.desc      cellCountOf(dimension=170) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0042 begin`);
      const actual: number = cellCountOf(170);
      logInfo(`cellCountOf(dimension=170): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0042 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0043
     * @tc.name      RequestAddForm_CellCountOf_0043
     * @tc.desc      cellCountOf(dimension=175) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0043 begin`);
      const actual: number = cellCountOf(175);
      logInfo(`cellCountOf(dimension=175): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0043 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0044
     * @tc.name      RequestAddForm_CellCountOf_0044
     * @tc.desc      cellCountOf(dimension=180) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0044 begin`);
      const actual: number = cellCountOf(180);
      logInfo(`cellCountOf(dimension=180): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0044 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0045
     * @tc.name      RequestAddForm_CellCountOf_0045
     * @tc.desc      cellCountOf(dimension=185) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0045 begin`);
      const actual: number = cellCountOf(185);
      logInfo(`cellCountOf(dimension=185): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0045 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0046
     * @tc.name      RequestAddForm_CellCountOf_0046
     * @tc.desc      cellCountOf(dimension=190) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0046 begin`);
      const actual: number = cellCountOf(190);
      logInfo(`cellCountOf(dimension=190): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0046 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0047
     * @tc.name      RequestAddForm_CellCountOf_0047
     * @tc.desc      cellCountOf(dimension=195) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0047 begin`);
      const actual: number = cellCountOf(195);
      logInfo(`cellCountOf(dimension=195): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0047 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0048
     * @tc.name      RequestAddForm_CellCountOf_0048
     * @tc.desc      cellCountOf(dimension=200) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0048 begin`);
      const actual: number = cellCountOf(200);
      logInfo(`cellCountOf(dimension=200): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0048 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0049
     * @tc.name      RequestAddForm_CellCountOf_0049
     * @tc.desc      cellCountOf(dimension=78.77) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0049 begin`);
      const actual: number = cellCountOf(78.77);
      logInfo(`cellCountOf(dimension=78.77): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0049 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0050
     * @tc.name      RequestAddForm_CellCountOf_0050
     * @tc.desc      cellCountOf(dimension=47.09) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0050 begin`);
      const actual: number = cellCountOf(47.09);
      logInfo(`cellCountOf(dimension=47.09): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0050 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0051
     * @tc.name      RequestAddForm_CellCountOf_0051
     * @tc.desc      cellCountOf(dimension=-53) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0051 begin`);
      const actual: number = cellCountOf(-53);
      logInfo(`cellCountOf(dimension=-53): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0051 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0052
     * @tc.name      RequestAddForm_CellCountOf_0052
     * @tc.desc      cellCountOf(dimension=-11) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0052 begin`);
      const actual: number = cellCountOf(-11);
      logInfo(`cellCountOf(dimension=-11): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0052 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0053
     * @tc.name      RequestAddForm_CellCountOf_0053
     * @tc.desc      cellCountOf(dimension=92.67) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0053 begin`);
      const actual: number = cellCountOf(92.67);
      logInfo(`cellCountOf(dimension=92.67): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0053 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0054
     * @tc.name      RequestAddForm_CellCountOf_0054
     * @tc.desc      cellCountOf(dimension=86) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0054 begin`);
      const actual: number = cellCountOf(86);
      logInfo(`cellCountOf(dimension=86): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0054 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0055
     * @tc.name      RequestAddForm_CellCountOf_0055
     * @tc.desc      cellCountOf(dimension=84.89) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0055 begin`);
      const actual: number = cellCountOf(84.89);
      logInfo(`cellCountOf(dimension=84.89): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0055 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0056
     * @tc.name      RequestAddForm_CellCountOf_0056
     * @tc.desc      cellCountOf(dimension=4.63) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0056 begin`);
      const actual: number = cellCountOf(4.63);
      logInfo(`cellCountOf(dimension=4.63): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0056 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0057
     * @tc.name      RequestAddForm_CellCountOf_0057
     * @tc.desc      cellCountOf(dimension=88) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0057 begin`);
      const actual: number = cellCountOf(88);
      logInfo(`cellCountOf(dimension=88): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0057 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0058
     * @tc.name      RequestAddForm_CellCountOf_0058
     * @tc.desc      cellCountOf(dimension=83) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0058 begin`);
      const actual: number = cellCountOf(83);
      logInfo(`cellCountOf(dimension=83): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0058 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0059
     * @tc.name      RequestAddForm_CellCountOf_0059
     * @tc.desc      cellCountOf(dimension=-6) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0059 begin`);
      const actual: number = cellCountOf(-6);
      logInfo(`cellCountOf(dimension=-6): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0059 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0060
     * @tc.name      RequestAddForm_CellCountOf_0060
     * @tc.desc      cellCountOf(dimension=38.92) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0060 begin`);
      const actual: number = cellCountOf(38.92);
      logInfo(`cellCountOf(dimension=38.92): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0060 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0061
     * @tc.name      RequestAddForm_CellCountOf_0061
     * @tc.desc      cellCountOf(dimension=131) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0061 begin`);
      const actual: number = cellCountOf(131);
      logInfo(`cellCountOf(dimension=131): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0061 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0062
     * @tc.name      RequestAddForm_CellCountOf_0062
     * @tc.desc      cellCountOf(dimension=-21) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0062 begin`);
      const actual: number = cellCountOf(-21);
      logInfo(`cellCountOf(dimension=-21): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0062 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0063
     * @tc.name      RequestAddForm_CellCountOf_0063
     * @tc.desc      cellCountOf(dimension=81) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0063 begin`);
      const actual: number = cellCountOf(81);
      logInfo(`cellCountOf(dimension=81): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0063 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0064
     * @tc.name      RequestAddForm_CellCountOf_0064
     * @tc.desc      cellCountOf(dimension=-39) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0064 begin`);
      const actual: number = cellCountOf(-39);
      logInfo(`cellCountOf(dimension=-39): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0064 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0065
     * @tc.name      RequestAddForm_CellCountOf_0065
     * @tc.desc      cellCountOf(dimension=53) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0065 begin`);
      const actual: number = cellCountOf(53);
      logInfo(`cellCountOf(dimension=53): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0065 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0066
     * @tc.name      RequestAddForm_CellCountOf_0066
     * @tc.desc      cellCountOf(dimension=73) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0066 begin`);
      const actual: number = cellCountOf(73);
      logInfo(`cellCountOf(dimension=73): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0066 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0067
     * @tc.name      RequestAddForm_CellCountOf_0067
     * @tc.desc      cellCountOf(dimension=109) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0067 begin`);
      const actual: number = cellCountOf(109);
      logInfo(`cellCountOf(dimension=109): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0067 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0068
     * @tc.name      RequestAddForm_CellCountOf_0068
     * @tc.desc      cellCountOf(dimension=-91) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0068 begin`);
      const actual: number = cellCountOf(-91);
      logInfo(`cellCountOf(dimension=-91): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0068 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0069
     * @tc.name      RequestAddForm_CellCountOf_0069
     * @tc.desc      cellCountOf(dimension=-17) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0069 begin`);
      const actual: number = cellCountOf(-17);
      logInfo(`cellCountOf(dimension=-17): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0069 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0070
     * @tc.name      RequestAddForm_CellCountOf_0070
     * @tc.desc      cellCountOf(dimension=96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0070 begin`);
      const actual: number = cellCountOf(96);
      logInfo(`cellCountOf(dimension=96): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0070 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0071
     * @tc.name      RequestAddForm_CellCountOf_0071
     * @tc.desc      cellCountOf(dimension=75.07) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0071 begin`);
      const actual: number = cellCountOf(75.07);
      logInfo(`cellCountOf(dimension=75.07): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0071 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0072
     * @tc.name      RequestAddForm_CellCountOf_0072
     * @tc.desc      cellCountOf(dimension=-36) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0072 begin`);
      const actual: number = cellCountOf(-36);
      logInfo(`cellCountOf(dimension=-36): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0072 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0073
     * @tc.name      RequestAddForm_CellCountOf_0073
     * @tc.desc      cellCountOf(dimension=71.78) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0073 begin`);
      const actual: number = cellCountOf(71.78);
      logInfo(`cellCountOf(dimension=71.78): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0073 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0074
     * @tc.name      RequestAddForm_CellCountOf_0074
     * @tc.desc      cellCountOf(dimension=31) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0074 begin`);
      const actual: number = cellCountOf(31);
      logInfo(`cellCountOf(dimension=31): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0074 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0075
     * @tc.name      RequestAddForm_CellCountOf_0075
     * @tc.desc      cellCountOf(dimension=108) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0075 begin`);
      const actual: number = cellCountOf(108);
      logInfo(`cellCountOf(dimension=108): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0075 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0076
     * @tc.name      RequestAddForm_CellCountOf_0076
     * @tc.desc      cellCountOf(dimension=197) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0076 begin`);
      const actual: number = cellCountOf(197);
      logInfo(`cellCountOf(dimension=197): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0076 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0077
     * @tc.name      RequestAddForm_CellCountOf_0077
     * @tc.desc      cellCountOf(dimension=67.78) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0077 begin`);
      const actual: number = cellCountOf(67.78);
      logInfo(`cellCountOf(dimension=67.78): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0077 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0078
     * @tc.name      RequestAddForm_CellCountOf_0078
     * @tc.desc      cellCountOf(dimension=-25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0078 begin`);
      const actual: number = cellCountOf(-25);
      logInfo(`cellCountOf(dimension=-25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0078 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0079
     * @tc.name      RequestAddForm_CellCountOf_0079
     * @tc.desc      cellCountOf(dimension=68.4) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0079 begin`);
      const actual: number = cellCountOf(68.4);
      logInfo(`cellCountOf(dimension=68.4): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0079 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0080
     * @tc.name      RequestAddForm_CellCountOf_0080
     * @tc.desc      cellCountOf(dimension=89.01) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0080 begin`);
      const actual: number = cellCountOf(89.01);
      logInfo(`cellCountOf(dimension=89.01): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0080 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0081
     * @tc.name      RequestAddForm_CellCountOf_0081
     * @tc.desc      cellCountOf(dimension=33.6) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0081 begin`);
      const actual: number = cellCountOf(33.6);
      logInfo(`cellCountOf(dimension=33.6): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0081 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0082
     * @tc.name      RequestAddForm_CellCountOf_0082
     * @tc.desc      cellCountOf(dimension=-44) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0082 begin`);
      const actual: number = cellCountOf(-44);
      logInfo(`cellCountOf(dimension=-44): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0082 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0083
     * @tc.name      RequestAddForm_CellCountOf_0083
     * @tc.desc      cellCountOf(dimension=146) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0083 begin`);
      const actual: number = cellCountOf(146);
      logInfo(`cellCountOf(dimension=146): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0083 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0084
     * @tc.name      RequestAddForm_CellCountOf_0084
     * @tc.desc      cellCountOf(dimension=50.64) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0084 begin`);
      const actual: number = cellCountOf(50.64);
      logInfo(`cellCountOf(dimension=50.64): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0084 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0085
     * @tc.name      RequestAddForm_CellCountOf_0085
     * @tc.desc      cellCountOf(dimension=-16) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0085 begin`);
      const actual: number = cellCountOf(-16);
      logInfo(`cellCountOf(dimension=-16): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0085 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0086
     * @tc.name      RequestAddForm_CellCountOf_0086
     * @tc.desc      cellCountOf(dimension=79.03) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0086 begin`);
      const actual: number = cellCountOf(79.03);
      logInfo(`cellCountOf(dimension=79.03): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0086 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0087
     * @tc.name      RequestAddForm_CellCountOf_0087
     * @tc.desc      cellCountOf(dimension=62.61) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0087 begin`);
      const actual: number = cellCountOf(62.61);
      logInfo(`cellCountOf(dimension=62.61): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0087 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0088
     * @tc.name      RequestAddForm_CellCountOf_0088
     * @tc.desc      cellCountOf(dimension=12) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0088 begin`);
      const actual: number = cellCountOf(12);
      logInfo(`cellCountOf(dimension=12): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0088 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0089
     * @tc.name      RequestAddForm_CellCountOf_0089
     * @tc.desc      cellCountOf(dimension=157) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0089 begin`);
      const actual: number = cellCountOf(157);
      logInfo(`cellCountOf(dimension=157): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0089 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0090
     * @tc.name      RequestAddForm_CellCountOf_0090
     * @tc.desc      cellCountOf(dimension=152) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0090 begin`);
      const actual: number = cellCountOf(152);
      logInfo(`cellCountOf(dimension=152): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0090 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0091
     * @tc.name      RequestAddForm_CellCountOf_0091
     * @tc.desc      cellCountOf(dimension=-47) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0091 begin`);
      const actual: number = cellCountOf(-47);
      logInfo(`cellCountOf(dimension=-47): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0091 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0092
     * @tc.name      RequestAddForm_CellCountOf_0092
     * @tc.desc      cellCountOf(dimension=199) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0092 begin`);
      const actual: number = cellCountOf(199);
      logInfo(`cellCountOf(dimension=199): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0092 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0093
     * @tc.name      RequestAddForm_CellCountOf_0093
     * @tc.desc      cellCountOf(dimension=-75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_CellCountOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0093 begin`);
      const actual: number = cellCountOf(-75);
      logInfo(`cellCountOf(dimension=-75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0093 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0094
     * @tc.name      RequestAddForm_CellCountOf_0094
     * @tc.desc      cellCountOf(dimension=23.64) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0094 begin`);
      const actual: number = cellCountOf(23.64);
      logInfo(`cellCountOf(dimension=23.64): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0094 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0095
     * @tc.name      RequestAddForm_CellCountOf_0095
     * @tc.desc      cellCountOf(dimension=138) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0095 begin`);
      const actual: number = cellCountOf(138);
      logInfo(`cellCountOf(dimension=138): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0095 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_CELL_COUNT_OF_0096
     * @tc.name      RequestAddForm_CellCountOf_0096
     * @tc.desc      cellCountOf(dimension=51) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_CellCountOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}CellCountOf_0096 begin`);
      const actual: number = cellCountOf(51);
      logInfo(`cellCountOf(dimension=51): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}CellCountOf_0096 end`);
    });
  });
}
