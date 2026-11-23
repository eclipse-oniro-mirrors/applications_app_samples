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

/** VpnFlowMatrixTest logic checks (450 cases). */
export default function vpnFlowMatrixTest(): void {
  describe('VpnFlowMatrixTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0001
     * @tc.name      VPN_FlowMatrix_0001
     * @tc.desc      vpn flow matrix -2,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0001 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(-2, true, false, false);
      logInfo("flow matrix -2,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0002
     * @tc.name      VPN_FlowMatrix_0002
     * @tc.desc      vpn flow matrix -1,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0002 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(-1, false, true, true);
      logInfo("flow matrix -1,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0003
     * @tc.name      VPN_FlowMatrix_0003
     * @tc.desc      vpn flow matrix 0,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0003 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(0, true, true, true);
      logInfo("flow matrix 0,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0004
     * @tc.name      VPN_FlowMatrix_0004
     * @tc.desc      vpn flow matrix 1,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0004 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(1, false, false, true);
      logInfo("flow matrix 1,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0005
     * @tc.name      VPN_FlowMatrix_0005
     * @tc.desc      vpn flow matrix 2,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0005 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(2, true, true, true);
      logInfo("flow matrix 2,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0006
     * @tc.name      VPN_FlowMatrix_0006
     * @tc.desc      vpn flow matrix 3,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0006 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(3, false, true, false);
      logInfo("flow matrix 3,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0007
     * @tc.name      VPN_FlowMatrix_0007
     * @tc.desc      vpn flow matrix 4,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0007 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(4, true, false, true);
      logInfo("flow matrix 4,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0008
     * @tc.name      VPN_FlowMatrix_0008
     * @tc.desc      vpn flow matrix 5,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0008 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(5, false, true, true);
      logInfo("flow matrix 5,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0009
     * @tc.name      VPN_FlowMatrix_0009
     * @tc.desc      vpn flow matrix 6,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0009 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(6, true, true, true);
      logInfo("flow matrix 6,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0010
     * @tc.name      VPN_FlowMatrix_0010
     * @tc.desc      vpn flow matrix 7,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0010 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(7, false, false, true);
      logInfo("flow matrix 7,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0011
     * @tc.name      VPN_FlowMatrix_0011
     * @tc.desc      vpn flow matrix 8,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0011 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(8, true, true, false);
      logInfo("flow matrix 8,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0012
     * @tc.name      VPN_FlowMatrix_0012
     * @tc.desc      vpn flow matrix 9,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0012 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(9, false, true, true);
      logInfo("flow matrix 9,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0013
     * @tc.name      VPN_FlowMatrix_0013
     * @tc.desc      vpn flow matrix 10,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0013 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(10, true, false, true);
      logInfo("flow matrix 10,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0014
     * @tc.name      VPN_FlowMatrix_0014
     * @tc.desc      vpn flow matrix 11,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0014 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(11, false, true, true);
      logInfo("flow matrix 11,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0015
     * @tc.name      VPN_FlowMatrix_0015
     * @tc.desc      vpn flow matrix 12,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0015 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(12, true, true, true);
      logInfo("flow matrix 12,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0016
     * @tc.name      VPN_FlowMatrix_0016
     * @tc.desc      vpn flow matrix 13,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0016 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(13, false, false, false);
      logInfo("flow matrix 13,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0017
     * @tc.name      VPN_FlowMatrix_0017
     * @tc.desc      vpn flow matrix 14,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0017 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(14, true, true, true);
      logInfo("flow matrix 14,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0018
     * @tc.name      VPN_FlowMatrix_0018
     * @tc.desc      vpn flow matrix 15,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0018 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(15, false, true, true);
      logInfo("flow matrix 15,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0019
     * @tc.name      VPN_FlowMatrix_0019
     * @tc.desc      vpn flow matrix 16,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0019 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(16, true, false, true);
      logInfo("flow matrix 16,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0020
     * @tc.name      VPN_FlowMatrix_0020
     * @tc.desc      vpn flow matrix 17,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0020 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(17, false, true, true);
      logInfo("flow matrix 17,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0021
     * @tc.name      VPN_FlowMatrix_0021
     * @tc.desc      vpn flow matrix 18,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0021 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(18, true, true, false);
      logInfo("flow matrix 18,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0022
     * @tc.name      VPN_FlowMatrix_0022
     * @tc.desc      vpn flow matrix 19,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0022 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(19, false, false, true);
      logInfo("flow matrix 19,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0023
     * @tc.name      VPN_FlowMatrix_0023
     * @tc.desc      vpn flow matrix 20,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0023 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(20, true, true, true);
      logInfo("flow matrix 20,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0024
     * @tc.name      VPN_FlowMatrix_0024
     * @tc.desc      vpn flow matrix 21,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0024 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(21, false, true, true);
      logInfo("flow matrix 21,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0025
     * @tc.name      VPN_FlowMatrix_0025
     * @tc.desc      vpn flow matrix 22,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0025 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(22, true, false, true);
      logInfo("flow matrix 22,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0026
     * @tc.name      VPN_FlowMatrix_0026
     * @tc.desc      vpn flow matrix 23,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0026 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(23, false, true, false);
      logInfo("flow matrix 23,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0027
     * @tc.name      VPN_FlowMatrix_0027
     * @tc.desc      vpn flow matrix 24,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0027 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(24, true, true, true);
      logInfo("flow matrix 24,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0028
     * @tc.name      VPN_FlowMatrix_0028
     * @tc.desc      vpn flow matrix 25,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0028 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(25, false, false, true);
      logInfo("flow matrix 25,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0029
     * @tc.name      VPN_FlowMatrix_0029
     * @tc.desc      vpn flow matrix 26,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0029 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(26, true, true, true);
      logInfo("flow matrix 26,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0030
     * @tc.name      VPN_FlowMatrix_0030
     * @tc.desc      vpn flow matrix 27,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0030 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(27, false, true, true);
      logInfo("flow matrix 27,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0031
     * @tc.name      VPN_FlowMatrix_0031
     * @tc.desc      vpn flow matrix 28,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0031 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(28, true, false, false);
      logInfo("flow matrix 28,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0032
     * @tc.name      VPN_FlowMatrix_0032
     * @tc.desc      vpn flow matrix 29,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0032 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(29, false, true, true);
      logInfo("flow matrix 29,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0033
     * @tc.name      VPN_FlowMatrix_0033
     * @tc.desc      vpn flow matrix 30,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0033 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(30, true, true, true);
      logInfo("flow matrix 30,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0034
     * @tc.name      VPN_FlowMatrix_0034
     * @tc.desc      vpn flow matrix 31,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0034 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(31, false, false, true);
      logInfo("flow matrix 31,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0035
     * @tc.name      VPN_FlowMatrix_0035
     * @tc.desc      vpn flow matrix 32,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0035 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(32, true, true, true);
      logInfo("flow matrix 32,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0036
     * @tc.name      VPN_FlowMatrix_0036
     * @tc.desc      vpn flow matrix 33,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0036 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(33, false, true, false);
      logInfo("flow matrix 33,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0037
     * @tc.name      VPN_FlowMatrix_0037
     * @tc.desc      vpn flow matrix 34,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0037 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(34, true, false, true);
      logInfo("flow matrix 34,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0038
     * @tc.name      VPN_FlowMatrix_0038
     * @tc.desc      vpn flow matrix 35,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0038 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(35, false, true, true);
      logInfo("flow matrix 35,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0039
     * @tc.name      VPN_FlowMatrix_0039
     * @tc.desc      vpn flow matrix 36,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0039 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(36, true, true, true);
      logInfo("flow matrix 36,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0040
     * @tc.name      VPN_FlowMatrix_0040
     * @tc.desc      vpn flow matrix 37,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0040 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(37, false, false, true);
      logInfo("flow matrix 37,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0041
     * @tc.name      VPN_FlowMatrix_0041
     * @tc.desc      vpn flow matrix 38,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0041 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(38, true, true, false);
      logInfo("flow matrix 38,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0042
     * @tc.name      VPN_FlowMatrix_0042
     * @tc.desc      vpn flow matrix 39,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0042 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(39, false, true, true);
      logInfo("flow matrix 39,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0043
     * @tc.name      VPN_FlowMatrix_0043
     * @tc.desc      vpn flow matrix 40,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0043 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(40, true, false, true);
      logInfo("flow matrix 40,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0044
     * @tc.name      VPN_FlowMatrix_0044
     * @tc.desc      vpn flow matrix 41,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0044 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(41, false, true, true);
      logInfo("flow matrix 41,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0044 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0045
     * @tc.name      VPN_FlowMatrix_0045
     * @tc.desc      vpn flow matrix 42,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0045 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(42, true, true, true);
      logInfo("flow matrix 42,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0045 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0046
     * @tc.name      VPN_FlowMatrix_0046
     * @tc.desc      vpn flow matrix 43,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0046 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(43, false, false, false);
      logInfo("flow matrix 43,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0046 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0047
     * @tc.name      VPN_FlowMatrix_0047
     * @tc.desc      vpn flow matrix 44,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0047 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(44, true, true, true);
      logInfo("flow matrix 44,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0047 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0048
     * @tc.name      VPN_FlowMatrix_0048
     * @tc.desc      vpn flow matrix 45,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0048 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(45, false, true, true);
      logInfo("flow matrix 45,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0048 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0049
     * @tc.name      VPN_FlowMatrix_0049
     * @tc.desc      vpn flow matrix 46,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0049 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(46, true, false, true);
      logInfo("flow matrix 46,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0049 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0050
     * @tc.name      VPN_FlowMatrix_0050
     * @tc.desc      vpn flow matrix 47,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0050 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(47, false, true, true);
      logInfo("flow matrix 47,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0050 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0051
     * @tc.name      VPN_FlowMatrix_0051
     * @tc.desc      vpn flow matrix 48,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0051 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(48, true, true, false);
      logInfo("flow matrix 48,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0051 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0052
     * @tc.name      VPN_FlowMatrix_0052
     * @tc.desc      vpn flow matrix 49,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0052 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(49, false, false, true);
      logInfo("flow matrix 49,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0052 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0053
     * @tc.name      VPN_FlowMatrix_0053
     * @tc.desc      vpn flow matrix 50,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0053 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(50, true, true, true);
      logInfo("flow matrix 50,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0053 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0054
     * @tc.name      VPN_FlowMatrix_0054
     * @tc.desc      vpn flow matrix 51,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0054 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(51, false, true, true);
      logInfo("flow matrix 51,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0054 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0055
     * @tc.name      VPN_FlowMatrix_0055
     * @tc.desc      vpn flow matrix 52,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0055 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(52, true, false, true);
      logInfo("flow matrix 52,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0055 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0056
     * @tc.name      VPN_FlowMatrix_0056
     * @tc.desc      vpn flow matrix 53,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0056 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(53, false, true, false);
      logInfo("flow matrix 53,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0056 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0057
     * @tc.name      VPN_FlowMatrix_0057
     * @tc.desc      vpn flow matrix 54,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0057 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(54, true, true, true);
      logInfo("flow matrix 54,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0057 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0058
     * @tc.name      VPN_FlowMatrix_0058
     * @tc.desc      vpn flow matrix 55,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0058 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(55, false, false, true);
      logInfo("flow matrix 55,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0058 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0059
     * @tc.name      VPN_FlowMatrix_0059
     * @tc.desc      vpn flow matrix 56,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0059 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(56, true, true, true);
      logInfo("flow matrix 56,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0059 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0060
     * @tc.name      VPN_FlowMatrix_0060
     * @tc.desc      vpn flow matrix 57,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0060 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(57, false, true, true);
      logInfo("flow matrix 57,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0060 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0061
     * @tc.name      VPN_FlowMatrix_0061
     * @tc.desc      vpn flow matrix 58,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0061 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(58, true, false, false);
      logInfo("flow matrix 58,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0061 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0062
     * @tc.name      VPN_FlowMatrix_0062
     * @tc.desc      vpn flow matrix 59,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0062 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(59, false, true, true);
      logInfo("flow matrix 59,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0062 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0063
     * @tc.name      VPN_FlowMatrix_0063
     * @tc.desc      vpn flow matrix 60,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0063 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(60, true, true, true);
      logInfo("flow matrix 60,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0063 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0064
     * @tc.name      VPN_FlowMatrix_0064
     * @tc.desc      vpn flow matrix 61,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0064 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(61, false, false, true);
      logInfo("flow matrix 61,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0064 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0065
     * @tc.name      VPN_FlowMatrix_0065
     * @tc.desc      vpn flow matrix 62,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0065 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(62, true, true, true);
      logInfo("flow matrix 62,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0065 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0066
     * @tc.name      VPN_FlowMatrix_0066
     * @tc.desc      vpn flow matrix 63,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0066 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(63, false, true, false);
      logInfo("flow matrix 63,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0066 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0067
     * @tc.name      VPN_FlowMatrix_0067
     * @tc.desc      vpn flow matrix 64,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0067 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(64, true, false, true);
      logInfo("flow matrix 64,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0067 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0068
     * @tc.name      VPN_FlowMatrix_0068
     * @tc.desc      vpn flow matrix 65,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0068 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(65, false, true, true);
      logInfo("flow matrix 65,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0068 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0069
     * @tc.name      VPN_FlowMatrix_0069
     * @tc.desc      vpn flow matrix 66,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0069 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(66, true, true, true);
      logInfo("flow matrix 66,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0069 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0070
     * @tc.name      VPN_FlowMatrix_0070
     * @tc.desc      vpn flow matrix 67,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0070 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(67, false, false, true);
      logInfo("flow matrix 67,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0070 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0071
     * @tc.name      VPN_FlowMatrix_0071
     * @tc.desc      vpn flow matrix 68,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0071 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(68, true, true, false);
      logInfo("flow matrix 68,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0071 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0072
     * @tc.name      VPN_FlowMatrix_0072
     * @tc.desc      vpn flow matrix 69,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0072 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(69, false, true, true);
      logInfo("flow matrix 69,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0072 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0073
     * @tc.name      VPN_FlowMatrix_0073
     * @tc.desc      vpn flow matrix 70,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0073 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(70, true, false, true);
      logInfo("flow matrix 70,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0073 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0074
     * @tc.name      VPN_FlowMatrix_0074
     * @tc.desc      vpn flow matrix 71,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0074 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(71, false, true, true);
      logInfo("flow matrix 71,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0074 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0075
     * @tc.name      VPN_FlowMatrix_0075
     * @tc.desc      vpn flow matrix 72,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0075 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(72, true, true, true);
      logInfo("flow matrix 72,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0075 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0076
     * @tc.name      VPN_FlowMatrix_0076
     * @tc.desc      vpn flow matrix 73,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0076 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(73, false, false, false);
      logInfo("flow matrix 73,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0076 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0077
     * @tc.name      VPN_FlowMatrix_0077
     * @tc.desc      vpn flow matrix 74,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0077 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(74, true, true, true);
      logInfo("flow matrix 74,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0077 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0078
     * @tc.name      VPN_FlowMatrix_0078
     * @tc.desc      vpn flow matrix 75,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0078 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(75, false, true, true);
      logInfo("flow matrix 75,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0078 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0079
     * @tc.name      VPN_FlowMatrix_0079
     * @tc.desc      vpn flow matrix 76,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0079 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(76, true, false, true);
      logInfo("flow matrix 76,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0079 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0080
     * @tc.name      VPN_FlowMatrix_0080
     * @tc.desc      vpn flow matrix 77,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0080 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(77, false, true, true);
      logInfo("flow matrix 77,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0080 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0081
     * @tc.name      VPN_FlowMatrix_0081
     * @tc.desc      vpn flow matrix 78,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0081 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(78, true, true, false);
      logInfo("flow matrix 78,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0081 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0082
     * @tc.name      VPN_FlowMatrix_0082
     * @tc.desc      vpn flow matrix 79,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0082 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(79, false, false, true);
      logInfo("flow matrix 79,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0082 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0083
     * @tc.name      VPN_FlowMatrix_0083
     * @tc.desc      vpn flow matrix 80,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0083 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(80, true, true, true);
      logInfo("flow matrix 80,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0083 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0084
     * @tc.name      VPN_FlowMatrix_0084
     * @tc.desc      vpn flow matrix 81,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0084 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(81, false, true, true);
      logInfo("flow matrix 81,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0084 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0085
     * @tc.name      VPN_FlowMatrix_0085
     * @tc.desc      vpn flow matrix 82,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0085 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(82, true, false, true);
      logInfo("flow matrix 82,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0085 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0086
     * @tc.name      VPN_FlowMatrix_0086
     * @tc.desc      vpn flow matrix 83,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0086 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(83, false, true, false);
      logInfo("flow matrix 83,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0086 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0087
     * @tc.name      VPN_FlowMatrix_0087
     * @tc.desc      vpn flow matrix 84,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0087 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(84, true, true, true);
      logInfo("flow matrix 84,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0087 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0088
     * @tc.name      VPN_FlowMatrix_0088
     * @tc.desc      vpn flow matrix 85,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0088 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(85, false, false, true);
      logInfo("flow matrix 85,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0088 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0089
     * @tc.name      VPN_FlowMatrix_0089
     * @tc.desc      vpn flow matrix 86,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0089 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(86, true, true, true);
      logInfo("flow matrix 86,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0089 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0090
     * @tc.name      VPN_FlowMatrix_0090
     * @tc.desc      vpn flow matrix 87,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0090 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(87, false, true, true);
      logInfo("flow matrix 87,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0090 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0091
     * @tc.name      VPN_FlowMatrix_0091
     * @tc.desc      vpn flow matrix 88,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0091 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(88, true, false, false);
      logInfo("flow matrix 88,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0091 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0092
     * @tc.name      VPN_FlowMatrix_0092
     * @tc.desc      vpn flow matrix 89,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0092 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(89, false, true, true);
      logInfo("flow matrix 89,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0092 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0093
     * @tc.name      VPN_FlowMatrix_0093
     * @tc.desc      vpn flow matrix 90,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0093 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(90, true, true, true);
      logInfo("flow matrix 90,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0093 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0094
     * @tc.name      VPN_FlowMatrix_0094
     * @tc.desc      vpn flow matrix 91,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0094 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(91, false, false, true);
      logInfo("flow matrix 91,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0094 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0095
     * @tc.name      VPN_FlowMatrix_0095
     * @tc.desc      vpn flow matrix 92,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0095 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(92, true, true, true);
      logInfo("flow matrix 92,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0095 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0096
     * @tc.name      VPN_FlowMatrix_0096
     * @tc.desc      vpn flow matrix 93,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0096 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(93, false, true, false);
      logInfo("flow matrix 93,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0096 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0097
     * @tc.name      VPN_FlowMatrix_0097
     * @tc.desc      vpn flow matrix 94,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0097 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(94, true, false, true);
      logInfo("flow matrix 94,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0097 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0098
     * @tc.name      VPN_FlowMatrix_0098
     * @tc.desc      vpn flow matrix 95,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0098 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(95, false, true, true);
      logInfo("flow matrix 95,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0098 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0099
     * @tc.name      VPN_FlowMatrix_0099
     * @tc.desc      vpn flow matrix 96,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0099 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(96, true, true, true);
      logInfo("flow matrix 96,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0099 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0100
     * @tc.name      VPN_FlowMatrix_0100
     * @tc.desc      vpn flow matrix 97,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0100 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(97, false, false, true);
      logInfo("flow matrix 97,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0100 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0101
     * @tc.name      VPN_FlowMatrix_0101
     * @tc.desc      vpn flow matrix 98,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0101 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(98, true, true, false);
      logInfo("flow matrix 98,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0101 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0102
     * @tc.name      VPN_FlowMatrix_0102
     * @tc.desc      vpn flow matrix 99,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0102 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(99, false, true, true);
      logInfo("flow matrix 99,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0102 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0103
     * @tc.name      VPN_FlowMatrix_0103
     * @tc.desc      vpn flow matrix 100,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0103 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(100, true, false, true);
      logInfo("flow matrix 100,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0103 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0104
     * @tc.name      VPN_FlowMatrix_0104
     * @tc.desc      vpn flow matrix 101,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0104 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(101, false, true, true);
      logInfo("flow matrix 101,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0104 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0105
     * @tc.name      VPN_FlowMatrix_0105
     * @tc.desc      vpn flow matrix 102,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0105 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(102, true, true, true);
      logInfo("flow matrix 102,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0105 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0106
     * @tc.name      VPN_FlowMatrix_0106
     * @tc.desc      vpn flow matrix 103,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0106 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(103, false, false, false);
      logInfo("flow matrix 103,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0106 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0107
     * @tc.name      VPN_FlowMatrix_0107
     * @tc.desc      vpn flow matrix 104,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0107 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(104, true, true, true);
      logInfo("flow matrix 104,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0107 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0108
     * @tc.name      VPN_FlowMatrix_0108
     * @tc.desc      vpn flow matrix 105,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0108 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(105, false, true, true);
      logInfo("flow matrix 105,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0108 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0109
     * @tc.name      VPN_FlowMatrix_0109
     * @tc.desc      vpn flow matrix 106,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0109 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(106, true, false, true);
      logInfo("flow matrix 106,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0109 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0110
     * @tc.name      VPN_FlowMatrix_0110
     * @tc.desc      vpn flow matrix 107,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0110 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(107, false, true, true);
      logInfo("flow matrix 107,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0110 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0111
     * @tc.name      VPN_FlowMatrix_0111
     * @tc.desc      vpn flow matrix 108,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0111 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(108, true, true, false);
      logInfo("flow matrix 108,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0111 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0112
     * @tc.name      VPN_FlowMatrix_0112
     * @tc.desc      vpn flow matrix 109,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0112 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(109, false, false, true);
      logInfo("flow matrix 109,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0112 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0113
     * @tc.name      VPN_FlowMatrix_0113
     * @tc.desc      vpn flow matrix 110,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0113 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(110, true, true, true);
      logInfo("flow matrix 110,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0113 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0114
     * @tc.name      VPN_FlowMatrix_0114
     * @tc.desc      vpn flow matrix 111,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0114 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(111, false, true, true);
      logInfo("flow matrix 111,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0114 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0115
     * @tc.name      VPN_FlowMatrix_0115
     * @tc.desc      vpn flow matrix 112,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0115 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(112, true, false, true);
      logInfo("flow matrix 112,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0115 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0116
     * @tc.name      VPN_FlowMatrix_0116
     * @tc.desc      vpn flow matrix 113,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0116 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(113, false, true, false);
      logInfo("flow matrix 113,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0116 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0117
     * @tc.name      VPN_FlowMatrix_0117
     * @tc.desc      vpn flow matrix 114,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0117 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(114, true, true, true);
      logInfo("flow matrix 114,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0117 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0118
     * @tc.name      VPN_FlowMatrix_0118
     * @tc.desc      vpn flow matrix 115,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0118 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(115, false, false, true);
      logInfo("flow matrix 115,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0118 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0119
     * @tc.name      VPN_FlowMatrix_0119
     * @tc.desc      vpn flow matrix 116,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0119 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(116, true, true, true);
      logInfo("flow matrix 116,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0119 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0120
     * @tc.name      VPN_FlowMatrix_0120
     * @tc.desc      vpn flow matrix 117,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0120 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(117, false, true, true);
      logInfo("flow matrix 117,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0120 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0121
     * @tc.name      VPN_FlowMatrix_0121
     * @tc.desc      vpn flow matrix 118,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0121 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(118, true, false, false);
      logInfo("flow matrix 118,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0121 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0122
     * @tc.name      VPN_FlowMatrix_0122
     * @tc.desc      vpn flow matrix 119,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0122 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(119, false, true, true);
      logInfo("flow matrix 119,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0122 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0123
     * @tc.name      VPN_FlowMatrix_0123
     * @tc.desc      vpn flow matrix 120,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0123 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(120, true, true, true);
      logInfo("flow matrix 120,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0123 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0124
     * @tc.name      VPN_FlowMatrix_0124
     * @tc.desc      vpn flow matrix 121,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0124 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(121, false, false, true);
      logInfo("flow matrix 121,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0124 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0125
     * @tc.name      VPN_FlowMatrix_0125
     * @tc.desc      vpn flow matrix 122,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0125 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(122, true, true, true);
      logInfo("flow matrix 122,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0125 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0126
     * @tc.name      VPN_FlowMatrix_0126
     * @tc.desc      vpn flow matrix 123,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0126 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(123, false, true, false);
      logInfo("flow matrix 123,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0126 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0127
     * @tc.name      VPN_FlowMatrix_0127
     * @tc.desc      vpn flow matrix 124,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0127 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(124, true, false, true);
      logInfo("flow matrix 124,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0127 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0128
     * @tc.name      VPN_FlowMatrix_0128
     * @tc.desc      vpn flow matrix 125,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0128 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(125, false, true, true);
      logInfo("flow matrix 125,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0128 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0129
     * @tc.name      VPN_FlowMatrix_0129
     * @tc.desc      vpn flow matrix 126,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0129 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(126, true, true, true);
      logInfo("flow matrix 126,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0129 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0130
     * @tc.name      VPN_FlowMatrix_0130
     * @tc.desc      vpn flow matrix 127,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0130 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(127, false, false, true);
      logInfo("flow matrix 127,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0130 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0131
     * @tc.name      VPN_FlowMatrix_0131
     * @tc.desc      vpn flow matrix 128,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0131 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(128, true, true, false);
      logInfo("flow matrix 128,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0131 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0132
     * @tc.name      VPN_FlowMatrix_0132
     * @tc.desc      vpn flow matrix 129,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0132 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(129, false, true, true);
      logInfo("flow matrix 129,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0132 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0133
     * @tc.name      VPN_FlowMatrix_0133
     * @tc.desc      vpn flow matrix 130,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0133 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(130, true, false, true);
      logInfo("flow matrix 130,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0133 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0134
     * @tc.name      VPN_FlowMatrix_0134
     * @tc.desc      vpn flow matrix 131,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0134 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(131, false, true, true);
      logInfo("flow matrix 131,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0134 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0135
     * @tc.name      VPN_FlowMatrix_0135
     * @tc.desc      vpn flow matrix 132,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0135 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(132, true, true, true);
      logInfo("flow matrix 132,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0135 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0136
     * @tc.name      VPN_FlowMatrix_0136
     * @tc.desc      vpn flow matrix 133,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0136 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(133, false, false, false);
      logInfo("flow matrix 133,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0136 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0137
     * @tc.name      VPN_FlowMatrix_0137
     * @tc.desc      vpn flow matrix 134,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0137 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(134, true, true, true);
      logInfo("flow matrix 134,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0137 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0138
     * @tc.name      VPN_FlowMatrix_0138
     * @tc.desc      vpn flow matrix 135,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0138 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(135, false, true, true);
      logInfo("flow matrix 135,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0138 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0139
     * @tc.name      VPN_FlowMatrix_0139
     * @tc.desc      vpn flow matrix 136,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0139 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(136, true, false, true);
      logInfo("flow matrix 136,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0139 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0140
     * @tc.name      VPN_FlowMatrix_0140
     * @tc.desc      vpn flow matrix 137,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0140 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(137, false, true, true);
      logInfo("flow matrix 137,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0140 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0141
     * @tc.name      VPN_FlowMatrix_0141
     * @tc.desc      vpn flow matrix 138,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0141 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(138, true, true, false);
      logInfo("flow matrix 138,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0141 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0142
     * @tc.name      VPN_FlowMatrix_0142
     * @tc.desc      vpn flow matrix 139,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0142 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(139, false, false, true);
      logInfo("flow matrix 139,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0142 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0143
     * @tc.name      VPN_FlowMatrix_0143
     * @tc.desc      vpn flow matrix 140,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0143 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(140, true, true, true);
      logInfo("flow matrix 140,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0143 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0144
     * @tc.name      VPN_FlowMatrix_0144
     * @tc.desc      vpn flow matrix 141,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0144 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(141, false, true, true);
      logInfo("flow matrix 141,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0144 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0145
     * @tc.name      VPN_FlowMatrix_0145
     * @tc.desc      vpn flow matrix 142,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0145 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(142, true, false, true);
      logInfo("flow matrix 142,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0145 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0146
     * @tc.name      VPN_FlowMatrix_0146
     * @tc.desc      vpn flow matrix 143,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0146 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(143, false, true, false);
      logInfo("flow matrix 143,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0146 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0147
     * @tc.name      VPN_FlowMatrix_0147
     * @tc.desc      vpn flow matrix 144,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0147 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(144, true, true, true);
      logInfo("flow matrix 144,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0147 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0148
     * @tc.name      VPN_FlowMatrix_0148
     * @tc.desc      vpn flow matrix 145,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0148 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(145, false, false, true);
      logInfo("flow matrix 145,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0148 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0149
     * @tc.name      VPN_FlowMatrix_0149
     * @tc.desc      vpn flow matrix 146,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0149 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(146, true, true, true);
      logInfo("flow matrix 146,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0149 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0150
     * @tc.name      VPN_FlowMatrix_0150
     * @tc.desc      vpn flow matrix 147,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0150 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(147, false, true, true);
      logInfo("flow matrix 147,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0150 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0151
     * @tc.name      VPN_FlowMatrix_0151
     * @tc.desc      vpn flow matrix 148,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0151 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(148, true, false, false);
      logInfo("flow matrix 148,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0151 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0152
     * @tc.name      VPN_FlowMatrix_0152
     * @tc.desc      vpn flow matrix 149,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0152 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(149, false, true, true);
      logInfo("flow matrix 149,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0152 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0153
     * @tc.name      VPN_FlowMatrix_0153
     * @tc.desc      vpn flow matrix 150,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0153 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(150, true, true, true);
      logInfo("flow matrix 150,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0153 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0154
     * @tc.name      VPN_FlowMatrix_0154
     * @tc.desc      vpn flow matrix 151,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0154 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(151, false, false, true);
      logInfo("flow matrix 151,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0154 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0155
     * @tc.name      VPN_FlowMatrix_0155
     * @tc.desc      vpn flow matrix 152,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0155 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(152, true, true, true);
      logInfo("flow matrix 152,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0155 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0156
     * @tc.name      VPN_FlowMatrix_0156
     * @tc.desc      vpn flow matrix 153,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0156 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(153, false, true, false);
      logInfo("flow matrix 153,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0156 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0157
     * @tc.name      VPN_FlowMatrix_0157
     * @tc.desc      vpn flow matrix 154,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0157 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(154, true, false, true);
      logInfo("flow matrix 154,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0157 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0158
     * @tc.name      VPN_FlowMatrix_0158
     * @tc.desc      vpn flow matrix 155,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0158 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(155, false, true, true);
      logInfo("flow matrix 155,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0158 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0159
     * @tc.name      VPN_FlowMatrix_0159
     * @tc.desc      vpn flow matrix 156,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0159 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(156, true, true, true);
      logInfo("flow matrix 156,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0159 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0160
     * @tc.name      VPN_FlowMatrix_0160
     * @tc.desc      vpn flow matrix 157,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0160 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(157, false, false, true);
      logInfo("flow matrix 157,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0160 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0161
     * @tc.name      VPN_FlowMatrix_0161
     * @tc.desc      vpn flow matrix 158,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0161 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(158, true, true, false);
      logInfo("flow matrix 158,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0161 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0162
     * @tc.name      VPN_FlowMatrix_0162
     * @tc.desc      vpn flow matrix 159,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0162 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(159, false, true, true);
      logInfo("flow matrix 159,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0162 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0163
     * @tc.name      VPN_FlowMatrix_0163
     * @tc.desc      vpn flow matrix 160,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0163 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(160, true, false, true);
      logInfo("flow matrix 160,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0163 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0164
     * @tc.name      VPN_FlowMatrix_0164
     * @tc.desc      vpn flow matrix 161,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0164 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(161, false, true, true);
      logInfo("flow matrix 161,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0164 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0165
     * @tc.name      VPN_FlowMatrix_0165
     * @tc.desc      vpn flow matrix 162,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0165 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(162, true, true, true);
      logInfo("flow matrix 162,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0165 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0166
     * @tc.name      VPN_FlowMatrix_0166
     * @tc.desc      vpn flow matrix 163,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0166 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(163, false, false, false);
      logInfo("flow matrix 163,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0166 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0167
     * @tc.name      VPN_FlowMatrix_0167
     * @tc.desc      vpn flow matrix 164,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0167 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(164, true, true, true);
      logInfo("flow matrix 164,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0167 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0168
     * @tc.name      VPN_FlowMatrix_0168
     * @tc.desc      vpn flow matrix 165,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0168 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(165, false, true, true);
      logInfo("flow matrix 165,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0168 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0169
     * @tc.name      VPN_FlowMatrix_0169
     * @tc.desc      vpn flow matrix 166,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0169 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(166, true, false, true);
      logInfo("flow matrix 166,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0169 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0170
     * @tc.name      VPN_FlowMatrix_0170
     * @tc.desc      vpn flow matrix 167,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0170 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(167, false, true, true);
      logInfo("flow matrix 167,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0170 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0171
     * @tc.name      VPN_FlowMatrix_0171
     * @tc.desc      vpn flow matrix 168,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0171 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(168, true, true, false);
      logInfo("flow matrix 168,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0171 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0172
     * @tc.name      VPN_FlowMatrix_0172
     * @tc.desc      vpn flow matrix 169,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0172 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(169, false, false, true);
      logInfo("flow matrix 169,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0172 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0173
     * @tc.name      VPN_FlowMatrix_0173
     * @tc.desc      vpn flow matrix 170,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0173 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(170, true, true, true);
      logInfo("flow matrix 170,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0173 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0174
     * @tc.name      VPN_FlowMatrix_0174
     * @tc.desc      vpn flow matrix 171,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0174 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(171, false, true, true);
      logInfo("flow matrix 171,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0174 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0175
     * @tc.name      VPN_FlowMatrix_0175
     * @tc.desc      vpn flow matrix 172,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0175 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(172, true, false, true);
      logInfo("flow matrix 172,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0175 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0176
     * @tc.name      VPN_FlowMatrix_0176
     * @tc.desc      vpn flow matrix 173,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0176 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(173, false, true, false);
      logInfo("flow matrix 173,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0176 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0177
     * @tc.name      VPN_FlowMatrix_0177
     * @tc.desc      vpn flow matrix 174,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0177 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(174, true, true, true);
      logInfo("flow matrix 174,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0177 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0178
     * @tc.name      VPN_FlowMatrix_0178
     * @tc.desc      vpn flow matrix 175,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0178 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(175, false, false, true);
      logInfo("flow matrix 175,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0178 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0179
     * @tc.name      VPN_FlowMatrix_0179
     * @tc.desc      vpn flow matrix 176,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0179 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(176, true, true, true);
      logInfo("flow matrix 176,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0179 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0180
     * @tc.name      VPN_FlowMatrix_0180
     * @tc.desc      vpn flow matrix 177,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0180 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(177, false, true, true);
      logInfo("flow matrix 177,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0180 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0181
     * @tc.name      VPN_FlowMatrix_0181
     * @tc.desc      vpn flow matrix 178,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0181 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(178, true, false, false);
      logInfo("flow matrix 178,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0181 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0182
     * @tc.name      VPN_FlowMatrix_0182
     * @tc.desc      vpn flow matrix 179,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0182 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(179, false, true, true);
      logInfo("flow matrix 179,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0182 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0183
     * @tc.name      VPN_FlowMatrix_0183
     * @tc.desc      vpn flow matrix 180,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0183 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(180, true, true, true);
      logInfo("flow matrix 180,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0183 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0184
     * @tc.name      VPN_FlowMatrix_0184
     * @tc.desc      vpn flow matrix 181,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0184 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(181, false, false, true);
      logInfo("flow matrix 181,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0184 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0185
     * @tc.name      VPN_FlowMatrix_0185
     * @tc.desc      vpn flow matrix 182,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0185 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(182, true, true, true);
      logInfo("flow matrix 182,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0185 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0186
     * @tc.name      VPN_FlowMatrix_0186
     * @tc.desc      vpn flow matrix 183,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0186 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(183, false, true, false);
      logInfo("flow matrix 183,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0186 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0187
     * @tc.name      VPN_FlowMatrix_0187
     * @tc.desc      vpn flow matrix 184,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0187 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(184, true, false, true);
      logInfo("flow matrix 184,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0187 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0188
     * @tc.name      VPN_FlowMatrix_0188
     * @tc.desc      vpn flow matrix 185,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0188 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(185, false, true, true);
      logInfo("flow matrix 185,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0188 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0189
     * @tc.name      VPN_FlowMatrix_0189
     * @tc.desc      vpn flow matrix 186,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0189 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(186, true, true, true);
      logInfo("flow matrix 186,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0189 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0190
     * @tc.name      VPN_FlowMatrix_0190
     * @tc.desc      vpn flow matrix 187,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0190 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(187, false, false, true);
      logInfo("flow matrix 187,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0190 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0191
     * @tc.name      VPN_FlowMatrix_0191
     * @tc.desc      vpn flow matrix 188,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0191 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(188, true, true, false);
      logInfo("flow matrix 188,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0191 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0192
     * @tc.name      VPN_FlowMatrix_0192
     * @tc.desc      vpn flow matrix 189,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0192 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(189, false, true, true);
      logInfo("flow matrix 189,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0192 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0193
     * @tc.name      VPN_FlowMatrix_0193
     * @tc.desc      vpn flow matrix 190,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0193 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(190, true, false, true);
      logInfo("flow matrix 190,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0193 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0194
     * @tc.name      VPN_FlowMatrix_0194
     * @tc.desc      vpn flow matrix 191,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0194 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(191, false, true, true);
      logInfo("flow matrix 191,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0194 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0195
     * @tc.name      VPN_FlowMatrix_0195
     * @tc.desc      vpn flow matrix 192,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0195 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(192, true, true, true);
      logInfo("flow matrix 192,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0195 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0196
     * @tc.name      VPN_FlowMatrix_0196
     * @tc.desc      vpn flow matrix 193,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0196 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(193, false, false, false);
      logInfo("flow matrix 193,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0196 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0197
     * @tc.name      VPN_FlowMatrix_0197
     * @tc.desc      vpn flow matrix 194,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0197 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(194, true, true, true);
      logInfo("flow matrix 194,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0197 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0198
     * @tc.name      VPN_FlowMatrix_0198
     * @tc.desc      vpn flow matrix 195,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0198 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(195, false, true, true);
      logInfo("flow matrix 195,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0198 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0199
     * @tc.name      VPN_FlowMatrix_0199
     * @tc.desc      vpn flow matrix 196,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0199 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(196, true, false, true);
      logInfo("flow matrix 196,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0199 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0200
     * @tc.name      VPN_FlowMatrix_0200
     * @tc.desc      vpn flow matrix 197,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0200 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(197, false, true, true);
      logInfo("flow matrix 197,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0200 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0201
     * @tc.name      VPN_FlowMatrix_0201
     * @tc.desc      vpn flow matrix 198,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0201 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(198, true, true, false);
      logInfo("flow matrix 198,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0201 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0202
     * @tc.name      VPN_FlowMatrix_0202
     * @tc.desc      vpn flow matrix 199,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0202 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(199, false, false, true);
      logInfo("flow matrix 199,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0202 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0203
     * @tc.name      VPN_FlowMatrix_0203
     * @tc.desc      vpn flow matrix 200,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0203 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(200, true, true, true);
      logInfo("flow matrix 200,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0203 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0204
     * @tc.name      VPN_FlowMatrix_0204
     * @tc.desc      vpn flow matrix 201,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0204 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(201, false, true, true);
      logInfo("flow matrix 201,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0204 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0205
     * @tc.name      VPN_FlowMatrix_0205
     * @tc.desc      vpn flow matrix 202,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0205 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(202, true, false, true);
      logInfo("flow matrix 202,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0205 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0206
     * @tc.name      VPN_FlowMatrix_0206
     * @tc.desc      vpn flow matrix 203,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0206 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(203, false, true, false);
      logInfo("flow matrix 203,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0206 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0207
     * @tc.name      VPN_FlowMatrix_0207
     * @tc.desc      vpn flow matrix 204,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0207 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(204, true, true, true);
      logInfo("flow matrix 204,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0207 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0208
     * @tc.name      VPN_FlowMatrix_0208
     * @tc.desc      vpn flow matrix 205,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0208 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(205, false, false, true);
      logInfo("flow matrix 205,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0208 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0209
     * @tc.name      VPN_FlowMatrix_0209
     * @tc.desc      vpn flow matrix 206,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0209 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(206, true, true, true);
      logInfo("flow matrix 206,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0209 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0210
     * @tc.name      VPN_FlowMatrix_0210
     * @tc.desc      vpn flow matrix 207,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0210 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(207, false, true, true);
      logInfo("flow matrix 207,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0210 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0211
     * @tc.name      VPN_FlowMatrix_0211
     * @tc.desc      vpn flow matrix 208,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0211 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(208, true, false, false);
      logInfo("flow matrix 208,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0211 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0212
     * @tc.name      VPN_FlowMatrix_0212
     * @tc.desc      vpn flow matrix 209,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0212 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(209, false, true, true);
      logInfo("flow matrix 209,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0212 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0213
     * @tc.name      VPN_FlowMatrix_0213
     * @tc.desc      vpn flow matrix 210,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0213 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(210, true, true, true);
      logInfo("flow matrix 210,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0213 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0214
     * @tc.name      VPN_FlowMatrix_0214
     * @tc.desc      vpn flow matrix 211,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0214 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(211, false, false, true);
      logInfo("flow matrix 211,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0214 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0215
     * @tc.name      VPN_FlowMatrix_0215
     * @tc.desc      vpn flow matrix 212,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0215 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(212, true, true, true);
      logInfo("flow matrix 212,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0215 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0216
     * @tc.name      VPN_FlowMatrix_0216
     * @tc.desc      vpn flow matrix 213,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0216 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(213, false, true, false);
      logInfo("flow matrix 213,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0216 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0217
     * @tc.name      VPN_FlowMatrix_0217
     * @tc.desc      vpn flow matrix 214,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0217 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(214, true, false, true);
      logInfo("flow matrix 214,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0217 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0218
     * @tc.name      VPN_FlowMatrix_0218
     * @tc.desc      vpn flow matrix 215,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0218 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(215, false, true, true);
      logInfo("flow matrix 215,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0218 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0219
     * @tc.name      VPN_FlowMatrix_0219
     * @tc.desc      vpn flow matrix 216,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0219 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(216, true, true, true);
      logInfo("flow matrix 216,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0219 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0220
     * @tc.name      VPN_FlowMatrix_0220
     * @tc.desc      vpn flow matrix 217,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0220 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(217, false, false, true);
      logInfo("flow matrix 217,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0220 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0221
     * @tc.name      VPN_FlowMatrix_0221
     * @tc.desc      vpn flow matrix 218,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0221 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(218, true, true, false);
      logInfo("flow matrix 218,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0221 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0222
     * @tc.name      VPN_FlowMatrix_0222
     * @tc.desc      vpn flow matrix 219,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0222 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(219, false, true, true);
      logInfo("flow matrix 219,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0222 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0223
     * @tc.name      VPN_FlowMatrix_0223
     * @tc.desc      vpn flow matrix 220,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0223 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(220, true, false, true);
      logInfo("flow matrix 220,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0223 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0224
     * @tc.name      VPN_FlowMatrix_0224
     * @tc.desc      vpn flow matrix 221,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0224 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(221, false, true, true);
      logInfo("flow matrix 221,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0224 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0225
     * @tc.name      VPN_FlowMatrix_0225
     * @tc.desc      vpn flow matrix 222,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0225 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(222, true, true, true);
      logInfo("flow matrix 222,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0225 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0226
     * @tc.name      VPN_FlowMatrix_0226
     * @tc.desc      vpn flow matrix 223,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0226 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(223, false, false, false);
      logInfo("flow matrix 223,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0226 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0227
     * @tc.name      VPN_FlowMatrix_0227
     * @tc.desc      vpn flow matrix 224,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0227 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(224, true, true, true);
      logInfo("flow matrix 224,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0227 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0228
     * @tc.name      VPN_FlowMatrix_0228
     * @tc.desc      vpn flow matrix 225,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0228 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(225, false, true, true);
      logInfo("flow matrix 225,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0228 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0229
     * @tc.name      VPN_FlowMatrix_0229
     * @tc.desc      vpn flow matrix 226,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0229 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(226, true, false, true);
      logInfo("flow matrix 226,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0229 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0230
     * @tc.name      VPN_FlowMatrix_0230
     * @tc.desc      vpn flow matrix 227,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0230 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(227, false, true, true);
      logInfo("flow matrix 227,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0230 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0231
     * @tc.name      VPN_FlowMatrix_0231
     * @tc.desc      vpn flow matrix 228,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0231 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(228, true, true, false);
      logInfo("flow matrix 228,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0231 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0232
     * @tc.name      VPN_FlowMatrix_0232
     * @tc.desc      vpn flow matrix 229,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0232 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(229, false, false, true);
      logInfo("flow matrix 229,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0232 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0233
     * @tc.name      VPN_FlowMatrix_0233
     * @tc.desc      vpn flow matrix 230,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0233 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(230, true, true, true);
      logInfo("flow matrix 230,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0233 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0234
     * @tc.name      VPN_FlowMatrix_0234
     * @tc.desc      vpn flow matrix 231,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0234 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(231, false, true, true);
      logInfo("flow matrix 231,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0234 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0235
     * @tc.name      VPN_FlowMatrix_0235
     * @tc.desc      vpn flow matrix 232,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0235 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(232, true, false, true);
      logInfo("flow matrix 232,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0235 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0236
     * @tc.name      VPN_FlowMatrix_0236
     * @tc.desc      vpn flow matrix 233,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0236 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(233, false, true, false);
      logInfo("flow matrix 233,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0236 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0237
     * @tc.name      VPN_FlowMatrix_0237
     * @tc.desc      vpn flow matrix 234,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0237 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(234, true, true, true);
      logInfo("flow matrix 234,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0237 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0238
     * @tc.name      VPN_FlowMatrix_0238
     * @tc.desc      vpn flow matrix 235,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0238 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(235, false, false, true);
      logInfo("flow matrix 235,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0238 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0239
     * @tc.name      VPN_FlowMatrix_0239
     * @tc.desc      vpn flow matrix 236,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0239 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(236, true, true, true);
      logInfo("flow matrix 236,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0239 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0240
     * @tc.name      VPN_FlowMatrix_0240
     * @tc.desc      vpn flow matrix 237,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0240 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(237, false, true, true);
      logInfo("flow matrix 237,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0240 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0241
     * @tc.name      VPN_FlowMatrix_0241
     * @tc.desc      vpn flow matrix 238,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0241 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(238, true, false, false);
      logInfo("flow matrix 238,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0241 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0242
     * @tc.name      VPN_FlowMatrix_0242
     * @tc.desc      vpn flow matrix 239,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0242 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(239, false, true, true);
      logInfo("flow matrix 239,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0242 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0243
     * @tc.name      VPN_FlowMatrix_0243
     * @tc.desc      vpn flow matrix 240,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0243 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(240, true, true, true);
      logInfo("flow matrix 240,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0243 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0244
     * @tc.name      VPN_FlowMatrix_0244
     * @tc.desc      vpn flow matrix 241,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0244 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(241, false, false, true);
      logInfo("flow matrix 241,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0244 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0245
     * @tc.name      VPN_FlowMatrix_0245
     * @tc.desc      vpn flow matrix 242,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0245 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(242, true, true, true);
      logInfo("flow matrix 242,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0245 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0246
     * @tc.name      VPN_FlowMatrix_0246
     * @tc.desc      vpn flow matrix 243,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0246 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(243, false, true, false);
      logInfo("flow matrix 243,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0246 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0247
     * @tc.name      VPN_FlowMatrix_0247
     * @tc.desc      vpn flow matrix 244,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0247 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(244, true, false, true);
      logInfo("flow matrix 244,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0247 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0248
     * @tc.name      VPN_FlowMatrix_0248
     * @tc.desc      vpn flow matrix 245,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0248 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(245, false, true, true);
      logInfo("flow matrix 245,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0248 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0249
     * @tc.name      VPN_FlowMatrix_0249
     * @tc.desc      vpn flow matrix 246,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0249 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(246, true, true, true);
      logInfo("flow matrix 246,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0249 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0250
     * @tc.name      VPN_FlowMatrix_0250
     * @tc.desc      vpn flow matrix 247,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0250 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(247, false, false, true);
      logInfo("flow matrix 247,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0250 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0251
     * @tc.name      VPN_FlowMatrix_0251
     * @tc.desc      vpn flow matrix 248,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0251 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(248, true, true, false);
      logInfo("flow matrix 248,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0251 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0252
     * @tc.name      VPN_FlowMatrix_0252
     * @tc.desc      vpn flow matrix 249,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0252 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(249, false, true, true);
      logInfo("flow matrix 249,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0252 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0253
     * @tc.name      VPN_FlowMatrix_0253
     * @tc.desc      vpn flow matrix 250,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0253 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(250, true, false, true);
      logInfo("flow matrix 250,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0253 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0254
     * @tc.name      VPN_FlowMatrix_0254
     * @tc.desc      vpn flow matrix 251,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0254 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(251, false, true, true);
      logInfo("flow matrix 251,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0254 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0255
     * @tc.name      VPN_FlowMatrix_0255
     * @tc.desc      vpn flow matrix 252,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0255 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(252, true, true, true);
      logInfo("flow matrix 252,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0255 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0256
     * @tc.name      VPN_FlowMatrix_0256
     * @tc.desc      vpn flow matrix 253,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0256 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(253, false, false, false);
      logInfo("flow matrix 253,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0256 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0257
     * @tc.name      VPN_FlowMatrix_0257
     * @tc.desc      vpn flow matrix 254,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0257 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(254, true, true, true);
      logInfo("flow matrix 254,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0257 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0258
     * @tc.name      VPN_FlowMatrix_0258
     * @tc.desc      vpn flow matrix 255,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0258 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(255, false, true, true);
      logInfo("flow matrix 255,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0258 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0259
     * @tc.name      VPN_FlowMatrix_0259
     * @tc.desc      vpn flow matrix 256,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0259 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(256, true, false, true);
      logInfo("flow matrix 256,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0259 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0260
     * @tc.name      VPN_FlowMatrix_0260
     * @tc.desc      vpn flow matrix 257,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0260 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(257, false, true, true);
      logInfo("flow matrix 257,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0260 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0261
     * @tc.name      VPN_FlowMatrix_0261
     * @tc.desc      vpn flow matrix 258,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0261 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(258, true, true, false);
      logInfo("flow matrix 258,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0261 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0262
     * @tc.name      VPN_FlowMatrix_0262
     * @tc.desc      vpn flow matrix 259,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0262 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(259, false, false, true);
      logInfo("flow matrix 259,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0262 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0263
     * @tc.name      VPN_FlowMatrix_0263
     * @tc.desc      vpn flow matrix 260,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0263 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(260, true, true, true);
      logInfo("flow matrix 260,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0263 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0264
     * @tc.name      VPN_FlowMatrix_0264
     * @tc.desc      vpn flow matrix 261,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0264 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(261, false, true, true);
      logInfo("flow matrix 261,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0264 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0265
     * @tc.name      VPN_FlowMatrix_0265
     * @tc.desc      vpn flow matrix 262,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0265 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(262, true, false, true);
      logInfo("flow matrix 262,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0265 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0266
     * @tc.name      VPN_FlowMatrix_0266
     * @tc.desc      vpn flow matrix 263,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0266 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(263, false, true, false);
      logInfo("flow matrix 263,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0266 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0267
     * @tc.name      VPN_FlowMatrix_0267
     * @tc.desc      vpn flow matrix 264,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0267 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(264, true, true, true);
      logInfo("flow matrix 264,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0267 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0268
     * @tc.name      VPN_FlowMatrix_0268
     * @tc.desc      vpn flow matrix 265,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0268 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(265, false, false, true);
      logInfo("flow matrix 265,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0268 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0269
     * @tc.name      VPN_FlowMatrix_0269
     * @tc.desc      vpn flow matrix 266,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0269 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(266, true, true, true);
      logInfo("flow matrix 266,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0269 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0270
     * @tc.name      VPN_FlowMatrix_0270
     * @tc.desc      vpn flow matrix 267,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0270 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(267, false, true, true);
      logInfo("flow matrix 267,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0270 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0271
     * @tc.name      VPN_FlowMatrix_0271
     * @tc.desc      vpn flow matrix 268,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0271 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(268, true, false, false);
      logInfo("flow matrix 268,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0271 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0272
     * @tc.name      VPN_FlowMatrix_0272
     * @tc.desc      vpn flow matrix 269,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0272 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(269, false, true, true);
      logInfo("flow matrix 269,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0272 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0273
     * @tc.name      VPN_FlowMatrix_0273
     * @tc.desc      vpn flow matrix 270,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0273 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(270, true, true, true);
      logInfo("flow matrix 270,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0273 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0274
     * @tc.name      VPN_FlowMatrix_0274
     * @tc.desc      vpn flow matrix 271,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0274 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(271, false, false, true);
      logInfo("flow matrix 271,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0274 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0275
     * @tc.name      VPN_FlowMatrix_0275
     * @tc.desc      vpn flow matrix 272,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0275 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(272, true, true, true);
      logInfo("flow matrix 272,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0275 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0276
     * @tc.name      VPN_FlowMatrix_0276
     * @tc.desc      vpn flow matrix 273,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0276 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(273, false, true, false);
      logInfo("flow matrix 273,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0276 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0277
     * @tc.name      VPN_FlowMatrix_0277
     * @tc.desc      vpn flow matrix 274,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0277 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(274, true, false, true);
      logInfo("flow matrix 274,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0277 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0278
     * @tc.name      VPN_FlowMatrix_0278
     * @tc.desc      vpn flow matrix 275,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0278 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(275, false, true, true);
      logInfo("flow matrix 275,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0278 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0279
     * @tc.name      VPN_FlowMatrix_0279
     * @tc.desc      vpn flow matrix 276,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0279 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(276, true, true, true);
      logInfo("flow matrix 276,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0279 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0280
     * @tc.name      VPN_FlowMatrix_0280
     * @tc.desc      vpn flow matrix 277,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0280 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(277, false, false, true);
      logInfo("flow matrix 277,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0280 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0281
     * @tc.name      VPN_FlowMatrix_0281
     * @tc.desc      vpn flow matrix 278,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0281 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(278, true, true, false);
      logInfo("flow matrix 278,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0281 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0282
     * @tc.name      VPN_FlowMatrix_0282
     * @tc.desc      vpn flow matrix 279,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0282 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(279, false, true, true);
      logInfo("flow matrix 279,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0282 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0283
     * @tc.name      VPN_FlowMatrix_0283
     * @tc.desc      vpn flow matrix 280,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0283 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(280, true, false, true);
      logInfo("flow matrix 280,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0283 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0284
     * @tc.name      VPN_FlowMatrix_0284
     * @tc.desc      vpn flow matrix 281,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0284 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(281, false, true, true);
      logInfo("flow matrix 281,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0284 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0285
     * @tc.name      VPN_FlowMatrix_0285
     * @tc.desc      vpn flow matrix 282,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0285 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(282, true, true, true);
      logInfo("flow matrix 282,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0285 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0286
     * @tc.name      VPN_FlowMatrix_0286
     * @tc.desc      vpn flow matrix 283,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0286 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(283, false, false, false);
      logInfo("flow matrix 283,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0286 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0287
     * @tc.name      VPN_FlowMatrix_0287
     * @tc.desc      vpn flow matrix 284,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0287 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(284, true, true, true);
      logInfo("flow matrix 284,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0287 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0288
     * @tc.name      VPN_FlowMatrix_0288
     * @tc.desc      vpn flow matrix 285,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0288 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(285, false, true, true);
      logInfo("flow matrix 285,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0288 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0289
     * @tc.name      VPN_FlowMatrix_0289
     * @tc.desc      vpn flow matrix 286,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0289 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(286, true, false, true);
      logInfo("flow matrix 286,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0289 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0290
     * @tc.name      VPN_FlowMatrix_0290
     * @tc.desc      vpn flow matrix 287,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0290 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(287, false, true, true);
      logInfo("flow matrix 287,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0290 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0291
     * @tc.name      VPN_FlowMatrix_0291
     * @tc.desc      vpn flow matrix 288,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0291 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(288, true, true, false);
      logInfo("flow matrix 288,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0291 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0292
     * @tc.name      VPN_FlowMatrix_0292
     * @tc.desc      vpn flow matrix 289,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0292 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(289, false, false, true);
      logInfo("flow matrix 289,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0292 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0293
     * @tc.name      VPN_FlowMatrix_0293
     * @tc.desc      vpn flow matrix 290,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0293 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(290, true, true, true);
      logInfo("flow matrix 290,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0293 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0294
     * @tc.name      VPN_FlowMatrix_0294
     * @tc.desc      vpn flow matrix 291,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0294 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(291, false, true, true);
      logInfo("flow matrix 291,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0294 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0295
     * @tc.name      VPN_FlowMatrix_0295
     * @tc.desc      vpn flow matrix 292,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0295 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(292, true, false, true);
      logInfo("flow matrix 292,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0295 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0296
     * @tc.name      VPN_FlowMatrix_0296
     * @tc.desc      vpn flow matrix 293,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0296 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(293, false, true, false);
      logInfo("flow matrix 293,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0296 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0297
     * @tc.name      VPN_FlowMatrix_0297
     * @tc.desc      vpn flow matrix 294,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0297 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(294, true, true, true);
      logInfo("flow matrix 294,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0297 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0298
     * @tc.name      VPN_FlowMatrix_0298
     * @tc.desc      vpn flow matrix 295,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0298 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(295, false, false, true);
      logInfo("flow matrix 295,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0298 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0299
     * @tc.name      VPN_FlowMatrix_0299
     * @tc.desc      vpn flow matrix 296,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0299 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(296, true, true, true);
      logInfo("flow matrix 296,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0299 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0300
     * @tc.name      VPN_FlowMatrix_0300
     * @tc.desc      vpn flow matrix 297,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0300 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(297, false, true, true);
      logInfo("flow matrix 297,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0300 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0301
     * @tc.name      VPN_FlowMatrix_0301
     * @tc.desc      vpn flow matrix 298,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0301 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(298, true, false, false);
      logInfo("flow matrix 298,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0301 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0302
     * @tc.name      VPN_FlowMatrix_0302
     * @tc.desc      vpn flow matrix 299,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0302 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(299, false, true, true);
      logInfo("flow matrix 299,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0302 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0303
     * @tc.name      VPN_FlowMatrix_0303
     * @tc.desc      vpn flow matrix 300,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0303 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(300, true, true, true);
      logInfo("flow matrix 300,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0303 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0304
     * @tc.name      VPN_FlowMatrix_0304
     * @tc.desc      vpn flow matrix 301,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0304 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(301, false, false, true);
      logInfo("flow matrix 301,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0304 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0305
     * @tc.name      VPN_FlowMatrix_0305
     * @tc.desc      vpn flow matrix 302,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0305 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(302, true, true, true);
      logInfo("flow matrix 302,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0305 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0306
     * @tc.name      VPN_FlowMatrix_0306
     * @tc.desc      vpn flow matrix 303,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0306 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(303, false, true, false);
      logInfo("flow matrix 303,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0306 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0307
     * @tc.name      VPN_FlowMatrix_0307
     * @tc.desc      vpn flow matrix 304,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0307 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(304, true, false, true);
      logInfo("flow matrix 304,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0307 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0308
     * @tc.name      VPN_FlowMatrix_0308
     * @tc.desc      vpn flow matrix 305,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0308 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(305, false, true, true);
      logInfo("flow matrix 305,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0308 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0309
     * @tc.name      VPN_FlowMatrix_0309
     * @tc.desc      vpn flow matrix 306,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0309 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(306, true, true, true);
      logInfo("flow matrix 306,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0309 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0310
     * @tc.name      VPN_FlowMatrix_0310
     * @tc.desc      vpn flow matrix 307,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0310 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(307, false, false, true);
      logInfo("flow matrix 307,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0310 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0311
     * @tc.name      VPN_FlowMatrix_0311
     * @tc.desc      vpn flow matrix 308,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0311 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(308, true, true, false);
      logInfo("flow matrix 308,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0311 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0312
     * @tc.name      VPN_FlowMatrix_0312
     * @tc.desc      vpn flow matrix 309,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0312 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(309, false, true, true);
      logInfo("flow matrix 309,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0312 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0313
     * @tc.name      VPN_FlowMatrix_0313
     * @tc.desc      vpn flow matrix 310,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0313 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(310, true, false, true);
      logInfo("flow matrix 310,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0313 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0314
     * @tc.name      VPN_FlowMatrix_0314
     * @tc.desc      vpn flow matrix 311,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0314 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(311, false, true, true);
      logInfo("flow matrix 311,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0314 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0315
     * @tc.name      VPN_FlowMatrix_0315
     * @tc.desc      vpn flow matrix 312,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0315 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(312, true, true, true);
      logInfo("flow matrix 312,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0315 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0316
     * @tc.name      VPN_FlowMatrix_0316
     * @tc.desc      vpn flow matrix 313,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0316 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(313, false, false, false);
      logInfo("flow matrix 313,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0316 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0317
     * @tc.name      VPN_FlowMatrix_0317
     * @tc.desc      vpn flow matrix 314,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0317 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(314, true, true, true);
      logInfo("flow matrix 314,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0317 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0318
     * @tc.name      VPN_FlowMatrix_0318
     * @tc.desc      vpn flow matrix 315,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0318 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(315, false, true, true);
      logInfo("flow matrix 315,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0318 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0319
     * @tc.name      VPN_FlowMatrix_0319
     * @tc.desc      vpn flow matrix 316,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0319 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(316, true, false, true);
      logInfo("flow matrix 316,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0319 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0320
     * @tc.name      VPN_FlowMatrix_0320
     * @tc.desc      vpn flow matrix 317,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0320 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(317, false, true, true);
      logInfo("flow matrix 317,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0320 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0321
     * @tc.name      VPN_FlowMatrix_0321
     * @tc.desc      vpn flow matrix 318,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0321 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(318, true, true, false);
      logInfo("flow matrix 318,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0321 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0322
     * @tc.name      VPN_FlowMatrix_0322
     * @tc.desc      vpn flow matrix 319,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0322 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(319, false, false, true);
      logInfo("flow matrix 319,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0322 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0323
     * @tc.name      VPN_FlowMatrix_0323
     * @tc.desc      vpn flow matrix 320,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0323 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(320, true, true, true);
      logInfo("flow matrix 320,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0323 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0324
     * @tc.name      VPN_FlowMatrix_0324
     * @tc.desc      vpn flow matrix 321,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0324 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(321, false, true, true);
      logInfo("flow matrix 321,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0324 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0325
     * @tc.name      VPN_FlowMatrix_0325
     * @tc.desc      vpn flow matrix 322,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0325 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(322, true, false, true);
      logInfo("flow matrix 322,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0325 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0326
     * @tc.name      VPN_FlowMatrix_0326
     * @tc.desc      vpn flow matrix 323,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0326 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(323, false, true, false);
      logInfo("flow matrix 323,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0326 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0327
     * @tc.name      VPN_FlowMatrix_0327
     * @tc.desc      vpn flow matrix 324,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0327 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(324, true, true, true);
      logInfo("flow matrix 324,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0327 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0328
     * @tc.name      VPN_FlowMatrix_0328
     * @tc.desc      vpn flow matrix 325,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0328 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(325, false, false, true);
      logInfo("flow matrix 325,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0328 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0329
     * @tc.name      VPN_FlowMatrix_0329
     * @tc.desc      vpn flow matrix 326,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0329 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(326, true, true, true);
      logInfo("flow matrix 326,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0329 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0330
     * @tc.name      VPN_FlowMatrix_0330
     * @tc.desc      vpn flow matrix 327,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0330 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(327, false, true, true);
      logInfo("flow matrix 327,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0330 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0331
     * @tc.name      VPN_FlowMatrix_0331
     * @tc.desc      vpn flow matrix 328,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0331 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(328, true, false, false);
      logInfo("flow matrix 328,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0331 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0332
     * @tc.name      VPN_FlowMatrix_0332
     * @tc.desc      vpn flow matrix 329,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0332 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(329, false, true, true);
      logInfo("flow matrix 329,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0332 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0333
     * @tc.name      VPN_FlowMatrix_0333
     * @tc.desc      vpn flow matrix 330,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0333 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(330, true, true, true);
      logInfo("flow matrix 330,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0333 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0334
     * @tc.name      VPN_FlowMatrix_0334
     * @tc.desc      vpn flow matrix 331,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0334 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(331, false, false, true);
      logInfo("flow matrix 331,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0334 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0335
     * @tc.name      VPN_FlowMatrix_0335
     * @tc.desc      vpn flow matrix 332,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0335 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(332, true, true, true);
      logInfo("flow matrix 332,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0335 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0336
     * @tc.name      VPN_FlowMatrix_0336
     * @tc.desc      vpn flow matrix 333,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0336 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(333, false, true, false);
      logInfo("flow matrix 333,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0336 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0337
     * @tc.name      VPN_FlowMatrix_0337
     * @tc.desc      vpn flow matrix 334,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0337 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(334, true, false, true);
      logInfo("flow matrix 334,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0337 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0338
     * @tc.name      VPN_FlowMatrix_0338
     * @tc.desc      vpn flow matrix 335,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0338 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(335, false, true, true);
      logInfo("flow matrix 335,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0338 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0339
     * @tc.name      VPN_FlowMatrix_0339
     * @tc.desc      vpn flow matrix 336,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0339 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(336, true, true, true);
      logInfo("flow matrix 336,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0339 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0340
     * @tc.name      VPN_FlowMatrix_0340
     * @tc.desc      vpn flow matrix 337,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0340 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(337, false, false, true);
      logInfo("flow matrix 337,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0340 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0341
     * @tc.name      VPN_FlowMatrix_0341
     * @tc.desc      vpn flow matrix 338,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0341 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(338, true, true, false);
      logInfo("flow matrix 338,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0341 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0342
     * @tc.name      VPN_FlowMatrix_0342
     * @tc.desc      vpn flow matrix 339,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0342 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(339, false, true, true);
      logInfo("flow matrix 339,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0342 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0343
     * @tc.name      VPN_FlowMatrix_0343
     * @tc.desc      vpn flow matrix 340,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0343 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(340, true, false, true);
      logInfo("flow matrix 340,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0343 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0344
     * @tc.name      VPN_FlowMatrix_0344
     * @tc.desc      vpn flow matrix 341,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0344 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(341, false, true, true);
      logInfo("flow matrix 341,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0344 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0345
     * @tc.name      VPN_FlowMatrix_0345
     * @tc.desc      vpn flow matrix 342,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0345 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(342, true, true, true);
      logInfo("flow matrix 342,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0345 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0346
     * @tc.name      VPN_FlowMatrix_0346
     * @tc.desc      vpn flow matrix 343,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0346 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(343, false, false, false);
      logInfo("flow matrix 343,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0346 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0347
     * @tc.name      VPN_FlowMatrix_0347
     * @tc.desc      vpn flow matrix 344,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0347 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(344, true, true, true);
      logInfo("flow matrix 344,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0347 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0348
     * @tc.name      VPN_FlowMatrix_0348
     * @tc.desc      vpn flow matrix 345,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0348 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(345, false, true, true);
      logInfo("flow matrix 345,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0348 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0349
     * @tc.name      VPN_FlowMatrix_0349
     * @tc.desc      vpn flow matrix 346,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0349 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(346, true, false, true);
      logInfo("flow matrix 346,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0349 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0350
     * @tc.name      VPN_FlowMatrix_0350
     * @tc.desc      vpn flow matrix 347,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0350 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(347, false, true, true);
      logInfo("flow matrix 347,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0350 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0351
     * @tc.name      VPN_FlowMatrix_0351
     * @tc.desc      vpn flow matrix 348,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0351 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(348, true, true, false);
      logInfo("flow matrix 348,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0351 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0352
     * @tc.name      VPN_FlowMatrix_0352
     * @tc.desc      vpn flow matrix 349,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0352 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(349, false, false, true);
      logInfo("flow matrix 349,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0352 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0353
     * @tc.name      VPN_FlowMatrix_0353
     * @tc.desc      vpn flow matrix 350,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0353 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(350, true, true, true);
      logInfo("flow matrix 350,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0353 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0354
     * @tc.name      VPN_FlowMatrix_0354
     * @tc.desc      vpn flow matrix 351,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0354 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(351, false, true, true);
      logInfo("flow matrix 351,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0354 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0355
     * @tc.name      VPN_FlowMatrix_0355
     * @tc.desc      vpn flow matrix 352,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0355 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(352, true, false, true);
      logInfo("flow matrix 352,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0355 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0356
     * @tc.name      VPN_FlowMatrix_0356
     * @tc.desc      vpn flow matrix 353,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0356 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(353, false, true, false);
      logInfo("flow matrix 353,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0356 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0357
     * @tc.name      VPN_FlowMatrix_0357
     * @tc.desc      vpn flow matrix 354,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0357 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(354, true, true, true);
      logInfo("flow matrix 354,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0357 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0358
     * @tc.name      VPN_FlowMatrix_0358
     * @tc.desc      vpn flow matrix 355,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0358 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(355, false, false, true);
      logInfo("flow matrix 355,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0358 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0359
     * @tc.name      VPN_FlowMatrix_0359
     * @tc.desc      vpn flow matrix 356,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0359 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(356, true, true, true);
      logInfo("flow matrix 356,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0359 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0360
     * @tc.name      VPN_FlowMatrix_0360
     * @tc.desc      vpn flow matrix 357,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0360 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(357, false, true, true);
      logInfo("flow matrix 357,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0360 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0361
     * @tc.name      VPN_FlowMatrix_0361
     * @tc.desc      vpn flow matrix 358,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0361 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(358, true, false, false);
      logInfo("flow matrix 358,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0361 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0362
     * @tc.name      VPN_FlowMatrix_0362
     * @tc.desc      vpn flow matrix 359,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0362 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(359, false, true, true);
      logInfo("flow matrix 359,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0362 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0363
     * @tc.name      VPN_FlowMatrix_0363
     * @tc.desc      vpn flow matrix 360,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0363 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(360, true, true, true);
      logInfo("flow matrix 360,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0363 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0364
     * @tc.name      VPN_FlowMatrix_0364
     * @tc.desc      vpn flow matrix 361,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0364 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(361, false, false, true);
      logInfo("flow matrix 361,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0364 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0365
     * @tc.name      VPN_FlowMatrix_0365
     * @tc.desc      vpn flow matrix 362,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0365 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(362, true, true, true);
      logInfo("flow matrix 362,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0365 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0366
     * @tc.name      VPN_FlowMatrix_0366
     * @tc.desc      vpn flow matrix 363,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0366 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(363, false, true, false);
      logInfo("flow matrix 363,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0366 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0367
     * @tc.name      VPN_FlowMatrix_0367
     * @tc.desc      vpn flow matrix 364,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0367 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(364, true, false, true);
      logInfo("flow matrix 364,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0367 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0368
     * @tc.name      VPN_FlowMatrix_0368
     * @tc.desc      vpn flow matrix 365,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0368 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(365, false, true, true);
      logInfo("flow matrix 365,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0368 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0369
     * @tc.name      VPN_FlowMatrix_0369
     * @tc.desc      vpn flow matrix 366,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0369 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(366, true, true, true);
      logInfo("flow matrix 366,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0369 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0370
     * @tc.name      VPN_FlowMatrix_0370
     * @tc.desc      vpn flow matrix 367,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0370 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(367, false, false, true);
      logInfo("flow matrix 367,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0370 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0371
     * @tc.name      VPN_FlowMatrix_0371
     * @tc.desc      vpn flow matrix 368,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0371 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(368, true, true, false);
      logInfo("flow matrix 368,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0371 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0372
     * @tc.name      VPN_FlowMatrix_0372
     * @tc.desc      vpn flow matrix 369,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0372 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(369, false, true, true);
      logInfo("flow matrix 369,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0372 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0373
     * @tc.name      VPN_FlowMatrix_0373
     * @tc.desc      vpn flow matrix 370,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0373 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(370, true, false, true);
      logInfo("flow matrix 370,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0373 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0374
     * @tc.name      VPN_FlowMatrix_0374
     * @tc.desc      vpn flow matrix 371,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0374 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(371, false, true, true);
      logInfo("flow matrix 371,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0374 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0375
     * @tc.name      VPN_FlowMatrix_0375
     * @tc.desc      vpn flow matrix 372,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0375 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(372, true, true, true);
      logInfo("flow matrix 372,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0375 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0376
     * @tc.name      VPN_FlowMatrix_0376
     * @tc.desc      vpn flow matrix 373,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0376 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(373, false, false, false);
      logInfo("flow matrix 373,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0376 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0377
     * @tc.name      VPN_FlowMatrix_0377
     * @tc.desc      vpn flow matrix 374,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0377 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(374, true, true, true);
      logInfo("flow matrix 374,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0377 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0378
     * @tc.name      VPN_FlowMatrix_0378
     * @tc.desc      vpn flow matrix 375,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0378 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(375, false, true, true);
      logInfo("flow matrix 375,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0378 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0379
     * @tc.name      VPN_FlowMatrix_0379
     * @tc.desc      vpn flow matrix 376,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0379 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(376, true, false, true);
      logInfo("flow matrix 376,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0379 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0380
     * @tc.name      VPN_FlowMatrix_0380
     * @tc.desc      vpn flow matrix 377,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0380 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(377, false, true, true);
      logInfo("flow matrix 377,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0380 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0381
     * @tc.name      VPN_FlowMatrix_0381
     * @tc.desc      vpn flow matrix 378,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0381 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(378, true, true, false);
      logInfo("flow matrix 378,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0381 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0382
     * @tc.name      VPN_FlowMatrix_0382
     * @tc.desc      vpn flow matrix 379,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0382 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(379, false, false, true);
      logInfo("flow matrix 379,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0382 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0383
     * @tc.name      VPN_FlowMatrix_0383
     * @tc.desc      vpn flow matrix 380,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0383 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(380, true, true, true);
      logInfo("flow matrix 380,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0383 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0384
     * @tc.name      VPN_FlowMatrix_0384
     * @tc.desc      vpn flow matrix 381,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0384 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(381, false, true, true);
      logInfo("flow matrix 381,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0384 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0385
     * @tc.name      VPN_FlowMatrix_0385
     * @tc.desc      vpn flow matrix 382,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0385 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(382, true, false, true);
      logInfo("flow matrix 382,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0385 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0386
     * @tc.name      VPN_FlowMatrix_0386
     * @tc.desc      vpn flow matrix 383,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0386 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(383, false, true, false);
      logInfo("flow matrix 383,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0386 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0387
     * @tc.name      VPN_FlowMatrix_0387
     * @tc.desc      vpn flow matrix 384,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0387 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(384, true, true, true);
      logInfo("flow matrix 384,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0387 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0388
     * @tc.name      VPN_FlowMatrix_0388
     * @tc.desc      vpn flow matrix 385,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0388 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(385, false, false, true);
      logInfo("flow matrix 385,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0388 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0389
     * @tc.name      VPN_FlowMatrix_0389
     * @tc.desc      vpn flow matrix 386,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0389 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(386, true, true, true);
      logInfo("flow matrix 386,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0389 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0390
     * @tc.name      VPN_FlowMatrix_0390
     * @tc.desc      vpn flow matrix 387,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0390 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(387, false, true, true);
      logInfo("flow matrix 387,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0390 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0391
     * @tc.name      VPN_FlowMatrix_0391
     * @tc.desc      vpn flow matrix 388,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0391 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(388, true, false, false);
      logInfo("flow matrix 388,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0391 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0392
     * @tc.name      VPN_FlowMatrix_0392
     * @tc.desc      vpn flow matrix 389,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0392 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(389, false, true, true);
      logInfo("flow matrix 389,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0392 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0393
     * @tc.name      VPN_FlowMatrix_0393
     * @tc.desc      vpn flow matrix 390,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0393 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(390, true, true, true);
      logInfo("flow matrix 390,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0393 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0394
     * @tc.name      VPN_FlowMatrix_0394
     * @tc.desc      vpn flow matrix 391,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0394 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(391, false, false, true);
      logInfo("flow matrix 391,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0394 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0395
     * @tc.name      VPN_FlowMatrix_0395
     * @tc.desc      vpn flow matrix 392,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0395 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(392, true, true, true);
      logInfo("flow matrix 392,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0395 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0396
     * @tc.name      VPN_FlowMatrix_0396
     * @tc.desc      vpn flow matrix 393,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0396 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(393, false, true, false);
      logInfo("flow matrix 393,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0396 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0397
     * @tc.name      VPN_FlowMatrix_0397
     * @tc.desc      vpn flow matrix 394,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0397 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(394, true, false, true);
      logInfo("flow matrix 394,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0397 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0398
     * @tc.name      VPN_FlowMatrix_0398
     * @tc.desc      vpn flow matrix 395,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0398 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(395, false, true, true);
      logInfo("flow matrix 395,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0398 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0399
     * @tc.name      VPN_FlowMatrix_0399
     * @tc.desc      vpn flow matrix 396,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0399 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(396, true, true, true);
      logInfo("flow matrix 396,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0399 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0400
     * @tc.name      VPN_FlowMatrix_0400
     * @tc.desc      vpn flow matrix 397,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0400 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(397, false, false, true);
      logInfo("flow matrix 397,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0400 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0401
     * @tc.name      VPN_FlowMatrix_0401
     * @tc.desc      vpn flow matrix 398,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0401 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(398, true, true, false);
      logInfo("flow matrix 398,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0401 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0402
     * @tc.name      VPN_FlowMatrix_0402
     * @tc.desc      vpn flow matrix 399,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0402 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(399, false, true, true);
      logInfo("flow matrix 399,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0402 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0403
     * @tc.name      VPN_FlowMatrix_0403
     * @tc.desc      vpn flow matrix 400,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0403 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(400, true, false, true);
      logInfo("flow matrix 400,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0403 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0404
     * @tc.name      VPN_FlowMatrix_0404
     * @tc.desc      vpn flow matrix 401,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0404 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(401, false, true, true);
      logInfo("flow matrix 401,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0404 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0405
     * @tc.name      VPN_FlowMatrix_0405
     * @tc.desc      vpn flow matrix 402,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0405 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(402, true, true, true);
      logInfo("flow matrix 402,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0405 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0406
     * @tc.name      VPN_FlowMatrix_0406
     * @tc.desc      vpn flow matrix 403,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0406 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(403, false, false, false);
      logInfo("flow matrix 403,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0406 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0407
     * @tc.name      VPN_FlowMatrix_0407
     * @tc.desc      vpn flow matrix 404,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0407 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(404, true, true, true);
      logInfo("flow matrix 404,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0407 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0408
     * @tc.name      VPN_FlowMatrix_0408
     * @tc.desc      vpn flow matrix 405,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0408 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(405, false, true, true);
      logInfo("flow matrix 405,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0408 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0409
     * @tc.name      VPN_FlowMatrix_0409
     * @tc.desc      vpn flow matrix 406,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0409 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(406, true, false, true);
      logInfo("flow matrix 406,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0409 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0410
     * @tc.name      VPN_FlowMatrix_0410
     * @tc.desc      vpn flow matrix 407,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0410 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(407, false, true, true);
      logInfo("flow matrix 407,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0410 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0411
     * @tc.name      VPN_FlowMatrix_0411
     * @tc.desc      vpn flow matrix 408,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0411 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(408, true, true, false);
      logInfo("flow matrix 408,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0411 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0412
     * @tc.name      VPN_FlowMatrix_0412
     * @tc.desc      vpn flow matrix 409,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0412 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(409, false, false, true);
      logInfo("flow matrix 409,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0412 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0413
     * @tc.name      VPN_FlowMatrix_0413
     * @tc.desc      vpn flow matrix 410,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0413 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(410, true, true, true);
      logInfo("flow matrix 410,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0413 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0414
     * @tc.name      VPN_FlowMatrix_0414
     * @tc.desc      vpn flow matrix 411,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0414 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(411, false, true, true);
      logInfo("flow matrix 411,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0414 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0415
     * @tc.name      VPN_FlowMatrix_0415
     * @tc.desc      vpn flow matrix 412,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0415 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(412, true, false, true);
      logInfo("flow matrix 412,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0415 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0416
     * @tc.name      VPN_FlowMatrix_0416
     * @tc.desc      vpn flow matrix 413,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0416 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(413, false, true, false);
      logInfo("flow matrix 413,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0416 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0417
     * @tc.name      VPN_FlowMatrix_0417
     * @tc.desc      vpn flow matrix 414,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0417 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(414, true, true, true);
      logInfo("flow matrix 414,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0417 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0418
     * @tc.name      VPN_FlowMatrix_0418
     * @tc.desc      vpn flow matrix 415,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0418 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(415, false, false, true);
      logInfo("flow matrix 415,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0418 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0419
     * @tc.name      VPN_FlowMatrix_0419
     * @tc.desc      vpn flow matrix 416,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0419 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(416, true, true, true);
      logInfo("flow matrix 416,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0419 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0420
     * @tc.name      VPN_FlowMatrix_0420
     * @tc.desc      vpn flow matrix 417,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0420 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(417, false, true, true);
      logInfo("flow matrix 417,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0420 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0421
     * @tc.name      VPN_FlowMatrix_0421
     * @tc.desc      vpn flow matrix 418,true,false,false,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0421 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(418, true, false, false);
      logInfo("flow matrix 418,true,false,false,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0421 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0422
     * @tc.name      VPN_FlowMatrix_0422
     * @tc.desc      vpn flow matrix 419,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0422 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(419, false, true, true);
      logInfo("flow matrix 419,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0422 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0423
     * @tc.name      VPN_FlowMatrix_0423
     * @tc.desc      vpn flow matrix 420,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0423 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(420, true, true, true);
      logInfo("flow matrix 420,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0423 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0424
     * @tc.name      VPN_FlowMatrix_0424
     * @tc.desc      vpn flow matrix 421,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0424 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(421, false, false, true);
      logInfo("flow matrix 421,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0424 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0425
     * @tc.name      VPN_FlowMatrix_0425
     * @tc.desc      vpn flow matrix 422,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0425 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(422, true, true, true);
      logInfo("flow matrix 422,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0425 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0426
     * @tc.name      VPN_FlowMatrix_0426
     * @tc.desc      vpn flow matrix 423,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0426 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(423, false, true, false);
      logInfo("flow matrix 423,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0426 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0427
     * @tc.name      VPN_FlowMatrix_0427
     * @tc.desc      vpn flow matrix 424,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0427 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(424, true, false, true);
      logInfo("flow matrix 424,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0427 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0428
     * @tc.name      VPN_FlowMatrix_0428
     * @tc.desc      vpn flow matrix 425,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0428 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(425, false, true, true);
      logInfo("flow matrix 425,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0428 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0429
     * @tc.name      VPN_FlowMatrix_0429
     * @tc.desc      vpn flow matrix 426,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0429 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(426, true, true, true);
      logInfo("flow matrix 426,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0429 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0430
     * @tc.name      VPN_FlowMatrix_0430
     * @tc.desc      vpn flow matrix 427,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0430 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(427, false, false, true);
      logInfo("flow matrix 427,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0430 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0431
     * @tc.name      VPN_FlowMatrix_0431
     * @tc.desc      vpn flow matrix 428,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0431 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(428, true, true, false);
      logInfo("flow matrix 428,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0431 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0432
     * @tc.name      VPN_FlowMatrix_0432
     * @tc.desc      vpn flow matrix 429,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0432 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(429, false, true, true);
      logInfo("flow matrix 429,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0432 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0433
     * @tc.name      VPN_FlowMatrix_0433
     * @tc.desc      vpn flow matrix 430,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0433 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(430, true, false, true);
      logInfo("flow matrix 430,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0433 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0434
     * @tc.name      VPN_FlowMatrix_0434
     * @tc.desc      vpn flow matrix 431,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0434 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(431, false, true, true);
      logInfo("flow matrix 431,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0434 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0435
     * @tc.name      VPN_FlowMatrix_0435
     * @tc.desc      vpn flow matrix 432,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0435 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(432, true, true, true);
      logInfo("flow matrix 432,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0435 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0436
     * @tc.name      VPN_FlowMatrix_0436
     * @tc.desc      vpn flow matrix 433,false,false,false,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0436 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(433, false, false, false);
      logInfo("flow matrix 433,false,false,false,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0436 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0437
     * @tc.name      VPN_FlowMatrix_0437
     * @tc.desc      vpn flow matrix 434,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0437 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(434, true, true, true);
      logInfo("flow matrix 434,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0437 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0438
     * @tc.name      VPN_FlowMatrix_0438
     * @tc.desc      vpn flow matrix 435,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0438 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(435, false, true, true);
      logInfo("flow matrix 435,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0438 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0439
     * @tc.name      VPN_FlowMatrix_0439
     * @tc.desc      vpn flow matrix 436,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0439 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(436, true, false, true);
      logInfo("flow matrix 436,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0439 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0440
     * @tc.name      VPN_FlowMatrix_0440
     * @tc.desc      vpn flow matrix 437,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0440 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(437, false, true, true);
      logInfo("flow matrix 437,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0440 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0441
     * @tc.name      VPN_FlowMatrix_0441
     * @tc.desc      vpn flow matrix 438,true,true,false,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_FlowMatrix_0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FlowMatrix_0441 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(438, true, true, false);
      logInfo("flow matrix 438,true,true,false,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0441 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0442
     * @tc.name      VPN_FlowMatrix_0442
     * @tc.desc      vpn flow matrix 439,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0442 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(439, false, false, true);
      logInfo("flow matrix 439,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0442 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0443
     * @tc.name      VPN_FlowMatrix_0443
     * @tc.desc      vpn flow matrix 440,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_FlowMatrix_0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FlowMatrix_0443 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(440, true, true, true);
      logInfo("flow matrix 440,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0443 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0444
     * @tc.name      VPN_FlowMatrix_0444
     * @tc.desc      vpn flow matrix 441,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0444 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(441, false, true, true);
      logInfo("flow matrix 441,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0444 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0445
     * @tc.name      VPN_FlowMatrix_0445
     * @tc.desc      vpn flow matrix 442,true,false,true,true,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0445 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(442, true, false, true);
      logInfo("flow matrix 442,true,false,true,true,true");
      const actual: string = subject.stop(true, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroyed|Pass");
      expect(actual).assertEqual("destroyed|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0445 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0446
     * @tc.name      VPN_FlowMatrix_0446
     * @tc.desc      vpn flow matrix 443,false,true,false,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0446 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(443, false, true, false);
      logInfo("flow matrix 443,false,true,false,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0446 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0447
     * @tc.name      VPN_FlowMatrix_0447
     * @tc.desc      vpn flow matrix 444,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0447 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(444, true, true, true);
      logInfo("flow matrix 444,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0447 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0448
     * @tc.name      VPN_FlowMatrix_0448
     * @tc.desc      vpn flow matrix 445,false,false,true,false,true keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0448 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(445, false, false, true);
      logInfo("flow matrix 445,false,false,true,false,true");
      const actual: string = subject.stop(false, true) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "destroy-failed|Error");
      expect(actual).assertEqual("destroy-failed|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0448 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0449
     * @tc.name      VPN_FlowMatrix_0449
     * @tc.desc      vpn flow matrix 446,true,true,true,true,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0449 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(446, true, true, true);
      logInfo("flow matrix 446,true,true,true,true,false");
      const actual: string = subject.stop(true, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Pass");
      expect(actual).assertEqual("stop-fd-skipped|Pass");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0449 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_FLOW_MATRIX_0450
     * @tc.name      VPN_FlowMatrix_0450
     * @tc.desc      vpn flow matrix 447,false,true,true,false,false keeps run/stop state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_FlowMatrix_0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FlowMatrix_0450 begin`);
      const subject: VpnFlowModel = new VpnFlowModel();
      subject.run(447, false, true, true);
      logInfo("flow matrix 447,false,true,true,false,false");
      const actual: string = subject.stop(false, false) + '|' + subject.state();
      logInfo('actual=' + String(actual) + ', expected=' + "stop-fd-skipped|Error");
      expect(actual).assertEqual("stop-fd-skipped|Error");
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('string');
      logInfo(`${BUNDLE}FlowMatrix_0450 end`);
    });
  });
}
