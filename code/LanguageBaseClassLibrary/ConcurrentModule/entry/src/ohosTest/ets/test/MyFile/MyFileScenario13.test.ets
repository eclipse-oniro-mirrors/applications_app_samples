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

// Adapted from ets/test/Interaction/ContentScaling.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function MyFileScenario13(): void {
  describe('MyFileScenario13', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'MyFileScenario13', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'MyFileScenario13', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'MyFileScenario13', 'Suite completed');
    });

    // @tc.number MyFileScenario13_MyFile_00
    // @tc.name MyFileScenario13_MyFile_00
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 229.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_00', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_321');
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

    // @tc.number MyFileScenario13_MyFile_01
    // @tc.name MyFileScenario13_MyFile_01
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 230.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_01', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_322');
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

    // @tc.number MyFileScenario13_MyFile_02
    // @tc.name MyFileScenario13_MyFile_02
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 231.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_02', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_323');
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

    // @tc.number MyFileScenario13_MyFile_03
    // @tc.name MyFileScenario13_MyFile_03
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 232.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_03', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_324');
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

    // @tc.number MyFileScenario13_MyFile_04
    // @tc.name MyFileScenario13_MyFile_04
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 233.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_04', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_325');
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

    // @tc.number MyFileScenario13_MyFile_05
    // @tc.name MyFileScenario13_MyFile_05
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 234.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_05', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_326');
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

    // @tc.number MyFileScenario13_Group_06
    // @tc.name MyFileScenario13_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 235.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_Group_06', 0, async () => {
      const input: string[] = ['a_b', 'beta', 'Alpha', 'a_b', ''];
      const expected: string[] = ['', 'Alpha', 'a_b', 'a_b', 'beta'];
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

    // @tc.number MyFileScenario13_MyFile_07
    // @tc.name MyFileScenario13_MyFile_07
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 236.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_07', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_328');
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

    // @tc.number MyFileScenario13_MyFile_08
    // @tc.name MyFileScenario13_MyFile_08
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 237.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_08', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_329');
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

    // @tc.number MyFileScenario13_MyFile_09
    // @tc.name MyFileScenario13_MyFile_09
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 238.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_09', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_330');
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

    // @tc.number MyFileScenario13_Sendable_10
    // @tc.name MyFileScenario13_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 239.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_Sendable_10', 0, async () => {
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

    // @tc.number MyFileScenario13_MyFile_11
    // @tc.name MyFileScenario13_MyFile_11
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 240.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_11', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_332');
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

    // @tc.number MyFileScenario13_Copy_12
    // @tc.name MyFileScenario13_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 241.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_333');
      try {
        const expected: string = 'Z\nfile content\nxxxxxxx';
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

    // @tc.number MyFileScenario13_Group_13
    // @tc.name MyFileScenario13_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 242.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_Group_13', 0, async () => {
      const input: string[] = ['', '', ''];
      const expected: string[] = ['', '', ''];
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

    // @tc.number MyFileScenario13_MyFile_14
    // @tc.name MyFileScenario13_MyFile_14
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 243.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_14', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_335');
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

    // @tc.number MyFileScenario13_MyFile_15
    // @tc.name MyFileScenario13_MyFile_15
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 244.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_15', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_336');
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

    // @tc.number MyFileScenario13_MyFile_16
    // @tc.name MyFileScenario13_MyFile_16
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 245.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_16', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_337');
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

    // @tc.number MyFileScenario13_MyFile_17
    // @tc.name MyFileScenario13_MyFile_17
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 246.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_17', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_338');
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

    // @tc.number MyFileScenario13_MyFile_18
    // @tc.name MyFileScenario13_MyFile_18
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 247.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_18', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_339');
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

    // @tc.number MyFileScenario13_MyFile_19
    // @tc.name MyFileScenario13_MyFile_19
    // @tc.desc Verify MyFile application behavior, isolation and complete observable results for scenario 248.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_MyFile_19', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_340');
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

    // @tc.number MyFileScenario13_Group_20
    // @tc.name MyFileScenario13_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 249.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_Group_20', 0, async () => {
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

    // @tc.number MyFileScenario13_Sendable_21
    // @tc.name MyFileScenario13_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 250.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('MyFileScenario13_Sendable_21', 0, async () => {
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
  });
}
