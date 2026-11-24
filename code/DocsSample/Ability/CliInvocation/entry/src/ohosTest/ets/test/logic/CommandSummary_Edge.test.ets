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

/** Logic checks for commandSummary (50 cases). */
export default function commandSummaryEdgeTest(): void {
  describe('CommandSummaryEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}CommandSummaryEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}CommandSummaryEdgeTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0001
     * @tc.name      CliInvocation_commandSummary_Edge_0001
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x0]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_commandSummary_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x0']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0002
     * @tc.name      CliInvocation_commandSummary_Edge_0002
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x1]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_commandSummary_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x1']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0003
     * @tc.name      CliInvocation_commandSummary_Edge_0003
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x2]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_commandSummary_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x2']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0004
     * @tc.name      CliInvocation_commandSummary_Edge_0004
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x3]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_commandSummary_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x3']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0005
     * @tc.name      CliInvocation_commandSummary_Edge_0005
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x4]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_commandSummary_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x4']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0006
     * @tc.name      CliInvocation_commandSummary_Edge_0006
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x5]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_commandSummary_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x5']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0007
     * @tc.name      CliInvocation_commandSummary_Edge_0007
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x6]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_commandSummary_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x6']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0008
     * @tc.name      CliInvocation_commandSummary_Edge_0008
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x7]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_commandSummary_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x7']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0009
     * @tc.name      CliInvocation_commandSummary_Edge_0009
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x8]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_commandSummary_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x8']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0010
     * @tc.name      CliInvocation_commandSummary_Edge_0010
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x9]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_commandSummary_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x9']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0011
     * @tc.name      CliInvocation_commandSummary_Edge_0011
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x10]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x10']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0012
     * @tc.name      CliInvocation_commandSummary_Edge_0012
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x11]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x11']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0013
     * @tc.name      CliInvocation_commandSummary_Edge_0013
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x12]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x12']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0014
     * @tc.name      CliInvocation_commandSummary_Edge_0014
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x13]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x13']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0015
     * @tc.name      CliInvocation_commandSummary_Edge_0015
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x14]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x14']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0016
     * @tc.name      CliInvocation_commandSummary_Edge_0016
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x15]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x15']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0017
     * @tc.name      CliInvocation_commandSummary_Edge_0017
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x16]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x16']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0018
     * @tc.name      CliInvocation_commandSummary_Edge_0018
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x17]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x17']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0019
     * @tc.name      CliInvocation_commandSummary_Edge_0019
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x18]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x18']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0020
     * @tc.name      CliInvocation_commandSummary_Edge_0020
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x19]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x19']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0021
     * @tc.name      CliInvocation_commandSummary_Edge_0021
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x20]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x20']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0022
     * @tc.name      CliInvocation_commandSummary_Edge_0022
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x21]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x21']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0023
     * @tc.name      CliInvocation_commandSummary_Edge_0023
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x22]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x22']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0024
     * @tc.name      CliInvocation_commandSummary_Edge_0024
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x23]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x23']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0025
     * @tc.name      CliInvocation_commandSummary_Edge_0025
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x24]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x24']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0026
     * @tc.name      CliInvocation_commandSummary_Edge_0026
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x25]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x25']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0027
     * @tc.name      CliInvocation_commandSummary_Edge_0027
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x26]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x26']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0028
     * @tc.name      CliInvocation_commandSummary_Edge_0028
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x27]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x27']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0029
     * @tc.name      CliInvocation_commandSummary_Edge_0029
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x28]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x28']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0030
     * @tc.name      CliInvocation_commandSummary_Edge_0030
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x29]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_commandSummary_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x29']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0031
     * @tc.name      CliInvocation_commandSummary_Edge_0031
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x30]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x30']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0032
     * @tc.name      CliInvocation_commandSummary_Edge_0032
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x31]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x31']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0033
     * @tc.name      CliInvocation_commandSummary_Edge_0033
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x32]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x32']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0034
     * @tc.name      CliInvocation_commandSummary_Edge_0034
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x33]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x33']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0035
     * @tc.name      CliInvocation_commandSummary_Edge_0035
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x34]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x34']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0036
     * @tc.name      CliInvocation_commandSummary_Edge_0036
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x35]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x35']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0037
     * @tc.name      CliInvocation_commandSummary_Edge_0037
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x36]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x36']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0038
     * @tc.name      CliInvocation_commandSummary_Edge_0038
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x37]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x37']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0039
     * @tc.name      CliInvocation_commandSummary_Edge_0039
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x38]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x38']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0040
     * @tc.name      CliInvocation_commandSummary_Edge_0040
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x39]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x39']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0041
     * @tc.name      CliInvocation_commandSummary_Edge_0041
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x40]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x40']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0042
     * @tc.name      CliInvocation_commandSummary_Edge_0042
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x41]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x41']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0043
     * @tc.name      CliInvocation_commandSummary_Edge_0043
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x42]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x42']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0044
     * @tc.name      CliInvocation_commandSummary_Edge_0044
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x43]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x43']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0045
     * @tc.name      CliInvocation_commandSummary_Edge_0045
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x44]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x44']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0046
     * @tc.name      CliInvocation_commandSummary_Edge_0046
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x45]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x45']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0047
     * @tc.name      CliInvocation_commandSummary_Edge_0047
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x46]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x46']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0048
     * @tc.name      CliInvocation_commandSummary_Edge_0048
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x47]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x47']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0049
     * @tc.name      CliInvocation_commandSummary_Edge_0049
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x48]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x48']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_COMMAND_SUMMARY_EDGE_0050
     * @tc.name      CliInvocation_commandSummary_Edge_0050
     * @tc.desc      [SmallArray] Verify commandSummary([--bundlename, com.x49]) returns argc=2 cmd=--bundlename.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_commandSummary_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: argc=2 cmd=--bundlename
      const actual: string = CliModel.commandSummary(['--bundlename', 'com.x49']);
      expect(actual).assertEqual('argc=2 cmd=--bundlename');
      expect(actual.length).assertEqual(23);
    });

  });
}
