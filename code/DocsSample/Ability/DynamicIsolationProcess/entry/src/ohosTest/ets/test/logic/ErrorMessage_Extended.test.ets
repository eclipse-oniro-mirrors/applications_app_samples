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
import { IsolationModel } from '../Shared/IsolationFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_dynamicisolationprocess]';
const BUNDLE: string = 'DynamicIsolationProcess_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for errorMessage (50 cases). */
export default function errorMessageExtendedTest(): void {
  describe('ErrorMessageExtendedTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}ErrorMessageExtendedTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}ErrorMessageExtendedTest end`);
    });
    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0001
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0001
     * @tc.desc      [Zero] Verify errorMessage(0) returns success.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero; expected: success
      const actual: string = IsolationModel.errorMessage(0);
      expect(actual).assertEqual('success');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0002
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0002
     * @tc.desc      [SmallPositive] Verify errorMessage(1) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: unknown error
      const actual: string = IsolationModel.errorMessage(1);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0003
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0003
     * @tc.desc      [Negative] Verify errorMessage(-1) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: unknown error
      const actual: string = IsolationModel.errorMessage(-1);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0004
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0004
     * @tc.desc      [SmallPositive] Verify errorMessage(2) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: unknown error
      const actual: string = IsolationModel.errorMessage(2);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0005
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0005
     * @tc.desc      [Negative] Verify errorMessage(-2) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: unknown error
      const actual: string = IsolationModel.errorMessage(-2);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0006
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0006
     * @tc.desc      [SmallPositive] Verify errorMessage(3) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive; expected: unknown error
      const actual: string = IsolationModel.errorMessage(3);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0007
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0007
     * @tc.desc      [Negative] Verify errorMessage(-3) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: unknown error
      const actual: string = IsolationModel.errorMessage(-3);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0008
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0008
     * @tc.desc      [Medium] Verify errorMessage(4) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: unknown error
      const actual: string = IsolationModel.errorMessage(4);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0009
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0009
     * @tc.desc      [Negative] Verify errorMessage(-4) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative; expected: unknown error
      const actual: string = IsolationModel.errorMessage(-4);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0010
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0010
     * @tc.desc      [Medium] Verify errorMessage(5) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium; expected: unknown error
      const actual: string = IsolationModel.errorMessage(5);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0011
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0011
     * @tc.desc      [Negative] Verify errorMessage(-5) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown error
      const actual: string = IsolationModel.errorMessage(-5);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0012
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0012
     * @tc.desc      [Medium] Verify errorMessage(10) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = IsolationModel.errorMessage(10);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0013
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0013
     * @tc.desc      [Negative] Verify errorMessage(-10) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown error
      const actual: string = IsolationModel.errorMessage(-10);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0014
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0014
     * @tc.desc      [Medium] Verify errorMessage(100) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium; expected: unknown error
      const actual: string = IsolationModel.errorMessage(100);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0015
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0015
     * @tc.desc      [Negative] Verify errorMessage(-100) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown error
      const actual: string = IsolationModel.errorMessage(-100);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0016
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0016
     * @tc.desc      [Large] Verify errorMessage(1000) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(1000);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0017
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0017
     * @tc.desc      [Negative] Verify errorMessage(-1000) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown error
      const actual: string = IsolationModel.errorMessage(-1000);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0018
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0018
     * @tc.desc      [Large] Verify errorMessage(1024) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(1024);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0019
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0019
     * @tc.desc      [Negative] Verify errorMessage(-1024) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown error
      const actual: string = IsolationModel.errorMessage(-1024);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0020
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0020
     * @tc.desc      [Large] Verify errorMessage(4096) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(4096);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0021
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0021
     * @tc.desc      [Negative] Verify errorMessage(-4096) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown error
      const actual: string = IsolationModel.errorMessage(-4096);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0022
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0022
     * @tc.desc      [Extreme] Verify errorMessage(65535) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: unknown error
      const actual: string = IsolationModel.errorMessage(65535);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0023
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0023
     * @tc.desc      [Negative] Verify errorMessage(-65535) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown error
      const actual: string = IsolationModel.errorMessage(-65535);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0024
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0024
     * @tc.desc      [Extreme] Verify errorMessage(2147483647) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: unknown error
      const actual: string = IsolationModel.errorMessage(2147483647);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0025
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0025
     * @tc.desc      [Negative] Verify errorMessage(-2147483648) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown error
      const actual: string = IsolationModel.errorMessage(-2147483648);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0026
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0026
     * @tc.desc      [Extreme] Verify errorMessage(2147483646) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Extreme; expected: unknown error
      const actual: string = IsolationModel.errorMessage(2147483646);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0027
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0027
     * @tc.desc      [Negative] Verify errorMessage(-2147483647) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Negative; expected: unknown error
      const actual: string = IsolationModel.errorMessage(-2147483647);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0028
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0028
     * @tc.desc      [Large] Verify errorMessage(127) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(127);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0029
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0029
     * @tc.desc      [Large] Verify errorMessage(128) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(128);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0030
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0030
     * @tc.desc      [Large] Verify errorMessage(129) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(129);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0031
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0031
     * @tc.desc      [Large] Verify errorMessage(255) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(255);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0032
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0032
     * @tc.desc      [Large] Verify errorMessage(256) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(256);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0033
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0033
     * @tc.desc      [Large] Verify errorMessage(257) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(257);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0034
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0034
     * @tc.desc      [Large] Verify errorMessage(511) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(511);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0035
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0035
     * @tc.desc      [Large] Verify errorMessage(512) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(512);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0036
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0036
     * @tc.desc      [Large] Verify errorMessage(513) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(513);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0037
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0037
     * @tc.desc      [Large] Verify errorMessage(1023) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(1023);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0038
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0038
     * @tc.desc      [Large] Verify errorMessage(1024) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(1024);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0039
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0039
     * @tc.desc      [Large] Verify errorMessage(1025) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(1025);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0040
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0040
     * @tc.desc      [Large] Verify errorMessage(2047) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(2047);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0041
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0041
     * @tc.desc      [Large] Verify errorMessage(2048) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(2048);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0042
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0042
     * @tc.desc      [Large] Verify errorMessage(2049) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(2049);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0043
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0043
     * @tc.desc      [Large] Verify errorMessage(8191) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(8191);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0044
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0044
     * @tc.desc      [Large] Verify errorMessage(8192) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(8192);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0045
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0045
     * @tc.desc      [Large] Verify errorMessage(8193) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Large; expected: unknown error
      const actual: string = IsolationModel.errorMessage(8193);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0046
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0046
     * @tc.desc      [Extreme] Verify errorMessage(16383) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown error
      const actual: string = IsolationModel.errorMessage(16383);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0047
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0047
     * @tc.desc      [Extreme] Verify errorMessage(16384) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown error
      const actual: string = IsolationModel.errorMessage(16384);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0048
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0048
     * @tc.desc      [Extreme] Verify errorMessage(16385) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown error
      const actual: string = IsolationModel.errorMessage(16385);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0049
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0049
     * @tc.desc      [Extreme] Verify errorMessage(32767) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown error
      const actual: string = IsolationModel.errorMessage(32767);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

    /**
     * @tc.number    SUB_DYNAMIC_ISOLATION_PROCESS_ERROR_MESSAGE_EXTENDED_0050
     * @tc.name      DynamicIsolationProcess_errorMessage_Extended_0050
     * @tc.desc      [Extreme] Verify errorMessage(32768) returns unknown error.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DynamicIsolationProcess_errorMessage_Extended_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Extreme; expected: unknown error
      const actual: string = IsolationModel.errorMessage(32768);
      expect(actual).assertEqual('unknown error');
      expect(actual.length).assertEqual(13);
    });

  });
}
