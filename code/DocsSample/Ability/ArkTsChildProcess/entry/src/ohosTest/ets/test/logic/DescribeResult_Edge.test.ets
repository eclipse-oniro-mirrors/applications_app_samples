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
export default function describeResultEdgeTest(): void {
  describe('DescribeResultEdgeTest', () => {
    beforeAll(() => {
      logInfo(`${BUNDLE}DescribeResultEdgeTest begin`);
    });
    afterAll(() => {
      logInfo(`${BUNDLE}DescribeResultEdgeTest end`);
    });
    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0001
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0001
     * @tc.desc      [Zero+Zero] Verify describeResult(0, 0) returns pid:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ArkTsChildProcess_describeResult_Edge_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Category: Zero+Zero; expected: pid:0
      const actual: string = ChildProcessModel.describeResult(0, 0);
      expect(actual).assertEqual('pid:0');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0002
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0002
     * @tc.desc      [SmallPositive+Large] Verify describeResult(1, 401) returns error:401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Edge_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+Large; expected: error:401
      const actual: string = ChildProcessModel.describeResult(1, 401);
      expect(actual).assertEqual('error:401');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0003
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0003
     * @tc.desc      [SmallPositive+Extreme] Verify describeResult(2, 16000001) returns error:16000001.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Edge_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+Extreme; expected: error:16000001
      const actual: string = ChildProcessModel.describeResult(2, 16000001);
      expect(actual).assertEqual('error:16000001');
      expect(actual.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0004
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0004
     * @tc.desc      [SmallPositive+Extreme] Verify describeResult(3, 16000002) returns error:16000002.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Edge_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+Extreme; expected: error:16000002
      const actual: string = ChildProcessModel.describeResult(3, 16000002);
      expect(actual).assertEqual('error:16000002');
      expect(actual.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0005
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0005
     * @tc.desc      [Medium+Extreme] Verify describeResult(4, 16000003) returns error:16000003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Edge_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Extreme; expected: error:16000003
      const actual: string = ChildProcessModel.describeResult(4, 16000003);
      expect(actual).assertEqual('error:16000003');
      expect(actual.length).assertEqual(14);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0006
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0006
     * @tc.desc      [Negative+Zero] Verify describeResult(-1, 0) returns pid:-1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Edge_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Negative+Zero; expected: pid:-1
      const actual: string = ChildProcessModel.describeResult(-1, 0);
      expect(actual).assertEqual('pid:-1');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0007
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0007
     * @tc.desc      [Medium+Zero] Verify describeResult(100, 0) returns pid:100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Edge_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Medium+Zero; expected: pid:100
      const actual: string = ChildProcessModel.describeResult(100, 0);
      expect(actual).assertEqual('pid:100');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0008
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0008
     * @tc.desc      [Extreme+Zero] Verify describeResult(65535, 0) returns pid:65535.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Edge_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Extreme+Zero; expected: pid:65535
      const actual: string = ChildProcessModel.describeResult(65535, 0);
      expect(actual).assertEqual('pid:65535');
      expect(actual.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0009
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0009
     * @tc.desc      [Zero+Zero] Verify describeResult(0, 0) returns pid:0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Edge_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: Zero+Zero; expected: pid:0
      const actual: string = ChildProcessModel.describeResult(0, 0);
      expect(actual).assertEqual('pid:0');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0010
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0010
     * @tc.desc      [SmallPositive+SmallPositive] Verify describeResult(1, 1) returns error:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ArkTsChildProcess_describeResult_Edge_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Category: SmallPositive+SmallPositive; expected: error:1
      const actual: string = ChildProcessModel.describeResult(1, 1);
      expect(actual).assertEqual('error:1');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0011
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0011
     * @tc.desc      [SmallPositive+SmallPositive] Verify describeResult(2, 2) returns error:2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+SmallPositive; expected: error:2
      const actual: string = ChildProcessModel.describeResult(2, 2);
      expect(actual).assertEqual('error:2');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0012
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0012
     * @tc.desc      [SmallPositive+SmallPositive] Verify describeResult(3, 3) returns error:3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: SmallPositive+SmallPositive; expected: error:3
      const actual: string = ChildProcessModel.describeResult(3, 3);
      expect(actual).assertEqual('error:3');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0013
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0013
     * @tc.desc      [Medium+Medium] Verify describeResult(4, 4) returns error:4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium; expected: error:4
      const actual: string = ChildProcessModel.describeResult(4, 4);
      expect(actual).assertEqual('error:4');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0014
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0014
     * @tc.desc      [Medium+Zero] Verify describeResult(5, 0) returns pid:5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Zero; expected: pid:5
      const actual: string = ChildProcessModel.describeResult(5, 0);
      expect(actual).assertEqual('pid:5');
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0015
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0015
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(6, 1) returns error:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+SmallPositive; expected: error:1
      const actual: string = ChildProcessModel.describeResult(6, 1);
      expect(actual).assertEqual('error:1');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0016
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0016
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(7, 2) returns error:2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+SmallPositive; expected: error:2
      const actual: string = ChildProcessModel.describeResult(7, 2);
      expect(actual).assertEqual('error:2');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0017
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0017
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(8, 3) returns error:3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+SmallPositive; expected: error:3
      const actual: string = ChildProcessModel.describeResult(8, 3);
      expect(actual).assertEqual('error:3');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0018
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0018
     * @tc.desc      [Medium+Medium] Verify describeResult(9, 4) returns error:4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium; expected: error:4
      const actual: string = ChildProcessModel.describeResult(9, 4);
      expect(actual).assertEqual('error:4');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0019
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0019
     * @tc.desc      [Medium+Zero] Verify describeResult(10, 0) returns pid:10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Zero; expected: pid:10
      const actual: string = ChildProcessModel.describeResult(10, 0);
      expect(actual).assertEqual('pid:10');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0020
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0020
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(11, 1) returns error:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+SmallPositive; expected: error:1
      const actual: string = ChildProcessModel.describeResult(11, 1);
      expect(actual).assertEqual('error:1');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0021
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0021
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(12, 2) returns error:2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+SmallPositive; expected: error:2
      const actual: string = ChildProcessModel.describeResult(12, 2);
      expect(actual).assertEqual('error:2');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0022
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0022
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(13, 3) returns error:3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+SmallPositive; expected: error:3
      const actual: string = ChildProcessModel.describeResult(13, 3);
      expect(actual).assertEqual('error:3');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0023
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0023
     * @tc.desc      [Medium+Medium] Verify describeResult(14, 4) returns error:4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium; expected: error:4
      const actual: string = ChildProcessModel.describeResult(14, 4);
      expect(actual).assertEqual('error:4');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0024
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0024
     * @tc.desc      [Medium+Zero] Verify describeResult(15, 0) returns pid:15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Zero; expected: pid:15
      const actual: string = ChildProcessModel.describeResult(15, 0);
      expect(actual).assertEqual('pid:15');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0025
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0025
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(16, 1) returns error:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+SmallPositive; expected: error:1
      const actual: string = ChildProcessModel.describeResult(16, 1);
      expect(actual).assertEqual('error:1');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0026
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0026
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(17, 2) returns error:2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+SmallPositive; expected: error:2
      const actual: string = ChildProcessModel.describeResult(17, 2);
      expect(actual).assertEqual('error:2');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0027
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0027
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(18, 3) returns error:3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+SmallPositive; expected: error:3
      const actual: string = ChildProcessModel.describeResult(18, 3);
      expect(actual).assertEqual('error:3');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0028
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0028
     * @tc.desc      [Medium+Medium] Verify describeResult(19, 4) returns error:4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Medium; expected: error:4
      const actual: string = ChildProcessModel.describeResult(19, 4);
      expect(actual).assertEqual('error:4');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0029
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0029
     * @tc.desc      [Medium+Zero] Verify describeResult(20, 0) returns pid:20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+Zero; expected: pid:20
      const actual: string = ChildProcessModel.describeResult(20, 0);
      expect(actual).assertEqual('pid:20');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0030
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0030
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(21, 1) returns error:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ArkTsChildProcess_describeResult_Edge_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Category: Medium+SmallPositive; expected: error:1
      const actual: string = ChildProcessModel.describeResult(21, 1);
      expect(actual).assertEqual('error:1');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0031
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0031
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(22, 2) returns error:2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+SmallPositive; expected: error:2
      const actual: string = ChildProcessModel.describeResult(22, 2);
      expect(actual).assertEqual('error:2');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0032
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0032
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(23, 3) returns error:3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+SmallPositive; expected: error:3
      const actual: string = ChildProcessModel.describeResult(23, 3);
      expect(actual).assertEqual('error:3');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0033
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0033
     * @tc.desc      [Medium+Medium] Verify describeResult(24, 4) returns error:4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium; expected: error:4
      const actual: string = ChildProcessModel.describeResult(24, 4);
      expect(actual).assertEqual('error:4');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0034
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0034
     * @tc.desc      [Medium+Zero] Verify describeResult(25, 0) returns pid:25.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Zero; expected: pid:25
      const actual: string = ChildProcessModel.describeResult(25, 0);
      expect(actual).assertEqual('pid:25');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0035
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0035
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(26, 1) returns error:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+SmallPositive; expected: error:1
      const actual: string = ChildProcessModel.describeResult(26, 1);
      expect(actual).assertEqual('error:1');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0036
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0036
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(27, 2) returns error:2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+SmallPositive; expected: error:2
      const actual: string = ChildProcessModel.describeResult(27, 2);
      expect(actual).assertEqual('error:2');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0037
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0037
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(28, 3) returns error:3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+SmallPositive; expected: error:3
      const actual: string = ChildProcessModel.describeResult(28, 3);
      expect(actual).assertEqual('error:3');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0038
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0038
     * @tc.desc      [Medium+Medium] Verify describeResult(29, 4) returns error:4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium; expected: error:4
      const actual: string = ChildProcessModel.describeResult(29, 4);
      expect(actual).assertEqual('error:4');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0039
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0039
     * @tc.desc      [Medium+Zero] Verify describeResult(30, 0) returns pid:30.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Zero; expected: pid:30
      const actual: string = ChildProcessModel.describeResult(30, 0);
      expect(actual).assertEqual('pid:30');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0040
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0040
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(31, 1) returns error:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+SmallPositive; expected: error:1
      const actual: string = ChildProcessModel.describeResult(31, 1);
      expect(actual).assertEqual('error:1');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0041
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0041
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(32, 2) returns error:2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+SmallPositive; expected: error:2
      const actual: string = ChildProcessModel.describeResult(32, 2);
      expect(actual).assertEqual('error:2');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0042
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0042
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(33, 3) returns error:3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+SmallPositive; expected: error:3
      const actual: string = ChildProcessModel.describeResult(33, 3);
      expect(actual).assertEqual('error:3');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0043
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0043
     * @tc.desc      [Medium+Medium] Verify describeResult(34, 4) returns error:4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium; expected: error:4
      const actual: string = ChildProcessModel.describeResult(34, 4);
      expect(actual).assertEqual('error:4');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0044
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0044
     * @tc.desc      [Medium+Zero] Verify describeResult(35, 0) returns pid:35.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Zero; expected: pid:35
      const actual: string = ChildProcessModel.describeResult(35, 0);
      expect(actual).assertEqual('pid:35');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0045
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0045
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(36, 1) returns error:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+SmallPositive; expected: error:1
      const actual: string = ChildProcessModel.describeResult(36, 1);
      expect(actual).assertEqual('error:1');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0046
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0046
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(37, 2) returns error:2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+SmallPositive; expected: error:2
      const actual: string = ChildProcessModel.describeResult(37, 2);
      expect(actual).assertEqual('error:2');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0047
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0047
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(38, 3) returns error:3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+SmallPositive; expected: error:3
      const actual: string = ChildProcessModel.describeResult(38, 3);
      expect(actual).assertEqual('error:3');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0048
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0048
     * @tc.desc      [Medium+Medium] Verify describeResult(39, 4) returns error:4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Medium; expected: error:4
      const actual: string = ChildProcessModel.describeResult(39, 4);
      expect(actual).assertEqual('error:4');
      expect(actual.length).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0049
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0049
     * @tc.desc      [Medium+Zero] Verify describeResult(40, 0) returns pid:40.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+Zero; expected: pid:40
      const actual: string = ChildProcessModel.describeResult(40, 0);
      expect(actual).assertEqual('pid:40');
      expect(actual.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_CHILD_PROCESS_DESCRIBE_RESULT_EDGE_0050
     * @tc.name      ArkTsChildProcess_describeResult_Edge_0050
     * @tc.desc      [Medium+SmallPositive] Verify describeResult(41, 1) returns error:1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ArkTsChildProcess_describeResult_Edge_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // Category: Medium+SmallPositive; expected: error:1
      const actual: string = ChildProcessModel.describeResult(41, 1);
      expect(actual).assertEqual('error:1');
      expect(actual.length).assertEqual(7);
    });

  });
}
