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
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0077
     * @tc.name      Perf_UtilsMatrix_0077
     * @tc.desc      utils matrix 26,2812,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0077 begin`);
      logInfo("utils matrix 26,2812,5");
      const actual: string = calculateNum(26, 2812) + '|' + calculateSteps(2812, 5) + '|' + utilsNumAfter(5, 2812) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2838|14060|14060|0");
      expect(actual).assertEqual("2838|14060|14060|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0077 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0078
     * @tc.name      Perf_UtilsMatrix_0078
     * @tc.desc      utils matrix 27,2849,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0078 begin`);
      logInfo("utils matrix 27,2849,6");
      const actual: string = calculateNum(27, 2849) + '|' + calculateSteps(2849, 6) + '|' + utilsNumAfter(6, 2849) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2876|17094|17094|0");
      expect(actual).assertEqual("2876|17094|17094|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0078 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0079
     * @tc.name      Perf_UtilsMatrix_0079
     * @tc.desc      utils matrix 28,2886,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0079 begin`);
      logInfo("utils matrix 28,2886,7");
      const actual: string = calculateNum(28, 2886) + '|' + calculateSteps(2886, 7) + '|' + utilsNumAfter(7, 2886) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2914|20202|20202|0");
      expect(actual).assertEqual("2914|20202|20202|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0079 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0080
     * @tc.name      Perf_UtilsMatrix_0080
     * @tc.desc      utils matrix 29,2923,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0080 begin`);
      logInfo("utils matrix 29,2923,8");
      const actual: string = calculateNum(29, 2923) + '|' + calculateSteps(2923, 8) + '|' + utilsNumAfter(8, 2923) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2952|23384|23384|0");
      expect(actual).assertEqual("2952|23384|23384|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0080 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0081
     * @tc.name      Perf_UtilsMatrix_0081
     * @tc.desc      utils matrix 30,2960,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0081 begin`);
      logInfo("utils matrix 30,2960,9");
      const actual: string = calculateNum(30, 2960) + '|' + calculateSteps(2960, 9) + '|' + utilsNumAfter(9, 2960) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "2990|26640|26640|0");
      expect(actual).assertEqual("2990|26640|26640|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0081 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0082
     * @tc.name      Perf_UtilsMatrix_0082
     * @tc.desc      utils matrix 31,2997,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0082 begin`);
      logInfo("utils matrix 31,2997,1");
      const actual: string = calculateNum(31, 2997) + '|' + calculateSteps(2997, 1) + '|' + utilsNumAfter(1, 2997) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3028|2997|2997|0");
      expect(actual).assertEqual("3028|2997|2997|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0082 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0083
     * @tc.name      Perf_UtilsMatrix_0083
     * @tc.desc      utils matrix 32,3034,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0083 begin`);
      logInfo("utils matrix 32,3034,2");
      const actual: string = calculateNum(32, 3034) + '|' + calculateSteps(3034, 2) + '|' + utilsNumAfter(2, 3034) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3066|6068|6068|0");
      expect(actual).assertEqual("3066|6068|6068|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0083 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0084
     * @tc.name      Perf_UtilsMatrix_0084
     * @tc.desc      utils matrix 33,3071,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0084 begin`);
      logInfo("utils matrix 33,3071,3");
      const actual: string = calculateNum(33, 3071) + '|' + calculateSteps(3071, 3) + '|' + utilsNumAfter(3, 3071) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3104|9213|9213|0");
      expect(actual).assertEqual("3104|9213|9213|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0084 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0085
     * @tc.name      Perf_UtilsMatrix_0085
     * @tc.desc      utils matrix 34,3108,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0085 begin`);
      logInfo("utils matrix 34,3108,4");
      const actual: string = calculateNum(34, 3108) + '|' + calculateSteps(3108, 4) + '|' + utilsNumAfter(4, 3108) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3142|12432|12432|0");
      expect(actual).assertEqual("3142|12432|12432|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0085 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0086
     * @tc.name      Perf_UtilsMatrix_0086
     * @tc.desc      utils matrix 35,3145,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0086 begin`);
      logInfo("utils matrix 35,3145,5");
      const actual: string = calculateNum(35, 3145) + '|' + calculateSteps(3145, 5) + '|' + utilsNumAfter(5, 3145) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3180|15725|15725|0");
      expect(actual).assertEqual("3180|15725|15725|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0086 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0087
     * @tc.name      Perf_UtilsMatrix_0087
     * @tc.desc      utils matrix 36,3182,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0087 begin`);
      logInfo("utils matrix 36,3182,6");
      const actual: string = calculateNum(36, 3182) + '|' + calculateSteps(3182, 6) + '|' + utilsNumAfter(6, 3182) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3218|19092|19092|0");
      expect(actual).assertEqual("3218|19092|19092|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0087 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0088
     * @tc.name      Perf_UtilsMatrix_0088
     * @tc.desc      utils matrix 37,3219,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0088 begin`);
      logInfo("utils matrix 37,3219,7");
      const actual: string = calculateNum(37, 3219) + '|' + calculateSteps(3219, 7) + '|' + utilsNumAfter(7, 3219) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3256|22533|22533|0");
      expect(actual).assertEqual("3256|22533|22533|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0088 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0089
     * @tc.name      Perf_UtilsMatrix_0089
     * @tc.desc      utils matrix 38,3256,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0089 begin`);
      logInfo("utils matrix 38,3256,8");
      const actual: string = calculateNum(38, 3256) + '|' + calculateSteps(3256, 8) + '|' + utilsNumAfter(8, 3256) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3294|26048|26048|0");
      expect(actual).assertEqual("3294|26048|26048|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0089 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0090
     * @tc.name      Perf_UtilsMatrix_0090
     * @tc.desc      utils matrix 39,3293,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0090 begin`);
      logInfo("utils matrix 39,3293,9");
      const actual: string = calculateNum(39, 3293) + '|' + calculateSteps(3293, 9) + '|' + utilsNumAfter(9, 3293) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3332|29637|29637|0");
      expect(actual).assertEqual("3332|29637|29637|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0090 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0091
     * @tc.name      Perf_UtilsMatrix_0091
     * @tc.desc      utils matrix 40,3330,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0091 begin`);
      logInfo("utils matrix 40,3330,1");
      const actual: string = calculateNum(40, 3330) + '|' + calculateSteps(3330, 1) + '|' + utilsNumAfter(1, 3330) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3370|3330|3330|0");
      expect(actual).assertEqual("3370|3330|3330|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0091 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0092
     * @tc.name      Perf_UtilsMatrix_0092
     * @tc.desc      utils matrix 41,3367,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0092 begin`);
      logInfo("utils matrix 41,3367,2");
      const actual: string = calculateNum(41, 3367) + '|' + calculateSteps(3367, 2) + '|' + utilsNumAfter(2, 3367) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3408|6734|6734|0");
      expect(actual).assertEqual("3408|6734|6734|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0092 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0093
     * @tc.name      Perf_UtilsMatrix_0093
     * @tc.desc      utils matrix 42,3404,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0093 begin`);
      logInfo("utils matrix 42,3404,3");
      const actual: string = calculateNum(42, 3404) + '|' + calculateSteps(3404, 3) + '|' + utilsNumAfter(3, 3404) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3446|10212|10212|0");
      expect(actual).assertEqual("3446|10212|10212|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0093 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0094
     * @tc.name      Perf_UtilsMatrix_0094
     * @tc.desc      utils matrix 43,3441,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0094 begin`);
      logInfo("utils matrix 43,3441,4");
      const actual: string = calculateNum(43, 3441) + '|' + calculateSteps(3441, 4) + '|' + utilsNumAfter(4, 3441) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3484|13764|13764|0");
      expect(actual).assertEqual("3484|13764|13764|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0094 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0095
     * @tc.name      Perf_UtilsMatrix_0095
     * @tc.desc      utils matrix 44,3478,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0095 begin`);
      logInfo("utils matrix 44,3478,5");
      const actual: string = calculateNum(44, 3478) + '|' + calculateSteps(3478, 5) + '|' + utilsNumAfter(5, 3478) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3522|17390|17390|0");
      expect(actual).assertEqual("3522|17390|17390|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0095 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0096
     * @tc.name      Perf_UtilsMatrix_0096
     * @tc.desc      utils matrix 45,3515,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0096 begin`);
      logInfo("utils matrix 45,3515,6");
      const actual: string = calculateNum(45, 3515) + '|' + calculateSteps(3515, 6) + '|' + utilsNumAfter(6, 3515) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3560|21090|21090|0");
      expect(actual).assertEqual("3560|21090|21090|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0096 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0097
     * @tc.name      Perf_UtilsMatrix_0097
     * @tc.desc      utils matrix 46,3552,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0097 begin`);
      logInfo("utils matrix 46,3552,7");
      const actual: string = calculateNum(46, 3552) + '|' + calculateSteps(3552, 7) + '|' + utilsNumAfter(7, 3552) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3598|24864|24864|0");
      expect(actual).assertEqual("3598|24864|24864|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0097 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0098
     * @tc.name      Perf_UtilsMatrix_0098
     * @tc.desc      utils matrix 47,3589,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0098 begin`);
      logInfo("utils matrix 47,3589,8");
      const actual: string = calculateNum(47, 3589) + '|' + calculateSteps(3589, 8) + '|' + utilsNumAfter(8, 3589) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3636|28712|28712|0");
      expect(actual).assertEqual("3636|28712|28712|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0098 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0099
     * @tc.name      Perf_UtilsMatrix_0099
     * @tc.desc      utils matrix 48,3626,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0099 begin`);
      logInfo("utils matrix 48,3626,9");
      const actual: string = calculateNum(48, 3626) + '|' + calculateSteps(3626, 9) + '|' + utilsNumAfter(9, 3626) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3674|32634|32634|0");
      expect(actual).assertEqual("3674|32634|32634|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0099 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0100
     * @tc.name      Perf_UtilsMatrix_0100
     * @tc.desc      utils matrix 49,3663,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0100 begin`);
      logInfo("utils matrix 49,3663,1");
      const actual: string = calculateNum(49, 3663) + '|' + calculateSteps(3663, 1) + '|' + utilsNumAfter(1, 3663) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3712|3663|3663|0");
      expect(actual).assertEqual("3712|3663|3663|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0100 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0101
     * @tc.name      Perf_UtilsMatrix_0101
     * @tc.desc      utils matrix 50,3700,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0101 begin`);
      logInfo("utils matrix 50,3700,2");
      const actual: string = calculateNum(50, 3700) + '|' + calculateSteps(3700, 2) + '|' + utilsNumAfter(2, 3700) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3750|7400|7400|0");
      expect(actual).assertEqual("3750|7400|7400|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0101 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0102
     * @tc.name      Perf_UtilsMatrix_0102
     * @tc.desc      utils matrix 51,3737,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0102 begin`);
      logInfo("utils matrix 51,3737,3");
      const actual: string = calculateNum(51, 3737) + '|' + calculateSteps(3737, 3) + '|' + utilsNumAfter(3, 3737) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3788|11211|11211|0");
      expect(actual).assertEqual("3788|11211|11211|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0102 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0103
     * @tc.name      Perf_UtilsMatrix_0103
     * @tc.desc      utils matrix 52,3774,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0103 begin`);
      logInfo("utils matrix 52,3774,4");
      const actual: string = calculateNum(52, 3774) + '|' + calculateSteps(3774, 4) + '|' + utilsNumAfter(4, 3774) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3826|15096|15096|0");
      expect(actual).assertEqual("3826|15096|15096|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0103 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0104
     * @tc.name      Perf_UtilsMatrix_0104
     * @tc.desc      utils matrix 53,3811,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0104 begin`);
      logInfo("utils matrix 53,3811,5");
      const actual: string = calculateNum(53, 3811) + '|' + calculateSteps(3811, 5) + '|' + utilsNumAfter(5, 3811) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3864|19055|19055|0");
      expect(actual).assertEqual("3864|19055|19055|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0104 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0105
     * @tc.name      Perf_UtilsMatrix_0105
     * @tc.desc      utils matrix 54,3848,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0105 begin`);
      logInfo("utils matrix 54,3848,6");
      const actual: string = calculateNum(54, 3848) + '|' + calculateSteps(3848, 6) + '|' + utilsNumAfter(6, 3848) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3902|23088|23088|0");
      expect(actual).assertEqual("3902|23088|23088|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0105 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0106
     * @tc.name      Perf_UtilsMatrix_0106
     * @tc.desc      utils matrix 55,3885,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0106 begin`);
      logInfo("utils matrix 55,3885,7");
      const actual: string = calculateNum(55, 3885) + '|' + calculateSteps(3885, 7) + '|' + utilsNumAfter(7, 3885) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3940|27195|27195|0");
      expect(actual).assertEqual("3940|27195|27195|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0106 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0107
     * @tc.name      Perf_UtilsMatrix_0107
     * @tc.desc      utils matrix 56,3922,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0107 begin`);
      logInfo("utils matrix 56,3922,8");
      const actual: string = calculateNum(56, 3922) + '|' + calculateSteps(3922, 8) + '|' + utilsNumAfter(8, 3922) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "3978|31376|31376|0");
      expect(actual).assertEqual("3978|31376|31376|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0107 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0108
     * @tc.name      Perf_UtilsMatrix_0108
     * @tc.desc      utils matrix 57,3959,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0108 begin`);
      logInfo("utils matrix 57,3959,9");
      const actual: string = calculateNum(57, 3959) + '|' + calculateSteps(3959, 9) + '|' + utilsNumAfter(9, 3959) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4016|35631|35631|0");
      expect(actual).assertEqual("4016|35631|35631|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0108 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0109
     * @tc.name      Perf_UtilsMatrix_0109
     * @tc.desc      utils matrix 58,3996,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0109 begin`);
      logInfo("utils matrix 58,3996,1");
      const actual: string = calculateNum(58, 3996) + '|' + calculateSteps(3996, 1) + '|' + utilsNumAfter(1, 3996) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4054|3996|3996|0");
      expect(actual).assertEqual("4054|3996|3996|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0109 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0110
     * @tc.name      Perf_UtilsMatrix_0110
     * @tc.desc      utils matrix 59,4033,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0110 begin`);
      logInfo("utils matrix 59,4033,2");
      const actual: string = calculateNum(59, 4033) + '|' + calculateSteps(4033, 2) + '|' + utilsNumAfter(2, 4033) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4092|8066|8066|0");
      expect(actual).assertEqual("4092|8066|8066|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0110 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0111
     * @tc.name      Perf_UtilsMatrix_0111
     * @tc.desc      utils matrix 60,4070,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0111 begin`);
      logInfo("utils matrix 60,4070,3");
      const actual: string = calculateNum(60, 4070) + '|' + calculateSteps(4070, 3) + '|' + utilsNumAfter(3, 4070) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4130|12210|12210|0");
      expect(actual).assertEqual("4130|12210|12210|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0111 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0112
     * @tc.name      Perf_UtilsMatrix_0112
     * @tc.desc      utils matrix 61,4107,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0112 begin`);
      logInfo("utils matrix 61,4107,4");
      const actual: string = calculateNum(61, 4107) + '|' + calculateSteps(4107, 4) + '|' + utilsNumAfter(4, 4107) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4168|16428|16428|0");
      expect(actual).assertEqual("4168|16428|16428|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0112 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0113
     * @tc.name      Perf_UtilsMatrix_0113
     * @tc.desc      utils matrix 62,4144,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0113 begin`);
      logInfo("utils matrix 62,4144,5");
      const actual: string = calculateNum(62, 4144) + '|' + calculateSteps(4144, 5) + '|' + utilsNumAfter(5, 4144) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4206|20720|20720|0");
      expect(actual).assertEqual("4206|20720|20720|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0113 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0114
     * @tc.name      Perf_UtilsMatrix_0114
     * @tc.desc      utils matrix 63,4181,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0114 begin`);
      logInfo("utils matrix 63,4181,6");
      const actual: string = calculateNum(63, 4181) + '|' + calculateSteps(4181, 6) + '|' + utilsNumAfter(6, 4181) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4244|25086|25086|0");
      expect(actual).assertEqual("4244|25086|25086|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0114 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0115
     * @tc.name      Perf_UtilsMatrix_0115
     * @tc.desc      utils matrix 64,4218,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0115 begin`);
      logInfo("utils matrix 64,4218,7");
      const actual: string = calculateNum(64, 4218) + '|' + calculateSteps(4218, 7) + '|' + utilsNumAfter(7, 4218) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4282|29526|29526|0");
      expect(actual).assertEqual("4282|29526|29526|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0115 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0116
     * @tc.name      Perf_UtilsMatrix_0116
     * @tc.desc      utils matrix 65,4255,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0116 begin`);
      logInfo("utils matrix 65,4255,8");
      const actual: string = calculateNum(65, 4255) + '|' + calculateSteps(4255, 8) + '|' + utilsNumAfter(8, 4255) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4320|34040|34040|0");
      expect(actual).assertEqual("4320|34040|34040|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0116 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0117
     * @tc.name      Perf_UtilsMatrix_0117
     * @tc.desc      utils matrix 66,4292,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0117 begin`);
      logInfo("utils matrix 66,4292,9");
      const actual: string = calculateNum(66, 4292) + '|' + calculateSteps(4292, 9) + '|' + utilsNumAfter(9, 4292) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4358|38628|38628|0");
      expect(actual).assertEqual("4358|38628|38628|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0117 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0118
     * @tc.name      Perf_UtilsMatrix_0118
     * @tc.desc      utils matrix 67,4329,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0118 begin`);
      logInfo("utils matrix 67,4329,1");
      const actual: string = calculateNum(67, 4329) + '|' + calculateSteps(4329, 1) + '|' + utilsNumAfter(1, 4329) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4396|4329|4329|0");
      expect(actual).assertEqual("4396|4329|4329|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0118 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0119
     * @tc.name      Perf_UtilsMatrix_0119
     * @tc.desc      utils matrix 68,4366,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0119 begin`);
      logInfo("utils matrix 68,4366,2");
      const actual: string = calculateNum(68, 4366) + '|' + calculateSteps(4366, 2) + '|' + utilsNumAfter(2, 4366) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4434|8732|8732|0");
      expect(actual).assertEqual("4434|8732|8732|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0119 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0120
     * @tc.name      Perf_UtilsMatrix_0120
     * @tc.desc      utils matrix 69,4403,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0120 begin`);
      logInfo("utils matrix 69,4403,3");
      const actual: string = calculateNum(69, 4403) + '|' + calculateSteps(4403, 3) + '|' + utilsNumAfter(3, 4403) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4472|13209|13209|0");
      expect(actual).assertEqual("4472|13209|13209|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0120 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0121
     * @tc.name      Perf_UtilsMatrix_0121
     * @tc.desc      utils matrix 70,4440,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0121 begin`);
      logInfo("utils matrix 70,4440,4");
      const actual: string = calculateNum(70, 4440) + '|' + calculateSteps(4440, 4) + '|' + utilsNumAfter(4, 4440) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4510|17760|17760|0");
      expect(actual).assertEqual("4510|17760|17760|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0121 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0122
     * @tc.name      Perf_UtilsMatrix_0122
     * @tc.desc      utils matrix 71,4477,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0122 begin`);
      logInfo("utils matrix 71,4477,5");
      const actual: string = calculateNum(71, 4477) + '|' + calculateSteps(4477, 5) + '|' + utilsNumAfter(5, 4477) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4548|22385|22385|0");
      expect(actual).assertEqual("4548|22385|22385|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0122 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0123
     * @tc.name      Perf_UtilsMatrix_0123
     * @tc.desc      utils matrix 72,4514,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0123 begin`);
      logInfo("utils matrix 72,4514,6");
      const actual: string = calculateNum(72, 4514) + '|' + calculateSteps(4514, 6) + '|' + utilsNumAfter(6, 4514) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4586|27084|27084|0");
      expect(actual).assertEqual("4586|27084|27084|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0123 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0124
     * @tc.name      Perf_UtilsMatrix_0124
     * @tc.desc      utils matrix 73,4551,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0124 begin`);
      logInfo("utils matrix 73,4551,7");
      const actual: string = calculateNum(73, 4551) + '|' + calculateSteps(4551, 7) + '|' + utilsNumAfter(7, 4551) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4624|31857|31857|0");
      expect(actual).assertEqual("4624|31857|31857|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0124 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0125
     * @tc.name      Perf_UtilsMatrix_0125
     * @tc.desc      utils matrix 74,4588,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0125 begin`);
      logInfo("utils matrix 74,4588,8");
      const actual: string = calculateNum(74, 4588) + '|' + calculateSteps(4588, 8) + '|' + utilsNumAfter(8, 4588) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4662|36704|36704|0");
      expect(actual).assertEqual("4662|36704|36704|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0125 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0126
     * @tc.name      Perf_UtilsMatrix_0126
     * @tc.desc      utils matrix 75,4625,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0126 begin`);
      logInfo("utils matrix 75,4625,9");
      const actual: string = calculateNum(75, 4625) + '|' + calculateSteps(4625, 9) + '|' + utilsNumAfter(9, 4625) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4700|41625|41625|0");
      expect(actual).assertEqual("4700|41625|41625|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0126 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0127
     * @tc.name      Perf_UtilsMatrix_0127
     * @tc.desc      utils matrix 76,4662,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0127 begin`);
      logInfo("utils matrix 76,4662,1");
      const actual: string = calculateNum(76, 4662) + '|' + calculateSteps(4662, 1) + '|' + utilsNumAfter(1, 4662) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4738|4662|4662|0");
      expect(actual).assertEqual("4738|4662|4662|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0127 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0128
     * @tc.name      Perf_UtilsMatrix_0128
     * @tc.desc      utils matrix 77,4699,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0128 begin`);
      logInfo("utils matrix 77,4699,2");
      const actual: string = calculateNum(77, 4699) + '|' + calculateSteps(4699, 2) + '|' + utilsNumAfter(2, 4699) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4776|9398|9398|0");
      expect(actual).assertEqual("4776|9398|9398|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0128 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0129
     * @tc.name      Perf_UtilsMatrix_0129
     * @tc.desc      utils matrix 78,4736,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0129 begin`);
      logInfo("utils matrix 78,4736,3");
      const actual: string = calculateNum(78, 4736) + '|' + calculateSteps(4736, 3) + '|' + utilsNumAfter(3, 4736) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4814|14208|14208|0");
      expect(actual).assertEqual("4814|14208|14208|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0129 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0130
     * @tc.name      Perf_UtilsMatrix_0130
     * @tc.desc      utils matrix 79,4773,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0130 begin`);
      logInfo("utils matrix 79,4773,4");
      const actual: string = calculateNum(79, 4773) + '|' + calculateSteps(4773, 4) + '|' + utilsNumAfter(4, 4773) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4852|19092|19092|0");
      expect(actual).assertEqual("4852|19092|19092|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0130 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0131
     * @tc.name      Perf_UtilsMatrix_0131
     * @tc.desc      utils matrix 80,4810,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0131 begin`);
      logInfo("utils matrix 80,4810,5");
      const actual: string = calculateNum(80, 4810) + '|' + calculateSteps(4810, 5) + '|' + utilsNumAfter(5, 4810) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4890|24050|24050|0");
      expect(actual).assertEqual("4890|24050|24050|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0131 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0132
     * @tc.name      Perf_UtilsMatrix_0132
     * @tc.desc      utils matrix 81,4847,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0132 begin`);
      logInfo("utils matrix 81,4847,6");
      const actual: string = calculateNum(81, 4847) + '|' + calculateSteps(4847, 6) + '|' + utilsNumAfter(6, 4847) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4928|29082|29082|0");
      expect(actual).assertEqual("4928|29082|29082|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0132 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0133
     * @tc.name      Perf_UtilsMatrix_0133
     * @tc.desc      utils matrix 82,4884,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0133 begin`);
      logInfo("utils matrix 82,4884,7");
      const actual: string = calculateNum(82, 4884) + '|' + calculateSteps(4884, 7) + '|' + utilsNumAfter(7, 4884) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "4966|34188|34188|0");
      expect(actual).assertEqual("4966|34188|34188|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0133 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0134
     * @tc.name      Perf_UtilsMatrix_0134
     * @tc.desc      utils matrix 83,4921,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0134 begin`);
      logInfo("utils matrix 83,4921,8");
      const actual: string = calculateNum(83, 4921) + '|' + calculateSteps(4921, 8) + '|' + utilsNumAfter(8, 4921) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5004|39368|39368|0");
      expect(actual).assertEqual("5004|39368|39368|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0134 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0135
     * @tc.name      Perf_UtilsMatrix_0135
     * @tc.desc      utils matrix 84,4958,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0135 begin`);
      logInfo("utils matrix 84,4958,9");
      const actual: string = calculateNum(84, 4958) + '|' + calculateSteps(4958, 9) + '|' + utilsNumAfter(9, 4958) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5042|44622|44622|0");
      expect(actual).assertEqual("5042|44622|44622|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0135 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0136
     * @tc.name      Perf_UtilsMatrix_0136
     * @tc.desc      utils matrix 85,4995,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0136 begin`);
      logInfo("utils matrix 85,4995,1");
      const actual: string = calculateNum(85, 4995) + '|' + calculateSteps(4995, 1) + '|' + utilsNumAfter(1, 4995) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5080|4995|4995|0");
      expect(actual).assertEqual("5080|4995|4995|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0136 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0137
     * @tc.name      Perf_UtilsMatrix_0137
     * @tc.desc      utils matrix 86,5032,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0137 begin`);
      logInfo("utils matrix 86,5032,2");
      const actual: string = calculateNum(86, 5032) + '|' + calculateSteps(5032, 2) + '|' + utilsNumAfter(2, 5032) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5118|10064|10064|0");
      expect(actual).assertEqual("5118|10064|10064|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0137 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0138
     * @tc.name      Perf_UtilsMatrix_0138
     * @tc.desc      utils matrix 87,5069,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0138 begin`);
      logInfo("utils matrix 87,5069,3");
      const actual: string = calculateNum(87, 5069) + '|' + calculateSteps(5069, 3) + '|' + utilsNumAfter(3, 5069) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5156|15207|15207|0");
      expect(actual).assertEqual("5156|15207|15207|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0138 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0139
     * @tc.name      Perf_UtilsMatrix_0139
     * @tc.desc      utils matrix 88,5106,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0139 begin`);
      logInfo("utils matrix 88,5106,4");
      const actual: string = calculateNum(88, 5106) + '|' + calculateSteps(5106, 4) + '|' + utilsNumAfter(4, 5106) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5194|20424|20424|0");
      expect(actual).assertEqual("5194|20424|20424|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0139 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0140
     * @tc.name      Perf_UtilsMatrix_0140
     * @tc.desc      utils matrix 89,5143,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0140 begin`);
      logInfo("utils matrix 89,5143,5");
      const actual: string = calculateNum(89, 5143) + '|' + calculateSteps(5143, 5) + '|' + utilsNumAfter(5, 5143) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5232|25715|25715|0");
      expect(actual).assertEqual("5232|25715|25715|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0140 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0141
     * @tc.name      Perf_UtilsMatrix_0141
     * @tc.desc      utils matrix 90,5180,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0141 begin`);
      logInfo("utils matrix 90,5180,6");
      const actual: string = calculateNum(90, 5180) + '|' + calculateSteps(5180, 6) + '|' + utilsNumAfter(6, 5180) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5270|31080|31080|0");
      expect(actual).assertEqual("5270|31080|31080|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0141 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0142
     * @tc.name      Perf_UtilsMatrix_0142
     * @tc.desc      utils matrix 91,5217,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0142 begin`);
      logInfo("utils matrix 91,5217,7");
      const actual: string = calculateNum(91, 5217) + '|' + calculateSteps(5217, 7) + '|' + utilsNumAfter(7, 5217) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5308|36519|36519|0");
      expect(actual).assertEqual("5308|36519|36519|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0142 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0143
     * @tc.name      Perf_UtilsMatrix_0143
     * @tc.desc      utils matrix 92,5254,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0143 begin`);
      logInfo("utils matrix 92,5254,8");
      const actual: string = calculateNum(92, 5254) + '|' + calculateSteps(5254, 8) + '|' + utilsNumAfter(8, 5254) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5346|42032|42032|0");
      expect(actual).assertEqual("5346|42032|42032|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0143 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0144
     * @tc.name      Perf_UtilsMatrix_0144
     * @tc.desc      utils matrix 93,5291,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0144 begin`);
      logInfo("utils matrix 93,5291,9");
      const actual: string = calculateNum(93, 5291) + '|' + calculateSteps(5291, 9) + '|' + utilsNumAfter(9, 5291) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5384|47619|47619|0");
      expect(actual).assertEqual("5384|47619|47619|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0144 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0145
     * @tc.name      Perf_UtilsMatrix_0145
     * @tc.desc      utils matrix 94,5328,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0145 begin`);
      logInfo("utils matrix 94,5328,1");
      const actual: string = calculateNum(94, 5328) + '|' + calculateSteps(5328, 1) + '|' + utilsNumAfter(1, 5328) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5422|5328|5328|0");
      expect(actual).assertEqual("5422|5328|5328|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0145 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0146
     * @tc.name      Perf_UtilsMatrix_0146
     * @tc.desc      utils matrix 95,5365,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0146 begin`);
      logInfo("utils matrix 95,5365,2");
      const actual: string = calculateNum(95, 5365) + '|' + calculateSteps(5365, 2) + '|' + utilsNumAfter(2, 5365) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5460|10730|10730|0");
      expect(actual).assertEqual("5460|10730|10730|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0146 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0147
     * @tc.name      Perf_UtilsMatrix_0147
     * @tc.desc      utils matrix 96,5402,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0147 begin`);
      logInfo("utils matrix 96,5402,3");
      const actual: string = calculateNum(96, 5402) + '|' + calculateSteps(5402, 3) + '|' + utilsNumAfter(3, 5402) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5498|16206|16206|0");
      expect(actual).assertEqual("5498|16206|16206|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0147 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0148
     * @tc.name      Perf_UtilsMatrix_0148
     * @tc.desc      utils matrix 97,5439,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0148 begin`);
      logInfo("utils matrix 97,5439,4");
      const actual: string = calculateNum(97, 5439) + '|' + calculateSteps(5439, 4) + '|' + utilsNumAfter(4, 5439) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5536|21756|21756|0");
      expect(actual).assertEqual("5536|21756|21756|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0148 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0149
     * @tc.name      Perf_UtilsMatrix_0149
     * @tc.desc      utils matrix 98,5476,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0149 begin`);
      logInfo("utils matrix 98,5476,5");
      const actual: string = calculateNum(98, 5476) + '|' + calculateSteps(5476, 5) + '|' + utilsNumAfter(5, 5476) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5574|27380|27380|0");
      expect(actual).assertEqual("5574|27380|27380|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0149 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0150
     * @tc.name      Perf_UtilsMatrix_0150
     * @tc.desc      utils matrix 99,5513,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0150 begin`);
      logInfo("utils matrix 99,5513,6");
      const actual: string = calculateNum(99, 5513) + '|' + calculateSteps(5513, 6) + '|' + utilsNumAfter(6, 5513) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5612|33078|33078|0");
      expect(actual).assertEqual("5612|33078|33078|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0150 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0151
     * @tc.name      Perf_UtilsMatrix_0151
     * @tc.desc      utils matrix 100,5550,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0151 begin`);
      logInfo("utils matrix 100,5550,7");
      const actual: string = calculateNum(100, 5550) + '|' + calculateSteps(5550, 7) + '|' + utilsNumAfter(7, 5550) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5650|38850|38850|0");
      expect(actual).assertEqual("5650|38850|38850|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0151 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0152
     * @tc.name      Perf_UtilsMatrix_0152
     * @tc.desc      utils matrix 101,5587,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0152 begin`);
      logInfo("utils matrix 101,5587,8");
      const actual: string = calculateNum(101, 5587) + '|' + calculateSteps(5587, 8) + '|' + utilsNumAfter(8, 5587) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5688|44696|44696|0");
      expect(actual).assertEqual("5688|44696|44696|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0152 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0153
     * @tc.name      Perf_UtilsMatrix_0153
     * @tc.desc      utils matrix 102,5624,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0153 begin`);
      logInfo("utils matrix 102,5624,9");
      const actual: string = calculateNum(102, 5624) + '|' + calculateSteps(5624, 9) + '|' + utilsNumAfter(9, 5624) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5726|50616|50616|0");
      expect(actual).assertEqual("5726|50616|50616|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0153 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0154
     * @tc.name      Perf_UtilsMatrix_0154
     * @tc.desc      utils matrix 103,5661,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0154 begin`);
      logInfo("utils matrix 103,5661,1");
      const actual: string = calculateNum(103, 5661) + '|' + calculateSteps(5661, 1) + '|' + utilsNumAfter(1, 5661) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5764|5661|5661|0");
      expect(actual).assertEqual("5764|5661|5661|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0154 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0155
     * @tc.name      Perf_UtilsMatrix_0155
     * @tc.desc      utils matrix 104,5698,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0155 begin`);
      logInfo("utils matrix 104,5698,2");
      const actual: string = calculateNum(104, 5698) + '|' + calculateSteps(5698, 2) + '|' + utilsNumAfter(2, 5698) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5802|11396|11396|0");
      expect(actual).assertEqual("5802|11396|11396|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0155 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0156
     * @tc.name      Perf_UtilsMatrix_0156
     * @tc.desc      utils matrix 105,5735,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0156 begin`);
      logInfo("utils matrix 105,5735,3");
      const actual: string = calculateNum(105, 5735) + '|' + calculateSteps(5735, 3) + '|' + utilsNumAfter(3, 5735) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5840|17205|17205|0");
      expect(actual).assertEqual("5840|17205|17205|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0156 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0157
     * @tc.name      Perf_UtilsMatrix_0157
     * @tc.desc      utils matrix 106,5772,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0157 begin`);
      logInfo("utils matrix 106,5772,4");
      const actual: string = calculateNum(106, 5772) + '|' + calculateSteps(5772, 4) + '|' + utilsNumAfter(4, 5772) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5878|23088|23088|0");
      expect(actual).assertEqual("5878|23088|23088|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0157 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0158
     * @tc.name      Perf_UtilsMatrix_0158
     * @tc.desc      utils matrix 107,5809,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0158 begin`);
      logInfo("utils matrix 107,5809,5");
      const actual: string = calculateNum(107, 5809) + '|' + calculateSteps(5809, 5) + '|' + utilsNumAfter(5, 5809) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5916|29045|29045|0");
      expect(actual).assertEqual("5916|29045|29045|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0158 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0159
     * @tc.name      Perf_UtilsMatrix_0159
     * @tc.desc      utils matrix 108,5846,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0159 begin`);
      logInfo("utils matrix 108,5846,6");
      const actual: string = calculateNum(108, 5846) + '|' + calculateSteps(5846, 6) + '|' + utilsNumAfter(6, 5846) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5954|35076|35076|0");
      expect(actual).assertEqual("5954|35076|35076|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0159 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0160
     * @tc.name      Perf_UtilsMatrix_0160
     * @tc.desc      utils matrix 109,5883,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0160 begin`);
      logInfo("utils matrix 109,5883,7");
      const actual: string = calculateNum(109, 5883) + '|' + calculateSteps(5883, 7) + '|' + utilsNumAfter(7, 5883) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "5992|41181|41181|0");
      expect(actual).assertEqual("5992|41181|41181|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0160 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0161
     * @tc.name      Perf_UtilsMatrix_0161
     * @tc.desc      utils matrix 110,5920,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0161 begin`);
      logInfo("utils matrix 110,5920,8");
      const actual: string = calculateNum(110, 5920) + '|' + calculateSteps(5920, 8) + '|' + utilsNumAfter(8, 5920) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6030|47360|47360|0");
      expect(actual).assertEqual("6030|47360|47360|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0161 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0162
     * @tc.name      Perf_UtilsMatrix_0162
     * @tc.desc      utils matrix 111,5957,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0162 begin`);
      logInfo("utils matrix 111,5957,9");
      const actual: string = calculateNum(111, 5957) + '|' + calculateSteps(5957, 9) + '|' + utilsNumAfter(9, 5957) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6068|53613|53613|0");
      expect(actual).assertEqual("6068|53613|53613|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0162 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0163
     * @tc.name      Perf_UtilsMatrix_0163
     * @tc.desc      utils matrix 112,5994,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0163 begin`);
      logInfo("utils matrix 112,5994,1");
      const actual: string = calculateNum(112, 5994) + '|' + calculateSteps(5994, 1) + '|' + utilsNumAfter(1, 5994) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6106|5994|5994|0");
      expect(actual).assertEqual("6106|5994|5994|0");
