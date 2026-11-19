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

// Reference: ets/test/PowerValidation/PowerEventToolValidation.test.ets
// Original line floor: 505; scenario family: workload-parity.
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { DataModel } from 'library/src/main/ets/components/dyn/DataModel';
import { DataSource } from 'library/src/main/ets/components/dyn/DataSource';
import { DataParser as DynamicParser } from 'library/src/main/ets/components/dyn/DataParser';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { DataParserStaW } from 'library/src/main/ets/components/sta_wrapper/DataParserStaW';
import { EtsFactory } from 'library/src/main/ets/components/sta_bridge/EtsFactory';
import { fibonacciRecursive as libraryFibonacci } from 'library/src/main/ets/components/dyn/Workload';
import { CardResolver } from '../../../../main/ets/pages/CardResolver';
import { TextCardData } from '../../../../main/ets/pages/TextCardData';
import { fibonacciRecursive as entryFibonacci } from '../../../../main/ets/pages/Workload';
import bundledLayout from '../../../../main/ets/pages/jsonData.json';
import {
  CardPayload, CardStyle, LayoutGroup, makePayload, makeModel, makeGroup, makeSource,
  assertSource, assertUniqueIds, snapshotTitles, RecordingResolver, ListenerRecorder,
  ControlledParser, ControlledFactory, waitForNativeFactory, logSuite, expectedFibonacci
} from '../Shared/ScenarioSupport';
import { inspectProperty } from '../Shared/PropertyInspection';

export default function WorkloadParityTest(): void {
  describe('WorkloadParityTest', () => {
    beforeAll(() => {
      logSuite('WorkloadParityTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('WorkloadParityTest', 'end');
    });

    /**
     * @tc.name WorkloadParityTest_case_001
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_001', 0, () => {
      const start = 0;
      const end = 1;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -1;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_002
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_002', 0, () => {
      const start = 1;
      const end = 2;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -2;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_003
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_003', 0, () => {
      const start = 2;
      const end = 3;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -3;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_004
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_004', 0, () => {
      const start = 3;
      const end = 4;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -4;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_005
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_005', 0, () => {
      const start = 4;
      const end = 5;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -5;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_006
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_006', 0, () => {
      const start = 5;
      const end = 6;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -6;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_007
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_007', 0, () => {
      const start = 6;
      const end = 7;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -7;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_008
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_008', 0, () => {
      const start = 7;
      const end = 8;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -8;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_009
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_009', 0, () => {
      const start = 8;
      const end = 9;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -9;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_010
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_010', 0, () => {
      const start = 9;
      const end = 10;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -10;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_011
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_011', 0, () => {
      const start = 10;
      const end = 11;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -11;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_012
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_012', 0, () => {
      const start = 11;
      const end = 12;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -12;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_013
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_013', 0, () => {
      const start = 12;
      const end = 13;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -13;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_014
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_014', 0, () => {
      const start = 13;
      const end = 14;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -14;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name WorkloadParityTest_case_015
     * @tc.desc workload-parity: recursive implementation against an iterative oracle; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WorkloadParityTest_case_015', 0, () => {
      const start = 14;
      const end = 15;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(entryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(entryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value)).assertEqual(actual[offset]);
      }
      const boundary = -15;
      expect(entryFibonacci(boundary)).assertEqual(boundary);
      expect(entryFibonacci(0)).assertEqual(0);
      expect(entryFibonacci(1)).assertEqual(1);
    });
  });
}
