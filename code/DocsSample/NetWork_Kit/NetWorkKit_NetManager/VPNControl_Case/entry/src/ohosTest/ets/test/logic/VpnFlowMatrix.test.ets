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
