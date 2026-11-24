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

/** Logic checks for formatCommand (50 cases). */
export default function formatCommandEdgeTest(): void {
  describe('FormatCommandEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}FormatCommandEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}FormatCommandEdgeTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0001
     * @tc.name      CliInvocation_formatCommand_Edge_0001
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_formatCommand_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0002
     * @tc.name      CliInvocation_formatCommand_Edge_0002
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_formatCommand_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0003
     * @tc.name      CliInvocation_formatCommand_Edge_0003
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_formatCommand_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0004
     * @tc.name      CliInvocation_formatCommand_Edge_0004
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_formatCommand_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0005
     * @tc.name      CliInvocation_formatCommand_Edge_0005
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_formatCommand_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0006
     * @tc.name      CliInvocation_formatCommand_Edge_0006
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_formatCommand_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0007
     * @tc.name      CliInvocation_formatCommand_Edge_0007
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_formatCommand_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0008
     * @tc.name      CliInvocation_formatCommand_Edge_0008
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_formatCommand_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0009
     * @tc.name      CliInvocation_formatCommand_Edge_0009
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_formatCommand_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0010
     * @tc.name      CliInvocation_formatCommand_Edge_0010
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_formatCommand_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0011
     * @tc.name      CliInvocation_formatCommand_Edge_0011
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0012
     * @tc.name      CliInvocation_formatCommand_Edge_0012
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0013
     * @tc.name      CliInvocation_formatCommand_Edge_0013
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0014
     * @tc.name      CliInvocation_formatCommand_Edge_0014
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0015
     * @tc.name      CliInvocation_formatCommand_Edge_0015
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0016
     * @tc.name      CliInvocation_formatCommand_Edge_0016
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0017
     * @tc.name      CliInvocation_formatCommand_Edge_0017
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0018
     * @tc.name      CliInvocation_formatCommand_Edge_0018
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0019
     * @tc.name      CliInvocation_formatCommand_Edge_0019
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0020
     * @tc.name      CliInvocation_formatCommand_Edge_0020
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0021
     * @tc.name      CliInvocation_formatCommand_Edge_0021
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0022
     * @tc.name      CliInvocation_formatCommand_Edge_0022
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0023
     * @tc.name      CliInvocation_formatCommand_Edge_0023
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0024
     * @tc.name      CliInvocation_formatCommand_Edge_0024
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0025
     * @tc.name      CliInvocation_formatCommand_Edge_0025
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0026
     * @tc.name      CliInvocation_formatCommand_Edge_0026
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0027
     * @tc.name      CliInvocation_formatCommand_Edge_0027
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0028
     * @tc.name      CliInvocation_formatCommand_Edge_0028
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0029
     * @tc.name      CliInvocation_formatCommand_Edge_0029
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0030
     * @tc.name      CliInvocation_formatCommand_Edge_0030
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_formatCommand_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0031
     * @tc.name      CliInvocation_formatCommand_Edge_0031
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0032
     * @tc.name      CliInvocation_formatCommand_Edge_0032
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0033
     * @tc.name      CliInvocation_formatCommand_Edge_0033
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0034
     * @tc.name      CliInvocation_formatCommand_Edge_0034
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0035
     * @tc.name      CliInvocation_formatCommand_Edge_0035
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0036
     * @tc.name      CliInvocation_formatCommand_Edge_0036
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0037
     * @tc.name      CliInvocation_formatCommand_Edge_0037
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0038
     * @tc.name      CliInvocation_formatCommand_Edge_0038
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0039
     * @tc.name      CliInvocation_formatCommand_Edge_0039
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0040
     * @tc.name      CliInvocation_formatCommand_Edge_0040
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0041
     * @tc.name      CliInvocation_formatCommand_Edge_0041
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0042
     * @tc.name      CliInvocation_formatCommand_Edge_0042
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0043
     * @tc.name      CliInvocation_formatCommand_Edge_0043
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0044
     * @tc.name      CliInvocation_formatCommand_Edge_0044
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0045
     * @tc.name      CliInvocation_formatCommand_Edge_0045
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0046
     * @tc.name      CliInvocation_formatCommand_Edge_0046
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0047
     * @tc.name      CliInvocation_formatCommand_Edge_0047
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0048
     * @tc.name      CliInvocation_formatCommand_Edge_0048
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0049
     * @tc.name      CliInvocation_formatCommand_Edge_0049
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_FORMAT_COMMAND_EDGE_0050
     * @tc.name      CliInvocation_formatCommand_Edge_0050
     * @tc.desc      [SmallArray] Verify formatCommand([arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9]) returns arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_formatCommand_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallArray; expected: arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
      const actual: string = CliModel.formatCommand(['arg0', 'arg1', 'arg2', 'arg3', 'arg4', 'arg5', 'arg6', 'arg7', 'arg8', 'arg9']);
      expect(actual).assertEqual('arg0 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9');
      expect(actual.length).assertEqual(49);
    });

  });
}
