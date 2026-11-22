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

/** VpnFlowStartTest logic checks (44 cases). */
export default function vpnFlowStartTest(): void {
  describe('VpnFlowStartTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0001
     * @tc.name      VPN_FlowStart_0001
     * @tc.desc      start flow -2,true,false,true resolves to setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowStart_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowStart_0001 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(-2,true,false,true)");
      const actual: string = subject.run(-2, true, false, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed:Error");
      expect(actual).assertEqual("setup-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0002
     * @tc.name      VPN_FlowStart_0002
     * @tc.desc      start flow -1,false,true,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0002 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(-1,false,true,false)");
      const actual: string = subject.run(-1, false, true, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0003
     * @tc.name      VPN_FlowStart_0003
     * @tc.desc      start flow 0,true,true,true resolves to create-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0003 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(0,true,true,true)");
      const actual: string = subject.run(0, true, true, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "create-failed:Error");
      expect(actual).assertEqual("create-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0004
     * @tc.name      VPN_FlowStart_0004
     * @tc.desc      start flow 1,false,false,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0004 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(1,false,false,false)");
      const actual: string = subject.run(1, false, false, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0005
     * @tc.name      VPN_FlowStart_0005
     * @tc.desc      start flow 2,true,true,true resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0005 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(2,true,true,true)");
      const actual: string = subject.run(2, true, true, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:Pass");
      expect(actual).assertEqual("ok:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0006
     * @tc.name      VPN_FlowStart_0006
     * @tc.desc      start flow 3,false,true,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0006 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(3,false,true,false)");
      const actual: string = subject.run(3, false, true, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0007
     * @tc.name      VPN_FlowStart_0007
     * @tc.desc      start flow 4,true,false,true resolves to setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0007 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(4,true,false,true)");
      const actual: string = subject.run(4, true, false, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed:Error");
      expect(actual).assertEqual("setup-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0008
     * @tc.name      VPN_FlowStart_0008
     * @tc.desc      start flow 5,false,true,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0008 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(5,false,true,false)");
      const actual: string = subject.run(5, false, true, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0009
     * @tc.name      VPN_FlowStart_0009
     * @tc.desc      start flow 6,true,true,true resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0009 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(6,true,true,true)");
      const actual: string = subject.run(6, true, true, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:Pass");
      expect(actual).assertEqual("ok:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0010
     * @tc.name      VPN_FlowStart_0010
     * @tc.desc      start flow 7,false,false,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0010 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(7,false,false,false)");
      const actual: string = subject.run(7, false, false, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0011
     * @tc.name      VPN_FlowStart_0011
     * @tc.desc      start flow 8,true,true,true resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0011 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(8,true,true,true)");
      const actual: string = subject.run(8, true, true, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:Pass");
      expect(actual).assertEqual("ok:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0012
     * @tc.name      VPN_FlowStart_0012
     * @tc.desc      start flow 9,false,true,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowStart_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowStart_0012 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(9,false,true,false)");
      const actual: string = subject.run(9, false, true, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0013
     * @tc.name      VPN_FlowStart_0013
     * @tc.desc      start flow 10,true,false,true resolves to setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0013 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(10,true,false,true)");
      const actual: string = subject.run(10, true, false, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed:Error");
      expect(actual).assertEqual("setup-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0014
     * @tc.name      VPN_FlowStart_0014
     * @tc.desc      start flow 11,false,true,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0014 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(11,false,true,false)");
      const actual: string = subject.run(11, false, true, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0015
     * @tc.name      VPN_FlowStart_0015
     * @tc.desc      start flow 12,true,true,true resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0015 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(12,true,true,true)");
      const actual: string = subject.run(12, true, true, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:Pass");
      expect(actual).assertEqual("ok:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0016
     * @tc.name      VPN_FlowStart_0016
     * @tc.desc      start flow 13,false,false,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0016 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(13,false,false,false)");
      const actual: string = subject.run(13, false, false, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0017
     * @tc.name      VPN_FlowStart_0017
     * @tc.desc      start flow 14,true,true,true resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0017 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(14,true,true,true)");
      const actual: string = subject.run(14, true, true, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:Pass");
      expect(actual).assertEqual("ok:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0018
     * @tc.name      VPN_FlowStart_0018
     * @tc.desc      start flow 15,false,true,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowStart_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowStart_0018 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(15,false,true,false)");
      const actual: string = subject.run(15, false, true, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0019
     * @tc.name      VPN_FlowStart_0019
     * @tc.desc      start flow 16,true,false,true resolves to setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0019 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(16,true,false,true)");
      const actual: string = subject.run(16, true, false, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed:Error");
      expect(actual).assertEqual("setup-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0020
     * @tc.name      VPN_FlowStart_0020
     * @tc.desc      start flow 17,false,true,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0020 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(17,false,true,false)");
      const actual: string = subject.run(17, false, true, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0021
     * @tc.name      VPN_FlowStart_0021
     * @tc.desc      start flow 18,true,true,true resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0021 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(18,true,true,true)");
      const actual: string = subject.run(18, true, true, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:Pass");
      expect(actual).assertEqual("ok:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0022
     * @tc.name      VPN_FlowStart_0022
     * @tc.desc      start flow 19,false,false,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0022 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(19,false,false,false)");
      const actual: string = subject.run(19, false, false, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0023
     * @tc.name      VPN_FlowStart_0023
     * @tc.desc      start flow 20,true,true,true resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowStart_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowStart_0023 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(20,true,true,true)");
      const actual: string = subject.run(20, true, true, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:Pass");
      expect(actual).assertEqual("ok:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0024
     * @tc.name      VPN_FlowStart_0024
     * @tc.desc      start flow 21,false,true,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0024 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(21,false,true,false)");
      const actual: string = subject.run(21, false, true, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0025
     * @tc.name      VPN_FlowStart_0025
     * @tc.desc      start flow 22,true,false,true resolves to setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0025 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(22,true,false,true)");
      const actual: string = subject.run(22, true, false, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed:Error");
      expect(actual).assertEqual("setup-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0026
     * @tc.name      VPN_FlowStart_0026
     * @tc.desc      start flow 23,false,true,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0026 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(23,false,true,false)");
      const actual: string = subject.run(23, false, true, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0027
     * @tc.name      VPN_FlowStart_0027
     * @tc.desc      start flow 24,true,true,true resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0027 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(24,true,true,true)");
      const actual: string = subject.run(24, true, true, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:Pass");
      expect(actual).assertEqual("ok:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0028
     * @tc.name      VPN_FlowStart_0028
     * @tc.desc      start flow 25,false,false,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0028 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(25,false,false,false)");
      const actual: string = subject.run(25, false, false, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0029
     * @tc.name      VPN_FlowStart_0029
     * @tc.desc      start flow 26,true,true,true resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0029 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(26,true,true,true)");
      const actual: string = subject.run(26, true, true, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:Pass");
      expect(actual).assertEqual("ok:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0030
     * @tc.name      VPN_FlowStart_0030
     * @tc.desc      start flow 27,false,true,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0030 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(27,false,true,false)");
      const actual: string = subject.run(27, false, true, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0031
     * @tc.name      VPN_FlowStart_0031
     * @tc.desc      start flow 28,true,false,true resolves to setup-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0031 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(28,true,false,true)");
      const actual: string = subject.run(28, true, false, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "setup-failed:Error");
      expect(actual).assertEqual("setup-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0032
     * @tc.name      VPN_FlowStart_0032
     * @tc.desc      start flow 29,false,true,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0032 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(29,false,true,false)");
      const actual: string = subject.run(29, false, true, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0033
     * @tc.name      VPN_FlowStart_0033
     * @tc.desc      start flow 30,true,true,true resolves to ok.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowStart_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowStart_0033 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(30,true,true,true)");
      const actual: string = subject.run(30, true, true, true) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "ok:Pass");
      expect(actual).assertEqual("ok:Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_START_0034
     * @tc.name      VPN_FlowStart_0034
     * @tc.desc      start flow 31,false,false,false resolves to protect-failed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowStart_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowStart_0034 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      logInfo("run(31,false,false,false)");
      const actual: string = subject.run(31, false, false, false) + ':' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "protect-failed:Error");
      expect(actual).assertEqual("protect-failed:Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowStart_0034 end`);
    });

    /**
