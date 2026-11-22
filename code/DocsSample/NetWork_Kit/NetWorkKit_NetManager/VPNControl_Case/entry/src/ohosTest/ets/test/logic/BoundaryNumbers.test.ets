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
import { logInfo, BUNDLE } from '../common/VPNTestSupport';
import {
  mtuValid,
  portValid,
  prefixValid,
} from '../model/VPNLogic';

/** BoundaryNumbersTest logic checks (46 cases). */
export default function boundaryNumbersTest(): void {
  describe('BoundaryNumbersTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0001
     * @tc.name      VPN_Boundary_0001
     * @tc.desc      boundary validation for 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Boundary_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Boundary_0001 begin`);
      logInfo("mtuValid(6) + ':' + portValid(6) + ':' + prefixValid(6)");
      const actual: string = mtuValid(6) + ':' + portValid(6) + ':' + prefixValid(6);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0002
     * @tc.name      VPN_Boundary_0002
     * @tc.desc      boundary validation for 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0002 begin`);
      logInfo("mtuValid(7) + ':' + portValid(7) + ':' + prefixValid(7)");
      const actual: string = mtuValid(7) + ':' + portValid(7) + ':' + prefixValid(7);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}Boundary_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0003
     * @tc.name      VPN_Boundary_0003
     * @tc.desc      boundary validation for 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0003 begin`);
      logInfo("mtuValid(8) + ':' + portValid(8) + ':' + prefixValid(8)");
      const actual: string = mtuValid(8) + ':' + portValid(8) + ':' + prefixValid(8);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}Boundary_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0004
     * @tc.name      VPN_Boundary_0004
     * @tc.desc      boundary validation for 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0004 begin`);
      logInfo("mtuValid(9) + ':' + portValid(9) + ':' + prefixValid(9)");
      const actual: string = mtuValid(9) + ':' + portValid(9) + ':' + prefixValid(9);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0005
     * @tc.name      VPN_Boundary_0005
     * @tc.desc      boundary validation for 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0005 begin`);
      logInfo("mtuValid(10) + ':' + portValid(10) + ':' + prefixValid(10)");
      const actual: string = mtuValid(10) + ':' + portValid(10) + ':' + prefixValid(10);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}Boundary_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0006
     * @tc.name      VPN_Boundary_0006
     * @tc.desc      boundary validation for 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0006 begin`);
      logInfo("mtuValid(11) + ':' + portValid(11) + ':' + prefixValid(11)");
      const actual: string = mtuValid(11) + ':' + portValid(11) + ':' + prefixValid(11);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}Boundary_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0007
     * @tc.name      VPN_Boundary_0007
     * @tc.desc      boundary validation for 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0007 begin`);
      logInfo("mtuValid(12) + ':' + portValid(12) + ':' + prefixValid(12)");
      const actual: string = mtuValid(12) + ':' + portValid(12) + ':' + prefixValid(12);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0008
     * @tc.name      VPN_Boundary_0008
     * @tc.desc      boundary validation for 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0008 begin`);
      logInfo("mtuValid(13) + ':' + portValid(13) + ':' + prefixValid(13)");
      const actual: string = mtuValid(13) + ':' + portValid(13) + ':' + prefixValid(13);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}Boundary_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0009
     * @tc.name      VPN_Boundary_0009
     * @tc.desc      boundary validation for 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0009 begin`);
      logInfo("mtuValid(14) + ':' + portValid(14) + ':' + prefixValid(14)");
      const actual: string = mtuValid(14) + ':' + portValid(14) + ':' + prefixValid(14);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}Boundary_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0010
     * @tc.name      VPN_Boundary_0010
     * @tc.desc      boundary validation for 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0010 begin`);
      logInfo("mtuValid(15) + ':' + portValid(15) + ':' + prefixValid(15)");
      const actual: string = mtuValid(15) + ':' + portValid(15) + ':' + prefixValid(15);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0011
     * @tc.name      VPN_Boundary_0011
     * @tc.desc      boundary validation for 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0011 begin`);
      logInfo("mtuValid(16) + ':' + portValid(16) + ':' + prefixValid(16)");
      const actual: string = mtuValid(16) + ':' + portValid(16) + ':' + prefixValid(16);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}Boundary_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0012
     * @tc.name      VPN_Boundary_0012
     * @tc.desc      boundary validation for 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Boundary_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Boundary_0012 begin`);
      logInfo("mtuValid(17) + ':' + portValid(17) + ':' + prefixValid(17)");
      const actual: string = mtuValid(17) + ':' + portValid(17) + ':' + prefixValid(17);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}Boundary_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0013
     * @tc.name      VPN_Boundary_0013
     * @tc.desc      boundary validation for 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0013 begin`);
      logInfo("mtuValid(20) + ':' + portValid(20) + ':' + prefixValid(20)");
      const actual: string = mtuValid(20) + ':' + portValid(20) + ':' + prefixValid(20);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0014
     * @tc.name      VPN_Boundary_0014
     * @tc.desc      boundary validation for 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0014 begin`);
      logInfo("mtuValid(24) + ':' + portValid(24) + ':' + prefixValid(24)");
      const actual: string = mtuValid(24) + ':' + portValid(24) + ':' + prefixValid(24);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}Boundary_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0015
     * @tc.name      VPN_Boundary_0015
     * @tc.desc      boundary validation for 25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0015 begin`);
      logInfo("mtuValid(25) + ':' + portValid(25) + ':' + prefixValid(25)");
      const actual: string = mtuValid(25) + ':' + portValid(25) + ':' + prefixValid(25);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}Boundary_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0016
     * @tc.name      VPN_Boundary_0016
     * @tc.desc      boundary validation for 28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0016 begin`);
      logInfo("mtuValid(28) + ':' + portValid(28) + ':' + prefixValid(28)");
      const actual: string = mtuValid(28) + ':' + portValid(28) + ':' + prefixValid(28);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0017
     * @tc.name      VPN_Boundary_0017
     * @tc.desc      boundary validation for 30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0017 begin`);
      logInfo("mtuValid(30) + ':' + portValid(30) + ':' + prefixValid(30)");
      const actual: string = mtuValid(30) + ':' + portValid(30) + ':' + prefixValid(30);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}Boundary_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0018
     * @tc.name      VPN_Boundary_0018
     * @tc.desc      boundary validation for 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_Boundary_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Boundary_0018 begin`);
      logInfo("mtuValid(32) + ':' + portValid(32) + ':' + prefixValid(32)");
      const actual: string = mtuValid(32) + ':' + portValid(32) + ':' + prefixValid(32);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:true");
      expect(actual).assertEqual("false:true:true");
      logInfo(`${BUNDLE}Boundary_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0019
     * @tc.name      VPN_Boundary_0019
     * @tc.desc      boundary validation for 33.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0019 begin`);
      logInfo("mtuValid(33) + ':' + portValid(33) + ':' + prefixValid(33)");
      const actual: string = mtuValid(33) + ':' + portValid(33) + ':' + prefixValid(33);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0020
     * @tc.name      VPN_Boundary_0020
     * @tc.desc      boundary validation for 40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0020 begin`);
      logInfo("mtuValid(40) + ':' + portValid(40) + ':' + prefixValid(40)");
      const actual: string = mtuValid(40) + ':' + portValid(40) + ':' + prefixValid(40);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}Boundary_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0021
     * @tc.name      VPN_Boundary_0021
     * @tc.desc      boundary validation for 45.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0021 begin`);
      logInfo("mtuValid(45) + ':' + portValid(45) + ':' + prefixValid(45)");
      const actual: string = mtuValid(45) + ':' + portValid(45) + ':' + prefixValid(45);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}Boundary_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0022
     * @tc.name      VPN_Boundary_0022
     * @tc.desc      boundary validation for 48.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0022 begin`);
      logInfo("mtuValid(48) + ':' + portValid(48) + ':' + prefixValid(48)");
      const actual: string = mtuValid(48) + ':' + portValid(48) + ':' + prefixValid(48);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0023
     * @tc.name      VPN_Boundary_0023
     * @tc.desc      boundary validation for 50.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Boundary_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Boundary_0023 begin`);
      logInfo("mtuValid(50) + ':' + portValid(50) + ':' + prefixValid(50)");
      const actual: string = mtuValid(50) + ':' + portValid(50) + ':' + prefixValid(50);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}Boundary_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0024
     * @tc.name      VPN_Boundary_0024
     * @tc.desc      boundary validation for 55.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0024 begin`);
      logInfo("mtuValid(55) + ':' + portValid(55) + ':' + prefixValid(55)");
      const actual: string = mtuValid(55) + ':' + portValid(55) + ':' + prefixValid(55);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}Boundary_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0025
     * @tc.name      VPN_Boundary_0025
     * @tc.desc      boundary validation for 60.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0025 begin`);
      logInfo("mtuValid(60) + ':' + portValid(60) + ':' + prefixValid(60)");
      const actual: string = mtuValid(60) + ':' + portValid(60) + ':' + prefixValid(60);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0026
     * @tc.name      VPN_Boundary_0026
     * @tc.desc      boundary validation for 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0026 begin`);
      logInfo("mtuValid(64) + ':' + portValid(64) + ':' + prefixValid(64)");
      const actual: string = mtuValid(64) + ':' + portValid(64) + ':' + prefixValid(64);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true:false");
      expect(actual).assertEqual("false:true:false");
      logInfo(`${BUNDLE}Boundary_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0027
     * @tc.name      VPN_Boundary_0027
     * @tc.desc      boundary validation for 68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0027 begin`);
      logInfo("mtuValid(68) + ':' + portValid(68) + ':' + prefixValid(68)");
      const actual: string = mtuValid(68) + ':' + portValid(68) + ':' + prefixValid(68);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo(`${BUNDLE}Boundary_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0028
     * @tc.name      VPN_Boundary_0028
     * @tc.desc      boundary validation for 70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0028 begin`);
      logInfo("mtuValid(70) + ':' + portValid(70) + ':' + prefixValid(70)");
      const actual: string = mtuValid(70) + ':' + portValid(70) + ':' + prefixValid(70);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0029
     * @tc.name      VPN_Boundary_0029
     * @tc.desc      boundary validation for 72.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0029 begin`);
      logInfo("mtuValid(72) + ':' + portValid(72) + ':' + prefixValid(72)");
      const actual: string = mtuValid(72) + ':' + portValid(72) + ':' + prefixValid(72);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo(`${BUNDLE}Boundary_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0030
     * @tc.name      VPN_Boundary_0030
     * @tc.desc      boundary validation for 80.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0030 begin`);
      logInfo("mtuValid(80) + ':' + portValid(80) + ':' + prefixValid(80)");
      const actual: string = mtuValid(80) + ':' + portValid(80) + ':' + prefixValid(80);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo(`${BUNDLE}Boundary_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0031
     * @tc.name      VPN_Boundary_0031
     * @tc.desc      boundary validation for 90.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0031 begin`);
      logInfo("mtuValid(90) + ':' + portValid(90) + ':' + prefixValid(90)");
      const actual: string = mtuValid(90) + ':' + portValid(90) + ':' + prefixValid(90);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0032
     * @tc.name      VPN_Boundary_0032
     * @tc.desc      boundary validation for 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0032 begin`);
      logInfo("mtuValid(100) + ':' + portValid(100) + ':' + prefixValid(100)");
      const actual: string = mtuValid(100) + ':' + portValid(100) + ':' + prefixValid(100);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo(`${BUNDLE}Boundary_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0033
     * @tc.name      VPN_Boundary_0033
     * @tc.desc      boundary validation for 120.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0033 begin`);
      logInfo("mtuValid(120) + ':' + portValid(120) + ':' + prefixValid(120)");
      const actual: string = mtuValid(120) + ':' + portValid(120) + ':' + prefixValid(120);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo(`${BUNDLE}Boundary_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0034
     * @tc.name      VPN_Boundary_0034
     * @tc.desc      boundary validation for 128.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Boundary_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Boundary_0034 begin`);
      logInfo("mtuValid(128) + ':' + portValid(128) + ':' + prefixValid(128)");
      const actual: string = mtuValid(128) + ':' + portValid(128) + ':' + prefixValid(128);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0035
     * @tc.name      VPN_Boundary_0035
     * @tc.desc      boundary validation for 140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_Boundary_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Boundary_0035 begin`);
      logInfo("mtuValid(140) + ':' + portValid(140) + ':' + prefixValid(140)");
      const actual: string = mtuValid(140) + ':' + portValid(140) + ':' + prefixValid(140);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo(`${BUNDLE}Boundary_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0036
     * @tc.name      VPN_Boundary_0036
     * @tc.desc      boundary validation for 150.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0036 begin`);
      logInfo("mtuValid(150) + ':' + portValid(150) + ':' + prefixValid(150)");
      const actual: string = mtuValid(150) + ':' + portValid(150) + ':' + prefixValid(150);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo(`${BUNDLE}Boundary_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0037
     * @tc.name      VPN_Boundary_0037
     * @tc.desc      boundary validation for 200.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0037 begin`);
      logInfo("mtuValid(200) + ':' + portValid(200) + ':' + prefixValid(200)");
      const actual: string = mtuValid(200) + ':' + portValid(200) + ':' + prefixValid(200);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0038
     * @tc.name      VPN_Boundary_0038
     * @tc.desc      boundary validation for 255.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0038 begin`);
      logInfo("mtuValid(255) + ':' + portValid(255) + ':' + prefixValid(255)");
      const actual: string = mtuValid(255) + ':' + portValid(255) + ':' + prefixValid(255);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo(`${BUNDLE}Boundary_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0039
     * @tc.name      VPN_Boundary_0039
     * @tc.desc      boundary validation for 256.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0039 begin`);
      logInfo("mtuValid(256) + ':' + portValid(256) + ':' + prefixValid(256)");
      const actual: string = mtuValid(256) + ':' + portValid(256) + ':' + prefixValid(256);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo(`${BUNDLE}Boundary_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0040
     * @tc.name      VPN_Boundary_0040
     * @tc.desc      boundary validation for 300.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0040 begin`);
      logInfo("mtuValid(300) + ':' + portValid(300) + ':' + prefixValid(300)");
      const actual: string = mtuValid(300) + ':' + portValid(300) + ':' + prefixValid(300);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0041
     * @tc.name      VPN_Boundary_0041
     * @tc.desc      boundary validation for 360.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0041 begin`);
      logInfo("mtuValid(360) + ':' + portValid(360) + ':' + prefixValid(360)");
      const actual: string = mtuValid(360) + ':' + portValid(360) + ':' + prefixValid(360);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo(`${BUNDLE}Boundary_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0042
     * @tc.name      VPN_Boundary_0042
     * @tc.desc      boundary validation for 400.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0042 begin`);
      logInfo("mtuValid(400) + ':' + portValid(400) + ':' + prefixValid(400)");
      const actual: string = mtuValid(400) + ':' + portValid(400) + ':' + prefixValid(400);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo(`${BUNDLE}Boundary_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0043
     * @tc.name      VPN_Boundary_0043
     * @tc.desc      boundary validation for 480.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0043 begin`);
      logInfo("mtuValid(480) + ':' + portValid(480) + ':' + prefixValid(480)");
      const actual: string = mtuValid(480) + ':' + portValid(480) + ':' + prefixValid(480);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0044
     * @tc.name      VPN_Boundary_0044
     * @tc.desc      boundary validation for 512.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0044 begin`);
      logInfo("mtuValid(512) + ':' + portValid(512) + ':' + prefixValid(512)");
      const actual: string = mtuValid(512) + ':' + portValid(512) + ':' + prefixValid(512);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo(`${BUNDLE}Boundary_0044 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0045
     * @tc.name      VPN_Boundary_0045
     * @tc.desc      boundary validation for 576.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Boundary_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Boundary_0045 begin`);
      logInfo("mtuValid(576) + ':' + portValid(576) + ':' + prefixValid(576)");
      const actual: string = mtuValid(576) + ':' + portValid(576) + ':' + prefixValid(576);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo(`${BUNDLE}Boundary_0045 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_BOUNDARY_0046
     * @tc.name      VPN_Boundary_0046
     * @tc.desc      boundary validation for 600.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Boundary_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Boundary_0046 begin`);
      logInfo("mtuValid(600) + ':' + portValid(600) + ':' + prefixValid(600)");
      const actual: string = mtuValid(600) + ':' + portValid(600) + ':' + prefixValid(600);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true:false");
      expect(actual).assertEqual("true:true:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Boundary_0046 end`);
    });
  });
}
