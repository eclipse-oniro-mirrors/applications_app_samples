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

// Adapted from ets/test/PowerDialog/PowerMenuConfiguration.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function MyFileScenario52(): void {
  describe('MyFileScenario52', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'MyFileScenario52', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'MyFileScenario52', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'MyFileScenario52', 'Suite completed');
    });

    // @tc.number MyFileScenario52_MyFile_00
    // @tc.name MyFileScenario52_MyFile_00
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 970.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_00', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1405');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_01
    // @tc.name MyFileScenario52_MyFile_01
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 971.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_01', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1406');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_02
    // @tc.name MyFileScenario52_MyFile_02
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 972.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_02', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1407');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_03
    // @tc.name MyFileScenario52_MyFile_03
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 973.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_03', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1408');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_04
    // @tc.name MyFileScenario52_MyFile_04
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 974.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_04', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1409');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_05
    // @tc.name MyFileScenario52_MyFile_05
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 975.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_05', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1410');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_Group_06
    // @tc.name MyFileScenario52_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 976.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_Group_06', 0, async () => {
      const input: string[] = ['a'];
      const expected: string[] = ['a'];
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

    // @tc.number MyFileScenario52_MyFile_07
    // @tc.name MyFileScenario52_MyFile_07
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 977.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_07', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1412');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_08
    // @tc.name MyFileScenario52_MyFile_08
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 978.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_08', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1413');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_09
    // @tc.name MyFileScenario52_MyFile_09
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 979.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_09', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1414');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_Sendable_10
    // @tc.name MyFileScenario52_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 980.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_Sendable_10', 0, async () => {
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

    // @tc.number MyFileScenario52_MyFile_11
    // @tc.name MyFileScenario52_MyFile_11
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 981.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_11', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1416');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_Copy_12
    // @tc.name MyFileScenario52_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 982.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1417');
      try {
        const expected: string = 'é\nfile content\nx';
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

    // @tc.number MyFileScenario52_Group_13
    // @tc.name MyFileScenario52_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 983.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_Group_13', 0, async () => {
      const input: string[] = ['中', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'z', '中'];
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

    // @tc.number MyFileScenario52_MyFile_14
    // @tc.name MyFileScenario52_MyFile_14
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 984.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_14', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1419');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_15
    // @tc.name MyFileScenario52_MyFile_15
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 985.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_15', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1420');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_16
    // @tc.name MyFileScenario52_MyFile_16
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 986.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_16', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1421');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_17
    // @tc.name MyFileScenario52_MyFile_17
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 987.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_17', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1422');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_18
    // @tc.name MyFileScenario52_MyFile_18
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 988.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_18', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1423');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_19
    // @tc.name MyFileScenario52_MyFile_19
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 989.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_19', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1424');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_Group_20
    // @tc.name MyFileScenario52_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 990.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_Group_20', 0, async () => {
      const input: string[] = ['ß', 'beta', 'Alpha', 'ß', ''];
      const expected: string[] = ['', 'Alpha', 'beta', 'ß', 'ß'];
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

    // @tc.number MyFileScenario52_Sendable_21
    // @tc.name MyFileScenario52_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 991.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_Sendable_21', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 9007199254740991;
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

    // @tc.number MyFileScenario52_MyFile_22
    // @tc.name MyFileScenario52_MyFile_22
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 992.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_22', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1427');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_23
    // @tc.name MyFileScenario52_MyFile_23
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 993.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_23', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1428');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_24
    // @tc.name MyFileScenario52_MyFile_24
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 994.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_24', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1429');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_Copy_25
    // @tc.name MyFileScenario52_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 995.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1430');
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

    // @tc.number MyFileScenario52_MyFile_26
    // @tc.name MyFileScenario52_MyFile_26
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 996.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_26', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1431');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_Group_27
    // @tc.name MyFileScenario52_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 997.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_Group_27', 0, async () => {
      const input: string[] = [' ', ' ', ' '];
      const expected: string[] = [' ', ' ', ' '];
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

    // @tc.number MyFileScenario52_MyFile_28
    // @tc.name MyFileScenario52_MyFile_28
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 998.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_28', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1433');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_29
    // @tc.name MyFileScenario52_MyFile_29
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 999.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_29', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1434');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number MyFileScenario52_MyFile_30
    // @tc.name MyFileScenario52_MyFile_30
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 1000.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario52_MyFile_30', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1435');
      try {
        const model: shared.MyFile = shared.createMyFile(fixture);
        model.readyFileToFileFs();
        model.readyFilesToWorker();
        const filenames: string[] = fs.listFileSync(fixture.source);
        const count: number = filenames.length;
        expect(count).assertEqual(200);
        const firstExists: boolean = filenames.indexOf('TestFile01.txt') >= 0;
        expect(firstExists).assertTrue();
        const lastExists: boolean = filenames.indexOf('TestFile200.txt') >= 0;
        expect(lastExists).assertTrue();
        shared.writeFixture(fixture.destination + '/old.txt', 'old');
        model.deleteCopyFile(fixture.destination);
        const remaining: number = fs.listFileSync(fixture.destination).length;
        expect(remaining).assertEqual(0);
        const directory: boolean = fs.statSync(fixture.destination).isDirectory();
        expect(directory).assertTrue();
      } finally {
        shared.removeFileFixture(fixture);
      }
    });
  });
}
