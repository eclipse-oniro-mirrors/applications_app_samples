/**
 *
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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
