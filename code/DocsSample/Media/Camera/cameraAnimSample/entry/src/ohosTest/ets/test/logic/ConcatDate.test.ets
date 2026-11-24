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
import { logInfo, BUNDLE } from '../common/CameraTestSupport';
import {
  concatDate,
} from '../model/CameraLogic';

/** ConcatDateTest logic checks (45 cases). */
export default function concatDateTest(): void {
  describe('ConcatDateTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0001
     * @tc.name      Camera_ConcatDate_0001
     * @tc.desc      concatDate(2026, 1, 1) formats the date as "20260101".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ConcatDate_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConcatDate_0001 begin`);
      logInfo("concatDate(2026, 1, 1)");
      const actual: string = concatDate(2026, 1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "20260101");
      expect(actual).assertEqual("20260101");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0002
     * @tc.name      Camera_ConcatDate_0002
     * @tc.desc      concatDate(2025, 12, 31) formats the date as "20251231".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0002 begin`);
      logInfo("concatDate(2025, 12, 31)");
      const actual: string = concatDate(2025, 12, 31);
      logInfo('actual=' + String(actual) + ', expected=' + "20251231");
      expect(actual).assertEqual("20251231");
      logInfo(`${BUNDLE}ConcatDate_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0003
     * @tc.name      Camera_ConcatDate_0003
     * @tc.desc      concatDate(2000, 1, 9) formats the date as "20000109".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0003 begin`);
      logInfo("concatDate(2000, 1, 9)");
      const actual: string = concatDate(2000, 1, 9);
      logInfo('actual=' + String(actual) + ', expected=' + "20000109");
      expect(actual).assertEqual("20000109");
      logInfo(`${BUNDLE}ConcatDate_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0004
     * @tc.name      Camera_ConcatDate_0004
     * @tc.desc      concatDate(1999, 10, 10) formats the date as "19991010".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0004 begin`);
      logInfo("concatDate(1999, 10, 10)");
      const actual: string = concatDate(1999, 10, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "19991010");
      expect(actual).assertEqual("19991010");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0005
     * @tc.name      Camera_ConcatDate_0005
     * @tc.desc      concatDate(2026, 0, 0) formats the date as "20260000".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0005 begin`);
      logInfo("concatDate(2026, 0, 0)");
      const actual: string = concatDate(2026, 0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "20260000");
      expect(actual).assertEqual("20260000");
      logInfo(`${BUNDLE}ConcatDate_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0006
     * @tc.name      Camera_ConcatDate_0006
     * @tc.desc      concatDate(2026, 13, 32) formats the date as "20261332".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0006 begin`);
      logInfo("concatDate(2026, 13, 32)");
      const actual: string = concatDate(2026, 13, 32);
      logInfo('actual=' + String(actual) + ', expected=' + "20261332");
      expect(actual).assertEqual("20261332");
      logInfo(`${BUNDLE}ConcatDate_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0007
     * @tc.name      Camera_ConcatDate_0007
     * @tc.desc      concatDate(1, 2, 3) formats the date as "10203".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0007 begin`);
      logInfo("concatDate(1, 2, 3)");
      const actual: string = concatDate(1, 2, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "10203");
      expect(actual).assertEqual("10203");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0008
     * @tc.name      Camera_ConcatDate_0008
     * @tc.desc      concatDate(0, 0, 0) formats the date as "00000".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0008 begin`);
      logInfo("concatDate(0, 0, 0)");
      const actual: string = concatDate(0, 0, 0);
      logInfo('actual=' + String(actual) + ', expected=' + "00000");
      expect(actual).assertEqual("00000");
      logInfo(`${BUNDLE}ConcatDate_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0009
     * @tc.name      Camera_ConcatDate_0009
     * @tc.desc      concatDate(99, 99, 99) formats the date as "999999".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0009 begin`);
      logInfo("concatDate(99, 99, 99)");
      const actual: string = concatDate(99, 99, 99);
      logInfo('actual=' + String(actual) + ', expected=' + "999999");
      expect(actual).assertEqual("999999");
      logInfo(`${BUNDLE}ConcatDate_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0010
     * @tc.name      Camera_ConcatDate_0010
     * @tc.desc      concatDate(100, 100, 100) formats the date as "100100100".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0010 begin`);
      logInfo("concatDate(100, 100, 100)");
      const actual: string = concatDate(100, 100, 100);
      logInfo('actual=' + String(actual) + ', expected=' + "100100100");
      expect(actual).assertEqual("100100100");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0011
     * @tc.name      Camera_ConcatDate_0011
     * @tc.desc      concatDate(2026, 9, 9) formats the date as "20260909".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0011 begin`);
      logInfo("concatDate(2026, 9, 9)");
      const actual: string = concatDate(2026, 9, 9);
      logInfo('actual=' + String(actual) + ', expected=' + "20260909");
      expect(actual).assertEqual("20260909");
      logInfo(`${BUNDLE}ConcatDate_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0012
     * @tc.name      Camera_ConcatDate_0012
     * @tc.desc      concatDate(2026, 10, 9) formats the date as "20261009".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ConcatDate_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConcatDate_0012 begin`);
      logInfo("concatDate(2026, 10, 9)");
      const actual: string = concatDate(2026, 10, 9);
      logInfo('actual=' + String(actual) + ', expected=' + "20261009");
      expect(actual).assertEqual("20261009");
      logInfo(`${BUNDLE}ConcatDate_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0013
     * @tc.name      Camera_ConcatDate_0013
     * @tc.desc      concatDate(2026, 9, 10) formats the date as "20260910".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0013 begin`);
      logInfo("concatDate(2026, 9, 10)");
      const actual: string = concatDate(2026, 9, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "20260910");
      expect(actual).assertEqual("20260910");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0014
     * @tc.name      Camera_ConcatDate_0014
     * @tc.desc      concatDate(2026, 10, 10) formats the date as "20261010".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0014 begin`);
      logInfo("concatDate(2026, 10, 10)");
      const actual: string = concatDate(2026, 10, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "20261010");
      expect(actual).assertEqual("20261010");
      logInfo(`${BUNDLE}ConcatDate_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0015
     * @tc.name      Camera_ConcatDate_0015
     * @tc.desc      concatDate(-1, -2, -3) formats the date as "-10-20-3".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0015 begin`);
      logInfo("concatDate(-1, -2, -3)");
      const actual: string = concatDate(-1, -2, -3);
      logInfo('actual=' + String(actual) + ', expected=' + "-10-20-3");
      expect(actual).assertEqual("-10-20-3");
      logInfo(`${BUNDLE}ConcatDate_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0016
     * @tc.name      Camera_ConcatDate_0016
     * @tc.desc      concatDate(-2026, 1, 1) formats the date as "-20260101".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0016 begin`);
      logInfo("concatDate(-2026, 1, 1)");
      const actual: string = concatDate(-2026, 1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "-20260101");
      expect(actual).assertEqual("-20260101");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0017
     * @tc.name      Camera_ConcatDate_0017
     * @tc.desc      concatDate(123456, 5, 6) formats the date as "1234560506".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0017 begin`);
      logInfo("concatDate(123456, 5, 6)");
      const actual: string = concatDate(123456, 5, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "1234560506");
      expect(actual).assertEqual("1234560506");
      logInfo(`${BUNDLE}ConcatDate_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0018
     * @tc.name      Camera_ConcatDate_0018
     * @tc.desc      concatDate(2026, 1, 31) formats the date as "20260131".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ConcatDate_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConcatDate_0018 begin`);
      logInfo("concatDate(2026, 1, 31)");
      const actual: string = concatDate(2026, 1, 31);
      logInfo('actual=' + String(actual) + ', expected=' + "20260131");
      expect(actual).assertEqual("20260131");
      logInfo(`${BUNDLE}ConcatDate_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0019
     * @tc.name      Camera_ConcatDate_0019
     * @tc.desc      concatDate(2026, 2, 29) formats the date as "20260229".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0019 begin`);
      logInfo("concatDate(2026, 2, 29)");
      const actual: string = concatDate(2026, 2, 29);
      logInfo('actual=' + String(actual) + ', expected=' + "20260229");
      expect(actual).assertEqual("20260229");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0020
     * @tc.name      Camera_ConcatDate_0020
     * @tc.desc      concatDate(2024, 2, 29) formats the date as "20240229".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0020 begin`);
      logInfo("concatDate(2024, 2, 29)");
      const actual: string = concatDate(2024, 2, 29);
      logInfo('actual=' + String(actual) + ', expected=' + "20240229");
      expect(actual).assertEqual("20240229");
      logInfo(`${BUNDLE}ConcatDate_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0021
     * @tc.name      Camera_ConcatDate_0021
     * @tc.desc      concatDate(1970, 1, 1) formats the date as "19700101".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0021 begin`);
      logInfo("concatDate(1970, 1, 1)");
      const actual: string = concatDate(1970, 1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "19700101");
      expect(actual).assertEqual("19700101");
      logInfo(`${BUNDLE}ConcatDate_0021 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0022
     * @tc.name      Camera_ConcatDate_0022
     * @tc.desc      concatDate(2038, 1, 19) formats the date as "20380119".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0022 begin`);
      logInfo("concatDate(2038, 1, 19)");
      const actual: string = concatDate(2038, 1, 19);
      logInfo('actual=' + String(actual) + ', expected=' + "20380119");
      expect(actual).assertEqual("20380119");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0022 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0023
     * @tc.name      Camera_ConcatDate_0023
     * @tc.desc      concatDate(2100, 12, 31) formats the date as "21001231".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ConcatDate_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConcatDate_0023 begin`);
      logInfo("concatDate(2100, 12, 31)");
      const actual: string = concatDate(2100, 12, 31);
      logInfo('actual=' + String(actual) + ', expected=' + "21001231");
      expect(actual).assertEqual("21001231");
      logInfo(`${BUNDLE}ConcatDate_0023 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0024
     * @tc.name      Camera_ConcatDate_0024
     * @tc.desc      concatDate(2026, 11, 5) formats the date as "20261105".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0024 begin`);
      logInfo("concatDate(2026, 11, 5)");
      const actual: string = concatDate(2026, 11, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "20261105");
      expect(actual).assertEqual("20261105");
      logInfo(`${BUNDLE}ConcatDate_0024 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0025
     * @tc.name      Camera_ConcatDate_0025
     * @tc.desc      concatDate(2026, 7, 4) formats the date as "20260704".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0025 begin`);
      logInfo("concatDate(2026, 7, 4)");
      const actual: string = concatDate(2026, 7, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "20260704");
      expect(actual).assertEqual("20260704");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0025 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0026
     * @tc.name      Camera_ConcatDate_0026
     * @tc.desc      concatDate(2026, 8, 15) formats the date as "20260815".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0026 begin`);
      logInfo("concatDate(2026, 8, 15)");
      const actual: string = concatDate(2026, 8, 15);
      logInfo('actual=' + String(actual) + ', expected=' + "20260815");
      expect(actual).assertEqual("20260815");
      logInfo(`${BUNDLE}ConcatDate_0026 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0027
     * @tc.name      Camera_ConcatDate_0027
     * @tc.desc      concatDate(2026, 6, 30) formats the date as "20260630".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0027 begin`);
      logInfo("concatDate(2026, 6, 30)");
      const actual: string = concatDate(2026, 6, 30);
      logInfo('actual=' + String(actual) + ', expected=' + "20260630");
      expect(actual).assertEqual("20260630");
      logInfo(`${BUNDLE}ConcatDate_0027 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0028
     * @tc.name      Camera_ConcatDate_0028
     * @tc.desc      concatDate(2026, 3, 14) formats the date as "20260314".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0028 begin`);
      logInfo("concatDate(2026, 3, 14)");
      const actual: string = concatDate(2026, 3, 14);
      logInfo('actual=' + String(actual) + ', expected=' + "20260314");
      expect(actual).assertEqual("20260314");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0028 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0029
     * @tc.name      Camera_ConcatDate_0029
     * @tc.desc      concatDate(2026, 4, 1) formats the date as "20260401".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0029 begin`);
      logInfo("concatDate(2026, 4, 1)");
      const actual: string = concatDate(2026, 4, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "20260401");
      expect(actual).assertEqual("20260401");
      logInfo(`${BUNDLE}ConcatDate_0029 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0030
     * @tc.name      Camera_ConcatDate_0030
     * @tc.desc      concatDate(2026, 5, 20) formats the date as "20260520".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0030 begin`);
      logInfo("concatDate(2026, 5, 20)");
      const actual: string = concatDate(2026, 5, 20);
      logInfo('actual=' + String(actual) + ', expected=' + "20260520");
      expect(actual).assertEqual("20260520");
      logInfo(`${BUNDLE}ConcatDate_0030 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0031
     * @tc.name      Camera_ConcatDate_0031
     * @tc.desc      concatDate(1, 1, 1) formats the date as "10101".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0031 begin`);
      logInfo("concatDate(1, 1, 1)");
      const actual: string = concatDate(1, 1, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "10101");
      expect(actual).assertEqual("10101");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0031 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0032
     * @tc.name      Camera_ConcatDate_0032
     * @tc.desc      concatDate(9, 9, 9) formats the date as "90909".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0032 begin`);
      logInfo("concatDate(9, 9, 9)");
      const actual: string = concatDate(9, 9, 9);
      logInfo('actual=' + String(actual) + ', expected=' + "90909");
      expect(actual).assertEqual("90909");
      logInfo(`${BUNDLE}ConcatDate_0032 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0033
     * @tc.name      Camera_ConcatDate_0033
     * @tc.desc      concatDate(10, 10, 10) formats the date as "101010".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0033 begin`);
      logInfo("concatDate(10, 10, 10)");
      const actual: string = concatDate(10, 10, 10);
      logInfo('actual=' + String(actual) + ', expected=' + "101010");
      expect(actual).assertEqual("101010");
      logInfo(`${BUNDLE}ConcatDate_0033 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0034
     * @tc.name      Camera_ConcatDate_0034
     * @tc.desc      concatDate(11, 11, 11) formats the date as "111111".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ConcatDate_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConcatDate_0034 begin`);
      logInfo("concatDate(11, 11, 11)");
      const actual: string = concatDate(11, 11, 11);
      logInfo('actual=' + String(actual) + ', expected=' + "111111");
      expect(actual).assertEqual("111111");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0034 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0035
     * @tc.name      Camera_ConcatDate_0035
     * @tc.desc      concatDate(12, 12, 12) formats the date as "121212".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_ConcatDate_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ConcatDate_0035 begin`);
      logInfo("concatDate(12, 12, 12)");
      const actual: string = concatDate(12, 12, 12);
      logInfo('actual=' + String(actual) + ', expected=' + "121212");
      expect(actual).assertEqual("121212");
      logInfo(`${BUNDLE}ConcatDate_0035 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0036
     * @tc.name      Camera_ConcatDate_0036
     * @tc.desc      concatDate(2, 11, 30) formats the date as "21130".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0036 begin`);
      logInfo("concatDate(2, 11, 30)");
      const actual: string = concatDate(2, 11, 30);
      logInfo('actual=' + String(actual) + ', expected=' + "21130");
      expect(actual).assertEqual("21130");
      logInfo(`${BUNDLE}ConcatDate_0036 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0037
     * @tc.name      Camera_ConcatDate_0037
     * @tc.desc      concatDate(2, 2, 2) formats the date as "20202".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0037 begin`);
      logInfo("concatDate(2, 2, 2)");
      const actual: string = concatDate(2, 2, 2);
      logInfo('actual=' + String(actual) + ', expected=' + "20202");
      expect(actual).assertEqual("20202");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0037 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0038
     * @tc.name      Camera_ConcatDate_0038
     * @tc.desc      concatDate(3, 3, 3) formats the date as "30303".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0038 begin`);
      logInfo("concatDate(3, 3, 3)");
      const actual: string = concatDate(3, 3, 3);
      logInfo('actual=' + String(actual) + ', expected=' + "30303");
      expect(actual).assertEqual("30303");
      logInfo(`${BUNDLE}ConcatDate_0038 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0039
     * @tc.name      Camera_ConcatDate_0039
     * @tc.desc      concatDate(4, 4, 4) formats the date as "40404".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0039 begin`);
      logInfo("concatDate(4, 4, 4)");
      const actual: string = concatDate(4, 4, 4);
      logInfo('actual=' + String(actual) + ', expected=' + "40404");
      expect(actual).assertEqual("40404");
      logInfo(`${BUNDLE}ConcatDate_0039 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0040
     * @tc.name      Camera_ConcatDate_0040
     * @tc.desc      concatDate(5, 5, 5) formats the date as "50505".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0040 begin`);
      logInfo("concatDate(5, 5, 5)");
      const actual: string = concatDate(5, 5, 5);
      logInfo('actual=' + String(actual) + ', expected=' + "50505");
      expect(actual).assertEqual("50505");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0040 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0041
     * @tc.name      Camera_ConcatDate_0041
     * @tc.desc      concatDate(6, 6, 6) formats the date as "60606".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0041 begin`);
      logInfo("concatDate(6, 6, 6)");
      const actual: string = concatDate(6, 6, 6);
      logInfo('actual=' + String(actual) + ', expected=' + "60606");
      expect(actual).assertEqual("60606");
      logInfo(`${BUNDLE}ConcatDate_0041 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0042
     * @tc.name      Camera_ConcatDate_0042
     * @tc.desc      concatDate(7, 7, 7) formats the date as "70707".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0042 begin`);
      logInfo("concatDate(7, 7, 7)");
      const actual: string = concatDate(7, 7, 7);
      logInfo('actual=' + String(actual) + ', expected=' + "70707");
      expect(actual).assertEqual("70707");
      logInfo(`${BUNDLE}ConcatDate_0042 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0043
     * @tc.name      Camera_ConcatDate_0043
     * @tc.desc      concatDate(8, 8, 8) formats the date as "80808".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0043 begin`);
      logInfo("concatDate(8, 8, 8)");
      const actual: string = concatDate(8, 8, 8);
      logInfo('actual=' + String(actual) + ', expected=' + "80808");
      expect(actual).assertEqual("80808");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ConcatDate_0043 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0044
     * @tc.name      Camera_ConcatDate_0044
     * @tc.desc      concatDate(2026, 1, 9) formats the date as "20260109".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_ConcatDate_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConcatDate_0044 begin`);
      logInfo("concatDate(2026, 1, 9)");
      const actual: string = concatDate(2026, 1, 9);
      logInfo('actual=' + String(actual) + ', expected=' + "20260109");
      expect(actual).assertEqual("20260109");
      logInfo(`${BUNDLE}ConcatDate_0044 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_CONCAT_DATE_0045
     * @tc.name      Camera_ConcatDate_0045
     * @tc.desc      concatDate(2026, 10, 1) formats the date as "20261001".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_ConcatDate_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConcatDate_0045 begin`);
      logInfo("concatDate(2026, 10, 1)");
      const actual: string = concatDate(2026, 10, 1);
      logInfo('actual=' + String(actual) + ', expected=' + "20261001");
      expect(actual).assertEqual("20261001");
      logInfo(`${BUNDLE}ConcatDate_0045 end`);
    });
  });
}
