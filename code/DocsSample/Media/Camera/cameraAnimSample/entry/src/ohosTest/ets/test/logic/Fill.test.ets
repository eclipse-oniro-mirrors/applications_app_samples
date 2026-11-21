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
  fill,
} from '../model/CameraLogic';

/** FillTest logic checks (46 cases). */
export default function fillTest(): void {
  describe('FillTest', (): void => {
    /**
     * @tc.number    SUB_CAMERA_FILL_0001
     * @tc.name      Camera_Fill_0001
     * @tc.desc      fill(1) returns "01" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_Fill_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Fill_0001 begin`);
      logInfo("fill(1)");
      const actual: string = fill(1);
      logInfo('actual=' + String(actual) + ', expected=' + "01");
      expect(actual).assertEqual("01");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fill_0001 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0002
     * @tc.name      Camera_Fill_0002
     * @tc.desc      fill(-1) returns "0-1" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0002 begin`);
      logInfo("fill(-1)");
      const actual: string = fill(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "0-1");
      expect(actual).assertEqual("0-1");
      logInfo(`${BUNDLE}Fill_0002 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0003
     * @tc.name      Camera_Fill_0003
     * @tc.desc      fill(2) returns "02" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0003 begin`);
      logInfo("fill(2)");
      const actual: string = fill(2);
      logInfo('actual=' + String(actual) + ', expected=' + "02");
      expect(actual).assertEqual("02");
      logInfo(`${BUNDLE}Fill_0003 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0004
     * @tc.name      Camera_Fill_0004
     * @tc.desc      fill(3) returns "03" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0004 begin`);
      logInfo("fill(3)");
      const actual: string = fill(3);
      logInfo('actual=' + String(actual) + ', expected=' + "03");
      expect(actual).assertEqual("03");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fill_0004 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0005
     * @tc.name      Camera_Fill_0005
     * @tc.desc      fill(4) returns "04" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0005 begin`);
      logInfo("fill(4)");
      const actual: string = fill(4);
      logInfo('actual=' + String(actual) + ', expected=' + "04");
      expect(actual).assertEqual("04");
      logInfo(`${BUNDLE}Fill_0005 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0006
     * @tc.name      Camera_Fill_0006
     * @tc.desc      fill(5) returns "05" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0006 begin`);
      logInfo("fill(5)");
      const actual: string = fill(5);
      logInfo('actual=' + String(actual) + ', expected=' + "05");
      expect(actual).assertEqual("05");
      logInfo(`${BUNDLE}Fill_0006 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0007
     * @tc.name      Camera_Fill_0007
     * @tc.desc      fill(6) returns "06" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0007 begin`);
      logInfo("fill(6)");
      const actual: string = fill(6);
      logInfo('actual=' + String(actual) + ', expected=' + "06");
      expect(actual).assertEqual("06");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fill_0007 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0008
     * @tc.name      Camera_Fill_0008
     * @tc.desc      fill(7) returns "07" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0008 begin`);
      logInfo("fill(7)");
      const actual: string = fill(7);
      logInfo('actual=' + String(actual) + ', expected=' + "07");
      expect(actual).assertEqual("07");
      logInfo(`${BUNDLE}Fill_0008 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0009
     * @tc.name      Camera_Fill_0009
     * @tc.desc      fill(8) returns "08" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0009 begin`);
      logInfo("fill(8)");
      const actual: string = fill(8);
      logInfo('actual=' + String(actual) + ', expected=' + "08");
      expect(actual).assertEqual("08");
      logInfo(`${BUNDLE}Fill_0009 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0010
     * @tc.name      Camera_Fill_0010
     * @tc.desc      fill(9) returns "09" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0010 begin`);
      logInfo("fill(9)");
      const actual: string = fill(9);
      logInfo('actual=' + String(actual) + ', expected=' + "09");
      expect(actual).assertEqual("09");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fill_0010 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0011
     * @tc.name      Camera_Fill_0011
     * @tc.desc      fill(10) returns "10" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0011 begin`);
      logInfo("fill(10)");
      const actual: string = fill(10);
      logInfo('actual=' + String(actual) + ', expected=' + "10");
      expect(actual).assertEqual("10");
      logInfo(`${BUNDLE}Fill_0011 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0012
     * @tc.name      Camera_Fill_0012
     * @tc.desc      fill(11) returns "11" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Camera_Fill_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Fill_0012 begin`);
      logInfo("fill(11)");
      const actual: string = fill(11);
      logInfo('actual=' + String(actual) + ', expected=' + "11");
      expect(actual).assertEqual("11");
      logInfo(`${BUNDLE}Fill_0012 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0013
     * @tc.name      Camera_Fill_0013
     * @tc.desc      fill(12) returns "12" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0013 begin`);
      logInfo("fill(12)");
      const actual: string = fill(12);
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual("12");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fill_0013 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0014
     * @tc.name      Camera_Fill_0014
     * @tc.desc      fill(14) returns "14" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0014 begin`);
      logInfo("fill(14)");
      const actual: string = fill(14);
      logInfo('actual=' + String(actual) + ', expected=' + "14");
      expect(actual).assertEqual("14");
      logInfo(`${BUNDLE}Fill_0014 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0015
     * @tc.name      Camera_Fill_0015
     * @tc.desc      fill(15) returns "15" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0015 begin`);
      logInfo("fill(15)");
      const actual: string = fill(15);
      logInfo('actual=' + String(actual) + ', expected=' + "15");
      expect(actual).assertEqual("15");
      logInfo(`${BUNDLE}Fill_0015 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0016
     * @tc.name      Camera_Fill_0016
     * @tc.desc      fill(20) returns "20" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0016 begin`);
      logInfo("fill(20)");
      const actual: string = fill(20);
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual("20");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fill_0016 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0017
     * @tc.name      Camera_Fill_0017
     * @tc.desc      fill(24) returns "24" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0017 begin`);
      logInfo("fill(24)");
      const actual: string = fill(24);
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual("24");
      logInfo(`${BUNDLE}Fill_0017 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0018
     * @tc.name      Camera_Fill_0018
     * @tc.desc      fill(25) returns "25" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Camera_Fill_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Fill_0018 begin`);
      logInfo("fill(25)");
      const actual: string = fill(25);
      logInfo('actual=' + String(actual) + ', expected=' + "25");
      expect(actual).assertEqual("25");
      logInfo(`${BUNDLE}Fill_0018 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0019
     * @tc.name      Camera_Fill_0019
     * @tc.desc      fill(28) returns "28" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0019 begin`);
      logInfo("fill(28)");
      const actual: string = fill(28);
      logInfo('actual=' + String(actual) + ', expected=' + "28");
      expect(actual).assertEqual("28");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Fill_0019 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0020
     * @tc.name      Camera_Fill_0020
     * @tc.desc      fill(30) returns "30" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Camera_Fill_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Fill_0020 begin`);
      logInfo("fill(30)");
      const actual: string = fill(30);
      logInfo('actual=' + String(actual) + ', expected=' + "30");
      expect(actual).assertEqual("30");
      logInfo(`${BUNDLE}Fill_0020 end`);
    });

    /**
     * @tc.number    SUB_CAMERA_FILL_0021
     * @tc.name      Camera_Fill_0021
     * @tc.desc      fill(40) returns "40" for two-digit padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
