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
  BUNDLE_NAME,
  ABILITY_NAME,
  VPN_EXT_ABILITY,
  DEFAULT_SERVER_IP,
  DEFAULT_TUN_IP,
  DEFAULT_PREFIX,
  DEFAULT_BLOCKED_APP,
  DEFAULT_MTU,
  DEFAULT_DNS,
  START_TUNNEL_PORT,
  EXT_TUNNEL_PORT,
  TOAST_SHORT,
  TOAST_LONG,
  REQUEST_CODE,
  NOTIFICATION_TYPE_SIZE,
  NOTIFICATION_REQUEST_ID,
  FAMILY_IPV4,
  FAMILY_IPV6,
  ACTION_START_ABILITY,
  ACTION_SEND_COMMON_EVENT,
  SLOT_CONTENT_INFORMATION,
  PAGE_START_VPN,
  PAGE_STOP_VPN,
  STATUS_WAIT,
  STATUS_PASS,
  STATUS_ERROR,
} from '../model/VPNLogic';

/** VPNConstantsCoreTest logic checks (26 cases). */
export default function vpnConstantsCoreTest(): void {
  describe('VPNConstantsCoreTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0001
     * @tc.name      VPN_Constants_0001
     * @tc.desc      BUNDLE_NAME is pinned to "com.samples.vpncontrol_case".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Constants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Constants_0001 begin`);
      logInfo("constant BUNDLE_NAME");
      const actual: string = BUNDLE_NAME;
      logInfo('actual=' + String(actual) + ', expected=' + "com.samples.vpncontrol_case");
      expect(actual).assertEqual("com.samples.vpncontrol_case");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0002
     * @tc.name      VPN_Constants_0002
     * @tc.desc      ABILITY_NAME is pinned to "EntryAbility".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0002 begin`);
      logInfo("constant ABILITY_NAME");
      const actual: string = ABILITY_NAME;
      logInfo('actual=' + String(actual) + ', expected=' + "EntryAbility");
      expect(actual).assertEqual("EntryAbility");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0003
     * @tc.name      VPN_Constants_0003
     * @tc.desc      VPN_EXT_ABILITY is pinned to "MyVpnExtAbility".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0003 begin`);
      logInfo("constant VPN_EXT_ABILITY");
      const actual: string = VPN_EXT_ABILITY;
      logInfo('actual=' + String(actual) + ', expected=' + "MyVpnExtAbility");
      expect(actual).assertEqual("MyVpnExtAbility");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0004
     * @tc.name      VPN_Constants_0004
     * @tc.desc      DEFAULT_SERVER_IP is pinned to "192.168.xxx.xxx".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0004 begin`);
      logInfo("constant DEFAULT_SERVER_IP");
      const actual: string = DEFAULT_SERVER_IP;
      logInfo('actual=' + String(actual) + ', expected=' + "192.168.xxx.xxx");
      expect(actual).assertEqual("192.168.xxx.xxx");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0005
     * @tc.name      VPN_Constants_0005
     * @tc.desc      DEFAULT_TUN_IP is pinned to "10.0.0.5".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0005 begin`);
      logInfo("constant DEFAULT_TUN_IP");
      const actual: string = DEFAULT_TUN_IP;
      logInfo('actual=' + String(actual) + ', expected=' + "10.0.0.5");
      expect(actual).assertEqual("10.0.0.5");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0006
     * @tc.name      VPN_Constants_0006
     * @tc.desc      DEFAULT_PREFIX is pinned to 24.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0006 begin`);
      logInfo("constant DEFAULT_PREFIX");
      const actual: number = DEFAULT_PREFIX;
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0007
     * @tc.name      VPN_Constants_0007
     * @tc.desc      DEFAULT_BLOCKED_APP is pinned to "com.example.baidumyapplication".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0007 begin`);
      logInfo("constant DEFAULT_BLOCKED_APP");
      const actual: string = DEFAULT_BLOCKED_APP;
      logInfo('actual=' + String(actual) + ', expected=' + "com.example.baidumyapplication");
      expect(actual).assertEqual("com.example.baidumyapplication");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0008
     * @tc.name      VPN_Constants_0008
     * @tc.desc      DEFAULT_MTU is pinned to 1400.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0008 begin`);
      logInfo("constant DEFAULT_MTU");
      const actual: number = DEFAULT_MTU;
      logInfo('actual=' + String(actual) + ', expected=' + "1400");
      expect(actual).assertEqual(1400);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0009
     * @tc.name      VPN_Constants_0009
     * @tc.desc      DEFAULT_DNS is pinned to "114.114.114.114".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0009 begin`);
      logInfo("constant DEFAULT_DNS");
      const actual: string = DEFAULT_DNS;
      logInfo('actual=' + String(actual) + ', expected=' + "114.114.114.114");
      expect(actual).assertEqual("114.114.114.114");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0010
     * @tc.name      VPN_Constants_0010
     * @tc.desc      START_TUNNEL_PORT is pinned to 8888.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0010 begin`);
      logInfo("constant START_TUNNEL_PORT");
      const actual: number = START_TUNNEL_PORT;
      logInfo('actual=' + String(actual) + ', expected=' + "8888");
      expect(actual).assertEqual(8888);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0011
     * @tc.name      VPN_Constants_0011
     * @tc.desc      EXT_TUNNEL_PORT is pinned to 1194.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0011 begin`);
      logInfo("constant EXT_TUNNEL_PORT");
      const actual: number = EXT_TUNNEL_PORT;
      logInfo('actual=' + String(actual) + ', expected=' + "1194");
      expect(actual).assertEqual(1194);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0012
     * @tc.name      VPN_Constants_0012
     * @tc.desc      TOAST_SHORT is pinned to 2000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Constants_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Constants_0012 begin`);
      logInfo("constant TOAST_SHORT");
      const actual: number = TOAST_SHORT;
      logInfo('actual=' + String(actual) + ', expected=' + "2000");
      expect(actual).assertEqual(2000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0013
     * @tc.name      VPN_Constants_0013
     * @tc.desc      TOAST_LONG is pinned to 4000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0013 begin`);
      logInfo("constant TOAST_LONG");
      const actual: number = TOAST_LONG;
      logInfo('actual=' + String(actual) + ', expected=' + "4000");
      expect(actual).assertEqual(4000);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0014
     * @tc.name      VPN_Constants_0014
     * @tc.desc      REQUEST_CODE is pinned to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0014 begin`);
      logInfo("constant REQUEST_CODE");
      const actual: number = REQUEST_CODE;
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0015
     * @tc.name      VPN_Constants_0015
     * @tc.desc      NOTIFICATION_TYPE_SIZE is pinned to 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0015 begin`);
      logInfo("constant NOTIFICATION_TYPE_SIZE");
      const actual: number = NOTIFICATION_TYPE_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "5");
      expect(actual).assertEqual(5);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0016
     * @tc.name      VPN_Constants_0016
     * @tc.desc      NOTIFICATION_REQUEST_ID is pinned to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0016 begin`);
      logInfo("constant NOTIFICATION_REQUEST_ID");
      const actual: number = NOTIFICATION_REQUEST_ID;
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0017
     * @tc.name      VPN_Constants_0017
     * @tc.desc      FAMILY_IPV4 is pinned to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0017 begin`);
      logInfo("constant FAMILY_IPV4");
      const actual: number = FAMILY_IPV4;
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0018
     * @tc.name      VPN_Constants_0018
     * @tc.desc      FAMILY_IPV6 is pinned to 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_Constants_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Constants_0018 begin`);
      logInfo("constant FAMILY_IPV6");
      const actual: number = FAMILY_IPV6;
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0019
     * @tc.name      VPN_Constants_0019
     * @tc.desc      ACTION_START_ABILITY is pinned to 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0019 begin`);
      logInfo("constant ACTION_START_ABILITY");
      const actual: number = ACTION_START_ABILITY;
      logInfo('actual=' + String(actual) + ', expected=' + "0");
      expect(actual).assertEqual(0);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0020
     * @tc.name      VPN_Constants_0020
     * @tc.desc      ACTION_SEND_COMMON_EVENT is pinned to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0020 begin`);
      logInfo("constant ACTION_SEND_COMMON_EVENT");
      const actual: number = ACTION_SEND_COMMON_EVENT;
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0021
     * @tc.name      VPN_Constants_0021
     * @tc.desc      SLOT_CONTENT_INFORMATION is pinned to 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0021 begin`);
      logInfo("constant SLOT_CONTENT_INFORMATION");
      const actual: number = SLOT_CONTENT_INFORMATION;
      logInfo('actual=' + String(actual) + ', expected=' + "1");
      expect(actual).assertEqual(1);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Constants_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0022
     * @tc.name      VPN_Constants_0022
     * @tc.desc      PAGE_START_VPN is pinned to "pages/StartVpn".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0022 begin`);
      logInfo("constant PAGE_START_VPN");
      const actual: string = PAGE_START_VPN;
      logInfo('actual=' + String(actual) + ', expected=' + "pages/StartVpn");
      expect(actual).assertEqual("pages/StartVpn");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0023
     * @tc.name      VPN_Constants_0023
     * @tc.desc      PAGE_STOP_VPN is pinned to "pages/StopVpn".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Constants_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Constants_0023 begin`);
      logInfo("constant PAGE_STOP_VPN");
      const actual: string = PAGE_STOP_VPN;
      logInfo('actual=' + String(actual) + ', expected=' + "pages/StopVpn");
      expect(actual).assertEqual("pages/StopVpn");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0024
     * @tc.name      VPN_Constants_0024
     * @tc.desc      STATUS_WAIT is pinned to "wait".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0024 begin`);
      logInfo("constant STATUS_WAIT");
      const actual: string = STATUS_WAIT;
      logInfo('actual=' + String(actual) + ', expected=' + "wait");
      expect(actual).assertEqual("wait");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0025
     * @tc.name      VPN_Constants_0025
     * @tc.desc      STATUS_PASS is pinned to "Pass".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0025 begin`);
      logInfo("constant STATUS_PASS");
      const actual: string = STATUS_PASS;
      logInfo('actual=' + String(actual) + ', expected=' + "Pass");
      expect(actual).assertEqual("Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_CONSTANTS_0026
     * @tc.name      VPN_Constants_0026
     * @tc.desc      STATUS_ERROR is pinned to "Error".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Constants_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Constants_0026 begin`);
      logInfo("constant STATUS_ERROR");
      const actual: string = STATUS_ERROR;
      logInfo('actual=' + String(actual) + ', expected=' + "Error");
      expect(actual).assertEqual("Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}Constants_0026 end`);
    });
  });
}
