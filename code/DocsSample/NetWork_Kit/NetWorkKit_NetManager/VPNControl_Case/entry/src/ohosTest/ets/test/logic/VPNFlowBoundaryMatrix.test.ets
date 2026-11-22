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
  VpnFlowModel,
} from '../model/VPNLogic';

/** VPNFlowBoundaryMatrixTest logic checks (450 cases). */
export default function vpnFlowBoundaryMatrixTest(): void {
  describe('VPNFlowBoundaryMatrixTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0001
     * @tc.name      VPN_FlowBoundary_0001
     * @tc.desc      vpn flow boundary -5,true,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0001 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary -5,true,false,false");
      const actual: string = subject.run(-5, true, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn--5|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn--5|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0002
     * @tc.name      VPN_FlowBoundary_0002
     * @tc.desc      vpn flow boundary -4,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0002 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary -4,false,true,true");
      const actual: string = subject.run(-4, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0003
     * @tc.name      VPN_FlowBoundary_0003
     * @tc.desc      vpn flow boundary -3,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0003 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary -3,true,true,true");
      const actual: string = subject.run(-3, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn--3|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn--3|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0004
     * @tc.name      VPN_FlowBoundary_0004
     * @tc.desc      vpn flow boundary -2,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0004 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary -2,false,false,true");
      const actual: string = subject.run(-2, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0005
     * @tc.name      VPN_FlowBoundary_0005
     * @tc.desc      vpn flow boundary -1,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0005 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary -1,true,true,true");
      const actual: string = subject.run(-1, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn--1|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn--1|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0006
     * @tc.name      VPN_FlowBoundary_0006
     * @tc.desc      vpn flow boundary 0,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0006 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 0,false,true,false");
      const actual: string = subject.run(0, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "create-failed||false|Error|CreateTunnel Fail");
      expect(actual).assertEqual("create-failed||false|Error|CreateTunnel Fail");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0007
     * @tc.name      VPN_FlowBoundary_0007
     * @tc.desc      vpn flow boundary 1,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0007 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 1,true,false,true");
      const actual: string = subject.run(1, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-1|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-1|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0008
     * @tc.name      VPN_FlowBoundary_0008
     * @tc.desc      vpn flow boundary 2,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0008 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 2,false,true,true");
      const actual: string = subject.run(2, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0009
     * @tc.name      VPN_FlowBoundary_0009
     * @tc.desc      vpn flow boundary 3,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0009 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 3,true,true,true");
      const actual: string = subject.run(3, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-3|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-3|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0010
     * @tc.name      VPN_FlowBoundary_0010
     * @tc.desc      vpn flow boundary 4,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0010 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 4,false,false,true");
      const actual: string = subject.run(4, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0011
     * @tc.name      VPN_FlowBoundary_0011
     * @tc.desc      vpn flow boundary 5,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0011 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 5,true,true,false");
      const actual: string = subject.run(5, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-5|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-5|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0012
     * @tc.name      VPN_FlowBoundary_0012
     * @tc.desc      vpn flow boundary 6,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0012 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 6,false,true,true");
      const actual: string = subject.run(6, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0013
     * @tc.name      VPN_FlowBoundary_0013
     * @tc.desc      vpn flow boundary 7,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0013 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 7,true,false,true");
      const actual: string = subject.run(7, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-7|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-7|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0014
     * @tc.name      VPN_FlowBoundary_0014
     * @tc.desc      vpn flow boundary 8,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0014 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 8,false,true,true");
      const actual: string = subject.run(8, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0015
     * @tc.name      VPN_FlowBoundary_0015
     * @tc.desc      vpn flow boundary 9,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0015 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 9,true,true,true");
      const actual: string = subject.run(9, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-9|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-9|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0016
     * @tc.name      VPN_FlowBoundary_0016
     * @tc.desc      vpn flow boundary 10,false,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0016 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 10,false,false,false");
      const actual: string = subject.run(10, false, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0017
     * @tc.name      VPN_FlowBoundary_0017
     * @tc.desc      vpn flow boundary 11,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0017 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 11,true,true,true");
      const actual: string = subject.run(11, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-11|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-11|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0018
     * @tc.name      VPN_FlowBoundary_0018
     * @tc.desc      vpn flow boundary 12,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowBoundary_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowBoundary_0018 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 12,false,true,true");
      const actual: string = subject.run(12, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0019
     * @tc.name      VPN_FlowBoundary_0019
     * @tc.desc      vpn flow boundary 13,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0019 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 13,true,false,true");
      const actual: string = subject.run(13, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-13|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-13|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0020
     * @tc.name      VPN_FlowBoundary_0020
     * @tc.desc      vpn flow boundary 14,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0020 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 14,false,true,true");
      const actual: string = subject.run(14, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0021
     * @tc.name      VPN_FlowBoundary_0021
     * @tc.desc      vpn flow boundary 15,true,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0021 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 15,true,true,false");
      const actual: string = subject.run(15, true, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-15|false|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-15|false|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0022
     * @tc.name      VPN_FlowBoundary_0022
     * @tc.desc      vpn flow boundary 16,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0022 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 16,false,false,true");
      const actual: string = subject.run(16, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0023
     * @tc.name      VPN_FlowBoundary_0023
     * @tc.desc      vpn flow boundary 17,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowBoundary_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowBoundary_0023 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 17,true,true,true");
      const actual: string = subject.run(17, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-17|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-17|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0024
     * @tc.name      VPN_FlowBoundary_0024
     * @tc.desc      vpn flow boundary 18,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0024 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 18,false,true,true");
      const actual: string = subject.run(18, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0025
     * @tc.name      VPN_FlowBoundary_0025
     * @tc.desc      vpn flow boundary 19,true,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0025 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 19,true,false,true");
      const actual: string = subject.run(19, true, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-19|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-19|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0026
     * @tc.name      VPN_FlowBoundary_0026
     * @tc.desc      vpn flow boundary 20,false,true,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0026 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 20,false,true,false");
      const actual: string = subject.run(20, false, true, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0027
     * @tc.name      VPN_FlowBoundary_0027
     * @tc.desc      vpn flow boundary 21,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0027 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 21,true,true,true");
      const actual: string = subject.run(21, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-21|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-21|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0028
     * @tc.name      VPN_FlowBoundary_0028
     * @tc.desc      vpn flow boundary 22,false,false,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0028 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 22,false,false,true");
      const actual: string = subject.run(22, false, false, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0029
     * @tc.name      VPN_FlowBoundary_0029
     * @tc.desc      vpn flow boundary 23,true,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0029 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 23,true,true,true");
      const actual: string = subject.run(23, true, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "ok|vpn-23|true|Pass|VPN started successfully");
      expect(actual).assertEqual("ok|vpn-23|true|Pass|VPN started successfully");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0030
     * @tc.name      VPN_FlowBoundary_0030
     * @tc.desc      vpn flow boundary 24,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0030 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 24,false,true,true");
      const actual: string = subject.run(24, false, true, true) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed||false|Error|vpn Protect Failed");
      expect(actual).assertEqual("protect-failed||false|Error|vpn Protect Failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0031
     * @tc.name      VPN_FlowBoundary_0031
     * @tc.desc      vpn flow boundary 25,true,false,false keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0031 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("flow boundary 25,true,false,false");
      const actual: string = subject.run(25, true, false, false) + '|' + subject.id() + '|' + subject.notified() + '|' + subject.state() + '|' + subject.message();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed|vpn-25|false|Error|VPN start failed");
      expect(actual).assertEqual("setup-failed|vpn-25|false|Error|VPN start failed");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowBoundary_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_BOUNDARY_0032
     * @tc.name      VPN_FlowBoundary_0032
     * @tc.desc      vpn flow boundary 26,false,true,true keeps run state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowBoundary_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowBoundary_0032 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
