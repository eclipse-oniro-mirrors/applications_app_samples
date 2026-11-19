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

// Adapted from ets/test/PowerDialog/PowerItemInfoModel.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function CopyScenario51(): void {
  describe('CopyScenario51', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'CopyScenario51', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'CopyScenario51', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'CopyScenario51', 'Suite completed');
    });

    // @tc.number CopyScenario51_Copy_00
    // @tc.name CopyScenario51_Copy_00
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 951.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_00', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1375');
      try {
        const expected: string = '中\nfile content\nxxxxxx';
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

    // @tc.number CopyScenario51_Copy_01
    // @tc.name CopyScenario51_Copy_01
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 952.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_01', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1376');
      try {
        const expected: string = '😀\nfile content\nxxxxxxx';
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

    // @tc.number CopyScenario51_Copy_02
    // @tc.name CopyScenario51_Copy_02
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 953.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_02', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1377');
      try {
        const expected: string = 'a\u0000b\nfile content\nxxxxxxxx';
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

    // @tc.number CopyScenario51_Copy_03
    // @tc.name CopyScenario51_Copy_03
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 954.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_03', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1378');
      try {
        const expected: string = 'a-b\nfile content\n';
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

    // @tc.number CopyScenario51_Copy_04
    // @tc.name CopyScenario51_Copy_04
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 955.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_04', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1379');
      try {
        const expected: string = 'a_b\nfile content\nx';
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

    // @tc.number CopyScenario51_Copy_05
    // @tc.name CopyScenario51_Copy_05
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 956.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_05', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1380');
      try {
        const expected: string = '\n\nfile content\nxx';
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

    // @tc.number CopyScenario51_Group_06
    // @tc.name CopyScenario51_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 957.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Group_06', 0, async () => {
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

    // @tc.number CopyScenario51_Copy_07
    // @tc.name CopyScenario51_Copy_07
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 958.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_07', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1382');
      try {
        const expected: string = 'ß\nfile content\nxxxx';
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

    // @tc.number CopyScenario51_Copy_08
    // @tc.name CopyScenario51_Copy_08
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 959.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_08', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1383');
      try {
        const expected: string = 'Ω\nfile content\nxxxxx';
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

    // @tc.number CopyScenario51_Copy_09
    // @tc.name CopyScenario51_Copy_09
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 960.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_09', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1384');
      try {
        const expected: string = 'a\nfile content\nxxxxxx';
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

    // @tc.number CopyScenario51_Sendable_10
    // @tc.name CopyScenario51_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 961.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Sendable_10', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 0;
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

    // @tc.number CopyScenario51_Copy_11
    // @tc.name CopyScenario51_Copy_11
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 962.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_11', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1386');
      try {
        const expected: string = '\nfile content\nxxxxxxxx';
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

    // @tc.number CopyScenario51_Copy_12
    // @tc.name CopyScenario51_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 963.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1387');
      try {
        const expected: string = '10\nfile content\n';
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

    // @tc.number CopyScenario51_Group_13
    // @tc.name CopyScenario51_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 964.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Group_13', 0, async () => {
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

    // @tc.number CopyScenario51_Copy_14
    // @tc.name CopyScenario51_Copy_14
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 965.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_14', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1389');
      try {
        const expected: string = ' \nfile content\nxx';
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

    // @tc.number CopyScenario51_Copy_15
    // @tc.name CopyScenario51_Copy_15
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 966.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_15', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1390');
      try {
        const expected: string = 'é\nfile content\nxxx';
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

    // @tc.number CopyScenario51_Copy_16
    // @tc.name CopyScenario51_Copy_16
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 967.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_16', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1391');
      try {
        const expected: string = '中\nfile content\nxxxx';
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

    // @tc.number CopyScenario51_Copy_17
    // @tc.name CopyScenario51_Copy_17
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 968.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_17', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1392');
      try {
        const expected: string = '😀\nfile content\nxxxxx';
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

    // @tc.number CopyScenario51_Copy_18
    // @tc.name CopyScenario51_Copy_18
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 969.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_18', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1393');
      try {
        const expected: string = 'a\u0000b\nfile content\nxxxxxx';
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

    // @tc.number CopyScenario51_Copy_19
    // @tc.name CopyScenario51_Copy_19
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 970.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_19', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1394');
      try {
        const expected: string = 'a-b\nfile content\nxxxxxxx';
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

    // @tc.number CopyScenario51_Group_20
    // @tc.name CopyScenario51_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 971.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Group_20', 0, async () => {
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

    // @tc.number CopyScenario51_Sendable_21
    // @tc.name CopyScenario51_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 972.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Sendable_21', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -2147483648;
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

    // @tc.number CopyScenario51_Copy_22
    // @tc.name CopyScenario51_Copy_22
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 973.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_22', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1397');
      try {
        const expected: string = '\t\nfile content\nx';
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

    // @tc.number CopyScenario51_Copy_23
    // @tc.name CopyScenario51_Copy_23
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 974.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_23', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1398');
      try {
        const expected: string = 'ß\nfile content\nxx';
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

    // @tc.number CopyScenario51_Copy_24
    // @tc.name CopyScenario51_Copy_24
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 975.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_24', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1399');
      try {
        const expected: string = 'Ω\nfile content\nxxx';
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

    // @tc.number CopyScenario51_Copy_25
    // @tc.name CopyScenario51_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 976.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1400');
      try {
        const expected: string = 'a\nfile content\nxxxx';
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

    // @tc.number CopyScenario51_Copy_26
    // @tc.name CopyScenario51_Copy_26
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 977.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_26', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1401');
      try {
        const expected: string = 'Z\nfile content\nxxxxx';
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

    // @tc.number CopyScenario51_Group_27
    // @tc.name CopyScenario51_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 978.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Group_27', 0, async () => {
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

    // @tc.number CopyScenario51_Copy_28
    // @tc.name CopyScenario51_Copy_28
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 979.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_28', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1403');
      try {
        const expected: string = '10\nfile content\nxxxxxxx';
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

    // @tc.number CopyScenario51_Copy_29
    // @tc.name CopyScenario51_Copy_29
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 980.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CopyScenario51_Copy_29', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1404');
      try {
        const expected: string = '2\nfile content\nxxxxxxxx';
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
