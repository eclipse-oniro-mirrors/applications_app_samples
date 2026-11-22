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
} from '../model/VPNLogic';

/** MtuPortValidTest logic checks (16 cases). */
export default function mtuPortValidTest(): void {
  describe('MtuPortValidTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0001
     * @tc.name      VPN_MtuPort_0001
     * @tc.desc      mtu/port validation for 0/1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_MtuPort_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MtuPort_0001 begin`);
      logInfo("mtuValid(0) + ':' + portValid(1)");
      const actual: string = mtuValid(0) + ':' + portValid(1);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true");
      expect(actual).assertEqual("false:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MtuPort_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0002
     * @tc.name      VPN_MtuPort_0002
     * @tc.desc      mtu/port validation for 1/100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_MtuPort_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MtuPort_0002 begin`);
      logInfo("mtuValid(1) + ':' + portValid(100)");
      const actual: string = mtuValid(1) + ':' + portValid(100);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true");
      expect(actual).assertEqual("false:true");
      logInfo(`${BUNDLE}MtuPort_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0003
     * @tc.name      VPN_MtuPort_0003
     * @tc.desc      mtu/port validation for 67/1400.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_MtuPort_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MtuPort_0003 begin`);
      logInfo("mtuValid(67) + ':' + portValid(1400)");
      const actual: string = mtuValid(67) + ':' + portValid(1400);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true");
      expect(actual).assertEqual("false:true");
      logInfo(`${BUNDLE}MtuPort_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0004
     * @tc.name      VPN_MtuPort_0004
     * @tc.desc      mtu/port validation for 68/2000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_MtuPort_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MtuPort_0004 begin`);
      logInfo("mtuValid(68) + ':' + portValid(2000)");
      const actual: string = mtuValid(68) + ':' + portValid(2000);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MtuPort_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0005
     * @tc.name      VPN_MtuPort_0005
     * @tc.desc      mtu/port validation for 100/-1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_MtuPort_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MtuPort_0005 begin`);
      logInfo("mtuValid(100) + ':' + portValid(-1)");
      const actual: string = mtuValid(100) + ':' + portValid(-1);
      logInfo('actual=' + String(actual) + ', expected=' + "true:false");
      expect(actual).assertEqual("true:false");
      logInfo(`${BUNDLE}MtuPort_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0006
     * @tc.name      VPN_MtuPort_0006
     * @tc.desc      mtu/port validation for 576/0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_MtuPort_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MtuPort_0006 begin`);
      logInfo("mtuValid(576) + ':' + portValid(0)");
      const actual: string = mtuValid(576) + ':' + portValid(0);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}MtuPort_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0007
     * @tc.name      VPN_MtuPort_0007
     * @tc.desc      mtu/port validation for 1000/68.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_MtuPort_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MtuPort_0007 begin`);
      logInfo("mtuValid(1000) + ':' + portValid(68)");
      const actual: string = mtuValid(1000) + ':' + portValid(68);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MtuPort_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0008
     * @tc.name      VPN_MtuPort_0008
     * @tc.desc      mtu/port validation for 1400/1000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_MtuPort_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MtuPort_0008 begin`);
      logInfo("mtuValid(1400) + ':' + portValid(1000)");
      const actual: string = mtuValid(1400) + ':' + portValid(1000);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}MtuPort_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0009
     * @tc.name      VPN_MtuPort_0009
     * @tc.desc      mtu/port validation for 1500/1501.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_MtuPort_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MtuPort_0009 begin`);
      logInfo("mtuValid(1500) + ':' + portValid(1501)");
      const actual: string = mtuValid(1500) + ':' + portValid(1501);
      logInfo('actual=' + String(actual) + ', expected=' + "true:true");
      expect(actual).assertEqual("true:true");
      logInfo(`${BUNDLE}MtuPort_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0010
     * @tc.name      VPN_MtuPort_0010
     * @tc.desc      mtu/port validation for 1501/65536.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_MtuPort_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MtuPort_0010 begin`);
      logInfo("mtuValid(1501) + ':' + portValid(65536)");
      const actual: string = mtuValid(1501) + ':' + portValid(65536);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false");
      expect(actual).assertEqual("false:false");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MtuPort_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0011
     * @tc.name      VPN_MtuPort_0011
     * @tc.desc      mtu/port validation for 2000/1400.5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_MtuPort_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MtuPort_0011 begin`);
      logInfo("mtuValid(2000) + ':' + portValid(1400.5)");
      const actual: string = mtuValid(2000) + ':' + portValid(1400.5);
      logInfo('actual=' + String(actual) + ', expected=' + "false:false");
      expect(actual).assertEqual("false:false");
      logInfo(`${BUNDLE}MtuPort_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0012
     * @tc.name      VPN_MtuPort_0012
     * @tc.desc      mtu/port validation for 65535/67.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_MtuPort_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MtuPort_0012 begin`);
      logInfo("mtuValid(65535) + ':' + portValid(67)");
      const actual: string = mtuValid(65535) + ':' + portValid(67);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true");
      expect(actual).assertEqual("false:true");
      logInfo(`${BUNDLE}MtuPort_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0013
     * @tc.name      VPN_MtuPort_0013
     * @tc.desc      mtu/port validation for 65536/576.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_MtuPort_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MtuPort_0013 begin`);
      logInfo("mtuValid(65536) + ':' + portValid(576)");
      const actual: string = mtuValid(65536) + ':' + portValid(576);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true");
      expect(actual).assertEqual("false:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}MtuPort_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0014
     * @tc.name      VPN_MtuPort_0014
     * @tc.desc      mtu/port validation for -1/1500.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_MtuPort_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MtuPort_0014 begin`);
      logInfo("mtuValid(-1) + ':' + portValid(1500)");
      const actual: string = mtuValid(-1) + ':' + portValid(1500);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true");
      expect(actual).assertEqual("false:true");
      logInfo(`${BUNDLE}MtuPort_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_MTU_PORT_0015
     * @tc.name      VPN_MtuPort_0015
     * @tc.desc      mtu/port validation for 68.5/65535.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_MtuPort_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MtuPort_0015 begin`);
      logInfo("mtuValid(68.5) + ':' + portValid(65535)");
      const actual: string = mtuValid(68.5) + ':' + portValid(65535);
      logInfo('actual=' + String(actual) + ', expected=' + "false:true");
      expect(actual).assertEqual("false:true");
      logInfo(`${BUNDLE}MtuPort_0015 end`);
    });

    /**
