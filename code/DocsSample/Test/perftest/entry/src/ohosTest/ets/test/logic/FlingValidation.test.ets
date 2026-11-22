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
  flingVelocityValid,
  flingStepsValid,
  scrollToTopValid,
} from '../model/PerfTestLogic';

/** FlingValidationTest logic checks (32 cases). */
export default function flingValidationTest(): void {
  describe('FlingValidationTest', (): void => {
    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0001
     * @tc.name      Perf_FlingValid_0001
     * @tc.desc      fling validation for 0,2,6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_FlingValid_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlingValid_0001 begin`);
      logInfo("flingVelocityValid(0) + ':' + flingStepsValid(2) + ':' + scrollToTopValid(6)");
      const actual: string = flingVelocityValid(0) + ':' + flingStepsValid(2) + ':' + scrollToTopValid(6);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlingValid_0001 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0002
     * @tc.name      Perf_FlingValid_0002
     * @tc.desc      fling validation for 1,3,7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0002 begin`);
      logInfo("flingVelocityValid(1) + ':' + flingStepsValid(3) + ':' + scrollToTopValid(7)");
      const actual: string = flingVelocityValid(1) + ':' + flingStepsValid(3) + ':' + scrollToTopValid(7);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0002 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0003
     * @tc.name      Perf_FlingValid_0003
     * @tc.desc      fling validation for -1,4,8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0003 begin`);
      logInfo("flingVelocityValid(-1) + ':' + flingStepsValid(4) + ':' + scrollToTopValid(8)");
      const actual: string = flingVelocityValid(-1) + ':' + flingStepsValid(4) + ':' + scrollToTopValid(8);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0003 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0004
     * @tc.name      Perf_FlingValid_0004
     * @tc.desc      fling validation for 2,5,9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0004 begin`);
      logInfo("flingVelocityValid(2) + ':' + flingStepsValid(5) + ':' + scrollToTopValid(9)");
      const actual: string = flingVelocityValid(2) + ':' + flingStepsValid(5) + ':' + scrollToTopValid(9);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlingValid_0004 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0005
     * @tc.name      Perf_FlingValid_0005
     * @tc.desc      fling validation for 3,6,10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0005 begin`);
      logInfo("flingVelocityValid(3) + ':' + flingStepsValid(6) + ':' + scrollToTopValid(10)");
      const actual: string = flingVelocityValid(3) + ':' + flingStepsValid(6) + ':' + scrollToTopValid(10);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0005 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0006
     * @tc.name      Perf_FlingValid_0006
     * @tc.desc      fling validation for 4,7,11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0006 begin`);
      logInfo("flingVelocityValid(4) + ':' + flingStepsValid(7) + ':' + scrollToTopValid(11)");
      const actual: string = flingVelocityValid(4) + ':' + flingStepsValid(7) + ':' + scrollToTopValid(11);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0006 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0007
     * @tc.name      Perf_FlingValid_0007
     * @tc.desc      fling validation for 5,8,12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0007 begin`);
      logInfo("flingVelocityValid(5) + ':' + flingStepsValid(8) + ':' + scrollToTopValid(12)");
      const actual: string = flingVelocityValid(5) + ':' + flingStepsValid(8) + ':' + scrollToTopValid(12);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlingValid_0007 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0008
     * @tc.name      Perf_FlingValid_0008
     * @tc.desc      fling validation for 6,9,13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0008 begin`);
      logInfo("flingVelocityValid(6) + ':' + flingStepsValid(9) + ':' + scrollToTopValid(13)");
      const actual: string = flingVelocityValid(6) + ':' + flingStepsValid(9) + ':' + scrollToTopValid(13);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0008 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0009
     * @tc.name      Perf_FlingValid_0009
     * @tc.desc      fling validation for 7,10,14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0009 begin`);
      logInfo("flingVelocityValid(7) + ':' + flingStepsValid(10) + ':' + scrollToTopValid(14)");
      const actual: string = flingVelocityValid(7) + ':' + flingStepsValid(10) + ':' + scrollToTopValid(14);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0009 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0010
     * @tc.name      Perf_FlingValid_0010
     * @tc.desc      fling validation for 8,11,15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0010 begin`);
      logInfo("flingVelocityValid(8) + ':' + flingStepsValid(11) + ':' + scrollToTopValid(15)");
      const actual: string = flingVelocityValid(8) + ':' + flingStepsValid(11) + ':' + scrollToTopValid(15);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlingValid_0010 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0011
     * @tc.name      Perf_FlingValid_0011
     * @tc.desc      fling validation for 9,12,16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0011 begin`);
      logInfo("flingVelocityValid(9) + ':' + flingStepsValid(12) + ':' + scrollToTopValid(16)");
      const actual: string = flingVelocityValid(9) + ':' + flingStepsValid(12) + ':' + scrollToTopValid(16);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0011 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0012
     * @tc.name      Perf_FlingValid_0012
     * @tc.desc      fling validation for 10,13,20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_FlingValid_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlingValid_0012 begin`);
      logInfo("flingVelocityValid(10) + ':' + flingStepsValid(13) + ':' + scrollToTopValid(20)");
      const actual: string = flingVelocityValid(10) + ':' + flingStepsValid(13) + ':' + scrollToTopValid(20);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0012 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0013
     * @tc.name      Perf_FlingValid_0013
     * @tc.desc      fling validation for 11,14,24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0013 begin`);
      logInfo("flingVelocityValid(11) + ':' + flingStepsValid(14) + ':' + scrollToTopValid(24)");
      const actual: string = flingVelocityValid(11) + ':' + flingStepsValid(14) + ':' + scrollToTopValid(24);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlingValid_0013 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0014
     * @tc.name      Perf_FlingValid_0014
     * @tc.desc      fling validation for 12,15,25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0014 begin`);
      logInfo("flingVelocityValid(12) + ':' + flingStepsValid(15) + ':' + scrollToTopValid(25)");
      const actual: string = flingVelocityValid(12) + ':' + flingStepsValid(15) + ':' + scrollToTopValid(25);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0014 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0015
     * @tc.name      Perf_FlingValid_0015
     * @tc.desc      fling validation for 13,16,30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0015 begin`);
      logInfo("flingVelocityValid(13) + ':' + flingStepsValid(16) + ':' + scrollToTopValid(30)");
      const actual: string = flingVelocityValid(13) + ':' + flingStepsValid(16) + ':' + scrollToTopValid(30);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0015 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0016
     * @tc.name      Perf_FlingValid_0016
     * @tc.desc      fling validation for 14,20,32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0016 begin`);
      logInfo("flingVelocityValid(14) + ':' + flingStepsValid(20) + ':' + scrollToTopValid(32)");
      const actual: string = flingVelocityValid(14) + ':' + flingStepsValid(20) + ':' + scrollToTopValid(32);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlingValid_0016 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0017
     * @tc.name      Perf_FlingValid_0017
     * @tc.desc      fling validation for 15,24,40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0017 begin`);
      logInfo("flingVelocityValid(15) + ':' + flingStepsValid(24) + ':' + scrollToTopValid(40)");
      const actual: string = flingVelocityValid(15) + ':' + flingStepsValid(24) + ':' + scrollToTopValid(40);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0017 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0018
     * @tc.name      Perf_FlingValid_0018
     * @tc.desc      fling validation for 16,25,45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Perf_FlingValid_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlingValid_0018 begin`);
      logInfo("flingVelocityValid(16) + ':' + flingStepsValid(25) + ':' + scrollToTopValid(45)");
      const actual: string = flingVelocityValid(16) + ':' + flingStepsValid(25) + ':' + scrollToTopValid(45);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0018 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0019
     * @tc.name      Perf_FlingValid_0019
     * @tc.desc      fling validation for 20,30,50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0019 begin`);
      logInfo("flingVelocityValid(20) + ':' + flingStepsValid(30) + ':' + scrollToTopValid(50)");
      const actual: string = flingVelocityValid(20) + ':' + flingStepsValid(30) + ':' + scrollToTopValid(50);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlingValid_0019 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0020
     * @tc.name      Perf_FlingValid_0020
     * @tc.desc      fling validation for 24,32,60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0020 begin`);
      logInfo("flingVelocityValid(24) + ':' + flingStepsValid(32) + ':' + scrollToTopValid(60)");
      const actual: string = flingVelocityValid(24) + ':' + flingStepsValid(32) + ':' + scrollToTopValid(60);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0020 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0021
     * @tc.name      Perf_FlingValid_0021
     * @tc.desc      fling validation for 25,40,64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0021 begin`);
      logInfo("flingVelocityValid(25) + ':' + flingStepsValid(40) + ':' + scrollToTopValid(64)");
      const actual: string = flingVelocityValid(25) + ':' + flingStepsValid(40) + ':' + scrollToTopValid(64);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0021 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0022
     * @tc.name      Perf_FlingValid_0022
     * @tc.desc      fling validation for 30,45,70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0022 begin`);
      logInfo("flingVelocityValid(30) + ':' + flingStepsValid(45) + ':' + scrollToTopValid(70)");
      const actual: string = flingVelocityValid(30) + ':' + flingStepsValid(45) + ':' + scrollToTopValid(70);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlingValid_0022 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0023
     * @tc.name      Perf_FlingValid_0023
     * @tc.desc      fling validation for 32,50,80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Perf_FlingValid_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlingValid_0023 begin`);
      logInfo("flingVelocityValid(32) + ':' + flingStepsValid(50) + ':' + scrollToTopValid(80)");
      const actual: string = flingVelocityValid(32) + ':' + flingStepsValid(50) + ':' + scrollToTopValid(80);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0023 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0024
     * @tc.name      Perf_FlingValid_0024
     * @tc.desc      fling validation for 40,60,90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0024 begin`);
      logInfo("flingVelocityValid(40) + ':' + flingStepsValid(60) + ':' + scrollToTopValid(90)");
      const actual: string = flingVelocityValid(40) + ':' + flingStepsValid(60) + ':' + scrollToTopValid(90);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0024 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0025
     * @tc.name      Perf_FlingValid_0025
     * @tc.desc      fling validation for 45,64,99.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0025 begin`);
      logInfo("flingVelocityValid(45) + ':' + flingStepsValid(64) + ':' + scrollToTopValid(99)");
      const actual: string = flingVelocityValid(45) + ':' + flingStepsValid(64) + ':' + scrollToTopValid(99);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlingValid_0025 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0026
     * @tc.name      Perf_FlingValid_0026
     * @tc.desc      fling validation for 50,70,100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0026 begin`);
      logInfo("flingVelocityValid(50) + ':' + flingStepsValid(70) + ':' + scrollToTopValid(100)");
      const actual: string = flingVelocityValid(50) + ':' + flingStepsValid(70) + ':' + scrollToTopValid(100);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0026 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0027
     * @tc.name      Perf_FlingValid_0027
     * @tc.desc      fling validation for 60,80,120.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0027 begin`);
      logInfo("flingVelocityValid(60) + ':' + flingStepsValid(80) + ':' + scrollToTopValid(120)");
      const actual: string = flingVelocityValid(60) + ':' + flingStepsValid(80) + ':' + scrollToTopValid(120);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}FlingValid_0027 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0028
     * @tc.name      Perf_FlingValid_0028
     * @tc.desc      fling validation for 64,90,150.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0028 begin`);
      logInfo("flingVelocityValid(64) + ':' + flingStepsValid(90) + ':' + scrollToTopValid(150)");
      const actual: string = flingVelocityValid(64) + ':' + flingStepsValid(90) + ':' + scrollToTopValid(150);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlingValid_0028 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0029
     * @tc.name      Perf_FlingValid_0029
     * @tc.desc      fling validation for 70,99,200.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0029 begin`);
      logInfo("flingVelocityValid(70) + ':' + flingStepsValid(99) + ':' + scrollToTopValid(200)");
      const actual: string = flingVelocityValid(70) + ':' + flingStepsValid(99) + ':' + scrollToTopValid(200);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}FlingValid_0029 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0030
     * @tc.name      Perf_FlingValid_0030
     * @tc.desc      fling validation for 80,100,250.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0030 begin`);
      logInfo("flingVelocityValid(80) + ':' + flingStepsValid(100) + ':' + scrollToTopValid(250)");
      const actual: string = flingVelocityValid(80) + ':' + flingStepsValid(100) + ':' + scrollToTopValid(250);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}FlingValid_0030 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0031
     * @tc.name      Perf_FlingValid_0031
     * @tc.desc      fling validation for 90,120,255.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0031 begin`);
      logInfo("flingVelocityValid(90) + ':' + flingStepsValid(120) + ':' + scrollToTopValid(255)");
      const actual: string = flingVelocityValid(90) + ':' + flingStepsValid(120) + ':' + scrollToTopValid(255);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true");
      expect(actual).assertEqual("false:false:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlingValid_0031 end`);
    });

    /**
     * @tc.number    SUB_PERFTEST_FLING_VALID_0032
     * @tc.name      Perf_FlingValid_0032
     * @tc.desc      fling validation for 99,150,256.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Perf_FlingValid_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlingValid_0032 begin`);
      logInfo("flingVelocityValid(99) + ':' + flingStepsValid(150) + ':' + scrollToTopValid(256)");
      const actual: string = flingVelocityValid(99) + ':' + flingStepsValid(150) + ':' + scrollToTopValid(256);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false:true");
      expect(actual).assertEqual("false:false:true");
      logInfo(`${BUNDLE}FlingValid_0032 end`);
    });
  });
}
