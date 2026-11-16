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

// Adapted from ets/test/LifecycleState/ConfigurationChanges.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function CopyScenario25(): void {
  describe('CopyScenario25', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'CopyScenario25', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'CopyScenario25', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'CopyScenario25', 'Suite completed');
    });

    // @tc.number CopyScenario25_Copy_00
    // @tc.name CopyScenario25_Copy_00
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 457.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_00', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_673');
      try {
        const expected: string = 'a\u0000b\nfile content\nxxxxxxx';
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

    // @tc.number CopyScenario25_Copy_01
    // @tc.name CopyScenario25_Copy_01
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 458.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_01', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_674');
      try {
        const expected: string = 'a-b\nfile content\nxxxxxxxx';
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

    // @tc.number CopyScenario25_Copy_02
    // @tc.name CopyScenario25_Copy_02
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 459.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_02', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_675');
      try {
        const expected: string = 'a_b\nfile content\n';
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

    // @tc.number CopyScenario25_Copy_03
    // @tc.name CopyScenario25_Copy_03
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 460.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_03', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_676');
      try {
        const expected: string = '\n\nfile content\nx';
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

    // @tc.number CopyScenario25_Copy_04
    // @tc.name CopyScenario25_Copy_04
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 461.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_04', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_677');
      try {
        const expected: string = '\t\nfile content\nxx';
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

    // @tc.number CopyScenario25_Copy_05
    // @tc.name CopyScenario25_Copy_05
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 462.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_05', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_678');
      try {
        const expected: string = 'ß\nfile content\nxxx';
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

    // @tc.number CopyScenario25_Group_06
    // @tc.name CopyScenario25_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 463.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Group_06', 0, async () => {
      const input: string[] = ['Ω', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'z', 'Ω'];
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

    // @tc.number CopyScenario25_Copy_07
    // @tc.name CopyScenario25_Copy_07
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 464.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_07', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_680');
      try {
        const expected: string = 'a\nfile content\nxxxxx';
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

    // @tc.number CopyScenario25_Copy_08
    // @tc.name CopyScenario25_Copy_08
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 465.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_08', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_681');
      try {
        const expected: string = 'Z\nfile content\nxxxxxx';
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

    // @tc.number CopyScenario25_Copy_09
    // @tc.name CopyScenario25_Copy_09
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 466.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_09', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_682');
      try {
        const expected: string = '\nfile content\nxxxxxxx';
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

    // @tc.number CopyScenario25_Sendable_10
    // @tc.name CopyScenario25_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 467.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Sendable_10', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 2147483647;
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

    // @tc.number CopyScenario25_Copy_11
    // @tc.name CopyScenario25_Copy_11
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 468.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_11', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_684');
      try {
        const expected: string = '2\nfile content\n';
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

    // @tc.number CopyScenario25_Copy_12
    // @tc.name CopyScenario25_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 469.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_685');
      try {
        const expected: string = ' \nfile content\nx';
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

    // @tc.number CopyScenario25_Group_13
    // @tc.name CopyScenario25_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 470.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Group_13', 0, async () => {
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

    // @tc.number CopyScenario25_Copy_14
    // @tc.name CopyScenario25_Copy_14
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 471.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_14', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_687');
      try {
        const expected: string = '中\nfile content\nxxx';
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

    // @tc.number CopyScenario25_Copy_15
    // @tc.name CopyScenario25_Copy_15
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 472.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_15', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_688');
      try {
        const expected: string = '😀\nfile content\nxxxx';
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

    // @tc.number CopyScenario25_Copy_16
    // @tc.name CopyScenario25_Copy_16
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 473.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_16', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_689');
      try {
        const expected: string = 'a\u0000b\nfile content\nxxxxx';
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

    // @tc.number CopyScenario25_Copy_17
    // @tc.name CopyScenario25_Copy_17
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 474.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_17', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_690');
      try {
        const expected: string = 'a-b\nfile content\nxxxxxx';
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

    // @tc.number CopyScenario25_Copy_18
    // @tc.name CopyScenario25_Copy_18
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 475.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_18', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_691');
      try {
        const expected: string = 'a_b\nfile content\nxxxxxxx';
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

    // @tc.number CopyScenario25_Copy_19
    // @tc.name CopyScenario25_Copy_19
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 476.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Copy_19', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_692');
      try {
        const expected: string = '\n\nfile content\nxxxxxxxx';
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

    // @tc.number CopyScenario25_Group_20
    // @tc.name CopyScenario25_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 477.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario25_Group_20', 0, async () => {
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
  });
}
