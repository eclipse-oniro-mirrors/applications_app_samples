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
export default function decodeWaitStatusCoreTest(): void {
  describe('DecodeWaitStatusCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}DecodeWaitStatusCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}DecodeWaitStatusCoreTest end`);
    });
    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0001
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0001
     * @tc.desc      [Zero] Verify decodeWaitStatus(0) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CliInvocation_decodeWaitStatus_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero; expected: 0
      const actual: number = CliModel.decodeWaitStatus(0);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0002
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0002
     * @tc.desc      [SmallPositive] Verify decodeWaitStatus(1) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: 0
      const actual: number = CliModel.decodeWaitStatus(1);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0003
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0003
     * @tc.desc      [Negative] Verify decodeWaitStatus(-1) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-1);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0004
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0004
     * @tc.desc      [SmallPositive] Verify decodeWaitStatus(2) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: 0
      const actual: number = CliModel.decodeWaitStatus(2);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0005
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0005
     * @tc.desc      [Negative] Verify decodeWaitStatus(-2) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-2);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0006
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0006
     * @tc.desc      [SmallPositive] Verify decodeWaitStatus(3) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: 0
      const actual: number = CliModel.decodeWaitStatus(3);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0007
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0007
     * @tc.desc      [Negative] Verify decodeWaitStatus(-3) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-3);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0008
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0008
     * @tc.desc      [Medium] Verify decodeWaitStatus(4) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(4);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0009
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0009
     * @tc.desc      [Negative] Verify decodeWaitStatus(-4) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-4);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0010
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0010
     * @tc.desc      [Medium] Verify decodeWaitStatus(5) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CliInvocation_decodeWaitStatus_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(5);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0011
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0011
     * @tc.desc      [Negative] Verify decodeWaitStatus(-5) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-5);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0012
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0012
     * @tc.desc      [Medium] Verify decodeWaitStatus(10) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(10);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0013
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0013
     * @tc.desc      [Negative] Verify decodeWaitStatus(-10) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-10);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0014
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0014
     * @tc.desc      [Medium] Verify decodeWaitStatus(100) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: 0
      const actual: number = CliModel.decodeWaitStatus(100);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0015
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0015
     * @tc.desc      [Negative] Verify decodeWaitStatus(-100) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-100);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0016
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0016
     * @tc.desc      [Large] Verify decodeWaitStatus(1000) returns 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 3
      const actual: number = CliModel.decodeWaitStatus(1000);
      expect(actual).assertEqual(3);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0017
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0017
     * @tc.desc      [Negative] Verify decodeWaitStatus(-1000) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-1000);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0018
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0018
     * @tc.desc      [Large] Verify decodeWaitStatus(1024) returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 4
      const actual: number = CliModel.decodeWaitStatus(1024);
      expect(actual).assertEqual(4);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0019
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0019
     * @tc.desc      [Negative] Verify decodeWaitStatus(-1024) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-1024);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0020
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0020
     * @tc.desc      [Large] Verify decodeWaitStatus(4096) returns 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 16
      const actual: number = CliModel.decodeWaitStatus(4096);
      expect(actual).assertEqual(16);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0021
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0021
     * @tc.desc      [Negative] Verify decodeWaitStatus(-4096) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-4096);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0022
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0022
     * @tc.desc      [Extreme] Verify decodeWaitStatus(65535) returns 255.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 255
      const actual: number = CliModel.decodeWaitStatus(65535);
      expect(actual).assertEqual(255);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0023
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0023
     * @tc.desc      [Negative] Verify decodeWaitStatus(-65535) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-65535);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0024
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0024
     * @tc.desc      [Extreme] Verify decodeWaitStatus(2147483647) returns 8388607.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 8388607
      const actual: number = CliModel.decodeWaitStatus(2147483647);
      expect(actual).assertEqual(8388607);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0025
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0025
     * @tc.desc      [Negative] Verify decodeWaitStatus(-2147483648) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-2147483648);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0026
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0026
     * @tc.desc      [Extreme] Verify decodeWaitStatus(2147483646) returns 8388607.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: 8388607
      const actual: number = CliModel.decodeWaitStatus(2147483646);
      expect(actual).assertEqual(8388607);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0027
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0027
     * @tc.desc      [Negative] Verify decodeWaitStatus(-2147483647) returns -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: -1
      const actual: number = CliModel.decodeWaitStatus(-2147483647);
      expect(actual).assertEqual(-1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0028
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0028
     * @tc.desc      [Large] Verify decodeWaitStatus(127) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 0
      const actual: number = CliModel.decodeWaitStatus(127);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0029
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0029
     * @tc.desc      [Large] Verify decodeWaitStatus(128) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 0
      const actual: number = CliModel.decodeWaitStatus(128);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0030
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0030
     * @tc.desc      [Large] Verify decodeWaitStatus(129) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CliInvocation_decodeWaitStatus_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: 0
      const actual: number = CliModel.decodeWaitStatus(129);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0031
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0031
     * @tc.desc      [Large] Verify decodeWaitStatus(255) returns 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 0
      const actual: number = CliModel.decodeWaitStatus(255);
      expect(actual).assertEqual(0);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0032
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0032
     * @tc.desc      [Large] Verify decodeWaitStatus(256) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 1
      const actual: number = CliModel.decodeWaitStatus(256);
      expect(actual).assertEqual(1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0033
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0033
     * @tc.desc      [Large] Verify decodeWaitStatus(257) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 1
      const actual: number = CliModel.decodeWaitStatus(257);
      expect(actual).assertEqual(1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0034
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0034
     * @tc.desc      [Large] Verify decodeWaitStatus(511) returns 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 1
      const actual: number = CliModel.decodeWaitStatus(511);
      expect(actual).assertEqual(1);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0035
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0035
     * @tc.desc      [Large] Verify decodeWaitStatus(512) returns 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 2
      const actual: number = CliModel.decodeWaitStatus(512);
      expect(actual).assertEqual(2);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0036
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0036
     * @tc.desc      [Large] Verify decodeWaitStatus(513) returns 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 2
      const actual: number = CliModel.decodeWaitStatus(513);
      expect(actual).assertEqual(2);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0037
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0037
     * @tc.desc      [Large] Verify decodeWaitStatus(1023) returns 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 3
      const actual: number = CliModel.decodeWaitStatus(1023);
      expect(actual).assertEqual(3);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0038
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0038
     * @tc.desc      [Large] Verify decodeWaitStatus(1024) returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 4
      const actual: number = CliModel.decodeWaitStatus(1024);
      expect(actual).assertEqual(4);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0039
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0039
     * @tc.desc      [Large] Verify decodeWaitStatus(1025) returns 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 4
      const actual: number = CliModel.decodeWaitStatus(1025);
      expect(actual).assertEqual(4);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0040
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0040
     * @tc.desc      [Large] Verify decodeWaitStatus(2047) returns 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 7
      const actual: number = CliModel.decodeWaitStatus(2047);
      expect(actual).assertEqual(7);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0041
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0041
     * @tc.desc      [Large] Verify decodeWaitStatus(2048) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 8
      const actual: number = CliModel.decodeWaitStatus(2048);
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0042
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0042
     * @tc.desc      [Large] Verify decodeWaitStatus(2049) returns 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 8
      const actual: number = CliModel.decodeWaitStatus(2049);
      expect(actual).assertEqual(8);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0043
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0043
     * @tc.desc      [Large] Verify decodeWaitStatus(8191) returns 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 31
      const actual: number = CliModel.decodeWaitStatus(8191);
      expect(actual).assertEqual(31);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0044
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0044
     * @tc.desc      [Large] Verify decodeWaitStatus(8192) returns 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 32
      const actual: number = CliModel.decodeWaitStatus(8192);
      expect(actual).assertEqual(32);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0045
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0045
     * @tc.desc      [Large] Verify decodeWaitStatus(8193) returns 32.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: 32
      const actual: number = CliModel.decodeWaitStatus(8193);
      expect(actual).assertEqual(32);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0046
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0046
     * @tc.desc      [Extreme] Verify decodeWaitStatus(16383) returns 63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 63
      const actual: number = CliModel.decodeWaitStatus(16383);
      expect(actual).assertEqual(63);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0047
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0047
     * @tc.desc      [Extreme] Verify decodeWaitStatus(16384) returns 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 64
      const actual: number = CliModel.decodeWaitStatus(16384);
      expect(actual).assertEqual(64);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0048
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0048
     * @tc.desc      [Extreme] Verify decodeWaitStatus(16385) returns 64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 64
      const actual: number = CliModel.decodeWaitStatus(16385);
      expect(actual).assertEqual(64);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0049
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0049
     * @tc.desc      [Extreme] Verify decodeWaitStatus(32767) returns 127.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 127
      const actual: number = CliModel.decodeWaitStatus(32767);
      expect(actual).assertEqual(127);
      expect(typeof actual).assertEqual('number');
    });

    /**
     * @tc.number    SUB_CLI_INVOCATION_DECODE_WAIT_STATUS_CORE_0050
     * @tc.name      CliInvocation_decodeWaitStatus_Core_0050
     * @tc.desc      [Extreme] Verify decodeWaitStatus(32768) returns 128.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CliInvocation_decodeWaitStatus_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: 128
      const actual: number = CliModel.decodeWaitStatus(32768);
      expect(actual).assertEqual(128);
      expect(typeof actual).assertEqual('number');
    });

  });
}
