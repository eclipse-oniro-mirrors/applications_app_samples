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
  VpnExtensionModel,
} from '../model/VPNLogic';

/** VpnExtensionFlowTest logic checks (44 cases). */
export default function vpnExtensionFlowTest(): void {
  describe('VpnExtensionFlowTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0001
     * @tc.name      VPN_ExtFlow_0001
     * @tc.desc      vpn extension flow true,-2,true,true -> tunnel-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ExtFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExtFlow_0001 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,-2,true,true)");
      const actual: string = subject.run(-2, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "tunnel-failed");
      expect(actual).assertEqual("tunnel-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0002
     * @tc.name      VPN_ExtFlow_0002
     * @tc.desc      vpn extension flow false,-1,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0002 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,-1,false,false)");
      const actual: string = subject.run(-1, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0003
     * @tc.name      VPN_ExtFlow_0003
     * @tc.desc      vpn extension flow true,0,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0003 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,0,true,false)");
      const actual: string = subject.run(0, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0004
     * @tc.name      VPN_ExtFlow_0004
     * @tc.desc      vpn extension flow false,1,false,true -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0004 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,1,false,true)");
      const actual: string = subject.run(1, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0005
     * @tc.name      VPN_ExtFlow_0005
     * @tc.desc      vpn extension flow true,2,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0005 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,2,true,false)");
      const actual: string = subject.run(2, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0006
     * @tc.name      VPN_ExtFlow_0006
     * @tc.desc      vpn extension flow false,3,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0006 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,3,false,false)");
      const actual: string = subject.run(3, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0007
     * @tc.name      VPN_ExtFlow_0007
     * @tc.desc      vpn extension flow true,4,true,true -> ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0007 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,4,true,true)");
      const actual: string = subject.run(4, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0008
     * @tc.name      VPN_ExtFlow_0008
     * @tc.desc      vpn extension flow false,5,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0008 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,5,false,false)");
      const actual: string = subject.run(5, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0009
     * @tc.name      VPN_ExtFlow_0009
     * @tc.desc      vpn extension flow true,6,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0009 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,6,true,false)");
      const actual: string = subject.run(6, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0010
     * @tc.name      VPN_ExtFlow_0010
     * @tc.desc      vpn extension flow false,7,false,true -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0010 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,7,false,true)");
      const actual: string = subject.run(7, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0011
     * @tc.name      VPN_ExtFlow_0011
     * @tc.desc      vpn extension flow true,8,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0011 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,8,true,false)");
      const actual: string = subject.run(8, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0012
     * @tc.name      VPN_ExtFlow_0012
     * @tc.desc      vpn extension flow false,9,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ExtFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExtFlow_0012 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,9,false,false)");
      const actual: string = subject.run(9, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0013
     * @tc.name      VPN_ExtFlow_0013
     * @tc.desc      vpn extension flow true,10,true,true -> ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0013 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,10,true,true)");
      const actual: string = subject.run(10, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0014
     * @tc.name      VPN_ExtFlow_0014
     * @tc.desc      vpn extension flow false,11,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0014 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,11,false,false)");
      const actual: string = subject.run(11, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0015
     * @tc.name      VPN_ExtFlow_0015
     * @tc.desc      vpn extension flow true,12,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0015 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,12,true,false)");
      const actual: string = subject.run(12, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0016
     * @tc.name      VPN_ExtFlow_0016
     * @tc.desc      vpn extension flow false,13,false,true -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0016 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,13,false,true)");
      const actual: string = subject.run(13, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0017
     * @tc.name      VPN_ExtFlow_0017
     * @tc.desc      vpn extension flow true,14,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0017 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,14,true,false)");
      const actual: string = subject.run(14, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0018
     * @tc.name      VPN_ExtFlow_0018
     * @tc.desc      vpn extension flow false,15,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ExtFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExtFlow_0018 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,15,false,false)");
      const actual: string = subject.run(15, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0019
     * @tc.name      VPN_ExtFlow_0019
     * @tc.desc      vpn extension flow true,16,true,true -> ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0019 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,16,true,true)");
      const actual: string = subject.run(16, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0020
     * @tc.name      VPN_ExtFlow_0020
     * @tc.desc      vpn extension flow false,17,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0020 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,17,false,false)");
      const actual: string = subject.run(17, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0021
     * @tc.name      VPN_ExtFlow_0021
     * @tc.desc      vpn extension flow true,18,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0021 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,18,true,false)");
      const actual: string = subject.run(18, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0022
     * @tc.name      VPN_ExtFlow_0022
     * @tc.desc      vpn extension flow false,19,false,true -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0022 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,19,false,true)");
      const actual: string = subject.run(19, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0023
     * @tc.name      VPN_ExtFlow_0023
     * @tc.desc      vpn extension flow true,20,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ExtFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExtFlow_0023 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,20,true,false)");
      const actual: string = subject.run(20, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0024
     * @tc.name      VPN_ExtFlow_0024
     * @tc.desc      vpn extension flow false,21,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0024 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,21,false,false)");
      const actual: string = subject.run(21, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0025
     * @tc.name      VPN_ExtFlow_0025
     * @tc.desc      vpn extension flow true,22,true,true -> ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0025 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,22,true,true)");
      const actual: string = subject.run(22, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0026
     * @tc.name      VPN_ExtFlow_0026
     * @tc.desc      vpn extension flow false,23,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0026 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,23,false,false)");
      const actual: string = subject.run(23, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0027
     * @tc.name      VPN_ExtFlow_0027
     * @tc.desc      vpn extension flow true,24,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0027 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,24,true,false)");
      const actual: string = subject.run(24, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0028
     * @tc.name      VPN_ExtFlow_0028
     * @tc.desc      vpn extension flow false,25,false,true -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0028 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,25,false,true)");
      const actual: string = subject.run(25, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0029
     * @tc.name      VPN_ExtFlow_0029
     * @tc.desc      vpn extension flow true,26,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0029 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,26,true,false)");
      const actual: string = subject.run(26, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0030
     * @tc.name      VPN_ExtFlow_0030
     * @tc.desc      vpn extension flow false,27,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0030 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,27,false,false)");
      const actual: string = subject.run(27, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0031
     * @tc.name      VPN_ExtFlow_0031
     * @tc.desc      vpn extension flow true,28,true,true -> ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0031 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,28,true,true)");
      const actual: string = subject.run(28, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0032
     * @tc.name      VPN_ExtFlow_0032
     * @tc.desc      vpn extension flow false,29,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0032 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,29,false,false)");
      const actual: string = subject.run(29, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0033
     * @tc.name      VPN_ExtFlow_0033
     * @tc.desc      vpn extension flow true,30,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0033 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,30,true,false)");
      const actual: string = subject.run(30, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0034
     * @tc.name      VPN_ExtFlow_0034
     * @tc.desc      vpn extension flow false,31,false,true -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_ExtFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExtFlow_0034 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,31,false,true)");
      const actual: string = subject.run(31, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0035
     * @tc.name      VPN_ExtFlow_0035
     * @tc.desc      vpn extension flow true,32,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_ExtFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExtFlow_0035 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,32,true,false)");
      const actual: string = subject.run(32, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0036
     * @tc.name      VPN_ExtFlow_0036
     * @tc.desc      vpn extension flow false,33,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0036 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,33,false,false)");
      const actual: string = subject.run(33, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0037
     * @tc.name      VPN_ExtFlow_0037
     * @tc.desc      vpn extension flow true,34,true,true -> ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0037 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,34,true,true)");
      const actual: string = subject.run(34, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0038
     * @tc.name      VPN_ExtFlow_0038
     * @tc.desc      vpn extension flow false,35,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0038 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,35,false,false)");
      const actual: string = subject.run(35, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0039
     * @tc.name      VPN_ExtFlow_0039
     * @tc.desc      vpn extension flow true,36,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0039 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,36,true,false)");
      const actual: string = subject.run(36, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0040
     * @tc.name      VPN_ExtFlow_0040
     * @tc.desc      vpn extension flow false,37,false,true -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0040 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,37,false,true)");
      const actual: string = subject.run(37, false, true);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0041
     * @tc.name      VPN_ExtFlow_0041
     * @tc.desc      vpn extension flow true,38,true,false -> setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0041 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,38,true,false)");
      const actual: string = subject.run(38, true, false);
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed");
      expect(actual).assertEqual("setup-failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0042
     * @tc.name      VPN_ExtFlow_0042
     * @tc.desc      vpn extension flow false,39,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0042 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,39,false,false)");
      const actual: string = subject.run(39, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0043
     * @tc.name      VPN_ExtFlow_0043
     * @tc.desc      vpn extension flow true,40,true,true -> ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0043 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(true);
      logInfo("extension run(true,40,true,true)");
      const actual: string = subject.run(40, true, true);
      logInfo('actual=' + String(actual) + ', expected=' + "ok");
      expect(actual).assertEqual("ok");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_EXT_FLOW_0044
     * @tc.name      VPN_ExtFlow_0044
     * @tc.desc      vpn extension flow false,41,false,false -> no-context.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_ExtFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExtFlow_0044 begin`);
      const subject: VpnExtensionModel = new VpnExtensionModel();
      subject.onCreate(false);
      logInfo("extension run(false,41,false,false)");
      const actual: string = subject.run(41, false, false);
      logInfo('actual=' + String(actual) + ', expected=' + "no-context");
      expect(actual).assertEqual("no-context");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}ExtFlow_0044 end`);
    });
  });
}
