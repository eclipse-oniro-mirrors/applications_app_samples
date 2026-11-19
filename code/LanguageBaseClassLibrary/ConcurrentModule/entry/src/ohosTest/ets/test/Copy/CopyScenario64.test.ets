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

// Adapted from ets/test/PowerValidation/PowerOfflineNetwork.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function CopyScenario64(): void {
  describe('CopyScenario64', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'CopyScenario64', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'CopyScenario64', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'CopyScenario64', 'Suite completed');
    });

    // @tc.number CopyScenario64_Copy_00
    // @tc.name CopyScenario64_Copy_00
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1198.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_00', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1783');
      try {
        const expected: string = 'ß\nfile content\nx';
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

    // @tc.number CopyScenario64_Copy_01
    // @tc.name CopyScenario64_Copy_01
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1199.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_01', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1784');
      try {
        const expected: string = 'Ω\nfile content\nxx';
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

    // @tc.number CopyScenario64_Copy_02
    // @tc.name CopyScenario64_Copy_02
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1200.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_02', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1785');
      try {
        const expected: string = 'a\nfile content\nxxx';
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

    // @tc.number CopyScenario64_Copy_03
    // @tc.name CopyScenario64_Copy_03
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1201.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_03', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1786');
      try {
        const expected: string = 'Z\nfile content\nxxxx';
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

    // @tc.number CopyScenario64_Copy_04
    // @tc.name CopyScenario64_Copy_04
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1202.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_04', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1787');
      try {
        const expected: string = '\nfile content\nxxxxx';
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

    // @tc.number CopyScenario64_Copy_05
    // @tc.name CopyScenario64_Copy_05
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1203.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_05', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1788');
      try {
        const expected: string = '10\nfile content\nxxxxxx';
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

    // @tc.number CopyScenario64_Group_06
    // @tc.name CopyScenario64_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1204.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Group_06', 0, async () => {
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

    // @tc.number CopyScenario64_Copy_07
    // @tc.name CopyScenario64_Copy_07
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1205.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_07', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1790');
      try {
        const expected: string = ' \nfile content\nxxxxxxxx';
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

    // @tc.number CopyScenario64_Copy_08
    // @tc.name CopyScenario64_Copy_08
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1206.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_08', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1791');
      try {
        const expected: string = 'é\nfile content\n';
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

    // @tc.number CopyScenario64_Copy_09
    // @tc.name CopyScenario64_Copy_09
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1207.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_09', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1792');
      try {
        const expected: string = '中\nfile content\nx';
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

    // @tc.number CopyScenario64_Sendable_10
    // @tc.name CopyScenario64_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1208.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Sendable_10', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -1;
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

    // @tc.number CopyScenario64_Copy_11
    // @tc.name CopyScenario64_Copy_11
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1209.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_11', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1794');
      try {
        const expected: string = 'a\u0000b\nfile content\nxxx';
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

    // @tc.number CopyScenario64_Copy_12
    // @tc.name CopyScenario64_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1210.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1795');
      try {
        const expected: string = 'a-b\nfile content\nxxxx';
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

    // @tc.number CopyScenario64_Group_13
    // @tc.name CopyScenario64_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1211.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Group_13', 0, async () => {
      const input: string[] = ['a_b'];
      const expected: string[] = ['a_b'];
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

    // @tc.number CopyScenario64_Copy_14
    // @tc.name CopyScenario64_Copy_14
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1212.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_14', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1797');
      try {
        const expected: string = '\n\nfile content\nxxxxxx';
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

    // @tc.number CopyScenario64_Copy_15
    // @tc.name CopyScenario64_Copy_15
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1213.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_15', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1798');
      try {
        const expected: string = '\t\nfile content\nxxxxxxx';
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

    // @tc.number CopyScenario64_Copy_16
    // @tc.name CopyScenario64_Copy_16
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1214.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_16', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1799');
      try {
        const expected: string = 'ß\nfile content\nxxxxxxxx';
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

    // @tc.number CopyScenario64_Copy_17
    // @tc.name CopyScenario64_Copy_17
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1215.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_17', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1800');
      try {
        const expected: string = 'Ω\nfile content\n';
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

    // @tc.number CopyScenario64_Copy_18
    // @tc.name CopyScenario64_Copy_18
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1216.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_18', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1801');
      try {
        const expected: string = 'a\nfile content\nx';
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

    // @tc.number CopyScenario64_Copy_19
    // @tc.name CopyScenario64_Copy_19
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1217.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_19', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1802');
      try {
        const expected: string = 'Z\nfile content\nxx';
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

    // @tc.number CopyScenario64_Group_20
    // @tc.name CopyScenario64_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1218.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Group_20', 0, async () => {
      const input: string[] = ['', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['', '01', '1', 'A', 'Z', 'a', 'z'];
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

    // @tc.number CopyScenario64_Sendable_21
    // @tc.name CopyScenario64_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1219.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Sendable_21', 0, async () => {
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

    // @tc.number CopyScenario64_Copy_22
    // @tc.name CopyScenario64_Copy_22
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1220.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_22', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1805');
      try {
        const expected: string = '2\nfile content\nxxxxx';
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

    // @tc.number CopyScenario64_Copy_23
    // @tc.name CopyScenario64_Copy_23
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1221.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_23', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1806');
      try {
        const expected: string = ' \nfile content\nxxxxxx';
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

    // @tc.number CopyScenario64_Copy_24
    // @tc.name CopyScenario64_Copy_24
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1222.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_24', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1807');
      try {
        const expected: string = 'é\nfile content\nxxxxxxx';
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

    // @tc.number CopyScenario64_Copy_25
    // @tc.name CopyScenario64_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1223.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1808');
      try {
        const expected: string = '中\nfile content\nxxxxxxxx';
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

    // @tc.number CopyScenario64_Copy_26
    // @tc.name CopyScenario64_Copy_26
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1224.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario64_Copy_26', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1809');
      try {
        const expected: string = '😀\nfile content\n';
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
  });
}
