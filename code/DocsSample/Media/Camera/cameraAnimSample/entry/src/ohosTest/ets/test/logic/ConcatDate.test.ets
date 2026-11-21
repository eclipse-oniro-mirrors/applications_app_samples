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
