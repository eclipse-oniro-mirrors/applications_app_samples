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
import { logInfo, BUNDLE } from '../common/PerfTestSupport';
import {
  calculateNum,
  calculateSteps,
  utilsNumAfter,
  resetNum,
} from '../model/PerfTestLogic';

/** UtilsBoundaryMatrixTest logic checks (400 cases). */
export default function utilsBoundaryMatrixTest(): void {
  describe('UtilsBoundaryMatrixTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0001
     * @tc.name      Perf_UtilsMatrix_0001
     * @tc.desc      utils matrix -50,0,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0001 begin`);
      logInfo("utils matrix -50,0,1");
      const actual: string = calculateNum(-50, 0) + '|' + calculateSteps(0, 1) + '|' + utilsNumAfter(1, 0) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "-50|0|0|0");
      expect(actual).assertEqual("-50|0|0|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0002
     * @tc.name      Perf_UtilsMatrix_0002
     * @tc.desc      utils matrix -49,37,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0002 begin`);
      logInfo("utils matrix -49,37,2");
      const actual: string = calculateNum(-49, 37) + '|' + calculateSteps(37, 2) + '|' + utilsNumAfter(2, 37) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "-12|74|74|0");
      expect(actual).assertEqual("-12|74|74|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0003
     * @tc.name      Perf_UtilsMatrix_0003
     * @tc.desc      utils matrix -48,74,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0003 begin`);
      logInfo("utils matrix -48,74,3");
      const actual: string = calculateNum(-48, 74) + '|' + calculateSteps(74, 3) + '|' + utilsNumAfter(3, 74) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "26|222|222|0");
      expect(actual).assertEqual("26|222|222|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0004
     * @tc.name      Perf_UtilsMatrix_0004
     * @tc.desc      utils matrix -47,111,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0004 begin`);
      logInfo("utils matrix -47,111,4");
      const actual: string = calculateNum(-47, 111) + '|' + calculateSteps(111, 4) + '|' + utilsNumAfter(4, 111) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "64|444|444|0");
      expect(actual).assertEqual("64|444|444|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0005
     * @tc.name      Perf_UtilsMatrix_0005
     * @tc.desc      utils matrix -46,148,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0005 begin`);
      logInfo("utils matrix -46,148,5");
      const actual: string = calculateNum(-46, 148) + '|' + calculateSteps(148, 5) + '|' + utilsNumAfter(5, 148) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "102|740|740|0");
      expect(actual).assertEqual("102|740|740|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0006
     * @tc.name      Perf_UtilsMatrix_0006
     * @tc.desc      utils matrix -45,185,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0006 begin`);
      logInfo("utils matrix -45,185,6");
      const actual: string = calculateNum(-45, 185) + '|' + calculateSteps(185, 6) + '|' + utilsNumAfter(6, 185) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "140|1110|1110|0");
      expect(actual).assertEqual("140|1110|1110|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0007
     * @tc.name      Perf_UtilsMatrix_0007
     * @tc.desc      utils matrix -44,222,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0007 begin`);
      logInfo("utils matrix -44,222,7");
      const actual: string = calculateNum(-44, 222) + '|' + calculateSteps(222, 7) + '|' + utilsNumAfter(7, 222) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "178|1554|1554|0");
      expect(actual).assertEqual("178|1554|1554|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0008
     * @tc.name      Perf_UtilsMatrix_0008
     * @tc.desc      utils matrix -43,259,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0008 begin`);
      logInfo("utils matrix -43,259,8");
      const actual: string = calculateNum(-43, 259) + '|' + calculateSteps(259, 8) + '|' + utilsNumAfter(8, 259) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "216|2072|2072|0");
      expect(actual).assertEqual("216|2072|2072|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0009
     * @tc.name      Perf_UtilsMatrix_0009
     * @tc.desc      utils matrix -42,296,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0009 begin`);
      logInfo("utils matrix -42,296,9");
      const actual: string = calculateNum(-42, 296) + '|' + calculateSteps(296, 9) + '|' + utilsNumAfter(9, 296) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "254|2664|2664|0");
      expect(actual).assertEqual("254|2664|2664|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0010
     * @tc.name      Perf_UtilsMatrix_0010
     * @tc.desc      utils matrix -41,333,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0010 begin`);
      logInfo("utils matrix -41,333,1");
      const actual: string = calculateNum(-41, 333) + '|' + calculateSteps(333, 1) + '|' + utilsNumAfter(1, 333) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "292|333|333|0");
      expect(actual).assertEqual("292|333|333|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0011
     * @tc.name      Perf_UtilsMatrix_0011
     * @tc.desc      utils matrix -40,370,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0011 begin`);
      logInfo("utils matrix -40,370,2");
      const actual: string = calculateNum(-40, 370) + '|' + calculateSteps(370, 2) + '|' + utilsNumAfter(2, 370) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "330|740|740|0");
      expect(actual).assertEqual("330|740|740|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0012
     * @tc.name      Perf_UtilsMatrix_0012
     * @tc.desc      utils matrix -39,407,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0012 begin`);
      logInfo("utils matrix -39,407,3");
      const actual: string = calculateNum(-39, 407) + '|' + calculateSteps(407, 3) + '|' + utilsNumAfter(3, 407) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "368|1221|1221|0");
      expect(actual).assertEqual("368|1221|1221|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0013
     * @tc.name      Perf_UtilsMatrix_0013
     * @tc.desc      utils matrix -38,444,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0013 begin`);
      logInfo("utils matrix -38,444,4");
      const actual: string = calculateNum(-38, 444) + '|' + calculateSteps(444, 4) + '|' + utilsNumAfter(4, 444) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "406|1776|1776|0");
      expect(actual).assertEqual("406|1776|1776|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0014
     * @tc.name      Perf_UtilsMatrix_0014
     * @tc.desc      utils matrix -37,481,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0014 begin`);
      logInfo("utils matrix -37,481,5");
      const actual: string = calculateNum(-37, 481) + '|' + calculateSteps(481, 5) + '|' + utilsNumAfter(5, 481) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "444|2405|2405|0");
      expect(actual).assertEqual("444|2405|2405|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0015
     * @tc.name      Perf_UtilsMatrix_0015
     * @tc.desc      utils matrix -36,518,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0015 begin`);
      logInfo("utils matrix -36,518,6");
      const actual: string = calculateNum(-36, 518) + '|' + calculateSteps(518, 6) + '|' + utilsNumAfter(6, 518) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "482|3108|3108|0");
      expect(actual).assertEqual("482|3108|3108|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0016
     * @tc.name      Perf_UtilsMatrix_0016
     * @tc.desc      utils matrix -35,555,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0016 begin`);
      logInfo("utils matrix -35,555,7");
      const actual: string = calculateNum(-35, 555) + '|' + calculateSteps(555, 7) + '|' + utilsNumAfter(7, 555) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "520|3885|3885|0");
      expect(actual).assertEqual("520|3885|3885|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0017
     * @tc.name      Perf_UtilsMatrix_0017
     * @tc.desc      utils matrix -34,592,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0017 begin`);
      logInfo("utils matrix -34,592,8");
      const actual: string = calculateNum(-34, 592) + '|' + calculateSteps(592, 8) + '|' + utilsNumAfter(8, 592) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "558|4736|4736|0");
      expect(actual).assertEqual("558|4736|4736|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0018
     * @tc.name      Perf_UtilsMatrix_0018
     * @tc.desc      utils matrix -33,629,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0018 begin`);
      logInfo("utils matrix -33,629,9");
      const actual: string = calculateNum(-33, 629) + '|' + calculateSteps(629, 9) + '|' + utilsNumAfter(9, 629) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "596|5661|5661|0");
      expect(actual).assertEqual("596|5661|5661|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0019
     * @tc.name      Perf_UtilsMatrix_0019
     * @tc.desc      utils matrix -32,666,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0019 begin`);
      logInfo("utils matrix -32,666,1");
      const actual: string = calculateNum(-32, 666) + '|' + calculateSteps(666, 1) + '|' + utilsNumAfter(1, 666) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "634|666|666|0");
      expect(actual).assertEqual("634|666|666|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0020
     * @tc.name      Perf_UtilsMatrix_0020
     * @tc.desc      utils matrix -31,703,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0020 begin`);
      logInfo("utils matrix -31,703,2");
      const actual: string = calculateNum(-31, 703) + '|' + calculateSteps(703, 2) + '|' + utilsNumAfter(2, 703) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "672|1406|1406|0");
      expect(actual).assertEqual("672|1406|1406|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0021
     * @tc.name      Perf_UtilsMatrix_0021
     * @tc.desc      utils matrix -30,740,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0021 begin`);
      logInfo("utils matrix -30,740,3");
      const actual: string = calculateNum(-30, 740) + '|' + calculateSteps(740, 3) + '|' + utilsNumAfter(3, 740) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "710|2220|2220|0");
      expect(actual).assertEqual("710|2220|2220|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0022
     * @tc.name      Perf_UtilsMatrix_0022
     * @tc.desc      utils matrix -29,777,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0022 begin`);
      logInfo("utils matrix -29,777,4");
      const actual: string = calculateNum(-29, 777) + '|' + calculateSteps(777, 4) + '|' + utilsNumAfter(4, 777) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "748|3108|3108|0");
      expect(actual).assertEqual("748|3108|3108|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0023
     * @tc.name      Perf_UtilsMatrix_0023
     * @tc.desc      utils matrix -28,814,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0023 begin`);
      logInfo("utils matrix -28,814,5");
      const actual: string = calculateNum(-28, 814) + '|' + calculateSteps(814, 5) + '|' + utilsNumAfter(5, 814) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "786|4070|4070|0");
      expect(actual).assertEqual("786|4070|4070|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0024
     * @tc.name      Perf_UtilsMatrix_0024
     * @tc.desc      utils matrix -27,851,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0024 begin`);
      logInfo("utils matrix -27,851,6");
      const actual: string = calculateNum(-27, 851) + '|' + calculateSteps(851, 6) + '|' + utilsNumAfter(6, 851) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "824|5106|5106|0");
      expect(actual).assertEqual("824|5106|5106|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0025
     * @tc.name      Perf_UtilsMatrix_0025
     * @tc.desc      utils matrix -26,888,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0025 begin`);
      logInfo("utils matrix -26,888,7");
      const actual: string = calculateNum(-26, 888) + '|' + calculateSteps(888, 7) + '|' + utilsNumAfter(7, 888) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "862|6216|6216|0");
      expect(actual).assertEqual("862|6216|6216|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0026
     * @tc.name      Perf_UtilsMatrix_0026
     * @tc.desc      utils matrix -25,925,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0026 begin`);
      logInfo("utils matrix -25,925,8");
      const actual: string = calculateNum(-25, 925) + '|' + calculateSteps(925, 8) + '|' + utilsNumAfter(8, 925) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "900|7400|7400|0");
      expect(actual).assertEqual("900|7400|7400|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0027
     * @tc.name      Perf_UtilsMatrix_0027
     * @tc.desc      utils matrix -24,962,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0027 begin`);
      logInfo("utils matrix -24,962,9");
      const actual: string = calculateNum(-24, 962) + '|' + calculateSteps(962, 9) + '|' + utilsNumAfter(9, 962) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "938|8658|8658|0");
      expect(actual).assertEqual("938|8658|8658|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0028
     * @tc.name      Perf_UtilsMatrix_0028
     * @tc.desc      utils matrix -23,999,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0028 begin`);
      logInfo("utils matrix -23,999,1");
      const actual: string = calculateNum(-23, 999) + '|' + calculateSteps(999, 1) + '|' + utilsNumAfter(1, 999) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "976|999|999|0");
      expect(actual).assertEqual("976|999|999|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0029
     * @tc.name      Perf_UtilsMatrix_0029
     * @tc.desc      utils matrix -22,1036,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0029 begin`);
      logInfo("utils matrix -22,1036,2");
      const actual: string = calculateNum(-22, 1036) + '|' + calculateSteps(1036, 2) + '|' + utilsNumAfter(2, 1036) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1014|2072|2072|0");
      expect(actual).assertEqual("1014|2072|2072|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0030
     * @tc.name      Perf_UtilsMatrix_0030
     * @tc.desc      utils matrix -21,1073,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0030 begin`);
      logInfo("utils matrix -21,1073,3");
      const actual: string = calculateNum(-21, 1073) + '|' + calculateSteps(1073, 3) + '|' + utilsNumAfter(3, 1073) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1052|3219|3219|0");
      expect(actual).assertEqual("1052|3219|3219|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0031
     * @tc.name      Perf_UtilsMatrix_0031
     * @tc.desc      utils matrix -20,1110,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0031 begin`);
      logInfo("utils matrix -20,1110,4");
      const actual: string = calculateNum(-20, 1110) + '|' + calculateSteps(1110, 4) + '|' + utilsNumAfter(4, 1110) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1090|4440|4440|0");
      expect(actual).assertEqual("1090|4440|4440|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0032
     * @tc.name      Perf_UtilsMatrix_0032
     * @tc.desc      utils matrix -19,1147,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0032 begin`);
      logInfo("utils matrix -19,1147,5");
      const actual: string = calculateNum(-19, 1147) + '|' + calculateSteps(1147, 5) + '|' + utilsNumAfter(5, 1147) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1128|5735|5735|0");
      expect(actual).assertEqual("1128|5735|5735|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0032 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0033
     * @tc.name      Perf_UtilsMatrix_0033
     * @tc.desc      utils matrix -18,1184,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0033 begin`);
      logInfo("utils matrix -18,1184,6");
      const actual: string = calculateNum(-18, 1184) + '|' + calculateSteps(1184, 6) + '|' + utilsNumAfter(6, 1184) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1166|7104|7104|0");
      expect(actual).assertEqual("1166|7104|7104|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0033 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0034
     * @tc.name      Perf_UtilsMatrix_0034
     * @tc.desc      utils matrix -17,1221,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0034 begin`);
      logInfo("utils matrix -17,1221,7");
      const actual: string = calculateNum(-17, 1221) + '|' + calculateSteps(1221, 7) + '|' + utilsNumAfter(7, 1221) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1204|8547|8547|0");
      expect(actual).assertEqual("1204|8547|8547|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0034 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0035
     * @tc.name      Perf_UtilsMatrix_0035
     * @tc.desc      utils matrix -16,1258,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0035 begin`);
      logInfo("utils matrix -16,1258,8");
      const actual: string = calculateNum(-16, 1258) + '|' + calculateSteps(1258, 8) + '|' + utilsNumAfter(8, 1258) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1242|10064|10064|0");
      expect(actual).assertEqual("1242|10064|10064|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0035 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0036
     * @tc.name      Perf_UtilsMatrix_0036
     * @tc.desc      utils matrix -15,1295,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0036 begin`);
      logInfo("utils matrix -15,1295,9");
      const actual: string = calculateNum(-15, 1295) + '|' + calculateSteps(1295, 9) + '|' + utilsNumAfter(9, 1295) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1280|11655|11655|0");
      expect(actual).assertEqual("1280|11655|11655|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0036 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0037
     * @tc.name      Perf_UtilsMatrix_0037
     * @tc.desc      utils matrix -14,1332,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0037 begin`);
      logInfo("utils matrix -14,1332,1");
      const actual: string = calculateNum(-14, 1332) + '|' + calculateSteps(1332, 1) + '|' + utilsNumAfter(1, 1332) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1318|1332|1332|0");
      expect(actual).assertEqual("1318|1332|1332|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0037 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0038
     * @tc.name      Perf_UtilsMatrix_0038
     * @tc.desc      utils matrix -13,1369,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0038 begin`);
      logInfo("utils matrix -13,1369,2");
      const actual: string = calculateNum(-13, 1369) + '|' + calculateSteps(1369, 2) + '|' + utilsNumAfter(2, 1369) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1356|2738|2738|0");
      expect(actual).assertEqual("1356|2738|2738|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0038 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0039
     * @tc.name      Perf_UtilsMatrix_0039
     * @tc.desc      utils matrix -12,1406,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0039 begin`);
      logInfo("utils matrix -12,1406,3");
      const actual: string = calculateNum(-12, 1406) + '|' + calculateSteps(1406, 3) + '|' + utilsNumAfter(3, 1406) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1394|4218|4218|0");
      expect(actual).assertEqual("1394|4218|4218|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0039 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0040
     * @tc.name      Perf_UtilsMatrix_0040
     * @tc.desc      utils matrix -11,1443,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0040 begin`);
      logInfo("utils matrix -11,1443,4");
      const actual: string = calculateNum(-11, 1443) + '|' + calculateSteps(1443, 4) + '|' + utilsNumAfter(4, 1443) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1432|5772|5772|0");
      expect(actual).assertEqual("1432|5772|5772|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0040 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0041
     * @tc.name      Perf_UtilsMatrix_0041
     * @tc.desc      utils matrix -10,1480,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0041 begin`);
      logInfo("utils matrix -10,1480,5");
      const actual: string = calculateNum(-10, 1480) + '|' + calculateSteps(1480, 5) + '|' + utilsNumAfter(5, 1480) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1470|7400|7400|0");
      expect(actual).assertEqual("1470|7400|7400|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0041 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0042
     * @tc.name      Perf_UtilsMatrix_0042
     * @tc.desc      utils matrix -9,1517,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0042 begin`);
      logInfo("utils matrix -9,1517,6");
      const actual: string = calculateNum(-9, 1517) + '|' + calculateSteps(1517, 6) + '|' + utilsNumAfter(6, 1517) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1508|9102|9102|0");
      expect(actual).assertEqual("1508|9102|9102|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0042 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0043
     * @tc.name      Perf_UtilsMatrix_0043
     * @tc.desc      utils matrix -8,1554,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0043 begin`);
      logInfo("utils matrix -8,1554,7");
      const actual: string = calculateNum(-8, 1554) + '|' + calculateSteps(1554, 7) + '|' + utilsNumAfter(7, 1554) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1546|10878|10878|0");
      expect(actual).assertEqual("1546|10878|10878|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0043 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0044
     * @tc.name      Perf_UtilsMatrix_0044
     * @tc.desc      utils matrix -7,1591,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0044 begin`);
      logInfo("utils matrix -7,1591,8");
      const actual: string = calculateNum(-7, 1591) + '|' + calculateSteps(1591, 8) + '|' + utilsNumAfter(8, 1591) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1584|12728|12728|0");
      expect(actual).assertEqual("1584|12728|12728|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0044 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0045
     * @tc.name      Perf_UtilsMatrix_0045
     * @tc.desc      utils matrix -6,1628,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0045 begin`);
      logInfo("utils matrix -6,1628,9");
      const actual: string = calculateNum(-6, 1628) + '|' + calculateSteps(1628, 9) + '|' + utilsNumAfter(9, 1628) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1622|14652|14652|0");
      expect(actual).assertEqual("1622|14652|14652|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0045 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0046
     * @tc.name      Perf_UtilsMatrix_0046
     * @tc.desc      utils matrix -5,1665,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0046 begin`);
      logInfo("utils matrix -5,1665,1");
      const actual: string = calculateNum(-5, 1665) + '|' + calculateSteps(1665, 1) + '|' + utilsNumAfter(1, 1665) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1660|1665|1665|0");
      expect(actual).assertEqual("1660|1665|1665|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0046 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0047
     * @tc.name      Perf_UtilsMatrix_0047
     * @tc.desc      utils matrix -4,1702,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0047 begin`);
      logInfo("utils matrix -4,1702,2");
      const actual: string = calculateNum(-4, 1702) + '|' + calculateSteps(1702, 2) + '|' + utilsNumAfter(2, 1702) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1698|3404|3404|0");
      expect(actual).assertEqual("1698|3404|3404|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0047 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0048
     * @tc.name      Perf_UtilsMatrix_0048
     * @tc.desc      utils matrix -3,1739,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0048 begin`);
      logInfo("utils matrix -3,1739,3");
      const actual: string = calculateNum(-3, 1739) + '|' + calculateSteps(1739, 3) + '|' + utilsNumAfter(3, 1739) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1736|5217|5217|0");
      expect(actual).assertEqual("1736|5217|5217|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0048 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0049
     * @tc.name      Perf_UtilsMatrix_0049
     * @tc.desc      utils matrix -2,1776,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0049 begin`);
      logInfo("utils matrix -2,1776,4");
      const actual: string = calculateNum(-2, 1776) + '|' + calculateSteps(1776, 4) + '|' + utilsNumAfter(4, 1776) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1774|7104|7104|0");
      expect(actual).assertEqual("1774|7104|7104|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0049 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0050
     * @tc.name      Perf_UtilsMatrix_0050
     * @tc.desc      utils matrix -1,1813,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0050 begin`);
      logInfo("utils matrix -1,1813,5");
      const actual: string = calculateNum(-1, 1813) + '|' + calculateSteps(1813, 5) + '|' + utilsNumAfter(5, 1813) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1812|9065|9065|0");
      expect(actual).assertEqual("1812|9065|9065|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0050 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0051
     * @tc.name      Perf_UtilsMatrix_0051
     * @tc.desc      utils matrix 0,1850,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0051 begin`);
      logInfo("utils matrix 0,1850,6");
      const actual: string = calculateNum(0, 1850) + '|' + calculateSteps(1850, 6) + '|' + utilsNumAfter(6, 1850) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1850|11100|11100|0");
      expect(actual).assertEqual("1850|11100|11100|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0051 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0052
     * @tc.name      Perf_UtilsMatrix_0052
     * @tc.desc      utils matrix 1,1887,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0052 begin`);
      logInfo("utils matrix 1,1887,7");
      const actual: string = calculateNum(1, 1887) + '|' + calculateSteps(1887, 7) + '|' + utilsNumAfter(7, 1887) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1888|13209|13209|0");
      expect(actual).assertEqual("1888|13209|13209|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0052 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0053
     * @tc.name      Perf_UtilsMatrix_0053
     * @tc.desc      utils matrix 2,1924,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0053 begin`);
      logInfo("utils matrix 2,1924,8");
      const actual: string = calculateNum(2, 1924) + '|' + calculateSteps(1924, 8) + '|' + utilsNumAfter(8, 1924) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1926|15392|15392|0");
      expect(actual).assertEqual("1926|15392|15392|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0053 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0054
     * @tc.name      Perf_UtilsMatrix_0054
     * @tc.desc      utils matrix 3,1961,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0054 begin`);
      logInfo("utils matrix 3,1961,9");
      const actual: string = calculateNum(3, 1961) + '|' + calculateSteps(1961, 9) + '|' + utilsNumAfter(9, 1961) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "1964|17649|17649|0");
      expect(actual).assertEqual("1964|17649|17649|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0054 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0055
     * @tc.name      Perf_UtilsMatrix_0055
     * @tc.desc      utils matrix 4,1998,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0055 begin`);
      logInfo("utils matrix 4,1998,1");
      const actual: string = calculateNum(4, 1998) + '|' + calculateSteps(1998, 1) + '|' + utilsNumAfter(1, 1998) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2002|1998|1998|0");
      expect(actual).assertEqual("2002|1998|1998|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0055 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0056
     * @tc.name      Perf_UtilsMatrix_0056
     * @tc.desc      utils matrix 5,2035,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0056 begin`);
      logInfo("utils matrix 5,2035,2");
      const actual: string = calculateNum(5, 2035) + '|' + calculateSteps(2035, 2) + '|' + utilsNumAfter(2, 2035) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2040|4070|4070|0");
      expect(actual).assertEqual("2040|4070|4070|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0056 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0057
     * @tc.name      Perf_UtilsMatrix_0057
     * @tc.desc      utils matrix 6,2072,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0057 begin`);
      logInfo("utils matrix 6,2072,3");
      const actual: string = calculateNum(6, 2072) + '|' + calculateSteps(2072, 3) + '|' + utilsNumAfter(3, 2072) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2078|6216|6216|0");
      expect(actual).assertEqual("2078|6216|6216|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0057 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0058
     * @tc.name      Perf_UtilsMatrix_0058
     * @tc.desc      utils matrix 7,2109,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0058 begin`);
      logInfo("utils matrix 7,2109,4");
      const actual: string = calculateNum(7, 2109) + '|' + calculateSteps(2109, 4) + '|' + utilsNumAfter(4, 2109) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2116|8436|8436|0");
      expect(actual).assertEqual("2116|8436|8436|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0058 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0059
     * @tc.name      Perf_UtilsMatrix_0059
     * @tc.desc      utils matrix 8,2146,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0059 begin`);
      logInfo("utils matrix 8,2146,5");
      const actual: string = calculateNum(8, 2146) + '|' + calculateSteps(2146, 5) + '|' + utilsNumAfter(5, 2146) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2154|10730|10730|0");
      expect(actual).assertEqual("2154|10730|10730|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0059 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0060
     * @tc.name      Perf_UtilsMatrix_0060
     * @tc.desc      utils matrix 9,2183,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0060 begin`);
      logInfo("utils matrix 9,2183,6");
      const actual: string = calculateNum(9, 2183) + '|' + calculateSteps(2183, 6) + '|' + utilsNumAfter(6, 2183) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2192|13098|13098|0");
      expect(actual).assertEqual("2192|13098|13098|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0060 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0061
     * @tc.name      Perf_UtilsMatrix_0061
     * @tc.desc      utils matrix 10,2220,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0061 begin`);
      logInfo("utils matrix 10,2220,7");
      const actual: string = calculateNum(10, 2220) + '|' + calculateSteps(2220, 7) + '|' + utilsNumAfter(7, 2220) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2230|15540|15540|0");
      expect(actual).assertEqual("2230|15540|15540|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0061 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0062
     * @tc.name      Perf_UtilsMatrix_0062
     * @tc.desc      utils matrix 11,2257,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0062 begin`);
      logInfo("utils matrix 11,2257,8");
      const actual: string = calculateNum(11, 2257) + '|' + calculateSteps(2257, 8) + '|' + utilsNumAfter(8, 2257) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2268|18056|18056|0");
      expect(actual).assertEqual("2268|18056|18056|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0062 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0063
     * @tc.name      Perf_UtilsMatrix_0063
     * @tc.desc      utils matrix 12,2294,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0063 begin`);
      logInfo("utils matrix 12,2294,9");
      const actual: string = calculateNum(12, 2294) + '|' + calculateSteps(2294, 9) + '|' + utilsNumAfter(9, 2294) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2306|20646|20646|0");
      expect(actual).assertEqual("2306|20646|20646|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0063 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0064
     * @tc.name      Perf_UtilsMatrix_0064
     * @tc.desc      utils matrix 13,2331,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0064 begin`);
      logInfo("utils matrix 13,2331,1");
      const actual: string = calculateNum(13, 2331) + '|' + calculateSteps(2331, 1) + '|' + utilsNumAfter(1, 2331) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2344|2331|2331|0");
      expect(actual).assertEqual("2344|2331|2331|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0064 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0065
     * @tc.name      Perf_UtilsMatrix_0065
     * @tc.desc      utils matrix 14,2368,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0065 begin`);
      logInfo("utils matrix 14,2368,2");
      const actual: string = calculateNum(14, 2368) + '|' + calculateSteps(2368, 2) + '|' + utilsNumAfter(2, 2368) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2382|4736|4736|0");
      expect(actual).assertEqual("2382|4736|4736|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0065 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0066
     * @tc.name      Perf_UtilsMatrix_0066
     * @tc.desc      utils matrix 15,2405,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0066 begin`);
      logInfo("utils matrix 15,2405,3");
      const actual: string = calculateNum(15, 2405) + '|' + calculateSteps(2405, 3) + '|' + utilsNumAfter(3, 2405) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2420|7215|7215|0");
      expect(actual).assertEqual("2420|7215|7215|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0066 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0067
     * @tc.name      Perf_UtilsMatrix_0067
     * @tc.desc      utils matrix 16,2442,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0067 begin`);
      logInfo("utils matrix 16,2442,4");
      const actual: string = calculateNum(16, 2442) + '|' + calculateSteps(2442, 4) + '|' + utilsNumAfter(4, 2442) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2458|9768|9768|0");
      expect(actual).assertEqual("2458|9768|9768|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0067 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0068
     * @tc.name      Perf_UtilsMatrix_0068
     * @tc.desc      utils matrix 17,2479,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0068 begin`);
      logInfo("utils matrix 17,2479,5");
      const actual: string = calculateNum(17, 2479) + '|' + calculateSteps(2479, 5) + '|' + utilsNumAfter(5, 2479) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2496|12395|12395|0");
      expect(actual).assertEqual("2496|12395|12395|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0068 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0069
     * @tc.name      Perf_UtilsMatrix_0069
     * @tc.desc      utils matrix 18,2516,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0069 begin`);
      logInfo("utils matrix 18,2516,6");
      const actual: string = calculateNum(18, 2516) + '|' + calculateSteps(2516, 6) + '|' + utilsNumAfter(6, 2516) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2534|15096|15096|0");
      expect(actual).assertEqual("2534|15096|15096|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0069 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0070
     * @tc.name      Perf_UtilsMatrix_0070
     * @tc.desc      utils matrix 19,2553,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0070 begin`);
      logInfo("utils matrix 19,2553,7");
      const actual: string = calculateNum(19, 2553) + '|' + calculateSteps(2553, 7) + '|' + utilsNumAfter(7, 2553) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2572|17871|17871|0");
      expect(actual).assertEqual("2572|17871|17871|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0070 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0071
     * @tc.name      Perf_UtilsMatrix_0071
     * @tc.desc      utils matrix 20,2590,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0071 begin`);
      logInfo("utils matrix 20,2590,8");
      const actual: string = calculateNum(20, 2590) + '|' + calculateSteps(2590, 8) + '|' + utilsNumAfter(8, 2590) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2610|20720|20720|0");
      expect(actual).assertEqual("2610|20720|20720|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0071 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0072
     * @tc.name      Perf_UtilsMatrix_0072
     * @tc.desc      utils matrix 21,2627,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0072 begin`);
      logInfo("utils matrix 21,2627,9");
      const actual: string = calculateNum(21, 2627) + '|' + calculateSteps(2627, 9) + '|' + utilsNumAfter(9, 2627) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2648|23643|23643|0");
      expect(actual).assertEqual("2648|23643|23643|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0072 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0073
     * @tc.name      Perf_UtilsMatrix_0073
     * @tc.desc      utils matrix 22,2664,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0073 begin`);
      logInfo("utils matrix 22,2664,1");
      const actual: string = calculateNum(22, 2664) + '|' + calculateSteps(2664, 1) + '|' + utilsNumAfter(1, 2664) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2686|2664|2664|0");
      expect(actual).assertEqual("2686|2664|2664|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0073 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0074
     * @tc.name      Perf_UtilsMatrix_0074
     * @tc.desc      utils matrix 23,2701,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0074 begin`);
      logInfo("utils matrix 23,2701,2");
      const actual: string = calculateNum(23, 2701) + '|' + calculateSteps(2701, 2) + '|' + utilsNumAfter(2, 2701) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2724|5402|5402|0");
      expect(actual).assertEqual("2724|5402|5402|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0074 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0075
     * @tc.name      Perf_UtilsMatrix_0075
     * @tc.desc      utils matrix 24,2738,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0075 begin`);
      logInfo("utils matrix 24,2738,3");
      const actual: string = calculateNum(24, 2738) + '|' + calculateSteps(2738, 3) + '|' + utilsNumAfter(3, 2738) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2762|8214|8214|0");
      expect(actual).assertEqual("2762|8214|8214|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0075 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0076
     * @tc.name      Perf_UtilsMatrix_0076
     * @tc.desc      utils matrix 25,2775,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0076 begin`);
      logInfo("utils matrix 25,2775,4");
      const actual: string = calculateNum(25, 2775) + '|' + calculateSteps(2775, 4) + '|' + utilsNumAfter(4, 2775) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2800|11100|11100|0");
      expect(actual).assertEqual("2800|11100|11100|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0076 end`);
