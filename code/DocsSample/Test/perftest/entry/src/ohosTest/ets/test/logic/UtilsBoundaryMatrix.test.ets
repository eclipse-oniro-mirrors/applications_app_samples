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
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0163 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0164
     * @tc.name      Perf_UtilsMatrix_0164
     * @tc.desc      utils matrix 113,6031,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0164 begin`);
      logInfo("utils matrix 113,6031,2");
      const actual: string = calculateNum(113, 6031) + '|' + calculateSteps(6031, 2) + '|' + utilsNumAfter(2, 6031) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6144|12062|12062|0");
      expect(actual).assertEqual("6144|12062|12062|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0164 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0165
     * @tc.name      Perf_UtilsMatrix_0165
     * @tc.desc      utils matrix 114,6068,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0165 begin`);
      logInfo("utils matrix 114,6068,3");
      const actual: string = calculateNum(114, 6068) + '|' + calculateSteps(6068, 3) + '|' + utilsNumAfter(3, 6068) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6182|18204|18204|0");
      expect(actual).assertEqual("6182|18204|18204|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0165 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0166
     * @tc.name      Perf_UtilsMatrix_0166
     * @tc.desc      utils matrix 115,6105,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0166 begin`);
      logInfo("utils matrix 115,6105,4");
      const actual: string = calculateNum(115, 6105) + '|' + calculateSteps(6105, 4) + '|' + utilsNumAfter(4, 6105) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6220|24420|24420|0");
      expect(actual).assertEqual("6220|24420|24420|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0166 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0167
     * @tc.name      Perf_UtilsMatrix_0167
     * @tc.desc      utils matrix 116,6142,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0167 begin`);
      logInfo("utils matrix 116,6142,5");
      const actual: string = calculateNum(116, 6142) + '|' + calculateSteps(6142, 5) + '|' + utilsNumAfter(5, 6142) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6258|30710|30710|0");
      expect(actual).assertEqual("6258|30710|30710|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0167 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0168
     * @tc.name      Perf_UtilsMatrix_0168
     * @tc.desc      utils matrix 117,6179,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0168 begin`);
      logInfo("utils matrix 117,6179,6");
      const actual: string = calculateNum(117, 6179) + '|' + calculateSteps(6179, 6) + '|' + utilsNumAfter(6, 6179) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6296|37074|37074|0");
      expect(actual).assertEqual("6296|37074|37074|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0168 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0169
     * @tc.name      Perf_UtilsMatrix_0169
     * @tc.desc      utils matrix 118,6216,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0169 begin`);
      logInfo("utils matrix 118,6216,7");
      const actual: string = calculateNum(118, 6216) + '|' + calculateSteps(6216, 7) + '|' + utilsNumAfter(7, 6216) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6334|43512|43512|0");
      expect(actual).assertEqual("6334|43512|43512|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0169 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0170
     * @tc.name      Perf_UtilsMatrix_0170
     * @tc.desc      utils matrix 119,6253,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0170 begin`);
      logInfo("utils matrix 119,6253,8");
      const actual: string = calculateNum(119, 6253) + '|' + calculateSteps(6253, 8) + '|' + utilsNumAfter(8, 6253) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6372|50024|50024|0");
      expect(actual).assertEqual("6372|50024|50024|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0170 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0171
     * @tc.name      Perf_UtilsMatrix_0171
     * @tc.desc      utils matrix 120,6290,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0171 begin`);
      logInfo("utils matrix 120,6290,9");
      const actual: string = calculateNum(120, 6290) + '|' + calculateSteps(6290, 9) + '|' + utilsNumAfter(9, 6290) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6410|56610|56610|0");
      expect(actual).assertEqual("6410|56610|56610|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0171 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0172
     * @tc.name      Perf_UtilsMatrix_0172
     * @tc.desc      utils matrix 121,6327,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0172 begin`);
      logInfo("utils matrix 121,6327,1");
      const actual: string = calculateNum(121, 6327) + '|' + calculateSteps(6327, 1) + '|' + utilsNumAfter(1, 6327) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6448|6327|6327|0");
      expect(actual).assertEqual("6448|6327|6327|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0172 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0173
     * @tc.name      Perf_UtilsMatrix_0173
     * @tc.desc      utils matrix 122,6364,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0173 begin`);
      logInfo("utils matrix 122,6364,2");
      const actual: string = calculateNum(122, 6364) + '|' + calculateSteps(6364, 2) + '|' + utilsNumAfter(2, 6364) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6486|12728|12728|0");
      expect(actual).assertEqual("6486|12728|12728|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0173 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0174
     * @tc.name      Perf_UtilsMatrix_0174
     * @tc.desc      utils matrix 123,6401,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0174 begin`);
      logInfo("utils matrix 123,6401,3");
      const actual: string = calculateNum(123, 6401) + '|' + calculateSteps(6401, 3) + '|' + utilsNumAfter(3, 6401) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6524|19203|19203|0");
      expect(actual).assertEqual("6524|19203|19203|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0174 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0175
     * @tc.name      Perf_UtilsMatrix_0175
     * @tc.desc      utils matrix 124,6438,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0175 begin`);
      logInfo("utils matrix 124,6438,4");
      const actual: string = calculateNum(124, 6438) + '|' + calculateSteps(6438, 4) + '|' + utilsNumAfter(4, 6438) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6562|25752|25752|0");
      expect(actual).assertEqual("6562|25752|25752|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0175 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0176
     * @tc.name      Perf_UtilsMatrix_0176
     * @tc.desc      utils matrix 125,6475,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0176 begin`);
      logInfo("utils matrix 125,6475,5");
      const actual: string = calculateNum(125, 6475) + '|' + calculateSteps(6475, 5) + '|' + utilsNumAfter(5, 6475) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6600|32375|32375|0");
      expect(actual).assertEqual("6600|32375|32375|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0176 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0177
     * @tc.name      Perf_UtilsMatrix_0177
     * @tc.desc      utils matrix 126,6512,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0177 begin`);
      logInfo("utils matrix 126,6512,6");
      const actual: string = calculateNum(126, 6512) + '|' + calculateSteps(6512, 6) + '|' + utilsNumAfter(6, 6512) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6638|39072|39072|0");
      expect(actual).assertEqual("6638|39072|39072|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0177 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0178
     * @tc.name      Perf_UtilsMatrix_0178
     * @tc.desc      utils matrix 127,6549,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0178 begin`);
      logInfo("utils matrix 127,6549,7");
      const actual: string = calculateNum(127, 6549) + '|' + calculateSteps(6549, 7) + '|' + utilsNumAfter(7, 6549) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6676|45843|45843|0");
      expect(actual).assertEqual("6676|45843|45843|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0178 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0179
     * @tc.name      Perf_UtilsMatrix_0179
     * @tc.desc      utils matrix 128,6586,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0179 begin`);
      logInfo("utils matrix 128,6586,8");
      const actual: string = calculateNum(128, 6586) + '|' + calculateSteps(6586, 8) + '|' + utilsNumAfter(8, 6586) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6714|52688|52688|0");
      expect(actual).assertEqual("6714|52688|52688|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0179 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0180
     * @tc.name      Perf_UtilsMatrix_0180
     * @tc.desc      utils matrix 129,6623,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0180 begin`);
      logInfo("utils matrix 129,6623,9");
      const actual: string = calculateNum(129, 6623) + '|' + calculateSteps(6623, 9) + '|' + utilsNumAfter(9, 6623) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6752|59607|59607|0");
      expect(actual).assertEqual("6752|59607|59607|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0180 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0181
     * @tc.name      Perf_UtilsMatrix_0181
     * @tc.desc      utils matrix 130,6660,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0181 begin`);
      logInfo("utils matrix 130,6660,1");
      const actual: string = calculateNum(130, 6660) + '|' + calculateSteps(6660, 1) + '|' + utilsNumAfter(1, 6660) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6790|6660|6660|0");
      expect(actual).assertEqual("6790|6660|6660|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0181 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0182
     * @tc.name      Perf_UtilsMatrix_0182
     * @tc.desc      utils matrix 131,6697,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0182 begin`);
      logInfo("utils matrix 131,6697,2");
      const actual: string = calculateNum(131, 6697) + '|' + calculateSteps(6697, 2) + '|' + utilsNumAfter(2, 6697) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6828|13394|13394|0");
      expect(actual).assertEqual("6828|13394|13394|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0182 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0183
     * @tc.name      Perf_UtilsMatrix_0183
     * @tc.desc      utils matrix 132,6734,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0183 begin`);
      logInfo("utils matrix 132,6734,3");
      const actual: string = calculateNum(132, 6734) + '|' + calculateSteps(6734, 3) + '|' + utilsNumAfter(3, 6734) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6866|20202|20202|0");
      expect(actual).assertEqual("6866|20202|20202|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0183 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0184
     * @tc.name      Perf_UtilsMatrix_0184
     * @tc.desc      utils matrix 133,6771,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0184 begin`);
      logInfo("utils matrix 133,6771,4");
      const actual: string = calculateNum(133, 6771) + '|' + calculateSteps(6771, 4) + '|' + utilsNumAfter(4, 6771) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6904|27084|27084|0");
      expect(actual).assertEqual("6904|27084|27084|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0184 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0185
     * @tc.name      Perf_UtilsMatrix_0185
     * @tc.desc      utils matrix 134,6808,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0185 begin`);
      logInfo("utils matrix 134,6808,5");
      const actual: string = calculateNum(134, 6808) + '|' + calculateSteps(6808, 5) + '|' + utilsNumAfter(5, 6808) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6942|34040|34040|0");
      expect(actual).assertEqual("6942|34040|34040|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0185 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0186
     * @tc.name      Perf_UtilsMatrix_0186
     * @tc.desc      utils matrix 135,6845,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0186 begin`);
      logInfo("utils matrix 135,6845,6");
      const actual: string = calculateNum(135, 6845) + '|' + calculateSteps(6845, 6) + '|' + utilsNumAfter(6, 6845) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "6980|41070|41070|0");
      expect(actual).assertEqual("6980|41070|41070|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0186 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0187
     * @tc.name      Perf_UtilsMatrix_0187
     * @tc.desc      utils matrix 136,6882,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0187 begin`);
      logInfo("utils matrix 136,6882,7");
      const actual: string = calculateNum(136, 6882) + '|' + calculateSteps(6882, 7) + '|' + utilsNumAfter(7, 6882) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7018|48174|48174|0");
      expect(actual).assertEqual("7018|48174|48174|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0187 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0188
     * @tc.name      Perf_UtilsMatrix_0188
     * @tc.desc      utils matrix 137,6919,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0188 begin`);
      logInfo("utils matrix 137,6919,8");
      const actual: string = calculateNum(137, 6919) + '|' + calculateSteps(6919, 8) + '|' + utilsNumAfter(8, 6919) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7056|55352|55352|0");
      expect(actual).assertEqual("7056|55352|55352|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0188 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0189
     * @tc.name      Perf_UtilsMatrix_0189
     * @tc.desc      utils matrix 138,6956,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0189 begin`);
      logInfo("utils matrix 138,6956,9");
      const actual: string = calculateNum(138, 6956) + '|' + calculateSteps(6956, 9) + '|' + utilsNumAfter(9, 6956) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7094|62604|62604|0");
      expect(actual).assertEqual("7094|62604|62604|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0189 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0190
     * @tc.name      Perf_UtilsMatrix_0190
     * @tc.desc      utils matrix 139,6993,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0190 begin`);
      logInfo("utils matrix 139,6993,1");
      const actual: string = calculateNum(139, 6993) + '|' + calculateSteps(6993, 1) + '|' + utilsNumAfter(1, 6993) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7132|6993|6993|0");
      expect(actual).assertEqual("7132|6993|6993|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0190 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0191
     * @tc.name      Perf_UtilsMatrix_0191
     * @tc.desc      utils matrix 140,7030,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0191 begin`);
      logInfo("utils matrix 140,7030,2");
      const actual: string = calculateNum(140, 7030) + '|' + calculateSteps(7030, 2) + '|' + utilsNumAfter(2, 7030) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7170|14060|14060|0");
      expect(actual).assertEqual("7170|14060|14060|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0191 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0192
     * @tc.name      Perf_UtilsMatrix_0192
     * @tc.desc      utils matrix 141,7067,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0192 begin`);
      logInfo("utils matrix 141,7067,3");
      const actual: string = calculateNum(141, 7067) + '|' + calculateSteps(7067, 3) + '|' + utilsNumAfter(3, 7067) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7208|21201|21201|0");
      expect(actual).assertEqual("7208|21201|21201|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0192 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0193
     * @tc.name      Perf_UtilsMatrix_0193
     * @tc.desc      utils matrix 142,7104,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0193 begin`);
      logInfo("utils matrix 142,7104,4");
      const actual: string = calculateNum(142, 7104) + '|' + calculateSteps(7104, 4) + '|' + utilsNumAfter(4, 7104) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7246|28416|28416|0");
      expect(actual).assertEqual("7246|28416|28416|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0193 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0194
     * @tc.name      Perf_UtilsMatrix_0194
     * @tc.desc      utils matrix 143,7141,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0194 begin`);
      logInfo("utils matrix 143,7141,5");
      const actual: string = calculateNum(143, 7141) + '|' + calculateSteps(7141, 5) + '|' + utilsNumAfter(5, 7141) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7284|35705|35705|0");
      expect(actual).assertEqual("7284|35705|35705|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0194 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0195
     * @tc.name      Perf_UtilsMatrix_0195
     * @tc.desc      utils matrix 144,7178,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0195 begin`);
      logInfo("utils matrix 144,7178,6");
      const actual: string = calculateNum(144, 7178) + '|' + calculateSteps(7178, 6) + '|' + utilsNumAfter(6, 7178) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7322|43068|43068|0");
      expect(actual).assertEqual("7322|43068|43068|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0195 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0196
     * @tc.name      Perf_UtilsMatrix_0196
     * @tc.desc      utils matrix 145,7215,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0196 begin`);
      logInfo("utils matrix 145,7215,7");
      const actual: string = calculateNum(145, 7215) + '|' + calculateSteps(7215, 7) + '|' + utilsNumAfter(7, 7215) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7360|50505|50505|0");
      expect(actual).assertEqual("7360|50505|50505|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0196 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0197
     * @tc.name      Perf_UtilsMatrix_0197
     * @tc.desc      utils matrix 146,7252,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0197 begin`);
      logInfo("utils matrix 146,7252,8");
      const actual: string = calculateNum(146, 7252) + '|' + calculateSteps(7252, 8) + '|' + utilsNumAfter(8, 7252) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7398|58016|58016|0");
      expect(actual).assertEqual("7398|58016|58016|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0197 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0198
     * @tc.name      Perf_UtilsMatrix_0198
     * @tc.desc      utils matrix 147,7289,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0198 begin`);
      logInfo("utils matrix 147,7289,9");
      const actual: string = calculateNum(147, 7289) + '|' + calculateSteps(7289, 9) + '|' + utilsNumAfter(9, 7289) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7436|65601|65601|0");
      expect(actual).assertEqual("7436|65601|65601|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0198 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0199
     * @tc.name      Perf_UtilsMatrix_0199
     * @tc.desc      utils matrix 148,7326,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0199 begin`);
      logInfo("utils matrix 148,7326,1");
      const actual: string = calculateNum(148, 7326) + '|' + calculateSteps(7326, 1) + '|' + utilsNumAfter(1, 7326) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7474|7326|7326|0");
      expect(actual).assertEqual("7474|7326|7326|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0199 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0200
     * @tc.name      Perf_UtilsMatrix_0200
     * @tc.desc      utils matrix 149,7363,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0200 begin`);
      logInfo("utils matrix 149,7363,2");
      const actual: string = calculateNum(149, 7363) + '|' + calculateSteps(7363, 2) + '|' + utilsNumAfter(2, 7363) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7512|14726|14726|0");
      expect(actual).assertEqual("7512|14726|14726|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0200 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0201
     * @tc.name      Perf_UtilsMatrix_0201
     * @tc.desc      utils matrix 150,7400,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0201 begin`);
      logInfo("utils matrix 150,7400,3");
      const actual: string = calculateNum(150, 7400) + '|' + calculateSteps(7400, 3) + '|' + utilsNumAfter(3, 7400) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7550|22200|22200|0");
      expect(actual).assertEqual("7550|22200|22200|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0201 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0202
     * @tc.name      Perf_UtilsMatrix_0202
     * @tc.desc      utils matrix 151,7437,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0202 begin`);
      logInfo("utils matrix 151,7437,4");
      const actual: string = calculateNum(151, 7437) + '|' + calculateSteps(7437, 4) + '|' + utilsNumAfter(4, 7437) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7588|29748|29748|0");
      expect(actual).assertEqual("7588|29748|29748|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0202 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0203
     * @tc.name      Perf_UtilsMatrix_0203
     * @tc.desc      utils matrix 152,7474,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0203 begin`);
      logInfo("utils matrix 152,7474,5");
      const actual: string = calculateNum(152, 7474) + '|' + calculateSteps(7474, 5) + '|' + utilsNumAfter(5, 7474) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7626|37370|37370|0");
      expect(actual).assertEqual("7626|37370|37370|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0203 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0204
     * @tc.name      Perf_UtilsMatrix_0204
     * @tc.desc      utils matrix 153,7511,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0204 begin`);
      logInfo("utils matrix 153,7511,6");
      const actual: string = calculateNum(153, 7511) + '|' + calculateSteps(7511, 6) + '|' + utilsNumAfter(6, 7511) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7664|45066|45066|0");
      expect(actual).assertEqual("7664|45066|45066|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0204 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0205
     * @tc.name      Perf_UtilsMatrix_0205
     * @tc.desc      utils matrix 154,7548,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0205 begin`);
      logInfo("utils matrix 154,7548,7");
      const actual: string = calculateNum(154, 7548) + '|' + calculateSteps(7548, 7) + '|' + utilsNumAfter(7, 7548) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7702|52836|52836|0");
      expect(actual).assertEqual("7702|52836|52836|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0205 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0206
     * @tc.name      Perf_UtilsMatrix_0206
     * @tc.desc      utils matrix 155,7585,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0206 begin`);
      logInfo("utils matrix 155,7585,8");
      const actual: string = calculateNum(155, 7585) + '|' + calculateSteps(7585, 8) + '|' + utilsNumAfter(8, 7585) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7740|60680|60680|0");
      expect(actual).assertEqual("7740|60680|60680|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0206 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0207
     * @tc.name      Perf_UtilsMatrix_0207
     * @tc.desc      utils matrix 156,7622,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0207 begin`);
      logInfo("utils matrix 156,7622,9");
      const actual: string = calculateNum(156, 7622) + '|' + calculateSteps(7622, 9) + '|' + utilsNumAfter(9, 7622) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7778|68598|68598|0");
      expect(actual).assertEqual("7778|68598|68598|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0207 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0208
     * @tc.name      Perf_UtilsMatrix_0208
     * @tc.desc      utils matrix 157,7659,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0208 begin`);
      logInfo("utils matrix 157,7659,1");
      const actual: string = calculateNum(157, 7659) + '|' + calculateSteps(7659, 1) + '|' + utilsNumAfter(1, 7659) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7816|7659|7659|0");
      expect(actual).assertEqual("7816|7659|7659|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0208 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0209
     * @tc.name      Perf_UtilsMatrix_0209
     * @tc.desc      utils matrix 158,7696,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0209 begin`);
      logInfo("utils matrix 158,7696,2");
      const actual: string = calculateNum(158, 7696) + '|' + calculateSteps(7696, 2) + '|' + utilsNumAfter(2, 7696) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7854|15392|15392|0");
      expect(actual).assertEqual("7854|15392|15392|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0209 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0210
     * @tc.name      Perf_UtilsMatrix_0210
     * @tc.desc      utils matrix 159,7733,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0210 begin`);
      logInfo("utils matrix 159,7733,3");
      const actual: string = calculateNum(159, 7733) + '|' + calculateSteps(7733, 3) + '|' + utilsNumAfter(3, 7733) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7892|23199|23199|0");
      expect(actual).assertEqual("7892|23199|23199|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0210 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0211
     * @tc.name      Perf_UtilsMatrix_0211
     * @tc.desc      utils matrix 160,7770,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0211 begin`);
      logInfo("utils matrix 160,7770,4");
      const actual: string = calculateNum(160, 7770) + '|' + calculateSteps(7770, 4) + '|' + utilsNumAfter(4, 7770) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7930|31080|31080|0");
      expect(actual).assertEqual("7930|31080|31080|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0211 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0212
     * @tc.name      Perf_UtilsMatrix_0212
     * @tc.desc      utils matrix 161,7807,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0212 begin`);
      logInfo("utils matrix 161,7807,5");
      const actual: string = calculateNum(161, 7807) + '|' + calculateSteps(7807, 5) + '|' + utilsNumAfter(5, 7807) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "7968|39035|39035|0");
      expect(actual).assertEqual("7968|39035|39035|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0212 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0213
     * @tc.name      Perf_UtilsMatrix_0213
     * @tc.desc      utils matrix 162,7844,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0213 begin`);
      logInfo("utils matrix 162,7844,6");
      const actual: string = calculateNum(162, 7844) + '|' + calculateSteps(7844, 6) + '|' + utilsNumAfter(6, 7844) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8006|47064|47064|0");
      expect(actual).assertEqual("8006|47064|47064|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0213 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0214
     * @tc.name      Perf_UtilsMatrix_0214
     * @tc.desc      utils matrix 163,7881,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0214 begin`);
      logInfo("utils matrix 163,7881,7");
      const actual: string = calculateNum(163, 7881) + '|' + calculateSteps(7881, 7) + '|' + utilsNumAfter(7, 7881) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8044|55167|55167|0");
      expect(actual).assertEqual("8044|55167|55167|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0214 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0215
     * @tc.name      Perf_UtilsMatrix_0215
     * @tc.desc      utils matrix 164,7918,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0215 begin`);
      logInfo("utils matrix 164,7918,8");
      const actual: string = calculateNum(164, 7918) + '|' + calculateSteps(7918, 8) + '|' + utilsNumAfter(8, 7918) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8082|63344|63344|0");
      expect(actual).assertEqual("8082|63344|63344|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0215 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0216
     * @tc.name      Perf_UtilsMatrix_0216
     * @tc.desc      utils matrix 165,7955,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0216 begin`);
      logInfo("utils matrix 165,7955,9");
      const actual: string = calculateNum(165, 7955) + '|' + calculateSteps(7955, 9) + '|' + utilsNumAfter(9, 7955) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8120|71595|71595|0");
      expect(actual).assertEqual("8120|71595|71595|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0216 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0217
     * @tc.name      Perf_UtilsMatrix_0217
     * @tc.desc      utils matrix 166,7992,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0217 begin`);
      logInfo("utils matrix 166,7992,1");
      const actual: string = calculateNum(166, 7992) + '|' + calculateSteps(7992, 1) + '|' + utilsNumAfter(1, 7992) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8158|7992|7992|0");
      expect(actual).assertEqual("8158|7992|7992|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0217 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0218
     * @tc.name      Perf_UtilsMatrix_0218
     * @tc.desc      utils matrix 167,8029,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0218 begin`);
      logInfo("utils matrix 167,8029,2");
      const actual: string = calculateNum(167, 8029) + '|' + calculateSteps(8029, 2) + '|' + utilsNumAfter(2, 8029) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8196|16058|16058|0");
      expect(actual).assertEqual("8196|16058|16058|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0218 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0219
     * @tc.name      Perf_UtilsMatrix_0219
     * @tc.desc      utils matrix 168,8066,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0219 begin`);
      logInfo("utils matrix 168,8066,3");
      const actual: string = calculateNum(168, 8066) + '|' + calculateSteps(8066, 3) + '|' + utilsNumAfter(3, 8066) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8234|24198|24198|0");
      expect(actual).assertEqual("8234|24198|24198|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0219 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0220
     * @tc.name      Perf_UtilsMatrix_0220
     * @tc.desc      utils matrix 169,8103,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0220 begin`);
      logInfo("utils matrix 169,8103,4");
      const actual: string = calculateNum(169, 8103) + '|' + calculateSteps(8103, 4) + '|' + utilsNumAfter(4, 8103) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8272|32412|32412|0");
      expect(actual).assertEqual("8272|32412|32412|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0220 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0221
     * @tc.name      Perf_UtilsMatrix_0221
     * @tc.desc      utils matrix 170,8140,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0221 begin`);
      logInfo("utils matrix 170,8140,5");
      const actual: string = calculateNum(170, 8140) + '|' + calculateSteps(8140, 5) + '|' + utilsNumAfter(5, 8140) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8310|40700|40700|0");
      expect(actual).assertEqual("8310|40700|40700|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0221 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0222
     * @tc.name      Perf_UtilsMatrix_0222
     * @tc.desc      utils matrix 171,8177,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0222 begin`);
      logInfo("utils matrix 171,8177,6");
      const actual: string = calculateNum(171, 8177) + '|' + calculateSteps(8177, 6) + '|' + utilsNumAfter(6, 8177) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8348|49062|49062|0");
      expect(actual).assertEqual("8348|49062|49062|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0222 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0223
     * @tc.name      Perf_UtilsMatrix_0223
     * @tc.desc      utils matrix 172,8214,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0223 begin`);
      logInfo("utils matrix 172,8214,7");
      const actual: string = calculateNum(172, 8214) + '|' + calculateSteps(8214, 7) + '|' + utilsNumAfter(7, 8214) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8386|57498|57498|0");
      expect(actual).assertEqual("8386|57498|57498|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0223 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0224
     * @tc.name      Perf_UtilsMatrix_0224
     * @tc.desc      utils matrix 173,8251,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0224 begin`);
      logInfo("utils matrix 173,8251,8");
      const actual: string = calculateNum(173, 8251) + '|' + calculateSteps(8251, 8) + '|' + utilsNumAfter(8, 8251) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8424|66008|66008|0");
      expect(actual).assertEqual("8424|66008|66008|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0224 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0225
     * @tc.name      Perf_UtilsMatrix_0225
     * @tc.desc      utils matrix 174,8288,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0225 begin`);
      logInfo("utils matrix 174,8288,9");
      const actual: string = calculateNum(174, 8288) + '|' + calculateSteps(8288, 9) + '|' + utilsNumAfter(9, 8288) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8462|74592|74592|0");
      expect(actual).assertEqual("8462|74592|74592|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0225 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0226
     * @tc.name      Perf_UtilsMatrix_0226
     * @tc.desc      utils matrix 175,8325,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0226 begin`);
      logInfo("utils matrix 175,8325,1");
      const actual: string = calculateNum(175, 8325) + '|' + calculateSteps(8325, 1) + '|' + utilsNumAfter(1, 8325) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8500|8325|8325|0");
      expect(actual).assertEqual("8500|8325|8325|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0226 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0227
     * @tc.name      Perf_UtilsMatrix_0227
     * @tc.desc      utils matrix 176,8362,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0227 begin`);
      logInfo("utils matrix 176,8362,2");
      const actual: string = calculateNum(176, 8362) + '|' + calculateSteps(8362, 2) + '|' + utilsNumAfter(2, 8362) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8538|16724|16724|0");
      expect(actual).assertEqual("8538|16724|16724|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0227 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0228
     * @tc.name      Perf_UtilsMatrix_0228
     * @tc.desc      utils matrix 177,8399,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0228 begin`);
      logInfo("utils matrix 177,8399,3");
      const actual: string = calculateNum(177, 8399) + '|' + calculateSteps(8399, 3) + '|' + utilsNumAfter(3, 8399) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8576|25197|25197|0");
      expect(actual).assertEqual("8576|25197|25197|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0228 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0229
     * @tc.name      Perf_UtilsMatrix_0229
     * @tc.desc      utils matrix 178,8436,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0229 begin`);
      logInfo("utils matrix 178,8436,4");
      const actual: string = calculateNum(178, 8436) + '|' + calculateSteps(8436, 4) + '|' + utilsNumAfter(4, 8436) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8614|33744|33744|0");
      expect(actual).assertEqual("8614|33744|33744|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0229 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0230
     * @tc.name      Perf_UtilsMatrix_0230
     * @tc.desc      utils matrix 179,8473,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0230 begin`);
      logInfo("utils matrix 179,8473,5");
      const actual: string = calculateNum(179, 8473) + '|' + calculateSteps(8473, 5) + '|' + utilsNumAfter(5, 8473) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8652|42365|42365|0");
      expect(actual).assertEqual("8652|42365|42365|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0230 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0231
     * @tc.name      Perf_UtilsMatrix_0231
     * @tc.desc      utils matrix 180,8510,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0231 begin`);
      logInfo("utils matrix 180,8510,6");
      const actual: string = calculateNum(180, 8510) + '|' + calculateSteps(8510, 6) + '|' + utilsNumAfter(6, 8510) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8690|51060|51060|0");
      expect(actual).assertEqual("8690|51060|51060|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0231 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0232
     * @tc.name      Perf_UtilsMatrix_0232
     * @tc.desc      utils matrix 181,8547,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0232 begin`);
      logInfo("utils matrix 181,8547,7");
      const actual: string = calculateNum(181, 8547) + '|' + calculateSteps(8547, 7) + '|' + utilsNumAfter(7, 8547) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8728|59829|59829|0");
      expect(actual).assertEqual("8728|59829|59829|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0232 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0233
     * @tc.name      Perf_UtilsMatrix_0233
     * @tc.desc      utils matrix 182,8584,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0233 begin`);
      logInfo("utils matrix 182,8584,8");
      const actual: string = calculateNum(182, 8584) + '|' + calculateSteps(8584, 8) + '|' + utilsNumAfter(8, 8584) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8766|68672|68672|0");
      expect(actual).assertEqual("8766|68672|68672|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0233 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0234
     * @tc.name      Perf_UtilsMatrix_0234
     * @tc.desc      utils matrix 183,8621,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0234 begin`);
      logInfo("utils matrix 183,8621,9");
      const actual: string = calculateNum(183, 8621) + '|' + calculateSteps(8621, 9) + '|' + utilsNumAfter(9, 8621) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8804|77589|77589|0");
      expect(actual).assertEqual("8804|77589|77589|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0234 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0235
     * @tc.name      Perf_UtilsMatrix_0235
     * @tc.desc      utils matrix 184,8658,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0235 begin`);
      logInfo("utils matrix 184,8658,1");
      const actual: string = calculateNum(184, 8658) + '|' + calculateSteps(8658, 1) + '|' + utilsNumAfter(1, 8658) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8842|8658|8658|0");
      expect(actual).assertEqual("8842|8658|8658|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0235 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0236
     * @tc.name      Perf_UtilsMatrix_0236
     * @tc.desc      utils matrix 185,8695,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0236 begin`);
      logInfo("utils matrix 185,8695,2");
      const actual: string = calculateNum(185, 8695) + '|' + calculateSteps(8695, 2) + '|' + utilsNumAfter(2, 8695) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8880|17390|17390|0");
      expect(actual).assertEqual("8880|17390|17390|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0236 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0237
     * @tc.name      Perf_UtilsMatrix_0237
     * @tc.desc      utils matrix 186,8732,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0237 begin`);
      logInfo("utils matrix 186,8732,3");
      const actual: string = calculateNum(186, 8732) + '|' + calculateSteps(8732, 3) + '|' + utilsNumAfter(3, 8732) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8918|26196|26196|0");
      expect(actual).assertEqual("8918|26196|26196|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0237 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0238
     * @tc.name      Perf_UtilsMatrix_0238
     * @tc.desc      utils matrix 187,8769,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0238 begin`);
      logInfo("utils matrix 187,8769,4");
      const actual: string = calculateNum(187, 8769) + '|' + calculateSteps(8769, 4) + '|' + utilsNumAfter(4, 8769) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8956|35076|35076|0");
      expect(actual).assertEqual("8956|35076|35076|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0238 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0239
     * @tc.name      Perf_UtilsMatrix_0239
     * @tc.desc      utils matrix 188,8806,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0239 begin`);
      logInfo("utils matrix 188,8806,5");
      const actual: string = calculateNum(188, 8806) + '|' + calculateSteps(8806, 5) + '|' + utilsNumAfter(5, 8806) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "8994|44030|44030|0");
      expect(actual).assertEqual("8994|44030|44030|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0239 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0240
     * @tc.name      Perf_UtilsMatrix_0240
     * @tc.desc      utils matrix 189,8843,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0240 begin`);
      logInfo("utils matrix 189,8843,6");
      const actual: string = calculateNum(189, 8843) + '|' + calculateSteps(8843, 6) + '|' + utilsNumAfter(6, 8843) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9032|53058|53058|0");
      expect(actual).assertEqual("9032|53058|53058|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0240 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0241
     * @tc.name      Perf_UtilsMatrix_0241
     * @tc.desc      utils matrix 190,8880,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0241 begin`);
      logInfo("utils matrix 190,8880,7");
      const actual: string = calculateNum(190, 8880) + '|' + calculateSteps(8880, 7) + '|' + utilsNumAfter(7, 8880) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9070|62160|62160|0");
      expect(actual).assertEqual("9070|62160|62160|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0241 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0242
     * @tc.name      Perf_UtilsMatrix_0242
     * @tc.desc      utils matrix 191,8917,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0242 begin`);
      logInfo("utils matrix 191,8917,8");
      const actual: string = calculateNum(191, 8917) + '|' + calculateSteps(8917, 8) + '|' + utilsNumAfter(8, 8917) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9108|71336|71336|0");
      expect(actual).assertEqual("9108|71336|71336|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0242 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0243
     * @tc.name      Perf_UtilsMatrix_0243
     * @tc.desc      utils matrix 192,8954,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0243 begin`);
      logInfo("utils matrix 192,8954,9");
      const actual: string = calculateNum(192, 8954) + '|' + calculateSteps(8954, 9) + '|' + utilsNumAfter(9, 8954) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9146|80586|80586|0");
      expect(actual).assertEqual("9146|80586|80586|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0243 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0244
     * @tc.name      Perf_UtilsMatrix_0244
     * @tc.desc      utils matrix 193,8991,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0244 begin`);
      logInfo("utils matrix 193,8991,1");
      const actual: string = calculateNum(193, 8991) + '|' + calculateSteps(8991, 1) + '|' + utilsNumAfter(1, 8991) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9184|8991|8991|0");
      expect(actual).assertEqual("9184|8991|8991|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0244 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0245
     * @tc.name      Perf_UtilsMatrix_0245
     * @tc.desc      utils matrix 194,9028,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0245 begin`);
      logInfo("utils matrix 194,9028,2");
      const actual: string = calculateNum(194, 9028) + '|' + calculateSteps(9028, 2) + '|' + utilsNumAfter(2, 9028) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9222|18056|18056|0");
      expect(actual).assertEqual("9222|18056|18056|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0245 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0246
     * @tc.name      Perf_UtilsMatrix_0246
     * @tc.desc      utils matrix 195,9065,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0246 begin`);
      logInfo("utils matrix 195,9065,3");
      const actual: string = calculateNum(195, 9065) + '|' + calculateSteps(9065, 3) + '|' + utilsNumAfter(3, 9065) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9260|27195|27195|0");
      expect(actual).assertEqual("9260|27195|27195|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0246 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0247
     * @tc.name      Perf_UtilsMatrix_0247
     * @tc.desc      utils matrix 196,9102,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0247 begin`);
      logInfo("utils matrix 196,9102,4");
      const actual: string = calculateNum(196, 9102) + '|' + calculateSteps(9102, 4) + '|' + utilsNumAfter(4, 9102) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9298|36408|36408|0");
      expect(actual).assertEqual("9298|36408|36408|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0247 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0248
     * @tc.name      Perf_UtilsMatrix_0248
     * @tc.desc      utils matrix 197,9139,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0248 begin`);
      logInfo("utils matrix 197,9139,5");
      const actual: string = calculateNum(197, 9139) + '|' + calculateSteps(9139, 5) + '|' + utilsNumAfter(5, 9139) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9336|45695|45695|0");
      expect(actual).assertEqual("9336|45695|45695|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0248 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0249
     * @tc.name      Perf_UtilsMatrix_0249
     * @tc.desc      utils matrix 198,9176,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0249 begin`);
      logInfo("utils matrix 198,9176,6");
      const actual: string = calculateNum(198, 9176) + '|' + calculateSteps(9176, 6) + '|' + utilsNumAfter(6, 9176) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9374|55056|55056|0");
      expect(actual).assertEqual("9374|55056|55056|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0249 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0250
     * @tc.name      Perf_UtilsMatrix_0250
     * @tc.desc      utils matrix 199,9213,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0250 begin`);
      logInfo("utils matrix 199,9213,7");
      const actual: string = calculateNum(199, 9213) + '|' + calculateSteps(9213, 7) + '|' + utilsNumAfter(7, 9213) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9412|64491|64491|0");
      expect(actual).assertEqual("9412|64491|64491|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0250 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0251
     * @tc.name      Perf_UtilsMatrix_0251
     * @tc.desc      utils matrix 200,9250,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0251 begin`);
      logInfo("utils matrix 200,9250,8");
      const actual: string = calculateNum(200, 9250) + '|' + calculateSteps(9250, 8) + '|' + utilsNumAfter(8, 9250) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9450|74000|74000|0");
      expect(actual).assertEqual("9450|74000|74000|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0251 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0252
     * @tc.name      Perf_UtilsMatrix_0252
     * @tc.desc      utils matrix 201,9287,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0252 begin`);
      logInfo("utils matrix 201,9287,9");
      const actual: string = calculateNum(201, 9287) + '|' + calculateSteps(9287, 9) + '|' + utilsNumAfter(9, 9287) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9488|83583|83583|0");
      expect(actual).assertEqual("9488|83583|83583|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0252 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0253
     * @tc.name      Perf_UtilsMatrix_0253
     * @tc.desc      utils matrix 202,9324,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0253 begin`);
      logInfo("utils matrix 202,9324,1");
      const actual: string = calculateNum(202, 9324) + '|' + calculateSteps(9324, 1) + '|' + utilsNumAfter(1, 9324) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9526|9324|9324|0");
      expect(actual).assertEqual("9526|9324|9324|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0253 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0254
     * @tc.name      Perf_UtilsMatrix_0254
     * @tc.desc      utils matrix 203,9361,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0254 begin`);
      logInfo("utils matrix 203,9361,2");
      const actual: string = calculateNum(203, 9361) + '|' + calculateSteps(9361, 2) + '|' + utilsNumAfter(2, 9361) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9564|18722|18722|0");
      expect(actual).assertEqual("9564|18722|18722|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0254 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0255
     * @tc.name      Perf_UtilsMatrix_0255
     * @tc.desc      utils matrix 204,9398,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0255 begin`);
      logInfo("utils matrix 204,9398,3");
      const actual: string = calculateNum(204, 9398) + '|' + calculateSteps(9398, 3) + '|' + utilsNumAfter(3, 9398) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9602|28194|28194|0");
      expect(actual).assertEqual("9602|28194|28194|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0255 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0256
     * @tc.name      Perf_UtilsMatrix_0256
     * @tc.desc      utils matrix 205,9435,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0256 begin`);
      logInfo("utils matrix 205,9435,4");
      const actual: string = calculateNum(205, 9435) + '|' + calculateSteps(9435, 4) + '|' + utilsNumAfter(4, 9435) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9640|37740|37740|0");
      expect(actual).assertEqual("9640|37740|37740|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0256 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0257
     * @tc.name      Perf_UtilsMatrix_0257
     * @tc.desc      utils matrix 206,9472,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0257 begin`);
      logInfo("utils matrix 206,9472,5");
      const actual: string = calculateNum(206, 9472) + '|' + calculateSteps(9472, 5) + '|' + utilsNumAfter(5, 9472) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9678|47360|47360|0");
      expect(actual).assertEqual("9678|47360|47360|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0257 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0258
     * @tc.name      Perf_UtilsMatrix_0258
     * @tc.desc      utils matrix 207,9509,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0258 begin`);
      logInfo("utils matrix 207,9509,6");
      const actual: string = calculateNum(207, 9509) + '|' + calculateSteps(9509, 6) + '|' + utilsNumAfter(6, 9509) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9716|57054|57054|0");
      expect(actual).assertEqual("9716|57054|57054|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0258 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0259
     * @tc.name      Perf_UtilsMatrix_0259
     * @tc.desc      utils matrix 208,9546,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0259 begin`);
      logInfo("utils matrix 208,9546,7");
      const actual: string = calculateNum(208, 9546) + '|' + calculateSteps(9546, 7) + '|' + utilsNumAfter(7, 9546) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9754|66822|66822|0");
      expect(actual).assertEqual("9754|66822|66822|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0259 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0260
     * @tc.name      Perf_UtilsMatrix_0260
     * @tc.desc      utils matrix 209,9583,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0260 begin`);
      logInfo("utils matrix 209,9583,8");
      const actual: string = calculateNum(209, 9583) + '|' + calculateSteps(9583, 8) + '|' + utilsNumAfter(8, 9583) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9792|76664|76664|0");
      expect(actual).assertEqual("9792|76664|76664|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0260 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0261
     * @tc.name      Perf_UtilsMatrix_0261
     * @tc.desc      utils matrix 210,9620,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0261 begin`);
      logInfo("utils matrix 210,9620,9");
      const actual: string = calculateNum(210, 9620) + '|' + calculateSteps(9620, 9) + '|' + utilsNumAfter(9, 9620) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9830|86580|86580|0");
      expect(actual).assertEqual("9830|86580|86580|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0261 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0262
     * @tc.name      Perf_UtilsMatrix_0262
     * @tc.desc      utils matrix 211,9657,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0262 begin`);
      logInfo("utils matrix 211,9657,1");
      const actual: string = calculateNum(211, 9657) + '|' + calculateSteps(9657, 1) + '|' + utilsNumAfter(1, 9657) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9868|9657|9657|0");
      expect(actual).assertEqual("9868|9657|9657|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0262 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0263
     * @tc.name      Perf_UtilsMatrix_0263
     * @tc.desc      utils matrix 212,9694,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0263 begin`);
      logInfo("utils matrix 212,9694,2");
      const actual: string = calculateNum(212, 9694) + '|' + calculateSteps(9694, 2) + '|' + utilsNumAfter(2, 9694) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9906|19388|19388|0");
      expect(actual).assertEqual("9906|19388|19388|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0263 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0264
     * @tc.name      Perf_UtilsMatrix_0264
     * @tc.desc      utils matrix 213,9731,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0264 begin`);
      logInfo("utils matrix 213,9731,3");
      const actual: string = calculateNum(213, 9731) + '|' + calculateSteps(9731, 3) + '|' + utilsNumAfter(3, 9731) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9944|29193|29193|0");
      expect(actual).assertEqual("9944|29193|29193|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0264 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0265
     * @tc.name      Perf_UtilsMatrix_0265
     * @tc.desc      utils matrix 214,9768,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0265 begin`);
      logInfo("utils matrix 214,9768,4");
      const actual: string = calculateNum(214, 9768) + '|' + calculateSteps(9768, 4) + '|' + utilsNumAfter(4, 9768) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "9982|39072|39072|0");
      expect(actual).assertEqual("9982|39072|39072|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0265 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0266
     * @tc.name      Perf_UtilsMatrix_0266
     * @tc.desc      utils matrix 215,9805,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0266 begin`);
      logInfo("utils matrix 215,9805,5");
      const actual: string = calculateNum(215, 9805) + '|' + calculateSteps(9805, 5) + '|' + utilsNumAfter(5, 9805) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10020|49025|49025|0");
      expect(actual).assertEqual("10020|49025|49025|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0266 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0267
     * @tc.name      Perf_UtilsMatrix_0267
     * @tc.desc      utils matrix 216,9842,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0267 begin`);
      logInfo("utils matrix 216,9842,6");
      const actual: string = calculateNum(216, 9842) + '|' + calculateSteps(9842, 6) + '|' + utilsNumAfter(6, 9842) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10058|59052|59052|0");
      expect(actual).assertEqual("10058|59052|59052|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0267 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0268
     * @tc.name      Perf_UtilsMatrix_0268
     * @tc.desc      utils matrix 217,9879,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0268 begin`);
      logInfo("utils matrix 217,9879,7");
      const actual: string = calculateNum(217, 9879) + '|' + calculateSteps(9879, 7) + '|' + utilsNumAfter(7, 9879) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10096|69153|69153|0");
      expect(actual).assertEqual("10096|69153|69153|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0268 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0269
     * @tc.name      Perf_UtilsMatrix_0269
     * @tc.desc      utils matrix 218,9916,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0269 begin`);
      logInfo("utils matrix 218,9916,8");
      const actual: string = calculateNum(218, 9916) + '|' + calculateSteps(9916, 8) + '|' + utilsNumAfter(8, 9916) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10134|79328|79328|0");
      expect(actual).assertEqual("10134|79328|79328|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0269 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0270
     * @tc.name      Perf_UtilsMatrix_0270
     * @tc.desc      utils matrix 219,9953,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0270 begin`);
      logInfo("utils matrix 219,9953,9");
      const actual: string = calculateNum(219, 9953) + '|' + calculateSteps(9953, 9) + '|' + utilsNumAfter(9, 9953) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10172|89577|89577|0");
      expect(actual).assertEqual("10172|89577|89577|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0270 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0271
     * @tc.name      Perf_UtilsMatrix_0271
     * @tc.desc      utils matrix 220,9990,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0271 begin`);
      logInfo("utils matrix 220,9990,1");
      const actual: string = calculateNum(220, 9990) + '|' + calculateSteps(9990, 1) + '|' + utilsNumAfter(1, 9990) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10210|9990|9990|0");
      expect(actual).assertEqual("10210|9990|9990|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0271 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0272
     * @tc.name      Perf_UtilsMatrix_0272
     * @tc.desc      utils matrix 221,10027,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0272 begin`);
      logInfo("utils matrix 221,10027,2");
      const actual: string = calculateNum(221, 10027) + '|' + calculateSteps(10027, 2) + '|' + utilsNumAfter(2, 10027) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10248|20054|20054|0");
      expect(actual).assertEqual("10248|20054|20054|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0272 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0273
     * @tc.name      Perf_UtilsMatrix_0273
     * @tc.desc      utils matrix 222,10064,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0273 begin`);
      logInfo("utils matrix 222,10064,3");
      const actual: string = calculateNum(222, 10064) + '|' + calculateSteps(10064, 3) + '|' + utilsNumAfter(3, 10064) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10286|30192|30192|0");
      expect(actual).assertEqual("10286|30192|30192|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0273 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0274
     * @tc.name      Perf_UtilsMatrix_0274
     * @tc.desc      utils matrix 223,10101,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0274 begin`);
      logInfo("utils matrix 223,10101,4");
      const actual: string = calculateNum(223, 10101) + '|' + calculateSteps(10101, 4) + '|' + utilsNumAfter(4, 10101) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10324|40404|40404|0");
      expect(actual).assertEqual("10324|40404|40404|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0274 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0275
     * @tc.name      Perf_UtilsMatrix_0275
     * @tc.desc      utils matrix 224,10138,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0275 begin`);
      logInfo("utils matrix 224,10138,5");
      const actual: string = calculateNum(224, 10138) + '|' + calculateSteps(10138, 5) + '|' + utilsNumAfter(5, 10138) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10362|50690|50690|0");
      expect(actual).assertEqual("10362|50690|50690|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0275 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0276
     * @tc.name      Perf_UtilsMatrix_0276
     * @tc.desc      utils matrix 225,10175,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0276 begin`);
      logInfo("utils matrix 225,10175,6");
      const actual: string = calculateNum(225, 10175) + '|' + calculateSteps(10175, 6) + '|' + utilsNumAfter(6, 10175) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10400|61050|61050|0");
      expect(actual).assertEqual("10400|61050|61050|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0276 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0277
     * @tc.name      Perf_UtilsMatrix_0277
     * @tc.desc      utils matrix 226,10212,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0277 begin`);
      logInfo("utils matrix 226,10212,7");
      const actual: string = calculateNum(226, 10212) + '|' + calculateSteps(10212, 7) + '|' + utilsNumAfter(7, 10212) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10438|71484|71484|0");
      expect(actual).assertEqual("10438|71484|71484|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0277 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0278
     * @tc.name      Perf_UtilsMatrix_0278
     * @tc.desc      utils matrix 227,10249,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0278 begin`);
      logInfo("utils matrix 227,10249,8");
      const actual: string = calculateNum(227, 10249) + '|' + calculateSteps(10249, 8) + '|' + utilsNumAfter(8, 10249) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10476|81992|81992|0");
      expect(actual).assertEqual("10476|81992|81992|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0278 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0279
     * @tc.name      Perf_UtilsMatrix_0279
     * @tc.desc      utils matrix 228,10286,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0279 begin`);
      logInfo("utils matrix 228,10286,9");
      const actual: string = calculateNum(228, 10286) + '|' + calculateSteps(10286, 9) + '|' + utilsNumAfter(9, 10286) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10514|92574|92574|0");
      expect(actual).assertEqual("10514|92574|92574|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0279 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0280
     * @tc.name      Perf_UtilsMatrix_0280
     * @tc.desc      utils matrix 229,10323,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0280 begin`);
      logInfo("utils matrix 229,10323,1");
      const actual: string = calculateNum(229, 10323) + '|' + calculateSteps(10323, 1) + '|' + utilsNumAfter(1, 10323) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10552|10323|10323|0");
      expect(actual).assertEqual("10552|10323|10323|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0280 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0281
     * @tc.name      Perf_UtilsMatrix_0281
     * @tc.desc      utils matrix 230,10360,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0281 begin`);
      logInfo("utils matrix 230,10360,2");
      const actual: string = calculateNum(230, 10360) + '|' + calculateSteps(10360, 2) + '|' + utilsNumAfter(2, 10360) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10590|20720|20720|0");
      expect(actual).assertEqual("10590|20720|20720|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0281 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0282
     * @tc.name      Perf_UtilsMatrix_0282
     * @tc.desc      utils matrix 231,10397,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0282 begin`);
      logInfo("utils matrix 231,10397,3");
      const actual: string = calculateNum(231, 10397) + '|' + calculateSteps(10397, 3) + '|' + utilsNumAfter(3, 10397) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10628|31191|31191|0");
      expect(actual).assertEqual("10628|31191|31191|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0282 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0283
     * @tc.name      Perf_UtilsMatrix_0283
     * @tc.desc      utils matrix 232,10434,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0283 begin`);
      logInfo("utils matrix 232,10434,4");
      const actual: string = calculateNum(232, 10434) + '|' + calculateSteps(10434, 4) + '|' + utilsNumAfter(4, 10434) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10666|41736|41736|0");
      expect(actual).assertEqual("10666|41736|41736|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0283 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0284
     * @tc.name      Perf_UtilsMatrix_0284
     * @tc.desc      utils matrix 233,10471,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0284 begin`);
      logInfo("utils matrix 233,10471,5");
      const actual: string = calculateNum(233, 10471) + '|' + calculateSteps(10471, 5) + '|' + utilsNumAfter(5, 10471) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10704|52355|52355|0");
      expect(actual).assertEqual("10704|52355|52355|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0284 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0285
     * @tc.name      Perf_UtilsMatrix_0285
     * @tc.desc      utils matrix 234,10508,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0285 begin`);
      logInfo("utils matrix 234,10508,6");
      const actual: string = calculateNum(234, 10508) + '|' + calculateSteps(10508, 6) + '|' + utilsNumAfter(6, 10508) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10742|63048|63048|0");
      expect(actual).assertEqual("10742|63048|63048|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0285 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0286
     * @tc.name      Perf_UtilsMatrix_0286
     * @tc.desc      utils matrix 235,10545,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0286 begin`);
      logInfo("utils matrix 235,10545,7");
      const actual: string = calculateNum(235, 10545) + '|' + calculateSteps(10545, 7) + '|' + utilsNumAfter(7, 10545) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10780|73815|73815|0");
      expect(actual).assertEqual("10780|73815|73815|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0286 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0287
     * @tc.name      Perf_UtilsMatrix_0287
     * @tc.desc      utils matrix 236,10582,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0287 begin`);
      logInfo("utils matrix 236,10582,8");
      const actual: string = calculateNum(236, 10582) + '|' + calculateSteps(10582, 8) + '|' + utilsNumAfter(8, 10582) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10818|84656|84656|0");
      expect(actual).assertEqual("10818|84656|84656|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0287 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0288
     * @tc.name      Perf_UtilsMatrix_0288
     * @tc.desc      utils matrix 237,10619,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0288 begin`);
      logInfo("utils matrix 237,10619,9");
      const actual: string = calculateNum(237, 10619) + '|' + calculateSteps(10619, 9) + '|' + utilsNumAfter(9, 10619) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10856|95571|95571|0");
      expect(actual).assertEqual("10856|95571|95571|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0288 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0289
     * @tc.name      Perf_UtilsMatrix_0289
     * @tc.desc      utils matrix 238,10656,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0289 begin`);
      logInfo("utils matrix 238,10656,1");
      const actual: string = calculateNum(238, 10656) + '|' + calculateSteps(10656, 1) + '|' + utilsNumAfter(1, 10656) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10894|10656|10656|0");
      expect(actual).assertEqual("10894|10656|10656|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0289 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0290
     * @tc.name      Perf_UtilsMatrix_0290
     * @tc.desc      utils matrix 239,10693,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0290 begin`);
      logInfo("utils matrix 239,10693,2");
      const actual: string = calculateNum(239, 10693) + '|' + calculateSteps(10693, 2) + '|' + utilsNumAfter(2, 10693) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10932|21386|21386|0");
      expect(actual).assertEqual("10932|21386|21386|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0290 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0291
     * @tc.name      Perf_UtilsMatrix_0291
     * @tc.desc      utils matrix 240,10730,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0291 begin`);
      logInfo("utils matrix 240,10730,3");
      const actual: string = calculateNum(240, 10730) + '|' + calculateSteps(10730, 3) + '|' + utilsNumAfter(3, 10730) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "10970|32190|32190|0");
      expect(actual).assertEqual("10970|32190|32190|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0291 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0292
     * @tc.name      Perf_UtilsMatrix_0292
     * @tc.desc      utils matrix 241,10767,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0292 begin`);
      logInfo("utils matrix 241,10767,4");
      const actual: string = calculateNum(241, 10767) + '|' + calculateSteps(10767, 4) + '|' + utilsNumAfter(4, 10767) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11008|43068|43068|0");
      expect(actual).assertEqual("11008|43068|43068|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0292 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0293
     * @tc.name      Perf_UtilsMatrix_0293
     * @tc.desc      utils matrix 242,10804,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0293 begin`);
      logInfo("utils matrix 242,10804,5");
      const actual: string = calculateNum(242, 10804) + '|' + calculateSteps(10804, 5) + '|' + utilsNumAfter(5, 10804) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11046|54020|54020|0");
      expect(actual).assertEqual("11046|54020|54020|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0293 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0294
     * @tc.name      Perf_UtilsMatrix_0294
     * @tc.desc      utils matrix 243,10841,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0294 begin`);
      logInfo("utils matrix 243,10841,6");
      const actual: string = calculateNum(243, 10841) + '|' + calculateSteps(10841, 6) + '|' + utilsNumAfter(6, 10841) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11084|65046|65046|0");
      expect(actual).assertEqual("11084|65046|65046|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0294 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0295
     * @tc.name      Perf_UtilsMatrix_0295
     * @tc.desc      utils matrix 244,10878,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0295 begin`);
      logInfo("utils matrix 244,10878,7");
      const actual: string = calculateNum(244, 10878) + '|' + calculateSteps(10878, 7) + '|' + utilsNumAfter(7, 10878) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11122|76146|76146|0");
      expect(actual).assertEqual("11122|76146|76146|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0295 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0296
     * @tc.name      Perf_UtilsMatrix_0296
     * @tc.desc      utils matrix 245,10915,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0296 begin`);
      logInfo("utils matrix 245,10915,8");
      const actual: string = calculateNum(245, 10915) + '|' + calculateSteps(10915, 8) + '|' + utilsNumAfter(8, 10915) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11160|87320|87320|0");
      expect(actual).assertEqual("11160|87320|87320|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0296 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0297
     * @tc.name      Perf_UtilsMatrix_0297
     * @tc.desc      utils matrix 246,10952,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0297 begin`);
      logInfo("utils matrix 246,10952,9");
      const actual: string = calculateNum(246, 10952) + '|' + calculateSteps(10952, 9) + '|' + utilsNumAfter(9, 10952) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11198|98568|98568|0");
      expect(actual).assertEqual("11198|98568|98568|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0297 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0298
     * @tc.name      Perf_UtilsMatrix_0298
     * @tc.desc      utils matrix 247,10989,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0298 begin`);
      logInfo("utils matrix 247,10989,1");
      const actual: string = calculateNum(247, 10989) + '|' + calculateSteps(10989, 1) + '|' + utilsNumAfter(1, 10989) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11236|10989|10989|0");
      expect(actual).assertEqual("11236|10989|10989|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0298 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0299
     * @tc.name      Perf_UtilsMatrix_0299
     * @tc.desc      utils matrix 248,11026,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0299 begin`);
      logInfo("utils matrix 248,11026,2");
      const actual: string = calculateNum(248, 11026) + '|' + calculateSteps(11026, 2) + '|' + utilsNumAfter(2, 11026) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11274|22052|22052|0");
      expect(actual).assertEqual("11274|22052|22052|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0299 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0300
     * @tc.name      Perf_UtilsMatrix_0300
     * @tc.desc      utils matrix 249,11063,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0300 begin`);
      logInfo("utils matrix 249,11063,3");
      const actual: string = calculateNum(249, 11063) + '|' + calculateSteps(11063, 3) + '|' + utilsNumAfter(3, 11063) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11312|33189|33189|0");
      expect(actual).assertEqual("11312|33189|33189|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0300 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0301
     * @tc.name      Perf_UtilsMatrix_0301
     * @tc.desc      utils matrix 250,11100,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0301 begin`);
      logInfo("utils matrix 250,11100,4");
      const actual: string = calculateNum(250, 11100) + '|' + calculateSteps(11100, 4) + '|' + utilsNumAfter(4, 11100) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11350|44400|44400|0");
      expect(actual).assertEqual("11350|44400|44400|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0301 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0302
     * @tc.name      Perf_UtilsMatrix_0302
     * @tc.desc      utils matrix 251,11137,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0302 begin`);
      logInfo("utils matrix 251,11137,5");
      const actual: string = calculateNum(251, 11137) + '|' + calculateSteps(11137, 5) + '|' + utilsNumAfter(5, 11137) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11388|55685|55685|0");
      expect(actual).assertEqual("11388|55685|55685|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0302 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0303
     * @tc.name      Perf_UtilsMatrix_0303
     * @tc.desc      utils matrix 252,11174,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0303 begin`);
      logInfo("utils matrix 252,11174,6");
      const actual: string = calculateNum(252, 11174) + '|' + calculateSteps(11174, 6) + '|' + utilsNumAfter(6, 11174) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11426|67044|67044|0");
      expect(actual).assertEqual("11426|67044|67044|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0303 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0304
     * @tc.name      Perf_UtilsMatrix_0304
     * @tc.desc      utils matrix 253,11211,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0304 begin`);
      logInfo("utils matrix 253,11211,7");
      const actual: string = calculateNum(253, 11211) + '|' + calculateSteps(11211, 7) + '|' + utilsNumAfter(7, 11211) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11464|78477|78477|0");
      expect(actual).assertEqual("11464|78477|78477|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0304 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0305
     * @tc.name      Perf_UtilsMatrix_0305
     * @tc.desc      utils matrix 254,11248,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0305 begin`);
      logInfo("utils matrix 254,11248,8");
      const actual: string = calculateNum(254, 11248) + '|' + calculateSteps(11248, 8) + '|' + utilsNumAfter(8, 11248) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11502|89984|89984|0");
      expect(actual).assertEqual("11502|89984|89984|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0305 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0306
     * @tc.name      Perf_UtilsMatrix_0306
     * @tc.desc      utils matrix 255,11285,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0306 begin`);
      logInfo("utils matrix 255,11285,9");
      const actual: string = calculateNum(255, 11285) + '|' + calculateSteps(11285, 9) + '|' + utilsNumAfter(9, 11285) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11540|101565|101565|0");
      expect(actual).assertEqual("11540|101565|101565|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0306 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0307
     * @tc.name      Perf_UtilsMatrix_0307
     * @tc.desc      utils matrix 256,11322,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0307 begin`);
      logInfo("utils matrix 256,11322,1");
      const actual: string = calculateNum(256, 11322) + '|' + calculateSteps(11322, 1) + '|' + utilsNumAfter(1, 11322) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11578|11322|11322|0");
      expect(actual).assertEqual("11578|11322|11322|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0307 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0308
     * @tc.name      Perf_UtilsMatrix_0308
     * @tc.desc      utils matrix 257,11359,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0308 begin`);
      logInfo("utils matrix 257,11359,2");
      const actual: string = calculateNum(257, 11359) + '|' + calculateSteps(11359, 2) + '|' + utilsNumAfter(2, 11359) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11616|22718|22718|0");
      expect(actual).assertEqual("11616|22718|22718|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0308 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0309
     * @tc.name      Perf_UtilsMatrix_0309
     * @tc.desc      utils matrix 258,11396,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0309 begin`);
      logInfo("utils matrix 258,11396,3");
      const actual: string = calculateNum(258, 11396) + '|' + calculateSteps(11396, 3) + '|' + utilsNumAfter(3, 11396) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11654|34188|34188|0");
      expect(actual).assertEqual("11654|34188|34188|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0309 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0310
     * @tc.name      Perf_UtilsMatrix_0310
     * @tc.desc      utils matrix 259,11433,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0310 begin`);
      logInfo("utils matrix 259,11433,4");
      const actual: string = calculateNum(259, 11433) + '|' + calculateSteps(11433, 4) + '|' + utilsNumAfter(4, 11433) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11692|45732|45732|0");
      expect(actual).assertEqual("11692|45732|45732|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0310 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0311
     * @tc.name      Perf_UtilsMatrix_0311
     * @tc.desc      utils matrix 260,11470,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0311 begin`);
      logInfo("utils matrix 260,11470,5");
      const actual: string = calculateNum(260, 11470) + '|' + calculateSteps(11470, 5) + '|' + utilsNumAfter(5, 11470) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11730|57350|57350|0");
      expect(actual).assertEqual("11730|57350|57350|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0311 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0312
     * @tc.name      Perf_UtilsMatrix_0312
     * @tc.desc      utils matrix 261,11507,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0312 begin`);
      logInfo("utils matrix 261,11507,6");
      const actual: string = calculateNum(261, 11507) + '|' + calculateSteps(11507, 6) + '|' + utilsNumAfter(6, 11507) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11768|69042|69042|0");
      expect(actual).assertEqual("11768|69042|69042|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0312 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0313
     * @tc.name      Perf_UtilsMatrix_0313
     * @tc.desc      utils matrix 262,11544,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0313 begin`);
      logInfo("utils matrix 262,11544,7");
      const actual: string = calculateNum(262, 11544) + '|' + calculateSteps(11544, 7) + '|' + utilsNumAfter(7, 11544) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11806|80808|80808|0");
      expect(actual).assertEqual("11806|80808|80808|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0313 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0314
     * @tc.name      Perf_UtilsMatrix_0314
     * @tc.desc      utils matrix 263,11581,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0314 begin`);
      logInfo("utils matrix 263,11581,8");
      const actual: string = calculateNum(263, 11581) + '|' + calculateSteps(11581, 8) + '|' + utilsNumAfter(8, 11581) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11844|92648|92648|0");
      expect(actual).assertEqual("11844|92648|92648|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0314 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0315
     * @tc.name      Perf_UtilsMatrix_0315
     * @tc.desc      utils matrix 264,11618,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0315 begin`);
      logInfo("utils matrix 264,11618,9");
      const actual: string = calculateNum(264, 11618) + '|' + calculateSteps(11618, 9) + '|' + utilsNumAfter(9, 11618) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11882|104562|104562|0");
      expect(actual).assertEqual("11882|104562|104562|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0315 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0316
     * @tc.name      Perf_UtilsMatrix_0316
     * @tc.desc      utils matrix 265,11655,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0316 begin`);
      logInfo("utils matrix 265,11655,1");
      const actual: string = calculateNum(265, 11655) + '|' + calculateSteps(11655, 1) + '|' + utilsNumAfter(1, 11655) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11920|11655|11655|0");
      expect(actual).assertEqual("11920|11655|11655|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0316 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0317
     * @tc.name      Perf_UtilsMatrix_0317
     * @tc.desc      utils matrix 266,11692,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0317 begin`);
      logInfo("utils matrix 266,11692,2");
      const actual: string = calculateNum(266, 11692) + '|' + calculateSteps(11692, 2) + '|' + utilsNumAfter(2, 11692) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11958|23384|23384|0");
      expect(actual).assertEqual("11958|23384|23384|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0317 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0318
     * @tc.name      Perf_UtilsMatrix_0318
     * @tc.desc      utils matrix 267,11729,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0318 begin`);
      logInfo("utils matrix 267,11729,3");
      const actual: string = calculateNum(267, 11729) + '|' + calculateSteps(11729, 3) + '|' + utilsNumAfter(3, 11729) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "11996|35187|35187|0");
      expect(actual).assertEqual("11996|35187|35187|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0318 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0319
     * @tc.name      Perf_UtilsMatrix_0319
     * @tc.desc      utils matrix 268,11766,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0319 begin`);
      logInfo("utils matrix 268,11766,4");
      const actual: string = calculateNum(268, 11766) + '|' + calculateSteps(11766, 4) + '|' + utilsNumAfter(4, 11766) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12034|47064|47064|0");
      expect(actual).assertEqual("12034|47064|47064|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0319 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0320
     * @tc.name      Perf_UtilsMatrix_0320
     * @tc.desc      utils matrix 269,11803,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0320 begin`);
      logInfo("utils matrix 269,11803,5");
      const actual: string = calculateNum(269, 11803) + '|' + calculateSteps(11803, 5) + '|' + utilsNumAfter(5, 11803) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12072|59015|59015|0");
      expect(actual).assertEqual("12072|59015|59015|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0320 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0321
     * @tc.name      Perf_UtilsMatrix_0321
     * @tc.desc      utils matrix 270,11840,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0321 begin`);
      logInfo("utils matrix 270,11840,6");
      const actual: string = calculateNum(270, 11840) + '|' + calculateSteps(11840, 6) + '|' + utilsNumAfter(6, 11840) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12110|71040|71040|0");
      expect(actual).assertEqual("12110|71040|71040|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0321 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0322
     * @tc.name      Perf_UtilsMatrix_0322
     * @tc.desc      utils matrix 271,11877,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0322 begin`);
      logInfo("utils matrix 271,11877,7");
      const actual: string = calculateNum(271, 11877) + '|' + calculateSteps(11877, 7) + '|' + utilsNumAfter(7, 11877) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12148|83139|83139|0");
      expect(actual).assertEqual("12148|83139|83139|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0322 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0323
     * @tc.name      Perf_UtilsMatrix_0323
     * @tc.desc      utils matrix 272,11914,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0323 begin`);
      logInfo("utils matrix 272,11914,8");
      const actual: string = calculateNum(272, 11914) + '|' + calculateSteps(11914, 8) + '|' + utilsNumAfter(8, 11914) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12186|95312|95312|0");
      expect(actual).assertEqual("12186|95312|95312|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0323 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0324
     * @tc.name      Perf_UtilsMatrix_0324
     * @tc.desc      utils matrix 273,11951,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0324 begin`);
      logInfo("utils matrix 273,11951,9");
      const actual: string = calculateNum(273, 11951) + '|' + calculateSteps(11951, 9) + '|' + utilsNumAfter(9, 11951) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12224|107559|107559|0");
      expect(actual).assertEqual("12224|107559|107559|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0324 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0325
     * @tc.name      Perf_UtilsMatrix_0325
     * @tc.desc      utils matrix 274,11988,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0325 begin`);
      logInfo("utils matrix 274,11988,1");
      const actual: string = calculateNum(274, 11988) + '|' + calculateSteps(11988, 1) + '|' + utilsNumAfter(1, 11988) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12262|11988|11988|0");
      expect(actual).assertEqual("12262|11988|11988|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0325 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0326
     * @tc.name      Perf_UtilsMatrix_0326
     * @tc.desc      utils matrix 275,12025,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0326 begin`);
      logInfo("utils matrix 275,12025,2");
      const actual: string = calculateNum(275, 12025) + '|' + calculateSteps(12025, 2) + '|' + utilsNumAfter(2, 12025) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12300|24050|24050|0");
      expect(actual).assertEqual("12300|24050|24050|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0326 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0327
     * @tc.name      Perf_UtilsMatrix_0327
     * @tc.desc      utils matrix 276,12062,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0327 begin`);
      logInfo("utils matrix 276,12062,3");
      const actual: string = calculateNum(276, 12062) + '|' + calculateSteps(12062, 3) + '|' + utilsNumAfter(3, 12062) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12338|36186|36186|0");
      expect(actual).assertEqual("12338|36186|36186|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0327 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0328
     * @tc.name      Perf_UtilsMatrix_0328
     * @tc.desc      utils matrix 277,12099,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0328 begin`);
      logInfo("utils matrix 277,12099,4");
      const actual: string = calculateNum(277, 12099) + '|' + calculateSteps(12099, 4) + '|' + utilsNumAfter(4, 12099) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12376|48396|48396|0");
      expect(actual).assertEqual("12376|48396|48396|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0328 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0329
     * @tc.name      Perf_UtilsMatrix_0329
     * @tc.desc      utils matrix 278,12136,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0329 begin`);
      logInfo("utils matrix 278,12136,5");
      const actual: string = calculateNum(278, 12136) + '|' + calculateSteps(12136, 5) + '|' + utilsNumAfter(5, 12136) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12414|60680|60680|0");
      expect(actual).assertEqual("12414|60680|60680|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0329 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0330
     * @tc.name      Perf_UtilsMatrix_0330
     * @tc.desc      utils matrix 279,12173,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0330 begin`);
      logInfo("utils matrix 279,12173,6");
      const actual: string = calculateNum(279, 12173) + '|' + calculateSteps(12173, 6) + '|' + utilsNumAfter(6, 12173) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12452|73038|73038|0");
      expect(actual).assertEqual("12452|73038|73038|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0330 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0331
     * @tc.name      Perf_UtilsMatrix_0331
     * @tc.desc      utils matrix 280,12210,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0331 begin`);
      logInfo("utils matrix 280,12210,7");
      const actual: string = calculateNum(280, 12210) + '|' + calculateSteps(12210, 7) + '|' + utilsNumAfter(7, 12210) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12490|85470|85470|0");
      expect(actual).assertEqual("12490|85470|85470|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0331 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0332
     * @tc.name      Perf_UtilsMatrix_0332
     * @tc.desc      utils matrix 281,12247,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0332 begin`);
      logInfo("utils matrix 281,12247,8");
      const actual: string = calculateNum(281, 12247) + '|' + calculateSteps(12247, 8) + '|' + utilsNumAfter(8, 12247) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12528|97976|97976|0");
      expect(actual).assertEqual("12528|97976|97976|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0332 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0333
     * @tc.name      Perf_UtilsMatrix_0333
     * @tc.desc      utils matrix 282,12284,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0333 begin`);
      logInfo("utils matrix 282,12284,9");
      const actual: string = calculateNum(282, 12284) + '|' + calculateSteps(12284, 9) + '|' + utilsNumAfter(9, 12284) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12566|110556|110556|0");
      expect(actual).assertEqual("12566|110556|110556|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0333 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0334
     * @tc.name      Perf_UtilsMatrix_0334
     * @tc.desc      utils matrix 283,12321,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0334 begin`);
      logInfo("utils matrix 283,12321,1");
      const actual: string = calculateNum(283, 12321) + '|' + calculateSteps(12321, 1) + '|' + utilsNumAfter(1, 12321) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12604|12321|12321|0");
      expect(actual).assertEqual("12604|12321|12321|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0334 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0335
     * @tc.name      Perf_UtilsMatrix_0335
     * @tc.desc      utils matrix 284,12358,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0335 begin`);
      logInfo("utils matrix 284,12358,2");
      const actual: string = calculateNum(284, 12358) + '|' + calculateSteps(12358, 2) + '|' + utilsNumAfter(2, 12358) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12642|24716|24716|0");
      expect(actual).assertEqual("12642|24716|24716|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0335 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0336
     * @tc.name      Perf_UtilsMatrix_0336
     * @tc.desc      utils matrix 285,12395,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0336 begin`);
      logInfo("utils matrix 285,12395,3");
      const actual: string = calculateNum(285, 12395) + '|' + calculateSteps(12395, 3) + '|' + utilsNumAfter(3, 12395) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12680|37185|37185|0");
      expect(actual).assertEqual("12680|37185|37185|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0336 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0337
     * @tc.name      Perf_UtilsMatrix_0337
     * @tc.desc      utils matrix 286,12432,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0337 begin`);
      logInfo("utils matrix 286,12432,4");
      const actual: string = calculateNum(286, 12432) + '|' + calculateSteps(12432, 4) + '|' + utilsNumAfter(4, 12432) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12718|49728|49728|0");
      expect(actual).assertEqual("12718|49728|49728|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0337 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0338
     * @tc.name      Perf_UtilsMatrix_0338
     * @tc.desc      utils matrix 287,12469,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0338 begin`);
      logInfo("utils matrix 287,12469,5");
      const actual: string = calculateNum(287, 12469) + '|' + calculateSteps(12469, 5) + '|' + utilsNumAfter(5, 12469) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12756|62345|62345|0");
      expect(actual).assertEqual("12756|62345|62345|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0338 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0339
     * @tc.name      Perf_UtilsMatrix_0339
     * @tc.desc      utils matrix 288,12506,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0339 begin`);
      logInfo("utils matrix 288,12506,6");
      const actual: string = calculateNum(288, 12506) + '|' + calculateSteps(12506, 6) + '|' + utilsNumAfter(6, 12506) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12794|75036|75036|0");
      expect(actual).assertEqual("12794|75036|75036|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0339 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0340
     * @tc.name      Perf_UtilsMatrix_0340
     * @tc.desc      utils matrix 289,12543,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0340 begin`);
      logInfo("utils matrix 289,12543,7");
      const actual: string = calculateNum(289, 12543) + '|' + calculateSteps(12543, 7) + '|' + utilsNumAfter(7, 12543) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12832|87801|87801|0");
      expect(actual).assertEqual("12832|87801|87801|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0340 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0341
     * @tc.name      Perf_UtilsMatrix_0341
     * @tc.desc      utils matrix 290,12580,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0341 begin`);
      logInfo("utils matrix 290,12580,8");
      const actual: string = calculateNum(290, 12580) + '|' + calculateSteps(12580, 8) + '|' + utilsNumAfter(8, 12580) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12870|100640|100640|0");
      expect(actual).assertEqual("12870|100640|100640|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0341 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0342
     * @tc.name      Perf_UtilsMatrix_0342
     * @tc.desc      utils matrix 291,12617,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0342 begin`);
      logInfo("utils matrix 291,12617,9");
      const actual: string = calculateNum(291, 12617) + '|' + calculateSteps(12617, 9) + '|' + utilsNumAfter(9, 12617) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12908|113553|113553|0");
      expect(actual).assertEqual("12908|113553|113553|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0342 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0343
     * @tc.name      Perf_UtilsMatrix_0343
     * @tc.desc      utils matrix 292,12654,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0343 begin`);
      logInfo("utils matrix 292,12654,1");
      const actual: string = calculateNum(292, 12654) + '|' + calculateSteps(12654, 1) + '|' + utilsNumAfter(1, 12654) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12946|12654|12654|0");
      expect(actual).assertEqual("12946|12654|12654|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0343 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0344
     * @tc.name      Perf_UtilsMatrix_0344
     * @tc.desc      utils matrix 293,12691,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0344 begin`);
      logInfo("utils matrix 293,12691,2");
      const actual: string = calculateNum(293, 12691) + '|' + calculateSteps(12691, 2) + '|' + utilsNumAfter(2, 12691) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "12984|25382|25382|0");
      expect(actual).assertEqual("12984|25382|25382|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0344 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0345
     * @tc.name      Perf_UtilsMatrix_0345
     * @tc.desc      utils matrix 294,12728,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0345 begin`);
      logInfo("utils matrix 294,12728,3");
      const actual: string = calculateNum(294, 12728) + '|' + calculateSteps(12728, 3) + '|' + utilsNumAfter(3, 12728) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13022|38184|38184|0");
      expect(actual).assertEqual("13022|38184|38184|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0345 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0346
     * @tc.name      Perf_UtilsMatrix_0346
     * @tc.desc      utils matrix 295,12765,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0346 begin`);
      logInfo("utils matrix 295,12765,4");
      const actual: string = calculateNum(295, 12765) + '|' + calculateSteps(12765, 4) + '|' + utilsNumAfter(4, 12765) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13060|51060|51060|0");
      expect(actual).assertEqual("13060|51060|51060|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0346 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0347
     * @tc.name      Perf_UtilsMatrix_0347
     * @tc.desc      utils matrix 296,12802,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0347 begin`);
      logInfo("utils matrix 296,12802,5");
      const actual: string = calculateNum(296, 12802) + '|' + calculateSteps(12802, 5) + '|' + utilsNumAfter(5, 12802) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13098|64010|64010|0");
      expect(actual).assertEqual("13098|64010|64010|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0347 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0348
     * @tc.name      Perf_UtilsMatrix_0348
     * @tc.desc      utils matrix 297,12839,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0348 begin`);
      logInfo("utils matrix 297,12839,6");
      const actual: string = calculateNum(297, 12839) + '|' + calculateSteps(12839, 6) + '|' + utilsNumAfter(6, 12839) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13136|77034|77034|0");
      expect(actual).assertEqual("13136|77034|77034|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0348 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0349
     * @tc.name      Perf_UtilsMatrix_0349
     * @tc.desc      utils matrix 298,12876,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0349 begin`);
      logInfo("utils matrix 298,12876,7");
      const actual: string = calculateNum(298, 12876) + '|' + calculateSteps(12876, 7) + '|' + utilsNumAfter(7, 12876) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13174|90132|90132|0");
      expect(actual).assertEqual("13174|90132|90132|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0349 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0350
     * @tc.name      Perf_UtilsMatrix_0350
     * @tc.desc      utils matrix 299,12913,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0350 begin`);
      logInfo("utils matrix 299,12913,8");
      const actual: string = calculateNum(299, 12913) + '|' + calculateSteps(12913, 8) + '|' + utilsNumAfter(8, 12913) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13212|103304|103304|0");
      expect(actual).assertEqual("13212|103304|103304|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0350 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0351
     * @tc.name      Perf_UtilsMatrix_0351
     * @tc.desc      utils matrix 300,12950,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0351 begin`);
      logInfo("utils matrix 300,12950,9");
      const actual: string = calculateNum(300, 12950) + '|' + calculateSteps(12950, 9) + '|' + utilsNumAfter(9, 12950) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13250|116550|116550|0");
      expect(actual).assertEqual("13250|116550|116550|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0351 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0352
     * @tc.name      Perf_UtilsMatrix_0352
     * @tc.desc      utils matrix 301,12987,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0352 begin`);
      logInfo("utils matrix 301,12987,1");
      const actual: string = calculateNum(301, 12987) + '|' + calculateSteps(12987, 1) + '|' + utilsNumAfter(1, 12987) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13288|12987|12987|0");
      expect(actual).assertEqual("13288|12987|12987|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0352 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0353
     * @tc.name      Perf_UtilsMatrix_0353
     * @tc.desc      utils matrix 302,13024,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0353 begin`);
      logInfo("utils matrix 302,13024,2");
      const actual: string = calculateNum(302, 13024) + '|' + calculateSteps(13024, 2) + '|' + utilsNumAfter(2, 13024) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13326|26048|26048|0");
      expect(actual).assertEqual("13326|26048|26048|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0353 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0354
     * @tc.name      Perf_UtilsMatrix_0354
     * @tc.desc      utils matrix 303,13061,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0354 begin`);
      logInfo("utils matrix 303,13061,3");
      const actual: string = calculateNum(303, 13061) + '|' + calculateSteps(13061, 3) + '|' + utilsNumAfter(3, 13061) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13364|39183|39183|0");
      expect(actual).assertEqual("13364|39183|39183|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0354 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0355
     * @tc.name      Perf_UtilsMatrix_0355
     * @tc.desc      utils matrix 304,13098,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0355 begin`);
      logInfo("utils matrix 304,13098,4");
      const actual: string = calculateNum(304, 13098) + '|' + calculateSteps(13098, 4) + '|' + utilsNumAfter(4, 13098) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13402|52392|52392|0");
      expect(actual).assertEqual("13402|52392|52392|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0355 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0356
     * @tc.name      Perf_UtilsMatrix_0356
     * @tc.desc      utils matrix 305,13135,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0356 begin`);
      logInfo("utils matrix 305,13135,5");
      const actual: string = calculateNum(305, 13135) + '|' + calculateSteps(13135, 5) + '|' + utilsNumAfter(5, 13135) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13440|65675|65675|0");
      expect(actual).assertEqual("13440|65675|65675|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0356 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0357
     * @tc.name      Perf_UtilsMatrix_0357
     * @tc.desc      utils matrix 306,13172,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0357 begin`);
      logInfo("utils matrix 306,13172,6");
      const actual: string = calculateNum(306, 13172) + '|' + calculateSteps(13172, 6) + '|' + utilsNumAfter(6, 13172) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13478|79032|79032|0");
      expect(actual).assertEqual("13478|79032|79032|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0357 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0358
     * @tc.name      Perf_UtilsMatrix_0358
     * @tc.desc      utils matrix 307,13209,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0358 begin`);
      logInfo("utils matrix 307,13209,7");
      const actual: string = calculateNum(307, 13209) + '|' + calculateSteps(13209, 7) + '|' + utilsNumAfter(7, 13209) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13516|92463|92463|0");
      expect(actual).assertEqual("13516|92463|92463|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0358 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0359
     * @tc.name      Perf_UtilsMatrix_0359
     * @tc.desc      utils matrix 308,13246,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0359 begin`);
      logInfo("utils matrix 308,13246,8");
      const actual: string = calculateNum(308, 13246) + '|' + calculateSteps(13246, 8) + '|' + utilsNumAfter(8, 13246) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13554|105968|105968|0");
      expect(actual).assertEqual("13554|105968|105968|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0359 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0360
     * @tc.name      Perf_UtilsMatrix_0360
     * @tc.desc      utils matrix 309,13283,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0360 begin`);
      logInfo("utils matrix 309,13283,9");
      const actual: string = calculateNum(309, 13283) + '|' + calculateSteps(13283, 9) + '|' + utilsNumAfter(9, 13283) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13592|119547|119547|0");
      expect(actual).assertEqual("13592|119547|119547|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0360 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0361
     * @tc.name      Perf_UtilsMatrix_0361
     * @tc.desc      utils matrix 310,13320,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0361 begin`);
      logInfo("utils matrix 310,13320,1");
      const actual: string = calculateNum(310, 13320) + '|' + calculateSteps(13320, 1) + '|' + utilsNumAfter(1, 13320) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13630|13320|13320|0");
      expect(actual).assertEqual("13630|13320|13320|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0361 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0362
     * @tc.name      Perf_UtilsMatrix_0362
     * @tc.desc      utils matrix 311,13357,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0362 begin`);
      logInfo("utils matrix 311,13357,2");
      const actual: string = calculateNum(311, 13357) + '|' + calculateSteps(13357, 2) + '|' + utilsNumAfter(2, 13357) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13668|26714|26714|0");
      expect(actual).assertEqual("13668|26714|26714|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0362 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0363
     * @tc.name      Perf_UtilsMatrix_0363
     * @tc.desc      utils matrix 312,13394,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0363 begin`);
      logInfo("utils matrix 312,13394,3");
      const actual: string = calculateNum(312, 13394) + '|' + calculateSteps(13394, 3) + '|' + utilsNumAfter(3, 13394) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13706|40182|40182|0");
      expect(actual).assertEqual("13706|40182|40182|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0363 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0364
     * @tc.name      Perf_UtilsMatrix_0364
     * @tc.desc      utils matrix 313,13431,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0364 begin`);
      logInfo("utils matrix 313,13431,4");
      const actual: string = calculateNum(313, 13431) + '|' + calculateSteps(13431, 4) + '|' + utilsNumAfter(4, 13431) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13744|53724|53724|0");
      expect(actual).assertEqual("13744|53724|53724|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0364 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0365
     * @tc.name      Perf_UtilsMatrix_0365
     * @tc.desc      utils matrix 314,13468,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0365 begin`);
      logInfo("utils matrix 314,13468,5");
      const actual: string = calculateNum(314, 13468) + '|' + calculateSteps(13468, 5) + '|' + utilsNumAfter(5, 13468) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13782|67340|67340|0");
      expect(actual).assertEqual("13782|67340|67340|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0365 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0366
     * @tc.name      Perf_UtilsMatrix_0366
     * @tc.desc      utils matrix 315,13505,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0366 begin`);
      logInfo("utils matrix 315,13505,6");
      const actual: string = calculateNum(315, 13505) + '|' + calculateSteps(13505, 6) + '|' + utilsNumAfter(6, 13505) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13820|81030|81030|0");
      expect(actual).assertEqual("13820|81030|81030|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0366 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0367
     * @tc.name      Perf_UtilsMatrix_0367
     * @tc.desc      utils matrix 316,13542,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0367 begin`);
      logInfo("utils matrix 316,13542,7");
      const actual: string = calculateNum(316, 13542) + '|' + calculateSteps(13542, 7) + '|' + utilsNumAfter(7, 13542) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13858|94794|94794|0");
      expect(actual).assertEqual("13858|94794|94794|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0367 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0368
     * @tc.name      Perf_UtilsMatrix_0368
     * @tc.desc      utils matrix 317,13579,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0368 begin`);
      logInfo("utils matrix 317,13579,8");
      const actual: string = calculateNum(317, 13579) + '|' + calculateSteps(13579, 8) + '|' + utilsNumAfter(8, 13579) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13896|108632|108632|0");
      expect(actual).assertEqual("13896|108632|108632|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0368 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0369
     * @tc.name      Perf_UtilsMatrix_0369
     * @tc.desc      utils matrix 318,13616,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0369 begin`);
      logInfo("utils matrix 318,13616,9");
      const actual: string = calculateNum(318, 13616) + '|' + calculateSteps(13616, 9) + '|' + utilsNumAfter(9, 13616) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13934|122544|122544|0");
      expect(actual).assertEqual("13934|122544|122544|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0369 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0370
     * @tc.name      Perf_UtilsMatrix_0370
     * @tc.desc      utils matrix 319,13653,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0370 begin`);
      logInfo("utils matrix 319,13653,1");
      const actual: string = calculateNum(319, 13653) + '|' + calculateSteps(13653, 1) + '|' + utilsNumAfter(1, 13653) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "13972|13653|13653|0");
      expect(actual).assertEqual("13972|13653|13653|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0370 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0371
     * @tc.name      Perf_UtilsMatrix_0371
     * @tc.desc      utils matrix 320,13690,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0371 begin`);
      logInfo("utils matrix 320,13690,2");
      const actual: string = calculateNum(320, 13690) + '|' + calculateSteps(13690, 2) + '|' + utilsNumAfter(2, 13690) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14010|27380|27380|0");
      expect(actual).assertEqual("14010|27380|27380|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0371 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0372
     * @tc.name      Perf_UtilsMatrix_0372
     * @tc.desc      utils matrix 321,13727,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0372 begin`);
      logInfo("utils matrix 321,13727,3");
      const actual: string = calculateNum(321, 13727) + '|' + calculateSteps(13727, 3) + '|' + utilsNumAfter(3, 13727) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14048|41181|41181|0");
      expect(actual).assertEqual("14048|41181|41181|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0372 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0373
     * @tc.name      Perf_UtilsMatrix_0373
     * @tc.desc      utils matrix 322,13764,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0373 begin`);
      logInfo("utils matrix 322,13764,4");
      const actual: string = calculateNum(322, 13764) + '|' + calculateSteps(13764, 4) + '|' + utilsNumAfter(4, 13764) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14086|55056|55056|0");
      expect(actual).assertEqual("14086|55056|55056|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0373 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0374
     * @tc.name      Perf_UtilsMatrix_0374
     * @tc.desc      utils matrix 323,13801,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0374 begin`);
      logInfo("utils matrix 323,13801,5");
      const actual: string = calculateNum(323, 13801) + '|' + calculateSteps(13801, 5) + '|' + utilsNumAfter(5, 13801) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14124|69005|69005|0");
      expect(actual).assertEqual("14124|69005|69005|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0374 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0375
     * @tc.name      Perf_UtilsMatrix_0375
     * @tc.desc      utils matrix 324,13838,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0375 begin`);
      logInfo("utils matrix 324,13838,6");
      const actual: string = calculateNum(324, 13838) + '|' + calculateSteps(13838, 6) + '|' + utilsNumAfter(6, 13838) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14162|83028|83028|0");
      expect(actual).assertEqual("14162|83028|83028|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0375 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0376
     * @tc.name      Perf_UtilsMatrix_0376
     * @tc.desc      utils matrix 325,13875,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0376 begin`);
      logInfo("utils matrix 325,13875,7");
      const actual: string = calculateNum(325, 13875) + '|' + calculateSteps(13875, 7) + '|' + utilsNumAfter(7, 13875) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14200|97125|97125|0");
      expect(actual).assertEqual("14200|97125|97125|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0376 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0377
     * @tc.name      Perf_UtilsMatrix_0377
     * @tc.desc      utils matrix 326,13912,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0377 begin`);
      logInfo("utils matrix 326,13912,8");
      const actual: string = calculateNum(326, 13912) + '|' + calculateSteps(13912, 8) + '|' + utilsNumAfter(8, 13912) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14238|111296|111296|0");
      expect(actual).assertEqual("14238|111296|111296|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0377 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0378
     * @tc.name      Perf_UtilsMatrix_0378
     * @tc.desc      utils matrix 327,13949,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0378 begin`);
      logInfo("utils matrix 327,13949,9");
      const actual: string = calculateNum(327, 13949) + '|' + calculateSteps(13949, 9) + '|' + utilsNumAfter(9, 13949) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14276|125541|125541|0");
      expect(actual).assertEqual("14276|125541|125541|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0378 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0379
     * @tc.name      Perf_UtilsMatrix_0379
     * @tc.desc      utils matrix 328,13986,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0379 begin`);
      logInfo("utils matrix 328,13986,1");
      const actual: string = calculateNum(328, 13986) + '|' + calculateSteps(13986, 1) + '|' + utilsNumAfter(1, 13986) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14314|13986|13986|0");
      expect(actual).assertEqual("14314|13986|13986|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0379 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0380
     * @tc.name      Perf_UtilsMatrix_0380
     * @tc.desc      utils matrix 329,14023,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0380 begin`);
      logInfo("utils matrix 329,14023,2");
      const actual: string = calculateNum(329, 14023) + '|' + calculateSteps(14023, 2) + '|' + utilsNumAfter(2, 14023) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14352|28046|28046|0");
      expect(actual).assertEqual("14352|28046|28046|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0380 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0381
     * @tc.name      Perf_UtilsMatrix_0381
     * @tc.desc      utils matrix 330,14060,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0381 begin`);
      logInfo("utils matrix 330,14060,3");
      const actual: string = calculateNum(330, 14060) + '|' + calculateSteps(14060, 3) + '|' + utilsNumAfter(3, 14060) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14390|42180|42180|0");
      expect(actual).assertEqual("14390|42180|42180|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0381 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0382
     * @tc.name      Perf_UtilsMatrix_0382
     * @tc.desc      utils matrix 331,14097,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0382 begin`);
      logInfo("utils matrix 331,14097,4");
      const actual: string = calculateNum(331, 14097) + '|' + calculateSteps(14097, 4) + '|' + utilsNumAfter(4, 14097) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14428|56388|56388|0");
      expect(actual).assertEqual("14428|56388|56388|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0382 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0383
     * @tc.name      Perf_UtilsMatrix_0383
     * @tc.desc      utils matrix 332,14134,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0383 begin`);
      logInfo("utils matrix 332,14134,5");
      const actual: string = calculateNum(332, 14134) + '|' + calculateSteps(14134, 5) + '|' + utilsNumAfter(5, 14134) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14466|70670|70670|0");
      expect(actual).assertEqual("14466|70670|70670|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0383 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0384
     * @tc.name      Perf_UtilsMatrix_0384
     * @tc.desc      utils matrix 333,14171,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0384 begin`);
      logInfo("utils matrix 333,14171,6");
      const actual: string = calculateNum(333, 14171) + '|' + calculateSteps(14171, 6) + '|' + utilsNumAfter(6, 14171) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14504|85026|85026|0");
      expect(actual).assertEqual("14504|85026|85026|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0384 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0385
     * @tc.name      Perf_UtilsMatrix_0385
     * @tc.desc      utils matrix 334,14208,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0385 begin`);
      logInfo("utils matrix 334,14208,7");
      const actual: string = calculateNum(334, 14208) + '|' + calculateSteps(14208, 7) + '|' + utilsNumAfter(7, 14208) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14542|99456|99456|0");
      expect(actual).assertEqual("14542|99456|99456|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0385 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0386
     * @tc.name      Perf_UtilsMatrix_0386
     * @tc.desc      utils matrix 335,14245,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0386 begin`);
      logInfo("utils matrix 335,14245,8");
      const actual: string = calculateNum(335, 14245) + '|' + calculateSteps(14245, 8) + '|' + utilsNumAfter(8, 14245) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14580|113960|113960|0");
      expect(actual).assertEqual("14580|113960|113960|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0386 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0387
     * @tc.name      Perf_UtilsMatrix_0387
     * @tc.desc      utils matrix 336,14282,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0387 begin`);
      logInfo("utils matrix 336,14282,9");
      const actual: string = calculateNum(336, 14282) + '|' + calculateSteps(14282, 9) + '|' + utilsNumAfter(9, 14282) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14618|128538|128538|0");
      expect(actual).assertEqual("14618|128538|128538|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0387 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0388
     * @tc.name      Perf_UtilsMatrix_0388
     * @tc.desc      utils matrix 337,14319,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0388 begin`);
      logInfo("utils matrix 337,14319,1");
      const actual: string = calculateNum(337, 14319) + '|' + calculateSteps(14319, 1) + '|' + utilsNumAfter(1, 14319) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14656|14319|14319|0");
      expect(actual).assertEqual("14656|14319|14319|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0388 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0389
     * @tc.name      Perf_UtilsMatrix_0389
     * @tc.desc      utils matrix 338,14356,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0389 begin`);
      logInfo("utils matrix 338,14356,2");
      const actual: string = calculateNum(338, 14356) + '|' + calculateSteps(14356, 2) + '|' + utilsNumAfter(2, 14356) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14694|28712|28712|0");
      expect(actual).assertEqual("14694|28712|28712|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0389 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0390
     * @tc.name      Perf_UtilsMatrix_0390
     * @tc.desc      utils matrix 339,14393,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0390 begin`);
      logInfo("utils matrix 339,14393,3");
      const actual: string = calculateNum(339, 14393) + '|' + calculateSteps(14393, 3) + '|' + utilsNumAfter(3, 14393) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14732|43179|43179|0");
      expect(actual).assertEqual("14732|43179|43179|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0390 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0391
     * @tc.name      Perf_UtilsMatrix_0391
     * @tc.desc      utils matrix 340,14430,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0391 begin`);
      logInfo("utils matrix 340,14430,4");
      const actual: string = calculateNum(340, 14430) + '|' + calculateSteps(14430, 4) + '|' + utilsNumAfter(4, 14430) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14770|57720|57720|0");
      expect(actual).assertEqual("14770|57720|57720|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0391 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0392
     * @tc.name      Perf_UtilsMatrix_0392
     * @tc.desc      utils matrix 341,14467,5 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_UtilsMatrix_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0392 begin`);
      logInfo("utils matrix 341,14467,5");
      const actual: string = calculateNum(341, 14467) + '|' + calculateSteps(14467, 5) + '|' + utilsNumAfter(5, 14467) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14808|72335|72335|0");
      expect(actual).assertEqual("14808|72335|72335|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0392 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0393
     * @tc.name      Perf_UtilsMatrix_0393
     * @tc.desc      utils matrix 342,14504,6 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0393 begin`);
      logInfo("utils matrix 342,14504,6");
      const actual: string = calculateNum(342, 14504) + '|' + calculateSteps(14504, 6) + '|' + utilsNumAfter(6, 14504) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14846|87024|87024|0");
      expect(actual).assertEqual("14846|87024|87024|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0393 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0394
     * @tc.name      Perf_UtilsMatrix_0394
     * @tc.desc      utils matrix 343,14541,7 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0394 begin`);
      logInfo("utils matrix 343,14541,7");
      const actual: string = calculateNum(343, 14541) + '|' + calculateSteps(14541, 7) + '|' + utilsNumAfter(7, 14541) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14884|101787|101787|0");
      expect(actual).assertEqual("14884|101787|101787|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0394 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0395
     * @tc.name      Perf_UtilsMatrix_0395
     * @tc.desc      utils matrix 344,14578,8 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0395 begin`);
      logInfo("utils matrix 344,14578,8");
      const actual: string = calculateNum(344, 14578) + '|' + calculateSteps(14578, 8) + '|' + utilsNumAfter(8, 14578) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14922|116624|116624|0");
      expect(actual).assertEqual("14922|116624|116624|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0395 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0396
     * @tc.name      Perf_UtilsMatrix_0396
     * @tc.desc      utils matrix 345,14615,9 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0396 begin`);
      logInfo("utils matrix 345,14615,9");
      const actual: string = calculateNum(345, 14615) + '|' + calculateSteps(14615, 9) + '|' + utilsNumAfter(9, 14615) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14960|131535|131535|0");
      expect(actual).assertEqual("14960|131535|131535|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0396 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0397
     * @tc.name      Perf_UtilsMatrix_0397
     * @tc.desc      utils matrix 346,14652,1 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_UtilsMatrix_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0397 begin`);
      logInfo("utils matrix 346,14652,1");
      const actual: string = calculateNum(346, 14652) + '|' + calculateSteps(14652, 1) + '|' + utilsNumAfter(1, 14652) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "14998|14652|14652|0");
      expect(actual).assertEqual("14998|14652|14652|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0397 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0398
     * @tc.name      Perf_UtilsMatrix_0398
     * @tc.desc      utils matrix 347,14689,2 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0398 begin`);
      logInfo("utils matrix 347,14689,2");
      const actual: string = calculateNum(347, 14689) + '|' + calculateSteps(14689, 2) + '|' + utilsNumAfter(2, 14689) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "15036|29378|29378|0");
      expect(actual).assertEqual("15036|29378|29378|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0398 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0399
     * @tc.name      Perf_UtilsMatrix_0399
     * @tc.desc      utils matrix 348,14726,3 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0399 begin`);
      logInfo("utils matrix 348,14726,3");
      const actual: string = calculateNum(348, 14726) + '|' + calculateSteps(14726, 3) + '|' + utilsNumAfter(3, 14726) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "15074|44178|44178|0");
      expect(actual).assertEqual("15074|44178|44178|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0399 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_UTILS_MATRIX_0400
     * @tc.name      Perf_UtilsMatrix_0400
     * @tc.desc      utils matrix 349,14763,4 keeps the counter contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_UtilsMatrix_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UtilsMatrix_0400 begin`);
      logInfo("utils matrix 349,14763,4");
      const actual: string = calculateNum(349, 14763) + '|' + calculateSteps(14763, 4) + '|' + utilsNumAfter(4, 14763) + '|' + resetNum();
      logInfo('actual=' + String(actual) + ', expected=' + "15112|59052|59052|0");
      expect(actual).assertEqual("15112|59052|59052|0");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}UtilsMatrix_0400 end`);
    });
  });
}
