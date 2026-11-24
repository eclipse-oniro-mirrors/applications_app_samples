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

import { describe, expect, it, beforeAll, afterAll, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CliModel } from '../Shared/CliFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_cliinvocation]';
const BUNDLE: string = 'CliInvocation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for exitMessage (50 cases). */
export default function exitMessageEdgeTest(): void {
  describe('ExitMessageEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}ExitMessageEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}ExitMessageEdgeTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0001
     * @tc.name      CliInvocation_exitMessage_Edge_0001
     * @tc.desc      [Zero+Zero] Verify exitMessage(0, 0) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_exitMessage_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero+Zero; expected: start success
      const actual: string = CliModel.exitMessage(0, 0);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0002
     * @tc.name      CliInvocation_exitMessage_Edge_0002
     * @tc.desc      [SmallPositive+SmallPositive] Verify exitMessage(1, 1) returns start failed, ret = 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+SmallPositive; expected: start failed, ret = 1
      const actual: string = CliModel.exitMessage(1, 1);
      expect(actual).assertEqual('start failed, ret = 1');
      expect(actual.length).assertEqual(21);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0003
     * @tc.name      CliInvocation_exitMessage_Edge_0003
     * @tc.desc      [Negative+Negative] Verify exitMessage(-1, -1) returns start failed, ret = -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative+Negative; expected: start failed, ret = -1
      const actual: string = CliModel.exitMessage(-1, -1);
      expect(actual).assertEqual('start failed, ret = -1');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0004
     * @tc.name      CliInvocation_exitMessage_Edge_0004
     * @tc.desc      [Large+Large] Verify exitMessage(127, 127) returns start failed, ret = 127.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large+Large; expected: start failed, ret = 127
      const actual: string = CliModel.exitMessage(127, 127);
      expect(actual).assertEqual('start failed, ret = 127');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0005
     * @tc.name      CliInvocation_exitMessage_Edge_0005
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 42) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 42);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0006
     * @tc.name      CliInvocation_exitMessage_Edge_0006
     * @tc.desc      [Zero+Zero] Verify exitMessage(0, 0) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero+Zero; expected: start success
      const actual: string = CliModel.exitMessage(0, 0);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0007
     * @tc.name      CliInvocation_exitMessage_Edge_0007
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 7) returns start failed, ret = 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 7
      const actual: string = CliModel.exitMessage(1, 7);
      expect(actual).assertEqual('start failed, ret = 7');
      expect(actual.length).assertEqual(21);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0008
     * @tc.name      CliInvocation_exitMessage_Edge_0008
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 14) returns start failed, ret = 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 14
      const actual: string = CliModel.exitMessage(2, 14);
      expect(actual).assertEqual('start failed, ret = 14');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0009
     * @tc.name      CliInvocation_exitMessage_Edge_0009
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(3, 21) returns start failed, ret = 21.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 21
      const actual: string = CliModel.exitMessage(3, 21);
      expect(actual).assertEqual('start failed, ret = 21');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0010
     * @tc.name      CliInvocation_exitMessage_Edge_0010
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 28) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_exitMessage_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 28);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0011
     * @tc.name      CliInvocation_exitMessage_Edge_0011
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 35) returns start failed, ret = 35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 35
      const actual: string = CliModel.exitMessage(1, 35);
      expect(actual).assertEqual('start failed, ret = 35');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0012
     * @tc.name      CliInvocation_exitMessage_Edge_0012
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 42) returns start failed, ret = 42.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 42
      const actual: string = CliModel.exitMessage(2, 42);
      expect(actual).assertEqual('start failed, ret = 42');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0013
     * @tc.name      CliInvocation_exitMessage_Edge_0013
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(3, 49) returns start failed, ret = 49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 49
      const actual: string = CliModel.exitMessage(3, 49);
      expect(actual).assertEqual('start failed, ret = 49');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0014
     * @tc.name      CliInvocation_exitMessage_Edge_0014
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 56) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 56);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0015
     * @tc.name      CliInvocation_exitMessage_Edge_0015
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 63) returns start failed, ret = 63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 63
      const actual: string = CliModel.exitMessage(1, 63);
      expect(actual).assertEqual('start failed, ret = 63');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0016
     * @tc.name      CliInvocation_exitMessage_Edge_0016
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 70) returns start failed, ret = 70.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 70
      const actual: string = CliModel.exitMessage(2, 70);
      expect(actual).assertEqual('start failed, ret = 70');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0017
     * @tc.name      CliInvocation_exitMessage_Edge_0017
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(3, 77) returns start failed, ret = 77.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 77
      const actual: string = CliModel.exitMessage(3, 77);
      expect(actual).assertEqual('start failed, ret = 77');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0018
     * @tc.name      CliInvocation_exitMessage_Edge_0018
     * @tc.desc      [Zero+Medium] Verify exitMessage(0, 84) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Zero+Medium; expected: start success
      const actual: string = CliModel.exitMessage(0, 84);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0019
     * @tc.name      CliInvocation_exitMessage_Edge_0019
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(1, 91) returns start failed, ret = 91.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 91
      const actual: string = CliModel.exitMessage(1, 91);
      expect(actual).assertEqual('start failed, ret = 91');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0020
     * @tc.name      CliInvocation_exitMessage_Edge_0020
     * @tc.desc      [SmallPositive+Medium] Verify exitMessage(2, 98) returns start failed, ret = 98.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Medium; expected: start failed, ret = 98
      const actual: string = CliModel.exitMessage(2, 98);
      expect(actual).assertEqual('start failed, ret = 98');
      expect(actual.length).assertEqual(22);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0021
     * @tc.name      CliInvocation_exitMessage_Edge_0021
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(3, 105) returns start failed, ret = 105.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 105
      const actual: string = CliModel.exitMessage(3, 105);
      expect(actual).assertEqual('start failed, ret = 105');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0022
     * @tc.name      CliInvocation_exitMessage_Edge_0022
     * @tc.desc      [Zero+Large] Verify exitMessage(0, 112) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Zero+Large; expected: start success
      const actual: string = CliModel.exitMessage(0, 112);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0023
     * @tc.name      CliInvocation_exitMessage_Edge_0023
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(1, 119) returns start failed, ret = 119.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 119
      const actual: string = CliModel.exitMessage(1, 119);
      expect(actual).assertEqual('start failed, ret = 119');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0024
     * @tc.name      CliInvocation_exitMessage_Edge_0024
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(2, 126) returns start failed, ret = 126.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 126
      const actual: string = CliModel.exitMessage(2, 126);
      expect(actual).assertEqual('start failed, ret = 126');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0025
     * @tc.name      CliInvocation_exitMessage_Edge_0025
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(3, 133) returns start failed, ret = 133.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 133
      const actual: string = CliModel.exitMessage(3, 133);
      expect(actual).assertEqual('start failed, ret = 133');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0026
     * @tc.name      CliInvocation_exitMessage_Edge_0026
     * @tc.desc      [Zero+Large] Verify exitMessage(0, 140) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Zero+Large; expected: start success
      const actual: string = CliModel.exitMessage(0, 140);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0027
     * @tc.name      CliInvocation_exitMessage_Edge_0027
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(1, 147) returns start failed, ret = 147.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 147
      const actual: string = CliModel.exitMessage(1, 147);
      expect(actual).assertEqual('start failed, ret = 147');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0028
     * @tc.name      CliInvocation_exitMessage_Edge_0028
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(2, 154) returns start failed, ret = 154.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 154
      const actual: string = CliModel.exitMessage(2, 154);
      expect(actual).assertEqual('start failed, ret = 154');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0029
     * @tc.name      CliInvocation_exitMessage_Edge_0029
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(3, 161) returns start failed, ret = 161.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 161
      const actual: string = CliModel.exitMessage(3, 161);
      expect(actual).assertEqual('start failed, ret = 161');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0030
     * @tc.name      CliInvocation_exitMessage_Edge_0030
     * @tc.desc      [Zero+Large] Verify exitMessage(0, 168) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_exitMessage_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Zero+Large; expected: start success
      const actual: string = CliModel.exitMessage(0, 168);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0031
     * @tc.name      CliInvocation_exitMessage_Edge_0031
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(1, 175) returns start failed, ret = 175.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 175
      const actual: string = CliModel.exitMessage(1, 175);
      expect(actual).assertEqual('start failed, ret = 175');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0032
     * @tc.name      CliInvocation_exitMessage_Edge_0032
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(2, 182) returns start failed, ret = 182.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 182
      const actual: string = CliModel.exitMessage(2, 182);
      expect(actual).assertEqual('start failed, ret = 182');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0033
     * @tc.name      CliInvocation_exitMessage_Edge_0033
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(3, 189) returns start failed, ret = 189.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 189
      const actual: string = CliModel.exitMessage(3, 189);
      expect(actual).assertEqual('start failed, ret = 189');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0034
     * @tc.name      CliInvocation_exitMessage_Edge_0034
     * @tc.desc      [Zero+Large] Verify exitMessage(0, 196) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero+Large; expected: start success
      const actual: string = CliModel.exitMessage(0, 196);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0035
     * @tc.name      CliInvocation_exitMessage_Edge_0035
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(1, 203) returns start failed, ret = 203.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 203
      const actual: string = CliModel.exitMessage(1, 203);
      expect(actual).assertEqual('start failed, ret = 203');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0036
     * @tc.name      CliInvocation_exitMessage_Edge_0036
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(2, 210) returns start failed, ret = 210.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 210
      const actual: string = CliModel.exitMessage(2, 210);
      expect(actual).assertEqual('start failed, ret = 210');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0037
     * @tc.name      CliInvocation_exitMessage_Edge_0037
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(3, 217) returns start failed, ret = 217.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 217
      const actual: string = CliModel.exitMessage(3, 217);
      expect(actual).assertEqual('start failed, ret = 217');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0038
     * @tc.name      CliInvocation_exitMessage_Edge_0038
     * @tc.desc      [Zero+Large] Verify exitMessage(0, 224) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero+Large; expected: start success
      const actual: string = CliModel.exitMessage(0, 224);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0039
     * @tc.name      CliInvocation_exitMessage_Edge_0039
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(1, 231) returns start failed, ret = 231.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 231
      const actual: string = CliModel.exitMessage(1, 231);
      expect(actual).assertEqual('start failed, ret = 231');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0040
     * @tc.name      CliInvocation_exitMessage_Edge_0040
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(2, 238) returns start failed, ret = 238.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 238
      const actual: string = CliModel.exitMessage(2, 238);
      expect(actual).assertEqual('start failed, ret = 238');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0041
     * @tc.name      CliInvocation_exitMessage_Edge_0041
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(3, 245) returns start failed, ret = 245.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 245
      const actual: string = CliModel.exitMessage(3, 245);
      expect(actual).assertEqual('start failed, ret = 245');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0042
     * @tc.name      CliInvocation_exitMessage_Edge_0042
     * @tc.desc      [Zero+Large] Verify exitMessage(0, 252) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero+Large; expected: start success
      const actual: string = CliModel.exitMessage(0, 252);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0043
     * @tc.name      CliInvocation_exitMessage_Edge_0043
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(1, 259) returns start failed, ret = 259.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 259
      const actual: string = CliModel.exitMessage(1, 259);
      expect(actual).assertEqual('start failed, ret = 259');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0044
     * @tc.name      CliInvocation_exitMessage_Edge_0044
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(2, 266) returns start failed, ret = 266.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 266
      const actual: string = CliModel.exitMessage(2, 266);
      expect(actual).assertEqual('start failed, ret = 266');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0045
     * @tc.name      CliInvocation_exitMessage_Edge_0045
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(3, 273) returns start failed, ret = 273.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 273
      const actual: string = CliModel.exitMessage(3, 273);
      expect(actual).assertEqual('start failed, ret = 273');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0046
     * @tc.name      CliInvocation_exitMessage_Edge_0046
     * @tc.desc      [Zero+Large] Verify exitMessage(0, 280) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero+Large; expected: start success
      const actual: string = CliModel.exitMessage(0, 280);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0047
     * @tc.name      CliInvocation_exitMessage_Edge_0047
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(1, 287) returns start failed, ret = 287.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 287
      const actual: string = CliModel.exitMessage(1, 287);
      expect(actual).assertEqual('start failed, ret = 287');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0048
     * @tc.name      CliInvocation_exitMessage_Edge_0048
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(2, 294) returns start failed, ret = 294.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 294
      const actual: string = CliModel.exitMessage(2, 294);
      expect(actual).assertEqual('start failed, ret = 294');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0049
     * @tc.name      CliInvocation_exitMessage_Edge_0049
     * @tc.desc      [SmallPositive+Large] Verify exitMessage(3, 301) returns start failed, ret = 301.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive+Large; expected: start failed, ret = 301
      const actual: string = CliModel.exitMessage(3, 301);
      expect(actual).assertEqual('start failed, ret = 301');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_EXIT_MESSAGE_EDGE_0050
     * @tc.name      CliInvocation_exitMessage_Edge_0050
     * @tc.desc      [Zero+Large] Verify exitMessage(0, 308) returns start success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_exitMessage_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero+Large; expected: start success
      const actual: string = CliModel.exitMessage(0, 308);
      expect(actual).assertEqual('start success');
      expect(actual.length).assertEqual(13);
    });

  });
}
