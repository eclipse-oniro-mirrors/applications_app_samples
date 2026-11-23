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
  vpnIdResult,
  destroyResult,
} from '../model/VPNLogic';

/** VpnIdDestroyTest logic checks (12 cases). */
export default function vpnIdDestroyTest(): void {
  describe('VpnIdDestroyTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_VPN_ID_DESTROY_0001
     * @tc.name      VPN_VpnIdDestroy_0001
     * @tc.desc      vpn id/destroy result for current "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_VpnIdDestroy_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VpnIdDestroy_0001 begin`);
      logInfo("vpnIdResult(\"\", \"test_vpn_id\") + ':' + destroyResult(true, false)");
      const actual: string = vpnIdResult("", "test_vpn_id") + ':' + destroyResult(true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "test_vpn_id:true");
      expect(actual).assertEqual("test_vpn_id:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VpnIdDestroy_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_VPN_ID_DESTROY_0002
     * @tc.name      VPN_VpnIdDestroy_0002
     * @tc.desc      vpn id/destroy result for current "test_vpn_id".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_VpnIdDestroy_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VpnIdDestroy_0002 begin`);
      logInfo("vpnIdResult(\"test_vpn_id\", \"\") + ':' + destroyResult(false, false)");
      const actual: string = vpnIdResult("test_vpn_id", "") + ':' + destroyResult(false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "test_vpn_id:false");
      expect(actual).assertEqual("test_vpn_id:false");
      logInfo(`${BUNDLE}VpnIdDestroy_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_VPN_ID_DESTROY_0003
     * @tc.name      VPN_VpnIdDestroy_0003
     * @tc.desc      vpn id/destroy result for current "vpn-1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_VpnIdDestroy_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VpnIdDestroy_0003 begin`);
      logInfo("vpnIdResult(\"vpn-1\", \"x\") + ':' + destroyResult(true, true)");
      const actual: string = vpnIdResult("vpn-1", "x") + ':' + destroyResult(true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "x:false");
      expect(actual).assertEqual("x:false");
      logInfo(`${BUNDLE}VpnIdDestroy_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_VPN_ID_DESTROY_0004
     * @tc.name      VPN_VpnIdDestroy_0004
     * @tc.desc      vpn id/destroy result for current "x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_VpnIdDestroy_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VpnIdDestroy_0004 begin`);
      logInfo("vpnIdResult(\"x\", \"vpn-1\") + ':' + destroyResult(true, false)");
      const actual: string = vpnIdResult("x", "vpn-1") + ':' + destroyResult(true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn-1:true");
      expect(actual).assertEqual("vpn-1:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VpnIdDestroy_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_VPN_ID_DESTROY_0005
     * @tc.name      VPN_VpnIdDestroy_0005
     * @tc.desc      vpn id/destroy result for current "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_VpnIdDestroy_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VpnIdDestroy_0005 begin`);
      logInfo("vpnIdResult(\"\", \"test_vpn_id\") + ':' + destroyResult(false, false)");
      const actual: string = vpnIdResult("", "test_vpn_id") + ':' + destroyResult(false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "test_vpn_id:false");
      expect(actual).assertEqual("test_vpn_id:false");
      logInfo(`${BUNDLE}VpnIdDestroy_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_VPN_ID_DESTROY_0006
     * @tc.name      VPN_VpnIdDestroy_0006
     * @tc.desc      vpn id/destroy result for current "test_vpn_id".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_VpnIdDestroy_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VpnIdDestroy_0006 begin`);
      logInfo("vpnIdResult(\"test_vpn_id\", \"\") + ':' + destroyResult(true, true)");
      const actual: string = vpnIdResult("test_vpn_id", "") + ':' + destroyResult(true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "test_vpn_id:false");
      expect(actual).assertEqual("test_vpn_id:false");
      logInfo(`${BUNDLE}VpnIdDestroy_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_VPN_ID_DESTROY_0007
     * @tc.name      VPN_VpnIdDestroy_0007
     * @tc.desc      vpn id/destroy result for current "vpn-1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_VpnIdDestroy_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VpnIdDestroy_0007 begin`);
      logInfo("vpnIdResult(\"vpn-1\", \"x\") + ':' + destroyResult(true, false)");
      const actual: string = vpnIdResult("vpn-1", "x") + ':' + destroyResult(true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "x:true");
      expect(actual).assertEqual("x:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VpnIdDestroy_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_VPN_ID_DESTROY_0008
     * @tc.name      VPN_VpnIdDestroy_0008
     * @tc.desc      vpn id/destroy result for current "x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_VpnIdDestroy_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VpnIdDestroy_0008 begin`);
      logInfo("vpnIdResult(\"x\", \"vpn-1\") + ':' + destroyResult(false, false)");
      const actual: string = vpnIdResult("x", "vpn-1") + ':' + destroyResult(false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn-1:false");
      expect(actual).assertEqual("vpn-1:false");
      logInfo(`${BUNDLE}VpnIdDestroy_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_VPN_ID_DESTROY_0009
     * @tc.name      VPN_VpnIdDestroy_0009
     * @tc.desc      vpn id/destroy result for current "".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_VpnIdDestroy_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VpnIdDestroy_0009 begin`);
      logInfo("vpnIdResult(\"\", \"test_vpn_id\") + ':' + destroyResult(true, true)");
      const actual: string = vpnIdResult("", "test_vpn_id") + ':' + destroyResult(true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "test_vpn_id:false");
      expect(actual).assertEqual("test_vpn_id:false");
      logInfo(`${BUNDLE}VpnIdDestroy_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_VPN_ID_DESTROY_0010
     * @tc.name      VPN_VpnIdDestroy_0010
     * @tc.desc      vpn id/destroy result for current "test_vpn_id".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_VpnIdDestroy_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VpnIdDestroy_0010 begin`);
      logInfo("vpnIdResult(\"test_vpn_id\", \"\") + ':' + destroyResult(true, false)");
      const actual: string = vpnIdResult("test_vpn_id", "") + ':' + destroyResult(true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "test_vpn_id:true");
      expect(actual).assertEqual("test_vpn_id:true");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}VpnIdDestroy_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_VPN_ID_DESTROY_0011
     * @tc.name      VPN_VpnIdDestroy_0011
     * @tc.desc      vpn id/destroy result for current "vpn-1".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_VpnIdDestroy_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VpnIdDestroy_0011 begin`);
      logInfo("vpnIdResult(\"vpn-1\", \"x\") + ':' + destroyResult(false, false)");
      const actual: string = vpnIdResult("vpn-1", "x") + ':' + destroyResult(false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "x:false");
      expect(actual).assertEqual("x:false");
      logInfo(`${BUNDLE}VpnIdDestroy_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_VPN_ID_DESTROY_0012
     * @tc.name      VPN_VpnIdDestroy_0012
     * @tc.desc      vpn id/destroy result for current "x".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_VpnIdDestroy_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VpnIdDestroy_0012 begin`);
      logInfo("vpnIdResult(\"x\", \"vpn-1\") + ':' + destroyResult(true, true)");
      const actual: string = vpnIdResult("x", "vpn-1") + ':' + destroyResult(true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "vpn-1:false");
      expect(actual).assertEqual("vpn-1:false");
      logInfo(`${BUNDLE}VpnIdDestroy_0012 end`);
    });
  });
}
