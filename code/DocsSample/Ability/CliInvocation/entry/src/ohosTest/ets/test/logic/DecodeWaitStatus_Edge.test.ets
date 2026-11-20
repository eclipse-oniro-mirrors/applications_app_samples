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

/** Logic checks for decodeWaitStatus (50 cases). */
export default function decodeWaitStatusEdgeTest(): void {
  describe('DecodeWaitStatusEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}DecodeWaitStatusEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}DecodeWaitStatusEdgeTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0001
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0001
     * @tc.desc      [Medium] Verify decodeWaitStatus(5) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_decodeWaitStatus_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(5);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0002
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0002
     * @tc.desc      [Large] Verify decodeWaitStatus(1024) returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 4
      const actual: number = CliModel.decodeWaitStatus(1024);
      expect(actual).assertEqual(4);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0003
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0003
     * @tc.desc      [Negative] Verify decodeWaitStatus(-7) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-7);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0004
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0004
     * @tc.desc      [Medium] Verify decodeWaitStatus(6) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(6);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0005
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0005
     * @tc.desc      [Large] Verify decodeWaitStatus(256) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 1
      const actual: number = CliModel.decodeWaitStatus(256);
      expect(actual).assertEqual(1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0006
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0006
     * @tc.desc      [Medium] Verify decodeWaitStatus(7) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(7);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0007
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0007
     * @tc.desc      [Large] Verify decodeWaitStatus(128) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 0
      const actual: number = CliModel.decodeWaitStatus(128);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0008
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0008
     * @tc.desc      [Negative] Verify decodeWaitStatus(-6) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-6);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0009
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0009
     * @tc.desc      [Medium] Verify decodeWaitStatus(8) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(8);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0010
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0010
     * @tc.desc      [Large] Verify decodeWaitStatus(4096) returns 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Large; expected: 16
      const actual: number = CliModel.decodeWaitStatus(4096);
      expect(actual).assertEqual(16);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0011
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0011
     * @tc.desc      [Medium] Verify decodeWaitStatus(9) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(9);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0012
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0012
     * @tc.desc      [Medium] Verify decodeWaitStatus(50) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(50);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0013
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0013
     * @tc.desc      [Negative] Verify decodeWaitStatus(-5) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-5);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0014
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0014
     * @tc.desc      [Medium] Verify decodeWaitStatus(10) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(10);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0015
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0015
     * @tc.desc      [Extreme] Verify decodeWaitStatus(65535) returns 255.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 255
      const actual: number = CliModel.decodeWaitStatus(65535);
      expect(actual).assertEqual(255);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0016
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0016
     * @tc.desc      [Medium] Verify decodeWaitStatus(11) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(11);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0017
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0017
     * @tc.desc      [Large] Verify decodeWaitStatus(10000) returns 39.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 39
      const actual: number = CliModel.decodeWaitStatus(10000);
      expect(actual).assertEqual(39);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0018
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0018
     * @tc.desc      [Negative] Verify decodeWaitStatus(-4) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-4);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0019
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0019
     * @tc.desc      [Medium] Verify decodeWaitStatus(12) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(12);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0020
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0020
     * @tc.desc      [Medium] Verify decodeWaitStatus(31) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(31);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0021
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0021
     * @tc.desc      [Medium] Verify decodeWaitStatus(13) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(13);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0022
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0022
     * @tc.desc      [Medium] Verify decodeWaitStatus(63) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(63);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0023
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0023
     * @tc.desc      [Negative] Verify decodeWaitStatus(-3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-3);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0024
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0024
     * @tc.desc      [Medium] Verify decodeWaitStatus(14) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(14);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0025
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0025
     * @tc.desc      [Medium] Verify decodeWaitStatus(32) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(32);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0026
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0026
     * @tc.desc      [Medium] Verify decodeWaitStatus(15) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(15);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0027
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0027
     * @tc.desc      [Medium] Verify decodeWaitStatus(64) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(64);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0028
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0028
     * @tc.desc      [Negative] Verify decodeWaitStatus(-2) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-2);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0029
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0029
     * @tc.desc      [Medium] Verify decodeWaitStatus(16) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(16);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0030
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0030
     * @tc.desc      [Large] Verify decodeWaitStatus(127) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 0
      const actual: number = CliModel.decodeWaitStatus(127);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0031
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0031
     * @tc.desc      [Medium] Verify decodeWaitStatus(17) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(17);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0032
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0032
     * @tc.desc      [Medium] Verify decodeWaitStatus(25) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(25);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0033
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0033
     * @tc.desc      [Negative] Verify decodeWaitStatus(-1) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-1);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0034
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0034
     * @tc.desc      [Medium] Verify decodeWaitStatus(18) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(18);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0035
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0035
     * @tc.desc      [Large] Verify decodeWaitStatus(255) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 0
      const actual: number = CliModel.decodeWaitStatus(255);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0036
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0036
     * @tc.desc      [Medium] Verify decodeWaitStatus(19) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(19);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0037
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0037
     * @tc.desc      [Extreme] Verify decodeWaitStatus(100000) returns 390.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 390
      const actual: number = CliModel.decodeWaitStatus(100000);
      expect(actual).assertEqual(390);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0038
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0038
     * @tc.desc      [Negative] Verify decodeWaitStatus(-10) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-10);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0039
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0039
     * @tc.desc      [Zero] Verify decodeWaitStatus(0) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Zero; expected: 0
      const actual: number = CliModel.decodeWaitStatus(0);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0040
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0040
     * @tc.desc      [Extreme] Verify decodeWaitStatus(2147483647) returns 8388607.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 8388607
      const actual: number = CliModel.decodeWaitStatus(2147483647);
      expect(actual).assertEqual(8388607);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0041
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0041
     * @tc.desc      [SmallPositive] Verify decodeWaitStatus(1) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive; expected: 0
      const actual: number = CliModel.decodeWaitStatus(1);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0042
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0042
     * @tc.desc      [Medium] Verify decodeWaitStatus(100) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(100);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0043
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0043
     * @tc.desc      [Negative] Verify decodeWaitStatus(-9) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-9);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0044
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0044
     * @tc.desc      [SmallPositive] Verify decodeWaitStatus(2) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive; expected: 0
      const actual: number = CliModel.decodeWaitStatus(2);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0045
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0045
     * @tc.desc      [Extreme] Verify decodeWaitStatus(65535) returns 255.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 255
      const actual: number = CliModel.decodeWaitStatus(65535);
      expect(actual).assertEqual(255);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0046
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0046
     * @tc.desc      [SmallPositive] Verify decodeWaitStatus(3) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: SmallPositive; expected: 0
      const actual: number = CliModel.decodeWaitStatus(3);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0047
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0047
     * @tc.desc      [Large] Verify decodeWaitStatus(1000) returns 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 3
      const actual: number = CliModel.decodeWaitStatus(1000);
      expect(actual).assertEqual(3);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0048
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0048
     * @tc.desc      [Negative] Verify decodeWaitStatus(-8) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-8);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0049
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0049
     * @tc.desc      [Medium] Verify decodeWaitStatus(4) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(4);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_EDGE_0050
     * @tc.name      CliInvocation_decodeWaitStatus_Edge_0050
     * @tc.desc      [Negative] Verify decodeWaitStatus(-2147483648) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-2147483648);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

  });
}
