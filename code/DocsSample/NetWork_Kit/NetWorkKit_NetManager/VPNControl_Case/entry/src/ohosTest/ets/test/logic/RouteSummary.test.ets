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
  routeSummary,
} from '../model/VPNLogic';

/** RouteSummaryTest logic checks (12 cases). */
export default function routeSummaryTest(): void {
  describe('RouteSummaryTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_SUMMARY_0001
     * @tc.name      VPN_RouteSummary_0001
     * @tc.desc      routeSummary for interface "vpn-tun".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_RouteSummary_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteSummary_0001 begin`);
      logInfo("routeSummary(\"vpn-tun\", \"10.0.0.8\", 24, \"10.0.0.5\", true, true)");
      const actual: string = routeSummary("vpn-tun", "10.0.0.8", 24, "10.0.0.5", true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn-tun:10.0.0.8/24:10.0.0.5:true:true");
      expect(actual).assertEqual("vpn-tun:10.0.0.8/24:10.0.0.5:true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RouteSummary_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_SUMMARY_0002
     * @tc.name      VPN_RouteSummary_0002
     * @tc.desc      routeSummary for interface "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteSummary_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteSummary_0002 begin`);
      logInfo("routeSummary(\"\", \"8.8.8.8\", 0, \"1.1.1.1\", false, false)");
      const actual: string = routeSummary("", "8.8.8.8", 0, "1.1.1.1", false, false);
      logInfo('actual=' + String(actual) + ', expected=' + ":8.8.8.8/0:1.1.1.1:false:false");
      expect(actual).assertEqual(":8.8.8.8/0:1.1.1.1:false:false");
      logInfo(`${BUNDLE}RouteSummary_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_SUMMARY_0003
     * @tc.name      VPN_RouteSummary_0003
     * @tc.desc      routeSummary for interface "tun0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteSummary_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteSummary_0003 begin`);
      logInfo("routeSummary(\"tun0\", \"\", 32, \"\", true, false)");
      const actual: string = routeSummary("tun0", "", 32, "", true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "tun0:/32::true:false");
      expect(actual).assertEqual("tun0:/32::true:false");
      logInfo(`${BUNDLE}RouteSummary_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_SUMMARY_0004
     * @tc.name      VPN_RouteSummary_0004
     * @tc.desc      routeSummary for interface "vpn-tun".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteSummary_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteSummary_0004 begin`);
      logInfo("routeSummary(\"vpn-tun\", \"10.0.0.8\", 33, \"10.0.0.5\", false, true)");
      const actual: string = routeSummary("vpn-tun", "10.0.0.8", 33, "10.0.0.5", false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn-tun:10.0.0.8/33:10.0.0.5:false:true");
      expect(actual).assertEqual("vpn-tun:10.0.0.8/33:10.0.0.5:false:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RouteSummary_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_SUMMARY_0005
     * @tc.name      VPN_RouteSummary_0005
     * @tc.desc      routeSummary for interface "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteSummary_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteSummary_0005 begin`);
      logInfo("routeSummary(\"\", \"8.8.8.8\", 24, \"1.1.1.1\", true, false)");
      const actual: string = routeSummary("", "8.8.8.8", 24, "1.1.1.1", true, false);
      logInfo('actual=' + String(actual) + ', expected=' + ":8.8.8.8/24:1.1.1.1:true:false");
      expect(actual).assertEqual(":8.8.8.8/24:1.1.1.1:true:false");
      logInfo(`${BUNDLE}RouteSummary_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_SUMMARY_0006
     * @tc.name      VPN_RouteSummary_0006
     * @tc.desc      routeSummary for interface "tun0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteSummary_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteSummary_0006 begin`);
      logInfo("routeSummary(\"tun0\", \"\", 0, \"\", false, false)");
      const actual: string = routeSummary("tun0", "", 0, "", false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "tun0:/0::false:false");
      expect(actual).assertEqual("tun0:/0::false:false");
      logInfo(`${BUNDLE}RouteSummary_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_SUMMARY_0007
     * @tc.name      VPN_RouteSummary_0007
     * @tc.desc      routeSummary for interface "vpn-tun".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteSummary_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteSummary_0007 begin`);
      logInfo("routeSummary(\"vpn-tun\", \"10.0.0.8\", 32, \"10.0.0.5\", true, true)");
      const actual: string = routeSummary("vpn-tun", "10.0.0.8", 32, "10.0.0.5", true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn-tun:10.0.0.8/32:10.0.0.5:true:true");
      expect(actual).assertEqual("vpn-tun:10.0.0.8/32:10.0.0.5:true:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RouteSummary_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_SUMMARY_0008
     * @tc.name      VPN_RouteSummary_0008
     * @tc.desc      routeSummary for interface "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteSummary_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteSummary_0008 begin`);
      logInfo("routeSummary(\"\", \"8.8.8.8\", 33, \"1.1.1.1\", false, false)");
      const actual: string = routeSummary("", "8.8.8.8", 33, "1.1.1.1", false, false);
      logInfo('actual=' + String(actual) + ', expected=' + ":8.8.8.8/33:1.1.1.1:false:false");
      expect(actual).assertEqual(":8.8.8.8/33:1.1.1.1:false:false");
      logInfo(`${BUNDLE}RouteSummary_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_SUMMARY_0009
     * @tc.name      VPN_RouteSummary_0009
     * @tc.desc      routeSummary for interface "tun0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteSummary_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteSummary_0009 begin`);
      logInfo("routeSummary(\"tun0\", \"\", 24, \"\", true, false)");
      const actual: string = routeSummary("tun0", "", 24, "", true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "tun0:/24::true:false");
      expect(actual).assertEqual("tun0:/24::true:false");
      logInfo(`${BUNDLE}RouteSummary_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_SUMMARY_0010
     * @tc.name      VPN_RouteSummary_0010
     * @tc.desc      routeSummary for interface "vpn-tun".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteSummary_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteSummary_0010 begin`);
      logInfo("routeSummary(\"vpn-tun\", \"10.0.0.8\", 0, \"10.0.0.5\", false, true)");
      const actual: string = routeSummary("vpn-tun", "10.0.0.8", 0, "10.0.0.5", false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn-tun:10.0.0.8/0:10.0.0.5:false:true");
      expect(actual).assertEqual("vpn-tun:10.0.0.8/0:10.0.0.5:false:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}RouteSummary_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_SUMMARY_0011
     * @tc.name      VPN_RouteSummary_0011
     * @tc.desc      routeSummary for interface "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_RouteSummary_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteSummary_0011 begin`);
      logInfo("routeSummary(\"\", \"8.8.8.8\", 32, \"1.1.1.1\", true, false)");
      const actual: string = routeSummary("", "8.8.8.8", 32, "1.1.1.1", true, false);
      logInfo('actual=' + String(actual) + ', expected=' + ":8.8.8.8/32:1.1.1.1:true:false");
      expect(actual).assertEqual(":8.8.8.8/32:1.1.1.1:true:false");
      logInfo(`${BUNDLE}RouteSummary_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_ROUTE_SUMMARY_0012
     * @tc.name      VPN_RouteSummary_0012
     * @tc.desc      routeSummary for interface "tun0".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_RouteSummary_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteSummary_0012 begin`);
      logInfo("routeSummary(\"tun0\", \"\", 33, \"\", false, false)");
      const actual: string = routeSummary("tun0", "", 33, "", false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "tun0:/33::false:false");
      expect(actual).assertEqual("tun0:/33::false:false");
      logInfo(`${BUNDLE}RouteSummary_0012 end`);
    });
  });
}
