/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import fs from '@ohos.file.fs';
import * as shared from '../Shared/SharedDriver';

// Adapted from ets/test/PerformanceStability/MemoryLeakDetection.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function CopyScenario38(): void {
  describe('CopyScenario38', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'CopyScenario38', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'CopyScenario38', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'CopyScenario38', 'Suite completed');
    });

    // @tc.number CopyScenario38_Copy_00
    // @tc.name CopyScenario38_Copy_00
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 704.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_00', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1043');
      try {
        const expected: string = 'a\nfile content\nxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Copy_01
    // @tc.name CopyScenario38_Copy_01
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 705.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_01', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1044');
      try {
        const expected: string = 'Z\nfile content\nxxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Copy_02
    // @tc.name CopyScenario38_Copy_02
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 706.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_02', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1045');
      try {
        const expected: string = '\nfile content\nxxxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Copy_03
    // @tc.name CopyScenario38_Copy_03
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 707.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_03', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1046');
      try {
        const expected: string = '10\nfile content\nxxxxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Copy_04
    // @tc.name CopyScenario38_Copy_04
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 708.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_04', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1047');
      try {
        const expected: string = '2\nfile content\nxxxxxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Copy_05
    // @tc.name CopyScenario38_Copy_05
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 709.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_05', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1048');
      try {
        const expected: string = ' \nfile content\nxxxxxxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Group_06
    // @tc.name CopyScenario38_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 710.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Group_06', 0, async () => {
      const input: string[] = ['é', 'beta', 'Alpha', 'é', ''];
      const expected: string[] = ['', 'Alpha', 'beta', 'é', 'é'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const inputs: string[][] = [input, ['z', 'a'], []];
      const actual: string[][] = await shared.executeGroup(inputs);
      const groupSize: number = actual.length;
      expect(groupSize).assertEqual(3);
      const first: string = JSON.stringify(actual[0]);
      const expectedFirst: string = JSON.stringify(expected);
      expect(first).assertEqual(expectedFirst);
      const second: string = JSON.stringify(actual[1]);
      expect(second).assertEqual('["a","z"]');
      const thirdLength: number = actual[2].length;
      expect(thirdLength).assertEqual(0);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
    });

    // @tc.number CopyScenario38_Copy_07
    // @tc.name CopyScenario38_Copy_07
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 711.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_07', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1050');
      try {
        const expected: string = '中\nfile content\n';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Copy_08
    // @tc.name CopyScenario38_Copy_08
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 712.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_08', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1051');
      try {
        const expected: string = '😀\nfile content\nx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Copy_09
    // @tc.name CopyScenario38_Copy_09
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 713.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_09', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1052');
      try {
        const expected: string = 'a\u0000b\nfile content\nxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Sendable_10
    // @tc.name CopyScenario38_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 714.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Sendable_10', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 1;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await shared.transferSendable(data, expected);
      const fieldValue: number = data.data1.v1;
      expect(fieldValue).assertEqual(expected);
      const marker: string = data.data1.v2;
      expect(marker).assertEqual('worker');
      const flag: boolean = data.data1.v3;
      expect(flag).assertTrue();
      const size: number = data.data2.v1.length;
      expect(size).assertEqual(1);
      const first: number = data.data2.v1[0];
      expect(first).assertEqual(expected);
      const mapValue: string | undefined = data.data2.v2.get(expected);
      expect(mapValue).assertEqual('shared');
      const setHas: boolean = data.data2.v3.has('shared');
      expect(setHas).assertTrue();
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CopyScenario38_Copy_11
    // @tc.name CopyScenario38_Copy_11
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 715.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_11', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1054');
      try {
        const expected: string = 'a_b\nfile content\nxxxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Copy_12
    // @tc.name CopyScenario38_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 716.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1055');
      try {
        const expected: string = '\n\nfile content\nxxxxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Group_13
    // @tc.name CopyScenario38_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 717.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Group_13', 0, async () => {
      const input: string[] = ['\t', '\t', '\t'];
      const expected: string[] = ['\t', '\t', '\t'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const inputs: string[][] = [input, ['z', 'a'], []];
      const actual: string[][] = await shared.executeGroup(inputs);
      const groupSize: number = actual.length;
      expect(groupSize).assertEqual(3);
      const first: string = JSON.stringify(actual[0]);
      const expectedFirst: string = JSON.stringify(expected);
      expect(first).assertEqual(expectedFirst);
      const second: string = JSON.stringify(actual[1]);
      expect(second).assertEqual('["a","z"]');
      const thirdLength: number = actual[2].length;
      expect(thirdLength).assertEqual(0);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
    });

    // @tc.number CopyScenario38_Copy_14
    // @tc.name CopyScenario38_Copy_14
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 718.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_14', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1057');
      try {
        const expected: string = 'ß\nfile content\nxxxxxxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Copy_15
    // @tc.name CopyScenario38_Copy_15
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 719.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_15', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1058');
      try {
        const expected: string = 'Ω\nfile content\nxxxxxxxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Copy_16
    // @tc.name CopyScenario38_Copy_16
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 720.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_16', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1059');
      try {
        const expected: string = 'a\nfile content\n';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Copy_17
    // @tc.name CopyScenario38_Copy_17
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 721.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_17', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1060');
      try {
        const expected: string = 'Z\nfile content\nx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Copy_18
    // @tc.name CopyScenario38_Copy_18
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 722.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_18', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1061');
      try {
        const expected: string = '\nfile content\nxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Copy_19
    // @tc.name CopyScenario38_Copy_19
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 723.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Copy_19', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1062');
      try {
        const expected: string = '10\nfile content\nxxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number CopyScenario38_Group_20
    // @tc.name CopyScenario38_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 724.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario38_Group_20', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const inputs: string[][] = [input, ['z', 'a'], []];
      const actual: string[][] = await shared.executeGroup(inputs);
      const groupSize: number = actual.length;
      expect(groupSize).assertEqual(3);
      const first: string = JSON.stringify(actual[0]);
      const expectedFirst: string = JSON.stringify(expected);
      expect(first).assertEqual(expectedFirst);
      const second: string = JSON.stringify(actual[1]);
      expect(second).assertEqual('["a","z"]');
      const thirdLength: number = actual[2].length;
      expect(thirdLength).assertEqual(0);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
    });
  });
}
