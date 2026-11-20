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
import { ChildProcessModel } from '../Shared/ChildProcessFixtures';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_arktschildprocess]';
const BUNDLE: string = 'ArkTsChildProcess_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for describeResult (50 cases). */
export default function describeResultCoreTest(): void {
  describe('DescribeResultCoreTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}DescribeResultCoreTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}DescribeResultCoreTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0001
     * @tc.name      ArkTsChildProcess_describeResult_Core_0001
     * @tc.desc      [SmallPositive+Zero] Verify describeResult(1, 0) returns pid:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_describeResult_Core_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: SmallPositive+Zero; expected: pid:1
      const actual: string = ChildProcessModel.describeResult(1, 0);
      expect(actual).assertEqual('pid:1');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0002
     * @tc.name      ArkTsChildProcess_describeResult_Core_0002
     * @tc.desc      [SmallPositive+Large] Verify describeResult(2, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Core_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(2, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0003
     * @tc.name      ArkTsChildProcess_describeResult_Core_0003
     * @tc.desc      [SmallPositive+Large] Verify describeResult(3, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Core_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(3, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0004
     * @tc.name      ArkTsChildProcess_describeResult_Core_0004
     * @tc.desc      [Medium+Zero] Verify describeResult(4, 0) returns pid:4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Core_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Zero; expected: pid:4
      const actual: string = ChildProcessModel.describeResult(4, 0);
      expect(actual).assertEqual('pid:4');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0005
     * @tc.name      ArkTsChildProcess_describeResult_Core_0005
     * @tc.desc      [Medium+Large] Verify describeResult(5, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Core_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(5, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0006
     * @tc.name      ArkTsChildProcess_describeResult_Core_0006
     * @tc.desc      [Medium+Large] Verify describeResult(6, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Core_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(6, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0007
     * @tc.name      ArkTsChildProcess_describeResult_Core_0007
     * @tc.desc      [Medium+Zero] Verify describeResult(7, 0) returns pid:7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Core_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Zero; expected: pid:7
      const actual: string = ChildProcessModel.describeResult(7, 0);
      expect(actual).assertEqual('pid:7');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0008
     * @tc.name      ArkTsChildProcess_describeResult_Core_0008
     * @tc.desc      [Medium+Large] Verify describeResult(8, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Core_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(8, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0009
     * @tc.name      ArkTsChildProcess_describeResult_Core_0009
     * @tc.desc      [Medium+Large] Verify describeResult(9, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Core_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(9, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0010
     * @tc.name      ArkTsChildProcess_describeResult_Core_0010
     * @tc.desc      [Medium+Zero] Verify describeResult(10, 0) returns pid:10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Core_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Zero; expected: pid:10
      const actual: string = ChildProcessModel.describeResult(10, 0);
      expect(actual).assertEqual('pid:10');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0011
     * @tc.name      ArkTsChildProcess_describeResult_Core_0011
     * @tc.desc      [Medium+Large] Verify describeResult(11, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(11, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0012
     * @tc.name      ArkTsChildProcess_describeResult_Core_0012
     * @tc.desc      [Medium+Large] Verify describeResult(12, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(12, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0013
     * @tc.name      ArkTsChildProcess_describeResult_Core_0013
     * @tc.desc      [Medium+Zero] Verify describeResult(13, 0) returns pid:13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Zero; expected: pid:13
      const actual: string = ChildProcessModel.describeResult(13, 0);
      expect(actual).assertEqual('pid:13');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0014
     * @tc.name      ArkTsChildProcess_describeResult_Core_0014
     * @tc.desc      [Medium+Large] Verify describeResult(14, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(14, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0015
     * @tc.name      ArkTsChildProcess_describeResult_Core_0015
     * @tc.desc      [Medium+Large] Verify describeResult(15, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(15, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0016
     * @tc.name      ArkTsChildProcess_describeResult_Core_0016
     * @tc.desc      [Medium+Zero] Verify describeResult(16, 0) returns pid:16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Zero; expected: pid:16
      const actual: string = ChildProcessModel.describeResult(16, 0);
      expect(actual).assertEqual('pid:16');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0017
     * @tc.name      ArkTsChildProcess_describeResult_Core_0017
     * @tc.desc      [Medium+Large] Verify describeResult(17, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(17, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0018
     * @tc.name      ArkTsChildProcess_describeResult_Core_0018
     * @tc.desc      [Medium+Large] Verify describeResult(18, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(18, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0019
     * @tc.name      ArkTsChildProcess_describeResult_Core_0019
     * @tc.desc      [Medium+Zero] Verify describeResult(19, 0) returns pid:19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Zero; expected: pid:19
      const actual: string = ChildProcessModel.describeResult(19, 0);
      expect(actual).assertEqual('pid:19');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0020
     * @tc.name      ArkTsChildProcess_describeResult_Core_0020
     * @tc.desc      [Medium+Large] Verify describeResult(20, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(20, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0021
     * @tc.name      ArkTsChildProcess_describeResult_Core_0021
     * @tc.desc      [Medium+Large] Verify describeResult(21, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(21, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0022
     * @tc.name      ArkTsChildProcess_describeResult_Core_0022
     * @tc.desc      [Medium+Zero] Verify describeResult(22, 0) returns pid:22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Zero; expected: pid:22
      const actual: string = ChildProcessModel.describeResult(22, 0);
      expect(actual).assertEqual('pid:22');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0023
     * @tc.name      ArkTsChildProcess_describeResult_Core_0023
     * @tc.desc      [Medium+Large] Verify describeResult(23, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(23, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0024
     * @tc.name      ArkTsChildProcess_describeResult_Core_0024
     * @tc.desc      [Medium+Large] Verify describeResult(24, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(24, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0025
     * @tc.name      ArkTsChildProcess_describeResult_Core_0025
     * @tc.desc      [Medium+Zero] Verify describeResult(25, 0) returns pid:25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Zero; expected: pid:25
      const actual: string = ChildProcessModel.describeResult(25, 0);
      expect(actual).assertEqual('pid:25');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0026
     * @tc.name      ArkTsChildProcess_describeResult_Core_0026
     * @tc.desc      [Medium+Large] Verify describeResult(26, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(26, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0027
     * @tc.name      ArkTsChildProcess_describeResult_Core_0027
     * @tc.desc      [Medium+Large] Verify describeResult(27, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(27, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0028
     * @tc.name      ArkTsChildProcess_describeResult_Core_0028
     * @tc.desc      [Medium+Zero] Verify describeResult(28, 0) returns pid:28.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Zero; expected: pid:28
      const actual: string = ChildProcessModel.describeResult(28, 0);
      expect(actual).assertEqual('pid:28');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0029
     * @tc.name      ArkTsChildProcess_describeResult_Core_0029
     * @tc.desc      [Medium+Large] Verify describeResult(29, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(29, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0030
     * @tc.name      ArkTsChildProcess_describeResult_Core_0030
     * @tc.desc      [Medium+Large] Verify describeResult(30, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Core_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(30, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0031
     * @tc.name      ArkTsChildProcess_describeResult_Core_0031
     * @tc.desc      [Medium+Zero] Verify describeResult(31, 0) returns pid:31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Zero; expected: pid:31
      const actual: string = ChildProcessModel.describeResult(31, 0);
      expect(actual).assertEqual('pid:31');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0032
     * @tc.name      ArkTsChildProcess_describeResult_Core_0032
     * @tc.desc      [Medium+Large] Verify describeResult(32, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(32, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0033
     * @tc.name      ArkTsChildProcess_describeResult_Core_0033
     * @tc.desc      [Medium+Large] Verify describeResult(33, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(33, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0034
     * @tc.name      ArkTsChildProcess_describeResult_Core_0034
     * @tc.desc      [Medium+Zero] Verify describeResult(34, 0) returns pid:34.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Zero; expected: pid:34
      const actual: string = ChildProcessModel.describeResult(34, 0);
      expect(actual).assertEqual('pid:34');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0035
     * @tc.name      ArkTsChildProcess_describeResult_Core_0035
     * @tc.desc      [Medium+Large] Verify describeResult(35, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(35, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0036
     * @tc.name      ArkTsChildProcess_describeResult_Core_0036
     * @tc.desc      [Medium+Large] Verify describeResult(36, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(36, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0037
     * @tc.name      ArkTsChildProcess_describeResult_Core_0037
     * @tc.desc      [Medium+Zero] Verify describeResult(37, 0) returns pid:37.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Zero; expected: pid:37
      const actual: string = ChildProcessModel.describeResult(37, 0);
      expect(actual).assertEqual('pid:37');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0038
     * @tc.name      ArkTsChildProcess_describeResult_Core_0038
     * @tc.desc      [Medium+Large] Verify describeResult(38, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(38, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0039
     * @tc.name      ArkTsChildProcess_describeResult_Core_0039
     * @tc.desc      [Medium+Large] Verify describeResult(39, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(39, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0040
     * @tc.name      ArkTsChildProcess_describeResult_Core_0040
     * @tc.desc      [Medium+Zero] Verify describeResult(40, 0) returns pid:40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Zero; expected: pid:40
      const actual: string = ChildProcessModel.describeResult(40, 0);
      expect(actual).assertEqual('pid:40');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0041
     * @tc.name      ArkTsChildProcess_describeResult_Core_0041
     * @tc.desc      [Medium+Large] Verify describeResult(41, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(41, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0042
     * @tc.name      ArkTsChildProcess_describeResult_Core_0042
     * @tc.desc      [Medium+Large] Verify describeResult(42, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(42, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0043
     * @tc.name      ArkTsChildProcess_describeResult_Core_0043
     * @tc.desc      [Medium+Zero] Verify describeResult(43, 0) returns pid:43.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Zero; expected: pid:43
      const actual: string = ChildProcessModel.describeResult(43, 0);
      expect(actual).assertEqual('pid:43');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0044
     * @tc.name      ArkTsChildProcess_describeResult_Core_0044
     * @tc.desc      [Medium+Large] Verify describeResult(44, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(44, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0045
     * @tc.name      ArkTsChildProcess_describeResult_Core_0045
     * @tc.desc      [Medium+Large] Verify describeResult(45, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(45, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0046
     * @tc.name      ArkTsChildProcess_describeResult_Core_0046
     * @tc.desc      [Medium+Zero] Verify describeResult(46, 0) returns pid:46.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Zero; expected: pid:46
      const actual: string = ChildProcessModel.describeResult(46, 0);
      expect(actual).assertEqual('pid:46');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0047
     * @tc.name      ArkTsChildProcess_describeResult_Core_0047
     * @tc.desc      [Medium+Large] Verify describeResult(47, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(47, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0048
     * @tc.name      ArkTsChildProcess_describeResult_Core_0048
     * @tc.desc      [Medium+Large] Verify describeResult(48, 802) returns error:802.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Large; expected: error:802
      const actual: string = ChildProcessModel.describeResult(48, 802);
      expect(actual).assertEqual('error:802');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0049
     * @tc.name      ArkTsChildProcess_describeResult_Core_0049
     * @tc.desc      [Medium+Zero] Verify describeResult(49, 0) returns pid:49.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Zero; expected: pid:49
      const actual: string = ChildProcessModel.describeResult(49, 0);
      expect(actual).assertEqual('pid:49');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_CORE_0050
     * @tc.name      ArkTsChildProcess_describeResult_Core_0050
     * @tc.desc      [Medium+Large] Verify describeResult(50, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Core_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(50, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

  });
}
