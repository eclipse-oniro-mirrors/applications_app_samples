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

// Reference: ets/test/PerformanceStability/PowerPerformance.test.ets
// Original line floor: 794; scenario family: workload-library.
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

export default function LibraryWorkloadTest(): void {
  describe('LibraryWorkloadTest', () => {
    beforeAll(() => {
      logSuite('LibraryWorkloadTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('LibraryWorkloadTest', 'end');
    });

    /**
     * @tc.name LibraryWorkloadTest_case_001
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_001', 0, () => {
      const start = 0;
      const end = 1;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -1;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_002
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_002', 0, () => {
      const start = 1;
      const end = 2;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -2;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_003
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_003', 0, () => {
      const start = 2;
      const end = 3;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -3;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_004
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_004', 0, () => {
      const start = 3;
      const end = 4;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -4;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_005
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_005', 0, () => {
      const start = 4;
      const end = 5;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -5;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_006
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_006', 0, () => {
      const start = 5;
      const end = 6;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -6;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_007
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_007', 0, () => {
      const start = 6;
      const end = 7;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -7;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_008
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_008', 0, () => {
      const start = 7;
      const end = 8;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -8;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_009
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_009', 0, () => {
      const start = 8;
      const end = 9;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -9;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_010
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_010', 0, () => {
      const start = 9;
      const end = 10;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -10;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_011
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_011', 0, () => {
      const start = 10;
      const end = 11;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -11;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_012
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_012', 0, () => {
      const start = 11;
      const end = 12;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -12;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_013
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_013', 0, () => {
      const start = 12;
      const end = 13;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -13;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_014
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_014', 0, () => {
      const start = 13;
      const end = 14;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -14;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_015
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_015', 0, () => {
      const start = 14;
      const end = 15;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -15;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_016
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_016', 0, () => {
      const start = 15;
      const end = 16;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -16;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_017
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_017', 0, () => {
      const start = 16;
      const end = 17;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -17;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_018
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_018', 0, () => {
      const start = 17;
      const end = 18;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -18;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_019
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_019', 0, () => {
      const start = 18;
      const end = 19;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -19;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_020
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_020', 0, () => {
      const start = 19;
      const end = 20;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -20;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_021
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_021', 0, () => {
      const start = 20;
      const end = 21;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -21;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_022
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_022', 0, () => {
      const start = 0;
      const end = 2;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -22;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_023
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_023', 0, () => {
      const start = 1;
      const end = 3;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -23;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_024
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_024', 0, () => {
      const start = 2;
      const end = 4;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -24;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });

    /**
     * @tc.name LibraryWorkloadTest_case_025
     * @tc.desc workload-library: recursive implementation against an iterative oracle; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LibraryWorkloadTest_case_025', 0, () => {
      const start = 3;
      const end = 5;
      const input: number[] = [];
      const actual: number[] = [];
      const expected: number[] = [];
      for (let index = start; index <= end; index++) {
        input.push(index);
        actual.push(libraryFibonacci(index));
        expected.push(expectedFibonacci(index));
      }
      expect(actual.length).assertEqual(end - start + 1);
      expect(actual).assertDeepEquals(expected);
      for (let offset = 0; offset < input.length; offset++) {
        const value = input[offset];
        expect(libraryFibonacci(value)).assertEqual(expected[offset]);
        expect(libraryFibonacci(value) >= 0).assertTrue();
      }
      const boundary = -25;
      expect(libraryFibonacci(boundary)).assertEqual(boundary);
      expect(libraryFibonacci(0)).assertEqual(0);
      expect(libraryFibonacci(1)).assertEqual(1);
    });
  });
}
